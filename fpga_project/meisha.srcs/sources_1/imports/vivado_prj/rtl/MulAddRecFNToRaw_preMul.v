module MulAddRecFNToRaw_preMul( 
  input  [1:0]  io_op, 
  input  [32:0] io_a, 
  input  [32:0] io_b, 
  input  [32:0] io_c, 
  output [23:0] io_mulAddA, 
  output [23:0] io_mulAddB, 
  output [47:0] io_mulAddC, 
  output        io_toPostMul_isSigNaNAny, 
  output        io_toPostMul_isNaNAOrB, 
  output        io_toPostMul_isInfA, 
  output        io_toPostMul_isZeroA, 
  output        io_toPostMul_isInfB, 
  output        io_toPostMul_isZeroB, 
  output        io_toPostMul_signProd, 
  output        io_toPostMul_isNaNC, 
  output        io_toPostMul_isInfC, 
  output        io_toPostMul_isZeroC, 
  output [9:0]  io_toPostMul_sExpSum, 
  output        io_toPostMul_doSubMags, 
  output        io_toPostMul_CIsDominant, 
  output [4:0]  io_toPostMul_CDom_CAlignDist, 
  output [25:0] io_toPostMul_highAlignedSigC, 
  output        io_toPostMul_bit0AlignedSigC 
);
  wire [8:0] _T_12; 
  wire [2:0] _T_13; 
  wire  rawA_isZero; 
  wire [1:0] _T_15; 
  wire  _T_16; 
  wire  _T_18; 
  wire  rawA_isNaN; 
  wire  _T_21; 
  wire  rawA_sign; 
  wire [9:0] rawA_sExp; 
  wire  _T_25; 
  wire [22:0] _T_26; 
  wire [1:0] _T_27; 
  wire [24:0] rawA_sig; 
  wire [8:0] _T_29; 
  wire [2:0] _T_30; 
  wire  rawB_isZero; 
  wire [1:0] _T_32; 
  wire  _T_33; 
  wire  _T_35; 
  wire  rawB_isNaN; 
  wire  _T_38; 
  wire  rawB_sign; 
  wire [9:0] rawB_sExp; 
  wire  _T_42; 
  wire [22:0] _T_43; 
  wire [1:0] _T_44; 
  wire [24:0] rawB_sig; 
  wire [8:0] _T_46; 
  wire [2:0] _T_47; 
  wire  rawC_isZero; 
  wire [1:0] _T_49; 
  wire  _T_50; 
  wire  _T_52; 
  wire  rawC_isNaN; 
  wire  _T_55; 
  wire  rawC_sign; 
  wire [9:0] rawC_sExp; 
  wire  _T_59; 
  wire [22:0] _T_60; 
  wire [1:0] _T_61; 
  wire [24:0] rawC_sig; 
  wire  _T_63; 
  wire  _T_64; 
  wire  signProd; 
  wire [10:0] _T_65; 
  wire [10:0] _T_67; 
  wire [10:0] sExpAlignedProd; 
  wire  _T_68; 
  wire  _T_69; 
  wire  doSubMags; 
  wire [10:0] _GEN_0; 
  wire [10:0] _T_71; 
  wire [10:0] sNatCAlignDist; 
  wire [9:0] posNatCAlignDist; 
  wire  _T_72; 
  wire  _T_73; 
  wire  isMinCAlign; 
  wire  _T_75; 
  wire  _T_76; 
  wire  CIsDominant; 
  wire  _T_77; 
  wire [6:0] _T_78; 
  wire [6:0] _T_79; 
  wire [6:0] CAlignDist; 
  wire [24:0] _T_80; 
  wire [24:0] _T_81; 
  wire [52:0] _T_83; 
  wire [77:0] _T_84; 
  wire [77:0] _T_85; 
  wire [77:0] mainAlignedSigC; 
  wire [26:0] _GEN_1; 
  wire [26:0] _T_86; 
  wire [3:0] _T_100; 
  wire  _T_101; 
  wire [3:0] _T_102; 
  wire  _T_103; 
  wire [3:0] _T_104; 
  wire  _T_105; 
  wire [3:0] _T_106; 
  wire  _T_107; 
  wire [3:0] _T_108; 
  wire  _T_109; 
  wire [3:0] _T_110; 
  wire  _T_111; 
  wire [2:0] _T_112; 
  wire  _T_113; 
  wire [1:0] _T_114; 
  wire [2:0] _T_115; 
  wire [1:0] _T_116; 
  wire [1:0] _T_117; 
  wire [3:0] _T_118; 
  wire [6:0] _T_119; 
  wire [4:0] _T_120; 
  wire [32:0] _T_121; 
  wire [5:0] _T_122; 
  wire [3:0] _T_123; 
  wire [1:0] _T_124; 
  wire  _T_125; 
  wire  _T_126; 
  wire [1:0] _T_127; 
  wire [1:0] _T_128; 
  wire  _T_129; 
  wire  _T_130; 
  wire [1:0] _T_131; 
  wire [3:0] _T_132; 
  wire [1:0] _T_133; 
  wire  _T_134; 
  wire  _T_135; 
  wire [1:0] _T_136; 
  wire [5:0] _T_137; 
  wire [6:0] _GEN_2; 
  wire [6:0] _T_138; 
  wire  reduced4CExtra; 
  wire [74:0] _T_139; 
  wire [2:0] _T_140; 
  wire [2:0] _T_141; 
  wire  _T_142; 
  wire  _T_143; 
  wire  _T_144; 
  wire  _T_146; 
  wire  _T_147; 
  wire  _T_148; 
  wire [74:0] _T_149; 
  wire [75:0] alignedSigC; 
  wire  _T_151; 
  wire  _T_152; 
  wire  _T_153; 
  wire  _T_154; 
  wire  _T_155; 
  wire  _T_156; 
  wire  _T_157; 
  wire  _T_158; 
  wire  _T_159; 
  wire  _T_160; 
  wire [10:0] _T_164; 
  wire [10:0] _T_165; 
  wire [10:0] _T_166; 
  wire [9:0] _GEN_3; 
  assign _T_12 = io_a[31:23]; 
  assign _T_13 = _T_12[8:6]; 
  assign rawA_isZero = _T_13 == 3'h0; 
  assign _T_15 = _T_12[8:7]; 
  assign _T_16 = _T_15 == 2'h3; 
  assign _T_18 = _T_12[6]; 
  assign rawA_isNaN = _T_16 & _T_18; 
  assign _T_21 = _T_18 == 1'h0; 
  assign rawA_sign = io_a[32]; 
  assign rawA_sExp = {1'b0,$signed(_T_12)}; 
  assign _T_25 = rawA_isZero == 1'h0; 
  assign _T_26 = io_a[22:0]; 
  assign _T_27 = {1'h0,_T_25}; 
  assign rawA_sig = {_T_27,_T_26}; 
  assign _T_29 = io_b[31:23]; 
  assign _T_30 = _T_29[8:6]; 
  assign rawB_isZero = _T_30 == 3'h0; 
  assign _T_32 = _T_29[8:7]; 
  assign _T_33 = _T_32 == 2'h3; 
  assign _T_35 = _T_29[6]; 
  assign rawB_isNaN = _T_33 & _T_35; 
  assign _T_38 = _T_35 == 1'h0; 
  assign rawB_sign = io_b[32]; 
  assign rawB_sExp = {1'b0,$signed(_T_29)}; 
  assign _T_42 = rawB_isZero == 1'h0; 
  assign _T_43 = io_b[22:0]; 
  assign _T_44 = {1'h0,_T_42}; 
  assign rawB_sig = {_T_44,_T_43}; 
  assign _T_46 = io_c[31:23]; 
  assign _T_47 = _T_46[8:6]; 
  assign rawC_isZero = _T_47 == 3'h0; 
  assign _T_49 = _T_46[8:7]; 
  assign _T_50 = _T_49 == 2'h3; 
  assign _T_52 = _T_46[6]; 
  assign rawC_isNaN = _T_50 & _T_52; 
  assign _T_55 = _T_52 == 1'h0; 
  assign rawC_sign = io_c[32]; 
  assign rawC_sExp = {1'b0,$signed(_T_46)}; 
  assign _T_59 = rawC_isZero == 1'h0; 
  assign _T_60 = io_c[22:0]; 
  assign _T_61 = {1'h0,_T_59}; 
  assign rawC_sig = {_T_61,_T_60}; 
  assign _T_63 = rawA_sign ^ rawB_sign; 
  assign _T_64 = io_op[1]; 
  assign signProd = _T_63 ^ _T_64; 
  assign _T_65 = $signed(rawA_sExp) + $signed(rawB_sExp); 
  assign _T_67 = $signed(_T_65) + $signed(-11'she5); 
  assign sExpAlignedProd = $signed(_T_67); 
  assign _T_68 = signProd ^ rawC_sign; 
  assign _T_69 = io_op[0]; 
  assign doSubMags = _T_68 ^ _T_69; 
  assign _GEN_0 = {{1{rawC_sExp[9]}},rawC_sExp}; 
  assign _T_71 = $signed(sExpAlignedProd) - $signed(_GEN_0); 
  assign sNatCAlignDist = $signed(_T_71); 
  assign posNatCAlignDist = sNatCAlignDist[9:0]; 
  assign _T_72 = rawA_isZero | rawB_isZero; 
  assign _T_73 = $signed(sNatCAlignDist) < $signed(11'sh0); 
  assign isMinCAlign = _T_72 | _T_73; 
  assign _T_75 = posNatCAlignDist <= 10'h18; 
  assign _T_76 = isMinCAlign | _T_75; 
  assign CIsDominant = _T_59 & _T_76; 
  assign _T_77 = posNatCAlignDist < 10'h4a; 
  assign _T_78 = posNatCAlignDist[6:0]; 
  assign _T_79 = _T_77 ? _T_78 : 7'h4a; 
  assign CAlignDist = isMinCAlign ? 7'h0 : _T_79; 
  assign _T_80 = ~ rawC_sig; 
  assign _T_81 = doSubMags ? _T_80 : rawC_sig; 
  assign _T_83 = doSubMags ? 53'h1fffffffffffff : 53'h0; 
  assign _T_84 = {_T_81,_T_83}; 
  assign _T_85 = $signed(_T_84); 
  assign mainAlignedSigC = $signed(_T_85) >>> CAlignDist; 
  assign _GEN_1 = {{2'd0}, rawC_sig}; 
  assign _T_86 = _GEN_1 << 2; 
  assign _T_100 = _T_86[3:0]; 
  assign _T_101 = _T_100 != 4'h0; 
  assign _T_102 = _T_86[7:4]; 
  assign _T_103 = _T_102 != 4'h0; 
  assign _T_104 = _T_86[11:8]; 
  assign _T_105 = _T_104 != 4'h0; 
  assign _T_106 = _T_86[15:12]; 
  assign _T_107 = _T_106 != 4'h0; 
  assign _T_108 = _T_86[19:16]; 
  assign _T_109 = _T_108 != 4'h0; 
  assign _T_110 = _T_86[23:20]; 
  assign _T_111 = _T_110 != 4'h0; 
  assign _T_112 = _T_86[26:24]; 
  assign _T_113 = _T_112 != 3'h0; 
  assign _T_114 = {_T_105,_T_103}; 
  assign _T_115 = {_T_114,_T_101}; 
  assign _T_116 = {_T_109,_T_107}; 
  assign _T_117 = {_T_113,_T_111}; 
  assign _T_118 = {_T_117,_T_116}; 
  assign _T_119 = {_T_118,_T_115}; 
  assign _T_120 = CAlignDist[6:2]; 
  assign _T_121 = $signed(-33'sh100000000) >>> _T_120; 
  assign _T_122 = _T_121[19:14]; 
  assign _T_123 = _T_122[3:0]; 
  assign _T_124 = _T_123[1:0]; 
  assign _T_125 = _T_124[0]; 
  assign _T_126 = _T_124[1]; 
  assign _T_127 = {_T_125,_T_126}; 
  assign _T_128 = _T_123[3:2]; 
  assign _T_129 = _T_128[0]; 
  assign _T_130 = _T_128[1]; 
  assign _T_131 = {_T_129,_T_130}; 
  assign _T_132 = {_T_127,_T_131}; 
  assign _T_133 = _T_122[5:4]; 
  assign _T_134 = _T_133[0]; 
  assign _T_135 = _T_133[1]; 
  assign _T_136 = {_T_134,_T_135}; 
  assign _T_137 = {_T_132,_T_136}; 
  assign _GEN_2 = {{1'd0}, _T_137}; 
  assign _T_138 = _T_119 & _GEN_2; 
  assign reduced4CExtra = _T_138 != 7'h0; 
  assign _T_139 = mainAlignedSigC[77:3]; 
  assign _T_140 = mainAlignedSigC[2:0]; 
  assign _T_141 = ~ _T_140; 
  assign _T_142 = _T_141 == 3'h0; 
  assign _T_143 = reduced4CExtra == 1'h0; 
  assign _T_144 = _T_142 & _T_143; 
  assign _T_146 = _T_140 != 3'h0; 
  assign _T_147 = _T_146 | reduced4CExtra; 
  assign _T_148 = doSubMags ? _T_144 : _T_147; 
  assign _T_149 = $unsigned(_T_139); 
  assign alignedSigC = {_T_149,_T_148}; 
  assign _T_151 = rawA_sig[22]; 
  assign _T_152 = _T_151 == 1'h0; 
  assign _T_153 = rawA_isNaN & _T_152; 
  assign _T_154 = rawB_sig[22]; 
  assign _T_155 = _T_154 == 1'h0; 
  assign _T_156 = rawB_isNaN & _T_155; 
  assign _T_157 = _T_153 | _T_156; 
  assign _T_158 = rawC_sig[22]; 
  assign _T_159 = _T_158 == 1'h0; 
  assign _T_160 = rawC_isNaN & _T_159; 
  assign _T_164 = $signed(sExpAlignedProd) - $signed(11'sh18); 
  assign _T_165 = $signed(_T_164); 
  assign _T_166 = CIsDominant ? $signed({{1{rawC_sExp[9]}},rawC_sExp}) : $signed(_T_165); 
  assign io_mulAddA = rawA_sig[23:0]; 
  assign io_mulAddB = rawB_sig[23:0]; 
  assign io_mulAddC = alignedSigC[48:1]; 
  assign io_toPostMul_isSigNaNAny = _T_157 | _T_160; 
  assign io_toPostMul_isNaNAOrB = rawA_isNaN | rawB_isNaN; 
  assign io_toPostMul_isInfA = _T_16 & _T_21; 
  assign io_toPostMul_isZeroA = _T_13 == 3'h0; 
  assign io_toPostMul_isInfB = _T_33 & _T_38; 
  assign io_toPostMul_isZeroB = _T_30 == 3'h0; 
  assign io_toPostMul_signProd = _T_63 ^ _T_64; 
  assign io_toPostMul_isNaNC = _T_50 & _T_52; 
  assign io_toPostMul_isInfC = _T_50 & _T_55; 
  assign io_toPostMul_isZeroC = _T_47 == 3'h0; 
  assign _GEN_3 = _T_166[9:0]; 
  assign io_toPostMul_sExpSum = $signed(_GEN_3); 
  assign io_toPostMul_doSubMags = _T_68 ^ _T_69; 
  assign io_toPostMul_CIsDominant = _T_59 & _T_76; 
  assign io_toPostMul_CDom_CAlignDist = CAlignDist[4:0]; 
  assign io_toPostMul_highAlignedSigC = alignedSigC[74:49]; 
  assign io_toPostMul_bit0AlignedSigC = alignedSigC[0]; 
endmodule
