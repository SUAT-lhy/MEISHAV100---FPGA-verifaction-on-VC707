module ClockGroup( 
  input   auto_in_member_0_clock,
  input   auto_in_member_0_reset,
  output  auto_out_clock,
  output  auto_out_reset 
);
  assign auto_out_clock = auto_in_member_0_clock;
  assign auto_out_reset = auto_in_member_0_reset;
endmodule
module AsyncResetRegVec_w13_i0( 
  input         clock,
  input         reset,
  input  [12:0] io_d, 
  output [12:0] io_q, 
  input         io_en 
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
  wire  reg_4_rst; 
  wire  reg_4_clk; 
  wire  reg_4_en; 
  wire  reg_4_q; 
  wire  reg_4_d; 
  wire  reg_5_rst; 
  wire  reg_5_clk; 
  wire  reg_5_en; 
  wire  reg_5_q; 
  wire  reg_5_d; 
  wire  reg_6_rst; 
  wire  reg_6_clk; 
  wire  reg_6_en; 
  wire  reg_6_q;  
  wire  reg_6_d; 
  wire  reg_7_rst; 
  wire  reg_7_clk; 
  wire  reg_7_en; 
  wire  reg_7_q; 
  wire  reg_7_d; 
  wire  reg_8_rst; 
  wire  reg_8_clk; 
  wire  reg_8_en; 
  wire  reg_8_q; 
  wire  reg_8_d; 
  wire  reg_9_rst; 
  wire  reg_9_clk; 
  wire  reg_9_en; 
  wire  reg_9_q; 
  wire  reg_9_d;  
  wire  reg_10_rst; 
  wire  reg_10_clk; 
  wire  reg_10_en; 
  wire  reg_10_q; 
  wire  reg_10_d; 
  wire  reg_11_rst; 
  wire  reg_11_clk; 
  wire  reg_11_en; 
  wire  reg_11_q; 
  wire  reg_11_d; 
  wire  reg_12_rst; 
  wire  reg_12_clk; 
  wire  reg_12_en; 
  wire  reg_12_q; 
  wire  reg_12_d; 
  wire [1:0] _T_20; 
  wire [2:0] _T_21; 
  wire [1:0] _T_22; 
  wire [2:0] _T_23; 
  wire [5:0] _T_24; 
  wire [1:0] _T_25; 
  wire [2:0] _T_26; 
  wire [1:0] _T_27; 
  wire [1:0] _T_28; 
  wire [3:0] _T_29; 
  wire [6:0] _T_30; 
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
    .clk(reg_3_clk),
    .en(reg_3_en),
    .q(reg_3_q),
    .d(reg_3_d)
  );
  AsyncResetReg #(.RESET_VALUE(0)) reg_4 (
    .rst(reg_4_rst),
    .clk(reg_4_clk),
    .en(reg_4_en),
    .q(reg_4_q),
    .d(reg_4_d)
  );
  AsyncResetReg #(.RESET_VALUE(0)) reg_5 (
    .rst(reg_5_rst),
    .clk(reg_5_clk),
    .en(reg_5_en),
    .q(reg_5_q),
    .d(reg_5_d)
  );
  AsyncResetReg #(.RESET_VALUE(0)) reg_6 (
    .rst(reg_6_rst),
    .clk(reg_6_clk),
    .en(reg_6_en),
    .q(reg_6_q),
    .d(reg_6_d)
  );
  AsyncResetReg #(.RESET_VALUE(0)) reg_7 ( 
    .rst(reg_7_rst),
    .clk(reg_7_clk),
    .en(reg_7_en),
    .q(reg_7_q),
    .d(reg_7_d)
  );
  AsyncResetReg #(.RESET_VALUE(0)) reg_8 (
    .rst(reg_8_rst),
    .clk(reg_8_clk),
    .en(reg_8_en),
    .q(reg_8_q),
    .d(reg_8_d)
  );
  AsyncResetReg #(.RESET_VALUE(0)) reg_9 ( 
    .rst(reg_9_rst),
    .clk(reg_9_clk),
    .en(reg_9_en),
    .q(reg_9_q),
    .d(reg_9_d)
  );
  AsyncResetReg #(.RESET_VALUE(0)) reg_10 ( 
    .rst(reg_10_rst),
    .clk(reg_10_clk),
    .en(reg_10_en),
    .q(reg_10_q),
    .d(reg_10_d)
  );
  AsyncResetReg #(.RESET_VALUE(0)) reg_11 ( 
    .rst(reg_11_rst),
    .clk(reg_11_clk),
    .en(reg_11_en),
    .q(reg_11_q),
    .d(reg_11_d)
  );
  AsyncResetReg #(.RESET_VALUE(0)) reg_12 (
    .rst(reg_12_rst),
    .clk(reg_12_clk),
    .en(reg_12_en),
    .q(reg_12_q),
    .d(reg_12_d)
  );
  assign _T_20 = {reg_2_q,reg_1_q}; 
  assign _T_21 = {_T_20,reg_0_q}; 
  assign _T_22 = {reg_5_q,reg_4_q}; 
  assign _T_23 = {_T_22,reg_3_q}; 
  assign _T_24 = {_T_23,_T_21}; 
  assign _T_25 = {reg_8_q,reg_7_q}; 
  assign _T_26 = {_T_25,reg_6_q}; 
  assign _T_27 = {reg_10_q,reg_9_q};
  assign _T_28 = {reg_12_q,reg_11_q}; 
  assign _T_29 = {_T_28,_T_27};
  assign _T_30 = {_T_29,_T_26};
  assign io_q = {_T_30,_T_24}; 
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
  assign reg_4_rst = reset; 
  assign reg_4_clk = clock; 
  assign reg_4_en = io_en; 
  assign reg_4_d = io_d[4]; 
  assign reg_5_rst = reset; 
  assign reg_5_clk = clock; 
  assign reg_5_en = io_en; 
  assign reg_5_d = io_d[5]; 
  assign reg_6_rst = reset; 
  assign reg_6_clk = clock; 
  assign reg_6_en = io_en; 
  assign reg_6_d = io_d[6]; 
  assign reg_7_rst = reset; 
  assign reg_7_clk = clock; 
  assign reg_7_en = io_en; 
  assign reg_7_d = io_d[7]; 
  assign reg_8_rst = reset; 
  assign reg_8_clk = clock; 
  assign reg_8_en = io_en; 
  assign reg_8_d = io_d[8]; 
  assign reg_9_rst = reset; 
  assign reg_9_clk = clock; 
  assign reg_9_en = io_en; 
  assign reg_9_d = io_d[9]; 
  assign reg_10_rst = reset; 
  assign reg_10_clk = clock; 
  assign reg_10_en = io_en; 
  assign reg_10_d = io_d[10];
  assign reg_11_rst = reset; 
  assign reg_11_clk = clock; 
  assign reg_11_en = io_en; 
  assign reg_11_d = io_d[11];
  assign reg_12_rst = reset; 
  assign reg_12_clk = clock; 
  assign reg_12_en = io_en; 
  assign reg_12_d = io_d[12];
endmodule