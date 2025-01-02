
module PowerOnResetFPGAOnly(
  input clock,
  output power_on_reset
);
  reg reset;
  assign power_on_reset = reset;
  
`ifndef SYNTHESIS
  initial begin
     reset <= 1'b1;
  end
`endif

  always @(posedge clock) begin
     reset <= 1'b0;
  end
endmodule
