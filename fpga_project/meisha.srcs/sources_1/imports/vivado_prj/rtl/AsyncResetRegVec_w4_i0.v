module AsyncResetRegVec_w4_i0( 
  input        clock, 
  input        reset, 
  input  [3:0] io_d, 
  output [3:0] io_q, 
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
  wire  reg_2_rst; 
  wire  reg_2_clk; 
  wire  reg_2_en; 
  wire  reg_2_q; 
  wire  reg_2_d; 
  wire  reg_3_rst; 
  wire  reg_3_clk; 
  wire  reg_3_en; 
  wire  reg_3_q; 
  wire  reg_3_d; 
  wire [1:0] _T_11; 
  wire [1:0] _T_12; 
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
  AsyncResetReg #(.RESET_VALUE(0)) reg_2 ( 
    .rst(reg_2_rst),
    .clk(reg_2_clk),
    .en(reg_2_en),
    .q(reg_2_q),
    .d(reg_2_d)
  );
  AsyncResetReg #(.RESET_VALUE(0)) reg_3 ( 
    .rst(reg_3_rst),
    .clk(reg_3_clk),
    .en(reg_3_en),
    .q(reg_3_q),
    .d(reg_3_d)
  );
  assign _T_11 = {reg_1_q,reg_0_q}; 
  assign _T_12 = {reg_3_q,reg_2_q}; 
  assign io_q = {_T_12,_T_11}; 
  assign reg_0_rst = reset; 
  assign reg_0_clk = clock; 
  assign reg_0_en = io_en; 
  assign reg_0_d = io_d[0]; 
  assign reg_1_rst = reset; 
  assign reg_1_clk = clock; 
  assign reg_1_en = io_en; 
  assign reg_1_d = io_d[1]; 
  assign reg_2_rst = reset; 
  assign reg_2_clk = clock; 
  assign reg_2_en = io_en; 
  assign reg_2_d = io_d[2]; 
  assign reg_3_rst = reset; 
  assign reg_3_clk = clock; 
  assign reg_3_en = io_en; 
  assign reg_3_d = io_d[3]; 
endmodule
