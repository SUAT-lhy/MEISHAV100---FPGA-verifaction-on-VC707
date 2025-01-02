module DevKitDesign( 
   `ifdef USE_C2C_FOR_PCIE
    output        io_c2b_clk,
    output        io_c2b_rst,
    output        io_c2b_send,
    output [7:0]  io_c2b_data,
    input         io_b2c_clk,
    input         io_b2c_rst,
    input         io_b2c_send,
    input  [7:0]  io_b2c_data,
  `else
    input  logic                        spi_sclk,
    input  logic                        spi_cs,
    input  logic                        axi_spi_slave_test_mode,
    output logic                        spi_gpio_mux_sel,
    output logic  [1:0]                 spi_mode,
    input  logic                        spi_sdi0,
    input  logic                        spi_sdi1,
    input  logic                        spi_sdi2,
    input  logic                        spi_sdi3,
    output logic                        spi_sdo0,
    output logic                        spi_sdo1,
    output logic                        spi_sdo2,
    output logic                        spi_sdo3,
    output wire [3:0]                   spi_sdo_oen,
  `endif

  input wire debug_mode_sel_latch_async,

  input  wire  [31:0] pll_state,
  output wire  [31:0]  use_which_clk,
  output   wire  [63:0] pll_cfg,

  
  input         chiplink_clock,
  input         chiplink_reset,
  input    always_on_reset,

  output wire soc_sft_rst,
  output wire global_soft_reset_req,

  output  ddr_io_c2b_clk
  ,output  ddr_io_c2b_rst
  ,output  ddr_io_c2b_send
  ,output [7:0] ddr_io_c2b_data,
  input  ddr_io_b2c_clk
  ,input  ddr_io_b2c_rst
  ,input  ddr_io_b2c_send
  ,input [7:0] ddr_io_b2c_data,
   
  output wire spi_master_clk,
  output wire [3:0] spi_master_csn,
  output wire [1:0] spi_master_mode,
  output wire [3:0] spi_master_sdo,
  output wire [3:0] spi_master_sdo_oen,
  input  wire [3:0] spi_master_sdi,

  input         tile_clock, 
  input         tile_reset, 
  input         tile_1_clock, 
  input         tile_1_reset,
  input         tile_2_clock, 
  input         tile_2_reset,
  input         tile_3_clock, 
  input         tile_3_reset,

  input         clock, 
  input         reset, 
  output [7:0]  auto_led_source_out, 
  input         auto_io_out_1_port_REFCLK_rxp, 
  input         auto_io_out_1_port_REFCLK_rxn, 
  output        auto_io_out_1_port_pci_exp_txp, 
  output        auto_io_out_1_port_pci_exp_txn, 
  input         auto_io_out_1_port_pci_exp_rxp, 
  input         auto_io_out_1_port_pci_exp_rxn, 
  input         auto_io_out_1_port_axi_aresetn, 
  output        auto_io_out_1_port_axi_aclk_out, 
  output        auto_io_out_1_port_mmcm_lock, 
  output [13:0] auto_io_out_0_port_ddr3_addr, 
  output [2:0]  auto_io_out_0_port_ddr3_ba, 
  output        auto_io_out_0_port_ddr3_ras_n, 
  output        auto_io_out_0_port_ddr3_cas_n, 
  output        auto_io_out_0_port_ddr3_we_n, 
  output        auto_io_out_0_port_ddr3_reset_n, 
  output        auto_io_out_0_port_ddr3_ck_p, 
  output        auto_io_out_0_port_ddr3_ck_n, 
  output        auto_io_out_0_port_ddr3_cke, 
  output        auto_io_out_0_port_ddr3_cs_n, 
  output [7:0]  auto_io_out_0_port_ddr3_dm, 
  output        auto_io_out_0_port_ddr3_odt, 
  // inout  [63:0] auto_io_out_0_port_ddr3_dq, 
  // inout  [7:0]  auto_io_out_0_port_ddr3_dqs_n, 
  // inout  [7:0]  auto_io_out_0_port_ddr3_dqs_p, 
  input         auto_io_out_0_port_sys_clk_i, 
  output        auto_io_out_0_port_ui_clk, 
  output        auto_io_out_0_port_ui_clk_sync_rst, 
  output        auto_io_out_0_port_mmcm_locked, 
  input         auto_io_out_0_port_aresetn, 
  input         auto_io_out_0_port_sys_rst, 
  output        auto_spi_source_out_sck, 
  output        auto_spi_source_out_dq_0_o, 
  input         auto_spi_source_out_dq_1_i, 
  output        auto_spi_source_out_cs_0, 
  output        auto_uart_source_out_txd, 
  input         auto_uart_source_out_rxd, 
  input         debug_systemjtag_jtag_TCK, 
  input         debug_systemjtag_jtag_TMS, 
  input         debug_systemjtag_jtag_TDI, 
  output        debug_systemjtag_jtag_TDO_data, 
  input         debug_systemjtag_reset, 
  output        debug_ndreset 
);

  wire [31:0] reset_vector_msb_32;
  wire [1:0] spi_master_events_o;
  wire [3:0] mig_slave_base_addr_msb_4;
  wire [31:0]  chiplink_master_base_awaddr;
  wire [31:0]  chiplink_master_base_araddr;
  wire [15:0] tl_master_xing_in_d_bits_resp_control;
  // tx dfx 
  wire [31:0] transferDataReg;
  wire        send_1p_valid;
  // rx dfx
  wire [31:0] b2c_data_concat;
  wire        b2c_data_valid;

  wire mig_input_takeover_en;
  wire  all_tile_sft_rst;
  // wire  tile_0_sft_rst;
  // wire  tile_1_sft_rst;
  // wire  tile_2_sft_rst;
  // wire  tile_3_sft_rst;
  wire  chiplink_sft_rst;
  wire  spi_0_sft_rst;
  // wire  spi_1_sft_rst;
  // wire  spi_slave_sft_rst;
  // wire  soc_iram_sft_rst;
  // wire  soc_lsys_sft_rst;
  wire  gpio_sft_rst;
  wire  uart_sft_rst;

  wire debug_mode_sel_latch;

  wire [3:0] ddr_master_0_awid;
  wire [3:0] ddr_master_0_arid;
  wire [31:0] ddr_master_0_awaddr;
  wire [7:0] ddr_master_0_awlen;
  wire [2:0] ddr_master_0_awsize;
  wire [1:0] ddr_master_0_awburst;
  wire [63:0] ddr_master_0_wdata;
  wire [7:0] ddr_master_0_wstrb;
  wire [3:0] ddr_master_0_bid;
  wire [1:0] ddr_master_0_bresp;
  wire [31:0] ddr_master_0_araddr;
  wire [7:0] ddr_master_0_arlen;
  wire [2:0] ddr_master_0_arsize;
  wire [1:0] ddr_master_0_arburst;
  wire [63:0] ddr_master_0_rdata;
  wire [3:0] ddr_master_0_rid;
  wire [1:0] ddr_master_0_rresp;
  wire ddr_master_0_awvalid;
  wire ddr_master_0_awready;
  wire ddr_master_0_wready;
  wire ddr_master_0_wvalid;
  wire ddr_master_0_arready;
  wire ddr_master_0_arvalid;
  wire ddr_master_0_rvalid;
  wire ddr_master_0_rready;
  wire ddr_master_0_wlast;
  wire ddr_master_0_rlast;
  wire ddr_master_0_bvalid;
  wire ddr_master_0_bready;

  wire  int_bus_auto_int_in_3_0; 
  wire  int_bus_auto_int_in_3_1; 
  wire  int_bus_auto_int_in_3_2; 
  wire  int_bus_auto_int_in_3_3; 
  wire  int_bus_auto_int_in_2_0; 
  wire  int_bus_auto_int_in_1_0; 
  wire  int_bus_auto_int_in_0_0; 
  wire  int_bus_auto_int_out_0; 
  wire  int_bus_auto_int_out_1; 
  wire  int_bus_auto_int_out_2; 
  wire  int_bus_auto_int_out_3; 
  wire  int_bus_auto_int_out_4; 
  wire  int_bus_auto_int_out_5; 
  wire  int_bus_auto_int_out_6; 
  wire  sbus_clock; 
  wire  sbus_reset; 
  wire  sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_a_ready; 
  wire  sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_a_valid; 
  wire [2:0] sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_a_bits_opcode; 
  wire [2:0] sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_a_bits_param; 
  wire [2:0] sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_a_bits_size; 
  wire [4:0] sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_a_bits_source; 
  wire [37:0] sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_a_bits_address; 
  wire [3:0] sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_a_bits_mask; 
  wire [31:0] sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_a_bits_data; 
  wire  sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_a_bits_corrupt; 
  wire  sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_d_ready; 
  wire  sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_d_valid; 
  wire [2:0] sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_d_bits_opcode; 
  wire [1:0] sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_d_bits_param; 
  wire [2:0] sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_d_bits_size; 
  wire [4:0] sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_d_bits_source; 
  wire  sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_d_bits_sink; 
  wire  sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_d_bits_denied; 
  wire [31:0] sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_d_bits_data; 
  wire  sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_d_bits_corrupt; 
  wire  sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_a_ready; 
  wire  sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_a_valid; 
  wire [2:0] sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_a_bits_opcode; 
  wire [2:0] sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_a_bits_param; 
  wire [2:0] sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_a_bits_size; 
  wire [4:0] sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_a_bits_source; 
  wire [30:0] sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_a_bits_address; 
  wire [7:0] sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_a_bits_mask; 
  wire [63:0] sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_a_bits_data; 
  wire  sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_a_bits_corrupt; 
  wire  sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_d_ready; 
  wire  sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_d_valid; 
  wire [2:0] sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_d_bits_opcode; 
  wire [1:0] sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_d_bits_param; 
  wire [2:0] sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_d_bits_size; 
  wire [4:0] sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_d_bits_source; 
  wire  sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_d_bits_sink; 
  wire  sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_d_bits_denied; 
  wire [63:0] sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_d_bits_data; 
  wire  sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_d_bits_corrupt; 
  wire  sbus_auto_coupler_from_master_named_pcie_0_fixer_in_a_ready; 
  wire  sbus_auto_coupler_from_master_named_pcie_0_fixer_in_a_valid; 
  wire [2:0] sbus_auto_coupler_from_master_named_pcie_0_fixer_in_a_bits_opcode; 
  wire [2:0] sbus_auto_coupler_from_master_named_pcie_0_fixer_in_a_bits_param; 
  wire [2:0] sbus_auto_coupler_from_master_named_pcie_0_fixer_in_a_bits_size; 
  wire [3:0] sbus_auto_coupler_from_master_named_pcie_0_fixer_in_a_bits_source; 
  wire [37:0] sbus_auto_coupler_from_master_named_pcie_0_fixer_in_a_bits_address; 
  wire [7:0] sbus_auto_coupler_from_master_named_pcie_0_fixer_in_a_bits_mask; 
  wire [63:0] sbus_auto_coupler_from_master_named_pcie_0_fixer_in_a_bits_data; 
  wire  sbus_auto_coupler_from_master_named_pcie_0_fixer_in_a_bits_corrupt; 
  wire  sbus_auto_coupler_from_master_named_pcie_0_fixer_in_d_ready; 
  wire  sbus_auto_coupler_from_master_named_pcie_0_fixer_in_d_valid; 
  wire [2:0] sbus_auto_coupler_from_master_named_pcie_0_fixer_in_d_bits_opcode; 
  wire [1:0] sbus_auto_coupler_from_master_named_pcie_0_fixer_in_d_bits_param; 
  wire [2:0] sbus_auto_coupler_from_master_named_pcie_0_fixer_in_d_bits_size; 
  wire [3:0] sbus_auto_coupler_from_master_named_pcie_0_fixer_in_d_bits_source; 
  wire [2:0] sbus_auto_coupler_from_master_named_pcie_0_fixer_in_d_bits_sink; 
  wire  sbus_auto_coupler_from_master_named_pcie_0_fixer_in_d_bits_denied; 
  wire [63:0] sbus_auto_coupler_from_master_named_pcie_0_fixer_in_d_bits_data; 
  wire  sbus_auto_coupler_from_master_named_pcie_0_fixer_in_d_bits_corrupt; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_ready; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_valid; 
  wire [2:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_bits_opcode; 
  wire [2:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_bits_param; 
  wire [2:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_bits_size; 
  wire [1:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_bits_source; 
  wire [37:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_bits_address; 
  wire [7:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_bits_mask; 
  wire [63:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_bits_data; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_bits_corrupt; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_b_ready; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_b_valid; 
  wire [2:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_b_bits_opcode; 
  wire [1:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_b_bits_param; 
  wire [2:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_b_bits_size; 
  wire [1:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_b_bits_source; 
  wire [37:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_b_bits_address; 
  wire [7:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_b_bits_mask; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_b_bits_corrupt; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_c_ready; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_c_valid; 
  wire [2:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_c_bits_opcode; 
  wire [2:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_c_bits_param; 
  wire [2:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_c_bits_size; 
  wire [1:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_c_bits_source; 
  wire [37:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_c_bits_address; 
  wire [63:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_c_bits_data; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_c_bits_corrupt; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_ready; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_valid; 
  wire [2:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_bits_opcode; 
  wire [1:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_bits_param; 
  wire [2:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_bits_size; 
  wire [1:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_bits_source; 
  wire [2:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_bits_sink; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_bits_denied; 
  wire [63:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_bits_data; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_bits_corrupt; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_e_ready; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_e_valid; 
  wire [2:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_e_bits_sink; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_ready; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_valid; 
  wire [2:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_bits_opcode; 
  wire [2:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_bits_param; 
  wire [2:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_bits_size; 
  wire [1:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_bits_source; 
  wire [37:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_bits_address; 
  wire [7:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_bits_mask; 
  wire [63:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_bits_data; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_bits_corrupt; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_b_ready; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_b_valid; 
  wire [2:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_b_bits_opcode; 
  wire [1:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_b_bits_param; 
  wire [2:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_b_bits_size; 
  wire [1:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_b_bits_source; 
  wire [37:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_b_bits_address; 
  wire [7:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_b_bits_mask; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_b_bits_corrupt; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_c_ready; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_c_valid; 
  wire [2:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_c_bits_opcode; 
  wire [2:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_c_bits_param; 
  wire [2:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_c_bits_size; 
  wire [1:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_c_bits_source; 
  wire [37:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_c_bits_address; 
  wire [63:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_c_bits_data; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_c_bits_corrupt; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_ready; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_valid; 
  wire [2:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_bits_opcode; 
  wire [1:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_bits_param; 
  wire [2:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_bits_size; 
  wire [1:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_bits_source; 
  wire [2:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_bits_sink; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_bits_denied; 
  wire [63:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_bits_data; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_bits_corrupt; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_e_ready; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_e_valid; 
  wire [2:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_e_bits_sink; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_ready; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_valid; 
  wire [2:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_bits_opcode; 
  wire [2:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_bits_param; 
  wire [2:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_bits_size; 
  wire [1:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_bits_source; 
  wire [37:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_bits_address; 
  wire [7:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_bits_mask; 
  wire [63:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_bits_data; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_bits_corrupt; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_b_ready; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_b_valid; 
  wire [2:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_b_bits_opcode; 
  wire [1:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_b_bits_param; 
  wire [2:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_b_bits_size; 
  wire [1:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_b_bits_source; 
  wire [37:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_b_bits_address; 
  wire [7:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_b_bits_mask; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_b_bits_corrupt; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_c_ready; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_c_valid; 
  wire [2:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_c_bits_opcode; 
  wire [2:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_c_bits_param; 
  wire [2:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_c_bits_size; 
  wire [1:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_c_bits_source; 
  wire [37:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_c_bits_address; 
  wire [63:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_c_bits_data; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_c_bits_corrupt; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_ready; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_valid; 
  wire [2:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_bits_opcode; 
  wire [1:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_bits_param; 
  wire [2:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_bits_size; 
  wire [1:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_bits_source; 
  wire [2:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_bits_sink; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_bits_denied; 
  wire [63:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_bits_data; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_bits_corrupt; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_e_ready; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_e_valid; 
  wire [2:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_e_bits_sink; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_ready; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_valid; 
  wire [2:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_bits_opcode; 
  wire [2:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_bits_param; 
  wire [2:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_bits_size; 
  wire [1:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_bits_source; 
  wire [37:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_bits_address; 
  wire [7:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_bits_mask; 
  wire [63:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_bits_data; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_bits_corrupt; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_b_ready; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_b_valid; 
  wire [2:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_b_bits_opcode; 
  wire [1:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_b_bits_param; 
  wire [2:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_b_bits_size; 
  wire [1:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_b_bits_source; 
  wire [37:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_b_bits_address; 
  wire [7:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_b_bits_mask; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_b_bits_corrupt; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_c_ready; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_c_valid; 
  wire [2:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_c_bits_opcode; 
  wire [2:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_c_bits_param; 
  wire [2:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_c_bits_size; 
  wire [1:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_c_bits_source; 
  wire [37:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_c_bits_address; 
  wire [63:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_c_bits_data; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_c_bits_corrupt; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_ready; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_valid; 
  wire [2:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_bits_opcode; 
  wire [1:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_bits_param; 
  wire [2:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_bits_size; 
  wire [1:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_bits_source; 
  wire [2:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_bits_sink; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_bits_denied; 
  wire [63:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_bits_data; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_bits_corrupt; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_e_ready; 
  wire  sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_e_valid; 
  wire [2:0] sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_e_bits_sink; 
  wire  sbus_auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_a_ready; 
  wire  sbus_auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_a_valid; 
  wire [2:0] sbus_auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_opcode; 
  wire [2:0] sbus_auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_param; 
  wire [1:0] sbus_auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_size; 
  wire [9:0] sbus_auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_source; 
  wire [16:0] sbus_auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_address; 
  wire [3:0] sbus_auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_mask; 
  wire  sbus_auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_corrupt; 
  wire  sbus_auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_d_ready; 
  wire  sbus_auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_d_valid; 
  wire [1:0] sbus_auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_d_bits_size; 
  wire [9:0] sbus_auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_d_bits_source; 
  wire [31:0] sbus_auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_d_bits_data; 
  wire  sbus_auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_ready; 
  wire  sbus_auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_valid; 
  wire [2:0] sbus_auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_bits_opcode; 
  wire [2:0] sbus_auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_bits_param; 
  wire [1:0] sbus_auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_bits_size; 
  wire [8:0] sbus_auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_bits_source; 
  wire [11:0] sbus_auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_bits_address; 
  wire [7:0] sbus_auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_bits_mask; 
  wire [63:0] sbus_auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_bits_data; 
  wire  sbus_auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_bits_corrupt; 
  wire  sbus_auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_d_ready; 
  wire  sbus_auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_d_valid; 
  wire [2:0] sbus_auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_d_bits_opcode; 
  wire [1:0] sbus_auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_d_bits_size; 
  wire [8:0] sbus_auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_d_bits_source; 
  wire [63:0] sbus_auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_d_bits_data; 
  wire  sbus_auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_ready; 
  wire  sbus_auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_valid; 
  wire [2:0] sbus_auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_bits_opcode; 
  wire [2:0] sbus_auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_bits_param; 
  wire [1:0] sbus_auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_bits_size; 
  wire [8:0] sbus_auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_bits_source; 
  wire [25:0] sbus_auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_bits_address; 
  wire [7:0] sbus_auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_bits_mask; 
  wire [63:0] sbus_auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_bits_data; 
  wire  sbus_auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_bits_corrupt; 
  wire  sbus_auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_d_ready; 
  wire  sbus_auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_d_valid; 
  wire [2:0] sbus_auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_d_bits_opcode; 
  wire [1:0] sbus_auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_d_bits_size; 
  wire [8:0] sbus_auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_d_bits_source; 
  wire [63:0] sbus_auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_d_bits_data; 
  wire  sbus_auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_ready; 
  wire  sbus_auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_valid; 
  wire [2:0] sbus_auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_bits_opcode; 
  wire [2:0] sbus_auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_bits_param; 
  wire [1:0] sbus_auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_bits_size; 
  wire [8:0] sbus_auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_bits_source; 
  wire [27:0] sbus_auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_bits_address; 
  wire [7:0] sbus_auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_bits_mask; 
  wire [63:0] sbus_auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_bits_data; 
  wire  sbus_auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_bits_corrupt; 
  wire  sbus_auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_d_ready; 
  wire  sbus_auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_d_valid; 
  wire [2:0] sbus_auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_d_bits_opcode; 
  wire [1:0] sbus_auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_d_bits_size; 
  wire [8:0] sbus_auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_d_bits_source; 
  wire [63:0] sbus_auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_d_bits_data; 
  wire  sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_ready; 
  wire  sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_valid; 
  wire [2:0] sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_bits_opcode; 
  wire [2:0] sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_bits_param; 
  wire [2:0] sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_bits_size; 
  wire [4:0] sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_bits_source; 
  wire [30:0] sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_bits_address; 
  wire [7:0] sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_bits_mask; 
  wire [63:0] sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_bits_data; 
  wire  sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_bits_corrupt; 
  wire  sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_ready; 
  wire  sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_valid; 
  wire [2:0] sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_bits_opcode; 
  wire [1:0] sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_bits_param; 
  wire [2:0] sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_bits_size; 
  wire [4:0] sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_bits_source; 
  wire  sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_bits_sink; 
  wire  sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_bits_denied; 
  wire [63:0] sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_bits_data; 
  wire  sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_bits_corrupt; 
  wire  sbus_auto_system_bus_xbar_out_a_ready; 
  wire  sbus_auto_system_bus_xbar_out_a_valid; 
  wire [2:0] sbus_auto_system_bus_xbar_out_a_bits_opcode; 
  wire [2:0] sbus_auto_system_bus_xbar_out_a_bits_param; 
  wire [2:0] sbus_auto_system_bus_xbar_out_a_bits_size; 
  wire [4:0] sbus_auto_system_bus_xbar_out_a_bits_source; 
  wire [31:0] sbus_auto_system_bus_xbar_out_a_bits_address; 
  wire [7:0] sbus_auto_system_bus_xbar_out_a_bits_mask; 
  wire [63:0] sbus_auto_system_bus_xbar_out_a_bits_data; 
  wire  sbus_auto_system_bus_xbar_out_a_bits_corrupt; 
  wire  sbus_auto_system_bus_xbar_out_b_ready; 
  wire  sbus_auto_system_bus_xbar_out_b_valid; 
  wire [1:0] sbus_auto_system_bus_xbar_out_b_bits_param; 
  wire [4:0] sbus_auto_system_bus_xbar_out_b_bits_source; 
  wire [31:0] sbus_auto_system_bus_xbar_out_b_bits_address; 
  wire  sbus_auto_system_bus_xbar_out_c_ready; 
  wire  sbus_auto_system_bus_xbar_out_c_valid; 
  wire [2:0] sbus_auto_system_bus_xbar_out_c_bits_opcode; 
  wire [2:0] sbus_auto_system_bus_xbar_out_c_bits_param; 
  wire [2:0] sbus_auto_system_bus_xbar_out_c_bits_size; 
  wire [4:0] sbus_auto_system_bus_xbar_out_c_bits_source; 
  wire [31:0] sbus_auto_system_bus_xbar_out_c_bits_address; 
  wire [63:0] sbus_auto_system_bus_xbar_out_c_bits_data; 
  wire  sbus_auto_system_bus_xbar_out_c_bits_corrupt; 
  wire  sbus_auto_system_bus_xbar_out_d_ready; 
  wire  sbus_auto_system_bus_xbar_out_d_valid; 
  wire [2:0] sbus_auto_system_bus_xbar_out_d_bits_opcode; 
  wire [1:0] sbus_auto_system_bus_xbar_out_d_bits_param; 
  wire [2:0] sbus_auto_system_bus_xbar_out_d_bits_size; 
  wire [4:0] sbus_auto_system_bus_xbar_out_d_bits_source; 
  wire [1:0] sbus_auto_system_bus_xbar_out_d_bits_sink; 
  wire  sbus_auto_system_bus_xbar_out_d_bits_denied; 
  wire [63:0] sbus_auto_system_bus_xbar_out_d_bits_data; 
  wire  sbus_auto_system_bus_xbar_out_d_bits_corrupt; 
  wire  sbus_auto_system_bus_xbar_out_e_valid; 
  wire [1:0] sbus_auto_system_bus_xbar_out_e_bits_sink; 
  wire  pbus_clock; 
  wire  pbus_reset; 
  wire  pbus_auto_coupler_to_device_named_gpio_0_control_xing_out_a_ready; 
  wire  pbus_auto_coupler_to_device_named_gpio_0_control_xing_out_a_valid; 
  wire [2:0] pbus_auto_coupler_to_device_named_gpio_0_control_xing_out_a_bits_opcode; 
  wire [2:0] pbus_auto_coupler_to_device_named_gpio_0_control_xing_out_a_bits_param; 
  wire [1:0] pbus_auto_coupler_to_device_named_gpio_0_control_xing_out_a_bits_size; 
  wire [8:0] pbus_auto_coupler_to_device_named_gpio_0_control_xing_out_a_bits_source; 
  wire [30:0] pbus_auto_coupler_to_device_named_gpio_0_control_xing_out_a_bits_address; 
  wire [7:0] pbus_auto_coupler_to_device_named_gpio_0_control_xing_out_a_bits_mask; 
  wire [63:0] pbus_auto_coupler_to_device_named_gpio_0_control_xing_out_a_bits_data; 
  wire  pbus_auto_coupler_to_device_named_gpio_0_control_xing_out_a_bits_corrupt; 
  wire  pbus_auto_coupler_to_device_named_gpio_0_control_xing_out_d_ready; 
  wire  pbus_auto_coupler_to_device_named_gpio_0_control_xing_out_d_valid; 
  wire [2:0] pbus_auto_coupler_to_device_named_gpio_0_control_xing_out_d_bits_opcode; 
  wire [1:0] pbus_auto_coupler_to_device_named_gpio_0_control_xing_out_d_bits_size; 
  wire [8:0] pbus_auto_coupler_to_device_named_gpio_0_control_xing_out_d_bits_source; 
  wire [63:0] pbus_auto_coupler_to_device_named_gpio_0_control_xing_out_d_bits_data; 
  wire  pbus_auto_coupler_to_device_named_spi_0_control_xing_out_a_ready; 
  wire  pbus_auto_coupler_to_device_named_spi_0_control_xing_out_a_valid; 
  wire [2:0] pbus_auto_coupler_to_device_named_spi_0_control_xing_out_a_bits_opcode; 
  wire [2:0] pbus_auto_coupler_to_device_named_spi_0_control_xing_out_a_bits_param; 
  wire [1:0] pbus_auto_coupler_to_device_named_spi_0_control_xing_out_a_bits_size; 
  wire [8:0] pbus_auto_coupler_to_device_named_spi_0_control_xing_out_a_bits_source; 
  wire [30:0] pbus_auto_coupler_to_device_named_spi_0_control_xing_out_a_bits_address; 
  wire [7:0] pbus_auto_coupler_to_device_named_spi_0_control_xing_out_a_bits_mask; 
  wire [63:0] pbus_auto_coupler_to_device_named_spi_0_control_xing_out_a_bits_data; 
  wire  pbus_auto_coupler_to_device_named_spi_0_control_xing_out_a_bits_corrupt; 
  wire  pbus_auto_coupler_to_device_named_spi_0_control_xing_out_d_ready; 
  wire  pbus_auto_coupler_to_device_named_spi_0_control_xing_out_d_valid; 
  wire [2:0] pbus_auto_coupler_to_device_named_spi_0_control_xing_out_d_bits_opcode; 
  wire [1:0] pbus_auto_coupler_to_device_named_spi_0_control_xing_out_d_bits_size; 
  wire [8:0] pbus_auto_coupler_to_device_named_spi_0_control_xing_out_d_bits_source; 
  wire [63:0] pbus_auto_coupler_to_device_named_spi_0_control_xing_out_d_bits_data; 
  wire  pbus_auto_coupler_to_slave_named_uart_0_control_xing_out_a_ready; 
  wire  pbus_auto_coupler_to_slave_named_uart_0_control_xing_out_a_valid; 
  wire [2:0] pbus_auto_coupler_to_slave_named_uart_0_control_xing_out_a_bits_opcode; 
  wire [2:0] pbus_auto_coupler_to_slave_named_uart_0_control_xing_out_a_bits_param; 
  wire [1:0] pbus_auto_coupler_to_slave_named_uart_0_control_xing_out_a_bits_size; 
  wire [8:0] pbus_auto_coupler_to_slave_named_uart_0_control_xing_out_a_bits_source; 
  wire [30:0] pbus_auto_coupler_to_slave_named_uart_0_control_xing_out_a_bits_address; 
  wire [7:0] pbus_auto_coupler_to_slave_named_uart_0_control_xing_out_a_bits_mask; 
  wire [63:0] pbus_auto_coupler_to_slave_named_uart_0_control_xing_out_a_bits_data; 
  wire  pbus_auto_coupler_to_slave_named_uart_0_control_xing_out_a_bits_corrupt; 
  wire  pbus_auto_coupler_to_slave_named_uart_0_control_xing_out_d_ready; 
  wire  pbus_auto_coupler_to_slave_named_uart_0_control_xing_out_d_valid; 
  wire [2:0] pbus_auto_coupler_to_slave_named_uart_0_control_xing_out_d_bits_opcode; 
  wire [1:0] pbus_auto_coupler_to_slave_named_uart_0_control_xing_out_d_bits_size; 
  wire [8:0] pbus_auto_coupler_to_slave_named_uart_0_control_xing_out_d_bits_source; 
  wire [63:0] pbus_auto_coupler_to_slave_named_uart_0_control_xing_out_d_bits_data; 
  wire  pbus_auto_from_cbus_in_a_ready; 
  wire  pbus_auto_from_cbus_in_a_valid; 
  wire [2:0] pbus_auto_from_cbus_in_a_bits_opcode; 
  wire [2:0] pbus_auto_from_cbus_in_a_bits_param; 
  wire [2:0] pbus_auto_from_cbus_in_a_bits_size; 
  wire [4:0] pbus_auto_from_cbus_in_a_bits_source; 
  wire [30:0] pbus_auto_from_cbus_in_a_bits_address; 
  wire [7:0] pbus_auto_from_cbus_in_a_bits_mask; 
  wire [63:0] pbus_auto_from_cbus_in_a_bits_data; 
  wire  pbus_auto_from_cbus_in_a_bits_corrupt; 
  wire  pbus_auto_from_cbus_in_d_ready; 
  wire  pbus_auto_from_cbus_in_d_valid; 
  wire [2:0] pbus_auto_from_cbus_in_d_bits_opcode; 
  wire [1:0] pbus_auto_from_cbus_in_d_bits_param; 
  wire [2:0] pbus_auto_from_cbus_in_d_bits_size; 
  wire [4:0] pbus_auto_from_cbus_in_d_bits_source; 
  wire  pbus_auto_from_cbus_in_d_bits_sink; 
  wire  pbus_auto_from_cbus_in_d_bits_denied; 
  wire [63:0] pbus_auto_from_cbus_in_d_bits_data; 
  wire  pbus_auto_from_cbus_in_d_bits_corrupt; 
  wire  bh_clock; 
  wire  bh_reset; 
  wire  bh_auto_in_a_ready; 
  wire  bh_auto_in_a_valid; 
  wire [2:0] bh_auto_in_a_bits_opcode; 
  wire [2:0] bh_auto_in_a_bits_param; 
  wire [2:0] bh_auto_in_a_bits_size; 
  wire [4:0] bh_auto_in_a_bits_source; 
  wire [31:0] bh_auto_in_a_bits_address; 
  wire [7:0] bh_auto_in_a_bits_mask; 
  wire [63:0] bh_auto_in_a_bits_data; 
  wire  bh_auto_in_a_bits_corrupt; 
  wire  bh_auto_in_b_ready; 
  wire  bh_auto_in_b_valid; 
  wire [1:0] bh_auto_in_b_bits_param; 
  wire [4:0] bh_auto_in_b_bits_source; 
  wire [31:0] bh_auto_in_b_bits_address; 
  wire  bh_auto_in_c_ready; 
  wire  bh_auto_in_c_valid; 
  wire [2:0] bh_auto_in_c_bits_opcode; 
  wire [2:0] bh_auto_in_c_bits_param; 
  wire [2:0] bh_auto_in_c_bits_size; 
  wire [4:0] bh_auto_in_c_bits_source; 
  wire [31:0] bh_auto_in_c_bits_address; 
  wire [63:0] bh_auto_in_c_bits_data; 
  wire  bh_auto_in_c_bits_corrupt; 
  wire  bh_auto_in_d_ready; 
  wire  bh_auto_in_d_valid; 
  wire [2:0] bh_auto_in_d_bits_opcode; 
  wire [1:0] bh_auto_in_d_bits_param; 
  wire [2:0] bh_auto_in_d_bits_size; 
  wire [4:0] bh_auto_in_d_bits_source; 
  wire [1:0] bh_auto_in_d_bits_sink; 
  wire  bh_auto_in_d_bits_denied; 
  wire [63:0] bh_auto_in_d_bits_data; 
  wire  bh_auto_in_d_bits_corrupt; 
  wire  bh_auto_in_e_valid; 
  wire [1:0] bh_auto_in_e_bits_sink; 
  wire  bh_auto_out_a_ready; 
  wire  bh_auto_out_a_valid; 
  wire [2:0] bh_auto_out_a_bits_opcode; 
  wire [2:0] bh_auto_out_a_bits_param; 
  wire [2:0] bh_auto_out_a_bits_size; 
  wire [6:0] bh_auto_out_a_bits_source; 
  wire [31:0] bh_auto_out_a_bits_address; 
  wire [7:0] bh_auto_out_a_bits_mask; 
  wire [63:0] bh_auto_out_a_bits_data; 
  wire  bh_auto_out_a_bits_corrupt; 
  wire  bh_auto_out_d_ready; 
  wire  bh_auto_out_d_valid; 
  wire [2:0] bh_auto_out_d_bits_opcode; 
  wire [1:0] bh_auto_out_d_bits_param; 
  wire [2:0] bh_auto_out_d_bits_size; 
  wire [6:0] bh_auto_out_d_bits_source; 
  wire  bh_auto_out_d_bits_denied; 
  wire [63:0] bh_auto_out_d_bits_data; 
  wire  bh_auto_out_d_bits_corrupt; 
  wire  ww_clock; 
  wire  ww_reset; 
  wire  ww_auto_in_a_ready; 
  wire  ww_auto_in_a_valid; 
  wire [2:0] ww_auto_in_a_bits_opcode; 
  wire [2:0] ww_auto_in_a_bits_param; 
  wire [2:0] ww_auto_in_a_bits_size; 
  wire [6:0] ww_auto_in_a_bits_source; 
  wire [31:0] ww_auto_in_a_bits_address; 
  wire [7:0] ww_auto_in_a_bits_mask; 
  wire [63:0] ww_auto_in_a_bits_data; 
  wire  ww_auto_in_a_bits_corrupt; 
  wire  ww_auto_in_d_ready; 
  wire  ww_auto_in_d_valid; 
  wire [2:0] ww_auto_in_d_bits_opcode; 
  wire [1:0] ww_auto_in_d_bits_param; 
  wire [2:0] ww_auto_in_d_bits_size; 
  wire [6:0] ww_auto_in_d_bits_source; 
  wire  ww_auto_in_d_bits_denied; 
  wire [63:0] ww_auto_in_d_bits_data; 
  wire  ww_auto_in_d_bits_corrupt; 
  wire  ww_auto_out_a_ready; 
  wire  ww_auto_out_a_valid; 
  wire [2:0] ww_auto_out_a_bits_opcode; 
  wire [2:0] ww_auto_out_a_bits_param; 
  wire [2:0] ww_auto_out_a_bits_size; 
  wire [6:0] ww_auto_out_a_bits_source; 
  wire [31:0] ww_auto_out_a_bits_address; 
  wire [7:0] ww_auto_out_a_bits_mask; 
  wire [63:0] ww_auto_out_a_bits_data; 
  wire  ww_auto_out_a_bits_corrupt; 
  wire  ww_auto_out_d_ready; 
  wire  ww_auto_out_d_valid; 
  wire [2:0] ww_auto_out_d_bits_opcode; 
  wire [1:0] ww_auto_out_d_bits_param; 
  wire [2:0] ww_auto_out_d_bits_size; 
  wire [6:0] ww_auto_out_d_bits_source; 
  wire  ww_auto_out_d_bits_sink; 
  wire  ww_auto_out_d_bits_denied; 
  wire [63:0] ww_auto_out_d_bits_data; 
  wire  ww_auto_out_d_bits_corrupt; 
  wire  mbus_clock; 
  wire  mbus_reset; 
  wire  mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_a_ready; 
  wire  mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_a_valid; 
  wire [2:0] mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_a_bits_opcode; 
  wire [2:0] mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_a_bits_param; 
  wire [2:0] mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_a_bits_size; 
  wire [6:0] mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_a_bits_source; 
  wire [31:0] mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_a_bits_address; 
  wire [7:0] mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_a_bits_mask; 
  wire [63:0] mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_a_bits_data; 
  wire  mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_a_bits_corrupt; 
  wire  mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_d_ready; 
  wire  mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_d_valid; 
  wire [2:0] mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_d_bits_opcode; 
  wire [1:0] mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_d_bits_param; 
  wire [2:0] mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_d_bits_size; 
  wire [6:0] mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_d_bits_source; 
  wire  mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_d_bits_sink; 
  wire  mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_d_bits_denied; 
  wire [63:0] mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_d_bits_data; 
  wire  mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_d_bits_corrupt; 
  wire  mbus_auto_coupler_from_coherence_manager_binder_in_a_ready; 
  wire  mbus_auto_coupler_from_coherence_manager_binder_in_a_valid; 
  wire [2:0] mbus_auto_coupler_from_coherence_manager_binder_in_a_bits_opcode; 
  wire [2:0] mbus_auto_coupler_from_coherence_manager_binder_in_a_bits_param; 
  wire [2:0] mbus_auto_coupler_from_coherence_manager_binder_in_a_bits_size; 
  wire [6:0] mbus_auto_coupler_from_coherence_manager_binder_in_a_bits_source; 
  wire [31:0] mbus_auto_coupler_from_coherence_manager_binder_in_a_bits_address; 
  wire [7:0] mbus_auto_coupler_from_coherence_manager_binder_in_a_bits_mask; 
  wire [63:0] mbus_auto_coupler_from_coherence_manager_binder_in_a_bits_data; 
  wire  mbus_auto_coupler_from_coherence_manager_binder_in_a_bits_corrupt; 
  wire  mbus_auto_coupler_from_coherence_manager_binder_in_d_ready; 
  wire  mbus_auto_coupler_from_coherence_manager_binder_in_d_valid; 
  wire [2:0] mbus_auto_coupler_from_coherence_manager_binder_in_d_bits_opcode; 
  wire [1:0] mbus_auto_coupler_from_coherence_manager_binder_in_d_bits_param; 
  wire [2:0] mbus_auto_coupler_from_coherence_manager_binder_in_d_bits_size; 
  wire [6:0] mbus_auto_coupler_from_coherence_manager_binder_in_d_bits_source; 
  wire  mbus_auto_coupler_from_coherence_manager_binder_in_d_bits_sink; 
  wire  mbus_auto_coupler_from_coherence_manager_binder_in_d_bits_denied; 
  wire [63:0] mbus_auto_coupler_from_coherence_manager_binder_in_d_bits_data; 
  wire  mbus_auto_coupler_from_coherence_manager_binder_in_d_bits_corrupt; 
  wire  plic_clock; 
  wire  plic_reset; 
  wire  plic_auto_int_in_0; 
  wire  plic_auto_int_in_1; 
  wire  plic_auto_int_in_2; 
  wire  plic_auto_int_in_3; 
  wire  plic_auto_int_in_4; 
  wire  plic_auto_int_in_5; 
  wire  plic_auto_int_in_6; 
  wire  plic_auto_int_out_7_0; 
  wire  plic_auto_int_out_6_0; 
  wire  plic_auto_int_out_5_0; 
  wire  plic_auto_int_out_4_0; 
  wire  plic_auto_int_out_3_0; 
  wire  plic_auto_int_out_2_0; 
  wire  plic_auto_int_out_1_0; 
  wire  plic_auto_int_out_0_0; 
  wire  plic_auto_in_a_ready; 
  wire  plic_auto_in_a_valid; 
  wire [2:0] plic_auto_in_a_bits_opcode; 
  wire [2:0] plic_auto_in_a_bits_param; 
  wire [1:0] plic_auto_in_a_bits_size; 
  wire [8:0] plic_auto_in_a_bits_source; 
  wire [27:0] plic_auto_in_a_bits_address; 
  wire [7:0] plic_auto_in_a_bits_mask; 
  wire [63:0] plic_auto_in_a_bits_data; 
  wire  plic_auto_in_a_bits_corrupt; 
  wire  plic_auto_in_d_ready; 
  wire  plic_auto_in_d_valid; 
  wire [2:0] plic_auto_in_d_bits_opcode; 
  wire [1:0] plic_auto_in_d_bits_size; 
  wire [8:0] plic_auto_in_d_bits_source; 
  wire [63:0] plic_auto_in_d_bits_data; 
  wire  clint_clock; 
  wire  clint_reset; 
  wire  clint_auto_int_out_3_0; 
  wire  clint_auto_int_out_3_1; 
  wire  clint_auto_int_out_2_0; 
  wire  clint_auto_int_out_2_1; 
  wire  clint_auto_int_out_1_0; 
  wire  clint_auto_int_out_1_1; 
  wire  clint_auto_int_out_0_0; 
  wire  clint_auto_int_out_0_1; 
  wire  clint_auto_in_a_ready; 
  wire  clint_auto_in_a_valid; 
  wire [2:0] clint_auto_in_a_bits_opcode; 
  wire [2:0] clint_auto_in_a_bits_param; 
  wire [1:0] clint_auto_in_a_bits_size; 
  wire [8:0] clint_auto_in_a_bits_source; 
  wire [25:0] clint_auto_in_a_bits_address; 
  wire [7:0] clint_auto_in_a_bits_mask; 
  wire [63:0] clint_auto_in_a_bits_data; 
  wire  clint_auto_in_a_bits_corrupt; 
  wire  clint_auto_in_d_ready; 
  wire  clint_auto_in_d_valid; 
  wire [2:0] clint_auto_in_d_bits_opcode; 
  wire [1:0] clint_auto_in_d_bits_size; 
  wire [8:0] clint_auto_in_d_bits_source; 
  wire [63:0] clint_auto_in_d_bits_data; 
  wire  clint_io_rtcTick; 
  wire  debug_1_clock; 
  wire  debug_1_reset; 
  wire  debug_1_auto_dmInner_dmInner_tl_in_a_ready; 
  wire  debug_1_auto_dmInner_dmInner_tl_in_a_valid; 
  wire [2:0] debug_1_auto_dmInner_dmInner_tl_in_a_bits_opcode; 
  wire [2:0] debug_1_auto_dmInner_dmInner_tl_in_a_bits_param; 
  wire [1:0] debug_1_auto_dmInner_dmInner_tl_in_a_bits_size; 
  wire [8:0] debug_1_auto_dmInner_dmInner_tl_in_a_bits_source; 
  wire [11:0] debug_1_auto_dmInner_dmInner_tl_in_a_bits_address; 
  wire [7:0] debug_1_auto_dmInner_dmInner_tl_in_a_bits_mask; 
  wire [63:0] debug_1_auto_dmInner_dmInner_tl_in_a_bits_data; 
  wire  debug_1_auto_dmInner_dmInner_tl_in_a_bits_corrupt; 
  wire  debug_1_auto_dmInner_dmInner_tl_in_d_ready; 
  wire  debug_1_auto_dmInner_dmInner_tl_in_d_valid; 
  wire [2:0] debug_1_auto_dmInner_dmInner_tl_in_d_bits_opcode; 
  wire [1:0] debug_1_auto_dmInner_dmInner_tl_in_d_bits_size; 
  wire [8:0] debug_1_auto_dmInner_dmInner_tl_in_d_bits_source; 
  wire [63:0] debug_1_auto_dmInner_dmInner_tl_in_d_bits_data; 
  wire  debug_1_auto_dmOuter_intsource_out_3_sync_0; 
  wire  debug_1_auto_dmOuter_intsource_out_2_sync_0; 
  wire  debug_1_auto_dmOuter_intsource_out_1_sync_0; 
  wire  debug_1_auto_dmOuter_intsource_out_0_sync_0; 
  wire  debug_1_io_ctrl_ndreset; 
  wire  debug_1_io_dmi_dmi_req_ready; 
  wire  debug_1_io_dmi_dmi_req_valid; 
  wire [6:0] debug_1_io_dmi_dmi_req_bits_addr; 
  wire [31:0] debug_1_io_dmi_dmi_req_bits_data; 
  wire [1:0] debug_1_io_dmi_dmi_req_bits_op; 
  wire  debug_1_io_dmi_dmi_resp_ready; 
  wire  debug_1_io_dmi_dmi_resp_valid; 
  wire [31:0] debug_1_io_dmi_dmi_resp_bits_data; 
  wire [1:0] debug_1_io_dmi_dmi_resp_bits_resp; 
  wire  debug_1_io_dmi_dmiClock; 
  wire  debug_1_io_dmi_dmiReset; 

  wire  tile_auto_intsink_in_sync_0; 
  wire  tile_auto_int_in_xing_in_2_sync_0; 
  wire  tile_auto_int_in_xing_in_1_sync_0; 
  wire  tile_auto_int_in_xing_in_0_sync_0; 
  wire  tile_auto_int_in_xing_in_0_sync_1; 
  wire  tile_auto_tl_master_xing_out_a_ready; 
  wire  tile_auto_tl_master_xing_out_a_valid; 
  wire [2:0] tile_auto_tl_master_xing_out_a_bits_opcode; 
  wire [2:0] tile_auto_tl_master_xing_out_a_bits_param; 
  wire [2:0] tile_auto_tl_master_xing_out_a_bits_size; 
  wire [1:0] tile_auto_tl_master_xing_out_a_bits_source; 
  wire [37:0] tile_auto_tl_master_xing_out_a_bits_address; 
  wire [7:0] tile_auto_tl_master_xing_out_a_bits_mask; 
  wire [63:0] tile_auto_tl_master_xing_out_a_bits_data; 
  wire  tile_auto_tl_master_xing_out_a_bits_corrupt; 
  wire  tile_auto_tl_master_xing_out_b_ready; 
  wire  tile_auto_tl_master_xing_out_b_valid; 
  wire [2:0] tile_auto_tl_master_xing_out_b_bits_opcode; 
  wire [1:0] tile_auto_tl_master_xing_out_b_bits_param; 
  wire [2:0] tile_auto_tl_master_xing_out_b_bits_size; 
  wire [1:0] tile_auto_tl_master_xing_out_b_bits_source; 
  wire [37:0] tile_auto_tl_master_xing_out_b_bits_address; 
  wire [7:0] tile_auto_tl_master_xing_out_b_bits_mask; 
  wire  tile_auto_tl_master_xing_out_b_bits_corrupt; 
  wire  tile_auto_tl_master_xing_out_c_ready; 
  wire  tile_auto_tl_master_xing_out_c_valid; 
  wire [2:0] tile_auto_tl_master_xing_out_c_bits_opcode; 
  wire [2:0] tile_auto_tl_master_xing_out_c_bits_param; 
  wire [2:0] tile_auto_tl_master_xing_out_c_bits_size; 
  wire [1:0] tile_auto_tl_master_xing_out_c_bits_source; 
  wire [37:0] tile_auto_tl_master_xing_out_c_bits_address; 
  wire [63:0] tile_auto_tl_master_xing_out_c_bits_data; 
  wire  tile_auto_tl_master_xing_out_c_bits_corrupt; 
  wire  tile_auto_tl_master_xing_out_d_ready; 
  wire  tile_auto_tl_master_xing_out_d_valid; 
  wire [2:0] tile_auto_tl_master_xing_out_d_bits_opcode; 
  wire [1:0] tile_auto_tl_master_xing_out_d_bits_param; 
  wire [2:0] tile_auto_tl_master_xing_out_d_bits_size; 
  wire [1:0] tile_auto_tl_master_xing_out_d_bits_source; 
  wire [2:0] tile_auto_tl_master_xing_out_d_bits_sink; 
  wire  tile_auto_tl_master_xing_out_d_bits_denied; 
  wire [63:0] tile_auto_tl_master_xing_out_d_bits_data; 
  wire  tile_auto_tl_master_xing_out_d_bits_corrupt; 
  wire  tile_auto_tl_master_xing_out_e_ready; 
  wire  tile_auto_tl_master_xing_out_e_valid; 
  wire [2:0] tile_auto_tl_master_xing_out_e_bits_sink; 
  wire [1:0] tile_constants_hartid; 
  wire  intsource_clock; 
  wire  intsource_reset; 
  wire  intsource_auto_in_0; 
  wire  intsource_auto_in_1; 
  wire  intsource_auto_out_sync_0; 
  wire  intsource_auto_out_sync_1; 
  wire  intsource_1_clock; 
  wire  intsource_1_reset; 
  wire  intsource_1_auto_in_0; 
  wire  intsource_1_auto_out_sync_0; 
  wire  intsource_2_clock; 
  wire  intsource_2_reset; 
  wire  intsource_2_auto_in_0; 
  wire  intsource_2_auto_out_sync_0; 

  wire  tile_1_auto_intsink_in_sync_0; 
  wire  tile_1_auto_int_in_xing_in_2_sync_0; 
  wire  tile_1_auto_int_in_xing_in_1_sync_0; 
  wire  tile_1_auto_int_in_xing_in_0_sync_0; 
  wire  tile_1_auto_int_in_xing_in_0_sync_1; 
  wire  tile_1_auto_tl_master_xing_out_a_ready; 
  wire  tile_1_auto_tl_master_xing_out_a_valid; 
  wire [2:0] tile_1_auto_tl_master_xing_out_a_bits_opcode; 
  wire [2:0] tile_1_auto_tl_master_xing_out_a_bits_param; 
  wire [2:0] tile_1_auto_tl_master_xing_out_a_bits_size; 
  wire [1:0] tile_1_auto_tl_master_xing_out_a_bits_source; 
  wire [37:0] tile_1_auto_tl_master_xing_out_a_bits_address; 
  wire [7:0] tile_1_auto_tl_master_xing_out_a_bits_mask; 
  wire [63:0] tile_1_auto_tl_master_xing_out_a_bits_data; 
  wire  tile_1_auto_tl_master_xing_out_a_bits_corrupt; 
  wire  tile_1_auto_tl_master_xing_out_b_ready; 
  wire  tile_1_auto_tl_master_xing_out_b_valid; 
  wire [2:0] tile_1_auto_tl_master_xing_out_b_bits_opcode; 
  wire [1:0] tile_1_auto_tl_master_xing_out_b_bits_param; 
  wire [2:0] tile_1_auto_tl_master_xing_out_b_bits_size; 
  wire [1:0] tile_1_auto_tl_master_xing_out_b_bits_source; 
  wire [37:0] tile_1_auto_tl_master_xing_out_b_bits_address; 
  wire [7:0] tile_1_auto_tl_master_xing_out_b_bits_mask; 
  wire  tile_1_auto_tl_master_xing_out_b_bits_corrupt; 
  wire  tile_1_auto_tl_master_xing_out_c_ready; 
  wire  tile_1_auto_tl_master_xing_out_c_valid; 
  wire [2:0] tile_1_auto_tl_master_xing_out_c_bits_opcode; 
  wire [2:0] tile_1_auto_tl_master_xing_out_c_bits_param; 
  wire [2:0] tile_1_auto_tl_master_xing_out_c_bits_size; 
  wire [1:0] tile_1_auto_tl_master_xing_out_c_bits_source; 
  wire [37:0] tile_1_auto_tl_master_xing_out_c_bits_address; 
  wire [63:0] tile_1_auto_tl_master_xing_out_c_bits_data; 
  wire  tile_1_auto_tl_master_xing_out_c_bits_corrupt; 
  wire  tile_1_auto_tl_master_xing_out_d_ready; 
  wire  tile_1_auto_tl_master_xing_out_d_valid; 
  wire [2:0] tile_1_auto_tl_master_xing_out_d_bits_opcode; 
  wire [1:0] tile_1_auto_tl_master_xing_out_d_bits_param; 
  wire [2:0] tile_1_auto_tl_master_xing_out_d_bits_size; 
  wire [1:0] tile_1_auto_tl_master_xing_out_d_bits_source; 
  wire [2:0] tile_1_auto_tl_master_xing_out_d_bits_sink; 
  wire  tile_1_auto_tl_master_xing_out_d_bits_denied; 
  wire [63:0] tile_1_auto_tl_master_xing_out_d_bits_data; 
  wire  tile_1_auto_tl_master_xing_out_d_bits_corrupt; 
  wire  tile_1_auto_tl_master_xing_out_e_ready; 
  wire  tile_1_auto_tl_master_xing_out_e_valid; 
  wire [2:0] tile_1_auto_tl_master_xing_out_e_bits_sink; 
  wire [1:0] tile_1_constants_hartid; 
  wire  intsource_3_clock; 
  wire  intsource_3_reset; 
  wire  intsource_3_auto_in_0; 
  wire  intsource_3_auto_in_1; 
  wire  intsource_3_auto_out_sync_0; 
  wire  intsource_3_auto_out_sync_1; 
  wire  intsource_4_clock; 
  wire  intsource_4_reset; 
  wire  intsource_4_auto_in_0; 
  wire  intsource_4_auto_out_sync_0; 
  wire  intsource_5_clock; 
  wire  intsource_5_reset; 
  wire  intsource_5_auto_in_0; 
  wire  intsource_5_auto_out_sync_0; 

  wire  tile_2_auto_intsink_in_sync_0; 
  wire  tile_2_auto_int_in_xing_in_2_sync_0; 
  wire  tile_2_auto_int_in_xing_in_1_sync_0; 
  wire  tile_2_auto_int_in_xing_in_0_sync_0; 
  wire  tile_2_auto_int_in_xing_in_0_sync_1; 
  wire  tile_2_auto_tl_master_xing_out_a_ready; 
  wire  tile_2_auto_tl_master_xing_out_a_valid; 
  wire [2:0] tile_2_auto_tl_master_xing_out_a_bits_opcode; 
  wire [2:0] tile_2_auto_tl_master_xing_out_a_bits_param; 
  wire [2:0] tile_2_auto_tl_master_xing_out_a_bits_size; 
  wire [1:0] tile_2_auto_tl_master_xing_out_a_bits_source; 
  wire [37:0] tile_2_auto_tl_master_xing_out_a_bits_address; 
  wire [7:0] tile_2_auto_tl_master_xing_out_a_bits_mask; 
  wire [63:0] tile_2_auto_tl_master_xing_out_a_bits_data; 
  wire  tile_2_auto_tl_master_xing_out_a_bits_corrupt; 
  wire  tile_2_auto_tl_master_xing_out_b_ready; 
  wire  tile_2_auto_tl_master_xing_out_b_valid; 
  wire [2:0] tile_2_auto_tl_master_xing_out_b_bits_opcode; 
  wire [1:0] tile_2_auto_tl_master_xing_out_b_bits_param; 
  wire [2:0] tile_2_auto_tl_master_xing_out_b_bits_size; 
  wire [1:0] tile_2_auto_tl_master_xing_out_b_bits_source; 
  wire [37:0] tile_2_auto_tl_master_xing_out_b_bits_address; 
  wire [7:0] tile_2_auto_tl_master_xing_out_b_bits_mask; 
  wire  tile_2_auto_tl_master_xing_out_b_bits_corrupt; 
  wire  tile_2_auto_tl_master_xing_out_c_ready; 
  wire  tile_2_auto_tl_master_xing_out_c_valid; 
  wire [2:0] tile_2_auto_tl_master_xing_out_c_bits_opcode; 
  wire [2:0] tile_2_auto_tl_master_xing_out_c_bits_param; 
  wire [2:0] tile_2_auto_tl_master_xing_out_c_bits_size; 
  wire [1:0] tile_2_auto_tl_master_xing_out_c_bits_source; 
  wire [37:0] tile_2_auto_tl_master_xing_out_c_bits_address; 
  wire [63:0] tile_2_auto_tl_master_xing_out_c_bits_data; 
  wire  tile_2_auto_tl_master_xing_out_c_bits_corrupt; 
  wire  tile_2_auto_tl_master_xing_out_d_ready; 
  wire  tile_2_auto_tl_master_xing_out_d_valid; 
  wire [2:0] tile_2_auto_tl_master_xing_out_d_bits_opcode; 
  wire [1:0] tile_2_auto_tl_master_xing_out_d_bits_param; 
  wire [2:0] tile_2_auto_tl_master_xing_out_d_bits_size; 
  wire [1:0] tile_2_auto_tl_master_xing_out_d_bits_source; 
  wire [2:0] tile_2_auto_tl_master_xing_out_d_bits_sink; 
  wire  tile_2_auto_tl_master_xing_out_d_bits_denied; 
  wire [63:0] tile_2_auto_tl_master_xing_out_d_bits_data; 
  wire  tile_2_auto_tl_master_xing_out_d_bits_corrupt; 
  wire  tile_2_auto_tl_master_xing_out_e_ready; 
  wire  tile_2_auto_tl_master_xing_out_e_valid; 
  wire [2:0] tile_2_auto_tl_master_xing_out_e_bits_sink; 
  wire [1:0] tile_2_constants_hartid; 
  wire  intsource_6_clock; 
  wire  intsource_6_reset; 
  wire  intsource_6_auto_in_0; 
  wire  intsource_6_auto_in_1; 
  wire  intsource_6_auto_out_sync_0; 
  wire  intsource_6_auto_out_sync_1; 
  wire  intsource_7_clock; 
  wire  intsource_7_reset; 
  wire  intsource_7_auto_in_0; 
  wire  intsource_7_auto_out_sync_0; 
  wire  intsource_8_clock; 
  wire  intsource_8_reset; 
  wire  intsource_8_auto_in_0; 
  wire  intsource_8_auto_out_sync_0; 

  wire  tile_3_auto_intsink_in_sync_0; 
  wire  tile_3_auto_int_in_xing_in_2_sync_0; 
  wire  tile_3_auto_int_in_xing_in_1_sync_0; 
  wire  tile_3_auto_int_in_xing_in_0_sync_0; 
  wire  tile_3_auto_int_in_xing_in_0_sync_1; 
  wire  tile_3_auto_tl_master_xing_out_a_ready; 
  wire  tile_3_auto_tl_master_xing_out_a_valid; 
  wire [2:0] tile_3_auto_tl_master_xing_out_a_bits_opcode; 
  wire [2:0] tile_3_auto_tl_master_xing_out_a_bits_param; 
  wire [2:0] tile_3_auto_tl_master_xing_out_a_bits_size; 
  wire [1:0] tile_3_auto_tl_master_xing_out_a_bits_source; 
  wire [37:0] tile_3_auto_tl_master_xing_out_a_bits_address; 
  wire [7:0] tile_3_auto_tl_master_xing_out_a_bits_mask; 
  wire [63:0] tile_3_auto_tl_master_xing_out_a_bits_data; 
  wire  tile_3_auto_tl_master_xing_out_a_bits_corrupt; 
  wire  tile_3_auto_tl_master_xing_out_b_ready; 
  wire  tile_3_auto_tl_master_xing_out_b_valid; 
  wire [2:0] tile_3_auto_tl_master_xing_out_b_bits_opcode; 
  wire [1:0] tile_3_auto_tl_master_xing_out_b_bits_param; 
  wire [2:0] tile_3_auto_tl_master_xing_out_b_bits_size; 
  wire [1:0] tile_3_auto_tl_master_xing_out_b_bits_source; 
  wire [37:0] tile_3_auto_tl_master_xing_out_b_bits_address; 
  wire [7:0] tile_3_auto_tl_master_xing_out_b_bits_mask; 
  wire  tile_3_auto_tl_master_xing_out_b_bits_corrupt; 
  wire  tile_3_auto_tl_master_xing_out_c_ready; 
  wire  tile_3_auto_tl_master_xing_out_c_valid; 
  wire [2:0] tile_3_auto_tl_master_xing_out_c_bits_opcode; 
  wire [2:0] tile_3_auto_tl_master_xing_out_c_bits_param; 
  wire [2:0] tile_3_auto_tl_master_xing_out_c_bits_size; 
  wire [1:0] tile_3_auto_tl_master_xing_out_c_bits_source; 
  wire [37:0] tile_3_auto_tl_master_xing_out_c_bits_address; 
  wire [63:0] tile_3_auto_tl_master_xing_out_c_bits_data; 
  wire  tile_3_auto_tl_master_xing_out_c_bits_corrupt; 
  wire  tile_3_auto_tl_master_xing_out_d_ready; 
  wire  tile_3_auto_tl_master_xing_out_d_valid; 
  wire [2:0] tile_3_auto_tl_master_xing_out_d_bits_opcode; 
  wire [1:0] tile_3_auto_tl_master_xing_out_d_bits_param; 
  wire [2:0] tile_3_auto_tl_master_xing_out_d_bits_size; 
  wire [1:0] tile_3_auto_tl_master_xing_out_d_bits_source; 
  wire [2:0] tile_3_auto_tl_master_xing_out_d_bits_sink; 
  wire  tile_3_auto_tl_master_xing_out_d_bits_denied; 
  wire [63:0] tile_3_auto_tl_master_xing_out_d_bits_data; 
  wire  tile_3_auto_tl_master_xing_out_d_bits_corrupt; 
  wire  tile_3_auto_tl_master_xing_out_e_ready; 
  wire  tile_3_auto_tl_master_xing_out_e_valid; 
  wire [2:0] tile_3_auto_tl_master_xing_out_e_bits_sink; 
  wire [1:0] tile_3_constants_hartid; 
  wire  intsource_9_clock; 
  wire  intsource_9_reset; 
  wire  intsource_9_auto_in_0; 
  wire  intsource_9_auto_in_1; 
  wire  intsource_9_auto_out_sync_0; 
  wire  intsource_9_auto_out_sync_1; 
  wire  intsource_10_clock; 
  wire  intsource_10_reset; 
  wire  intsource_10_auto_in_0; 
  wire  intsource_10_auto_out_sync_0; 
  wire  intsource_11_clock; 
  wire  intsource_11_reset; 
  wire  intsource_11_auto_in_0; 
  wire  intsource_11_auto_out_sync_0; 
  wire  maskROM_clock; 
  wire  maskROM_reset; 
  wire  maskROM_auto_in_a_ready; 
  wire  maskROM_auto_in_a_valid; 
  wire [2:0] maskROM_auto_in_a_bits_opcode; 
  wire [2:0] maskROM_auto_in_a_bits_param; 
  wire [1:0] maskROM_auto_in_a_bits_size; 
  wire [9:0] maskROM_auto_in_a_bits_source; 
  wire [16:0] maskROM_auto_in_a_bits_address; 
  wire [3:0] maskROM_auto_in_a_bits_mask; 
  wire  maskROM_auto_in_a_bits_corrupt; 
  wire  maskROM_auto_in_d_ready; 
  wire  maskROM_auto_in_d_valid; 
  wire [1:0] maskROM_auto_in_d_bits_size; 
  wire [9:0] maskROM_auto_in_d_bits_source; 
  wire [31:0] maskROM_auto_in_d_bits_data; 
  wire  asyncXing_clock; 
  wire  asyncXing_auto_int_in_0; 
  wire  asyncXing_auto_int_out_0; 
  wire  uart_0_clock; 
  wire  uart_0_reset; 
  wire  uart_0_auto_int_xing_out_sync_0; 
  wire  uart_0_auto_control_xing_in_a_ready; 
  wire  uart_0_auto_control_xing_in_a_valid; 
  wire [2:0] uart_0_auto_control_xing_in_a_bits_opcode; 
  wire [2:0] uart_0_auto_control_xing_in_a_bits_param; 
  wire [1:0] uart_0_auto_control_xing_in_a_bits_size; 
  wire [8:0] uart_0_auto_control_xing_in_a_bits_source; 
  wire [30:0] uart_0_auto_control_xing_in_a_bits_address; 
  wire [7:0] uart_0_auto_control_xing_in_a_bits_mask; 
  wire [63:0] uart_0_auto_control_xing_in_a_bits_data; 
  wire  uart_0_auto_control_xing_in_a_bits_corrupt; 
  wire  uart_0_auto_control_xing_in_d_ready; 
  wire  uart_0_auto_control_xing_in_d_valid; 
  wire [2:0] uart_0_auto_control_xing_in_d_bits_opcode; 
  wire [1:0] uart_0_auto_control_xing_in_d_bits_size; 
  wire [8:0] uart_0_auto_control_xing_in_d_bits_source; 
  wire [63:0] uart_0_auto_control_xing_in_d_bits_data; 
  wire  uart_0_auto_io_out_txd; 
  wire  uart_0_auto_io_out_rxd; 
  wire  intsink_4_auto_in_sync_0; 
  wire  intsink_4_auto_out_0; 
  wire  asyncXing_1_clock; 
  wire  asyncXing_1_auto_int_in_0; 
  wire  asyncXing_1_auto_int_out_0; 
  wire  spi_0_clock; 
  wire  spi_0_reset; 
  wire  spi_0_auto_int_xing_out_sync_0; 
  wire  spi_0_auto_control_xing_in_a_ready; 
  wire  spi_0_auto_control_xing_in_a_valid; 
  wire [2:0] spi_0_auto_control_xing_in_a_bits_opcode; 
  wire [2:0] spi_0_auto_control_xing_in_a_bits_param; 
  wire [1:0] spi_0_auto_control_xing_in_a_bits_size; 
  wire [8:0] spi_0_auto_control_xing_in_a_bits_source; 
  wire [30:0] spi_0_auto_control_xing_in_a_bits_address; 
  wire [7:0] spi_0_auto_control_xing_in_a_bits_mask; 
  wire [63:0] spi_0_auto_control_xing_in_a_bits_data; 
  wire  spi_0_auto_control_xing_in_a_bits_corrupt; 
  wire  spi_0_auto_control_xing_in_d_ready; 
  wire  spi_0_auto_control_xing_in_d_valid; 
  wire [2:0] spi_0_auto_control_xing_in_d_bits_opcode; 
  wire [1:0] spi_0_auto_control_xing_in_d_bits_size; 
  wire [8:0] spi_0_auto_control_xing_in_d_bits_source; 
  wire [63:0] spi_0_auto_control_xing_in_d_bits_data; 
  wire  spi_0_auto_io_out_sck; 
  wire  spi_0_auto_io_out_dq_0_o; 
  wire  spi_0_auto_io_out_dq_1_i; 
  wire  spi_0_auto_io_out_cs_0; 
  wire  intsink_5_auto_in_sync_0; 
  wire  intsink_5_auto_out_0; 
  wire  mig_clock; 
  wire  mig_reset; 
  wire  mig_auto_buffer_in_a_ready; 
  wire  mig_auto_buffer_in_a_valid; 
  wire [2:0] mig_auto_buffer_in_a_bits_opcode; 
  wire [2:0] mig_auto_buffer_in_a_bits_param; 
  wire [2:0] mig_auto_buffer_in_a_bits_size; 
  wire [6:0] mig_auto_buffer_in_a_bits_source; 
  wire [31:0] mig_auto_buffer_in_a_bits_address; 
  wire [7:0] mig_auto_buffer_in_a_bits_mask; 
  wire [63:0] mig_auto_buffer_in_a_bits_data; 
  wire  mig_auto_buffer_in_a_bits_corrupt; 
  wire  mig_auto_buffer_in_d_ready; 
  wire  mig_auto_buffer_in_d_valid; 
  wire [2:0] mig_auto_buffer_in_d_bits_opcode; 
  wire [1:0] mig_auto_buffer_in_d_bits_param; 
  wire [2:0] mig_auto_buffer_in_d_bits_size; 
  wire [6:0] mig_auto_buffer_in_d_bits_source; 
  wire  mig_auto_buffer_in_d_bits_sink; 
  wire  mig_auto_buffer_in_d_bits_denied; 
  wire [63:0] mig_auto_buffer_in_d_bits_data; 
  wire  mig_auto_buffer_in_d_bits_corrupt; 
  wire [13:0] mig_io_port_ddr3_addr; 
  wire [2:0] mig_io_port_ddr3_ba; 
  wire  mig_io_port_ddr3_ras_n; 
  wire  mig_io_port_ddr3_cas_n; 
  wire  mig_io_port_ddr3_we_n; 
  wire  mig_io_port_ddr3_reset_n; 
  wire  mig_io_port_ddr3_ck_p; 
  wire  mig_io_port_ddr3_ck_n; 
  wire  mig_io_port_ddr3_cke; 
  wire  mig_io_port_ddr3_cs_n; 
  wire [7:0] mig_io_port_ddr3_dm; 
  wire  mig_io_port_ddr3_odt; 
  wire  mig_io_port_sys_clk_i; 
  wire  mig_io_port_ui_clk; 
  wire  mig_io_port_ui_clk_sync_rst; 
  wire  mig_io_port_mmcm_locked; 
  wire  mig_io_port_aresetn; 
  wire  mig_io_port_sys_rst; 
  wire  pcie_auto_int_out_xing_out_sync_0; 
  wire [2:0] pcie_auto_tl_out_xing_out_a_mem_0_opcode; 
  wire [2:0] pcie_auto_tl_out_xing_out_a_mem_0_param; 
  wire [2:0] pcie_auto_tl_out_xing_out_a_mem_0_size; 
  wire [3:0] pcie_auto_tl_out_xing_out_a_mem_0_source; 
  wire [37:0] pcie_auto_tl_out_xing_out_a_mem_0_address; 
  wire [7:0] pcie_auto_tl_out_xing_out_a_mem_0_mask; 
  wire [63:0] pcie_auto_tl_out_xing_out_a_mem_0_data; 
  wire  pcie_auto_tl_out_xing_out_a_mem_0_corrupt; 
  wire [2:0] pcie_auto_tl_out_xing_out_a_mem_1_opcode; 
  wire [2:0] pcie_auto_tl_out_xing_out_a_mem_1_param; 
  wire [2:0] pcie_auto_tl_out_xing_out_a_mem_1_size; 
  wire [3:0] pcie_auto_tl_out_xing_out_a_mem_1_source; 
  wire [37:0] pcie_auto_tl_out_xing_out_a_mem_1_address; 
  wire [7:0] pcie_auto_tl_out_xing_out_a_mem_1_mask; 
  wire [63:0] pcie_auto_tl_out_xing_out_a_mem_1_data; 
  wire  pcie_auto_tl_out_xing_out_a_mem_1_corrupt; 
  wire [2:0] pcie_auto_tl_out_xing_out_a_mem_2_opcode; 
  wire [2:0] pcie_auto_tl_out_xing_out_a_mem_2_param; 
  wire [2:0] pcie_auto_tl_out_xing_out_a_mem_2_size; 
  wire [3:0] pcie_auto_tl_out_xing_out_a_mem_2_source; 
  wire [37:0] pcie_auto_tl_out_xing_out_a_mem_2_address; 
  wire [7:0] pcie_auto_tl_out_xing_out_a_mem_2_mask; 
  wire [63:0] pcie_auto_tl_out_xing_out_a_mem_2_data; 
  wire  pcie_auto_tl_out_xing_out_a_mem_2_corrupt; 
  wire [2:0] pcie_auto_tl_out_xing_out_a_mem_3_opcode; 
  wire [2:0] pcie_auto_tl_out_xing_out_a_mem_3_param; 
  wire [2:0] pcie_auto_tl_out_xing_out_a_mem_3_size; 
  wire [3:0] pcie_auto_tl_out_xing_out_a_mem_3_source; 
  wire [37:0] pcie_auto_tl_out_xing_out_a_mem_3_address; 
  wire [7:0] pcie_auto_tl_out_xing_out_a_mem_3_mask; 
  wire [63:0] pcie_auto_tl_out_xing_out_a_mem_3_data; 
  wire  pcie_auto_tl_out_xing_out_a_mem_3_corrupt; 
  wire [2:0] pcie_auto_tl_out_xing_out_a_mem_4_opcode; 
  wire [2:0] pcie_auto_tl_out_xing_out_a_mem_4_param; 
  wire [2:0] pcie_auto_tl_out_xing_out_a_mem_4_size; 
  wire [3:0] pcie_auto_tl_out_xing_out_a_mem_4_source; 
  wire [37:0] pcie_auto_tl_out_xing_out_a_mem_4_address; 
  wire [7:0] pcie_auto_tl_out_xing_out_a_mem_4_mask; 
  wire [63:0] pcie_auto_tl_out_xing_out_a_mem_4_data; 
  wire  pcie_auto_tl_out_xing_out_a_mem_4_corrupt; 
  wire [2:0] pcie_auto_tl_out_xing_out_a_mem_5_opcode; 
  wire [2:0] pcie_auto_tl_out_xing_out_a_mem_5_param; 
  wire [2:0] pcie_auto_tl_out_xing_out_a_mem_5_size; 
  wire [3:0] pcie_auto_tl_out_xing_out_a_mem_5_source; 
  wire [37:0] pcie_auto_tl_out_xing_out_a_mem_5_address; 
  wire [7:0] pcie_auto_tl_out_xing_out_a_mem_5_mask; 
  wire [63:0] pcie_auto_tl_out_xing_out_a_mem_5_data; 
  wire  pcie_auto_tl_out_xing_out_a_mem_5_corrupt; 
  wire [2:0] pcie_auto_tl_out_xing_out_a_mem_6_opcode; 
  wire [2:0] pcie_auto_tl_out_xing_out_a_mem_6_param; 
  wire [2:0] pcie_auto_tl_out_xing_out_a_mem_6_size; 
  wire [3:0] pcie_auto_tl_out_xing_out_a_mem_6_source; 
  wire [37:0] pcie_auto_tl_out_xing_out_a_mem_6_address; 
  wire [7:0] pcie_auto_tl_out_xing_out_a_mem_6_mask; 
  wire [63:0] pcie_auto_tl_out_xing_out_a_mem_6_data; 
  wire  pcie_auto_tl_out_xing_out_a_mem_6_corrupt; 
  wire [2:0] pcie_auto_tl_out_xing_out_a_mem_7_opcode; 
  wire [2:0] pcie_auto_tl_out_xing_out_a_mem_7_param; 
  wire [2:0] pcie_auto_tl_out_xing_out_a_mem_7_size; 
  wire [3:0] pcie_auto_tl_out_xing_out_a_mem_7_source; 
  wire [37:0] pcie_auto_tl_out_xing_out_a_mem_7_address; 
  wire [7:0] pcie_auto_tl_out_xing_out_a_mem_7_mask; 
  wire [63:0] pcie_auto_tl_out_xing_out_a_mem_7_data; 
  wire  pcie_auto_tl_out_xing_out_a_mem_7_corrupt; 
  wire [3:0] pcie_auto_tl_out_xing_out_a_ridx; 
  wire [3:0] pcie_auto_tl_out_xing_out_a_widx; 
  wire  pcie_auto_tl_out_xing_out_a_safe_ridx_valid; 
  wire  pcie_auto_tl_out_xing_out_a_safe_widx_valid; 
  wire  pcie_auto_tl_out_xing_out_a_safe_source_reset_n; 
  wire  pcie_auto_tl_out_xing_out_a_safe_sink_reset_n; 
  wire [2:0] pcie_auto_tl_out_xing_out_d_mem_0_opcode; 
  wire [1:0] pcie_auto_tl_out_xing_out_d_mem_0_param; 
  wire [2:0] pcie_auto_tl_out_xing_out_d_mem_0_size; 
  wire [3:0] pcie_auto_tl_out_xing_out_d_mem_0_source; 
  wire [2:0] pcie_auto_tl_out_xing_out_d_mem_0_sink; 
  wire  pcie_auto_tl_out_xing_out_d_mem_0_denied; 
  wire [63:0] pcie_auto_tl_out_xing_out_d_mem_0_data; 
  wire  pcie_auto_tl_out_xing_out_d_mem_0_corrupt; 
  wire [2:0] pcie_auto_tl_out_xing_out_d_mem_1_opcode; 
  wire [1:0] pcie_auto_tl_out_xing_out_d_mem_1_param; 
  wire [2:0] pcie_auto_tl_out_xing_out_d_mem_1_size; 
  wire [3:0] pcie_auto_tl_out_xing_out_d_mem_1_source; 
  wire [2:0] pcie_auto_tl_out_xing_out_d_mem_1_sink; 
  wire  pcie_auto_tl_out_xing_out_d_mem_1_denied; 
  wire [63:0] pcie_auto_tl_out_xing_out_d_mem_1_data; 
  wire  pcie_auto_tl_out_xing_out_d_mem_1_corrupt; 
  wire [2:0] pcie_auto_tl_out_xing_out_d_mem_2_opcode; 
  wire [1:0] pcie_auto_tl_out_xing_out_d_mem_2_param; 
  wire [2:0] pcie_auto_tl_out_xing_out_d_mem_2_size; 
  wire [3:0] pcie_auto_tl_out_xing_out_d_mem_2_source; 
  wire [2:0] pcie_auto_tl_out_xing_out_d_mem_2_sink; 
  wire  pcie_auto_tl_out_xing_out_d_mem_2_denied; 
  wire [63:0] pcie_auto_tl_out_xing_out_d_mem_2_data; 
  wire  pcie_auto_tl_out_xing_out_d_mem_2_corrupt; 
  wire [2:0] pcie_auto_tl_out_xing_out_d_mem_3_opcode; 
  wire [1:0] pcie_auto_tl_out_xing_out_d_mem_3_param; 
  wire [2:0] pcie_auto_tl_out_xing_out_d_mem_3_size; 
  wire [3:0] pcie_auto_tl_out_xing_out_d_mem_3_source; 
  wire [2:0] pcie_auto_tl_out_xing_out_d_mem_3_sink; 
  wire  pcie_auto_tl_out_xing_out_d_mem_3_denied; 
  wire [63:0] pcie_auto_tl_out_xing_out_d_mem_3_data; 
  wire  pcie_auto_tl_out_xing_out_d_mem_3_corrupt; 
  wire [2:0] pcie_auto_tl_out_xing_out_d_mem_4_opcode; 
  wire [1:0] pcie_auto_tl_out_xing_out_d_mem_4_param; 
  wire [2:0] pcie_auto_tl_out_xing_out_d_mem_4_size; 
  wire [3:0] pcie_auto_tl_out_xing_out_d_mem_4_source; 
  wire [2:0] pcie_auto_tl_out_xing_out_d_mem_4_sink; 
  wire  pcie_auto_tl_out_xing_out_d_mem_4_denied; 
  wire [63:0] pcie_auto_tl_out_xing_out_d_mem_4_data; 
  wire  pcie_auto_tl_out_xing_out_d_mem_4_corrupt; 
  wire [2:0] pcie_auto_tl_out_xing_out_d_mem_5_opcode; 
  wire [1:0] pcie_auto_tl_out_xing_out_d_mem_5_param; 
  wire [2:0] pcie_auto_tl_out_xing_out_d_mem_5_size; 
  wire [3:0] pcie_auto_tl_out_xing_out_d_mem_5_source; 
  wire [2:0] pcie_auto_tl_out_xing_out_d_mem_5_sink; 
  wire  pcie_auto_tl_out_xing_out_d_mem_5_denied; 
  wire [63:0] pcie_auto_tl_out_xing_out_d_mem_5_data; 
  wire  pcie_auto_tl_out_xing_out_d_mem_5_corrupt; 
  wire [2:0] pcie_auto_tl_out_xing_out_d_mem_6_opcode; 
  wire [1:0] pcie_auto_tl_out_xing_out_d_mem_6_param; 
  wire [2:0] pcie_auto_tl_out_xing_out_d_mem_6_size; 
  wire [3:0] pcie_auto_tl_out_xing_out_d_mem_6_source; 
  wire [2:0] pcie_auto_tl_out_xing_out_d_mem_6_sink; 
  wire  pcie_auto_tl_out_xing_out_d_mem_6_denied; 
  wire [63:0] pcie_auto_tl_out_xing_out_d_mem_6_data; 
  wire  pcie_auto_tl_out_xing_out_d_mem_6_corrupt; 
  wire [2:0] pcie_auto_tl_out_xing_out_d_mem_7_opcode; 
  wire [1:0] pcie_auto_tl_out_xing_out_d_mem_7_param; 
  wire [2:0] pcie_auto_tl_out_xing_out_d_mem_7_size; 
  wire [3:0] pcie_auto_tl_out_xing_out_d_mem_7_source; 
  wire [2:0] pcie_auto_tl_out_xing_out_d_mem_7_sink; 
  wire  pcie_auto_tl_out_xing_out_d_mem_7_denied; 
  wire [63:0] pcie_auto_tl_out_xing_out_d_mem_7_data; 
  wire  pcie_auto_tl_out_xing_out_d_mem_7_corrupt; 
  wire [3:0] pcie_auto_tl_out_xing_out_d_ridx; 
  wire [3:0] pcie_auto_tl_out_xing_out_d_widx; 
  wire  pcie_auto_tl_out_xing_out_d_safe_ridx_valid; 
  wire  pcie_auto_tl_out_xing_out_d_safe_widx_valid; 
  wire  pcie_auto_tl_out_xing_out_d_safe_source_reset_n; 
  wire  pcie_auto_tl_out_xing_out_d_safe_sink_reset_n; 
  wire [2:0] pcie_auto_tl_in_xing_in_1_a_mem_0_opcode; 
  wire [2:0] pcie_auto_tl_in_xing_in_1_a_mem_0_param; 
  wire [2:0] pcie_auto_tl_in_xing_in_1_a_mem_0_size; 
  wire [4:0] pcie_auto_tl_in_xing_in_1_a_mem_0_source; 
  wire [37:0] pcie_auto_tl_in_xing_in_1_a_mem_0_address; 
  wire [3:0] pcie_auto_tl_in_xing_in_1_a_mem_0_mask; 
  wire [31:0] pcie_auto_tl_in_xing_in_1_a_mem_0_data; 
  wire  pcie_auto_tl_in_xing_in_1_a_mem_0_corrupt; 
  wire [2:0] pcie_auto_tl_in_xing_in_1_a_mem_1_opcode; 
  wire [2:0] pcie_auto_tl_in_xing_in_1_a_mem_1_param; 
  wire [2:0] pcie_auto_tl_in_xing_in_1_a_mem_1_size; 
  wire [4:0] pcie_auto_tl_in_xing_in_1_a_mem_1_source; 
  wire [37:0] pcie_auto_tl_in_xing_in_1_a_mem_1_address; 
  wire [3:0] pcie_auto_tl_in_xing_in_1_a_mem_1_mask; 
  wire [31:0] pcie_auto_tl_in_xing_in_1_a_mem_1_data; 
  wire  pcie_auto_tl_in_xing_in_1_a_mem_1_corrupt; 
  wire [2:0] pcie_auto_tl_in_xing_in_1_a_mem_2_opcode; 
  wire [2:0] pcie_auto_tl_in_xing_in_1_a_mem_2_param; 
  wire [2:0] pcie_auto_tl_in_xing_in_1_a_mem_2_size; 
  wire [4:0] pcie_auto_tl_in_xing_in_1_a_mem_2_source; 
  wire [37:0] pcie_auto_tl_in_xing_in_1_a_mem_2_address; 
  wire [3:0] pcie_auto_tl_in_xing_in_1_a_mem_2_mask; 
  wire [31:0] pcie_auto_tl_in_xing_in_1_a_mem_2_data; 
  wire  pcie_auto_tl_in_xing_in_1_a_mem_2_corrupt; 
  wire [2:0] pcie_auto_tl_in_xing_in_1_a_mem_3_opcode; 
  wire [2:0] pcie_auto_tl_in_xing_in_1_a_mem_3_param; 
  wire [2:0] pcie_auto_tl_in_xing_in_1_a_mem_3_size; 
  wire [4:0] pcie_auto_tl_in_xing_in_1_a_mem_3_source; 
  wire [37:0] pcie_auto_tl_in_xing_in_1_a_mem_3_address; 
  wire [3:0] pcie_auto_tl_in_xing_in_1_a_mem_3_mask; 
  wire [31:0] pcie_auto_tl_in_xing_in_1_a_mem_3_data; 
  wire  pcie_auto_tl_in_xing_in_1_a_mem_3_corrupt; 
  wire [2:0] pcie_auto_tl_in_xing_in_1_a_mem_4_opcode; 
  wire [2:0] pcie_auto_tl_in_xing_in_1_a_mem_4_param; 
  wire [2:0] pcie_auto_tl_in_xing_in_1_a_mem_4_size; 
  wire [4:0] pcie_auto_tl_in_xing_in_1_a_mem_4_source; 
  wire [37:0] pcie_auto_tl_in_xing_in_1_a_mem_4_address; 
  wire [3:0] pcie_auto_tl_in_xing_in_1_a_mem_4_mask; 
  wire [31:0] pcie_auto_tl_in_xing_in_1_a_mem_4_data; 
  wire  pcie_auto_tl_in_xing_in_1_a_mem_4_corrupt; 
  wire [2:0] pcie_auto_tl_in_xing_in_1_a_mem_5_opcode; 
  wire [2:0] pcie_auto_tl_in_xing_in_1_a_mem_5_param; 
  wire [2:0] pcie_auto_tl_in_xing_in_1_a_mem_5_size; 
  wire [4:0] pcie_auto_tl_in_xing_in_1_a_mem_5_source; 
  wire [37:0] pcie_auto_tl_in_xing_in_1_a_mem_5_address; 
  wire [3:0] pcie_auto_tl_in_xing_in_1_a_mem_5_mask; 
  wire [31:0] pcie_auto_tl_in_xing_in_1_a_mem_5_data; 
  wire  pcie_auto_tl_in_xing_in_1_a_mem_5_corrupt; 
  wire [2:0] pcie_auto_tl_in_xing_in_1_a_mem_6_opcode; 
  wire [2:0] pcie_auto_tl_in_xing_in_1_a_mem_6_param; 
  wire [2:0] pcie_auto_tl_in_xing_in_1_a_mem_6_size; 
  wire [4:0] pcie_auto_tl_in_xing_in_1_a_mem_6_source; 
  wire [37:0] pcie_auto_tl_in_xing_in_1_a_mem_6_address; 
  wire [3:0] pcie_auto_tl_in_xing_in_1_a_mem_6_mask; 
  wire [31:0] pcie_auto_tl_in_xing_in_1_a_mem_6_data; 
  wire  pcie_auto_tl_in_xing_in_1_a_mem_6_corrupt; 
  wire [2:0] pcie_auto_tl_in_xing_in_1_a_mem_7_opcode; 
  wire [2:0] pcie_auto_tl_in_xing_in_1_a_mem_7_param; 
  wire [2:0] pcie_auto_tl_in_xing_in_1_a_mem_7_size; 
  wire [4:0] pcie_auto_tl_in_xing_in_1_a_mem_7_source; 
  wire [37:0] pcie_auto_tl_in_xing_in_1_a_mem_7_address; 
  wire [3:0] pcie_auto_tl_in_xing_in_1_a_mem_7_mask; 
  wire [31:0] pcie_auto_tl_in_xing_in_1_a_mem_7_data; 
  wire  pcie_auto_tl_in_xing_in_1_a_mem_7_corrupt; 
  wire [3:0] pcie_auto_tl_in_xing_in_1_a_ridx; 
  wire [3:0] pcie_auto_tl_in_xing_in_1_a_widx; 
  wire  pcie_auto_tl_in_xing_in_1_a_safe_ridx_valid; 
  wire  pcie_auto_tl_in_xing_in_1_a_safe_widx_valid; 
  wire  pcie_auto_tl_in_xing_in_1_a_safe_source_reset_n; 
  wire  pcie_auto_tl_in_xing_in_1_a_safe_sink_reset_n; 
  wire [2:0] pcie_auto_tl_in_xing_in_1_d_mem_0_opcode; 
  wire [1:0] pcie_auto_tl_in_xing_in_1_d_mem_0_param; 
  wire [2:0] pcie_auto_tl_in_xing_in_1_d_mem_0_size; 
  wire [4:0] pcie_auto_tl_in_xing_in_1_d_mem_0_source; 
  wire  pcie_auto_tl_in_xing_in_1_d_mem_0_sink; 
  wire  pcie_auto_tl_in_xing_in_1_d_mem_0_denied; 
  wire [31:0] pcie_auto_tl_in_xing_in_1_d_mem_0_data; 
  wire  pcie_auto_tl_in_xing_in_1_d_mem_0_corrupt; 
  wire [2:0] pcie_auto_tl_in_xing_in_1_d_mem_1_opcode; 
  wire [1:0] pcie_auto_tl_in_xing_in_1_d_mem_1_param; 
  wire [2:0] pcie_auto_tl_in_xing_in_1_d_mem_1_size; 
  wire [4:0] pcie_auto_tl_in_xing_in_1_d_mem_1_source; 
  wire  pcie_auto_tl_in_xing_in_1_d_mem_1_sink; 
  wire  pcie_auto_tl_in_xing_in_1_d_mem_1_denied; 
  wire [31:0] pcie_auto_tl_in_xing_in_1_d_mem_1_data; 
  wire  pcie_auto_tl_in_xing_in_1_d_mem_1_corrupt; 
  wire [2:0] pcie_auto_tl_in_xing_in_1_d_mem_2_opcode; 
  wire [1:0] pcie_auto_tl_in_xing_in_1_d_mem_2_param; 
  wire [2:0] pcie_auto_tl_in_xing_in_1_d_mem_2_size; 
  wire [4:0] pcie_auto_tl_in_xing_in_1_d_mem_2_source; 
  wire  pcie_auto_tl_in_xing_in_1_d_mem_2_sink; 
  wire  pcie_auto_tl_in_xing_in_1_d_mem_2_denied; 
  wire [31:0] pcie_auto_tl_in_xing_in_1_d_mem_2_data; 
  wire  pcie_auto_tl_in_xing_in_1_d_mem_2_corrupt; 
  wire [2:0] pcie_auto_tl_in_xing_in_1_d_mem_3_opcode; 
  wire [1:0] pcie_auto_tl_in_xing_in_1_d_mem_3_param; 
  wire [2:0] pcie_auto_tl_in_xing_in_1_d_mem_3_size; 
  wire [4:0] pcie_auto_tl_in_xing_in_1_d_mem_3_source; 
  wire  pcie_auto_tl_in_xing_in_1_d_mem_3_sink; 
  wire  pcie_auto_tl_in_xing_in_1_d_mem_3_denied; 
  wire [31:0] pcie_auto_tl_in_xing_in_1_d_mem_3_data; 
  wire  pcie_auto_tl_in_xing_in_1_d_mem_3_corrupt; 
  wire [2:0] pcie_auto_tl_in_xing_in_1_d_mem_4_opcode; 
  wire [1:0] pcie_auto_tl_in_xing_in_1_d_mem_4_param; 
  wire [2:0] pcie_auto_tl_in_xing_in_1_d_mem_4_size; 
  wire [4:0] pcie_auto_tl_in_xing_in_1_d_mem_4_source; 
  wire  pcie_auto_tl_in_xing_in_1_d_mem_4_sink; 
  wire  pcie_auto_tl_in_xing_in_1_d_mem_4_denied; 
  wire [31:0] pcie_auto_tl_in_xing_in_1_d_mem_4_data; 
  wire  pcie_auto_tl_in_xing_in_1_d_mem_4_corrupt; 
  wire [2:0] pcie_auto_tl_in_xing_in_1_d_mem_5_opcode; 
  wire [1:0] pcie_auto_tl_in_xing_in_1_d_mem_5_param; 
  wire [2:0] pcie_auto_tl_in_xing_in_1_d_mem_5_size; 
  wire [4:0] pcie_auto_tl_in_xing_in_1_d_mem_5_source; 
  wire  pcie_auto_tl_in_xing_in_1_d_mem_5_sink; 
  wire  pcie_auto_tl_in_xing_in_1_d_mem_5_denied; 
  wire [31:0] pcie_auto_tl_in_xing_in_1_d_mem_5_data; 
  wire  pcie_auto_tl_in_xing_in_1_d_mem_5_corrupt; 
  wire [2:0] pcie_auto_tl_in_xing_in_1_d_mem_6_opcode; 
  wire [1:0] pcie_auto_tl_in_xing_in_1_d_mem_6_param; 
  wire [2:0] pcie_auto_tl_in_xing_in_1_d_mem_6_size; 
  wire [4:0] pcie_auto_tl_in_xing_in_1_d_mem_6_source; 
  wire  pcie_auto_tl_in_xing_in_1_d_mem_6_sink; 
  wire  pcie_auto_tl_in_xing_in_1_d_mem_6_denied; 
  wire [31:0] pcie_auto_tl_in_xing_in_1_d_mem_6_data; 
  wire  pcie_auto_tl_in_xing_in_1_d_mem_6_corrupt; 
  wire [2:0] pcie_auto_tl_in_xing_in_1_d_mem_7_opcode; 
  wire [1:0] pcie_auto_tl_in_xing_in_1_d_mem_7_param; 
  wire [2:0] pcie_auto_tl_in_xing_in_1_d_mem_7_size; 
  wire [4:0] pcie_auto_tl_in_xing_in_1_d_mem_7_source; 
  wire  pcie_auto_tl_in_xing_in_1_d_mem_7_sink; 
  wire  pcie_auto_tl_in_xing_in_1_d_mem_7_denied; 
  wire [31:0] pcie_auto_tl_in_xing_in_1_d_mem_7_data; 
  wire  pcie_auto_tl_in_xing_in_1_d_mem_7_corrupt; 
  wire [3:0] pcie_auto_tl_in_xing_in_1_d_ridx; 
  wire [3:0] pcie_auto_tl_in_xing_in_1_d_widx; 
  wire  pcie_auto_tl_in_xing_in_1_d_safe_ridx_valid; 
  wire  pcie_auto_tl_in_xing_in_1_d_safe_widx_valid; 
  wire  pcie_auto_tl_in_xing_in_1_d_safe_source_reset_n; 
  wire  pcie_auto_tl_in_xing_in_1_d_safe_sink_reset_n; 
  wire [2:0] pcie_auto_tl_in_xing_in_0_a_mem_0_opcode; 
  wire [2:0] pcie_auto_tl_in_xing_in_0_a_mem_0_param; 
  wire [2:0] pcie_auto_tl_in_xing_in_0_a_mem_0_size; 
  wire [4:0] pcie_auto_tl_in_xing_in_0_a_mem_0_source; 
  wire [30:0] pcie_auto_tl_in_xing_in_0_a_mem_0_address; 
  wire [7:0] pcie_auto_tl_in_xing_in_0_a_mem_0_mask; 
  wire [63:0] pcie_auto_tl_in_xing_in_0_a_mem_0_data; 
  wire  pcie_auto_tl_in_xing_in_0_a_mem_0_corrupt; 
  wire [2:0] pcie_auto_tl_in_xing_in_0_a_mem_1_opcode; 
  wire [2:0] pcie_auto_tl_in_xing_in_0_a_mem_1_param; 
  wire [2:0] pcie_auto_tl_in_xing_in_0_a_mem_1_size; 
  wire [4:0] pcie_auto_tl_in_xing_in_0_a_mem_1_source; 
  wire [30:0] pcie_auto_tl_in_xing_in_0_a_mem_1_address; 
  wire [7:0] pcie_auto_tl_in_xing_in_0_a_mem_1_mask; 
  wire [63:0] pcie_auto_tl_in_xing_in_0_a_mem_1_data; 
  wire  pcie_auto_tl_in_xing_in_0_a_mem_1_corrupt; 
  wire [2:0] pcie_auto_tl_in_xing_in_0_a_mem_2_opcode; 
  wire [2:0] pcie_auto_tl_in_xing_in_0_a_mem_2_param; 
  wire [2:0] pcie_auto_tl_in_xing_in_0_a_mem_2_size; 
  wire [4:0] pcie_auto_tl_in_xing_in_0_a_mem_2_source; 
  wire [30:0] pcie_auto_tl_in_xing_in_0_a_mem_2_address; 
  wire [7:0] pcie_auto_tl_in_xing_in_0_a_mem_2_mask; 
  wire [63:0] pcie_auto_tl_in_xing_in_0_a_mem_2_data; 
  wire  pcie_auto_tl_in_xing_in_0_a_mem_2_corrupt; 
  wire [2:0] pcie_auto_tl_in_xing_in_0_a_mem_3_opcode; 
  wire [2:0] pcie_auto_tl_in_xing_in_0_a_mem_3_param; 
  wire [2:0] pcie_auto_tl_in_xing_in_0_a_mem_3_size; 
  wire [4:0] pcie_auto_tl_in_xing_in_0_a_mem_3_source; 
  wire [30:0] pcie_auto_tl_in_xing_in_0_a_mem_3_address; 
  wire [7:0] pcie_auto_tl_in_xing_in_0_a_mem_3_mask; 
  wire [63:0] pcie_auto_tl_in_xing_in_0_a_mem_3_data; 
  wire  pcie_auto_tl_in_xing_in_0_a_mem_3_corrupt; 
  wire [2:0] pcie_auto_tl_in_xing_in_0_a_mem_4_opcode; 
  wire [2:0] pcie_auto_tl_in_xing_in_0_a_mem_4_param; 
  wire [2:0] pcie_auto_tl_in_xing_in_0_a_mem_4_size; 
  wire [4:0] pcie_auto_tl_in_xing_in_0_a_mem_4_source; 
  wire [30:0] pcie_auto_tl_in_xing_in_0_a_mem_4_address; 
  wire [7:0] pcie_auto_tl_in_xing_in_0_a_mem_4_mask; 
  wire [63:0] pcie_auto_tl_in_xing_in_0_a_mem_4_data; 
  wire  pcie_auto_tl_in_xing_in_0_a_mem_4_corrupt; 
  wire [2:0] pcie_auto_tl_in_xing_in_0_a_mem_5_opcode; 
  wire [2:0] pcie_auto_tl_in_xing_in_0_a_mem_5_param; 
  wire [2:0] pcie_auto_tl_in_xing_in_0_a_mem_5_size; 
  wire [4:0] pcie_auto_tl_in_xing_in_0_a_mem_5_source; 
  wire [30:0] pcie_auto_tl_in_xing_in_0_a_mem_5_address; 
  wire [7:0] pcie_auto_tl_in_xing_in_0_a_mem_5_mask; 
  wire [63:0] pcie_auto_tl_in_xing_in_0_a_mem_5_data; 
  wire  pcie_auto_tl_in_xing_in_0_a_mem_5_corrupt; 
  wire [2:0] pcie_auto_tl_in_xing_in_0_a_mem_6_opcode; 
  wire [2:0] pcie_auto_tl_in_xing_in_0_a_mem_6_param; 
  wire [2:0] pcie_auto_tl_in_xing_in_0_a_mem_6_size; 
  wire [4:0] pcie_auto_tl_in_xing_in_0_a_mem_6_source; 
  wire [30:0] pcie_auto_tl_in_xing_in_0_a_mem_6_address; 
  wire [7:0] pcie_auto_tl_in_xing_in_0_a_mem_6_mask; 
  wire [63:0] pcie_auto_tl_in_xing_in_0_a_mem_6_data; 
  wire  pcie_auto_tl_in_xing_in_0_a_mem_6_corrupt; 
  wire [2:0] pcie_auto_tl_in_xing_in_0_a_mem_7_opcode; 
  wire [2:0] pcie_auto_tl_in_xing_in_0_a_mem_7_param; 
  wire [2:0] pcie_auto_tl_in_xing_in_0_a_mem_7_size; 
  wire [4:0] pcie_auto_tl_in_xing_in_0_a_mem_7_source; 
  wire [30:0] pcie_auto_tl_in_xing_in_0_a_mem_7_address; 
  wire [7:0] pcie_auto_tl_in_xing_in_0_a_mem_7_mask; 
  wire [63:0] pcie_auto_tl_in_xing_in_0_a_mem_7_data; 
  wire  pcie_auto_tl_in_xing_in_0_a_mem_7_corrupt; 
  wire [3:0] pcie_auto_tl_in_xing_in_0_a_ridx; 
  wire [3:0] pcie_auto_tl_in_xing_in_0_a_widx; 
  wire  pcie_auto_tl_in_xing_in_0_a_safe_ridx_valid; 
  wire  pcie_auto_tl_in_xing_in_0_a_safe_widx_valid; 
  wire  pcie_auto_tl_in_xing_in_0_a_safe_source_reset_n; 
  wire  pcie_auto_tl_in_xing_in_0_a_safe_sink_reset_n; 
  wire [2:0] pcie_auto_tl_in_xing_in_0_d_mem_0_opcode; 
  wire [1:0] pcie_auto_tl_in_xing_in_0_d_mem_0_param; 
  wire [2:0] pcie_auto_tl_in_xing_in_0_d_mem_0_size; 
  wire [4:0] pcie_auto_tl_in_xing_in_0_d_mem_0_source; 
  wire  pcie_auto_tl_in_xing_in_0_d_mem_0_sink; 
  wire  pcie_auto_tl_in_xing_in_0_d_mem_0_denied; 
  wire [63:0] pcie_auto_tl_in_xing_in_0_d_mem_0_data; 
  wire  pcie_auto_tl_in_xing_in_0_d_mem_0_corrupt; 
  wire [2:0] pcie_auto_tl_in_xing_in_0_d_mem_1_opcode; 
  wire [1:0] pcie_auto_tl_in_xing_in_0_d_mem_1_param; 
  wire [2:0] pcie_auto_tl_in_xing_in_0_d_mem_1_size; 
  wire [4:0] pcie_auto_tl_in_xing_in_0_d_mem_1_source; 
  wire  pcie_auto_tl_in_xing_in_0_d_mem_1_sink; 
  wire  pcie_auto_tl_in_xing_in_0_d_mem_1_denied; 
  wire [63:0] pcie_auto_tl_in_xing_in_0_d_mem_1_data; 
  wire  pcie_auto_tl_in_xing_in_0_d_mem_1_corrupt; 
  wire [2:0] pcie_auto_tl_in_xing_in_0_d_mem_2_opcode; 
  wire [1:0] pcie_auto_tl_in_xing_in_0_d_mem_2_param; 
  wire [2:0] pcie_auto_tl_in_xing_in_0_d_mem_2_size; 
  wire [4:0] pcie_auto_tl_in_xing_in_0_d_mem_2_source; 
  wire  pcie_auto_tl_in_xing_in_0_d_mem_2_sink; 
  wire  pcie_auto_tl_in_xing_in_0_d_mem_2_denied; 
  wire [63:0] pcie_auto_tl_in_xing_in_0_d_mem_2_data; 
  wire  pcie_auto_tl_in_xing_in_0_d_mem_2_corrupt; 
  wire [2:0] pcie_auto_tl_in_xing_in_0_d_mem_3_opcode; 
  wire [1:0] pcie_auto_tl_in_xing_in_0_d_mem_3_param; 
  wire [2:0] pcie_auto_tl_in_xing_in_0_d_mem_3_size; 
  wire [4:0] pcie_auto_tl_in_xing_in_0_d_mem_3_source; 
  wire  pcie_auto_tl_in_xing_in_0_d_mem_3_sink; 
  wire  pcie_auto_tl_in_xing_in_0_d_mem_3_denied; 
  wire [63:0] pcie_auto_tl_in_xing_in_0_d_mem_3_data; 
  wire  pcie_auto_tl_in_xing_in_0_d_mem_3_corrupt; 
  wire [2:0] pcie_auto_tl_in_xing_in_0_d_mem_4_opcode; 
  wire [1:0] pcie_auto_tl_in_xing_in_0_d_mem_4_param; 
  wire [2:0] pcie_auto_tl_in_xing_in_0_d_mem_4_size; 
  wire [4:0] pcie_auto_tl_in_xing_in_0_d_mem_4_source; 
  wire  pcie_auto_tl_in_xing_in_0_d_mem_4_sink; 
  wire  pcie_auto_tl_in_xing_in_0_d_mem_4_denied; 
  wire [63:0] pcie_auto_tl_in_xing_in_0_d_mem_4_data; 
  wire  pcie_auto_tl_in_xing_in_0_d_mem_4_corrupt; 
  wire [2:0] pcie_auto_tl_in_xing_in_0_d_mem_5_opcode; 
  wire [1:0] pcie_auto_tl_in_xing_in_0_d_mem_5_param; 
  wire [2:0] pcie_auto_tl_in_xing_in_0_d_mem_5_size; 
  wire [4:0] pcie_auto_tl_in_xing_in_0_d_mem_5_source; 
  wire  pcie_auto_tl_in_xing_in_0_d_mem_5_sink; 
  wire  pcie_auto_tl_in_xing_in_0_d_mem_5_denied; 
  wire [63:0] pcie_auto_tl_in_xing_in_0_d_mem_5_data; 
  wire  pcie_auto_tl_in_xing_in_0_d_mem_5_corrupt; 
  wire [2:0] pcie_auto_tl_in_xing_in_0_d_mem_6_opcode; 
  wire [1:0] pcie_auto_tl_in_xing_in_0_d_mem_6_param; 
  wire [2:0] pcie_auto_tl_in_xing_in_0_d_mem_6_size; 
  wire [4:0] pcie_auto_tl_in_xing_in_0_d_mem_6_source; 
  wire  pcie_auto_tl_in_xing_in_0_d_mem_6_sink; 
  wire  pcie_auto_tl_in_xing_in_0_d_mem_6_denied; 
  wire [63:0] pcie_auto_tl_in_xing_in_0_d_mem_6_data; 
  wire  pcie_auto_tl_in_xing_in_0_d_mem_6_corrupt; 
  wire [2:0] pcie_auto_tl_in_xing_in_0_d_mem_7_opcode; 
  wire [1:0] pcie_auto_tl_in_xing_in_0_d_mem_7_param; 
  wire [2:0] pcie_auto_tl_in_xing_in_0_d_mem_7_size; 
  wire [4:0] pcie_auto_tl_in_xing_in_0_d_mem_7_source; 
  wire  pcie_auto_tl_in_xing_in_0_d_mem_7_sink; 
  wire  pcie_auto_tl_in_xing_in_0_d_mem_7_denied; 
  wire [63:0] pcie_auto_tl_in_xing_in_0_d_mem_7_data; 
  wire  pcie_auto_tl_in_xing_in_0_d_mem_7_corrupt; 
  wire [3:0] pcie_auto_tl_in_xing_in_0_d_ridx; 
  wire [3:0] pcie_auto_tl_in_xing_in_0_d_widx; 
  wire  pcie_auto_tl_in_xing_in_0_d_safe_ridx_valid; 
  wire  pcie_auto_tl_in_xing_in_0_d_safe_widx_valid; 
  wire  pcie_auto_tl_in_xing_in_0_d_safe_source_reset_n; 
  wire  pcie_auto_tl_in_xing_in_0_d_safe_sink_reset_n; 
  wire  pcie_io_port_REFCLK_rxp; 
  wire  pcie_io_port_REFCLK_rxn; 
  wire  pcie_io_port_pci_exp_txp; 
  wire  pcie_io_port_pci_exp_txn; 
  wire  pcie_io_port_pci_exp_rxp; 
  wire  pcie_io_port_pci_exp_rxn; 
  wire  pcie_io_port_axi_aresetn; 
  wire  pcie_io_port_axi_aclk_out; 
  wire  pcie_io_port_mmcm_lock; 
  wire  asource_clock; 
  wire  asource_reset; 
  wire  asource_auto_in_a_ready; 
  wire  asource_auto_in_a_valid; 
  wire [2:0] asource_auto_in_a_bits_opcode; 
  wire [2:0] asource_auto_in_a_bits_param; 
  wire [2:0] asource_auto_in_a_bits_size; 
  wire [4:0] asource_auto_in_a_bits_source; 
  wire [30:0] asource_auto_in_a_bits_address; 
  wire [7:0] asource_auto_in_a_bits_mask; 
  wire [63:0] asource_auto_in_a_bits_data; 
  wire  asource_auto_in_a_bits_corrupt; 
  wire  asource_auto_in_d_ready; 
  wire  asource_auto_in_d_valid; 
  wire [2:0] asource_auto_in_d_bits_opcode; 
  wire [1:0] asource_auto_in_d_bits_param; 
  wire [2:0] asource_auto_in_d_bits_size; 
  wire [4:0] asource_auto_in_d_bits_source; 
  wire  asource_auto_in_d_bits_sink; 
  wire  asource_auto_in_d_bits_denied; 
  wire [63:0] asource_auto_in_d_bits_data; 
  wire  asource_auto_in_d_bits_corrupt; 
  wire [2:0] asource_auto_out_a_mem_0_opcode; 
  wire [2:0] asource_auto_out_a_mem_0_param; 
  wire [2:0] asource_auto_out_a_mem_0_size; 
  wire [4:0] asource_auto_out_a_mem_0_source; 
  wire [30:0] asource_auto_out_a_mem_0_address; 
  wire [7:0] asource_auto_out_a_mem_0_mask; 
  wire [63:0] asource_auto_out_a_mem_0_data; 
  wire  asource_auto_out_a_mem_0_corrupt; 
  wire [2:0] asource_auto_out_a_mem_1_opcode; 
  wire [2:0] asource_auto_out_a_mem_1_param; 
  wire [2:0] asource_auto_out_a_mem_1_size; 
  wire [4:0] asource_auto_out_a_mem_1_source; 
  wire [30:0] asource_auto_out_a_mem_1_address; 
  wire [7:0] asource_auto_out_a_mem_1_mask; 
  wire [63:0] asource_auto_out_a_mem_1_data; 
  wire  asource_auto_out_a_mem_1_corrupt; 
  wire [2:0] asource_auto_out_a_mem_2_opcode; 
  wire [2:0] asource_auto_out_a_mem_2_param; 
  wire [2:0] asource_auto_out_a_mem_2_size; 
  wire [4:0] asource_auto_out_a_mem_2_source; 
  wire [30:0] asource_auto_out_a_mem_2_address; 
  wire [7:0] asource_auto_out_a_mem_2_mask; 
  wire [63:0] asource_auto_out_a_mem_2_data; 
  wire  asource_auto_out_a_mem_2_corrupt; 
  wire [2:0] asource_auto_out_a_mem_3_opcode; 
  wire [2:0] asource_auto_out_a_mem_3_param; 
  wire [2:0] asource_auto_out_a_mem_3_size; 
  wire [4:0] asource_auto_out_a_mem_3_source; 
  wire [30:0] asource_auto_out_a_mem_3_address; 
  wire [7:0] asource_auto_out_a_mem_3_mask; 
  wire [63:0] asource_auto_out_a_mem_3_data; 
  wire  asource_auto_out_a_mem_3_corrupt; 
  wire [2:0] asource_auto_out_a_mem_4_opcode; 
  wire [2:0] asource_auto_out_a_mem_4_param; 
  wire [2:0] asource_auto_out_a_mem_4_size; 
  wire [4:0] asource_auto_out_a_mem_4_source; 
  wire [30:0] asource_auto_out_a_mem_4_address; 
  wire [7:0] asource_auto_out_a_mem_4_mask; 
  wire [63:0] asource_auto_out_a_mem_4_data; 
  wire  asource_auto_out_a_mem_4_corrupt; 
  wire [2:0] asource_auto_out_a_mem_5_opcode; 
  wire [2:0] asource_auto_out_a_mem_5_param; 
  wire [2:0] asource_auto_out_a_mem_5_size; 
  wire [4:0] asource_auto_out_a_mem_5_source; 
  wire [30:0] asource_auto_out_a_mem_5_address; 
  wire [7:0] asource_auto_out_a_mem_5_mask; 
  wire [63:0] asource_auto_out_a_mem_5_data; 
  wire  asource_auto_out_a_mem_5_corrupt; 
  wire [2:0] asource_auto_out_a_mem_6_opcode; 
  wire [2:0] asource_auto_out_a_mem_6_param; 
  wire [2:0] asource_auto_out_a_mem_6_size; 
  wire [4:0] asource_auto_out_a_mem_6_source; 
  wire [30:0] asource_auto_out_a_mem_6_address; 
  wire [7:0] asource_auto_out_a_mem_6_mask; 
  wire [63:0] asource_auto_out_a_mem_6_data; 
  wire  asource_auto_out_a_mem_6_corrupt; 
  wire [2:0] asource_auto_out_a_mem_7_opcode; 
  wire [2:0] asource_auto_out_a_mem_7_param; 
  wire [2:0] asource_auto_out_a_mem_7_size; 
  wire [4:0] asource_auto_out_a_mem_7_source; 
  wire [30:0] asource_auto_out_a_mem_7_address; 
  wire [7:0] asource_auto_out_a_mem_7_mask; 
  wire [63:0] asource_auto_out_a_mem_7_data; 
  wire  asource_auto_out_a_mem_7_corrupt; 
  wire [3:0] asource_auto_out_a_ridx; 
  wire [3:0] asource_auto_out_a_widx; 
  wire  asource_auto_out_a_safe_ridx_valid; 
  wire  asource_auto_out_a_safe_widx_valid; 
  wire  asource_auto_out_a_safe_source_reset_n; 
  wire  asource_auto_out_a_safe_sink_reset_n; 
  wire [2:0] asource_auto_out_d_mem_0_opcode; 
  wire [1:0] asource_auto_out_d_mem_0_param; 
  wire [2:0] asource_auto_out_d_mem_0_size; 
  wire [4:0] asource_auto_out_d_mem_0_source; 
  wire  asource_auto_out_d_mem_0_sink; 
  wire  asource_auto_out_d_mem_0_denied; 
  wire [63:0] asource_auto_out_d_mem_0_data; 
  wire  asource_auto_out_d_mem_0_corrupt; 
  wire [2:0] asource_auto_out_d_mem_1_opcode; 
  wire [1:0] asource_auto_out_d_mem_1_param; 
  wire [2:0] asource_auto_out_d_mem_1_size; 
  wire [4:0] asource_auto_out_d_mem_1_source; 
  wire  asource_auto_out_d_mem_1_sink; 
  wire  asource_auto_out_d_mem_1_denied; 
  wire [63:0] asource_auto_out_d_mem_1_data; 
  wire  asource_auto_out_d_mem_1_corrupt; 
  wire [2:0] asource_auto_out_d_mem_2_opcode; 
  wire [1:0] asource_auto_out_d_mem_2_param; 
  wire [2:0] asource_auto_out_d_mem_2_size; 
  wire [4:0] asource_auto_out_d_mem_2_source; 
  wire  asource_auto_out_d_mem_2_sink; 
  wire  asource_auto_out_d_mem_2_denied; 
  wire [63:0] asource_auto_out_d_mem_2_data; 
  wire  asource_auto_out_d_mem_2_corrupt; 
  wire [2:0] asource_auto_out_d_mem_3_opcode; 
  wire [1:0] asource_auto_out_d_mem_3_param; 
  wire [2:0] asource_auto_out_d_mem_3_size; 
  wire [4:0] asource_auto_out_d_mem_3_source; 
  wire  asource_auto_out_d_mem_3_sink; 
  wire  asource_auto_out_d_mem_3_denied; 
  wire [63:0] asource_auto_out_d_mem_3_data; 
  wire  asource_auto_out_d_mem_3_corrupt; 
  wire [2:0] asource_auto_out_d_mem_4_opcode; 
  wire [1:0] asource_auto_out_d_mem_4_param; 
  wire [2:0] asource_auto_out_d_mem_4_size; 
  wire [4:0] asource_auto_out_d_mem_4_source; 
  wire  asource_auto_out_d_mem_4_sink; 
  wire  asource_auto_out_d_mem_4_denied; 
  wire [63:0] asource_auto_out_d_mem_4_data; 
  wire  asource_auto_out_d_mem_4_corrupt; 
  wire [2:0] asource_auto_out_d_mem_5_opcode; 
  wire [1:0] asource_auto_out_d_mem_5_param; 
  wire [2:0] asource_auto_out_d_mem_5_size; 
  wire [4:0] asource_auto_out_d_mem_5_source; 
  wire  asource_auto_out_d_mem_5_sink; 
  wire  asource_auto_out_d_mem_5_denied; 
  wire [63:0] asource_auto_out_d_mem_5_data; 
  wire  asource_auto_out_d_mem_5_corrupt; 
  wire [2:0] asource_auto_out_d_mem_6_opcode; 
  wire [1:0] asource_auto_out_d_mem_6_param; 
  wire [2:0] asource_auto_out_d_mem_6_size; 
  wire [4:0] asource_auto_out_d_mem_6_source; 
  wire  asource_auto_out_d_mem_6_sink; 
  wire  asource_auto_out_d_mem_6_denied; 
  wire [63:0] asource_auto_out_d_mem_6_data; 
  wire  asource_auto_out_d_mem_6_corrupt; 
  wire [2:0] asource_auto_out_d_mem_7_opcode; 
  wire [1:0] asource_auto_out_d_mem_7_param; 
  wire [2:0] asource_auto_out_d_mem_7_size; 
  wire [4:0] asource_auto_out_d_mem_7_source; 
  wire  asource_auto_out_d_mem_7_sink; 
  wire  asource_auto_out_d_mem_7_denied; 
  wire [63:0] asource_auto_out_d_mem_7_data; 
  wire  asource_auto_out_d_mem_7_corrupt; 
  wire [3:0] asource_auto_out_d_ridx; 
  wire [3:0] asource_auto_out_d_widx; 
  wire  asource_auto_out_d_safe_ridx_valid; 
  wire  asource_auto_out_d_safe_widx_valid; 
  wire  asource_auto_out_d_safe_source_reset_n; 
  wire  asource_auto_out_d_safe_sink_reset_n; 
  wire  asource_1_clock; 
  wire  asource_1_reset; 
  wire  asource_1_auto_in_a_ready; 
  wire  asource_1_auto_in_a_valid; 
  wire [2:0] asource_1_auto_in_a_bits_opcode; 
  wire [2:0] asource_1_auto_in_a_bits_param; 
  wire [2:0] asource_1_auto_in_a_bits_size; 
  wire [4:0] asource_1_auto_in_a_bits_source; 
  wire [37:0] asource_1_auto_in_a_bits_address; 
  wire [3:0] asource_1_auto_in_a_bits_mask; 
  wire [31:0] asource_1_auto_in_a_bits_data; 
  wire  asource_1_auto_in_a_bits_corrupt; 
  wire  asource_1_auto_in_d_ready; 
  wire  asource_1_auto_in_d_valid; 
  wire [2:0] asource_1_auto_in_d_bits_opcode; 
  wire [1:0] asource_1_auto_in_d_bits_param; 
  wire [2:0] asource_1_auto_in_d_bits_size; 
  wire [4:0] asource_1_auto_in_d_bits_source; 
  wire  asource_1_auto_in_d_bits_sink; 
  wire  asource_1_auto_in_d_bits_denied; 
  wire [31:0] asource_1_auto_in_d_bits_data; 
  wire  asource_1_auto_in_d_bits_corrupt; 
  wire [2:0] asource_1_auto_out_a_mem_0_opcode; 
  wire [2:0] asource_1_auto_out_a_mem_0_param; 
  wire [2:0] asource_1_auto_out_a_mem_0_size; 
  wire [4:0] asource_1_auto_out_a_mem_0_source; 
  wire [37:0] asource_1_auto_out_a_mem_0_address; 
  wire [3:0] asource_1_auto_out_a_mem_0_mask; 
  wire [31:0] asource_1_auto_out_a_mem_0_data; 
  wire  asource_1_auto_out_a_mem_0_corrupt; 
  wire [2:0] asource_1_auto_out_a_mem_1_opcode; 
  wire [2:0] asource_1_auto_out_a_mem_1_param; 
  wire [2:0] asource_1_auto_out_a_mem_1_size; 
  wire [4:0] asource_1_auto_out_a_mem_1_source; 
  wire [37:0] asource_1_auto_out_a_mem_1_address; 
  wire [3:0] asource_1_auto_out_a_mem_1_mask; 
  wire [31:0] asource_1_auto_out_a_mem_1_data; 
  wire  asource_1_auto_out_a_mem_1_corrupt; 
  wire [2:0] asource_1_auto_out_a_mem_2_opcode; 
  wire [2:0] asource_1_auto_out_a_mem_2_param; 
  wire [2:0] asource_1_auto_out_a_mem_2_size; 
  wire [4:0] asource_1_auto_out_a_mem_2_source; 
  wire [37:0] asource_1_auto_out_a_mem_2_address; 
  wire [3:0] asource_1_auto_out_a_mem_2_mask; 
  wire [31:0] asource_1_auto_out_a_mem_2_data; 
  wire  asource_1_auto_out_a_mem_2_corrupt; 
  wire [2:0] asource_1_auto_out_a_mem_3_opcode; 
  wire [2:0] asource_1_auto_out_a_mem_3_param; 
  wire [2:0] asource_1_auto_out_a_mem_3_size; 
  wire [4:0] asource_1_auto_out_a_mem_3_source; 
  wire [37:0] asource_1_auto_out_a_mem_3_address; 
  wire [3:0] asource_1_auto_out_a_mem_3_mask; 
  wire [31:0] asource_1_auto_out_a_mem_3_data; 
  wire  asource_1_auto_out_a_mem_3_corrupt; 
  wire [2:0] asource_1_auto_out_a_mem_4_opcode; 
  wire [2:0] asource_1_auto_out_a_mem_4_param; 
  wire [2:0] asource_1_auto_out_a_mem_4_size; 
  wire [4:0] asource_1_auto_out_a_mem_4_source; 
  wire [37:0] asource_1_auto_out_a_mem_4_address; 
  wire [3:0] asource_1_auto_out_a_mem_4_mask; 
  wire [31:0] asource_1_auto_out_a_mem_4_data; 
  wire  asource_1_auto_out_a_mem_4_corrupt; 
  wire [2:0] asource_1_auto_out_a_mem_5_opcode; 
  wire [2:0] asource_1_auto_out_a_mem_5_param; 
  wire [2:0] asource_1_auto_out_a_mem_5_size; 
  wire [4:0] asource_1_auto_out_a_mem_5_source; 
  wire [37:0] asource_1_auto_out_a_mem_5_address; 
  wire [3:0] asource_1_auto_out_a_mem_5_mask; 
  wire [31:0] asource_1_auto_out_a_mem_5_data; 
  wire  asource_1_auto_out_a_mem_5_corrupt; 
  wire [2:0] asource_1_auto_out_a_mem_6_opcode; 
  wire [2:0] asource_1_auto_out_a_mem_6_param; 
  wire [2:0] asource_1_auto_out_a_mem_6_size; 
  wire [4:0] asource_1_auto_out_a_mem_6_source; 
  wire [37:0] asource_1_auto_out_a_mem_6_address; 
  wire [3:0] asource_1_auto_out_a_mem_6_mask; 
  wire [31:0] asource_1_auto_out_a_mem_6_data; 
  wire  asource_1_auto_out_a_mem_6_corrupt; 
  wire [2:0] asource_1_auto_out_a_mem_7_opcode; 
  wire [2:0] asource_1_auto_out_a_mem_7_param; 
  wire [2:0] asource_1_auto_out_a_mem_7_size; 
  wire [4:0] asource_1_auto_out_a_mem_7_source; 
  wire [37:0] asource_1_auto_out_a_mem_7_address; 
  wire [3:0] asource_1_auto_out_a_mem_7_mask; 
  wire [31:0] asource_1_auto_out_a_mem_7_data; 
  wire  asource_1_auto_out_a_mem_7_corrupt; 
  wire [3:0] asource_1_auto_out_a_ridx; 
  wire [3:0] asource_1_auto_out_a_widx; 
  wire  asource_1_auto_out_a_safe_ridx_valid; 
  wire  asource_1_auto_out_a_safe_widx_valid; 
  wire  asource_1_auto_out_a_safe_source_reset_n; 
  wire  asource_1_auto_out_a_safe_sink_reset_n; 
  wire [2:0] asource_1_auto_out_d_mem_0_opcode; 
  wire [1:0] asource_1_auto_out_d_mem_0_param; 
  wire [2:0] asource_1_auto_out_d_mem_0_size; 
  wire [4:0] asource_1_auto_out_d_mem_0_source; 
  wire  asource_1_auto_out_d_mem_0_sink; 
  wire  asource_1_auto_out_d_mem_0_denied; 
  wire [31:0] asource_1_auto_out_d_mem_0_data; 
  wire  asource_1_auto_out_d_mem_0_corrupt; 
  wire [2:0] asource_1_auto_out_d_mem_1_opcode; 
  wire [1:0] asource_1_auto_out_d_mem_1_param; 
  wire [2:0] asource_1_auto_out_d_mem_1_size; 
  wire [4:0] asource_1_auto_out_d_mem_1_source; 
  wire  asource_1_auto_out_d_mem_1_sink; 
  wire  asource_1_auto_out_d_mem_1_denied; 
  wire [31:0] asource_1_auto_out_d_mem_1_data; 
  wire  asource_1_auto_out_d_mem_1_corrupt; 
  wire [2:0] asource_1_auto_out_d_mem_2_opcode; 
  wire [1:0] asource_1_auto_out_d_mem_2_param; 
  wire [2:0] asource_1_auto_out_d_mem_2_size; 
  wire [4:0] asource_1_auto_out_d_mem_2_source; 
  wire  asource_1_auto_out_d_mem_2_sink; 
  wire  asource_1_auto_out_d_mem_2_denied; 
  wire [31:0] asource_1_auto_out_d_mem_2_data; 
  wire  asource_1_auto_out_d_mem_2_corrupt; 
  wire [2:0] asource_1_auto_out_d_mem_3_opcode; 
  wire [1:0] asource_1_auto_out_d_mem_3_param; 
  wire [2:0] asource_1_auto_out_d_mem_3_size; 
  wire [4:0] asource_1_auto_out_d_mem_3_source; 
  wire  asource_1_auto_out_d_mem_3_sink; 
  wire  asource_1_auto_out_d_mem_3_denied; 
  wire [31:0] asource_1_auto_out_d_mem_3_data; 
  wire  asource_1_auto_out_d_mem_3_corrupt; 
  wire [2:0] asource_1_auto_out_d_mem_4_opcode; 
  wire [1:0] asource_1_auto_out_d_mem_4_param; 
  wire [2:0] asource_1_auto_out_d_mem_4_size; 
  wire [4:0] asource_1_auto_out_d_mem_4_source; 
  wire  asource_1_auto_out_d_mem_4_sink; 
  wire  asource_1_auto_out_d_mem_4_denied; 
  wire [31:0] asource_1_auto_out_d_mem_4_data; 
  wire  asource_1_auto_out_d_mem_4_corrupt; 
  wire [2:0] asource_1_auto_out_d_mem_5_opcode; 
  wire [1:0] asource_1_auto_out_d_mem_5_param; 
  wire [2:0] asource_1_auto_out_d_mem_5_size; 
  wire [4:0] asource_1_auto_out_d_mem_5_source; 
  wire  asource_1_auto_out_d_mem_5_sink; 
  wire  asource_1_auto_out_d_mem_5_denied; 
  wire [31:0] asource_1_auto_out_d_mem_5_data; 
  wire  asource_1_auto_out_d_mem_5_corrupt; 
  wire [2:0] asource_1_auto_out_d_mem_6_opcode; 
  wire [1:0] asource_1_auto_out_d_mem_6_param; 
  wire [2:0] asource_1_auto_out_d_mem_6_size; 
  wire [4:0] asource_1_auto_out_d_mem_6_source; 
  wire  asource_1_auto_out_d_mem_6_sink; 
  wire  asource_1_auto_out_d_mem_6_denied; 
  wire [31:0] asource_1_auto_out_d_mem_6_data; 
  wire  asource_1_auto_out_d_mem_6_corrupt; 
  wire [2:0] asource_1_auto_out_d_mem_7_opcode; 
  wire [1:0] asource_1_auto_out_d_mem_7_param; 
  wire [2:0] asource_1_auto_out_d_mem_7_size; 
  wire [4:0] asource_1_auto_out_d_mem_7_source; 
  wire  asource_1_auto_out_d_mem_7_sink; 
  wire  asource_1_auto_out_d_mem_7_denied; 
  wire [31:0] asource_1_auto_out_d_mem_7_data; 
  wire  asource_1_auto_out_d_mem_7_corrupt; 
  wire [3:0] asource_1_auto_out_d_ridx; 
  wire [3:0] asource_1_auto_out_d_widx; 
  wire  asource_1_auto_out_d_safe_ridx_valid; 
  wire  asource_1_auto_out_d_safe_widx_valid; 
  wire  asource_1_auto_out_d_safe_source_reset_n; 
  wire  asource_1_auto_out_d_safe_sink_reset_n; 
  wire  asink_clock; 
  wire  asink_reset; 
  wire [2:0] asink_auto_in_a_mem_0_opcode; 
  wire [2:0] asink_auto_in_a_mem_0_param; 
  wire [2:0] asink_auto_in_a_mem_0_size; 
  wire [3:0] asink_auto_in_a_mem_0_source; 
  wire [37:0] asink_auto_in_a_mem_0_address; 
  wire [7:0] asink_auto_in_a_mem_0_mask; 
  wire [63:0] asink_auto_in_a_mem_0_data; 
  wire  asink_auto_in_a_mem_0_corrupt; 
  wire [2:0] asink_auto_in_a_mem_1_opcode; 
  wire [2:0] asink_auto_in_a_mem_1_param; 
  wire [2:0] asink_auto_in_a_mem_1_size; 
  wire [3:0] asink_auto_in_a_mem_1_source; 
  wire [37:0] asink_auto_in_a_mem_1_address; 
  wire [7:0] asink_auto_in_a_mem_1_mask; 
  wire [63:0] asink_auto_in_a_mem_1_data; 
  wire  asink_auto_in_a_mem_1_corrupt; 
  wire [2:0] asink_auto_in_a_mem_2_opcode; 
  wire [2:0] asink_auto_in_a_mem_2_param; 
  wire [2:0] asink_auto_in_a_mem_2_size; 
  wire [3:0] asink_auto_in_a_mem_2_source; 
  wire [37:0] asink_auto_in_a_mem_2_address; 
  wire [7:0] asink_auto_in_a_mem_2_mask; 
  wire [63:0] asink_auto_in_a_mem_2_data; 
  wire  asink_auto_in_a_mem_2_corrupt; 
  wire [2:0] asink_auto_in_a_mem_3_opcode; 
  wire [2:0] asink_auto_in_a_mem_3_param; 
  wire [2:0] asink_auto_in_a_mem_3_size; 
  wire [3:0] asink_auto_in_a_mem_3_source; 
  wire [37:0] asink_auto_in_a_mem_3_address; 
  wire [7:0] asink_auto_in_a_mem_3_mask; 
  wire [63:0] asink_auto_in_a_mem_3_data; 
  wire  asink_auto_in_a_mem_3_corrupt; 
  wire [2:0] asink_auto_in_a_mem_4_opcode; 
  wire [2:0] asink_auto_in_a_mem_4_param; 
  wire [2:0] asink_auto_in_a_mem_4_size; 
  wire [3:0] asink_auto_in_a_mem_4_source; 
  wire [37:0] asink_auto_in_a_mem_4_address; 
  wire [7:0] asink_auto_in_a_mem_4_mask; 
  wire [63:0] asink_auto_in_a_mem_4_data; 
  wire  asink_auto_in_a_mem_4_corrupt; 
  wire [2:0] asink_auto_in_a_mem_5_opcode; 
  wire [2:0] asink_auto_in_a_mem_5_param; 
  wire [2:0] asink_auto_in_a_mem_5_size; 
  wire [3:0] asink_auto_in_a_mem_5_source; 
  wire [37:0] asink_auto_in_a_mem_5_address; 
  wire [7:0] asink_auto_in_a_mem_5_mask; 
  wire [63:0] asink_auto_in_a_mem_5_data; 
  wire  asink_auto_in_a_mem_5_corrupt; 
  wire [2:0] asink_auto_in_a_mem_6_opcode; 
  wire [2:0] asink_auto_in_a_mem_6_param; 
  wire [2:0] asink_auto_in_a_mem_6_size; 
  wire [3:0] asink_auto_in_a_mem_6_source; 
  wire [37:0] asink_auto_in_a_mem_6_address; 
  wire [7:0] asink_auto_in_a_mem_6_mask; 
  wire [63:0] asink_auto_in_a_mem_6_data; 
  wire  asink_auto_in_a_mem_6_corrupt; 
  wire [2:0] asink_auto_in_a_mem_7_opcode; 
  wire [2:0] asink_auto_in_a_mem_7_param; 
  wire [2:0] asink_auto_in_a_mem_7_size; 
  wire [3:0] asink_auto_in_a_mem_7_source; 
  wire [37:0] asink_auto_in_a_mem_7_address; 
  wire [7:0] asink_auto_in_a_mem_7_mask; 
  wire [63:0] asink_auto_in_a_mem_7_data; 
  wire  asink_auto_in_a_mem_7_corrupt; 
  wire [3:0] asink_auto_in_a_ridx; 
  wire [3:0] asink_auto_in_a_widx; 
  wire  asink_auto_in_a_safe_ridx_valid; 
  wire  asink_auto_in_a_safe_widx_valid; 
  wire  asink_auto_in_a_safe_source_reset_n; 
  wire  asink_auto_in_a_safe_sink_reset_n; 
  wire [2:0] asink_auto_in_d_mem_0_opcode; 
  wire [1:0] asink_auto_in_d_mem_0_param; 
  wire [2:0] asink_auto_in_d_mem_0_size; 
  wire [3:0] asink_auto_in_d_mem_0_source; 
  wire [2:0] asink_auto_in_d_mem_0_sink; 
  wire  asink_auto_in_d_mem_0_denied; 
  wire [63:0] asink_auto_in_d_mem_0_data; 
  wire  asink_auto_in_d_mem_0_corrupt; 
  wire [2:0] asink_auto_in_d_mem_1_opcode; 
  wire [1:0] asink_auto_in_d_mem_1_param; 
  wire [2:0] asink_auto_in_d_mem_1_size; 
  wire [3:0] asink_auto_in_d_mem_1_source; 
  wire [2:0] asink_auto_in_d_mem_1_sink; 
  wire  asink_auto_in_d_mem_1_denied; 
  wire [63:0] asink_auto_in_d_mem_1_data; 
  wire  asink_auto_in_d_mem_1_corrupt; 
  wire [2:0] asink_auto_in_d_mem_2_opcode; 
  wire [1:0] asink_auto_in_d_mem_2_param; 
  wire [2:0] asink_auto_in_d_mem_2_size; 
  wire [3:0] asink_auto_in_d_mem_2_source; 
  wire [2:0] asink_auto_in_d_mem_2_sink; 
  wire  asink_auto_in_d_mem_2_denied; 
  wire [63:0] asink_auto_in_d_mem_2_data; 
  wire  asink_auto_in_d_mem_2_corrupt; 
  wire [2:0] asink_auto_in_d_mem_3_opcode; 
  wire [1:0] asink_auto_in_d_mem_3_param; 
  wire [2:0] asink_auto_in_d_mem_3_size; 
  wire [3:0] asink_auto_in_d_mem_3_source; 
  wire [2:0] asink_auto_in_d_mem_3_sink; 
  wire  asink_auto_in_d_mem_3_denied; 
  wire [63:0] asink_auto_in_d_mem_3_data; 
  wire  asink_auto_in_d_mem_3_corrupt; 
  wire [2:0] asink_auto_in_d_mem_4_opcode; 
  wire [1:0] asink_auto_in_d_mem_4_param; 
  wire [2:0] asink_auto_in_d_mem_4_size; 
  wire [3:0] asink_auto_in_d_mem_4_source; 
  wire [2:0] asink_auto_in_d_mem_4_sink; 
  wire  asink_auto_in_d_mem_4_denied; 
  wire [63:0] asink_auto_in_d_mem_4_data; 
  wire  asink_auto_in_d_mem_4_corrupt; 
  wire [2:0] asink_auto_in_d_mem_5_opcode; 
  wire [1:0] asink_auto_in_d_mem_5_param; 
  wire [2:0] asink_auto_in_d_mem_5_size; 
  wire [3:0] asink_auto_in_d_mem_5_source; 
  wire [2:0] asink_auto_in_d_mem_5_sink; 
  wire  asink_auto_in_d_mem_5_denied; 
  wire [63:0] asink_auto_in_d_mem_5_data; 
  wire  asink_auto_in_d_mem_5_corrupt; 
  wire [2:0] asink_auto_in_d_mem_6_opcode; 
  wire [1:0] asink_auto_in_d_mem_6_param; 
  wire [2:0] asink_auto_in_d_mem_6_size; 
  wire [3:0] asink_auto_in_d_mem_6_source; 
  wire [2:0] asink_auto_in_d_mem_6_sink; 
  wire  asink_auto_in_d_mem_6_denied; 
  wire [63:0] asink_auto_in_d_mem_6_data; 
  wire  asink_auto_in_d_mem_6_corrupt; 
  wire [2:0] asink_auto_in_d_mem_7_opcode; 
  wire [1:0] asink_auto_in_d_mem_7_param; 
  wire [2:0] asink_auto_in_d_mem_7_size; 
  wire [3:0] asink_auto_in_d_mem_7_source; 
  wire [2:0] asink_auto_in_d_mem_7_sink; 
  wire  asink_auto_in_d_mem_7_denied; 
  wire [63:0] asink_auto_in_d_mem_7_data; 
  wire  asink_auto_in_d_mem_7_corrupt; 
  wire [3:0] asink_auto_in_d_ridx; 
  wire [3:0] asink_auto_in_d_widx; 
  wire  asink_auto_in_d_safe_ridx_valid; 
  wire  asink_auto_in_d_safe_widx_valid; 
  wire  asink_auto_in_d_safe_source_reset_n; 
  wire  asink_auto_in_d_safe_sink_reset_n; 
  wire  asink_auto_out_a_ready; 
  wire  asink_auto_out_a_valid; 
  wire [2:0] asink_auto_out_a_bits_opcode; 
  wire [2:0] asink_auto_out_a_bits_param; 
  wire [2:0] asink_auto_out_a_bits_size; 
  wire [3:0] asink_auto_out_a_bits_source; 
  wire [37:0] asink_auto_out_a_bits_address; 
  wire [7:0] asink_auto_out_a_bits_mask; 
  wire [63:0] asink_auto_out_a_bits_data; 
  wire  asink_auto_out_a_bits_corrupt; 
  wire  asink_auto_out_d_ready; 
  wire  asink_auto_out_d_valid; 
  wire [2:0] asink_auto_out_d_bits_opcode; 
  wire [1:0] asink_auto_out_d_bits_param; 
  wire [2:0] asink_auto_out_d_bits_size; 
  wire [3:0] asink_auto_out_d_bits_source; 
  wire [2:0] asink_auto_out_d_bits_sink; 
  wire  asink_auto_out_d_bits_denied; 
  wire [63:0] asink_auto_out_d_bits_data; 
  wire  asink_auto_out_d_bits_corrupt; 
  wire  intsink_6_clock; 
  wire  intsink_6_auto_in_sync_0; 
  wire  intsink_6_auto_out_0; 
  wire  asyncXing_2_clock; 
  wire  asyncXing_2_auto_int_in_0; 
  wire  asyncXing_2_auto_int_in_1; 
  wire  asyncXing_2_auto_int_in_2; 
  wire  asyncXing_2_auto_int_in_3; 
  wire  asyncXing_2_auto_int_out_0; 
  wire  asyncXing_2_auto_int_out_1; 
  wire  asyncXing_2_auto_int_out_2; 
  wire  asyncXing_2_auto_int_out_3; 
  wire  gpio_0_clock; 
  wire  gpio_0_reset; 
  wire  gpio_0_auto_int_xing_out_sync_0; 
  wire  gpio_0_auto_int_xing_out_sync_1; 
  wire  gpio_0_auto_int_xing_out_sync_2; 
  wire  gpio_0_auto_int_xing_out_sync_3; 
  wire  gpio_0_auto_control_xing_in_a_ready; 
  wire  gpio_0_auto_control_xing_in_a_valid; 
  wire [2:0] gpio_0_auto_control_xing_in_a_bits_opcode; 
  wire [2:0] gpio_0_auto_control_xing_in_a_bits_param; 
  wire [1:0] gpio_0_auto_control_xing_in_a_bits_size; 
  wire [8:0] gpio_0_auto_control_xing_in_a_bits_source; 
  wire [30:0] gpio_0_auto_control_xing_in_a_bits_address; 
  wire [7:0] gpio_0_auto_control_xing_in_a_bits_mask; 
  wire [63:0] gpio_0_auto_control_xing_in_a_bits_data; 
  wire  gpio_0_auto_control_xing_in_a_bits_corrupt; 
  wire  gpio_0_auto_control_xing_in_d_ready; 
  wire  gpio_0_auto_control_xing_in_d_valid; 
  wire [2:0] gpio_0_auto_control_xing_in_d_bits_opcode; 
  wire [1:0] gpio_0_auto_control_xing_in_d_bits_size; 
  wire [8:0] gpio_0_auto_control_xing_in_d_bits_source; 
  wire [63:0] gpio_0_auto_control_xing_in_d_bits_data; 
  wire  gpio_0_auto_io_out_pins_0_o_oval; 
  wire  gpio_0_auto_io_out_pins_1_o_oval; 
  wire  gpio_0_auto_io_out_pins_2_o_oval; 
  wire  gpio_0_auto_io_out_pins_3_o_oval; 
  wire  intsink_7_auto_in_sync_0; 
  wire  intsink_7_auto_in_sync_1; 
  wire  intsink_7_auto_in_sync_2; 
  wire  intsink_7_auto_in_sync_3; 
  wire  intsink_7_auto_out_0; 
  wire  intsink_7_auto_out_1; 
  wire  intsink_7_auto_out_2; 
  wire  intsink_7_auto_out_3; 
  wire  dtm_clock; 
  wire  dtm_reset; 
  wire  dtm_io_dmi_req_ready; 
  wire  dtm_io_dmi_req_valid; 
  wire [6:0] dtm_io_dmi_req_bits_addr; 
  wire [31:0] dtm_io_dmi_req_bits_data; 
  wire [1:0] dtm_io_dmi_req_bits_op; 
  wire  dtm_io_dmi_resp_ready; 
  wire  dtm_io_dmi_resp_valid; 
  wire [31:0] dtm_io_dmi_resp_bits_data; 
  wire [1:0] dtm_io_dmi_resp_bits_resp; 
  wire  dtm_io_jtag_TMS; 
  wire  dtm_io_jtag_TDI; 
  wire  dtm_io_jtag_TDO_data; 
  wire  dtm_io_jtag_reset; 
  wire  dtm_io_fsmReset; 
  wire  dmiResetCatch_clock; 
  wire  dmiResetCatch_reset; 
  wire  dmiResetCatch_io_sync_reset; 
  reg  _T_2369; 
  reg [31:0] _RAND_0;
  reg  _T_2371; 
  reg [31:0] _RAND_1;
  reg  _T_2377; 
  reg [31:0] _RAND_2;
  reg  _T_2379; 
  reg [31:0] _RAND_3;
  reg [5:0] value; 
  reg [31:0] _RAND_4;
  wire  int_rtc_tick; 
  wire [5:0] _T_2468; 
  wire  gpio_pins_pins_2_o_oval; 
  wire  gpio_pins_pins_3_o_oval; 
  wire [1:0] _T_2498; 
  wire  gpio_pins_pins_0_o_oval; 
  wire  gpio_pins_pins_1_o_oval; 
  wire [1:0] _T_2499; 
  wire [3:0] gpio_cat; 
  IntXbar int_bus ( 
    .auto_int_in_3_0(int_bus_auto_int_in_3_0),
    .auto_int_in_3_1(int_bus_auto_int_in_3_1),
    .auto_int_in_3_2(int_bus_auto_int_in_3_2),
    .auto_int_in_3_3(int_bus_auto_int_in_3_3),
    .auto_int_in_2_0(int_bus_auto_int_in_2_0),
    .auto_int_in_1_0(int_bus_auto_int_in_1_0),
    .auto_int_in_0_0(int_bus_auto_int_in_0_0),
    .auto_int_out_0(int_bus_auto_int_out_0),
    .auto_int_out_1(int_bus_auto_int_out_1),
    .auto_int_out_2(int_bus_auto_int_out_2),
    .auto_int_out_3(int_bus_auto_int_out_3),
    .auto_int_out_4(int_bus_auto_int_out_4),
    .auto_int_out_5(int_bus_auto_int_out_5),
    .auto_int_out_6(int_bus_auto_int_out_6)
  );
  SystemBusWrapper sbus ( 
    .clock(sbus_clock),
    .reset(sbus_reset),
    .tile_clock(tile_clock),
    .tile_reset(tile_reset),
    .tile_1_clock(tile_1_clock),
    .tile_1_reset(tile_1_reset),
    .tile_2_clock(tile_2_clock),
    .tile_2_reset(tile_2_reset),
    .tile_3_clock(tile_3_clock),
    .tile_3_reset(tile_3_reset),
    .auto_coupler_to_slave_named_pcie_0_widget_out_1_a_ready(sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_a_ready),
    .auto_coupler_to_slave_named_pcie_0_widget_out_1_a_valid(sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_a_valid),
    .auto_coupler_to_slave_named_pcie_0_widget_out_1_a_bits_opcode(sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_a_bits_opcode),
    .auto_coupler_to_slave_named_pcie_0_widget_out_1_a_bits_param(sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_a_bits_param),
    .auto_coupler_to_slave_named_pcie_0_widget_out_1_a_bits_size(sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_a_bits_size),
    .auto_coupler_to_slave_named_pcie_0_widget_out_1_a_bits_source(sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_a_bits_source),
    .auto_coupler_to_slave_named_pcie_0_widget_out_1_a_bits_address(sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_a_bits_address),
    .auto_coupler_to_slave_named_pcie_0_widget_out_1_a_bits_mask(sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_a_bits_mask),
    .auto_coupler_to_slave_named_pcie_0_widget_out_1_a_bits_data(sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_a_bits_data),
    .auto_coupler_to_slave_named_pcie_0_widget_out_1_a_bits_corrupt(sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_a_bits_corrupt),
    .auto_coupler_to_slave_named_pcie_0_widget_out_1_d_ready(sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_d_ready),
    .auto_coupler_to_slave_named_pcie_0_widget_out_1_d_valid(sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_d_valid),
    .auto_coupler_to_slave_named_pcie_0_widget_out_1_d_bits_opcode(sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_d_bits_opcode),
    .auto_coupler_to_slave_named_pcie_0_widget_out_1_d_bits_param(sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_d_bits_param),
    .auto_coupler_to_slave_named_pcie_0_widget_out_1_d_bits_size(sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_d_bits_size),
    .auto_coupler_to_slave_named_pcie_0_widget_out_1_d_bits_source(sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_d_bits_source),
    .auto_coupler_to_slave_named_pcie_0_widget_out_1_d_bits_sink(sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_d_bits_sink),
    .auto_coupler_to_slave_named_pcie_0_widget_out_1_d_bits_denied(sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_d_bits_denied),
    .auto_coupler_to_slave_named_pcie_0_widget_out_1_d_bits_data(sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_d_bits_data),
    .auto_coupler_to_slave_named_pcie_0_widget_out_1_d_bits_corrupt(sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_d_bits_corrupt),
    .auto_coupler_to_slave_named_pcie_0_widget_out_0_a_ready(sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_a_ready),
    .auto_coupler_to_slave_named_pcie_0_widget_out_0_a_valid(sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_a_valid),
    .auto_coupler_to_slave_named_pcie_0_widget_out_0_a_bits_opcode(sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_a_bits_opcode),
    .auto_coupler_to_slave_named_pcie_0_widget_out_0_a_bits_param(sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_a_bits_param),
    .auto_coupler_to_slave_named_pcie_0_widget_out_0_a_bits_size(sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_a_bits_size),
    .auto_coupler_to_slave_named_pcie_0_widget_out_0_a_bits_source(sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_a_bits_source),
    .auto_coupler_to_slave_named_pcie_0_widget_out_0_a_bits_address(sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_a_bits_address),
    .auto_coupler_to_slave_named_pcie_0_widget_out_0_a_bits_mask(sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_a_bits_mask),
    .auto_coupler_to_slave_named_pcie_0_widget_out_0_a_bits_data(sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_a_bits_data),
    .auto_coupler_to_slave_named_pcie_0_widget_out_0_a_bits_corrupt(sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_a_bits_corrupt),
    .auto_coupler_to_slave_named_pcie_0_widget_out_0_d_ready(sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_d_ready),
    .auto_coupler_to_slave_named_pcie_0_widget_out_0_d_valid(sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_d_valid),
    .auto_coupler_to_slave_named_pcie_0_widget_out_0_d_bits_opcode(sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_d_bits_opcode),
    .auto_coupler_to_slave_named_pcie_0_widget_out_0_d_bits_param(sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_d_bits_param),
    .auto_coupler_to_slave_named_pcie_0_widget_out_0_d_bits_size(sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_d_bits_size),
    .auto_coupler_to_slave_named_pcie_0_widget_out_0_d_bits_source(sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_d_bits_source),
    .auto_coupler_to_slave_named_pcie_0_widget_out_0_d_bits_sink(sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_d_bits_sink),
    .auto_coupler_to_slave_named_pcie_0_widget_out_0_d_bits_denied(sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_d_bits_denied),
    .auto_coupler_to_slave_named_pcie_0_widget_out_0_d_bits_data(sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_d_bits_data),
    .auto_coupler_to_slave_named_pcie_0_widget_out_0_d_bits_corrupt(sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_d_bits_corrupt),
    .auto_coupler_from_master_named_pcie_0_fixer_in_a_ready(sbus_auto_coupler_from_master_named_pcie_0_fixer_in_a_ready),
    .auto_coupler_from_master_named_pcie_0_fixer_in_a_valid(sbus_auto_coupler_from_master_named_pcie_0_fixer_in_a_valid),
    .auto_coupler_from_master_named_pcie_0_fixer_in_a_bits_opcode(sbus_auto_coupler_from_master_named_pcie_0_fixer_in_a_bits_opcode),
    .auto_coupler_from_master_named_pcie_0_fixer_in_a_bits_param(sbus_auto_coupler_from_master_named_pcie_0_fixer_in_a_bits_param),
    .auto_coupler_from_master_named_pcie_0_fixer_in_a_bits_size(sbus_auto_coupler_from_master_named_pcie_0_fixer_in_a_bits_size),
    .auto_coupler_from_master_named_pcie_0_fixer_in_a_bits_source(sbus_auto_coupler_from_master_named_pcie_0_fixer_in_a_bits_source),
    .auto_coupler_from_master_named_pcie_0_fixer_in_a_bits_address(sbus_auto_coupler_from_master_named_pcie_0_fixer_in_a_bits_address),
    .auto_coupler_from_master_named_pcie_0_fixer_in_a_bits_mask(sbus_auto_coupler_from_master_named_pcie_0_fixer_in_a_bits_mask),
    .auto_coupler_from_master_named_pcie_0_fixer_in_a_bits_data(sbus_auto_coupler_from_master_named_pcie_0_fixer_in_a_bits_data),
    .auto_coupler_from_master_named_pcie_0_fixer_in_a_bits_corrupt(sbus_auto_coupler_from_master_named_pcie_0_fixer_in_a_bits_corrupt),
    .auto_coupler_from_master_named_pcie_0_fixer_in_d_ready(sbus_auto_coupler_from_master_named_pcie_0_fixer_in_d_ready),
    .auto_coupler_from_master_named_pcie_0_fixer_in_d_valid(sbus_auto_coupler_from_master_named_pcie_0_fixer_in_d_valid),
    .auto_coupler_from_master_named_pcie_0_fixer_in_d_bits_opcode(sbus_auto_coupler_from_master_named_pcie_0_fixer_in_d_bits_opcode),
    .auto_coupler_from_master_named_pcie_0_fixer_in_d_bits_param(sbus_auto_coupler_from_master_named_pcie_0_fixer_in_d_bits_param),
    .auto_coupler_from_master_named_pcie_0_fixer_in_d_bits_size(sbus_auto_coupler_from_master_named_pcie_0_fixer_in_d_bits_size),
    .auto_coupler_from_master_named_pcie_0_fixer_in_d_bits_source(sbus_auto_coupler_from_master_named_pcie_0_fixer_in_d_bits_source),
    .auto_coupler_from_master_named_pcie_0_fixer_in_d_bits_sink(sbus_auto_coupler_from_master_named_pcie_0_fixer_in_d_bits_sink),
    .auto_coupler_from_master_named_pcie_0_fixer_in_d_bits_denied(sbus_auto_coupler_from_master_named_pcie_0_fixer_in_d_bits_denied),
    .auto_coupler_from_master_named_pcie_0_fixer_in_d_bits_data(sbus_auto_coupler_from_master_named_pcie_0_fixer_in_d_bits_data),
    .auto_coupler_from_master_named_pcie_0_fixer_in_d_bits_corrupt(sbus_auto_coupler_from_master_named_pcie_0_fixer_in_d_bits_corrupt),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_ready(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_ready),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_valid(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_valid),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_bits_opcode(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_bits_opcode),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_bits_param(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_bits_param),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_bits_size(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_bits_size),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_bits_source(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_bits_source),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_bits_address(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_bits_address),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_bits_mask(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_bits_mask),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_bits_data(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_bits_data),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_bits_corrupt(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_bits_corrupt),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_3_b_ready(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_b_ready),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_3_b_valid(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_b_valid),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_3_b_bits_opcode(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_b_bits_opcode),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_3_b_bits_param(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_b_bits_param),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_3_b_bits_size(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_b_bits_size),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_3_b_bits_source(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_b_bits_source),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_3_b_bits_address(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_b_bits_address),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_3_b_bits_mask(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_b_bits_mask),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_3_b_bits_corrupt(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_b_bits_corrupt),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_3_c_ready(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_c_ready),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_3_c_valid(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_c_valid),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_3_c_bits_opcode(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_c_bits_opcode),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_3_c_bits_param(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_c_bits_param),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_3_c_bits_size(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_c_bits_size),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_3_c_bits_source(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_c_bits_source),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_3_c_bits_address(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_c_bits_address),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_3_c_bits_data(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_c_bits_data),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_3_c_bits_corrupt(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_c_bits_corrupt),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_ready(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_ready),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_valid(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_valid),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_bits_opcode(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_bits_opcode),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_bits_param(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_bits_param),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_bits_size(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_bits_size),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_bits_source(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_bits_source),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_bits_sink(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_bits_sink),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_bits_denied(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_bits_denied),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_bits_data(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_bits_data),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_bits_corrupt(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_bits_corrupt),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_3_e_ready(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_e_ready),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_3_e_valid(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_e_valid),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_3_e_bits_sink(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_e_bits_sink),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_ready(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_ready),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_valid(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_valid),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_bits_opcode(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_bits_opcode),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_bits_param(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_bits_param),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_bits_size(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_bits_size),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_bits_source(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_bits_source),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_bits_address(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_bits_address),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_bits_mask(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_bits_mask),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_bits_data(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_bits_data),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_bits_corrupt(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_bits_corrupt),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_2_b_ready(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_b_ready),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_2_b_valid(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_b_valid),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_2_b_bits_opcode(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_b_bits_opcode),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_2_b_bits_param(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_b_bits_param),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_2_b_bits_size(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_b_bits_size),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_2_b_bits_source(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_b_bits_source),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_2_b_bits_address(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_b_bits_address),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_2_b_bits_mask(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_b_bits_mask),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_2_b_bits_corrupt(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_b_bits_corrupt),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_2_c_ready(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_c_ready),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_2_c_valid(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_c_valid),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_2_c_bits_opcode(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_c_bits_opcode),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_2_c_bits_param(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_c_bits_param),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_2_c_bits_size(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_c_bits_size),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_2_c_bits_source(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_c_bits_source),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_2_c_bits_address(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_c_bits_address),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_2_c_bits_data(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_c_bits_data),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_2_c_bits_corrupt(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_c_bits_corrupt),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_ready(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_ready),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_valid(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_valid),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_bits_opcode(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_bits_opcode),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_bits_param(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_bits_param),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_bits_size(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_bits_size),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_bits_source(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_bits_source),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_bits_sink(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_bits_sink),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_bits_denied(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_bits_denied),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_bits_data(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_bits_data),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_bits_corrupt(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_bits_corrupt),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_2_e_ready(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_e_ready),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_2_e_valid(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_e_valid),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_2_e_bits_sink(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_e_bits_sink),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_ready(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_ready),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_valid(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_valid),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_bits_opcode(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_bits_opcode),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_bits_param(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_bits_param),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_bits_size(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_bits_size),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_bits_source(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_bits_source),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_bits_address(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_bits_address),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_bits_mask(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_bits_mask),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_bits_data(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_bits_data),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_bits_corrupt(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_bits_corrupt),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_1_b_ready(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_b_ready),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_1_b_valid(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_b_valid),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_1_b_bits_opcode(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_b_bits_opcode),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_1_b_bits_param(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_b_bits_param),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_1_b_bits_size(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_b_bits_size),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_1_b_bits_source(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_b_bits_source),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_1_b_bits_address(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_b_bits_address),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_1_b_bits_mask(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_b_bits_mask),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_1_b_bits_corrupt(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_b_bits_corrupt),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_1_c_ready(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_c_ready),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_1_c_valid(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_c_valid),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_1_c_bits_opcode(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_c_bits_opcode),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_1_c_bits_param(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_c_bits_param),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_1_c_bits_size(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_c_bits_size),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_1_c_bits_source(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_c_bits_source),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_1_c_bits_address(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_c_bits_address),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_1_c_bits_data(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_c_bits_data),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_1_c_bits_corrupt(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_c_bits_corrupt),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_ready(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_ready),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_valid(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_valid),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_bits_opcode(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_bits_opcode),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_bits_param(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_bits_param),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_bits_size(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_bits_size),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_bits_source(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_bits_source),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_bits_sink(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_bits_sink),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_bits_denied(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_bits_denied),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_bits_data(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_bits_data),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_bits_corrupt(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_bits_corrupt),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_1_e_ready(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_e_ready),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_1_e_valid(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_e_valid),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_1_e_bits_sink(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_e_bits_sink),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_ready(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_ready),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_valid(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_valid),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_bits_opcode(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_bits_opcode),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_bits_param(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_bits_param),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_bits_size(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_bits_size),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_bits_source(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_bits_source),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_bits_address(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_bits_address),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_bits_mask(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_bits_mask),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_bits_data(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_bits_data),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_bits_corrupt(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_bits_corrupt),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_0_b_ready(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_b_ready),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_0_b_valid(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_b_valid),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_0_b_bits_opcode(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_b_bits_opcode),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_0_b_bits_param(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_b_bits_param),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_0_b_bits_size(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_b_bits_size),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_0_b_bits_source(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_b_bits_source),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_0_b_bits_address(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_b_bits_address),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_0_b_bits_mask(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_b_bits_mask),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_0_b_bits_corrupt(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_b_bits_corrupt),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_0_c_ready(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_c_ready),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_0_c_valid(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_c_valid),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_0_c_bits_opcode(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_c_bits_opcode),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_0_c_bits_param(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_c_bits_param),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_0_c_bits_size(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_c_bits_size),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_0_c_bits_source(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_c_bits_source),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_0_c_bits_address(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_c_bits_address),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_0_c_bits_data(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_c_bits_data),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_0_c_bits_corrupt(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_c_bits_corrupt),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_ready(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_ready),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_valid(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_valid),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_bits_opcode(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_bits_opcode),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_bits_param(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_bits_param),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_bits_size(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_bits_size),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_bits_source(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_bits_source),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_bits_sink(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_bits_sink),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_bits_denied(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_bits_denied),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_bits_data(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_bits_data),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_bits_corrupt(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_bits_corrupt),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_0_e_ready(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_e_ready),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_0_e_valid(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_e_valid),
    .auto_coupler_from_tile_named_tile_tl_master_xing_in_0_e_bits_sink(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_e_bits_sink),
    .auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_a_ready(sbus_auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_a_ready),
    .auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_a_valid(sbus_auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_a_valid),
    .auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_opcode(sbus_auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_opcode),
    .auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_param(sbus_auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_param),
    .auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_size(sbus_auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_size),
    .auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_source(sbus_auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_source),
    .auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_address(sbus_auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_address),
    .auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_mask(sbus_auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_mask),
    .auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_corrupt(sbus_auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_corrupt),
    .auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_d_ready(sbus_auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_d_ready),
    .auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_d_valid(sbus_auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_d_valid),
    .auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_d_bits_size(sbus_auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_d_bits_size),
    .auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_d_bits_source(sbus_auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_d_bits_source),
    .auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_d_bits_data(sbus_auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_d_bits_data),
    .auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_ready(sbus_auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_ready),
    .auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_valid(sbus_auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_valid),
    .auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_bits_opcode(sbus_auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_bits_opcode),
    .auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_bits_param(sbus_auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_bits_param),
    .auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_bits_size(sbus_auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_bits_size),
    .auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_bits_source(sbus_auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_bits_source),
    .auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_bits_address(sbus_auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_bits_address),
    .auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_bits_mask(sbus_auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_bits_mask),
    .auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_bits_data(sbus_auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_bits_data),
    .auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_bits_corrupt(sbus_auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_bits_corrupt),
    .auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_d_ready(sbus_auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_d_ready),
    .auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_d_valid(sbus_auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_d_valid),
    .auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_d_bits_opcode(sbus_auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_d_bits_opcode),
    .auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_d_bits_size(sbus_auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_d_bits_size),
    .auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_d_bits_source(sbus_auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_d_bits_source),
    .auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_d_bits_data(sbus_auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_d_bits_data),
    .auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_ready(sbus_auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_ready),
    .auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_valid(sbus_auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_valid),
    .auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_bits_opcode(sbus_auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_bits_opcode),
    .auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_bits_param(sbus_auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_bits_param),
    .auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_bits_size(sbus_auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_bits_size),
    .auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_bits_source(sbus_auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_bits_source),
    .auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_bits_address(sbus_auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_bits_address),
    .auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_bits_mask(sbus_auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_bits_mask),
    .auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_bits_data(sbus_auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_bits_data),
    .auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_bits_corrupt(sbus_auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_bits_corrupt),
    .auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_d_ready(sbus_auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_d_ready),
    .auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_d_valid(sbus_auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_d_valid),
    .auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_d_bits_opcode(sbus_auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_d_bits_opcode),
    .auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_d_bits_size(sbus_auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_d_bits_size),
    .auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_d_bits_source(sbus_auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_d_bits_source),
    .auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_d_bits_data(sbus_auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_d_bits_data),
    .auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_ready(sbus_auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_ready),
    .auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_valid(sbus_auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_valid),
    .auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_bits_opcode(sbus_auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_bits_opcode),
    .auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_bits_param(sbus_auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_bits_param),
    .auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_bits_size(sbus_auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_bits_size),
    .auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_bits_source(sbus_auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_bits_source),
    .auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_bits_address(sbus_auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_bits_address),
    .auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_bits_mask(sbus_auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_bits_mask),
    .auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_bits_data(sbus_auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_bits_data),
    .auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_bits_corrupt(sbus_auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_bits_corrupt),
    .auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_d_ready(sbus_auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_d_ready),
    .auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_d_valid(sbus_auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_d_valid),
    .auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_d_bits_opcode(sbus_auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_d_bits_opcode),
    .auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_d_bits_size(sbus_auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_d_bits_size),
    .auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_d_bits_source(sbus_auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_d_bits_source),
    .auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_d_bits_data(sbus_auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_d_bits_data),
    .auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_ready(sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_ready),
    .auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_valid(sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_valid),
    .auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_bits_opcode(sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_bits_opcode),
    .auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_bits_param(sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_bits_param),
    .auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_bits_size(sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_bits_size),
    .auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_bits_source(sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_bits_source),
    .auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_bits_address(sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_bits_address),
    .auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_bits_mask(sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_bits_mask),
    .auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_bits_data(sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_bits_data),
    .auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_bits_corrupt(sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_bits_corrupt),
    .auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_ready(sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_ready),
    .auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_valid(sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_valid),
    .auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_bits_opcode(sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_bits_opcode),
    .auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_bits_param(sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_bits_param),
    .auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_bits_size(sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_bits_size),
    .auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_bits_source(sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_bits_source),
    .auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_bits_sink(sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_bits_sink),
    .auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_bits_denied(sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_bits_denied),
    .auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_bits_data(sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_bits_data),
    .auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_bits_corrupt(sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_bits_corrupt),
    .auto_system_bus_xbar_out_a_ready(sbus_auto_system_bus_xbar_out_a_ready),
    .auto_system_bus_xbar_out_a_valid(sbus_auto_system_bus_xbar_out_a_valid),
    .auto_system_bus_xbar_out_a_bits_opcode(sbus_auto_system_bus_xbar_out_a_bits_opcode),
    .auto_system_bus_xbar_out_a_bits_param(sbus_auto_system_bus_xbar_out_a_bits_param),
    .auto_system_bus_xbar_out_a_bits_size(sbus_auto_system_bus_xbar_out_a_bits_size),
    .auto_system_bus_xbar_out_a_bits_source(sbus_auto_system_bus_xbar_out_a_bits_source),
    .auto_system_bus_xbar_out_a_bits_address(sbus_auto_system_bus_xbar_out_a_bits_address),
    .auto_system_bus_xbar_out_a_bits_mask(sbus_auto_system_bus_xbar_out_a_bits_mask),
    .auto_system_bus_xbar_out_a_bits_data(sbus_auto_system_bus_xbar_out_a_bits_data),
    .auto_system_bus_xbar_out_a_bits_corrupt(sbus_auto_system_bus_xbar_out_a_bits_corrupt),
    .auto_system_bus_xbar_out_b_ready(sbus_auto_system_bus_xbar_out_b_ready),
    .auto_system_bus_xbar_out_b_valid(sbus_auto_system_bus_xbar_out_b_valid),
    .auto_system_bus_xbar_out_b_bits_param(sbus_auto_system_bus_xbar_out_b_bits_param),
    .auto_system_bus_xbar_out_b_bits_source(sbus_auto_system_bus_xbar_out_b_bits_source),
    .auto_system_bus_xbar_out_b_bits_address(sbus_auto_system_bus_xbar_out_b_bits_address),
    .auto_system_bus_xbar_out_c_ready(sbus_auto_system_bus_xbar_out_c_ready),
    .auto_system_bus_xbar_out_c_valid(sbus_auto_system_bus_xbar_out_c_valid),
    .auto_system_bus_xbar_out_c_bits_opcode(sbus_auto_system_bus_xbar_out_c_bits_opcode),
    .auto_system_bus_xbar_out_c_bits_param(sbus_auto_system_bus_xbar_out_c_bits_param),
    .auto_system_bus_xbar_out_c_bits_size(sbus_auto_system_bus_xbar_out_c_bits_size),
    .auto_system_bus_xbar_out_c_bits_source(sbus_auto_system_bus_xbar_out_c_bits_source),
    .auto_system_bus_xbar_out_c_bits_address(sbus_auto_system_bus_xbar_out_c_bits_address),
    .auto_system_bus_xbar_out_c_bits_data(sbus_auto_system_bus_xbar_out_c_bits_data),
    .auto_system_bus_xbar_out_c_bits_corrupt(sbus_auto_system_bus_xbar_out_c_bits_corrupt),
    .auto_system_bus_xbar_out_d_ready(sbus_auto_system_bus_xbar_out_d_ready),
    .auto_system_bus_xbar_out_d_valid(sbus_auto_system_bus_xbar_out_d_valid),
    .auto_system_bus_xbar_out_d_bits_opcode(sbus_auto_system_bus_xbar_out_d_bits_opcode),
    .auto_system_bus_xbar_out_d_bits_param(sbus_auto_system_bus_xbar_out_d_bits_param),
    .auto_system_bus_xbar_out_d_bits_size(sbus_auto_system_bus_xbar_out_d_bits_size),
    .auto_system_bus_xbar_out_d_bits_source(sbus_auto_system_bus_xbar_out_d_bits_source),
    .auto_system_bus_xbar_out_d_bits_sink(sbus_auto_system_bus_xbar_out_d_bits_sink),
    .auto_system_bus_xbar_out_d_bits_denied(sbus_auto_system_bus_xbar_out_d_bits_denied),
    .auto_system_bus_xbar_out_d_bits_data(sbus_auto_system_bus_xbar_out_d_bits_data),
    .auto_system_bus_xbar_out_d_bits_corrupt(sbus_auto_system_bus_xbar_out_d_bits_corrupt),
    .auto_system_bus_xbar_out_e_valid(sbus_auto_system_bus_xbar_out_e_valid),
    .auto_system_bus_xbar_out_e_bits_sink(sbus_auto_system_bus_xbar_out_e_bits_sink)
  );
  PeripheryBus_1 pbus ( 
    .clock(pbus_clock),
    .reset(pbus_reset),
    .auto_coupler_to_device_named_gpio_0_control_xing_out_a_ready(pbus_auto_coupler_to_device_named_gpio_0_control_xing_out_a_ready),
    .auto_coupler_to_device_named_gpio_0_control_xing_out_a_valid(pbus_auto_coupler_to_device_named_gpio_0_control_xing_out_a_valid),
    .auto_coupler_to_device_named_gpio_0_control_xing_out_a_bits_opcode(pbus_auto_coupler_to_device_named_gpio_0_control_xing_out_a_bits_opcode),
    .auto_coupler_to_device_named_gpio_0_control_xing_out_a_bits_param(pbus_auto_coupler_to_device_named_gpio_0_control_xing_out_a_bits_param),
    .auto_coupler_to_device_named_gpio_0_control_xing_out_a_bits_size(pbus_auto_coupler_to_device_named_gpio_0_control_xing_out_a_bits_size),
    .auto_coupler_to_device_named_gpio_0_control_xing_out_a_bits_source(pbus_auto_coupler_to_device_named_gpio_0_control_xing_out_a_bits_source),
    .auto_coupler_to_device_named_gpio_0_control_xing_out_a_bits_address(pbus_auto_coupler_to_device_named_gpio_0_control_xing_out_a_bits_address),
    .auto_coupler_to_device_named_gpio_0_control_xing_out_a_bits_mask(pbus_auto_coupler_to_device_named_gpio_0_control_xing_out_a_bits_mask),
    .auto_coupler_to_device_named_gpio_0_control_xing_out_a_bits_data(pbus_auto_coupler_to_device_named_gpio_0_control_xing_out_a_bits_data),
    .auto_coupler_to_device_named_gpio_0_control_xing_out_a_bits_corrupt(pbus_auto_coupler_to_device_named_gpio_0_control_xing_out_a_bits_corrupt),
    .auto_coupler_to_device_named_gpio_0_control_xing_out_d_ready(pbus_auto_coupler_to_device_named_gpio_0_control_xing_out_d_ready),
    .auto_coupler_to_device_named_gpio_0_control_xing_out_d_valid(pbus_auto_coupler_to_device_named_gpio_0_control_xing_out_d_valid),
    .auto_coupler_to_device_named_gpio_0_control_xing_out_d_bits_opcode(pbus_auto_coupler_to_device_named_gpio_0_control_xing_out_d_bits_opcode),
    .auto_coupler_to_device_named_gpio_0_control_xing_out_d_bits_size(pbus_auto_coupler_to_device_named_gpio_0_control_xing_out_d_bits_size),
    .auto_coupler_to_device_named_gpio_0_control_xing_out_d_bits_source(pbus_auto_coupler_to_device_named_gpio_0_control_xing_out_d_bits_source),
    .auto_coupler_to_device_named_gpio_0_control_xing_out_d_bits_data(pbus_auto_coupler_to_device_named_gpio_0_control_xing_out_d_bits_data),
    .auto_coupler_to_device_named_spi_0_control_xing_out_a_ready(pbus_auto_coupler_to_device_named_spi_0_control_xing_out_a_ready),
    .auto_coupler_to_device_named_spi_0_control_xing_out_a_valid(pbus_auto_coupler_to_device_named_spi_0_control_xing_out_a_valid),
    .auto_coupler_to_device_named_spi_0_control_xing_out_a_bits_opcode(pbus_auto_coupler_to_device_named_spi_0_control_xing_out_a_bits_opcode),
    .auto_coupler_to_device_named_spi_0_control_xing_out_a_bits_param(pbus_auto_coupler_to_device_named_spi_0_control_xing_out_a_bits_param),
    .auto_coupler_to_device_named_spi_0_control_xing_out_a_bits_size(pbus_auto_coupler_to_device_named_spi_0_control_xing_out_a_bits_size),
    .auto_coupler_to_device_named_spi_0_control_xing_out_a_bits_source(pbus_auto_coupler_to_device_named_spi_0_control_xing_out_a_bits_source),
    .auto_coupler_to_device_named_spi_0_control_xing_out_a_bits_address(pbus_auto_coupler_to_device_named_spi_0_control_xing_out_a_bits_address),
    .auto_coupler_to_device_named_spi_0_control_xing_out_a_bits_mask(pbus_auto_coupler_to_device_named_spi_0_control_xing_out_a_bits_mask),
    .auto_coupler_to_device_named_spi_0_control_xing_out_a_bits_data(pbus_auto_coupler_to_device_named_spi_0_control_xing_out_a_bits_data),
    .auto_coupler_to_device_named_spi_0_control_xing_out_a_bits_corrupt(pbus_auto_coupler_to_device_named_spi_0_control_xing_out_a_bits_corrupt),
    .auto_coupler_to_device_named_spi_0_control_xing_out_d_ready(pbus_auto_coupler_to_device_named_spi_0_control_xing_out_d_ready),
    .auto_coupler_to_device_named_spi_0_control_xing_out_d_valid(pbus_auto_coupler_to_device_named_spi_0_control_xing_out_d_valid),
    .auto_coupler_to_device_named_spi_0_control_xing_out_d_bits_opcode(pbus_auto_coupler_to_device_named_spi_0_control_xing_out_d_bits_opcode),
    .auto_coupler_to_device_named_spi_0_control_xing_out_d_bits_size(pbus_auto_coupler_to_device_named_spi_0_control_xing_out_d_bits_size),
    .auto_coupler_to_device_named_spi_0_control_xing_out_d_bits_source(pbus_auto_coupler_to_device_named_spi_0_control_xing_out_d_bits_source),
    .auto_coupler_to_device_named_spi_0_control_xing_out_d_bits_data(pbus_auto_coupler_to_device_named_spi_0_control_xing_out_d_bits_data),
    .auto_coupler_to_slave_named_uart_0_control_xing_out_a_ready(pbus_auto_coupler_to_slave_named_uart_0_control_xing_out_a_ready),
    .auto_coupler_to_slave_named_uart_0_control_xing_out_a_valid(pbus_auto_coupler_to_slave_named_uart_0_control_xing_out_a_valid),
    .auto_coupler_to_slave_named_uart_0_control_xing_out_a_bits_opcode(pbus_auto_coupler_to_slave_named_uart_0_control_xing_out_a_bits_opcode),
    .auto_coupler_to_slave_named_uart_0_control_xing_out_a_bits_param(pbus_auto_coupler_to_slave_named_uart_0_control_xing_out_a_bits_param),
    .auto_coupler_to_slave_named_uart_0_control_xing_out_a_bits_size(pbus_auto_coupler_to_slave_named_uart_0_control_xing_out_a_bits_size),
    .auto_coupler_to_slave_named_uart_0_control_xing_out_a_bits_source(pbus_auto_coupler_to_slave_named_uart_0_control_xing_out_a_bits_source),
    .auto_coupler_to_slave_named_uart_0_control_xing_out_a_bits_address(pbus_auto_coupler_to_slave_named_uart_0_control_xing_out_a_bits_address),
    .auto_coupler_to_slave_named_uart_0_control_xing_out_a_bits_mask(pbus_auto_coupler_to_slave_named_uart_0_control_xing_out_a_bits_mask),
    .auto_coupler_to_slave_named_uart_0_control_xing_out_a_bits_data(pbus_auto_coupler_to_slave_named_uart_0_control_xing_out_a_bits_data),
    .auto_coupler_to_slave_named_uart_0_control_xing_out_a_bits_corrupt(pbus_auto_coupler_to_slave_named_uart_0_control_xing_out_a_bits_corrupt),
    .auto_coupler_to_slave_named_uart_0_control_xing_out_d_ready(pbus_auto_coupler_to_slave_named_uart_0_control_xing_out_d_ready),
    .auto_coupler_to_slave_named_uart_0_control_xing_out_d_valid(pbus_auto_coupler_to_slave_named_uart_0_control_xing_out_d_valid),
    .auto_coupler_to_slave_named_uart_0_control_xing_out_d_bits_opcode(pbus_auto_coupler_to_slave_named_uart_0_control_xing_out_d_bits_opcode),
    .auto_coupler_to_slave_named_uart_0_control_xing_out_d_bits_size(pbus_auto_coupler_to_slave_named_uart_0_control_xing_out_d_bits_size),
    .auto_coupler_to_slave_named_uart_0_control_xing_out_d_bits_source(pbus_auto_coupler_to_slave_named_uart_0_control_xing_out_d_bits_source),
    .auto_coupler_to_slave_named_uart_0_control_xing_out_d_bits_data(pbus_auto_coupler_to_slave_named_uart_0_control_xing_out_d_bits_data),
    .auto_from_cbus_in_a_ready(pbus_auto_from_cbus_in_a_ready),
    .auto_from_cbus_in_a_valid(pbus_auto_from_cbus_in_a_valid),
    .auto_from_cbus_in_a_bits_opcode(pbus_auto_from_cbus_in_a_bits_opcode),
    .auto_from_cbus_in_a_bits_param(pbus_auto_from_cbus_in_a_bits_param),
    .auto_from_cbus_in_a_bits_size(pbus_auto_from_cbus_in_a_bits_size),
    .auto_from_cbus_in_a_bits_source(pbus_auto_from_cbus_in_a_bits_source),
    .auto_from_cbus_in_a_bits_address(pbus_auto_from_cbus_in_a_bits_address),
    .auto_from_cbus_in_a_bits_mask(pbus_auto_from_cbus_in_a_bits_mask),
    .auto_from_cbus_in_a_bits_data(pbus_auto_from_cbus_in_a_bits_data),
    .auto_from_cbus_in_a_bits_corrupt(pbus_auto_from_cbus_in_a_bits_corrupt),
    .auto_from_cbus_in_d_ready(pbus_auto_from_cbus_in_d_ready),
    .auto_from_cbus_in_d_valid(pbus_auto_from_cbus_in_d_valid),
    .auto_from_cbus_in_d_bits_opcode(pbus_auto_from_cbus_in_d_bits_opcode),
    .auto_from_cbus_in_d_bits_param(pbus_auto_from_cbus_in_d_bits_param),
    .auto_from_cbus_in_d_bits_size(pbus_auto_from_cbus_in_d_bits_size),
    .auto_from_cbus_in_d_bits_source(pbus_auto_from_cbus_in_d_bits_source),
    .auto_from_cbus_in_d_bits_sink(pbus_auto_from_cbus_in_d_bits_sink),
    .auto_from_cbus_in_d_bits_denied(pbus_auto_from_cbus_in_d_bits_denied),
    .auto_from_cbus_in_d_bits_data(pbus_auto_from_cbus_in_d_bits_data),
    .auto_from_cbus_in_d_bits_corrupt(pbus_auto_from_cbus_in_d_bits_corrupt)
  );
  TLBroadcast bh ( 
    .clock(bh_clock),
    .reset(bh_reset),
    .auto_in_a_ready(bh_auto_in_a_ready),
    .auto_in_a_valid(bh_auto_in_a_valid),
    .auto_in_a_bits_opcode(bh_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(bh_auto_in_a_bits_param),
    .auto_in_a_bits_size(bh_auto_in_a_bits_size),
    .auto_in_a_bits_source(bh_auto_in_a_bits_source),
    .auto_in_a_bits_address(bh_auto_in_a_bits_address),
    .auto_in_a_bits_mask(bh_auto_in_a_bits_mask),
    .auto_in_a_bits_data(bh_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(bh_auto_in_a_bits_corrupt),
    .auto_in_b_ready(bh_auto_in_b_ready),
    .auto_in_b_valid(bh_auto_in_b_valid),
    .auto_in_b_bits_param(bh_auto_in_b_bits_param),
    .auto_in_b_bits_source(bh_auto_in_b_bits_source),
    .auto_in_b_bits_address(bh_auto_in_b_bits_address),
    .auto_in_c_ready(bh_auto_in_c_ready),
    .auto_in_c_valid(bh_auto_in_c_valid),
    .auto_in_c_bits_opcode(bh_auto_in_c_bits_opcode),
    .auto_in_c_bits_param(bh_auto_in_c_bits_param),
    .auto_in_c_bits_size(bh_auto_in_c_bits_size),
    .auto_in_c_bits_source(bh_auto_in_c_bits_source),
    .auto_in_c_bits_address(bh_auto_in_c_bits_address),
    .auto_in_c_bits_data(bh_auto_in_c_bits_data),
    .auto_in_c_bits_corrupt(bh_auto_in_c_bits_corrupt),
    .auto_in_d_ready(bh_auto_in_d_ready),
    .auto_in_d_valid(bh_auto_in_d_valid),
    .auto_in_d_bits_opcode(bh_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(bh_auto_in_d_bits_param),
    .auto_in_d_bits_size(bh_auto_in_d_bits_size),
    .auto_in_d_bits_source(bh_auto_in_d_bits_source),
    .auto_in_d_bits_sink(bh_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(bh_auto_in_d_bits_denied),
    .auto_in_d_bits_data(bh_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(bh_auto_in_d_bits_corrupt),
    .auto_in_e_valid(bh_auto_in_e_valid),
    .auto_in_e_bits_sink(bh_auto_in_e_bits_sink),
    .auto_out_a_ready(bh_auto_out_a_ready),
    .auto_out_a_valid(bh_auto_out_a_valid),
    .auto_out_a_bits_opcode(bh_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(bh_auto_out_a_bits_param),
    .auto_out_a_bits_size(bh_auto_out_a_bits_size),
    .auto_out_a_bits_source(bh_auto_out_a_bits_source),
    .auto_out_a_bits_address(bh_auto_out_a_bits_address),
    .auto_out_a_bits_mask(bh_auto_out_a_bits_mask),
    .auto_out_a_bits_data(bh_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt(bh_auto_out_a_bits_corrupt),
    .auto_out_d_ready(bh_auto_out_d_ready),
    .auto_out_d_valid(bh_auto_out_d_valid),
    .auto_out_d_bits_opcode(bh_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(bh_auto_out_d_bits_param),
    .auto_out_d_bits_size(bh_auto_out_d_bits_size),
    .auto_out_d_bits_source(bh_auto_out_d_bits_source),
    .auto_out_d_bits_denied(bh_auto_out_d_bits_denied),
    .auto_out_d_bits_data(bh_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(bh_auto_out_d_bits_corrupt)
  );
  TLWidthWidget_4 ww ( 
    .clock(ww_clock),
    .reset(ww_reset),
    .auto_in_a_ready(ww_auto_in_a_ready),
    .auto_in_a_valid(ww_auto_in_a_valid),
    .auto_in_a_bits_opcode(ww_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(ww_auto_in_a_bits_param),
    .auto_in_a_bits_size(ww_auto_in_a_bits_size),
    .auto_in_a_bits_source(ww_auto_in_a_bits_source),
    .auto_in_a_bits_address(ww_auto_in_a_bits_address),
    .auto_in_a_bits_mask(ww_auto_in_a_bits_mask),
    .auto_in_a_bits_data(ww_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(ww_auto_in_a_bits_corrupt),
    .auto_in_d_ready(ww_auto_in_d_ready),
    .auto_in_d_valid(ww_auto_in_d_valid),
    .auto_in_d_bits_opcode(ww_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(ww_auto_in_d_bits_param),
    .auto_in_d_bits_size(ww_auto_in_d_bits_size),
    .auto_in_d_bits_source(ww_auto_in_d_bits_source),
    .auto_in_d_bits_denied(ww_auto_in_d_bits_denied),
    .auto_in_d_bits_data(ww_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(ww_auto_in_d_bits_corrupt),
    .auto_out_a_ready(ww_auto_out_a_ready),
    .auto_out_a_valid(ww_auto_out_a_valid),
    .auto_out_a_bits_opcode(ww_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(ww_auto_out_a_bits_param),
    .auto_out_a_bits_size(ww_auto_out_a_bits_size),
    .auto_out_a_bits_source(ww_auto_out_a_bits_source),
    .auto_out_a_bits_address(ww_auto_out_a_bits_address),
    .auto_out_a_bits_mask(ww_auto_out_a_bits_mask),
    .auto_out_a_bits_data(ww_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt(ww_auto_out_a_bits_corrupt),
    .auto_out_d_ready(ww_auto_out_d_ready),
    .auto_out_d_valid(ww_auto_out_d_valid),
    .auto_out_d_bits_opcode(ww_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(ww_auto_out_d_bits_param),
    .auto_out_d_bits_size(ww_auto_out_d_bits_size),
    .auto_out_d_bits_source(ww_auto_out_d_bits_source),
    .auto_out_d_bits_sink(ww_auto_out_d_bits_sink),
    .auto_out_d_bits_denied(ww_auto_out_d_bits_denied),
    .auto_out_d_bits_data(ww_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(ww_auto_out_d_bits_corrupt)
  );
  MemoryBus mbus ( 
    .clock(mbus_clock),
    .reset(mbus_reset),
    .auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_a_ready(mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_a_ready),
    .auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_a_valid(mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_a_valid),
    .auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_a_bits_opcode(mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_a_bits_opcode),
    .auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_a_bits_param(mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_a_bits_param),
    .auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_a_bits_size(mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_a_bits_size),
    .auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_a_bits_source(mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_a_bits_source),
    .auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_a_bits_address(mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_a_bits_address),
    .auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_a_bits_mask(mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_a_bits_mask),
    .auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_a_bits_data(mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_a_bits_data),
    .auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_a_bits_corrupt(mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_a_bits_corrupt),
    .auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_d_ready(mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_d_ready),
    .auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_d_valid(mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_d_valid),
    .auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_d_bits_opcode(mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_d_bits_opcode),
    .auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_d_bits_param(mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_d_bits_param),
    .auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_d_bits_size(mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_d_bits_size),
    .auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_d_bits_source(mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_d_bits_source),
    .auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_d_bits_sink(mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_d_bits_sink),
    .auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_d_bits_denied(mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_d_bits_denied),
    .auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_d_bits_data(mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_d_bits_data),
    .auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_d_bits_corrupt(mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_d_bits_corrupt),
    .auto_coupler_from_coherence_manager_binder_in_a_ready(mbus_auto_coupler_from_coherence_manager_binder_in_a_ready),
    .auto_coupler_from_coherence_manager_binder_in_a_valid(mbus_auto_coupler_from_coherence_manager_binder_in_a_valid),
    .auto_coupler_from_coherence_manager_binder_in_a_bits_opcode(mbus_auto_coupler_from_coherence_manager_binder_in_a_bits_opcode),
    .auto_coupler_from_coherence_manager_binder_in_a_bits_param(mbus_auto_coupler_from_coherence_manager_binder_in_a_bits_param),
    .auto_coupler_from_coherence_manager_binder_in_a_bits_size(mbus_auto_coupler_from_coherence_manager_binder_in_a_bits_size),
    .auto_coupler_from_coherence_manager_binder_in_a_bits_source(mbus_auto_coupler_from_coherence_manager_binder_in_a_bits_source),
    .auto_coupler_from_coherence_manager_binder_in_a_bits_address(mbus_auto_coupler_from_coherence_manager_binder_in_a_bits_address),
    .auto_coupler_from_coherence_manager_binder_in_a_bits_mask(mbus_auto_coupler_from_coherence_manager_binder_in_a_bits_mask),
    .auto_coupler_from_coherence_manager_binder_in_a_bits_data(mbus_auto_coupler_from_coherence_manager_binder_in_a_bits_data),
    .auto_coupler_from_coherence_manager_binder_in_a_bits_corrupt(mbus_auto_coupler_from_coherence_manager_binder_in_a_bits_corrupt),
    .auto_coupler_from_coherence_manager_binder_in_d_ready(mbus_auto_coupler_from_coherence_manager_binder_in_d_ready),
    .auto_coupler_from_coherence_manager_binder_in_d_valid(mbus_auto_coupler_from_coherence_manager_binder_in_d_valid),
    .auto_coupler_from_coherence_manager_binder_in_d_bits_opcode(mbus_auto_coupler_from_coherence_manager_binder_in_d_bits_opcode),
    .auto_coupler_from_coherence_manager_binder_in_d_bits_param(mbus_auto_coupler_from_coherence_manager_binder_in_d_bits_param),
    .auto_coupler_from_coherence_manager_binder_in_d_bits_size(mbus_auto_coupler_from_coherence_manager_binder_in_d_bits_size),
    .auto_coupler_from_coherence_manager_binder_in_d_bits_source(mbus_auto_coupler_from_coherence_manager_binder_in_d_bits_source),
    .auto_coupler_from_coherence_manager_binder_in_d_bits_sink(mbus_auto_coupler_from_coherence_manager_binder_in_d_bits_sink),
    .auto_coupler_from_coherence_manager_binder_in_d_bits_denied(mbus_auto_coupler_from_coherence_manager_binder_in_d_bits_denied),
    .auto_coupler_from_coherence_manager_binder_in_d_bits_data(mbus_auto_coupler_from_coherence_manager_binder_in_d_bits_data),
    .auto_coupler_from_coherence_manager_binder_in_d_bits_corrupt(mbus_auto_coupler_from_coherence_manager_binder_in_d_bits_corrupt)
  );
  TLPLIC plic ( 
    .clock(plic_clock),
    .reset(plic_reset),
    .auto_int_in_0(plic_auto_int_in_0),
    .auto_int_in_1(plic_auto_int_in_1),
    .auto_int_in_2(plic_auto_int_in_2),
    .auto_int_in_3(plic_auto_int_in_3),
    .auto_int_in_4(plic_auto_int_in_4),
    .auto_int_in_5(plic_auto_int_in_5),
    .auto_int_in_6(plic_auto_int_in_6),
    .auto_int_out_7_0(plic_auto_int_out_7_0),
    .auto_int_out_6_0(plic_auto_int_out_6_0),
    .auto_int_out_5_0(plic_auto_int_out_5_0),
    .auto_int_out_4_0(plic_auto_int_out_4_0),
    .auto_int_out_3_0(plic_auto_int_out_3_0),
    .auto_int_out_2_0(plic_auto_int_out_2_0),
    .auto_int_out_1_0(plic_auto_int_out_1_0),
    .auto_int_out_0_0(plic_auto_int_out_0_0),
    .auto_in_a_ready(plic_auto_in_a_ready),
    .auto_in_a_valid(plic_auto_in_a_valid),
    .auto_in_a_bits_opcode(plic_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(plic_auto_in_a_bits_param),
    .auto_in_a_bits_size(plic_auto_in_a_bits_size),
    .auto_in_a_bits_source(plic_auto_in_a_bits_source),
    .auto_in_a_bits_address(plic_auto_in_a_bits_address),
    .auto_in_a_bits_mask(plic_auto_in_a_bits_mask),
    .auto_in_a_bits_data(plic_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(plic_auto_in_a_bits_corrupt),
    .auto_in_d_ready(plic_auto_in_d_ready),
    .auto_in_d_valid(plic_auto_in_d_valid),
    .auto_in_d_bits_opcode(plic_auto_in_d_bits_opcode),
    .auto_in_d_bits_size(plic_auto_in_d_bits_size),
    .auto_in_d_bits_source(plic_auto_in_d_bits_source),
    .auto_in_d_bits_data(plic_auto_in_d_bits_data)
  );
  CLINT clint ( 
    .clock(clint_clock),
    .reset(clint_reset),
    .auto_int_out_3_0(clint_auto_int_out_3_0),
    .auto_int_out_3_1(clint_auto_int_out_3_1),
    .auto_int_out_2_0(clint_auto_int_out_2_0),
    .auto_int_out_2_1(clint_auto_int_out_2_1),
    .auto_int_out_1_0(clint_auto_int_out_1_0),
    .auto_int_out_1_1(clint_auto_int_out_1_1),
    .auto_int_out_0_0(clint_auto_int_out_0_0),
    .auto_int_out_0_1(clint_auto_int_out_0_1),
    .auto_in_a_ready(clint_auto_in_a_ready),
    .auto_in_a_valid(clint_auto_in_a_valid),
    .auto_in_a_bits_opcode(clint_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(clint_auto_in_a_bits_param),
    .auto_in_a_bits_size(clint_auto_in_a_bits_size),
    .auto_in_a_bits_source(clint_auto_in_a_bits_source),
    .auto_in_a_bits_address(clint_auto_in_a_bits_address),
    .auto_in_a_bits_mask(clint_auto_in_a_bits_mask),
    .auto_in_a_bits_data(clint_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(clint_auto_in_a_bits_corrupt),
    .auto_in_d_ready(clint_auto_in_d_ready),
    .auto_in_d_valid(clint_auto_in_d_valid),
    .auto_in_d_bits_opcode(clint_auto_in_d_bits_opcode),
    .auto_in_d_bits_size(clint_auto_in_d_bits_size),
    .auto_in_d_bits_source(clint_auto_in_d_bits_source),
    .auto_in_d_bits_data(clint_auto_in_d_bits_data),
    .io_rtcTick(clint_io_rtcTick)
  );
  TLDebugModule debug_1 ( 
    .clock(debug_1_clock),
    .reset(debug_1_reset),
    .auto_dmInner_dmInner_tl_in_a_ready(debug_1_auto_dmInner_dmInner_tl_in_a_ready),
    .auto_dmInner_dmInner_tl_in_a_valid(debug_1_auto_dmInner_dmInner_tl_in_a_valid),
    .auto_dmInner_dmInner_tl_in_a_bits_opcode(debug_1_auto_dmInner_dmInner_tl_in_a_bits_opcode),
    .auto_dmInner_dmInner_tl_in_a_bits_param(debug_1_auto_dmInner_dmInner_tl_in_a_bits_param),
    .auto_dmInner_dmInner_tl_in_a_bits_size(debug_1_auto_dmInner_dmInner_tl_in_a_bits_size),
    .auto_dmInner_dmInner_tl_in_a_bits_source(debug_1_auto_dmInner_dmInner_tl_in_a_bits_source),
    .auto_dmInner_dmInner_tl_in_a_bits_address(debug_1_auto_dmInner_dmInner_tl_in_a_bits_address),
    .auto_dmInner_dmInner_tl_in_a_bits_mask(debug_1_auto_dmInner_dmInner_tl_in_a_bits_mask),
    .auto_dmInner_dmInner_tl_in_a_bits_data(debug_1_auto_dmInner_dmInner_tl_in_a_bits_data),
    .auto_dmInner_dmInner_tl_in_a_bits_corrupt(debug_1_auto_dmInner_dmInner_tl_in_a_bits_corrupt),
    .auto_dmInner_dmInner_tl_in_d_ready(debug_1_auto_dmInner_dmInner_tl_in_d_ready),
    .auto_dmInner_dmInner_tl_in_d_valid(debug_1_auto_dmInner_dmInner_tl_in_d_valid),
    .auto_dmInner_dmInner_tl_in_d_bits_opcode(debug_1_auto_dmInner_dmInner_tl_in_d_bits_opcode),
    .auto_dmInner_dmInner_tl_in_d_bits_size(debug_1_auto_dmInner_dmInner_tl_in_d_bits_size),
    .auto_dmInner_dmInner_tl_in_d_bits_source(debug_1_auto_dmInner_dmInner_tl_in_d_bits_source),
    .auto_dmInner_dmInner_tl_in_d_bits_data(debug_1_auto_dmInner_dmInner_tl_in_d_bits_data),
    .auto_dmOuter_intsource_out_3_sync_0(debug_1_auto_dmOuter_intsource_out_3_sync_0),
    .auto_dmOuter_intsource_out_2_sync_0(debug_1_auto_dmOuter_intsource_out_2_sync_0),
    .auto_dmOuter_intsource_out_1_sync_0(debug_1_auto_dmOuter_intsource_out_1_sync_0),
    .auto_dmOuter_intsource_out_0_sync_0(debug_1_auto_dmOuter_intsource_out_0_sync_0),
    .io_ctrl_ndreset(debug_1_io_ctrl_ndreset),
    .io_dmi_dmi_req_ready(debug_1_io_dmi_dmi_req_ready),
    .io_dmi_dmi_req_valid(debug_1_io_dmi_dmi_req_valid),
    .io_dmi_dmi_req_bits_addr(debug_1_io_dmi_dmi_req_bits_addr),
    .io_dmi_dmi_req_bits_data(debug_1_io_dmi_dmi_req_bits_data),
    .io_dmi_dmi_req_bits_op(debug_1_io_dmi_dmi_req_bits_op),
    .io_dmi_dmi_resp_ready(debug_1_io_dmi_dmi_resp_ready),
    .io_dmi_dmi_resp_valid(debug_1_io_dmi_dmi_resp_valid),
    .io_dmi_dmi_resp_bits_data(debug_1_io_dmi_dmi_resp_bits_data),
    .io_dmi_dmi_resp_bits_resp(debug_1_io_dmi_dmi_resp_bits_resp),
    .io_dmi_dmiClock(debug_1_io_dmi_dmiClock),
    .io_dmi_dmiReset(debug_1_io_dmi_dmiReset)
  );

  wire all_tile_async_rst;

  ResetCatchAndSync_d3 all_tile_reset_ResetCatchAndSync_d3 ( 
    .clock(tile_clock),
    .reset(tile_reset|all_tile_sft_rst),
    .io_sync_reset(all_tile_async_rst)
  );

  // wire tile_0_async_rst;

  // ResetCatchAndSync_d3 tile_0_reset_ResetCatchAndSync_d3 ( 
  //   .clock(tile_clock),
  //   .reset(tile_reset|tile_0_sft_rst),
  //   .io_sync_reset(tile_0_async_rst)
  // );

  syncReg #(
      .STAGES(2)
  ) u_debug_mode_sel_latch_async (
      .clk_i(tile_clock),
      .serial_i(debug_mode_sel_latch_async),
      .serial_o(debug_mode_sel_latch)
  );

  RocketTile tile ( 
    .debug_mode_sel_latch(debug_mode_sel_latch),
    .reset_vector_msb_32(reset_vector_msb_32),
    .clock(tile_clock),
    .reset(all_tile_async_rst),
    .auto_intsink_in_sync_0(tile_auto_intsink_in_sync_0),
    .auto_int_in_xing_in_2_sync_0(tile_auto_int_in_xing_in_2_sync_0),
    .auto_int_in_xing_in_1_sync_0(tile_auto_int_in_xing_in_1_sync_0),
    .auto_int_in_xing_in_0_sync_0(tile_auto_int_in_xing_in_0_sync_0),
    .auto_int_in_xing_in_0_sync_1(tile_auto_int_in_xing_in_0_sync_1),
    .auto_tl_master_xing_out_a_ready(tile_auto_tl_master_xing_out_a_ready),
    .auto_tl_master_xing_out_a_valid(tile_auto_tl_master_xing_out_a_valid),
    .auto_tl_master_xing_out_a_bits_opcode(tile_auto_tl_master_xing_out_a_bits_opcode),
    .auto_tl_master_xing_out_a_bits_param(tile_auto_tl_master_xing_out_a_bits_param),
    .auto_tl_master_xing_out_a_bits_size(tile_auto_tl_master_xing_out_a_bits_size),
    .auto_tl_master_xing_out_a_bits_source(tile_auto_tl_master_xing_out_a_bits_source),
    .auto_tl_master_xing_out_a_bits_address(tile_auto_tl_master_xing_out_a_bits_address),
    .auto_tl_master_xing_out_a_bits_mask(tile_auto_tl_master_xing_out_a_bits_mask),
    .auto_tl_master_xing_out_a_bits_data(tile_auto_tl_master_xing_out_a_bits_data),
    .auto_tl_master_xing_out_a_bits_corrupt(tile_auto_tl_master_xing_out_a_bits_corrupt),
    .auto_tl_master_xing_out_b_ready(tile_auto_tl_master_xing_out_b_ready),
    .auto_tl_master_xing_out_b_valid(tile_auto_tl_master_xing_out_b_valid),
    .auto_tl_master_xing_out_b_bits_opcode(tile_auto_tl_master_xing_out_b_bits_opcode),
    .auto_tl_master_xing_out_b_bits_param(tile_auto_tl_master_xing_out_b_bits_param),
    .auto_tl_master_xing_out_b_bits_size(tile_auto_tl_master_xing_out_b_bits_size),
    .auto_tl_master_xing_out_b_bits_source(tile_auto_tl_master_xing_out_b_bits_source),
    .auto_tl_master_xing_out_b_bits_address(tile_auto_tl_master_xing_out_b_bits_address),
    .auto_tl_master_xing_out_b_bits_mask(tile_auto_tl_master_xing_out_b_bits_mask),
    .auto_tl_master_xing_out_b_bits_corrupt(tile_auto_tl_master_xing_out_b_bits_corrupt),
    .auto_tl_master_xing_out_c_ready(tile_auto_tl_master_xing_out_c_ready),
    .auto_tl_master_xing_out_c_valid(tile_auto_tl_master_xing_out_c_valid),
    .auto_tl_master_xing_out_c_bits_opcode(tile_auto_tl_master_xing_out_c_bits_opcode),
    .auto_tl_master_xing_out_c_bits_param(tile_auto_tl_master_xing_out_c_bits_param),
    .auto_tl_master_xing_out_c_bits_size(tile_auto_tl_master_xing_out_c_bits_size),
    .auto_tl_master_xing_out_c_bits_source(tile_auto_tl_master_xing_out_c_bits_source),
    .auto_tl_master_xing_out_c_bits_address(tile_auto_tl_master_xing_out_c_bits_address),
    .auto_tl_master_xing_out_c_bits_data(tile_auto_tl_master_xing_out_c_bits_data),
    .auto_tl_master_xing_out_c_bits_corrupt(tile_auto_tl_master_xing_out_c_bits_corrupt),
    .auto_tl_master_xing_out_d_ready(tile_auto_tl_master_xing_out_d_ready),
    .auto_tl_master_xing_out_d_valid(tile_auto_tl_master_xing_out_d_valid),
    .auto_tl_master_xing_out_d_bits_opcode(tile_auto_tl_master_xing_out_d_bits_opcode),
    .auto_tl_master_xing_out_d_bits_param(tile_auto_tl_master_xing_out_d_bits_param),
    .auto_tl_master_xing_out_d_bits_size(tile_auto_tl_master_xing_out_d_bits_size),
    .auto_tl_master_xing_out_d_bits_source(tile_auto_tl_master_xing_out_d_bits_source),
    .auto_tl_master_xing_out_d_bits_sink(tile_auto_tl_master_xing_out_d_bits_sink),
    .auto_tl_master_xing_out_d_bits_denied(tile_auto_tl_master_xing_out_d_bits_denied),
    .auto_tl_master_xing_out_d_bits_data(tile_auto_tl_master_xing_out_d_bits_data),
    .auto_tl_master_xing_out_d_bits_corrupt(tile_auto_tl_master_xing_out_d_bits_corrupt),
    .auto_tl_master_xing_out_e_ready(tile_auto_tl_master_xing_out_e_ready),
    .auto_tl_master_xing_out_e_valid(tile_auto_tl_master_xing_out_e_valid),
    .auto_tl_master_xing_out_e_bits_sink(tile_auto_tl_master_xing_out_e_bits_sink),
    .constants_hartid(tile_constants_hartid)
  );
  IntSyncCrossingSource_2 intsource ( 
    .clock(intsource_clock),
    .reset(intsource_reset),
    .auto_in_0(intsource_auto_in_0),
    .auto_in_1(intsource_auto_in_1),
    .auto_out_sync_0(intsource_auto_out_sync_0),
    .auto_out_sync_1(intsource_auto_out_sync_1)
  );
  IntSyncCrossingSource_3 intsource_1 ( 
    .clock(intsource_1_clock),
    .reset(intsource_1_reset),
    .auto_in_0(intsource_1_auto_in_0),
    .auto_out_sync_0(intsource_1_auto_out_sync_0)
  );
  IntSyncCrossingSource_3 intsource_2 ( 
    .clock(intsource_2_clock),
    .reset(intsource_2_reset),
    .auto_in_0(intsource_2_auto_in_0),
    .auto_out_sync_0(intsource_2_auto_out_sync_0)
  );
  
  // wire tile_1_async_rst;

  // ResetCatchAndSync_d3 tile_1_reset_ResetCatchAndSync_d3 ( 
  //   .clock(tile_1_clock),
  //   .reset(tile_1_reset|tile_1_sft_rst),
  //   .io_sync_reset(tile_1_async_rst)
  // );

  RocketTile tile_1 ( 
    .debug_mode_sel_latch(debug_mode_sel_latch),
    .reset_vector_msb_32(reset_vector_msb_32),
    .clock(tile_1_clock),
    .reset(all_tile_async_rst),
    .auto_intsink_in_sync_0(tile_1_auto_intsink_in_sync_0),
    .auto_int_in_xing_in_2_sync_0(tile_1_auto_int_in_xing_in_2_sync_0),
    .auto_int_in_xing_in_1_sync_0(tile_1_auto_int_in_xing_in_1_sync_0),
    .auto_int_in_xing_in_0_sync_0(tile_1_auto_int_in_xing_in_0_sync_0),
    .auto_int_in_xing_in_0_sync_1(tile_1_auto_int_in_xing_in_0_sync_1),
    .auto_tl_master_xing_out_a_ready(tile_1_auto_tl_master_xing_out_a_ready),
    .auto_tl_master_xing_out_a_valid(tile_1_auto_tl_master_xing_out_a_valid),
    .auto_tl_master_xing_out_a_bits_opcode(tile_1_auto_tl_master_xing_out_a_bits_opcode),
    .auto_tl_master_xing_out_a_bits_param(tile_1_auto_tl_master_xing_out_a_bits_param),
    .auto_tl_master_xing_out_a_bits_size(tile_1_auto_tl_master_xing_out_a_bits_size),
    .auto_tl_master_xing_out_a_bits_source(tile_1_auto_tl_master_xing_out_a_bits_source),
    .auto_tl_master_xing_out_a_bits_address(tile_1_auto_tl_master_xing_out_a_bits_address),
    .auto_tl_master_xing_out_a_bits_mask(tile_1_auto_tl_master_xing_out_a_bits_mask),
    .auto_tl_master_xing_out_a_bits_data(tile_1_auto_tl_master_xing_out_a_bits_data),
    .auto_tl_master_xing_out_a_bits_corrupt(tile_1_auto_tl_master_xing_out_a_bits_corrupt),
    .auto_tl_master_xing_out_b_ready(tile_1_auto_tl_master_xing_out_b_ready),
    .auto_tl_master_xing_out_b_valid(tile_1_auto_tl_master_xing_out_b_valid),
    .auto_tl_master_xing_out_b_bits_opcode(tile_1_auto_tl_master_xing_out_b_bits_opcode),
    .auto_tl_master_xing_out_b_bits_param(tile_1_auto_tl_master_xing_out_b_bits_param),
    .auto_tl_master_xing_out_b_bits_size(tile_1_auto_tl_master_xing_out_b_bits_size),
    .auto_tl_master_xing_out_b_bits_source(tile_1_auto_tl_master_xing_out_b_bits_source),
    .auto_tl_master_xing_out_b_bits_address(tile_1_auto_tl_master_xing_out_b_bits_address),
    .auto_tl_master_xing_out_b_bits_mask(tile_1_auto_tl_master_xing_out_b_bits_mask),
    .auto_tl_master_xing_out_b_bits_corrupt(tile_1_auto_tl_master_xing_out_b_bits_corrupt),
    .auto_tl_master_xing_out_c_ready(tile_1_auto_tl_master_xing_out_c_ready),
    .auto_tl_master_xing_out_c_valid(tile_1_auto_tl_master_xing_out_c_valid),
    .auto_tl_master_xing_out_c_bits_opcode(tile_1_auto_tl_master_xing_out_c_bits_opcode),
    .auto_tl_master_xing_out_c_bits_param(tile_1_auto_tl_master_xing_out_c_bits_param),
    .auto_tl_master_xing_out_c_bits_size(tile_1_auto_tl_master_xing_out_c_bits_size),
    .auto_tl_master_xing_out_c_bits_source(tile_1_auto_tl_master_xing_out_c_bits_source),
    .auto_tl_master_xing_out_c_bits_address(tile_1_auto_tl_master_xing_out_c_bits_address),
    .auto_tl_master_xing_out_c_bits_data(tile_1_auto_tl_master_xing_out_c_bits_data),
    .auto_tl_master_xing_out_c_bits_corrupt(tile_1_auto_tl_master_xing_out_c_bits_corrupt),
    .auto_tl_master_xing_out_d_ready(tile_1_auto_tl_master_xing_out_d_ready),
    .auto_tl_master_xing_out_d_valid(tile_1_auto_tl_master_xing_out_d_valid),
    .auto_tl_master_xing_out_d_bits_opcode(tile_1_auto_tl_master_xing_out_d_bits_opcode),
    .auto_tl_master_xing_out_d_bits_param(tile_1_auto_tl_master_xing_out_d_bits_param),
    .auto_tl_master_xing_out_d_bits_size(tile_1_auto_tl_master_xing_out_d_bits_size),
    .auto_tl_master_xing_out_d_bits_source(tile_1_auto_tl_master_xing_out_d_bits_source),
    .auto_tl_master_xing_out_d_bits_sink(tile_1_auto_tl_master_xing_out_d_bits_sink),
    .auto_tl_master_xing_out_d_bits_denied(tile_1_auto_tl_master_xing_out_d_bits_denied),
    .auto_tl_master_xing_out_d_bits_data(tile_1_auto_tl_master_xing_out_d_bits_data),
    .auto_tl_master_xing_out_d_bits_corrupt(tile_1_auto_tl_master_xing_out_d_bits_corrupt),
    .auto_tl_master_xing_out_e_ready(tile_1_auto_tl_master_xing_out_e_ready),
    .auto_tl_master_xing_out_e_valid(tile_1_auto_tl_master_xing_out_e_valid),
    .auto_tl_master_xing_out_e_bits_sink(tile_1_auto_tl_master_xing_out_e_bits_sink),
    .constants_hartid(tile_1_constants_hartid)
  );
  IntSyncCrossingSource_2 intsource_3 ( 
    .clock(intsource_3_clock),
    .reset(intsource_3_reset),
    .auto_in_0(intsource_3_auto_in_0),
    .auto_in_1(intsource_3_auto_in_1),
    .auto_out_sync_0(intsource_3_auto_out_sync_0),
    .auto_out_sync_1(intsource_3_auto_out_sync_1)
  );
  IntSyncCrossingSource_3 intsource_4 ( 
    .clock(intsource_4_clock),
    .reset(intsource_4_reset),
    .auto_in_0(intsource_4_auto_in_0),
    .auto_out_sync_0(intsource_4_auto_out_sync_0)
  );
  IntSyncCrossingSource_3 intsource_5 ( 
    .clock(intsource_5_clock),
    .reset(intsource_5_reset),
    .auto_in_0(intsource_5_auto_in_0),
    .auto_out_sync_0(intsource_5_auto_out_sync_0)
  );

 
  // wire tile_2_async_rst;

  // ResetCatchAndSync_d3 tile_2_reset_ResetCatchAndSync_d3 ( 
  //   .clock(tile_2_clock),
  //   .reset(tile_2_reset|tile_2_sft_rst),
  //   .io_sync_reset(tile_2_async_rst)
  // );

  RocketTile tile_2 ( 
    .debug_mode_sel_latch(debug_mode_sel_latch),
    .reset_vector_msb_32(reset_vector_msb_32),
    .clock(tile_2_clock),
    .reset(all_tile_async_rst),
    .auto_intsink_in_sync_0(tile_2_auto_intsink_in_sync_0),
    .auto_int_in_xing_in_2_sync_0(tile_2_auto_int_in_xing_in_2_sync_0),
    .auto_int_in_xing_in_1_sync_0(tile_2_auto_int_in_xing_in_1_sync_0),
    .auto_int_in_xing_in_0_sync_0(tile_2_auto_int_in_xing_in_0_sync_0),
    .auto_int_in_xing_in_0_sync_1(tile_2_auto_int_in_xing_in_0_sync_1),
    .auto_tl_master_xing_out_a_ready(tile_2_auto_tl_master_xing_out_a_ready),
    .auto_tl_master_xing_out_a_valid(tile_2_auto_tl_master_xing_out_a_valid),
    .auto_tl_master_xing_out_a_bits_opcode(tile_2_auto_tl_master_xing_out_a_bits_opcode),
    .auto_tl_master_xing_out_a_bits_param(tile_2_auto_tl_master_xing_out_a_bits_param),
    .auto_tl_master_xing_out_a_bits_size(tile_2_auto_tl_master_xing_out_a_bits_size),
    .auto_tl_master_xing_out_a_bits_source(tile_2_auto_tl_master_xing_out_a_bits_source),
    .auto_tl_master_xing_out_a_bits_address(tile_2_auto_tl_master_xing_out_a_bits_address),
    .auto_tl_master_xing_out_a_bits_mask(tile_2_auto_tl_master_xing_out_a_bits_mask),
    .auto_tl_master_xing_out_a_bits_data(tile_2_auto_tl_master_xing_out_a_bits_data),
    .auto_tl_master_xing_out_a_bits_corrupt(tile_2_auto_tl_master_xing_out_a_bits_corrupt),
    .auto_tl_master_xing_out_b_ready(tile_2_auto_tl_master_xing_out_b_ready),
    .auto_tl_master_xing_out_b_valid(tile_2_auto_tl_master_xing_out_b_valid),
    .auto_tl_master_xing_out_b_bits_opcode(tile_2_auto_tl_master_xing_out_b_bits_opcode),
    .auto_tl_master_xing_out_b_bits_param(tile_2_auto_tl_master_xing_out_b_bits_param),
    .auto_tl_master_xing_out_b_bits_size(tile_2_auto_tl_master_xing_out_b_bits_size),
    .auto_tl_master_xing_out_b_bits_source(tile_2_auto_tl_master_xing_out_b_bits_source),
    .auto_tl_master_xing_out_b_bits_address(tile_2_auto_tl_master_xing_out_b_bits_address),
    .auto_tl_master_xing_out_b_bits_mask(tile_2_auto_tl_master_xing_out_b_bits_mask),
    .auto_tl_master_xing_out_b_bits_corrupt(tile_2_auto_tl_master_xing_out_b_bits_corrupt),
    .auto_tl_master_xing_out_c_ready(tile_2_auto_tl_master_xing_out_c_ready),
    .auto_tl_master_xing_out_c_valid(tile_2_auto_tl_master_xing_out_c_valid),
    .auto_tl_master_xing_out_c_bits_opcode(tile_2_auto_tl_master_xing_out_c_bits_opcode),
    .auto_tl_master_xing_out_c_bits_param(tile_2_auto_tl_master_xing_out_c_bits_param),
    .auto_tl_master_xing_out_c_bits_size(tile_2_auto_tl_master_xing_out_c_bits_size),
    .auto_tl_master_xing_out_c_bits_source(tile_2_auto_tl_master_xing_out_c_bits_source),
    .auto_tl_master_xing_out_c_bits_address(tile_2_auto_tl_master_xing_out_c_bits_address),
    .auto_tl_master_xing_out_c_bits_data(tile_2_auto_tl_master_xing_out_c_bits_data),
    .auto_tl_master_xing_out_c_bits_corrupt(tile_2_auto_tl_master_xing_out_c_bits_corrupt),
    .auto_tl_master_xing_out_d_ready(tile_2_auto_tl_master_xing_out_d_ready),
    .auto_tl_master_xing_out_d_valid(tile_2_auto_tl_master_xing_out_d_valid),
    .auto_tl_master_xing_out_d_bits_opcode(tile_2_auto_tl_master_xing_out_d_bits_opcode),
    .auto_tl_master_xing_out_d_bits_param(tile_2_auto_tl_master_xing_out_d_bits_param),
    .auto_tl_master_xing_out_d_bits_size(tile_2_auto_tl_master_xing_out_d_bits_size),
    .auto_tl_master_xing_out_d_bits_source(tile_2_auto_tl_master_xing_out_d_bits_source),
    .auto_tl_master_xing_out_d_bits_sink(tile_2_auto_tl_master_xing_out_d_bits_sink),
    .auto_tl_master_xing_out_d_bits_denied(tile_2_auto_tl_master_xing_out_d_bits_denied),
    .auto_tl_master_xing_out_d_bits_data(tile_2_auto_tl_master_xing_out_d_bits_data),
    .auto_tl_master_xing_out_d_bits_corrupt(tile_2_auto_tl_master_xing_out_d_bits_corrupt),
    .auto_tl_master_xing_out_e_ready(tile_2_auto_tl_master_xing_out_e_ready),
    .auto_tl_master_xing_out_e_valid(tile_2_auto_tl_master_xing_out_e_valid),
    .auto_tl_master_xing_out_e_bits_sink(tile_2_auto_tl_master_xing_out_e_bits_sink),
    .constants_hartid(tile_2_constants_hartid)
  );
  IntSyncCrossingSource_2 intsource_6 ( 
    .clock(intsource_6_clock),
    .reset(intsource_6_reset),
    .auto_in_0(intsource_6_auto_in_0),
    .auto_in_1(intsource_6_auto_in_1),
    .auto_out_sync_0(intsource_6_auto_out_sync_0),
    .auto_out_sync_1(intsource_6_auto_out_sync_1)
  );
  IntSyncCrossingSource_3 intsource_7 ( 
    .clock(intsource_7_clock),
    .reset(intsource_7_reset),
    .auto_in_0(intsource_7_auto_in_0),
    .auto_out_sync_0(intsource_7_auto_out_sync_0)
  );
  IntSyncCrossingSource_3 intsource_8 ( 
    .clock(intsource_8_clock),
    .reset(intsource_8_reset),
    .auto_in_0(intsource_8_auto_in_0),
    .auto_out_sync_0(intsource_8_auto_out_sync_0)
  );

  // wire tile_3_async_rst;

  // ResetCatchAndSync_d3 tile_3_reset_ResetCatchAndSync_d3 ( 
  //   .clock(tile_3_clock),
  //   .reset(tile_3_reset|tile_3_sft_rst),
  //   .io_sync_reset(tile_3_async_rst)
  // );


  RocketTile tile_3 ( 
    .debug_mode_sel_latch(debug_mode_sel_latch),
    .reset_vector_msb_32(reset_vector_msb_32),
    .clock(tile_3_clock),
    .reset(all_tile_async_rst),
    .auto_intsink_in_sync_0(tile_3_auto_intsink_in_sync_0),
    .auto_int_in_xing_in_2_sync_0(tile_3_auto_int_in_xing_in_2_sync_0),
    .auto_int_in_xing_in_1_sync_0(tile_3_auto_int_in_xing_in_1_sync_0),
    .auto_int_in_xing_in_0_sync_0(tile_3_auto_int_in_xing_in_0_sync_0),
    .auto_int_in_xing_in_0_sync_1(tile_3_auto_int_in_xing_in_0_sync_1),
    .auto_tl_master_xing_out_a_ready(tile_3_auto_tl_master_xing_out_a_ready),
    .auto_tl_master_xing_out_a_valid(tile_3_auto_tl_master_xing_out_a_valid),
    .auto_tl_master_xing_out_a_bits_opcode(tile_3_auto_tl_master_xing_out_a_bits_opcode),
    .auto_tl_master_xing_out_a_bits_param(tile_3_auto_tl_master_xing_out_a_bits_param),
    .auto_tl_master_xing_out_a_bits_size(tile_3_auto_tl_master_xing_out_a_bits_size),
    .auto_tl_master_xing_out_a_bits_source(tile_3_auto_tl_master_xing_out_a_bits_source),
    .auto_tl_master_xing_out_a_bits_address(tile_3_auto_tl_master_xing_out_a_bits_address),
    .auto_tl_master_xing_out_a_bits_mask(tile_3_auto_tl_master_xing_out_a_bits_mask),
    .auto_tl_master_xing_out_a_bits_data(tile_3_auto_tl_master_xing_out_a_bits_data),
    .auto_tl_master_xing_out_a_bits_corrupt(tile_3_auto_tl_master_xing_out_a_bits_corrupt),
    .auto_tl_master_xing_out_b_ready(tile_3_auto_tl_master_xing_out_b_ready),
    .auto_tl_master_xing_out_b_valid(tile_3_auto_tl_master_xing_out_b_valid),
    .auto_tl_master_xing_out_b_bits_opcode(tile_3_auto_tl_master_xing_out_b_bits_opcode),
    .auto_tl_master_xing_out_b_bits_param(tile_3_auto_tl_master_xing_out_b_bits_param),
    .auto_tl_master_xing_out_b_bits_size(tile_3_auto_tl_master_xing_out_b_bits_size),
    .auto_tl_master_xing_out_b_bits_source(tile_3_auto_tl_master_xing_out_b_bits_source),
    .auto_tl_master_xing_out_b_bits_address(tile_3_auto_tl_master_xing_out_b_bits_address),
    .auto_tl_master_xing_out_b_bits_mask(tile_3_auto_tl_master_xing_out_b_bits_mask),
    .auto_tl_master_xing_out_b_bits_corrupt(tile_3_auto_tl_master_xing_out_b_bits_corrupt),
    .auto_tl_master_xing_out_c_ready(tile_3_auto_tl_master_xing_out_c_ready),
    .auto_tl_master_xing_out_c_valid(tile_3_auto_tl_master_xing_out_c_valid),
    .auto_tl_master_xing_out_c_bits_opcode(tile_3_auto_tl_master_xing_out_c_bits_opcode),
    .auto_tl_master_xing_out_c_bits_param(tile_3_auto_tl_master_xing_out_c_bits_param),
    .auto_tl_master_xing_out_c_bits_size(tile_3_auto_tl_master_xing_out_c_bits_size),
    .auto_tl_master_xing_out_c_bits_source(tile_3_auto_tl_master_xing_out_c_bits_source),
    .auto_tl_master_xing_out_c_bits_address(tile_3_auto_tl_master_xing_out_c_bits_address),
    .auto_tl_master_xing_out_c_bits_data(tile_3_auto_tl_master_xing_out_c_bits_data),
    .auto_tl_master_xing_out_c_bits_corrupt(tile_3_auto_tl_master_xing_out_c_bits_corrupt),
    .auto_tl_master_xing_out_d_ready(tile_3_auto_tl_master_xing_out_d_ready),
    .auto_tl_master_xing_out_d_valid(tile_3_auto_tl_master_xing_out_d_valid),
    .auto_tl_master_xing_out_d_bits_opcode(tile_3_auto_tl_master_xing_out_d_bits_opcode),
    .auto_tl_master_xing_out_d_bits_param(tile_3_auto_tl_master_xing_out_d_bits_param),
    .auto_tl_master_xing_out_d_bits_size(tile_3_auto_tl_master_xing_out_d_bits_size),
    .auto_tl_master_xing_out_d_bits_source(tile_3_auto_tl_master_xing_out_d_bits_source),
    .auto_tl_master_xing_out_d_bits_sink(tile_3_auto_tl_master_xing_out_d_bits_sink),
    .auto_tl_master_xing_out_d_bits_denied(tile_3_auto_tl_master_xing_out_d_bits_denied),
    .auto_tl_master_xing_out_d_bits_data(tile_3_auto_tl_master_xing_out_d_bits_data),
    .auto_tl_master_xing_out_d_bits_corrupt(tile_3_auto_tl_master_xing_out_d_bits_corrupt),
    .auto_tl_master_xing_out_e_ready(tile_3_auto_tl_master_xing_out_e_ready),
    .auto_tl_master_xing_out_e_valid(tile_3_auto_tl_master_xing_out_e_valid),
    .auto_tl_master_xing_out_e_bits_sink(tile_3_auto_tl_master_xing_out_e_bits_sink),
    .constants_hartid(tile_3_constants_hartid)
  );
  IntSyncCrossingSource_2 intsource_9 ( 
    .clock(intsource_9_clock),
    .reset(intsource_9_reset),
    .auto_in_0(intsource_9_auto_in_0),
    .auto_in_1(intsource_9_auto_in_1),
    .auto_out_sync_0(intsource_9_auto_out_sync_0),
    .auto_out_sync_1(intsource_9_auto_out_sync_1)
  );
  IntSyncCrossingSource_3 intsource_10 ( 
    .clock(intsource_10_clock),
    .reset(intsource_10_reset),
    .auto_in_0(intsource_10_auto_in_0),
    .auto_out_sync_0(intsource_10_auto_out_sync_0)
  );
  IntSyncCrossingSource_3 intsource_11 ( 
    .clock(intsource_11_clock),
    .reset(intsource_11_reset),
    .auto_in_0(intsource_11_auto_in_0),
    .auto_out_sync_0(intsource_11_auto_out_sync_0)
  );

  wire  maskROM_auto_in_async_bridge_a_ready; 
  wire  maskROM_auto_in_async_bridge_a_valid; 
  wire [2:0] maskROM_auto_in_async_bridge_a_bits_opcode; 
  wire [2:0] maskROM_auto_in_async_bridge_a_bits_param; 
  wire [1:0] maskROM_auto_in_async_bridge_a_bits_size; 
  wire [9:0] maskROM_auto_in_async_bridge_a_bits_source; 
  wire [16:0] maskROM_auto_in_async_bridge_a_bits_address; 
  wire [3:0] maskROM_auto_in_async_bridge_a_bits_mask; 
  wire  maskROM_auto_in_async_bridge_a_bits_corrupt; 
  wire  maskROM_auto_in_async_bridge_d_ready; 
  wire  maskROM_auto_in_async_bridge_d_valid; 
  wire [1:0] maskROM_auto_in_async_bridge_d_bits_size; 
  wire [9:0] maskROM_auto_in_async_bridge_d_bits_source; 
  wire [31:0] maskROM_auto_in_async_bridge_d_bits_data; 
  
	tl_uh_async_bridge #(
       .A_LGFIFO(3)
      ,.D_LGFIFO(2)
      ,.WIDTH_SOURCE(10)
      ,.WIDTH_ADDRESS(17)
      ,.WIDTH_SIZE(2)
      ,.WIDTH_DATA(32)
	) u_tl_uh_async_bootrom_bridge (
         .s_clk(clock) 
        ,.s_reset_n(~reset)
        ,.m_clk(maskROM_clock) 
        ,.m_reset_n(~maskROM_reset)

        ,.s_a_ready(maskROM_auto_in_a_ready)
        ,.s_a_valid(maskROM_auto_in_a_valid)
        ,.s_a_bits_opcode(maskROM_auto_in_a_bits_opcode)
        ,.s_a_bits_param(maskROM_auto_in_a_bits_param)
        ,.s_a_bits_size(maskROM_auto_in_a_bits_size)
        ,.s_a_bits_source(maskROM_auto_in_a_bits_source)
        ,.s_a_bits_address(maskROM_auto_in_a_bits_address)
        ,.s_a_bits_mask(maskROM_auto_in_a_bits_mask)
        ,.s_a_bits_data(32'b0)
        ,.s_a_bits_corrupt(1'b0)
        ,.s_d_ready(maskROM_auto_in_d_ready)
        ,.s_d_valid(maskROM_auto_in_d_valid)
        ,.s_d_bits_opcode()
        ,.s_d_bits_param()
        ,.s_d_bits_size(maskROM_auto_in_d_bits_size)
        ,.s_d_bits_source(maskROM_auto_in_d_bits_source)
        ,.s_d_bits_sink()
        ,.s_d_bits_denied()
        ,.s_d_bits_data(maskROM_auto_in_d_bits_data)
        ,.s_d_bits_corrupt()

        ,.m_a_ready(maskROM_auto_in_async_bridge_a_ready)
        ,.m_a_valid(maskROM_auto_in_async_bridge_a_valid)
        ,.m_a_bits_opcode(maskROM_auto_in_async_bridge_a_bits_opcode)
        ,.m_a_bits_param()
        ,.m_a_bits_size(maskROM_auto_in_async_bridge_a_bits_size)
        ,.m_a_bits_source(maskROM_auto_in_async_bridge_a_bits_source)
        ,.m_a_bits_address(maskROM_auto_in_async_bridge_a_bits_address)
        ,.m_a_bits_mask(maskROM_auto_in_async_bridge_a_bits_mask)
        ,.m_a_bits_data()
        ,.m_a_bits_corrupt()
        ,.m_d_ready(maskROM_auto_in_async_bridge_d_ready)
        ,.m_d_valid(maskROM_auto_in_async_bridge_d_valid)
        ,.m_d_bits_opcode(3'b0)
        ,.m_d_bits_param(2'b0)
        ,.m_d_bits_size(maskROM_auto_in_async_bridge_d_bits_size)
        ,.m_d_bits_source(maskROM_auto_in_async_bridge_d_bits_source)
        ,.m_d_bits_sink(3'b0)
        ,.m_d_bits_denied(1'b0)
        ,.m_d_bits_data(maskROM_auto_in_async_bridge_d_bits_data)
        ,.m_d_bits_corrupt(1'b0)
    
	);


  TLMaskROM maskROM ( 
    .clock(maskROM_clock),
    .reset(maskROM_reset),
    .auto_in_a_ready(maskROM_auto_in_async_bridge_a_ready),
    .auto_in_a_valid(maskROM_auto_in_async_bridge_a_valid),
    .auto_in_a_bits_opcode(maskROM_auto_in_async_bridge_a_bits_opcode),
    .auto_in_a_bits_param(3'b0),
    .auto_in_a_bits_size(maskROM_auto_in_async_bridge_a_bits_size),
    .auto_in_a_bits_source(maskROM_auto_in_async_bridge_a_bits_source),
    .auto_in_a_bits_address(maskROM_auto_in_async_bridge_a_bits_address),
    .auto_in_a_bits_mask(maskROM_auto_in_async_bridge_a_bits_mask),
    .auto_in_a_bits_corrupt(1'b0),
    .auto_in_d_ready(maskROM_auto_in_async_bridge_d_ready),
    .auto_in_d_valid(maskROM_auto_in_async_bridge_d_valid),
    .auto_in_d_bits_size(maskROM_auto_in_async_bridge_d_bits_size),
    .auto_in_d_bits_source(maskROM_auto_in_async_bridge_d_bits_source),
    .auto_in_d_bits_data(maskROM_auto_in_async_bridge_d_bits_data)
  );

  IntXing asyncXing ( 
    .clock(asyncXing_clock),
    .auto_int_in_0(asyncXing_auto_int_in_0),
    .auto_int_out_0(asyncXing_auto_int_out_0)
  );
  TLUART uart_0 ( 
    .clock(uart_0_clock),
    .reset(uart_0_reset),
    .auto_int_xing_out_sync_0(uart_0_auto_int_xing_out_sync_0),
    .auto_control_xing_in_a_ready(uart_0_auto_control_xing_in_a_ready),
    .auto_control_xing_in_a_valid(uart_0_auto_control_xing_in_a_valid),
    .auto_control_xing_in_a_bits_opcode(uart_0_auto_control_xing_in_a_bits_opcode),
    .auto_control_xing_in_a_bits_param(uart_0_auto_control_xing_in_a_bits_param),
    .auto_control_xing_in_a_bits_size(uart_0_auto_control_xing_in_a_bits_size),
    .auto_control_xing_in_a_bits_source(uart_0_auto_control_xing_in_a_bits_source),
    .auto_control_xing_in_a_bits_address(uart_0_auto_control_xing_in_a_bits_address),
    .auto_control_xing_in_a_bits_mask(uart_0_auto_control_xing_in_a_bits_mask),
    .auto_control_xing_in_a_bits_data(uart_0_auto_control_xing_in_a_bits_data),
    .auto_control_xing_in_a_bits_corrupt(uart_0_auto_control_xing_in_a_bits_corrupt),
    .auto_control_xing_in_d_ready(uart_0_auto_control_xing_in_d_ready),
    .auto_control_xing_in_d_valid(uart_0_auto_control_xing_in_d_valid),
    .auto_control_xing_in_d_bits_opcode(uart_0_auto_control_xing_in_d_bits_opcode),
    .auto_control_xing_in_d_bits_size(uart_0_auto_control_xing_in_d_bits_size),
    .auto_control_xing_in_d_bits_source(uart_0_auto_control_xing_in_d_bits_source),
    .auto_control_xing_in_d_bits_data(uart_0_auto_control_xing_in_d_bits_data),
    .auto_io_out_txd(uart_0_auto_io_out_txd),
    .auto_io_out_rxd(uart_0_auto_io_out_rxd)
  );
  IntSyncCrossingSink_2 intsink_4 ( 
    .auto_in_sync_0(intsink_4_auto_in_sync_0),
    .auto_out_0(intsink_4_auto_out_0)
  );
  IntXing asyncXing_1 ( 
    .clock(asyncXing_1_clock),
    .auto_int_in_0(asyncXing_1_auto_int_in_0),
    .auto_int_out_0(asyncXing_1_auto_int_out_0)
  );

  wire spi_0_async_rst;

  ResetCatchAndSync_d3 spi_0_reset_ResetCatchAndSync_d3 ( 
    .clock(spi_0_clock),
    .reset(spi_0_reset|spi_0_sft_rst),
    .io_sync_reset(spi_0_async_rst)
  );

  TLSPI spi_0 ( 
    .clock(spi_0_clock),
    .reset(spi_0_async_rst),
    .auto_int_xing_out_sync_0(spi_0_auto_int_xing_out_sync_0),
    .auto_control_xing_in_a_ready(spi_0_auto_control_xing_in_a_ready),
    .auto_control_xing_in_a_valid(spi_0_auto_control_xing_in_a_valid),
    .auto_control_xing_in_a_bits_opcode(spi_0_auto_control_xing_in_a_bits_opcode),
    .auto_control_xing_in_a_bits_param(spi_0_auto_control_xing_in_a_bits_param),
    .auto_control_xing_in_a_bits_size(spi_0_auto_control_xing_in_a_bits_size),
    .auto_control_xing_in_a_bits_source(spi_0_auto_control_xing_in_a_bits_source),
    .auto_control_xing_in_a_bits_address(spi_0_auto_control_xing_in_a_bits_address),
    .auto_control_xing_in_a_bits_mask(spi_0_auto_control_xing_in_a_bits_mask),
    .auto_control_xing_in_a_bits_data(spi_0_auto_control_xing_in_a_bits_data),
    .auto_control_xing_in_a_bits_corrupt(spi_0_auto_control_xing_in_a_bits_corrupt),
    .auto_control_xing_in_d_ready(spi_0_auto_control_xing_in_d_ready),
    .auto_control_xing_in_d_valid(spi_0_auto_control_xing_in_d_valid),
    .auto_control_xing_in_d_bits_opcode(spi_0_auto_control_xing_in_d_bits_opcode),
    .auto_control_xing_in_d_bits_size(spi_0_auto_control_xing_in_d_bits_size),
    .auto_control_xing_in_d_bits_source(spi_0_auto_control_xing_in_d_bits_source),
    .auto_control_xing_in_d_bits_data(spi_0_auto_control_xing_in_d_bits_data),
    .auto_io_out_sck(spi_0_auto_io_out_sck),
    .auto_io_out_dq_0_o(spi_0_auto_io_out_dq_0_o),
    .auto_io_out_dq_1_i(spi_0_auto_io_out_dq_1_i),
    .auto_io_out_cs_0(spi_0_auto_io_out_cs_0)
  );
  IntSyncCrossingSink_2 intsink_5 ( 
    .auto_in_sync_0(intsink_5_auto_in_sync_0),
    .auto_out_0(intsink_5_auto_out_0)
  );

  wire chiplink_async_rst;

  ResetCatchAndSync_d3 chiplink_reset_ResetCatchAndSync_d3 ( 
    .clock(chiplink_clock),
    .reset(chiplink_reset|chiplink_sft_rst),
    .io_sync_reset(chiplink_async_rst)
  );

  XilinxVC707MIG mig ( 
    .ddr_io_c2b_clk(ddr_io_c2b_clk)
    ,.ddr_io_c2b_rst(ddr_io_c2b_rst)
    ,.ddr_io_c2b_send(ddr_io_c2b_send)
    ,.ddr_io_c2b_data(ddr_io_c2b_data)
    ,.ddr_io_b2c_clk(ddr_io_b2c_clk)
    ,.ddr_io_b2c_rst(ddr_io_b2c_rst)
    ,.ddr_io_b2c_send(ddr_io_b2c_send)
    ,.ddr_io_b2c_data(ddr_io_b2c_data),

    .transferDataReg(transferDataReg),
    .send_1p_valid(send_1p_valid),
    .b2c_data_concat(b2c_data_concat),
    .b2c_data_valid(b2c_data_valid),
    
    .chiplink_clock(chiplink_clock),
    .chiplink_reset(chiplink_async_rst),
    .mig_input_takeover_en(mig_input_takeover_en),

    .ddr_master_0_awready(ddr_master_0_awready)
    ,.ddr_master_0_awvalid(ddr_master_0_awvalid)
    ,.ddr_master_0_awid(ddr_master_0_awid)
    ,.ddr_master_0_awaddr(ddr_master_0_awaddr)
    ,.ddr_master_0_awlen(ddr_master_0_awlen)
    ,.ddr_master_0_awsize(ddr_master_0_awsize)
    ,.ddr_master_0_awburst(ddr_master_0_awburst)
    ,.ddr_master_0_wready(ddr_master_0_wready)
    ,.ddr_master_0_wvalid(ddr_master_0_wvalid)
    ,.ddr_master_0_wdata(ddr_master_0_wdata)
    ,.ddr_master_0_wstrb(ddr_master_0_wstrb)
    ,.ddr_master_0_wlast(ddr_master_0_wlast)
    ,.ddr_master_0_bready(ddr_master_0_bready)
    ,.ddr_master_0_bvalid(ddr_master_0_bvalid)
    ,.ddr_master_0_bid(ddr_master_0_bid)
    ,.ddr_master_0_bresp(ddr_master_0_bresp)
    ,.ddr_master_0_arready(ddr_master_0_arready)
    ,.ddr_master_0_arvalid(ddr_master_0_arvalid)
    ,.ddr_master_0_arid(ddr_master_0_arid)
    ,.ddr_master_0_araddr(ddr_master_0_araddr)
    ,.ddr_master_0_arlen(ddr_master_0_arlen)
    ,.ddr_master_0_arsize(ddr_master_0_arsize)
    ,.ddr_master_0_arburst(ddr_master_0_arburst)
    ,.ddr_master_0_rready(ddr_master_0_rready)
    ,.ddr_master_0_rvalid(ddr_master_0_rvalid)
    ,.ddr_master_0_rid(ddr_master_0_rid)
    ,.ddr_master_0_rdata(ddr_master_0_rdata)
    ,.ddr_master_0_rresp(ddr_master_0_rresp)
    ,.ddr_master_0_rlast(ddr_master_0_rlast),

    .clock(mig_clock),
    .reset(mig_reset),
    .auto_buffer_in_a_ready(mig_auto_buffer_in_a_ready),
    .auto_buffer_in_a_valid(mig_auto_buffer_in_a_valid),
    .auto_buffer_in_a_bits_opcode(mig_auto_buffer_in_a_bits_opcode),
    .auto_buffer_in_a_bits_param(mig_auto_buffer_in_a_bits_param),
    .auto_buffer_in_a_bits_size(mig_auto_buffer_in_a_bits_size),
    .auto_buffer_in_a_bits_source(mig_auto_buffer_in_a_bits_source),
    .auto_buffer_in_a_bits_address(mig_auto_buffer_in_a_bits_address),
    .auto_buffer_in_a_bits_mask(mig_auto_buffer_in_a_bits_mask),
    .auto_buffer_in_a_bits_data(mig_auto_buffer_in_a_bits_data),
    .auto_buffer_in_a_bits_corrupt(mig_auto_buffer_in_a_bits_corrupt),
    .auto_buffer_in_d_ready(mig_auto_buffer_in_d_ready),
    .auto_buffer_in_d_valid(mig_auto_buffer_in_d_valid),
    .auto_buffer_in_d_bits_opcode(mig_auto_buffer_in_d_bits_opcode),
    .auto_buffer_in_d_bits_param(mig_auto_buffer_in_d_bits_param),
    .auto_buffer_in_d_bits_size(mig_auto_buffer_in_d_bits_size),
    .auto_buffer_in_d_bits_source(mig_auto_buffer_in_d_bits_source),
    .auto_buffer_in_d_bits_sink(mig_auto_buffer_in_d_bits_sink),
    .auto_buffer_in_d_bits_denied(mig_auto_buffer_in_d_bits_denied),
    .auto_buffer_in_d_bits_data(mig_auto_buffer_in_d_bits_data),
    .auto_buffer_in_d_bits_corrupt(mig_auto_buffer_in_d_bits_corrupt),
    .io_port_ddr3_addr(mig_io_port_ddr3_addr),
    .io_port_ddr3_ba(mig_io_port_ddr3_ba),
    .io_port_ddr3_ras_n(mig_io_port_ddr3_ras_n),
    .io_port_ddr3_cas_n(mig_io_port_ddr3_cas_n),
    .io_port_ddr3_we_n(mig_io_port_ddr3_we_n),
    .io_port_ddr3_reset_n(mig_io_port_ddr3_reset_n),
    .io_port_ddr3_ck_p(mig_io_port_ddr3_ck_p),
    .io_port_ddr3_ck_n(mig_io_port_ddr3_ck_n),
    .io_port_ddr3_cke(mig_io_port_ddr3_cke),
    .io_port_ddr3_cs_n(mig_io_port_ddr3_cs_n),
    .io_port_ddr3_dm(mig_io_port_ddr3_dm),
    .io_port_ddr3_odt(mig_io_port_ddr3_odt),
    // .io_port_ddr3_dq(auto_io_out_0_port_ddr3_dq),
    // .io_port_ddr3_dqs_n(auto_io_out_0_port_ddr3_dqs_n),
    // .io_port_ddr3_dqs_p(auto_io_out_0_port_ddr3_dqs_p),
    .io_port_sys_clk_i(mig_io_port_sys_clk_i),
    .io_port_ui_clk(mig_io_port_ui_clk),
    .io_port_ui_clk_sync_rst(mig_io_port_ui_clk_sync_rst),
    .io_port_mmcm_locked(mig_io_port_mmcm_locked),
    .io_port_aresetn(mig_io_port_aresetn),
    .io_port_sys_rst(mig_io_port_sys_rst)
  );



  D2D_SUB d2d_sub (

    .transferDataReg(transferDataReg),
    .send_1p_valid(send_1p_valid),
    .b2c_data_concat(b2c_data_concat),
    .b2c_data_valid(b2c_data_valid),

    .spi_master_events_o(spi_master_events_o),

    .mig_input_takeover_en(mig_input_takeover_en),

    .reset_vector_msb_32(reset_vector_msb_32),
    .mig_slave_base_addr_msb_4(mig_slave_base_addr_msb_4),

    .tl_master_xing_in_d_bits_resp_control(tl_master_xing_in_d_bits_resp_control),

    .tile_auto_tl_master_xing_in_d_bits_denied(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_bits_denied&sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_valid),
    .tile_auto_tl_master_xing_in_d_bits_corrupt(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_bits_corrupt&sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_valid),
  
    .tile_1_auto_tl_master_xing_in_d_bits_denied(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_bits_denied&sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_valid),
    .tile_1_auto_tl_master_xing_in_d_bits_corrupt(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_bits_corrupt&sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_valid),
  
    .tile_2_auto_tl_master_xing_in_d_bits_denied(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_bits_denied&sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_valid),
    .tile_2_auto_tl_master_xing_in_d_bits_corrupt(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_bits_corrupt&sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_valid),
  
    .tile_3_auto_tl_master_xing_in_d_bits_denied(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_bits_denied&sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_valid),
    .tile_3_auto_tl_master_xing_in_d_bits_corrupt(sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_bits_corrupt&sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_valid),
   
    `ifdef USE_C2C_FOR_PCIE
    .io_c2b_clk(io_c2b_clk),
    .io_c2b_rst(io_c2b_rst),
    .io_c2b_send(io_c2b_send),
    .io_c2b_data(io_c2b_data),
    .io_b2c_clk(io_b2c_clk),
    .io_b2c_rst(io_b2c_rst),
    .io_b2c_send(io_b2c_send),
    .io_b2c_data(io_b2c_data),
    `else
    .spi_sclk(spi_sclk),
    .spi_cs(spi_cs),
    .axi_spi_slave_test_mode(axi_spi_slave_test_mode),
    .spi_gpio_mux_sel(spi_gpio_mux_sel),
    .spi_mode(spi_mode),
    .spi_sdi0(spi_sdi0),
    .spi_sdi1(spi_sdi1),
    .spi_sdi2(spi_sdi2),
    .spi_sdi3(spi_sdi3),
    .spi_sdo0(spi_sdo0),
    .spi_sdo1(spi_sdo1),
    .spi_sdo2(spi_sdo2),
    .spi_sdo3(spi_sdo3),
    .spi_sdo_oen(spi_sdo_oen),    
    `endif
    
    .spi_master_clk(spi_master_clk),
    .spi_master_csn(spi_master_csn),
    .spi_master_mode(spi_master_mode),
    .spi_master_sdi(spi_master_sdi),
    .spi_master_sdo(spi_master_sdo),
    .spi_master_sdo_oen(spi_master_sdo_oen),
    
    .use_which_clk(use_which_clk),
    .pll_cfg(pll_cfg),
    .pll_state(pll_state),
    .debug_mode_sel_latch(debug_mode_sel_latch),

    .all_tile_sft_rst(all_tile_sft_rst),
    // .tile_0_sft_rst(tile_0_sft_rst),
    // .tile_1_sft_rst(tile_1_sft_rst),
    // .tile_2_sft_rst(tile_2_sft_rst),
    // .tile_3_sft_rst(tile_3_sft_rst),
    .chiplink_sft_rst(chiplink_sft_rst),
    .spi_0_sft_rst(spi_0_sft_rst),
    .gpio_sft_rst(gpio_sft_rst),
    .uart_sft_rst(uart_sft_rst),
    .soc_sft_rst(soc_sft_rst),
    .global_soft_reset_req(global_soft_reset_req),
    

    .always_on_reset(always_on_reset),
    .d2d_clock(clock),
    .d2d_reset(reset)


    ,.ddr_master_0_awready(ddr_master_0_awready)
    ,.ddr_master_0_awvalid(ddr_master_0_awvalid)
    ,.ddr_master_0_awid(ddr_master_0_awid)
    ,.ddr_master_0_awaddr(ddr_master_0_awaddr)
    ,.ddr_master_0_awlen(ddr_master_0_awlen)
    ,.ddr_master_0_awsize(ddr_master_0_awsize)
    ,.ddr_master_0_awburst(ddr_master_0_awburst)
    ,.ddr_master_0_wready(ddr_master_0_wready)
    ,.ddr_master_0_wvalid(ddr_master_0_wvalid)
    ,.ddr_master_0_wdata(ddr_master_0_wdata)
    ,.ddr_master_0_wstrb(ddr_master_0_wstrb)
    ,.ddr_master_0_wlast(ddr_master_0_wlast)
    ,.ddr_master_0_bready(ddr_master_0_bready)
    ,.ddr_master_0_bvalid(ddr_master_0_bvalid)
    ,.ddr_master_0_bid(ddr_master_0_bid)
    ,.ddr_master_0_bresp(ddr_master_0_bresp)
    ,.ddr_master_0_arready(ddr_master_0_arready)
    ,.ddr_master_0_arvalid(ddr_master_0_arvalid)
    ,.ddr_master_0_arid(ddr_master_0_arid)
    ,.ddr_master_0_araddr(ddr_master_0_araddr)
    ,.ddr_master_0_arlen(ddr_master_0_arlen)
    ,.ddr_master_0_arsize(ddr_master_0_arsize)
    ,.ddr_master_0_arburst(ddr_master_0_arburst)
    ,.ddr_master_0_rready(ddr_master_0_rready)
    ,.ddr_master_0_rvalid(ddr_master_0_rvalid)
    ,.ddr_master_0_rid(ddr_master_0_rid)
    ,.ddr_master_0_rdata(ddr_master_0_rdata)
    ,.ddr_master_0_rresp(ddr_master_0_rresp)
    ,.ddr_master_0_rlast(ddr_master_0_rlast),

    .auto_int_out_xing_out_sync_0(pcie_auto_int_out_xing_out_sync_0),
    .auto_tl_out_xing_out_a_mem_0_opcode(pcie_auto_tl_out_xing_out_a_mem_0_opcode),
    .auto_tl_out_xing_out_a_mem_0_param(pcie_auto_tl_out_xing_out_a_mem_0_param),
    .auto_tl_out_xing_out_a_mem_0_size(pcie_auto_tl_out_xing_out_a_mem_0_size),
    .auto_tl_out_xing_out_a_mem_0_source(pcie_auto_tl_out_xing_out_a_mem_0_source),
    .auto_tl_out_xing_out_a_mem_0_address(pcie_auto_tl_out_xing_out_a_mem_0_address),
    .auto_tl_out_xing_out_a_mem_0_mask(pcie_auto_tl_out_xing_out_a_mem_0_mask),
    .auto_tl_out_xing_out_a_mem_0_data(pcie_auto_tl_out_xing_out_a_mem_0_data),
    .auto_tl_out_xing_out_a_mem_0_corrupt(pcie_auto_tl_out_xing_out_a_mem_0_corrupt),
    .auto_tl_out_xing_out_a_mem_1_opcode(pcie_auto_tl_out_xing_out_a_mem_1_opcode),
    .auto_tl_out_xing_out_a_mem_1_param(pcie_auto_tl_out_xing_out_a_mem_1_param),
    .auto_tl_out_xing_out_a_mem_1_size(pcie_auto_tl_out_xing_out_a_mem_1_size),
    .auto_tl_out_xing_out_a_mem_1_source(pcie_auto_tl_out_xing_out_a_mem_1_source),
    .auto_tl_out_xing_out_a_mem_1_address(pcie_auto_tl_out_xing_out_a_mem_1_address),
    .auto_tl_out_xing_out_a_mem_1_mask(pcie_auto_tl_out_xing_out_a_mem_1_mask),
    .auto_tl_out_xing_out_a_mem_1_data(pcie_auto_tl_out_xing_out_a_mem_1_data),
    .auto_tl_out_xing_out_a_mem_1_corrupt(pcie_auto_tl_out_xing_out_a_mem_1_corrupt),
    .auto_tl_out_xing_out_a_mem_2_opcode(pcie_auto_tl_out_xing_out_a_mem_2_opcode),
    .auto_tl_out_xing_out_a_mem_2_param(pcie_auto_tl_out_xing_out_a_mem_2_param),
    .auto_tl_out_xing_out_a_mem_2_size(pcie_auto_tl_out_xing_out_a_mem_2_size),
    .auto_tl_out_xing_out_a_mem_2_source(pcie_auto_tl_out_xing_out_a_mem_2_source),
    .auto_tl_out_xing_out_a_mem_2_address(pcie_auto_tl_out_xing_out_a_mem_2_address),
    .auto_tl_out_xing_out_a_mem_2_mask(pcie_auto_tl_out_xing_out_a_mem_2_mask),
    .auto_tl_out_xing_out_a_mem_2_data(pcie_auto_tl_out_xing_out_a_mem_2_data),
    .auto_tl_out_xing_out_a_mem_2_corrupt(pcie_auto_tl_out_xing_out_a_mem_2_corrupt),
    .auto_tl_out_xing_out_a_mem_3_opcode(pcie_auto_tl_out_xing_out_a_mem_3_opcode),
    .auto_tl_out_xing_out_a_mem_3_param(pcie_auto_tl_out_xing_out_a_mem_3_param),
    .auto_tl_out_xing_out_a_mem_3_size(pcie_auto_tl_out_xing_out_a_mem_3_size),
    .auto_tl_out_xing_out_a_mem_3_source(pcie_auto_tl_out_xing_out_a_mem_3_source),
    .auto_tl_out_xing_out_a_mem_3_address(pcie_auto_tl_out_xing_out_a_mem_3_address),
    .auto_tl_out_xing_out_a_mem_3_mask(pcie_auto_tl_out_xing_out_a_mem_3_mask),
    .auto_tl_out_xing_out_a_mem_3_data(pcie_auto_tl_out_xing_out_a_mem_3_data),
    .auto_tl_out_xing_out_a_mem_3_corrupt(pcie_auto_tl_out_xing_out_a_mem_3_corrupt),
    .auto_tl_out_xing_out_a_mem_4_opcode(pcie_auto_tl_out_xing_out_a_mem_4_opcode),
    .auto_tl_out_xing_out_a_mem_4_param(pcie_auto_tl_out_xing_out_a_mem_4_param),
    .auto_tl_out_xing_out_a_mem_4_size(pcie_auto_tl_out_xing_out_a_mem_4_size),
    .auto_tl_out_xing_out_a_mem_4_source(pcie_auto_tl_out_xing_out_a_mem_4_source),
    .auto_tl_out_xing_out_a_mem_4_address(pcie_auto_tl_out_xing_out_a_mem_4_address),
    .auto_tl_out_xing_out_a_mem_4_mask(pcie_auto_tl_out_xing_out_a_mem_4_mask),
    .auto_tl_out_xing_out_a_mem_4_data(pcie_auto_tl_out_xing_out_a_mem_4_data),
    .auto_tl_out_xing_out_a_mem_4_corrupt(pcie_auto_tl_out_xing_out_a_mem_4_corrupt),
    .auto_tl_out_xing_out_a_mem_5_opcode(pcie_auto_tl_out_xing_out_a_mem_5_opcode),
    .auto_tl_out_xing_out_a_mem_5_param(pcie_auto_tl_out_xing_out_a_mem_5_param),
    .auto_tl_out_xing_out_a_mem_5_size(pcie_auto_tl_out_xing_out_a_mem_5_size),
    .auto_tl_out_xing_out_a_mem_5_source(pcie_auto_tl_out_xing_out_a_mem_5_source),
    .auto_tl_out_xing_out_a_mem_5_address(pcie_auto_tl_out_xing_out_a_mem_5_address),
    .auto_tl_out_xing_out_a_mem_5_mask(pcie_auto_tl_out_xing_out_a_mem_5_mask),
    .auto_tl_out_xing_out_a_mem_5_data(pcie_auto_tl_out_xing_out_a_mem_5_data),
    .auto_tl_out_xing_out_a_mem_5_corrupt(pcie_auto_tl_out_xing_out_a_mem_5_corrupt),
    .auto_tl_out_xing_out_a_mem_6_opcode(pcie_auto_tl_out_xing_out_a_mem_6_opcode),
    .auto_tl_out_xing_out_a_mem_6_param(pcie_auto_tl_out_xing_out_a_mem_6_param),
    .auto_tl_out_xing_out_a_mem_6_size(pcie_auto_tl_out_xing_out_a_mem_6_size),
    .auto_tl_out_xing_out_a_mem_6_source(pcie_auto_tl_out_xing_out_a_mem_6_source),
    .auto_tl_out_xing_out_a_mem_6_address(pcie_auto_tl_out_xing_out_a_mem_6_address),
    .auto_tl_out_xing_out_a_mem_6_mask(pcie_auto_tl_out_xing_out_a_mem_6_mask),
    .auto_tl_out_xing_out_a_mem_6_data(pcie_auto_tl_out_xing_out_a_mem_6_data),
    .auto_tl_out_xing_out_a_mem_6_corrupt(pcie_auto_tl_out_xing_out_a_mem_6_corrupt),
    .auto_tl_out_xing_out_a_mem_7_opcode(pcie_auto_tl_out_xing_out_a_mem_7_opcode),
    .auto_tl_out_xing_out_a_mem_7_param(pcie_auto_tl_out_xing_out_a_mem_7_param),
    .auto_tl_out_xing_out_a_mem_7_size(pcie_auto_tl_out_xing_out_a_mem_7_size),
    .auto_tl_out_xing_out_a_mem_7_source(pcie_auto_tl_out_xing_out_a_mem_7_source),
    .auto_tl_out_xing_out_a_mem_7_address(pcie_auto_tl_out_xing_out_a_mem_7_address),
    .auto_tl_out_xing_out_a_mem_7_mask(pcie_auto_tl_out_xing_out_a_mem_7_mask),
    .auto_tl_out_xing_out_a_mem_7_data(pcie_auto_tl_out_xing_out_a_mem_7_data),
    .auto_tl_out_xing_out_a_mem_7_corrupt(pcie_auto_tl_out_xing_out_a_mem_7_corrupt),
    .auto_tl_out_xing_out_a_ridx(pcie_auto_tl_out_xing_out_a_ridx),
    .auto_tl_out_xing_out_a_widx(pcie_auto_tl_out_xing_out_a_widx),
    .auto_tl_out_xing_out_a_safe_ridx_valid(pcie_auto_tl_out_xing_out_a_safe_ridx_valid),
    .auto_tl_out_xing_out_a_safe_widx_valid(pcie_auto_tl_out_xing_out_a_safe_widx_valid),
    .auto_tl_out_xing_out_a_safe_source_reset_n(pcie_auto_tl_out_xing_out_a_safe_source_reset_n),
    .auto_tl_out_xing_out_a_safe_sink_reset_n(pcie_auto_tl_out_xing_out_a_safe_sink_reset_n),
    .auto_tl_out_xing_out_d_mem_0_opcode(pcie_auto_tl_out_xing_out_d_mem_0_opcode),
    .auto_tl_out_xing_out_d_mem_0_param(pcie_auto_tl_out_xing_out_d_mem_0_param),
    .auto_tl_out_xing_out_d_mem_0_size(pcie_auto_tl_out_xing_out_d_mem_0_size),
    .auto_tl_out_xing_out_d_mem_0_source(pcie_auto_tl_out_xing_out_d_mem_0_source),
    .auto_tl_out_xing_out_d_mem_0_sink(pcie_auto_tl_out_xing_out_d_mem_0_sink),
    .auto_tl_out_xing_out_d_mem_0_denied(pcie_auto_tl_out_xing_out_d_mem_0_denied),
    .auto_tl_out_xing_out_d_mem_0_data(pcie_auto_tl_out_xing_out_d_mem_0_data),
    .auto_tl_out_xing_out_d_mem_0_corrupt(pcie_auto_tl_out_xing_out_d_mem_0_corrupt),
    .auto_tl_out_xing_out_d_mem_1_opcode(pcie_auto_tl_out_xing_out_d_mem_1_opcode),
    .auto_tl_out_xing_out_d_mem_1_param(pcie_auto_tl_out_xing_out_d_mem_1_param),
    .auto_tl_out_xing_out_d_mem_1_size(pcie_auto_tl_out_xing_out_d_mem_1_size),
    .auto_tl_out_xing_out_d_mem_1_source(pcie_auto_tl_out_xing_out_d_mem_1_source),
    .auto_tl_out_xing_out_d_mem_1_sink(pcie_auto_tl_out_xing_out_d_mem_1_sink),
    .auto_tl_out_xing_out_d_mem_1_denied(pcie_auto_tl_out_xing_out_d_mem_1_denied),
    .auto_tl_out_xing_out_d_mem_1_data(pcie_auto_tl_out_xing_out_d_mem_1_data),
    .auto_tl_out_xing_out_d_mem_1_corrupt(pcie_auto_tl_out_xing_out_d_mem_1_corrupt),
    .auto_tl_out_xing_out_d_mem_2_opcode(pcie_auto_tl_out_xing_out_d_mem_2_opcode),
    .auto_tl_out_xing_out_d_mem_2_param(pcie_auto_tl_out_xing_out_d_mem_2_param),
    .auto_tl_out_xing_out_d_mem_2_size(pcie_auto_tl_out_xing_out_d_mem_2_size),
    .auto_tl_out_xing_out_d_mem_2_source(pcie_auto_tl_out_xing_out_d_mem_2_source),
    .auto_tl_out_xing_out_d_mem_2_sink(pcie_auto_tl_out_xing_out_d_mem_2_sink),
    .auto_tl_out_xing_out_d_mem_2_denied(pcie_auto_tl_out_xing_out_d_mem_2_denied),
    .auto_tl_out_xing_out_d_mem_2_data(pcie_auto_tl_out_xing_out_d_mem_2_data),
    .auto_tl_out_xing_out_d_mem_2_corrupt(pcie_auto_tl_out_xing_out_d_mem_2_corrupt),
    .auto_tl_out_xing_out_d_mem_3_opcode(pcie_auto_tl_out_xing_out_d_mem_3_opcode),
    .auto_tl_out_xing_out_d_mem_3_param(pcie_auto_tl_out_xing_out_d_mem_3_param),
    .auto_tl_out_xing_out_d_mem_3_size(pcie_auto_tl_out_xing_out_d_mem_3_size),
    .auto_tl_out_xing_out_d_mem_3_source(pcie_auto_tl_out_xing_out_d_mem_3_source),
    .auto_tl_out_xing_out_d_mem_3_sink(pcie_auto_tl_out_xing_out_d_mem_3_sink),
    .auto_tl_out_xing_out_d_mem_3_denied(pcie_auto_tl_out_xing_out_d_mem_3_denied),
    .auto_tl_out_xing_out_d_mem_3_data(pcie_auto_tl_out_xing_out_d_mem_3_data),
    .auto_tl_out_xing_out_d_mem_3_corrupt(pcie_auto_tl_out_xing_out_d_mem_3_corrupt),
    .auto_tl_out_xing_out_d_mem_4_opcode(pcie_auto_tl_out_xing_out_d_mem_4_opcode),
    .auto_tl_out_xing_out_d_mem_4_param(pcie_auto_tl_out_xing_out_d_mem_4_param),
    .auto_tl_out_xing_out_d_mem_4_size(pcie_auto_tl_out_xing_out_d_mem_4_size),
    .auto_tl_out_xing_out_d_mem_4_source(pcie_auto_tl_out_xing_out_d_mem_4_source),
    .auto_tl_out_xing_out_d_mem_4_sink(pcie_auto_tl_out_xing_out_d_mem_4_sink),
    .auto_tl_out_xing_out_d_mem_4_denied(pcie_auto_tl_out_xing_out_d_mem_4_denied),
    .auto_tl_out_xing_out_d_mem_4_data(pcie_auto_tl_out_xing_out_d_mem_4_data),
    .auto_tl_out_xing_out_d_mem_4_corrupt(pcie_auto_tl_out_xing_out_d_mem_4_corrupt),
    .auto_tl_out_xing_out_d_mem_5_opcode(pcie_auto_tl_out_xing_out_d_mem_5_opcode),
    .auto_tl_out_xing_out_d_mem_5_param(pcie_auto_tl_out_xing_out_d_mem_5_param),
    .auto_tl_out_xing_out_d_mem_5_size(pcie_auto_tl_out_xing_out_d_mem_5_size),
    .auto_tl_out_xing_out_d_mem_5_source(pcie_auto_tl_out_xing_out_d_mem_5_source),
    .auto_tl_out_xing_out_d_mem_5_sink(pcie_auto_tl_out_xing_out_d_mem_5_sink),
    .auto_tl_out_xing_out_d_mem_5_denied(pcie_auto_tl_out_xing_out_d_mem_5_denied),
    .auto_tl_out_xing_out_d_mem_5_data(pcie_auto_tl_out_xing_out_d_mem_5_data),
    .auto_tl_out_xing_out_d_mem_5_corrupt(pcie_auto_tl_out_xing_out_d_mem_5_corrupt),
    .auto_tl_out_xing_out_d_mem_6_opcode(pcie_auto_tl_out_xing_out_d_mem_6_opcode),
    .auto_tl_out_xing_out_d_mem_6_param(pcie_auto_tl_out_xing_out_d_mem_6_param),
    .auto_tl_out_xing_out_d_mem_6_size(pcie_auto_tl_out_xing_out_d_mem_6_size),
    .auto_tl_out_xing_out_d_mem_6_source(pcie_auto_tl_out_xing_out_d_mem_6_source),
    .auto_tl_out_xing_out_d_mem_6_sink(pcie_auto_tl_out_xing_out_d_mem_6_sink),
    .auto_tl_out_xing_out_d_mem_6_denied(pcie_auto_tl_out_xing_out_d_mem_6_denied),
    .auto_tl_out_xing_out_d_mem_6_data(pcie_auto_tl_out_xing_out_d_mem_6_data),
    .auto_tl_out_xing_out_d_mem_6_corrupt(pcie_auto_tl_out_xing_out_d_mem_6_corrupt),
    .auto_tl_out_xing_out_d_mem_7_opcode(pcie_auto_tl_out_xing_out_d_mem_7_opcode),
    .auto_tl_out_xing_out_d_mem_7_param(pcie_auto_tl_out_xing_out_d_mem_7_param),
    .auto_tl_out_xing_out_d_mem_7_size(pcie_auto_tl_out_xing_out_d_mem_7_size),
    .auto_tl_out_xing_out_d_mem_7_source(pcie_auto_tl_out_xing_out_d_mem_7_source),
    .auto_tl_out_xing_out_d_mem_7_sink(pcie_auto_tl_out_xing_out_d_mem_7_sink),
    .auto_tl_out_xing_out_d_mem_7_denied(pcie_auto_tl_out_xing_out_d_mem_7_denied),
    .auto_tl_out_xing_out_d_mem_7_data(pcie_auto_tl_out_xing_out_d_mem_7_data),
    .auto_tl_out_xing_out_d_mem_7_corrupt(pcie_auto_tl_out_xing_out_d_mem_7_corrupt),
    .auto_tl_out_xing_out_d_ridx(pcie_auto_tl_out_xing_out_d_ridx),
    .auto_tl_out_xing_out_d_widx(pcie_auto_tl_out_xing_out_d_widx),
    .auto_tl_out_xing_out_d_safe_ridx_valid(pcie_auto_tl_out_xing_out_d_safe_ridx_valid),
    .auto_tl_out_xing_out_d_safe_widx_valid(pcie_auto_tl_out_xing_out_d_safe_widx_valid),
    .auto_tl_out_xing_out_d_safe_source_reset_n(pcie_auto_tl_out_xing_out_d_safe_source_reset_n),
    .auto_tl_out_xing_out_d_safe_sink_reset_n(pcie_auto_tl_out_xing_out_d_safe_sink_reset_n),
    .auto_tl_in_xing_in_1_a_mem_0_opcode(pcie_auto_tl_in_xing_in_1_a_mem_0_opcode),
    .auto_tl_in_xing_in_1_a_mem_0_param(pcie_auto_tl_in_xing_in_1_a_mem_0_param),
    .auto_tl_in_xing_in_1_a_mem_0_size(pcie_auto_tl_in_xing_in_1_a_mem_0_size),
    .auto_tl_in_xing_in_1_a_mem_0_source(pcie_auto_tl_in_xing_in_1_a_mem_0_source),
    .auto_tl_in_xing_in_1_a_mem_0_address(pcie_auto_tl_in_xing_in_1_a_mem_0_address),
    .auto_tl_in_xing_in_1_a_mem_0_mask(pcie_auto_tl_in_xing_in_1_a_mem_0_mask),
    .auto_tl_in_xing_in_1_a_mem_0_data(pcie_auto_tl_in_xing_in_1_a_mem_0_data),
    .auto_tl_in_xing_in_1_a_mem_0_corrupt(pcie_auto_tl_in_xing_in_1_a_mem_0_corrupt),
    .auto_tl_in_xing_in_1_a_mem_1_opcode(pcie_auto_tl_in_xing_in_1_a_mem_1_opcode),
    .auto_tl_in_xing_in_1_a_mem_1_param(pcie_auto_tl_in_xing_in_1_a_mem_1_param),
    .auto_tl_in_xing_in_1_a_mem_1_size(pcie_auto_tl_in_xing_in_1_a_mem_1_size),
    .auto_tl_in_xing_in_1_a_mem_1_source(pcie_auto_tl_in_xing_in_1_a_mem_1_source),
    .auto_tl_in_xing_in_1_a_mem_1_address(pcie_auto_tl_in_xing_in_1_a_mem_1_address),
    .auto_tl_in_xing_in_1_a_mem_1_mask(pcie_auto_tl_in_xing_in_1_a_mem_1_mask),
    .auto_tl_in_xing_in_1_a_mem_1_data(pcie_auto_tl_in_xing_in_1_a_mem_1_data),
    .auto_tl_in_xing_in_1_a_mem_1_corrupt(pcie_auto_tl_in_xing_in_1_a_mem_1_corrupt),
    .auto_tl_in_xing_in_1_a_mem_2_opcode(pcie_auto_tl_in_xing_in_1_a_mem_2_opcode),
    .auto_tl_in_xing_in_1_a_mem_2_param(pcie_auto_tl_in_xing_in_1_a_mem_2_param),
    .auto_tl_in_xing_in_1_a_mem_2_size(pcie_auto_tl_in_xing_in_1_a_mem_2_size),
    .auto_tl_in_xing_in_1_a_mem_2_source(pcie_auto_tl_in_xing_in_1_a_mem_2_source),
    .auto_tl_in_xing_in_1_a_mem_2_address(pcie_auto_tl_in_xing_in_1_a_mem_2_address),
    .auto_tl_in_xing_in_1_a_mem_2_mask(pcie_auto_tl_in_xing_in_1_a_mem_2_mask),
    .auto_tl_in_xing_in_1_a_mem_2_data(pcie_auto_tl_in_xing_in_1_a_mem_2_data),
    .auto_tl_in_xing_in_1_a_mem_2_corrupt(pcie_auto_tl_in_xing_in_1_a_mem_2_corrupt),
    .auto_tl_in_xing_in_1_a_mem_3_opcode(pcie_auto_tl_in_xing_in_1_a_mem_3_opcode),
    .auto_tl_in_xing_in_1_a_mem_3_param(pcie_auto_tl_in_xing_in_1_a_mem_3_param),
    .auto_tl_in_xing_in_1_a_mem_3_size(pcie_auto_tl_in_xing_in_1_a_mem_3_size),
    .auto_tl_in_xing_in_1_a_mem_3_source(pcie_auto_tl_in_xing_in_1_a_mem_3_source),
    .auto_tl_in_xing_in_1_a_mem_3_address(pcie_auto_tl_in_xing_in_1_a_mem_3_address),
    .auto_tl_in_xing_in_1_a_mem_3_mask(pcie_auto_tl_in_xing_in_1_a_mem_3_mask),
    .auto_tl_in_xing_in_1_a_mem_3_data(pcie_auto_tl_in_xing_in_1_a_mem_3_data),
    .auto_tl_in_xing_in_1_a_mem_3_corrupt(pcie_auto_tl_in_xing_in_1_a_mem_3_corrupt),
    .auto_tl_in_xing_in_1_a_mem_4_opcode(pcie_auto_tl_in_xing_in_1_a_mem_4_opcode),
    .auto_tl_in_xing_in_1_a_mem_4_param(pcie_auto_tl_in_xing_in_1_a_mem_4_param),
    .auto_tl_in_xing_in_1_a_mem_4_size(pcie_auto_tl_in_xing_in_1_a_mem_4_size),
    .auto_tl_in_xing_in_1_a_mem_4_source(pcie_auto_tl_in_xing_in_1_a_mem_4_source),
    .auto_tl_in_xing_in_1_a_mem_4_address(pcie_auto_tl_in_xing_in_1_a_mem_4_address),
    .auto_tl_in_xing_in_1_a_mem_4_mask(pcie_auto_tl_in_xing_in_1_a_mem_4_mask),
    .auto_tl_in_xing_in_1_a_mem_4_data(pcie_auto_tl_in_xing_in_1_a_mem_4_data),
    .auto_tl_in_xing_in_1_a_mem_4_corrupt(pcie_auto_tl_in_xing_in_1_a_mem_4_corrupt),
    .auto_tl_in_xing_in_1_a_mem_5_opcode(pcie_auto_tl_in_xing_in_1_a_mem_5_opcode),
    .auto_tl_in_xing_in_1_a_mem_5_param(pcie_auto_tl_in_xing_in_1_a_mem_5_param),
    .auto_tl_in_xing_in_1_a_mem_5_size(pcie_auto_tl_in_xing_in_1_a_mem_5_size),
    .auto_tl_in_xing_in_1_a_mem_5_source(pcie_auto_tl_in_xing_in_1_a_mem_5_source),
    .auto_tl_in_xing_in_1_a_mem_5_address(pcie_auto_tl_in_xing_in_1_a_mem_5_address),
    .auto_tl_in_xing_in_1_a_mem_5_mask(pcie_auto_tl_in_xing_in_1_a_mem_5_mask),
    .auto_tl_in_xing_in_1_a_mem_5_data(pcie_auto_tl_in_xing_in_1_a_mem_5_data),
    .auto_tl_in_xing_in_1_a_mem_5_corrupt(pcie_auto_tl_in_xing_in_1_a_mem_5_corrupt),
    .auto_tl_in_xing_in_1_a_mem_6_opcode(pcie_auto_tl_in_xing_in_1_a_mem_6_opcode),
    .auto_tl_in_xing_in_1_a_mem_6_param(pcie_auto_tl_in_xing_in_1_a_mem_6_param),
    .auto_tl_in_xing_in_1_a_mem_6_size(pcie_auto_tl_in_xing_in_1_a_mem_6_size),
    .auto_tl_in_xing_in_1_a_mem_6_source(pcie_auto_tl_in_xing_in_1_a_mem_6_source),
    .auto_tl_in_xing_in_1_a_mem_6_address(pcie_auto_tl_in_xing_in_1_a_mem_6_address),
    .auto_tl_in_xing_in_1_a_mem_6_mask(pcie_auto_tl_in_xing_in_1_a_mem_6_mask),
    .auto_tl_in_xing_in_1_a_mem_6_data(pcie_auto_tl_in_xing_in_1_a_mem_6_data),
    .auto_tl_in_xing_in_1_a_mem_6_corrupt(pcie_auto_tl_in_xing_in_1_a_mem_6_corrupt),
    .auto_tl_in_xing_in_1_a_mem_7_opcode(pcie_auto_tl_in_xing_in_1_a_mem_7_opcode),
    .auto_tl_in_xing_in_1_a_mem_7_param(pcie_auto_tl_in_xing_in_1_a_mem_7_param),
    .auto_tl_in_xing_in_1_a_mem_7_size(pcie_auto_tl_in_xing_in_1_a_mem_7_size),
    .auto_tl_in_xing_in_1_a_mem_7_source(pcie_auto_tl_in_xing_in_1_a_mem_7_source),
    .auto_tl_in_xing_in_1_a_mem_7_address(pcie_auto_tl_in_xing_in_1_a_mem_7_address),
    .auto_tl_in_xing_in_1_a_mem_7_mask(pcie_auto_tl_in_xing_in_1_a_mem_7_mask),
    .auto_tl_in_xing_in_1_a_mem_7_data(pcie_auto_tl_in_xing_in_1_a_mem_7_data),
    .auto_tl_in_xing_in_1_a_mem_7_corrupt(pcie_auto_tl_in_xing_in_1_a_mem_7_corrupt),
    .auto_tl_in_xing_in_1_a_ridx(pcie_auto_tl_in_xing_in_1_a_ridx),
    .auto_tl_in_xing_in_1_a_widx(pcie_auto_tl_in_xing_in_1_a_widx),
    .auto_tl_in_xing_in_1_a_safe_ridx_valid(pcie_auto_tl_in_xing_in_1_a_safe_ridx_valid),
    .auto_tl_in_xing_in_1_a_safe_widx_valid(pcie_auto_tl_in_xing_in_1_a_safe_widx_valid),
    .auto_tl_in_xing_in_1_a_safe_source_reset_n(pcie_auto_tl_in_xing_in_1_a_safe_source_reset_n),
    .auto_tl_in_xing_in_1_a_safe_sink_reset_n(pcie_auto_tl_in_xing_in_1_a_safe_sink_reset_n),
    .auto_tl_in_xing_in_1_d_mem_0_opcode(pcie_auto_tl_in_xing_in_1_d_mem_0_opcode),
    .auto_tl_in_xing_in_1_d_mem_0_param(pcie_auto_tl_in_xing_in_1_d_mem_0_param),
    .auto_tl_in_xing_in_1_d_mem_0_size(pcie_auto_tl_in_xing_in_1_d_mem_0_size),
    .auto_tl_in_xing_in_1_d_mem_0_source(pcie_auto_tl_in_xing_in_1_d_mem_0_source),
    .auto_tl_in_xing_in_1_d_mem_0_sink(pcie_auto_tl_in_xing_in_1_d_mem_0_sink),
    .auto_tl_in_xing_in_1_d_mem_0_denied(pcie_auto_tl_in_xing_in_1_d_mem_0_denied),
    .auto_tl_in_xing_in_1_d_mem_0_data(pcie_auto_tl_in_xing_in_1_d_mem_0_data),
    .auto_tl_in_xing_in_1_d_mem_0_corrupt(pcie_auto_tl_in_xing_in_1_d_mem_0_corrupt),
    .auto_tl_in_xing_in_1_d_mem_1_opcode(pcie_auto_tl_in_xing_in_1_d_mem_1_opcode),
    .auto_tl_in_xing_in_1_d_mem_1_param(pcie_auto_tl_in_xing_in_1_d_mem_1_param),
    .auto_tl_in_xing_in_1_d_mem_1_size(pcie_auto_tl_in_xing_in_1_d_mem_1_size),
    .auto_tl_in_xing_in_1_d_mem_1_source(pcie_auto_tl_in_xing_in_1_d_mem_1_source),
    .auto_tl_in_xing_in_1_d_mem_1_sink(pcie_auto_tl_in_xing_in_1_d_mem_1_sink),
    .auto_tl_in_xing_in_1_d_mem_1_denied(pcie_auto_tl_in_xing_in_1_d_mem_1_denied),
    .auto_tl_in_xing_in_1_d_mem_1_data(pcie_auto_tl_in_xing_in_1_d_mem_1_data),
    .auto_tl_in_xing_in_1_d_mem_1_corrupt(pcie_auto_tl_in_xing_in_1_d_mem_1_corrupt),
    .auto_tl_in_xing_in_1_d_mem_2_opcode(pcie_auto_tl_in_xing_in_1_d_mem_2_opcode),
    .auto_tl_in_xing_in_1_d_mem_2_param(pcie_auto_tl_in_xing_in_1_d_mem_2_param),
    .auto_tl_in_xing_in_1_d_mem_2_size(pcie_auto_tl_in_xing_in_1_d_mem_2_size),
    .auto_tl_in_xing_in_1_d_mem_2_source(pcie_auto_tl_in_xing_in_1_d_mem_2_source),
    .auto_tl_in_xing_in_1_d_mem_2_sink(pcie_auto_tl_in_xing_in_1_d_mem_2_sink),
    .auto_tl_in_xing_in_1_d_mem_2_denied(pcie_auto_tl_in_xing_in_1_d_mem_2_denied),
    .auto_tl_in_xing_in_1_d_mem_2_data(pcie_auto_tl_in_xing_in_1_d_mem_2_data),
    .auto_tl_in_xing_in_1_d_mem_2_corrupt(pcie_auto_tl_in_xing_in_1_d_mem_2_corrupt),
    .auto_tl_in_xing_in_1_d_mem_3_opcode(pcie_auto_tl_in_xing_in_1_d_mem_3_opcode),
    .auto_tl_in_xing_in_1_d_mem_3_param(pcie_auto_tl_in_xing_in_1_d_mem_3_param),
    .auto_tl_in_xing_in_1_d_mem_3_size(pcie_auto_tl_in_xing_in_1_d_mem_3_size),
    .auto_tl_in_xing_in_1_d_mem_3_source(pcie_auto_tl_in_xing_in_1_d_mem_3_source),
    .auto_tl_in_xing_in_1_d_mem_3_sink(pcie_auto_tl_in_xing_in_1_d_mem_3_sink),
    .auto_tl_in_xing_in_1_d_mem_3_denied(pcie_auto_tl_in_xing_in_1_d_mem_3_denied),
    .auto_tl_in_xing_in_1_d_mem_3_data(pcie_auto_tl_in_xing_in_1_d_mem_3_data),
    .auto_tl_in_xing_in_1_d_mem_3_corrupt(pcie_auto_tl_in_xing_in_1_d_mem_3_corrupt),
    .auto_tl_in_xing_in_1_d_mem_4_opcode(pcie_auto_tl_in_xing_in_1_d_mem_4_opcode),
    .auto_tl_in_xing_in_1_d_mem_4_param(pcie_auto_tl_in_xing_in_1_d_mem_4_param),
    .auto_tl_in_xing_in_1_d_mem_4_size(pcie_auto_tl_in_xing_in_1_d_mem_4_size),
    .auto_tl_in_xing_in_1_d_mem_4_source(pcie_auto_tl_in_xing_in_1_d_mem_4_source),
    .auto_tl_in_xing_in_1_d_mem_4_sink(pcie_auto_tl_in_xing_in_1_d_mem_4_sink),
    .auto_tl_in_xing_in_1_d_mem_4_denied(pcie_auto_tl_in_xing_in_1_d_mem_4_denied),
    .auto_tl_in_xing_in_1_d_mem_4_data(pcie_auto_tl_in_xing_in_1_d_mem_4_data),
    .auto_tl_in_xing_in_1_d_mem_4_corrupt(pcie_auto_tl_in_xing_in_1_d_mem_4_corrupt),
    .auto_tl_in_xing_in_1_d_mem_5_opcode(pcie_auto_tl_in_xing_in_1_d_mem_5_opcode),
    .auto_tl_in_xing_in_1_d_mem_5_param(pcie_auto_tl_in_xing_in_1_d_mem_5_param),
    .auto_tl_in_xing_in_1_d_mem_5_size(pcie_auto_tl_in_xing_in_1_d_mem_5_size),
    .auto_tl_in_xing_in_1_d_mem_5_source(pcie_auto_tl_in_xing_in_1_d_mem_5_source),
    .auto_tl_in_xing_in_1_d_mem_5_sink(pcie_auto_tl_in_xing_in_1_d_mem_5_sink),
    .auto_tl_in_xing_in_1_d_mem_5_denied(pcie_auto_tl_in_xing_in_1_d_mem_5_denied),
    .auto_tl_in_xing_in_1_d_mem_5_data(pcie_auto_tl_in_xing_in_1_d_mem_5_data),
    .auto_tl_in_xing_in_1_d_mem_5_corrupt(pcie_auto_tl_in_xing_in_1_d_mem_5_corrupt),
    .auto_tl_in_xing_in_1_d_mem_6_opcode(pcie_auto_tl_in_xing_in_1_d_mem_6_opcode),
    .auto_tl_in_xing_in_1_d_mem_6_param(pcie_auto_tl_in_xing_in_1_d_mem_6_param),
    .auto_tl_in_xing_in_1_d_mem_6_size(pcie_auto_tl_in_xing_in_1_d_mem_6_size),
    .auto_tl_in_xing_in_1_d_mem_6_source(pcie_auto_tl_in_xing_in_1_d_mem_6_source),
    .auto_tl_in_xing_in_1_d_mem_6_sink(pcie_auto_tl_in_xing_in_1_d_mem_6_sink),
    .auto_tl_in_xing_in_1_d_mem_6_denied(pcie_auto_tl_in_xing_in_1_d_mem_6_denied),
    .auto_tl_in_xing_in_1_d_mem_6_data(pcie_auto_tl_in_xing_in_1_d_mem_6_data),
    .auto_tl_in_xing_in_1_d_mem_6_corrupt(pcie_auto_tl_in_xing_in_1_d_mem_6_corrupt),
    .auto_tl_in_xing_in_1_d_mem_7_opcode(pcie_auto_tl_in_xing_in_1_d_mem_7_opcode),
    .auto_tl_in_xing_in_1_d_mem_7_param(pcie_auto_tl_in_xing_in_1_d_mem_7_param),
    .auto_tl_in_xing_in_1_d_mem_7_size(pcie_auto_tl_in_xing_in_1_d_mem_7_size),
    .auto_tl_in_xing_in_1_d_mem_7_source(pcie_auto_tl_in_xing_in_1_d_mem_7_source),
    .auto_tl_in_xing_in_1_d_mem_7_sink(pcie_auto_tl_in_xing_in_1_d_mem_7_sink),
    .auto_tl_in_xing_in_1_d_mem_7_denied(pcie_auto_tl_in_xing_in_1_d_mem_7_denied),
    .auto_tl_in_xing_in_1_d_mem_7_data(pcie_auto_tl_in_xing_in_1_d_mem_7_data),
    .auto_tl_in_xing_in_1_d_mem_7_corrupt(pcie_auto_tl_in_xing_in_1_d_mem_7_corrupt),
    .auto_tl_in_xing_in_1_d_ridx(pcie_auto_tl_in_xing_in_1_d_ridx),
    .auto_tl_in_xing_in_1_d_widx(pcie_auto_tl_in_xing_in_1_d_widx),
    .auto_tl_in_xing_in_1_d_safe_ridx_valid(pcie_auto_tl_in_xing_in_1_d_safe_ridx_valid),
    .auto_tl_in_xing_in_1_d_safe_widx_valid(pcie_auto_tl_in_xing_in_1_d_safe_widx_valid),
    .auto_tl_in_xing_in_1_d_safe_source_reset_n(pcie_auto_tl_in_xing_in_1_d_safe_source_reset_n),
    .auto_tl_in_xing_in_1_d_safe_sink_reset_n(pcie_auto_tl_in_xing_in_1_d_safe_sink_reset_n),
    .auto_tl_in_xing_in_0_a_mem_0_opcode(pcie_auto_tl_in_xing_in_0_a_mem_0_opcode),
    .auto_tl_in_xing_in_0_a_mem_0_param(pcie_auto_tl_in_xing_in_0_a_mem_0_param),
    .auto_tl_in_xing_in_0_a_mem_0_size(pcie_auto_tl_in_xing_in_0_a_mem_0_size),
    .auto_tl_in_xing_in_0_a_mem_0_source(pcie_auto_tl_in_xing_in_0_a_mem_0_source),
    .auto_tl_in_xing_in_0_a_mem_0_address(pcie_auto_tl_in_xing_in_0_a_mem_0_address),
    .auto_tl_in_xing_in_0_a_mem_0_mask(pcie_auto_tl_in_xing_in_0_a_mem_0_mask),
    .auto_tl_in_xing_in_0_a_mem_0_data(pcie_auto_tl_in_xing_in_0_a_mem_0_data),
    .auto_tl_in_xing_in_0_a_mem_0_corrupt(pcie_auto_tl_in_xing_in_0_a_mem_0_corrupt),
    .auto_tl_in_xing_in_0_a_mem_1_opcode(pcie_auto_tl_in_xing_in_0_a_mem_1_opcode),
    .auto_tl_in_xing_in_0_a_mem_1_param(pcie_auto_tl_in_xing_in_0_a_mem_1_param),
    .auto_tl_in_xing_in_0_a_mem_1_size(pcie_auto_tl_in_xing_in_0_a_mem_1_size),
    .auto_tl_in_xing_in_0_a_mem_1_source(pcie_auto_tl_in_xing_in_0_a_mem_1_source),
    .auto_tl_in_xing_in_0_a_mem_1_address(pcie_auto_tl_in_xing_in_0_a_mem_1_address),
    .auto_tl_in_xing_in_0_a_mem_1_mask(pcie_auto_tl_in_xing_in_0_a_mem_1_mask),
    .auto_tl_in_xing_in_0_a_mem_1_data(pcie_auto_tl_in_xing_in_0_a_mem_1_data),
    .auto_tl_in_xing_in_0_a_mem_1_corrupt(pcie_auto_tl_in_xing_in_0_a_mem_1_corrupt),
    .auto_tl_in_xing_in_0_a_mem_2_opcode(pcie_auto_tl_in_xing_in_0_a_mem_2_opcode),
    .auto_tl_in_xing_in_0_a_mem_2_param(pcie_auto_tl_in_xing_in_0_a_mem_2_param),
    .auto_tl_in_xing_in_0_a_mem_2_size(pcie_auto_tl_in_xing_in_0_a_mem_2_size),
    .auto_tl_in_xing_in_0_a_mem_2_source(pcie_auto_tl_in_xing_in_0_a_mem_2_source),
    .auto_tl_in_xing_in_0_a_mem_2_address(pcie_auto_tl_in_xing_in_0_a_mem_2_address),
    .auto_tl_in_xing_in_0_a_mem_2_mask(pcie_auto_tl_in_xing_in_0_a_mem_2_mask),
    .auto_tl_in_xing_in_0_a_mem_2_data(pcie_auto_tl_in_xing_in_0_a_mem_2_data),
    .auto_tl_in_xing_in_0_a_mem_2_corrupt(pcie_auto_tl_in_xing_in_0_a_mem_2_corrupt),
    .auto_tl_in_xing_in_0_a_mem_3_opcode(pcie_auto_tl_in_xing_in_0_a_mem_3_opcode),
    .auto_tl_in_xing_in_0_a_mem_3_param(pcie_auto_tl_in_xing_in_0_a_mem_3_param),
    .auto_tl_in_xing_in_0_a_mem_3_size(pcie_auto_tl_in_xing_in_0_a_mem_3_size),
    .auto_tl_in_xing_in_0_a_mem_3_source(pcie_auto_tl_in_xing_in_0_a_mem_3_source),
    .auto_tl_in_xing_in_0_a_mem_3_address(pcie_auto_tl_in_xing_in_0_a_mem_3_address),
    .auto_tl_in_xing_in_0_a_mem_3_mask(pcie_auto_tl_in_xing_in_0_a_mem_3_mask),
    .auto_tl_in_xing_in_0_a_mem_3_data(pcie_auto_tl_in_xing_in_0_a_mem_3_data),
    .auto_tl_in_xing_in_0_a_mem_3_corrupt(pcie_auto_tl_in_xing_in_0_a_mem_3_corrupt),
    .auto_tl_in_xing_in_0_a_mem_4_opcode(pcie_auto_tl_in_xing_in_0_a_mem_4_opcode),
    .auto_tl_in_xing_in_0_a_mem_4_param(pcie_auto_tl_in_xing_in_0_a_mem_4_param),
    .auto_tl_in_xing_in_0_a_mem_4_size(pcie_auto_tl_in_xing_in_0_a_mem_4_size),
    .auto_tl_in_xing_in_0_a_mem_4_source(pcie_auto_tl_in_xing_in_0_a_mem_4_source),
    .auto_tl_in_xing_in_0_a_mem_4_address(pcie_auto_tl_in_xing_in_0_a_mem_4_address),
    .auto_tl_in_xing_in_0_a_mem_4_mask(pcie_auto_tl_in_xing_in_0_a_mem_4_mask),
    .auto_tl_in_xing_in_0_a_mem_4_data(pcie_auto_tl_in_xing_in_0_a_mem_4_data),
    .auto_tl_in_xing_in_0_a_mem_4_corrupt(pcie_auto_tl_in_xing_in_0_a_mem_4_corrupt),
    .auto_tl_in_xing_in_0_a_mem_5_opcode(pcie_auto_tl_in_xing_in_0_a_mem_5_opcode),
    .auto_tl_in_xing_in_0_a_mem_5_param(pcie_auto_tl_in_xing_in_0_a_mem_5_param),
    .auto_tl_in_xing_in_0_a_mem_5_size(pcie_auto_tl_in_xing_in_0_a_mem_5_size),
    .auto_tl_in_xing_in_0_a_mem_5_source(pcie_auto_tl_in_xing_in_0_a_mem_5_source),
    .auto_tl_in_xing_in_0_a_mem_5_address(pcie_auto_tl_in_xing_in_0_a_mem_5_address),
    .auto_tl_in_xing_in_0_a_mem_5_mask(pcie_auto_tl_in_xing_in_0_a_mem_5_mask),
    .auto_tl_in_xing_in_0_a_mem_5_data(pcie_auto_tl_in_xing_in_0_a_mem_5_data),
    .auto_tl_in_xing_in_0_a_mem_5_corrupt(pcie_auto_tl_in_xing_in_0_a_mem_5_corrupt),
    .auto_tl_in_xing_in_0_a_mem_6_opcode(pcie_auto_tl_in_xing_in_0_a_mem_6_opcode),
    .auto_tl_in_xing_in_0_a_mem_6_param(pcie_auto_tl_in_xing_in_0_a_mem_6_param),
    .auto_tl_in_xing_in_0_a_mem_6_size(pcie_auto_tl_in_xing_in_0_a_mem_6_size),
    .auto_tl_in_xing_in_0_a_mem_6_source(pcie_auto_tl_in_xing_in_0_a_mem_6_source),
    .auto_tl_in_xing_in_0_a_mem_6_address(pcie_auto_tl_in_xing_in_0_a_mem_6_address),
    .auto_tl_in_xing_in_0_a_mem_6_mask(pcie_auto_tl_in_xing_in_0_a_mem_6_mask),
    .auto_tl_in_xing_in_0_a_mem_6_data(pcie_auto_tl_in_xing_in_0_a_mem_6_data),
    .auto_tl_in_xing_in_0_a_mem_6_corrupt(pcie_auto_tl_in_xing_in_0_a_mem_6_corrupt),
    .auto_tl_in_xing_in_0_a_mem_7_opcode(pcie_auto_tl_in_xing_in_0_a_mem_7_opcode),
    .auto_tl_in_xing_in_0_a_mem_7_param(pcie_auto_tl_in_xing_in_0_a_mem_7_param),
    .auto_tl_in_xing_in_0_a_mem_7_size(pcie_auto_tl_in_xing_in_0_a_mem_7_size),
    .auto_tl_in_xing_in_0_a_mem_7_source(pcie_auto_tl_in_xing_in_0_a_mem_7_source),
    .auto_tl_in_xing_in_0_a_mem_7_address(pcie_auto_tl_in_xing_in_0_a_mem_7_address),
    .auto_tl_in_xing_in_0_a_mem_7_mask(pcie_auto_tl_in_xing_in_0_a_mem_7_mask),
    .auto_tl_in_xing_in_0_a_mem_7_data(pcie_auto_tl_in_xing_in_0_a_mem_7_data),
    .auto_tl_in_xing_in_0_a_mem_7_corrupt(pcie_auto_tl_in_xing_in_0_a_mem_7_corrupt),
    .auto_tl_in_xing_in_0_a_ridx(pcie_auto_tl_in_xing_in_0_a_ridx),
    .auto_tl_in_xing_in_0_a_widx(pcie_auto_tl_in_xing_in_0_a_widx),
    .auto_tl_in_xing_in_0_a_safe_ridx_valid(pcie_auto_tl_in_xing_in_0_a_safe_ridx_valid),
    .auto_tl_in_xing_in_0_a_safe_widx_valid(pcie_auto_tl_in_xing_in_0_a_safe_widx_valid),
    .auto_tl_in_xing_in_0_a_safe_source_reset_n(pcie_auto_tl_in_xing_in_0_a_safe_source_reset_n),
    .auto_tl_in_xing_in_0_a_safe_sink_reset_n(pcie_auto_tl_in_xing_in_0_a_safe_sink_reset_n),
    .auto_tl_in_xing_in_0_d_mem_0_opcode(pcie_auto_tl_in_xing_in_0_d_mem_0_opcode),
    .auto_tl_in_xing_in_0_d_mem_0_param(pcie_auto_tl_in_xing_in_0_d_mem_0_param),
    .auto_tl_in_xing_in_0_d_mem_0_size(pcie_auto_tl_in_xing_in_0_d_mem_0_size),
    .auto_tl_in_xing_in_0_d_mem_0_source(pcie_auto_tl_in_xing_in_0_d_mem_0_source),
    .auto_tl_in_xing_in_0_d_mem_0_sink(pcie_auto_tl_in_xing_in_0_d_mem_0_sink),
    .auto_tl_in_xing_in_0_d_mem_0_denied(pcie_auto_tl_in_xing_in_0_d_mem_0_denied),
    .auto_tl_in_xing_in_0_d_mem_0_data(pcie_auto_tl_in_xing_in_0_d_mem_0_data),
    .auto_tl_in_xing_in_0_d_mem_0_corrupt(pcie_auto_tl_in_xing_in_0_d_mem_0_corrupt),
    .auto_tl_in_xing_in_0_d_mem_1_opcode(pcie_auto_tl_in_xing_in_0_d_mem_1_opcode),
    .auto_tl_in_xing_in_0_d_mem_1_param(pcie_auto_tl_in_xing_in_0_d_mem_1_param),
    .auto_tl_in_xing_in_0_d_mem_1_size(pcie_auto_tl_in_xing_in_0_d_mem_1_size),
    .auto_tl_in_xing_in_0_d_mem_1_source(pcie_auto_tl_in_xing_in_0_d_mem_1_source),
    .auto_tl_in_xing_in_0_d_mem_1_sink(pcie_auto_tl_in_xing_in_0_d_mem_1_sink),
    .auto_tl_in_xing_in_0_d_mem_1_denied(pcie_auto_tl_in_xing_in_0_d_mem_1_denied),
    .auto_tl_in_xing_in_0_d_mem_1_data(pcie_auto_tl_in_xing_in_0_d_mem_1_data),
    .auto_tl_in_xing_in_0_d_mem_1_corrupt(pcie_auto_tl_in_xing_in_0_d_mem_1_corrupt),
    .auto_tl_in_xing_in_0_d_mem_2_opcode(pcie_auto_tl_in_xing_in_0_d_mem_2_opcode),
    .auto_tl_in_xing_in_0_d_mem_2_param(pcie_auto_tl_in_xing_in_0_d_mem_2_param),
    .auto_tl_in_xing_in_0_d_mem_2_size(pcie_auto_tl_in_xing_in_0_d_mem_2_size),
    .auto_tl_in_xing_in_0_d_mem_2_source(pcie_auto_tl_in_xing_in_0_d_mem_2_source),
    .auto_tl_in_xing_in_0_d_mem_2_sink(pcie_auto_tl_in_xing_in_0_d_mem_2_sink),
    .auto_tl_in_xing_in_0_d_mem_2_denied(pcie_auto_tl_in_xing_in_0_d_mem_2_denied),
    .auto_tl_in_xing_in_0_d_mem_2_data(pcie_auto_tl_in_xing_in_0_d_mem_2_data),
    .auto_tl_in_xing_in_0_d_mem_2_corrupt(pcie_auto_tl_in_xing_in_0_d_mem_2_corrupt),
    .auto_tl_in_xing_in_0_d_mem_3_opcode(pcie_auto_tl_in_xing_in_0_d_mem_3_opcode),
    .auto_tl_in_xing_in_0_d_mem_3_param(pcie_auto_tl_in_xing_in_0_d_mem_3_param),
    .auto_tl_in_xing_in_0_d_mem_3_size(pcie_auto_tl_in_xing_in_0_d_mem_3_size),
    .auto_tl_in_xing_in_0_d_mem_3_source(pcie_auto_tl_in_xing_in_0_d_mem_3_source),
    .auto_tl_in_xing_in_0_d_mem_3_sink(pcie_auto_tl_in_xing_in_0_d_mem_3_sink),
    .auto_tl_in_xing_in_0_d_mem_3_denied(pcie_auto_tl_in_xing_in_0_d_mem_3_denied),
    .auto_tl_in_xing_in_0_d_mem_3_data(pcie_auto_tl_in_xing_in_0_d_mem_3_data),
    .auto_tl_in_xing_in_0_d_mem_3_corrupt(pcie_auto_tl_in_xing_in_0_d_mem_3_corrupt),
    .auto_tl_in_xing_in_0_d_mem_4_opcode(pcie_auto_tl_in_xing_in_0_d_mem_4_opcode),
    .auto_tl_in_xing_in_0_d_mem_4_param(pcie_auto_tl_in_xing_in_0_d_mem_4_param),
    .auto_tl_in_xing_in_0_d_mem_4_size(pcie_auto_tl_in_xing_in_0_d_mem_4_size),
    .auto_tl_in_xing_in_0_d_mem_4_source(pcie_auto_tl_in_xing_in_0_d_mem_4_source),
    .auto_tl_in_xing_in_0_d_mem_4_sink(pcie_auto_tl_in_xing_in_0_d_mem_4_sink),
    .auto_tl_in_xing_in_0_d_mem_4_denied(pcie_auto_tl_in_xing_in_0_d_mem_4_denied),
    .auto_tl_in_xing_in_0_d_mem_4_data(pcie_auto_tl_in_xing_in_0_d_mem_4_data),
    .auto_tl_in_xing_in_0_d_mem_4_corrupt(pcie_auto_tl_in_xing_in_0_d_mem_4_corrupt),
    .auto_tl_in_xing_in_0_d_mem_5_opcode(pcie_auto_tl_in_xing_in_0_d_mem_5_opcode),
    .auto_tl_in_xing_in_0_d_mem_5_param(pcie_auto_tl_in_xing_in_0_d_mem_5_param),
    .auto_tl_in_xing_in_0_d_mem_5_size(pcie_auto_tl_in_xing_in_0_d_mem_5_size),
    .auto_tl_in_xing_in_0_d_mem_5_source(pcie_auto_tl_in_xing_in_0_d_mem_5_source),
    .auto_tl_in_xing_in_0_d_mem_5_sink(pcie_auto_tl_in_xing_in_0_d_mem_5_sink),
    .auto_tl_in_xing_in_0_d_mem_5_denied(pcie_auto_tl_in_xing_in_0_d_mem_5_denied),
    .auto_tl_in_xing_in_0_d_mem_5_data(pcie_auto_tl_in_xing_in_0_d_mem_5_data),
    .auto_tl_in_xing_in_0_d_mem_5_corrupt(pcie_auto_tl_in_xing_in_0_d_mem_5_corrupt),
    .auto_tl_in_xing_in_0_d_mem_6_opcode(pcie_auto_tl_in_xing_in_0_d_mem_6_opcode),
    .auto_tl_in_xing_in_0_d_mem_6_param(pcie_auto_tl_in_xing_in_0_d_mem_6_param),
    .auto_tl_in_xing_in_0_d_mem_6_size(pcie_auto_tl_in_xing_in_0_d_mem_6_size),
    .auto_tl_in_xing_in_0_d_mem_6_source(pcie_auto_tl_in_xing_in_0_d_mem_6_source),
    .auto_tl_in_xing_in_0_d_mem_6_sink(pcie_auto_tl_in_xing_in_0_d_mem_6_sink),
    .auto_tl_in_xing_in_0_d_mem_6_denied(pcie_auto_tl_in_xing_in_0_d_mem_6_denied),
    .auto_tl_in_xing_in_0_d_mem_6_data(pcie_auto_tl_in_xing_in_0_d_mem_6_data),
    .auto_tl_in_xing_in_0_d_mem_6_corrupt(pcie_auto_tl_in_xing_in_0_d_mem_6_corrupt),
    .auto_tl_in_xing_in_0_d_mem_7_opcode(pcie_auto_tl_in_xing_in_0_d_mem_7_opcode),
    .auto_tl_in_xing_in_0_d_mem_7_param(pcie_auto_tl_in_xing_in_0_d_mem_7_param),
    .auto_tl_in_xing_in_0_d_mem_7_size(pcie_auto_tl_in_xing_in_0_d_mem_7_size),
    .auto_tl_in_xing_in_0_d_mem_7_source(pcie_auto_tl_in_xing_in_0_d_mem_7_source),
    .auto_tl_in_xing_in_0_d_mem_7_sink(pcie_auto_tl_in_xing_in_0_d_mem_7_sink),
    .auto_tl_in_xing_in_0_d_mem_7_denied(pcie_auto_tl_in_xing_in_0_d_mem_7_denied),
    .auto_tl_in_xing_in_0_d_mem_7_data(pcie_auto_tl_in_xing_in_0_d_mem_7_data),
    .auto_tl_in_xing_in_0_d_mem_7_corrupt(pcie_auto_tl_in_xing_in_0_d_mem_7_corrupt),
    .auto_tl_in_xing_in_0_d_ridx(pcie_auto_tl_in_xing_in_0_d_ridx),
    .auto_tl_in_xing_in_0_d_widx(pcie_auto_tl_in_xing_in_0_d_widx),
    .auto_tl_in_xing_in_0_d_safe_ridx_valid(pcie_auto_tl_in_xing_in_0_d_safe_ridx_valid),
    .auto_tl_in_xing_in_0_d_safe_widx_valid(pcie_auto_tl_in_xing_in_0_d_safe_widx_valid),
    .auto_tl_in_xing_in_0_d_safe_source_reset_n(pcie_auto_tl_in_xing_in_0_d_safe_source_reset_n),
    .auto_tl_in_xing_in_0_d_safe_sink_reset_n(pcie_auto_tl_in_xing_in_0_d_safe_sink_reset_n),
    .io_port_REFCLK_rxp(pcie_io_port_REFCLK_rxp),
    .io_port_REFCLK_rxn(pcie_io_port_REFCLK_rxn),
    .io_port_pci_exp_txp(pcie_io_port_pci_exp_txp),
    .io_port_pci_exp_txn(pcie_io_port_pci_exp_txn),
    .io_port_pci_exp_rxp(pcie_io_port_pci_exp_rxp),
    .io_port_pci_exp_rxn(pcie_io_port_pci_exp_rxn),
    .io_port_axi_aresetn(pcie_io_port_axi_aresetn),
    .io_port_axi_aclk_out(pcie_io_port_axi_aclk_out),
    .io_port_mmcm_lock(pcie_io_port_mmcm_lock)
  );
  TLAsyncCrossingSource_2 asource ( 
    .clock(asource_clock),
    .reset(asource_reset),
    .auto_in_a_ready(asource_auto_in_a_ready),
    .auto_in_a_valid(asource_auto_in_a_valid),
    .auto_in_a_bits_opcode(asource_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(asource_auto_in_a_bits_param),
    .auto_in_a_bits_size(asource_auto_in_a_bits_size),
    .auto_in_a_bits_source(asource_auto_in_a_bits_source),
    .auto_in_a_bits_address(asource_auto_in_a_bits_address),
    .auto_in_a_bits_mask(asource_auto_in_a_bits_mask),
    .auto_in_a_bits_data(asource_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(asource_auto_in_a_bits_corrupt),
    .auto_in_d_ready(asource_auto_in_d_ready),
    .auto_in_d_valid(asource_auto_in_d_valid),
    .auto_in_d_bits_opcode(asource_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(asource_auto_in_d_bits_param),
    .auto_in_d_bits_size(asource_auto_in_d_bits_size),
    .auto_in_d_bits_source(asource_auto_in_d_bits_source),
    .auto_in_d_bits_sink(asource_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(asource_auto_in_d_bits_denied),
    .auto_in_d_bits_data(asource_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(asource_auto_in_d_bits_corrupt),
    .auto_out_a_mem_0_opcode(asource_auto_out_a_mem_0_opcode),
    .auto_out_a_mem_0_param(asource_auto_out_a_mem_0_param),
    .auto_out_a_mem_0_size(asource_auto_out_a_mem_0_size),
    .auto_out_a_mem_0_source(asource_auto_out_a_mem_0_source),
    .auto_out_a_mem_0_address(asource_auto_out_a_mem_0_address),
    .auto_out_a_mem_0_mask(asource_auto_out_a_mem_0_mask),
    .auto_out_a_mem_0_data(asource_auto_out_a_mem_0_data),
    .auto_out_a_mem_0_corrupt(asource_auto_out_a_mem_0_corrupt),
    .auto_out_a_mem_1_opcode(asource_auto_out_a_mem_1_opcode),
    .auto_out_a_mem_1_param(asource_auto_out_a_mem_1_param),
    .auto_out_a_mem_1_size(asource_auto_out_a_mem_1_size),
    .auto_out_a_mem_1_source(asource_auto_out_a_mem_1_source),
    .auto_out_a_mem_1_address(asource_auto_out_a_mem_1_address),
    .auto_out_a_mem_1_mask(asource_auto_out_a_mem_1_mask),
    .auto_out_a_mem_1_data(asource_auto_out_a_mem_1_data),
    .auto_out_a_mem_1_corrupt(asource_auto_out_a_mem_1_corrupt),
    .auto_out_a_mem_2_opcode(asource_auto_out_a_mem_2_opcode),
    .auto_out_a_mem_2_param(asource_auto_out_a_mem_2_param),
    .auto_out_a_mem_2_size(asource_auto_out_a_mem_2_size),
    .auto_out_a_mem_2_source(asource_auto_out_a_mem_2_source),
    .auto_out_a_mem_2_address(asource_auto_out_a_mem_2_address),
    .auto_out_a_mem_2_mask(asource_auto_out_a_mem_2_mask),
    .auto_out_a_mem_2_data(asource_auto_out_a_mem_2_data),
    .auto_out_a_mem_2_corrupt(asource_auto_out_a_mem_2_corrupt),
    .auto_out_a_mem_3_opcode(asource_auto_out_a_mem_3_opcode),
    .auto_out_a_mem_3_param(asource_auto_out_a_mem_3_param),
    .auto_out_a_mem_3_size(asource_auto_out_a_mem_3_size),
    .auto_out_a_mem_3_source(asource_auto_out_a_mem_3_source),
    .auto_out_a_mem_3_address(asource_auto_out_a_mem_3_address),
    .auto_out_a_mem_3_mask(asource_auto_out_a_mem_3_mask),
    .auto_out_a_mem_3_data(asource_auto_out_a_mem_3_data),
    .auto_out_a_mem_3_corrupt(asource_auto_out_a_mem_3_corrupt),
    .auto_out_a_mem_4_opcode(asource_auto_out_a_mem_4_opcode),
    .auto_out_a_mem_4_param(asource_auto_out_a_mem_4_param),
    .auto_out_a_mem_4_size(asource_auto_out_a_mem_4_size),
    .auto_out_a_mem_4_source(asource_auto_out_a_mem_4_source),
    .auto_out_a_mem_4_address(asource_auto_out_a_mem_4_address),
    .auto_out_a_mem_4_mask(asource_auto_out_a_mem_4_mask),
    .auto_out_a_mem_4_data(asource_auto_out_a_mem_4_data),
    .auto_out_a_mem_4_corrupt(asource_auto_out_a_mem_4_corrupt),
    .auto_out_a_mem_5_opcode(asource_auto_out_a_mem_5_opcode),
    .auto_out_a_mem_5_param(asource_auto_out_a_mem_5_param),
    .auto_out_a_mem_5_size(asource_auto_out_a_mem_5_size),
    .auto_out_a_mem_5_source(asource_auto_out_a_mem_5_source),
    .auto_out_a_mem_5_address(asource_auto_out_a_mem_5_address),
    .auto_out_a_mem_5_mask(asource_auto_out_a_mem_5_mask),
    .auto_out_a_mem_5_data(asource_auto_out_a_mem_5_data),
    .auto_out_a_mem_5_corrupt(asource_auto_out_a_mem_5_corrupt),
    .auto_out_a_mem_6_opcode(asource_auto_out_a_mem_6_opcode),
    .auto_out_a_mem_6_param(asource_auto_out_a_mem_6_param),
    .auto_out_a_mem_6_size(asource_auto_out_a_mem_6_size),
    .auto_out_a_mem_6_source(asource_auto_out_a_mem_6_source),
    .auto_out_a_mem_6_address(asource_auto_out_a_mem_6_address),
    .auto_out_a_mem_6_mask(asource_auto_out_a_mem_6_mask),
    .auto_out_a_mem_6_data(asource_auto_out_a_mem_6_data),
    .auto_out_a_mem_6_corrupt(asource_auto_out_a_mem_6_corrupt),
    .auto_out_a_mem_7_opcode(asource_auto_out_a_mem_7_opcode),
    .auto_out_a_mem_7_param(asource_auto_out_a_mem_7_param),
    .auto_out_a_mem_7_size(asource_auto_out_a_mem_7_size),
    .auto_out_a_mem_7_source(asource_auto_out_a_mem_7_source),
    .auto_out_a_mem_7_address(asource_auto_out_a_mem_7_address),
    .auto_out_a_mem_7_mask(asource_auto_out_a_mem_7_mask),
    .auto_out_a_mem_7_data(asource_auto_out_a_mem_7_data),
    .auto_out_a_mem_7_corrupt(asource_auto_out_a_mem_7_corrupt),
    .auto_out_a_ridx(asource_auto_out_a_ridx),
    .auto_out_a_widx(asource_auto_out_a_widx),
    .auto_out_a_safe_ridx_valid(asource_auto_out_a_safe_ridx_valid),
    .auto_out_a_safe_widx_valid(asource_auto_out_a_safe_widx_valid),
    .auto_out_a_safe_source_reset_n(asource_auto_out_a_safe_source_reset_n),
    .auto_out_a_safe_sink_reset_n(asource_auto_out_a_safe_sink_reset_n),
    .auto_out_d_mem_0_opcode(asource_auto_out_d_mem_0_opcode),
    .auto_out_d_mem_0_param(asource_auto_out_d_mem_0_param),
    .auto_out_d_mem_0_size(asource_auto_out_d_mem_0_size),
    .auto_out_d_mem_0_source(asource_auto_out_d_mem_0_source),
    .auto_out_d_mem_0_sink(asource_auto_out_d_mem_0_sink),
    .auto_out_d_mem_0_denied(asource_auto_out_d_mem_0_denied),
    .auto_out_d_mem_0_data(asource_auto_out_d_mem_0_data),
    .auto_out_d_mem_0_corrupt(asource_auto_out_d_mem_0_corrupt),
    .auto_out_d_mem_1_opcode(asource_auto_out_d_mem_1_opcode),
    .auto_out_d_mem_1_param(asource_auto_out_d_mem_1_param),
    .auto_out_d_mem_1_size(asource_auto_out_d_mem_1_size),
    .auto_out_d_mem_1_source(asource_auto_out_d_mem_1_source),
    .auto_out_d_mem_1_sink(asource_auto_out_d_mem_1_sink),
    .auto_out_d_mem_1_denied(asource_auto_out_d_mem_1_denied),
    .auto_out_d_mem_1_data(asource_auto_out_d_mem_1_data),
    .auto_out_d_mem_1_corrupt(asource_auto_out_d_mem_1_corrupt),
    .auto_out_d_mem_2_opcode(asource_auto_out_d_mem_2_opcode),
    .auto_out_d_mem_2_param(asource_auto_out_d_mem_2_param),
    .auto_out_d_mem_2_size(asource_auto_out_d_mem_2_size),
    .auto_out_d_mem_2_source(asource_auto_out_d_mem_2_source),
    .auto_out_d_mem_2_sink(asource_auto_out_d_mem_2_sink),
    .auto_out_d_mem_2_denied(asource_auto_out_d_mem_2_denied),
    .auto_out_d_mem_2_data(asource_auto_out_d_mem_2_data),
    .auto_out_d_mem_2_corrupt(asource_auto_out_d_mem_2_corrupt),
    .auto_out_d_mem_3_opcode(asource_auto_out_d_mem_3_opcode),
    .auto_out_d_mem_3_param(asource_auto_out_d_mem_3_param),
    .auto_out_d_mem_3_size(asource_auto_out_d_mem_3_size),
    .auto_out_d_mem_3_source(asource_auto_out_d_mem_3_source),
    .auto_out_d_mem_3_sink(asource_auto_out_d_mem_3_sink),
    .auto_out_d_mem_3_denied(asource_auto_out_d_mem_3_denied),
    .auto_out_d_mem_3_data(asource_auto_out_d_mem_3_data),
    .auto_out_d_mem_3_corrupt(asource_auto_out_d_mem_3_corrupt),
    .auto_out_d_mem_4_opcode(asource_auto_out_d_mem_4_opcode),
    .auto_out_d_mem_4_param(asource_auto_out_d_mem_4_param),
    .auto_out_d_mem_4_size(asource_auto_out_d_mem_4_size),
    .auto_out_d_mem_4_source(asource_auto_out_d_mem_4_source),
    .auto_out_d_mem_4_sink(asource_auto_out_d_mem_4_sink),
    .auto_out_d_mem_4_denied(asource_auto_out_d_mem_4_denied),
    .auto_out_d_mem_4_data(asource_auto_out_d_mem_4_data),
    .auto_out_d_mem_4_corrupt(asource_auto_out_d_mem_4_corrupt),
    .auto_out_d_mem_5_opcode(asource_auto_out_d_mem_5_opcode),
    .auto_out_d_mem_5_param(asource_auto_out_d_mem_5_param),
    .auto_out_d_mem_5_size(asource_auto_out_d_mem_5_size),
    .auto_out_d_mem_5_source(asource_auto_out_d_mem_5_source),
    .auto_out_d_mem_5_sink(asource_auto_out_d_mem_5_sink),
    .auto_out_d_mem_5_denied(asource_auto_out_d_mem_5_denied),
    .auto_out_d_mem_5_data(asource_auto_out_d_mem_5_data),
    .auto_out_d_mem_5_corrupt(asource_auto_out_d_mem_5_corrupt),
    .auto_out_d_mem_6_opcode(asource_auto_out_d_mem_6_opcode),
    .auto_out_d_mem_6_param(asource_auto_out_d_mem_6_param),
    .auto_out_d_mem_6_size(asource_auto_out_d_mem_6_size),
    .auto_out_d_mem_6_source(asource_auto_out_d_mem_6_source),
    .auto_out_d_mem_6_sink(asource_auto_out_d_mem_6_sink),
    .auto_out_d_mem_6_denied(asource_auto_out_d_mem_6_denied),
    .auto_out_d_mem_6_data(asource_auto_out_d_mem_6_data),
    .auto_out_d_mem_6_corrupt(asource_auto_out_d_mem_6_corrupt),
    .auto_out_d_mem_7_opcode(asource_auto_out_d_mem_7_opcode),
    .auto_out_d_mem_7_param(asource_auto_out_d_mem_7_param),
    .auto_out_d_mem_7_size(asource_auto_out_d_mem_7_size),
    .auto_out_d_mem_7_source(asource_auto_out_d_mem_7_source),
    .auto_out_d_mem_7_sink(asource_auto_out_d_mem_7_sink),
    .auto_out_d_mem_7_denied(asource_auto_out_d_mem_7_denied),
    .auto_out_d_mem_7_data(asource_auto_out_d_mem_7_data),
    .auto_out_d_mem_7_corrupt(asource_auto_out_d_mem_7_corrupt),
    .auto_out_d_ridx(asource_auto_out_d_ridx),
    .auto_out_d_widx(asource_auto_out_d_widx),
    .auto_out_d_safe_ridx_valid(asource_auto_out_d_safe_ridx_valid),
    .auto_out_d_safe_widx_valid(asource_auto_out_d_safe_widx_valid),
    .auto_out_d_safe_source_reset_n(asource_auto_out_d_safe_source_reset_n),
    .auto_out_d_safe_sink_reset_n(asource_auto_out_d_safe_sink_reset_n)
  );


`ifndef USE_PCIE_CONTROLLER_SLAVE
  TLError_Param  # (
    .SOURCE_WIDTH(5)
    ) tl_asource_1_ferr (
    .clock(asource_1_clock),
    .reset(asource_1_reset),
    .auto_in_a_ready(asource_1_auto_in_a_ready),
    .auto_in_a_valid(asource_1_auto_in_a_valid),
    .auto_in_a_bits_opcode(asource_1_auto_in_a_bits_opcode),
    .auto_in_a_bits_size(asource_1_auto_in_a_bits_size),
    .auto_in_a_bits_source(asource_1_auto_in_a_bits_source),
    .auto_in_a_bits_address({asource_1_auto_in_a_bits_address[12:0]}),
    .auto_in_a_bits_mask(asource_1_auto_in_a_bits_mask),
    .auto_in_d_ready(asource_1_auto_in_d_ready),
    .auto_in_d_valid(asource_1_auto_in_d_valid),
    .auto_in_d_bits_opcode(asource_1_auto_in_d_bits_opcode),
    .auto_in_d_bits_size(asource_1_auto_in_d_bits_size),
    .auto_in_d_bits_source(asource_1_auto_in_d_bits_source),
    .auto_in_d_bits_denied(asource_1_auto_in_d_bits_denied),
    .auto_in_d_bits_corrupt(asource_1_auto_in_d_bits_corrupt)
  );
  assign asource_1_auto_in_d_bits_param = 2'b0;
  assign asource_1_auto_in_d_bits_sink = 1'b0;
  assign asource_1_auto_in_d_bits_data = 32'b0;
`else


  TLAsyncCrossingSource_3 asource_1 ( 
    .clock(asource_1_clock),
    .reset(asource_1_reset),
    .auto_in_a_ready(asource_1_auto_in_a_ready),
    .auto_in_a_valid(asource_1_auto_in_a_valid),
    .auto_in_a_bits_opcode(asource_1_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(asource_1_auto_in_a_bits_param),
    .auto_in_a_bits_size(asource_1_auto_in_a_bits_size),
    .auto_in_a_bits_source(asource_1_auto_in_a_bits_source),
    .auto_in_a_bits_address(asource_1_auto_in_a_bits_address),
    .auto_in_a_bits_mask(asource_1_auto_in_a_bits_mask),
    .auto_in_a_bits_data(asource_1_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(asource_1_auto_in_a_bits_corrupt),
    .auto_in_d_ready(asource_1_auto_in_d_ready),
    .auto_in_d_valid(asource_1_auto_in_d_valid),
    .auto_in_d_bits_opcode(asource_1_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(asource_1_auto_in_d_bits_param),
    .auto_in_d_bits_size(asource_1_auto_in_d_bits_size),
    .auto_in_d_bits_source(asource_1_auto_in_d_bits_source),
    .auto_in_d_bits_sink(asource_1_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(asource_1_auto_in_d_bits_denied),
    .auto_in_d_bits_data(asource_1_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(asource_1_auto_in_d_bits_corrupt),
    .auto_out_a_mem_0_opcode(asource_1_auto_out_a_mem_0_opcode),
    .auto_out_a_mem_0_param(asource_1_auto_out_a_mem_0_param),
    .auto_out_a_mem_0_size(asource_1_auto_out_a_mem_0_size),
    .auto_out_a_mem_0_source(asource_1_auto_out_a_mem_0_source),
    .auto_out_a_mem_0_address(asource_1_auto_out_a_mem_0_address),
    .auto_out_a_mem_0_mask(asource_1_auto_out_a_mem_0_mask),
    .auto_out_a_mem_0_data(asource_1_auto_out_a_mem_0_data),
    .auto_out_a_mem_0_corrupt(asource_1_auto_out_a_mem_0_corrupt),
    .auto_out_a_mem_1_opcode(asource_1_auto_out_a_mem_1_opcode),
    .auto_out_a_mem_1_param(asource_1_auto_out_a_mem_1_param),
    .auto_out_a_mem_1_size(asource_1_auto_out_a_mem_1_size),
    .auto_out_a_mem_1_source(asource_1_auto_out_a_mem_1_source),
    .auto_out_a_mem_1_address(asource_1_auto_out_a_mem_1_address),
    .auto_out_a_mem_1_mask(asource_1_auto_out_a_mem_1_mask),
    .auto_out_a_mem_1_data(asource_1_auto_out_a_mem_1_data),
    .auto_out_a_mem_1_corrupt(asource_1_auto_out_a_mem_1_corrupt),
    .auto_out_a_mem_2_opcode(asource_1_auto_out_a_mem_2_opcode),
    .auto_out_a_mem_2_param(asource_1_auto_out_a_mem_2_param),
    .auto_out_a_mem_2_size(asource_1_auto_out_a_mem_2_size),
    .auto_out_a_mem_2_source(asource_1_auto_out_a_mem_2_source),
    .auto_out_a_mem_2_address(asource_1_auto_out_a_mem_2_address),
    .auto_out_a_mem_2_mask(asource_1_auto_out_a_mem_2_mask),
    .auto_out_a_mem_2_data(asource_1_auto_out_a_mem_2_data),
    .auto_out_a_mem_2_corrupt(asource_1_auto_out_a_mem_2_corrupt),
    .auto_out_a_mem_3_opcode(asource_1_auto_out_a_mem_3_opcode),
    .auto_out_a_mem_3_param(asource_1_auto_out_a_mem_3_param),
    .auto_out_a_mem_3_size(asource_1_auto_out_a_mem_3_size),
    .auto_out_a_mem_3_source(asource_1_auto_out_a_mem_3_source),
    .auto_out_a_mem_3_address(asource_1_auto_out_a_mem_3_address),
    .auto_out_a_mem_3_mask(asource_1_auto_out_a_mem_3_mask),
    .auto_out_a_mem_3_data(asource_1_auto_out_a_mem_3_data),
    .auto_out_a_mem_3_corrupt(asource_1_auto_out_a_mem_3_corrupt),
    .auto_out_a_mem_4_opcode(asource_1_auto_out_a_mem_4_opcode),
    .auto_out_a_mem_4_param(asource_1_auto_out_a_mem_4_param),
    .auto_out_a_mem_4_size(asource_1_auto_out_a_mem_4_size),
    .auto_out_a_mem_4_source(asource_1_auto_out_a_mem_4_source),
    .auto_out_a_mem_4_address(asource_1_auto_out_a_mem_4_address),
    .auto_out_a_mem_4_mask(asource_1_auto_out_a_mem_4_mask),
    .auto_out_a_mem_4_data(asource_1_auto_out_a_mem_4_data),
    .auto_out_a_mem_4_corrupt(asource_1_auto_out_a_mem_4_corrupt),
    .auto_out_a_mem_5_opcode(asource_1_auto_out_a_mem_5_opcode),
    .auto_out_a_mem_5_param(asource_1_auto_out_a_mem_5_param),
    .auto_out_a_mem_5_size(asource_1_auto_out_a_mem_5_size),
    .auto_out_a_mem_5_source(asource_1_auto_out_a_mem_5_source),
    .auto_out_a_mem_5_address(asource_1_auto_out_a_mem_5_address),
    .auto_out_a_mem_5_mask(asource_1_auto_out_a_mem_5_mask),
    .auto_out_a_mem_5_data(asource_1_auto_out_a_mem_5_data),
    .auto_out_a_mem_5_corrupt(asource_1_auto_out_a_mem_5_corrupt),
    .auto_out_a_mem_6_opcode(asource_1_auto_out_a_mem_6_opcode),
    .auto_out_a_mem_6_param(asource_1_auto_out_a_mem_6_param),
    .auto_out_a_mem_6_size(asource_1_auto_out_a_mem_6_size),
    .auto_out_a_mem_6_source(asource_1_auto_out_a_mem_6_source),
    .auto_out_a_mem_6_address(asource_1_auto_out_a_mem_6_address),
    .auto_out_a_mem_6_mask(asource_1_auto_out_a_mem_6_mask),
    .auto_out_a_mem_6_data(asource_1_auto_out_a_mem_6_data),
    .auto_out_a_mem_6_corrupt(asource_1_auto_out_a_mem_6_corrupt),
    .auto_out_a_mem_7_opcode(asource_1_auto_out_a_mem_7_opcode),
    .auto_out_a_mem_7_param(asource_1_auto_out_a_mem_7_param),
    .auto_out_a_mem_7_size(asource_1_auto_out_a_mem_7_size),
    .auto_out_a_mem_7_source(asource_1_auto_out_a_mem_7_source),
    .auto_out_a_mem_7_address(asource_1_auto_out_a_mem_7_address),
    .auto_out_a_mem_7_mask(asource_1_auto_out_a_mem_7_mask),
    .auto_out_a_mem_7_data(asource_1_auto_out_a_mem_7_data),
    .auto_out_a_mem_7_corrupt(asource_1_auto_out_a_mem_7_corrupt),
    .auto_out_a_ridx(asource_1_auto_out_a_ridx),
    .auto_out_a_widx(asource_1_auto_out_a_widx),
    .auto_out_a_safe_ridx_valid(asource_1_auto_out_a_safe_ridx_valid),
    .auto_out_a_safe_widx_valid(asource_1_auto_out_a_safe_widx_valid),
    .auto_out_a_safe_source_reset_n(asource_1_auto_out_a_safe_source_reset_n),
    .auto_out_a_safe_sink_reset_n(asource_1_auto_out_a_safe_sink_reset_n),
    .auto_out_d_mem_0_opcode(asource_1_auto_out_d_mem_0_opcode),
    .auto_out_d_mem_0_param(asource_1_auto_out_d_mem_0_param),
    .auto_out_d_mem_0_size(asource_1_auto_out_d_mem_0_size),
    .auto_out_d_mem_0_source(asource_1_auto_out_d_mem_0_source),
    .auto_out_d_mem_0_sink(asource_1_auto_out_d_mem_0_sink),
    .auto_out_d_mem_0_denied(asource_1_auto_out_d_mem_0_denied),
    .auto_out_d_mem_0_data(asource_1_auto_out_d_mem_0_data),
    .auto_out_d_mem_0_corrupt(asource_1_auto_out_d_mem_0_corrupt),
    .auto_out_d_mem_1_opcode(asource_1_auto_out_d_mem_1_opcode),
    .auto_out_d_mem_1_param(asource_1_auto_out_d_mem_1_param),
    .auto_out_d_mem_1_size(asource_1_auto_out_d_mem_1_size),
    .auto_out_d_mem_1_source(asource_1_auto_out_d_mem_1_source),
    .auto_out_d_mem_1_sink(asource_1_auto_out_d_mem_1_sink),
    .auto_out_d_mem_1_denied(asource_1_auto_out_d_mem_1_denied),
    .auto_out_d_mem_1_data(asource_1_auto_out_d_mem_1_data),
    .auto_out_d_mem_1_corrupt(asource_1_auto_out_d_mem_1_corrupt),
    .auto_out_d_mem_2_opcode(asource_1_auto_out_d_mem_2_opcode),
    .auto_out_d_mem_2_param(asource_1_auto_out_d_mem_2_param),
    .auto_out_d_mem_2_size(asource_1_auto_out_d_mem_2_size),
    .auto_out_d_mem_2_source(asource_1_auto_out_d_mem_2_source),
    .auto_out_d_mem_2_sink(asource_1_auto_out_d_mem_2_sink),
    .auto_out_d_mem_2_denied(asource_1_auto_out_d_mem_2_denied),
    .auto_out_d_mem_2_data(asource_1_auto_out_d_mem_2_data),
    .auto_out_d_mem_2_corrupt(asource_1_auto_out_d_mem_2_corrupt),
    .auto_out_d_mem_3_opcode(asource_1_auto_out_d_mem_3_opcode),
    .auto_out_d_mem_3_param(asource_1_auto_out_d_mem_3_param),
    .auto_out_d_mem_3_size(asource_1_auto_out_d_mem_3_size),
    .auto_out_d_mem_3_source(asource_1_auto_out_d_mem_3_source),
    .auto_out_d_mem_3_sink(asource_1_auto_out_d_mem_3_sink),
    .auto_out_d_mem_3_denied(asource_1_auto_out_d_mem_3_denied),
    .auto_out_d_mem_3_data(asource_1_auto_out_d_mem_3_data),
    .auto_out_d_mem_3_corrupt(asource_1_auto_out_d_mem_3_corrupt),
    .auto_out_d_mem_4_opcode(asource_1_auto_out_d_mem_4_opcode),
    .auto_out_d_mem_4_param(asource_1_auto_out_d_mem_4_param),
    .auto_out_d_mem_4_size(asource_1_auto_out_d_mem_4_size),
    .auto_out_d_mem_4_source(asource_1_auto_out_d_mem_4_source),
    .auto_out_d_mem_4_sink(asource_1_auto_out_d_mem_4_sink),
    .auto_out_d_mem_4_denied(asource_1_auto_out_d_mem_4_denied),
    .auto_out_d_mem_4_data(asource_1_auto_out_d_mem_4_data),
    .auto_out_d_mem_4_corrupt(asource_1_auto_out_d_mem_4_corrupt),
    .auto_out_d_mem_5_opcode(asource_1_auto_out_d_mem_5_opcode),
    .auto_out_d_mem_5_param(asource_1_auto_out_d_mem_5_param),
    .auto_out_d_mem_5_size(asource_1_auto_out_d_mem_5_size),
    .auto_out_d_mem_5_source(asource_1_auto_out_d_mem_5_source),
    .auto_out_d_mem_5_sink(asource_1_auto_out_d_mem_5_sink),
    .auto_out_d_mem_5_denied(asource_1_auto_out_d_mem_5_denied),
    .auto_out_d_mem_5_data(asource_1_auto_out_d_mem_5_data),
    .auto_out_d_mem_5_corrupt(asource_1_auto_out_d_mem_5_corrupt),
    .auto_out_d_mem_6_opcode(asource_1_auto_out_d_mem_6_opcode),
    .auto_out_d_mem_6_param(asource_1_auto_out_d_mem_6_param),
    .auto_out_d_mem_6_size(asource_1_auto_out_d_mem_6_size),
    .auto_out_d_mem_6_source(asource_1_auto_out_d_mem_6_source),
    .auto_out_d_mem_6_sink(asource_1_auto_out_d_mem_6_sink),
    .auto_out_d_mem_6_denied(asource_1_auto_out_d_mem_6_denied),
    .auto_out_d_mem_6_data(asource_1_auto_out_d_mem_6_data),
    .auto_out_d_mem_6_corrupt(asource_1_auto_out_d_mem_6_corrupt),
    .auto_out_d_mem_7_opcode(asource_1_auto_out_d_mem_7_opcode),
    .auto_out_d_mem_7_param(asource_1_auto_out_d_mem_7_param),
    .auto_out_d_mem_7_size(asource_1_auto_out_d_mem_7_size),
    .auto_out_d_mem_7_source(asource_1_auto_out_d_mem_7_source),
    .auto_out_d_mem_7_sink(asource_1_auto_out_d_mem_7_sink),
    .auto_out_d_mem_7_denied(asource_1_auto_out_d_mem_7_denied),
    .auto_out_d_mem_7_data(asource_1_auto_out_d_mem_7_data),
    .auto_out_d_mem_7_corrupt(asource_1_auto_out_d_mem_7_corrupt),
    .auto_out_d_ridx(asource_1_auto_out_d_ridx),
    .auto_out_d_widx(asource_1_auto_out_d_widx),
    .auto_out_d_safe_ridx_valid(asource_1_auto_out_d_safe_ridx_valid),
    .auto_out_d_safe_widx_valid(asource_1_auto_out_d_safe_widx_valid),
    .auto_out_d_safe_source_reset_n(asource_1_auto_out_d_safe_source_reset_n),
    .auto_out_d_safe_sink_reset_n(asource_1_auto_out_d_safe_sink_reset_n)
  );
`endif
  TLAsyncCrossingSink_3 asink ( 
    .clock(asink_clock),
    .reset(asink_reset),
    .auto_in_a_mem_0_opcode(asink_auto_in_a_mem_0_opcode),
    .auto_in_a_mem_0_param(asink_auto_in_a_mem_0_param),
    .auto_in_a_mem_0_size(asink_auto_in_a_mem_0_size),
    .auto_in_a_mem_0_source(asink_auto_in_a_mem_0_source),
    .auto_in_a_mem_0_address(asink_auto_in_a_mem_0_address),
    .auto_in_a_mem_0_mask(asink_auto_in_a_mem_0_mask),
    .auto_in_a_mem_0_data(asink_auto_in_a_mem_0_data),
    .auto_in_a_mem_0_corrupt(asink_auto_in_a_mem_0_corrupt),
    .auto_in_a_mem_1_opcode(asink_auto_in_a_mem_1_opcode),
    .auto_in_a_mem_1_param(asink_auto_in_a_mem_1_param),
    .auto_in_a_mem_1_size(asink_auto_in_a_mem_1_size),
    .auto_in_a_mem_1_source(asink_auto_in_a_mem_1_source),
    .auto_in_a_mem_1_address(asink_auto_in_a_mem_1_address),
    .auto_in_a_mem_1_mask(asink_auto_in_a_mem_1_mask),
    .auto_in_a_mem_1_data(asink_auto_in_a_mem_1_data),
    .auto_in_a_mem_1_corrupt(asink_auto_in_a_mem_1_corrupt),
    .auto_in_a_mem_2_opcode(asink_auto_in_a_mem_2_opcode),
    .auto_in_a_mem_2_param(asink_auto_in_a_mem_2_param),
    .auto_in_a_mem_2_size(asink_auto_in_a_mem_2_size),
    .auto_in_a_mem_2_source(asink_auto_in_a_mem_2_source),
    .auto_in_a_mem_2_address(asink_auto_in_a_mem_2_address),
    .auto_in_a_mem_2_mask(asink_auto_in_a_mem_2_mask),
    .auto_in_a_mem_2_data(asink_auto_in_a_mem_2_data),
    .auto_in_a_mem_2_corrupt(asink_auto_in_a_mem_2_corrupt),
    .auto_in_a_mem_3_opcode(asink_auto_in_a_mem_3_opcode),
    .auto_in_a_mem_3_param(asink_auto_in_a_mem_3_param),
    .auto_in_a_mem_3_size(asink_auto_in_a_mem_3_size),
    .auto_in_a_mem_3_source(asink_auto_in_a_mem_3_source),
    .auto_in_a_mem_3_address(asink_auto_in_a_mem_3_address),
    .auto_in_a_mem_3_mask(asink_auto_in_a_mem_3_mask),
    .auto_in_a_mem_3_data(asink_auto_in_a_mem_3_data),
    .auto_in_a_mem_3_corrupt(asink_auto_in_a_mem_3_corrupt),
    .auto_in_a_mem_4_opcode(asink_auto_in_a_mem_4_opcode),
    .auto_in_a_mem_4_param(asink_auto_in_a_mem_4_param),
    .auto_in_a_mem_4_size(asink_auto_in_a_mem_4_size),
    .auto_in_a_mem_4_source(asink_auto_in_a_mem_4_source),
    .auto_in_a_mem_4_address(asink_auto_in_a_mem_4_address),
    .auto_in_a_mem_4_mask(asink_auto_in_a_mem_4_mask),
    .auto_in_a_mem_4_data(asink_auto_in_a_mem_4_data),
    .auto_in_a_mem_4_corrupt(asink_auto_in_a_mem_4_corrupt),
    .auto_in_a_mem_5_opcode(asink_auto_in_a_mem_5_opcode),
    .auto_in_a_mem_5_param(asink_auto_in_a_mem_5_param),
    .auto_in_a_mem_5_size(asink_auto_in_a_mem_5_size),
    .auto_in_a_mem_5_source(asink_auto_in_a_mem_5_source),
    .auto_in_a_mem_5_address(asink_auto_in_a_mem_5_address),
    .auto_in_a_mem_5_mask(asink_auto_in_a_mem_5_mask),
    .auto_in_a_mem_5_data(asink_auto_in_a_mem_5_data),
    .auto_in_a_mem_5_corrupt(asink_auto_in_a_mem_5_corrupt),
    .auto_in_a_mem_6_opcode(asink_auto_in_a_mem_6_opcode),
    .auto_in_a_mem_6_param(asink_auto_in_a_mem_6_param),
    .auto_in_a_mem_6_size(asink_auto_in_a_mem_6_size),
    .auto_in_a_mem_6_source(asink_auto_in_a_mem_6_source),
    .auto_in_a_mem_6_address(asink_auto_in_a_mem_6_address),
    .auto_in_a_mem_6_mask(asink_auto_in_a_mem_6_mask),
    .auto_in_a_mem_6_data(asink_auto_in_a_mem_6_data),
    .auto_in_a_mem_6_corrupt(asink_auto_in_a_mem_6_corrupt),
    .auto_in_a_mem_7_opcode(asink_auto_in_a_mem_7_opcode),
    .auto_in_a_mem_7_param(asink_auto_in_a_mem_7_param),
    .auto_in_a_mem_7_size(asink_auto_in_a_mem_7_size),
    .auto_in_a_mem_7_source(asink_auto_in_a_mem_7_source),
    .auto_in_a_mem_7_address(asink_auto_in_a_mem_7_address),
    .auto_in_a_mem_7_mask(asink_auto_in_a_mem_7_mask),
    .auto_in_a_mem_7_data(asink_auto_in_a_mem_7_data),
    .auto_in_a_mem_7_corrupt(asink_auto_in_a_mem_7_corrupt),
    .auto_in_a_ridx(asink_auto_in_a_ridx),
    .auto_in_a_widx(asink_auto_in_a_widx),
    .auto_in_a_safe_ridx_valid(asink_auto_in_a_safe_ridx_valid),
    .auto_in_a_safe_widx_valid(asink_auto_in_a_safe_widx_valid),
    .auto_in_a_safe_source_reset_n(asink_auto_in_a_safe_source_reset_n),
    .auto_in_a_safe_sink_reset_n(asink_auto_in_a_safe_sink_reset_n),
    .auto_in_d_mem_0_opcode(asink_auto_in_d_mem_0_opcode),
    .auto_in_d_mem_0_param(asink_auto_in_d_mem_0_param),
    .auto_in_d_mem_0_size(asink_auto_in_d_mem_0_size),
    .auto_in_d_mem_0_source(asink_auto_in_d_mem_0_source),
    .auto_in_d_mem_0_sink(asink_auto_in_d_mem_0_sink),
    .auto_in_d_mem_0_denied(asink_auto_in_d_mem_0_denied),
    .auto_in_d_mem_0_data(asink_auto_in_d_mem_0_data),
    .auto_in_d_mem_0_corrupt(asink_auto_in_d_mem_0_corrupt),
    .auto_in_d_mem_1_opcode(asink_auto_in_d_mem_1_opcode),
    .auto_in_d_mem_1_param(asink_auto_in_d_mem_1_param),
    .auto_in_d_mem_1_size(asink_auto_in_d_mem_1_size),
    .auto_in_d_mem_1_source(asink_auto_in_d_mem_1_source),
    .auto_in_d_mem_1_sink(asink_auto_in_d_mem_1_sink),
    .auto_in_d_mem_1_denied(asink_auto_in_d_mem_1_denied),
    .auto_in_d_mem_1_data(asink_auto_in_d_mem_1_data),
    .auto_in_d_mem_1_corrupt(asink_auto_in_d_mem_1_corrupt),
    .auto_in_d_mem_2_opcode(asink_auto_in_d_mem_2_opcode),
    .auto_in_d_mem_2_param(asink_auto_in_d_mem_2_param),
    .auto_in_d_mem_2_size(asink_auto_in_d_mem_2_size),
    .auto_in_d_mem_2_source(asink_auto_in_d_mem_2_source),
    .auto_in_d_mem_2_sink(asink_auto_in_d_mem_2_sink),
    .auto_in_d_mem_2_denied(asink_auto_in_d_mem_2_denied),
    .auto_in_d_mem_2_data(asink_auto_in_d_mem_2_data),
    .auto_in_d_mem_2_corrupt(asink_auto_in_d_mem_2_corrupt),
    .auto_in_d_mem_3_opcode(asink_auto_in_d_mem_3_opcode),
    .auto_in_d_mem_3_param(asink_auto_in_d_mem_3_param),
    .auto_in_d_mem_3_size(asink_auto_in_d_mem_3_size),
    .auto_in_d_mem_3_source(asink_auto_in_d_mem_3_source),
    .auto_in_d_mem_3_sink(asink_auto_in_d_mem_3_sink),
    .auto_in_d_mem_3_denied(asink_auto_in_d_mem_3_denied),
    .auto_in_d_mem_3_data(asink_auto_in_d_mem_3_data),
    .auto_in_d_mem_3_corrupt(asink_auto_in_d_mem_3_corrupt),
    .auto_in_d_mem_4_opcode(asink_auto_in_d_mem_4_opcode),
    .auto_in_d_mem_4_param(asink_auto_in_d_mem_4_param),
    .auto_in_d_mem_4_size(asink_auto_in_d_mem_4_size),
    .auto_in_d_mem_4_source(asink_auto_in_d_mem_4_source),
    .auto_in_d_mem_4_sink(asink_auto_in_d_mem_4_sink),
    .auto_in_d_mem_4_denied(asink_auto_in_d_mem_4_denied),
    .auto_in_d_mem_4_data(asink_auto_in_d_mem_4_data),
    .auto_in_d_mem_4_corrupt(asink_auto_in_d_mem_4_corrupt),
    .auto_in_d_mem_5_opcode(asink_auto_in_d_mem_5_opcode),
    .auto_in_d_mem_5_param(asink_auto_in_d_mem_5_param),
    .auto_in_d_mem_5_size(asink_auto_in_d_mem_5_size),
    .auto_in_d_mem_5_source(asink_auto_in_d_mem_5_source),
    .auto_in_d_mem_5_sink(asink_auto_in_d_mem_5_sink),
    .auto_in_d_mem_5_denied(asink_auto_in_d_mem_5_denied),
    .auto_in_d_mem_5_data(asink_auto_in_d_mem_5_data),
    .auto_in_d_mem_5_corrupt(asink_auto_in_d_mem_5_corrupt),
    .auto_in_d_mem_6_opcode(asink_auto_in_d_mem_6_opcode),
    .auto_in_d_mem_6_param(asink_auto_in_d_mem_6_param),
    .auto_in_d_mem_6_size(asink_auto_in_d_mem_6_size),
    .auto_in_d_mem_6_source(asink_auto_in_d_mem_6_source),
    .auto_in_d_mem_6_sink(asink_auto_in_d_mem_6_sink),
    .auto_in_d_mem_6_denied(asink_auto_in_d_mem_6_denied),
    .auto_in_d_mem_6_data(asink_auto_in_d_mem_6_data),
    .auto_in_d_mem_6_corrupt(asink_auto_in_d_mem_6_corrupt),
    .auto_in_d_mem_7_opcode(asink_auto_in_d_mem_7_opcode),
    .auto_in_d_mem_7_param(asink_auto_in_d_mem_7_param),
    .auto_in_d_mem_7_size(asink_auto_in_d_mem_7_size),
    .auto_in_d_mem_7_source(asink_auto_in_d_mem_7_source),
    .auto_in_d_mem_7_sink(asink_auto_in_d_mem_7_sink),
    .auto_in_d_mem_7_denied(asink_auto_in_d_mem_7_denied),
    .auto_in_d_mem_7_data(asink_auto_in_d_mem_7_data),
    .auto_in_d_mem_7_corrupt(asink_auto_in_d_mem_7_corrupt),
    .auto_in_d_ridx(asink_auto_in_d_ridx),
    .auto_in_d_widx(asink_auto_in_d_widx),
    .auto_in_d_safe_ridx_valid(asink_auto_in_d_safe_ridx_valid),
    .auto_in_d_safe_widx_valid(asink_auto_in_d_safe_widx_valid),
    .auto_in_d_safe_source_reset_n(asink_auto_in_d_safe_source_reset_n),
    .auto_in_d_safe_sink_reset_n(asink_auto_in_d_safe_sink_reset_n),
    .auto_out_a_ready(asink_auto_out_a_ready),
    .auto_out_a_valid(asink_auto_out_a_valid),
    .auto_out_a_bits_opcode(asink_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(asink_auto_out_a_bits_param),
    .auto_out_a_bits_size(asink_auto_out_a_bits_size),
    .auto_out_a_bits_source(asink_auto_out_a_bits_source),
    .auto_out_a_bits_address(asink_auto_out_a_bits_address),
    .auto_out_a_bits_mask(asink_auto_out_a_bits_mask),
    .auto_out_a_bits_data(asink_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt(asink_auto_out_a_bits_corrupt),
    .auto_out_d_ready(asink_auto_out_d_ready),
    .auto_out_d_valid(asink_auto_out_d_valid),
    .auto_out_d_bits_opcode(asink_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(asink_auto_out_d_bits_param),
    .auto_out_d_bits_size(asink_auto_out_d_bits_size),
    .auto_out_d_bits_source(asink_auto_out_d_bits_source),
    .auto_out_d_bits_sink(asink_auto_out_d_bits_sink),
    .auto_out_d_bits_denied(asink_auto_out_d_bits_denied),
    .auto_out_d_bits_data(asink_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(asink_auto_out_d_bits_corrupt)
  );
  IntSyncCrossingSink intsink_6 ( 
    .clock(intsink_6_clock),
    .auto_in_sync_0(intsink_6_auto_in_sync_0),
    .auto_out_0(intsink_6_auto_out_0)
  );
  IntXing_2 asyncXing_2 ( 
    .clock(asyncXing_2_clock),
    .auto_int_in_0(asyncXing_2_auto_int_in_0),
    .auto_int_in_1(asyncXing_2_auto_int_in_1),
    .auto_int_in_2(asyncXing_2_auto_int_in_2),
    .auto_int_in_3(asyncXing_2_auto_int_in_3),
    .auto_int_out_0(asyncXing_2_auto_int_out_0),
    .auto_int_out_1(asyncXing_2_auto_int_out_1),
    .auto_int_out_2(asyncXing_2_auto_int_out_2),
    .auto_int_out_3(asyncXing_2_auto_int_out_3)
  );
  TLGPIO gpio_0 ( 
    .clock(gpio_0_clock),
    .reset(gpio_0_reset),
    .auto_int_xing_out_sync_0(gpio_0_auto_int_xing_out_sync_0),
    .auto_int_xing_out_sync_1(gpio_0_auto_int_xing_out_sync_1),
    .auto_int_xing_out_sync_2(gpio_0_auto_int_xing_out_sync_2),
    .auto_int_xing_out_sync_3(gpio_0_auto_int_xing_out_sync_3),
    .auto_control_xing_in_a_ready(gpio_0_auto_control_xing_in_a_ready),
    .auto_control_xing_in_a_valid(gpio_0_auto_control_xing_in_a_valid),
    .auto_control_xing_in_a_bits_opcode(gpio_0_auto_control_xing_in_a_bits_opcode),
    .auto_control_xing_in_a_bits_param(gpio_0_auto_control_xing_in_a_bits_param),
    .auto_control_xing_in_a_bits_size(gpio_0_auto_control_xing_in_a_bits_size),
    .auto_control_xing_in_a_bits_source(gpio_0_auto_control_xing_in_a_bits_source),
    .auto_control_xing_in_a_bits_address(gpio_0_auto_control_xing_in_a_bits_address),
    .auto_control_xing_in_a_bits_mask(gpio_0_auto_control_xing_in_a_bits_mask),
    .auto_control_xing_in_a_bits_data(gpio_0_auto_control_xing_in_a_bits_data),
    .auto_control_xing_in_a_bits_corrupt(gpio_0_auto_control_xing_in_a_bits_corrupt),
    .auto_control_xing_in_d_ready(gpio_0_auto_control_xing_in_d_ready),
    .auto_control_xing_in_d_valid(gpio_0_auto_control_xing_in_d_valid),
    .auto_control_xing_in_d_bits_opcode(gpio_0_auto_control_xing_in_d_bits_opcode),
    .auto_control_xing_in_d_bits_size(gpio_0_auto_control_xing_in_d_bits_size),
    .auto_control_xing_in_d_bits_source(gpio_0_auto_control_xing_in_d_bits_source),
    .auto_control_xing_in_d_bits_data(gpio_0_auto_control_xing_in_d_bits_data),
    .auto_io_out_pins_0_o_oval(gpio_0_auto_io_out_pins_0_o_oval),
    .auto_io_out_pins_1_o_oval(gpio_0_auto_io_out_pins_1_o_oval),
    .auto_io_out_pins_2_o_oval(gpio_0_auto_io_out_pins_2_o_oval),
    .auto_io_out_pins_3_o_oval(gpio_0_auto_io_out_pins_3_o_oval)
  );
  IntSyncCrossingSink_23 intsink_7 ( 
    .auto_in_sync_0(intsink_7_auto_in_sync_0),
    .auto_in_sync_1(intsink_7_auto_in_sync_1),
    .auto_in_sync_2(intsink_7_auto_in_sync_2),
    .auto_in_sync_3(intsink_7_auto_in_sync_3|spi_master_events_o[1]), // merge spi_master
    .auto_out_0(intsink_7_auto_out_0),
    .auto_out_1(intsink_7_auto_out_1),
    .auto_out_2(intsink_7_auto_out_2),
    .auto_out_3(intsink_7_auto_out_3)
  );
  DebugTransportModuleJTAG dtm ( 
    .clock(dtm_clock),
    .reset(dtm_reset),
    .io_dmi_req_ready(dtm_io_dmi_req_ready),
    .io_dmi_req_valid(dtm_io_dmi_req_valid),
    .io_dmi_req_bits_addr(dtm_io_dmi_req_bits_addr),
    .io_dmi_req_bits_data(dtm_io_dmi_req_bits_data),
    .io_dmi_req_bits_op(dtm_io_dmi_req_bits_op),
    .io_dmi_resp_ready(dtm_io_dmi_resp_ready),
    .io_dmi_resp_valid(dtm_io_dmi_resp_valid),
    .io_dmi_resp_bits_data(dtm_io_dmi_resp_bits_data),
    .io_dmi_resp_bits_resp(dtm_io_dmi_resp_bits_resp),
    .io_jtag_TMS(dtm_io_jtag_TMS),
    .io_jtag_TDI(dtm_io_jtag_TDI),
    .io_jtag_TDO_data(dtm_io_jtag_TDO_data),
    .io_jtag_reset(dtm_io_jtag_reset),
    .io_fsmReset(dtm_io_fsmReset)
  );
  ResetCatchAndSync_d3 dmiResetCatch ( 
    .clock(dmiResetCatch_clock),
    .reset(dmiResetCatch_reset),
    .io_sync_reset(dmiResetCatch_io_sync_reset)
  );
  assign int_rtc_tick = value == 6'h31; 
  assign _T_2468 = value + 6'h1; 
  assign gpio_pins_pins_2_o_oval = gpio_0_auto_io_out_pins_2_o_oval; 
  assign gpio_pins_pins_3_o_oval = gpio_0_auto_io_out_pins_3_o_oval; 
  assign _T_2498 = {gpio_pins_pins_2_o_oval,gpio_pins_pins_3_o_oval}; 
  assign gpio_pins_pins_0_o_oval = gpio_0_auto_io_out_pins_0_o_oval; 
  assign gpio_pins_pins_1_o_oval = gpio_0_auto_io_out_pins_1_o_oval; 
  assign _T_2499 = {gpio_pins_pins_0_o_oval,gpio_pins_pins_1_o_oval}; 
  assign gpio_cat = {_T_2499,_T_2498}; 
  assign auto_led_source_out = {{4'd0}, gpio_cat}; 
  assign auto_io_out_1_port_pci_exp_txp = pcie_io_port_pci_exp_txp; 
  assign auto_io_out_1_port_pci_exp_txn = pcie_io_port_pci_exp_txn; 
  assign auto_io_out_1_port_axi_aclk_out = pcie_io_port_axi_aclk_out; 
  assign auto_io_out_1_port_mmcm_lock = pcie_io_port_mmcm_lock; 
  assign auto_io_out_0_port_ddr3_addr = mig_io_port_ddr3_addr; 
  assign auto_io_out_0_port_ddr3_ba = mig_io_port_ddr3_ba; 
  assign auto_io_out_0_port_ddr3_ras_n = mig_io_port_ddr3_ras_n; 
  assign auto_io_out_0_port_ddr3_cas_n = mig_io_port_ddr3_cas_n; 
  assign auto_io_out_0_port_ddr3_we_n = mig_io_port_ddr3_we_n; 
  assign auto_io_out_0_port_ddr3_reset_n = mig_io_port_ddr3_reset_n; 
  assign auto_io_out_0_port_ddr3_ck_p = mig_io_port_ddr3_ck_p; 
  assign auto_io_out_0_port_ddr3_ck_n = mig_io_port_ddr3_ck_n; 
  assign auto_io_out_0_port_ddr3_cke = mig_io_port_ddr3_cke; 
  assign auto_io_out_0_port_ddr3_cs_n = mig_io_port_ddr3_cs_n; 
  assign auto_io_out_0_port_ddr3_dm = mig_io_port_ddr3_dm; 
  assign auto_io_out_0_port_ddr3_odt = mig_io_port_ddr3_odt; 
  assign auto_io_out_0_port_ui_clk = mig_io_port_ui_clk; 
  assign auto_io_out_0_port_ui_clk_sync_rst = mig_io_port_ui_clk_sync_rst; 
  assign auto_io_out_0_port_mmcm_locked = mig_io_port_mmcm_locked; 
  assign auto_spi_source_out_sck = spi_0_auto_io_out_sck; 
  assign auto_spi_source_out_dq_0_o = spi_0_auto_io_out_dq_0_o; 
  assign auto_spi_source_out_cs_0 = spi_0_auto_io_out_cs_0; 
  assign auto_uart_source_out_txd = uart_0_auto_io_out_txd; 
  assign debug_systemjtag_jtag_TDO_data = dtm_io_jtag_TDO_data; 
  assign debug_ndreset = debug_1_io_ctrl_ndreset; 
  assign int_bus_auto_int_in_3_0 = asyncXing_2_auto_int_out_0; 
  assign int_bus_auto_int_in_3_1 = asyncXing_2_auto_int_out_1; 
  assign int_bus_auto_int_in_3_2 = asyncXing_2_auto_int_out_2; 
  assign int_bus_auto_int_in_3_3 = asyncXing_2_auto_int_out_3; 
  assign int_bus_auto_int_in_2_0 = intsink_6_auto_out_0; 
  assign int_bus_auto_int_in_1_0 = asyncXing_1_auto_int_out_0; 
  assign int_bus_auto_int_in_0_0 = asyncXing_auto_int_out_0; 
  assign sbus_clock = clock; 
  assign sbus_reset = reset; 
  assign sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_a_ready = asource_1_auto_in_a_ready; 
  assign sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_d_valid = asource_1_auto_in_d_valid; 
  assign sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_d_bits_opcode = asource_1_auto_in_d_bits_opcode; 
  assign sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_d_bits_param = asource_1_auto_in_d_bits_param; 
  assign sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_d_bits_size = asource_1_auto_in_d_bits_size; 
  assign sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_d_bits_source = asource_1_auto_in_d_bits_source; 
  assign sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_d_bits_sink = asource_1_auto_in_d_bits_sink; 
  assign sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_d_bits_denied = asource_1_auto_in_d_bits_denied; 
  assign sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_d_bits_data = asource_1_auto_in_d_bits_data; 
  assign sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_d_bits_corrupt = asource_1_auto_in_d_bits_corrupt; 
  assign sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_a_ready = asource_auto_in_a_ready; 
  assign sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_d_valid = asource_auto_in_d_valid; 
  assign sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_d_bits_opcode = asource_auto_in_d_bits_opcode; 
  assign sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_d_bits_param = asource_auto_in_d_bits_param; 
  assign sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_d_bits_size = asource_auto_in_d_bits_size; 
  assign sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_d_bits_source = asource_auto_in_d_bits_source; 
  assign sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_d_bits_sink = asource_auto_in_d_bits_sink; 
  assign sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_d_bits_denied = asource_auto_in_d_bits_denied; 
  assign sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_d_bits_data = asource_auto_in_d_bits_data; 
  assign sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_d_bits_corrupt = asource_auto_in_d_bits_corrupt; 
  assign sbus_auto_coupler_from_master_named_pcie_0_fixer_in_a_valid = asink_auto_out_a_valid; 
  assign sbus_auto_coupler_from_master_named_pcie_0_fixer_in_a_bits_opcode = asink_auto_out_a_bits_opcode; 
  assign sbus_auto_coupler_from_master_named_pcie_0_fixer_in_a_bits_param = asink_auto_out_a_bits_param; 
  assign sbus_auto_coupler_from_master_named_pcie_0_fixer_in_a_bits_size = asink_auto_out_a_bits_size; 
  assign sbus_auto_coupler_from_master_named_pcie_0_fixer_in_a_bits_source = asink_auto_out_a_bits_source; 
  assign sbus_auto_coupler_from_master_named_pcie_0_fixer_in_a_bits_address = asink_auto_out_a_bits_address; 
  assign sbus_auto_coupler_from_master_named_pcie_0_fixer_in_a_bits_mask = asink_auto_out_a_bits_mask; 
  assign sbus_auto_coupler_from_master_named_pcie_0_fixer_in_a_bits_data = asink_auto_out_a_bits_data; 
  assign sbus_auto_coupler_from_master_named_pcie_0_fixer_in_a_bits_corrupt = asink_auto_out_a_bits_corrupt; 
  assign sbus_auto_coupler_from_master_named_pcie_0_fixer_in_d_ready = asink_auto_out_d_ready; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_valid = tile_3_auto_tl_master_xing_out_a_valid; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_bits_opcode = tile_3_auto_tl_master_xing_out_a_bits_opcode; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_bits_param = tile_3_auto_tl_master_xing_out_a_bits_param; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_bits_size = tile_3_auto_tl_master_xing_out_a_bits_size; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_bits_source = tile_3_auto_tl_master_xing_out_a_bits_source; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_bits_address = tile_3_auto_tl_master_xing_out_a_bits_address; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_bits_mask = tile_3_auto_tl_master_xing_out_a_bits_mask; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_bits_data = tile_3_auto_tl_master_xing_out_a_bits_data; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_bits_corrupt = tile_3_auto_tl_master_xing_out_a_bits_corrupt; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_b_ready = tile_3_auto_tl_master_xing_out_b_ready; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_c_valid = tile_3_auto_tl_master_xing_out_c_valid; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_c_bits_opcode = tile_3_auto_tl_master_xing_out_c_bits_opcode; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_c_bits_param = tile_3_auto_tl_master_xing_out_c_bits_param; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_c_bits_size = tile_3_auto_tl_master_xing_out_c_bits_size; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_c_bits_source = tile_3_auto_tl_master_xing_out_c_bits_source; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_c_bits_address = tile_3_auto_tl_master_xing_out_c_bits_address; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_c_bits_data = tile_3_auto_tl_master_xing_out_c_bits_data; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_c_bits_corrupt = tile_3_auto_tl_master_xing_out_c_bits_corrupt; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_ready = tile_3_auto_tl_master_xing_out_d_ready; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_e_valid = tile_3_auto_tl_master_xing_out_e_valid; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_e_bits_sink = tile_3_auto_tl_master_xing_out_e_bits_sink; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_valid = tile_2_auto_tl_master_xing_out_a_valid; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_bits_opcode = tile_2_auto_tl_master_xing_out_a_bits_opcode; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_bits_param = tile_2_auto_tl_master_xing_out_a_bits_param; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_bits_size = tile_2_auto_tl_master_xing_out_a_bits_size; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_bits_source = tile_2_auto_tl_master_xing_out_a_bits_source; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_bits_address = tile_2_auto_tl_master_xing_out_a_bits_address; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_bits_mask = tile_2_auto_tl_master_xing_out_a_bits_mask; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_bits_data = tile_2_auto_tl_master_xing_out_a_bits_data; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_bits_corrupt = tile_2_auto_tl_master_xing_out_a_bits_corrupt; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_b_ready = tile_2_auto_tl_master_xing_out_b_ready; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_c_valid = tile_2_auto_tl_master_xing_out_c_valid; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_c_bits_opcode = tile_2_auto_tl_master_xing_out_c_bits_opcode; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_c_bits_param = tile_2_auto_tl_master_xing_out_c_bits_param; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_c_bits_size = tile_2_auto_tl_master_xing_out_c_bits_size; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_c_bits_source = tile_2_auto_tl_master_xing_out_c_bits_source; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_c_bits_address = tile_2_auto_tl_master_xing_out_c_bits_address; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_c_bits_data = tile_2_auto_tl_master_xing_out_c_bits_data; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_c_bits_corrupt = tile_2_auto_tl_master_xing_out_c_bits_corrupt; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_ready = tile_2_auto_tl_master_xing_out_d_ready; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_e_valid = tile_2_auto_tl_master_xing_out_e_valid; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_e_bits_sink = tile_2_auto_tl_master_xing_out_e_bits_sink; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_valid = tile_1_auto_tl_master_xing_out_a_valid; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_bits_opcode = tile_1_auto_tl_master_xing_out_a_bits_opcode; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_bits_param = tile_1_auto_tl_master_xing_out_a_bits_param; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_bits_size = tile_1_auto_tl_master_xing_out_a_bits_size; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_bits_source = tile_1_auto_tl_master_xing_out_a_bits_source; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_bits_address = tile_1_auto_tl_master_xing_out_a_bits_address; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_bits_mask = tile_1_auto_tl_master_xing_out_a_bits_mask; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_bits_data = tile_1_auto_tl_master_xing_out_a_bits_data; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_bits_corrupt = tile_1_auto_tl_master_xing_out_a_bits_corrupt; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_b_ready = tile_1_auto_tl_master_xing_out_b_ready; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_c_valid = tile_1_auto_tl_master_xing_out_c_valid; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_c_bits_opcode = tile_1_auto_tl_master_xing_out_c_bits_opcode; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_c_bits_param = tile_1_auto_tl_master_xing_out_c_bits_param; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_c_bits_size = tile_1_auto_tl_master_xing_out_c_bits_size; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_c_bits_source = tile_1_auto_tl_master_xing_out_c_bits_source; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_c_bits_address = tile_1_auto_tl_master_xing_out_c_bits_address; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_c_bits_data = tile_1_auto_tl_master_xing_out_c_bits_data; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_c_bits_corrupt = tile_1_auto_tl_master_xing_out_c_bits_corrupt; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_ready = tile_1_auto_tl_master_xing_out_d_ready; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_e_valid = tile_1_auto_tl_master_xing_out_e_valid; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_e_bits_sink = tile_1_auto_tl_master_xing_out_e_bits_sink; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_valid = tile_auto_tl_master_xing_out_a_valid; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_bits_opcode = tile_auto_tl_master_xing_out_a_bits_opcode; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_bits_param = tile_auto_tl_master_xing_out_a_bits_param; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_bits_size = tile_auto_tl_master_xing_out_a_bits_size; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_bits_source = tile_auto_tl_master_xing_out_a_bits_source; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_bits_address = tile_auto_tl_master_xing_out_a_bits_address; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_bits_mask = tile_auto_tl_master_xing_out_a_bits_mask; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_bits_data = tile_auto_tl_master_xing_out_a_bits_data; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_bits_corrupt = tile_auto_tl_master_xing_out_a_bits_corrupt; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_b_ready = tile_auto_tl_master_xing_out_b_ready; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_c_valid = tile_auto_tl_master_xing_out_c_valid; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_c_bits_opcode = tile_auto_tl_master_xing_out_c_bits_opcode; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_c_bits_param = tile_auto_tl_master_xing_out_c_bits_param; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_c_bits_size = tile_auto_tl_master_xing_out_c_bits_size; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_c_bits_source = tile_auto_tl_master_xing_out_c_bits_source; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_c_bits_address = tile_auto_tl_master_xing_out_c_bits_address; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_c_bits_data = tile_auto_tl_master_xing_out_c_bits_data; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_c_bits_corrupt = tile_auto_tl_master_xing_out_c_bits_corrupt; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_ready = tile_auto_tl_master_xing_out_d_ready; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_e_valid = tile_auto_tl_master_xing_out_e_valid; 
  assign sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_e_bits_sink = tile_auto_tl_master_xing_out_e_bits_sink; 
  assign sbus_auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_a_ready = maskROM_auto_in_a_ready; 
  assign sbus_auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_d_valid = maskROM_auto_in_d_valid; 
  assign sbus_auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_d_bits_size = maskROM_auto_in_d_bits_size; 
  assign sbus_auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_d_bits_source = maskROM_auto_in_d_bits_source; 
  assign sbus_auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_d_bits_data = maskROM_auto_in_d_bits_data; 
  assign sbus_auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_ready = debug_1_auto_dmInner_dmInner_tl_in_a_ready; 
  assign sbus_auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_d_valid = debug_1_auto_dmInner_dmInner_tl_in_d_valid; 
  assign sbus_auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_d_bits_opcode = debug_1_auto_dmInner_dmInner_tl_in_d_bits_opcode; 
  assign sbus_auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_d_bits_size = debug_1_auto_dmInner_dmInner_tl_in_d_bits_size; 
  assign sbus_auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_d_bits_source = debug_1_auto_dmInner_dmInner_tl_in_d_bits_source; 
  assign sbus_auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_d_bits_data = debug_1_auto_dmInner_dmInner_tl_in_d_bits_data; 
  assign sbus_auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_ready = clint_auto_in_a_ready; 
  assign sbus_auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_d_valid = clint_auto_in_d_valid; 
  assign sbus_auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_d_bits_opcode = clint_auto_in_d_bits_opcode; 
  assign sbus_auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_d_bits_size = clint_auto_in_d_bits_size; 
  assign sbus_auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_d_bits_source = clint_auto_in_d_bits_source; 
  assign sbus_auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_d_bits_data = clint_auto_in_d_bits_data; 
  assign sbus_auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_ready = plic_auto_in_a_ready; 
  assign sbus_auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_d_valid = plic_auto_in_d_valid; 
  assign sbus_auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_d_bits_opcode = plic_auto_in_d_bits_opcode; 
  assign sbus_auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_d_bits_size = plic_auto_in_d_bits_size; 
  assign sbus_auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_d_bits_source = plic_auto_in_d_bits_source; 
  assign sbus_auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_d_bits_data = plic_auto_in_d_bits_data; 
  assign sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_ready = pbus_auto_from_cbus_in_a_ready; 
  assign sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_valid = pbus_auto_from_cbus_in_d_valid; 
  assign sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_bits_opcode = pbus_auto_from_cbus_in_d_bits_opcode; 
  assign sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_bits_param = pbus_auto_from_cbus_in_d_bits_param; 
  assign sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_bits_size = pbus_auto_from_cbus_in_d_bits_size; 
  assign sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_bits_source = pbus_auto_from_cbus_in_d_bits_source; 
  assign sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_bits_sink = pbus_auto_from_cbus_in_d_bits_sink; 
  assign sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_bits_denied = pbus_auto_from_cbus_in_d_bits_denied; 
  assign sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_bits_data = pbus_auto_from_cbus_in_d_bits_data; 
  assign sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_bits_corrupt = pbus_auto_from_cbus_in_d_bits_corrupt; 
  assign sbus_auto_system_bus_xbar_out_a_ready = bh_auto_in_a_ready; 
  assign sbus_auto_system_bus_xbar_out_b_valid = bh_auto_in_b_valid; 
  assign sbus_auto_system_bus_xbar_out_b_bits_param = bh_auto_in_b_bits_param; 
  assign sbus_auto_system_bus_xbar_out_b_bits_source = bh_auto_in_b_bits_source; 
  assign sbus_auto_system_bus_xbar_out_b_bits_address = bh_auto_in_b_bits_address; 
  assign sbus_auto_system_bus_xbar_out_c_ready = bh_auto_in_c_ready; 
  assign sbus_auto_system_bus_xbar_out_d_valid = bh_auto_in_d_valid; 
  assign sbus_auto_system_bus_xbar_out_d_bits_opcode = bh_auto_in_d_bits_opcode; 
  assign sbus_auto_system_bus_xbar_out_d_bits_param = bh_auto_in_d_bits_param; 
  assign sbus_auto_system_bus_xbar_out_d_bits_size = bh_auto_in_d_bits_size; 
  assign sbus_auto_system_bus_xbar_out_d_bits_source = bh_auto_in_d_bits_source; 
  assign sbus_auto_system_bus_xbar_out_d_bits_sink = bh_auto_in_d_bits_sink; 
  assign sbus_auto_system_bus_xbar_out_d_bits_denied = bh_auto_in_d_bits_denied; 
  assign sbus_auto_system_bus_xbar_out_d_bits_data = bh_auto_in_d_bits_data; 
  assign sbus_auto_system_bus_xbar_out_d_bits_corrupt = bh_auto_in_d_bits_corrupt; 
  assign pbus_clock = clock; 
  assign pbus_reset = reset; 
  assign pbus_auto_coupler_to_device_named_gpio_0_control_xing_out_a_ready = gpio_0_auto_control_xing_in_a_ready; 
  assign pbus_auto_coupler_to_device_named_gpio_0_control_xing_out_d_valid = gpio_0_auto_control_xing_in_d_valid; 
  assign pbus_auto_coupler_to_device_named_gpio_0_control_xing_out_d_bits_opcode = gpio_0_auto_control_xing_in_d_bits_opcode; 
  assign pbus_auto_coupler_to_device_named_gpio_0_control_xing_out_d_bits_size = gpio_0_auto_control_xing_in_d_bits_size; 
  assign pbus_auto_coupler_to_device_named_gpio_0_control_xing_out_d_bits_source = gpio_0_auto_control_xing_in_d_bits_source; 
  assign pbus_auto_coupler_to_device_named_gpio_0_control_xing_out_d_bits_data = gpio_0_auto_control_xing_in_d_bits_data; 
  assign pbus_auto_coupler_to_device_named_spi_0_control_xing_out_a_ready = spi_0_auto_control_xing_in_a_ready; 
  assign pbus_auto_coupler_to_device_named_spi_0_control_xing_out_d_valid = spi_0_auto_control_xing_in_d_valid; 
  assign pbus_auto_coupler_to_device_named_spi_0_control_xing_out_d_bits_opcode = spi_0_auto_control_xing_in_d_bits_opcode; 
  assign pbus_auto_coupler_to_device_named_spi_0_control_xing_out_d_bits_size = spi_0_auto_control_xing_in_d_bits_size; 
  assign pbus_auto_coupler_to_device_named_spi_0_control_xing_out_d_bits_source = spi_0_auto_control_xing_in_d_bits_source; 
  assign pbus_auto_coupler_to_device_named_spi_0_control_xing_out_d_bits_data = spi_0_auto_control_xing_in_d_bits_data; 
  assign pbus_auto_coupler_to_slave_named_uart_0_control_xing_out_a_ready = uart_0_auto_control_xing_in_a_ready; 
  assign pbus_auto_coupler_to_slave_named_uart_0_control_xing_out_d_valid = uart_0_auto_control_xing_in_d_valid; 
  assign pbus_auto_coupler_to_slave_named_uart_0_control_xing_out_d_bits_opcode = uart_0_auto_control_xing_in_d_bits_opcode; 
  assign pbus_auto_coupler_to_slave_named_uart_0_control_xing_out_d_bits_size = uart_0_auto_control_xing_in_d_bits_size; 
  assign pbus_auto_coupler_to_slave_named_uart_0_control_xing_out_d_bits_source = uart_0_auto_control_xing_in_d_bits_source; 
  assign pbus_auto_coupler_to_slave_named_uart_0_control_xing_out_d_bits_data = uart_0_auto_control_xing_in_d_bits_data; 
  assign pbus_auto_from_cbus_in_a_valid = sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_valid; 
  assign pbus_auto_from_cbus_in_a_bits_opcode = sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_bits_opcode; 
  assign pbus_auto_from_cbus_in_a_bits_param = sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_bits_param; 
  assign pbus_auto_from_cbus_in_a_bits_size = sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_bits_size; 
  assign pbus_auto_from_cbus_in_a_bits_source = sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_bits_source; 
  assign pbus_auto_from_cbus_in_a_bits_address = sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_bits_address; 
  assign pbus_auto_from_cbus_in_a_bits_mask = sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_bits_mask; 
  assign pbus_auto_from_cbus_in_a_bits_data = sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_bits_data; 
  assign pbus_auto_from_cbus_in_a_bits_corrupt = sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_bits_corrupt; 
  assign pbus_auto_from_cbus_in_d_ready = sbus_auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_ready; 
  assign bh_clock = clock; 
  assign bh_reset = reset; 
  assign bh_auto_in_a_valid = sbus_auto_system_bus_xbar_out_a_valid; 
  assign bh_auto_in_a_bits_opcode = sbus_auto_system_bus_xbar_out_a_bits_opcode; 
  assign bh_auto_in_a_bits_param = sbus_auto_system_bus_xbar_out_a_bits_param; 
  assign bh_auto_in_a_bits_size = sbus_auto_system_bus_xbar_out_a_bits_size; 
  assign bh_auto_in_a_bits_source = sbus_auto_system_bus_xbar_out_a_bits_source; 
  assign bh_auto_in_a_bits_address = sbus_auto_system_bus_xbar_out_a_bits_address; 
  assign bh_auto_in_a_bits_mask = sbus_auto_system_bus_xbar_out_a_bits_mask; 
  assign bh_auto_in_a_bits_data = sbus_auto_system_bus_xbar_out_a_bits_data; 
  assign bh_auto_in_a_bits_corrupt = sbus_auto_system_bus_xbar_out_a_bits_corrupt; 
  assign bh_auto_in_b_ready = sbus_auto_system_bus_xbar_out_b_ready; 
  assign bh_auto_in_c_valid = sbus_auto_system_bus_xbar_out_c_valid; 
  assign bh_auto_in_c_bits_opcode = sbus_auto_system_bus_xbar_out_c_bits_opcode; 
  assign bh_auto_in_c_bits_param = sbus_auto_system_bus_xbar_out_c_bits_param; 
  assign bh_auto_in_c_bits_size = sbus_auto_system_bus_xbar_out_c_bits_size; 
  assign bh_auto_in_c_bits_source = sbus_auto_system_bus_xbar_out_c_bits_source; 
  assign bh_auto_in_c_bits_address = sbus_auto_system_bus_xbar_out_c_bits_address; 
  assign bh_auto_in_c_bits_data = sbus_auto_system_bus_xbar_out_c_bits_data; 
  assign bh_auto_in_c_bits_corrupt = sbus_auto_system_bus_xbar_out_c_bits_corrupt; 
  assign bh_auto_in_d_ready = sbus_auto_system_bus_xbar_out_d_ready; 
  assign bh_auto_in_e_valid = sbus_auto_system_bus_xbar_out_e_valid; 
  assign bh_auto_in_e_bits_sink = sbus_auto_system_bus_xbar_out_e_bits_sink; 
  assign bh_auto_out_a_ready = ww_auto_in_a_ready; 
  assign bh_auto_out_d_valid = ww_auto_in_d_valid; 
  assign bh_auto_out_d_bits_opcode = ww_auto_in_d_bits_opcode; 
  assign bh_auto_out_d_bits_param = ww_auto_in_d_bits_param; 
  assign bh_auto_out_d_bits_size = ww_auto_in_d_bits_size; 
  assign bh_auto_out_d_bits_source = ww_auto_in_d_bits_source; 
  assign bh_auto_out_d_bits_denied = ww_auto_in_d_bits_denied; 
  assign bh_auto_out_d_bits_data = ww_auto_in_d_bits_data; 
  assign bh_auto_out_d_bits_corrupt = ww_auto_in_d_bits_corrupt; 
  assign ww_clock = clock; 
  assign ww_reset = reset; 
  assign ww_auto_in_a_valid = bh_auto_out_a_valid; 
  assign ww_auto_in_a_bits_opcode = bh_auto_out_a_bits_opcode; 
  assign ww_auto_in_a_bits_param = bh_auto_out_a_bits_param; 
  assign ww_auto_in_a_bits_size = bh_auto_out_a_bits_size; 
  assign ww_auto_in_a_bits_source = bh_auto_out_a_bits_source; 
  assign ww_auto_in_a_bits_address = bh_auto_out_a_bits_address; 
  assign ww_auto_in_a_bits_mask = bh_auto_out_a_bits_mask; 
  assign ww_auto_in_a_bits_data = bh_auto_out_a_bits_data; 
  assign ww_auto_in_a_bits_corrupt = bh_auto_out_a_bits_corrupt; 
  assign ww_auto_in_d_ready = bh_auto_out_d_ready; 
  assign ww_auto_out_a_ready = mbus_auto_coupler_from_coherence_manager_binder_in_a_ready; 
  assign ww_auto_out_d_valid = mbus_auto_coupler_from_coherence_manager_binder_in_d_valid; 
  assign ww_auto_out_d_bits_opcode = mbus_auto_coupler_from_coherence_manager_binder_in_d_bits_opcode; 
  assign ww_auto_out_d_bits_param = mbus_auto_coupler_from_coherence_manager_binder_in_d_bits_param; 
  assign ww_auto_out_d_bits_size = mbus_auto_coupler_from_coherence_manager_binder_in_d_bits_size; 
  assign ww_auto_out_d_bits_source = mbus_auto_coupler_from_coherence_manager_binder_in_d_bits_source; 
  assign ww_auto_out_d_bits_sink = mbus_auto_coupler_from_coherence_manager_binder_in_d_bits_sink; 
  assign ww_auto_out_d_bits_denied = mbus_auto_coupler_from_coherence_manager_binder_in_d_bits_denied; 
  assign ww_auto_out_d_bits_data = mbus_auto_coupler_from_coherence_manager_binder_in_d_bits_data; 
  assign ww_auto_out_d_bits_corrupt = mbus_auto_coupler_from_coherence_manager_binder_in_d_bits_corrupt; 
  assign mbus_clock = clock; 
  assign mbus_reset = reset; 
  assign mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_a_ready = mig_auto_buffer_in_a_ready; 
  assign mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_d_valid = mig_auto_buffer_in_d_valid; 
  assign mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_d_bits_opcode = mig_auto_buffer_in_d_bits_opcode; 
  assign mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_d_bits_param = mig_auto_buffer_in_d_bits_param; 
  assign mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_d_bits_size = mig_auto_buffer_in_d_bits_size; 
  assign mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_d_bits_source = mig_auto_buffer_in_d_bits_source; 
  assign mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_d_bits_sink = mig_auto_buffer_in_d_bits_sink; 
  assign mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_d_bits_denied = mig_auto_buffer_in_d_bits_denied; 
  assign mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_d_bits_data = mig_auto_buffer_in_d_bits_data; 
  assign mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_d_bits_corrupt = mig_auto_buffer_in_d_bits_corrupt; 
  assign mbus_auto_coupler_from_coherence_manager_binder_in_a_valid = ww_auto_out_a_valid; 
  assign mbus_auto_coupler_from_coherence_manager_binder_in_a_bits_opcode = ww_auto_out_a_bits_opcode; 
  assign mbus_auto_coupler_from_coherence_manager_binder_in_a_bits_param = ww_auto_out_a_bits_param; 
  assign mbus_auto_coupler_from_coherence_manager_binder_in_a_bits_size = ww_auto_out_a_bits_size; 
  assign mbus_auto_coupler_from_coherence_manager_binder_in_a_bits_source = ww_auto_out_a_bits_source; 
  assign mbus_auto_coupler_from_coherence_manager_binder_in_a_bits_address = ww_auto_out_a_bits_address; 
  assign mbus_auto_coupler_from_coherence_manager_binder_in_a_bits_mask = ww_auto_out_a_bits_mask; 
  assign mbus_auto_coupler_from_coherence_manager_binder_in_a_bits_data = ww_auto_out_a_bits_data; 
  assign mbus_auto_coupler_from_coherence_manager_binder_in_a_bits_corrupt = ww_auto_out_a_bits_corrupt; 
  assign mbus_auto_coupler_from_coherence_manager_binder_in_d_ready = ww_auto_out_d_ready; 
  assign plic_clock = clock; 
  assign plic_reset = reset; 
  assign plic_auto_int_in_0 = int_bus_auto_int_out_0; 
  assign plic_auto_int_in_1 = int_bus_auto_int_out_1; 
  assign plic_auto_int_in_2 = int_bus_auto_int_out_2; 
  assign plic_auto_int_in_3 = int_bus_auto_int_out_3; 
  assign plic_auto_int_in_4 = int_bus_auto_int_out_4; 
  assign plic_auto_int_in_5 = int_bus_auto_int_out_5; 
  assign plic_auto_int_in_6 = int_bus_auto_int_out_6; 
  assign plic_auto_in_a_valid = sbus_auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_valid; 
  assign plic_auto_in_a_bits_opcode = sbus_auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_bits_opcode; 
  assign plic_auto_in_a_bits_param = sbus_auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_bits_param; 
  assign plic_auto_in_a_bits_size = sbus_auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_bits_size; 
  assign plic_auto_in_a_bits_source = sbus_auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_bits_source; 
  assign plic_auto_in_a_bits_address = sbus_auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_bits_address; 
  assign plic_auto_in_a_bits_mask = sbus_auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_bits_mask; 
  assign plic_auto_in_a_bits_data = sbus_auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_bits_data; 
  assign plic_auto_in_a_bits_corrupt = sbus_auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_bits_corrupt; 
  assign plic_auto_in_d_ready = sbus_auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_d_ready; 
  assign clint_clock = clock; 
  assign clint_reset = reset; 
  assign clint_auto_in_a_valid = sbus_auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_valid; 
  assign clint_auto_in_a_bits_opcode = sbus_auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_bits_opcode; 
  assign clint_auto_in_a_bits_param = sbus_auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_bits_param; 
  assign clint_auto_in_a_bits_size = sbus_auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_bits_size; 
  assign clint_auto_in_a_bits_source = sbus_auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_bits_source; 
  assign clint_auto_in_a_bits_address = sbus_auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_bits_address; 
  assign clint_auto_in_a_bits_mask = sbus_auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_bits_mask; 
  assign clint_auto_in_a_bits_data = sbus_auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_bits_data; 
  assign clint_auto_in_a_bits_corrupt = sbus_auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_bits_corrupt; 
  assign clint_auto_in_d_ready = sbus_auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_d_ready; 
  assign clint_io_rtcTick = value == 6'h31; 
  assign debug_1_clock = clock; 
  assign debug_1_reset = reset; 
  assign debug_1_auto_dmInner_dmInner_tl_in_a_valid = sbus_auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_valid; 
  assign debug_1_auto_dmInner_dmInner_tl_in_a_bits_opcode = sbus_auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_bits_opcode; 
  assign debug_1_auto_dmInner_dmInner_tl_in_a_bits_param = sbus_auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_bits_param; 
  assign debug_1_auto_dmInner_dmInner_tl_in_a_bits_size = sbus_auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_bits_size; 
  assign debug_1_auto_dmInner_dmInner_tl_in_a_bits_source = sbus_auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_bits_source; 
  assign debug_1_auto_dmInner_dmInner_tl_in_a_bits_address = sbus_auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_bits_address; 
  assign debug_1_auto_dmInner_dmInner_tl_in_a_bits_mask = sbus_auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_bits_mask; 
  assign debug_1_auto_dmInner_dmInner_tl_in_a_bits_data = sbus_auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_bits_data; 
  assign debug_1_auto_dmInner_dmInner_tl_in_a_bits_corrupt = sbus_auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_bits_corrupt; 
  assign debug_1_auto_dmInner_dmInner_tl_in_d_ready = sbus_auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_d_ready; 
  assign debug_1_io_dmi_dmi_req_valid = dtm_io_dmi_req_valid; 
  assign debug_1_io_dmi_dmi_req_bits_addr = dtm_io_dmi_req_bits_addr; 
  assign debug_1_io_dmi_dmi_req_bits_data = dtm_io_dmi_req_bits_data; 
  assign debug_1_io_dmi_dmi_req_bits_op = dtm_io_dmi_req_bits_op; 
  assign debug_1_io_dmi_dmi_resp_ready = dtm_io_dmi_resp_ready; 
  assign debug_1_io_dmi_dmiClock = debug_systemjtag_jtag_TCK; 
  assign debug_1_io_dmi_dmiReset = dmiResetCatch_io_sync_reset; 

  assign tile_auto_intsink_in_sync_0 = debug_1_auto_dmOuter_intsource_out_0_sync_0; 
  assign tile_auto_int_in_xing_in_2_sync_0 = intsource_2_auto_out_sync_0; 
  assign tile_auto_int_in_xing_in_1_sync_0 = intsource_1_auto_out_sync_0; 
  assign tile_auto_int_in_xing_in_0_sync_0 = intsource_auto_out_sync_0; 
  assign tile_auto_int_in_xing_in_0_sync_1 = intsource_auto_out_sync_1; 
  assign tile_auto_tl_master_xing_out_a_ready = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_ready; 
  assign tile_auto_tl_master_xing_out_b_valid = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_b_valid; 
  assign tile_auto_tl_master_xing_out_b_bits_opcode = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_b_bits_opcode; 
  assign tile_auto_tl_master_xing_out_b_bits_param = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_b_bits_param; 
  assign tile_auto_tl_master_xing_out_b_bits_size = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_b_bits_size; 
  assign tile_auto_tl_master_xing_out_b_bits_source = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_b_bits_source; 
  assign tile_auto_tl_master_xing_out_b_bits_address = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_b_bits_address; 
  assign tile_auto_tl_master_xing_out_b_bits_mask = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_b_bits_mask; 
  assign tile_auto_tl_master_xing_out_b_bits_corrupt = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_b_bits_corrupt; 
  assign tile_auto_tl_master_xing_out_c_ready = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_c_ready; 
  assign tile_auto_tl_master_xing_out_d_valid = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_valid; 
  assign tile_auto_tl_master_xing_out_d_bits_opcode = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_bits_opcode; 
  assign tile_auto_tl_master_xing_out_d_bits_param = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_bits_param; 
  assign tile_auto_tl_master_xing_out_d_bits_size = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_bits_size; 
  assign tile_auto_tl_master_xing_out_d_bits_source = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_bits_source; 
  assign tile_auto_tl_master_xing_out_d_bits_sink = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_bits_sink; 
  assign tile_auto_tl_master_xing_out_d_bits_denied = tl_master_xing_in_d_bits_resp_control[0] ? 1'b0: sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_bits_denied; 
  assign tile_auto_tl_master_xing_out_d_bits_data = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_bits_data; 
  assign tile_auto_tl_master_xing_out_d_bits_corrupt = tl_master_xing_in_d_bits_resp_control[1] ? 1'b0: sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_bits_corrupt; 
  assign tile_auto_tl_master_xing_out_e_ready = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_0_e_ready; 
  assign tile_constants_hartid = 2'h0; 
  assign intsource_clock = clock; 
  assign intsource_reset = reset; 
  assign intsource_auto_in_0 = clint_auto_int_out_0_0; 
  assign intsource_auto_in_1 = clint_auto_int_out_0_1; 
  assign intsource_1_clock = clock; 
  assign intsource_1_reset = reset; 
  assign intsource_1_auto_in_0 = plic_auto_int_out_0_0; 
  assign intsource_2_clock = clock; 
  assign intsource_2_reset = reset; 
  assign intsource_2_auto_in_0 = plic_auto_int_out_1_0; 

  assign tile_1_auto_intsink_in_sync_0 = debug_1_auto_dmOuter_intsource_out_1_sync_0; 
  assign tile_1_auto_int_in_xing_in_2_sync_0 = intsource_5_auto_out_sync_0; 
  assign tile_1_auto_int_in_xing_in_1_sync_0 = intsource_4_auto_out_sync_0; 
  assign tile_1_auto_int_in_xing_in_0_sync_0 = intsource_3_auto_out_sync_0; 
  assign tile_1_auto_int_in_xing_in_0_sync_1 = intsource_3_auto_out_sync_1; 
  assign tile_1_auto_tl_master_xing_out_a_ready = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_ready; 
  assign tile_1_auto_tl_master_xing_out_b_valid = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_b_valid; 
  assign tile_1_auto_tl_master_xing_out_b_bits_opcode = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_b_bits_opcode; 
  assign tile_1_auto_tl_master_xing_out_b_bits_param = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_b_bits_param; 
  assign tile_1_auto_tl_master_xing_out_b_bits_size = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_b_bits_size; 
  assign tile_1_auto_tl_master_xing_out_b_bits_source = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_b_bits_source; 
  assign tile_1_auto_tl_master_xing_out_b_bits_address = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_b_bits_address; 
  assign tile_1_auto_tl_master_xing_out_b_bits_mask = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_b_bits_mask; 
  assign tile_1_auto_tl_master_xing_out_b_bits_corrupt = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_b_bits_corrupt; 
  assign tile_1_auto_tl_master_xing_out_c_ready = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_c_ready; 
  assign tile_1_auto_tl_master_xing_out_d_valid = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_valid; 
  assign tile_1_auto_tl_master_xing_out_d_bits_opcode = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_bits_opcode; 
  assign tile_1_auto_tl_master_xing_out_d_bits_param = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_bits_param; 
  assign tile_1_auto_tl_master_xing_out_d_bits_size = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_bits_size; 
  assign tile_1_auto_tl_master_xing_out_d_bits_source = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_bits_source; 
  assign tile_1_auto_tl_master_xing_out_d_bits_sink = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_bits_sink; 
  assign tile_1_auto_tl_master_xing_out_d_bits_denied = tl_master_xing_in_d_bits_resp_control[2] ? 1'b0: sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_bits_denied; 
  assign tile_1_auto_tl_master_xing_out_d_bits_data = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_bits_data; 
  assign tile_1_auto_tl_master_xing_out_d_bits_corrupt = tl_master_xing_in_d_bits_resp_control[3] ? 1'b0: sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_bits_corrupt; 
  assign tile_1_auto_tl_master_xing_out_e_ready = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_1_e_ready; 
  assign tile_1_constants_hartid = 2'h1; 
  assign intsource_3_clock = clock; 
  assign intsource_3_reset = reset; 
  assign intsource_3_auto_in_0 = clint_auto_int_out_1_0; 
  assign intsource_3_auto_in_1 = clint_auto_int_out_1_1; 
  assign intsource_4_clock = clock; 
  assign intsource_4_reset = reset; 
  assign intsource_4_auto_in_0 = plic_auto_int_out_2_0; 
  assign intsource_5_clock = clock; 
  assign intsource_5_reset = reset; 
  assign intsource_5_auto_in_0 = plic_auto_int_out_3_0; 

  assign tile_2_auto_intsink_in_sync_0 = debug_1_auto_dmOuter_intsource_out_2_sync_0; 
  assign tile_2_auto_int_in_xing_in_2_sync_0 = intsource_8_auto_out_sync_0; 
  assign tile_2_auto_int_in_xing_in_1_sync_0 = intsource_7_auto_out_sync_0; 
  assign tile_2_auto_int_in_xing_in_0_sync_0 = intsource_6_auto_out_sync_0; 
  assign tile_2_auto_int_in_xing_in_0_sync_1 = intsource_6_auto_out_sync_1; 
  assign tile_2_auto_tl_master_xing_out_a_ready = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_ready; 
  assign tile_2_auto_tl_master_xing_out_b_valid = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_b_valid; 
  assign tile_2_auto_tl_master_xing_out_b_bits_opcode = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_b_bits_opcode; 
  assign tile_2_auto_tl_master_xing_out_b_bits_param = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_b_bits_param; 
  assign tile_2_auto_tl_master_xing_out_b_bits_size = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_b_bits_size; 
  assign tile_2_auto_tl_master_xing_out_b_bits_source = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_b_bits_source; 
  assign tile_2_auto_tl_master_xing_out_b_bits_address = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_b_bits_address; 
  assign tile_2_auto_tl_master_xing_out_b_bits_mask = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_b_bits_mask; 
  assign tile_2_auto_tl_master_xing_out_b_bits_corrupt = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_b_bits_corrupt; 
  assign tile_2_auto_tl_master_xing_out_c_ready = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_c_ready; 
  assign tile_2_auto_tl_master_xing_out_d_valid = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_valid; 
  assign tile_2_auto_tl_master_xing_out_d_bits_opcode = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_bits_opcode; 
  assign tile_2_auto_tl_master_xing_out_d_bits_param = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_bits_param; 
  assign tile_2_auto_tl_master_xing_out_d_bits_size = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_bits_size; 
  assign tile_2_auto_tl_master_xing_out_d_bits_source = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_bits_source; 
  assign tile_2_auto_tl_master_xing_out_d_bits_sink = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_bits_sink; 
  assign tile_2_auto_tl_master_xing_out_d_bits_denied = tl_master_xing_in_d_bits_resp_control[4] ? 1'b0: sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_bits_denied; 
  assign tile_2_auto_tl_master_xing_out_d_bits_data = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_bits_data; 
  assign tile_2_auto_tl_master_xing_out_d_bits_corrupt = tl_master_xing_in_d_bits_resp_control[5] ? 1'b0: sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_bits_corrupt; 
  assign tile_2_auto_tl_master_xing_out_e_ready = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_2_e_ready; 
  assign tile_2_constants_hartid = 2'h2; 
  assign intsource_6_clock = clock; 
  assign intsource_6_reset = reset; 
  assign intsource_6_auto_in_0 = clint_auto_int_out_2_0; 
  assign intsource_6_auto_in_1 = clint_auto_int_out_2_1; 
  assign intsource_7_clock = clock; 
  assign intsource_7_reset = reset; 
  assign intsource_7_auto_in_0 = plic_auto_int_out_4_0; 
  assign intsource_8_clock = clock; 
  assign intsource_8_reset = reset; 
  assign intsource_8_auto_in_0 = plic_auto_int_out_5_0; 

  assign tile_3_auto_intsink_in_sync_0 = debug_1_auto_dmOuter_intsource_out_3_sync_0; 
  assign tile_3_auto_int_in_xing_in_2_sync_0 = intsource_11_auto_out_sync_0; 
  assign tile_3_auto_int_in_xing_in_1_sync_0 = intsource_10_auto_out_sync_0; 
  assign tile_3_auto_int_in_xing_in_0_sync_0 = intsource_9_auto_out_sync_0; 
  assign tile_3_auto_int_in_xing_in_0_sync_1 = intsource_9_auto_out_sync_1; 
  assign tile_3_auto_tl_master_xing_out_a_ready = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_ready; 
  assign tile_3_auto_tl_master_xing_out_b_valid = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_b_valid; 
  assign tile_3_auto_tl_master_xing_out_b_bits_opcode = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_b_bits_opcode; 
  assign tile_3_auto_tl_master_xing_out_b_bits_param = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_b_bits_param; 
  assign tile_3_auto_tl_master_xing_out_b_bits_size = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_b_bits_size; 
  assign tile_3_auto_tl_master_xing_out_b_bits_source = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_b_bits_source; 
  assign tile_3_auto_tl_master_xing_out_b_bits_address = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_b_bits_address; 
  assign tile_3_auto_tl_master_xing_out_b_bits_mask = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_b_bits_mask; 
  assign tile_3_auto_tl_master_xing_out_b_bits_corrupt = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_b_bits_corrupt; 
  assign tile_3_auto_tl_master_xing_out_c_ready = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_c_ready; 
  assign tile_3_auto_tl_master_xing_out_d_valid = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_valid; 
  assign tile_3_auto_tl_master_xing_out_d_bits_opcode = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_bits_opcode; 
  assign tile_3_auto_tl_master_xing_out_d_bits_param = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_bits_param; 
  assign tile_3_auto_tl_master_xing_out_d_bits_size = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_bits_size; 
  assign tile_3_auto_tl_master_xing_out_d_bits_source = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_bits_source; 
  assign tile_3_auto_tl_master_xing_out_d_bits_sink = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_bits_sink; 
  assign tile_3_auto_tl_master_xing_out_d_bits_denied = tl_master_xing_in_d_bits_resp_control[6] ? 1'b0: sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_bits_denied; 
  assign tile_3_auto_tl_master_xing_out_d_bits_data = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_bits_data; 
  assign tile_3_auto_tl_master_xing_out_d_bits_corrupt = tl_master_xing_in_d_bits_resp_control[7] ? 1'b0: sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_bits_corrupt; 
  assign tile_3_auto_tl_master_xing_out_e_ready = sbus_auto_coupler_from_tile_named_tile_tl_master_xing_in_3_e_ready; 
  assign tile_3_constants_hartid = 2'h3; 
  assign intsource_9_clock = clock; 
  assign intsource_9_reset = reset; 
  assign intsource_9_auto_in_0 = clint_auto_int_out_3_0; 
  assign intsource_9_auto_in_1 = clint_auto_int_out_3_1; 
  assign intsource_10_clock = clock; 
  assign intsource_10_reset = reset; 
  assign intsource_10_auto_in_0 = plic_auto_int_out_6_0; 
  assign intsource_11_clock = clock; 
  assign intsource_11_reset = reset; 
  assign intsource_11_auto_in_0 = plic_auto_int_out_7_0; 
  assign maskROM_clock = chiplink_clock; 
  assign maskROM_reset = chiplink_reset; 
  assign maskROM_auto_in_a_valid = sbus_auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_a_valid; 
  assign maskROM_auto_in_a_bits_opcode = sbus_auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_opcode; 
  assign maskROM_auto_in_a_bits_param = sbus_auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_param; 
  assign maskROM_auto_in_a_bits_size = sbus_auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_size; 
  assign maskROM_auto_in_a_bits_source = sbus_auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_source; 
  assign maskROM_auto_in_a_bits_address = sbus_auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_address; 
  assign maskROM_auto_in_a_bits_mask = sbus_auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_mask; 
  assign maskROM_auto_in_a_bits_corrupt = sbus_auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_corrupt; 
  assign maskROM_auto_in_d_ready = sbus_auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_d_ready; 
  assign asyncXing_clock = clock; 
  assign asyncXing_auto_int_in_0 = intsink_4_auto_out_0; 
  assign uart_0_clock = pbus_clock; 
  assign uart_0_reset = pbus_reset; 
  assign uart_0_auto_control_xing_in_a_valid = pbus_auto_coupler_to_slave_named_uart_0_control_xing_out_a_valid; 
  assign uart_0_auto_control_xing_in_a_bits_opcode = pbus_auto_coupler_to_slave_named_uart_0_control_xing_out_a_bits_opcode; 
  assign uart_0_auto_control_xing_in_a_bits_param = pbus_auto_coupler_to_slave_named_uart_0_control_xing_out_a_bits_param; 
  assign uart_0_auto_control_xing_in_a_bits_size = pbus_auto_coupler_to_slave_named_uart_0_control_xing_out_a_bits_size; 
  assign uart_0_auto_control_xing_in_a_bits_source = pbus_auto_coupler_to_slave_named_uart_0_control_xing_out_a_bits_source; 
  assign uart_0_auto_control_xing_in_a_bits_address = pbus_auto_coupler_to_slave_named_uart_0_control_xing_out_a_bits_address; 
  assign uart_0_auto_control_xing_in_a_bits_mask = pbus_auto_coupler_to_slave_named_uart_0_control_xing_out_a_bits_mask; 
  assign uart_0_auto_control_xing_in_a_bits_data = pbus_auto_coupler_to_slave_named_uart_0_control_xing_out_a_bits_data; 
  assign uart_0_auto_control_xing_in_a_bits_corrupt = pbus_auto_coupler_to_slave_named_uart_0_control_xing_out_a_bits_corrupt; 
  assign uart_0_auto_control_xing_in_d_ready = pbus_auto_coupler_to_slave_named_uart_0_control_xing_out_d_ready; 
  assign uart_0_auto_io_out_rxd = _T_2371; 
  assign intsink_4_auto_in_sync_0 = uart_0_auto_int_xing_out_sync_0; 
  assign asyncXing_1_clock = clock; 
  assign asyncXing_1_auto_int_in_0 = intsink_5_auto_out_0; 
  assign spi_0_clock = pbus_clock; 
  assign spi_0_reset = pbus_reset; 
  assign spi_0_auto_control_xing_in_a_valid = pbus_auto_coupler_to_device_named_spi_0_control_xing_out_a_valid; 
  assign spi_0_auto_control_xing_in_a_bits_opcode = pbus_auto_coupler_to_device_named_spi_0_control_xing_out_a_bits_opcode; 
  assign spi_0_auto_control_xing_in_a_bits_param = pbus_auto_coupler_to_device_named_spi_0_control_xing_out_a_bits_param; 
  assign spi_0_auto_control_xing_in_a_bits_size = pbus_auto_coupler_to_device_named_spi_0_control_xing_out_a_bits_size; 
  assign spi_0_auto_control_xing_in_a_bits_source = pbus_auto_coupler_to_device_named_spi_0_control_xing_out_a_bits_source; 
  assign spi_0_auto_control_xing_in_a_bits_address = pbus_auto_coupler_to_device_named_spi_0_control_xing_out_a_bits_address; 
  assign spi_0_auto_control_xing_in_a_bits_mask = pbus_auto_coupler_to_device_named_spi_0_control_xing_out_a_bits_mask; 
  assign spi_0_auto_control_xing_in_a_bits_data = pbus_auto_coupler_to_device_named_spi_0_control_xing_out_a_bits_data; 
  assign spi_0_auto_control_xing_in_a_bits_corrupt = pbus_auto_coupler_to_device_named_spi_0_control_xing_out_a_bits_corrupt; 
  assign spi_0_auto_control_xing_in_d_ready = pbus_auto_coupler_to_device_named_spi_0_control_xing_out_d_ready; 
  assign spi_0_auto_io_out_dq_1_i = _T_2379; 
  assign intsink_5_auto_in_sync_0 = spi_0_auto_int_xing_out_sync_0; 
  assign mig_clock = clock; 
  assign mig_reset = reset; 
  assign mig_auto_buffer_in_a_valid = mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_a_valid; 
  assign mig_auto_buffer_in_a_bits_opcode = mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_a_bits_opcode; 
  assign mig_auto_buffer_in_a_bits_param = mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_a_bits_param; 
  assign mig_auto_buffer_in_a_bits_size = mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_a_bits_size; 
  assign mig_auto_buffer_in_a_bits_source = mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_a_bits_source; 

  assign mig_auto_buffer_in_a_bits_address = mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_a_bits_address[31:0] - {mig_slave_base_addr_msb_4[3:0], 28'b0};
  assign mig_auto_buffer_in_a_bits_mask = mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_a_bits_mask; 
  assign mig_auto_buffer_in_a_bits_data = mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_a_bits_data; 
  assign mig_auto_buffer_in_a_bits_corrupt = mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_a_bits_corrupt; 
  assign mig_auto_buffer_in_d_ready = mbus_auto_coupler_to_memory_controller_named_xilinxvc707mig_xilinxvc707mig_out_d_ready; 
  assign mig_io_port_sys_clk_i = auto_io_out_0_port_sys_clk_i; 
  assign mig_io_port_aresetn = auto_io_out_0_port_aresetn; 
  assign mig_io_port_sys_rst = auto_io_out_0_port_sys_rst; 
  assign pcie_auto_tl_out_xing_out_a_ridx = asink_auto_in_a_ridx; 
  assign pcie_auto_tl_out_xing_out_a_safe_ridx_valid = asink_auto_in_a_safe_ridx_valid; 
  assign pcie_auto_tl_out_xing_out_a_safe_sink_reset_n = asink_auto_in_a_safe_sink_reset_n; 
  assign pcie_auto_tl_out_xing_out_d_mem_0_opcode = asink_auto_in_d_mem_0_opcode; 
  assign pcie_auto_tl_out_xing_out_d_mem_0_param = asink_auto_in_d_mem_0_param; 
  assign pcie_auto_tl_out_xing_out_d_mem_0_size = asink_auto_in_d_mem_0_size; 
  assign pcie_auto_tl_out_xing_out_d_mem_0_source = asink_auto_in_d_mem_0_source; 
  assign pcie_auto_tl_out_xing_out_d_mem_0_sink = asink_auto_in_d_mem_0_sink; 
  assign pcie_auto_tl_out_xing_out_d_mem_0_denied = asink_auto_in_d_mem_0_denied; 
  assign pcie_auto_tl_out_xing_out_d_mem_0_data = asink_auto_in_d_mem_0_data; 
  assign pcie_auto_tl_out_xing_out_d_mem_0_corrupt = asink_auto_in_d_mem_0_corrupt; 
  assign pcie_auto_tl_out_xing_out_d_mem_1_opcode = asink_auto_in_d_mem_1_opcode; 
  assign pcie_auto_tl_out_xing_out_d_mem_1_param = asink_auto_in_d_mem_1_param; 
  assign pcie_auto_tl_out_xing_out_d_mem_1_size = asink_auto_in_d_mem_1_size; 
  assign pcie_auto_tl_out_xing_out_d_mem_1_source = asink_auto_in_d_mem_1_source; 
  assign pcie_auto_tl_out_xing_out_d_mem_1_sink = asink_auto_in_d_mem_1_sink; 
  assign pcie_auto_tl_out_xing_out_d_mem_1_denied = asink_auto_in_d_mem_1_denied; 
  assign pcie_auto_tl_out_xing_out_d_mem_1_data = asink_auto_in_d_mem_1_data; 
  assign pcie_auto_tl_out_xing_out_d_mem_1_corrupt = asink_auto_in_d_mem_1_corrupt; 
  assign pcie_auto_tl_out_xing_out_d_mem_2_opcode = asink_auto_in_d_mem_2_opcode; 
  assign pcie_auto_tl_out_xing_out_d_mem_2_param = asink_auto_in_d_mem_2_param; 
  assign pcie_auto_tl_out_xing_out_d_mem_2_size = asink_auto_in_d_mem_2_size; 
  assign pcie_auto_tl_out_xing_out_d_mem_2_source = asink_auto_in_d_mem_2_source; 
  assign pcie_auto_tl_out_xing_out_d_mem_2_sink = asink_auto_in_d_mem_2_sink; 
  assign pcie_auto_tl_out_xing_out_d_mem_2_denied = asink_auto_in_d_mem_2_denied; 
  assign pcie_auto_tl_out_xing_out_d_mem_2_data = asink_auto_in_d_mem_2_data; 
  assign pcie_auto_tl_out_xing_out_d_mem_2_corrupt = asink_auto_in_d_mem_2_corrupt; 
  assign pcie_auto_tl_out_xing_out_d_mem_3_opcode = asink_auto_in_d_mem_3_opcode; 
  assign pcie_auto_tl_out_xing_out_d_mem_3_param = asink_auto_in_d_mem_3_param; 
  assign pcie_auto_tl_out_xing_out_d_mem_3_size = asink_auto_in_d_mem_3_size; 
  assign pcie_auto_tl_out_xing_out_d_mem_3_source = asink_auto_in_d_mem_3_source; 
  assign pcie_auto_tl_out_xing_out_d_mem_3_sink = asink_auto_in_d_mem_3_sink; 
  assign pcie_auto_tl_out_xing_out_d_mem_3_denied = asink_auto_in_d_mem_3_denied; 
  assign pcie_auto_tl_out_xing_out_d_mem_3_data = asink_auto_in_d_mem_3_data; 
  assign pcie_auto_tl_out_xing_out_d_mem_3_corrupt = asink_auto_in_d_mem_3_corrupt; 
  assign pcie_auto_tl_out_xing_out_d_mem_4_opcode = asink_auto_in_d_mem_4_opcode; 
  assign pcie_auto_tl_out_xing_out_d_mem_4_param = asink_auto_in_d_mem_4_param; 
  assign pcie_auto_tl_out_xing_out_d_mem_4_size = asink_auto_in_d_mem_4_size; 
  assign pcie_auto_tl_out_xing_out_d_mem_4_source = asink_auto_in_d_mem_4_source; 
  assign pcie_auto_tl_out_xing_out_d_mem_4_sink = asink_auto_in_d_mem_4_sink; 
  assign pcie_auto_tl_out_xing_out_d_mem_4_denied = asink_auto_in_d_mem_4_denied; 
  assign pcie_auto_tl_out_xing_out_d_mem_4_data = asink_auto_in_d_mem_4_data; 
  assign pcie_auto_tl_out_xing_out_d_mem_4_corrupt = asink_auto_in_d_mem_4_corrupt; 
  assign pcie_auto_tl_out_xing_out_d_mem_5_opcode = asink_auto_in_d_mem_5_opcode; 
  assign pcie_auto_tl_out_xing_out_d_mem_5_param = asink_auto_in_d_mem_5_param; 
  assign pcie_auto_tl_out_xing_out_d_mem_5_size = asink_auto_in_d_mem_5_size; 
  assign pcie_auto_tl_out_xing_out_d_mem_5_source = asink_auto_in_d_mem_5_source; 
  assign pcie_auto_tl_out_xing_out_d_mem_5_sink = asink_auto_in_d_mem_5_sink; 
  assign pcie_auto_tl_out_xing_out_d_mem_5_denied = asink_auto_in_d_mem_5_denied; 
  assign pcie_auto_tl_out_xing_out_d_mem_5_data = asink_auto_in_d_mem_5_data; 
  assign pcie_auto_tl_out_xing_out_d_mem_5_corrupt = asink_auto_in_d_mem_5_corrupt; 
  assign pcie_auto_tl_out_xing_out_d_mem_6_opcode = asink_auto_in_d_mem_6_opcode; 
  assign pcie_auto_tl_out_xing_out_d_mem_6_param = asink_auto_in_d_mem_6_param; 
  assign pcie_auto_tl_out_xing_out_d_mem_6_size = asink_auto_in_d_mem_6_size; 
  assign pcie_auto_tl_out_xing_out_d_mem_6_source = asink_auto_in_d_mem_6_source; 
  assign pcie_auto_tl_out_xing_out_d_mem_6_sink = asink_auto_in_d_mem_6_sink; 
  assign pcie_auto_tl_out_xing_out_d_mem_6_denied = asink_auto_in_d_mem_6_denied; 
  assign pcie_auto_tl_out_xing_out_d_mem_6_data = asink_auto_in_d_mem_6_data; 
  assign pcie_auto_tl_out_xing_out_d_mem_6_corrupt = asink_auto_in_d_mem_6_corrupt; 
  assign pcie_auto_tl_out_xing_out_d_mem_7_opcode = asink_auto_in_d_mem_7_opcode; 
  assign pcie_auto_tl_out_xing_out_d_mem_7_param = asink_auto_in_d_mem_7_param; 
  assign pcie_auto_tl_out_xing_out_d_mem_7_size = asink_auto_in_d_mem_7_size; 
  assign pcie_auto_tl_out_xing_out_d_mem_7_source = asink_auto_in_d_mem_7_source; 
  assign pcie_auto_tl_out_xing_out_d_mem_7_sink = asink_auto_in_d_mem_7_sink; 
  assign pcie_auto_tl_out_xing_out_d_mem_7_denied = asink_auto_in_d_mem_7_denied; 
  assign pcie_auto_tl_out_xing_out_d_mem_7_data = asink_auto_in_d_mem_7_data; 
  assign pcie_auto_tl_out_xing_out_d_mem_7_corrupt = asink_auto_in_d_mem_7_corrupt; 
  assign pcie_auto_tl_out_xing_out_d_widx = asink_auto_in_d_widx; 
  assign pcie_auto_tl_out_xing_out_d_safe_widx_valid = asink_auto_in_d_safe_widx_valid; 
  assign pcie_auto_tl_out_xing_out_d_safe_source_reset_n = asink_auto_in_d_safe_source_reset_n; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_0_opcode = asource_1_auto_out_a_mem_0_opcode; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_0_param = asource_1_auto_out_a_mem_0_param; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_0_size = asource_1_auto_out_a_mem_0_size; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_0_source = asource_1_auto_out_a_mem_0_source; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_0_address = asource_1_auto_out_a_mem_0_address; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_0_mask = asource_1_auto_out_a_mem_0_mask; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_0_data = asource_1_auto_out_a_mem_0_data; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_0_corrupt = asource_1_auto_out_a_mem_0_corrupt; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_1_opcode = asource_1_auto_out_a_mem_1_opcode; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_1_param = asource_1_auto_out_a_mem_1_param; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_1_size = asource_1_auto_out_a_mem_1_size; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_1_source = asource_1_auto_out_a_mem_1_source; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_1_address = asource_1_auto_out_a_mem_1_address; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_1_mask = asource_1_auto_out_a_mem_1_mask; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_1_data = asource_1_auto_out_a_mem_1_data; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_1_corrupt = asource_1_auto_out_a_mem_1_corrupt; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_2_opcode = asource_1_auto_out_a_mem_2_opcode; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_2_param = asource_1_auto_out_a_mem_2_param; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_2_size = asource_1_auto_out_a_mem_2_size; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_2_source = asource_1_auto_out_a_mem_2_source; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_2_address = asource_1_auto_out_a_mem_2_address; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_2_mask = asource_1_auto_out_a_mem_2_mask; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_2_data = asource_1_auto_out_a_mem_2_data; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_2_corrupt = asource_1_auto_out_a_mem_2_corrupt; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_3_opcode = asource_1_auto_out_a_mem_3_opcode; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_3_param = asource_1_auto_out_a_mem_3_param; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_3_size = asource_1_auto_out_a_mem_3_size; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_3_source = asource_1_auto_out_a_mem_3_source; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_3_address = asource_1_auto_out_a_mem_3_address; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_3_mask = asource_1_auto_out_a_mem_3_mask; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_3_data = asource_1_auto_out_a_mem_3_data; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_3_corrupt = asource_1_auto_out_a_mem_3_corrupt; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_4_opcode = asource_1_auto_out_a_mem_4_opcode; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_4_param = asource_1_auto_out_a_mem_4_param; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_4_size = asource_1_auto_out_a_mem_4_size; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_4_source = asource_1_auto_out_a_mem_4_source; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_4_address = asource_1_auto_out_a_mem_4_address; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_4_mask = asource_1_auto_out_a_mem_4_mask; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_4_data = asource_1_auto_out_a_mem_4_data; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_4_corrupt = asource_1_auto_out_a_mem_4_corrupt; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_5_opcode = asource_1_auto_out_a_mem_5_opcode; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_5_param = asource_1_auto_out_a_mem_5_param; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_5_size = asource_1_auto_out_a_mem_5_size; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_5_source = asource_1_auto_out_a_mem_5_source; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_5_address = asource_1_auto_out_a_mem_5_address; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_5_mask = asource_1_auto_out_a_mem_5_mask; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_5_data = asource_1_auto_out_a_mem_5_data; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_5_corrupt = asource_1_auto_out_a_mem_5_corrupt; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_6_opcode = asource_1_auto_out_a_mem_6_opcode; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_6_param = asource_1_auto_out_a_mem_6_param; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_6_size = asource_1_auto_out_a_mem_6_size; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_6_source = asource_1_auto_out_a_mem_6_source; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_6_address = asource_1_auto_out_a_mem_6_address; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_6_mask = asource_1_auto_out_a_mem_6_mask; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_6_data = asource_1_auto_out_a_mem_6_data; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_6_corrupt = asource_1_auto_out_a_mem_6_corrupt; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_7_opcode = asource_1_auto_out_a_mem_7_opcode; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_7_param = asource_1_auto_out_a_mem_7_param; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_7_size = asource_1_auto_out_a_mem_7_size; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_7_source = asource_1_auto_out_a_mem_7_source; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_7_address = asource_1_auto_out_a_mem_7_address; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_7_mask = asource_1_auto_out_a_mem_7_mask; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_7_data = asource_1_auto_out_a_mem_7_data; 
  assign pcie_auto_tl_in_xing_in_1_a_mem_7_corrupt = asource_1_auto_out_a_mem_7_corrupt; 
  assign pcie_auto_tl_in_xing_in_1_a_widx = asource_1_auto_out_a_widx; 
  assign pcie_auto_tl_in_xing_in_1_a_safe_widx_valid = asource_1_auto_out_a_safe_widx_valid; 
  assign pcie_auto_tl_in_xing_in_1_a_safe_source_reset_n = asource_1_auto_out_a_safe_source_reset_n; 
  assign pcie_auto_tl_in_xing_in_1_d_ridx = asource_1_auto_out_d_ridx; 
  assign pcie_auto_tl_in_xing_in_1_d_safe_ridx_valid = asource_1_auto_out_d_safe_ridx_valid; 
  assign pcie_auto_tl_in_xing_in_1_d_safe_sink_reset_n = asource_1_auto_out_d_safe_sink_reset_n; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_0_opcode = asource_auto_out_a_mem_0_opcode; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_0_param = asource_auto_out_a_mem_0_param; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_0_size = asource_auto_out_a_mem_0_size; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_0_source = asource_auto_out_a_mem_0_source; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_0_address = asource_auto_out_a_mem_0_address; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_0_mask = asource_auto_out_a_mem_0_mask; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_0_data = asource_auto_out_a_mem_0_data; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_0_corrupt = asource_auto_out_a_mem_0_corrupt; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_1_opcode = asource_auto_out_a_mem_1_opcode; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_1_param = asource_auto_out_a_mem_1_param; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_1_size = asource_auto_out_a_mem_1_size; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_1_source = asource_auto_out_a_mem_1_source; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_1_address = asource_auto_out_a_mem_1_address; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_1_mask = asource_auto_out_a_mem_1_mask; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_1_data = asource_auto_out_a_mem_1_data; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_1_corrupt = asource_auto_out_a_mem_1_corrupt; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_2_opcode = asource_auto_out_a_mem_2_opcode; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_2_param = asource_auto_out_a_mem_2_param; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_2_size = asource_auto_out_a_mem_2_size; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_2_source = asource_auto_out_a_mem_2_source; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_2_address = asource_auto_out_a_mem_2_address; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_2_mask = asource_auto_out_a_mem_2_mask; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_2_data = asource_auto_out_a_mem_2_data; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_2_corrupt = asource_auto_out_a_mem_2_corrupt; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_3_opcode = asource_auto_out_a_mem_3_opcode; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_3_param = asource_auto_out_a_mem_3_param; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_3_size = asource_auto_out_a_mem_3_size; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_3_source = asource_auto_out_a_mem_3_source; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_3_address = asource_auto_out_a_mem_3_address; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_3_mask = asource_auto_out_a_mem_3_mask; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_3_data = asource_auto_out_a_mem_3_data; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_3_corrupt = asource_auto_out_a_mem_3_corrupt; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_4_opcode = asource_auto_out_a_mem_4_opcode; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_4_param = asource_auto_out_a_mem_4_param; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_4_size = asource_auto_out_a_mem_4_size; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_4_source = asource_auto_out_a_mem_4_source; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_4_address = asource_auto_out_a_mem_4_address; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_4_mask = asource_auto_out_a_mem_4_mask; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_4_data = asource_auto_out_a_mem_4_data; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_4_corrupt = asource_auto_out_a_mem_4_corrupt; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_5_opcode = asource_auto_out_a_mem_5_opcode; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_5_param = asource_auto_out_a_mem_5_param; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_5_size = asource_auto_out_a_mem_5_size; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_5_source = asource_auto_out_a_mem_5_source; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_5_address = asource_auto_out_a_mem_5_address; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_5_mask = asource_auto_out_a_mem_5_mask; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_5_data = asource_auto_out_a_mem_5_data; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_5_corrupt = asource_auto_out_a_mem_5_corrupt; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_6_opcode = asource_auto_out_a_mem_6_opcode; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_6_param = asource_auto_out_a_mem_6_param; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_6_size = asource_auto_out_a_mem_6_size; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_6_source = asource_auto_out_a_mem_6_source; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_6_address = asource_auto_out_a_mem_6_address; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_6_mask = asource_auto_out_a_mem_6_mask; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_6_data = asource_auto_out_a_mem_6_data; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_6_corrupt = asource_auto_out_a_mem_6_corrupt; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_7_opcode = asource_auto_out_a_mem_7_opcode; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_7_param = asource_auto_out_a_mem_7_param; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_7_size = asource_auto_out_a_mem_7_size; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_7_source = asource_auto_out_a_mem_7_source; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_7_address = asource_auto_out_a_mem_7_address; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_7_mask = asource_auto_out_a_mem_7_mask; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_7_data = asource_auto_out_a_mem_7_data; 
  assign pcie_auto_tl_in_xing_in_0_a_mem_7_corrupt = asource_auto_out_a_mem_7_corrupt; 
  assign pcie_auto_tl_in_xing_in_0_a_widx = asource_auto_out_a_widx; 
  assign pcie_auto_tl_in_xing_in_0_a_safe_widx_valid = asource_auto_out_a_safe_widx_valid; 
  assign pcie_auto_tl_in_xing_in_0_a_safe_source_reset_n = asource_auto_out_a_safe_source_reset_n; 
  assign pcie_auto_tl_in_xing_in_0_d_ridx = asource_auto_out_d_ridx; 
  assign pcie_auto_tl_in_xing_in_0_d_safe_ridx_valid = asource_auto_out_d_safe_ridx_valid; 
  assign pcie_auto_tl_in_xing_in_0_d_safe_sink_reset_n = asource_auto_out_d_safe_sink_reset_n; 
  assign pcie_io_port_REFCLK_rxp = auto_io_out_1_port_REFCLK_rxp; 
  assign pcie_io_port_REFCLK_rxn = auto_io_out_1_port_REFCLK_rxn; 
  assign pcie_io_port_pci_exp_rxp = auto_io_out_1_port_pci_exp_rxp; 
  assign pcie_io_port_pci_exp_rxn = auto_io_out_1_port_pci_exp_rxn; 
  assign pcie_io_port_axi_aresetn = auto_io_out_1_port_axi_aresetn; 
  assign asource_clock = clock; 
  assign asource_reset = reset; 
  assign asource_auto_in_a_valid = sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_a_valid; 
  assign asource_auto_in_a_bits_opcode = sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_a_bits_opcode; 
  assign asource_auto_in_a_bits_param = sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_a_bits_param; 
  assign asource_auto_in_a_bits_size = sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_a_bits_size; 
  assign asource_auto_in_a_bits_source = sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_a_bits_source; 
  assign asource_auto_in_a_bits_address = sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_a_bits_address; 
  assign asource_auto_in_a_bits_mask = sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_a_bits_mask; 
  assign asource_auto_in_a_bits_data = sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_a_bits_data; 
  assign asource_auto_in_a_bits_corrupt = sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_a_bits_corrupt; 
  assign asource_auto_in_d_ready = sbus_auto_coupler_to_slave_named_pcie_0_widget_out_0_d_ready; 
  assign asource_auto_out_a_ridx = pcie_auto_tl_in_xing_in_0_a_ridx; 
  assign asource_auto_out_a_safe_ridx_valid = pcie_auto_tl_in_xing_in_0_a_safe_ridx_valid; 
  assign asource_auto_out_a_safe_sink_reset_n = pcie_auto_tl_in_xing_in_0_a_safe_sink_reset_n; 
  assign asource_auto_out_d_mem_0_opcode = pcie_auto_tl_in_xing_in_0_d_mem_0_opcode; 
  assign asource_auto_out_d_mem_0_param = pcie_auto_tl_in_xing_in_0_d_mem_0_param; 
  assign asource_auto_out_d_mem_0_size = pcie_auto_tl_in_xing_in_0_d_mem_0_size; 
  assign asource_auto_out_d_mem_0_source = pcie_auto_tl_in_xing_in_0_d_mem_0_source; 
  assign asource_auto_out_d_mem_0_sink = pcie_auto_tl_in_xing_in_0_d_mem_0_sink; 
  assign asource_auto_out_d_mem_0_denied = pcie_auto_tl_in_xing_in_0_d_mem_0_denied; 
  assign asource_auto_out_d_mem_0_data = pcie_auto_tl_in_xing_in_0_d_mem_0_data; 
  assign asource_auto_out_d_mem_0_corrupt = pcie_auto_tl_in_xing_in_0_d_mem_0_corrupt; 
  assign asource_auto_out_d_mem_1_opcode = pcie_auto_tl_in_xing_in_0_d_mem_1_opcode; 
  assign asource_auto_out_d_mem_1_param = pcie_auto_tl_in_xing_in_0_d_mem_1_param; 
  assign asource_auto_out_d_mem_1_size = pcie_auto_tl_in_xing_in_0_d_mem_1_size; 
  assign asource_auto_out_d_mem_1_source = pcie_auto_tl_in_xing_in_0_d_mem_1_source; 
  assign asource_auto_out_d_mem_1_sink = pcie_auto_tl_in_xing_in_0_d_mem_1_sink; 
  assign asource_auto_out_d_mem_1_denied = pcie_auto_tl_in_xing_in_0_d_mem_1_denied; 
  assign asource_auto_out_d_mem_1_data = pcie_auto_tl_in_xing_in_0_d_mem_1_data; 
  assign asource_auto_out_d_mem_1_corrupt = pcie_auto_tl_in_xing_in_0_d_mem_1_corrupt; 
  assign asource_auto_out_d_mem_2_opcode = pcie_auto_tl_in_xing_in_0_d_mem_2_opcode; 
  assign asource_auto_out_d_mem_2_param = pcie_auto_tl_in_xing_in_0_d_mem_2_param; 
  assign asource_auto_out_d_mem_2_size = pcie_auto_tl_in_xing_in_0_d_mem_2_size; 
  assign asource_auto_out_d_mem_2_source = pcie_auto_tl_in_xing_in_0_d_mem_2_source; 
  assign asource_auto_out_d_mem_2_sink = pcie_auto_tl_in_xing_in_0_d_mem_2_sink; 
  assign asource_auto_out_d_mem_2_denied = pcie_auto_tl_in_xing_in_0_d_mem_2_denied; 
  assign asource_auto_out_d_mem_2_data = pcie_auto_tl_in_xing_in_0_d_mem_2_data; 
  assign asource_auto_out_d_mem_2_corrupt = pcie_auto_tl_in_xing_in_0_d_mem_2_corrupt; 
  assign asource_auto_out_d_mem_3_opcode = pcie_auto_tl_in_xing_in_0_d_mem_3_opcode; 
  assign asource_auto_out_d_mem_3_param = pcie_auto_tl_in_xing_in_0_d_mem_3_param; 
  assign asource_auto_out_d_mem_3_size = pcie_auto_tl_in_xing_in_0_d_mem_3_size; 
  assign asource_auto_out_d_mem_3_source = pcie_auto_tl_in_xing_in_0_d_mem_3_source; 
  assign asource_auto_out_d_mem_3_sink = pcie_auto_tl_in_xing_in_0_d_mem_3_sink; 
  assign asource_auto_out_d_mem_3_denied = pcie_auto_tl_in_xing_in_0_d_mem_3_denied; 
  assign asource_auto_out_d_mem_3_data = pcie_auto_tl_in_xing_in_0_d_mem_3_data; 
  assign asource_auto_out_d_mem_3_corrupt = pcie_auto_tl_in_xing_in_0_d_mem_3_corrupt; 
  assign asource_auto_out_d_mem_4_opcode = pcie_auto_tl_in_xing_in_0_d_mem_4_opcode; 
  assign asource_auto_out_d_mem_4_param = pcie_auto_tl_in_xing_in_0_d_mem_4_param; 
  assign asource_auto_out_d_mem_4_size = pcie_auto_tl_in_xing_in_0_d_mem_4_size; 
  assign asource_auto_out_d_mem_4_source = pcie_auto_tl_in_xing_in_0_d_mem_4_source; 
  assign asource_auto_out_d_mem_4_sink = pcie_auto_tl_in_xing_in_0_d_mem_4_sink; 
  assign asource_auto_out_d_mem_4_denied = pcie_auto_tl_in_xing_in_0_d_mem_4_denied; 
  assign asource_auto_out_d_mem_4_data = pcie_auto_tl_in_xing_in_0_d_mem_4_data; 
  assign asource_auto_out_d_mem_4_corrupt = pcie_auto_tl_in_xing_in_0_d_mem_4_corrupt; 
  assign asource_auto_out_d_mem_5_opcode = pcie_auto_tl_in_xing_in_0_d_mem_5_opcode; 
  assign asource_auto_out_d_mem_5_param = pcie_auto_tl_in_xing_in_0_d_mem_5_param; 
  assign asource_auto_out_d_mem_5_size = pcie_auto_tl_in_xing_in_0_d_mem_5_size; 
  assign asource_auto_out_d_mem_5_source = pcie_auto_tl_in_xing_in_0_d_mem_5_source; 
  assign asource_auto_out_d_mem_5_sink = pcie_auto_tl_in_xing_in_0_d_mem_5_sink; 
  assign asource_auto_out_d_mem_5_denied = pcie_auto_tl_in_xing_in_0_d_mem_5_denied; 
  assign asource_auto_out_d_mem_5_data = pcie_auto_tl_in_xing_in_0_d_mem_5_data; 
  assign asource_auto_out_d_mem_5_corrupt = pcie_auto_tl_in_xing_in_0_d_mem_5_corrupt; 
  assign asource_auto_out_d_mem_6_opcode = pcie_auto_tl_in_xing_in_0_d_mem_6_opcode; 
  assign asource_auto_out_d_mem_6_param = pcie_auto_tl_in_xing_in_0_d_mem_6_param; 
  assign asource_auto_out_d_mem_6_size = pcie_auto_tl_in_xing_in_0_d_mem_6_size; 
  assign asource_auto_out_d_mem_6_source = pcie_auto_tl_in_xing_in_0_d_mem_6_source; 
  assign asource_auto_out_d_mem_6_sink = pcie_auto_tl_in_xing_in_0_d_mem_6_sink; 
  assign asource_auto_out_d_mem_6_denied = pcie_auto_tl_in_xing_in_0_d_mem_6_denied; 
  assign asource_auto_out_d_mem_6_data = pcie_auto_tl_in_xing_in_0_d_mem_6_data; 
  assign asource_auto_out_d_mem_6_corrupt = pcie_auto_tl_in_xing_in_0_d_mem_6_corrupt; 
  assign asource_auto_out_d_mem_7_opcode = pcie_auto_tl_in_xing_in_0_d_mem_7_opcode; 
  assign asource_auto_out_d_mem_7_param = pcie_auto_tl_in_xing_in_0_d_mem_7_param; 
  assign asource_auto_out_d_mem_7_size = pcie_auto_tl_in_xing_in_0_d_mem_7_size; 
  assign asource_auto_out_d_mem_7_source = pcie_auto_tl_in_xing_in_0_d_mem_7_source; 
  assign asource_auto_out_d_mem_7_sink = pcie_auto_tl_in_xing_in_0_d_mem_7_sink; 
  assign asource_auto_out_d_mem_7_denied = pcie_auto_tl_in_xing_in_0_d_mem_7_denied; 
  assign asource_auto_out_d_mem_7_data = pcie_auto_tl_in_xing_in_0_d_mem_7_data; 
  assign asource_auto_out_d_mem_7_corrupt = pcie_auto_tl_in_xing_in_0_d_mem_7_corrupt; 
  assign asource_auto_out_d_widx = pcie_auto_tl_in_xing_in_0_d_widx; 
  assign asource_auto_out_d_safe_widx_valid = pcie_auto_tl_in_xing_in_0_d_safe_widx_valid; 
  assign asource_auto_out_d_safe_source_reset_n = pcie_auto_tl_in_xing_in_0_d_safe_source_reset_n; 
  assign asource_1_clock = clock; 
  assign asource_1_reset = reset; 
  assign asource_1_auto_in_a_valid = sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_a_valid; 
  assign asource_1_auto_in_a_bits_opcode = sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_a_bits_opcode; 
  assign asource_1_auto_in_a_bits_param = sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_a_bits_param; 
  assign asource_1_auto_in_a_bits_size = sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_a_bits_size; 
  assign asource_1_auto_in_a_bits_source = sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_a_bits_source; 
  assign asource_1_auto_in_a_bits_address = sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_a_bits_address; 
  assign asource_1_auto_in_a_bits_mask = sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_a_bits_mask; 
  assign asource_1_auto_in_a_bits_data = sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_a_bits_data; 
  assign asource_1_auto_in_a_bits_corrupt = sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_a_bits_corrupt; 
  assign asource_1_auto_in_d_ready = sbus_auto_coupler_to_slave_named_pcie_0_widget_out_1_d_ready; 
  assign asource_1_auto_out_a_ridx = pcie_auto_tl_in_xing_in_1_a_ridx; 
  assign asource_1_auto_out_a_safe_ridx_valid = pcie_auto_tl_in_xing_in_1_a_safe_ridx_valid; 
  assign asource_1_auto_out_a_safe_sink_reset_n = pcie_auto_tl_in_xing_in_1_a_safe_sink_reset_n; 
  assign asource_1_auto_out_d_mem_0_opcode = pcie_auto_tl_in_xing_in_1_d_mem_0_opcode; 
  assign asource_1_auto_out_d_mem_0_param = pcie_auto_tl_in_xing_in_1_d_mem_0_param; 
  assign asource_1_auto_out_d_mem_0_size = pcie_auto_tl_in_xing_in_1_d_mem_0_size; 
  assign asource_1_auto_out_d_mem_0_source = pcie_auto_tl_in_xing_in_1_d_mem_0_source; 
  assign asource_1_auto_out_d_mem_0_sink = pcie_auto_tl_in_xing_in_1_d_mem_0_sink; 
  assign asource_1_auto_out_d_mem_0_denied = pcie_auto_tl_in_xing_in_1_d_mem_0_denied; 
  assign asource_1_auto_out_d_mem_0_data = pcie_auto_tl_in_xing_in_1_d_mem_0_data; 
  assign asource_1_auto_out_d_mem_0_corrupt = pcie_auto_tl_in_xing_in_1_d_mem_0_corrupt; 
  assign asource_1_auto_out_d_mem_1_opcode = pcie_auto_tl_in_xing_in_1_d_mem_1_opcode; 
  assign asource_1_auto_out_d_mem_1_param = pcie_auto_tl_in_xing_in_1_d_mem_1_param; 
  assign asource_1_auto_out_d_mem_1_size = pcie_auto_tl_in_xing_in_1_d_mem_1_size; 
  assign asource_1_auto_out_d_mem_1_source = pcie_auto_tl_in_xing_in_1_d_mem_1_source; 
  assign asource_1_auto_out_d_mem_1_sink = pcie_auto_tl_in_xing_in_1_d_mem_1_sink; 
  assign asource_1_auto_out_d_mem_1_denied = pcie_auto_tl_in_xing_in_1_d_mem_1_denied; 
  assign asource_1_auto_out_d_mem_1_data = pcie_auto_tl_in_xing_in_1_d_mem_1_data; 
  assign asource_1_auto_out_d_mem_1_corrupt = pcie_auto_tl_in_xing_in_1_d_mem_1_corrupt; 
  assign asource_1_auto_out_d_mem_2_opcode = pcie_auto_tl_in_xing_in_1_d_mem_2_opcode; 
  assign asource_1_auto_out_d_mem_2_param = pcie_auto_tl_in_xing_in_1_d_mem_2_param; 
  assign asource_1_auto_out_d_mem_2_size = pcie_auto_tl_in_xing_in_1_d_mem_2_size; 
  assign asource_1_auto_out_d_mem_2_source = pcie_auto_tl_in_xing_in_1_d_mem_2_source; 
  assign asource_1_auto_out_d_mem_2_sink = pcie_auto_tl_in_xing_in_1_d_mem_2_sink; 
  assign asource_1_auto_out_d_mem_2_denied = pcie_auto_tl_in_xing_in_1_d_mem_2_denied; 
  assign asource_1_auto_out_d_mem_2_data = pcie_auto_tl_in_xing_in_1_d_mem_2_data; 
  assign asource_1_auto_out_d_mem_2_corrupt = pcie_auto_tl_in_xing_in_1_d_mem_2_corrupt; 
  assign asource_1_auto_out_d_mem_3_opcode = pcie_auto_tl_in_xing_in_1_d_mem_3_opcode; 
  assign asource_1_auto_out_d_mem_3_param = pcie_auto_tl_in_xing_in_1_d_mem_3_param; 
  assign asource_1_auto_out_d_mem_3_size = pcie_auto_tl_in_xing_in_1_d_mem_3_size; 
  assign asource_1_auto_out_d_mem_3_source = pcie_auto_tl_in_xing_in_1_d_mem_3_source; 
  assign asource_1_auto_out_d_mem_3_sink = pcie_auto_tl_in_xing_in_1_d_mem_3_sink; 
  assign asource_1_auto_out_d_mem_3_denied = pcie_auto_tl_in_xing_in_1_d_mem_3_denied; 
  assign asource_1_auto_out_d_mem_3_data = pcie_auto_tl_in_xing_in_1_d_mem_3_data; 
  assign asource_1_auto_out_d_mem_3_corrupt = pcie_auto_tl_in_xing_in_1_d_mem_3_corrupt; 
  assign asource_1_auto_out_d_mem_4_opcode = pcie_auto_tl_in_xing_in_1_d_mem_4_opcode; 
  assign asource_1_auto_out_d_mem_4_param = pcie_auto_tl_in_xing_in_1_d_mem_4_param; 
  assign asource_1_auto_out_d_mem_4_size = pcie_auto_tl_in_xing_in_1_d_mem_4_size; 
  assign asource_1_auto_out_d_mem_4_source = pcie_auto_tl_in_xing_in_1_d_mem_4_source; 
  assign asource_1_auto_out_d_mem_4_sink = pcie_auto_tl_in_xing_in_1_d_mem_4_sink; 
  assign asource_1_auto_out_d_mem_4_denied = pcie_auto_tl_in_xing_in_1_d_mem_4_denied; 
  assign asource_1_auto_out_d_mem_4_data = pcie_auto_tl_in_xing_in_1_d_mem_4_data; 
  assign asource_1_auto_out_d_mem_4_corrupt = pcie_auto_tl_in_xing_in_1_d_mem_4_corrupt; 
  assign asource_1_auto_out_d_mem_5_opcode = pcie_auto_tl_in_xing_in_1_d_mem_5_opcode; 
  assign asource_1_auto_out_d_mem_5_param = pcie_auto_tl_in_xing_in_1_d_mem_5_param; 
  assign asource_1_auto_out_d_mem_5_size = pcie_auto_tl_in_xing_in_1_d_mem_5_size; 
  assign asource_1_auto_out_d_mem_5_source = pcie_auto_tl_in_xing_in_1_d_mem_5_source; 
  assign asource_1_auto_out_d_mem_5_sink = pcie_auto_tl_in_xing_in_1_d_mem_5_sink; 
  assign asource_1_auto_out_d_mem_5_denied = pcie_auto_tl_in_xing_in_1_d_mem_5_denied; 
  assign asource_1_auto_out_d_mem_5_data = pcie_auto_tl_in_xing_in_1_d_mem_5_data; 
  assign asource_1_auto_out_d_mem_5_corrupt = pcie_auto_tl_in_xing_in_1_d_mem_5_corrupt; 
  assign asource_1_auto_out_d_mem_6_opcode = pcie_auto_tl_in_xing_in_1_d_mem_6_opcode; 
  assign asource_1_auto_out_d_mem_6_param = pcie_auto_tl_in_xing_in_1_d_mem_6_param; 
  assign asource_1_auto_out_d_mem_6_size = pcie_auto_tl_in_xing_in_1_d_mem_6_size; 
  assign asource_1_auto_out_d_mem_6_source = pcie_auto_tl_in_xing_in_1_d_mem_6_source; 
  assign asource_1_auto_out_d_mem_6_sink = pcie_auto_tl_in_xing_in_1_d_mem_6_sink; 
  assign asource_1_auto_out_d_mem_6_denied = pcie_auto_tl_in_xing_in_1_d_mem_6_denied; 
  assign asource_1_auto_out_d_mem_6_data = pcie_auto_tl_in_xing_in_1_d_mem_6_data; 
  assign asource_1_auto_out_d_mem_6_corrupt = pcie_auto_tl_in_xing_in_1_d_mem_6_corrupt; 
  assign asource_1_auto_out_d_mem_7_opcode = pcie_auto_tl_in_xing_in_1_d_mem_7_opcode; 
  assign asource_1_auto_out_d_mem_7_param = pcie_auto_tl_in_xing_in_1_d_mem_7_param; 
  assign asource_1_auto_out_d_mem_7_size = pcie_auto_tl_in_xing_in_1_d_mem_7_size; 
  assign asource_1_auto_out_d_mem_7_source = pcie_auto_tl_in_xing_in_1_d_mem_7_source; 
  assign asource_1_auto_out_d_mem_7_sink = pcie_auto_tl_in_xing_in_1_d_mem_7_sink; 
  assign asource_1_auto_out_d_mem_7_denied = pcie_auto_tl_in_xing_in_1_d_mem_7_denied; 
  assign asource_1_auto_out_d_mem_7_data = pcie_auto_tl_in_xing_in_1_d_mem_7_data; 
  assign asource_1_auto_out_d_mem_7_corrupt = pcie_auto_tl_in_xing_in_1_d_mem_7_corrupt; 
  assign asource_1_auto_out_d_widx = pcie_auto_tl_in_xing_in_1_d_widx; 
  assign asource_1_auto_out_d_safe_widx_valid = pcie_auto_tl_in_xing_in_1_d_safe_widx_valid; 
  assign asource_1_auto_out_d_safe_source_reset_n = pcie_auto_tl_in_xing_in_1_d_safe_source_reset_n; 
  assign asink_clock = clock; 
  assign asink_reset = reset; 
  assign asink_auto_in_a_mem_0_opcode = pcie_auto_tl_out_xing_out_a_mem_0_opcode; 
  assign asink_auto_in_a_mem_0_param = pcie_auto_tl_out_xing_out_a_mem_0_param; 
  assign asink_auto_in_a_mem_0_size = pcie_auto_tl_out_xing_out_a_mem_0_size; 
  assign asink_auto_in_a_mem_0_source = pcie_auto_tl_out_xing_out_a_mem_0_source; 
  assign asink_auto_in_a_mem_0_address = pcie_auto_tl_out_xing_out_a_mem_0_address; 
  assign asink_auto_in_a_mem_0_mask = pcie_auto_tl_out_xing_out_a_mem_0_mask; 
  assign asink_auto_in_a_mem_0_data = pcie_auto_tl_out_xing_out_a_mem_0_data; 
  assign asink_auto_in_a_mem_0_corrupt = pcie_auto_tl_out_xing_out_a_mem_0_corrupt; 
  assign asink_auto_in_a_mem_1_opcode = pcie_auto_tl_out_xing_out_a_mem_1_opcode; 
  assign asink_auto_in_a_mem_1_param = pcie_auto_tl_out_xing_out_a_mem_1_param; 
  assign asink_auto_in_a_mem_1_size = pcie_auto_tl_out_xing_out_a_mem_1_size; 
  assign asink_auto_in_a_mem_1_source = pcie_auto_tl_out_xing_out_a_mem_1_source; 
  assign asink_auto_in_a_mem_1_address = pcie_auto_tl_out_xing_out_a_mem_1_address; 
  assign asink_auto_in_a_mem_1_mask = pcie_auto_tl_out_xing_out_a_mem_1_mask; 
  assign asink_auto_in_a_mem_1_data = pcie_auto_tl_out_xing_out_a_mem_1_data; 
  assign asink_auto_in_a_mem_1_corrupt = pcie_auto_tl_out_xing_out_a_mem_1_corrupt; 
  assign asink_auto_in_a_mem_2_opcode = pcie_auto_tl_out_xing_out_a_mem_2_opcode; 
  assign asink_auto_in_a_mem_2_param = pcie_auto_tl_out_xing_out_a_mem_2_param; 
  assign asink_auto_in_a_mem_2_size = pcie_auto_tl_out_xing_out_a_mem_2_size; 
  assign asink_auto_in_a_mem_2_source = pcie_auto_tl_out_xing_out_a_mem_2_source; 
  assign asink_auto_in_a_mem_2_address = pcie_auto_tl_out_xing_out_a_mem_2_address; 
  assign asink_auto_in_a_mem_2_mask = pcie_auto_tl_out_xing_out_a_mem_2_mask; 
  assign asink_auto_in_a_mem_2_data = pcie_auto_tl_out_xing_out_a_mem_2_data; 
  assign asink_auto_in_a_mem_2_corrupt = pcie_auto_tl_out_xing_out_a_mem_2_corrupt; 
  assign asink_auto_in_a_mem_3_opcode = pcie_auto_tl_out_xing_out_a_mem_3_opcode; 
  assign asink_auto_in_a_mem_3_param = pcie_auto_tl_out_xing_out_a_mem_3_param; 
  assign asink_auto_in_a_mem_3_size = pcie_auto_tl_out_xing_out_a_mem_3_size; 
  assign asink_auto_in_a_mem_3_source = pcie_auto_tl_out_xing_out_a_mem_3_source; 
  assign asink_auto_in_a_mem_3_address = pcie_auto_tl_out_xing_out_a_mem_3_address; 
  assign asink_auto_in_a_mem_3_mask = pcie_auto_tl_out_xing_out_a_mem_3_mask; 
  assign asink_auto_in_a_mem_3_data = pcie_auto_tl_out_xing_out_a_mem_3_data; 
  assign asink_auto_in_a_mem_3_corrupt = pcie_auto_tl_out_xing_out_a_mem_3_corrupt; 
  assign asink_auto_in_a_mem_4_opcode = pcie_auto_tl_out_xing_out_a_mem_4_opcode; 
  assign asink_auto_in_a_mem_4_param = pcie_auto_tl_out_xing_out_a_mem_4_param; 
  assign asink_auto_in_a_mem_4_size = pcie_auto_tl_out_xing_out_a_mem_4_size; 
  assign asink_auto_in_a_mem_4_source = pcie_auto_tl_out_xing_out_a_mem_4_source; 
  assign asink_auto_in_a_mem_4_address = pcie_auto_tl_out_xing_out_a_mem_4_address; 
  assign asink_auto_in_a_mem_4_mask = pcie_auto_tl_out_xing_out_a_mem_4_mask; 
  assign asink_auto_in_a_mem_4_data = pcie_auto_tl_out_xing_out_a_mem_4_data; 
  assign asink_auto_in_a_mem_4_corrupt = pcie_auto_tl_out_xing_out_a_mem_4_corrupt; 
  assign asink_auto_in_a_mem_5_opcode = pcie_auto_tl_out_xing_out_a_mem_5_opcode; 
  assign asink_auto_in_a_mem_5_param = pcie_auto_tl_out_xing_out_a_mem_5_param; 
  assign asink_auto_in_a_mem_5_size = pcie_auto_tl_out_xing_out_a_mem_5_size; 
  assign asink_auto_in_a_mem_5_source = pcie_auto_tl_out_xing_out_a_mem_5_source; 
  assign asink_auto_in_a_mem_5_address = pcie_auto_tl_out_xing_out_a_mem_5_address; 
  assign asink_auto_in_a_mem_5_mask = pcie_auto_tl_out_xing_out_a_mem_5_mask; 
  assign asink_auto_in_a_mem_5_data = pcie_auto_tl_out_xing_out_a_mem_5_data; 
  assign asink_auto_in_a_mem_5_corrupt = pcie_auto_tl_out_xing_out_a_mem_5_corrupt; 
  assign asink_auto_in_a_mem_6_opcode = pcie_auto_tl_out_xing_out_a_mem_6_opcode; 
  assign asink_auto_in_a_mem_6_param = pcie_auto_tl_out_xing_out_a_mem_6_param; 
  assign asink_auto_in_a_mem_6_size = pcie_auto_tl_out_xing_out_a_mem_6_size; 
  assign asink_auto_in_a_mem_6_source = pcie_auto_tl_out_xing_out_a_mem_6_source; 
  assign asink_auto_in_a_mem_6_address = pcie_auto_tl_out_xing_out_a_mem_6_address; 
  assign asink_auto_in_a_mem_6_mask = pcie_auto_tl_out_xing_out_a_mem_6_mask; 
  assign asink_auto_in_a_mem_6_data = pcie_auto_tl_out_xing_out_a_mem_6_data; 
  assign asink_auto_in_a_mem_6_corrupt = pcie_auto_tl_out_xing_out_a_mem_6_corrupt; 
  assign asink_auto_in_a_mem_7_opcode = pcie_auto_tl_out_xing_out_a_mem_7_opcode; 
  assign asink_auto_in_a_mem_7_param = pcie_auto_tl_out_xing_out_a_mem_7_param; 
  assign asink_auto_in_a_mem_7_size = pcie_auto_tl_out_xing_out_a_mem_7_size; 
  assign asink_auto_in_a_mem_7_source = pcie_auto_tl_out_xing_out_a_mem_7_source; 
  assign asink_auto_in_a_mem_7_address = pcie_auto_tl_out_xing_out_a_mem_7_address; 
  assign asink_auto_in_a_mem_7_mask = pcie_auto_tl_out_xing_out_a_mem_7_mask; 
  assign asink_auto_in_a_mem_7_data = pcie_auto_tl_out_xing_out_a_mem_7_data; 
  assign asink_auto_in_a_mem_7_corrupt = pcie_auto_tl_out_xing_out_a_mem_7_corrupt; 
  assign asink_auto_in_a_widx = pcie_auto_tl_out_xing_out_a_widx; 
  assign asink_auto_in_a_safe_widx_valid = pcie_auto_tl_out_xing_out_a_safe_widx_valid; 
  assign asink_auto_in_a_safe_source_reset_n = pcie_auto_tl_out_xing_out_a_safe_source_reset_n; 
  assign asink_auto_in_d_ridx = pcie_auto_tl_out_xing_out_d_ridx; 
  assign asink_auto_in_d_safe_ridx_valid = pcie_auto_tl_out_xing_out_d_safe_ridx_valid; 
  assign asink_auto_in_d_safe_sink_reset_n = pcie_auto_tl_out_xing_out_d_safe_sink_reset_n; 
  assign asink_auto_out_a_ready = sbus_auto_coupler_from_master_named_pcie_0_fixer_in_a_ready; 
  assign asink_auto_out_d_valid = sbus_auto_coupler_from_master_named_pcie_0_fixer_in_d_valid; 
  assign asink_auto_out_d_bits_opcode = sbus_auto_coupler_from_master_named_pcie_0_fixer_in_d_bits_opcode; 
  assign asink_auto_out_d_bits_param = sbus_auto_coupler_from_master_named_pcie_0_fixer_in_d_bits_param; 
  assign asink_auto_out_d_bits_size = sbus_auto_coupler_from_master_named_pcie_0_fixer_in_d_bits_size; 
  assign asink_auto_out_d_bits_source = sbus_auto_coupler_from_master_named_pcie_0_fixer_in_d_bits_source; 
  assign asink_auto_out_d_bits_sink = sbus_auto_coupler_from_master_named_pcie_0_fixer_in_d_bits_sink; 
  assign asink_auto_out_d_bits_denied = sbus_auto_coupler_from_master_named_pcie_0_fixer_in_d_bits_denied; 
  assign asink_auto_out_d_bits_data = sbus_auto_coupler_from_master_named_pcie_0_fixer_in_d_bits_data; 
  assign asink_auto_out_d_bits_corrupt = sbus_auto_coupler_from_master_named_pcie_0_fixer_in_d_bits_corrupt; 
  assign intsink_6_clock = clock; 
  assign intsink_6_auto_in_sync_0 = pcie_auto_int_out_xing_out_sync_0; 
  assign asyncXing_2_clock = clock; 
  assign asyncXing_2_auto_int_in_0 = intsink_7_auto_out_0; 
  assign asyncXing_2_auto_int_in_1 = intsink_7_auto_out_1; 
  assign asyncXing_2_auto_int_in_2 = intsink_7_auto_out_2; 
  assign asyncXing_2_auto_int_in_3 = intsink_7_auto_out_3; 
  assign gpio_0_clock = pbus_clock; 
  assign gpio_0_reset = pbus_reset; 
  assign gpio_0_auto_control_xing_in_a_valid = pbus_auto_coupler_to_device_named_gpio_0_control_xing_out_a_valid; 
  assign gpio_0_auto_control_xing_in_a_bits_opcode = pbus_auto_coupler_to_device_named_gpio_0_control_xing_out_a_bits_opcode; 
  assign gpio_0_auto_control_xing_in_a_bits_param = pbus_auto_coupler_to_device_named_gpio_0_control_xing_out_a_bits_param; 
  assign gpio_0_auto_control_xing_in_a_bits_size = pbus_auto_coupler_to_device_named_gpio_0_control_xing_out_a_bits_size; 
  assign gpio_0_auto_control_xing_in_a_bits_source = pbus_auto_coupler_to_device_named_gpio_0_control_xing_out_a_bits_source; 
  assign gpio_0_auto_control_xing_in_a_bits_address = pbus_auto_coupler_to_device_named_gpio_0_control_xing_out_a_bits_address; 
  assign gpio_0_auto_control_xing_in_a_bits_mask = pbus_auto_coupler_to_device_named_gpio_0_control_xing_out_a_bits_mask; 
  assign gpio_0_auto_control_xing_in_a_bits_data = pbus_auto_coupler_to_device_named_gpio_0_control_xing_out_a_bits_data; 
  assign gpio_0_auto_control_xing_in_a_bits_corrupt = pbus_auto_coupler_to_device_named_gpio_0_control_xing_out_a_bits_corrupt; 
  assign gpio_0_auto_control_xing_in_d_ready = pbus_auto_coupler_to_device_named_gpio_0_control_xing_out_d_ready; 
  assign intsink_7_auto_in_sync_0 = gpio_0_auto_int_xing_out_sync_0; 
  assign intsink_7_auto_in_sync_1 = gpio_0_auto_int_xing_out_sync_1; 
  assign intsink_7_auto_in_sync_2 = gpio_0_auto_int_xing_out_sync_2; 
  assign intsink_7_auto_in_sync_3 = gpio_0_auto_int_xing_out_sync_3; 
  assign dtm_clock = debug_systemjtag_jtag_TCK; 
  assign dtm_reset = dtm_io_fsmReset; 
  assign dtm_io_dmi_req_ready = debug_1_io_dmi_dmi_req_ready; 
  assign dtm_io_dmi_resp_valid = debug_1_io_dmi_dmi_resp_valid; 
  assign dtm_io_dmi_resp_bits_data = debug_1_io_dmi_dmi_resp_bits_data; 
  assign dtm_io_dmi_resp_bits_resp = debug_1_io_dmi_dmi_resp_bits_resp; 
  assign dtm_io_jtag_TMS = debug_systemjtag_jtag_TMS; 
  assign dtm_io_jtag_TDI = debug_systemjtag_jtag_TDI; 
  assign dtm_io_jtag_reset = debug_systemjtag_reset; 
  assign dmiResetCatch_clock = debug_systemjtag_jtag_TCK; 
  assign dmiResetCatch_reset = debug_systemjtag_reset; 
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  _T_2369 = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  _T_2371 = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  _T_2377 = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  _T_2379 = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  value = _RAND_4[5:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    _T_2369 <= auto_uart_source_out_rxd;
    _T_2371 <= _T_2369;
    _T_2377 <= auto_spi_source_out_dq_1_i;
    _T_2379 <= _T_2377;
    if (reset) begin
      value <= 6'h0;
    end else begin
      if (int_rtc_tick) begin
        value <= 6'h0;
      end else begin
        value <= _T_2468;
      end
    end
  end
endmodule
