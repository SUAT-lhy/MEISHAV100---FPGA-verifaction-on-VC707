module AsyncValidSync_2( 
  input   clock, 
  input   reset, 
  input   io_in, 
  output  io_out 
);
  wire  sink_valid_clock; 
  wire  sink_valid_reset; 
  wire  sink_valid_io_d; 
  wire  sink_valid_io_q; 
  AsyncResetSynchronizerShiftReg_w1_d3_i0 sink_valid ( 
    .clock(sink_valid_clock),
    .reset(sink_valid_reset),
    .io_d(sink_valid_io_d),
    .io_q(sink_valid_io_q)
  );
  assign io_out = sink_valid_io_q; 
  assign sink_valid_clock = clock; 
  assign sink_valid_reset = reset; 
  assign sink_valid_io_d = io_in; 
endmodule
