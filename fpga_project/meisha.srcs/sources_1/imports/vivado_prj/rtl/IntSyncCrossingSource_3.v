module IntSyncCrossingSource_3( 
  input   clock, 
  input   reset, 
  input   auto_in_0, 
  output  auto_out_sync_0 
);
  wire  AsyncResetRegVec_w1_i0_clock; 
  wire  AsyncResetRegVec_w1_i0_reset; 
  wire  AsyncResetRegVec_w1_i0_io_d; 
  wire  AsyncResetRegVec_w1_i0_io_q; 
  wire  AsyncResetRegVec_w1_i0_io_en; 
  AsyncResetRegVec_w1_i0 AsyncResetRegVec_w1_i0 ( 
    .clock(AsyncResetRegVec_w1_i0_clock),
    .reset(AsyncResetRegVec_w1_i0_reset),
    .io_d(AsyncResetRegVec_w1_i0_io_d),
    .io_q(AsyncResetRegVec_w1_i0_io_q),
    .io_en(AsyncResetRegVec_w1_i0_io_en)
  );
  assign auto_out_sync_0 = AsyncResetRegVec_w1_i0_io_q; 
  assign AsyncResetRegVec_w1_i0_clock = clock; 
  assign AsyncResetRegVec_w1_i0_reset = reset; 
  assign AsyncResetRegVec_w1_i0_io_d = auto_in_0; 
  assign AsyncResetRegVec_w1_i0_io_en = 1'h1; 
endmodule
