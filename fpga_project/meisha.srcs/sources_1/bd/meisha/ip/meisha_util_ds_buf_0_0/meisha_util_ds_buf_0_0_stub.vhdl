-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.4 (lin64) Build 1756540 Mon Jan 23 19:11:19 MST 2017
-- Date        : Thu Aug  1 19:22:03 2024
-- Host        : meisha running 64-bit CentOS Linux release 7.9.2009 (Core)
-- Command     : write_vhdl -force -mode synth_stub -rename_top meisha_util_ds_buf_0_0 -prefix
--               meisha_util_ds_buf_0_0_ meisha_util_ds_buf_0_0_stub.vhdl
-- Design      : meisha_util_ds_buf_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7vx485tffg1761-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity meisha_util_ds_buf_0_0 is
  Port ( 
    IBUF_DS_P : in STD_LOGIC_VECTOR ( 0 to 0 );
    IBUF_DS_N : in STD_LOGIC_VECTOR ( 0 to 0 );
    IBUF_OUT : out STD_LOGIC_VECTOR ( 0 to 0 )
  );

end meisha_util_ds_buf_0_0;

architecture stub of meisha_util_ds_buf_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "IBUF_DS_P[0:0],IBUF_DS_N[0:0],IBUF_OUT[0:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "util_ds_buf,Vivado 2016.4";
begin
end;
