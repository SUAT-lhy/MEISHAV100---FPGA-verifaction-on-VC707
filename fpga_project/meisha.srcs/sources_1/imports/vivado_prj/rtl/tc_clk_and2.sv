module tc_clk_and2 (
  input  logic clk0_i,
  input  logic clk1_i,
  output logic clk_o
);


`ifdef MSTD_CELL_EN  
  // AN2CKLBRMX8
  `CK_AND2_STD_CELL_DONT_TOUCH u_dont_touch_tc_clk_and2 (
    .I1   (clk0_i),
    .I2   (clk1_i),
    .O    (clk_o)
  );

`else  
 assign clk_o = clk0_i & clk1_i;
`endif

endmodule  
