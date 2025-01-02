-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.4 (lin64) Build 1756540 Mon Jan 23 19:11:19 MST 2017
-- Date        : Thu Dec  5 16:52:23 2024
-- Host        : meisha running 64-bit CentOS Linux release 7.9.2009 (Core)
-- Command     : write_vhdl -force -mode synth_stub
--               /home/test/vivado_prj/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_DevKitWrapper_0_0/meisha_DevKitWrapper_0_0_stub.vhdl
-- Design      : meisha_DevKitWrapper_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7vx485tffg1761-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity meisha_DevKitWrapper_0_0 is
  Port ( 
    spi_sclk : in STD_LOGIC;
    spi_cs : in STD_LOGIC;
    axi_spi_slave_test_mode : in STD_LOGIC;
    spi_gpio_mux_sel : out STD_LOGIC;
    spi_mode : out STD_LOGIC_VECTOR ( 1 downto 0 );
    spi_sdi0 : in STD_LOGIC;
    spi_sdi1 : in STD_LOGIC;
    spi_sdi2 : in STD_LOGIC;
    spi_sdi3 : in STD_LOGIC;
    spi_sdo0 : out STD_LOGIC;
    spi_sdo1 : out STD_LOGIC;
    spi_sdo2 : out STD_LOGIC;
    spi_sdo3 : out STD_LOGIC;
    spi_sdo_oen : out STD_LOGIC_VECTOR ( 3 downto 0 );
    tile_all_reset : out STD_LOGIC;
    chiplink_reset : out STD_LOGIC;
    corePLL_clk_out_cpu : in STD_LOGIC;
    corePLL_clk_out_chiplink : out STD_LOGIC;
    auto_out_alway_on_reset : out STD_LOGIC;
    debug_mode_sel_pad_glitch_free : in STD_LOGIC;
    in_ref_always_on_clk : in STD_LOGIC;
    in_hard_pwr_reset : in STD_LOGIC;
    ddr_io_c2b_clk : out STD_LOGIC;
    ddr_io_c2b_rst : out STD_LOGIC;
    ddr_io_c2b_send : out STD_LOGIC;
    ddr_io_c2b_data : out STD_LOGIC_VECTOR ( 7 downto 0 );
    ddr_io_b2c_clk : in STD_LOGIC;
    ddr_io_b2c_rst : in STD_LOGIC;
    ddr_io_b2c_send : in STD_LOGIC;
    ddr_io_b2c_data : in STD_LOGIC_VECTOR ( 7 downto 0 );
    spi_master_clk : out STD_LOGIC;
    spi_master_csn : out STD_LOGIC_VECTOR ( 3 downto 0 );
    spi_master_mode : out STD_LOGIC_VECTOR ( 1 downto 0 );
    spi_master_sdo : out STD_LOGIC_VECTOR ( 3 downto 0 );
    spi_master_sdo_oen : out STD_LOGIC_VECTOR ( 3 downto 0 );
    spi_master_sdi : in STD_LOGIC_VECTOR ( 3 downto 0 );
    auto_topMod_io_out_0_port_sys_rst : in STD_LOGIC;
    auto_topMod_spi_source_out_sck : out STD_LOGIC;
    auto_topMod_spi_source_out_dq_0_o : out STD_LOGIC;
    auto_topMod_spi_source_out_dq_1_i : in STD_LOGIC;
    auto_topMod_spi_source_out_cs_0 : out STD_LOGIC;
    auto_topMod_uart_source_out_txd : out STD_LOGIC;
    auto_topMod_uart_source_out_rxd : in STD_LOGIC;
    auto_jtag_debug_source_out_jtag_TCK : in STD_LOGIC;
    auto_jtag_debug_source_out_jtag_TMS : in STD_LOGIC;
    auto_jtag_debug_source_out_jtag_TDI : in STD_LOGIC;
    auto_jtag_debug_source_out_jtag_TDO : out STD_LOGIC
  );

end meisha_DevKitWrapper_0_0;

architecture stub of meisha_DevKitWrapper_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "spi_sclk,spi_cs,axi_spi_slave_test_mode,spi_gpio_mux_sel,spi_mode[1:0],spi_sdi0,spi_sdi1,spi_sdi2,spi_sdi3,spi_sdo0,spi_sdo1,spi_sdo2,spi_sdo3,spi_sdo_oen[3:0],tile_all_reset,chiplink_reset,corePLL_clk_out_cpu,corePLL_clk_out_chiplink,auto_out_alway_on_reset,debug_mode_sel_pad_glitch_free,in_ref_always_on_clk,in_hard_pwr_reset,ddr_io_c2b_clk,ddr_io_c2b_rst,ddr_io_c2b_send,ddr_io_c2b_data[7:0],ddr_io_b2c_clk,ddr_io_b2c_rst,ddr_io_b2c_send,ddr_io_b2c_data[7:0],spi_master_clk,spi_master_csn[3:0],spi_master_mode[1:0],spi_master_sdo[3:0],spi_master_sdo_oen[3:0],spi_master_sdi[3:0],auto_topMod_io_out_0_port_sys_rst,auto_topMod_spi_source_out_sck,auto_topMod_spi_source_out_dq_0_o,auto_topMod_spi_source_out_dq_1_i,auto_topMod_spi_source_out_cs_0,auto_topMod_uart_source_out_txd,auto_topMod_uart_source_out_rxd,auto_jtag_debug_source_out_jtag_TCK,auto_jtag_debug_source_out_jtag_TMS,auto_jtag_debug_source_out_jtag_TDI,auto_jtag_debug_source_out_jtag_TDO";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "DevKitWrapper,Vivado 2016.4";
begin
end;
