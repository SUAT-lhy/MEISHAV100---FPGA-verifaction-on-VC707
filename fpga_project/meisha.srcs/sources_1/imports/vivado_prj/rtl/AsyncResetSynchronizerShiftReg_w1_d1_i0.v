module AsyncResetSynchronizerShiftReg_w1_d1_i0( 
  input   clock, 
  input   reset, 
  input   io_d, 
  output  io_q 
);
  wire  sync_0_clock; 
  wire  sync_0_reset; 
  wire  sync_0_io_d; 
  wire  sync_0_io_q; 
  wire  sync_0_io_en; 
  AsyncResetRegVec_w1_i0 sync_0 ( 
    .clock(sync_0_clock),
    .reset(sync_0_reset),
    .io_d(sync_0_io_d),
    .io_q(sync_0_io_q),
    .io_en(sync_0_io_en)
  );
  assign io_q = sync_0_io_q; 
  assign sync_0_clock = clock; 
  assign sync_0_reset = reset; 
  assign sync_0_io_d = io_d; 
  assign sync_0_io_en = 1'h1; 
endmodule
