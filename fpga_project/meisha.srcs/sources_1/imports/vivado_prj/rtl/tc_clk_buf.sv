
module tc_clk_buffer (
  input  logic clk_i,
  output logic clk_o
);

`ifdef MSTD_CELL_EN  
`CK_BUF_STD_CELL_DONT_TOUCH u_dont_touch_tb_clk_buf (
    .O      (clk_o),
    .I      (clk_i)
);
`else  
  assign clk_o = clk_i;
`endif
endmodule