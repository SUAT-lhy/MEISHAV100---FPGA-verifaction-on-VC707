module CaptureUpdateChain( 
  input        clock, 
  input        reset, 
  input        io_chainIn_shift, 
  input        io_chainIn_data, 
  input        io_chainIn_capture, 
  input        io_chainIn_update, 
  output       io_chainOut_data, 
  input  [1:0] io_capture_bits_dmiStatus, 
  output       io_update_valid, 
  output       io_update_bits_dmireset 
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
  wire [1:0] _T_45; 
  wire [1:0] _T_46; 
  wire [3:0] _T_47; 
  wire [1:0] _T_48; 
  wire [1:0] _T_49; 
  wire [3:0] _T_50; 
  wire [7:0] _T_51; 
  wire [1:0] _T_52; 
  wire [1:0] _T_53; 
  wire [3:0] _T_54; 
  wire [1:0] _T_55; 
  wire [1:0] _T_56; 
  wire [3:0] _T_57; 
  wire [7:0] _T_58; 
  wire [15:0] _T_59; 
  wire [1:0] _T_60; 
  wire [1:0] _T_61; 
  wire [3:0] _T_62; 
  wire [1:0] _T_63; 
  wire [1:0] _T_64; 
  wire [3:0] _T_65; 
  wire [7:0] _T_66; 
  wire [1:0] _T_67; 
  wire [1:0] _T_68; 
  wire [3:0] _T_69; 
  wire [1:0] _T_70; 
  wire [1:0] _T_71; 
  wire [3:0] _T_72; 
  wire [7:0] _T_73; 
  wire [15:0] _T_74; 
  wire [31:0] updateBits; 
  wire [7:0] _T_87; 
  wire [11:0] _T_88; 
  wire [31:0] captureBits; 
  wire  _T_92; 
  wire  _T_93; 
  wire  _T_94; 
  wire  _T_95; 
  wire  _T_96; 
  wire  _T_97; 
  wire  _T_98; 
  wire  _T_99; 
  wire  _T_100; 
  wire  _T_101; 
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
  wire  _T_133; 
  wire  _T_134; 
  assign _T_45 = {regs_1,regs_0}; 
  assign _T_46 = {regs_3,regs_2}; 
  assign _T_47 = {_T_46,_T_45}; 
  assign _T_48 = {regs_5,regs_4}; 
  assign _T_49 = {regs_7,regs_6}; 
  assign _T_50 = {_T_49,_T_48}; 
  assign _T_51 = {_T_50,_T_47}; 
  assign _T_52 = {regs_9,regs_8}; 
  assign _T_53 = {regs_11,regs_10}; 
  assign _T_54 = {_T_53,_T_52}; 
  assign _T_55 = {regs_13,regs_12}; 
  assign _T_56 = {regs_15,regs_14}; 
  assign _T_57 = {_T_56,_T_55}; 
  assign _T_58 = {_T_57,_T_54}; 
  assign _T_59 = {_T_58,_T_51}; 
  assign _T_60 = {regs_17,regs_16}; 
  assign _T_61 = {regs_19,regs_18}; 
  assign _T_62 = {_T_61,_T_60}; 
  assign _T_63 = {regs_21,regs_20}; 
  assign _T_64 = {regs_23,regs_22}; 
  assign _T_65 = {_T_64,_T_63}; 
  assign _T_66 = {_T_65,_T_62}; 
  assign _T_67 = {regs_25,regs_24}; 
  assign _T_68 = {regs_27,regs_26}; 
  assign _T_69 = {_T_68,_T_67}; 
  assign _T_70 = {regs_29,regs_28}; 
  assign _T_71 = {regs_31,regs_30}; 
  assign _T_72 = {_T_71,_T_70}; 
  assign _T_73 = {_T_72,_T_69}; 
  assign _T_74 = {_T_73,_T_66}; 
  assign updateBits = {_T_74,_T_59}; 
  assign _T_87 = {io_capture_bits_dmiStatus,6'h7}; 
  assign _T_88 = {_T_87,4'h1}; 
  assign captureBits = {20'h5,_T_88}; 
  assign _T_92 = captureBits[0]; 
  assign _T_93 = captureBits[1]; 
  assign _T_94 = captureBits[2]; 
  assign _T_95 = captureBits[3]; 
  assign _T_96 = captureBits[4]; 
  assign _T_97 = captureBits[5]; 
  assign _T_98 = captureBits[6]; 
  assign _T_99 = captureBits[7]; 
  assign _T_100 = captureBits[8]; 
  assign _T_101 = captureBits[9]; 
  assign _T_102 = captureBits[10]; 
  assign _T_103 = captureBits[11]; 
  assign _T_104 = captureBits[12]; 
  assign _T_105 = captureBits[13]; 
  assign _T_106 = captureBits[14]; 
  assign _T_107 = captureBits[15]; 
  assign _T_108 = captureBits[16]; 
  assign _T_109 = captureBits[17]; 
  assign _T_110 = captureBits[18]; 
  assign _T_111 = captureBits[19]; 
  assign _T_112 = captureBits[20]; 
  assign _T_113 = captureBits[21]; 
  assign _T_114 = captureBits[22]; 
  assign _T_115 = captureBits[23]; 
  assign _T_116 = captureBits[24]; 
  assign _T_117 = captureBits[25]; 
  assign _T_118 = captureBits[26]; 
  assign _T_119 = captureBits[27]; 
  assign _T_120 = captureBits[28]; 
  assign _T_121 = captureBits[29]; 
  assign _T_122 = captureBits[30]; 
  assign _T_123 = captureBits[31]; 
  assign _T_124 = io_chainIn_capture & io_chainIn_update; 
  assign _T_125 = _T_124 == 1'h0; 
  assign _T_126 = io_chainIn_capture & io_chainIn_shift; 
  assign _T_127 = _T_126 == 1'h0; 
  assign _T_128 = _T_125 & _T_127; 
  assign _T_129 = io_chainIn_update & io_chainIn_shift; 
  assign _T_130 = _T_129 == 1'h0; 
  assign _T_131 = _T_128 & _T_130; 
  assign _T_133 = _T_131 | reset; 
  assign _T_134 = _T_133 == 1'h0; 
  assign io_chainOut_data = regs_0; 
  assign io_update_valid = io_chainIn_capture ? 1'h0 : io_chainIn_update; 
  assign io_update_bits_dmireset = updateBits[16]; 
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
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (io_chainIn_capture) begin
      regs_0 <= _T_92;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_0 <= regs_1;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_1 <= _T_93;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_1 <= regs_2;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_2 <= _T_94;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_2 <= regs_3;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_3 <= _T_95;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_3 <= regs_4;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_4 <= _T_96;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_4 <= regs_5;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_5 <= _T_97;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_5 <= regs_6;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_6 <= _T_98;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_6 <= regs_7;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_7 <= _T_99;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_7 <= regs_8;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_8 <= _T_100;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_8 <= regs_9;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_9 <= _T_101;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_9 <= regs_10;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_10 <= _T_102;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_10 <= regs_11;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_11 <= _T_103;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_11 <= regs_12;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_12 <= _T_104;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_12 <= regs_13;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_13 <= _T_105;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_13 <= regs_14;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_14 <= _T_106;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_14 <= regs_15;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_15 <= _T_107;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_15 <= regs_16;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_16 <= _T_108;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_16 <= regs_17;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_17 <= _T_109;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_17 <= regs_18;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_18 <= _T_110;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_18 <= regs_19;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_19 <= _T_111;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_19 <= regs_20;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_20 <= _T_112;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_20 <= regs_21;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_21 <= _T_113;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_21 <= regs_22;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_22 <= _T_114;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_22 <= regs_23;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_23 <= _T_115;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_23 <= regs_24;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_24 <= _T_116;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_24 <= regs_25;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_25 <= _T_117;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_25 <= regs_26;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_26 <= _T_118;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_26 <= regs_27;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_27 <= _T_119;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_27 <= regs_28;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_28 <= _T_120;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_28 <= regs_29;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_29 <= _T_121;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_29 <= regs_30;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_30 <= _T_122;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_30 <= regs_31;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_31 <= _T_123;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_31 <= io_chainIn_data;
        end
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_134) begin
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
        if (_T_134) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
