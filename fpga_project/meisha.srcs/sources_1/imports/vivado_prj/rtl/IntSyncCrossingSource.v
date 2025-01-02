module IntSyncCrossingSource( 
  input   auto_in_3_0, 
  input   auto_in_2_0, 
  input   auto_in_1_0, 
  input   auto_in_0_0, 
  output  auto_out_3_sync_0, 
  output  auto_out_2_sync_0, 
  output  auto_out_1_sync_0, 
  output  auto_out_0_sync_0 
);
  assign auto_out_3_sync_0 = auto_in_3_0; 
  assign auto_out_2_sync_0 = auto_in_2_0; 
  assign auto_out_1_sync_0 = auto_in_1_0; 
  assign auto_out_0_sync_0 = auto_in_0_0; 
endmodule
