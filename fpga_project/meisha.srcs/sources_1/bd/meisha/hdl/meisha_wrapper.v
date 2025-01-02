//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.4 (lin64) Build 1756540 Mon Jan 23 19:11:19 MST 2017
//Date        : Thu Dec  5 16:46:29 2024
//Host        : meisha running 64-bit CentOS Linux release 7.9.2009 (Core)
//Command     : generate_target meisha_wrapper.bd
//Design      : meisha_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module meisha_wrapper
   (DDR3_addr,
    DDR3_ba,
    DDR3_cas_n,
    DDR3_ck_n,
    DDR3_ck_p,
    DDR3_cke,
    DDR3_cs_n,
    DDR3_dm,
    DDR3_dq,
    DDR3_dqs_n,
    DDR3_dqs_p,
    DDR3_odt,
    DDR3_ras_n,
    DDR3_reset_n,
    DDR3_we_n,
    init_calib_complete,
    jtag_jtag_TCK,
    jtag_jtag_TDI,
    jtag_jtag_TDO,
    jtag_jtag_TMS,
    key,
    reset,
    sdio_sdio_clk,
    sdio_sdio_cmd,
    sdio_sdio_dat_0,
    sdio_sdio_dat_1,
    sdio_sdio_dat_2,
    sdio_sdio_dat_3,
    sys_clk_n,
    sys_clk_p,
    uart_ctsn,
    uart_rtsn,
    uart_rxd,
    uart_txd);
  output [13:0]DDR3_addr;
  output [2:0]DDR3_ba;
  output DDR3_cas_n;
  output [0:0]DDR3_ck_n;
  output [0:0]DDR3_ck_p;
  output [0:0]DDR3_cke;
  output [0:0]DDR3_cs_n;
  output [7:0]DDR3_dm;
  inout [63:0]DDR3_dq;
  inout [7:0]DDR3_dqs_n;
  inout [7:0]DDR3_dqs_p;
  output [0:0]DDR3_odt;
  output DDR3_ras_n;
  output DDR3_reset_n;
  output DDR3_we_n;
  output init_calib_complete;
  input jtag_jtag_TCK;
  input jtag_jtag_TDI;
  output jtag_jtag_TDO;
  input jtag_jtag_TMS;
  input key;
  input reset;
  output sdio_sdio_clk;
  output sdio_sdio_cmd;
  input sdio_sdio_dat_0;
  inout sdio_sdio_dat_1;
  inout sdio_sdio_dat_2;
  output sdio_sdio_dat_3;
  input [0:0]sys_clk_n;
  input [0:0]sys_clk_p;
  input uart_ctsn;
  output uart_rtsn;
  input uart_rxd;
  output uart_txd;

  wire [13:0]DDR3_addr;
  wire [2:0]DDR3_ba;
  wire DDR3_cas_n;
  wire [0:0]DDR3_ck_n;
  wire [0:0]DDR3_ck_p;
  wire [0:0]DDR3_cke;
  wire [0:0]DDR3_cs_n;
  wire [7:0]DDR3_dm;
  wire [63:0]DDR3_dq;
  wire [7:0]DDR3_dqs_n;
  wire [7:0]DDR3_dqs_p;
  wire [0:0]DDR3_odt;
  wire DDR3_ras_n;
  wire DDR3_reset_n;
  wire DDR3_we_n;
  wire init_calib_complete;
  wire jtag_jtag_TCK;
  wire jtag_jtag_TDI;
  wire jtag_jtag_TDO;
  wire jtag_jtag_TMS;
  wire key;
  wire reset;
  wire sdio_sdio_clk;
  wire sdio_sdio_cmd;
  wire sdio_sdio_dat_0;
  wire sdio_sdio_dat_1;
  wire sdio_sdio_dat_2;
  wire sdio_sdio_dat_3;
  wire [0:0]sys_clk_n;
  wire [0:0]sys_clk_p;
  wire uart_ctsn;
  wire uart_rtsn;
  wire uart_rxd;
  wire uart_txd;

  meisha meisha_i
       (.DDR3_addr(DDR3_addr),
        .DDR3_ba(DDR3_ba),
        .DDR3_cas_n(DDR3_cas_n),
        .DDR3_ck_n(DDR3_ck_n),
        .DDR3_ck_p(DDR3_ck_p),
        .DDR3_cke(DDR3_cke),
        .DDR3_cs_n(DDR3_cs_n),
        .DDR3_dm(DDR3_dm),
        .DDR3_dq(DDR3_dq),
        .DDR3_dqs_n(DDR3_dqs_n),
        .DDR3_dqs_p(DDR3_dqs_p),
        .DDR3_odt(DDR3_odt),
        .DDR3_ras_n(DDR3_ras_n),
        .DDR3_reset_n(DDR3_reset_n),
        .DDR3_we_n(DDR3_we_n),
        .init_calib_complete(init_calib_complete),
        .jtag_jtag_TCK(jtag_jtag_TCK),
        .jtag_jtag_TDI(jtag_jtag_TDI),
        .jtag_jtag_TDO(jtag_jtag_TDO),
        .jtag_jtag_TMS(jtag_jtag_TMS),
        .key(key),
        .reset(reset),
        .sdio_sdio_clk(sdio_sdio_clk),
        .sdio_sdio_cmd(sdio_sdio_cmd),
        .sdio_sdio_dat_0(sdio_sdio_dat_0),
        .sdio_sdio_dat_1(sdio_sdio_dat_1),
        .sdio_sdio_dat_2(sdio_sdio_dat_2),
        .sdio_sdio_dat_3(sdio_sdio_dat_3),
        .sys_clk_n(sys_clk_n),
        .sys_clk_p(sys_clk_p),
        .uart_ctsn(uart_ctsn),
        .uart_rtsn(uart_rtsn),
        .uart_rxd(uart_rxd),
        .uart_txd(uart_txd));
endmodule
