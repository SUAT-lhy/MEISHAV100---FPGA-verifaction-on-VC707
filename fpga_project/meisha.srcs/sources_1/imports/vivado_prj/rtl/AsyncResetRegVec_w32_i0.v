module AsyncResetRegVec_w32_i0( 
  input         clock, 
  input         reset, 
  input  [31:0] io_d, 
  output [31:0] io_q 
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
  wire  reg_13_rst; 
  wire  reg_13_clk; 
  wire  reg_13_en; 
  wire  reg_13_q; 
  wire  reg_13_d; 
  wire  reg_14_rst; 
  wire  reg_14_clk; 
  wire  reg_14_en; 
  wire  reg_14_q; 
  wire  reg_14_d; 
  wire  reg_15_rst; 
  wire  reg_15_clk; 
  wire  reg_15_en; 
  wire  reg_15_q; 
  wire  reg_15_d; 
  wire  reg_16_rst; 
  wire  reg_16_clk; 
  wire  reg_16_en; 
  wire  reg_16_q; 
  wire  reg_16_d; 
  wire  reg_17_rst; 
  wire  reg_17_clk; 
  wire  reg_17_en; 
  wire  reg_17_q; 
  wire  reg_17_d; 
  wire  reg_18_rst; 
  wire  reg_18_clk; 
  wire  reg_18_en; 
  wire  reg_18_q; 
  wire  reg_18_d; 
  wire  reg_19_rst; 
  wire  reg_19_clk; 
  wire  reg_19_en; 
  wire  reg_19_q; 
  wire  reg_19_d; 
  wire  reg_20_rst; 
  wire  reg_20_clk; 
  wire  reg_20_en; 
  wire  reg_20_q; 
  wire  reg_20_d; 
  wire  reg_21_rst; 
  wire  reg_21_clk; 
  wire  reg_21_en; 
  wire  reg_21_q; 
  wire  reg_21_d; 
  wire  reg_22_rst; 
  wire  reg_22_clk; 
  wire  reg_22_en; 
  wire  reg_22_q; 
  wire  reg_22_d; 
  wire  reg_23_rst; 
  wire  reg_23_clk; 
  wire  reg_23_en; 
  wire  reg_23_q; 
  wire  reg_23_d; 
  wire  reg_24_rst; 
  wire  reg_24_clk; 
  wire  reg_24_en; 
  wire  reg_24_q; 
  wire  reg_24_d; 
  wire  reg_25_rst; 
  wire  reg_25_clk; 
  wire  reg_25_en; 
  wire  reg_25_q; 
  wire  reg_25_d; 
  wire  reg_26_rst; 
  wire  reg_26_clk; 
  wire  reg_26_en; 
  wire  reg_26_q; 
  wire  reg_26_d; 
  wire  reg_27_rst; 
  wire  reg_27_clk; 
  wire  reg_27_en; 
  wire  reg_27_q; 
  wire  reg_27_d; 
  wire  reg_28_rst; 
  wire  reg_28_clk; 
  wire  reg_28_en; 
  wire  reg_28_q; 
  wire  reg_28_d; 
  wire  reg_29_rst; 
  wire  reg_29_clk; 
  wire  reg_29_en; 
  wire  reg_29_q; 
  wire  reg_29_d; 
  wire  reg_30_rst; 
  wire  reg_30_clk; 
  wire  reg_30_en; 
  wire  reg_30_q; 
  wire  reg_30_d; 
  wire  reg_31_rst; 
  wire  reg_31_clk; 
  wire  reg_31_en; 
  wire  reg_31_q; 
  wire  reg_31_d; 
  wire [1:0] _T_39; 
  wire [1:0] _T_40; 
  wire [3:0] _T_41; 
  wire [1:0] _T_42; 
  wire [1:0] _T_43; 
  wire [3:0] _T_44; 
  wire [7:0] _T_45; 
  wire [1:0] _T_46; 
  wire [1:0] _T_47; 
  wire [3:0] _T_48; 
  wire [1:0] _T_49; 
  wire [1:0] _T_50; 
  wire [3:0] _T_51; 
  wire [7:0] _T_52; 
  wire [15:0] _T_53; 
  wire [1:0] _T_54; 
  wire [1:0] _T_55; 
  wire [3:0] _T_56; 
  wire [1:0] _T_57; 
  wire [1:0] _T_58; 
  wire [3:0] _T_59; 
  wire [7:0] _T_60; 
  wire [1:0] _T_61; 
  wire [1:0] _T_62; 
  wire [3:0] _T_63; 
  wire [1:0] _T_64; 
  wire [1:0] _T_65; 
  wire [3:0] _T_66; 
  wire [7:0] _T_67; 
  wire [15:0] _T_68; 
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
  AsyncResetReg #(.RESET_VALUE(0)) reg_13 ( 
    .rst(reg_13_rst),
    .clk(reg_13_clk),
    .en(reg_13_en),
    .q(reg_13_q),
    .d(reg_13_d)
  );
  AsyncResetReg #(.RESET_VALUE(0)) reg_14 ( 
    .rst(reg_14_rst),
    .clk(reg_14_clk),
    .en(reg_14_en),
    .q(reg_14_q),
    .d(reg_14_d)
  );
  AsyncResetReg #(.RESET_VALUE(0)) reg_15 ( 
    .rst(reg_15_rst),
    .clk(reg_15_clk),
    .en(reg_15_en),
    .q(reg_15_q),
    .d(reg_15_d)
  );
  AsyncResetReg #(.RESET_VALUE(0)) reg_16 ( 
    .rst(reg_16_rst),
    .clk(reg_16_clk),
    .en(reg_16_en),
    .q(reg_16_q),
    .d(reg_16_d)
  );
  AsyncResetReg #(.RESET_VALUE(0)) reg_17 ( 
    .rst(reg_17_rst),
    .clk(reg_17_clk),
    .en(reg_17_en),
    .q(reg_17_q),
    .d(reg_17_d)
  );
  AsyncResetReg #(.RESET_VALUE(0)) reg_18 ( 
    .rst(reg_18_rst),
    .clk(reg_18_clk),
    .en(reg_18_en),
    .q(reg_18_q),
    .d(reg_18_d)
  );
  AsyncResetReg #(.RESET_VALUE(0)) reg_19 ( 
    .rst(reg_19_rst),
    .clk(reg_19_clk),
    .en(reg_19_en),
    .q(reg_19_q),
    .d(reg_19_d)
  );
  AsyncResetReg #(.RESET_VALUE(0)) reg_20 ( 
    .rst(reg_20_rst),
    .clk(reg_20_clk),
    .en(reg_20_en),
    .q(reg_20_q),
    .d(reg_20_d)
  );
  AsyncResetReg #(.RESET_VALUE(0)) reg_21 ( 
    .rst(reg_21_rst),
    .clk(reg_21_clk),
    .en(reg_21_en),
    .q(reg_21_q),
    .d(reg_21_d)
  );
  AsyncResetReg #(.RESET_VALUE(0)) reg_22 ( 
    .rst(reg_22_rst),
    .clk(reg_22_clk),
    .en(reg_22_en),
    .q(reg_22_q),
    .d(reg_22_d)
  );
  AsyncResetReg #(.RESET_VALUE(0)) reg_23 ( 
    .rst(reg_23_rst),
    .clk(reg_23_clk),
    .en(reg_23_en),
    .q(reg_23_q),
    .d(reg_23_d)
  );
  AsyncResetReg #(.RESET_VALUE(0)) reg_24 ( 
    .rst(reg_24_rst),
    .clk(reg_24_clk),
    .en(reg_24_en),
    .q(reg_24_q),
    .d(reg_24_d)
  );
  AsyncResetReg #(.RESET_VALUE(0)) reg_25 ( 
    .rst(reg_25_rst),
    .clk(reg_25_clk),
    .en(reg_25_en),
    .q(reg_25_q),
    .d(reg_25_d)
  );
  AsyncResetReg #(.RESET_VALUE(0)) reg_26 ( 
    .rst(reg_26_rst),
    .clk(reg_26_clk),
    .en(reg_26_en),
    .q(reg_26_q),
    .d(reg_26_d)
  );
  AsyncResetReg #(.RESET_VALUE(0)) reg_27 ( 
    .rst(reg_27_rst),
    .clk(reg_27_clk),
    .en(reg_27_en),
    .q(reg_27_q),
    .d(reg_27_d)
  );
  AsyncResetReg #(.RESET_VALUE(0)) reg_28 ( 
    .rst(reg_28_rst),
    .clk(reg_28_clk),
    .en(reg_28_en),
    .q(reg_28_q),
    .d(reg_28_d)
  );
  AsyncResetReg #(.RESET_VALUE(0)) reg_29 ( 
    .rst(reg_29_rst),
    .clk(reg_29_clk),
    .en(reg_29_en),
    .q(reg_29_q),
    .d(reg_29_d)
  );
  AsyncResetReg #(.RESET_VALUE(0)) reg_30 ( 
    .rst(reg_30_rst),
    .clk(reg_30_clk),
    .en(reg_30_en),
    .q(reg_30_q),
    .d(reg_30_d)
  );
  AsyncResetReg #(.RESET_VALUE(0)) reg_31 ( 
    .rst(reg_31_rst),
    .clk(reg_31_clk),
    .en(reg_31_en),
    .q(reg_31_q),
    .d(reg_31_d)
  );
  assign _T_39 = {reg_1_q,reg_0_q}; 
  assign _T_40 = {reg_3_q,reg_2_q}; 
  assign _T_41 = {_T_40,_T_39}; 
  assign _T_42 = {reg_5_q,reg_4_q}; 
  assign _T_43 = {reg_7_q,reg_6_q}; 
  assign _T_44 = {_T_43,_T_42}; 
  assign _T_45 = {_T_44,_T_41}; 
  assign _T_46 = {reg_9_q,reg_8_q}; 
  assign _T_47 = {reg_11_q,reg_10_q}; 
  assign _T_48 = {_T_47,_T_46}; 
  assign _T_49 = {reg_13_q,reg_12_q}; 
  assign _T_50 = {reg_15_q,reg_14_q}; 
  assign _T_51 = {_T_50,_T_49}; 
  assign _T_52 = {_T_51,_T_48}; 
  assign _T_53 = {_T_52,_T_45}; 
  assign _T_54 = {reg_17_q,reg_16_q}; 
  assign _T_55 = {reg_19_q,reg_18_q}; 
  assign _T_56 = {_T_55,_T_54}; 
  assign _T_57 = {reg_21_q,reg_20_q}; 
  assign _T_58 = {reg_23_q,reg_22_q}; 
  assign _T_59 = {_T_58,_T_57}; 
  assign _T_60 = {_T_59,_T_56}; 
  assign _T_61 = {reg_25_q,reg_24_q}; 
  assign _T_62 = {reg_27_q,reg_26_q}; 
  assign _T_63 = {_T_62,_T_61}; 
  assign _T_64 = {reg_29_q,reg_28_q}; 
  assign _T_65 = {reg_31_q,reg_30_q}; 
  assign _T_66 = {_T_65,_T_64}; 
  assign _T_67 = {_T_66,_T_63}; 
  assign _T_68 = {_T_67,_T_60}; 
  assign io_q = {_T_68,_T_53}; 
  assign reg_0_rst = reset; 
  assign reg_0_clk = clock; 
  assign reg_0_en = 1'h1; 
  assign reg_0_d = io_d[0]; 
  assign reg_1_rst = reset; 
  assign reg_1_clk = clock; 
  assign reg_1_en = 1'h1; 
  assign reg_1_d = io_d[1]; 
  assign reg_2_rst = reset; 
  assign reg_2_clk = clock; 
  assign reg_2_en = 1'h1; 
  assign reg_2_d = io_d[2]; 
  assign reg_3_rst = reset; 
  assign reg_3_clk = clock; 
  assign reg_3_en = 1'h1; 
  assign reg_3_d = io_d[3]; 
  assign reg_4_rst = reset; 
  assign reg_4_clk = clock; 
  assign reg_4_en = 1'h1; 
  assign reg_4_d = io_d[4]; 
  assign reg_5_rst = reset; 
  assign reg_5_clk = clock; 
  assign reg_5_en = 1'h1; 
  assign reg_5_d = io_d[5]; 
  assign reg_6_rst = reset; 
  assign reg_6_clk = clock; 
  assign reg_6_en = 1'h1; 
  assign reg_6_d = io_d[6]; 
  assign reg_7_rst = reset; 
  assign reg_7_clk = clock; 
  assign reg_7_en = 1'h1; 
  assign reg_7_d = io_d[7]; 
  assign reg_8_rst = reset; 
  assign reg_8_clk = clock; 
  assign reg_8_en = 1'h1; 
  assign reg_8_d = io_d[8]; 
  assign reg_9_rst = reset; 
  assign reg_9_clk = clock; 
  assign reg_9_en = 1'h1; 
  assign reg_9_d = io_d[9]; 
  assign reg_10_rst = reset; 
  assign reg_10_clk = clock; 
  assign reg_10_en = 1'h1; 
  assign reg_10_d = io_d[10]; 
  assign reg_11_rst = reset; 
  assign reg_11_clk = clock; 
  assign reg_11_en = 1'h1; 
  assign reg_11_d = io_d[11]; 
  assign reg_12_rst = reset; 
  assign reg_12_clk = clock; 
  assign reg_12_en = 1'h1; 
  assign reg_12_d = io_d[12]; 
  assign reg_13_rst = reset; 
  assign reg_13_clk = clock; 
  assign reg_13_en = 1'h1; 
  assign reg_13_d = io_d[13]; 
  assign reg_14_rst = reset; 
  assign reg_14_clk = clock; 
  assign reg_14_en = 1'h1; 
  assign reg_14_d = io_d[14]; 
  assign reg_15_rst = reset; 
  assign reg_15_clk = clock; 
  assign reg_15_en = 1'h1; 
  assign reg_15_d = io_d[15]; 
  assign reg_16_rst = reset; 
  assign reg_16_clk = clock; 
  assign reg_16_en = 1'h1; 
  assign reg_16_d = io_d[16]; 
  assign reg_17_rst = reset; 
  assign reg_17_clk = clock; 
  assign reg_17_en = 1'h1; 
  assign reg_17_d = io_d[17]; 
  assign reg_18_rst = reset; 
  assign reg_18_clk = clock; 
  assign reg_18_en = 1'h1; 
  assign reg_18_d = io_d[18]; 
  assign reg_19_rst = reset; 
  assign reg_19_clk = clock; 
  assign reg_19_en = 1'h1; 
  assign reg_19_d = io_d[19]; 
  assign reg_20_rst = reset; 
  assign reg_20_clk = clock; 
  assign reg_20_en = 1'h1; 
  assign reg_20_d = io_d[20]; 
  assign reg_21_rst = reset; 
  assign reg_21_clk = clock; 
  assign reg_21_en = 1'h1; 
  assign reg_21_d = io_d[21]; 
  assign reg_22_rst = reset; 
  assign reg_22_clk = clock; 
  assign reg_22_en = 1'h1; 
  assign reg_22_d = io_d[22]; 
  assign reg_23_rst = reset; 
  assign reg_23_clk = clock; 
  assign reg_23_en = 1'h1; 
  assign reg_23_d = io_d[23]; 
  assign reg_24_rst = reset; 
  assign reg_24_clk = clock; 
  assign reg_24_en = 1'h1; 
  assign reg_24_d = io_d[24]; 
  assign reg_25_rst = reset; 
  assign reg_25_clk = clock; 
  assign reg_25_en = 1'h1; 
  assign reg_25_d = io_d[25]; 
  assign reg_26_rst = reset; 
  assign reg_26_clk = clock; 
  assign reg_26_en = 1'h1; 
  assign reg_26_d = io_d[26]; 
  assign reg_27_rst = reset; 
  assign reg_27_clk = clock; 
  assign reg_27_en = 1'h1; 
  assign reg_27_d = io_d[27]; 
  assign reg_28_rst = reset; 
  assign reg_28_clk = clock; 
  assign reg_28_en = 1'h1; 
  assign reg_28_d = io_d[28]; 
  assign reg_29_rst = reset; 
  assign reg_29_clk = clock; 
  assign reg_29_en = 1'h1; 
  assign reg_29_d = io_d[29]; 
  assign reg_30_rst = reset; 
  assign reg_30_clk = clock; 
  assign reg_30_en = 1'h1; 
  assign reg_30_d = io_d[30]; 
  assign reg_31_rst = reset; 
  assign reg_31_clk = clock; 
  assign reg_31_en = 1'h1; 
  assign reg_31_d = io_d[31]; 
endmodule
