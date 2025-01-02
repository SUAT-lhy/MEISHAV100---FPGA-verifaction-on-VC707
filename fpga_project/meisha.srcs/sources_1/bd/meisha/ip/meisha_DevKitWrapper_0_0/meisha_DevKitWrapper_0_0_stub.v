// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (lin64) Build 1756540 Mon Jan 23 19:11:19 MST 2017
// Date        : Thu Dec  5 16:52:23 2024
// Host        : meisha running 64-bit CentOS Linux release 7.9.2009 (Core)
// Command     : write_verilog -force -mode synth_stub
//               /home/test/vivado_prj/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_DevKitWrapper_0_0/meisha_DevKitWrapper_0_0_stub.v
// Design      : meisha_DevKitWrapper_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx485tffg1761-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "DevKitWrapper,Vivado 2016.4" *)
module meisha_DevKitWrapper_0_0(spi_sclk, spi_cs, axi_spi_slave_test_mode, 
  spi_gpio_mux_sel, spi_mode, spi_sdi0, spi_sdi1, spi_sdi2, spi_sdi3, spi_sdo0, spi_sdo1, spi_sdo2, 
  spi_sdo3, spi_sdo_oen, tile_all_reset, chiplink_reset, corePLL_clk_out_cpu, 
  corePLL_clk_out_chiplink, auto_out_alway_on_reset, debug_mode_sel_pad_glitch_free, 
  in_ref_always_on_clk, in_hard_pwr_reset, ddr_io_c2b_clk, ddr_io_c2b_rst, ddr_io_c2b_send, 
  ddr_io_c2b_data, ddr_io_b2c_clk, ddr_io_b2c_rst, ddr_io_b2c_send, ddr_io_b2c_data, 
  spi_master_clk, spi_master_csn, spi_master_mode, spi_master_sdo, spi_master_sdo_oen, 
  spi_master_sdi, auto_topMod_io_out_0_port_sys_rst, auto_topMod_spi_source_out_sck, 
  auto_topMod_spi_source_out_dq_0_o, auto_topMod_spi_source_out_dq_1_i, 
  auto_topMod_spi_source_out_cs_0, auto_topMod_uart_source_out_txd, 
  auto_topMod_uart_source_out_rxd, auto_jtag_debug_source_out_jtag_TCK, 
  auto_jtag_debug_source_out_jtag_TMS, auto_jtag_debug_source_out_jtag_TDI, 
  auto_jtag_debug_source_out_jtag_TDO)
/* synthesis syn_black_box black_box_pad_pin="spi_sclk,spi_cs,axi_spi_slave_test_mode,spi_gpio_mux_sel,spi_mode[1:0],spi_sdi0,spi_sdi1,spi_sdi2,spi_sdi3,spi_sdo0,spi_sdo1,spi_sdo2,spi_sdo3,spi_sdo_oen[3:0],tile_all_reset,chiplink_reset,corePLL_clk_out_cpu,corePLL_clk_out_chiplink,auto_out_alway_on_reset,debug_mode_sel_pad_glitch_free,in_ref_always_on_clk,in_hard_pwr_reset,ddr_io_c2b_clk,ddr_io_c2b_rst,ddr_io_c2b_send,ddr_io_c2b_data[7:0],ddr_io_b2c_clk,ddr_io_b2c_rst,ddr_io_b2c_send,ddr_io_b2c_data[7:0],spi_master_clk,spi_master_csn[3:0],spi_master_mode[1:0],spi_master_sdo[3:0],spi_master_sdo_oen[3:0],spi_master_sdi[3:0],auto_topMod_io_out_0_port_sys_rst,auto_topMod_spi_source_out_sck,auto_topMod_spi_source_out_dq_0_o,auto_topMod_spi_source_out_dq_1_i,auto_topMod_spi_source_out_cs_0,auto_topMod_uart_source_out_txd,auto_topMod_uart_source_out_rxd,auto_jtag_debug_source_out_jtag_TCK,auto_jtag_debug_source_out_jtag_TMS,auto_jtag_debug_source_out_jtag_TDI,auto_jtag_debug_source_out_jtag_TDO" */;
  input spi_sclk;
  input spi_cs;
  input axi_spi_slave_test_mode;
  output spi_gpio_mux_sel;
  output [1:0]spi_mode;
  input spi_sdi0;
  input spi_sdi1;
  input spi_sdi2;
  input spi_sdi3;
  output spi_sdo0;
  output spi_sdo1;
  output spi_sdo2;
  output spi_sdo3;
  output [3:0]spi_sdo_oen;
  output tile_all_reset;
  output chiplink_reset;
  input corePLL_clk_out_cpu;
  output corePLL_clk_out_chiplink;
  output auto_out_alway_on_reset;
  input debug_mode_sel_pad_glitch_free;
  input in_ref_always_on_clk;
  input in_hard_pwr_reset;
  output ddr_io_c2b_clk;
  output ddr_io_c2b_rst;
  output ddr_io_c2b_send;
  output [7:0]ddr_io_c2b_data;
  input ddr_io_b2c_clk;
  input ddr_io_b2c_rst;
  input ddr_io_b2c_send;
  input [7:0]ddr_io_b2c_data;
  output spi_master_clk;
  output [3:0]spi_master_csn;
  output [1:0]spi_master_mode;
  output [3:0]spi_master_sdo;
  output [3:0]spi_master_sdo_oen;
  input [3:0]spi_master_sdi;
  input auto_topMod_io_out_0_port_sys_rst;
  output auto_topMod_spi_source_out_sck;
  output auto_topMod_spi_source_out_dq_0_o;
  input auto_topMod_spi_source_out_dq_1_i;
  output auto_topMod_spi_source_out_cs_0;
  output auto_topMod_uart_source_out_txd;
  input auto_topMod_uart_source_out_rxd;
  input auto_jtag_debug_source_out_jtag_TCK;
  input auto_jtag_debug_source_out_jtag_TMS;
  input auto_jtag_debug_source_out_jtag_TDI;
  output auto_jtag_debug_source_out_jtag_TDO;
endmodule
