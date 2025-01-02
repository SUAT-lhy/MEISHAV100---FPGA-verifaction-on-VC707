// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (lin64) Build 1756540 Mon Jan 23 19:11:19 MST 2017
// Date        : Thu Dec  5 16:47:55 2024
// Host        : meisha running 64-bit CentOS Linux release 7.9.2009 (Core)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ meisha_chiplink_master_0_1_stub.v
// Design      : meisha_chiplink_master_0_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx485tffg1761-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "chiplink_master,Vivado 2016.4" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(clk, resetn, chiplink_tx_clk, chiplink_tx_rst, 
  chiplink_tx_send, chiplink_tx_data, chiplink_rx_clk, chiplink_rx_rst, chiplink_rx_send, 
  chiplink_rx_data, io_axi4_0_awready, io_axi4_0_awvalid, io_axi4_0_awid, io_axi4_0_awaddr, 
  io_axi4_0_awlen, io_axi4_0_awsize, io_axi4_0_awburst, io_axi4_0_wready, io_axi4_0_wvalid, 
  io_axi4_0_wdata, io_axi4_0_wstrb, io_axi4_0_wlast, io_axi4_0_bready, io_axi4_0_bvalid, 
  io_axi4_0_bid, io_axi4_0_bresp, io_axi4_0_arready, io_axi4_0_arvalid, io_axi4_0_arid, 
  io_axi4_0_araddr, io_axi4_0_arlen, io_axi4_0_arsize, io_axi4_0_arburst, io_axi4_0_rready, 
  io_axi4_0_rvalid, io_axi4_0_rid, io_axi4_0_rdata, io_axi4_0_rresp, io_axi4_0_rlast)
/* synthesis syn_black_box black_box_pad_pin="clk,resetn,chiplink_tx_clk,chiplink_tx_rst,chiplink_tx_send,chiplink_tx_data[7:0],chiplink_rx_clk,chiplink_rx_rst,chiplink_rx_send,chiplink_rx_data[7:0],io_axi4_0_awready,io_axi4_0_awvalid,io_axi4_0_awid[3:0],io_axi4_0_awaddr[31:0],io_axi4_0_awlen[7:0],io_axi4_0_awsize[2:0],io_axi4_0_awburst[1:0],io_axi4_0_wready,io_axi4_0_wvalid,io_axi4_0_wdata[63:0],io_axi4_0_wstrb[7:0],io_axi4_0_wlast,io_axi4_0_bready,io_axi4_0_bvalid,io_axi4_0_bid[3:0],io_axi4_0_bresp[1:0],io_axi4_0_arready,io_axi4_0_arvalid,io_axi4_0_arid[3:0],io_axi4_0_araddr[31:0],io_axi4_0_arlen[7:0],io_axi4_0_arsize[2:0],io_axi4_0_arburst[1:0],io_axi4_0_rready,io_axi4_0_rvalid,io_axi4_0_rid[3:0],io_axi4_0_rdata[63:0],io_axi4_0_rresp[1:0],io_axi4_0_rlast" */;
  input clk;
  input resetn;
  output chiplink_tx_clk;
  output chiplink_tx_rst;
  output chiplink_tx_send;
  output [7:0]chiplink_tx_data;
  input chiplink_rx_clk;
  input chiplink_rx_rst;
  input chiplink_rx_send;
  input [7:0]chiplink_rx_data;
  input io_axi4_0_awready;
  output io_axi4_0_awvalid;
  output [3:0]io_axi4_0_awid;
  output [31:0]io_axi4_0_awaddr;
  output [7:0]io_axi4_0_awlen;
  output [2:0]io_axi4_0_awsize;
  output [1:0]io_axi4_0_awburst;
  input io_axi4_0_wready;
  output io_axi4_0_wvalid;
  output [63:0]io_axi4_0_wdata;
  output [7:0]io_axi4_0_wstrb;
  output io_axi4_0_wlast;
  output io_axi4_0_bready;
  input io_axi4_0_bvalid;
  input [3:0]io_axi4_0_bid;
  input [1:0]io_axi4_0_bresp;
  input io_axi4_0_arready;
  output io_axi4_0_arvalid;
  output [3:0]io_axi4_0_arid;
  output [31:0]io_axi4_0_araddr;
  output [7:0]io_axi4_0_arlen;
  output [2:0]io_axi4_0_arsize;
  output [1:0]io_axi4_0_arburst;
  output io_axi4_0_rready;
  input io_axi4_0_rvalid;
  input [3:0]io_axi4_0_rid;
  input [63:0]io_axi4_0_rdata;
  input [1:0]io_axi4_0_rresp;
  input io_axi4_0_rlast;
endmodule
