module IntSyncCrossingSink_23( 
  input   auto_in_sync_0, 
  input   auto_in_sync_1, 
  input   auto_in_sync_2, 
  input   auto_in_sync_3, 
  output  auto_out_0, 
  output  auto_out_1, 
  output  auto_out_2, 
  output  auto_out_3 
);
  assign auto_out_0 = auto_in_sync_0; 
  assign auto_out_1 = auto_in_sync_1; 
  assign auto_out_2 = auto_in_sync_2; 
  assign auto_out_3 = auto_in_sync_3; 
endmodule
