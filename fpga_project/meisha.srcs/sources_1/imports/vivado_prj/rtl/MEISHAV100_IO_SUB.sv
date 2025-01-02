`define CHIPLINK_CONNECT_DIRECT_TL
module MEISHAV100_TOP (
    input PWR_RESET,
    input HARD_RESET,
    inout AUTO_SPI_SOURCE_OUT_DQ_1_I,
    inout AUTO_UART_SOURCE_OUT_RXD, 
    inout DEBUG_SYSTEMJTAG_JTAG_TCK,
    inout DEBUG_SYSTEMJTAG_JTAG_TMS, 
    inout DEBUG_SYSTEMJTAG_JTAG_TDI,
    inout AUTO_SPI_SOURCE_OUT_SCK, 
    inout AUTO_SPI_SOURCE_OUT_DQ_0_O, 
    inout AUTO_SPI_SOURCE_OUT_CS_0, 
    inout AUTO_UART_SOURCE_OUT_TXD,
    inout DEBUG_SYSTEMJTAG_JTAG_TDO,
    input  DEBUG_MODE_SEL,
    //=============================================add=============================================//
    inout SPI_SDO0,
    inout SPI_SDO1,
    inout SPI_SDO2,
    inout SPI_SDO3,
    inout SPI_SDI0,
    inout SPI_SDI1,
    inout SPI_SDI2,
    inout SPI_SDI3,
    inout SPI_CS,
    inout SPI_SCLK,
    inout SPI_MASTER_CLK,
    inout SPI_MASTER_CSN,
    inout [3:0] SPI_MASTER_SDO,
    inout [3:0] SPI_MASTER_SDI,
    input SYS_CLOCK_P, 
    input SYS_CLOCK_N,
    //=============================================add===============================================//
    inout  DDR_IO_C2B_CLK,   // output
    inout  DDR_IO_C2B_RST,
    inout  DDR_IO_C2B_SEND,
    inout [7:0] DDR_IO_C2B_DATA,
    inout  DDR_IO_B2C_CLK,
    inout  DDR_IO_B2C_RST,
    inout  DDR_IO_B2C_SEND,
    inout [7:0] DDR_IO_B2C_DATA
    );
  //=================================================add==================================================//
  wire    [3:0] spi_sdo_oen;

  wire          spi_master_clk;
  wire    [3:0] spi_master_csn;

  wire    [3:0] spi_master_sdo;
  wire    [3:0] spi_master_sdo_oen;

  wire [7:0] led; 
  wire [7:0] topDesign_auto_topMod_led_source_out; 

  wire  topDesign_auto_topMod_io_out_0_port_ui_clk; 
  wire  topDesign_auto_topMod_io_out_0_port_ui_clk_sync_rst; 
  wire  topDesign_auto_topMod_io_out_0_port_mmcm_locked; 
  wire  topDesign_auto_topMod_io_out_0_port_aresetn; 
  wire  topDesign_auto_topMod_io_out_0_port_sys_rst; 

  wire  sys_clock_ibufds_IB; 
  wire  sys_clock_ibufds_I; 
  wire  sys_clock_ibufds_O; 
  wire  reset_ibuf_I; 
  wire  reset_ibuf_O; 
  wire  power_on_reset; 
  wire  power_on_clock; 
  wire  _T_152; 
  wire  _T_254; 
  wire  _T_97_port_mmcm_locked; 
  wire  _T_230; 
  wire  _T_97_port_ui_clk_sync_rst; 
  wire  _T_4_clock; 
  wire  _T_120_reset; 
  wire  _T_133_port_mmcm_lock; 
  wire  _T_148_reset; 

  wire  in_hard_pwr_reset;

  wire  tile_all_reset;
  wire  chiplink_reset;
  wire  corePLL_clk_out_cpu;
  wire  corePLL_clk_out_chiplink;
  wire  auto_out_alway_on_reset;
  wire  corePLL_locked;
  
  //=================================================add========================================================//
    logic                    [1:0] spi_mode_unused;
    logic                    [1:0] spi_master_mode_unused;

  DevKitWrapper topDesign ( 
    `ifdef USE_C2C_FOR_PCIE
    .io_c2b_clk(),
    .io_c2b_rst(),
    .io_c2b_send(),
    .io_c2b_data(),
    .io_b2c_clk(),
    .io_b2c_rst(),
    .io_b2c_send(),
    .io_b2c_data(),
    `else
    .spi_sclk(SPI_SCLK),
    .spi_cs(SPI_CS),
    .axi_spi_slave_test_mode(DEBUG_MODE_SEL),
    .spi_mode(spi_mode_unused),
    .spi_sdi0(SPI_SDI0),
    .spi_sdi1(SPI_SDI1),
    .spi_sdi2(SPI_SDI2),
    .spi_sdi3(SPI_SDI3),
    .spi_sdo0(SPI_SDO0),
    .spi_sdo1(SPI_SDO1),
    .spi_sdo2(SPI_SDO2),
    .spi_sdo3(SPI_SDO3),
    .spi_sdo_oen(spi_sdo_oen),
    `endif
    .ddr_io_c2b_clk(DDR_IO_C2B_CLK)
    ,.ddr_io_c2b_rst(DDR_IO_C2B_RST)
    ,.ddr_io_c2b_send(DDR_IO_C2B_SEND)
    ,.ddr_io_c2b_data(DDR_IO_C2B_DATA)
    ,.ddr_io_b2c_clk(DDR_IO_B2C_CLK)
    ,.ddr_io_b2c_rst(DDR_IO_B2C_RST)
    ,.ddr_io_b2c_send(DDR_IO_B2C_SEND)
    ,.ddr_io_b2c_data(DDR_IO_B2C_DATA),

    .tile_all_reset(tile_all_reset),
    .chiplink_reset(chiplink_reset),
    .corePLL_clk_out_cpu(corePLL_clk_out_cpu),
    .corePLL_clk_out_chiplink(corePLL_clk_out_chiplink),
    .auto_out_alway_on_reset(auto_out_alway_on_reset),
    .corePLL_locked(corePLL_locked),
    
    .spi_master_clk(spi_master_clk),
    .spi_master_csn(spi_master_csn),
    .spi_master_mode(spi_master_mode_unused),
    .spi_master_sdo(spi_master_sdo),
    .spi_master_sdo_oen(spi_master_sdo_oen),
    .spi_master_sdi(SPI_MASTER_SDI),
    .debug_mode_sel_pad_glitch_free(DEBUG_MODE_SEL),
    .in_ref_always_on_clk(sys_clock_ibufds_O),
    .in_hard_pwr_reset(in_hard_pwr_reset),

    .auto_topMod_led_source_out(topDesign_auto_topMod_led_source_out),
    .auto_topMod_io_out_1_port_REFCLK_rxp(1'b0),
    .auto_topMod_io_out_1_port_REFCLK_rxn(1'b0),
    .auto_topMod_io_out_1_port_pci_exp_txp(),
    .auto_topMod_io_out_1_port_pci_exp_txn(),
    .auto_topMod_io_out_1_port_pci_exp_rxp(1'b0),
    .auto_topMod_io_out_1_port_pci_exp_rxn(1'b0),
    .auto_topMod_io_out_0_port_ddr3_addr(),
    .auto_topMod_io_out_0_port_ddr3_ba(),
    .auto_topMod_io_out_0_port_ddr3_ras_n(),
    .auto_topMod_io_out_0_port_ddr3_cas_n(),
    .auto_topMod_io_out_0_port_ddr3_we_n(),
    .auto_topMod_io_out_0_port_ddr3_reset_n(),
    .auto_topMod_io_out_0_port_ddr3_ck_p(),
    .auto_topMod_io_out_0_port_ddr3_ck_n(),
    .auto_topMod_io_out_0_port_ddr3_cke(),
    .auto_topMod_io_out_0_port_ddr3_cs_n(),
    .auto_topMod_io_out_0_port_ddr3_dm(),
    .auto_topMod_io_out_0_port_ddr3_odt(),
    .auto_topMod_io_out_0_port_ui_clk(topDesign_auto_topMod_io_out_0_port_ui_clk),
    .auto_topMod_io_out_0_port_ui_clk_sync_rst(topDesign_auto_topMod_io_out_0_port_ui_clk_sync_rst),
    .auto_topMod_io_out_0_port_mmcm_locked(topDesign_auto_topMod_io_out_0_port_mmcm_locked),
    .auto_topMod_io_out_0_port_sys_rst(topDesign_auto_topMod_io_out_0_port_sys_rst),
    .auto_topMod_spi_source_out_sck(AUTO_SPI_SOURCE_OUT_SCK),
    .auto_topMod_spi_source_out_dq_0_o(AUTO_SPI_SOURCE_OUT_DQ_0_O),
    .auto_topMod_spi_source_out_dq_1_i(AUTO_SPI_SOURCE_OUT_DQ_1_I),
    .auto_topMod_spi_source_out_cs_0(AUTO_SPI_SOURCE_OUT_CS_0),
    .auto_topMod_uart_source_out_txd(AUTO_UART_SOURCE_OUT_TXD),
    .auto_topMod_uart_source_out_rxd(AUTO_UART_SOURCE_OUT_RXD),
    .auto_jtag_debug_source_out_jtag_TCK(DEBUG_SYSTEMJTAG_JTAG_TCK),
    .auto_jtag_debug_source_out_jtag_TMS(DEBUG_SYSTEMJTAG_JTAG_TMS),
    .auto_jtag_debug_source_out_jtag_TDI(DEBUG_SYSTEMJTAG_JTAG_TDI),
    .auto_jtag_debug_source_out_jtag_TDO(DEBUG_SYSTEMJTAG_JTAG_TDO)
    //=================================add=========================================//
  );
//add
    assign SPI_MASTER_CLK = DEBUG_MODE_SEL ? corePLL_clk_out_cpu: spi_master_clk;
    assign SPI_MASTER_CSN = DEBUG_MODE_SEL ? corePLL_clk_out_chiplink: spi_master_csn[0];
    assign SPI_MASTER_SDO[0] = DEBUG_MODE_SEL ? tile_all_reset: spi_master_sdo[0];
    assign SPI_MASTER_SDO[1] = DEBUG_MODE_SEL ? chiplink_reset: spi_master_sdo[1];
    assign SPI_MASTER_SDO[2] = DEBUG_MODE_SEL ? auto_out_alway_on_reset: spi_master_sdo[2];
    assign SPI_MASTER_SDO[3] = DEBUG_MODE_SEL ? corePLL_locked: spi_master_sdo[3];
  
 // IBUFDS #(.DIFF_TERM("FALSE"), .IOSTANDARD("DEFAULT"), .CAPACITANCE("DONT_CARE"), .IFD_DELAY_VALUE("AUTO"), .IBUF_LOW_PWR("TRUE"), .IBUF_DELAY_VALUE("0")) sys_clock_ibufds ( 
 //   .IB(sys_clock_ibufds_IB),
 //   .I(sys_clock_ibufds_I),
 //   .O(sys_clock_ibufds_O)
 // );

  //reset_glitch_free #(.DELAY_CYCLE(256)) pwr_reset_ibuf( 
  //  .i_reset(PWR_RESET),
  //  .o_reset(power_on_reset)
  //);

  reset_glitch_free #(.DELAY_CYCLE(128))  hard_reset_ibuf ( 
    .i_reset(reset_ibuf_I),
    .o_reset(reset_ibuf_O)
  );

//`ifndef VENDOR_RAM_EN
//  PowerOnResetFPGAOnly fpga_power_on ( 
//    .power_on_reset(PWR_RESET),
//    .clock(power_on_clock)
//  );
//`endif

  assign led = topDesign_auto_topMod_led_source_out; 

  assign in_hard_pwr_reset = reset_ibuf_O | PWR_RESET; 
  assign sys_clock_ibufds_IB = SYS_CLOCK_N; 
  assign sys_clock_ibufds_I = SYS_CLOCK_P; 
  assign reset_ibuf_I = HARD_RESET; 
  assign power_on_clock = sys_clock_ibufds_O; 
endmodule
