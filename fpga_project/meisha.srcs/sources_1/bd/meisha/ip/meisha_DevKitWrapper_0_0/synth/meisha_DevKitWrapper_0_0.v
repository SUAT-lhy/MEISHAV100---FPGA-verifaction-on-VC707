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


// IP VLNV: user.org:module_ref:DevKitWrapper:1.0
// IP Revision: 1

(* X_CORE_INFO = "DevKitWrapper,Vivado 2016.4" *)
(* CHECK_LICENSE_TYPE = "meisha_DevKitWrapper_0_0,DevKitWrapper,{}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module meisha_DevKitWrapper_0_0 (
  spi_sclk,
  spi_cs,
  axi_spi_slave_test_mode,
  spi_gpio_mux_sel,
  spi_mode,
  spi_sdi0,
  spi_sdi1,
  spi_sdi2,
  spi_sdi3,
  spi_sdo0,
  spi_sdo1,
  spi_sdo2,
  spi_sdo3,
  spi_sdo_oen,
  tile_all_reset,
  chiplink_reset,
  corePLL_clk_out_cpu,
  corePLL_clk_out_chiplink,
  auto_out_alway_on_reset,
  debug_mode_sel_pad_glitch_free,
  in_ref_always_on_clk,
  in_hard_pwr_reset,
  ddr_io_c2b_clk,
  ddr_io_c2b_rst,
  ddr_io_c2b_send,
  ddr_io_c2b_data,
  ddr_io_b2c_clk,
  ddr_io_b2c_rst,
  ddr_io_b2c_send,
  ddr_io_b2c_data,
  spi_master_clk,
  spi_master_csn,
  spi_master_mode,
  spi_master_sdo,
  spi_master_sdo_oen,
  spi_master_sdi,
  auto_topMod_io_out_0_port_sys_rst,
  auto_topMod_spi_source_out_sck,
  auto_topMod_spi_source_out_dq_0_o,
  auto_topMod_spi_source_out_dq_1_i,
  auto_topMod_spi_source_out_cs_0,
  auto_topMod_uart_source_out_txd,
  auto_topMod_uart_source_out_rxd,
  auto_jtag_debug_source_out_jtag_TCK,
  auto_jtag_debug_source_out_jtag_TMS,
  auto_jtag_debug_source_out_jtag_TDI,
  auto_jtag_debug_source_out_jtag_TDO
);

input wire spi_sclk;
input wire spi_cs;
input wire axi_spi_slave_test_mode;
output wire spi_gpio_mux_sel;
output wire [1 : 0] spi_mode;
input wire spi_sdi0;
input wire spi_sdi1;
input wire spi_sdi2;
input wire spi_sdi3;
output wire spi_sdo0;
output wire spi_sdo1;
output wire spi_sdo2;
output wire spi_sdo3;
output wire [3 : 0] spi_sdo_oen;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 tile_all_reset RST" *)
output wire tile_all_reset;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 chiplink_reset RST" *)
output wire chiplink_reset;
input wire corePLL_clk_out_cpu;
output wire corePLL_clk_out_chiplink;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 auto_out_alway_on_reset RST" *)
output wire auto_out_alway_on_reset;
input wire debug_mode_sel_pad_glitch_free;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 in_ref_always_on_clk CLK" *)
input wire in_ref_always_on_clk;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 in_hard_pwr_reset RST" *)
input wire in_hard_pwr_reset;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ddr_io_c2b_clk CLK" *)
output wire ddr_io_c2b_clk;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ddr_io_c2b_rst RST" *)
output wire ddr_io_c2b_rst;
output wire ddr_io_c2b_send;
output wire [7 : 0] ddr_io_c2b_data;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ddr_io_b2c_clk CLK" *)
input wire ddr_io_b2c_clk;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ddr_io_b2c_rst RST" *)
input wire ddr_io_b2c_rst;
input wire ddr_io_b2c_send;
input wire [7 : 0] ddr_io_b2c_data;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 spi_master_clk CLK" *)
output wire spi_master_clk;
output wire [3 : 0] spi_master_csn;
output wire [1 : 0] spi_master_mode;
output wire [3 : 0] spi_master_sdo;
output wire [3 : 0] spi_master_sdo_oen;
input wire [3 : 0] spi_master_sdi;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 auto_topMod_io_out_0_port_sys_rst RST" *)
input wire auto_topMod_io_out_0_port_sys_rst;
output wire auto_topMod_spi_source_out_sck;
output wire auto_topMod_spi_source_out_dq_0_o;
input wire auto_topMod_spi_source_out_dq_1_i;
output wire auto_topMod_spi_source_out_cs_0;
output wire auto_topMod_uart_source_out_txd;
input wire auto_topMod_uart_source_out_rxd;
input wire auto_jtag_debug_source_out_jtag_TCK;
input wire auto_jtag_debug_source_out_jtag_TMS;
input wire auto_jtag_debug_source_out_jtag_TDI;
output wire auto_jtag_debug_source_out_jtag_TDO;

  DevKitWrapper inst (
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
    .tile_all_reset(tile_all_reset),
    .chiplink_reset(chiplink_reset),
    .corePLL_clk_out_cpu(corePLL_clk_out_cpu),
    .corePLL_clk_out_chiplink(corePLL_clk_out_chiplink),
    .auto_out_alway_on_reset(auto_out_alway_on_reset),
    .debug_mode_sel_pad_glitch_free(debug_mode_sel_pad_glitch_free),
    .in_ref_always_on_clk(in_ref_always_on_clk),
    .in_hard_pwr_reset(in_hard_pwr_reset),
    .ddr_io_c2b_clk(ddr_io_c2b_clk),
    .ddr_io_c2b_rst(ddr_io_c2b_rst),
    .ddr_io_c2b_send(ddr_io_c2b_send),
    .ddr_io_c2b_data(ddr_io_c2b_data),
    .ddr_io_b2c_clk(ddr_io_b2c_clk),
    .ddr_io_b2c_rst(ddr_io_b2c_rst),
    .ddr_io_b2c_send(ddr_io_b2c_send),
    .ddr_io_b2c_data(ddr_io_b2c_data),
    .spi_master_clk(spi_master_clk),
    .spi_master_csn(spi_master_csn),
    .spi_master_mode(spi_master_mode),
    .spi_master_sdo(spi_master_sdo),
    .spi_master_sdo_oen(spi_master_sdo_oen),
    .spi_master_sdi(spi_master_sdi),
    .auto_topMod_io_out_0_port_sys_rst(auto_topMod_io_out_0_port_sys_rst),
    .auto_topMod_spi_source_out_sck(auto_topMod_spi_source_out_sck),
    .auto_topMod_spi_source_out_dq_0_o(auto_topMod_spi_source_out_dq_0_o),
    .auto_topMod_spi_source_out_dq_1_i(auto_topMod_spi_source_out_dq_1_i),
    .auto_topMod_spi_source_out_cs_0(auto_topMod_spi_source_out_cs_0),
    .auto_topMod_uart_source_out_txd(auto_topMod_uart_source_out_txd),
    .auto_topMod_uart_source_out_rxd(auto_topMod_uart_source_out_rxd),
    .auto_jtag_debug_source_out_jtag_TCK(auto_jtag_debug_source_out_jtag_TCK),
    .auto_jtag_debug_source_out_jtag_TMS(auto_jtag_debug_source_out_jtag_TMS),
    .auto_jtag_debug_source_out_jtag_TDI(auto_jtag_debug_source_out_jtag_TDI),
    .auto_jtag_debug_source_out_jtag_TDO(auto_jtag_debug_source_out_jtag_TDO)
  );
endmodule
