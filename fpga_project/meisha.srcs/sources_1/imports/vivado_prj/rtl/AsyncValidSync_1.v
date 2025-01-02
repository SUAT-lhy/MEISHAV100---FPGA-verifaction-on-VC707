module AsyncValidSync_1( 
  input   clock, 
  input   reset, 
  input   io_in, 
  output  io_out 
);
  wire  sink_extend_clock; 
  wire  sink_extend_reset; 
  wire  sink_extend_io_d; 
  wire  sink_extend_io_q; 
  AsyncResetSynchronizerShiftReg_w1_d1_i0 sink_extend ( 
    .clock(sink_extend_clock),
    .reset(sink_extend_reset),
    .io_d(sink_extend_io_d),
    .io_q(sink_extend_io_q)
  );
  assign io_out = sink_extend_io_q; 
  assign sink_extend_clock = clock; 
  assign sink_extend_reset = reset; 
  assign sink_extend_io_d = io_in; 
endmodule
