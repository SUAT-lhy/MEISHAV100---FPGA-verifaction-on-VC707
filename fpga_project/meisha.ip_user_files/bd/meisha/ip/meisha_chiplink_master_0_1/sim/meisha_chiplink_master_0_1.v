// (c) Copyright 1995-2024 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: user.org:module_ref:chiplink_master:1.0
// IP Revision: 1

`timescale 1ns/1ps

(* DowngradeIPIdentifiedWarnings = "yes" *)
module meisha_chiplink_master_0_1 (
  clk,
  resetn,
  chiplink_tx_clk,
  chiplink_tx_rst,
  chiplink_tx_send,
  chiplink_tx_data,
  chiplink_rx_clk,
  chiplink_rx_rst,
  chiplink_rx_send,
  chiplink_rx_data,
  io_axi4_0_awready,
  io_axi4_0_awvalid,
  io_axi4_0_awid,
  io_axi4_0_awaddr,
  io_axi4_0_awlen,
  io_axi4_0_awsize,
  io_axi4_0_awburst,
  io_axi4_0_wready,
  io_axi4_0_wvalid,
  io_axi4_0_wdata,
  io_axi4_0_wstrb,
  io_axi4_0_wlast,
  io_axi4_0_bready,
  io_axi4_0_bvalid,
  io_axi4_0_bid,
  io_axi4_0_bresp,
  io_axi4_0_arready,
  io_axi4_0_arvalid,
  io_axi4_0_arid,
  io_axi4_0_araddr,
  io_axi4_0_arlen,
  io_axi4_0_arsize,
  io_axi4_0_arburst,
  io_axi4_0_rready,
  io_axi4_0_rvalid,
  io_axi4_0_rid,
  io_axi4_0_rdata,
  io_axi4_0_rresp,
  io_axi4_0_rlast
);

(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
input wire clk;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 resetn RST" *)
input wire resetn;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 chiplink_tx_clk CLK" *)
output wire chiplink_tx_clk;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 chiplink_tx_rst RST" *)
output wire chiplink_tx_rst;
output wire chiplink_tx_send;
output wire [7 : 0] chiplink_tx_data;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 chiplink_rx_clk CLK" *)
input wire chiplink_rx_clk;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 chiplink_rx_rst RST" *)
input wire chiplink_rx_rst;
input wire chiplink_rx_send;
input wire [7 : 0] chiplink_rx_data;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 io_axi4_0 AWREADY" *)
input wire io_axi4_0_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 io_axi4_0 AWVALID" *)
output wire io_axi4_0_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 io_axi4_0 AWID" *)
output wire [3 : 0] io_axi4_0_awid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 io_axi4_0 AWADDR" *)
output wire [31 : 0] io_axi4_0_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 io_axi4_0 AWLEN" *)
output wire [7 : 0] io_axi4_0_awlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 io_axi4_0 AWSIZE" *)
output wire [2 : 0] io_axi4_0_awsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 io_axi4_0 AWBURST" *)
output wire [1 : 0] io_axi4_0_awburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 io_axi4_0 WREADY" *)
input wire io_axi4_0_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 io_axi4_0 WVALID" *)
output wire io_axi4_0_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 io_axi4_0 WDATA" *)
output wire [63 : 0] io_axi4_0_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 io_axi4_0 WSTRB" *)
output wire [7 : 0] io_axi4_0_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 io_axi4_0 WLAST" *)
output wire io_axi4_0_wlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 io_axi4_0 BREADY" *)
output wire io_axi4_0_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 io_axi4_0 BVALID" *)
input wire io_axi4_0_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 io_axi4_0 BID" *)
input wire [3 : 0] io_axi4_0_bid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 io_axi4_0 BRESP" *)
input wire [1 : 0] io_axi4_0_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 io_axi4_0 ARREADY" *)
input wire io_axi4_0_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 io_axi4_0 ARVALID" *)
output wire io_axi4_0_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 io_axi4_0 ARID" *)
output wire [3 : 0] io_axi4_0_arid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 io_axi4_0 ARADDR" *)
output wire [31 : 0] io_axi4_0_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 io_axi4_0 ARLEN" *)
output wire [7 : 0] io_axi4_0_arlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 io_axi4_0 ARSIZE" *)
output wire [2 : 0] io_axi4_0_arsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 io_axi4_0 ARBURST" *)
output wire [1 : 0] io_axi4_0_arburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 io_axi4_0 RREADY" *)
output wire io_axi4_0_rready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 io_axi4_0 RVALID" *)
input wire io_axi4_0_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 io_axi4_0 RID" *)
input wire [3 : 0] io_axi4_0_rid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 io_axi4_0 RDATA" *)
input wire [63 : 0] io_axi4_0_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 io_axi4_0 RRESP" *)
input wire [1 : 0] io_axi4_0_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 io_axi4_0 RLAST" *)
input wire io_axi4_0_rlast;

  chiplink_master inst (
    .clk(clk),
    .resetn(resetn),
    .chiplink_tx_clk(chiplink_tx_clk),
    .chiplink_tx_rst(chiplink_tx_rst),
    .chiplink_tx_send(chiplink_tx_send),
    .chiplink_tx_data(chiplink_tx_data),
    .chiplink_rx_clk(chiplink_rx_clk),
    .chiplink_rx_rst(chiplink_rx_rst),
    .chiplink_rx_send(chiplink_rx_send),
    .chiplink_rx_data(chiplink_rx_data),
    .io_axi4_0_awready(io_axi4_0_awready),
    .io_axi4_0_awvalid(io_axi4_0_awvalid),
    .io_axi4_0_awid(io_axi4_0_awid),
    .io_axi4_0_awaddr(io_axi4_0_awaddr),
    .io_axi4_0_awlen(io_axi4_0_awlen),
    .io_axi4_0_awsize(io_axi4_0_awsize),
    .io_axi4_0_awburst(io_axi4_0_awburst),
    .io_axi4_0_wready(io_axi4_0_wready),
    .io_axi4_0_wvalid(io_axi4_0_wvalid),
    .io_axi4_0_wdata(io_axi4_0_wdata),
    .io_axi4_0_wstrb(io_axi4_0_wstrb),
    .io_axi4_0_wlast(io_axi4_0_wlast),
    .io_axi4_0_bready(io_axi4_0_bready),
    .io_axi4_0_bvalid(io_axi4_0_bvalid),
    .io_axi4_0_bid(io_axi4_0_bid),
    .io_axi4_0_bresp(io_axi4_0_bresp),
    .io_axi4_0_arready(io_axi4_0_arready),
    .io_axi4_0_arvalid(io_axi4_0_arvalid),
    .io_axi4_0_arid(io_axi4_0_arid),
    .io_axi4_0_araddr(io_axi4_0_araddr),
    .io_axi4_0_arlen(io_axi4_0_arlen),
    .io_axi4_0_arsize(io_axi4_0_arsize),
    .io_axi4_0_arburst(io_axi4_0_arburst),
    .io_axi4_0_rready(io_axi4_0_rready),
    .io_axi4_0_rvalid(io_axi4_0_rvalid),
    .io_axi4_0_rid(io_axi4_0_rid),
    .io_axi4_0_rdata(io_axi4_0_rdata),
    .io_axi4_0_rresp(io_axi4_0_rresp),
    .io_axi4_0_rlast(io_axi4_0_rlast)
  );
endmodule
