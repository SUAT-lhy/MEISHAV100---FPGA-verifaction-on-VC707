module FPToInt( 
  input         clock, 
  input         io_in_valid, 
  input         io_in_bits_ren2, 
  input         io_in_bits_singleIn, 
  input         io_in_bits_singleOut, 
  input         io_in_bits_wflags, 
  input  [2:0]  io_in_bits_rm, 
  input  [1:0]  io_in_bits_typ, 
  input  [64:0] io_in_bits_in1, 
  input  [64:0] io_in_bits_in2, 
  output [2:0]  io_out_bits_in_rm, 
  output [64:0] io_out_bits_in_in1, 
  output [64:0] io_out_bits_in_in2, 
  output        io_out_bits_lt, 
  output [63:0] io_out_bits_store, 
  output [63:0] io_out_bits_toint, 
  output [4:0]  io_out_bits_exc 
);
  wire [64:0] dcmp_io_a; 
  wire [64:0] dcmp_io_b; 
  wire  dcmp_io_signaling; 
  wire  dcmp_io_lt; 
  wire  dcmp_io_eq; 
  wire [4:0] dcmp_io_exceptionFlags; 
  wire [64:0] RecFNToIN_io_in; 
  wire [2:0] RecFNToIN_io_roundingMode; 
  wire  RecFNToIN_io_signedOut; 
  wire [63:0] RecFNToIN_io_out; 
  wire [2:0] RecFNToIN_io_intExceptionFlags; 
  wire [64:0] RecFNToIN_1_io_in; 
  wire [2:0] RecFNToIN_1_io_roundingMode; 
  wire  RecFNToIN_1_io_signedOut; 
  wire [2:0] RecFNToIN_1_io_intExceptionFlags; 
  reg  in_ren2; 
  reg [31:0] _RAND_0;
  reg  in_singleOut; 
  reg [31:0] _RAND_1;
  reg  in_wflags; 
  reg [31:0] _RAND_2;
  reg [2:0] in_rm; 
  reg [31:0] _RAND_3;
  reg [1:0] in_typ; 
  reg [31:0] _RAND_4;
  reg [64:0] in_in1; 
  reg [95:0] _RAND_5;
  reg [64:0] in_in2; 
  reg [95:0] _RAND_6;
  wire  _T_12; 
  wire  tag; 
  wire [11:0] _T_14; 
  wire [2:0] _T_15; 
  wire  _T_16; 
  wire [1:0] _T_17; 
  wire  _T_18; 
  wire  _T_21; 
  wire  _T_22; 
  wire  _T_24; 
  wire  _T_25; 
  wire  _T_26; 
  wire [12:0] _T_27; 
  wire  _T_28; 
  wire [51:0] _T_29; 
  wire [1:0] _T_30; 
  wire [53:0] _T_31; 
  wire  _T_32; 
  wire [5:0] _T_33; 
  wire [6:0] _T_34; 
  wire [6:0] _T_35; 
  wire [5:0] _T_36; 
  wire [52:0] _T_37; 
  wire [52:0] _T_38; 
  wire [51:0] _T_39; 
  wire [10:0] _T_40; 
  wire [11:0] _T_41; 
  wire [11:0] _T_42; 
  wire [10:0] _T_43; 
  wire [10:0] _T_44; 
  wire  _T_45; 
  wire [10:0] _T_47; 
  wire [10:0] _T_48; 
  wire [51:0] _T_49; 
  wire [51:0] _T_50; 
  wire [51:0] _T_51; 
  wire [11:0] _T_52; 
  wire [63:0] _T_53; 
  wire  _T_54; 
  wire  _T_55; 
  wire [30:0] _T_56; 
  wire [1:0] _T_57; 
  wire [32:0] _T_58; 
  wire [8:0] _T_59; 
  wire [2:0] _T_60; 
  wire  _T_61; 
  wire [1:0] _T_62; 
  wire  _T_63; 
  wire  _T_66; 
  wire  _T_67; 
  wire  _T_69; 
  wire  _T_70; 
  wire  _T_71; 
  wire [9:0] _T_72; 
  wire  _T_73; 
  wire [22:0] _T_74; 
  wire [1:0] _T_75; 
  wire [24:0] _T_76; 
  wire  _T_77; 
  wire [4:0] _T_78; 
  wire [5:0] _T_79; 
  wire [5:0] _T_80; 
  wire [4:0] _T_81; 
  wire [23:0] _T_82; 
  wire [23:0] _T_83; 
  wire [22:0] _T_84; 
  wire [7:0] _T_85; 
  wire [8:0] _T_86; 
  wire [8:0] _T_87; 
  wire [7:0] _T_88; 
  wire [7:0] _T_89; 
  wire  _T_90; 
  wire [7:0] _T_92; 
  wire [7:0] _T_93; 
  wire [22:0] _T_94; 
  wire [22:0] _T_95; 
  wire [22:0] _T_96; 
  wire [8:0] _T_97; 
  wire [31:0] _T_98; 
  wire [31:0] _T_99; 
  wire [2:0] _T_100; 
  wire [2:0] _T_101; 
  wire  _T_102; 
  wire [31:0] _T_103; 
  wire [31:0] _T_104; 
  wire [63:0] store; 
  wire [31:0] _T_107; 
  wire [63:0] _T_108; 
  wire  _T_247; 
  wire  _T_248; 
  wire  _T_256; 
  wire  _T_270; 
  wire  _T_271; 
  wire  _T_272; 
  wire [31:0] _T_273; 
  wire  _T_263; 
  wire  _T_264; 
  wire  _T_265; 
  wire  _T_266; 
  wire [30:0] _T_268; 
  wire [31:0] _T_269; 
  wire [63:0] _T_274; 
  wire [63:0] _GEN_24; 
  wire [63:0] _GEN_25; 
  wire [2:0] _T_240; 
  wire [1:0] _T_241; 
  wire [2:0] _GEN_33; 
  wire [2:0] _T_242; 
  wire  _T_243; 
  wire [31:0] _T_244; 
  wire [63:0] _GEN_34; 
  wire [63:0] _T_245; 
  wire [63:0] _GEN_35; 
  wire [63:0] _T_246; 
  wire [63:0] _GEN_28; 
  wire  _T_120; 
  wire  _T_212; 
  wire  _T_213; 
  wire  _T_210; 
  wire  _T_211; 
  wire [1:0] _T_231; 
  wire [1:0] _T_190; 
  wire  _T_191; 
  wire  _T_204; 
  wire  _T_205; 
  wire  _T_206; 
  wire  _T_214; 
  wire  _T_215; 
  wire [2:0] _T_232; 
  wire  _T_198; 
  wire [9:0] _T_192; 
  wire  _T_193; 
  wire  _T_199; 
  wire  _T_200; 
  wire  _T_201; 
  wire  _T_202; 
  wire  _T_217; 
  wire  _T_194; 
  wire  _T_196; 
  wire  _T_197; 
  wire  _T_219; 
  wire [1:0] _T_230; 
  wire [4:0] _T_233; 
  wire  _T_203; 
  wire  _T_221; 
  wire  _T_222; 
  wire [1:0] _T_227; 
  wire  _T_223; 
  wire [2:0] _T_228; 
  wire  _T_224; 
  wire  _T_225; 
  wire [1:0] _T_226; 
  wire [4:0] _T_229; 
  wire [9:0] _T_234; 
  wire  _T_133; 
  wire  _T_134; 
  wire [11:0] _T_128; 
  wire [12:0] _T_129; 
  wire [12:0] _T_130; 
  wire [11:0] _T_131; 
  wire [5:0] _T_135; 
  wire [8:0] _T_136; 
  wire [8:0] _T_137; 
  wire [8:0] _T_138; 
  wire [9:0] _T_139; 
  wire [75:0] _GEN_36; 
  wire [75:0] _T_124; 
  wire [22:0] _T_125; 
  wire [32:0] _T_140; 
  wire [2:0] _T_142; 
  wire [2:0] _T_160; 
  wire  _T_161; 
  wire  _T_165; 
  wire  _T_166; 
  wire  _T_163; 
  wire  _T_164; 
  wire [1:0] _T_184; 
  wire [1:0] _T_143; 
  wire  _T_144; 
  wire  _T_157; 
  wire  _T_158; 
  wire  _T_159; 
  wire  _T_141; 
  wire  _T_167; 
  wire  _T_168; 
  wire [2:0] _T_185; 
  wire  _T_151; 
  wire [6:0] _T_145; 
  wire  _T_146; 
  wire  _T_152; 
  wire  _T_153; 
  wire  _T_154; 
  wire  _T_155; 
  wire  _T_170; 
  wire  _T_147; 
  wire  _T_149; 
  wire  _T_150; 
  wire  _T_172; 
  wire [1:0] _T_183; 
  wire [4:0] _T_186; 
  wire  _T_156; 
  wire  _T_174; 
  wire  _T_175; 
  wire [1:0] _T_180; 
  wire  _T_176; 
  wire [2:0] _T_181; 
  wire  _T_177; 
  wire  _T_178; 
  wire [1:0] _T_179; 
  wire [4:0] _T_182; 
  wire [9:0] _T_187; 
  wire [9:0] _T_236; 
  wire [63:0] _GEN_38; 
  wire [63:0] _T_239; 
  wire [63:0] _GEN_22; 
  wire [63:0] toint; 
  wire [31:0] _T_112; 
  wire  _T_113; 
  wire [31:0] _T_115; 
  wire [63:0] _T_116; 
  wire  _GEN_27; 
  wire  _GEN_23; 
  wire  intType; 
  wire  _T_249; 
  wire [1:0] _T_251; 
  wire  _T_252; 
  wire  _T_253; 
  wire [3:0] _T_254; 
  wire [4:0] _T_255; 
  wire  _T_275; 
  wire  _T_277; 
  wire [3:0] _T_278; 
  wire [4:0] _T_279; 
  wire [4:0] _GEN_26; 
  wire [4:0] _GEN_29; 
  wire [64:0] _T_280; 
  wire  _T_281; 
  wire [64:0] _T_282; 
  wire  _T_283; 
  wire  _T_284; 
  CompareRecFN dcmp ( 
    .io_a(dcmp_io_a),
    .io_b(dcmp_io_b),
    .io_signaling(dcmp_io_signaling),
    .io_lt(dcmp_io_lt),
    .io_eq(dcmp_io_eq),
    .io_exceptionFlags(dcmp_io_exceptionFlags)
  );
  RecFNToIN RecFNToIN ( 
    .io_in(RecFNToIN_io_in),
    .io_roundingMode(RecFNToIN_io_roundingMode),
    .io_signedOut(RecFNToIN_io_signedOut),
    .io_out(RecFNToIN_io_out),
    .io_intExceptionFlags(RecFNToIN_io_intExceptionFlags)
  );
  RecFNToIN_1 RecFNToIN_1 ( 
    .io_in(RecFNToIN_1_io_in),
    .io_roundingMode(RecFNToIN_1_io_roundingMode),
    .io_signedOut(RecFNToIN_1_io_signedOut),
    .io_intExceptionFlags(RecFNToIN_1_io_intExceptionFlags)
  );
  assign _T_12 = in_rm[1]; 
  assign tag = in_singleOut == 1'h0; 
  assign _T_14 = in_in1[63:52]; 
  assign _T_15 = _T_14[11:9]; 
  assign _T_16 = _T_15 == 3'h0; 
  assign _T_17 = _T_14[11:10]; 
  assign _T_18 = _T_17 == 2'h3; 
  assign _T_21 = _T_14[9]; 
  assign _T_22 = _T_18 & _T_21; 
  assign _T_24 = _T_21 == 1'h0; 
  assign _T_25 = _T_18 & _T_24; 
  assign _T_26 = in_in1[64]; 
  assign _T_27 = {1'b0,$signed(_T_14)}; 
  assign _T_28 = _T_16 == 1'h0; 
  assign _T_29 = in_in1[51:0]; 
  assign _T_30 = {1'h0,_T_28}; 
  assign _T_31 = {_T_30,_T_29}; 
  assign _T_32 = $signed(_T_27) < $signed(13'sh402); 
  assign _T_33 = _T_27[5:0]; 
  assign _T_34 = 6'h1 - _T_33; 
  assign _T_35 = $unsigned(_T_34); 
  assign _T_36 = _T_35[5:0]; 
  assign _T_37 = _T_31[53:1]; 
  assign _T_38 = _T_37 >> _T_36; 
  assign _T_39 = _T_38[51:0]; 
  assign _T_40 = _T_27[10:0]; 
  assign _T_41 = _T_40 - 11'h401; 
  assign _T_42 = $unsigned(_T_41); 
  assign _T_43 = _T_42[10:0]; 
  assign _T_44 = _T_32 ? 11'h0 : _T_43; 
  assign _T_45 = _T_22 | _T_25; 
  assign _T_47 = _T_45 ? 11'h7ff : 11'h0; 
  assign _T_48 = _T_44 | _T_47; 
  assign _T_49 = _T_31[51:0]; 
  assign _T_50 = _T_25 ? 52'h0 : _T_49; 
  assign _T_51 = _T_32 ? _T_39 : _T_50; 
  assign _T_52 = {_T_26,_T_48}; 
  assign _T_53 = {_T_52,_T_51}; 
  assign _T_54 = in_in1[31]; 
  assign _T_55 = in_in1[52]; 
  assign _T_56 = in_in1[30:0]; 
  assign _T_57 = {_T_54,_T_55}; 
  assign _T_58 = {_T_57,_T_56}; 
  assign _T_59 = _T_58[31:23]; 
  assign _T_60 = _T_59[8:6]; 
  assign _T_61 = _T_60 == 3'h0; 
  assign _T_62 = _T_59[8:7]; 
  assign _T_63 = _T_62 == 2'h3; 
  assign _T_66 = _T_59[6]; 
  assign _T_67 = _T_63 & _T_66; 
  assign _T_69 = _T_66 == 1'h0; 
  assign _T_70 = _T_63 & _T_69; 
  assign _T_71 = _T_58[32]; 
  assign _T_72 = {1'b0,$signed(_T_59)}; 
  assign _T_73 = _T_61 == 1'h0; 
  assign _T_74 = _T_58[22:0]; 
  assign _T_75 = {1'h0,_T_73}; 
  assign _T_76 = {_T_75,_T_74}; 
  assign _T_77 = $signed(_T_72) < $signed(10'sh82); 
  assign _T_78 = _T_72[4:0]; 
  assign _T_79 = 5'h1 - _T_78; 
  assign _T_80 = $unsigned(_T_79); 
  assign _T_81 = _T_80[4:0]; 
  assign _T_82 = _T_76[24:1]; 
  assign _T_83 = _T_82 >> _T_81; 
  assign _T_84 = _T_83[22:0]; 
  assign _T_85 = _T_72[7:0]; 
  assign _T_86 = _T_85 - 8'h81; 
  assign _T_87 = $unsigned(_T_86); 
  assign _T_88 = _T_87[7:0]; 
  assign _T_89 = _T_77 ? 8'h0 : _T_88; 
  assign _T_90 = _T_67 | _T_70; 
  assign _T_92 = _T_90 ? 8'hff : 8'h0; 
  assign _T_93 = _T_89 | _T_92; 
  assign _T_94 = _T_76[22:0]; 
  assign _T_95 = _T_70 ? 23'h0 : _T_94; 
  assign _T_96 = _T_77 ? _T_84 : _T_95; 
  assign _T_97 = {_T_71,_T_93}; 
  assign _T_98 = {_T_97,_T_96}; 
  assign _T_99 = _T_53[63:32]; 
  assign _T_100 = in_in1[63:61]; 
  assign _T_101 = ~ _T_100; 
  assign _T_102 = _T_101 == 3'h0; 
  assign _T_103 = _T_53[31:0]; 
  assign _T_104 = _T_102 ? _T_98 : _T_103; 
  assign store = {_T_99,_T_104}; 
  assign _T_107 = store[31:0]; 
  assign _T_108 = {_T_107,_T_107}; 
  assign _T_247 = in_ren2 == 1'h0; 
  assign _T_248 = in_typ[1]; 
  assign _T_256 = _T_248 == 1'h0; 
  assign _T_270 = RecFNToIN_io_intExceptionFlags[2]; 
  assign _T_271 = RecFNToIN_1_io_intExceptionFlags[1]; 
  assign _T_272 = _T_270 | _T_271; 
  assign _T_273 = RecFNToIN_io_out[63:32]; 
  assign _T_263 = _T_102 == 1'h0; 
  assign _T_264 = _T_26 & _T_263; 
  assign _T_265 = RecFNToIN_io_signedOut == _T_264; 
  assign _T_266 = _T_264 == 1'h0; 
  assign _T_268 = _T_266 ? 31'h7fffffff : 31'h0; 
  assign _T_269 = {_T_265,_T_268}; 
  assign _T_274 = {_T_273,_T_269}; 
  assign _GEN_24 = _T_272 ? _T_274 : RecFNToIN_io_out; 
  assign _GEN_25 = _T_256 ? _GEN_24 : RecFNToIN_io_out; 
  assign _T_240 = ~ in_rm; 
  assign _T_241 = {dcmp_io_lt,dcmp_io_eq}; 
  assign _GEN_33 = {{1'd0}, _T_241}; 
  assign _T_242 = _T_240 & _GEN_33; 
  assign _T_243 = _T_242 != 3'h0; 
  assign _T_244 = store[63:32]; 
  assign _GEN_34 = {{32'd0}, _T_244}; 
  assign _T_245 = _GEN_34 << 32; 
  assign _GEN_35 = {{63'd0}, _T_243}; 
  assign _T_246 = _GEN_35 | _T_245; 
  assign _GEN_28 = _T_247 ? _GEN_25 : _T_246; 
  assign _T_120 = in_rm[0]; 
  assign _T_212 = in_in1[51]; 
  assign _T_213 = _T_102 & _T_212; 
  assign _T_210 = _T_212 == 1'h0; 
  assign _T_211 = _T_102 & _T_210; 
  assign _T_231 = {_T_213,_T_211}; 
  assign _T_190 = _T_100[2:1]; 
  assign _T_191 = _T_190 == 2'h3; 
  assign _T_204 = _T_100[0]; 
  assign _T_205 = _T_204 == 1'h0; 
  assign _T_206 = _T_191 & _T_205; 
  assign _T_214 = _T_26 == 1'h0; 
  assign _T_215 = _T_206 & _T_214; 
  assign _T_232 = {_T_231,_T_215}; 
  assign _T_198 = _T_190 == 2'h1; 
  assign _T_192 = in_in1[61:52]; 
  assign _T_193 = _T_192 < 10'h2; 
  assign _T_199 = _T_193 == 1'h0; 
  assign _T_200 = _T_198 & _T_199; 
  assign _T_201 = _T_190 == 2'h2; 
  assign _T_202 = _T_200 | _T_201; 
  assign _T_217 = _T_202 & _T_214; 
  assign _T_194 = _T_100 == 3'h1; 
  assign _T_196 = _T_198 & _T_193; 
  assign _T_197 = _T_194 | _T_196; 
  assign _T_219 = _T_197 & _T_214; 
  assign _T_230 = {_T_217,_T_219}; 
  assign _T_233 = {_T_232,_T_230}; 
  assign _T_203 = _T_100 == 3'h0; 
  assign _T_221 = _T_203 & _T_214; 
  assign _T_222 = _T_203 & _T_26; 
  assign _T_227 = {_T_221,_T_222}; 
  assign _T_223 = _T_197 & _T_26; 
  assign _T_228 = {_T_227,_T_223}; 
  assign _T_224 = _T_202 & _T_26; 
  assign _T_225 = _T_206 & _T_26; 
  assign _T_226 = {_T_224,_T_225}; 
  assign _T_229 = {_T_228,_T_226}; 
  assign _T_234 = {_T_233,_T_229}; 
  assign _T_133 = _T_15 >= 3'h6; 
  assign _T_134 = _T_16 | _T_133; 
  assign _T_128 = _T_14 + 12'h100; 
  assign _T_129 = _T_128 - 12'h800; 
  assign _T_130 = $unsigned(_T_129); 
  assign _T_131 = _T_130[11:0]; 
  assign _T_135 = _T_131[5:0]; 
  assign _T_136 = {_T_15,_T_135}; 
  assign _T_137 = _T_131[8:0]; 
  assign _T_138 = _T_134 ? _T_136 : _T_137; 
  assign _T_139 = {_T_26,_T_138}; 
  assign _GEN_36 = {{24'd0}, _T_29}; 
  assign _T_124 = _GEN_36 << 24; 
  assign _T_125 = _T_124[75:53]; 
  assign _T_140 = {_T_139,_T_125}; 
  assign _T_142 = _T_140[31:29]; 
  assign _T_160 = ~ _T_142; 
  assign _T_161 = _T_160 == 3'h0; 
  assign _T_165 = _T_140[22]; 
  assign _T_166 = _T_161 & _T_165; 
  assign _T_163 = _T_165 == 1'h0; 
  assign _T_164 = _T_161 & _T_163; 
  assign _T_184 = {_T_166,_T_164}; 
  assign _T_143 = _T_142[2:1]; 
  assign _T_144 = _T_143 == 2'h3; 
  assign _T_157 = _T_142[0]; 
  assign _T_158 = _T_157 == 1'h0; 
  assign _T_159 = _T_144 & _T_158; 
  assign _T_141 = _T_140[32]; 
  assign _T_167 = _T_141 == 1'h0; 
  assign _T_168 = _T_159 & _T_167; 
  assign _T_185 = {_T_184,_T_168}; 
  assign _T_151 = _T_143 == 2'h1; 
  assign _T_145 = _T_140[29:23]; 
  assign _T_146 = _T_145 < 7'h2; 
  assign _T_152 = _T_146 == 1'h0; 
  assign _T_153 = _T_151 & _T_152; 
  assign _T_154 = _T_143 == 2'h2; 
  assign _T_155 = _T_153 | _T_154; 
  assign _T_170 = _T_155 & _T_167; 
  assign _T_147 = _T_142 == 3'h1; 
  assign _T_149 = _T_151 & _T_146; 
  assign _T_150 = _T_147 | _T_149; 
  assign _T_172 = _T_150 & _T_167; 
  assign _T_183 = {_T_170,_T_172}; 
  assign _T_186 = {_T_185,_T_183}; 
  assign _T_156 = _T_142 == 3'h0; 
  assign _T_174 = _T_156 & _T_167; 
  assign _T_175 = _T_156 & _T_141; 
  assign _T_180 = {_T_174,_T_175}; 
  assign _T_176 = _T_150 & _T_141; 
  assign _T_181 = {_T_180,_T_176}; 
  assign _T_177 = _T_155 & _T_141; 
  assign _T_178 = _T_159 & _T_141; 
  assign _T_179 = {_T_177,_T_178}; 
  assign _T_182 = {_T_181,_T_179}; 
  assign _T_187 = {_T_186,_T_182}; 
  assign _T_236 = tag ? _T_234 : _T_187; 
  assign _GEN_38 = {{54'd0}, _T_236}; 
  assign _T_239 = _GEN_38 | _T_245; 
  assign _GEN_22 = _T_120 ? _T_239 : store; 
  assign toint = in_wflags ? _GEN_28 : _GEN_22; 
  assign _T_112 = toint[31:0]; 
  assign _T_113 = _T_112[31]; 
  assign _T_115 = _T_113 ? 32'hffffffff : 32'h0; 
  assign _T_116 = {_T_115,_T_112}; 
  assign _GEN_27 = _T_247 ? _T_248 : 1'h0; 
  assign _GEN_23 = _T_120 ? 1'h0 : tag; 
  assign intType = in_wflags ? _GEN_27 : _GEN_23; 
  assign _T_249 = in_typ[0]; 
  assign _T_251 = RecFNToIN_io_intExceptionFlags[2:1]; 
  assign _T_252 = _T_251 != 2'h0; 
  assign _T_253 = RecFNToIN_io_intExceptionFlags[0]; 
  assign _T_254 = {_T_252,3'h0}; 
  assign _T_255 = {_T_254,_T_253}; 
  assign _T_275 = _T_272 == 1'h0; 
  assign _T_277 = _T_275 & _T_253; 
  assign _T_278 = {_T_272,3'h0}; 
  assign _T_279 = {_T_278,_T_277}; 
  assign _GEN_26 = _T_256 ? _T_279 : _T_255; 
  assign _GEN_29 = _T_247 ? _GEN_26 : dcmp_io_exceptionFlags; 
  assign _T_280 = $signed(dcmp_io_a); 
  assign _T_281 = $signed(_T_280) < $signed(65'sh0); 
  assign _T_282 = $signed(dcmp_io_b); 
  assign _T_283 = $signed(_T_282) >= $signed(65'sh0); 
  assign _T_284 = _T_281 & _T_283; 
  assign io_out_bits_in_rm = in_rm; 
  assign io_out_bits_in_in1 = in_in1; 
  assign io_out_bits_in_in2 = in_in2; 
  assign io_out_bits_lt = dcmp_io_lt | _T_284; 
  assign io_out_bits_store = tag ? store : _T_108; 
  assign io_out_bits_toint = intType ? toint : _T_116; 
  assign io_out_bits_exc = in_wflags ? _GEN_29 : 5'h0; 
  assign dcmp_io_a = in_in1; 
  assign dcmp_io_b = in_in2; 
  assign dcmp_io_signaling = _T_12 == 1'h0; 
  assign RecFNToIN_io_in = in_in1; 
  assign RecFNToIN_io_roundingMode = in_rm; 
  assign RecFNToIN_io_signedOut = ~ _T_249; 
  assign RecFNToIN_1_io_in = in_in1; 
  assign RecFNToIN_1_io_roundingMode = in_rm; 
  assign RecFNToIN_1_io_signedOut = ~ _T_249; 
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
  in_ren2 = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  in_singleOut = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  in_wflags = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  in_rm = _RAND_3[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  in_typ = _RAND_4[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {3{`RANDOM}};
  in_in1 = _RAND_5[64:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {3{`RANDOM}};
  in_in2 = _RAND_6[64:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (io_in_valid) begin
      in_ren2 <= io_in_bits_ren2;
    end
    if (io_in_valid) begin
      in_singleOut <= io_in_bits_singleOut;
    end
    if (io_in_valid) begin
      in_wflags <= io_in_bits_wflags;
    end
    if (io_in_valid) begin
      in_rm <= io_in_bits_rm;
    end
    if (io_in_valid) begin
      in_typ <= io_in_bits_typ;
    end
    if (io_in_valid) begin
      in_in1 <= io_in_bits_in1;
    end
    if (io_in_valid) begin
      in_in2 <= io_in_bits_in2;
    end
  end
endmodule
