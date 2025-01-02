`timescale 1ns / 1ps
module tc_clk_delay(
  input  logic in_i,
  output logic out_o
);

`ifdef MSTD_CELL_EN
`CK_DELAY_STD_CELL_DONT_TOUCH clk_delay (
    .I      (in_i),
    .O      (out_o) 
);

`else
  parameter Delay = 30;
// pragma translate_off
`ifndef VERILATOR
  assign #(Delay) out_o = in_i;
`endif
// pragma translate_on
`endif 
endmodule
