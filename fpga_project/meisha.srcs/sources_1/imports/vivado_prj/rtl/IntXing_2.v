module IntXing_2( 
  input   clock, 
  input   auto_int_in_0, 
  input   auto_int_in_1, 
  input   auto_int_in_2, 
  input   auto_int_in_3, 
  output  auto_int_out_0, 
  output  auto_int_out_1, 
  output  auto_int_out_2, 
  output  auto_int_out_3 
);
  wire  SynchronizerShiftReg_w4_d3_clock; 
  wire [3:0] SynchronizerShiftReg_w4_d3_io_d; 
  wire [3:0] SynchronizerShiftReg_w4_d3_io_q; 
  wire [1:0] _T_103; 
  wire [1:0] _T_104; 
  wire [3:0] _T_136; 
  SynchronizerShiftReg_w4_d3 SynchronizerShiftReg_w4_d3 ( 
    .clock(SynchronizerShiftReg_w4_d3_clock),
    .io_d(SynchronizerShiftReg_w4_d3_io_d),
    .io_q(SynchronizerShiftReg_w4_d3_io_q)
  );
  assign _T_103 = {auto_int_in_1,auto_int_in_0}; 
  assign _T_104 = {auto_int_in_3,auto_int_in_2}; 
  assign _T_136 = SynchronizerShiftReg_w4_d3_io_q; 
  assign auto_int_out_0 = _T_136[0]; 
  assign auto_int_out_1 = _T_136[1]; 
  assign auto_int_out_2 = _T_136[2]; 
  assign auto_int_out_3 = _T_136[3]; 
  assign SynchronizerShiftReg_w4_d3_clock = clock; 
  assign SynchronizerShiftReg_w4_d3_io_d = {_T_104,_T_103}; 
endmodule
