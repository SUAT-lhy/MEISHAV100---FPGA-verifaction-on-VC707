module IntSyncCrossingSource_2( 
  input   clock, 
  input   reset, 
  input   auto_in_0, 
  input   auto_in_1, 
  output  auto_out_sync_0, 
  output  auto_out_sync_1 
);
  wire  AsyncResetRegVec_w2_i0_clock; 
  wire  AsyncResetRegVec_w2_i0_reset; 
  wire [1:0] AsyncResetRegVec_w2_i0_io_d; 
  wire [1:0] AsyncResetRegVec_w2_i0_io_q; 
  wire  AsyncResetRegVec_w2_i0_io_en; 
  AsyncResetRegVec_w2_i0 AsyncResetRegVec_w2_i0 ( 
    .clock(AsyncResetRegVec_w2_i0_clock),
    .reset(AsyncResetRegVec_w2_i0_reset),
    .io_d(AsyncResetRegVec_w2_i0_io_d),
    .io_q(AsyncResetRegVec_w2_i0_io_q),
    .io_en(AsyncResetRegVec_w2_i0_io_en)
  );
  assign auto_out_sync_0 = AsyncResetRegVec_w2_i0_io_q[0]; 
  assign auto_out_sync_1 = AsyncResetRegVec_w2_i0_io_q[1]; 
  assign AsyncResetRegVec_w2_i0_clock = clock; 
  assign AsyncResetRegVec_w2_i0_reset = reset; 
  assign AsyncResetRegVec_w2_i0_io_d = {auto_in_1,auto_in_0}; 
  assign AsyncResetRegVec_w2_i0_io_en = 1'h1; 
endmodule
