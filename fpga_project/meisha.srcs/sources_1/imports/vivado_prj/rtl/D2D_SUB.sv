module D2D_SUB( 
  
  output wire [31:0] reset_vector_msb_32,
  output wire [3:0] mig_slave_base_addr_msb_4,
  output wire mig_input_takeover_en,

  output wire [15:0] tl_master_xing_in_d_bits_resp_control,

   input wire tile_auto_tl_master_xing_in_d_bits_denied,
   input wire tile_auto_tl_master_xing_in_d_bits_corrupt,
  
   input wire tile_1_auto_tl_master_xing_in_d_bits_denied,
   input wire tile_1_auto_tl_master_xing_in_d_bits_corrupt,
  
   input wire tile_2_auto_tl_master_xing_in_d_bits_denied,
   input wire tile_2_auto_tl_master_xing_in_d_bits_corrupt,
  
   input wire tile_3_auto_tl_master_xing_in_d_bits_denied,
   input wire tile_3_auto_tl_master_xing_in_d_bits_corrupt,

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
    output logic  spi_gpio_mux_sel,
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

  input wire [31:0] transferDataReg,
  input wire        send_1p_valid,
  // rx dfx
  input wire [31:0] b2c_data_concat,
  input wire        b2c_data_valid,

  output wire spi_master_clk,
  output wire [3:0] spi_master_csn,
  output wire [1:0] spi_master_mode,
  output wire [3:0] spi_master_sdo,
  output wire [3:0] spi_master_sdo_oen,
  input  wire [3:0] spi_master_sdi,
  output wire [1:0] spi_master_events_o,


  input  wire  [31:0] pll_state,
  output wire  [31:0]  use_which_clk,
  output wire  [63:0] pll_cfg,
  input wire debug_mode_sel_latch,

   output wire  all_tile_sft_rst,
  //  output wire  tile_0_sft_rst,
  //  output wire  tile_1_sft_rst,
  //  output wire  tile_2_sft_rst,
  //  output wire  tile_3_sft_rst,
   output wire  chiplink_sft_rst,
   output wire  gpio_sft_rst,
   output wire  uart_sft_rst,
   output wire  spi_0_sft_rst,
   output wire  soc_sft_rst,
   output wire global_soft_reset_req,


  input         d2d_clock,
  input         d2d_reset,

  input         always_on_reset,

  output  ddr_master_0_awready
  ,input  ddr_master_0_awvalid
  ,input [3:0] ddr_master_0_awid
  ,input [31:0] ddr_master_0_awaddr
  ,input [7:0] ddr_master_0_awlen
  ,input [2:0] ddr_master_0_awsize
  ,input [1:0] ddr_master_0_awburst
  ,output  ddr_master_0_wready
  ,input  ddr_master_0_wvalid
  ,input [63:0] ddr_master_0_wdata
  ,input [7:0] ddr_master_0_wstrb
  ,input  ddr_master_0_wlast
  ,input  ddr_master_0_bready
  ,output  ddr_master_0_bvalid
  ,output [3:0] ddr_master_0_bid
  ,output [1:0] ddr_master_0_bresp
  ,output  ddr_master_0_arready
  ,input  ddr_master_0_arvalid
  ,input [3:0] ddr_master_0_arid
  ,input [31:0] ddr_master_0_araddr
  ,input [7:0] ddr_master_0_arlen
  ,input [2:0] ddr_master_0_arsize
  ,input [1:0] ddr_master_0_arburst
  ,input  ddr_master_0_rready
  ,output  ddr_master_0_rvalid
  ,output [3:0] ddr_master_0_rid
  ,output [63:0] ddr_master_0_rdata
  ,output [1:0] ddr_master_0_rresp
  ,output  ddr_master_0_rlast,

  output        auto_int_out_xing_out_sync_0, 
  output [2:0]  auto_tl_out_xing_out_a_mem_0_opcode, 
  output [2:0]  auto_tl_out_xing_out_a_mem_0_param, 
  output [2:0]  auto_tl_out_xing_out_a_mem_0_size, 
  output [3:0]  auto_tl_out_xing_out_a_mem_0_source, 
  output [37:0] auto_tl_out_xing_out_a_mem_0_address, 
  output [7:0]  auto_tl_out_xing_out_a_mem_0_mask, 
  output [63:0] auto_tl_out_xing_out_a_mem_0_data, 
  output        auto_tl_out_xing_out_a_mem_0_corrupt, 
  output [2:0]  auto_tl_out_xing_out_a_mem_1_opcode, 
  output [2:0]  auto_tl_out_xing_out_a_mem_1_param, 
  output [2:0]  auto_tl_out_xing_out_a_mem_1_size, 
  output [3:0]  auto_tl_out_xing_out_a_mem_1_source, 
  output [37:0] auto_tl_out_xing_out_a_mem_1_address, 
  output [7:0]  auto_tl_out_xing_out_a_mem_1_mask, 
  output [63:0] auto_tl_out_xing_out_a_mem_1_data, 
  output        auto_tl_out_xing_out_a_mem_1_corrupt, 
  output [2:0]  auto_tl_out_xing_out_a_mem_2_opcode, 
  output [2:0]  auto_tl_out_xing_out_a_mem_2_param, 
  output [2:0]  auto_tl_out_xing_out_a_mem_2_size, 
  output [3:0]  auto_tl_out_xing_out_a_mem_2_source, 
  output [37:0] auto_tl_out_xing_out_a_mem_2_address, 
  output [7:0]  auto_tl_out_xing_out_a_mem_2_mask, 
  output [63:0] auto_tl_out_xing_out_a_mem_2_data, 
  output        auto_tl_out_xing_out_a_mem_2_corrupt, 
  output [2:0]  auto_tl_out_xing_out_a_mem_3_opcode, 
  output [2:0]  auto_tl_out_xing_out_a_mem_3_param, 
  output [2:0]  auto_tl_out_xing_out_a_mem_3_size, 
  output [3:0]  auto_tl_out_xing_out_a_mem_3_source, 
  output [37:0] auto_tl_out_xing_out_a_mem_3_address, 
  output [7:0]  auto_tl_out_xing_out_a_mem_3_mask, 
  output [63:0] auto_tl_out_xing_out_a_mem_3_data, 
  output        auto_tl_out_xing_out_a_mem_3_corrupt, 
  output [2:0]  auto_tl_out_xing_out_a_mem_4_opcode, 
  output [2:0]  auto_tl_out_xing_out_a_mem_4_param, 
  output [2:0]  auto_tl_out_xing_out_a_mem_4_size, 
  output [3:0]  auto_tl_out_xing_out_a_mem_4_source, 
  output [37:0] auto_tl_out_xing_out_a_mem_4_address, 
  output [7:0]  auto_tl_out_xing_out_a_mem_4_mask, 
  output [63:0] auto_tl_out_xing_out_a_mem_4_data, 
  output        auto_tl_out_xing_out_a_mem_4_corrupt, 
  output [2:0]  auto_tl_out_xing_out_a_mem_5_opcode, 
  output [2:0]  auto_tl_out_xing_out_a_mem_5_param, 
  output [2:0]  auto_tl_out_xing_out_a_mem_5_size, 
  output [3:0]  auto_tl_out_xing_out_a_mem_5_source, 
  output [37:0] auto_tl_out_xing_out_a_mem_5_address, 
  output [7:0]  auto_tl_out_xing_out_a_mem_5_mask, 
  output [63:0] auto_tl_out_xing_out_a_mem_5_data, 
  output        auto_tl_out_xing_out_a_mem_5_corrupt, 
  output [2:0]  auto_tl_out_xing_out_a_mem_6_opcode, 
  output [2:0]  auto_tl_out_xing_out_a_mem_6_param, 
  output [2:0]  auto_tl_out_xing_out_a_mem_6_size, 
  output [3:0]  auto_tl_out_xing_out_a_mem_6_source, 
  output [37:0] auto_tl_out_xing_out_a_mem_6_address, 
  output [7:0]  auto_tl_out_xing_out_a_mem_6_mask, 
  output [63:0] auto_tl_out_xing_out_a_mem_6_data, 
  output        auto_tl_out_xing_out_a_mem_6_corrupt, 
  output [2:0]  auto_tl_out_xing_out_a_mem_7_opcode, 
  output [2:0]  auto_tl_out_xing_out_a_mem_7_param, 
  output [2:0]  auto_tl_out_xing_out_a_mem_7_size, 
  output [3:0]  auto_tl_out_xing_out_a_mem_7_source, 
  output [37:0] auto_tl_out_xing_out_a_mem_7_address, 
  output [7:0]  auto_tl_out_xing_out_a_mem_7_mask, 
  output [63:0] auto_tl_out_xing_out_a_mem_7_data, 
  output        auto_tl_out_xing_out_a_mem_7_corrupt, 
  input  [3:0]  auto_tl_out_xing_out_a_ridx, 
  output [3:0]  auto_tl_out_xing_out_a_widx, 
  input         auto_tl_out_xing_out_a_safe_ridx_valid, 
  output        auto_tl_out_xing_out_a_safe_widx_valid, 
  output        auto_tl_out_xing_out_a_safe_source_reset_n, 
  input         auto_tl_out_xing_out_a_safe_sink_reset_n, 
  input  [2:0]  auto_tl_out_xing_out_d_mem_0_opcode, 
  input  [1:0]  auto_tl_out_xing_out_d_mem_0_param, 
  input  [2:0]  auto_tl_out_xing_out_d_mem_0_size, 
  input  [3:0]  auto_tl_out_xing_out_d_mem_0_source, 
  input  [2:0]  auto_tl_out_xing_out_d_mem_0_sink, 
  input         auto_tl_out_xing_out_d_mem_0_denied, 
  input  [63:0] auto_tl_out_xing_out_d_mem_0_data, 
  input         auto_tl_out_xing_out_d_mem_0_corrupt, 
  input  [2:0]  auto_tl_out_xing_out_d_mem_1_opcode, 
  input  [1:0]  auto_tl_out_xing_out_d_mem_1_param, 
  input  [2:0]  auto_tl_out_xing_out_d_mem_1_size, 
  input  [3:0]  auto_tl_out_xing_out_d_mem_1_source, 
  input  [2:0]  auto_tl_out_xing_out_d_mem_1_sink, 
  input         auto_tl_out_xing_out_d_mem_1_denied, 
  input  [63:0] auto_tl_out_xing_out_d_mem_1_data, 
  input         auto_tl_out_xing_out_d_mem_1_corrupt, 
  input  [2:0]  auto_tl_out_xing_out_d_mem_2_opcode, 
  input  [1:0]  auto_tl_out_xing_out_d_mem_2_param, 
  input  [2:0]  auto_tl_out_xing_out_d_mem_2_size, 
  input  [3:0]  auto_tl_out_xing_out_d_mem_2_source, 
  input  [2:0]  auto_tl_out_xing_out_d_mem_2_sink, 
  input         auto_tl_out_xing_out_d_mem_2_denied, 
  input  [63:0] auto_tl_out_xing_out_d_mem_2_data, 
  input         auto_tl_out_xing_out_d_mem_2_corrupt, 
  input  [2:0]  auto_tl_out_xing_out_d_mem_3_opcode, 
  input  [1:0]  auto_tl_out_xing_out_d_mem_3_param, 
  input  [2:0]  auto_tl_out_xing_out_d_mem_3_size, 
  input  [3:0]  auto_tl_out_xing_out_d_mem_3_source, 
  input  [2:0]  auto_tl_out_xing_out_d_mem_3_sink, 
  input         auto_tl_out_xing_out_d_mem_3_denied, 
  input  [63:0] auto_tl_out_xing_out_d_mem_3_data, 
  input         auto_tl_out_xing_out_d_mem_3_corrupt, 
  input  [2:0]  auto_tl_out_xing_out_d_mem_4_opcode, 
  input  [1:0]  auto_tl_out_xing_out_d_mem_4_param, 
  input  [2:0]  auto_tl_out_xing_out_d_mem_4_size, 
  input  [3:0]  auto_tl_out_xing_out_d_mem_4_source, 
  input  [2:0]  auto_tl_out_xing_out_d_mem_4_sink, 
  input         auto_tl_out_xing_out_d_mem_4_denied, 
  input  [63:0] auto_tl_out_xing_out_d_mem_4_data, 
  input         auto_tl_out_xing_out_d_mem_4_corrupt, 
  input  [2:0]  auto_tl_out_xing_out_d_mem_5_opcode, 
  input  [1:0]  auto_tl_out_xing_out_d_mem_5_param, 
  input  [2:0]  auto_tl_out_xing_out_d_mem_5_size, 
  input  [3:0]  auto_tl_out_xing_out_d_mem_5_source, 
  input  [2:0]  auto_tl_out_xing_out_d_mem_5_sink, 
  input         auto_tl_out_xing_out_d_mem_5_denied, 
  input  [63:0] auto_tl_out_xing_out_d_mem_5_data, 
  input         auto_tl_out_xing_out_d_mem_5_corrupt, 
  input  [2:0]  auto_tl_out_xing_out_d_mem_6_opcode, 
  input  [1:0]  auto_tl_out_xing_out_d_mem_6_param, 
  input  [2:0]  auto_tl_out_xing_out_d_mem_6_size, 
  input  [3:0]  auto_tl_out_xing_out_d_mem_6_source, 
  input  [2:0]  auto_tl_out_xing_out_d_mem_6_sink, 
  input         auto_tl_out_xing_out_d_mem_6_denied, 
  input  [63:0] auto_tl_out_xing_out_d_mem_6_data, 
  input         auto_tl_out_xing_out_d_mem_6_corrupt, 
  input  [2:0]  auto_tl_out_xing_out_d_mem_7_opcode, 
  input  [1:0]  auto_tl_out_xing_out_d_mem_7_param, 
  input  [2:0]  auto_tl_out_xing_out_d_mem_7_size, 
  input  [3:0]  auto_tl_out_xing_out_d_mem_7_source, 
  input  [2:0]  auto_tl_out_xing_out_d_mem_7_sink, 
  input         auto_tl_out_xing_out_d_mem_7_denied, 
  input  [63:0] auto_tl_out_xing_out_d_mem_7_data, 
  input         auto_tl_out_xing_out_d_mem_7_corrupt, 
  output [3:0]  auto_tl_out_xing_out_d_ridx, 
  input  [3:0]  auto_tl_out_xing_out_d_widx, 
  output        auto_tl_out_xing_out_d_safe_ridx_valid, 
  input         auto_tl_out_xing_out_d_safe_widx_valid, 
  input         auto_tl_out_xing_out_d_safe_source_reset_n, 
  output        auto_tl_out_xing_out_d_safe_sink_reset_n, 
  input  [2:0]  auto_tl_in_xing_in_1_a_mem_0_opcode, 
  input  [2:0]  auto_tl_in_xing_in_1_a_mem_0_param, 
  input  [2:0]  auto_tl_in_xing_in_1_a_mem_0_size, 
  input  [4:0]  auto_tl_in_xing_in_1_a_mem_0_source, 
  input  [37:0] auto_tl_in_xing_in_1_a_mem_0_address, 
  input  [3:0]  auto_tl_in_xing_in_1_a_mem_0_mask, 
  input  [31:0] auto_tl_in_xing_in_1_a_mem_0_data, 
  input         auto_tl_in_xing_in_1_a_mem_0_corrupt, 
  input  [2:0]  auto_tl_in_xing_in_1_a_mem_1_opcode, 
  input  [2:0]  auto_tl_in_xing_in_1_a_mem_1_param, 
  input  [2:0]  auto_tl_in_xing_in_1_a_mem_1_size, 
  input  [4:0]  auto_tl_in_xing_in_1_a_mem_1_source, 
  input  [37:0] auto_tl_in_xing_in_1_a_mem_1_address, 
  input  [3:0]  auto_tl_in_xing_in_1_a_mem_1_mask, 
  input  [31:0] auto_tl_in_xing_in_1_a_mem_1_data, 
  input         auto_tl_in_xing_in_1_a_mem_1_corrupt, 
  input  [2:0]  auto_tl_in_xing_in_1_a_mem_2_opcode, 
  input  [2:0]  auto_tl_in_xing_in_1_a_mem_2_param, 
  input  [2:0]  auto_tl_in_xing_in_1_a_mem_2_size, 
  input  [4:0]  auto_tl_in_xing_in_1_a_mem_2_source, 
  input  [37:0] auto_tl_in_xing_in_1_a_mem_2_address, 
  input  [3:0]  auto_tl_in_xing_in_1_a_mem_2_mask, 
  input  [31:0] auto_tl_in_xing_in_1_a_mem_2_data, 
  input         auto_tl_in_xing_in_1_a_mem_2_corrupt, 
  input  [2:0]  auto_tl_in_xing_in_1_a_mem_3_opcode, 
  input  [2:0]  auto_tl_in_xing_in_1_a_mem_3_param, 
  input  [2:0]  auto_tl_in_xing_in_1_a_mem_3_size, 
  input  [4:0]  auto_tl_in_xing_in_1_a_mem_3_source, 
  input  [37:0] auto_tl_in_xing_in_1_a_mem_3_address, 
  input  [3:0]  auto_tl_in_xing_in_1_a_mem_3_mask, 
  input  [31:0] auto_tl_in_xing_in_1_a_mem_3_data, 
  input         auto_tl_in_xing_in_1_a_mem_3_corrupt, 
  input  [2:0]  auto_tl_in_xing_in_1_a_mem_4_opcode, 
  input  [2:0]  auto_tl_in_xing_in_1_a_mem_4_param, 
  input  [2:0]  auto_tl_in_xing_in_1_a_mem_4_size, 
  input  [4:0]  auto_tl_in_xing_in_1_a_mem_4_source, 
  input  [37:0] auto_tl_in_xing_in_1_a_mem_4_address, 
  input  [3:0]  auto_tl_in_xing_in_1_a_mem_4_mask, 
  input  [31:0] auto_tl_in_xing_in_1_a_mem_4_data, 
  input         auto_tl_in_xing_in_1_a_mem_4_corrupt, 
  input  [2:0]  auto_tl_in_xing_in_1_a_mem_5_opcode, 
  input  [2:0]  auto_tl_in_xing_in_1_a_mem_5_param, 
  input  [2:0]  auto_tl_in_xing_in_1_a_mem_5_size, 
  input  [4:0]  auto_tl_in_xing_in_1_a_mem_5_source, 
  input  [37:0] auto_tl_in_xing_in_1_a_mem_5_address, 
  input  [3:0]  auto_tl_in_xing_in_1_a_mem_5_mask, 
  input  [31:0] auto_tl_in_xing_in_1_a_mem_5_data, 
  input         auto_tl_in_xing_in_1_a_mem_5_corrupt, 
  input  [2:0]  auto_tl_in_xing_in_1_a_mem_6_opcode, 
  input  [2:0]  auto_tl_in_xing_in_1_a_mem_6_param, 
  input  [2:0]  auto_tl_in_xing_in_1_a_mem_6_size, 
  input  [4:0]  auto_tl_in_xing_in_1_a_mem_6_source, 
  input  [37:0] auto_tl_in_xing_in_1_a_mem_6_address, 
  input  [3:0]  auto_tl_in_xing_in_1_a_mem_6_mask, 
  input  [31:0] auto_tl_in_xing_in_1_a_mem_6_data, 
  input         auto_tl_in_xing_in_1_a_mem_6_corrupt, 
  input  [2:0]  auto_tl_in_xing_in_1_a_mem_7_opcode, 
  input  [2:0]  auto_tl_in_xing_in_1_a_mem_7_param, 
  input  [2:0]  auto_tl_in_xing_in_1_a_mem_7_size, 
  input  [4:0]  auto_tl_in_xing_in_1_a_mem_7_source, 
  input  [37:0] auto_tl_in_xing_in_1_a_mem_7_address, 
  input  [3:0]  auto_tl_in_xing_in_1_a_mem_7_mask, 
  input  [31:0] auto_tl_in_xing_in_1_a_mem_7_data, 
  input         auto_tl_in_xing_in_1_a_mem_7_corrupt, 
  output [3:0]  auto_tl_in_xing_in_1_a_ridx, 
  input  [3:0]  auto_tl_in_xing_in_1_a_widx, 
  output        auto_tl_in_xing_in_1_a_safe_ridx_valid, 
  input         auto_tl_in_xing_in_1_a_safe_widx_valid, 
  input         auto_tl_in_xing_in_1_a_safe_source_reset_n, 
  output        auto_tl_in_xing_in_1_a_safe_sink_reset_n, 
  output [2:0]  auto_tl_in_xing_in_1_d_mem_0_opcode, 
  output [1:0]  auto_tl_in_xing_in_1_d_mem_0_param, 
  output [2:0]  auto_tl_in_xing_in_1_d_mem_0_size, 
  output [4:0]  auto_tl_in_xing_in_1_d_mem_0_source, 
  output        auto_tl_in_xing_in_1_d_mem_0_sink, 
  output        auto_tl_in_xing_in_1_d_mem_0_denied, 
  output [31:0] auto_tl_in_xing_in_1_d_mem_0_data, 
  output        auto_tl_in_xing_in_1_d_mem_0_corrupt, 
  output [2:0]  auto_tl_in_xing_in_1_d_mem_1_opcode, 
  output [1:0]  auto_tl_in_xing_in_1_d_mem_1_param, 
  output [2:0]  auto_tl_in_xing_in_1_d_mem_1_size, 
  output [4:0]  auto_tl_in_xing_in_1_d_mem_1_source, 
  output        auto_tl_in_xing_in_1_d_mem_1_sink, 
  output        auto_tl_in_xing_in_1_d_mem_1_denied, 
  output [31:0] auto_tl_in_xing_in_1_d_mem_1_data, 
  output        auto_tl_in_xing_in_1_d_mem_1_corrupt, 
  output [2:0]  auto_tl_in_xing_in_1_d_mem_2_opcode, 
  output [1:0]  auto_tl_in_xing_in_1_d_mem_2_param, 
  output [2:0]  auto_tl_in_xing_in_1_d_mem_2_size, 
  output [4:0]  auto_tl_in_xing_in_1_d_mem_2_source, 
  output        auto_tl_in_xing_in_1_d_mem_2_sink, 
  output        auto_tl_in_xing_in_1_d_mem_2_denied, 
  output [31:0] auto_tl_in_xing_in_1_d_mem_2_data, 
  output        auto_tl_in_xing_in_1_d_mem_2_corrupt, 
  output [2:0]  auto_tl_in_xing_in_1_d_mem_3_opcode, 
  output [1:0]  auto_tl_in_xing_in_1_d_mem_3_param, 
  output [2:0]  auto_tl_in_xing_in_1_d_mem_3_size, 
  output [4:0]  auto_tl_in_xing_in_1_d_mem_3_source, 
  output        auto_tl_in_xing_in_1_d_mem_3_sink, 
  output        auto_tl_in_xing_in_1_d_mem_3_denied, 
  output [31:0] auto_tl_in_xing_in_1_d_mem_3_data, 
  output        auto_tl_in_xing_in_1_d_mem_3_corrupt, 
  output [2:0]  auto_tl_in_xing_in_1_d_mem_4_opcode, 
  output [1:0]  auto_tl_in_xing_in_1_d_mem_4_param, 
  output [2:0]  auto_tl_in_xing_in_1_d_mem_4_size, 
  output [4:0]  auto_tl_in_xing_in_1_d_mem_4_source, 
  output        auto_tl_in_xing_in_1_d_mem_4_sink, 
  output        auto_tl_in_xing_in_1_d_mem_4_denied, 
  output [31:0] auto_tl_in_xing_in_1_d_mem_4_data, 
  output        auto_tl_in_xing_in_1_d_mem_4_corrupt, 
  output [2:0]  auto_tl_in_xing_in_1_d_mem_5_opcode, 
  output [1:0]  auto_tl_in_xing_in_1_d_mem_5_param, 
  output [2:0]  auto_tl_in_xing_in_1_d_mem_5_size, 
  output [4:0]  auto_tl_in_xing_in_1_d_mem_5_source, 
  output        auto_tl_in_xing_in_1_d_mem_5_sink, 
  output        auto_tl_in_xing_in_1_d_mem_5_denied, 
  output [31:0] auto_tl_in_xing_in_1_d_mem_5_data, 
  output        auto_tl_in_xing_in_1_d_mem_5_corrupt, 
  output [2:0]  auto_tl_in_xing_in_1_d_mem_6_opcode, 
  output [1:0]  auto_tl_in_xing_in_1_d_mem_6_param, 
  output [2:0]  auto_tl_in_xing_in_1_d_mem_6_size, 
  output [4:0]  auto_tl_in_xing_in_1_d_mem_6_source, 
  output        auto_tl_in_xing_in_1_d_mem_6_sink, 
  output        auto_tl_in_xing_in_1_d_mem_6_denied, 
  output [31:0] auto_tl_in_xing_in_1_d_mem_6_data, 
  output        auto_tl_in_xing_in_1_d_mem_6_corrupt, 
  output [2:0]  auto_tl_in_xing_in_1_d_mem_7_opcode, 
  output [1:0]  auto_tl_in_xing_in_1_d_mem_7_param, 
  output [2:0]  auto_tl_in_xing_in_1_d_mem_7_size, 
  output [4:0]  auto_tl_in_xing_in_1_d_mem_7_source, 
  output        auto_tl_in_xing_in_1_d_mem_7_sink, 
  output        auto_tl_in_xing_in_1_d_mem_7_denied, 
  output [31:0] auto_tl_in_xing_in_1_d_mem_7_data, 
  output        auto_tl_in_xing_in_1_d_mem_7_corrupt, 
  input  [3:0]  auto_tl_in_xing_in_1_d_ridx, 
  output [3:0]  auto_tl_in_xing_in_1_d_widx, 
  input         auto_tl_in_xing_in_1_d_safe_ridx_valid, 
  output        auto_tl_in_xing_in_1_d_safe_widx_valid, 
  output        auto_tl_in_xing_in_1_d_safe_source_reset_n, 
  input         auto_tl_in_xing_in_1_d_safe_sink_reset_n, 
  input  [2:0]  auto_tl_in_xing_in_0_a_mem_0_opcode, 
  input  [2:0]  auto_tl_in_xing_in_0_a_mem_0_param, 
  input  [2:0]  auto_tl_in_xing_in_0_a_mem_0_size, 
  input  [4:0]  auto_tl_in_xing_in_0_a_mem_0_source, 
  input  [30:0] auto_tl_in_xing_in_0_a_mem_0_address, 
  input  [7:0]  auto_tl_in_xing_in_0_a_mem_0_mask, 
  input  [63:0] auto_tl_in_xing_in_0_a_mem_0_data, 
  input         auto_tl_in_xing_in_0_a_mem_0_corrupt, 
  input  [2:0]  auto_tl_in_xing_in_0_a_mem_1_opcode, 
  input  [2:0]  auto_tl_in_xing_in_0_a_mem_1_param, 
  input  [2:0]  auto_tl_in_xing_in_0_a_mem_1_size, 
  input  [4:0]  auto_tl_in_xing_in_0_a_mem_1_source, 
  input  [30:0] auto_tl_in_xing_in_0_a_mem_1_address, 
  input  [7:0]  auto_tl_in_xing_in_0_a_mem_1_mask, 
  input  [63:0] auto_tl_in_xing_in_0_a_mem_1_data, 
  input         auto_tl_in_xing_in_0_a_mem_1_corrupt, 
  input  [2:0]  auto_tl_in_xing_in_0_a_mem_2_opcode, 
  input  [2:0]  auto_tl_in_xing_in_0_a_mem_2_param, 
  input  [2:0]  auto_tl_in_xing_in_0_a_mem_2_size, 
  input  [4:0]  auto_tl_in_xing_in_0_a_mem_2_source, 
  input  [30:0] auto_tl_in_xing_in_0_a_mem_2_address, 
  input  [7:0]  auto_tl_in_xing_in_0_a_mem_2_mask, 
  input  [63:0] auto_tl_in_xing_in_0_a_mem_2_data, 
  input         auto_tl_in_xing_in_0_a_mem_2_corrupt, 
  input  [2:0]  auto_tl_in_xing_in_0_a_mem_3_opcode, 
  input  [2:0]  auto_tl_in_xing_in_0_a_mem_3_param, 
  input  [2:0]  auto_tl_in_xing_in_0_a_mem_3_size, 
  input  [4:0]  auto_tl_in_xing_in_0_a_mem_3_source, 
  input  [30:0] auto_tl_in_xing_in_0_a_mem_3_address, 
  input  [7:0]  auto_tl_in_xing_in_0_a_mem_3_mask, 
  input  [63:0] auto_tl_in_xing_in_0_a_mem_3_data, 
  input         auto_tl_in_xing_in_0_a_mem_3_corrupt, 
  input  [2:0]  auto_tl_in_xing_in_0_a_mem_4_opcode, 
  input  [2:0]  auto_tl_in_xing_in_0_a_mem_4_param, 
  input  [2:0]  auto_tl_in_xing_in_0_a_mem_4_size, 
  input  [4:0]  auto_tl_in_xing_in_0_a_mem_4_source, 
  input  [30:0] auto_tl_in_xing_in_0_a_mem_4_address, 
  input  [7:0]  auto_tl_in_xing_in_0_a_mem_4_mask, 
  input  [63:0] auto_tl_in_xing_in_0_a_mem_4_data, 
  input         auto_tl_in_xing_in_0_a_mem_4_corrupt, 
  input  [2:0]  auto_tl_in_xing_in_0_a_mem_5_opcode, 
  input  [2:0]  auto_tl_in_xing_in_0_a_mem_5_param, 
  input  [2:0]  auto_tl_in_xing_in_0_a_mem_5_size, 
  input  [4:0]  auto_tl_in_xing_in_0_a_mem_5_source, 
  input  [30:0] auto_tl_in_xing_in_0_a_mem_5_address, 
  input  [7:0]  auto_tl_in_xing_in_0_a_mem_5_mask, 
  input  [63:0] auto_tl_in_xing_in_0_a_mem_5_data, 
  input         auto_tl_in_xing_in_0_a_mem_5_corrupt, 
  input  [2:0]  auto_tl_in_xing_in_0_a_mem_6_opcode, 
  input  [2:0]  auto_tl_in_xing_in_0_a_mem_6_param, 
  input  [2:0]  auto_tl_in_xing_in_0_a_mem_6_size, 
  input  [4:0]  auto_tl_in_xing_in_0_a_mem_6_source, 
  input  [30:0] auto_tl_in_xing_in_0_a_mem_6_address, 
  input  [7:0]  auto_tl_in_xing_in_0_a_mem_6_mask, 
  input  [63:0] auto_tl_in_xing_in_0_a_mem_6_data, 
  input         auto_tl_in_xing_in_0_a_mem_6_corrupt, 
  input  [2:0]  auto_tl_in_xing_in_0_a_mem_7_opcode, 
  input  [2:0]  auto_tl_in_xing_in_0_a_mem_7_param, 
  input  [2:0]  auto_tl_in_xing_in_0_a_mem_7_size, 
  input  [4:0]  auto_tl_in_xing_in_0_a_mem_7_source, 
  input  [30:0] auto_tl_in_xing_in_0_a_mem_7_address, 
  input  [7:0]  auto_tl_in_xing_in_0_a_mem_7_mask, 
  input  [63:0] auto_tl_in_xing_in_0_a_mem_7_data, 
  input         auto_tl_in_xing_in_0_a_mem_7_corrupt, 
  output [3:0]  auto_tl_in_xing_in_0_a_ridx, 
  input  [3:0]  auto_tl_in_xing_in_0_a_widx, 
  output        auto_tl_in_xing_in_0_a_safe_ridx_valid, 
  input         auto_tl_in_xing_in_0_a_safe_widx_valid, 
  input         auto_tl_in_xing_in_0_a_safe_source_reset_n, 
  output        auto_tl_in_xing_in_0_a_safe_sink_reset_n, 
  output [2:0]  auto_tl_in_xing_in_0_d_mem_0_opcode, 
  output [1:0]  auto_tl_in_xing_in_0_d_mem_0_param, 
  output [2:0]  auto_tl_in_xing_in_0_d_mem_0_size, 
  output [4:0]  auto_tl_in_xing_in_0_d_mem_0_source, 
  output        auto_tl_in_xing_in_0_d_mem_0_sink, 
  output        auto_tl_in_xing_in_0_d_mem_0_denied, 
  output [63:0] auto_tl_in_xing_in_0_d_mem_0_data, 
  output        auto_tl_in_xing_in_0_d_mem_0_corrupt, 
  output [2:0]  auto_tl_in_xing_in_0_d_mem_1_opcode, 
  output [1:0]  auto_tl_in_xing_in_0_d_mem_1_param, 
  output [2:0]  auto_tl_in_xing_in_0_d_mem_1_size, 
  output [4:0]  auto_tl_in_xing_in_0_d_mem_1_source, 
  output        auto_tl_in_xing_in_0_d_mem_1_sink, 
  output        auto_tl_in_xing_in_0_d_mem_1_denied, 
  output [63:0] auto_tl_in_xing_in_0_d_mem_1_data, 
  output        auto_tl_in_xing_in_0_d_mem_1_corrupt, 
  output [2:0]  auto_tl_in_xing_in_0_d_mem_2_opcode, 
  output [1:0]  auto_tl_in_xing_in_0_d_mem_2_param, 
  output [2:0]  auto_tl_in_xing_in_0_d_mem_2_size, 
  output [4:0]  auto_tl_in_xing_in_0_d_mem_2_source, 
  output        auto_tl_in_xing_in_0_d_mem_2_sink, 
  output        auto_tl_in_xing_in_0_d_mem_2_denied, 
  output [63:0] auto_tl_in_xing_in_0_d_mem_2_data, 
  output        auto_tl_in_xing_in_0_d_mem_2_corrupt, 
  output [2:0]  auto_tl_in_xing_in_0_d_mem_3_opcode, 
  output [1:0]  auto_tl_in_xing_in_0_d_mem_3_param, 
  output [2:0]  auto_tl_in_xing_in_0_d_mem_3_size, 
  output [4:0]  auto_tl_in_xing_in_0_d_mem_3_source, 
  output        auto_tl_in_xing_in_0_d_mem_3_sink, 
  output        auto_tl_in_xing_in_0_d_mem_3_denied, 
  output [63:0] auto_tl_in_xing_in_0_d_mem_3_data, 
  output        auto_tl_in_xing_in_0_d_mem_3_corrupt, 
  output [2:0]  auto_tl_in_xing_in_0_d_mem_4_opcode, 
  output [1:0]  auto_tl_in_xing_in_0_d_mem_4_param, 
  output [2:0]  auto_tl_in_xing_in_0_d_mem_4_size, 
  output [4:0]  auto_tl_in_xing_in_0_d_mem_4_source, 
  output        auto_tl_in_xing_in_0_d_mem_4_sink, 
  output        auto_tl_in_xing_in_0_d_mem_4_denied, 
  output [63:0] auto_tl_in_xing_in_0_d_mem_4_data, 
  output        auto_tl_in_xing_in_0_d_mem_4_corrupt, 
  output [2:0]  auto_tl_in_xing_in_0_d_mem_5_opcode, 
  output [1:0]  auto_tl_in_xing_in_0_d_mem_5_param, 
  output [2:0]  auto_tl_in_xing_in_0_d_mem_5_size, 
  output [4:0]  auto_tl_in_xing_in_0_d_mem_5_source, 
  output        auto_tl_in_xing_in_0_d_mem_5_sink, 
  output        auto_tl_in_xing_in_0_d_mem_5_denied, 
  output [63:0] auto_tl_in_xing_in_0_d_mem_5_data, 
  output        auto_tl_in_xing_in_0_d_mem_5_corrupt, 
  output [2:0]  auto_tl_in_xing_in_0_d_mem_6_opcode, 
  output [1:0]  auto_tl_in_xing_in_0_d_mem_6_param, 
  output [2:0]  auto_tl_in_xing_in_0_d_mem_6_size, 
  output [4:0]  auto_tl_in_xing_in_0_d_mem_6_source, 
  output        auto_tl_in_xing_in_0_d_mem_6_sink, 
  output        auto_tl_in_xing_in_0_d_mem_6_denied, 
  output [63:0] auto_tl_in_xing_in_0_d_mem_6_data, 
  output        auto_tl_in_xing_in_0_d_mem_6_corrupt, 
  output [2:0]  auto_tl_in_xing_in_0_d_mem_7_opcode, 
  output [1:0]  auto_tl_in_xing_in_0_d_mem_7_param, 
  output [2:0]  auto_tl_in_xing_in_0_d_mem_7_size, 
  output [4:0]  auto_tl_in_xing_in_0_d_mem_7_source, 
  output        auto_tl_in_xing_in_0_d_mem_7_sink, 
  output        auto_tl_in_xing_in_0_d_mem_7_denied, 
  output [63:0] auto_tl_in_xing_in_0_d_mem_7_data, 
  output        auto_tl_in_xing_in_0_d_mem_7_corrupt, 
  input  [3:0]  auto_tl_in_xing_in_0_d_ridx, 
  output [3:0]  auto_tl_in_xing_in_0_d_widx, 
  input         auto_tl_in_xing_in_0_d_safe_ridx_valid, 
  output        auto_tl_in_xing_in_0_d_safe_widx_valid, 
  output        auto_tl_in_xing_in_0_d_safe_source_reset_n, 
  input         auto_tl_in_xing_in_0_d_safe_sink_reset_n, 
  input         io_port_REFCLK_rxp, 
  input         io_port_REFCLK_rxn, 
  output        io_port_pci_exp_txp, 
  output        io_port_pci_exp_txn, 
  input         io_port_pci_exp_rxp, 
  input         io_port_pci_exp_rxn, 
  input         io_port_axi_aresetn, 
  output        io_port_axi_aclk_out, 
  output        io_port_mmcm_lock 
);


    localparam master_bus_indexer_AXI4_ADDRESS_WIDTH = 32;
    localparam master_bus_indexer_AXI4_RDATA_WIDTH   = 64;
    localparam master_bus_indexer_AXI4_WDATA_WIDTH   = 64;
    localparam master_bus_indexer_AXI4_USER_WIDTH    = 1;
    localparam master_bus_indexer_AXI4_ID_WIDTH      = 5;


  wire  spi_1_sft_rst;
  wire  spi_slave_sft_rst;
  wire  soc_iram_sft_rst;
  wire  soc_lsys_sft_rst;

  wire  indexer_auto_in_aw_ready;
  wire  indexer_auto_in_aw_valid;
  wire [master_bus_indexer_AXI4_ID_WIDTH-1:0] indexer_auto_in_aw_bits_id;
  wire [32:0] indexer_auto_in_aw_bits_addr;
  wire [7:0] indexer_auto_in_aw_bits_len;
  wire [2:0] indexer_auto_in_aw_bits_size;
  wire [1:0] indexer_auto_in_aw_bits_burst;
  wire  indexer_auto_in_aw_bits_lock;
  wire [3:0] indexer_auto_in_aw_bits_cache;
  wire [2:0] indexer_auto_in_aw_bits_prot;
  wire [3:0] indexer_auto_in_aw_bits_qos;
  wire [10:0] indexer_auto_in_aw_bits_user;
  wire  indexer_auto_in_w_ready;
  wire  indexer_auto_in_w_valid;
  wire [63:0] indexer_auto_in_w_bits_data;
  wire [7:0] indexer_auto_in_w_bits_strb;
  wire  indexer_auto_in_w_bits_last;
  wire  indexer_auto_in_b_ready;
  wire  indexer_auto_in_b_valid;
  wire [master_bus_indexer_AXI4_ID_WIDTH-1:0] indexer_auto_in_b_bits_id;
  wire [1:0] indexer_auto_in_b_bits_resp;
  wire [10:0] indexer_auto_in_b_bits_user;
  wire  indexer_auto_in_ar_ready;
  wire  indexer_auto_in_ar_valid;
  wire [master_bus_indexer_AXI4_ID_WIDTH-1:0] indexer_auto_in_ar_bits_id;
  wire [32:0] indexer_auto_in_ar_bits_addr;
  wire [7:0] indexer_auto_in_ar_bits_len;
  wire [2:0] indexer_auto_in_ar_bits_size;
  wire [1:0] indexer_auto_in_ar_bits_burst;
  wire  indexer_auto_in_ar_bits_lock;
  wire [3:0] indexer_auto_in_ar_bits_cache;
  wire [2:0] indexer_auto_in_ar_bits_prot;
  wire [3:0] indexer_auto_in_ar_bits_qos;
  wire [10:0] indexer_auto_in_ar_bits_user;
  wire  indexer_auto_in_r_ready;
  wire  indexer_auto_in_r_valid;
  wire [master_bus_indexer_AXI4_ID_WIDTH-1:0] indexer_auto_in_r_bits_id;
  wire [63:0] indexer_auto_in_r_bits_data;
  wire [1:0] indexer_auto_in_r_bits_resp;
  wire [10:0] indexer_auto_in_r_bits_user;
  wire  indexer_auto_in_r_bits_last;
  wire  indexer_auto_out_aw_ready;
  wire  indexer_auto_out_aw_valid;
  wire indexer_auto_out_aw_bits_id;
  wire [31:0] indexer_auto_out_aw_bits_addr;
  wire [7:0] indexer_auto_out_aw_bits_len;
  wire [2:0] indexer_auto_out_aw_bits_size;
  wire [1:0] indexer_auto_out_aw_bits_burst;
  wire  indexer_auto_out_aw_bits_lock;
  wire [3:0] indexer_auto_out_aw_bits_cache;
  wire [2:0] indexer_auto_out_aw_bits_prot;
  wire [3:0] indexer_auto_out_aw_bits_qos;
  wire [master_bus_indexer_AXI4_ID_WIDTH-2:0] indexer_auto_out_aw_bits_echo_extra_id;
  wire  indexer_auto_out_w_ready;
  wire  indexer_auto_out_w_valid;
  wire [63:0] indexer_auto_out_w_bits_data;
  wire [7:0] indexer_auto_out_w_bits_strb;
  wire  indexer_auto_out_w_bits_last;
  wire  indexer_auto_out_b_ready;
  wire  indexer_auto_out_b_valid;
  wire indexer_auto_out_b_bits_id;
  wire [1:0] indexer_auto_out_b_bits_resp;
  wire [2:0] indexer_auto_out_b_bits_echo_extra_id_unused;
  wire [master_bus_indexer_AXI4_ID_WIDTH-2:0] indexer_auto_out_b_bits_echo_extra_id;
  wire  indexer_auto_out_ar_ready;
  wire  indexer_auto_out_ar_valid;
  wire indexer_auto_out_ar_bits_id;
  wire [31:0] indexer_auto_out_ar_bits_addr;
  wire [7:0] indexer_auto_out_ar_bits_len;
  wire [2:0] indexer_auto_out_ar_bits_size;
  wire [1:0] indexer_auto_out_ar_bits_burst;
  wire  indexer_auto_out_ar_bits_lock;
  wire [3:0] indexer_auto_out_ar_bits_cache;
  wire [2:0] indexer_auto_out_ar_bits_prot;
  wire [3:0] indexer_auto_out_ar_bits_qos;
  wire [master_bus_indexer_AXI4_ID_WIDTH-2:0] indexer_auto_out_ar_bits_echo_extra_id;
  wire  indexer_auto_out_r_ready;
  wire  indexer_auto_out_r_valid;
  wire indexer_auto_out_r_bits_id;
  wire [63:0] indexer_auto_out_r_bits_data;
  wire [1:0] indexer_auto_out_r_bits_resp;
  wire [2:0] indexer_auto_out_r_bits_echo_extra_id_unused;
  wire [master_bus_indexer_AXI4_ID_WIDTH-2:0] indexer_auto_out_r_bits_echo_extra_id;
  wire  indexer_auto_out_r_bits_last; 

  wire  axi_to_pcie_x1_auto_int_out_0; 

  wire  qspi_master_out_aw_ready; 
  wire  qspi_master_out_aw_valid; 
  wire [31:0] qspi_master_out_aw_addr; 
  wire [7:0] qspi_master_out_aw_len; 
  wire [2:0] qspi_master_out_aw_size; 
  wire [1:0] qspi_master_out_aw_burst;
  wire [3:0] qspi_master_out_aw_id; 

  wire [2:0] qspi_master_out_aw_prot;
  wire [3:0] qspi_master_out_aw_region;
  wire [3:0] qspi_master_out_aw_cache;
  wire [3:0] qspi_master_out_aw_qos;

  wire [2:0] qspi_master_out_ar_prot;
  wire [3:0] qspi_master_out_ar_region;
  wire [3:0] qspi_master_out_ar_cache;
  wire [3:0] qspi_master_out_ar_qos;
  wire [3:0] qspi_master_out_ar_id;

  wire  qspi_master_out_w_ready; 
  wire  qspi_master_out_w_valid; 
  wire [63:0] qspi_master_out_w_data; 
  wire [7:0] qspi_master_out_w_strb; 
  wire  qspi_master_out_w_last; 
  wire  qspi_master_out_b_ready; 
  wire  qspi_master_out_b_valid; 
  wire [1:0] qspi_master_out_b_resp; 
  wire [3:0] qspi_master_out_b_id;
  wire  qspi_master_out_ar_ready; 
  wire  qspi_master_out_ar_valid; 
  wire [31:0] qspi_master_out_ar_addr; 
  wire [7:0] qspi_master_out_ar_len; 
  wire [2:0] qspi_master_out_ar_size; 
  wire [1:0] qspi_master_out_ar_burst; 
  wire  qspi_master_out_r_ready; 
  wire  qspi_master_out_r_valid; 
  wire [3:0] qspi_master_out_r_id;
  wire [63:0] qspi_master_out_r_data; 
  wire [1:0] qspi_master_out_r_resp; 
  wire  qspi_master_out_r_last; 



  wire  axi_to_pcie_x1_auto_master_out_aw_ready; 
  wire  axi_to_pcie_x1_auto_master_out_aw_valid; 
  wire [37:0] axi_to_pcie_x1_auto_master_out_aw_bits_addr; 
  wire [7:0] axi_to_pcie_x1_auto_master_out_aw_bits_len; 
  wire [2:0] axi_to_pcie_x1_auto_master_out_aw_bits_size; 
  wire [1:0] axi_to_pcie_x1_auto_master_out_aw_bits_burst; 
  wire  axi_to_pcie_x1_auto_master_out_w_ready; 
  wire  axi_to_pcie_x1_auto_master_out_w_valid; 
  wire [63:0] axi_to_pcie_x1_auto_master_out_w_bits_data; 
  wire [7:0] axi_to_pcie_x1_auto_master_out_w_bits_strb; 
  wire  axi_to_pcie_x1_auto_master_out_w_bits_last; 
  wire  axi_to_pcie_x1_auto_master_out_b_ready; 
  wire  axi_to_pcie_x1_auto_master_out_b_valid; 
  wire [1:0] axi_to_pcie_x1_auto_master_out_b_bits_resp; 
  wire  axi_to_pcie_x1_auto_master_out_ar_ready; 
  wire  axi_to_pcie_x1_auto_master_out_ar_valid; 
  wire [37:0] axi_to_pcie_x1_auto_master_out_ar_bits_addr; 
  wire [7:0] axi_to_pcie_x1_auto_master_out_ar_bits_len; 
  wire [2:0] axi_to_pcie_x1_auto_master_out_ar_bits_size; 
  wire [1:0] axi_to_pcie_x1_auto_master_out_ar_bits_burst; 
  wire  axi_to_pcie_x1_auto_master_out_r_ready; 
  wire  axi_to_pcie_x1_auto_master_out_r_valid; 
  wire [63:0] axi_to_pcie_x1_auto_master_out_r_bits_data; 
  wire [1:0] axi_to_pcie_x1_auto_master_out_r_bits_resp; 
  wire  axi_to_pcie_x1_auto_master_out_r_bits_last; 
  wire  axi_to_pcie_x1_auto_control_in_aw_ready; 
  wire  axi_to_pcie_x1_auto_control_in_aw_valid; 
  wire [37:0] axi_to_pcie_x1_auto_control_in_aw_bits_addr; 
  wire  axi_to_pcie_x1_auto_control_in_w_ready; 
  wire  axi_to_pcie_x1_auto_control_in_w_valid; 
  wire [31:0] axi_to_pcie_x1_auto_control_in_w_bits_data; 
  wire [3:0] axi_to_pcie_x1_auto_control_in_w_bits_strb; 
  wire  axi_to_pcie_x1_auto_control_in_b_ready; 
  wire  axi_to_pcie_x1_auto_control_in_b_valid; 
  wire [1:0] axi_to_pcie_x1_auto_control_in_b_bits_resp; 
  wire  axi_to_pcie_x1_auto_control_in_ar_ready; 
  wire  axi_to_pcie_x1_auto_control_in_ar_valid; 
  wire [37:0] axi_to_pcie_x1_auto_control_in_ar_bits_addr; 
  wire  axi_to_pcie_x1_auto_control_in_r_ready; 
  wire  axi_to_pcie_x1_auto_control_in_r_valid; 
  wire [31:0] axi_to_pcie_x1_auto_control_in_r_bits_data; 
  wire [1:0] axi_to_pcie_x1_auto_control_in_r_bits_resp; 
  wire  axi_to_pcie_x1_auto_slave_in_aw_ready; 
  wire  axi_to_pcie_x1_auto_slave_in_aw_valid; 
  wire [3:0] axi_to_pcie_x1_auto_slave_in_aw_bits_id; 
  wire [27:0] axi_to_pcie_x1_auto_slave_in_aw_bits_addr; 
  wire [7:0] axi_to_pcie_x1_auto_slave_in_aw_bits_len; 
  wire [2:0] axi_to_pcie_x1_auto_slave_in_aw_bits_size; 
  wire [1:0] axi_to_pcie_x1_auto_slave_in_aw_bits_burst; 
  wire  axi_to_pcie_x1_auto_slave_in_w_ready; 
  wire  axi_to_pcie_x1_auto_slave_in_w_valid; 
  wire [63:0] axi_to_pcie_x1_auto_slave_in_w_bits_data; 
  wire [7:0] axi_to_pcie_x1_auto_slave_in_w_bits_strb; 
  wire  axi_to_pcie_x1_auto_slave_in_w_bits_last; 
  wire  axi_to_pcie_x1_auto_slave_in_b_ready; 
  wire  axi_to_pcie_x1_auto_slave_in_b_valid; 
  wire [3:0] axi_to_pcie_x1_auto_slave_in_b_bits_id; 
  wire [1:0] axi_to_pcie_x1_auto_slave_in_b_bits_resp; 
  wire  axi_to_pcie_x1_auto_slave_in_ar_ready; 
  wire  axi_to_pcie_x1_auto_slave_in_ar_valid; 
  wire [3:0] axi_to_pcie_x1_auto_slave_in_ar_bits_id; 
  wire [27:0] axi_to_pcie_x1_auto_slave_in_ar_bits_addr; 
  wire [7:0] axi_to_pcie_x1_auto_slave_in_ar_bits_len; 
  wire [2:0] axi_to_pcie_x1_auto_slave_in_ar_bits_size; 
  wire [1:0] axi_to_pcie_x1_auto_slave_in_ar_bits_burst; 
  wire  axi_to_pcie_x1_auto_slave_in_r_ready; 
  wire  axi_to_pcie_x1_auto_slave_in_r_valid; 
  wire [3:0] axi_to_pcie_x1_auto_slave_in_r_bits_id; 
  wire [63:0] axi_to_pcie_x1_auto_slave_in_r_bits_data; 
  wire [1:0] axi_to_pcie_x1_auto_slave_in_r_bits_resp; 
  wire  axi_to_pcie_x1_auto_slave_in_r_bits_last; 
  wire  axi_to_pcie_x1_io_port_pci_exp_txp; 
  wire  axi_to_pcie_x1_io_port_pci_exp_txn; 
  wire  axi_to_pcie_x1_io_port_pci_exp_rxp; 
  wire  axi_to_pcie_x1_io_port_pci_exp_rxn; 
  wire  axi_to_pcie_x1_io_port_axi_aresetn; 
  wire  axi_to_pcie_x1_io_port_axi_aclk_out; 
  wire  axi_to_pcie_x1_io_port_mmcm_lock; 
  wire  axi_to_pcie_x1_io_REFCLK; 
  wire  axi4buf_clock; 
  wire  axi4buf_reset; 
  wire  axi4buf_auto_in_aw_ready; 
  wire  axi4buf_auto_in_aw_valid; 
  wire [3:0] axi4buf_auto_in_aw_bits_id; 
  wire [30:0] axi4buf_auto_in_aw_bits_addr; 
  wire [7:0] axi4buf_auto_in_aw_bits_len; 
  wire [2:0] axi4buf_auto_in_aw_bits_size; 
  wire [1:0] axi4buf_auto_in_aw_bits_burst; 
  wire  axi4buf_auto_in_w_ready; 
  wire  axi4buf_auto_in_w_valid; 
  wire [63:0] axi4buf_auto_in_w_bits_data; 
  wire [7:0] axi4buf_auto_in_w_bits_strb; 
  wire  axi4buf_auto_in_w_bits_last; 
  wire  axi4buf_auto_in_b_ready; 
  wire  axi4buf_auto_in_b_valid; 
  wire [3:0] axi4buf_auto_in_b_bits_id; 
  wire [1:0] axi4buf_auto_in_b_bits_resp; 
  wire  axi4buf_auto_in_ar_ready; 
  wire  axi4buf_auto_in_ar_valid; 
  wire [3:0] axi4buf_auto_in_ar_bits_id; 
  wire [30:0] axi4buf_auto_in_ar_bits_addr; 
  wire [7:0] axi4buf_auto_in_ar_bits_len; 
  wire [2:0] axi4buf_auto_in_ar_bits_size; 
  wire [1:0] axi4buf_auto_in_ar_bits_burst; 
  wire  axi4buf_auto_in_r_ready; 
  wire  axi4buf_auto_in_r_valid; 
  wire [3:0] axi4buf_auto_in_r_bits_id; 
  wire [63:0] axi4buf_auto_in_r_bits_data; 
  wire [1:0] axi4buf_auto_in_r_bits_resp; 
  wire  axi4buf_auto_in_r_bits_last; 
  wire  axi4buf_auto_out_aw_ready; 
  wire  axi4buf_auto_out_aw_valid; 
  wire [3:0] axi4buf_auto_out_aw_bits_id; 
  wire [30:0] axi4buf_auto_out_aw_bits_addr; 
  wire [7:0] axi4buf_auto_out_aw_bits_len; 
  wire [2:0] axi4buf_auto_out_aw_bits_size; 
  wire [1:0] axi4buf_auto_out_aw_bits_burst; 
  wire  axi4buf_auto_out_w_ready; 
  wire  axi4buf_auto_out_w_valid; 
  wire [63:0] axi4buf_auto_out_w_bits_data; 
  wire [7:0] axi4buf_auto_out_w_bits_strb; 
  wire  axi4buf_auto_out_w_bits_last; 
  wire  axi4buf_auto_out_b_ready; 
  wire  axi4buf_auto_out_b_valid; 
  wire [3:0] axi4buf_auto_out_b_bits_id; 
  wire [1:0] axi4buf_auto_out_b_bits_resp; 
  wire  axi4buf_auto_out_ar_ready; 
  wire  axi4buf_auto_out_ar_valid; 
  wire [3:0] axi4buf_auto_out_ar_bits_id; 
  wire [30:0] axi4buf_auto_out_ar_bits_addr; 
  wire [7:0] axi4buf_auto_out_ar_bits_len; 
  wire [2:0] axi4buf_auto_out_ar_bits_size; 
  wire [1:0] axi4buf_auto_out_ar_bits_burst; 
  wire  axi4buf_auto_out_r_ready; 
  wire  axi4buf_auto_out_r_valid; 
  wire [3:0] axi4buf_auto_out_r_bits_id; 
  wire [63:0] axi4buf_auto_out_r_bits_data; 
  wire [1:0] axi4buf_auto_out_r_bits_resp; 
  wire  axi4buf_auto_out_r_bits_last; 
  wire  axi4yank_clock; 
  wire  axi4yank_reset; 
  wire  axi4yank_auto_in_aw_ready; 
  wire  axi4yank_auto_in_aw_valid; 
  wire [3:0] axi4yank_auto_in_aw_bits_id; 
  wire [30:0] axi4yank_auto_in_aw_bits_addr; 
  wire [7:0] axi4yank_auto_in_aw_bits_len; 
  wire [2:0] axi4yank_auto_in_aw_bits_size; 
  wire [1:0] axi4yank_auto_in_aw_bits_burst; 
  wire [8:0] axi4yank_auto_in_aw_bits_user; 
  wire  axi4yank_auto_in_w_ready; 
  wire  axi4yank_auto_in_w_valid; 
  wire [63:0] axi4yank_auto_in_w_bits_data; 
  wire [7:0] axi4yank_auto_in_w_bits_strb; 
  wire  axi4yank_auto_in_w_bits_last; 
  wire  axi4yank_auto_in_b_ready; 
  wire  axi4yank_auto_in_b_valid; 
  wire [3:0] axi4yank_auto_in_b_bits_id; 
  wire [1:0] axi4yank_auto_in_b_bits_resp; 
  wire [8:0] axi4yank_auto_in_b_bits_user; 
  wire  axi4yank_auto_in_ar_ready; 
  wire  axi4yank_auto_in_ar_valid; 
  wire [3:0] axi4yank_auto_in_ar_bits_id; 
  wire [30:0] axi4yank_auto_in_ar_bits_addr; 
  wire [7:0] axi4yank_auto_in_ar_bits_len; 
  wire [2:0] axi4yank_auto_in_ar_bits_size; 
  wire [1:0] axi4yank_auto_in_ar_bits_burst; 
  wire [8:0] axi4yank_auto_in_ar_bits_user; 
  wire  axi4yank_auto_in_r_ready; 
  wire  axi4yank_auto_in_r_valid; 
  wire [3:0] axi4yank_auto_in_r_bits_id; 
  wire [63:0] axi4yank_auto_in_r_bits_data; 
  wire [1:0] axi4yank_auto_in_r_bits_resp; 
  wire [8:0] axi4yank_auto_in_r_bits_user; 
  wire  axi4yank_auto_in_r_bits_last; 
  wire  axi4yank_auto_out_aw_ready; 
  wire  axi4yank_auto_out_aw_valid; 
  wire [3:0] axi4yank_auto_out_aw_bits_id; 
  wire [30:0] axi4yank_auto_out_aw_bits_addr; 
  wire [7:0] axi4yank_auto_out_aw_bits_len; 
  wire [2:0] axi4yank_auto_out_aw_bits_size; 
  wire [1:0] axi4yank_auto_out_aw_bits_burst; 
  wire  axi4yank_auto_out_w_ready; 
  wire  axi4yank_auto_out_w_valid; 
  wire [63:0] axi4yank_auto_out_w_bits_data; 
  wire [7:0] axi4yank_auto_out_w_bits_strb; 
  wire  axi4yank_auto_out_w_bits_last; 
  wire  axi4yank_auto_out_b_ready; 
  wire  axi4yank_auto_out_b_valid; 
  wire [3:0] axi4yank_auto_out_b_bits_id; 
  wire [1:0] axi4yank_auto_out_b_bits_resp; 
  wire  axi4yank_auto_out_ar_ready; 
  wire  axi4yank_auto_out_ar_valid; 
  wire [3:0] axi4yank_auto_out_ar_bits_id; 
  wire [30:0] axi4yank_auto_out_ar_bits_addr; 
  wire [7:0] axi4yank_auto_out_ar_bits_len; 
  wire [2:0] axi4yank_auto_out_ar_bits_size; 
  wire [1:0] axi4yank_auto_out_ar_bits_burst; 
  wire  axi4yank_auto_out_r_ready; 
  wire  axi4yank_auto_out_r_valid; 
  wire [3:0] axi4yank_auto_out_r_bits_id; 
  wire [63:0] axi4yank_auto_out_r_bits_data; 
  wire [1:0] axi4yank_auto_out_r_bits_resp; 
  wire  axi4yank_auto_out_r_bits_last; 
  wire  axi4deint_clock; 
  wire  axi4deint_reset; 
  wire  axi4deint_auto_in_aw_ready; 
  wire  axi4deint_auto_in_aw_valid; 
  wire [3:0] axi4deint_auto_in_aw_bits_id; 
  wire [30:0] axi4deint_auto_in_aw_bits_addr; 
  wire [7:0] axi4deint_auto_in_aw_bits_len; 
  wire [2:0] axi4deint_auto_in_aw_bits_size; 
  wire [1:0] axi4deint_auto_in_aw_bits_burst; 
  wire [8:0] axi4deint_auto_in_aw_bits_user; 
  wire  axi4deint_auto_in_w_ready; 
  wire  axi4deint_auto_in_w_valid; 
  wire [63:0] axi4deint_auto_in_w_bits_data; 
  wire [7:0] axi4deint_auto_in_w_bits_strb; 
  wire  axi4deint_auto_in_w_bits_last; 
  wire  axi4deint_auto_in_b_ready; 
  wire  axi4deint_auto_in_b_valid; 
  wire [3:0] axi4deint_auto_in_b_bits_id; 
  wire [1:0] axi4deint_auto_in_b_bits_resp; 
  wire [8:0] axi4deint_auto_in_b_bits_user; 
  wire  axi4deint_auto_in_ar_ready; 
  wire  axi4deint_auto_in_ar_valid; 
  wire [3:0] axi4deint_auto_in_ar_bits_id; 
  wire [30:0] axi4deint_auto_in_ar_bits_addr; 
  wire [7:0] axi4deint_auto_in_ar_bits_len; 
  wire [2:0] axi4deint_auto_in_ar_bits_size; 
  wire [1:0] axi4deint_auto_in_ar_bits_burst; 
  wire [8:0] axi4deint_auto_in_ar_bits_user; 
  wire  axi4deint_auto_in_r_ready; 
  wire  axi4deint_auto_in_r_valid; 
  wire [3:0] axi4deint_auto_in_r_bits_id; 
  wire [63:0] axi4deint_auto_in_r_bits_data; 
  wire [1:0] axi4deint_auto_in_r_bits_resp; 
  wire [8:0] axi4deint_auto_in_r_bits_user; 
  wire  axi4deint_auto_in_r_bits_last; 
  wire  axi4deint_auto_out_aw_ready; 
  wire  axi4deint_auto_out_aw_valid; 
  wire [3:0] axi4deint_auto_out_aw_bits_id; 
  wire [30:0] axi4deint_auto_out_aw_bits_addr; 
  wire [7:0] axi4deint_auto_out_aw_bits_len; 
  wire [2:0] axi4deint_auto_out_aw_bits_size; 
  wire [1:0] axi4deint_auto_out_aw_bits_burst; 
  wire [8:0] axi4deint_auto_out_aw_bits_user; 
  wire  axi4deint_auto_out_w_ready; 
  wire  axi4deint_auto_out_w_valid; 
  wire [63:0] axi4deint_auto_out_w_bits_data; 
  wire [7:0] axi4deint_auto_out_w_bits_strb; 
  wire  axi4deint_auto_out_w_bits_last; 
  wire  axi4deint_auto_out_b_ready; 
  wire  axi4deint_auto_out_b_valid; 
  wire [3:0] axi4deint_auto_out_b_bits_id; 
  wire [1:0] axi4deint_auto_out_b_bits_resp; 
  wire [8:0] axi4deint_auto_out_b_bits_user; 
  wire  axi4deint_auto_out_ar_ready; 
  wire  axi4deint_auto_out_ar_valid; 
  wire [3:0] axi4deint_auto_out_ar_bits_id; 
  wire [30:0] axi4deint_auto_out_ar_bits_addr; 
  wire [7:0] axi4deint_auto_out_ar_bits_len; 
  wire [2:0] axi4deint_auto_out_ar_bits_size; 
  wire [1:0] axi4deint_auto_out_ar_bits_burst; 
  wire [8:0] axi4deint_auto_out_ar_bits_user; 
  wire  axi4deint_auto_out_r_ready; 
  wire  axi4deint_auto_out_r_valid; 
  wire [3:0] axi4deint_auto_out_r_bits_id; 
  wire [63:0] axi4deint_auto_out_r_bits_data; 
  wire [1:0] axi4deint_auto_out_r_bits_resp; 
  wire [8:0] axi4deint_auto_out_r_bits_user; 
  wire  axi4deint_auto_out_r_bits_last; 
  wire  axi4index_auto_in_aw_ready; 
  wire  axi4index_auto_in_aw_valid; 
  wire [3:0] axi4index_auto_in_aw_bits_id; 
  wire [30:0] axi4index_auto_in_aw_bits_addr; 
  wire [7:0] axi4index_auto_in_aw_bits_len; 
  wire [2:0] axi4index_auto_in_aw_bits_size; 
  wire [1:0] axi4index_auto_in_aw_bits_burst; 
  wire [8:0] axi4index_auto_in_aw_bits_user; 
  wire  axi4index_auto_in_w_ready; 
  wire  axi4index_auto_in_w_valid; 
  wire [63:0] axi4index_auto_in_w_bits_data; 
  wire [7:0] axi4index_auto_in_w_bits_strb; 
  wire  axi4index_auto_in_w_bits_last; 
  wire  axi4index_auto_in_b_ready; 
  wire  axi4index_auto_in_b_valid; 
  wire [3:0] axi4index_auto_in_b_bits_id; 
  wire [1:0] axi4index_auto_in_b_bits_resp; 
  wire [8:0] axi4index_auto_in_b_bits_user; 
  wire  axi4index_auto_in_ar_ready; 
  wire  axi4index_auto_in_ar_valid; 
  wire [3:0] axi4index_auto_in_ar_bits_id; 
  wire [30:0] axi4index_auto_in_ar_bits_addr; 
  wire [7:0] axi4index_auto_in_ar_bits_len; 
  wire [2:0] axi4index_auto_in_ar_bits_size; 
  wire [1:0] axi4index_auto_in_ar_bits_burst; 
  wire [8:0] axi4index_auto_in_ar_bits_user; 
  wire  axi4index_auto_in_r_ready; 
  wire  axi4index_auto_in_r_valid; 
  wire [3:0] axi4index_auto_in_r_bits_id; 
  wire [63:0] axi4index_auto_in_r_bits_data; 
  wire [1:0] axi4index_auto_in_r_bits_resp; 
  wire [8:0] axi4index_auto_in_r_bits_user; 
  wire  axi4index_auto_in_r_bits_last; 
  wire  axi4index_auto_out_aw_ready; 
  wire  axi4index_auto_out_aw_valid; 
  wire [3:0] axi4index_auto_out_aw_bits_id; 
  wire [30:0] axi4index_auto_out_aw_bits_addr; 
  wire [7:0] axi4index_auto_out_aw_bits_len; 
  wire [2:0] axi4index_auto_out_aw_bits_size; 
  wire [1:0] axi4index_auto_out_aw_bits_burst; 
  wire [8:0] axi4index_auto_out_aw_bits_user; 
  wire  axi4index_auto_out_w_ready; 
  wire  axi4index_auto_out_w_valid; 
  wire [63:0] axi4index_auto_out_w_bits_data; 
  wire [7:0] axi4index_auto_out_w_bits_strb; 
  wire  axi4index_auto_out_w_bits_last; 
  wire  axi4index_auto_out_b_ready; 
  wire  axi4index_auto_out_b_valid; 
  wire [3:0] axi4index_auto_out_b_bits_id; 
  wire [1:0] axi4index_auto_out_b_bits_resp; 
  wire [8:0] axi4index_auto_out_b_bits_user; 
  wire  axi4index_auto_out_ar_ready; 
  wire  axi4index_auto_out_ar_valid; 
  wire [3:0] axi4index_auto_out_ar_bits_id; 
  wire [30:0] axi4index_auto_out_ar_bits_addr; 
  wire [7:0] axi4index_auto_out_ar_bits_len; 
  wire [2:0] axi4index_auto_out_ar_bits_size; 
  wire [1:0] axi4index_auto_out_ar_bits_burst; 
  wire [8:0] axi4index_auto_out_ar_bits_user; 
  wire  axi4index_auto_out_r_ready; 
  wire  axi4index_auto_out_r_valid; 
  wire [3:0] axi4index_auto_out_r_bits_id; 
  wire [63:0] axi4index_auto_out_r_bits_data; 
  wire [1:0] axi4index_auto_out_r_bits_resp; 
  wire [8:0] axi4index_auto_out_r_bits_user; 
  wire  axi4index_auto_out_r_bits_last; 
  wire  tl2axi4_clock; 
  wire  tl2axi4_reset; 
  wire  tl2axi4_auto_in_a_ready; 
  wire  tl2axi4_auto_in_a_valid; 
  wire [2:0] tl2axi4_auto_in_a_bits_opcode; 
  wire [2:0] tl2axi4_auto_in_a_bits_param; 
  wire [2:0] tl2axi4_auto_in_a_bits_size; 
  wire [4:0] tl2axi4_auto_in_a_bits_source; 
  wire [30:0] tl2axi4_auto_in_a_bits_address; 
  wire [7:0] tl2axi4_auto_in_a_bits_mask; 
  wire [63:0] tl2axi4_auto_in_a_bits_data; 
  wire  tl2axi4_auto_in_a_bits_corrupt; 
  wire  tl2axi4_auto_in_d_ready; 
  wire  tl2axi4_auto_in_d_valid; 
  wire [2:0] tl2axi4_auto_in_d_bits_opcode; 
  wire [2:0] tl2axi4_auto_in_d_bits_size; 
  wire [4:0] tl2axi4_auto_in_d_bits_source; 
  wire  tl2axi4_auto_in_d_bits_denied; 
  wire [63:0] tl2axi4_auto_in_d_bits_data; 
  wire  tl2axi4_auto_in_d_bits_corrupt; 
  wire  tl2axi4_auto_out_aw_ready; 
  wire  tl2axi4_auto_out_aw_valid; 
  wire [3:0] tl2axi4_auto_out_aw_bits_id; 
  wire [30:0] tl2axi4_auto_out_aw_bits_addr; 
  wire [7:0] tl2axi4_auto_out_aw_bits_len; 
  wire [2:0] tl2axi4_auto_out_aw_bits_size; 
  wire [1:0] tl2axi4_auto_out_aw_bits_burst; 
  wire [8:0] tl2axi4_auto_out_aw_bits_user; 
  wire  tl2axi4_auto_out_w_ready; 
  wire  tl2axi4_auto_out_w_valid; 
  wire [63:0] tl2axi4_auto_out_w_bits_data; 
  wire [7:0] tl2axi4_auto_out_w_bits_strb; 
  wire  tl2axi4_auto_out_w_bits_last; 
  wire  tl2axi4_auto_out_b_ready; 
  wire  tl2axi4_auto_out_b_valid; 
  wire [3:0] tl2axi4_auto_out_b_bits_id; 
  wire [1:0] tl2axi4_auto_out_b_bits_resp; 
  wire [8:0] tl2axi4_auto_out_b_bits_user; 
  wire  tl2axi4_auto_out_ar_ready; 
  wire  tl2axi4_auto_out_ar_valid; 
  wire [3:0] tl2axi4_auto_out_ar_bits_id; 
  wire [30:0] tl2axi4_auto_out_ar_bits_addr; 
  wire [7:0] tl2axi4_auto_out_ar_bits_len; 
  wire [2:0] tl2axi4_auto_out_ar_bits_size; 
  wire [1:0] tl2axi4_auto_out_ar_bits_burst; 
  wire [8:0] tl2axi4_auto_out_ar_bits_user; 
  wire  tl2axi4_auto_out_r_ready; 
  wire  tl2axi4_auto_out_r_valid; 
  wire [3:0] tl2axi4_auto_out_r_bits_id; 
  wire [63:0] tl2axi4_auto_out_r_bits_data; 
  wire [1:0] tl2axi4_auto_out_r_bits_resp; 
  wire [8:0] tl2axi4_auto_out_r_bits_user; 
  wire  tl2axi4_auto_out_r_bits_last; 
  wire  axi4buf_1_clock; 
  wire  axi4buf_1_reset; 
  wire  axi4buf_1_auto_in_aw_ready; 
  wire  axi4buf_1_auto_in_aw_valid; 
  wire [37:0] axi4buf_1_auto_in_aw_bits_addr; 
  wire  axi4buf_1_auto_in_w_ready; 
  wire  axi4buf_1_auto_in_w_valid; 
  wire [31:0] axi4buf_1_auto_in_w_bits_data; 
  wire [3:0] axi4buf_1_auto_in_w_bits_strb; 
  wire  axi4buf_1_auto_in_b_ready; 
  wire  axi4buf_1_auto_in_b_valid; 
  wire [1:0] axi4buf_1_auto_in_b_bits_resp; 
  wire  axi4buf_1_auto_in_ar_ready; 
  wire  axi4buf_1_auto_in_ar_valid; 
  wire [37:0] axi4buf_1_auto_in_ar_bits_addr; 
  wire  axi4buf_1_auto_in_r_ready; 
  wire  axi4buf_1_auto_in_r_valid; 
  wire [31:0] axi4buf_1_auto_in_r_bits_data; 
  wire [1:0] axi4buf_1_auto_in_r_bits_resp; 
  wire  axi4buf_1_auto_in_r_bits_last; 
  wire  axi4buf_1_auto_out_aw_ready; 
  wire  axi4buf_1_auto_out_aw_valid; 
  wire [37:0] axi4buf_1_auto_out_aw_bits_addr; 
  wire  axi4buf_1_auto_out_w_ready; 
  wire  axi4buf_1_auto_out_w_valid; 
  wire [31:0] axi4buf_1_auto_out_w_bits_data; 
  wire [3:0] axi4buf_1_auto_out_w_bits_strb; 
  wire  axi4buf_1_auto_out_b_ready; 
  wire  axi4buf_1_auto_out_b_valid; 
  wire [1:0] axi4buf_1_auto_out_b_bits_resp; 
  wire  axi4buf_1_auto_out_ar_ready; 
  wire  axi4buf_1_auto_out_ar_valid; 
  wire [37:0] axi4buf_1_auto_out_ar_bits_addr; 
  wire  axi4buf_1_auto_out_r_ready; 
  wire  axi4buf_1_auto_out_r_valid; 
  wire [31:0] axi4buf_1_auto_out_r_bits_data; 
  wire [1:0] axi4buf_1_auto_out_r_bits_resp; 
  wire  axi4yank_1_clock; 
  wire  axi4yank_1_reset; 
  wire  axi4yank_1_auto_in_aw_ready; 
  wire  axi4yank_1_auto_in_aw_valid; 
  wire [37:0] axi4yank_1_auto_in_aw_bits_addr; 
  wire [13:0] axi4yank_1_auto_in_aw_bits_user; 
  wire  axi4yank_1_auto_in_w_ready; 
  wire  axi4yank_1_auto_in_w_valid; 
  wire [31:0] axi4yank_1_auto_in_w_bits_data; 
  wire [3:0] axi4yank_1_auto_in_w_bits_strb; 
  wire  axi4yank_1_auto_in_b_ready; 
  wire  axi4yank_1_auto_in_b_valid; 
  wire [1:0] axi4yank_1_auto_in_b_bits_resp; 
  wire [13:0] axi4yank_1_auto_in_b_bits_user; 
  wire  axi4yank_1_auto_in_ar_ready; 
  wire  axi4yank_1_auto_in_ar_valid; 
  wire [37:0] axi4yank_1_auto_in_ar_bits_addr; 
  wire [13:0] axi4yank_1_auto_in_ar_bits_user; 
  wire  axi4yank_1_auto_in_r_ready; 
  wire  axi4yank_1_auto_in_r_valid; 
  wire [31:0] axi4yank_1_auto_in_r_bits_data; 
  wire [1:0] axi4yank_1_auto_in_r_bits_resp; 
  wire [13:0] axi4yank_1_auto_in_r_bits_user; 
  wire  axi4yank_1_auto_in_r_bits_last; 
  wire  axi4yank_1_auto_out_aw_ready; 
  wire  axi4yank_1_auto_out_aw_valid; 
  wire [37:0] axi4yank_1_auto_out_aw_bits_addr; 
  wire  axi4yank_1_auto_out_w_ready; 
  wire  axi4yank_1_auto_out_w_valid; 
  wire [31:0] axi4yank_1_auto_out_w_bits_data; 
  wire [3:0] axi4yank_1_auto_out_w_bits_strb; 
  wire  axi4yank_1_auto_out_b_ready; 
  wire  axi4yank_1_auto_out_b_valid; 
  wire [1:0] axi4yank_1_auto_out_b_bits_resp; 
  wire  axi4yank_1_auto_out_ar_ready; 
  wire  axi4yank_1_auto_out_ar_valid; 
  wire [37:0] axi4yank_1_auto_out_ar_bits_addr; 
  wire  axi4yank_1_auto_out_r_ready; 
  wire  axi4yank_1_auto_out_r_valid; 
  wire [31:0] axi4yank_1_auto_out_r_bits_data; 
  wire [1:0] axi4yank_1_auto_out_r_bits_resp; 
  wire  axi4yank_1_auto_out_r_bits_last; 
  wire  tl2axi4_1_clock; 
  wire  tl2axi4_1_reset; 
  wire  tl2axi4_1_auto_in_a_ready; 
  wire  tl2axi4_1_auto_in_a_valid; 
  wire [2:0] tl2axi4_1_auto_in_a_bits_opcode; 
  wire [2:0] tl2axi4_1_auto_in_a_bits_param; 
  wire [1:0] tl2axi4_1_auto_in_a_bits_size; 
  wire [9:0] tl2axi4_1_auto_in_a_bits_source; 
  wire [37:0] tl2axi4_1_auto_in_a_bits_address; 
  wire [3:0] tl2axi4_1_auto_in_a_bits_mask; 
  wire [31:0] tl2axi4_1_auto_in_a_bits_data; 
  wire  tl2axi4_1_auto_in_a_bits_corrupt; 
  wire  tl2axi4_1_auto_in_d_ready; 
  wire  tl2axi4_1_auto_in_d_valid; 
  wire [2:0] tl2axi4_1_auto_in_d_bits_opcode; 
  wire [1:0] tl2axi4_1_auto_in_d_bits_size; 
  wire [9:0] tl2axi4_1_auto_in_d_bits_source; 
  wire  tl2axi4_1_auto_in_d_bits_denied; 
  wire [31:0] tl2axi4_1_auto_in_d_bits_data; 
  wire  tl2axi4_1_auto_in_d_bits_corrupt; 
  wire  tl2axi4_1_auto_out_aw_ready; 
  wire  tl2axi4_1_auto_out_aw_valid; 
  wire [37:0] tl2axi4_1_auto_out_aw_bits_addr; 
  wire [13:0] tl2axi4_1_auto_out_aw_bits_user; 
  wire  tl2axi4_1_auto_out_w_ready; 
  wire  tl2axi4_1_auto_out_w_valid; 
  wire [31:0] tl2axi4_1_auto_out_w_bits_data; 
  wire [3:0] tl2axi4_1_auto_out_w_bits_strb; 
  wire  tl2axi4_1_auto_out_b_ready; 
  wire  tl2axi4_1_auto_out_b_valid; 
  wire [1:0] tl2axi4_1_auto_out_b_bits_resp; 
  wire [13:0] tl2axi4_1_auto_out_b_bits_user; 
  wire  tl2axi4_1_auto_out_ar_ready; 
  wire  tl2axi4_1_auto_out_ar_valid; 
  wire [37:0] tl2axi4_1_auto_out_ar_bits_addr; 
  wire [13:0] tl2axi4_1_auto_out_ar_bits_user; 
  wire  tl2axi4_1_auto_out_r_ready; 
  wire  tl2axi4_1_auto_out_r_valid; 
  wire [31:0] tl2axi4_1_auto_out_r_bits_data; 
  wire [1:0] tl2axi4_1_auto_out_r_bits_resp; 
  wire [13:0] tl2axi4_1_auto_out_r_bits_user; 
  wire  tl2axi4_1_auto_out_r_bits_last; 
  wire  fragmenter_clock; 
  wire  fragmenter_reset; 
  wire  fragmenter_auto_in_a_ready; 
  wire  fragmenter_auto_in_a_valid; 
  wire [2:0] fragmenter_auto_in_a_bits_opcode; 
  wire [2:0] fragmenter_auto_in_a_bits_param; 
  wire [2:0] fragmenter_auto_in_a_bits_size; 
  wire [4:0] fragmenter_auto_in_a_bits_source; 
  wire [37:0] fragmenter_auto_in_a_bits_address; 
  wire [3:0] fragmenter_auto_in_a_bits_mask; 
  wire [31:0] fragmenter_auto_in_a_bits_data; 
  wire  fragmenter_auto_in_a_bits_corrupt; 
  wire  fragmenter_auto_in_d_ready; 
  wire  fragmenter_auto_in_d_valid; 
  wire [2:0] fragmenter_auto_in_d_bits_opcode; 
  wire [2:0] fragmenter_auto_in_d_bits_size; 
  wire [4:0] fragmenter_auto_in_d_bits_source; 
  wire  fragmenter_auto_in_d_bits_denied; 
  wire [31:0] fragmenter_auto_in_d_bits_data; 
  wire  fragmenter_auto_in_d_bits_corrupt; 
  wire  fragmenter_auto_out_a_ready; 
  wire  fragmenter_auto_out_a_valid; 
  wire [2:0] fragmenter_auto_out_a_bits_opcode; 
  wire [2:0] fragmenter_auto_out_a_bits_param; 
  wire [1:0] fragmenter_auto_out_a_bits_size; 
  wire [9:0] fragmenter_auto_out_a_bits_source; 
  wire [37:0] fragmenter_auto_out_a_bits_address; 
  wire [3:0] fragmenter_auto_out_a_bits_mask; 
  wire [31:0] fragmenter_auto_out_a_bits_data; 
  wire  fragmenter_auto_out_a_bits_corrupt; 
  wire  fragmenter_auto_out_d_ready; 
  wire  fragmenter_auto_out_d_valid; 
  wire [2:0] fragmenter_auto_out_d_bits_opcode; 
  wire [1:0] fragmenter_auto_out_d_bits_size; 
  wire [9:0] fragmenter_auto_out_d_bits_source; 
  wire  fragmenter_auto_out_d_bits_denied; 
  wire [31:0] fragmenter_auto_out_d_bits_data; 
  wire  fragmenter_auto_out_d_bits_corrupt; 
  wire  widget_clock; 
  wire  widget_reset; 
  wire  widget_auto_in_a_ready; 
  wire  widget_auto_in_a_valid; 
  wire [2:0] widget_auto_in_a_bits_opcode; 
  wire [2:0] widget_auto_in_a_bits_param; 
  wire [2:0] widget_auto_in_a_bits_size; 
  wire [3:0] widget_auto_in_a_bits_source; 
  wire [37:0] widget_auto_in_a_bits_address; 
  wire [7:0] widget_auto_in_a_bits_mask; 
  wire [63:0] widget_auto_in_a_bits_data; 
  wire  widget_auto_in_a_bits_corrupt; 
  wire  widget_auto_in_d_ready; 
  wire  widget_auto_in_d_valid; 
  wire [3:0] widget_auto_in_d_bits_source; 
  wire [2:0] widget_auto_in_d_bits_opcode; 
  wire [2:0] widget_auto_in_d_bits_size; 
  wire  widget_auto_in_d_bits_denied; 
  wire [63:0] widget_auto_in_d_bits_data; 
  wire  widget_auto_in_d_bits_corrupt; 
  wire  widget_auto_out_a_ready; 
  wire  widget_auto_out_a_valid; 
  wire [2:0] widget_auto_out_a_bits_opcode; 
  wire [2:0] widget_auto_out_a_bits_param; 
  wire [2:0] widget_auto_out_a_bits_size; 
  wire [3:0] widget_auto_out_a_bits_source; 
  wire [37:0] widget_auto_out_a_bits_address; 
  wire [7:0] widget_auto_out_a_bits_mask; 
  wire [63:0] widget_auto_out_a_bits_data; 
  wire  widget_auto_out_a_bits_corrupt; 
  wire  widget_auto_out_d_ready; 
  wire  widget_auto_out_d_valid; 
  wire [2:0] widget_auto_out_d_bits_opcode; 
  wire [1:0] widget_auto_out_d_bits_param; 
  wire [2:0] widget_auto_out_d_bits_size; 
  wire [3:0] widget_auto_out_d_bits_source; 
  wire [2:0] widget_auto_out_d_bits_sink; 
  wire  widget_auto_out_d_bits_denied; 
  wire [63:0] widget_auto_out_d_bits_data; 
  wire  widget_auto_out_d_bits_corrupt; 
  wire  axi42tl_clock; 
  wire  axi42tl_reset; 
  wire  axi42tl_auto_in_aw_ready; 
  wire  axi42tl_auto_in_aw_valid; 

  wire [15:0] qspi_axi_master_addr_msb_16;
  wire [15:0] chiplink_master_addr_msb_16;
  wire [9:0] axi42tl_auto_in_tl_addr_msb_10;
  wire [4:0] axi42tl_auto_in_aw_bits_id; 
  wire [32:0] axi42tl_auto_in_aw_bits_addr;
  wire [5:0] axi42tl_auto_in_aw_addr_msb_6;
  wire [7:0] axi42tl_auto_in_aw_bits_len; 
  wire [2:0] axi42tl_auto_in_aw_bits_size; 
  wire  axi42tl_auto_in_w_ready; 
  wire  axi42tl_auto_in_w_valid; 
  wire [63:0] axi42tl_auto_in_w_bits_data; 
  wire [7:0] axi42tl_auto_in_w_bits_strb; 
  wire  axi42tl_auto_in_w_bits_last; 
  wire  axi42tl_auto_in_b_ready; 
  wire  axi42tl_auto_in_b_valid; 
  wire [4:0] axi42tl_auto_in_b_bits_id;
  wire [1:0] axi42tl_auto_in_b_bits_resp; 
  wire  axi42tl_auto_in_ar_ready; 
  wire  axi42tl_auto_in_ar_valid; 
  wire [4:0] axi42tl_auto_in_ar_bits_id; 
  wire [32:0] axi42tl_auto_in_ar_bits_addr; 
  wire [5:0] axi42tl_auto_in_ar_addr_msb_6;
  wire [7:0] axi42tl_auto_in_ar_bits_len; 
  wire [2:0] axi42tl_auto_in_ar_bits_size; 
  wire  axi42tl_auto_in_r_ready; 
  wire  axi42tl_auto_in_r_valid; 
  wire [4:0] axi42tl_auto_in_r_bits_id; 
  wire [63:0] axi42tl_auto_in_r_bits_data; 
  wire [1:0] axi42tl_auto_in_r_bits_resp; 
  wire  axi42tl_auto_in_r_bits_last; 
  wire  axi42tl_auto_out_a_ready; 
  wire  axi42tl_auto_out_a_valid; 
  wire [2:0] axi42tl_auto_out_a_bits_opcode; 
  wire [2:0] axi42tl_auto_out_a_bits_param; 
  wire [2:0] axi42tl_auto_out_a_bits_size; 
  wire [3:0] axi42tl_auto_out_a_bits_source; 
  wire [31:0] axi42tl_auto_out_a_bits_address; 
  wire [7:0] axi42tl_auto_out_a_bits_mask; 
  wire [63:0] axi42tl_auto_out_a_bits_data; 
  wire  axi42tl_auto_out_a_bits_corrupt; 
  wire  axi42tl_auto_out_d_ready; 
  wire  axi42tl_auto_out_d_valid; 
  wire [3:0] axi42tl_auto_out_d_bits_source; 
  wire [2:0] axi42tl_auto_out_d_bits_opcode; 
  wire [2:0] axi42tl_auto_out_d_bits_size; 
  wire  axi42tl_auto_out_d_bits_denied; 
  wire [63:0] axi42tl_auto_out_d_bits_data; 
  wire  axi42tl_auto_out_d_bits_corrupt; 
  wire  axi4yank_2_clock; 
  wire  axi4yank_2_reset; 
  wire  axi4yank_2_auto_in_aw_ready; 
  wire  axi4yank_2_auto_in_aw_valid; 
  wire  axi4yank_2_auto_in_aw_bits_id; 
  wire [37:0] axi4yank_2_auto_in_aw_bits_addr; 
  wire [7:0] axi4yank_2_auto_in_aw_bits_len; 
  wire [2:0] axi4yank_2_auto_in_aw_bits_size; 
  wire [6:0] axi4yank_2_auto_in_aw_bits_echo_extra_id; 
  wire  axi4yank_2_auto_in_w_ready; 
  wire  axi4yank_2_auto_in_w_valid; 
  wire [63:0] axi4yank_2_auto_in_w_bits_data; 
  wire [7:0] axi4yank_2_auto_in_w_bits_strb; 
  wire  axi4yank_2_auto_in_w_bits_last; 
  wire  axi4yank_2_auto_in_b_ready; 
  wire  axi4yank_2_auto_in_b_valid; 
  wire  axi4yank_2_auto_in_b_bits_id; 
  wire [1:0] axi4yank_2_auto_in_b_bits_resp; 
  wire [6:0] axi4yank_2_auto_in_b_bits_echo_extra_id;
  wire  axi4yank_2_auto_in_ar_ready; 
  wire  axi4yank_2_auto_in_ar_valid; 
  wire  axi4yank_2_auto_in_ar_bits_id; 
  wire [37:0] axi4yank_2_auto_in_ar_bits_addr; 
  wire [7:0] axi4yank_2_auto_in_ar_bits_len; 
  wire [2:0] axi4yank_2_auto_in_ar_bits_size; 
  wire [6:0] axi4yank_2_auto_in_ar_bits_echo_extra_id;
  wire  axi4yank_2_auto_in_r_ready; 
  wire  axi4yank_2_auto_in_r_valid; 
  wire  axi4yank_2_auto_in_r_bits_id; 
  wire [63:0] axi4yank_2_auto_in_r_bits_data; 
  wire [1:0] axi4yank_2_auto_in_r_bits_resp; 
  wire [6:0] axi4yank_2_auto_in_r_bits_echo_extra_id;
  wire  axi4yank_2_auto_in_r_bits_last; 
  wire  axi4yank_2_auto_out_aw_ready; 
  wire  axi4yank_2_auto_out_aw_valid; 
  wire  axi4yank_2_auto_out_aw_bits_id; 
  wire [37:0] axi4yank_2_auto_out_aw_bits_addr; 
  wire [7:0] axi4yank_2_auto_out_aw_bits_len; 
  wire [2:0] axi4yank_2_auto_out_aw_bits_size; 
  wire  axi4yank_2_auto_out_w_ready; 
  wire  axi4yank_2_auto_out_w_valid; 
  wire [63:0] axi4yank_2_auto_out_w_bits_data; 
  wire [7:0] axi4yank_2_auto_out_w_bits_strb; 
  wire  axi4yank_2_auto_out_w_bits_last; 
  wire  axi4yank_2_auto_out_b_ready; 
  wire  axi4yank_2_auto_out_b_valid; 
  wire [1:0] axi4yank_2_auto_out_b_bits_resp; 
  wire axi4yank_2_auto_out_b_bits_id; 
  wire  axi4yank_2_auto_out_ar_ready; 
  wire  axi4yank_2_auto_out_ar_valid; 
  wire  axi4yank_2_auto_out_ar_bits_id; 
  wire [37:0] axi4yank_2_auto_out_ar_bits_addr; 
  wire [7:0] axi4yank_2_auto_out_ar_bits_len; 
  wire [2:0] axi4yank_2_auto_out_ar_bits_size; 
  wire  axi4yank_2_auto_out_r_ready; 
  wire  axi4yank_2_auto_out_r_valid; 
  wire [63:0] axi4yank_2_auto_out_r_bits_data; 
  wire [1:0] axi4yank_2_auto_out_r_bits_resp; 
  wire axi4yank_2_auto_out_r_bits_id; 
  wire  axi4yank_2_auto_out_r_bits_last; 
  wire  axi4frag_clock; 
  wire  axi4frag_reset; 
  wire  axi4frag_auto_in_aw_ready; 
  wire  axi4frag_auto_in_aw_valid; 
  wire [37:0] axi4frag_auto_in_aw_bits_addr; 
  wire [7:0] axi4frag_auto_in_aw_bits_len; 
  wire [2:0] axi4frag_auto_in_aw_bits_size; 
  wire [1:0] axi4frag_auto_in_aw_bits_burst; 
  wire  axi4frag_auto_in_w_ready; 
  wire  axi4frag_auto_in_w_valid; 
  wire [63:0] axi4frag_auto_in_w_bits_data; 
  wire [7:0] axi4frag_auto_in_w_bits_strb; 
  wire  axi4frag_auto_in_w_bits_last; 
  wire  axi4frag_auto_in_b_ready; 
  wire  axi4frag_auto_in_b_valid; 
  wire [1:0] axi4frag_auto_in_b_bits_resp; 
  wire  axi4frag_auto_in_ar_ready; 
  wire  axi4frag_auto_in_ar_valid; 
  wire [37:0] axi4frag_auto_in_ar_bits_addr; 
  wire [7:0] axi4frag_auto_in_ar_bits_len; 
  wire [2:0] axi4frag_auto_in_ar_bits_size; 
  wire [1:0] axi4frag_auto_in_ar_bits_burst; 
  wire  axi4frag_auto_in_r_ready; 
  wire  axi4frag_auto_in_r_valid; 
  wire [63:0] axi4frag_auto_in_r_bits_data; 
  wire [1:0] axi4frag_auto_in_r_bits_resp; 
  wire  axi4frag_auto_in_r_bits_last; 

  wire  axi4frag_auto_out_awready; 
  wire  axi4frag_auto_out_awvalid; 
  wire  axi4frag_auto_out_awid; 
  wire [37:0] axi4frag_auto_out_awaddr; 
  wire [7:0] axi4frag_auto_out_awlen; 
  wire [2:0] axi4frag_auto_out_awsize; 
  wire [1:0] axi4frag_auto_out_awburst_unused; 
  wire [6:0] axi4frag_auto_out_awecho_extra_id; 
  wire axi4frag_auto_out_awecho_real_last;
  wire  axi4frag_auto_out_wready; 
  wire  axi4frag_auto_out_wvalid; 
  wire [63:0] axi4frag_auto_out_wdata; 
  wire [7:0] axi4frag_auto_out_wstrb; 
  wire  axi4frag_auto_out_wlast; 
  wire  axi4frag_auto_out_bready; 
  wire  axi4frag_auto_out_bvalid;  
  wire  axi4frag_auto_out_bid; 
  wire [1:0] axi4frag_auto_out_bresp; 
  wire [6:0] axi4frag_auto_out_becho_extra_id;
  wire axi4frag_auto_out_becho_real_last;
  wire  axi4frag_auto_out_arready; 
  wire  axi4frag_auto_out_arvalid; 
  wire  axi4frag_auto_out_arid;
  wire [37:0] axi4frag_auto_out_araddr; 


  wire [7:0] axi4frag_auto_out_arlen; 
  wire [2:0] axi4frag_auto_out_arsize; 
  wire [1:0] axi4frag_auto_out_arburst_unused; 
  wire [6:0] axi4frag_auto_out_arecho_extra_id; 
  wire axi4frag_auto_out_arecho_real_last;
  wire  axi4frag_auto_out_rready; 
  wire  axi4frag_auto_out_rvalid;  
  wire  axi4frag_auto_out_rid; 
  wire [63:0] axi4frag_auto_out_rdata; 
  wire [1:0] axi4frag_auto_out_rresp; 
  wire [6:0] axi4frag_auto_out_recho_extra_id; 
  wire axi4frag_auto_out_recho_real_last;
  wire  axi4frag_auto_out_rlast; 


  wire  axi4frag_axi4yank_master_bus_awready; 
  wire  axi4frag_axi4yank_master_bus_awvalid; 
  wire  axi4frag_axi4yank_master_bus_awid; 
  wire [37:0] axi4frag_axi4yank_master_bus_awaddr; 
  wire [7:0] axi4frag_axi4yank_master_bus_awlen; 
  wire [2:0] axi4frag_axi4yank_master_bus_awsize; 
  wire [6:0] axi4frag_axi4yank_master_bus_awecho_extra_id; 
  wire axi4frag_axi4yank_master_bus_awecho_real_last;
  wire  axi4frag_axi4yank_master_bus_wready; 
  wire  axi4frag_axi4yank_master_bus_wvalid; 
  wire [63:0] axi4frag_axi4yank_master_bus_wdata; 
  wire [7:0] axi4frag_axi4yank_master_bus_wstrb; 
  wire  axi4frag_axi4yank_master_bus_wlast; 
  wire  axi4frag_axi4yank_master_bus_bready; 
  wire  axi4frag_axi4yank_master_bus_bvalid;  
  wire  axi4frag_axi4yank_master_bus_bid; 
  wire [1:0] axi4frag_axi4yank_master_bus_bresp; 
  wire [6:0] axi4frag_axi4yank_master_bus_becho_extra_id;
  wire axi4frag_axi4yank_master_bus_becho_real_last;
  wire  axi4frag_axi4yank_master_bus_arready; 
  wire  axi4frag_axi4yank_master_bus_arvalid; 
  wire  axi4frag_axi4yank_master_bus_arid;
  wire [37:0] axi4frag_axi4yank_master_bus_araddr; 
  wire [7:0] axi4frag_axi4yank_master_bus_arlen; 
  wire [2:0] axi4frag_axi4yank_master_bus_arsize; 
  wire [6:0] axi4frag_axi4yank_master_bus_arecho_extra_id; 
  wire axi4frag_axi4yank_master_bus_arecho_real_last;
  wire  axi4frag_axi4yank_master_bus_rready; 
  wire  axi4frag_axi4yank_master_bus_rvalid;  
  wire  axi4frag_axi4yank_master_bus_rid; 
  wire [63:0] axi4frag_axi4yank_master_bus_rdata; 
  wire [1:0] axi4frag_axi4yank_master_bus_rresp; 
  wire [6:0] axi4frag_axi4yank_master_bus_recho_extra_id; 
  wire axi4frag_axi4yank_master_bus_recho_real_last;
  wire  axi4frag_axi4yank_master_bus_rlast; 

  wire  asink_clock; 
  wire  asink_reset; 
  wire [2:0] asink_auto_in_a_mem_0_opcode; 
  wire [2:0] asink_auto_in_a_mem_0_param; 
  wire [2:0] asink_auto_in_a_mem_0_size; 
  wire [4:0] asink_auto_in_a_mem_0_source; 
  wire [30:0] asink_auto_in_a_mem_0_address; 
  wire [7:0] asink_auto_in_a_mem_0_mask; 
  wire [63:0] asink_auto_in_a_mem_0_data; 
  wire  asink_auto_in_a_mem_0_corrupt; 
  wire [2:0] asink_auto_in_a_mem_1_opcode; 
  wire [2:0] asink_auto_in_a_mem_1_param; 
  wire [2:0] asink_auto_in_a_mem_1_size; 
  wire [4:0] asink_auto_in_a_mem_1_source; 
  wire [30:0] asink_auto_in_a_mem_1_address; 
  wire [7:0] asink_auto_in_a_mem_1_mask; 
  wire [63:0] asink_auto_in_a_mem_1_data; 
  wire  asink_auto_in_a_mem_1_corrupt; 
  wire [2:0] asink_auto_in_a_mem_2_opcode; 
  wire [2:0] asink_auto_in_a_mem_2_param; 
  wire [2:0] asink_auto_in_a_mem_2_size; 
  wire [4:0] asink_auto_in_a_mem_2_source; 
  wire [30:0] asink_auto_in_a_mem_2_address; 
  wire [7:0] asink_auto_in_a_mem_2_mask; 
  wire [63:0] asink_auto_in_a_mem_2_data; 
  wire  asink_auto_in_a_mem_2_corrupt; 
  wire [2:0] asink_auto_in_a_mem_3_opcode; 
  wire [2:0] asink_auto_in_a_mem_3_param; 
  wire [2:0] asink_auto_in_a_mem_3_size; 
  wire [4:0] asink_auto_in_a_mem_3_source; 
  wire [30:0] asink_auto_in_a_mem_3_address; 
  wire [7:0] asink_auto_in_a_mem_3_mask; 
  wire [63:0] asink_auto_in_a_mem_3_data; 
  wire  asink_auto_in_a_mem_3_corrupt; 
  wire [2:0] asink_auto_in_a_mem_4_opcode; 
  wire [2:0] asink_auto_in_a_mem_4_param; 
  wire [2:0] asink_auto_in_a_mem_4_size; 
  wire [4:0] asink_auto_in_a_mem_4_source; 
  wire [30:0] asink_auto_in_a_mem_4_address; 
  wire [7:0] asink_auto_in_a_mem_4_mask; 
  wire [63:0] asink_auto_in_a_mem_4_data; 
  wire  asink_auto_in_a_mem_4_corrupt; 
  wire [2:0] asink_auto_in_a_mem_5_opcode; 
  wire [2:0] asink_auto_in_a_mem_5_param; 
  wire [2:0] asink_auto_in_a_mem_5_size; 
  wire [4:0] asink_auto_in_a_mem_5_source; 
  wire [30:0] asink_auto_in_a_mem_5_address; 
  wire [7:0] asink_auto_in_a_mem_5_mask; 
  wire [63:0] asink_auto_in_a_mem_5_data; 
  wire  asink_auto_in_a_mem_5_corrupt; 
  wire [2:0] asink_auto_in_a_mem_6_opcode; 
  wire [2:0] asink_auto_in_a_mem_6_param; 
  wire [2:0] asink_auto_in_a_mem_6_size; 
  wire [4:0] asink_auto_in_a_mem_6_source; 
  wire [30:0] asink_auto_in_a_mem_6_address; 
  wire [7:0] asink_auto_in_a_mem_6_mask; 
  wire [63:0] asink_auto_in_a_mem_6_data; 
  wire  asink_auto_in_a_mem_6_corrupt; 
  wire [2:0] asink_auto_in_a_mem_7_opcode; 
  wire [2:0] asink_auto_in_a_mem_7_param; 
  wire [2:0] asink_auto_in_a_mem_7_size; 
  wire [4:0] asink_auto_in_a_mem_7_source; 
  wire [30:0] asink_auto_in_a_mem_7_address; 
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
  wire [4:0] asink_auto_in_d_mem_0_source; 
  wire  asink_auto_in_d_mem_0_sink; 
  wire  asink_auto_in_d_mem_0_denied; 
  wire [63:0] asink_auto_in_d_mem_0_data; 
  wire  asink_auto_in_d_mem_0_corrupt; 
  wire [2:0] asink_auto_in_d_mem_1_opcode; 
  wire [1:0] asink_auto_in_d_mem_1_param; 
  wire [2:0] asink_auto_in_d_mem_1_size; 
  wire [4:0] asink_auto_in_d_mem_1_source; 
  wire  asink_auto_in_d_mem_1_sink; 
  wire  asink_auto_in_d_mem_1_denied; 
  wire [63:0] asink_auto_in_d_mem_1_data; 
  wire  asink_auto_in_d_mem_1_corrupt; 
  wire [2:0] asink_auto_in_d_mem_2_opcode; 
  wire [1:0] asink_auto_in_d_mem_2_param; 
  wire [2:0] asink_auto_in_d_mem_2_size; 
  wire [4:0] asink_auto_in_d_mem_2_source; 
  wire  asink_auto_in_d_mem_2_sink; 
  wire  asink_auto_in_d_mem_2_denied; 
  wire [63:0] asink_auto_in_d_mem_2_data; 
  wire  asink_auto_in_d_mem_2_corrupt; 
  wire [2:0] asink_auto_in_d_mem_3_opcode; 
  wire [1:0] asink_auto_in_d_mem_3_param; 
  wire [2:0] asink_auto_in_d_mem_3_size; 
  wire [4:0] asink_auto_in_d_mem_3_source; 
  wire  asink_auto_in_d_mem_3_sink; 
  wire  asink_auto_in_d_mem_3_denied; 
  wire [63:0] asink_auto_in_d_mem_3_data; 
  wire  asink_auto_in_d_mem_3_corrupt; 
  wire [2:0] asink_auto_in_d_mem_4_opcode; 
  wire [1:0] asink_auto_in_d_mem_4_param; 
  wire [2:0] asink_auto_in_d_mem_4_size; 
  wire [4:0] asink_auto_in_d_mem_4_source; 
  wire  asink_auto_in_d_mem_4_sink; 
  wire  asink_auto_in_d_mem_4_denied; 
  wire [63:0] asink_auto_in_d_mem_4_data; 
  wire  asink_auto_in_d_mem_4_corrupt; 
  wire [2:0] asink_auto_in_d_mem_5_opcode; 
  wire [1:0] asink_auto_in_d_mem_5_param; 
  wire [2:0] asink_auto_in_d_mem_5_size; 
  wire [4:0] asink_auto_in_d_mem_5_source; 
  wire  asink_auto_in_d_mem_5_sink; 
  wire  asink_auto_in_d_mem_5_denied; 
  wire [63:0] asink_auto_in_d_mem_5_data; 
  wire  asink_auto_in_d_mem_5_corrupt; 
  wire [2:0] asink_auto_in_d_mem_6_opcode; 
  wire [1:0] asink_auto_in_d_mem_6_param; 
  wire [2:0] asink_auto_in_d_mem_6_size; 
  wire [4:0] asink_auto_in_d_mem_6_source; 
  wire  asink_auto_in_d_mem_6_sink; 
  wire  asink_auto_in_d_mem_6_denied; 
  wire [63:0] asink_auto_in_d_mem_6_data; 
  wire  asink_auto_in_d_mem_6_corrupt; 
  wire [2:0] asink_auto_in_d_mem_7_opcode; 
  wire [1:0] asink_auto_in_d_mem_7_param; 
  wire [2:0] asink_auto_in_d_mem_7_size; 
  wire [4:0] asink_auto_in_d_mem_7_source; 
  wire  asink_auto_in_d_mem_7_sink; 
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
  wire [4:0] asink_auto_out_a_bits_source; 
  wire [30:0] asink_auto_out_a_bits_address; 
  wire [7:0] asink_auto_out_a_bits_mask; 
  wire [63:0] asink_auto_out_a_bits_data; 
  wire  asink_auto_out_a_bits_corrupt; 
  wire  asink_auto_out_d_ready; 
  wire  asink_auto_out_d_valid; 
  wire [2:0] asink_auto_out_d_bits_opcode; 
  wire [2:0] asink_auto_out_d_bits_size; 
  wire [4:0] asink_auto_out_d_bits_source; 
  wire  asink_auto_out_d_bits_denied; 
  wire [63:0] asink_auto_out_d_bits_data; 
  wire  asink_auto_out_d_bits_corrupt; 
  wire  asink_1_clock; 
  wire  asink_1_reset; 
  wire [2:0] asink_1_auto_in_a_mem_0_opcode; 
  wire [2:0] asink_1_auto_in_a_mem_0_param; 
  wire [2:0] asink_1_auto_in_a_mem_0_size; 
  wire [4:0] asink_1_auto_in_a_mem_0_source; 
  wire [37:0] asink_1_auto_in_a_mem_0_address; 
  wire [3:0] asink_1_auto_in_a_mem_0_mask; 
  wire [31:0] asink_1_auto_in_a_mem_0_data; 
  wire  asink_1_auto_in_a_mem_0_corrupt; 
  wire [2:0] asink_1_auto_in_a_mem_1_opcode; 
  wire [2:0] asink_1_auto_in_a_mem_1_param; 
  wire [2:0] asink_1_auto_in_a_mem_1_size; 
  wire [4:0] asink_1_auto_in_a_mem_1_source; 
  wire [37:0] asink_1_auto_in_a_mem_1_address; 
  wire [3:0] asink_1_auto_in_a_mem_1_mask; 
  wire [31:0] asink_1_auto_in_a_mem_1_data; 
  wire  asink_1_auto_in_a_mem_1_corrupt; 
  wire [2:0] asink_1_auto_in_a_mem_2_opcode; 
  wire [2:0] asink_1_auto_in_a_mem_2_param; 
  wire [2:0] asink_1_auto_in_a_mem_2_size; 
  wire [4:0] asink_1_auto_in_a_mem_2_source; 
  wire [37:0] asink_1_auto_in_a_mem_2_address; 
  wire [3:0] asink_1_auto_in_a_mem_2_mask; 
  wire [31:0] asink_1_auto_in_a_mem_2_data; 
  wire  asink_1_auto_in_a_mem_2_corrupt; 
  wire [2:0] asink_1_auto_in_a_mem_3_opcode; 
  wire [2:0] asink_1_auto_in_a_mem_3_param; 
  wire [2:0] asink_1_auto_in_a_mem_3_size; 
  wire [4:0] asink_1_auto_in_a_mem_3_source; 
  wire [37:0] asink_1_auto_in_a_mem_3_address; 
  wire [3:0] asink_1_auto_in_a_mem_3_mask; 
  wire [31:0] asink_1_auto_in_a_mem_3_data; 
  wire  asink_1_auto_in_a_mem_3_corrupt; 
  wire [2:0] asink_1_auto_in_a_mem_4_opcode; 
  wire [2:0] asink_1_auto_in_a_mem_4_param; 
  wire [2:0] asink_1_auto_in_a_mem_4_size; 
  wire [4:0] asink_1_auto_in_a_mem_4_source; 
  wire [37:0] asink_1_auto_in_a_mem_4_address; 
  wire [3:0] asink_1_auto_in_a_mem_4_mask; 
  wire [31:0] asink_1_auto_in_a_mem_4_data; 
  wire  asink_1_auto_in_a_mem_4_corrupt; 
  wire [2:0] asink_1_auto_in_a_mem_5_opcode; 
  wire [2:0] asink_1_auto_in_a_mem_5_param; 
  wire [2:0] asink_1_auto_in_a_mem_5_size; 
  wire [4:0] asink_1_auto_in_a_mem_5_source; 
  wire [37:0] asink_1_auto_in_a_mem_5_address; 
  wire [3:0] asink_1_auto_in_a_mem_5_mask; 
  wire [31:0] asink_1_auto_in_a_mem_5_data; 
  wire  asink_1_auto_in_a_mem_5_corrupt; 
  wire [2:0] asink_1_auto_in_a_mem_6_opcode; 
  wire [2:0] asink_1_auto_in_a_mem_6_param; 
  wire [2:0] asink_1_auto_in_a_mem_6_size; 
  wire [4:0] asink_1_auto_in_a_mem_6_source; 
  wire [37:0] asink_1_auto_in_a_mem_6_address; 
  wire [3:0] asink_1_auto_in_a_mem_6_mask; 
  wire [31:0] asink_1_auto_in_a_mem_6_data; 
  wire  asink_1_auto_in_a_mem_6_corrupt; 
  wire [2:0] asink_1_auto_in_a_mem_7_opcode; 
  wire [2:0] asink_1_auto_in_a_mem_7_param; 
  wire [2:0] asink_1_auto_in_a_mem_7_size; 
  wire [4:0] asink_1_auto_in_a_mem_7_source; 
  wire [37:0] asink_1_auto_in_a_mem_7_address; 
  wire [3:0] asink_1_auto_in_a_mem_7_mask; 
  wire [31:0] asink_1_auto_in_a_mem_7_data; 
  wire  asink_1_auto_in_a_mem_7_corrupt; 
  wire [3:0] asink_1_auto_in_a_ridx; 
  wire [3:0] asink_1_auto_in_a_widx; 
  wire  asink_1_auto_in_a_safe_ridx_valid; 
  wire  asink_1_auto_in_a_safe_widx_valid; 
  wire  asink_1_auto_in_a_safe_source_reset_n; 
  wire  asink_1_auto_in_a_safe_sink_reset_n; 
  wire [2:0] asink_1_auto_in_d_mem_0_opcode; 
  wire [1:0] asink_1_auto_in_d_mem_0_param; 
  wire [2:0] asink_1_auto_in_d_mem_0_size; 
  wire [4:0] asink_1_auto_in_d_mem_0_source; 
  wire  asink_1_auto_in_d_mem_0_sink; 
  wire  asink_1_auto_in_d_mem_0_denied; 
  wire [31:0] asink_1_auto_in_d_mem_0_data; 
  wire  asink_1_auto_in_d_mem_0_corrupt; 
  wire [2:0] asink_1_auto_in_d_mem_1_opcode; 
  wire [1:0] asink_1_auto_in_d_mem_1_param; 
  wire [2:0] asink_1_auto_in_d_mem_1_size; 
  wire [4:0] asink_1_auto_in_d_mem_1_source; 
  wire  asink_1_auto_in_d_mem_1_sink; 
  wire  asink_1_auto_in_d_mem_1_denied; 
  wire [31:0] asink_1_auto_in_d_mem_1_data; 
  wire  asink_1_auto_in_d_mem_1_corrupt; 
  wire [2:0] asink_1_auto_in_d_mem_2_opcode; 
  wire [1:0] asink_1_auto_in_d_mem_2_param; 
  wire [2:0] asink_1_auto_in_d_mem_2_size; 
  wire [4:0] asink_1_auto_in_d_mem_2_source; 
  wire  asink_1_auto_in_d_mem_2_sink; 
  wire  asink_1_auto_in_d_mem_2_denied; 
  wire [31:0] asink_1_auto_in_d_mem_2_data; 
  wire  asink_1_auto_in_d_mem_2_corrupt; 
  wire [2:0] asink_1_auto_in_d_mem_3_opcode; 
  wire [1:0] asink_1_auto_in_d_mem_3_param; 
  wire [2:0] asink_1_auto_in_d_mem_3_size; 
  wire [4:0] asink_1_auto_in_d_mem_3_source; 
  wire  asink_1_auto_in_d_mem_3_sink; 
  wire  asink_1_auto_in_d_mem_3_denied; 
  wire [31:0] asink_1_auto_in_d_mem_3_data; 
  wire  asink_1_auto_in_d_mem_3_corrupt; 
  wire [2:0] asink_1_auto_in_d_mem_4_opcode; 
  wire [1:0] asink_1_auto_in_d_mem_4_param; 
  wire [2:0] asink_1_auto_in_d_mem_4_size; 
  wire [4:0] asink_1_auto_in_d_mem_4_source; 
  wire  asink_1_auto_in_d_mem_4_sink; 
  wire  asink_1_auto_in_d_mem_4_denied; 
  wire [31:0] asink_1_auto_in_d_mem_4_data; 
  wire  asink_1_auto_in_d_mem_4_corrupt; 
  wire [2:0] asink_1_auto_in_d_mem_5_opcode; 
  wire [1:0] asink_1_auto_in_d_mem_5_param; 
  wire [2:0] asink_1_auto_in_d_mem_5_size; 
  wire [4:0] asink_1_auto_in_d_mem_5_source; 
  wire  asink_1_auto_in_d_mem_5_sink; 
  wire  asink_1_auto_in_d_mem_5_denied; 
  wire [31:0] asink_1_auto_in_d_mem_5_data; 
  wire  asink_1_auto_in_d_mem_5_corrupt; 
  wire [2:0] asink_1_auto_in_d_mem_6_opcode; 
  wire [1:0] asink_1_auto_in_d_mem_6_param; 
  wire [2:0] asink_1_auto_in_d_mem_6_size; 
  wire [4:0] asink_1_auto_in_d_mem_6_source; 
  wire  asink_1_auto_in_d_mem_6_sink; 
  wire  asink_1_auto_in_d_mem_6_denied; 
  wire [31:0] asink_1_auto_in_d_mem_6_data; 
  wire  asink_1_auto_in_d_mem_6_corrupt; 
  wire [2:0] asink_1_auto_in_d_mem_7_opcode; 
  wire [1:0] asink_1_auto_in_d_mem_7_param; 
  wire [2:0] asink_1_auto_in_d_mem_7_size; 
  wire [4:0] asink_1_auto_in_d_mem_7_source; 
  wire  asink_1_auto_in_d_mem_7_sink; 
  wire  asink_1_auto_in_d_mem_7_denied; 
  wire [31:0] asink_1_auto_in_d_mem_7_data; 
  wire  asink_1_auto_in_d_mem_7_corrupt; 
  wire [3:0] asink_1_auto_in_d_ridx; 
  wire [3:0] asink_1_auto_in_d_widx; 
  wire  asink_1_auto_in_d_safe_ridx_valid; 
  wire  asink_1_auto_in_d_safe_widx_valid; 
  wire  asink_1_auto_in_d_safe_source_reset_n; 
  wire  asink_1_auto_in_d_safe_sink_reset_n; 
  wire  asink_1_auto_out_a_ready; 
  wire  asink_1_auto_out_a_valid; 
  wire [2:0] asink_1_auto_out_a_bits_opcode; 
  wire [2:0] asink_1_auto_out_a_bits_param; 
  wire [2:0] asink_1_auto_out_a_bits_size; 
  wire [4:0] asink_1_auto_out_a_bits_source; 
  wire [37:0] asink_1_auto_out_a_bits_address; 
  wire [3:0] asink_1_auto_out_a_bits_mask; 
  wire [31:0] asink_1_auto_out_a_bits_data; 
  wire  asink_1_auto_out_a_bits_corrupt; 
  wire  asink_1_auto_out_d_ready; 
  wire  asink_1_auto_out_d_valid; 
  wire [2:0] asink_1_auto_out_d_bits_opcode; 
  wire [2:0] asink_1_auto_out_d_bits_size; 
  wire [4:0] asink_1_auto_out_d_bits_source; 
  wire  asink_1_auto_out_d_bits_denied; 
  wire [31:0] asink_1_auto_out_d_bits_data; 
  wire  asink_1_auto_out_d_bits_corrupt; 
  wire  asource_clock; 
  wire  asource_reset; 
  wire  asource_auto_in_a_ready; 
  wire  asource_auto_in_a_valid; 
  wire [2:0] asource_auto_in_a_bits_opcode; 
  wire [2:0] asource_auto_in_a_bits_param; 
  wire [2:0] asource_auto_in_a_bits_size; 
  wire [3:0] asource_auto_in_a_bits_source; 
  wire [37:0] asource_auto_in_a_bits_address; 
  wire [7:0] asource_auto_in_a_bits_mask; 
  wire [63:0] asource_auto_in_a_bits_data; 
  wire  asource_auto_in_a_bits_corrupt; 
  wire  asource_auto_in_d_ready; 
  wire  asource_auto_in_d_valid; 
  wire [2:0] asource_auto_in_d_bits_opcode; 
  wire [1:0] asource_auto_in_d_bits_param; 
  wire [2:0] asource_auto_in_d_bits_size; 
  wire [3:0] asource_auto_in_d_bits_source; 
  wire [2:0] asource_auto_in_d_bits_sink; 
  wire  asource_auto_in_d_bits_denied; 
  wire [63:0] asource_auto_in_d_bits_data; 
  wire  asource_auto_in_d_bits_corrupt; 
  wire [2:0] asource_auto_out_a_mem_0_opcode; 
  wire [2:0] asource_auto_out_a_mem_0_param; 
  wire [2:0] asource_auto_out_a_mem_0_size; 
  wire [3:0] asource_auto_out_a_mem_0_source; 
  wire [37:0] asource_auto_out_a_mem_0_address; 
  wire [7:0] asource_auto_out_a_mem_0_mask; 
  wire [63:0] asource_auto_out_a_mem_0_data; 
  wire  asource_auto_out_a_mem_0_corrupt; 
  wire [2:0] asource_auto_out_a_mem_1_opcode; 
  wire [2:0] asource_auto_out_a_mem_1_param; 
  wire [2:0] asource_auto_out_a_mem_1_size; 
  wire [3:0] asource_auto_out_a_mem_1_source; 
  wire [37:0] asource_auto_out_a_mem_1_address; 
  wire [7:0] asource_auto_out_a_mem_1_mask; 
  wire [63:0] asource_auto_out_a_mem_1_data; 
  wire  asource_auto_out_a_mem_1_corrupt; 
  wire [2:0] asource_auto_out_a_mem_2_opcode; 
  wire [2:0] asource_auto_out_a_mem_2_param; 
  wire [2:0] asource_auto_out_a_mem_2_size; 
  wire [3:0] asource_auto_out_a_mem_2_source; 
  wire [37:0] asource_auto_out_a_mem_2_address; 
  wire [7:0] asource_auto_out_a_mem_2_mask; 
  wire [63:0] asource_auto_out_a_mem_2_data; 
  wire  asource_auto_out_a_mem_2_corrupt; 
  wire [2:0] asource_auto_out_a_mem_3_opcode; 
  wire [2:0] asource_auto_out_a_mem_3_param; 
  wire [2:0] asource_auto_out_a_mem_3_size; 
  wire [3:0] asource_auto_out_a_mem_3_source; 
  wire [37:0] asource_auto_out_a_mem_3_address; 
  wire [7:0] asource_auto_out_a_mem_3_mask; 
  wire [63:0] asource_auto_out_a_mem_3_data; 
  wire  asource_auto_out_a_mem_3_corrupt; 
  wire [2:0] asource_auto_out_a_mem_4_opcode; 
  wire [2:0] asource_auto_out_a_mem_4_param; 
  wire [2:0] asource_auto_out_a_mem_4_size; 
  wire [3:0] asource_auto_out_a_mem_4_source; 
  wire [37:0] asource_auto_out_a_mem_4_address; 
  wire [7:0] asource_auto_out_a_mem_4_mask; 
  wire [63:0] asource_auto_out_a_mem_4_data; 
  wire  asource_auto_out_a_mem_4_corrupt; 
  wire [2:0] asource_auto_out_a_mem_5_opcode; 
  wire [2:0] asource_auto_out_a_mem_5_param; 
  wire [2:0] asource_auto_out_a_mem_5_size; 
  wire [3:0] asource_auto_out_a_mem_5_source; 
  wire [37:0] asource_auto_out_a_mem_5_address; 
  wire [7:0] asource_auto_out_a_mem_5_mask; 
  wire [63:0] asource_auto_out_a_mem_5_data; 
  wire  asource_auto_out_a_mem_5_corrupt; 
  wire [2:0] asource_auto_out_a_mem_6_opcode; 
  wire [2:0] asource_auto_out_a_mem_6_param; 
  wire [2:0] asource_auto_out_a_mem_6_size; 
  wire [3:0] asource_auto_out_a_mem_6_source; 
  wire [37:0] asource_auto_out_a_mem_6_address; 
  wire [7:0] asource_auto_out_a_mem_6_mask; 
  wire [63:0] asource_auto_out_a_mem_6_data; 
  wire  asource_auto_out_a_mem_6_corrupt; 
  wire [2:0] asource_auto_out_a_mem_7_opcode; 
  wire [2:0] asource_auto_out_a_mem_7_param; 
  wire [2:0] asource_auto_out_a_mem_7_size; 
  wire [3:0] asource_auto_out_a_mem_7_source; 
  wire [37:0] asource_auto_out_a_mem_7_address; 
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
  wire [3:0] asource_auto_out_d_mem_0_source; 
  wire [2:0] asource_auto_out_d_mem_0_sink; 
  wire  asource_auto_out_d_mem_0_denied; 
  wire [63:0] asource_auto_out_d_mem_0_data; 
  wire  asource_auto_out_d_mem_0_corrupt; 
  wire [2:0] asource_auto_out_d_mem_1_opcode; 
  wire [1:0] asource_auto_out_d_mem_1_param; 
  wire [2:0] asource_auto_out_d_mem_1_size; 
  wire [3:0] asource_auto_out_d_mem_1_source; 
  wire [2:0] asource_auto_out_d_mem_1_sink; 
  wire  asource_auto_out_d_mem_1_denied; 
  wire [63:0] asource_auto_out_d_mem_1_data; 
  wire  asource_auto_out_d_mem_1_corrupt; 
  wire [2:0] asource_auto_out_d_mem_2_opcode; 
  wire [1:0] asource_auto_out_d_mem_2_param; 
  wire [2:0] asource_auto_out_d_mem_2_size; 
  wire [3:0] asource_auto_out_d_mem_2_source; 
  wire [2:0] asource_auto_out_d_mem_2_sink; 
  wire  asource_auto_out_d_mem_2_denied; 
  wire [63:0] asource_auto_out_d_mem_2_data; 
  wire  asource_auto_out_d_mem_2_corrupt; 
  wire [2:0] asource_auto_out_d_mem_3_opcode; 
  wire [1:0] asource_auto_out_d_mem_3_param; 
  wire [2:0] asource_auto_out_d_mem_3_size; 
  wire [3:0] asource_auto_out_d_mem_3_source; 
  wire [2:0] asource_auto_out_d_mem_3_sink; 
  wire  asource_auto_out_d_mem_3_denied; 
  wire [63:0] asource_auto_out_d_mem_3_data; 
  wire  asource_auto_out_d_mem_3_corrupt; 
  wire [2:0] asource_auto_out_d_mem_4_opcode; 
  wire [1:0] asource_auto_out_d_mem_4_param; 
  wire [2:0] asource_auto_out_d_mem_4_size; 
  wire [3:0] asource_auto_out_d_mem_4_source; 
  wire [2:0] asource_auto_out_d_mem_4_sink; 
  wire  asource_auto_out_d_mem_4_denied; 
  wire [63:0] asource_auto_out_d_mem_4_data; 
  wire  asource_auto_out_d_mem_4_corrupt; 
  wire [2:0] asource_auto_out_d_mem_5_opcode; 
  wire [1:0] asource_auto_out_d_mem_5_param; 
  wire [2:0] asource_auto_out_d_mem_5_size; 
  wire [3:0] asource_auto_out_d_mem_5_source; 
  wire [2:0] asource_auto_out_d_mem_5_sink; 
  wire  asource_auto_out_d_mem_5_denied; 
  wire [63:0] asource_auto_out_d_mem_5_data; 
  wire  asource_auto_out_d_mem_5_corrupt; 
  wire [2:0] asource_auto_out_d_mem_6_opcode; 
  wire [1:0] asource_auto_out_d_mem_6_param; 
  wire [2:0] asource_auto_out_d_mem_6_size; 
  wire [3:0] asource_auto_out_d_mem_6_source; 
  wire [2:0] asource_auto_out_d_mem_6_sink; 
  wire  asource_auto_out_d_mem_6_denied; 
  wire [63:0] asource_auto_out_d_mem_6_data; 
  wire  asource_auto_out_d_mem_6_corrupt; 
  wire [2:0] asource_auto_out_d_mem_7_opcode; 
  wire [1:0] asource_auto_out_d_mem_7_param; 
  wire [2:0] asource_auto_out_d_mem_7_size; 
  wire [3:0] asource_auto_out_d_mem_7_source; 
  wire [2:0] asource_auto_out_d_mem_7_sink; 
  wire  asource_auto_out_d_mem_7_denied; 
  wire [63:0] asource_auto_out_d_mem_7_data; 
  wire  asource_auto_out_d_mem_7_corrupt; 
  wire [3:0] asource_auto_out_d_ridx; 
  wire [3:0] asource_auto_out_d_widx; 
  wire  asource_auto_out_d_safe_ridx_valid; 
  wire  asource_auto_out_d_safe_widx_valid; 
  wire  asource_auto_out_d_safe_source_reset_n; 
  wire  asource_auto_out_d_safe_sink_reset_n; 
  wire  intsource_clock; 
  wire  intsource_reset; 
  wire  intsource_auto_in_0; 
  wire  intsource_auto_out_sync_0; 
  wire  ibufds_gte2_IB; 
  wire  ibufds_gte2_I; 
  wire  ibufds_gte2_CEB; 
  wire  ibufds_gte2_ODIV2; 
  wire  ibufds_gte2_O; 


    localparam SPI_MASTER_AXI4_ADDRESS_WIDTH = 28;
    localparam SPI_MASTER_AXI4_RDATA_WIDTH   = 64;
    localparam SPI_MASTER_AXI4_WDATA_WIDTH   = 64;
    localparam SPI_MASTER_AXI4_USER_WIDTH    = 1;
    localparam SPI_MASTER_AXI4_ID_WIDTH      = 5;
    localparam SPI_MASTER_BUFFER_DEPTH       = 8;

    wire  logic                          spi_master_s_axi_awvalid;
    wire  logic      [SPI_MASTER_AXI4_ID_WIDTH-1:0] spi_master_s_axi_awid;
    wire  logic                    [7:0] spi_master_s_axi_awlen;
    wire  logic [SPI_MASTER_AXI4_ADDRESS_WIDTH-1:0] spi_master_s_axi_awaddr;
    //wire  logic    [SPI_MASTER_AXI4_USER_WIDTH-1:0] spi_master_s_axi_awuser;
    wire logic                          spi_master_s_axi_awready;

    wire  logic                          spi_master_s_axi_wvalid;
    wire  logic   [SPI_MASTER_AXI4_WDATA_WIDTH-1:0] spi_master_s_axi_wdata;
    wire  logic [SPI_MASTER_AXI4_WDATA_WIDTH/8-1:0] spi_master_s_axi_wstrb;
    wire  logic                          spi_master_s_axi_wlast;
    //wire  logic    [SPI_MASTER_AXI4_USER_WIDTH-1:0] spi_master_s_axi_wuser;
    wire logic                          spi_master_s_axi_wready;

    wire logic                          spi_master_s_axi_bvalid;
    wire logic      [SPI_MASTER_AXI4_ID_WIDTH-1:0] spi_master_s_axi_bid;
    wire logic                    [1:0] spi_master_s_axi_bresp;
    //wire logic    [SPI_MASTER_AXI4_USER_WIDTH-1:0] spi_master_s_axi_buser;
    wire  logic                          spi_master_s_axi_bready;

    wire  logic                          spi_master_s_axi_arvalid;
    wire  logic      [SPI_MASTER_AXI4_ID_WIDTH-1:0] spi_master_s_axi_arid;
    wire  logic                    [7:0] spi_master_s_axi_arlen;
    wire  logic [SPI_MASTER_AXI4_ADDRESS_WIDTH-1:0] spi_master_s_axi_araddr;
    //wire  logic    [SPI_MASTER_AXI4_USER_WIDTH-1:0] spi_master_s_axi_aruser;
    wire logic                          spi_master_s_axi_arready;

    wire logic                          spi_master_s_axi_rvalid;
    wire logic   [SPI_MASTER_AXI4_ID_WIDTH-1:0] spi_master_s_axi_rid;
    wire logic   [SPI_MASTER_AXI4_RDATA_WIDTH-1:0] spi_master_s_axi_rdata;
    wire logic                    [1:0] spi_master_s_axi_rresp;
    wire logic                          spi_master_s_axi_rlast;
   // wire logic   [SPI_MASTER_AXI4_USER_WIDTH-1:0] spi_master_s_axi_ruser;
    wire  logic                          spi_master_s_axi_rready;


    wire [31:0]  pcie_master_base_awaddr;
    wire [31:0]  chiplink_master_awaddr;

    wire [31:0]  pcie_master_base_araddr;
    wire [31:0]  chiplink_master_araddr;

    wire [31:0] ddr_master_0_awaddr_override;
    wire [31:0] qspi_master_out_aw_addr_override;

    wire [31:0] ddr_master_0_araddr_override;
    wire [31:0] qspi_master_out_ar_addr_override;


  //--------------------------------------------------------------
    wire  [5-1:0]     S1_AWID;
    wire  [33-1:0]      S1_AWADDR;
    wire  [ 7:0]              S1_AWLEN;
    wire                      S1_AWLOCK;
    wire  [ 2:0]              S1_AWSIZE;
    wire  [ 1:0]              S1_AWBURST;
      `ifdef  AMBA_AXI_CACHE
    wire  [ 3:0]              S1_AWCACHE;
      `endif
      `ifdef AMBA_AXI_PROT
    wire  [ 2:0]              S1_AWPROT;
      `endif
    wire                      S1_AWVALID;
    wire                      S1_AWREADY;
      `ifdef AMBA_QOS
    wire  [ 3:0]              S1_AWQOS;
    wire  [ 3:0]              S1_AWREGION;
      `endif
      `ifdef AMBA_AXI_AWUSER
    wire  [1-1:0]  S1_AWUSER;
      `endif
    wire   [64-1:0]     S1_WDATA;
    wire   [8-1:0]     S1_WSTRB;
    wire                      S1_WLAST;
    wire                      S1_WVALID;
    wire                      S1_WREADY;
      `ifdef AMBA_AXI_WUSER
    wire   [1-1:0]  S1_WUSER;
      `endif
    wire   [5-1:0]    S1_BID;
    wire   [ 1:0]             S1_BRESP;
    wire                      S1_BVALID;
    wire                      S1_BREADY;
      `ifdef AMBA_AXI_BUSER
    wire   [1-1:0]  S1_BUSER;
      `endif
    wire   [5-1:0]    S1_ARID;
    wire   [33-1:0]     S1_ARADDR;
    wire   [ 7:0]             S1_ARLEN;
    wire                      S1_ARLOCK;
    wire   [ 2:0]             S1_ARSIZE;
    wire   [ 1:0]             S1_ARBURST;
      `ifdef  AMBA_AXI_CACHE
    wire   [ 3:0]             S1_ARCACHE;
      `endif
      `ifdef AMBA_AXI_PROT
    wire   [ 2:0]             S1_ARPROT;
      `endif
    wire                      S1_ARVALID;
    wire                      S1_ARREADY;
      `ifdef AMBA_QOS
    wire   [ 3:0]             S1_ARQOS;
    wire   [ 3:0]             S1_ARREGION;
      `endif
      `ifdef AMBA_AXI_ARUSER
    wire   [1-1:0] S1_ARUSER;
      `endif
    wire   [5-1:0]    S1_RID;
    wire   [64-1:0]     S1_RDATA;
    wire   [ 1:0]             S1_RRESP;
    wire                      S1_RLAST;
    wire                      S1_RVALID;
    wire                      S1_RREADY;
      `ifdef AMBA_AXI_RUSER
    wire   [1-1:0]  S1_RUSER;
      `endif

    assign S1_AWREADY = 1'b0;
    assign S1_WREADY = 1'b0;

    assign S1_BID = 5'b0;
    assign S1_BRESP = 2'b0;
    assign S1_BVALID = 1'b0;

    assign S1_ARREADY = 1'b0;

    assign S1_RID = 5'b0;
    assign S1_RDATA = 64'b0;
    assign S1_RRESP = 2'b0;
    assign S1_RVALID = 1'b0;



    assign axi_to_pcie_x1_io_port_axi_aclk_out = d2d_clock; 
    assign axi_to_pcie_x1_io_port_axi_aresetn = ~d2d_reset; 
    assign axi_to_pcie_x1_io_port_mmcm_lock = 1;


    assign ddr_master_0_awaddr_override = chiplink_master_addr_msb_16[15] ? {chiplink_master_addr_msb_16[3:0]} : ddr_master_0_awaddr[31:28];
    assign ddr_master_0_araddr_override = chiplink_master_addr_msb_16[15] ? {chiplink_master_addr_msb_16[3:0]} : ddr_master_0_awaddr[31:28];

    assign qspi_master_out_aw_addr_override = qspi_axi_master_addr_msb_16[15] ? {qspi_axi_master_addr_msb_16[3:0]} : qspi_master_out_aw_addr[31:28];
    assign qspi_master_out_ar_addr_override = qspi_axi_master_addr_msb_16[15] ? {qspi_axi_master_addr_msb_16[3:0]} : qspi_master_out_ar_addr[31:28];;



  AMBA_XBAR_M2S2
        #(.NUM_MASTER(2)  // should not be changed
          ,.NUM_SLAVE(2)  // should not be changed
          ,.WIDTH_ID(4) // ID width in bits
          ,.WIDTH_AD(33) // address width
          ,.WIDTH_DA(64) // data width
                  `ifdef AMBA_AXI_AWUSER
          ,.WIDTH_AWUSER(1) // Write-address user path
                  `endif
                  `ifdef AMBA_AXI_WUSER
          ,.WIDTH_WUSER(1) // Write-data user path
                  `endif
                  `ifdef AMBA_AXI_BUSER
          ,.WIDTH_BUSER(1) // Write-response user path
                  `endif
                  `ifdef AMBA_AXI_ARUSER
          ,.WIDTH_ARUSER(1) // read-address user path
                  `endif
                  `ifdef AMBA_AXI_RUSER
          ,.WIDTH_RUSER(1) // read-data user path
                  `endif
          ,.SLAVE_EN0(1) 
          ,.ADDR_LENGTH0(32) // effective address bits-widgh
          ,.SLAVE_EN1(0) 
          ,.ADDR_LENGTH1(32) // effective address bits-widgh
          ,.ADDR_BASE0(33'h0)
          ,.ADDR_BASE1(33'h1_0000_0000)
        )
    U_D2D_MASTER_BUS(
       .ARESETn(~d2d_reset)
      ,.ACLK(d2d_clock)
      //--------------------------------------------------------------
      ,.M0_AWID(ddr_master_0_awid)
      ,.M0_AWADDR({1'b0, ddr_master_0_awaddr_override[3:0], ddr_master_0_awaddr[27:0]})
      ,.M0_AWLEN(ddr_master_0_awlen)
      ,.M0_AWLOCK(1'b0)
      ,.M0_AWSIZE(ddr_master_0_awsize)
      ,.M0_AWBURST(ddr_master_0_awburst)
        `ifdef  AMBA_AXI_CACHE
      ,.M0_AWCACHE(4'b0)
        `endif
        `ifdef AMBA_AXI_PROT
      ,.M0_AWPROT(3'b0)
        `endif
      ,.M0_AWVALID(ddr_master_0_awvalid)
      ,.M0_AWREADY(ddr_master_0_awready)
        `ifdef AMBA_QOS
      ,.M0_AWQOS(4'b0)
      ,.M0_AWREGION(4'b0)
        `endif
        `ifdef AMBA_AXI_AWUSER
      ,.M0_AWUSER(1'b0)
        `endif
      ,.M0_WDATA(ddr_master_0_wdata)
      ,.M0_WSTRB(ddr_master_0_wstrb)
      ,.M0_WLAST(ddr_master_0_wlast)
      ,.M0_WVALID(ddr_master_0_wvalid)
      ,.M0_WREADY(ddr_master_0_wready)
        `ifdef AMBA_AXI_WUSER
      ,.M0_WUSER(1'b0)
        `endif
      ,.M0_BID(ddr_master_0_bid)
      ,.M0_BRESP(ddr_master_0_bresp)
      ,.M0_BVALID(ddr_master_0_bvalid)
      ,.M0_BREADY(ddr_master_0_bready)
        `ifdef AMBA_AXI_BUSER
      ,.M0_BUSER(1'b0)
        `endif
      ,.M0_ARID(ddr_master_0_arid)
      ,.M0_ARADDR({1'b0, ddr_master_0_araddr_override[3:0], ddr_master_0_araddr[27:0]})
      ,.M0_ARLEN(ddr_master_0_arlen)
      ,.M0_ARLOCK(1'b0)
      ,.M0_ARSIZE(ddr_master_0_arsize)
      ,.M0_ARBURST(ddr_master_0_arburst)
        `ifdef  AMBA_AXI_CACHE
      ,.M0_ARCACHE(4'b0)
        `endif
        `ifdef AMBA_AXI_PROT
      ,.M0_ARPROT(3'b0)
        `endif
      ,.M0_ARVALID(ddr_master_0_arvalid)
      ,.M0_ARREADY(ddr_master_0_arready)
        `ifdef AMBA_QOS
      ,.M0_ARQOS(4'b0)
      ,.M0_ARREGION(4'b0)
        `endif
        `ifdef AMBA_AXI_ARUSER
      ,.M0_ARUSER(1'b0)
        `endif
      ,.M0_RID(ddr_master_0_rid)
      ,.M0_RDATA(ddr_master_0_rdata)
      ,.M0_RRESP(ddr_master_0_rresp)
      ,.M0_RLAST(ddr_master_0_rlast)
      ,.M0_RVALID(ddr_master_0_rvalid)
      ,.M0_RREADY(ddr_master_0_rready)
        `ifdef AMBA_AXI_RUSER
      ,.M0_RUSER()
        `endif
        //--------------------------------------------------------------
      ,.M1_AWID(qspi_master_out_aw_id)
      ,.M1_AWADDR({1'b0, qspi_master_out_aw_addr_override[3:0], qspi_master_out_aw_addr[27:0]})
      ,.M1_AWLEN(qspi_master_out_aw_len)
      ,.M1_AWLOCK(1'b0)
      ,.M1_AWSIZE(qspi_master_out_aw_size)
      ,.M1_AWBURST(qspi_master_out_aw_burst)
        `ifdef  AMBA_AXI_CACHE
      ,.M1_AWCACHE(auto_master_out_aw_cache)
        `endif
        `ifdef AMBA_AXI_PROT
      ,.M1_AWPROT(auto_master_out_aw_prot)
        `endif
      ,.M1_AWVALID(qspi_master_out_aw_valid)
      ,.M1_AWREADY(qspi_master_out_aw_ready)
        `ifdef AMBA_QOS
      ,.M1_AWQOS(auto_master_out_aw_qos)
      ,.M1_AWREGION(auto_master_out_aw_region)
        `endif
        `ifdef AMBA_AXI_AWUSER
      ,.M1_AWUSER(1'b0)
        `endif
      ,.M1_WDATA(qspi_master_out_w_data)
      ,.M1_WSTRB(qspi_master_out_w_strb)
      ,.M1_WLAST(qspi_master_out_w_last)
      ,.M1_WVALID(qspi_master_out_w_valid)
      ,.M1_WREADY(qspi_master_out_w_ready)
        `ifdef AMBA_AXI_WUSER
      ,.M1_WUSER(1'b0)
        `endif
      ,.M1_BID(qspi_master_out_b_id)
      ,.M1_BRESP(qspi_master_out_b_resp)
      ,.M1_BVALID(qspi_master_out_b_valid)
      ,.M1_BREADY(qspi_master_out_b_ready)
        `ifdef AMBA_AXI_BUSER
      ,.M1_BUSER()
        `endif
      ,.M1_ARID(qspi_master_out_ar_id)
      ,.M1_ARADDR({1'b0, qspi_master_out_ar_addr_override[3:0], qspi_master_out_ar_addr[27:0]})
      ,.M1_ARLEN(qspi_master_out_ar_len)
      ,.M1_ARLOCK(1'b0)
      ,.M1_ARSIZE(qspi_master_out_ar_size)
      ,.M1_ARBURST(qspi_master_out_ar_burst)
        `ifdef  AMBA_AXI_CACHE
      ,.M1_ARCACHE(auto_master_out_ar_cache)
        `endif
        `ifdef AMBA_AXI_PROT
      ,.M1_ARPROT(auto_master_out_ar_prot)
        `endif
      ,.M1_ARVALID(qspi_master_out_ar_valid)
      ,.M1_ARREADY(qspi_master_out_ar_ready)
        `ifdef AMBA_QOS
      ,.M1_ARQOS(auto_master_out_ar_qos)
      ,.M1_ARREGION(auto_master_out_ar_region)
        `endif
        `ifdef AMBA_AXI_ARUSER
      ,.M1_ARUSER(1'b0)
        `endif
      ,.M1_RID(qspi_master_out_r_id)
      ,.M1_RDATA(qspi_master_out_r_data)
      ,.M1_RRESP(qspi_master_out_r_resp)
      ,.M1_RLAST(qspi_master_out_r_last)
      ,.M1_RVALID(qspi_master_out_r_valid)
      ,.M1_RREADY(qspi_master_out_r_ready)
        `ifdef AMBA_AXI_RUSER
      ,.M1_RUSER()
        `endif
        //--------------------------------------------------------------

      ,.S0_AWID(indexer_auto_in_aw_bits_id)
      ,.S0_AWADDR(indexer_auto_in_aw_bits_addr[32:0])
      ,.S0_AWLEN(indexer_auto_in_aw_bits_len)
      ,.S0_AWLOCK(indexer_auto_in_aw_bits_lock)
      ,.S0_AWSIZE(indexer_auto_in_aw_bits_size)
      ,.S0_AWBURST(indexer_auto_in_aw_bits_burst)
        `ifdef  AMBA_AXI_CACHE
      ,.S0_AWCACHE(indexer_auto_in_aw_bits_cache)
        `endif
        `ifdef AMBA_AXI_PROT
      ,.S0_AWPROT(indexer_auto_in_aw_bits_prot)
        `endif
      ,.S0_AWVALID(indexer_auto_in_aw_valid)
      ,.S0_AWREADY(indexer_auto_in_aw_ready)
        `ifdef AMBA_QOS
      ,.S0_AWQOS(4'b0)
      ,.S0_AWREGION(4'b0)
        `endif
        `ifdef AMBA_AXI_AWUSER
      ,.S0_AWUSER(1'b0)
        `endif
      ,.S0_WDATA(indexer_auto_in_w_bits_data)
      ,.S0_WSTRB(indexer_auto_in_w_bits_strb)
      ,.S0_WLAST(indexer_auto_in_w_bits_last)
      ,.S0_WVALID(indexer_auto_in_w_valid)
      ,.S0_WREADY(indexer_auto_in_w_ready)
        `ifdef AMBA_AXI_WUSER
      ,.S0_WUSER(1'b0)
        `endif
      ,.S0_BID(indexer_auto_in_b_bits_id)
      ,.S0_BRESP(indexer_auto_in_b_bits_resp)
      ,.S0_BVALID(indexer_auto_in_b_valid)
      ,.S0_BREADY(indexer_auto_in_b_ready)
        `ifdef AMBA_AXI_BUSER
      ,.S0_BUSER(1'b0)
        `endif
      ,.S0_ARID(indexer_auto_in_ar_bits_id)
      ,.S0_ARADDR(indexer_auto_in_ar_bits_addr[32:0])
      ,.S0_ARLEN(indexer_auto_in_ar_bits_len)
      ,.S0_ARLOCK(indexer_auto_in_ar_bits_lock)
      ,.S0_ARSIZE(indexer_auto_in_ar_bits_size)
      ,.S0_ARBURST(indexer_auto_in_ar_bits_burst)
        `ifdef  AMBA_AXI_CACHE
      ,.S0_ARCACHE(indexer_auto_in_ar_bits_cache)
        `endif
        `ifdef AMBA_AXI_PROT
      ,.S0_ARPROT(indexer_auto_in_ar_bits_prot)
        `endif
      ,.S0_ARVALID(indexer_auto_in_ar_valid)
      ,.S0_ARREADY(indexer_auto_in_ar_ready)
        `ifdef AMBA_QOS
      ,.S0_ARQOS(indexer_auto_in_ar_bits_qos)
      ,.S0_ARREGION()
        `endif
        `ifdef AMBA_AXI_ARUSER
      ,.S0_ARUSER(1'b0)
        `endif
      ,.S0_RID(indexer_auto_in_r_bits_id)
      ,.S0_RDATA(indexer_auto_in_r_bits_data)
      ,.S0_RRESP(indexer_auto_in_r_bits_resp)
      ,.S0_RLAST(indexer_auto_in_r_bits_last)
      ,.S0_RVALID(indexer_auto_in_r_valid)
      ,.S0_RREADY(indexer_auto_in_r_ready)
        `ifdef AMBA_AXI_RUSER
      ,.S0_RUSER(S0_RUSER)
        `endif
        //--------------------------------------------------------------
      ,.S1_AWID(S1_AWID)
      ,.S1_AWADDR(S1_AWADDR)
      ,.S1_AWLEN(S1_AWLEN)
      ,.S1_AWLOCK(S1_AWLOCK)
      ,.S1_AWSIZE(S1_AWSIZE)
      ,.S1_AWBURST(S1_AWBURST)
        `ifdef  AMBA_AXI_CACHE
      ,.S1_AWCACHE(S1_AWCACHE)
        `endif
        `ifdef AMBA_AXI_PROT
      ,.S1_AWPROT(S1_AWPROT)
        `endif
      ,.S1_AWVALID(S1_AWVALID)
      ,.S1_AWREADY(S1_AWREADY)
        `ifdef AMBA_QOS
      ,.S1_AWQOS(S1_AWQOS)
      ,.S1_AWREGION(S1_AWREGION)
        `endif
        `ifdef AMBA_AXI_AWUSER
      ,.S1_AWUSER(S1_AWUSER)
        `endif
      ,.S1_WDATA(S1_WDATA)
      ,.S1_WSTRB(S1_WSTRB)
      ,.S1_WLAST(S1_WLAST)
      ,.S1_WVALID(S1_WVALID)
      ,.S1_WREADY(S1_WREADY)
        `ifdef AMBA_AXI_WUSER
      ,.S1_WUSER(S1_WUSER)
        `endif
      ,.S1_BID(S1_BID)
      ,.S1_BRESP(S1_BRESP)
      ,.S1_BVALID(S1_BVALID)
      ,.S1_BREADY(S1_BREADY)
        `ifdef AMBA_AXI_BUSER
      ,.S1_BUSER(S1_BUSER)
        `endif
      ,.S1_ARID(S1_ARID)
      ,.S1_ARADDR(S1_ARADDR)
      ,.S1_ARLEN(S1_ARLEN)
      ,.S1_ARLOCK(S1_ARLOCK)
      ,.S1_ARSIZE(S1_ARSIZE)
      ,.S1_ARBURST(S1_ARBURST)
        `ifdef  AMBA_AXI_CACHE
      ,.S1_ARCACHE(S1_ARCACHE)
        `endif
        `ifdef AMBA_AXI_PROT
      ,.S1_ARPROT(S1_ARPROT)
        `endif
      ,.S1_ARVALID(S1_ARVALID)
      ,.S1_ARREADY(S1_ARREADY)
        `ifdef AMBA_QOS
      ,.S1_ARQOS(S1_ARQOS)
      ,.S1_ARREGION(S1_ARREGION)
        `endif
        `ifdef AMBA_AXI_ARUSER
      ,.S1_ARUSER(S1_ARUSER)
        `endif
      ,.S1_RID(S1_RID)
      ,.S1_RDATA(S1_RDATA)
      ,.S1_RRESP(S1_RRESP)
      ,.S1_RLAST(S1_RLAST)
      ,.S1_RVALID(S1_RVALID)
      ,.S1_RREADY(S1_RREADY)
        `ifdef AMBA_AXI_RUSER
      ,.S1_RUSER(S1_RUSER)
      `endif
  );

  wire        soc_iram_in_aw_ready;
  wire         soc_iram_in_aw_valid;
  wire  [4:0]  soc_iram_in_aw_bits_id;
  wire  [27:0] soc_iram_in_aw_bits_addr;
  wire  [7:0]  soc_iram_in_aw_bits_len;
  wire  [2:0]  soc_iram_in_aw_bits_size;
  wire  [1:0]  soc_iram_in_aw_bits_burst;
  wire        soc_iram_in_w_ready;
  wire         soc_iram_in_w_valid;
  wire  [63:0] soc_iram_in_w_bits_data;
  wire  [7:0]  soc_iram_in_w_bits_strb;
  wire         soc_iram_in_w_bits_last;
  wire         soc_iram_in_b_ready;
  wire        soc_iram_in_b_valid;
  wire [4:0]  soc_iram_in_b_bits_id;
  wire [1:0]  soc_iram_in_b_bits_resp;
  wire        soc_iram_in_ar_ready;
  wire         soc_iram_in_ar_valid;
  wire  [4:0]  soc_iram_in_ar_bits_id;
  wire  [27:0] soc_iram_in_ar_bits_addr;
  wire  [7:0]  soc_iram_in_ar_bits_len;
  wire  [2:0]  soc_iram_in_ar_bits_size;
  wire  [1:0]  soc_iram_in_ar_bits_burst;
  wire         soc_iram_in_r_ready;
  wire        soc_iram_in_r_valid;
  wire [4:0]  soc_iram_in_r_bits_id;
  wire [63:0] soc_iram_in_r_bits_data;
  wire [1:0]  soc_iram_in_r_bits_resp;
  wire        soc_iram_in_r_bits_last;

  wire        soc_lsys_in_aw_ready;
  wire         soc_lsys_in_aw_valid;
  wire  [4:0]  soc_lsys_in_aw_bits_id;
  wire  [27:0] soc_lsys_in_aw_bits_addr;
  wire  [7:0]  soc_lsys_in_aw_bits_len;
  wire  [2:0]  soc_lsys_in_aw_bits_size;
  wire  [1:0]  soc_lsys_in_aw_bits_burst;
  wire        soc_lsys_in_w_ready;
  wire         soc_lsys_in_w_valid;
  wire  [63:0] soc_lsys_in_w_bits_data;
  wire  [7:0]  soc_lsys_in_w_bits_strb;
  wire         soc_lsys_in_w_bits_last;
  wire         soc_lsys_in_b_ready;
  wire        soc_lsys_in_b_valid;
  wire [4:0]  soc_lsys_in_b_bits_id;
  wire [1:0]  soc_lsys_in_b_bits_resp;
  wire        soc_lsys_in_ar_ready;
  wire         soc_lsys_in_ar_valid;
  wire  [4:0]  soc_lsys_in_ar_bits_id;
  wire  [27:0] soc_lsys_in_ar_bits_addr;
  wire  [7:0]  soc_lsys_in_ar_bits_len;
  wire  [2:0]  soc_lsys_in_ar_bits_size;
  wire  [1:0]  soc_lsys_in_ar_bits_burst;
  wire         soc_lsys_in_r_ready;
  wire        soc_lsys_in_r_valid;
  wire [4:0]  soc_lsys_in_r_bits_id;
  wire [63:0] soc_lsys_in_r_bits_data;
  wire [1:0]  soc_lsys_in_r_bits_resp;
  wire        soc_lsys_in_r_bits_last;


//--------------------------------------------------------------
  wire  [4-1:0]     SLAVE_BUS_M1_UNUSED_AWID;
  wire  [28-1:0]      SLAVE_BUS_M1_UNUSED_AWADDR;
  wire  [ 7:0]              SLAVE_BUS_M1_UNUSED_AWLEN;
  wire                      SLAVE_BUS_M1_UNUSED_AWLOCK;
  wire  [ 2:0]              SLAVE_BUS_M1_UNUSED_AWSIZE;
  wire  [ 1:0]              SLAVE_BUS_M1_UNUSED_AWBURST;
     `ifdef  AMBA_AXI_CACHE
  wire  [ 3:0]              SLAVE_BUS_M1_UNUSED_AWCACHE;
     `endif
     `ifdef AMBA_AXI_PROT
  wire  [ 2:0]              SLAVE_BUS_M1_UNUSED_AWPROT;
     `endif
  wire                      SLAVE_BUS_M1_UNUSED_AWVALID;
  wire                      SLAVE_BUS_M1_UNUSED_AWREADY;
     `ifdef AMBA_QOS
  wire  [ 3:0]              SLAVE_BUS_M1_UNUSED_AWQOS;
  wire  [ 3:0]              SLAVE_BUS_M1_UNUSED_AWREGION;
     `endif
     `ifdef AMBA_AXI_AWUSER
  wire  [1-1:0]  SLAVE_BUS_M1_UNUSED_AWUSER;
     `endif
  wire   [64-1:0]     SLAVE_BUS_M1_UNUSED_WDATA;
  wire   [8-1:0]     SLAVE_BUS_M1_UNUSED_WSTRB;
  wire                      SLAVE_BUS_M1_UNUSED_WLAST;
  wire                      SLAVE_BUS_M1_UNUSED_WVALID;
  wire                      SLAVE_BUS_M1_UNUSED_WREADY;
     `ifdef AMBA_AXI_WUSER
  wire   [1-1:0]  SLAVE_BUS_M1_UNUSED_WUSER;
     `endif
  wire   [4-1:0]    SLAVE_BUS_M1_UNUSED_BID;
  wire   [ 1:0]             SLAVE_BUS_M1_UNUSED_BRESP;
  wire                      SLAVE_BUS_M1_UNUSED_BVALID;
  wire                      SLAVE_BUS_M1_UNUSED_BREADY;
     `ifdef AMBA_AXI_BUSER
  wire   [1-1:0]  SLAVE_BUS_M1_UNUSED_BUSER;
     `endif
  wire   [4-1:0]    SLAVE_BUS_M1_UNUSED_ARID;
  wire   [28-1:0]     SLAVE_BUS_M1_UNUSED_ARADDR;
  wire   [ 7:0]             SLAVE_BUS_M1_UNUSED_ARLEN;
  wire                      SLAVE_BUS_M1_UNUSED_ARLOCK;
  wire   [ 2:0]             SLAVE_BUS_M1_UNUSED_ARSIZE;
  wire   [ 1:0]             SLAVE_BUS_M1_UNUSED_ARBURST;
     `ifdef  AMBA_AXI_CACHE
  wire   [ 3:0]             SLAVE_BUS_M1_UNUSED_ARCACHE;
     `endif
     `ifdef AMBA_AXI_PROT
  wire   [ 2:0]             SLAVE_BUS_M1_UNUSED_ARPROT;
     `endif
  wire                      SLAVE_BUS_M1_UNUSED_ARVALID;
  wire                      SLAVE_BUS_M1_UNUSED_ARREADY;
     `ifdef AMBA_QOS
  wire   [ 3:0]             SLAVE_BUS_M1_UNUSED_ARQOS;
  wire   [ 3:0]             SLAVE_BUS_M1_UNUSED_ARREGION;
     `endif
     `ifdef AMBA_AXI_ARUSER
  wire   [1-1:0] SLAVE_BUS_M1_UNUSED_ARUSER;
     `endif
  wire   [4-1:0]    SLAVE_BUS_M1_UNUSED_RID;
  wire   [64-1:0]     SLAVE_BUS_M1_UNUSED_RDATA;
  wire   [ 1:0]             SLAVE_BUS_M1_UNUSED_RRESP;
  wire                      SLAVE_BUS_M1_UNUSED_RLAST;
  wire                      SLAVE_BUS_M1_UNUSED_RVALID;
  wire                      SLAVE_BUS_M1_UNUSED_RREADY;
     `ifdef AMBA_AXI_RUSER
  wire   [1-1:0]  SLAVE_BUS_M1_UNUSED_RUSER;
     `endif

  assign SLAVE_BUS_M1_UNUSED_AWID = 4'h0;
  assign SLAVE_BUS_M1_UNUSED_AWADDR = 28'h0;
  assign SLAVE_BUS_M1_UNUSED_AWLEN = 8'h0;
  assign SLAVE_BUS_M1_UNUSED_AWLOCK = 1'h0;
  assign SLAVE_BUS_M1_UNUSED_AWSIZE = 3'h0;
  assign SLAVE_BUS_M1_UNUSED_AWBURST = 2'h0;
     `ifdef  AMBA_AXI_CACHE
  assign SLAVE_BUS_M1_UNUSED_AWCACHE = 4'h0;
     `endif
     `ifdef AMBA_AXI_PROT
  assign SLAVE_BUS_M1_UNUSED_AWPROT = 3'h0;
     `endif
  assign SLAVE_BUS_M1_UNUSED_AWVALID = 1'h0;
     `ifdef AMBA_QOS
  assign SLAVE_BUS_M1_UNUSED_AWQOS = 4'h0;
  assign SLAVE_BUS_M1_UNUSED_AWREGION = 4'h0;
     `endif
     `ifdef AMBA_AXI_AWUSER
  assign SLAVE_BUS_M1_UNUSED_AWUSER = 1'h0;
     `endif
  assign SLAVE_BUS_M1_UNUSED_WDATA = 64'h0;
  assign SLAVE_BUS_M1_UNUSED_WSTRB = 8'h0;
  assign SLAVE_BUS_M1_UNUSED_WLAST = 1'h0;
  assign SLAVE_BUS_M1_UNUSED_WVALID = 1'h0;
     `ifdef AMBA_AXI_WUSER
  assign SLAVE_BUS_M1_UNUSED_WUSER = 1'h0;
     `endif
  assign SLAVE_BUS_M1_UNUSED_BREADY = 1'h0;

  assign SLAVE_BUS_M1_UNUSED_ARID = 4'h0;
  assign SLAVE_BUS_M1_UNUSED_ARADDR = 28'h0;
  assign SLAVE_BUS_M1_UNUSED_ARLEN = 8'h0;
  assign SLAVE_BUS_M1_UNUSED_ARLOCK = 1'h0;
  assign SLAVE_BUS_M1_UNUSED_ARSIZE = 3'h0;
  assign SLAVE_BUS_M1_UNUSED_ARBURST = 2'h0;
     `ifdef  AMBA_AXI_CACHE
  assign SLAVE_BUS_M1_UNUSED_ARCACHE = 4'h0;
     `endif
     `ifdef AMBA_AXI_PROT
  assign SLAVE_BUS_M1_UNUSED_ARPROT = 3'h0;
     `endif
  assign SLAVE_BUS_M1_UNUSED_ARVALID = 1'h0;
     `ifdef AMBA_QOS
  assign SLAVE_BUS_M1_UNUSED_ARQOS = 4'h0;
  assign SLAVE_BUS_M1_UNUSED_ARREGION = 4'h0;
     `endif
     `ifdef AMBA_AXI_ARUSER
  assign SLAVE_BUS_M1_UNUSED_ARUSER = `'h0;
     `endif
  assign SLAVE_BUS_M1_UNUSED_RREADY = 1'h0;


  AMBA_XBAR_M2S3
        #(.NUM_MASTER(2)  // should not be changed
          ,.NUM_SLAVE(3)  // should not be changed
          ,.WIDTH_ID(4) // ID width in bits
          ,.WIDTH_AD(28) // address width
          ,.WIDTH_DA(64) // data width
                  `ifdef AMBA_AXI_AWUSER
          ,.WIDTH_AWUSER(1) // Write-address user path
                  `endif
                  `ifdef AMBA_AXI_WUSER
          ,.WIDTH_WUSER(1) // Write-data user path
                  `endif
                  `ifdef AMBA_AXI_BUSER
          ,.WIDTH_BUSER(1) // Write-response user path
                  `endif
                  `ifdef AMBA_AXI_ARUSER
          ,.WIDTH_ARUSER(1) // read-address user path
                  `endif
                  `ifdef AMBA_AXI_RUSER
          ,.WIDTH_RUSER(1) // read-data user path
                  `endif
          ,.SLAVE_EN0(1) 
          ,.ADDR_LENGTH0(24) // effective address bits-widgh
          ,.SLAVE_EN1(1) 
          ,.ADDR_LENGTH1(24) // effective address bits-widgh
          ,.SLAVE_EN2(1) 
          ,.ADDR_LENGTH2(24) // effective address bits-widgh
          ,.ADDR_BASE0(28'h000_0000)
          ,.ADDR_BASE1(28'h100_0000)
          ,.ADDR_BASE2(28'h200_0000)
        )
    U_D2D_SLAVE_PERI_BUS(
       .ARESETn(~d2d_reset)
      ,.ACLK(d2d_clock)
      //--------------------------------------------------------------
      ,.S0_AWID(soc_iram_in_aw_bits_id)
      ,.S0_AWADDR({soc_iram_in_aw_bits_addr})
      ,.S0_AWLEN(soc_iram_in_aw_bits_len)
      ,.S0_AWLOCK()
      ,.S0_AWSIZE(soc_iram_in_aw_bits_size)
      ,.S0_AWBURST(soc_iram_in_aw_bits_burst)
        `ifdef  AMBA_AXI_CACHE
      ,.S0_AWCACHE(4'b0)
        `endif
        `ifdef AMBA_AXI_PROT
      ,.S0_AWPROT(3'b0)
        `endif
      ,.S0_AWVALID(soc_iram_in_aw_valid)
      ,.S0_AWREADY(soc_iram_in_aw_ready)
        `ifdef AMBA_QOS
      ,.S0_AWQOS(4'b0)
      ,.S0_AWREGION(4'b0)
        `endif
        `ifdef AMBA_AXI_AWUSER
      ,.S0_AWUSER(1'b0)
        `endif
      ,.S0_WDATA(soc_iram_in_w_bits_data)
      ,.S0_WSTRB(soc_iram_in_w_bits_strb)
      ,.S0_WLAST(soc_iram_in_w_bits_last)
      ,.S0_WVALID(soc_iram_in_w_valid)
      ,.S0_WREADY(soc_iram_in_w_ready)
        `ifdef AMBA_AXI_WUSER
      ,.S0_WUSER(1'b0)
        `endif
      ,.S0_BID(soc_iram_in_b_bits_id)
      ,.S0_BRESP(soc_iram_in_b_bits_resp)
      ,.S0_BVALID(soc_iram_in_b_valid)
      ,.S0_BREADY(soc_iram_in_b_ready)
        `ifdef AMBA_AXI_BUSER
      ,.S0_BUSER(1'b0)
        `endif
      ,.S0_ARID(soc_iram_in_ar_bits_id)
      ,.S0_ARADDR({soc_iram_in_ar_bits_addr})
      ,.S0_ARLEN(soc_iram_in_ar_bits_len)
      ,.S0_ARLOCK()
      ,.S0_ARSIZE(soc_iram_in_ar_bits_size)
      ,.S0_ARBURST(soc_iram_in_ar_bits_burst)
        `ifdef  AMBA_AXI_CACHE
      ,.S0_ARCACHE(4'b0)
        `endif
        `ifdef AMBA_AXI_PROT
      ,.S0_ARPROT(3'b0)
        `endif
      ,.S0_ARVALID(soc_iram_in_ar_valid)
      ,.S0_ARREADY(soc_iram_in_ar_ready)
        `ifdef AMBA_QOS
      ,.S0_ARQOS(4'b0)
      ,.S0_ARREGION(4'b0)
        `endif
        `ifdef AMBA_AXI_ARUSER
      ,.S0_ARUSER(1'b0)
        `endif
      ,.S0_RID(soc_iram_in_r_bits_id)
      ,.S0_RDATA(soc_iram_in_r_bits_data)
      ,.S0_RRESP(soc_iram_in_r_bits_resp)
      ,.S0_RLAST(soc_iram_in_r_bits_last)
      ,.S0_RVALID(soc_iram_in_r_valid)
      ,.S0_RREADY(soc_iram_in_r_ready)
        `ifdef AMBA_AXI_RUSER
      ,.S0_RUSER()
        `endif
        //--------------------------------------------------------------
      ,.S1_AWID(soc_lsys_in_aw_bits_id)
      ,.S1_AWADDR({soc_lsys_in_aw_bits_addr})
      ,.S1_AWLEN(soc_lsys_in_aw_bits_len)
      ,.S1_AWLOCK()
      ,.S1_AWSIZE(soc_lsys_in_aw_bits_size)
      ,.S1_AWBURST(soc_lsys_in_aw_bits_burst)
        `ifdef  AMBA_AXI_CACHE
      ,.S1_AWCACHE(4'b0)
        `endif
        `ifdef AMBA_AXI_PROT
      ,.S1_AWPROT(3'b0)
        `endif
      ,.S1_AWVALID(soc_lsys_in_aw_valid)
      ,.S1_AWREADY(soc_lsys_in_aw_ready)
        `ifdef AMBA_QOS
      ,.S1_AWQOS(4'b0)
      ,.S1_AWREGION(4'b0)
        `endif
        `ifdef AMBA_AXI_AWUSER
      ,.S1_AWUSER(1'b0)
        `endif
      ,.S1_WDATA(soc_lsys_in_w_bits_data)
      ,.S1_WSTRB(soc_lsys_in_w_bits_strb)
      ,.S1_WLAST(soc_lsys_in_w_bits_last)
      ,.S1_WVALID(soc_lsys_in_w_valid)
      ,.S1_WREADY(soc_lsys_in_w_ready)
        `ifdef AMBA_AXI_WUSER
      ,.S1_WUSER(1'b0)
        `endif
      ,.S1_BID(soc_lsys_in_b_bits_id)
      ,.S1_BRESP(soc_lsys_in_b_bits_resp)
      ,.S1_BVALID(soc_lsys_in_b_valid)
      ,.S1_BREADY(soc_lsys_in_b_ready)
        `ifdef AMBA_AXI_BUSER
      ,.S1_BUSER(1'b0)
        `endif
      ,.S1_ARID(soc_lsys_in_ar_bits_id)
      ,.S1_ARADDR({soc_lsys_in_ar_bits_addr})
      ,.S1_ARLEN(soc_lsys_in_ar_bits_len)
      ,.S1_ARLOCK()
      ,.S1_ARSIZE(soc_lsys_in_ar_bits_size)
      ,.S1_ARBURST(soc_lsys_in_ar_bits_burst)
        `ifdef  AMBA_AXI_CACHE
      ,.S1_ARCACHE(4'b0)
        `endif
        `ifdef AMBA_AXI_PROT
      ,.S1_ARPROT(3'b0)
        `endif
      ,.S1_ARVALID(soc_lsys_in_ar_valid)
      ,.S1_ARREADY(soc_lsys_in_ar_ready)
        `ifdef AMBA_QOS
      ,.S1_ARQOS(4'b0)
      ,.S1_ARREGION(4'b0)
        `endif
        `ifdef AMBA_AXI_ARUSER
      ,.S1_ARUSER(1'b0)
        `endif
      ,.S1_RID(soc_lsys_in_r_bits_id)
      ,.S1_RDATA(soc_lsys_in_r_bits_data)
      ,.S1_RRESP(soc_lsys_in_r_bits_resp)
      ,.S1_RLAST(soc_lsys_in_r_bits_last)
      ,.S1_RVALID(soc_lsys_in_r_valid)
      ,.S1_RREADY(soc_lsys_in_r_ready)
        `ifdef AMBA_AXI_RUSER
      ,.S1_RUSER()
        `endif
        //--------------------------------------------------------------
      ,.S2_AWID(spi_master_s_axi_awid)
      ,.S2_AWADDR(spi_master_s_axi_awaddr)
      ,.S2_AWLEN(spi_master_s_axi_awlen)
      ,.S2_AWLOCK()
      ,.S2_AWSIZE()
      ,.S2_AWBURST()
        `ifdef  AMBA_AXI_CACHE
      ,.S2_AWCACHE()
        `endif
        `ifdef AMBA_AXI_PROT
      ,.S2_AWPROT()
        `endif
      ,.S2_AWVALID(spi_master_s_axi_awvalid)
      ,.S2_AWREADY(spi_master_s_axi_awready)
        `ifdef AMBA_QOS
      ,.S2_AWQOS()
      ,.S2_AWREGION()
        `endif
        `ifdef AMBA_AXI_AWUSER
      ,.S2_AWUSER()
        `endif
      ,.S2_WDATA(spi_master_s_axi_wdata)
      ,.S2_WSTRB(spi_master_s_axi_wstrb)
      ,.S2_WLAST(spi_master_s_axi_wlast)
      ,.S2_WVALID(spi_master_s_axi_wvalid)
      ,.S2_WREADY(spi_master_s_axi_wready)
        `ifdef AMBA_AXI_WUSER
      ,.S2_WUSER()
        `endif
      ,.S2_BID(spi_master_s_axi_bid)
      ,.S2_BRESP(spi_master_s_axi_bresp)
      ,.S2_BVALID(spi_master_s_axi_bvalid)
      ,.S2_BREADY(spi_master_s_axi_bready)
        `ifdef AMBA_AXI_BUSER
      ,.S2_BUSER()
        `endif
      ,.S2_ARID(spi_master_s_axi_arid)
      ,.S2_ARADDR(spi_master_s_axi_araddr)
      ,.S2_ARLEN(spi_master_s_axi_arlen)
      ,.S2_ARLOCK()
      ,.S2_ARSIZE()
      ,.S2_ARBURST()
        `ifdef  AMBA_AXI_CACHE
      ,.S2_ARCACHE()
        `endif
        `ifdef AMBA_AXI_PROT
      ,.S2_ARPROT()
        `endif
      ,.S2_ARVALID(spi_master_s_axi_arvalid)
      ,.S2_ARREADY(spi_master_s_axi_arready)
        `ifdef AMBA_QOS
      ,.S2_ARQOS()
      ,.S2_ARREGION()
        `endif
        `ifdef AMBA_AXI_ARUSER
      ,.S2_ARUSER()
        `endif
      ,.S2_RID(spi_master_s_axi_rid)
      ,.S2_RDATA(spi_master_s_axi_rdata)
      ,.S2_RRESP(spi_master_s_axi_rresp)
      ,.S2_RLAST(spi_master_s_axi_rlast)
      ,.S2_RVALID(spi_master_s_axi_rvalid)
      ,.S2_RREADY(spi_master_s_axi_rready)
        `ifdef AMBA_AXI_RUSER
      ,.S2_RUSER()
        `endif
        //--------------------------------------------------------------

      ,.M0_AWID(axi_to_pcie_x1_auto_slave_in_aw_bits_id)
      ,.M0_AWADDR(axi_to_pcie_x1_auto_slave_in_aw_bits_addr)
      ,.M0_AWLEN(axi_to_pcie_x1_auto_slave_in_aw_bits_len)
      ,.M0_AWLOCK(1'b0)
      ,.M0_AWSIZE(axi_to_pcie_x1_auto_slave_in_aw_bits_size)
      ,.M0_AWBURST(axi_to_pcie_x1_auto_slave_in_aw_bits_burst)
        `ifdef  AMBA_AXI_CACHE
      ,.M0_AWCACHE(4'b0)
        `endif
        `ifdef AMBA_AXI_PROT
      ,.M0_AWPROT(3'b0)
        `endif
      ,.M0_AWVALID(axi_to_pcie_x1_auto_slave_in_aw_valid)
      ,.M0_AWREADY(axi_to_pcie_x1_auto_slave_in_aw_ready)
        `ifdef AMBA_QOS
      ,.M0_AWQOS(4'b0)
      ,.M0_AWREGION(4'b0)
        `endif
        `ifdef AMBA_AXI_AWUSER
      ,.M0_AWUSER(1'b0)
        `endif
      ,.M0_WDATA(axi_to_pcie_x1_auto_slave_in_w_bits_data)
      ,.M0_WSTRB(axi_to_pcie_x1_auto_slave_in_w_bits_strb)
      ,.M0_WLAST(axi_to_pcie_x1_auto_slave_in_w_bits_last)
      ,.M0_WVALID(axi_to_pcie_x1_auto_slave_in_w_valid)
      ,.M0_WREADY(axi_to_pcie_x1_auto_slave_in_w_ready)
        `ifdef AMBA_AXI_WUSER
      ,.M0_WUSER(1'b0)
        `endif
      ,.M0_BID(axi_to_pcie_x1_auto_slave_in_b_bits_id)
      ,.M0_BRESP(axi_to_pcie_x1_auto_slave_in_b_bits_resp)
      ,.M0_BVALID(axi_to_pcie_x1_auto_slave_in_b_valid)
      ,.M0_BREADY(axi_to_pcie_x1_auto_slave_in_b_ready)
        `ifdef AMBA_AXI_BUSER
      ,.M0_BUSER(1'b0)
        `endif
      ,.M0_ARID(axi_to_pcie_x1_auto_slave_in_ar_bits_id)
      ,.M0_ARADDR(axi_to_pcie_x1_auto_slave_in_ar_bits_addr)
      ,.M0_ARLEN(axi_to_pcie_x1_auto_slave_in_ar_bits_len)
      ,.M0_ARLOCK(1'b0)
      ,.M0_ARSIZE(axi_to_pcie_x1_auto_slave_in_ar_bits_size)
      ,.M0_ARBURST(axi_to_pcie_x1_auto_slave_in_ar_bits_burst)
        `ifdef  AMBA_AXI_CACHE
      ,.M0_ARCACHE(4'b0)
        `endif
        `ifdef AMBA_AXI_PROT
      ,.M0_ARPROT(3'b0)
        `endif
      ,.M0_ARVALID(axi_to_pcie_x1_auto_slave_in_ar_valid)
      ,.M0_ARREADY(axi_to_pcie_x1_auto_slave_in_ar_ready)
        `ifdef AMBA_QOS
      ,.M0_ARQOS(4'b0)
      ,.M0_ARREGION(4'b0)
        `endif
        `ifdef AMBA_AXI_ARUSER
      ,.M0_ARUSER(1'b0)
        `endif
      ,.M0_RID(axi_to_pcie_x1_auto_slave_in_r_bits_id)
      ,.M0_RDATA(axi_to_pcie_x1_auto_slave_in_r_bits_data)
      ,.M0_RRESP(axi_to_pcie_x1_auto_slave_in_r_bits_resp)
      ,.M0_RLAST(axi_to_pcie_x1_auto_slave_in_r_bits_last)
      ,.M0_RVALID(axi_to_pcie_x1_auto_slave_in_r_valid)
      ,.M0_RREADY(axi_to_pcie_x1_auto_slave_in_r_ready)
        `ifdef AMBA_AXI_RUSER
      ,.M0_RUSER()
        `endif
        //--------------------------------------------------------------
      ,.M1_AWID(SLAVE_BUS_M1_UNUSED_AWID)
      ,.M1_AWADDR(SLAVE_BUS_M1_UNUSED_AWADDR)
      ,.M1_AWLEN(SLAVE_BUS_M1_UNUSED_AWLEN)
      ,.M1_AWLOCK(SLAVE_BUS_M1_UNUSED_AWLOCK)
      ,.M1_AWSIZE(SLAVE_BUS_M1_UNUSED_AWSIZE)
      ,.M1_AWBURST(SLAVE_BUS_M1_UNUSED_AWBURST)
        `ifdef  AMBA_AXI_CACHE
      ,.M1_AWCACHE(SLAVE_BUS_M1_UNUSED_AWCACHE)
        `endif
        `ifdef AMBA_AXI_PROT
      ,.M1_AWPROT(SLAVE_BUS_M1_UNUSED_AWPROT)
        `endif
      ,.M1_AWVALID(SLAVE_BUS_M1_UNUSED_AWVALID)
      ,.M1_AWREADY(SLAVE_BUS_M1_UNUSED_AWREADY)
        `ifdef AMBA_QOS
      ,.M1_AWQOS(SLAVE_BUS_M1_UNUSED_AWQOS)
      ,.M1_AWREGION(SLAVE_BUS_M1_UNUSED_AWREGION)
        `endif
        `ifdef AMBA_AXI_AWUSER
      ,.M1_AWUSER(SLAVE_BUS_M1_UNUSED_AWUSER)
        `endif
      ,.M1_WDATA(SLAVE_BUS_M1_UNUSED_WDATA)
      ,.M1_WSTRB(SLAVE_BUS_M1_UNUSED_WSTRB)
      ,.M1_WLAST(SLAVE_BUS_M1_UNUSED_WLAST)
      ,.M1_WVALID(SLAVE_BUS_M1_UNUSED_WVALID)
      ,.M1_WREADY(SLAVE_BUS_M1_UNUSED_WREADY)
        `ifdef AMBA_AXI_WUSER
      ,.M1_WUSER(SLAVE_BUS_M1_UNUSED_WUSER)
        `endif
      ,.M1_BID(SLAVE_BUS_M1_UNUSED_BID)
      ,.M1_BRESP(SLAVE_BUS_M1_UNUSED_BRESP)
      ,.M1_BVALID(SLAVE_BUS_M1_UNUSED_BVALID)
      ,.M1_BREADY(SLAVE_BUS_M1_UNUSED_BREADY)
        `ifdef AMBA_AXI_BUSER
      ,.M1_BUSER(SLAVE_BUS_M1_UNUSED_BUSER)
        `endif
      ,.M1_ARID(SLAVE_BUS_M1_UNUSED_ARID)
      ,.M1_ARADDR(SLAVE_BUS_M1_UNUSED_ARADDR)
      ,.M1_ARLEN(SLAVE_BUS_M1_UNUSED_ARLEN)
      ,.M1_ARLOCK(SLAVE_BUS_M1_UNUSED_ARLOCK)
      ,.M1_ARSIZE(SLAVE_BUS_M1_UNUSED_ARSIZE)
      ,.M1_ARBURST(SLAVE_BUS_M1_UNUSED_ARBURST)
        `ifdef  AMBA_AXI_CACHE
      ,.M1_ARCACHE(SLAVE_BUS_M1_UNUSED_ARCACHE)
        `endif
        `ifdef AMBA_AXI_PROT
      ,.M1_ARPROT(SLAVE_BUS_M1_UNUSED_ARPROT)
        `endif
      ,.M1_ARVALID(SLAVE_BUS_M1_UNUSED_ARVALID)
      ,.M1_ARREADY(SLAVE_BUS_M1_UNUSED_ARREADY)
        `ifdef AMBA_QOS
      ,.M1_ARQOS(SLAVE_BUS_M1_UNUSED_ARQOS)
      ,.M1_ARREGION(SLAVE_BUS_M1_UNUSED_ARREGION)
        `endif
        `ifdef AMBA_AXI_ARUSER
      ,.M1_ARUSER(SLAVE_BUS_M1_UNUSED_ARUSER)
        `endif
      ,.M1_RID(SLAVE_BUS_M1_UNUSED_RID)
      ,.M1_RDATA(SLAVE_BUS_M1_UNUSED_RDATA)
      ,.M1_RRESP(SLAVE_BUS_M1_UNUSED_RRESP)
      ,.M1_RLAST(SLAVE_BUS_M1_UNUSED_RLAST)
      ,.M1_RVALID(SLAVE_BUS_M1_UNUSED_RVALID)
      ,.M1_RREADY(SLAVE_BUS_M1_UNUSED_RREADY)
        `ifdef AMBA_AXI_RUSER
      ,.M1_RUSER(SLAVE_BUS_M1_UNUSED_RUSER)
      `endif
  );



  wire  spi_1_async_rst;
  ResetCatchAndSync_d3 spi_1_reset_ResetCatchAndSync_d3 ( 
    .clock(d2d_clock),
    .reset(d2d_reset|spi_1_sft_rst),
    .io_sync_reset(spi_1_async_rst)
  );

  wire  spi_slave_async_rst;
  ResetCatchAndSync_d3 spi_slave_reset_ResetCatchAndSync_d3 ( 
    .clock(d2d_clock),
    .reset(d2d_reset|spi_slave_sft_rst),
    .io_sync_reset(spi_slave_async_rst)
  );


  QSPI_SPI_WRAPPER #(
    .SPI_MASTER_AXI4_ADDRESS_WIDTH(SPI_MASTER_AXI4_ADDRESS_WIDTH),
    .SPI_MASTER_AXI4_RDATA_WIDTH(SPI_MASTER_AXI4_RDATA_WIDTH),
    .SPI_MASTER_AXI4_WDATA_WIDTH(SPI_MASTER_AXI4_WDATA_WIDTH),
    .SPI_MASTER_AXI4_USER_WIDTH(SPI_MASTER_AXI4_USER_WIDTH),
    .SPI_MASTER_AXI4_ID_WIDTH(SPI_MASTER_AXI4_ID_WIDTH),
    .SPI_MASTER_BUFFER_DEPTH(SPI_MASTER_BUFFER_DEPTH)
  )  U_QSPI_SPI_WRAPPER ( 


    .axi_aclk(d2d_clock),
    .axi_aresetn(~spi_1_async_rst),
    .axi_master_aresetn(~spi_slave_async_rst),

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

    .spi_master_events_o(spi_master_events_o),
    .spi_master_clk(spi_master_clk),
    .spi_master_csn(spi_master_csn),
    .spi_master_mode(spi_master_mode),
    .spi_master_sdi(spi_master_sdi),
    .spi_master_sdo(spi_master_sdo),
    .spi_master_sdo_oen(spi_master_sdo_oen),


    .s_axi_awvalid(spi_master_s_axi_awvalid),
    .s_axi_awid(spi_master_s_axi_awid),
    .s_axi_awlen(spi_master_s_axi_awlen),
    .s_axi_awaddr(spi_master_s_axi_awaddr),
    .s_axi_awuser(1'b0),
    .s_axi_awready(spi_master_s_axi_awready),

    .s_axi_wvalid(spi_master_s_axi_wvalid),
    .s_axi_wdata(spi_master_s_axi_wdata),
    .s_axi_wstrb(spi_master_s_axi_wstrb),
    .s_axi_wlast(spi_master_s_axi_wlast),
    .s_axi_wuser(),
    .s_axi_wready(spi_master_s_axi_wready),

    .s_axi_bvalid(spi_master_s_axi_bvalid),
    .s_axi_bid(spi_master_s_axi_bid),
    .s_axi_bresp(spi_master_s_axi_bresp),
    .s_axi_buser(),
    .s_axi_bready(spi_master_s_axi_bready),

    .s_axi_arvalid(spi_master_s_axi_arvalid),
    .s_axi_arid(spi_master_s_axi_arid),
    .s_axi_arlen(spi_master_s_axi_arlen),
    .s_axi_araddr(spi_master_s_axi_araddr),
    .s_axi_aruser(1'b0),
    .s_axi_arready(spi_master_s_axi_arready),

    .s_axi_rvalid(spi_master_s_axi_rvalid),
    .s_axi_rid(spi_master_s_axi_rid),
    .s_axi_rdata(spi_master_s_axi_rdata),
    .s_axi_rresp(spi_master_s_axi_rresp),
    .s_axi_rlast(spi_master_s_axi_rlast),
    .s_axi_ruser(),
    .s_axi_rready(spi_master_s_axi_rready),

`ifdef USE_PCIE_CONTROLLER_SLAVE
    .auto_control_in_awready(axi_to_pcie_x1_auto_control_in_aw_ready),
    .auto_control_in_awvalid(axi_to_pcie_x1_auto_control_in_aw_valid),
    .auto_control_in_awaddr(axi_to_pcie_x1_auto_control_in_aw_bits_addr),
    .auto_control_in_wready(axi_to_pcie_x1_auto_control_in_w_ready),
    .auto_control_in_wvalid(axi_to_pcie_x1_auto_control_in_w_valid),
    .auto_control_in_wdata(axi_to_pcie_x1_auto_control_in_w_bits_data),
    .auto_control_in_wstrb(axi_to_pcie_x1_auto_control_in_w_bits_strb),
    .auto_control_in_bready(axi_to_pcie_x1_auto_control_in_b_ready),
    .auto_control_in_bvalid(axi_to_pcie_x1_auto_control_in_b_valid),
    .auto_control_in_bresp(axi_to_pcie_x1_auto_control_in_b_bits_resp),
    .auto_control_in_arready(axi_to_pcie_x1_auto_control_in_ar_ready),
    .auto_control_in_arvalid(axi_to_pcie_x1_auto_control_in_ar_valid),
    .auto_control_in_araddr(axi_to_pcie_x1_auto_control_in_ar_bits_addr),
    .auto_control_in_rready(axi_to_pcie_x1_auto_control_in_r_ready),
    .auto_control_in_rvalid(axi_to_pcie_x1_auto_control_in_r_valid),
    .auto_control_in_rdata(axi_to_pcie_x1_auto_control_in_r_bits_data),
    .auto_control_in_rresp(axi_to_pcie_x1_auto_control_in_r_bits_resp),
`endif

    .auto_master_out_aw_ready(qspi_master_out_aw_ready),
    .auto_master_out_aw_valid(qspi_master_out_aw_valid),
    .auto_master_out_aw_addr(qspi_master_out_aw_addr),
    .auto_master_out_aw_len(qspi_master_out_aw_len),
    .auto_master_out_aw_size(qspi_master_out_aw_size),
    .auto_master_out_aw_burst(qspi_master_out_aw_burst),
    .auto_master_out_aw_prot(qspi_master_out_aw_prot),
    .auto_master_out_aw_region(qspi_master_out_aw_region),
    .auto_master_out_aw_cache(qspi_master_out_aw_cache),
    .auto_master_out_aw_qos(qspi_master_out_aw_qos),
    .auto_master_out_aw_id(qspi_master_out_aw_id),
    .auto_master_out_w_ready(qspi_master_out_w_ready),
    .auto_master_out_w_valid(qspi_master_out_w_valid),
    .auto_master_out_w_data(qspi_master_out_w_data),
    .auto_master_out_w_strb(qspi_master_out_w_strb),
    .auto_master_out_w_last(qspi_master_out_w_last),
    .auto_master_out_b_ready(qspi_master_out_b_ready),
    .auto_master_out_b_valid(qspi_master_out_b_valid),
    .auto_master_out_b_resp(qspi_master_out_b_resp),
    .auto_master_out_b_id(qspi_master_out_b_id),
    .auto_master_out_ar_ready(qspi_master_out_ar_ready),
    .auto_master_out_ar_valid(qspi_master_out_ar_valid),
    .auto_master_out_ar_addr(qspi_master_out_ar_addr),
    .auto_master_out_ar_len(qspi_master_out_ar_len),
    .auto_master_out_ar_size(qspi_master_out_ar_size),
    .auto_master_out_ar_burst(qspi_master_out_ar_burst),
    .auto_master_out_ar_id(qspi_master_out_ar_id),
    .auto_master_out_ar_prot(qspi_master_out_ar_prot),
    .auto_master_out_ar_region(qspi_master_out_ar_region),
    .auto_master_out_ar_cache(qspi_master_out_ar_cache),
    .auto_master_out_ar_qos(qspi_master_out_ar_qos),
    .auto_master_out_r_ready(qspi_master_out_r_ready),
    .auto_master_out_r_valid(qspi_master_out_r_valid),
    .auto_master_out_r_data(qspi_master_out_r_data),
    .auto_master_out_r_resp(qspi_master_out_r_resp),
    .auto_master_out_r_last(qspi_master_out_r_last),
    .auto_master_out_r_id(qspi_master_out_r_id)

  );


  wire soc_iram_async_rst;

  ResetCatchAndSync_d3 soc_iram_reset_ResetCatchAndSync_d3 ( 
    .clock(d2d_clock),
    .reset(d2d_reset|soc_iram_sft_rst),
    .io_sync_reset(soc_iram_async_rst)
  );

  SOC_IRAM # (
    .DATA_WIDTH(64),
    .ADDR_WIDTH(24),
    .ID_WIDTH(5),
    .PIPELINE_OUTPUT(0)
  ) U_SOC_IRAM ( 
    .clk(d2d_clock),
    .rst(soc_iram_async_rst),

    .s_axi_awready(soc_iram_in_aw_ready),
    .s_axi_awvalid(soc_iram_in_aw_valid),
    .s_axi_awlock(1'b0),
    .s_axi_awcache(4'b0),
    .s_axi_awprot(3'b0),
    .s_axi_awid(soc_iram_in_aw_bits_id),
    .s_axi_awaddr(soc_iram_in_aw_bits_addr[23:0]),
    .s_axi_awlen(soc_iram_in_aw_bits_len),
    .s_axi_awsize(soc_iram_in_aw_bits_size),
    .s_axi_awburst(soc_iram_in_aw_bits_burst),
    .s_axi_wready(soc_iram_in_w_ready),
    .s_axi_wvalid(soc_iram_in_w_valid),
    .s_axi_wdata(soc_iram_in_w_bits_data),
    .s_axi_wstrb(soc_iram_in_w_bits_strb),
    .s_axi_wlast(soc_iram_in_w_bits_last),
    .s_axi_bready(soc_iram_in_b_ready),
    .s_axi_bvalid(soc_iram_in_b_valid),
    .s_axi_bid(soc_iram_in_b_bits_id),
    .s_axi_bresp(soc_iram_in_b_bits_resp),
    .s_axi_arready(soc_iram_in_ar_ready),
    .s_axi_arvalid(soc_iram_in_ar_valid),
    .s_axi_arlock(1'b0),
    .s_axi_arcache(4'b0),
    .s_axi_arprot(3'b0),
    .s_axi_arid(soc_iram_in_ar_bits_id),
    .s_axi_araddr(soc_iram_in_ar_bits_addr[23:0]),
    .s_axi_arlen(soc_iram_in_ar_bits_len),
    .s_axi_arsize(soc_iram_in_ar_bits_size),
    .s_axi_arburst(soc_iram_in_ar_bits_burst),
    .s_axi_rready(soc_iram_in_r_ready),
    .s_axi_rvalid(soc_iram_in_r_valid),
    .s_axi_rid(soc_iram_in_r_bits_id),
    .s_axi_rdata(soc_iram_in_r_bits_data),
    .s_axi_rresp(soc_iram_in_r_bits_resp),
    .s_axi_rlast(soc_iram_in_r_bits_last)
  );

  
  wire  soc_lsys_async_rst;
  ResetCatchAndSync_d3 soc_lsys_reset_ResetCatchAndSync_d3 ( 
    .clock(d2d_clock),
    .reset(always_on_reset),
    .io_sync_reset(soc_lsys_async_rst)
  );


  SOC_LSYS # (
    .DATA_WIDTH(64),
    .ADDR_WIDTH(24),
    .ID_WIDTH(5),
    .PIPELINE_OUTPUT(0)
  ) U_SOC_LSYS ( 
    .clk(d2d_clock),
    .rst(soc_lsys_async_rst),

    .transferDataReg(transferDataReg),
    .send_1p_valid(send_1p_valid),
    .b2c_data_concat(b2c_data_concat),
    .b2c_data_valid(b2c_data_valid),
    
    .tl_master_xing_in_d_bits_resp_control(tl_master_xing_in_d_bits_resp_control),

    .tile_auto_tl_master_xing_in_d_bits_denied(tile_auto_tl_master_xing_in_d_bits_denied),
    .tile_auto_tl_master_xing_in_d_bits_corrupt(tile_auto_tl_master_xing_in_d_bits_corrupt),
  
    .tile_1_auto_tl_master_xing_in_d_bits_denied(tile_1_auto_tl_master_xing_in_d_bits_denied),
    .tile_1_auto_tl_master_xing_in_d_bits_corrupt(tile_1_auto_tl_master_xing_in_d_bits_corrupt),
  
    .tile_2_auto_tl_master_xing_in_d_bits_denied(tile_2_auto_tl_master_xing_in_d_bits_denied),
    .tile_2_auto_tl_master_xing_in_d_bits_corrupt(tile_2_auto_tl_master_xing_in_d_bits_corrupt),
  
    .tile_3_auto_tl_master_xing_in_d_bits_denied(tile_3_auto_tl_master_xing_in_d_bits_denied),
    .tile_3_auto_tl_master_xing_in_d_bits_corrupt(tile_3_auto_tl_master_xing_in_d_bits_corrupt),
   
    .reset_vector_msb_32(reset_vector_msb_32),
    .mig_input_takeover_en(mig_input_takeover_en),
    .mig_slave_base_addr_msb_4(mig_slave_base_addr_msb_4),

    .qspi_axi_master_addr_msb_16(qspi_axi_master_addr_msb_16),
    .chiplink_master_addr_msb_16(chiplink_master_addr_msb_16),
    .axi42tl_auto_in_tl_addr_msb_10(axi42tl_auto_in_tl_addr_msb_10),
    .spi_mode(spi_mode),
    .spi_master_mode(spi_master_mode),
    //.axi42tl_auto_in_aw_addr_msb_6(axi42tl_auto_in_aw_addr_msb_6),
    //.axi42tl_auto_in_ar_addr_msb_6(axi42tl_auto_in_ar_addr_msb_6),

    .use_which_clk(use_which_clk),
    .pll_cfg(pll_cfg),
    .pll_state(pll_state),
    .debug_mode_sel_latch(debug_mode_sel_latch),
    .spi_gpio_mux_sel(spi_gpio_mux_sel),

    .all_tile_sft_rst(all_tile_sft_rst),
    // .tile_0_sft_rst(tile_0_sft_rst),
    // .tile_1_sft_rst(tile_1_sft_rst),
    // .tile_2_sft_rst(tile_2_sft_rst),
    // .tile_3_sft_rst(tile_3_sft_rst),
    .chiplink_sft_rst(chiplink_sft_rst),
    .spi_0_sft_rst(spi_0_sft_rst),
    .spi_1_sft_rst(spi_1_sft_rst),
    .spi_slave_sft_rst(spi_slave_sft_rst),
    .gpio_sft_rst(gpio_sft_rst),
    .uart_sft_rst(uart_sft_rst),
    .soc_iram_sft_rst(soc_iram_sft_rst),
    .soc_lsys_sft_rst(soc_lsys_sft_rst),
    .soc_sft_rst(soc_sft_rst),
    .global_soft_reset_req(global_soft_reset_req),

    .s_axi_awready(soc_lsys_in_aw_ready),
    .s_axi_awvalid(soc_lsys_in_aw_valid),
    .s_axi_awlock(1'b0),
    .s_axi_awcache(4'b0),
    .s_axi_awprot(3'b0),
    .s_axi_awid(soc_lsys_in_aw_bits_id),
    .s_axi_awaddr(soc_lsys_in_aw_bits_addr[23:0]),
    .s_axi_awlen(soc_lsys_in_aw_bits_len),
    .s_axi_awsize(soc_lsys_in_aw_bits_size),
    .s_axi_awburst(soc_lsys_in_aw_bits_burst),
    .s_axi_wready(soc_lsys_in_w_ready),
    .s_axi_wvalid(soc_lsys_in_w_valid),
    .s_axi_wdata(soc_lsys_in_w_bits_data),
    .s_axi_wstrb(soc_lsys_in_w_bits_strb),
    .s_axi_wlast(soc_lsys_in_w_bits_last),
    .s_axi_bready(soc_lsys_in_b_ready),
    .s_axi_bvalid(soc_lsys_in_b_valid),
    .s_axi_bid(soc_lsys_in_b_bits_id),
    .s_axi_bresp(soc_lsys_in_b_bits_resp),
    .s_axi_arready(soc_lsys_in_ar_ready),
    .s_axi_arvalid(soc_lsys_in_ar_valid),
    .s_axi_arlock(1'b0),
    .s_axi_arcache(4'b0),
    .s_axi_arprot(3'b0),
    .s_axi_arid(soc_lsys_in_ar_bits_id),
    .s_axi_araddr(soc_lsys_in_ar_bits_addr[23:0]),
    .s_axi_arlen(soc_lsys_in_ar_bits_len),
    .s_axi_arsize(soc_lsys_in_ar_bits_size),
    .s_axi_arburst(soc_lsys_in_ar_bits_burst),
    .s_axi_rready(soc_lsys_in_r_ready),
    .s_axi_rvalid(soc_lsys_in_r_valid),
    .s_axi_rid(soc_lsys_in_r_bits_id),
    .s_axi_rdata(soc_lsys_in_r_bits_data),
    .s_axi_rresp(soc_lsys_in_r_bits_resp),
    .s_axi_rlast(soc_lsys_in_r_bits_last)
  );

  AXI4Buffer axi4buf ( 
    .clock(axi4buf_clock),
    .reset(axi4buf_reset),
    .auto_in_aw_ready(axi4buf_auto_in_aw_ready),
    .auto_in_aw_valid(axi4buf_auto_in_aw_valid),
    .auto_in_aw_bits_id(axi4buf_auto_in_aw_bits_id),
    .auto_in_aw_bits_addr(axi4buf_auto_in_aw_bits_addr),
    .auto_in_aw_bits_len(axi4buf_auto_in_aw_bits_len),
    .auto_in_aw_bits_size(axi4buf_auto_in_aw_bits_size),
    .auto_in_aw_bits_burst(axi4buf_auto_in_aw_bits_burst),
    .auto_in_w_ready(axi4buf_auto_in_w_ready),
    .auto_in_w_valid(axi4buf_auto_in_w_valid),
    .auto_in_w_bits_data(axi4buf_auto_in_w_bits_data),
    .auto_in_w_bits_strb(axi4buf_auto_in_w_bits_strb),
    .auto_in_w_bits_last(axi4buf_auto_in_w_bits_last),
    .auto_in_b_ready(axi4buf_auto_in_b_ready),
    .auto_in_b_valid(axi4buf_auto_in_b_valid),
    .auto_in_b_bits_id(axi4buf_auto_in_b_bits_id),
    .auto_in_b_bits_resp(axi4buf_auto_in_b_bits_resp),
    .auto_in_ar_ready(axi4buf_auto_in_ar_ready),
    .auto_in_ar_valid(axi4buf_auto_in_ar_valid),
    .auto_in_ar_bits_id(axi4buf_auto_in_ar_bits_id),
    .auto_in_ar_bits_addr(axi4buf_auto_in_ar_bits_addr),
    .auto_in_ar_bits_len(axi4buf_auto_in_ar_bits_len),
    .auto_in_ar_bits_size(axi4buf_auto_in_ar_bits_size),
    .auto_in_ar_bits_burst(axi4buf_auto_in_ar_bits_burst),
    .auto_in_r_ready(axi4buf_auto_in_r_ready),
    .auto_in_r_valid(axi4buf_auto_in_r_valid),
    .auto_in_r_bits_id(axi4buf_auto_in_r_bits_id),
    .auto_in_r_bits_data(axi4buf_auto_in_r_bits_data),
    .auto_in_r_bits_resp(axi4buf_auto_in_r_bits_resp),
    .auto_in_r_bits_last(axi4buf_auto_in_r_bits_last),
    .auto_out_aw_ready(axi4buf_auto_out_aw_ready),
    .auto_out_aw_valid(axi4buf_auto_out_aw_valid),
    .auto_out_aw_bits_id(axi4buf_auto_out_aw_bits_id),
    .auto_out_aw_bits_addr(axi4buf_auto_out_aw_bits_addr),
    .auto_out_aw_bits_len(axi4buf_auto_out_aw_bits_len),
    .auto_out_aw_bits_size(axi4buf_auto_out_aw_bits_size),
    .auto_out_aw_bits_burst(axi4buf_auto_out_aw_bits_burst),
    .auto_out_w_ready(axi4buf_auto_out_w_ready),
    .auto_out_w_valid(axi4buf_auto_out_w_valid),
    .auto_out_w_bits_data(axi4buf_auto_out_w_bits_data),
    .auto_out_w_bits_strb(axi4buf_auto_out_w_bits_strb),
    .auto_out_w_bits_last(axi4buf_auto_out_w_bits_last),
    .auto_out_b_ready(axi4buf_auto_out_b_ready),
    .auto_out_b_valid(axi4buf_auto_out_b_valid),
    .auto_out_b_bits_id(axi4buf_auto_out_b_bits_id),
    .auto_out_b_bits_resp(axi4buf_auto_out_b_bits_resp),
    .auto_out_ar_ready(axi4buf_auto_out_ar_ready),
    .auto_out_ar_valid(axi4buf_auto_out_ar_valid),
    .auto_out_ar_bits_id(axi4buf_auto_out_ar_bits_id),
    .auto_out_ar_bits_addr(axi4buf_auto_out_ar_bits_addr),
    .auto_out_ar_bits_len(axi4buf_auto_out_ar_bits_len),
    .auto_out_ar_bits_size(axi4buf_auto_out_ar_bits_size),
    .auto_out_ar_bits_burst(axi4buf_auto_out_ar_bits_burst),
    .auto_out_r_ready(axi4buf_auto_out_r_ready),
    .auto_out_r_valid(axi4buf_auto_out_r_valid),
    .auto_out_r_bits_id(axi4buf_auto_out_r_bits_id),
    .auto_out_r_bits_data(axi4buf_auto_out_r_bits_data),
    .auto_out_r_bits_resp(axi4buf_auto_out_r_bits_resp),
    .auto_out_r_bits_last(axi4buf_auto_out_r_bits_last)
  );
  AXI4UserYanker_1 axi4yank ( 
    .clock(axi4yank_clock),
    .reset(axi4yank_reset),
    .auto_in_aw_ready(axi4yank_auto_in_aw_ready),
    .auto_in_aw_valid(axi4yank_auto_in_aw_valid),
    .auto_in_aw_bits_id(axi4yank_auto_in_aw_bits_id),
    .auto_in_aw_bits_addr(axi4yank_auto_in_aw_bits_addr),
    .auto_in_aw_bits_len(axi4yank_auto_in_aw_bits_len),
    .auto_in_aw_bits_size(axi4yank_auto_in_aw_bits_size),
    .auto_in_aw_bits_burst(axi4yank_auto_in_aw_bits_burst),
    .auto_in_aw_bits_user(axi4yank_auto_in_aw_bits_user),
    .auto_in_w_ready(axi4yank_auto_in_w_ready),
    .auto_in_w_valid(axi4yank_auto_in_w_valid),
    .auto_in_w_bits_data(axi4yank_auto_in_w_bits_data),
    .auto_in_w_bits_strb(axi4yank_auto_in_w_bits_strb),
    .auto_in_w_bits_last(axi4yank_auto_in_w_bits_last),
    .auto_in_b_ready(axi4yank_auto_in_b_ready),
    .auto_in_b_valid(axi4yank_auto_in_b_valid),
    .auto_in_b_bits_id(axi4yank_auto_in_b_bits_id),
    .auto_in_b_bits_resp(axi4yank_auto_in_b_bits_resp),
    .auto_in_b_bits_user(axi4yank_auto_in_b_bits_user),
    .auto_in_ar_ready(axi4yank_auto_in_ar_ready),
    .auto_in_ar_valid(axi4yank_auto_in_ar_valid),
    .auto_in_ar_bits_id(axi4yank_auto_in_ar_bits_id),
    .auto_in_ar_bits_addr(axi4yank_auto_in_ar_bits_addr),
    .auto_in_ar_bits_len(axi4yank_auto_in_ar_bits_len),
    .auto_in_ar_bits_size(axi4yank_auto_in_ar_bits_size),
    .auto_in_ar_bits_burst(axi4yank_auto_in_ar_bits_burst),
    .auto_in_ar_bits_user(axi4yank_auto_in_ar_bits_user),
    .auto_in_r_ready(axi4yank_auto_in_r_ready),
    .auto_in_r_valid(axi4yank_auto_in_r_valid),
    .auto_in_r_bits_id(axi4yank_auto_in_r_bits_id),
    .auto_in_r_bits_data(axi4yank_auto_in_r_bits_data),
    .auto_in_r_bits_resp(axi4yank_auto_in_r_bits_resp),
    .auto_in_r_bits_user(axi4yank_auto_in_r_bits_user),
    .auto_in_r_bits_last(axi4yank_auto_in_r_bits_last),
    .auto_out_aw_ready(axi4yank_auto_out_aw_ready),
    .auto_out_aw_valid(axi4yank_auto_out_aw_valid),
    .auto_out_aw_bits_id(axi4yank_auto_out_aw_bits_id),
    .auto_out_aw_bits_addr(axi4yank_auto_out_aw_bits_addr),
    .auto_out_aw_bits_len(axi4yank_auto_out_aw_bits_len),
    .auto_out_aw_bits_size(axi4yank_auto_out_aw_bits_size),
    .auto_out_aw_bits_burst(axi4yank_auto_out_aw_bits_burst),
    .auto_out_w_ready(axi4yank_auto_out_w_ready),
    .auto_out_w_valid(axi4yank_auto_out_w_valid),
    .auto_out_w_bits_data(axi4yank_auto_out_w_bits_data),
    .auto_out_w_bits_strb(axi4yank_auto_out_w_bits_strb),
    .auto_out_w_bits_last(axi4yank_auto_out_w_bits_last),
    .auto_out_b_ready(axi4yank_auto_out_b_ready),
    .auto_out_b_valid(axi4yank_auto_out_b_valid),
    .auto_out_b_bits_id(axi4yank_auto_out_b_bits_id),
    .auto_out_b_bits_resp(axi4yank_auto_out_b_bits_resp),
    .auto_out_ar_ready(axi4yank_auto_out_ar_ready),
    .auto_out_ar_valid(axi4yank_auto_out_ar_valid),
    .auto_out_ar_bits_id(axi4yank_auto_out_ar_bits_id),
    .auto_out_ar_bits_addr(axi4yank_auto_out_ar_bits_addr),
    .auto_out_ar_bits_len(axi4yank_auto_out_ar_bits_len),
    .auto_out_ar_bits_size(axi4yank_auto_out_ar_bits_size),
    .auto_out_ar_bits_burst(axi4yank_auto_out_ar_bits_burst),
    .auto_out_r_ready(axi4yank_auto_out_r_ready),
    .auto_out_r_valid(axi4yank_auto_out_r_valid),
    .auto_out_r_bits_id(axi4yank_auto_out_r_bits_id),
    .auto_out_r_bits_data(axi4yank_auto_out_r_bits_data),
    .auto_out_r_bits_resp(axi4yank_auto_out_r_bits_resp),
    .auto_out_r_bits_last(axi4yank_auto_out_r_bits_last)
  );
  AXI4Deinterleaver_1 axi4deint ( 
    .clock(axi4deint_clock),
    .reset(axi4deint_reset),
    .auto_in_aw_ready(axi4deint_auto_in_aw_ready),
    .auto_in_aw_valid(axi4deint_auto_in_aw_valid),
    .auto_in_aw_bits_id(axi4deint_auto_in_aw_bits_id),
    .auto_in_aw_bits_addr(axi4deint_auto_in_aw_bits_addr),
    .auto_in_aw_bits_len(axi4deint_auto_in_aw_bits_len),
    .auto_in_aw_bits_size(axi4deint_auto_in_aw_bits_size),
    .auto_in_aw_bits_burst(axi4deint_auto_in_aw_bits_burst),
    .auto_in_aw_bits_user(axi4deint_auto_in_aw_bits_user),
    .auto_in_w_ready(axi4deint_auto_in_w_ready),
    .auto_in_w_valid(axi4deint_auto_in_w_valid),
    .auto_in_w_bits_data(axi4deint_auto_in_w_bits_data),
    .auto_in_w_bits_strb(axi4deint_auto_in_w_bits_strb),
    .auto_in_w_bits_last(axi4deint_auto_in_w_bits_last),
    .auto_in_b_ready(axi4deint_auto_in_b_ready),
    .auto_in_b_valid(axi4deint_auto_in_b_valid),
    .auto_in_b_bits_id(axi4deint_auto_in_b_bits_id),
    .auto_in_b_bits_resp(axi4deint_auto_in_b_bits_resp),
    .auto_in_b_bits_user(axi4deint_auto_in_b_bits_user),
    .auto_in_ar_ready(axi4deint_auto_in_ar_ready),
    .auto_in_ar_valid(axi4deint_auto_in_ar_valid),
    .auto_in_ar_bits_id(axi4deint_auto_in_ar_bits_id),
    .auto_in_ar_bits_addr(axi4deint_auto_in_ar_bits_addr),
    .auto_in_ar_bits_len(axi4deint_auto_in_ar_bits_len),
    .auto_in_ar_bits_size(axi4deint_auto_in_ar_bits_size),
    .auto_in_ar_bits_burst(axi4deint_auto_in_ar_bits_burst),
    .auto_in_ar_bits_user(axi4deint_auto_in_ar_bits_user),
    .auto_in_r_ready(axi4deint_auto_in_r_ready),
    .auto_in_r_valid(axi4deint_auto_in_r_valid),
    .auto_in_r_bits_id(axi4deint_auto_in_r_bits_id),
    .auto_in_r_bits_data(axi4deint_auto_in_r_bits_data),
    .auto_in_r_bits_resp(axi4deint_auto_in_r_bits_resp),
    .auto_in_r_bits_user(axi4deint_auto_in_r_bits_user),
    .auto_in_r_bits_last(axi4deint_auto_in_r_bits_last),
    .auto_out_aw_ready(axi4deint_auto_out_aw_ready),
    .auto_out_aw_valid(axi4deint_auto_out_aw_valid),
    .auto_out_aw_bits_id(axi4deint_auto_out_aw_bits_id),
    .auto_out_aw_bits_addr(axi4deint_auto_out_aw_bits_addr),
    .auto_out_aw_bits_len(axi4deint_auto_out_aw_bits_len),
    .auto_out_aw_bits_size(axi4deint_auto_out_aw_bits_size),
    .auto_out_aw_bits_burst(axi4deint_auto_out_aw_bits_burst),
    .auto_out_aw_bits_user(axi4deint_auto_out_aw_bits_user),
    .auto_out_w_ready(axi4deint_auto_out_w_ready),
    .auto_out_w_valid(axi4deint_auto_out_w_valid),
    .auto_out_w_bits_data(axi4deint_auto_out_w_bits_data),
    .auto_out_w_bits_strb(axi4deint_auto_out_w_bits_strb),
    .auto_out_w_bits_last(axi4deint_auto_out_w_bits_last),
    .auto_out_b_ready(axi4deint_auto_out_b_ready),
    .auto_out_b_valid(axi4deint_auto_out_b_valid),
    .auto_out_b_bits_id(axi4deint_auto_out_b_bits_id),
    .auto_out_b_bits_resp(axi4deint_auto_out_b_bits_resp),
    .auto_out_b_bits_user(axi4deint_auto_out_b_bits_user),
    .auto_out_ar_ready(axi4deint_auto_out_ar_ready),
    .auto_out_ar_valid(axi4deint_auto_out_ar_valid),
    .auto_out_ar_bits_id(axi4deint_auto_out_ar_bits_id),
    .auto_out_ar_bits_addr(axi4deint_auto_out_ar_bits_addr),
    .auto_out_ar_bits_len(axi4deint_auto_out_ar_bits_len),
    .auto_out_ar_bits_size(axi4deint_auto_out_ar_bits_size),
    .auto_out_ar_bits_burst(axi4deint_auto_out_ar_bits_burst),
    .auto_out_ar_bits_user(axi4deint_auto_out_ar_bits_user),
    .auto_out_r_ready(axi4deint_auto_out_r_ready),
    .auto_out_r_valid(axi4deint_auto_out_r_valid),
    .auto_out_r_bits_id(axi4deint_auto_out_r_bits_id),
    .auto_out_r_bits_data(axi4deint_auto_out_r_bits_data),
    .auto_out_r_bits_resp(axi4deint_auto_out_r_bits_resp),
    .auto_out_r_bits_user(axi4deint_auto_out_r_bits_user),
    .auto_out_r_bits_last(axi4deint_auto_out_r_bits_last)
  );
  AXI4IdIndexer_1 axi4index ( 
    .auto_in_aw_ready(axi4index_auto_in_aw_ready),
    .auto_in_aw_valid(axi4index_auto_in_aw_valid),
    .auto_in_aw_bits_id(axi4index_auto_in_aw_bits_id),
    .auto_in_aw_bits_addr(axi4index_auto_in_aw_bits_addr),
    .auto_in_aw_bits_len(axi4index_auto_in_aw_bits_len),
    .auto_in_aw_bits_size(axi4index_auto_in_aw_bits_size),
    .auto_in_aw_bits_burst(axi4index_auto_in_aw_bits_burst),
    .auto_in_aw_bits_user(axi4index_auto_in_aw_bits_user),
    .auto_in_w_ready(axi4index_auto_in_w_ready),
    .auto_in_w_valid(axi4index_auto_in_w_valid),
    .auto_in_w_bits_data(axi4index_auto_in_w_bits_data),
    .auto_in_w_bits_strb(axi4index_auto_in_w_bits_strb),
    .auto_in_w_bits_last(axi4index_auto_in_w_bits_last),
    .auto_in_b_ready(axi4index_auto_in_b_ready),
    .auto_in_b_valid(axi4index_auto_in_b_valid),
    .auto_in_b_bits_id(axi4index_auto_in_b_bits_id),
    .auto_in_b_bits_resp(axi4index_auto_in_b_bits_resp),
    .auto_in_b_bits_user(axi4index_auto_in_b_bits_user),
    .auto_in_ar_ready(axi4index_auto_in_ar_ready),
    .auto_in_ar_valid(axi4index_auto_in_ar_valid),
    .auto_in_ar_bits_id(axi4index_auto_in_ar_bits_id),
    .auto_in_ar_bits_addr(axi4index_auto_in_ar_bits_addr),
    .auto_in_ar_bits_len(axi4index_auto_in_ar_bits_len),
    .auto_in_ar_bits_size(axi4index_auto_in_ar_bits_size),
    .auto_in_ar_bits_burst(axi4index_auto_in_ar_bits_burst),
    .auto_in_ar_bits_user(axi4index_auto_in_ar_bits_user),
    .auto_in_r_ready(axi4index_auto_in_r_ready),
    .auto_in_r_valid(axi4index_auto_in_r_valid),
    .auto_in_r_bits_id(axi4index_auto_in_r_bits_id),
    .auto_in_r_bits_data(axi4index_auto_in_r_bits_data),
    .auto_in_r_bits_resp(axi4index_auto_in_r_bits_resp),
    .auto_in_r_bits_user(axi4index_auto_in_r_bits_user),
    .auto_in_r_bits_last(axi4index_auto_in_r_bits_last),
    .auto_out_aw_ready(axi4index_auto_out_aw_ready),
    .auto_out_aw_valid(axi4index_auto_out_aw_valid),
    .auto_out_aw_bits_id(axi4index_auto_out_aw_bits_id),
    .auto_out_aw_bits_addr(axi4index_auto_out_aw_bits_addr),
    .auto_out_aw_bits_len(axi4index_auto_out_aw_bits_len),
    .auto_out_aw_bits_size(axi4index_auto_out_aw_bits_size),
    .auto_out_aw_bits_burst(axi4index_auto_out_aw_bits_burst),
    .auto_out_aw_bits_user(axi4index_auto_out_aw_bits_user),
    .auto_out_w_ready(axi4index_auto_out_w_ready),
    .auto_out_w_valid(axi4index_auto_out_w_valid),
    .auto_out_w_bits_data(axi4index_auto_out_w_bits_data),
    .auto_out_w_bits_strb(axi4index_auto_out_w_bits_strb),
    .auto_out_w_bits_last(axi4index_auto_out_w_bits_last),
    .auto_out_b_ready(axi4index_auto_out_b_ready),
    .auto_out_b_valid(axi4index_auto_out_b_valid),
    .auto_out_b_bits_id(axi4index_auto_out_b_bits_id),
    .auto_out_b_bits_resp(axi4index_auto_out_b_bits_resp),
    .auto_out_b_bits_user(axi4index_auto_out_b_bits_user),
    .auto_out_ar_ready(axi4index_auto_out_ar_ready),
    .auto_out_ar_valid(axi4index_auto_out_ar_valid),
    .auto_out_ar_bits_id(axi4index_auto_out_ar_bits_id),
    .auto_out_ar_bits_addr(axi4index_auto_out_ar_bits_addr),
    .auto_out_ar_bits_len(axi4index_auto_out_ar_bits_len),
    .auto_out_ar_bits_size(axi4index_auto_out_ar_bits_size),
    .auto_out_ar_bits_burst(axi4index_auto_out_ar_bits_burst),
    .auto_out_ar_bits_user(axi4index_auto_out_ar_bits_user),
    .auto_out_r_ready(axi4index_auto_out_r_ready),
    .auto_out_r_valid(axi4index_auto_out_r_valid),
    .auto_out_r_bits_id(axi4index_auto_out_r_bits_id),
    .auto_out_r_bits_data(axi4index_auto_out_r_bits_data),
    .auto_out_r_bits_resp(axi4index_auto_out_r_bits_resp),
    .auto_out_r_bits_user(axi4index_auto_out_r_bits_user),
    .auto_out_r_bits_last(axi4index_auto_out_r_bits_last)
  );

  TLToAXI4_1 tl2axi4 ( 
    .clock(tl2axi4_clock),
    .reset(tl2axi4_reset),
    .auto_in_a_ready(tl2axi4_auto_in_a_ready),
    .auto_in_a_valid(tl2axi4_auto_in_a_valid),
    .auto_in_a_bits_opcode(tl2axi4_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(tl2axi4_auto_in_a_bits_param),
    .auto_in_a_bits_size(tl2axi4_auto_in_a_bits_size),
    .auto_in_a_bits_source(tl2axi4_auto_in_a_bits_source),
    .auto_in_a_bits_address(tl2axi4_auto_in_a_bits_address),
    .auto_in_a_bits_mask(tl2axi4_auto_in_a_bits_mask),
    .auto_in_a_bits_data(tl2axi4_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(tl2axi4_auto_in_a_bits_corrupt),
    .auto_in_d_ready(tl2axi4_auto_in_d_ready),
    .auto_in_d_valid(tl2axi4_auto_in_d_valid),
    .auto_in_d_bits_opcode(tl2axi4_auto_in_d_bits_opcode),
    .auto_in_d_bits_size(tl2axi4_auto_in_d_bits_size),
    .auto_in_d_bits_source(tl2axi4_auto_in_d_bits_source),
    .auto_in_d_bits_denied(tl2axi4_auto_in_d_bits_denied),
    .auto_in_d_bits_data(tl2axi4_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(tl2axi4_auto_in_d_bits_corrupt),
    .auto_out_aw_ready(tl2axi4_auto_out_aw_ready),
    .auto_out_aw_valid(tl2axi4_auto_out_aw_valid),
    .auto_out_aw_bits_id(tl2axi4_auto_out_aw_bits_id),
    .auto_out_aw_bits_addr(tl2axi4_auto_out_aw_bits_addr),
    .auto_out_aw_bits_len(tl2axi4_auto_out_aw_bits_len),
    .auto_out_aw_bits_size(tl2axi4_auto_out_aw_bits_size),
    .auto_out_aw_bits_burst(tl2axi4_auto_out_aw_bits_burst),
    .auto_out_aw_bits_user(tl2axi4_auto_out_aw_bits_user),
    .auto_out_w_ready(tl2axi4_auto_out_w_ready),
    .auto_out_w_valid(tl2axi4_auto_out_w_valid),
    .auto_out_w_bits_data(tl2axi4_auto_out_w_bits_data),
    .auto_out_w_bits_strb(tl2axi4_auto_out_w_bits_strb),
    .auto_out_w_bits_last(tl2axi4_auto_out_w_bits_last),
    .auto_out_b_ready(tl2axi4_auto_out_b_ready),
    .auto_out_b_valid(tl2axi4_auto_out_b_valid),
    .auto_out_b_bits_id(tl2axi4_auto_out_b_bits_id),
    .auto_out_b_bits_resp(tl2axi4_auto_out_b_bits_resp),
    .auto_out_b_bits_user(tl2axi4_auto_out_b_bits_user),
    .auto_out_ar_ready(tl2axi4_auto_out_ar_ready),
    .auto_out_ar_valid(tl2axi4_auto_out_ar_valid),
    .auto_out_ar_bits_id(tl2axi4_auto_out_ar_bits_id),
    .auto_out_ar_bits_addr(tl2axi4_auto_out_ar_bits_addr),
    .auto_out_ar_bits_len(tl2axi4_auto_out_ar_bits_len),
    .auto_out_ar_bits_size(tl2axi4_auto_out_ar_bits_size),
    .auto_out_ar_bits_burst(tl2axi4_auto_out_ar_bits_burst),
    .auto_out_ar_bits_user(tl2axi4_auto_out_ar_bits_user),
    .auto_out_r_ready(tl2axi4_auto_out_r_ready),
    .auto_out_r_valid(tl2axi4_auto_out_r_valid),
    .auto_out_r_bits_id(tl2axi4_auto_out_r_bits_id),
    .auto_out_r_bits_data(tl2axi4_auto_out_r_bits_data),
    .auto_out_r_bits_resp(tl2axi4_auto_out_r_bits_resp),
    .auto_out_r_bits_user(tl2axi4_auto_out_r_bits_user),
    .auto_out_r_bits_last(tl2axi4_auto_out_r_bits_last)
  );
  AXI4Buffer_1 axi4buf_1 ( 
    .clock(axi4buf_1_clock),
    .reset(axi4buf_1_reset),
    .auto_in_aw_ready(axi4buf_1_auto_in_aw_ready),
    .auto_in_aw_valid(axi4buf_1_auto_in_aw_valid),
    .auto_in_aw_bits_addr(axi4buf_1_auto_in_aw_bits_addr),
    .auto_in_w_ready(axi4buf_1_auto_in_w_ready),
    .auto_in_w_valid(axi4buf_1_auto_in_w_valid),
    .auto_in_w_bits_data(axi4buf_1_auto_in_w_bits_data),
    .auto_in_w_bits_strb(axi4buf_1_auto_in_w_bits_strb),
    .auto_in_b_ready(axi4buf_1_auto_in_b_ready),
    .auto_in_b_valid(axi4buf_1_auto_in_b_valid),
    .auto_in_b_bits_resp(axi4buf_1_auto_in_b_bits_resp),
    .auto_in_ar_ready(axi4buf_1_auto_in_ar_ready),
    .auto_in_ar_valid(axi4buf_1_auto_in_ar_valid),
    .auto_in_ar_bits_addr(axi4buf_1_auto_in_ar_bits_addr),
    .auto_in_r_ready(axi4buf_1_auto_in_r_ready),
    .auto_in_r_valid(axi4buf_1_auto_in_r_valid),
    .auto_in_r_bits_data(axi4buf_1_auto_in_r_bits_data),
    .auto_in_r_bits_resp(axi4buf_1_auto_in_r_bits_resp),
    .auto_in_r_bits_last(axi4buf_1_auto_in_r_bits_last),
    .auto_out_aw_ready(axi4buf_1_auto_out_aw_ready),
    .auto_out_aw_valid(axi4buf_1_auto_out_aw_valid),
    .auto_out_aw_bits_addr(axi4buf_1_auto_out_aw_bits_addr),
    .auto_out_w_ready(axi4buf_1_auto_out_w_ready),
    .auto_out_w_valid(axi4buf_1_auto_out_w_valid),
    .auto_out_w_bits_data(axi4buf_1_auto_out_w_bits_data),
    .auto_out_w_bits_strb(axi4buf_1_auto_out_w_bits_strb),
    .auto_out_b_ready(axi4buf_1_auto_out_b_ready),
    .auto_out_b_valid(axi4buf_1_auto_out_b_valid),
    .auto_out_b_bits_resp(axi4buf_1_auto_out_b_bits_resp),
    .auto_out_ar_ready(axi4buf_1_auto_out_ar_ready),
    .auto_out_ar_valid(axi4buf_1_auto_out_ar_valid),
    .auto_out_ar_bits_addr(axi4buf_1_auto_out_ar_bits_addr),
    .auto_out_r_ready(axi4buf_1_auto_out_r_ready),
    .auto_out_r_valid(axi4buf_1_auto_out_r_valid),
    .auto_out_r_bits_data(axi4buf_1_auto_out_r_bits_data),
    .auto_out_r_bits_resp(axi4buf_1_auto_out_r_bits_resp)
  );
  AXI4UserYanker_2 axi4yank_1 ( 
    .clock(axi4yank_1_clock),
    .reset(axi4yank_1_reset),
    .auto_in_aw_ready(axi4yank_1_auto_in_aw_ready),
    .auto_in_aw_valid(axi4yank_1_auto_in_aw_valid),
    .auto_in_aw_bits_addr(axi4yank_1_auto_in_aw_bits_addr),
    .auto_in_aw_bits_user(axi4yank_1_auto_in_aw_bits_user),
    .auto_in_w_ready(axi4yank_1_auto_in_w_ready),
    .auto_in_w_valid(axi4yank_1_auto_in_w_valid),
    .auto_in_w_bits_data(axi4yank_1_auto_in_w_bits_data),
    .auto_in_w_bits_strb(axi4yank_1_auto_in_w_bits_strb),
    .auto_in_b_ready(axi4yank_1_auto_in_b_ready),
    .auto_in_b_valid(axi4yank_1_auto_in_b_valid),
    .auto_in_b_bits_resp(axi4yank_1_auto_in_b_bits_resp),
    .auto_in_b_bits_user(axi4yank_1_auto_in_b_bits_user),
    .auto_in_ar_ready(axi4yank_1_auto_in_ar_ready),
    .auto_in_ar_valid(axi4yank_1_auto_in_ar_valid),
    .auto_in_ar_bits_addr(axi4yank_1_auto_in_ar_bits_addr),
    .auto_in_ar_bits_user(axi4yank_1_auto_in_ar_bits_user),
    .auto_in_r_ready(axi4yank_1_auto_in_r_ready),
    .auto_in_r_valid(axi4yank_1_auto_in_r_valid),
    .auto_in_r_bits_data(axi4yank_1_auto_in_r_bits_data),
    .auto_in_r_bits_resp(axi4yank_1_auto_in_r_bits_resp),
    .auto_in_r_bits_user(axi4yank_1_auto_in_r_bits_user),
    .auto_in_r_bits_last(axi4yank_1_auto_in_r_bits_last),
    .auto_out_aw_ready(axi4yank_1_auto_out_aw_ready),
    .auto_out_aw_valid(axi4yank_1_auto_out_aw_valid),
    .auto_out_aw_bits_addr(axi4yank_1_auto_out_aw_bits_addr),
    .auto_out_w_ready(axi4yank_1_auto_out_w_ready),
    .auto_out_w_valid(axi4yank_1_auto_out_w_valid),
    .auto_out_w_bits_data(axi4yank_1_auto_out_w_bits_data),
    .auto_out_w_bits_strb(axi4yank_1_auto_out_w_bits_strb),
    .auto_out_b_ready(axi4yank_1_auto_out_b_ready),
    .auto_out_b_valid(axi4yank_1_auto_out_b_valid),
    .auto_out_b_bits_resp(axi4yank_1_auto_out_b_bits_resp),
    .auto_out_ar_ready(axi4yank_1_auto_out_ar_ready),
    .auto_out_ar_valid(axi4yank_1_auto_out_ar_valid),
    .auto_out_ar_bits_addr(axi4yank_1_auto_out_ar_bits_addr),
    .auto_out_r_ready(axi4yank_1_auto_out_r_ready),
    .auto_out_r_valid(axi4yank_1_auto_out_r_valid),
    .auto_out_r_bits_data(axi4yank_1_auto_out_r_bits_data),
    .auto_out_r_bits_resp(axi4yank_1_auto_out_r_bits_resp),
    .auto_out_r_bits_last(axi4yank_1_auto_out_r_bits_last)
  );
  TLToAXI4_2 tl2axi4_1 ( 
    .clock(tl2axi4_1_clock),
    .reset(tl2axi4_1_reset),
    .auto_in_a_ready(tl2axi4_1_auto_in_a_ready),
    .auto_in_a_valid(tl2axi4_1_auto_in_a_valid),
    .auto_in_a_bits_opcode(tl2axi4_1_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(tl2axi4_1_auto_in_a_bits_param),
    .auto_in_a_bits_size(tl2axi4_1_auto_in_a_bits_size),
    .auto_in_a_bits_source(tl2axi4_1_auto_in_a_bits_source),
    .auto_in_a_bits_address(tl2axi4_1_auto_in_a_bits_address),
    .auto_in_a_bits_mask(tl2axi4_1_auto_in_a_bits_mask),
    .auto_in_a_bits_data(tl2axi4_1_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(tl2axi4_1_auto_in_a_bits_corrupt),
    .auto_in_d_ready(tl2axi4_1_auto_in_d_ready),
    .auto_in_d_valid(tl2axi4_1_auto_in_d_valid),
    .auto_in_d_bits_opcode(tl2axi4_1_auto_in_d_bits_opcode),
    .auto_in_d_bits_size(tl2axi4_1_auto_in_d_bits_size),
    .auto_in_d_bits_source(tl2axi4_1_auto_in_d_bits_source),
    .auto_in_d_bits_denied(tl2axi4_1_auto_in_d_bits_denied),
    .auto_in_d_bits_data(tl2axi4_1_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(tl2axi4_1_auto_in_d_bits_corrupt),
    .auto_out_aw_ready(tl2axi4_1_auto_out_aw_ready),
    .auto_out_aw_valid(tl2axi4_1_auto_out_aw_valid),
    .auto_out_aw_bits_addr(tl2axi4_1_auto_out_aw_bits_addr),
    .auto_out_aw_bits_user(tl2axi4_1_auto_out_aw_bits_user),
    .auto_out_w_ready(tl2axi4_1_auto_out_w_ready),
    .auto_out_w_valid(tl2axi4_1_auto_out_w_valid),
    .auto_out_w_bits_data(tl2axi4_1_auto_out_w_bits_data),
    .auto_out_w_bits_strb(tl2axi4_1_auto_out_w_bits_strb),
    .auto_out_b_ready(tl2axi4_1_auto_out_b_ready),
    .auto_out_b_valid(tl2axi4_1_auto_out_b_valid),
    .auto_out_b_bits_resp(tl2axi4_1_auto_out_b_bits_resp),
    .auto_out_b_bits_user(tl2axi4_1_auto_out_b_bits_user),
    .auto_out_ar_ready(tl2axi4_1_auto_out_ar_ready),
    .auto_out_ar_valid(tl2axi4_1_auto_out_ar_valid),
    .auto_out_ar_bits_addr(tl2axi4_1_auto_out_ar_bits_addr),
    .auto_out_ar_bits_user(tl2axi4_1_auto_out_ar_bits_user),
    .auto_out_r_ready(tl2axi4_1_auto_out_r_ready),
    .auto_out_r_valid(tl2axi4_1_auto_out_r_valid),
    .auto_out_r_bits_data(tl2axi4_1_auto_out_r_bits_data),
    .auto_out_r_bits_resp(tl2axi4_1_auto_out_r_bits_resp),
    .auto_out_r_bits_user(tl2axi4_1_auto_out_r_bits_user),
    .auto_out_r_bits_last(tl2axi4_1_auto_out_r_bits_last)
  );
  TLFragmenter_11 fragmenter ( 
    .clock(fragmenter_clock),
    .reset(fragmenter_reset),
    .auto_in_a_ready(fragmenter_auto_in_a_ready),
    .auto_in_a_valid(fragmenter_auto_in_a_valid),
    .auto_in_a_bits_opcode(fragmenter_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(fragmenter_auto_in_a_bits_param),
    .auto_in_a_bits_size(fragmenter_auto_in_a_bits_size),
    .auto_in_a_bits_source(fragmenter_auto_in_a_bits_source),
    .auto_in_a_bits_address(fragmenter_auto_in_a_bits_address),
    .auto_in_a_bits_mask(fragmenter_auto_in_a_bits_mask),
    .auto_in_a_bits_data(fragmenter_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(fragmenter_auto_in_a_bits_corrupt),
    .auto_in_d_ready(fragmenter_auto_in_d_ready),
    .auto_in_d_valid(fragmenter_auto_in_d_valid),
    .auto_in_d_bits_opcode(fragmenter_auto_in_d_bits_opcode),
    .auto_in_d_bits_size(fragmenter_auto_in_d_bits_size),
    .auto_in_d_bits_source(fragmenter_auto_in_d_bits_source),
    .auto_in_d_bits_denied(fragmenter_auto_in_d_bits_denied),
    .auto_in_d_bits_data(fragmenter_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(fragmenter_auto_in_d_bits_corrupt),
    .auto_out_a_ready(fragmenter_auto_out_a_ready),
    .auto_out_a_valid(fragmenter_auto_out_a_valid),
    .auto_out_a_bits_opcode(fragmenter_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(fragmenter_auto_out_a_bits_param),
    .auto_out_a_bits_size(fragmenter_auto_out_a_bits_size),
    .auto_out_a_bits_source(fragmenter_auto_out_a_bits_source),
    .auto_out_a_bits_address(fragmenter_auto_out_a_bits_address),
    .auto_out_a_bits_mask(fragmenter_auto_out_a_bits_mask),
    .auto_out_a_bits_data(fragmenter_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt(fragmenter_auto_out_a_bits_corrupt),
    .auto_out_d_ready(fragmenter_auto_out_d_ready),
    .auto_out_d_valid(fragmenter_auto_out_d_valid),
    .auto_out_d_bits_opcode(fragmenter_auto_out_d_bits_opcode),
    .auto_out_d_bits_size(fragmenter_auto_out_d_bits_size),
    .auto_out_d_bits_source(fragmenter_auto_out_d_bits_source),
    .auto_out_d_bits_denied(fragmenter_auto_out_d_bits_denied),
    .auto_out_d_bits_data(fragmenter_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(fragmenter_auto_out_d_bits_corrupt)
  );
  TLWidthWidget_9 widget ( 
    .clock(widget_clock),
    .reset(widget_reset),
    .auto_in_a_ready(widget_auto_in_a_ready),
    .auto_in_a_valid(widget_auto_in_a_valid),
    .auto_in_a_bits_opcode(widget_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(widget_auto_in_a_bits_param),
    .auto_in_a_bits_size(widget_auto_in_a_bits_size),
    .auto_in_a_bits_source(widget_auto_in_a_bits_source),
    .auto_in_a_bits_address(widget_auto_in_a_bits_address),
    .auto_in_a_bits_mask(widget_auto_in_a_bits_mask),
    .auto_in_a_bits_data(widget_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(widget_auto_in_a_bits_corrupt),
    .auto_in_d_ready(widget_auto_in_d_ready),
    .auto_in_d_valid(widget_auto_in_d_valid),
    .auto_in_d_bits_source(widget_auto_in_d_bits_source),
    .auto_in_d_bits_opcode(widget_auto_in_d_bits_opcode),
    .auto_in_d_bits_size(widget_auto_in_d_bits_size),
    .auto_in_d_bits_denied(widget_auto_in_d_bits_denied),
    .auto_in_d_bits_data(widget_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(widget_auto_in_d_bits_corrupt),
    .auto_out_a_ready(widget_auto_out_a_ready),
    .auto_out_a_valid(widget_auto_out_a_valid),
    .auto_out_a_bits_opcode(widget_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(widget_auto_out_a_bits_param),
    .auto_out_a_bits_size(widget_auto_out_a_bits_size),
    .auto_out_a_bits_source(widget_auto_out_a_bits_source),
    .auto_out_a_bits_address(widget_auto_out_a_bits_address),
    .auto_out_a_bits_mask(widget_auto_out_a_bits_mask),
    .auto_out_a_bits_data(widget_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt(widget_auto_out_a_bits_corrupt),
    .auto_out_d_ready(widget_auto_out_d_ready),
    .auto_out_d_valid(widget_auto_out_d_valid),
    .auto_out_d_bits_opcode(widget_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(widget_auto_out_d_bits_param),
    .auto_out_d_bits_size(widget_auto_out_d_bits_size),
    .auto_out_d_bits_source(widget_auto_out_d_bits_source),
    .auto_out_d_bits_sink(widget_auto_out_d_bits_sink),
    .auto_out_d_bits_denied(widget_auto_out_d_bits_denied),
    .auto_out_d_bits_data(widget_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(widget_auto_out_d_bits_corrupt)
  );

  CHIPLINK_PREFIX_AXI4ToTL axi42tl_master_bus ( 
    .clock(axi42tl_clock),
    .reset(axi42tl_reset),
    .auto_in_awready(axi42tl_auto_in_aw_ready),
    .auto_in_awvalid(axi42tl_auto_in_aw_valid),
    .auto_in_awid(axi42tl_auto_in_aw_bits_id[0]),
    .auto_in_awaddr(axi42tl_auto_in_aw_bits_addr[31:0]),
    .auto_in_awlen(axi42tl_auto_in_aw_bits_len),
    .auto_in_awsize(axi42tl_auto_in_aw_bits_size),
    .auto_in_wready(axi42tl_auto_in_w_ready),
    .auto_in_wvalid(axi42tl_auto_in_w_valid),
    .auto_in_wdata(axi42tl_auto_in_w_bits_data),
    .auto_in_wstrb(axi42tl_auto_in_w_bits_strb),
    .auto_in_wlast(axi42tl_auto_in_w_bits_last),
    .auto_in_bready(axi42tl_auto_in_b_ready),
    .auto_in_bvalid(axi42tl_auto_in_b_valid),
    .auto_in_bresp(axi42tl_auto_in_b_bits_resp),
    .auto_in_bid(axi42tl_auto_in_b_bits_id[0]),
    .auto_in_arready(axi42tl_auto_in_ar_ready),
    .auto_in_arvalid(axi42tl_auto_in_ar_valid),
    .auto_in_arid(axi42tl_auto_in_ar_bits_id[0]),
    .auto_in_araddr(axi42tl_auto_in_ar_bits_addr[31:0]),
    .auto_in_arlen(axi42tl_auto_in_ar_bits_len),
    .auto_in_arsize(axi42tl_auto_in_ar_bits_size),
    .auto_in_rready(axi42tl_auto_in_r_ready),
    .auto_in_rvalid(axi42tl_auto_in_r_valid),
    .auto_in_rdata(axi42tl_auto_in_r_bits_data),
    .auto_in_rresp(axi42tl_auto_in_r_bits_resp),
    .auto_in_rlast(axi42tl_auto_in_r_bits_last),
    .auto_in_rid(axi42tl_auto_in_r_bits_id[0]),
    .auto_out_a_ready(axi42tl_auto_out_a_ready),
    .auto_out_a_valid(axi42tl_auto_out_a_valid),
    .auto_out_a_bits_opcode(axi42tl_auto_out_a_bits_opcode),
    //.auto_out_a_bits_param(axi42tl_auto_out_a_bits_param),
    .auto_out_a_bits_size(axi42tl_auto_out_a_bits_size),
    .auto_out_a_bits_source(axi42tl_auto_out_a_bits_source),
    .auto_out_a_bits_address(axi42tl_auto_out_a_bits_address[31:0]),
    .auto_out_a_bits_mask(axi42tl_auto_out_a_bits_mask),
    .auto_out_a_bits_data(axi42tl_auto_out_a_bits_data),
    .auto_out_d_ready(axi42tl_auto_out_d_ready),
    .auto_out_d_valid(axi42tl_auto_out_d_valid),
    .auto_out_d_bits_source(axi42tl_auto_out_d_bits_source),
    .auto_out_d_bits_opcode(axi42tl_auto_out_d_bits_opcode),
    .auto_out_d_bits_size(axi42tl_auto_out_d_bits_size),
    .auto_out_d_bits_denied(axi42tl_auto_out_d_bits_denied),
    .auto_out_d_bits_data(axi42tl_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(axi42tl_auto_out_d_bits_corrupt)
  );
  
  AXI4UserYanker_Param #(
    .AXI4_ADDRESS_WIDTH(master_bus_indexer_AXI4_ADDRESS_WIDTH),
    .AXI4_RDATA_WIDTH(master_bus_indexer_AXI4_RDATA_WIDTH),
    .AXI4_WDATA_WIDTH(master_bus_indexer_AXI4_WDATA_WIDTH),
    .AXI4_USER_WIDTH(master_bus_indexer_AXI4_USER_WIDTH),
    .AXI4_ID_WIDTH(8)
  )  axi4yank_master_bus ( 
    .clock(axi4yank_2_clock),
    .reset(axi4yank_2_reset),
    .auto_in_aw_ready(axi4yank_2_auto_in_aw_ready),
    .auto_in_aw_valid(axi4yank_2_auto_in_aw_valid),
    .auto_in_aw_bits_cache(4'h0),
    .auto_in_aw_bits_prot(3'h0),
    .auto_in_aw_bits_id(axi4yank_2_auto_in_aw_bits_id),
    .auto_in_aw_bits_addr(axi4yank_2_auto_in_aw_bits_addr[31:0]),
    .auto_in_aw_bits_len(axi4yank_2_auto_in_aw_bits_len),
    .auto_in_aw_bits_size(axi4yank_2_auto_in_aw_bits_size),
    .auto_in_aw_bits_echo_extra_id(axi4yank_2_auto_in_aw_bits_echo_extra_id),
    .auto_in_aw_bits_echo_real_last(axi4frag_auto_out_awecho_real_last),
    .auto_in_w_ready(axi4yank_2_auto_in_w_ready),
    .auto_in_w_valid(axi4yank_2_auto_in_w_valid),
    .auto_in_w_bits_data(axi4yank_2_auto_in_w_bits_data),
    .auto_in_w_bits_strb(axi4yank_2_auto_in_w_bits_strb),
    .auto_in_w_bits_last(axi4yank_2_auto_in_w_bits_last),
    .auto_in_b_ready(axi4yank_2_auto_in_b_ready),
    .auto_in_b_valid(axi4yank_2_auto_in_b_valid),
    .auto_in_b_bits_id(axi4yank_2_auto_in_b_bits_id),
    .auto_in_b_bits_resp(axi4yank_2_auto_in_b_bits_resp),
    .auto_in_b_bits_echo_extra_id(axi4yank_2_auto_in_b_bits_echo_extra_id),
    .auto_in_b_bits_echo_real_last(axi4frag_auto_out_becho_real_last),
    .auto_in_ar_ready(axi4yank_2_auto_in_ar_ready),
    .auto_in_ar_valid(axi4yank_2_auto_in_ar_valid),
    .auto_in_ar_bits_cache(4'h0),
    .auto_in_ar_bits_prot(3'h0),
    .auto_in_ar_bits_id(axi4yank_2_auto_in_ar_bits_id),
    .auto_in_ar_bits_addr(axi4yank_2_auto_in_ar_bits_addr[31:0]),
    .auto_in_ar_bits_len(axi4yank_2_auto_in_ar_bits_len),
    .auto_in_ar_bits_size(axi4yank_2_auto_in_ar_bits_size),
    .auto_in_ar_bits_echo_extra_id(axi4yank_2_auto_in_ar_bits_echo_extra_id),
    .auto_in_ar_bits_echo_real_last(axi4frag_auto_out_arecho_real_last),
    .auto_in_r_ready(axi4yank_2_auto_in_r_ready),
    .auto_in_r_valid(axi4yank_2_auto_in_r_valid),
    .auto_in_r_bits_id(axi4yank_2_auto_in_r_bits_id),
    .auto_in_r_bits_data(axi4yank_2_auto_in_r_bits_data),
    .auto_in_r_bits_resp(axi4yank_2_auto_in_r_bits_resp),
    .auto_in_r_bits_echo_extra_id(axi4yank_2_auto_in_r_bits_echo_extra_id),
    .auto_in_r_bits_echo_real_last(axi4frag_auto_out_recho_real_last),
    .auto_in_r_bits_last(axi4yank_2_auto_in_r_bits_last),
    .auto_out_aw_ready(axi4yank_2_auto_out_aw_ready),
    .auto_out_aw_valid(axi4yank_2_auto_out_aw_valid),
    .auto_out_aw_bits_cache(),
    .auto_out_aw_bits_prot(),
    .auto_out_aw_bits_id(axi4yank_2_auto_out_aw_bits_id),
    .auto_out_aw_bits_addr(axi4yank_2_auto_out_aw_bits_addr[31:0]),
    .auto_out_aw_bits_len(axi4yank_2_auto_out_aw_bits_len),
    .auto_out_aw_bits_size(axi4yank_2_auto_out_aw_bits_size),
    .auto_out_w_ready(axi4yank_2_auto_out_w_ready),
    .auto_out_w_valid(axi4yank_2_auto_out_w_valid),
    .auto_out_w_bits_data(axi4yank_2_auto_out_w_bits_data),
    .auto_out_w_bits_strb(axi4yank_2_auto_out_w_bits_strb),
    .auto_out_w_bits_last(axi4yank_2_auto_out_w_bits_last),
    .auto_out_b_ready(axi4yank_2_auto_out_b_ready),
    .auto_out_b_valid(axi4yank_2_auto_out_b_valid),
    .auto_out_b_bits_id(axi4yank_2_auto_out_b_bits_id),
    .auto_out_b_bits_resp(axi4yank_2_auto_out_b_bits_resp),
    .auto_out_ar_ready(axi4yank_2_auto_out_ar_ready),
    .auto_out_ar_valid(axi4yank_2_auto_out_ar_valid),
    .auto_out_ar_bits_cache(),
    .auto_out_ar_bits_prot(),
    .auto_out_ar_bits_id(axi4yank_2_auto_out_ar_bits_id),
    .auto_out_ar_bits_addr(axi4yank_2_auto_out_ar_bits_addr[31:0]),
    .auto_out_ar_bits_len(axi4yank_2_auto_out_ar_bits_len),
    .auto_out_ar_bits_size(axi4yank_2_auto_out_ar_bits_size),
    .auto_out_r_ready(axi4yank_2_auto_out_r_ready),
    .auto_out_r_valid(axi4yank_2_auto_out_r_valid),
    .auto_out_r_bits_id(axi4yank_2_auto_out_r_bits_id),
    .auto_out_r_bits_data(axi4yank_2_auto_out_r_bits_data),
    .auto_out_r_bits_resp(axi4yank_2_auto_out_r_bits_resp),
    .auto_out_r_bits_last(axi4yank_2_auto_out_r_bits_last)
  );

  AXI4Fragmenter_Param #(
    .AXI4_ADDRESS_WIDTH(master_bus_indexer_AXI4_ADDRESS_WIDTH),
    .AXI4_RDATA_WIDTH(master_bus_indexer_AXI4_RDATA_WIDTH),
    .AXI4_WDATA_WIDTH(master_bus_indexer_AXI4_WDATA_WIDTH),
    .AXI4_USER_WIDTH(master_bus_indexer_AXI4_USER_WIDTH),
    .AXI4_ID_WIDTH(8)
  ) axi4frag ( 
    .clock(axi4frag_clock),
    .reset(axi4frag_reset),
    .auto_in_aw_ready(indexer_auto_out_aw_ready),
    .auto_in_aw_valid(indexer_auto_out_aw_valid),
    .auto_in_aw_bits_cache(4'h0),
    .auto_in_aw_bits_prot(3'h0),
    .auto_in_aw_bits_id(indexer_auto_out_aw_bits_id),
    .auto_in_aw_bits_addr(indexer_auto_out_aw_bits_addr),
    .auto_in_aw_bits_len(indexer_auto_out_aw_bits_len),
    .auto_in_aw_bits_size(indexer_auto_out_aw_bits_size),
    .auto_in_aw_bits_burst(indexer_auto_out_aw_bits_burst),
    .auto_in_aw_bits_echo_extra_id({3'b0, indexer_auto_out_aw_bits_echo_extra_id[master_bus_indexer_AXI4_ID_WIDTH-2:0]}),
    .auto_in_w_ready(indexer_auto_out_w_ready),
    .auto_in_w_valid(indexer_auto_out_w_valid),
    .auto_in_w_bits_data(indexer_auto_out_w_bits_data),
    .auto_in_w_bits_strb(indexer_auto_out_w_bits_strb),
    .auto_in_w_bits_last(indexer_auto_out_w_bits_last),
    .auto_in_b_ready(indexer_auto_out_b_ready),
    .auto_in_b_valid(indexer_auto_out_b_valid),
    .auto_in_b_bits_id(indexer_auto_out_b_bits_id),
    .auto_in_b_bits_resp(indexer_auto_out_b_bits_resp),
    .auto_in_b_bits_echo_extra_id({indexer_auto_out_b_bits_echo_extra_id_unused[2:0], indexer_auto_out_b_bits_echo_extra_id[master_bus_indexer_AXI4_ID_WIDTH-2:0]}),
    .auto_in_ar_ready(indexer_auto_out_ar_ready),
    .auto_in_ar_valid(indexer_auto_out_ar_valid),
    .auto_in_ar_bits_cache(4'h0),
    .auto_in_ar_bits_prot(3'h0),
    .auto_in_ar_bits_id(indexer_auto_out_ar_bits_id),
    .auto_in_ar_bits_addr(indexer_auto_out_ar_bits_addr),
    .auto_in_ar_bits_len(indexer_auto_out_ar_bits_len),
    .auto_in_ar_bits_size(indexer_auto_out_ar_bits_size),
    .auto_in_ar_bits_burst(indexer_auto_out_ar_bits_burst),
    .auto_in_ar_bits_echo_extra_id({3'b0, indexer_auto_out_ar_bits_echo_extra_id[master_bus_indexer_AXI4_ID_WIDTH-2:0]}),
    .auto_in_r_ready(indexer_auto_out_r_ready),
    .auto_in_r_valid(indexer_auto_out_r_valid),
    .auto_in_r_bits_id(indexer_auto_out_r_bits_id),
    .auto_in_r_bits_data(indexer_auto_out_r_bits_data),
    .auto_in_r_bits_resp(indexer_auto_out_r_bits_resp),
    .auto_in_r_bits_last(indexer_auto_out_r_bits_last),
    .auto_in_r_bits_echo_extra_id({indexer_auto_out_r_bits_echo_extra_id_unused[2:0], indexer_auto_out_r_bits_echo_extra_id[master_bus_indexer_AXI4_ID_WIDTH-2:0]}),
    .auto_out_aw_ready(axi4frag_axi4yank_master_bus_awready),
    .auto_out_aw_valid(axi4frag_axi4yank_master_bus_awvalid),
    .auto_out_aw_bits_cache(),
    .auto_out_aw_bits_prot(),
    .auto_out_aw_bits_id(axi4frag_axi4yank_master_bus_awid),
    .auto_out_aw_bits_addr(axi4frag_axi4yank_master_bus_awaddr[31:0]),
    .auto_out_aw_bits_len(axi4frag_axi4yank_master_bus_awlen),
    .auto_out_aw_bits_size(axi4frag_axi4yank_master_bus_awsize),
    .auto_out_aw_bits_echo_extra_id(axi4frag_axi4yank_master_bus_awecho_extra_id),
    .auto_out_aw_bits_echo_real_last(axi4frag_axi4yank_master_bus_awecho_real_last),
    .auto_out_w_ready(axi4frag_axi4yank_master_bus_wready),
    .auto_out_w_valid(axi4frag_axi4yank_master_bus_wvalid),
    .auto_out_w_bits_data(axi4frag_axi4yank_master_bus_wdata),
    .auto_out_w_bits_strb(axi4frag_axi4yank_master_bus_wstrb),
    .auto_out_w_bits_last(axi4frag_axi4yank_master_bus_wlast),
    .auto_out_b_ready(axi4frag_axi4yank_master_bus_bready),
    .auto_out_b_valid(axi4frag_axi4yank_master_bus_bvalid),
    .auto_out_b_bits_id(axi4frag_axi4yank_master_bus_bid),
    .auto_out_b_bits_resp(axi4frag_axi4yank_master_bus_bresp),
    .auto_out_b_bits_echo_extra_id(axi4frag_axi4yank_master_bus_becho_extra_id),
    .auto_out_b_bits_echo_real_last(axi4frag_axi4yank_master_bus_becho_real_last),
    .auto_out_ar_ready(axi4frag_axi4yank_master_bus_arready),
    .auto_out_ar_valid(axi4frag_axi4yank_master_bus_arvalid),
    .auto_out_ar_bits_id(axi4frag_axi4yank_master_bus_arid),
    .auto_out_ar_bits_addr(axi4frag_axi4yank_master_bus_araddr[31:0]),
    .auto_out_ar_bits_len(axi4frag_axi4yank_master_bus_arlen),
    .auto_out_ar_bits_size(axi4frag_axi4yank_master_bus_arsize),
    .auto_out_ar_bits_cache(),
    .auto_out_ar_bits_prot(),
    .auto_out_ar_bits_echo_extra_id(axi4frag_axi4yank_master_bus_arecho_extra_id),
    .auto_out_ar_bits_echo_real_last(axi4frag_axi4yank_master_bus_arecho_real_last),
    .auto_out_r_ready(axi4frag_axi4yank_master_bus_rready),
    .auto_out_r_valid(axi4frag_axi4yank_master_bus_rvalid),
    .auto_out_r_bits_id(axi4frag_axi4yank_master_bus_rid),
    .auto_out_r_bits_data(axi4frag_axi4yank_master_bus_rdata),
    .auto_out_r_bits_resp(axi4frag_axi4yank_master_bus_rresp),
    .auto_out_r_bits_echo_extra_id(axi4frag_axi4yank_master_bus_recho_extra_id),
    .auto_out_r_bits_echo_real_last(axi4frag_axi4yank_master_bus_recho_real_last),
    .auto_out_r_bits_last(axi4frag_axi4yank_master_bus_rlast)
  );

  AXI4Buffer_Param #(
    .ADDR_WIDTH(32),
    .DATA_WIDTH(64),
    .ID_WIDTH(1+7+1)  // id + extra_id + real_last
  ) axi4frag_axi4yank_master_bus_buf ( 
    .clock(axi4frag_clock),
    .reset(axi4frag_reset),
    .auto_in_awready(axi4frag_axi4yank_master_bus_awready),
    .auto_in_awvalid(axi4frag_axi4yank_master_bus_awvalid),
    .auto_in_awid({axi4frag_axi4yank_master_bus_awid, axi4frag_axi4yank_master_bus_awecho_extra_id, axi4frag_axi4yank_master_bus_awecho_real_last}),
    .auto_in_awaddr(axi4frag_axi4yank_master_bus_awaddr[31:0]),
    .auto_in_awlen(axi4frag_axi4yank_master_bus_awlen),
    .auto_in_awsize(axi4frag_axi4yank_master_bus_awsize),
    .auto_in_awburst(2'b01),
    .auto_in_wready(axi4frag_axi4yank_master_bus_wready),
    .auto_in_wvalid(axi4frag_axi4yank_master_bus_wvalid),
    .auto_in_wdata(axi4frag_axi4yank_master_bus_wdata),
    .auto_in_wstrb(axi4frag_axi4yank_master_bus_wstrb),
    .auto_in_wlast(axi4frag_axi4yank_master_bus_wlast),
    .auto_in_bready(axi4frag_axi4yank_master_bus_bready),
    .auto_in_bvalid(axi4frag_axi4yank_master_bus_bvalid),
    .auto_in_bid({axi4frag_axi4yank_master_bus_bid, axi4frag_axi4yank_master_bus_becho_extra_id, axi4frag_axi4yank_master_bus_becho_real_last}),
    .auto_in_bresp(axi4frag_axi4yank_master_bus_bresp),
    .auto_in_arready(axi4frag_axi4yank_master_bus_arready),
    .auto_in_arvalid(axi4frag_axi4yank_master_bus_arvalid),
    .auto_in_arid({axi4frag_axi4yank_master_bus_arid, axi4frag_axi4yank_master_bus_arecho_extra_id, axi4frag_axi4yank_master_bus_arecho_real_last}),
    .auto_in_araddr(axi4frag_axi4yank_master_bus_araddr[31:0]),
    .auto_in_arlen(axi4frag_axi4yank_master_bus_arlen),
    .auto_in_arsize(axi4frag_axi4yank_master_bus_arsize),
    .auto_in_arburst(2'b01),
    .auto_in_rready(axi4frag_axi4yank_master_bus_rready),
    .auto_in_rvalid(axi4frag_axi4yank_master_bus_rvalid),
    .auto_in_rid({axi4frag_axi4yank_master_bus_rid, axi4frag_axi4yank_master_bus_recho_extra_id, axi4frag_axi4yank_master_bus_recho_real_last}),
    .auto_in_rdata(axi4frag_axi4yank_master_bus_rdata),
    .auto_in_rresp(axi4frag_axi4yank_master_bus_rresp),
    .auto_in_rlast(axi4frag_axi4yank_master_bus_rlast),
    .auto_out_awready(axi4frag_auto_out_awready),
    .auto_out_awvalid(axi4frag_auto_out_awvalid),
    .auto_out_awid({axi4frag_auto_out_awid, axi4frag_auto_out_awecho_extra_id, axi4frag_auto_out_awecho_real_last}),
    .auto_out_awaddr(axi4frag_auto_out_awaddr[31:0]),
    .auto_out_awlen(axi4frag_auto_out_awlen),
    .auto_out_awsize(axi4frag_auto_out_awsize),
    .auto_out_awburst(axi4frag_auto_out_awburst_unused),
    .auto_out_wready(axi4frag_auto_out_wready),
    .auto_out_wvalid(axi4frag_auto_out_wvalid),
    .auto_out_wdata(axi4frag_auto_out_wdata),
    .auto_out_wstrb(axi4frag_auto_out_wstrb),
    .auto_out_wlast(axi4frag_auto_out_wlast),
    .auto_out_bready(axi4frag_auto_out_bready),
    .auto_out_bvalid(axi4frag_auto_out_bvalid),
    .auto_out_bid({axi4frag_auto_out_bid, axi4frag_auto_out_becho_extra_id, axi4frag_auto_out_becho_real_last}),
    .auto_out_bresp(axi4frag_auto_out_bresp),
    .auto_out_arready(axi4frag_auto_out_arready),
    .auto_out_arvalid(axi4frag_auto_out_arvalid),
    .auto_out_arid({axi4frag_auto_out_arid, axi4frag_auto_out_arecho_extra_id, axi4frag_auto_out_arecho_real_last}),
    .auto_out_araddr(axi4frag_auto_out_araddr[31:0]),
    .auto_out_arlen(axi4frag_auto_out_arlen),
    .auto_out_arsize(axi4frag_auto_out_arsize),
    .auto_out_arburst(axi4frag_auto_out_arburst_unused),
    .auto_out_rready(axi4frag_auto_out_rready),
    .auto_out_rvalid(axi4frag_auto_out_rvalid),
    .auto_out_rid({axi4frag_auto_out_rid, axi4frag_auto_out_recho_extra_id, axi4frag_auto_out_recho_real_last}),
    .auto_out_rdata(axi4frag_auto_out_rdata),
    .auto_out_rresp(axi4frag_auto_out_rresp),
    .auto_out_rlast(axi4frag_auto_out_rlast)
  );

  assign axi4frag_auto_out_awaddr[37:32] = 6'b0;
  assign axi4frag_auto_out_araddr[37:32] = 6'b0;

  AXI4IdIndexer_Param #(
    .AXI4_ADDRESS_WIDTH(master_bus_indexer_AXI4_ADDRESS_WIDTH),
    .AXI4_RDATA_WIDTH(master_bus_indexer_AXI4_RDATA_WIDTH),
    .AXI4_WDATA_WIDTH(master_bus_indexer_AXI4_WDATA_WIDTH),
    .AXI4_USER_WIDTH(master_bus_indexer_AXI4_USER_WIDTH),
    .AXI4_ID_WIDTH(master_bus_indexer_AXI4_ID_WIDTH)
  )  u_master_bus_indexer ( 
    .auto_in_aw_ready(indexer_auto_in_aw_ready),
    .auto_in_aw_valid(indexer_auto_in_aw_valid),
    .auto_in_aw_bits_id(indexer_auto_in_aw_bits_id),
    .auto_in_aw_bits_addr(indexer_auto_in_aw_bits_addr[31:0]),
    .auto_in_aw_bits_len(indexer_auto_in_aw_bits_len),
    .auto_in_aw_bits_size(indexer_auto_in_aw_bits_size),
    .auto_in_aw_bits_burst(indexer_auto_in_aw_bits_burst),
    //.auto_in_aw_bits_lock(indexer_auto_in_aw_bits_lock),
    .auto_in_aw_bits_cache(indexer_auto_in_aw_bits_cache),
    .auto_in_aw_bits_prot(indexer_auto_in_aw_bits_prot),
    //.auto_in_aw_bits_qos(indexer_auto_in_aw_bits_qos),
    .auto_in_w_ready(indexer_auto_in_w_ready),
    .auto_in_w_valid(indexer_auto_in_w_valid),
    .auto_in_w_bits_data(indexer_auto_in_w_bits_data),
    .auto_in_w_bits_strb(indexer_auto_in_w_bits_strb),
    .auto_in_w_bits_last(indexer_auto_in_w_bits_last),
    .auto_in_b_ready(indexer_auto_in_b_ready),
    .auto_in_b_valid(indexer_auto_in_b_valid),
    .auto_in_b_bits_id(indexer_auto_in_b_bits_id),
    .auto_in_b_bits_resp(indexer_auto_in_b_bits_resp),
    .auto_in_ar_ready(indexer_auto_in_ar_ready),
    .auto_in_ar_valid(indexer_auto_in_ar_valid),
    .auto_in_ar_bits_id(indexer_auto_in_ar_bits_id),
    .auto_in_ar_bits_addr(indexer_auto_in_ar_bits_addr[31:0]),
    .auto_in_ar_bits_len(indexer_auto_in_ar_bits_len),
    .auto_in_ar_bits_size(indexer_auto_in_ar_bits_size),
    .auto_in_ar_bits_burst(indexer_auto_in_ar_bits_burst),
    //.auto_in_ar_bits_lock(indexer_auto_in_ar_bits_lock),
    .auto_in_ar_bits_cache(indexer_auto_in_ar_bits_cache),
    .auto_in_ar_bits_prot(indexer_auto_in_ar_bits_prot),
    //.auto_in_ar_bits_qos(indexer_auto_in_ar_bits_qos),
    .auto_in_r_ready(indexer_auto_in_r_ready),
    .auto_in_r_valid(indexer_auto_in_r_valid),
    .auto_in_r_bits_id(indexer_auto_in_r_bits_id),
    .auto_in_r_bits_data(indexer_auto_in_r_bits_data),
    .auto_in_r_bits_resp(indexer_auto_in_r_bits_resp),
    .auto_in_r_bits_last(indexer_auto_in_r_bits_last),
    //.auto_in_r_bits_user(indexer_auto_in_r_bits_user),
    .auto_out_aw_ready(indexer_auto_out_aw_ready),
    .auto_out_aw_valid(indexer_auto_out_aw_valid),
    .auto_out_aw_bits_id(indexer_auto_out_aw_bits_id),
    .auto_out_aw_bits_addr(indexer_auto_out_aw_bits_addr),
    .auto_out_aw_bits_len(indexer_auto_out_aw_bits_len),
    .auto_out_aw_bits_size(indexer_auto_out_aw_bits_size),
    .auto_out_aw_bits_burst(indexer_auto_out_aw_bits_burst),
    //.auto_out_aw_bits_lock(indexer_auto_out_aw_bits_lock),
    .auto_out_aw_bits_cache(indexer_auto_out_aw_bits_cache),
    .auto_out_aw_bits_prot(indexer_auto_out_aw_bits_prot),
    //.auto_out_aw_bits_qos(indexer_auto_out_aw_bits_qos),
    .auto_out_aw_bits_echo_extra_id(indexer_auto_out_aw_bits_echo_extra_id),
    .auto_out_w_ready(indexer_auto_out_w_ready),
    .auto_out_w_valid(indexer_auto_out_w_valid),
    .auto_out_w_bits_data(indexer_auto_out_w_bits_data),
    .auto_out_w_bits_strb(indexer_auto_out_w_bits_strb),
    .auto_out_w_bits_last(indexer_auto_out_w_bits_last),
    .auto_out_b_ready(indexer_auto_out_b_ready),
    .auto_out_b_valid(indexer_auto_out_b_valid),
    .auto_out_b_bits_id(indexer_auto_out_b_bits_id),
    .auto_out_b_bits_resp(indexer_auto_out_b_bits_resp),
    .auto_out_b_bits_echo_extra_id(indexer_auto_out_b_bits_echo_extra_id),
    .auto_out_ar_ready(indexer_auto_out_ar_ready),
    .auto_out_ar_valid(indexer_auto_out_ar_valid),
    .auto_out_ar_bits_id(indexer_auto_out_ar_bits_id),
    .auto_out_ar_bits_addr(indexer_auto_out_ar_bits_addr),
    .auto_out_ar_bits_len(indexer_auto_out_ar_bits_len),
    .auto_out_ar_bits_size(indexer_auto_out_ar_bits_size),
    .auto_out_ar_bits_burst(indexer_auto_out_ar_bits_burst),
    //.auto_out_ar_bits_lock(indexer_auto_out_ar_bits_lock),
    .auto_out_ar_bits_cache(indexer_auto_out_ar_bits_cache),
    .auto_out_ar_bits_prot(indexer_auto_out_ar_bits_prot),
    //.auto_out_ar_bits_qos(indexer_auto_out_ar_bits_qos),
    .auto_out_ar_bits_echo_extra_id(indexer_auto_out_ar_bits_echo_extra_id),
    .auto_out_r_ready(indexer_auto_out_r_ready),
    .auto_out_r_valid(indexer_auto_out_r_valid),
    .auto_out_r_bits_id(indexer_auto_out_r_bits_id),
    .auto_out_r_bits_data(indexer_auto_out_r_bits_data),
    .auto_out_r_bits_resp(indexer_auto_out_r_bits_resp),
    .auto_out_r_bits_echo_extra_id(indexer_auto_out_r_bits_echo_extra_id),
    .auto_out_r_bits_last(indexer_auto_out_r_bits_last)
  );

  TLAsyncCrossingSink_1 asink ( 
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
    .auto_out_d_bits_size(asink_auto_out_d_bits_size),
    .auto_out_d_bits_source(asink_auto_out_d_bits_source),
    .auto_out_d_bits_denied(asink_auto_out_d_bits_denied),
    .auto_out_d_bits_data(asink_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(asink_auto_out_d_bits_corrupt)
  );
  TLAsyncCrossingSink_2 asink_1 ( 
    .clock(asink_1_clock),
    .reset(asink_1_reset),
    .auto_in_a_mem_0_opcode(asink_1_auto_in_a_mem_0_opcode),
    .auto_in_a_mem_0_param(asink_1_auto_in_a_mem_0_param),
    .auto_in_a_mem_0_size(asink_1_auto_in_a_mem_0_size),
    .auto_in_a_mem_0_source(asink_1_auto_in_a_mem_0_source),
    .auto_in_a_mem_0_address(asink_1_auto_in_a_mem_0_address),
    .auto_in_a_mem_0_mask(asink_1_auto_in_a_mem_0_mask),
    .auto_in_a_mem_0_data(asink_1_auto_in_a_mem_0_data),
    .auto_in_a_mem_0_corrupt(asink_1_auto_in_a_mem_0_corrupt),
    .auto_in_a_mem_1_opcode(asink_1_auto_in_a_mem_1_opcode),
    .auto_in_a_mem_1_param(asink_1_auto_in_a_mem_1_param),
    .auto_in_a_mem_1_size(asink_1_auto_in_a_mem_1_size),
    .auto_in_a_mem_1_source(asink_1_auto_in_a_mem_1_source),
    .auto_in_a_mem_1_address(asink_1_auto_in_a_mem_1_address),
    .auto_in_a_mem_1_mask(asink_1_auto_in_a_mem_1_mask),
    .auto_in_a_mem_1_data(asink_1_auto_in_a_mem_1_data),
    .auto_in_a_mem_1_corrupt(asink_1_auto_in_a_mem_1_corrupt),
    .auto_in_a_mem_2_opcode(asink_1_auto_in_a_mem_2_opcode),
    .auto_in_a_mem_2_param(asink_1_auto_in_a_mem_2_param),
    .auto_in_a_mem_2_size(asink_1_auto_in_a_mem_2_size),
    .auto_in_a_mem_2_source(asink_1_auto_in_a_mem_2_source),
    .auto_in_a_mem_2_address(asink_1_auto_in_a_mem_2_address),
    .auto_in_a_mem_2_mask(asink_1_auto_in_a_mem_2_mask),
    .auto_in_a_mem_2_data(asink_1_auto_in_a_mem_2_data),
    .auto_in_a_mem_2_corrupt(asink_1_auto_in_a_mem_2_corrupt),
    .auto_in_a_mem_3_opcode(asink_1_auto_in_a_mem_3_opcode),
    .auto_in_a_mem_3_param(asink_1_auto_in_a_mem_3_param),
    .auto_in_a_mem_3_size(asink_1_auto_in_a_mem_3_size),
    .auto_in_a_mem_3_source(asink_1_auto_in_a_mem_3_source),
    .auto_in_a_mem_3_address(asink_1_auto_in_a_mem_3_address),
    .auto_in_a_mem_3_mask(asink_1_auto_in_a_mem_3_mask),
    .auto_in_a_mem_3_data(asink_1_auto_in_a_mem_3_data),
    .auto_in_a_mem_3_corrupt(asink_1_auto_in_a_mem_3_corrupt),
    .auto_in_a_mem_4_opcode(asink_1_auto_in_a_mem_4_opcode),
    .auto_in_a_mem_4_param(asink_1_auto_in_a_mem_4_param),
    .auto_in_a_mem_4_size(asink_1_auto_in_a_mem_4_size),
    .auto_in_a_mem_4_source(asink_1_auto_in_a_mem_4_source),
    .auto_in_a_mem_4_address(asink_1_auto_in_a_mem_4_address),
    .auto_in_a_mem_4_mask(asink_1_auto_in_a_mem_4_mask),
    .auto_in_a_mem_4_data(asink_1_auto_in_a_mem_4_data),
    .auto_in_a_mem_4_corrupt(asink_1_auto_in_a_mem_4_corrupt),
    .auto_in_a_mem_5_opcode(asink_1_auto_in_a_mem_5_opcode),
    .auto_in_a_mem_5_param(asink_1_auto_in_a_mem_5_param),
    .auto_in_a_mem_5_size(asink_1_auto_in_a_mem_5_size),
    .auto_in_a_mem_5_source(asink_1_auto_in_a_mem_5_source),
    .auto_in_a_mem_5_address(asink_1_auto_in_a_mem_5_address),
    .auto_in_a_mem_5_mask(asink_1_auto_in_a_mem_5_mask),
    .auto_in_a_mem_5_data(asink_1_auto_in_a_mem_5_data),
    .auto_in_a_mem_5_corrupt(asink_1_auto_in_a_mem_5_corrupt),
    .auto_in_a_mem_6_opcode(asink_1_auto_in_a_mem_6_opcode),
    .auto_in_a_mem_6_param(asink_1_auto_in_a_mem_6_param),
    .auto_in_a_mem_6_size(asink_1_auto_in_a_mem_6_size),
    .auto_in_a_mem_6_source(asink_1_auto_in_a_mem_6_source),
    .auto_in_a_mem_6_address(asink_1_auto_in_a_mem_6_address),
    .auto_in_a_mem_6_mask(asink_1_auto_in_a_mem_6_mask),
    .auto_in_a_mem_6_data(asink_1_auto_in_a_mem_6_data),
    .auto_in_a_mem_6_corrupt(asink_1_auto_in_a_mem_6_corrupt),
    .auto_in_a_mem_7_opcode(asink_1_auto_in_a_mem_7_opcode),
    .auto_in_a_mem_7_param(asink_1_auto_in_a_mem_7_param),
    .auto_in_a_mem_7_size(asink_1_auto_in_a_mem_7_size),
    .auto_in_a_mem_7_source(asink_1_auto_in_a_mem_7_source),
    .auto_in_a_mem_7_address(asink_1_auto_in_a_mem_7_address),
    .auto_in_a_mem_7_mask(asink_1_auto_in_a_mem_7_mask),
    .auto_in_a_mem_7_data(asink_1_auto_in_a_mem_7_data),
    .auto_in_a_mem_7_corrupt(asink_1_auto_in_a_mem_7_corrupt),
    .auto_in_a_ridx(asink_1_auto_in_a_ridx),
    .auto_in_a_widx(asink_1_auto_in_a_widx),
    .auto_in_a_safe_ridx_valid(asink_1_auto_in_a_safe_ridx_valid),
    .auto_in_a_safe_widx_valid(asink_1_auto_in_a_safe_widx_valid),
    .auto_in_a_safe_source_reset_n(asink_1_auto_in_a_safe_source_reset_n),
    .auto_in_a_safe_sink_reset_n(asink_1_auto_in_a_safe_sink_reset_n),
    .auto_in_d_mem_0_opcode(asink_1_auto_in_d_mem_0_opcode),
    .auto_in_d_mem_0_param(asink_1_auto_in_d_mem_0_param),
    .auto_in_d_mem_0_size(asink_1_auto_in_d_mem_0_size),
    .auto_in_d_mem_0_source(asink_1_auto_in_d_mem_0_source),
    .auto_in_d_mem_0_sink(asink_1_auto_in_d_mem_0_sink),
    .auto_in_d_mem_0_denied(asink_1_auto_in_d_mem_0_denied),
    .auto_in_d_mem_0_data(asink_1_auto_in_d_mem_0_data),
    .auto_in_d_mem_0_corrupt(asink_1_auto_in_d_mem_0_corrupt),
    .auto_in_d_mem_1_opcode(asink_1_auto_in_d_mem_1_opcode),
    .auto_in_d_mem_1_param(asink_1_auto_in_d_mem_1_param),
    .auto_in_d_mem_1_size(asink_1_auto_in_d_mem_1_size),
    .auto_in_d_mem_1_source(asink_1_auto_in_d_mem_1_source),
    .auto_in_d_mem_1_sink(asink_1_auto_in_d_mem_1_sink),
    .auto_in_d_mem_1_denied(asink_1_auto_in_d_mem_1_denied),
    .auto_in_d_mem_1_data(asink_1_auto_in_d_mem_1_data),
    .auto_in_d_mem_1_corrupt(asink_1_auto_in_d_mem_1_corrupt),
    .auto_in_d_mem_2_opcode(asink_1_auto_in_d_mem_2_opcode),
    .auto_in_d_mem_2_param(asink_1_auto_in_d_mem_2_param),
    .auto_in_d_mem_2_size(asink_1_auto_in_d_mem_2_size),
    .auto_in_d_mem_2_source(asink_1_auto_in_d_mem_2_source),
    .auto_in_d_mem_2_sink(asink_1_auto_in_d_mem_2_sink),
    .auto_in_d_mem_2_denied(asink_1_auto_in_d_mem_2_denied),
    .auto_in_d_mem_2_data(asink_1_auto_in_d_mem_2_data),
    .auto_in_d_mem_2_corrupt(asink_1_auto_in_d_mem_2_corrupt),
    .auto_in_d_mem_3_opcode(asink_1_auto_in_d_mem_3_opcode),
    .auto_in_d_mem_3_param(asink_1_auto_in_d_mem_3_param),
    .auto_in_d_mem_3_size(asink_1_auto_in_d_mem_3_size),
    .auto_in_d_mem_3_source(asink_1_auto_in_d_mem_3_source),
    .auto_in_d_mem_3_sink(asink_1_auto_in_d_mem_3_sink),
    .auto_in_d_mem_3_denied(asink_1_auto_in_d_mem_3_denied),
    .auto_in_d_mem_3_data(asink_1_auto_in_d_mem_3_data),
    .auto_in_d_mem_3_corrupt(asink_1_auto_in_d_mem_3_corrupt),
    .auto_in_d_mem_4_opcode(asink_1_auto_in_d_mem_4_opcode),
    .auto_in_d_mem_4_param(asink_1_auto_in_d_mem_4_param),
    .auto_in_d_mem_4_size(asink_1_auto_in_d_mem_4_size),
    .auto_in_d_mem_4_source(asink_1_auto_in_d_mem_4_source),
    .auto_in_d_mem_4_sink(asink_1_auto_in_d_mem_4_sink),
    .auto_in_d_mem_4_denied(asink_1_auto_in_d_mem_4_denied),
    .auto_in_d_mem_4_data(asink_1_auto_in_d_mem_4_data),
    .auto_in_d_mem_4_corrupt(asink_1_auto_in_d_mem_4_corrupt),
    .auto_in_d_mem_5_opcode(asink_1_auto_in_d_mem_5_opcode),
    .auto_in_d_mem_5_param(asink_1_auto_in_d_mem_5_param),
    .auto_in_d_mem_5_size(asink_1_auto_in_d_mem_5_size),
    .auto_in_d_mem_5_source(asink_1_auto_in_d_mem_5_source),
    .auto_in_d_mem_5_sink(asink_1_auto_in_d_mem_5_sink),
    .auto_in_d_mem_5_denied(asink_1_auto_in_d_mem_5_denied),
    .auto_in_d_mem_5_data(asink_1_auto_in_d_mem_5_data),
    .auto_in_d_mem_5_corrupt(asink_1_auto_in_d_mem_5_corrupt),
    .auto_in_d_mem_6_opcode(asink_1_auto_in_d_mem_6_opcode),
    .auto_in_d_mem_6_param(asink_1_auto_in_d_mem_6_param),
    .auto_in_d_mem_6_size(asink_1_auto_in_d_mem_6_size),
    .auto_in_d_mem_6_source(asink_1_auto_in_d_mem_6_source),
    .auto_in_d_mem_6_sink(asink_1_auto_in_d_mem_6_sink),
    .auto_in_d_mem_6_denied(asink_1_auto_in_d_mem_6_denied),
    .auto_in_d_mem_6_data(asink_1_auto_in_d_mem_6_data),
    .auto_in_d_mem_6_corrupt(asink_1_auto_in_d_mem_6_corrupt),
    .auto_in_d_mem_7_opcode(asink_1_auto_in_d_mem_7_opcode),
    .auto_in_d_mem_7_param(asink_1_auto_in_d_mem_7_param),
    .auto_in_d_mem_7_size(asink_1_auto_in_d_mem_7_size),
    .auto_in_d_mem_7_source(asink_1_auto_in_d_mem_7_source),
    .auto_in_d_mem_7_sink(asink_1_auto_in_d_mem_7_sink),
    .auto_in_d_mem_7_denied(asink_1_auto_in_d_mem_7_denied),
    .auto_in_d_mem_7_data(asink_1_auto_in_d_mem_7_data),
    .auto_in_d_mem_7_corrupt(asink_1_auto_in_d_mem_7_corrupt),
    .auto_in_d_ridx(asink_1_auto_in_d_ridx),
    .auto_in_d_widx(asink_1_auto_in_d_widx),
    .auto_in_d_safe_ridx_valid(asink_1_auto_in_d_safe_ridx_valid),
    .auto_in_d_safe_widx_valid(asink_1_auto_in_d_safe_widx_valid),
    .auto_in_d_safe_source_reset_n(asink_1_auto_in_d_safe_source_reset_n),
    .auto_in_d_safe_sink_reset_n(asink_1_auto_in_d_safe_sink_reset_n),
    .auto_out_a_ready(asink_1_auto_out_a_ready),
    .auto_out_a_valid(asink_1_auto_out_a_valid),
    .auto_out_a_bits_opcode(asink_1_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(asink_1_auto_out_a_bits_param),
    .auto_out_a_bits_size(asink_1_auto_out_a_bits_size),
    .auto_out_a_bits_source(asink_1_auto_out_a_bits_source),
    .auto_out_a_bits_address(asink_1_auto_out_a_bits_address),
    .auto_out_a_bits_mask(asink_1_auto_out_a_bits_mask),
    .auto_out_a_bits_data(asink_1_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt(asink_1_auto_out_a_bits_corrupt),
    .auto_out_d_ready(asink_1_auto_out_d_ready),
    .auto_out_d_valid(asink_1_auto_out_d_valid),
    .auto_out_d_bits_opcode(asink_1_auto_out_d_bits_opcode),
    .auto_out_d_bits_size(asink_1_auto_out_d_bits_size),
    .auto_out_d_bits_source(asink_1_auto_out_d_bits_source),
    .auto_out_d_bits_denied(asink_1_auto_out_d_bits_denied),
    .auto_out_d_bits_data(asink_1_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(asink_1_auto_out_d_bits_corrupt)
  );
  TLAsyncCrossingSource_1 asource ( 
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
  IntSyncCrossingSource_3 intsource ( 
    .clock(intsource_clock),
    .reset(intsource_reset),
    .auto_in_0(intsource_auto_in_0),
    .auto_out_sync_0(intsource_auto_out_sync_0)
  );
  `ifdef USE_C2C_FOR_PCIE
  IBUFDS_GTE2 ibufds_gte2 ( 
    .IB(ibufds_gte2_IB),
    .I(ibufds_gte2_I),
    .CEB(ibufds_gte2_CEB),
    .ODIV2(ibufds_gte2_ODIV2),
    .O(ibufds_gte2_O)
  );
  `endif
  assign auto_int_out_xing_out_sync_0 = intsource_auto_out_sync_0; 
  assign auto_tl_out_xing_out_a_mem_0_opcode = asource_auto_out_a_mem_0_opcode; 
  assign auto_tl_out_xing_out_a_mem_0_param = asource_auto_out_a_mem_0_param; 
  assign auto_tl_out_xing_out_a_mem_0_size = asource_auto_out_a_mem_0_size; 
  assign auto_tl_out_xing_out_a_mem_0_source = asource_auto_out_a_mem_0_source; 
  assign auto_tl_out_xing_out_a_mem_0_address = asource_auto_out_a_mem_0_address; 
  assign auto_tl_out_xing_out_a_mem_0_mask = asource_auto_out_a_mem_0_mask; 
  assign auto_tl_out_xing_out_a_mem_0_data = asource_auto_out_a_mem_0_data; 
  assign auto_tl_out_xing_out_a_mem_0_corrupt = asource_auto_out_a_mem_0_corrupt; 
  assign auto_tl_out_xing_out_a_mem_1_opcode = asource_auto_out_a_mem_1_opcode; 
  assign auto_tl_out_xing_out_a_mem_1_param = asource_auto_out_a_mem_1_param; 
  assign auto_tl_out_xing_out_a_mem_1_size = asource_auto_out_a_mem_1_size; 
  assign auto_tl_out_xing_out_a_mem_1_source = asource_auto_out_a_mem_1_source; 
  assign auto_tl_out_xing_out_a_mem_1_address = asource_auto_out_a_mem_1_address; 
  assign auto_tl_out_xing_out_a_mem_1_mask = asource_auto_out_a_mem_1_mask; 
  assign auto_tl_out_xing_out_a_mem_1_data = asource_auto_out_a_mem_1_data; 
  assign auto_tl_out_xing_out_a_mem_1_corrupt = asource_auto_out_a_mem_1_corrupt; 
  assign auto_tl_out_xing_out_a_mem_2_opcode = asource_auto_out_a_mem_2_opcode; 
  assign auto_tl_out_xing_out_a_mem_2_param = asource_auto_out_a_mem_2_param; 
  assign auto_tl_out_xing_out_a_mem_2_size = asource_auto_out_a_mem_2_size; 
  assign auto_tl_out_xing_out_a_mem_2_source = asource_auto_out_a_mem_2_source; 
  assign auto_tl_out_xing_out_a_mem_2_address = asource_auto_out_a_mem_2_address; 
  assign auto_tl_out_xing_out_a_mem_2_mask = asource_auto_out_a_mem_2_mask; 
  assign auto_tl_out_xing_out_a_mem_2_data = asource_auto_out_a_mem_2_data; 
  assign auto_tl_out_xing_out_a_mem_2_corrupt = asource_auto_out_a_mem_2_corrupt; 
  assign auto_tl_out_xing_out_a_mem_3_opcode = asource_auto_out_a_mem_3_opcode; 
  assign auto_tl_out_xing_out_a_mem_3_param = asource_auto_out_a_mem_3_param; 
  assign auto_tl_out_xing_out_a_mem_3_size = asource_auto_out_a_mem_3_size; 
  assign auto_tl_out_xing_out_a_mem_3_source = asource_auto_out_a_mem_3_source; 
  assign auto_tl_out_xing_out_a_mem_3_address = asource_auto_out_a_mem_3_address; 
  assign auto_tl_out_xing_out_a_mem_3_mask = asource_auto_out_a_mem_3_mask; 
  assign auto_tl_out_xing_out_a_mem_3_data = asource_auto_out_a_mem_3_data; 
  assign auto_tl_out_xing_out_a_mem_3_corrupt = asource_auto_out_a_mem_3_corrupt; 
  assign auto_tl_out_xing_out_a_mem_4_opcode = asource_auto_out_a_mem_4_opcode; 
  assign auto_tl_out_xing_out_a_mem_4_param = asource_auto_out_a_mem_4_param; 
  assign auto_tl_out_xing_out_a_mem_4_size = asource_auto_out_a_mem_4_size; 
  assign auto_tl_out_xing_out_a_mem_4_source = asource_auto_out_a_mem_4_source; 
  assign auto_tl_out_xing_out_a_mem_4_address = asource_auto_out_a_mem_4_address; 
  assign auto_tl_out_xing_out_a_mem_4_mask = asource_auto_out_a_mem_4_mask; 
  assign auto_tl_out_xing_out_a_mem_4_data = asource_auto_out_a_mem_4_data; 
  assign auto_tl_out_xing_out_a_mem_4_corrupt = asource_auto_out_a_mem_4_corrupt; 
  assign auto_tl_out_xing_out_a_mem_5_opcode = asource_auto_out_a_mem_5_opcode; 
  assign auto_tl_out_xing_out_a_mem_5_param = asource_auto_out_a_mem_5_param; 
  assign auto_tl_out_xing_out_a_mem_5_size = asource_auto_out_a_mem_5_size; 
  assign auto_tl_out_xing_out_a_mem_5_source = asource_auto_out_a_mem_5_source; 
  assign auto_tl_out_xing_out_a_mem_5_address = asource_auto_out_a_mem_5_address; 
  assign auto_tl_out_xing_out_a_mem_5_mask = asource_auto_out_a_mem_5_mask; 
  assign auto_tl_out_xing_out_a_mem_5_data = asource_auto_out_a_mem_5_data; 
  assign auto_tl_out_xing_out_a_mem_5_corrupt = asource_auto_out_a_mem_5_corrupt; 
  assign auto_tl_out_xing_out_a_mem_6_opcode = asource_auto_out_a_mem_6_opcode; 
  assign auto_tl_out_xing_out_a_mem_6_param = asource_auto_out_a_mem_6_param; 
  assign auto_tl_out_xing_out_a_mem_6_size = asource_auto_out_a_mem_6_size; 
  assign auto_tl_out_xing_out_a_mem_6_source = asource_auto_out_a_mem_6_source; 
  assign auto_tl_out_xing_out_a_mem_6_address = asource_auto_out_a_mem_6_address; 
  assign auto_tl_out_xing_out_a_mem_6_mask = asource_auto_out_a_mem_6_mask; 
  assign auto_tl_out_xing_out_a_mem_6_data = asource_auto_out_a_mem_6_data; 
  assign auto_tl_out_xing_out_a_mem_6_corrupt = asource_auto_out_a_mem_6_corrupt; 
  assign auto_tl_out_xing_out_a_mem_7_opcode = asource_auto_out_a_mem_7_opcode; 
  assign auto_tl_out_xing_out_a_mem_7_param = asource_auto_out_a_mem_7_param; 
  assign auto_tl_out_xing_out_a_mem_7_size = asource_auto_out_a_mem_7_size; 
  assign auto_tl_out_xing_out_a_mem_7_source = asource_auto_out_a_mem_7_source; 
  assign auto_tl_out_xing_out_a_mem_7_address = asource_auto_out_a_mem_7_address; 
  assign auto_tl_out_xing_out_a_mem_7_mask = asource_auto_out_a_mem_7_mask; 
  assign auto_tl_out_xing_out_a_mem_7_data = asource_auto_out_a_mem_7_data; 
  assign auto_tl_out_xing_out_a_mem_7_corrupt = asource_auto_out_a_mem_7_corrupt; 
  assign auto_tl_out_xing_out_a_widx = asource_auto_out_a_widx; 
  assign auto_tl_out_xing_out_a_safe_widx_valid = asource_auto_out_a_safe_widx_valid; 
  assign auto_tl_out_xing_out_a_safe_source_reset_n = asource_auto_out_a_safe_source_reset_n; 
  assign auto_tl_out_xing_out_d_ridx = asource_auto_out_d_ridx; 
  assign auto_tl_out_xing_out_d_safe_ridx_valid = asource_auto_out_d_safe_ridx_valid; 
  assign auto_tl_out_xing_out_d_safe_sink_reset_n = asource_auto_out_d_safe_sink_reset_n; 
  assign auto_tl_in_xing_in_1_a_ridx = asink_1_auto_in_a_ridx; 
  assign auto_tl_in_xing_in_1_a_safe_ridx_valid = asink_1_auto_in_a_safe_ridx_valid; 
  assign auto_tl_in_xing_in_1_a_safe_sink_reset_n = asink_1_auto_in_a_safe_sink_reset_n; 
  assign auto_tl_in_xing_in_1_d_mem_0_opcode = asink_1_auto_in_d_mem_0_opcode; 
  assign auto_tl_in_xing_in_1_d_mem_0_param = asink_1_auto_in_d_mem_0_param; 
  assign auto_tl_in_xing_in_1_d_mem_0_size = asink_1_auto_in_d_mem_0_size; 
  assign auto_tl_in_xing_in_1_d_mem_0_source = asink_1_auto_in_d_mem_0_source; 
  assign auto_tl_in_xing_in_1_d_mem_0_sink = asink_1_auto_in_d_mem_0_sink; 
  assign auto_tl_in_xing_in_1_d_mem_0_denied = asink_1_auto_in_d_mem_0_denied; 
  assign auto_tl_in_xing_in_1_d_mem_0_data = asink_1_auto_in_d_mem_0_data; 
  assign auto_tl_in_xing_in_1_d_mem_0_corrupt = asink_1_auto_in_d_mem_0_corrupt; 
  assign auto_tl_in_xing_in_1_d_mem_1_opcode = asink_1_auto_in_d_mem_1_opcode; 
  assign auto_tl_in_xing_in_1_d_mem_1_param = asink_1_auto_in_d_mem_1_param; 
  assign auto_tl_in_xing_in_1_d_mem_1_size = asink_1_auto_in_d_mem_1_size; 
  assign auto_tl_in_xing_in_1_d_mem_1_source = asink_1_auto_in_d_mem_1_source; 
  assign auto_tl_in_xing_in_1_d_mem_1_sink = asink_1_auto_in_d_mem_1_sink; 
  assign auto_tl_in_xing_in_1_d_mem_1_denied = asink_1_auto_in_d_mem_1_denied; 
  assign auto_tl_in_xing_in_1_d_mem_1_data = asink_1_auto_in_d_mem_1_data; 
  assign auto_tl_in_xing_in_1_d_mem_1_corrupt = asink_1_auto_in_d_mem_1_corrupt; 
  assign auto_tl_in_xing_in_1_d_mem_2_opcode = asink_1_auto_in_d_mem_2_opcode; 
  assign auto_tl_in_xing_in_1_d_mem_2_param = asink_1_auto_in_d_mem_2_param; 
  assign auto_tl_in_xing_in_1_d_mem_2_size = asink_1_auto_in_d_mem_2_size; 
  assign auto_tl_in_xing_in_1_d_mem_2_source = asink_1_auto_in_d_mem_2_source; 
  assign auto_tl_in_xing_in_1_d_mem_2_sink = asink_1_auto_in_d_mem_2_sink; 
  assign auto_tl_in_xing_in_1_d_mem_2_denied = asink_1_auto_in_d_mem_2_denied; 
  assign auto_tl_in_xing_in_1_d_mem_2_data = asink_1_auto_in_d_mem_2_data; 
  assign auto_tl_in_xing_in_1_d_mem_2_corrupt = asink_1_auto_in_d_mem_2_corrupt; 
  assign auto_tl_in_xing_in_1_d_mem_3_opcode = asink_1_auto_in_d_mem_3_opcode; 
  assign auto_tl_in_xing_in_1_d_mem_3_param = asink_1_auto_in_d_mem_3_param; 
  assign auto_tl_in_xing_in_1_d_mem_3_size = asink_1_auto_in_d_mem_3_size; 
  assign auto_tl_in_xing_in_1_d_mem_3_source = asink_1_auto_in_d_mem_3_source; 
  assign auto_tl_in_xing_in_1_d_mem_3_sink = asink_1_auto_in_d_mem_3_sink; 
  assign auto_tl_in_xing_in_1_d_mem_3_denied = asink_1_auto_in_d_mem_3_denied; 
  assign auto_tl_in_xing_in_1_d_mem_3_data = asink_1_auto_in_d_mem_3_data; 
  assign auto_tl_in_xing_in_1_d_mem_3_corrupt = asink_1_auto_in_d_mem_3_corrupt; 
  assign auto_tl_in_xing_in_1_d_mem_4_opcode = asink_1_auto_in_d_mem_4_opcode; 
  assign auto_tl_in_xing_in_1_d_mem_4_param = asink_1_auto_in_d_mem_4_param; 
  assign auto_tl_in_xing_in_1_d_mem_4_size = asink_1_auto_in_d_mem_4_size; 
  assign auto_tl_in_xing_in_1_d_mem_4_source = asink_1_auto_in_d_mem_4_source; 
  assign auto_tl_in_xing_in_1_d_mem_4_sink = asink_1_auto_in_d_mem_4_sink; 
  assign auto_tl_in_xing_in_1_d_mem_4_denied = asink_1_auto_in_d_mem_4_denied; 
  assign auto_tl_in_xing_in_1_d_mem_4_data = asink_1_auto_in_d_mem_4_data; 
  assign auto_tl_in_xing_in_1_d_mem_4_corrupt = asink_1_auto_in_d_mem_4_corrupt; 
  assign auto_tl_in_xing_in_1_d_mem_5_opcode = asink_1_auto_in_d_mem_5_opcode; 
  assign auto_tl_in_xing_in_1_d_mem_5_param = asink_1_auto_in_d_mem_5_param; 
  assign auto_tl_in_xing_in_1_d_mem_5_size = asink_1_auto_in_d_mem_5_size; 
  assign auto_tl_in_xing_in_1_d_mem_5_source = asink_1_auto_in_d_mem_5_source; 
  assign auto_tl_in_xing_in_1_d_mem_5_sink = asink_1_auto_in_d_mem_5_sink; 
  assign auto_tl_in_xing_in_1_d_mem_5_denied = asink_1_auto_in_d_mem_5_denied; 
  assign auto_tl_in_xing_in_1_d_mem_5_data = asink_1_auto_in_d_mem_5_data; 
  assign auto_tl_in_xing_in_1_d_mem_5_corrupt = asink_1_auto_in_d_mem_5_corrupt; 
  assign auto_tl_in_xing_in_1_d_mem_6_opcode = asink_1_auto_in_d_mem_6_opcode; 
  assign auto_tl_in_xing_in_1_d_mem_6_param = asink_1_auto_in_d_mem_6_param; 
  assign auto_tl_in_xing_in_1_d_mem_6_size = asink_1_auto_in_d_mem_6_size; 
  assign auto_tl_in_xing_in_1_d_mem_6_source = asink_1_auto_in_d_mem_6_source; 
  assign auto_tl_in_xing_in_1_d_mem_6_sink = asink_1_auto_in_d_mem_6_sink; 
  assign auto_tl_in_xing_in_1_d_mem_6_denied = asink_1_auto_in_d_mem_6_denied; 
  assign auto_tl_in_xing_in_1_d_mem_6_data = asink_1_auto_in_d_mem_6_data; 
  assign auto_tl_in_xing_in_1_d_mem_6_corrupt = asink_1_auto_in_d_mem_6_corrupt; 
  assign auto_tl_in_xing_in_1_d_mem_7_opcode = asink_1_auto_in_d_mem_7_opcode; 
  assign auto_tl_in_xing_in_1_d_mem_7_param = asink_1_auto_in_d_mem_7_param; 
  assign auto_tl_in_xing_in_1_d_mem_7_size = asink_1_auto_in_d_mem_7_size; 
  assign auto_tl_in_xing_in_1_d_mem_7_source = asink_1_auto_in_d_mem_7_source; 
  assign auto_tl_in_xing_in_1_d_mem_7_sink = asink_1_auto_in_d_mem_7_sink; 
  assign auto_tl_in_xing_in_1_d_mem_7_denied = asink_1_auto_in_d_mem_7_denied; 
  assign auto_tl_in_xing_in_1_d_mem_7_data = asink_1_auto_in_d_mem_7_data; 
  assign auto_tl_in_xing_in_1_d_mem_7_corrupt = asink_1_auto_in_d_mem_7_corrupt; 
  assign auto_tl_in_xing_in_1_d_widx = asink_1_auto_in_d_widx; 
  assign auto_tl_in_xing_in_1_d_safe_widx_valid = asink_1_auto_in_d_safe_widx_valid; 
  assign auto_tl_in_xing_in_1_d_safe_source_reset_n = asink_1_auto_in_d_safe_source_reset_n; 
  assign auto_tl_in_xing_in_0_a_ridx = asink_auto_in_a_ridx; 
  assign auto_tl_in_xing_in_0_a_safe_ridx_valid = asink_auto_in_a_safe_ridx_valid; 
  assign auto_tl_in_xing_in_0_a_safe_sink_reset_n = asink_auto_in_a_safe_sink_reset_n; 
  assign auto_tl_in_xing_in_0_d_mem_0_opcode = asink_auto_in_d_mem_0_opcode; 
  assign auto_tl_in_xing_in_0_d_mem_0_param = asink_auto_in_d_mem_0_param; 
  assign auto_tl_in_xing_in_0_d_mem_0_size = asink_auto_in_d_mem_0_size; 
  assign auto_tl_in_xing_in_0_d_mem_0_source = asink_auto_in_d_mem_0_source; 
  assign auto_tl_in_xing_in_0_d_mem_0_sink = asink_auto_in_d_mem_0_sink; 
  assign auto_tl_in_xing_in_0_d_mem_0_denied = asink_auto_in_d_mem_0_denied; 
  assign auto_tl_in_xing_in_0_d_mem_0_data = asink_auto_in_d_mem_0_data; 
  assign auto_tl_in_xing_in_0_d_mem_0_corrupt = asink_auto_in_d_mem_0_corrupt; 
  assign auto_tl_in_xing_in_0_d_mem_1_opcode = asink_auto_in_d_mem_1_opcode; 
  assign auto_tl_in_xing_in_0_d_mem_1_param = asink_auto_in_d_mem_1_param; 
  assign auto_tl_in_xing_in_0_d_mem_1_size = asink_auto_in_d_mem_1_size; 
  assign auto_tl_in_xing_in_0_d_mem_1_source = asink_auto_in_d_mem_1_source; 
  assign auto_tl_in_xing_in_0_d_mem_1_sink = asink_auto_in_d_mem_1_sink; 
  assign auto_tl_in_xing_in_0_d_mem_1_denied = asink_auto_in_d_mem_1_denied; 
  assign auto_tl_in_xing_in_0_d_mem_1_data = asink_auto_in_d_mem_1_data; 
  assign auto_tl_in_xing_in_0_d_mem_1_corrupt = asink_auto_in_d_mem_1_corrupt; 
  assign auto_tl_in_xing_in_0_d_mem_2_opcode = asink_auto_in_d_mem_2_opcode; 
  assign auto_tl_in_xing_in_0_d_mem_2_param = asink_auto_in_d_mem_2_param; 
  assign auto_tl_in_xing_in_0_d_mem_2_size = asink_auto_in_d_mem_2_size; 
  assign auto_tl_in_xing_in_0_d_mem_2_source = asink_auto_in_d_mem_2_source; 
  assign auto_tl_in_xing_in_0_d_mem_2_sink = asink_auto_in_d_mem_2_sink; 
  assign auto_tl_in_xing_in_0_d_mem_2_denied = asink_auto_in_d_mem_2_denied; 
  assign auto_tl_in_xing_in_0_d_mem_2_data = asink_auto_in_d_mem_2_data; 
  assign auto_tl_in_xing_in_0_d_mem_2_corrupt = asink_auto_in_d_mem_2_corrupt; 
  assign auto_tl_in_xing_in_0_d_mem_3_opcode = asink_auto_in_d_mem_3_opcode; 
  assign auto_tl_in_xing_in_0_d_mem_3_param = asink_auto_in_d_mem_3_param; 
  assign auto_tl_in_xing_in_0_d_mem_3_size = asink_auto_in_d_mem_3_size; 
  assign auto_tl_in_xing_in_0_d_mem_3_source = asink_auto_in_d_mem_3_source; 
  assign auto_tl_in_xing_in_0_d_mem_3_sink = asink_auto_in_d_mem_3_sink; 
  assign auto_tl_in_xing_in_0_d_mem_3_denied = asink_auto_in_d_mem_3_denied; 
  assign auto_tl_in_xing_in_0_d_mem_3_data = asink_auto_in_d_mem_3_data; 
  assign auto_tl_in_xing_in_0_d_mem_3_corrupt = asink_auto_in_d_mem_3_corrupt; 
  assign auto_tl_in_xing_in_0_d_mem_4_opcode = asink_auto_in_d_mem_4_opcode; 
  assign auto_tl_in_xing_in_0_d_mem_4_param = asink_auto_in_d_mem_4_param; 
  assign auto_tl_in_xing_in_0_d_mem_4_size = asink_auto_in_d_mem_4_size; 
  assign auto_tl_in_xing_in_0_d_mem_4_source = asink_auto_in_d_mem_4_source; 
  assign auto_tl_in_xing_in_0_d_mem_4_sink = asink_auto_in_d_mem_4_sink; 
  assign auto_tl_in_xing_in_0_d_mem_4_denied = asink_auto_in_d_mem_4_denied; 
  assign auto_tl_in_xing_in_0_d_mem_4_data = asink_auto_in_d_mem_4_data; 
  assign auto_tl_in_xing_in_0_d_mem_4_corrupt = asink_auto_in_d_mem_4_corrupt; 
  assign auto_tl_in_xing_in_0_d_mem_5_opcode = asink_auto_in_d_mem_5_opcode; 
  assign auto_tl_in_xing_in_0_d_mem_5_param = asink_auto_in_d_mem_5_param; 
  assign auto_tl_in_xing_in_0_d_mem_5_size = asink_auto_in_d_mem_5_size; 
  assign auto_tl_in_xing_in_0_d_mem_5_source = asink_auto_in_d_mem_5_source; 
  assign auto_tl_in_xing_in_0_d_mem_5_sink = asink_auto_in_d_mem_5_sink; 
  assign auto_tl_in_xing_in_0_d_mem_5_denied = asink_auto_in_d_mem_5_denied; 
  assign auto_tl_in_xing_in_0_d_mem_5_data = asink_auto_in_d_mem_5_data; 
  assign auto_tl_in_xing_in_0_d_mem_5_corrupt = asink_auto_in_d_mem_5_corrupt; 
  assign auto_tl_in_xing_in_0_d_mem_6_opcode = asink_auto_in_d_mem_6_opcode; 
  assign auto_tl_in_xing_in_0_d_mem_6_param = asink_auto_in_d_mem_6_param; 
  assign auto_tl_in_xing_in_0_d_mem_6_size = asink_auto_in_d_mem_6_size; 
  assign auto_tl_in_xing_in_0_d_mem_6_source = asink_auto_in_d_mem_6_source; 
  assign auto_tl_in_xing_in_0_d_mem_6_sink = asink_auto_in_d_mem_6_sink; 
  assign auto_tl_in_xing_in_0_d_mem_6_denied = asink_auto_in_d_mem_6_denied; 
  assign auto_tl_in_xing_in_0_d_mem_6_data = asink_auto_in_d_mem_6_data; 
  assign auto_tl_in_xing_in_0_d_mem_6_corrupt = asink_auto_in_d_mem_6_corrupt; 
  assign auto_tl_in_xing_in_0_d_mem_7_opcode = asink_auto_in_d_mem_7_opcode; 
  assign auto_tl_in_xing_in_0_d_mem_7_param = asink_auto_in_d_mem_7_param; 
  assign auto_tl_in_xing_in_0_d_mem_7_size = asink_auto_in_d_mem_7_size; 
  assign auto_tl_in_xing_in_0_d_mem_7_source = asink_auto_in_d_mem_7_source; 
  assign auto_tl_in_xing_in_0_d_mem_7_sink = asink_auto_in_d_mem_7_sink; 
  assign auto_tl_in_xing_in_0_d_mem_7_denied = asink_auto_in_d_mem_7_denied; 
  assign auto_tl_in_xing_in_0_d_mem_7_data = asink_auto_in_d_mem_7_data; 
  assign auto_tl_in_xing_in_0_d_mem_7_corrupt = asink_auto_in_d_mem_7_corrupt; 
  assign auto_tl_in_xing_in_0_d_widx = asink_auto_in_d_widx; 
  assign auto_tl_in_xing_in_0_d_safe_widx_valid = asink_auto_in_d_safe_widx_valid; 
  assign auto_tl_in_xing_in_0_d_safe_source_reset_n = asink_auto_in_d_safe_source_reset_n; 
  assign io_port_pci_exp_txp = axi_to_pcie_x1_io_port_pci_exp_txp; 
  assign io_port_pci_exp_txn = axi_to_pcie_x1_io_port_pci_exp_txn; 
  assign io_port_axi_aclk_out = axi_to_pcie_x1_io_port_axi_aclk_out; 
  assign io_port_mmcm_lock = axi_to_pcie_x1_io_port_mmcm_lock; 
  
`ifndef USE_PCIE_SLAVE_CFG_PORT
  assign axi_to_pcie_x1_auto_master_out_aw_ready = axi4frag_auto_in_aw_ready; 
  assign axi_to_pcie_x1_auto_master_out_w_ready = axi4frag_auto_in_w_ready; 
  assign axi_to_pcie_x1_auto_master_out_b_valid = axi4frag_auto_in_b_valid; 
  assign axi_to_pcie_x1_auto_master_out_b_bits_resp = axi4frag_auto_in_b_bits_resp; 
  assign axi_to_pcie_x1_auto_master_out_ar_ready = axi4frag_auto_in_ar_ready; 
  assign axi_to_pcie_x1_auto_master_out_r_valid = axi4frag_auto_in_r_valid; 
  assign axi_to_pcie_x1_auto_master_out_r_bits_data = axi4frag_auto_in_r_bits_data; 
  assign axi_to_pcie_x1_auto_master_out_r_bits_resp = axi4frag_auto_in_r_bits_resp; 
  assign axi_to_pcie_x1_auto_master_out_r_bits_last = axi4frag_auto_in_r_bits_last; 
  assign axi_to_pcie_x1_auto_control_in_aw_valid = axi4buf_1_auto_out_aw_valid; 
  assign axi_to_pcie_x1_auto_control_in_aw_bits_addr = axi4buf_1_auto_out_aw_bits_addr; 
  assign axi_to_pcie_x1_auto_control_in_w_valid = axi4buf_1_auto_out_w_valid; 
  assign axi_to_pcie_x1_auto_control_in_w_bits_data = axi4buf_1_auto_out_w_bits_data; 
  assign axi_to_pcie_x1_auto_control_in_w_bits_strb = axi4buf_1_auto_out_w_bits_strb; 
  assign axi_to_pcie_x1_auto_control_in_b_ready = axi4buf_1_auto_out_b_ready; 
  assign axi_to_pcie_x1_auto_control_in_ar_valid = axi4buf_1_auto_out_ar_valid; 
  assign axi_to_pcie_x1_auto_control_in_ar_bits_addr = axi4buf_1_auto_out_ar_bits_addr; 
  assign axi_to_pcie_x1_auto_control_in_r_ready = axi4buf_1_auto_out_r_ready; 
  assign axi_to_pcie_x1_auto_slave_in_aw_valid = axi4buf_auto_out_aw_valid; 
  assign axi_to_pcie_x1_auto_slave_in_aw_bits_id = axi4buf_auto_out_aw_bits_id; 
  assign axi_to_pcie_x1_auto_slave_in_aw_bits_addr = axi4buf_auto_out_aw_bits_addr; 
  assign axi_to_pcie_x1_auto_slave_in_aw_bits_len = axi4buf_auto_out_aw_bits_len; 
  assign axi_to_pcie_x1_auto_slave_in_aw_bits_size = axi4buf_auto_out_aw_bits_size; 
  assign axi_to_pcie_x1_auto_slave_in_aw_bits_burst = axi4buf_auto_out_aw_bits_burst; 
  assign axi_to_pcie_x1_auto_slave_in_w_valid = axi4buf_auto_out_w_valid; 
  assign axi_to_pcie_x1_auto_slave_in_w_bits_data = axi4buf_auto_out_w_bits_data; 
  assign axi_to_pcie_x1_auto_slave_in_w_bits_strb = axi4buf_auto_out_w_bits_strb; 
  assign axi_to_pcie_x1_auto_slave_in_w_bits_last = axi4buf_auto_out_w_bits_last; 
  assign axi_to_pcie_x1_auto_slave_in_b_ready = axi4buf_auto_out_b_ready; 
  assign axi_to_pcie_x1_auto_slave_in_ar_valid = axi4buf_auto_out_ar_valid; 
  assign axi_to_pcie_x1_auto_slave_in_ar_bits_id = axi4buf_auto_out_ar_bits_id; 
  assign axi_to_pcie_x1_auto_slave_in_ar_bits_addr = axi4buf_auto_out_ar_bits_addr; 
  assign axi_to_pcie_x1_auto_slave_in_ar_bits_len = axi4buf_auto_out_ar_bits_len; 
  assign axi_to_pcie_x1_auto_slave_in_ar_bits_size = axi4buf_auto_out_ar_bits_size; 
  assign axi_to_pcie_x1_auto_slave_in_ar_bits_burst = axi4buf_auto_out_ar_bits_burst; 
  assign axi_to_pcie_x1_auto_slave_in_r_ready = axi4buf_auto_out_r_ready; 
  assign axi_to_pcie_x1_io_port_pci_exp_rxp = io_port_pci_exp_rxp; 
  assign axi_to_pcie_x1_io_port_pci_exp_rxn = io_port_pci_exp_rxn; 
  //assign axi_to_pcie_x1_io_port_axi_aresetn = io_port_axi_aresetn; 
  assign axi_to_pcie_x1_io_REFCLK = ibufds_gte2_O; 
  assign axi4buf_clock = io_port_axi_aclk_out; 
  assign axi4buf_reset = ~ io_port_axi_aresetn; 
  assign axi4buf_auto_in_aw_valid = axi4yank_auto_out_aw_valid; 
  assign axi4buf_auto_in_aw_bits_id = axi4yank_auto_out_aw_bits_id; 
  assign axi4buf_auto_in_aw_bits_addr = axi4yank_auto_out_aw_bits_addr; 
  assign axi4buf_auto_in_aw_bits_len = axi4yank_auto_out_aw_bits_len; 
  assign axi4buf_auto_in_aw_bits_size = axi4yank_auto_out_aw_bits_size; 
  assign axi4buf_auto_in_aw_bits_burst = axi4yank_auto_out_aw_bits_burst; 
  assign axi4buf_auto_in_w_valid = axi4yank_auto_out_w_valid; 
  assign axi4buf_auto_in_w_bits_data = axi4yank_auto_out_w_bits_data; 
  assign axi4buf_auto_in_w_bits_strb = axi4yank_auto_out_w_bits_strb; 
  assign axi4buf_auto_in_w_bits_last = axi4yank_auto_out_w_bits_last; 
  assign axi4buf_auto_in_b_ready = axi4yank_auto_out_b_ready; 
  assign axi4buf_auto_in_ar_valid = axi4yank_auto_out_ar_valid; 
  assign axi4buf_auto_in_ar_bits_id = axi4yank_auto_out_ar_bits_id; 
  assign axi4buf_auto_in_ar_bits_addr = axi4yank_auto_out_ar_bits_addr; 
  assign axi4buf_auto_in_ar_bits_len = axi4yank_auto_out_ar_bits_len; 
  assign axi4buf_auto_in_ar_bits_size = axi4yank_auto_out_ar_bits_size; 
  assign axi4buf_auto_in_ar_bits_burst = axi4yank_auto_out_ar_bits_burst; 
  assign axi4buf_auto_in_r_ready = axi4yank_auto_out_r_ready; 
  assign axi4buf_auto_out_aw_ready = axi_to_pcie_x1_auto_slave_in_aw_ready; 
  assign axi4buf_auto_out_w_ready = axi_to_pcie_x1_auto_slave_in_w_ready; 
  assign axi4buf_auto_out_b_valid = axi_to_pcie_x1_auto_slave_in_b_valid; 
  assign axi4buf_auto_out_b_bits_id = axi_to_pcie_x1_auto_slave_in_b_bits_id; 
  assign axi4buf_auto_out_b_bits_resp = axi_to_pcie_x1_auto_slave_in_b_bits_resp; 
  assign axi4buf_auto_out_ar_ready = axi_to_pcie_x1_auto_slave_in_ar_ready; 
  assign axi4buf_auto_out_r_valid = axi_to_pcie_x1_auto_slave_in_r_valid; 
  assign axi4buf_auto_out_r_bits_id = axi_to_pcie_x1_auto_slave_in_r_bits_id; 
  assign axi4buf_auto_out_r_bits_data = axi_to_pcie_x1_auto_slave_in_r_bits_data; 
  assign axi4buf_auto_out_r_bits_resp = axi_to_pcie_x1_auto_slave_in_r_bits_resp; 
  assign axi4buf_auto_out_r_bits_last = axi_to_pcie_x1_auto_slave_in_r_bits_last; 
  assign axi4yank_clock = io_port_axi_aclk_out; 
  assign axi4yank_reset = ~ io_port_axi_aresetn; 
  assign axi4yank_auto_in_aw_valid = axi4deint_auto_out_aw_valid; 
  assign axi4yank_auto_in_aw_bits_id = axi4deint_auto_out_aw_bits_id; 
  assign axi4yank_auto_in_aw_bits_addr = axi4deint_auto_out_aw_bits_addr; 
  assign axi4yank_auto_in_aw_bits_len = axi4deint_auto_out_aw_bits_len; 
  assign axi4yank_auto_in_aw_bits_size = axi4deint_auto_out_aw_bits_size; 
  assign axi4yank_auto_in_aw_bits_burst = axi4deint_auto_out_aw_bits_burst; 
  assign axi4yank_auto_in_aw_bits_user = axi4deint_auto_out_aw_bits_user; 
  assign axi4yank_auto_in_w_valid = axi4deint_auto_out_w_valid; 
  assign axi4yank_auto_in_w_bits_data = axi4deint_auto_out_w_bits_data; 
  assign axi4yank_auto_in_w_bits_strb = axi4deint_auto_out_w_bits_strb; 
  assign axi4yank_auto_in_w_bits_last = axi4deint_auto_out_w_bits_last; 
  assign axi4yank_auto_in_b_ready = axi4deint_auto_out_b_ready; 
  assign axi4yank_auto_in_ar_valid = axi4deint_auto_out_ar_valid; 
  assign axi4yank_auto_in_ar_bits_id = axi4deint_auto_out_ar_bits_id; 
  assign axi4yank_auto_in_ar_bits_addr = axi4deint_auto_out_ar_bits_addr; 
  assign axi4yank_auto_in_ar_bits_len = axi4deint_auto_out_ar_bits_len; 
  assign axi4yank_auto_in_ar_bits_size = axi4deint_auto_out_ar_bits_size; 
  assign axi4yank_auto_in_ar_bits_burst = axi4deint_auto_out_ar_bits_burst; 
  assign axi4yank_auto_in_ar_bits_user = axi4deint_auto_out_ar_bits_user; 
  assign axi4yank_auto_in_r_ready = axi4deint_auto_out_r_ready; 
  assign axi4yank_auto_out_aw_ready = axi4buf_auto_in_aw_ready; 
  assign axi4yank_auto_out_w_ready = axi4buf_auto_in_w_ready; 
  assign axi4yank_auto_out_b_valid = axi4buf_auto_in_b_valid; 
  assign axi4yank_auto_out_b_bits_id = axi4buf_auto_in_b_bits_id; 
  assign axi4yank_auto_out_b_bits_resp = axi4buf_auto_in_b_bits_resp; 
  assign axi4yank_auto_out_ar_ready = axi4buf_auto_in_ar_ready; 
  assign axi4yank_auto_out_r_valid = axi4buf_auto_in_r_valid; 
  assign axi4yank_auto_out_r_bits_id = axi4buf_auto_in_r_bits_id; 
  assign axi4yank_auto_out_r_bits_data = axi4buf_auto_in_r_bits_data; 
  assign axi4yank_auto_out_r_bits_resp = axi4buf_auto_in_r_bits_resp; 
  assign axi4yank_auto_out_r_bits_last = axi4buf_auto_in_r_bits_last; 
  assign axi4deint_clock = io_port_axi_aclk_out; 
  assign axi4deint_reset = ~ io_port_axi_aresetn; 
  assign axi4deint_auto_in_aw_valid = axi4index_auto_out_aw_valid; 
  assign axi4deint_auto_in_aw_bits_id = axi4index_auto_out_aw_bits_id; 
  assign axi4deint_auto_in_aw_bits_addr = axi4index_auto_out_aw_bits_addr; 
  assign axi4deint_auto_in_aw_bits_len = axi4index_auto_out_aw_bits_len; 
  assign axi4deint_auto_in_aw_bits_size = axi4index_auto_out_aw_bits_size; 
  assign axi4deint_auto_in_aw_bits_burst = axi4index_auto_out_aw_bits_burst; 
  assign axi4deint_auto_in_aw_bits_user = axi4index_auto_out_aw_bits_user; 
  assign axi4deint_auto_in_w_valid = axi4index_auto_out_w_valid; 
  assign axi4deint_auto_in_w_bits_data = axi4index_auto_out_w_bits_data; 
  assign axi4deint_auto_in_w_bits_strb = axi4index_auto_out_w_bits_strb; 
  assign axi4deint_auto_in_w_bits_last = axi4index_auto_out_w_bits_last; 
  assign axi4deint_auto_in_b_ready = axi4index_auto_out_b_ready; 
  assign axi4deint_auto_in_ar_valid = axi4index_auto_out_ar_valid; 
  assign axi4deint_auto_in_ar_bits_id = axi4index_auto_out_ar_bits_id; 
  assign axi4deint_auto_in_ar_bits_addr = axi4index_auto_out_ar_bits_addr; 
  assign axi4deint_auto_in_ar_bits_len = axi4index_auto_out_ar_bits_len; 
  assign axi4deint_auto_in_ar_bits_size = axi4index_auto_out_ar_bits_size; 
  assign axi4deint_auto_in_ar_bits_burst = axi4index_auto_out_ar_bits_burst; 
  assign axi4deint_auto_in_ar_bits_user = axi4index_auto_out_ar_bits_user; 
  assign axi4deint_auto_in_r_ready = axi4index_auto_out_r_ready; 
  assign axi4deint_auto_out_aw_ready = axi4yank_auto_in_aw_ready; 
  assign axi4deint_auto_out_w_ready = axi4yank_auto_in_w_ready; 
  assign axi4deint_auto_out_b_valid = axi4yank_auto_in_b_valid; 
  assign axi4deint_auto_out_b_bits_id = axi4yank_auto_in_b_bits_id; 
  assign axi4deint_auto_out_b_bits_resp = axi4yank_auto_in_b_bits_resp; 
  assign axi4deint_auto_out_b_bits_user = axi4yank_auto_in_b_bits_user; 
  assign axi4deint_auto_out_ar_ready = axi4yank_auto_in_ar_ready; 
  assign axi4deint_auto_out_r_valid = axi4yank_auto_in_r_valid; 
  assign axi4deint_auto_out_r_bits_id = axi4yank_auto_in_r_bits_id; 
  assign axi4deint_auto_out_r_bits_data = axi4yank_auto_in_r_bits_data; 
  assign axi4deint_auto_out_r_bits_resp = axi4yank_auto_in_r_bits_resp; 
  assign axi4deint_auto_out_r_bits_user = axi4yank_auto_in_r_bits_user; 
  assign axi4deint_auto_out_r_bits_last = axi4yank_auto_in_r_bits_last; 
  assign axi4index_auto_in_aw_valid = tl2axi4_auto_out_aw_valid; 
  assign axi4index_auto_in_aw_bits_id = tl2axi4_auto_out_aw_bits_id; 
  assign axi4index_auto_in_aw_bits_addr = tl2axi4_auto_out_aw_bits_addr; 
  assign axi4index_auto_in_aw_bits_len = tl2axi4_auto_out_aw_bits_len; 
  assign axi4index_auto_in_aw_bits_size = tl2axi4_auto_out_aw_bits_size; 
  assign axi4index_auto_in_aw_bits_burst = tl2axi4_auto_out_aw_bits_burst; 
  assign axi4index_auto_in_aw_bits_user = tl2axi4_auto_out_aw_bits_user; 
  assign axi4index_auto_in_w_valid = tl2axi4_auto_out_w_valid; 
  assign axi4index_auto_in_w_bits_data = tl2axi4_auto_out_w_bits_data; 
  assign axi4index_auto_in_w_bits_strb = tl2axi4_auto_out_w_bits_strb; 
  assign axi4index_auto_in_w_bits_last = tl2axi4_auto_out_w_bits_last; 
  assign axi4index_auto_in_b_ready = tl2axi4_auto_out_b_ready; 
  assign axi4index_auto_in_ar_valid = tl2axi4_auto_out_ar_valid; 
  assign axi4index_auto_in_ar_bits_id = tl2axi4_auto_out_ar_bits_id; 
  assign axi4index_auto_in_ar_bits_addr = tl2axi4_auto_out_ar_bits_addr; 
  assign axi4index_auto_in_ar_bits_len = tl2axi4_auto_out_ar_bits_len; 
  assign axi4index_auto_in_ar_bits_size = tl2axi4_auto_out_ar_bits_size; 
  assign axi4index_auto_in_ar_bits_burst = tl2axi4_auto_out_ar_bits_burst; 
  assign axi4index_auto_in_ar_bits_user = tl2axi4_auto_out_ar_bits_user; 
  assign axi4index_auto_in_r_ready = tl2axi4_auto_out_r_ready; 
  assign axi4index_auto_out_aw_ready = axi4deint_auto_in_aw_ready; 
  assign axi4index_auto_out_w_ready = axi4deint_auto_in_w_ready; 
  assign axi4index_auto_out_b_valid = axi4deint_auto_in_b_valid; 
  assign axi4index_auto_out_b_bits_id = axi4deint_auto_in_b_bits_id; 
  assign axi4index_auto_out_b_bits_resp = axi4deint_auto_in_b_bits_resp; 
  assign axi4index_auto_out_b_bits_user = axi4deint_auto_in_b_bits_user; 
  assign axi4index_auto_out_ar_ready = axi4deint_auto_in_ar_ready; 
  assign axi4index_auto_out_r_valid = axi4deint_auto_in_r_valid; 
  assign axi4index_auto_out_r_bits_id = axi4deint_auto_in_r_bits_id; 
  assign axi4index_auto_out_r_bits_data = axi4deint_auto_in_r_bits_data; 
  assign axi4index_auto_out_r_bits_resp = axi4deint_auto_in_r_bits_resp; 
  assign axi4index_auto_out_r_bits_user = axi4deint_auto_in_r_bits_user; 
  assign axi4index_auto_out_r_bits_last = axi4deint_auto_in_r_bits_last; 
  assign tl2axi4_clock = io_port_axi_aclk_out; 
  assign tl2axi4_reset = ~ io_port_axi_aresetn; 
  assign tl2axi4_auto_in_a_valid = asink_auto_out_a_valid; 
  assign tl2axi4_auto_in_a_bits_opcode = asink_auto_out_a_bits_opcode; 
  assign tl2axi4_auto_in_a_bits_param = asink_auto_out_a_bits_param; 
  assign tl2axi4_auto_in_a_bits_size = asink_auto_out_a_bits_size; 
  assign tl2axi4_auto_in_a_bits_source = asink_auto_out_a_bits_source; 
  assign tl2axi4_auto_in_a_bits_address = asink_auto_out_a_bits_address; 
  assign tl2axi4_auto_in_a_bits_mask = asink_auto_out_a_bits_mask; 
  assign tl2axi4_auto_in_a_bits_data = asink_auto_out_a_bits_data; 
  assign tl2axi4_auto_in_a_bits_corrupt = asink_auto_out_a_bits_corrupt; 
  assign tl2axi4_auto_in_d_ready = asink_auto_out_d_ready; 
  assign tl2axi4_auto_out_aw_ready = axi4index_auto_in_aw_ready; 
  assign tl2axi4_auto_out_w_ready = axi4index_auto_in_w_ready; 
  assign tl2axi4_auto_out_b_valid = axi4index_auto_in_b_valid; 
  assign tl2axi4_auto_out_b_bits_id = axi4index_auto_in_b_bits_id; 
  assign tl2axi4_auto_out_b_bits_resp = axi4index_auto_in_b_bits_resp; 
  assign tl2axi4_auto_out_b_bits_user = axi4index_auto_in_b_bits_user; 
  assign tl2axi4_auto_out_ar_ready = axi4index_auto_in_ar_ready; 
  assign tl2axi4_auto_out_r_valid = axi4index_auto_in_r_valid; 
  assign tl2axi4_auto_out_r_bits_id = axi4index_auto_in_r_bits_id; 
  assign tl2axi4_auto_out_r_bits_data = axi4index_auto_in_r_bits_data; 
  assign tl2axi4_auto_out_r_bits_resp = axi4index_auto_in_r_bits_resp; 
  assign tl2axi4_auto_out_r_bits_user = axi4index_auto_in_r_bits_user; 
  assign tl2axi4_auto_out_r_bits_last = axi4index_auto_in_r_bits_last; 
  assign axi4buf_1_clock = io_port_axi_aclk_out; 
  assign axi4buf_1_reset = ~ io_port_axi_aresetn; 
  assign axi4buf_1_auto_in_aw_valid = axi4yank_1_auto_out_aw_valid; 
  assign axi4buf_1_auto_in_aw_bits_addr = axi4yank_1_auto_out_aw_bits_addr; 
  assign axi4buf_1_auto_in_w_valid = axi4yank_1_auto_out_w_valid; 
  assign axi4buf_1_auto_in_w_bits_data = axi4yank_1_auto_out_w_bits_data; 
  assign axi4buf_1_auto_in_w_bits_strb = axi4yank_1_auto_out_w_bits_strb; 
  assign axi4buf_1_auto_in_b_ready = axi4yank_1_auto_out_b_ready; 
  assign axi4buf_1_auto_in_ar_valid = axi4yank_1_auto_out_ar_valid; 
  assign axi4buf_1_auto_in_ar_bits_addr = axi4yank_1_auto_out_ar_bits_addr; 
  assign axi4buf_1_auto_in_r_ready = axi4yank_1_auto_out_r_ready; 
  assign axi4buf_1_auto_out_aw_ready = axi_to_pcie_x1_auto_control_in_aw_ready; 
  assign axi4buf_1_auto_out_w_ready = axi_to_pcie_x1_auto_control_in_w_ready; 
  assign axi4buf_1_auto_out_b_valid = axi_to_pcie_x1_auto_control_in_b_valid; 
  assign axi4buf_1_auto_out_b_bits_resp = axi_to_pcie_x1_auto_control_in_b_bits_resp; 
  assign axi4buf_1_auto_out_ar_ready = axi_to_pcie_x1_auto_control_in_ar_ready; 
  assign axi4buf_1_auto_out_r_valid = axi_to_pcie_x1_auto_control_in_r_valid; 
  assign axi4buf_1_auto_out_r_bits_data = axi_to_pcie_x1_auto_control_in_r_bits_data; 
  assign axi4buf_1_auto_out_r_bits_resp = axi_to_pcie_x1_auto_control_in_r_bits_resp; 
  assign axi4yank_1_clock = io_port_axi_aclk_out; 
  assign axi4yank_1_reset = ~ io_port_axi_aresetn; 
  assign axi4yank_1_auto_in_aw_valid = tl2axi4_1_auto_out_aw_valid; 
  assign axi4yank_1_auto_in_aw_bits_addr = tl2axi4_1_auto_out_aw_bits_addr; 
  assign axi4yank_1_auto_in_aw_bits_user = tl2axi4_1_auto_out_aw_bits_user; 
  assign axi4yank_1_auto_in_w_valid = tl2axi4_1_auto_out_w_valid; 
  assign axi4yank_1_auto_in_w_bits_data = tl2axi4_1_auto_out_w_bits_data; 
  assign axi4yank_1_auto_in_w_bits_strb = tl2axi4_1_auto_out_w_bits_strb; 
  assign axi4yank_1_auto_in_b_ready = tl2axi4_1_auto_out_b_ready; 
  assign axi4yank_1_auto_in_ar_valid = tl2axi4_1_auto_out_ar_valid; 
  assign axi4yank_1_auto_in_ar_bits_addr = tl2axi4_1_auto_out_ar_bits_addr; 
  assign axi4yank_1_auto_in_ar_bits_user = tl2axi4_1_auto_out_ar_bits_user; 
  assign axi4yank_1_auto_in_r_ready = tl2axi4_1_auto_out_r_ready; 
  assign axi4yank_1_auto_out_aw_ready = axi4buf_1_auto_in_aw_ready; 
  assign axi4yank_1_auto_out_w_ready = axi4buf_1_auto_in_w_ready; 
  assign axi4yank_1_auto_out_b_valid = axi4buf_1_auto_in_b_valid; 
  assign axi4yank_1_auto_out_b_bits_resp = axi4buf_1_auto_in_b_bits_resp; 
  assign axi4yank_1_auto_out_ar_ready = axi4buf_1_auto_in_ar_ready; 
  assign axi4yank_1_auto_out_r_valid = axi4buf_1_auto_in_r_valid; 
  assign axi4yank_1_auto_out_r_bits_data = axi4buf_1_auto_in_r_bits_data; 
  assign axi4yank_1_auto_out_r_bits_resp = axi4buf_1_auto_in_r_bits_resp; 
  assign axi4yank_1_auto_out_r_bits_last = axi4buf_1_auto_in_r_bits_last; 
  assign tl2axi4_1_clock = io_port_axi_aclk_out; 
  assign tl2axi4_1_reset = ~ io_port_axi_aresetn; 
  assign tl2axi4_1_auto_in_a_valid = fragmenter_auto_out_a_valid; 
  assign tl2axi4_1_auto_in_a_bits_opcode = fragmenter_auto_out_a_bits_opcode; 
  assign tl2axi4_1_auto_in_a_bits_param = fragmenter_auto_out_a_bits_param; 
  assign tl2axi4_1_auto_in_a_bits_size = fragmenter_auto_out_a_bits_size; 
  assign tl2axi4_1_auto_in_a_bits_source = fragmenter_auto_out_a_bits_source; 
  assign tl2axi4_1_auto_in_a_bits_address = fragmenter_auto_out_a_bits_address; 
  assign tl2axi4_1_auto_in_a_bits_mask = fragmenter_auto_out_a_bits_mask; 
  assign tl2axi4_1_auto_in_a_bits_data = fragmenter_auto_out_a_bits_data; 
  assign tl2axi4_1_auto_in_a_bits_corrupt = fragmenter_auto_out_a_bits_corrupt; 
  assign tl2axi4_1_auto_in_d_ready = fragmenter_auto_out_d_ready; 
  assign tl2axi4_1_auto_out_aw_ready = axi4yank_1_auto_in_aw_ready; 
  assign tl2axi4_1_auto_out_w_ready = axi4yank_1_auto_in_w_ready; 
  assign tl2axi4_1_auto_out_b_valid = axi4yank_1_auto_in_b_valid; 
  assign tl2axi4_1_auto_out_b_bits_resp = axi4yank_1_auto_in_b_bits_resp; 
  assign tl2axi4_1_auto_out_b_bits_user = axi4yank_1_auto_in_b_bits_user; 
  assign tl2axi4_1_auto_out_ar_ready = axi4yank_1_auto_in_ar_ready; 
  assign tl2axi4_1_auto_out_r_valid = axi4yank_1_auto_in_r_valid; 
  assign tl2axi4_1_auto_out_r_bits_data = axi4yank_1_auto_in_r_bits_data; 
  assign tl2axi4_1_auto_out_r_bits_resp = axi4yank_1_auto_in_r_bits_resp; 
  assign tl2axi4_1_auto_out_r_bits_user = axi4yank_1_auto_in_r_bits_user; 
  assign tl2axi4_1_auto_out_r_bits_last = axi4yank_1_auto_in_r_bits_last; 
  assign fragmenter_clock = io_port_axi_aclk_out; 
  assign fragmenter_reset = ~ io_port_axi_aresetn; 
  assign fragmenter_auto_in_a_valid = asink_1_auto_out_a_valid; 
  assign fragmenter_auto_in_a_bits_opcode = asink_1_auto_out_a_bits_opcode; 
  assign fragmenter_auto_in_a_bits_param = asink_1_auto_out_a_bits_param; 
  assign fragmenter_auto_in_a_bits_size = asink_1_auto_out_a_bits_size; 
  assign fragmenter_auto_in_a_bits_source = asink_1_auto_out_a_bits_source; 
  assign fragmenter_auto_in_a_bits_address = asink_1_auto_out_a_bits_address; 
  assign fragmenter_auto_in_a_bits_mask = asink_1_auto_out_a_bits_mask; 
  assign fragmenter_auto_in_a_bits_data = asink_1_auto_out_a_bits_data; 
  assign fragmenter_auto_in_a_bits_corrupt = asink_1_auto_out_a_bits_corrupt; 
  assign fragmenter_auto_in_d_ready = asink_1_auto_out_d_ready; 
  assign fragmenter_auto_out_a_ready = tl2axi4_1_auto_in_a_ready; 
  assign fragmenter_auto_out_d_valid = tl2axi4_1_auto_in_d_valid; 
  assign fragmenter_auto_out_d_bits_opcode = tl2axi4_1_auto_in_d_bits_opcode; 
  assign fragmenter_auto_out_d_bits_size = tl2axi4_1_auto_in_d_bits_size; 
  assign fragmenter_auto_out_d_bits_source = tl2axi4_1_auto_in_d_bits_source; 
  assign fragmenter_auto_out_d_bits_denied = tl2axi4_1_auto_in_d_bits_denied; 
  assign fragmenter_auto_out_d_bits_data = tl2axi4_1_auto_in_d_bits_data; 
  assign fragmenter_auto_out_d_bits_corrupt = tl2axi4_1_auto_in_d_bits_corrupt; 
  assign widget_clock = io_port_axi_aclk_out; 
  assign widget_reset = ~ io_port_axi_aresetn; 
  assign widget_auto_in_a_valid = axi42tl_auto_out_a_valid; 
  assign widget_auto_in_a_bits_opcode = axi42tl_auto_out_a_bits_opcode; 
  assign widget_auto_in_a_bits_param = 3'b0 ; // axi42tl_auto_out_a_bits_param
  assign widget_auto_in_a_bits_size = axi42tl_auto_out_a_bits_size; 
  assign widget_auto_in_a_bits_source = axi42tl_auto_out_a_bits_source; 
  //assign widget_auto_in_a_bits_address = {axi42tl_auto_in_tl_addr_msb_10[9:4], axi42tl_auto_in_tl_addr_msb_10[3:0], axi42tl_auto_out_a_bits_address[27:0]}; 
  assign widget_auto_in_a_bits_address = {axi42tl_auto_in_tl_addr_msb_10[9:4], axi42tl_auto_out_a_bits_address[31:0]};
  assign widget_auto_in_a_bits_mask = axi42tl_auto_out_a_bits_mask; 
  assign widget_auto_in_a_bits_data = axi42tl_auto_out_a_bits_data; 
  assign widget_auto_in_a_bits_corrupt = 1'b0;  // axi42tl_auto_out_a_bits_corrupt
  assign widget_auto_in_d_ready = axi42tl_auto_out_d_ready; 
  assign widget_auto_out_a_ready = asource_auto_in_a_ready; 
  assign widget_auto_out_d_valid = asource_auto_in_d_valid; 
  assign widget_auto_out_d_bits_opcode = asource_auto_in_d_bits_opcode; 
  assign widget_auto_out_d_bits_param = asource_auto_in_d_bits_param; 
  assign widget_auto_out_d_bits_size = asource_auto_in_d_bits_size; 
  assign widget_auto_out_d_bits_source = asource_auto_in_d_bits_source; 
  assign widget_auto_out_d_bits_sink = asource_auto_in_d_bits_sink; 
  assign widget_auto_out_d_bits_denied = asource_auto_in_d_bits_denied; 
  assign widget_auto_out_d_bits_data = asource_auto_in_d_bits_data; 
  assign widget_auto_out_d_bits_corrupt = asource_auto_in_d_bits_corrupt; 
  `endif
  assign axi42tl_clock = io_port_axi_aclk_out; 
  assign axi42tl_reset = ~ io_port_axi_aresetn; 

  assign axi42tl_auto_in_aw_valid = axi4yank_2_auto_out_aw_valid; 
  assign axi42tl_auto_in_aw_bits_id[0] = axi4yank_2_auto_out_aw_bits_id; 
  assign axi42tl_auto_in_aw_bits_addr = axi4yank_2_auto_out_aw_bits_addr; 
  assign axi42tl_auto_in_aw_bits_len = axi4yank_2_auto_out_aw_bits_len; 
  assign axi42tl_auto_in_aw_bits_size = axi4yank_2_auto_out_aw_bits_size; 
  assign axi42tl_auto_in_w_valid = axi4yank_2_auto_out_w_valid; 
  assign axi42tl_auto_in_w_bits_data = axi4yank_2_auto_out_w_bits_data; 
  assign axi42tl_auto_in_w_bits_strb = axi4yank_2_auto_out_w_bits_strb; 
  assign axi42tl_auto_in_w_bits_last = axi4yank_2_auto_out_w_bits_last; 
  assign axi42tl_auto_in_b_ready = axi4yank_2_auto_out_b_ready; 
  assign axi42tl_auto_in_ar_valid = axi4yank_2_auto_out_ar_valid; 
  assign axi42tl_auto_in_ar_bits_id[0] = axi4yank_2_auto_out_ar_bits_id; 
  assign axi42tl_auto_in_ar_bits_addr = axi4yank_2_auto_out_ar_bits_addr; 
  assign axi42tl_auto_in_ar_bits_len = axi4yank_2_auto_out_ar_bits_len; 
  assign axi42tl_auto_in_ar_bits_size = axi4yank_2_auto_out_ar_bits_size; 
  assign axi42tl_auto_in_r_ready = axi4yank_2_auto_out_r_ready; 
  assign axi42tl_auto_out_a_ready = widget_auto_in_a_ready; 
  assign axi42tl_auto_out_d_valid = widget_auto_in_d_valid; 
  assign axi42tl_auto_out_d_bits_source = widget_auto_in_d_bits_source; 
  assign axi42tl_auto_out_d_bits_opcode = widget_auto_in_d_bits_opcode; 
  assign axi42tl_auto_out_d_bits_size = widget_auto_in_d_bits_size; 
  assign axi42tl_auto_out_d_bits_denied = widget_auto_in_d_bits_denied; 
  assign axi42tl_auto_out_d_bits_data = widget_auto_in_d_bits_data; 
  assign axi42tl_auto_out_d_bits_corrupt = widget_auto_in_d_bits_corrupt; 

  assign axi4yank_2_clock = io_port_axi_aclk_out; 
  assign axi4yank_2_reset = ~ io_port_axi_aresetn; 
  assign axi4yank_2_auto_in_aw_valid = axi4frag_auto_out_awvalid; 
  assign axi4yank_2_auto_in_aw_bits_id = axi4frag_auto_out_awid; 
  assign axi4yank_2_auto_in_aw_bits_addr = axi4frag_auto_out_awaddr; 
  assign axi4yank_2_auto_in_aw_bits_len = axi4frag_auto_out_awlen; 
  assign axi4yank_2_auto_in_aw_bits_size = axi4frag_auto_out_awsize; 
  assign axi4yank_2_auto_in_aw_bits_echo_extra_id = axi4frag_auto_out_awecho_extra_id;
  assign axi4yank_2_auto_in_w_valid = axi4frag_auto_out_wvalid; 
  assign axi4yank_2_auto_in_w_bits_data = axi4frag_auto_out_wdata; 
  assign axi4yank_2_auto_in_w_bits_strb = axi4frag_auto_out_wstrb; 
  assign axi4yank_2_auto_in_w_bits_last = axi4frag_auto_out_wlast; 
  assign axi4yank_2_auto_in_b_ready = axi4frag_auto_out_bready; 
  assign axi4yank_2_auto_in_ar_valid = axi4frag_auto_out_arvalid; 
  assign axi4yank_2_auto_in_ar_bits_id = axi4frag_auto_out_arid; 
  assign axi4yank_2_auto_in_ar_bits_addr = axi4frag_auto_out_araddr; 
  assign axi4yank_2_auto_in_ar_bits_len = axi4frag_auto_out_arlen; 
  assign axi4yank_2_auto_in_ar_bits_size = axi4frag_auto_out_arsize; 
  assign axi4yank_2_auto_in_ar_bits_echo_extra_id = axi4frag_auto_out_arecho_extra_id;
  assign axi4yank_2_auto_in_r_ready = axi4frag_auto_out_rready; 
  assign axi4yank_2_auto_out_aw_ready = axi42tl_auto_in_aw_ready; 
  assign axi4yank_2_auto_out_w_ready = axi42tl_auto_in_w_ready; 
  assign axi4yank_2_auto_out_b_valid = axi42tl_auto_in_b_valid; 
  assign axi4yank_2_auto_out_b_bits_resp = axi42tl_auto_in_b_bits_resp;  
  assign axi4yank_2_auto_out_b_bits_id = axi42tl_auto_in_b_bits_id[0];
  assign axi4yank_2_auto_out_ar_ready = axi42tl_auto_in_ar_ready; 
  assign axi4yank_2_auto_out_r_valid = axi42tl_auto_in_r_valid; 
  assign axi4yank_2_auto_out_r_bits_data = axi42tl_auto_in_r_bits_data; 
  assign axi4yank_2_auto_out_r_bits_resp = axi42tl_auto_in_r_bits_resp; 
  assign axi4yank_2_auto_out_r_bits_last = axi42tl_auto_in_r_bits_last;  
  assign axi4yank_2_auto_out_r_bits_id = axi42tl_auto_in_r_bits_id[0];
  assign axi4frag_clock = io_port_axi_aclk_out; 
  assign axi4frag_reset = ~ io_port_axi_aresetn; 
  assign axi4frag_auto_in_aw_valid = axi_to_pcie_x1_auto_master_out_aw_valid; 
  assign axi4frag_auto_in_aw_bits_addr = axi_to_pcie_x1_auto_master_out_aw_bits_addr; 
  assign axi4frag_auto_in_aw_bits_len = axi_to_pcie_x1_auto_master_out_aw_bits_len; 
  assign axi4frag_auto_in_aw_bits_size = axi_to_pcie_x1_auto_master_out_aw_bits_size; 
  assign axi4frag_auto_in_aw_bits_burst = axi_to_pcie_x1_auto_master_out_aw_bits_burst; 
  assign axi4frag_auto_in_w_valid = axi_to_pcie_x1_auto_master_out_w_valid; 
  assign axi4frag_auto_in_w_bits_data = axi_to_pcie_x1_auto_master_out_w_bits_data; 
  assign axi4frag_auto_in_w_bits_strb = axi_to_pcie_x1_auto_master_out_w_bits_strb; 
  assign axi4frag_auto_in_w_bits_last = axi_to_pcie_x1_auto_master_out_w_bits_last; 
  assign axi4frag_auto_in_b_ready = axi_to_pcie_x1_auto_master_out_b_ready; 
  assign axi4frag_auto_in_ar_valid = axi_to_pcie_x1_auto_master_out_ar_valid; 
  assign axi4frag_auto_in_ar_bits_addr = axi_to_pcie_x1_auto_master_out_ar_bits_addr; 
  assign axi4frag_auto_in_ar_bits_len = axi_to_pcie_x1_auto_master_out_ar_bits_len; 
  assign axi4frag_auto_in_ar_bits_size = axi_to_pcie_x1_auto_master_out_ar_bits_size; 
  assign axi4frag_auto_in_ar_bits_burst = axi_to_pcie_x1_auto_master_out_ar_bits_burst; 
  assign axi4frag_auto_in_r_ready = axi_to_pcie_x1_auto_master_out_r_ready; 
  assign axi4frag_auto_out_awready = axi4yank_2_auto_in_aw_ready; 
  assign axi4frag_auto_out_wready = axi4yank_2_auto_in_w_ready; 
  assign axi4frag_auto_out_bvalid = axi4yank_2_auto_in_b_valid;  
  assign axi4frag_auto_out_becho_extra_id = axi4yank_2_auto_in_b_bits_echo_extra_id; 
  assign axi4frag_auto_out_bid = axi4yank_2_auto_in_b_bits_id; 
  assign axi4frag_auto_out_bresp = axi4yank_2_auto_in_b_bits_resp; 
  assign axi4frag_auto_out_arready = axi4yank_2_auto_in_ar_ready; 
  assign axi4frag_auto_out_rvalid = axi4yank_2_auto_in_r_valid;  
  assign axi4frag_auto_out_recho_extra_id = axi4yank_2_auto_in_r_bits_echo_extra_id; 
  assign axi4frag_auto_out_rid = axi4yank_2_auto_in_r_bits_id; 
  assign axi4frag_auto_out_rdata = axi4yank_2_auto_in_r_bits_data; 
  assign axi4frag_auto_out_rresp = axi4yank_2_auto_in_r_bits_resp; 
  assign axi4frag_auto_out_rlast = axi4yank_2_auto_in_r_bits_last; 
  assign asink_clock = io_port_axi_aclk_out; 
  assign asink_reset = ~ io_port_axi_aresetn; 
  assign asink_auto_in_a_mem_0_opcode = auto_tl_in_xing_in_0_a_mem_0_opcode; 
  assign asink_auto_in_a_mem_0_param = auto_tl_in_xing_in_0_a_mem_0_param; 
  assign asink_auto_in_a_mem_0_size = auto_tl_in_xing_in_0_a_mem_0_size; 
  assign asink_auto_in_a_mem_0_source = auto_tl_in_xing_in_0_a_mem_0_source; 
  assign asink_auto_in_a_mem_0_address = auto_tl_in_xing_in_0_a_mem_0_address; 
  assign asink_auto_in_a_mem_0_mask = auto_tl_in_xing_in_0_a_mem_0_mask; 
  assign asink_auto_in_a_mem_0_data = auto_tl_in_xing_in_0_a_mem_0_data; 
  assign asink_auto_in_a_mem_0_corrupt = auto_tl_in_xing_in_0_a_mem_0_corrupt; 
  assign asink_auto_in_a_mem_1_opcode = auto_tl_in_xing_in_0_a_mem_1_opcode; 
  assign asink_auto_in_a_mem_1_param = auto_tl_in_xing_in_0_a_mem_1_param; 
  assign asink_auto_in_a_mem_1_size = auto_tl_in_xing_in_0_a_mem_1_size; 
  assign asink_auto_in_a_mem_1_source = auto_tl_in_xing_in_0_a_mem_1_source; 
  assign asink_auto_in_a_mem_1_address = auto_tl_in_xing_in_0_a_mem_1_address; 
  assign asink_auto_in_a_mem_1_mask = auto_tl_in_xing_in_0_a_mem_1_mask; 
  assign asink_auto_in_a_mem_1_data = auto_tl_in_xing_in_0_a_mem_1_data; 
  assign asink_auto_in_a_mem_1_corrupt = auto_tl_in_xing_in_0_a_mem_1_corrupt; 
  assign asink_auto_in_a_mem_2_opcode = auto_tl_in_xing_in_0_a_mem_2_opcode; 
  assign asink_auto_in_a_mem_2_param = auto_tl_in_xing_in_0_a_mem_2_param; 
  assign asink_auto_in_a_mem_2_size = auto_tl_in_xing_in_0_a_mem_2_size; 
  assign asink_auto_in_a_mem_2_source = auto_tl_in_xing_in_0_a_mem_2_source; 
  assign asink_auto_in_a_mem_2_address = auto_tl_in_xing_in_0_a_mem_2_address; 
  assign asink_auto_in_a_mem_2_mask = auto_tl_in_xing_in_0_a_mem_2_mask; 
  assign asink_auto_in_a_mem_2_data = auto_tl_in_xing_in_0_a_mem_2_data; 
  assign asink_auto_in_a_mem_2_corrupt = auto_tl_in_xing_in_0_a_mem_2_corrupt; 
  assign asink_auto_in_a_mem_3_opcode = auto_tl_in_xing_in_0_a_mem_3_opcode; 
  assign asink_auto_in_a_mem_3_param = auto_tl_in_xing_in_0_a_mem_3_param; 
  assign asink_auto_in_a_mem_3_size = auto_tl_in_xing_in_0_a_mem_3_size; 
  assign asink_auto_in_a_mem_3_source = auto_tl_in_xing_in_0_a_mem_3_source; 
  assign asink_auto_in_a_mem_3_address = auto_tl_in_xing_in_0_a_mem_3_address; 
  assign asink_auto_in_a_mem_3_mask = auto_tl_in_xing_in_0_a_mem_3_mask; 
  assign asink_auto_in_a_mem_3_data = auto_tl_in_xing_in_0_a_mem_3_data; 
  assign asink_auto_in_a_mem_3_corrupt = auto_tl_in_xing_in_0_a_mem_3_corrupt; 
  assign asink_auto_in_a_mem_4_opcode = auto_tl_in_xing_in_0_a_mem_4_opcode; 
  assign asink_auto_in_a_mem_4_param = auto_tl_in_xing_in_0_a_mem_4_param; 
  assign asink_auto_in_a_mem_4_size = auto_tl_in_xing_in_0_a_mem_4_size; 
  assign asink_auto_in_a_mem_4_source = auto_tl_in_xing_in_0_a_mem_4_source; 
  assign asink_auto_in_a_mem_4_address = auto_tl_in_xing_in_0_a_mem_4_address; 
  assign asink_auto_in_a_mem_4_mask = auto_tl_in_xing_in_0_a_mem_4_mask; 
  assign asink_auto_in_a_mem_4_data = auto_tl_in_xing_in_0_a_mem_4_data; 
  assign asink_auto_in_a_mem_4_corrupt = auto_tl_in_xing_in_0_a_mem_4_corrupt; 
  assign asink_auto_in_a_mem_5_opcode = auto_tl_in_xing_in_0_a_mem_5_opcode; 
  assign asink_auto_in_a_mem_5_param = auto_tl_in_xing_in_0_a_mem_5_param; 
  assign asink_auto_in_a_mem_5_size = auto_tl_in_xing_in_0_a_mem_5_size; 
  assign asink_auto_in_a_mem_5_source = auto_tl_in_xing_in_0_a_mem_5_source; 
  assign asink_auto_in_a_mem_5_address = auto_tl_in_xing_in_0_a_mem_5_address; 
  assign asink_auto_in_a_mem_5_mask = auto_tl_in_xing_in_0_a_mem_5_mask; 
  assign asink_auto_in_a_mem_5_data = auto_tl_in_xing_in_0_a_mem_5_data; 
  assign asink_auto_in_a_mem_5_corrupt = auto_tl_in_xing_in_0_a_mem_5_corrupt; 
  assign asink_auto_in_a_mem_6_opcode = auto_tl_in_xing_in_0_a_mem_6_opcode; 
  assign asink_auto_in_a_mem_6_param = auto_tl_in_xing_in_0_a_mem_6_param; 
  assign asink_auto_in_a_mem_6_size = auto_tl_in_xing_in_0_a_mem_6_size; 
  assign asink_auto_in_a_mem_6_source = auto_tl_in_xing_in_0_a_mem_6_source; 
  assign asink_auto_in_a_mem_6_address = auto_tl_in_xing_in_0_a_mem_6_address; 
  assign asink_auto_in_a_mem_6_mask = auto_tl_in_xing_in_0_a_mem_6_mask; 
  assign asink_auto_in_a_mem_6_data = auto_tl_in_xing_in_0_a_mem_6_data; 
  assign asink_auto_in_a_mem_6_corrupt = auto_tl_in_xing_in_0_a_mem_6_corrupt; 
  assign asink_auto_in_a_mem_7_opcode = auto_tl_in_xing_in_0_a_mem_7_opcode; 
  assign asink_auto_in_a_mem_7_param = auto_tl_in_xing_in_0_a_mem_7_param; 
  assign asink_auto_in_a_mem_7_size = auto_tl_in_xing_in_0_a_mem_7_size; 
  assign asink_auto_in_a_mem_7_source = auto_tl_in_xing_in_0_a_mem_7_source; 
  assign asink_auto_in_a_mem_7_address = auto_tl_in_xing_in_0_a_mem_7_address; 
  assign asink_auto_in_a_mem_7_mask = auto_tl_in_xing_in_0_a_mem_7_mask; 
  assign asink_auto_in_a_mem_7_data = auto_tl_in_xing_in_0_a_mem_7_data; 
  assign asink_auto_in_a_mem_7_corrupt = auto_tl_in_xing_in_0_a_mem_7_corrupt; 
  assign asink_auto_in_a_widx = auto_tl_in_xing_in_0_a_widx; 
  assign asink_auto_in_a_safe_widx_valid = auto_tl_in_xing_in_0_a_safe_widx_valid; 
  assign asink_auto_in_a_safe_source_reset_n = auto_tl_in_xing_in_0_a_safe_source_reset_n; 
  assign asink_auto_in_d_ridx = auto_tl_in_xing_in_0_d_ridx; 
  assign asink_auto_in_d_safe_ridx_valid = auto_tl_in_xing_in_0_d_safe_ridx_valid; 
  assign asink_auto_in_d_safe_sink_reset_n = auto_tl_in_xing_in_0_d_safe_sink_reset_n; 
  assign asink_auto_out_a_ready = tl2axi4_auto_in_a_ready; 
  assign asink_auto_out_d_valid = tl2axi4_auto_in_d_valid; 
  assign asink_auto_out_d_bits_opcode = tl2axi4_auto_in_d_bits_opcode; 
  assign asink_auto_out_d_bits_size = tl2axi4_auto_in_d_bits_size; 
  assign asink_auto_out_d_bits_source = tl2axi4_auto_in_d_bits_source; 
  assign asink_auto_out_d_bits_denied = tl2axi4_auto_in_d_bits_denied; 
  assign asink_auto_out_d_bits_data = tl2axi4_auto_in_d_bits_data; 
  assign asink_auto_out_d_bits_corrupt = tl2axi4_auto_in_d_bits_corrupt; 
  assign asink_1_clock = io_port_axi_aclk_out; 
  assign asink_1_reset = ~ io_port_axi_aresetn; 
  assign asink_1_auto_in_a_mem_0_opcode = auto_tl_in_xing_in_1_a_mem_0_opcode; 
  assign asink_1_auto_in_a_mem_0_param = auto_tl_in_xing_in_1_a_mem_0_param; 
  assign asink_1_auto_in_a_mem_0_size = auto_tl_in_xing_in_1_a_mem_0_size; 
  assign asink_1_auto_in_a_mem_0_source = auto_tl_in_xing_in_1_a_mem_0_source; 
  assign asink_1_auto_in_a_mem_0_address = auto_tl_in_xing_in_1_a_mem_0_address; 
  assign asink_1_auto_in_a_mem_0_mask = auto_tl_in_xing_in_1_a_mem_0_mask; 
  assign asink_1_auto_in_a_mem_0_data = auto_tl_in_xing_in_1_a_mem_0_data; 
  assign asink_1_auto_in_a_mem_0_corrupt = auto_tl_in_xing_in_1_a_mem_0_corrupt; 
  assign asink_1_auto_in_a_mem_1_opcode = auto_tl_in_xing_in_1_a_mem_1_opcode; 
  assign asink_1_auto_in_a_mem_1_param = auto_tl_in_xing_in_1_a_mem_1_param; 
  assign asink_1_auto_in_a_mem_1_size = auto_tl_in_xing_in_1_a_mem_1_size; 
  assign asink_1_auto_in_a_mem_1_source = auto_tl_in_xing_in_1_a_mem_1_source; 
  assign asink_1_auto_in_a_mem_1_address = auto_tl_in_xing_in_1_a_mem_1_address; 
  assign asink_1_auto_in_a_mem_1_mask = auto_tl_in_xing_in_1_a_mem_1_mask; 
  assign asink_1_auto_in_a_mem_1_data = auto_tl_in_xing_in_1_a_mem_1_data; 
  assign asink_1_auto_in_a_mem_1_corrupt = auto_tl_in_xing_in_1_a_mem_1_corrupt; 
  assign asink_1_auto_in_a_mem_2_opcode = auto_tl_in_xing_in_1_a_mem_2_opcode; 
  assign asink_1_auto_in_a_mem_2_param = auto_tl_in_xing_in_1_a_mem_2_param; 
  assign asink_1_auto_in_a_mem_2_size = auto_tl_in_xing_in_1_a_mem_2_size; 
  assign asink_1_auto_in_a_mem_2_source = auto_tl_in_xing_in_1_a_mem_2_source; 
  assign asink_1_auto_in_a_mem_2_address = auto_tl_in_xing_in_1_a_mem_2_address; 
  assign asink_1_auto_in_a_mem_2_mask = auto_tl_in_xing_in_1_a_mem_2_mask; 
  assign asink_1_auto_in_a_mem_2_data = auto_tl_in_xing_in_1_a_mem_2_data; 
  assign asink_1_auto_in_a_mem_2_corrupt = auto_tl_in_xing_in_1_a_mem_2_corrupt; 
  assign asink_1_auto_in_a_mem_3_opcode = auto_tl_in_xing_in_1_a_mem_3_opcode; 
  assign asink_1_auto_in_a_mem_3_param = auto_tl_in_xing_in_1_a_mem_3_param; 
  assign asink_1_auto_in_a_mem_3_size = auto_tl_in_xing_in_1_a_mem_3_size; 
  assign asink_1_auto_in_a_mem_3_source = auto_tl_in_xing_in_1_a_mem_3_source; 
  assign asink_1_auto_in_a_mem_3_address = auto_tl_in_xing_in_1_a_mem_3_address; 
  assign asink_1_auto_in_a_mem_3_mask = auto_tl_in_xing_in_1_a_mem_3_mask; 
  assign asink_1_auto_in_a_mem_3_data = auto_tl_in_xing_in_1_a_mem_3_data; 
  assign asink_1_auto_in_a_mem_3_corrupt = auto_tl_in_xing_in_1_a_mem_3_corrupt; 
  assign asink_1_auto_in_a_mem_4_opcode = auto_tl_in_xing_in_1_a_mem_4_opcode; 
  assign asink_1_auto_in_a_mem_4_param = auto_tl_in_xing_in_1_a_mem_4_param; 
  assign asink_1_auto_in_a_mem_4_size = auto_tl_in_xing_in_1_a_mem_4_size; 
  assign asink_1_auto_in_a_mem_4_source = auto_tl_in_xing_in_1_a_mem_4_source; 
  assign asink_1_auto_in_a_mem_4_address = auto_tl_in_xing_in_1_a_mem_4_address; 
  assign asink_1_auto_in_a_mem_4_mask = auto_tl_in_xing_in_1_a_mem_4_mask; 
  assign asink_1_auto_in_a_mem_4_data = auto_tl_in_xing_in_1_a_mem_4_data; 
  assign asink_1_auto_in_a_mem_4_corrupt = auto_tl_in_xing_in_1_a_mem_4_corrupt; 
  assign asink_1_auto_in_a_mem_5_opcode = auto_tl_in_xing_in_1_a_mem_5_opcode; 
  assign asink_1_auto_in_a_mem_5_param = auto_tl_in_xing_in_1_a_mem_5_param; 
  assign asink_1_auto_in_a_mem_5_size = auto_tl_in_xing_in_1_a_mem_5_size; 
  assign asink_1_auto_in_a_mem_5_source = auto_tl_in_xing_in_1_a_mem_5_source; 
  assign asink_1_auto_in_a_mem_5_address = auto_tl_in_xing_in_1_a_mem_5_address; 
  assign asink_1_auto_in_a_mem_5_mask = auto_tl_in_xing_in_1_a_mem_5_mask; 
  assign asink_1_auto_in_a_mem_5_data = auto_tl_in_xing_in_1_a_mem_5_data; 
  assign asink_1_auto_in_a_mem_5_corrupt = auto_tl_in_xing_in_1_a_mem_5_corrupt; 
  assign asink_1_auto_in_a_mem_6_opcode = auto_tl_in_xing_in_1_a_mem_6_opcode; 
  assign asink_1_auto_in_a_mem_6_param = auto_tl_in_xing_in_1_a_mem_6_param; 
  assign asink_1_auto_in_a_mem_6_size = auto_tl_in_xing_in_1_a_mem_6_size; 
  assign asink_1_auto_in_a_mem_6_source = auto_tl_in_xing_in_1_a_mem_6_source; 
  assign asink_1_auto_in_a_mem_6_address = auto_tl_in_xing_in_1_a_mem_6_address; 
  assign asink_1_auto_in_a_mem_6_mask = auto_tl_in_xing_in_1_a_mem_6_mask; 
  assign asink_1_auto_in_a_mem_6_data = auto_tl_in_xing_in_1_a_mem_6_data; 
  assign asink_1_auto_in_a_mem_6_corrupt = auto_tl_in_xing_in_1_a_mem_6_corrupt; 
  assign asink_1_auto_in_a_mem_7_opcode = auto_tl_in_xing_in_1_a_mem_7_opcode; 
  assign asink_1_auto_in_a_mem_7_param = auto_tl_in_xing_in_1_a_mem_7_param; 
  assign asink_1_auto_in_a_mem_7_size = auto_tl_in_xing_in_1_a_mem_7_size; 
  assign asink_1_auto_in_a_mem_7_source = auto_tl_in_xing_in_1_a_mem_7_source; 
  assign asink_1_auto_in_a_mem_7_address = auto_tl_in_xing_in_1_a_mem_7_address; 
  assign asink_1_auto_in_a_mem_7_mask = auto_tl_in_xing_in_1_a_mem_7_mask; 
  assign asink_1_auto_in_a_mem_7_data = auto_tl_in_xing_in_1_a_mem_7_data; 
  assign asink_1_auto_in_a_mem_7_corrupt = auto_tl_in_xing_in_1_a_mem_7_corrupt; 
  assign asink_1_auto_in_a_widx = auto_tl_in_xing_in_1_a_widx; 
  assign asink_1_auto_in_a_safe_widx_valid = auto_tl_in_xing_in_1_a_safe_widx_valid; 
  assign asink_1_auto_in_a_safe_source_reset_n = auto_tl_in_xing_in_1_a_safe_source_reset_n; 
  assign asink_1_auto_in_d_ridx = auto_tl_in_xing_in_1_d_ridx; 
  assign asink_1_auto_in_d_safe_ridx_valid = auto_tl_in_xing_in_1_d_safe_ridx_valid; 
  assign asink_1_auto_in_d_safe_sink_reset_n = auto_tl_in_xing_in_1_d_safe_sink_reset_n; 
  assign asink_1_auto_out_a_ready = fragmenter_auto_in_a_ready; 
  assign asink_1_auto_out_d_valid = fragmenter_auto_in_d_valid; 
  assign asink_1_auto_out_d_bits_opcode = fragmenter_auto_in_d_bits_opcode; 
  assign asink_1_auto_out_d_bits_size = fragmenter_auto_in_d_bits_size; 
  assign asink_1_auto_out_d_bits_source = fragmenter_auto_in_d_bits_source; 
  assign asink_1_auto_out_d_bits_denied = fragmenter_auto_in_d_bits_denied; 
  assign asink_1_auto_out_d_bits_data = fragmenter_auto_in_d_bits_data; 
  assign asink_1_auto_out_d_bits_corrupt = fragmenter_auto_in_d_bits_corrupt; 
  assign asource_clock = io_port_axi_aclk_out; 
  assign asource_reset = ~ io_port_axi_aresetn; 
  assign asource_auto_in_a_valid = widget_auto_out_a_valid; 
  assign asource_auto_in_a_bits_opcode = widget_auto_out_a_bits_opcode; 
  assign asource_auto_in_a_bits_param = widget_auto_out_a_bits_param; 
  assign asource_auto_in_a_bits_size = widget_auto_out_a_bits_size; 
  assign asource_auto_in_a_bits_source = widget_auto_out_a_bits_source; 
  assign asource_auto_in_a_bits_address = widget_auto_out_a_bits_address; 
  assign asource_auto_in_a_bits_mask = widget_auto_out_a_bits_mask; 
  assign asource_auto_in_a_bits_data = widget_auto_out_a_bits_data; 
  assign asource_auto_in_a_bits_corrupt = widget_auto_out_a_bits_corrupt; 
  assign asource_auto_in_d_ready = widget_auto_out_d_ready; 
  assign asource_auto_out_a_ridx = auto_tl_out_xing_out_a_ridx; 
  assign asource_auto_out_a_safe_ridx_valid = auto_tl_out_xing_out_a_safe_ridx_valid; 
  assign asource_auto_out_a_safe_sink_reset_n = auto_tl_out_xing_out_a_safe_sink_reset_n; 
  assign asource_auto_out_d_mem_0_opcode = auto_tl_out_xing_out_d_mem_0_opcode; 
  assign asource_auto_out_d_mem_0_param = auto_tl_out_xing_out_d_mem_0_param; 
  assign asource_auto_out_d_mem_0_size = auto_tl_out_xing_out_d_mem_0_size; 
  assign asource_auto_out_d_mem_0_source = auto_tl_out_xing_out_d_mem_0_source; 
  assign asource_auto_out_d_mem_0_sink = auto_tl_out_xing_out_d_mem_0_sink; 
  assign asource_auto_out_d_mem_0_denied = auto_tl_out_xing_out_d_mem_0_denied; 
  assign asource_auto_out_d_mem_0_data = auto_tl_out_xing_out_d_mem_0_data; 
  assign asource_auto_out_d_mem_0_corrupt = auto_tl_out_xing_out_d_mem_0_corrupt; 
  assign asource_auto_out_d_mem_1_opcode = auto_tl_out_xing_out_d_mem_1_opcode; 
  assign asource_auto_out_d_mem_1_param = auto_tl_out_xing_out_d_mem_1_param; 
  assign asource_auto_out_d_mem_1_size = auto_tl_out_xing_out_d_mem_1_size; 
  assign asource_auto_out_d_mem_1_source = auto_tl_out_xing_out_d_mem_1_source; 
  assign asource_auto_out_d_mem_1_sink = auto_tl_out_xing_out_d_mem_1_sink; 
  assign asource_auto_out_d_mem_1_denied = auto_tl_out_xing_out_d_mem_1_denied; 
  assign asource_auto_out_d_mem_1_data = auto_tl_out_xing_out_d_mem_1_data; 
  assign asource_auto_out_d_mem_1_corrupt = auto_tl_out_xing_out_d_mem_1_corrupt; 
  assign asource_auto_out_d_mem_2_opcode = auto_tl_out_xing_out_d_mem_2_opcode; 
  assign asource_auto_out_d_mem_2_param = auto_tl_out_xing_out_d_mem_2_param; 
  assign asource_auto_out_d_mem_2_size = auto_tl_out_xing_out_d_mem_2_size; 
  assign asource_auto_out_d_mem_2_source = auto_tl_out_xing_out_d_mem_2_source; 
  assign asource_auto_out_d_mem_2_sink = auto_tl_out_xing_out_d_mem_2_sink; 
  assign asource_auto_out_d_mem_2_denied = auto_tl_out_xing_out_d_mem_2_denied; 
  assign asource_auto_out_d_mem_2_data = auto_tl_out_xing_out_d_mem_2_data; 
  assign asource_auto_out_d_mem_2_corrupt = auto_tl_out_xing_out_d_mem_2_corrupt; 
  assign asource_auto_out_d_mem_3_opcode = auto_tl_out_xing_out_d_mem_3_opcode; 
  assign asource_auto_out_d_mem_3_param = auto_tl_out_xing_out_d_mem_3_param; 
  assign asource_auto_out_d_mem_3_size = auto_tl_out_xing_out_d_mem_3_size; 
  assign asource_auto_out_d_mem_3_source = auto_tl_out_xing_out_d_mem_3_source; 
  assign asource_auto_out_d_mem_3_sink = auto_tl_out_xing_out_d_mem_3_sink; 
  assign asource_auto_out_d_mem_3_denied = auto_tl_out_xing_out_d_mem_3_denied; 
  assign asource_auto_out_d_mem_3_data = auto_tl_out_xing_out_d_mem_3_data; 
  assign asource_auto_out_d_mem_3_corrupt = auto_tl_out_xing_out_d_mem_3_corrupt; 
  assign asource_auto_out_d_mem_4_opcode = auto_tl_out_xing_out_d_mem_4_opcode; 
  assign asource_auto_out_d_mem_4_param = auto_tl_out_xing_out_d_mem_4_param; 
  assign asource_auto_out_d_mem_4_size = auto_tl_out_xing_out_d_mem_4_size; 
  assign asource_auto_out_d_mem_4_source = auto_tl_out_xing_out_d_mem_4_source; 
  assign asource_auto_out_d_mem_4_sink = auto_tl_out_xing_out_d_mem_4_sink; 
  assign asource_auto_out_d_mem_4_denied = auto_tl_out_xing_out_d_mem_4_denied; 
  assign asource_auto_out_d_mem_4_data = auto_tl_out_xing_out_d_mem_4_data; 
  assign asource_auto_out_d_mem_4_corrupt = auto_tl_out_xing_out_d_mem_4_corrupt; 
  assign asource_auto_out_d_mem_5_opcode = auto_tl_out_xing_out_d_mem_5_opcode; 
  assign asource_auto_out_d_mem_5_param = auto_tl_out_xing_out_d_mem_5_param; 
  assign asource_auto_out_d_mem_5_size = auto_tl_out_xing_out_d_mem_5_size; 
  assign asource_auto_out_d_mem_5_source = auto_tl_out_xing_out_d_mem_5_source; 
  assign asource_auto_out_d_mem_5_sink = auto_tl_out_xing_out_d_mem_5_sink; 
  assign asource_auto_out_d_mem_5_denied = auto_tl_out_xing_out_d_mem_5_denied; 
  assign asource_auto_out_d_mem_5_data = auto_tl_out_xing_out_d_mem_5_data; 
  assign asource_auto_out_d_mem_5_corrupt = auto_tl_out_xing_out_d_mem_5_corrupt; 
  assign asource_auto_out_d_mem_6_opcode = auto_tl_out_xing_out_d_mem_6_opcode; 
  assign asource_auto_out_d_mem_6_param = auto_tl_out_xing_out_d_mem_6_param; 
  assign asource_auto_out_d_mem_6_size = auto_tl_out_xing_out_d_mem_6_size; 
  assign asource_auto_out_d_mem_6_source = auto_tl_out_xing_out_d_mem_6_source; 
  assign asource_auto_out_d_mem_6_sink = auto_tl_out_xing_out_d_mem_6_sink; 
  assign asource_auto_out_d_mem_6_denied = auto_tl_out_xing_out_d_mem_6_denied; 
  assign asource_auto_out_d_mem_6_data = auto_tl_out_xing_out_d_mem_6_data; 
  assign asource_auto_out_d_mem_6_corrupt = auto_tl_out_xing_out_d_mem_6_corrupt; 
  assign asource_auto_out_d_mem_7_opcode = auto_tl_out_xing_out_d_mem_7_opcode; 
  assign asource_auto_out_d_mem_7_param = auto_tl_out_xing_out_d_mem_7_param; 
  assign asource_auto_out_d_mem_7_size = auto_tl_out_xing_out_d_mem_7_size; 
  assign asource_auto_out_d_mem_7_source = auto_tl_out_xing_out_d_mem_7_source; 
  assign asource_auto_out_d_mem_7_sink = auto_tl_out_xing_out_d_mem_7_sink; 
  assign asource_auto_out_d_mem_7_denied = auto_tl_out_xing_out_d_mem_7_denied; 
  assign asource_auto_out_d_mem_7_data = auto_tl_out_xing_out_d_mem_7_data; 
  assign asource_auto_out_d_mem_7_corrupt = auto_tl_out_xing_out_d_mem_7_corrupt; 
  assign asource_auto_out_d_widx = auto_tl_out_xing_out_d_widx; 
  assign asource_auto_out_d_safe_widx_valid = auto_tl_out_xing_out_d_safe_widx_valid; 
  assign asource_auto_out_d_safe_source_reset_n = auto_tl_out_xing_out_d_safe_source_reset_n; 
  assign intsource_clock = io_port_axi_aclk_out; 
  assign intsource_reset = ~ io_port_axi_aresetn; 
  assign intsource_auto_in_0 = spi_master_events_o[0]; 
  assign ibufds_gte2_IB = io_port_REFCLK_rxn; 
  assign ibufds_gte2_I = io_port_REFCLK_rxp; 
  assign ibufds_gte2_CEB = 1'h0; 

endmodule
