module IntXbar_1( 
  input   auto_int_in_3_0, 
  input   auto_int_in_2_0, 
  input   auto_int_in_1_0, 
  input   auto_int_in_1_1, 
  input   auto_int_in_0_0, 
  output  auto_int_out_0, 
  output  auto_int_out_1, 
  output  auto_int_out_2, 
  output  auto_int_out_3, 
  output  auto_int_out_4 
);
  assign auto_int_out_0 = auto_int_in_0_0; 
  assign auto_int_out_1 = auto_int_in_1_0; 
  assign auto_int_out_2 = auto_int_in_1_1; 
  assign auto_int_out_3 = auto_int_in_2_0; 
  assign auto_int_out_4 = auto_int_in_3_0; 
endmodule
