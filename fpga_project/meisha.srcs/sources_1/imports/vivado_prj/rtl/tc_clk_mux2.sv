module tc_clk_mux2 (
  input  logic clk0_i,
  input  logic clk1_i,
  input  logic clk_sel_i,
  output logic clk_o
);

`ifdef MSTD_CELL_EN
`CK_MUX2_STD_CELL_DONT_TOUCH u_dont_touch_tb_clk_mux2 (
    .A      (clk0_i),
    .B      (clk1_i),
    .S      (clk_sel_i),
    .O      (clk_o)
);

`else 
  assign clk_o = (clk_sel_i) ? clk1_i : clk0_i;
`endif
endmodule