module IntXing( 
  input   clock, 
  input   auto_int_in_0, 
  output  auto_int_out_0 
);
  wire  SynchronizerShiftReg_w1_d3_clock; 
  wire  SynchronizerShiftReg_w1_d3_io_d; 
  wire  SynchronizerShiftReg_w1_d3_io_q; 
  SynchronizerShiftReg_w1_d3 SynchronizerShiftReg_w1_d3 ( 
    .clock(SynchronizerShiftReg_w1_d3_clock),
    .io_d(SynchronizerShiftReg_w1_d3_io_d),
    .io_q(SynchronizerShiftReg_w1_d3_io_q)
  );
  assign auto_int_out_0 = SynchronizerShiftReg_w1_d3_io_q; 
  assign SynchronizerShiftReg_w1_d3_clock = clock; 
  assign SynchronizerShiftReg_w1_d3_io_d = auto_int_in_0; 
endmodule