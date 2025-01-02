module AsyncResetRegVec_w1_i0( 
  input   clock, 
  input   reset, 
  input   io_d, 
  output  io_q, 
  input   io_en 
);
  wire  reg_0_rst; 
  wire  reg_0_clk; 
  wire  reg_0_en; 
  wire  reg_0_q; 
  wire  reg_0_d; 
  AsyncResetReg #(.RESET_VALUE(0)) reg_0 ( 
    .rst(reg_0_rst),
    .clk(reg_0_clk),
    .en(reg_0_en),
    .q(reg_0_q),
    .d(reg_0_d)
  );
  assign io_q = reg_0_q; 
  assign reg_0_rst = reset; 
  assign reg_0_clk = clock; 
  assign reg_0_en = io_en; 
  assign reg_0_d = io_d; 
endmodule
