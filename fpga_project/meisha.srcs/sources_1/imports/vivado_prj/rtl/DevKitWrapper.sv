module DevKitWrapper( 
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
    input                          spi_sclk,
    input                          spi_cs,
    input                          axi_spi_slave_test_mode,
    output                         spi_gpio_mux_sel,
    output   [1:0]                 spi_mode,
    input                          spi_sdi0,
    input                          spi_sdi1,
    input                          spi_sdi2,
    input                         spi_sdi3,
    output                         spi_sdo0,
    output                         spi_sdo1,
    output                         spi_sdo2,
    output                         spi_sdo3,
    output wire [3:0]                   spi_sdo_oen,
  `endif

  output wire  tile_all_reset,
  output wire  chiplink_reset,
  input wire  corePLL_clk_out_cpu,
  output wire  corePLL_clk_out_chiplink,
  output wire  auto_out_alway_on_reset,
  //output wire  corePLL_locked,


  input wire debug_mode_sel_pad_glitch_free,
  input wire in_ref_always_on_clk, 
  input wire in_hard_pwr_reset,
  //input corePLL_clk_out_main,

  output wire   ddr_io_c2b_clk
  ,output wire   ddr_io_c2b_rst
  ,output wire   ddr_io_c2b_send
  ,output wire  [7:0] ddr_io_c2b_data,
  input  wire  ddr_io_b2c_clk
  ,input wire   ddr_io_b2c_rst
  ,input wire   ddr_io_b2c_send
  ,input wire  [7:0] ddr_io_b2c_data,

  output wire spi_master_clk,
  output wire [3:0] spi_master_csn,
  output wire [1:0] spi_master_mode,
  output wire [3:0] spi_master_sdo,
  output wire [3:0] spi_master_sdo_oen,
  input  wire [3:0] spi_master_sdi,


  //output [7:0]  auto_topMod_led_source_out, 
  //input         auto_topMod_io_out_1_port_REFCLK_rxp, 
  //input         auto_topMod_io_out_1_port_REFCLK_rxn, 
  //output        auto_topMod_io_out_1_port_pci_exp_txp, 
  //output        auto_topMod_io_out_1_port_pci_exp_txn, 
  //input         auto_topMod_io_out_1_port_pci_exp_rxp, 
  //input         auto_topMod_io_out_1_port_pci_exp_rxn, 
  // output        auto_topMod_io_out_1_port_axi_aclk_out, 
  // output        auto_topMod_io_out_1_port_mmcm_lock, 
  //output [13:0] auto_topMod_io_out_0_port_ddr3_addr, 
  //output [2:0]  auto_topMod_io_out_0_port_ddr3_ba, 
  //output        auto_topMod_io_out_0_port_ddr3_ras_n, 
  //output        auto_topMod_io_out_0_port_ddr3_cas_n, 
  //output        auto_topMod_io_out_0_port_ddr3_we_n, 
  //output        auto_topMod_io_out_0_port_ddr3_reset_n, 
  //output        auto_topMod_io_out_0_port_ddr3_ck_p, 
  //output        auto_topMod_io_out_0_port_ddr3_ck_n, 
  //output        auto_topMod_io_out_0_port_ddr3_cke, 
  //output        auto_topMod_io_out_0_port_ddr3_cs_n, 
  //output [7:0]  auto_topMod_io_out_0_port_ddr3_dm, 
  //output        auto_topMod_io_out_0_port_ddr3_odt, 
  // inout  [63:0] auto_topMod_io_out_0_port_ddr3_dq, 
  // inout  [7:0]  auto_topMod_io_out_0_port_ddr3_dqs_n, 
  // inout  [7:0]  auto_topMod_io_out_0_port_ddr3_dqs_p, 
  //output        auto_topMod_io_out_0_port_ui_clk, 
  //output        auto_topMod_io_out_0_port_ui_clk_sync_rst, 
  //output        auto_topMod_io_out_0_port_mmcm_locked, 
  //input         auto_topMod_io_out_0_port_aresetn, 
  input         auto_topMod_io_out_0_port_sys_rst, 
  output        auto_topMod_spi_source_out_sck, 
  output        auto_topMod_spi_source_out_dq_0_o, 
  input         auto_topMod_spi_source_out_dq_1_i, 
  output        auto_topMod_spi_source_out_cs_0, 
  output        auto_topMod_uart_source_out_txd, 
  input         auto_topMod_uart_source_out_rxd, 
  // input         auto_wrangler_in_1_clock, 
  // input         auto_wrangler_in_1_reset, 
  // input         auto_wrangler_in_0_clock, 
  // input         auto_wrangler_in_0_reset, 
  // output        auto_wrangler_out_1_reset, 
  // output        auto_wrangler_out_0_reset, 
  // input         auto_coreGroup_in_member_0_clock, 
  // input         auto_coreGroup_in_member_0_reset, 
  input         auto_jtag_debug_source_out_jtag_TCK, 
  input         auto_jtag_debug_source_out_jtag_TMS, 
  input         auto_jtag_debug_source_out_jtag_TDI, 
  output        auto_jtag_debug_source_out_jtag_TDO
);
  // wire  coreGroup_auto_in_member_0_clock; 
  // wire  coreGroup_auto_in_member_0_reset; 
  // wire  coreGroup_auto_out_clock; 
  // wire  coreGroup_auto_out_reset; 
  // wire  wrangler_auto_in_2_clock; 
  // wire  wrangler_auto_in_2_reset; 
  // wire  wrangler_auto_in_1_clock; 
  // wire  wrangler_auto_in_1_reset; 
  // wire  wrangler_auto_in_0_clock; 
  // wire  wrangler_auto_in_0_reset; 
  // wire  wrangler_auto_out_2_reset; 
  // wire  wrangler_auto_out_1_reset; 
  //wire  wrangler_auto_out_0_clock; 
  wire  wrangler_auto_out_0_reset; // globar reset
  wire  topMod_clock; 
  wire  topMod_reset; 
  wire [7:0] topMod_auto_led_source_out; 
  wire  topMod_auto_io_out_1_port_REFCLK_rxp; 
  wire  topMod_auto_io_out_1_port_REFCLK_rxn; 
  wire  topMod_auto_io_out_1_port_pci_exp_txp; 
  wire  topMod_auto_io_out_1_port_pci_exp_txn; 
  wire  topMod_auto_io_out_1_port_pci_exp_rxp; 
  wire  topMod_auto_io_out_1_port_pci_exp_rxn; 
  wire  topMod_auto_io_out_1_port_axi_aresetn; 
  wire  topMod_auto_io_out_1_port_axi_aclk_out; 
  wire  topMod_auto_io_out_1_port_mmcm_lock; 
  wire [13:0] topMod_auto_io_out_0_port_ddr3_addr; 
  wire [2:0] topMod_auto_io_out_0_port_ddr3_ba; 
  wire  topMod_auto_io_out_0_port_ddr3_ras_n; 
  wire  topMod_auto_io_out_0_port_ddr3_cas_n; 
  wire  topMod_auto_io_out_0_port_ddr3_we_n; 
  wire  topMod_auto_io_out_0_port_ddr3_reset_n; 
  wire  topMod_auto_io_out_0_port_ddr3_ck_p; 
  wire  topMod_auto_io_out_0_port_ddr3_ck_n; 
  wire  topMod_auto_io_out_0_port_ddr3_cke; 
  wire  topMod_auto_io_out_0_port_ddr3_cs_n; 
  wire [7:0] topMod_auto_io_out_0_port_ddr3_dm; 
  wire  topMod_auto_io_out_0_port_ddr3_odt; 
  wire  topMod_auto_io_out_0_port_sys_clk_i; 
  wire  topMod_auto_io_out_0_port_ui_clk; 
  wire  topMod_auto_io_out_0_port_ui_clk_sync_rst; 
  wire  topMod_auto_io_out_0_port_mmcm_locked; 
  wire  topMod_auto_io_out_0_port_aresetn; 
  wire  topMod_auto_io_out_0_port_sys_rst; 
  wire  topMod_auto_spi_source_out_sck; 
  wire  topMod_auto_spi_source_out_dq_0_o; 
  wire  topMod_auto_spi_source_out_dq_1_i; 
  wire  topMod_auto_spi_source_out_cs_0; 
  wire  topMod_auto_uart_source_out_txd; 
  wire  topMod_auto_uart_source_out_rxd; 
  wire  topMod_debug_systemjtag_jtag_TCK; 
  wire  topMod_debug_systemjtag_jtag_TMS; 
  wire  topMod_debug_systemjtag_jtag_TDI; 
  wire  topMod_debug_systemjtag_jtag_TDO_data; 
  wire  topMod_debug_systemjtag_reset; 
  wire  topMod_debug_ndreset; 


  
  wire  auto_topMod_io_out_1_port_axi_aresetn;  // modify to d2d_sub reset_n , equal with 

  wire  core_reset; 

  //wire  corePLL_reset; 
  wire  corePLL_clk_out_main; 

  wire         tile_clock;
  wire         tile_1_clock;
  wire         tile_2_clock; 
  wire         tile_3_clock;

  wire  [31:0]  use_which_clk;
  wire  [63:0]  pll_cfg;
  wire  [31:0]  pll_state;
  wire debug_mode_sel_latch;
  wire soc_sft_rst;
  wire global_soft_reset_req;

//============================================add========================================//
//corePLL corePLL ( 
//    .locked(corePLL_locked),  // donnot need judge avoid pll fail
//    .use_which_clk(use_which_clk),
//    .pll_cfg(pll_cfg),
//    .pll_state(pll_state),
//    .reset_n(~auto_out_alway_on_reset),
//    .clk_out_main(corePLL_clk_out_main),
//    .clk_out_cpu(corePLL_clk_out_cpu),
//    .clk_out_chiplink(corePLL_clk_out_chiplink),
//    .clk_in1(in_ref_always_on_clk)
//  );
assign pll_state=1;

assign corePLL_clk_out_main = in_ref_always_on_clk;
//assign corePLL_clk_out_cpu = in_ref_always_on_clk;
assign corePLL_clk_out_chiplink = in_ref_always_on_clk;

  assign tile_clock = corePLL_clk_out_cpu;
  assign tile_1_clock = corePLL_clk_out_cpu;
  assign tile_2_clock = corePLL_clk_out_cpu;
  assign tile_3_clock = corePLL_clk_out_cpu;


  // ClockGroup coreGroup ( 
  //   .auto_in_member_0_clock(coreGroup_auto_in_member_0_clock),
  //   .auto_in_member_0_reset(coreGroup_auto_in_member_0_reset),
  //   .auto_out_clock(coreGroup_auto_out_clock),
  //   .auto_out_reset(coreGroup_auto_out_reset)
  // );

  wire         tile_reset;
  wire         tile_0_reset;
  wire         tile_1_reset;
  wire         tile_2_reset;
  wire         tile_3_reset;

  assign tile_reset    = tile_all_reset;
  assign tile_0_reset  = tile_all_reset;
  assign tile_1_reset  = tile_all_reset;
  assign tile_2_reset  = tile_all_reset;
  assign tile_3_reset  = tile_all_reset;

  ResetGenWrangler_FSM wrangler (
    .debug_mode_sel_pad_glitch_free(debug_mode_sel_pad_glitch_free),
    .auto_in_chiplink_clock(corePLL_clk_out_chiplink),
    .soft_reset_req(global_soft_reset_req),   // fix reset release
    .auto_in_tile_clock(corePLL_clk_out_cpu),
    .jtag_ndreset(topMod_debug_ndreset),
    .auto_in_main_clock(corePLL_clk_out_main),
    .pwr_hard_reset(in_hard_pwr_reset),
    .in_ref_always_on_clk(in_ref_always_on_clk),

    //.auto_out_0_clock(wrangler_auto_out_0_clock),
    .auto_out_main_reset(wrangler_auto_out_0_reset),
    .auto_out_chiplink_reset(chiplink_reset),
    .auto_out_alway_on_reset(auto_out_alway_on_reset),
    .auto_out_tile_reset(tile_all_reset),
    .debug_mode_sel_latch(debug_mode_sel_latch)
  );
  
  DevKitDesign topMod ( 
    .debug_mode_sel_latch_async(debug_mode_sel_latch),
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
    .ddr_io_c2b_clk(ddr_io_c2b_clk)
    ,.ddr_io_c2b_rst(ddr_io_c2b_rst)
    ,.ddr_io_c2b_send(ddr_io_c2b_send)
    ,.ddr_io_c2b_data(ddr_io_c2b_data)
    ,.ddr_io_b2c_clk(ddr_io_b2c_clk)
    ,.ddr_io_b2c_rst(ddr_io_b2c_rst)
    ,.ddr_io_b2c_send(ddr_io_b2c_send)
    ,.ddr_io_b2c_data(ddr_io_b2c_data),
    .clock(topMod_clock),
    .reset(topMod_reset),

    .soc_sft_rst(soc_sft_rst),
    .global_soft_reset_req(global_soft_reset_req),
    
    .chiplink_clock(corePLL_clk_out_chiplink),
    .chiplink_reset(chiplink_reset),

    .always_on_reset(auto_out_alway_on_reset),
    
    .spi_master_clk(spi_master_clk),
    .spi_master_csn(spi_master_csn),
    .spi_master_mode(spi_master_mode),
    .spi_master_sdi(spi_master_sdi),
    .spi_master_sdo(spi_master_sdo),
    .spi_master_sdo_oen(spi_master_sdo_oen),

    .tile_clock(tile_clock),
    .tile_reset(tile_reset),
    .tile_1_clock(tile_1_clock),
    .tile_1_reset(tile_1_reset),
    .tile_2_clock(tile_2_clock),
    .tile_2_reset(tile_2_reset),
    .tile_3_clock(tile_3_clock),
    .tile_3_reset(tile_3_reset),

    .use_which_clk(use_which_clk),
    .pll_cfg(pll_cfg),
    .pll_state(pll_state),

    .auto_led_source_out(topMod_auto_led_source_out),
    .auto_io_out_1_port_REFCLK_rxp(1'b1),
    .auto_io_out_1_port_REFCLK_rxn(1'b1),
    .auto_io_out_1_port_pci_exp_txp(topMod_auto_io_out_1_port_pci_exp_txp),
    .auto_io_out_1_port_pci_exp_txn(topMod_auto_io_out_1_port_pci_exp_txn),
    .auto_io_out_1_port_pci_exp_rxp(1'b1),
    .auto_io_out_1_port_pci_exp_rxn(1'b1),
    .auto_io_out_1_port_axi_aresetn(topMod_auto_io_out_1_port_axi_aresetn),
    .auto_io_out_1_port_axi_aclk_out(),
    .auto_io_out_1_port_mmcm_lock(),
    .auto_io_out_0_port_ddr3_addr(),
    .auto_io_out_0_port_ddr3_ba(),
    .auto_io_out_0_port_ddr3_ras_n(),
    .auto_io_out_0_port_ddr3_cas_n(),
    .auto_io_out_0_port_ddr3_we_n(),
    .auto_io_out_0_port_ddr3_reset_n(),
    .auto_io_out_0_port_ddr3_ck_p(),
    .auto_io_out_0_port_ddr3_ck_n(),
    .auto_io_out_0_port_ddr3_cke(),
    .auto_io_out_0_port_ddr3_cs_n(),
    .auto_io_out_0_port_ddr3_dm(),
    .auto_io_out_0_port_ddr3_odt(topMod_auto_io_out_0_port_ddr3_odt),
    // .auto_io_out_0_port_ddr3_dq(auto_topMod_io_out_0_port_ddr3_dq),
    // .auto_io_out_0_port_ddr3_dqs_n(auto_topMod_io_out_0_port_ddr3_dqs_n),
    // .auto_io_out_0_port_ddr3_dqs_p(auto_topMod_io_out_0_port_ddr3_dqs_p),
    .auto_io_out_0_port_sys_clk_i(topMod_auto_io_out_0_port_sys_clk_i),
    .auto_io_out_0_port_ui_clk(topMod_auto_io_out_0_port_ui_clk),
    .auto_io_out_0_port_ui_clk_sync_rst(),
    .auto_io_out_0_port_mmcm_locked(topMod_auto_io_out_0_port_mmcm_locked),
    .auto_io_out_0_port_aresetn(wrangler_auto_out_0_reset),
    .auto_io_out_0_port_sys_rst(wrangler_auto_out_0_reset),
    .auto_spi_source_out_sck(topMod_auto_spi_source_out_sck),
    .auto_spi_source_out_dq_0_o(topMod_auto_spi_source_out_dq_0_o),
    .auto_spi_source_out_dq_1_i(topMod_auto_spi_source_out_dq_1_i),
    .auto_spi_source_out_cs_0(topMod_auto_spi_source_out_cs_0),
    .auto_uart_source_out_txd(topMod_auto_uart_source_out_txd),
    .auto_uart_source_out_rxd(topMod_auto_uart_source_out_rxd),
    .debug_systemjtag_jtag_TCK(topMod_debug_systemjtag_jtag_TCK),
    .debug_systemjtag_jtag_TMS(topMod_debug_systemjtag_jtag_TMS),
    .debug_systemjtag_jtag_TDI(topMod_debug_systemjtag_jtag_TDI),
    .debug_systemjtag_jtag_TDO_data(topMod_debug_systemjtag_jtag_TDO_data),
    .debug_systemjtag_reset(topMod_debug_systemjtag_reset),
    .debug_ndreset(topMod_debug_ndreset)
  );
  assign core_reset = wrangler_auto_out_0_reset; 
  //assign auto_topMod_led_source_out = topMod_auto_led_source_out; 
  // assign auto_topMod_io_out_1_port_pci_exp_txp = topMod_auto_io_out_1_port_pci_exp_txp; 
  // assign auto_topMod_io_out_1_port_pci_exp_txn = topMod_auto_io_out_1_port_pci_exp_txn; 
  // assign auto_topMod_io_out_1_port_axi_aclk_out = topMod_auto_io_out_1_port_axi_aclk_out; 
  // assign auto_topMod_io_out_1_port_mmcm_lock = topMod_auto_io_out_1_port_mmcm_lock; 
  // assign auto_topMod_io_out_0_port_ddr3_addr = topMod_auto_io_out_0_port_ddr3_addr; 
  // assign auto_topMod_io_out_0_port_ddr3_ba = topMod_auto_io_out_0_port_ddr3_ba; 
  // assign auto_topMod_io_out_0_port_ddr3_ras_n = topMod_auto_io_out_0_port_ddr3_ras_n; 
  // assign auto_topMod_io_out_0_port_ddr3_cas_n = topMod_auto_io_out_0_port_ddr3_cas_n; 
  // assign auto_topMod_io_out_0_port_ddr3_we_n = topMod_auto_io_out_0_port_ddr3_we_n; 
  // assign auto_topMod_io_out_0_port_ddr3_reset_n = topMod_auto_io_out_0_port_ddr3_reset_n; 
  // assign auto_topMod_io_out_0_port_ddr3_ck_p = topMod_auto_io_out_0_port_ddr3_ck_p; 
  // assign auto_topMod_io_out_0_port_ddr3_ck_n = topMod_auto_io_out_0_port_ddr3_ck_n; 
  // assign auto_topMod_io_out_0_port_ddr3_cke = topMod_auto_io_out_0_port_ddr3_cke; 
  // assign auto_topMod_io_out_0_port_ddr3_cs_n = topMod_auto_io_out_0_port_ddr3_cs_n; 
  // assign auto_topMod_io_out_0_port_ddr3_dm = topMod_auto_io_out_0_port_ddr3_dm; 
  // assign auto_topMod_io_out_0_port_ddr3_odt = topMod_auto_io_out_0_port_ddr3_odt; 
  //assign auto_topMod_io_out_0_port_ui_clk = topMod_auto_io_out_0_port_ui_clk; 
  ///assign auto_topMod_io_out_0_port_ui_clk_sync_rst = topMod_auto_io_out_0_port_ui_clk_sync_rst; 
  //assign auto_topMod_io_out_0_port_mmcm_locked = topMod_auto_io_out_0_port_mmcm_locked; 
  assign auto_topMod_spi_source_out_sck = topMod_auto_spi_source_out_sck; 
  assign auto_topMod_spi_source_out_dq_0_o = topMod_auto_spi_source_out_dq_0_o; 
  assign auto_topMod_spi_source_out_cs_0 = topMod_auto_spi_source_out_cs_0; 
  assign auto_topMod_uart_source_out_txd = topMod_auto_uart_source_out_txd; 
  // assign auto_wrangler_out_1_reset = wrangler_auto_out_2_reset; 
  // assign auto_wrangler_out_0_reset = wrangler_auto_out_1_reset; 
  assign auto_jtag_debug_source_out_jtag_TDO = topMod_debug_systemjtag_jtag_TDO_data; 
  // assign coreGroup_auto_in_member_0_clock = auto_coreGroup_in_member_0_clock; 
  // assign coreGroup_auto_in_member_0_reset = auto_coreGroup_in_member_0_reset; 
  // assign wrangler_auto_in_2_clock = auto_wrangler_in_1_clock; 
  // assign wrangler_auto_in_2_reset = auto_wrangler_in_1_reset; 
  // assign wrangler_auto_in_1_clock = auto_wrangler_in_0_clock; 
  // assign wrangler_auto_in_1_reset = auto_wrangler_in_0_reset; 
  // assign wrangler_auto_in_0_clock = coreGroup_auto_out_clock; 
  // assign wrangler_auto_in_0_reset = coreGroup_auto_out_reset; 
  assign topMod_clock = corePLL_clk_out_main; 
  assign topMod_reset = core_reset; 

//  assign topMod_auto_io_out_1_port_REFCLK_rxp = auto_topMod_io_out_1_port_REFCLK_rxp; 
//  assign topMod_auto_io_out_1_port_REFCLK_rxn = auto_topMod_io_out_1_port_REFCLK_rxn; 
//  assign topMod_auto_io_out_1_port_pci_exp_rxp = auto_topMod_io_out_1_port_pci_exp_rxp; 
//  assign topMod_auto_io_out_1_port_pci_exp_rxn = auto_topMod_io_out_1_port_pci_exp_rxn; 
  assign topMod_auto_io_out_1_port_axi_aresetn = auto_topMod_io_out_1_port_axi_aresetn; 
  assign topMod_auto_io_out_0_port_sys_clk_i = corePLL_clk_out_main; 
  //assign topMod_auto_io_out_0_port_aresetn = auto_topMod_io_out_0_port_aresetn; 
  assign topMod_auto_io_out_0_port_sys_rst = auto_topMod_io_out_0_port_sys_rst; 
  assign topMod_auto_spi_source_out_dq_1_i = auto_topMod_spi_source_out_dq_1_i; 
  assign topMod_auto_uart_source_out_rxd = auto_topMod_uart_source_out_rxd; 
  assign topMod_debug_systemjtag_jtag_TCK = auto_jtag_debug_source_out_jtag_TCK; 
  assign topMod_debug_systemjtag_jtag_TMS = auto_jtag_debug_source_out_jtag_TMS; 
  assign topMod_debug_systemjtag_jtag_TDI = auto_jtag_debug_source_out_jtag_TDI; 
  assign topMod_debug_systemjtag_reset = wrangler_auto_out_0_reset; 


  // assign _T_152 = corePLL_locked == 1'h0; 
  //assign _T_97_port_mmcm_locked = topDesign_auto_topMod_io_out_0_port_mmcm_locked; 
  //assign _T_230 = _T_97_port_mmcm_locked == 1'h0; 
  //assign _T_97_port_ui_clk_sync_rst = topDesign_auto_topMod_io_out_0_port_ui_clk_sync_rst; 
  //assign _T_4_clock = sys_clock_ibufds_O; 
  //assign _T_4_clock = corePLL_clk_out_main;  // for ddr mig module sys clk
  //assign _T_120_reset = topDesign_auto_wrangler_out_0_reset; 
  //assign _T_133_port_mmcm_lock = topDesign_auto_topMod_io_out_1_port_mmcm_lock; 
  //assign _T_148_reset = topDesign_auto_wrangler_out_1_reset; 
  //assign uart_rtsn = 1'h0; 
  // assign ddr_ddr3_addr = topDesign_auto_topMod_io_out_0_port_ddr3_addr; 
  // assign ddr_ddr3_ba = topDesign_auto_topMod_io_out_0_port_ddr3_ba; 
  // assign ddr_ddr3_ras_n = topDesign_auto_topMod_io_out_0_port_ddr3_ras_n; 
  // assign ddr_ddr3_cas_n = topDesign_auto_topMod_io_out_0_port_ddr3_cas_n; 
  // assign ddr_ddr3_we_n = topDesign_auto_topMod_io_out_0_port_ddr3_we_n; 
  // assign ddr_ddr3_reset_n = topDesign_auto_topMod_io_out_0_port_ddr3_reset_n; 
  // assign ddr_ddr3_ck_p = topDesign_auto_topMod_io_out_0_port_ddr3_ck_p; 
  // assign ddr_ddr3_ck_n = topDesign_auto_topMod_io_out_0_port_ddr3_ck_n; 
  // assign ddr_ddr3_cke = topDesign_auto_topMod_io_out_0_port_ddr3_cke; 
  // assign ddr_ddr3_cs_n = topDesign_auto_topMod_io_out_0_port_ddr3_cs_n; 
  // assign ddr_ddr3_dm = topDesign_auto_topMod_io_out_0_port_ddr3_dm; 
  // // assign ddr_ddr3_odt = topDesign_auto_topMod_io_out_0_port_ddr3_odt; 
  // assign pcie_pci_exp_txp = topDesign_auto_topMod_io_out_1_port_pci_exp_txp; 
  // assign pcie_pci_exp_txn = topDesign_auto_topMod_io_out_1_port_pci_exp_txn; 
  //assign topDesign_auto_topMod_io_out_1_port_axi_aresetn = _T_148_reset == 1'h0; 
  //assign topDesign_auto_topMod_io_out_0_port_sys_clk_i = $unsigned(_T_4_clock); 
  // assign topDesign_auto_topMod_io_out_0_port_aresetn = _T_120_reset == 1'h0; 
  //assign topDesign_auto_topMod_io_out_0_port_sys_rst = reset_ibuf_O | power_on_reset; 
  //assign topDesign_auto_wrangler_in_1_clock = topDesign_auto_topMod_io_out_1_port_axi_aclk_out; 
  // assign topDesign_auto_wrangler_in_1_reset = _T_133_port_mmcm_lock == 1'h0; 
  //assign topDesign_auto_wrangler_in_0_clock = topDesign_auto_topMod_io_out_0_port_ui_clk; 
  // assign topDesign_auto_wrangler_in_0_reset = _T_230 | _T_97_port_ui_clk_sync_rst; 
  // assign topDesign_auto_wrangler_in_0_reset = in_hard_pwr_reset;  // direct from pwr reset | hard reset
  // assign topDesign_auto_coreGroup_in_member_0_clock = corePLL_clk_out_main; 
  // assign topDesign_auto_coreGroup_in_member_0_reset = _T_152 | _T_254;
  // assign topDesign_auto_coreGroup_in_member_0_reset = in_hard_pwr_reset;  // only from hard_pwr_reset
  //assign corePLL_reset = reset_ibuf_O | power_on_reset; 

  assign auto_topMod_io_out_1_port_axi_aresetn = ~topMod_reset; // add other reset for tile reset and chiplink reset 



endmodule
