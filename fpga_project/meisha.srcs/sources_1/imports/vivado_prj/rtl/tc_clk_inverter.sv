
module tc_clk_inverter (
  input  logic clk_i,
  output logic clk_o
);

`ifdef MSTD_CELL_EN 
  // INVCKLBRMX0P7
  `CK_INV_STD_CELL_DONT_TOUCH u_dont_touch_tb_clk_inverter (
      .O      (clk_o),
      .I      (clk_i)
  );

`else 
  assign clk_o = ~clk_i;
`endif

endmodule