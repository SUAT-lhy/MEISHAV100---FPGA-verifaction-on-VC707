module MulAddRecFNToRaw_postMul( 
  input         io_fromPreMul_isSigNaNAny, 
  input         io_fromPreMul_isNaNAOrB, 
  input         io_fromPreMul_isInfA, 
  input         io_fromPreMul_isZeroA, 
  input         io_fromPreMul_isInfB, 
  input         io_fromPreMul_isZeroB, 
  input         io_fromPreMul_signProd, 
  input         io_fromPreMul_isNaNC, 
  input         io_fromPreMul_isInfC, 
  input         io_fromPreMul_isZeroC, 
  input  [9:0]  io_fromPreMul_sExpSum, 
  input         io_fromPreMul_doSubMags, 
  input         io_fromPreMul_CIsDominant, 
  input  [4:0]  io_fromPreMul_CDom_CAlignDist, 
  input  [25:0] io_fromPreMul_highAlignedSigC, 
  input         io_fromPreMul_bit0AlignedSigC, 
  input  [48:0] io_mulAddResult, 
  input  [2:0]  io_roundingMode, 
  output        io_invalidExc, 
  output        io_rawOut_isNaN, 
  output        io_rawOut_isInf, 
  output        io_rawOut_isZero, 
  output        io_rawOut_sign, 
  output [9:0]  io_rawOut_sExp, 
  output [26:0] io_rawOut_sig 
);
  wire  roundingMode_min; 
  wire  CDom_sign; 
  wire  _T_9; 
  wire [25:0] _T_11; 
  wire [25:0] _T_12; 
  wire [47:0] _T_13; 
  wire [73:0] _T_14; 
  wire [74:0] sigSum; 
  wire [1:0] _T_15; 
  wire [9:0] _GEN_0; 
  wire [9:0] _T_17; 
  wire [9:0] CDom_sExp; 
  wire [49:0] _T_18; 
  wire [49:0] _T_19; 
  wire [1:0] _T_20; 
  wire [46:0] _T_21; 
  wire [2:0] _T_22; 
  wire [49:0] _T_23; 
  wire [49:0] CDom_absSigSum; 
  wire [23:0] _T_24; 
  wire [23:0] _T_25; 
  wire  _T_26; 
  wire [24:0] _T_27; 
  wire  _T_28; 
  wire  CDom_absSigSumExtra; 
  wire [80:0] _GEN_1; 
  wire [80:0] _T_29; 
  wire [28:0] CDom_mainSig; 
  wire [23:0] _T_30; 
  wire [26:0] _GEN_2; 
  wire [26:0] _T_31; 
  wire [3:0] _T_45; 
  wire  _T_46; 
  wire [3:0] _T_47; 
  wire  _T_48; 
  wire [3:0] _T_49; 
  wire  _T_50; 
  wire [3:0] _T_51; 
  wire  _T_52; 
  wire [3:0] _T_53; 
  wire  _T_54; 
  wire [3:0] _T_55; 
  wire  _T_56; 
  wire [2:0] _T_57; 
  wire  _T_58; 
  wire [1:0] _T_59; 
  wire [2:0] _T_60; 
  wire [1:0] _T_61; 
  wire [1:0] _T_62; 
  wire [3:0] _T_63; 
  wire [6:0] _T_64; 
  wire [2:0] _T_65; 
  wire [2:0] _T_66; 
  wire [8:0] _T_67; 
  wire [5:0] _T_68; 
  wire [3:0] _T_69; 
  wire [1:0] _T_70; 
  wire  _T_71; 
  wire  _T_72; 
  wire [1:0] _T_73; 
  wire [1:0] _T_74; 
  wire  _T_75; 
  wire  _T_76; 
  wire [1:0] _T_77; 
  wire [3:0] _T_78; 
  wire [1:0] _T_79; 
  wire  _T_80; 
  wire  _T_81; 
  wire [1:0] _T_82; 
  wire [5:0] _T_83; 
  wire [6:0] _GEN_3; 
  wire [6:0] _T_84; 
  wire  CDom_reduced4SigExtra; 
  wire [25:0] _T_85; 
  wire [2:0] _T_86; 
  wire  _T_87; 
  wire  _T_88; 
  wire  _T_89; 
  wire [26:0] CDom_sig; 
  wire  notCDom_signSigSum; 
  wire [50:0] _T_90; 
  wire [50:0] _T_91; 
  wire [50:0] _GEN_4; 
  wire [50:0] _T_94; 
  wire [50:0] notCDom_absSigSum; 
  wire [1:0] _T_127; 
  wire  _T_128; 
  wire [1:0] _T_129; 
  wire  _T_130; 
  wire [1:0] _T_131; 
  wire  _T_132; 
  wire [1:0] _T_133; 
  wire  _T_134; 
  wire [1:0] _T_135; 
  wire  _T_136; 
  wire [1:0] _T_137; 
  wire  _T_138; 
  wire [1:0] _T_139; 
  wire  _T_140; 
  wire [1:0] _T_141; 
  wire  _T_142; 
  wire [1:0] _T_143; 
  wire  _T_144; 
  wire [1:0] _T_145; 
  wire  _T_146; 
  wire [1:0] _T_147; 
  wire  _T_148; 
  wire [1:0] _T_149; 
  wire  _T_150; 
  wire [1:0] _T_151; 
  wire  _T_152; 
  wire [1:0] _T_153; 
  wire  _T_154; 
  wire [1:0] _T_155; 
  wire  _T_156; 
  wire [1:0] _T_157; 
  wire  _T_158; 
  wire [1:0] _T_159; 
  wire  _T_160; 
  wire [1:0] _T_161; 
  wire  _T_162; 
  wire [1:0] _T_163; 
  wire  _T_164; 
  wire [1:0] _T_165; 
  wire  _T_166; 
  wire [1:0] _T_167; 
  wire  _T_168; 
  wire [1:0] _T_169; 
  wire  _T_170; 
  wire [1:0] _T_171; 
  wire  _T_172; 
  wire [1:0] _T_173; 
  wire  _T_174; 
  wire [1:0] _T_175; 
  wire  _T_176; 
  wire  _T_177; 
  wire [1:0] _T_179; 
  wire [2:0] _T_180; 
  wire [1:0] _T_181; 
  wire [2:0] _T_182; 
  wire [5:0] _T_183; 
  wire [1:0] _T_184; 
  wire [2:0] _T_185; 
  wire [1:0] _T_186; 
  wire [1:0] _T_187; 
  wire [3:0] _T_188; 
  wire [6:0] _T_189; 
  wire [12:0] _T_190; 
  wire [1:0] _T_191; 
  wire [2:0] _T_192; 
  wire [1:0] _T_193; 
  wire [2:0] _T_194; 
  wire [5:0] _T_195; 
  wire [1:0] _T_196; 
  wire [2:0] _T_197; 
  wire [1:0] _T_198; 
  wire [1:0] _T_199; 
  wire [3:0] _T_200; 
  wire [6:0] _T_201; 
  wire [12:0] _T_202; 
  wire [25:0] notCDom_reduced2AbsSigSum; 
  wire [15:0] _T_203; 
  wire [7:0] _T_206; 
  wire [15:0] _T_207; 
  wire [7:0] _T_208; 
  wire [15:0] _GEN_5; 
  wire [15:0] _T_209; 
  wire [15:0] _T_211; 
  wire [15:0] _T_212; 
  wire [11:0] _T_216; 
  wire [15:0] _GEN_6; 
  wire [15:0] _T_217; 
  wire [11:0] _T_218; 
  wire [15:0] _GEN_7; 
  wire [15:0] _T_219; 
  wire [15:0] _T_221; 
  wire [15:0] _T_222; 
  wire [13:0] _T_226; 
  wire [15:0] _GEN_8; 
  wire [15:0] _T_227; 
  wire [13:0] _T_228; 
  wire [15:0] _GEN_9; 
  wire [15:0] _T_229; 
  wire [15:0] _T_231; 
  wire [15:0] _T_232; 
  wire [14:0] _T_236; 
  wire [15:0] _GEN_10; 
  wire [15:0] _T_237; 
  wire [14:0] _T_238; 
  wire [15:0] _GEN_11; 
  wire [15:0] _T_239; 
  wire [15:0] _T_241; 
  wire [15:0] _T_242; 
  wire [9:0] _T_243; 
  wire [7:0] _T_244; 
  wire [3:0] _T_247; 
  wire [7:0] _T_248; 
  wire [3:0] _T_249; 
  wire [7:0] _GEN_12; 
  wire [7:0] _T_250; 
  wire [7:0] _T_252; 
  wire [7:0] _T_253; 
  wire [5:0] _T_257; 
  wire [7:0] _GEN_13; 
  wire [7:0] _T_258; 
  wire [5:0] _T_259; 
  wire [7:0] _GEN_14; 
  wire [7:0] _T_260; 
  wire [7:0] _T_262; 
  wire [7:0] _T_263; 
  wire [6:0] _T_267; 
  wire [7:0] _GEN_15; 
  wire [7:0] _T_268; 
  wire [6:0] _T_269; 
  wire [7:0] _GEN_16; 
  wire [7:0] _T_270; 
  wire [7:0] _T_272; 
  wire [7:0] _T_273; 
  wire [1:0] _T_274; 
  wire  _T_275; 
  wire  _T_276; 
  wire [1:0] _T_277; 
  wire [9:0] _T_278; 
  wire [25:0] _T_279; 
  wire  _T_280; 
  wire  _T_281; 
  wire  _T_282; 
  wire  _T_283; 
  wire  _T_284; 
  wire  _T_285; 
  wire  _T_286; 
  wire  _T_287; 
  wire  _T_288; 
  wire  _T_289; 
  wire  _T_290; 
  wire  _T_291; 
  wire  _T_292; 
  wire  _T_293; 
  wire  _T_294; 
  wire  _T_295; 
  wire  _T_296; 
  wire  _T_297; 
  wire  _T_298; 
  wire  _T_299; 
  wire  _T_300; 
  wire  _T_301; 
  wire  _T_302; 
  wire  _T_303; 
  wire  _T_304; 
  wire [4:0] _T_306; 
  wire [4:0] _T_307; 
  wire [4:0] _T_308; 
  wire [4:0] _T_309; 
  wire [4:0] _T_310; 
  wire [4:0] _T_311; 
  wire [4:0] _T_312; 
  wire [4:0] _T_313; 
  wire [4:0] _T_314; 
  wire [4:0] _T_315; 
  wire [4:0] _T_316; 
  wire [4:0] _T_317; 
  wire [4:0] _T_318; 
  wire [4:0] _T_319; 
  wire [4:0] _T_320; 
  wire [4:0] _T_321; 
  wire [4:0] _T_322; 
  wire [4:0] _T_323; 
  wire [4:0] _T_324; 
  wire [4:0] _T_325; 
  wire [4:0] _T_326; 
  wire [4:0] _T_327; 
  wire [4:0] _T_328; 
  wire [4:0] _T_329; 
  wire [4:0] notCDom_normDistReduced2; 
  wire [5:0] _GEN_17; 
  wire [5:0] notCDom_nearNormDist; 
  wire [6:0] _T_330; 
  wire [9:0] _GEN_18; 
  wire [9:0] _T_332; 
  wire [9:0] notCDom_sExp; 
  wire [113:0] _GEN_19; 
  wire [113:0] _T_333; 
  wire [28:0] notCDom_mainSig; 
  wire [12:0] _T_334; 
  wire [1:0] _T_349; 
  wire  _T_350; 
  wire [1:0] _T_351; 
  wire  _T_352; 
  wire [1:0] _T_353; 
  wire  _T_354; 
  wire [1:0] _T_355; 
  wire  _T_356; 
  wire [1:0] _T_357; 
  wire  _T_358; 
  wire [1:0] _T_359; 
  wire  _T_360; 
  wire  _T_361; 
  wire [1:0] _T_363; 
  wire [2:0] _T_364; 
  wire [1:0] _T_365; 
  wire [1:0] _T_366; 
  wire [3:0] _T_367; 
  wire [6:0] _T_368; 
  wire [3:0] _T_369; 
  wire [3:0] _T_370; 
  wire [16:0] _T_371; 
  wire [5:0] _T_372; 
  wire [3:0] _T_373; 
  wire [1:0] _T_374; 
  wire  _T_375; 
  wire  _T_376; 
  wire [1:0] _T_377; 
  wire [1:0] _T_378; 
  wire  _T_379; 
  wire  _T_380; 
  wire [1:0] _T_381; 
  wire [3:0] _T_382; 
  wire [1:0] _T_383; 
  wire  _T_384; 
  wire  _T_385; 
  wire [1:0] _T_386; 
  wire [5:0] _T_387; 
  wire [6:0] _GEN_20; 
  wire [6:0] _T_388; 
  wire  notCDom_reduced4SigExtra; 
  wire [25:0] _T_389; 
  wire [2:0] _T_390; 
  wire  _T_391; 
  wire  _T_392; 
  wire [26:0] notCDom_sig; 
  wire [1:0] _T_393; 
  wire  notCDom_completeCancellation; 
  wire  _T_394; 
  wire  notCDom_sign; 
  wire  notNaN_isInfProd; 
  wire  notNaN_isInfOut; 
  wire  _T_395; 
  wire  notNaN_addZeros; 
  wire  _T_396; 
  wire  _T_397; 
  wire  _T_398; 
  wire  _T_399; 
  wire  _T_400; 
  wire  _T_402; 
  wire  _T_403; 
  wire  _T_404; 
  wire  _T_407; 
  wire  _T_408; 
  wire  _T_410; 
  wire  _T_411; 
  wire  _T_412; 
  wire  _T_413; 
  wire  _T_414; 
  wire  _T_415; 
  wire  _T_416; 
  wire  _T_417; 
  wire  _T_418; 
  wire  _T_419; 
  wire  _T_420; 
  wire  _T_421; 
  wire  _T_422; 
  wire  _T_423; 
  wire  _T_424; 
  wire  _T_425; 
  wire  _T_426; 
  assign roundingMode_min = io_roundingMode == 3'h2; 
  assign CDom_sign = io_fromPreMul_signProd ^ io_fromPreMul_doSubMags; 
  assign _T_9 = io_mulAddResult[48]; 
  assign _T_11 = io_fromPreMul_highAlignedSigC + 26'h1; 
  assign _T_12 = _T_9 ? _T_11 : io_fromPreMul_highAlignedSigC; 
  assign _T_13 = io_mulAddResult[47:0]; 
  assign _T_14 = {_T_12,_T_13}; 
  assign sigSum = {_T_14,io_fromPreMul_bit0AlignedSigC}; 
  assign _T_15 = {1'b0,$signed(io_fromPreMul_doSubMags)}; 
  assign _GEN_0 = {{8{_T_15[1]}},_T_15}; 
  assign _T_17 = $signed(io_fromPreMul_sExpSum) - $signed(_GEN_0); 
  assign CDom_sExp = $signed(_T_17); 
  assign _T_18 = sigSum[74:25]; 
  assign _T_19 = ~ _T_18; 
  assign _T_20 = io_fromPreMul_highAlignedSigC[25:24]; 
  assign _T_21 = sigSum[72:26]; 
  assign _T_22 = {1'h0,_T_20}; 
  assign _T_23 = {_T_22,_T_21}; 
  assign CDom_absSigSum = io_fromPreMul_doSubMags ? _T_19 : _T_23; 
  assign _T_24 = sigSum[24:1]; 
  assign _T_25 = ~ _T_24; 
  assign _T_26 = _T_25 != 24'h0; 
  assign _T_27 = sigSum[25:1]; 
  assign _T_28 = _T_27 != 25'h0; 
  assign CDom_absSigSumExtra = io_fromPreMul_doSubMags ? _T_26 : _T_28; 
  assign _GEN_1 = {{31'd0}, CDom_absSigSum}; 
  assign _T_29 = _GEN_1 << io_fromPreMul_CDom_CAlignDist; 
  assign CDom_mainSig = _T_29[49:21]; 
  assign _T_30 = CDom_absSigSum[23:0]; 
  assign _GEN_2 = {{3'd0}, _T_30}; 
  assign _T_31 = _GEN_2 << 3; 
  assign _T_45 = _T_31[3:0]; 
  assign _T_46 = _T_45 != 4'h0; 
  assign _T_47 = _T_31[7:4]; 
  assign _T_48 = _T_47 != 4'h0; 
  assign _T_49 = _T_31[11:8]; 
  assign _T_50 = _T_49 != 4'h0; 
  assign _T_51 = _T_31[15:12]; 
  assign _T_52 = _T_51 != 4'h0; 
  assign _T_53 = _T_31[19:16]; 
  assign _T_54 = _T_53 != 4'h0; 
  assign _T_55 = _T_31[23:20]; 
  assign _T_56 = _T_55 != 4'h0; 
  assign _T_57 = _T_31[26:24]; 
  assign _T_58 = _T_57 != 3'h0; 
  assign _T_59 = {_T_50,_T_48}; 
  assign _T_60 = {_T_59,_T_46}; 
  assign _T_61 = {_T_54,_T_52}; 
  assign _T_62 = {_T_58,_T_56}; 
  assign _T_63 = {_T_62,_T_61}; 
  assign _T_64 = {_T_63,_T_60}; 
  assign _T_65 = io_fromPreMul_CDom_CAlignDist[4:2]; 
  assign _T_66 = ~ _T_65; 
  assign _T_67 = $signed(-9'sh100) >>> _T_66; 
  assign _T_68 = _T_67[6:1]; 
  assign _T_69 = _T_68[3:0]; 
  assign _T_70 = _T_69[1:0]; 
  assign _T_71 = _T_70[0]; 
  assign _T_72 = _T_70[1]; 
  assign _T_73 = {_T_71,_T_72}; 
  assign _T_74 = _T_69[3:2]; 
  assign _T_75 = _T_74[0]; 
  assign _T_76 = _T_74[1]; 
  assign _T_77 = {_T_75,_T_76}; 
  assign _T_78 = {_T_73,_T_77}; 
  assign _T_79 = _T_68[5:4]; 
  assign _T_80 = _T_79[0]; 
  assign _T_81 = _T_79[1]; 
  assign _T_82 = {_T_80,_T_81}; 
  assign _T_83 = {_T_78,_T_82}; 
  assign _GEN_3 = {{1'd0}, _T_83}; 
  assign _T_84 = _T_64 & _GEN_3; 
  assign CDom_reduced4SigExtra = _T_84 != 7'h0; 
  assign _T_85 = CDom_mainSig[28:3]; 
  assign _T_86 = CDom_mainSig[2:0]; 
  assign _T_87 = _T_86 != 3'h0; 
  assign _T_88 = _T_87 | CDom_reduced4SigExtra; 
  assign _T_89 = _T_88 | CDom_absSigSumExtra; 
  assign CDom_sig = {_T_85,_T_89}; 
  assign notCDom_signSigSum = sigSum[51]; 
  assign _T_90 = sigSum[50:0]; 
  assign _T_91 = ~ _T_90; 
  assign _GEN_4 = {{50'd0}, io_fromPreMul_doSubMags}; 
  assign _T_94 = _T_90 + _GEN_4; 
  assign notCDom_absSigSum = notCDom_signSigSum ? _T_91 : _T_94; 
  assign _T_127 = notCDom_absSigSum[1:0]; 
  assign _T_128 = _T_127 != 2'h0; 
  assign _T_129 = notCDom_absSigSum[3:2]; 
  assign _T_130 = _T_129 != 2'h0; 
  assign _T_131 = notCDom_absSigSum[5:4]; 
  assign _T_132 = _T_131 != 2'h0; 
  assign _T_133 = notCDom_absSigSum[7:6]; 
  assign _T_134 = _T_133 != 2'h0; 
  assign _T_135 = notCDom_absSigSum[9:8]; 
  assign _T_136 = _T_135 != 2'h0; 
  assign _T_137 = notCDom_absSigSum[11:10]; 
  assign _T_138 = _T_137 != 2'h0; 
  assign _T_139 = notCDom_absSigSum[13:12]; 
  assign _T_140 = _T_139 != 2'h0; 
  assign _T_141 = notCDom_absSigSum[15:14]; 
  assign _T_142 = _T_141 != 2'h0; 
  assign _T_143 = notCDom_absSigSum[17:16]; 
  assign _T_144 = _T_143 != 2'h0; 
  assign _T_145 = notCDom_absSigSum[19:18]; 
  assign _T_146 = _T_145 != 2'h0; 
  assign _T_147 = notCDom_absSigSum[21:20]; 
  assign _T_148 = _T_147 != 2'h0; 
  assign _T_149 = notCDom_absSigSum[23:22]; 
  assign _T_150 = _T_149 != 2'h0; 
  assign _T_151 = notCDom_absSigSum[25:24]; 
  assign _T_152 = _T_151 != 2'h0; 
  assign _T_153 = notCDom_absSigSum[27:26]; 
  assign _T_154 = _T_153 != 2'h0; 
  assign _T_155 = notCDom_absSigSum[29:28]; 
  assign _T_156 = _T_155 != 2'h0; 
  assign _T_157 = notCDom_absSigSum[31:30]; 
  assign _T_158 = _T_157 != 2'h0; 
  assign _T_159 = notCDom_absSigSum[33:32]; 
  assign _T_160 = _T_159 != 2'h0; 
  assign _T_161 = notCDom_absSigSum[35:34]; 
  assign _T_162 = _T_161 != 2'h0; 
  assign _T_163 = notCDom_absSigSum[37:36]; 
  assign _T_164 = _T_163 != 2'h0; 
  assign _T_165 = notCDom_absSigSum[39:38]; 
  assign _T_166 = _T_165 != 2'h0; 
  assign _T_167 = notCDom_absSigSum[41:40]; 
  assign _T_168 = _T_167 != 2'h0; 
  assign _T_169 = notCDom_absSigSum[43:42]; 
  assign _T_170 = _T_169 != 2'h0; 
  assign _T_171 = notCDom_absSigSum[45:44]; 
  assign _T_172 = _T_171 != 2'h0; 
  assign _T_173 = notCDom_absSigSum[47:46]; 
  assign _T_174 = _T_173 != 2'h0; 
  assign _T_175 = notCDom_absSigSum[49:48]; 
  assign _T_176 = _T_175 != 2'h0; 
  assign _T_177 = notCDom_absSigSum[50]; 
  assign _T_179 = {_T_132,_T_130}; 
  assign _T_180 = {_T_179,_T_128}; 
  assign _T_181 = {_T_138,_T_136}; 
  assign _T_182 = {_T_181,_T_134}; 
  assign _T_183 = {_T_182,_T_180}; 
  assign _T_184 = {_T_144,_T_142}; 
  assign _T_185 = {_T_184,_T_140}; 
  assign _T_186 = {_T_148,_T_146}; 
  assign _T_187 = {_T_152,_T_150}; 
  assign _T_188 = {_T_187,_T_186}; 
  assign _T_189 = {_T_188,_T_185}; 
  assign _T_190 = {_T_189,_T_183}; 
  assign _T_191 = {_T_158,_T_156}; 
  assign _T_192 = {_T_191,_T_154}; 
  assign _T_193 = {_T_164,_T_162}; 
  assign _T_194 = {_T_193,_T_160}; 
  assign _T_195 = {_T_194,_T_192}; 
  assign _T_196 = {_T_170,_T_168}; 
  assign _T_197 = {_T_196,_T_166}; 
  assign _T_198 = {_T_174,_T_172}; 
  assign _T_199 = {_T_177,_T_176}; 
  assign _T_200 = {_T_199,_T_198}; 
  assign _T_201 = {_T_200,_T_197}; 
  assign _T_202 = {_T_201,_T_195}; 
  assign notCDom_reduced2AbsSigSum = {_T_202,_T_190}; 
  assign _T_203 = notCDom_reduced2AbsSigSum[15:0]; 
  assign _T_206 = _T_203[15:8]; 
  assign _T_207 = {{8'd0}, _T_206}; 
  assign _T_208 = _T_203[7:0]; 
  assign _GEN_5 = {{8'd0}, _T_208}; 
  assign _T_209 = _GEN_5 << 8; 
  assign _T_211 = _T_209 & 16'hff00; 
  assign _T_212 = _T_207 | _T_211; 
  assign _T_216 = _T_212[15:4]; 
  assign _GEN_6 = {{4'd0}, _T_216}; 
  assign _T_217 = _GEN_6 & 16'hf0f; 
  assign _T_218 = _T_212[11:0]; 
  assign _GEN_7 = {{4'd0}, _T_218}; 
  assign _T_219 = _GEN_7 << 4; 
  assign _T_221 = _T_219 & 16'hf0f0; 
  assign _T_222 = _T_217 | _T_221; 
  assign _T_226 = _T_222[15:2]; 
  assign _GEN_8 = {{2'd0}, _T_226}; 
  assign _T_227 = _GEN_8 & 16'h3333; 
  assign _T_228 = _T_222[13:0]; 
  assign _GEN_9 = {{2'd0}, _T_228}; 
  assign _T_229 = _GEN_9 << 2; 
  assign _T_231 = _T_229 & 16'hcccc; 
  assign _T_232 = _T_227 | _T_231; 
  assign _T_236 = _T_232[15:1]; 
  assign _GEN_10 = {{1'd0}, _T_236}; 
  assign _T_237 = _GEN_10 & 16'h5555; 
  assign _T_238 = _T_232[14:0]; 
  assign _GEN_11 = {{1'd0}, _T_238}; 
  assign _T_239 = _GEN_11 << 1; 
  assign _T_241 = _T_239 & 16'haaaa; 
  assign _T_242 = _T_237 | _T_241; 
  assign _T_243 = notCDom_reduced2AbsSigSum[25:16]; 
  assign _T_244 = _T_243[7:0]; 
  assign _T_247 = _T_244[7:4]; 
  assign _T_248 = {{4'd0}, _T_247}; 
  assign _T_249 = _T_244[3:0]; 
  assign _GEN_12 = {{4'd0}, _T_249}; 
  assign _T_250 = _GEN_12 << 4; 
  assign _T_252 = _T_250 & 8'hf0; 
  assign _T_253 = _T_248 | _T_252; 
  assign _T_257 = _T_253[7:2]; 
  assign _GEN_13 = {{2'd0}, _T_257}; 
  assign _T_258 = _GEN_13 & 8'h33; 
  assign _T_259 = _T_253[5:0]; 
  assign _GEN_14 = {{2'd0}, _T_259}; 
  assign _T_260 = _GEN_14 << 2; 
  assign _T_262 = _T_260 & 8'hcc; 
  assign _T_263 = _T_258 | _T_262; 
  assign _T_267 = _T_263[7:1]; 
  assign _GEN_15 = {{1'd0}, _T_267}; 
  assign _T_268 = _GEN_15 & 8'h55; 
  assign _T_269 = _T_263[6:0]; 
  assign _GEN_16 = {{1'd0}, _T_269}; 
  assign _T_270 = _GEN_16 << 1; 
  assign _T_272 = _T_270 & 8'haa; 
  assign _T_273 = _T_268 | _T_272; 
  assign _T_274 = _T_243[9:8]; 
  assign _T_275 = _T_274[0]; 
  assign _T_276 = _T_274[1]; 
  assign _T_277 = {_T_275,_T_276}; 
  assign _T_278 = {_T_273,_T_277}; 
  assign _T_279 = {_T_242,_T_278}; 
  assign _T_280 = _T_279[0]; 
  assign _T_281 = _T_279[1]; 
  assign _T_282 = _T_279[2]; 
  assign _T_283 = _T_279[3]; 
  assign _T_284 = _T_279[4]; 
  assign _T_285 = _T_279[5]; 
  assign _T_286 = _T_279[6]; 
  assign _T_287 = _T_279[7]; 
  assign _T_288 = _T_279[8]; 
  assign _T_289 = _T_279[9]; 
  assign _T_290 = _T_279[10]; 
  assign _T_291 = _T_279[11]; 
  assign _T_292 = _T_279[12]; 
  assign _T_293 = _T_279[13]; 
  assign _T_294 = _T_279[14]; 
  assign _T_295 = _T_279[15]; 
  assign _T_296 = _T_279[16]; 
  assign _T_297 = _T_279[17]; 
  assign _T_298 = _T_279[18]; 
  assign _T_299 = _T_279[19]; 
  assign _T_300 = _T_279[20]; 
  assign _T_301 = _T_279[21]; 
  assign _T_302 = _T_279[22]; 
  assign _T_303 = _T_279[23]; 
  assign _T_304 = _T_279[24]; 
  assign _T_306 = _T_304 ? 5'h18 : 5'h19; 
  assign _T_307 = _T_303 ? 5'h17 : _T_306; 
  assign _T_308 = _T_302 ? 5'h16 : _T_307; 
  assign _T_309 = _T_301 ? 5'h15 : _T_308; 
  assign _T_310 = _T_300 ? 5'h14 : _T_309; 
  assign _T_311 = _T_299 ? 5'h13 : _T_310; 
  assign _T_312 = _T_298 ? 5'h12 : _T_311; 
  assign _T_313 = _T_297 ? 5'h11 : _T_312; 
  assign _T_314 = _T_296 ? 5'h10 : _T_313; 
  assign _T_315 = _T_295 ? 5'hf : _T_314; 
  assign _T_316 = _T_294 ? 5'he : _T_315; 
  assign _T_317 = _T_293 ? 5'hd : _T_316; 
  assign _T_318 = _T_292 ? 5'hc : _T_317; 
  assign _T_319 = _T_291 ? 5'hb : _T_318; 
  assign _T_320 = _T_290 ? 5'ha : _T_319; 
  assign _T_321 = _T_289 ? 5'h9 : _T_320; 
  assign _T_322 = _T_288 ? 5'h8 : _T_321; 
  assign _T_323 = _T_287 ? 5'h7 : _T_322; 
  assign _T_324 = _T_286 ? 5'h6 : _T_323; 
  assign _T_325 = _T_285 ? 5'h5 : _T_324; 
  assign _T_326 = _T_284 ? 5'h4 : _T_325; 
  assign _T_327 = _T_283 ? 5'h3 : _T_326; 
  assign _T_328 = _T_282 ? 5'h2 : _T_327; 
  assign _T_329 = _T_281 ? 5'h1 : _T_328; 
  assign notCDom_normDistReduced2 = _T_280 ? 5'h0 : _T_329; 
  assign _GEN_17 = {{1'd0}, notCDom_normDistReduced2}; 
  assign notCDom_nearNormDist = _GEN_17 << 1; 
  assign _T_330 = {1'b0,$signed(notCDom_nearNormDist)}; 
  assign _GEN_18 = {{3{_T_330[6]}},_T_330}; 
  assign _T_332 = $signed(io_fromPreMul_sExpSum) - $signed(_GEN_18); 
  assign notCDom_sExp = $signed(_T_332); 
  assign _GEN_19 = {{63'd0}, notCDom_absSigSum}; 
  assign _T_333 = _GEN_19 << notCDom_nearNormDist; 
  assign notCDom_mainSig = _T_333[51:23]; 
  assign _T_334 = notCDom_reduced2AbsSigSum[12:0]; 
  assign _T_349 = _T_334[1:0]; 
  assign _T_350 = _T_349 != 2'h0; 
  assign _T_351 = _T_334[3:2]; 
  assign _T_352 = _T_351 != 2'h0; 
  assign _T_353 = _T_334[5:4]; 
  assign _T_354 = _T_353 != 2'h0; 
  assign _T_355 = _T_334[7:6]; 
  assign _T_356 = _T_355 != 2'h0; 
  assign _T_357 = _T_334[9:8]; 
  assign _T_358 = _T_357 != 2'h0; 
  assign _T_359 = _T_334[11:10]; 
  assign _T_360 = _T_359 != 2'h0; 
  assign _T_361 = _T_334[12]; 
  assign _T_363 = {_T_354,_T_352}; 
  assign _T_364 = {_T_363,_T_350}; 
  assign _T_365 = {_T_358,_T_356}; 
  assign _T_366 = {_T_361,_T_360}; 
  assign _T_367 = {_T_366,_T_365}; 
  assign _T_368 = {_T_367,_T_364}; 
  assign _T_369 = notCDom_normDistReduced2[4:1]; 
  assign _T_370 = ~ _T_369; 
  assign _T_371 = $signed(-17'sh10000) >>> _T_370; 
  assign _T_372 = _T_371[6:1]; 
  assign _T_373 = _T_372[3:0]; 
  assign _T_374 = _T_373[1:0]; 
  assign _T_375 = _T_374[0]; 
  assign _T_376 = _T_374[1]; 
  assign _T_377 = {_T_375,_T_376}; 
  assign _T_378 = _T_373[3:2]; 
  assign _T_379 = _T_378[0]; 
  assign _T_380 = _T_378[1]; 
  assign _T_381 = {_T_379,_T_380}; 
  assign _T_382 = {_T_377,_T_381}; 
  assign _T_383 = _T_372[5:4]; 
  assign _T_384 = _T_383[0]; 
  assign _T_385 = _T_383[1]; 
  assign _T_386 = {_T_384,_T_385}; 
  assign _T_387 = {_T_382,_T_386}; 
  assign _GEN_20 = {{1'd0}, _T_387}; 
  assign _T_388 = _T_368 & _GEN_20; 
  assign notCDom_reduced4SigExtra = _T_388 != 7'h0; 
  assign _T_389 = notCDom_mainSig[28:3]; 
  assign _T_390 = notCDom_mainSig[2:0]; 
  assign _T_391 = _T_390 != 3'h0; 
  assign _T_392 = _T_391 | notCDom_reduced4SigExtra; 
  assign notCDom_sig = {_T_389,_T_392}; 
  assign _T_393 = notCDom_sig[26:25]; 
  assign notCDom_completeCancellation = _T_393 == 2'h0; 
  assign _T_394 = io_fromPreMul_signProd ^ notCDom_signSigSum; 
  assign notCDom_sign = notCDom_completeCancellation ? roundingMode_min : _T_394; 
  assign notNaN_isInfProd = io_fromPreMul_isInfA | io_fromPreMul_isInfB; 
  assign notNaN_isInfOut = notNaN_isInfProd | io_fromPreMul_isInfC; 
  assign _T_395 = io_fromPreMul_isZeroA | io_fromPreMul_isZeroB; 
  assign notNaN_addZeros = _T_395 & io_fromPreMul_isZeroC; 
  assign _T_396 = io_fromPreMul_isInfA & io_fromPreMul_isZeroB; 
  assign _T_397 = io_fromPreMul_isSigNaNAny | _T_396; 
  assign _T_398 = io_fromPreMul_isZeroA & io_fromPreMul_isInfB; 
  assign _T_399 = _T_397 | _T_398; 
  assign _T_400 = io_fromPreMul_isNaNAOrB == 1'h0; 
  assign _T_402 = _T_400 & notNaN_isInfProd; 
  assign _T_403 = _T_402 & io_fromPreMul_isInfC; 
  assign _T_404 = _T_403 & io_fromPreMul_doSubMags; 
  assign _T_407 = io_fromPreMul_CIsDominant == 1'h0; 
  assign _T_408 = _T_407 & notCDom_completeCancellation; 
  assign _T_410 = notNaN_isInfProd & io_fromPreMul_signProd; 
  assign _T_411 = io_fromPreMul_isInfC & CDom_sign; 
  assign _T_412 = _T_410 | _T_411; 
  assign _T_413 = roundingMode_min == 1'h0; 
  assign _T_414 = notNaN_addZeros & _T_413; 
  assign _T_415 = _T_414 & io_fromPreMul_signProd; 
  assign _T_416 = _T_415 & CDom_sign; 
  assign _T_417 = _T_412 | _T_416; 
  assign _T_418 = notNaN_addZeros & roundingMode_min; 
  assign _T_419 = io_fromPreMul_signProd | CDom_sign; 
  assign _T_420 = _T_418 & _T_419; 
  assign _T_421 = _T_417 | _T_420; 
  assign _T_422 = notNaN_isInfOut == 1'h0; 
  assign _T_423 = notNaN_addZeros == 1'h0; 
  assign _T_424 = _T_422 & _T_423; 
  assign _T_425 = io_fromPreMul_CIsDominant ? CDom_sign : notCDom_sign; 
  assign _T_426 = _T_424 & _T_425; 
  assign io_invalidExc = _T_399 | _T_404; 
  assign io_rawOut_isNaN = io_fromPreMul_isNaNAOrB | io_fromPreMul_isNaNC; 
  assign io_rawOut_isInf = notNaN_isInfProd | io_fromPreMul_isInfC; 
  assign io_rawOut_isZero = notNaN_addZeros | _T_408; 
  assign io_rawOut_sign = _T_421 | _T_426; 
  assign io_rawOut_sExp = io_fromPreMul_CIsDominant ? $signed(CDom_sExp) : $signed(notCDom_sExp); 
  assign io_rawOut_sig = io_fromPreMul_CIsDominant ? CDom_sig : notCDom_sig; 
endmodule
