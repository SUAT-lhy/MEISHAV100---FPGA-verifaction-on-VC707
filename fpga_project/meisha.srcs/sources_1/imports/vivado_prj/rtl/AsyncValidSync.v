module AsyncValidSync( 
  input   clock, 
  input   reset, 
  input   io_in, 
  output  io_out 
);
  wire  source_valid_clock; 
  wire  source_valid_reset; 
  wire  source_valid_io_d; 
  wire  source_valid_io_q; 
  AsyncResetSynchronizerShiftReg_w1_d4_i0 source_valid ( 
    .clock(source_valid_clock),
    .reset(source_valid_reset),
    .io_d(source_valid_io_d),
    .io_q(source_valid_io_q)
  );
  assign io_out = source_valid_io_q; 
  assign source_valid_clock = clock; 
  assign source_valid_reset = reset; 
  assign source_valid_io_d = io_in; 
endmodule
