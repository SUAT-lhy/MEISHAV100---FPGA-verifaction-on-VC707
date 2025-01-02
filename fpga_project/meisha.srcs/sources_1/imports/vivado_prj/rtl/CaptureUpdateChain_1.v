module CaptureUpdateChain_1( 
  input         clock, 
  input         reset, 
  input         io_chainIn_shift, 
  input         io_chainIn_data, 
  input         io_chainIn_capture, 
  input         io_chainIn_update, 
  output        io_chainOut_data, 
  input  [6:0]  io_capture_bits_addr, 
  input  [31:0] io_capture_bits_data, 
  input  [1:0]  io_capture_bits_resp, 
  output        io_capture_capture, 
  output        io_update_valid, 
  output [6:0]  io_update_bits_addr, 
  output [31:0] io_update_bits_data, 
  output [1:0]  io_update_bits_op 
);
  reg  regs_0; 
  reg [31:0] _RAND_0;
  reg  regs_1; 
  reg [31:0] _RAND_1;
  reg  regs_2; 
  reg [31:0] _RAND_2;
  reg  regs_3; 
  reg [31:0] _RAND_3;
  reg  regs_4; 
  reg [31:0] _RAND_4;
  reg  regs_5; 
  reg [31:0] _RAND_5;
  reg  regs_6; 
  reg [31:0] _RAND_6;
  reg  regs_7; 
  reg [31:0] _RAND_7;
  reg  regs_8; 
  reg [31:0] _RAND_8;
  reg  regs_9; 
  reg [31:0] _RAND_9;
  reg  regs_10; 
  reg [31:0] _RAND_10;
  reg  regs_11; 
  reg [31:0] _RAND_11;
  reg  regs_12; 
  reg [31:0] _RAND_12;
  reg  regs_13; 
  reg [31:0] _RAND_13;
  reg  regs_14; 
  reg [31:0] _RAND_14;
  reg  regs_15; 
  reg [31:0] _RAND_15;
  reg  regs_16; 
  reg [31:0] _RAND_16;
  reg  regs_17; 
  reg [31:0] _RAND_17;
  reg  regs_18; 
  reg [31:0] _RAND_18;
  reg  regs_19; 
  reg [31:0] _RAND_19;
  reg  regs_20; 
  reg [31:0] _RAND_20;
  reg  regs_21; 
  reg [31:0] _RAND_21;
  reg  regs_22; 
  reg [31:0] _RAND_22;
  reg  regs_23; 
  reg [31:0] _RAND_23;
  reg  regs_24; 
  reg [31:0] _RAND_24;
  reg  regs_25; 
  reg [31:0] _RAND_25;
  reg  regs_26; 
  reg [31:0] _RAND_26;
  reg  regs_27; 
  reg [31:0] _RAND_27;
  reg  regs_28; 
  reg [31:0] _RAND_28;
  reg  regs_29; 
  reg [31:0] _RAND_29;
  reg  regs_30; 
  reg [31:0] _RAND_30;
  reg  regs_31; 
  reg [31:0] _RAND_31;
  reg  regs_32; 
  reg [31:0] _RAND_32;
  reg  regs_33; 
  reg [31:0] _RAND_33;
  reg  regs_34; 
  reg [31:0] _RAND_34;
  reg  regs_35; 
  reg [31:0] _RAND_35;
  reg  regs_36; 
  reg [31:0] _RAND_36;
  reg  regs_37; 
  reg [31:0] _RAND_37;
  reg  regs_38; 
  reg [31:0] _RAND_38;
  reg  regs_39; 
  reg [31:0] _RAND_39;
  reg  regs_40; 
  reg [31:0] _RAND_40;
  wire [1:0] _T_54; 
  wire [1:0] _T_55; 
  wire [2:0] _T_56; 
  wire [4:0] _T_57; 
  wire [1:0] _T_58; 
  wire [1:0] _T_59; 
  wire [2:0] _T_60; 
  wire [4:0] _T_61; 
  wire [9:0] _T_62; 
  wire [1:0] _T_63; 
  wire [1:0] _T_64; 
  wire [2:0] _T_65; 
  wire [4:0] _T_66; 
  wire [1:0] _T_67; 
  wire [1:0] _T_68; 
  wire [2:0] _T_69; 
  wire [4:0] _T_70; 
  wire [9:0] _T_71; 
  wire [19:0] _T_72; 
  wire [1:0] _T_73; 
  wire [1:0] _T_74; 
  wire [2:0] _T_75; 
  wire [4:0] _T_76; 
  wire [1:0] _T_77; 
  wire [1:0] _T_78; 
  wire [2:0] _T_79; 
  wire [4:0] _T_80; 
  wire [9:0] _T_81; 
  wire [1:0] _T_82; 
  wire [1:0] _T_83; 
  wire [2:0] _T_84; 
  wire [4:0] _T_85; 
  wire [1:0] _T_86; 
  wire [2:0] _T_87; 
  wire [1:0] _T_88; 
  wire [2:0] _T_89; 
  wire [5:0] _T_90; 
  wire [10:0] _T_91; 
  wire [20:0] _T_92; 
  wire [40:0] updateBits; 
  wire [38:0] _T_101; 
  wire [40:0] captureBits; 
  wire  _T_102; 
  wire  _T_103; 
  wire  _T_104; 
  wire  _T_105; 
  wire  _T_106; 
  wire  _T_107; 
  wire  _T_108; 
  wire  _T_109; 
  wire  _T_110; 
  wire  _T_111; 
  wire  _T_112; 
  wire  _T_113; 
  wire  _T_114; 
  wire  _T_115; 
  wire  _T_116; 
  wire  _T_117; 
  wire  _T_118; 
  wire  _T_119; 
  wire  _T_120; 
  wire  _T_121; 
  wire  _T_122; 
  wire  _T_123; 
  wire  _T_124; 
  wire  _T_125; 
  wire  _T_126; 
  wire  _T_127; 
  wire  _T_128; 
  wire  _T_129; 
  wire  _T_130; 
  wire  _T_131; 
  wire  _T_132; 
  wire  _T_133; 
  wire  _T_134; 
  wire  _T_135; 
  wire  _T_136; 
  wire  _T_137; 
  wire  _T_138; 
  wire  _T_139; 
  wire  _T_140; 
  wire  _T_141; 
  wire  _T_142; 
  wire  _T_143; 
  wire  _T_144; 
  wire  _T_145; 
  wire  _T_146; 
  wire  _T_147; 
  wire  _T_148; 
  wire  _T_149; 
  wire  _T_150; 
  wire  _T_152; 
  wire  _T_153; 
  assign _T_54 = {regs_1,regs_0}; 
  assign _T_55 = {regs_4,regs_3}; 
  assign _T_56 = {_T_55,regs_2}; 
  assign _T_57 = {_T_56,_T_54}; 
  assign _T_58 = {regs_6,regs_5}; 
  assign _T_59 = {regs_9,regs_8}; 
  assign _T_60 = {_T_59,regs_7}; 
  assign _T_61 = {_T_60,_T_58}; 
  assign _T_62 = {_T_61,_T_57}; 
  assign _T_63 = {regs_11,regs_10}; 
  assign _T_64 = {regs_14,regs_13}; 
  assign _T_65 = {_T_64,regs_12}; 
  assign _T_66 = {_T_65,_T_63}; 
  assign _T_67 = {regs_16,regs_15}; 
  assign _T_68 = {regs_19,regs_18}; 
  assign _T_69 = {_T_68,regs_17}; 
  assign _T_70 = {_T_69,_T_67}; 
  assign _T_71 = {_T_70,_T_66}; 
  assign _T_72 = {_T_71,_T_62}; 
  assign _T_73 = {regs_21,regs_20}; 
  assign _T_74 = {regs_24,regs_23}; 
  assign _T_75 = {_T_74,regs_22}; 
  assign _T_76 = {_T_75,_T_73}; 
  assign _T_77 = {regs_26,regs_25}; 
  assign _T_78 = {regs_29,regs_28}; 
  assign _T_79 = {_T_78,regs_27}; 
  assign _T_80 = {_T_79,_T_77}; 
  assign _T_81 = {_T_80,_T_76}; 
  assign _T_82 = {regs_31,regs_30}; 
  assign _T_83 = {regs_34,regs_33}; 
  assign _T_84 = {_T_83,regs_32}; 
  assign _T_85 = {_T_84,_T_82}; 
  assign _T_86 = {regs_37,regs_36}; 
  assign _T_87 = {_T_86,regs_35}; 
  assign _T_88 = {regs_40,regs_39}; 
  assign _T_89 = {_T_88,regs_38}; 
  assign _T_90 = {_T_89,_T_87}; 
  assign _T_91 = {_T_90,_T_85}; 
  assign _T_92 = {_T_91,_T_81}; 
  assign updateBits = {_T_92,_T_72}; 
  assign _T_101 = {io_capture_bits_addr,io_capture_bits_data}; 
  assign captureBits = {_T_101,io_capture_bits_resp}; 
  assign _T_102 = captureBits[0]; 
  assign _T_103 = captureBits[1]; 
  assign _T_104 = captureBits[2]; 
  assign _T_105 = captureBits[3]; 
  assign _T_106 = captureBits[4]; 
  assign _T_107 = captureBits[5]; 
  assign _T_108 = captureBits[6]; 
  assign _T_109 = captureBits[7]; 
  assign _T_110 = captureBits[8]; 
  assign _T_111 = captureBits[9]; 
  assign _T_112 = captureBits[10]; 
  assign _T_113 = captureBits[11]; 
  assign _T_114 = captureBits[12]; 
  assign _T_115 = captureBits[13]; 
  assign _T_116 = captureBits[14]; 
  assign _T_117 = captureBits[15]; 
  assign _T_118 = captureBits[16]; 
  assign _T_119 = captureBits[17]; 
  assign _T_120 = captureBits[18]; 
  assign _T_121 = captureBits[19]; 
  assign _T_122 = captureBits[20]; 
  assign _T_123 = captureBits[21]; 
  assign _T_124 = captureBits[22]; 
  assign _T_125 = captureBits[23]; 
  assign _T_126 = captureBits[24]; 
  assign _T_127 = captureBits[25]; 
  assign _T_128 = captureBits[26]; 
  assign _T_129 = captureBits[27]; 
  assign _T_130 = captureBits[28]; 
  assign _T_131 = captureBits[29]; 
  assign _T_132 = captureBits[30]; 
  assign _T_133 = captureBits[31]; 
  assign _T_134 = captureBits[32]; 
  assign _T_135 = captureBits[33]; 
  assign _T_136 = captureBits[34]; 
  assign _T_137 = captureBits[35]; 
  assign _T_138 = captureBits[36]; 
  assign _T_139 = captureBits[37]; 
  assign _T_140 = captureBits[38]; 
  assign _T_141 = captureBits[39]; 
  assign _T_142 = captureBits[40]; 
  assign _T_143 = io_chainIn_capture & io_chainIn_update; 
  assign _T_144 = _T_143 == 1'h0; 
  assign _T_145 = io_chainIn_capture & io_chainIn_shift; 
  assign _T_146 = _T_145 == 1'h0; 
  assign _T_147 = _T_144 & _T_146; 
  assign _T_148 = io_chainIn_update & io_chainIn_shift; 
  assign _T_149 = _T_148 == 1'h0; 
  assign _T_150 = _T_147 & _T_149; 
  assign _T_152 = _T_150 | reset; 
  assign _T_153 = _T_152 == 1'h0; 
  assign io_chainOut_data = regs_0; 
  assign io_capture_capture = io_chainIn_capture; 
  assign io_update_valid = io_chainIn_capture ? 1'h0 : io_chainIn_update; 
  assign io_update_bits_addr = updateBits[40:34]; 
  assign io_update_bits_data = updateBits[33:2]; 
  assign io_update_bits_op = updateBits[1:0]; 
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  regs_0 = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  regs_1 = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  regs_2 = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  regs_3 = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  regs_4 = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  regs_5 = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  regs_6 = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  regs_7 = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  regs_8 = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  regs_9 = _RAND_9[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  regs_10 = _RAND_10[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  regs_11 = _RAND_11[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  regs_12 = _RAND_12[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  regs_13 = _RAND_13[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  regs_14 = _RAND_14[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  regs_15 = _RAND_15[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{`RANDOM}};
  regs_16 = _RAND_16[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{`RANDOM}};
  regs_17 = _RAND_17[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{`RANDOM}};
  regs_18 = _RAND_18[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{`RANDOM}};
  regs_19 = _RAND_19[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{`RANDOM}};
  regs_20 = _RAND_20[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_21 = {1{`RANDOM}};
  regs_21 = _RAND_21[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_22 = {1{`RANDOM}};
  regs_22 = _RAND_22[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_23 = {1{`RANDOM}};
  regs_23 = _RAND_23[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_24 = {1{`RANDOM}};
  regs_24 = _RAND_24[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_25 = {1{`RANDOM}};
  regs_25 = _RAND_25[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_26 = {1{`RANDOM}};
  regs_26 = _RAND_26[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_27 = {1{`RANDOM}};
  regs_27 = _RAND_27[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_28 = {1{`RANDOM}};
  regs_28 = _RAND_28[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_29 = {1{`RANDOM}};
  regs_29 = _RAND_29[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_30 = {1{`RANDOM}};
  regs_30 = _RAND_30[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_31 = {1{`RANDOM}};
  regs_31 = _RAND_31[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_32 = {1{`RANDOM}};
  regs_32 = _RAND_32[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_33 = {1{`RANDOM}};
  regs_33 = _RAND_33[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_34 = {1{`RANDOM}};
  regs_34 = _RAND_34[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_35 = {1{`RANDOM}};
  regs_35 = _RAND_35[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_36 = {1{`RANDOM}};
  regs_36 = _RAND_36[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_37 = {1{`RANDOM}};
  regs_37 = _RAND_37[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_38 = {1{`RANDOM}};
  regs_38 = _RAND_38[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_39 = {1{`RANDOM}};
  regs_39 = _RAND_39[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_40 = {1{`RANDOM}};
  regs_40 = _RAND_40[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (io_chainIn_capture) begin
      regs_0 <= _T_102;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_0 <= regs_1;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_1 <= _T_103;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_1 <= regs_2;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_2 <= _T_104;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_2 <= regs_3;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_3 <= _T_105;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_3 <= regs_4;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_4 <= _T_106;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_4 <= regs_5;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_5 <= _T_107;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_5 <= regs_6;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_6 <= _T_108;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_6 <= regs_7;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_7 <= _T_109;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_7 <= regs_8;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_8 <= _T_110;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_8 <= regs_9;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_9 <= _T_111;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_9 <= regs_10;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_10 <= _T_112;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_10 <= regs_11;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_11 <= _T_113;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_11 <= regs_12;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_12 <= _T_114;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_12 <= regs_13;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_13 <= _T_115;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_13 <= regs_14;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_14 <= _T_116;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_14 <= regs_15;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_15 <= _T_117;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_15 <= regs_16;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_16 <= _T_118;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_16 <= regs_17;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_17 <= _T_119;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_17 <= regs_18;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_18 <= _T_120;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_18 <= regs_19;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_19 <= _T_121;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_19 <= regs_20;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_20 <= _T_122;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_20 <= regs_21;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_21 <= _T_123;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_21 <= regs_22;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_22 <= _T_124;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_22 <= regs_23;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_23 <= _T_125;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_23 <= regs_24;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_24 <= _T_126;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_24 <= regs_25;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_25 <= _T_127;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_25 <= regs_26;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_26 <= _T_128;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_26 <= regs_27;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_27 <= _T_129;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_27 <= regs_28;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_28 <= _T_130;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_28 <= regs_29;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_29 <= _T_131;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_29 <= regs_30;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_30 <= _T_132;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_30 <= regs_31;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_31 <= _T_133;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_31 <= regs_32;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_32 <= _T_134;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_32 <= regs_33;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_33 <= _T_135;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_33 <= regs_34;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_34 <= _T_136;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_34 <= regs_35;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_35 <= _T_137;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_35 <= regs_36;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_36 <= _T_138;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_36 <= regs_37;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_37 <= _T_139;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_37 <= regs_38;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_38 <= _T_140;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_38 <= regs_39;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_39 <= _T_141;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_39 <= regs_40;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_40 <= _T_142;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_40 <= io_chainIn_data;
        end
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_153) begin
          $fwrite(32'h80000002,"Assertion failed\n    at JtagShifter.scala:185 assert(!(io.chainIn.capture && io.chainIn.update)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_153) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
