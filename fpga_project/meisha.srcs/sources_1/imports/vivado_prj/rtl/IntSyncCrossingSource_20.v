module IntSyncCrossingSource_20( 
  input   clock, 
  input   reset, 
  input   auto_in_0, 
  input   auto_in_1, 
  input   auto_in_2, 
  input   auto_in_3, 
  output  auto_out_sync_0, 
  output  auto_out_sync_1, 
  output  auto_out_sync_2, 
  output  auto_out_sync_3 
);
  wire  AsyncResetRegVec_w4_i0_clock; 
  wire  AsyncResetRegVec_w4_i0_reset; 
  wire [3:0] AsyncResetRegVec_w4_i0_io_d; 
  wire [3:0] AsyncResetRegVec_w4_i0_io_q; 
  wire  AsyncResetRegVec_w4_i0_io_en; 
  wire [1:0] _T_81; 
  wire [1:0] _T_82; 
  AsyncResetRegVec_w4_i0 AsyncResetRegVec_w4_i0 ( 
    .clock(AsyncResetRegVec_w4_i0_clock),
    .reset(AsyncResetRegVec_w4_i0_reset),
    .io_d(AsyncResetRegVec_w4_i0_io_d),
    .io_q(AsyncResetRegVec_w4_i0_io_q),
    .io_en(AsyncResetRegVec_w4_i0_io_en)
  );
  assign _T_81 = {auto_in_1,auto_in_0}; 
  assign _T_82 = {auto_in_3,auto_in_2}; 
  assign auto_out_sync_0 = AsyncResetRegVec_w4_i0_io_q[0]; 
  assign auto_out_sync_1 = AsyncResetRegVec_w4_i0_io_q[1]; 
  assign auto_out_sync_2 = AsyncResetRegVec_w4_i0_io_q[2]; 
  assign auto_out_sync_3 = AsyncResetRegVec_w4_i0_io_q[3]; 
  assign AsyncResetRegVec_w4_i0_clock = clock; 
  assign AsyncResetRegVec_w4_i0_reset = reset; 
  assign AsyncResetRegVec_w4_i0_io_d = {_T_82,_T_81}; 
  assign AsyncResetRegVec_w4_i0_io_en = 1'h1; 
endmodule
