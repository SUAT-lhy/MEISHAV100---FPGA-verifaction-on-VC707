-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.4 (lin64) Build 1756540 Mon Jan 23 19:11:19 MST 2017
-- Date        : Thu Dec  5 16:47:58 2024
-- Host        : meisha running 64-bit CentOS Linux release 7.9.2009 (Core)
-- Command     : write_vhdl -force -mode synth_stub
--               /home/test/vivado_prj/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_chiplink_master_0_1/meisha_chiplink_master_0_1_stub.vhdl
-- Design      : meisha_chiplink_master_0_1
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7vx485tffg1761-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity meisha_chiplink_master_0_1 is
  Port ( 
    clk : in STD_LOGIC;
    resetn : in STD_LOGIC;
    chiplink_tx_clk : out STD_LOGIC;
    chiplink_tx_rst : out STD_LOGIC;
    chiplink_tx_send : out STD_LOGIC;
    chiplink_tx_data : out STD_LOGIC_VECTOR ( 7 downto 0 );
    chiplink_rx_clk : in STD_LOGIC;
    chiplink_rx_rst : in STD_LOGIC;
    chiplink_rx_send : in STD_LOGIC;
    chiplink_rx_data : in STD_LOGIC_VECTOR ( 7 downto 0 );
    io_axi4_0_awready : in STD_LOGIC;
    io_axi4_0_awvalid : out STD_LOGIC;
    io_axi4_0_awid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    io_axi4_0_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    io_axi4_0_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    io_axi4_0_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    io_axi4_0_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    io_axi4_0_wready : in STD_LOGIC;
    io_axi4_0_wvalid : out STD_LOGIC;
    io_axi4_0_wdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    io_axi4_0_wstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    io_axi4_0_wlast : out STD_LOGIC;
    io_axi4_0_bready : out STD_LOGIC;
    io_axi4_0_bvalid : in STD_LOGIC;
    io_axi4_0_bid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    io_axi4_0_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    io_axi4_0_arready : in STD_LOGIC;
    io_axi4_0_arvalid : out STD_LOGIC;
    io_axi4_0_arid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    io_axi4_0_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    io_axi4_0_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    io_axi4_0_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    io_axi4_0_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    io_axi4_0_rready : out STD_LOGIC;
    io_axi4_0_rvalid : in STD_LOGIC;
    io_axi4_0_rid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    io_axi4_0_rdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    io_axi4_0_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    io_axi4_0_rlast : in STD_LOGIC
  );

end meisha_chiplink_master_0_1;

architecture stub of meisha_chiplink_master_0_1 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,resetn,chiplink_tx_clk,chiplink_tx_rst,chiplink_tx_send,chiplink_tx_data[7:0],chiplink_rx_clk,chiplink_rx_rst,chiplink_rx_send,chiplink_rx_data[7:0],io_axi4_0_awready,io_axi4_0_awvalid,io_axi4_0_awid[3:0],io_axi4_0_awaddr[31:0],io_axi4_0_awlen[7:0],io_axi4_0_awsize[2:0],io_axi4_0_awburst[1:0],io_axi4_0_wready,io_axi4_0_wvalid,io_axi4_0_wdata[63:0],io_axi4_0_wstrb[7:0],io_axi4_0_wlast,io_axi4_0_bready,io_axi4_0_bvalid,io_axi4_0_bid[3:0],io_axi4_0_bresp[1:0],io_axi4_0_arready,io_axi4_0_arvalid,io_axi4_0_arid[3:0],io_axi4_0_araddr[31:0],io_axi4_0_arlen[7:0],io_axi4_0_arsize[2:0],io_axi4_0_arburst[1:0],io_axi4_0_rready,io_axi4_0_rvalid,io_axi4_0_rid[3:0],io_axi4_0_rdata[63:0],io_axi4_0_rresp[1:0],io_axi4_0_rlast";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "chiplink_master,Vivado 2016.4";
begin
end;
