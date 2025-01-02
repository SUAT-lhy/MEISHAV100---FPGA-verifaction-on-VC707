module AsyncResetRegVec_w2_i0( 
  input        clock, 
  input        reset, 
  input  [1:0] io_d, 
  output [1:0] io_q, 
  input        io_en 
);
  wire  reg_0_rst; 
  wire  reg_0_clk; 
  wire  reg_0_en; 
  wire  reg_0_q; 
  wire  reg_0_d; 
  wire  reg_1_rst; 
  wire  reg_1_clk; 
  wire  reg_1_en; 
  wire  reg_1_q; 
  wire  reg_1_d; 
  AsyncResetReg #(.RESET_VALUE(0)) reg_0 ( 
    .rst(reg_0_rst),
    .clk(reg_0_clk),
    .en(reg_0_en),
    .q(reg_0_q),
    .d(reg_0_d)
  );
  AsyncResetReg #(.RESET_VALUE(0)) reg_1 ( 
    .rst(reg_1_rst),
    .clk(reg_1_clk),
    .en(reg_1_en),
    .q(reg_1_q),
    .d(reg_1_d)
  );
  assign io_q = {reg_1_q,reg_0_q}; 
  assign reg_0_rst = reset; 
  assign reg_0_clk = clock; 
  assign reg_0_en = io_en; 
  assign reg_0_d = io_d[0]; 
  assign reg_1_rst = reset; 
  assign reg_1_clk = clock; 
  assign reg_1_en = io_en; 
  assign reg_1_d = io_d[1]; 
endmodule
