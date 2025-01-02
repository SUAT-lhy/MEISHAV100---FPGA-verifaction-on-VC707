module MulDiv( 
  input         clock, 
  input         reset, 
  output        io_req_ready, 
  input         io_req_valid, 
  input  [3:0]  io_req_bits_fn, 
  input         io_req_bits_dw, 
  input  [63:0] io_req_bits_in1, 
  input  [63:0] io_req_bits_in2, 
  input  [4:0]  io_req_bits_tag, 
  input         io_kill, 
  input         io_resp_ready, 
  output        io_resp_valid, 
  output [63:0] io_resp_bits_data, 
  output [4:0]  io_resp_bits_tag 
);
  reg [2:0] state; 
  reg [31:0] _RAND_0;
  reg  req_dw; 
  reg [31:0] _RAND_1;
  reg [4:0] req_tag; 
  reg [31:0] _RAND_2;
  reg [6:0] count; 
  reg [31:0] _RAND_3;
  reg  neg_out; 
  reg [31:0] _RAND_4;
  reg  isHi; 
  reg [31:0] _RAND_5;
  reg  resHi; 
  reg [31:0] _RAND_6;
  reg [64:0] divisor; 
  reg [95:0] _RAND_7;
  reg [129:0] remainder; 
  reg [159:0] _RAND_8;
  wire [3:0] _T_22; 
  wire  cmdMul; 
  wire [3:0] _T_25; 
  wire  _T_26; 
  wire [3:0] _T_27; 
  wire  _T_28; 
  wire  cmdHi; 
  wire [3:0] _T_31; 
  wire  _T_32; 
  wire [3:0] _T_33; 
  wire  _T_34; 
  wire  lhsSigned; 
  wire  _T_38; 
  wire  rhsSigned; 
  wire  _T_41; 
  wire  _T_43; 
  wire  _T_44; 
  wire  _T_45; 
  wire  lhs_sign; 
  wire [31:0] _T_47; 
  wire [31:0] _T_48; 
  wire [31:0] _T_49; 
  wire [31:0] _T_50; 
  wire [63:0] lhs_in; 
  wire  _T_53; 
  wire  _T_54; 
  wire  _T_55; 
  wire  rhs_sign; 
  wire [31:0] _T_57; 
  wire [31:0] _T_58; 
  wire [31:0] _T_59; 
  wire [31:0] _T_60; 
  wire [63:0] rhs_in; 
  wire [64:0] _T_61; 
  wire [65:0] _T_62; 
  wire [65:0] _T_63; 
  wire [64:0] subtractor; 
  wire [63:0] _T_64; 
  wire [63:0] _T_65; 
  wire [63:0] result; 
  wire [64:0] _T_66; 
  wire [64:0] _T_67; 
  wire [63:0] negated_remainder; 
  wire  _T_68; 
  wire  _T_69; 
  wire  _T_70; 
  wire  _T_71; 
  wire  _T_72; 
  wire [64:0] _T_73; 
  wire [128:0] _T_75; 
  wire  _T_76; 
  wire [63:0] _T_77; 
  wire [64:0] _T_78; 
  wire [64:0] _T_79; 
  wire [64:0] _T_80; 
  wire [7:0] _T_81; 
  wire [8:0] _T_82; 
  wire [8:0] _T_83; 
  wire [64:0] _GEN_37; 
  wire [73:0] _T_84; 
  wire [73:0] _GEN_38; 
  wire [73:0] _T_86; 
  wire [73:0] _T_87; 
  wire [55:0] _T_88; 
  wire [73:0] _T_89; 
  wire [129:0] _T_90; 
  wire  _T_91; 
  wire  _T_92; 
  wire [10:0] _T_93; 
  wire [5:0] _T_94; 
  wire [64:0] _T_95; 
  wire [63:0] _T_96; 
  wire  _T_97; 
  wire  _T_99; 
  wire  _T_100; 
  wire  _T_101; 
  wire  _T_102; 
  wire [63:0] _T_103; 
  wire [63:0] _T_104; 
  wire  _T_105; 
  wire  _T_106; 
  wire [11:0] _T_108; 
  wire [11:0] _T_109; 
  wire [10:0] _T_110; 
  wire [5:0] _T_111; 
  wire [128:0] _T_112; 
  wire [64:0] _T_113; 
  wire [129:0] _T_114; 
  wire [63:0] _T_115; 
  wire [128:0] _T_116; 
  wire [64:0] _T_117; 
  wire [63:0] _T_118; 
  wire [65:0] _T_119; 
  wire [129:0] _T_120; 
  wire [6:0] _T_122; 
  wire  _T_123; 
  wire  _T_124; 
  wire  _T_125; 
  wire  _T_126; 
  wire [63:0] _T_127; 
  wire [63:0] _T_128; 
  wire [63:0] _T_129; 
  wire  _T_131; 
  wire [127:0] _T_132; 
  wire [128:0] _T_133; 
  wire  _T_134; 
  wire  _T_138; 
  wire  _T_141; 
  wire [63:0] _T_143; 
  wire [31:0] _T_144; 
  wire [31:0] _T_145; 
  wire  _T_146; 
  wire [15:0] _T_147; 
  wire [15:0] _T_148; 
  wire  _T_149; 
  wire [7:0] _T_150; 
  wire [7:0] _T_151; 
  wire  _T_152; 
  wire [3:0] _T_153; 
  wire [3:0] _T_154; 
  wire  _T_155; 
  wire  _T_156; 
  wire  _T_157; 
  wire  _T_158; 
  wire [1:0] _T_159; 
  wire [1:0] _T_160; 
  wire  _T_161; 
  wire  _T_162; 
  wire  _T_163; 
  wire [1:0] _T_164; 
  wire [1:0] _T_165; 
  wire [1:0] _T_166; 
  wire [2:0] _T_167; 
  wire [3:0] _T_168; 
  wire [3:0] _T_169; 
  wire  _T_170; 
  wire  _T_171; 
  wire  _T_172; 
  wire  _T_173; 
  wire [1:0] _T_174; 
  wire [1:0] _T_175; 
  wire  _T_176; 
  wire  _T_177; 
  wire  _T_178; 
  wire [1:0] _T_179; 
  wire [1:0] _T_180; 
  wire [1:0] _T_181; 
  wire [2:0] _T_182; 
  wire [2:0] _T_183; 
  wire [3:0] _T_184; 
  wire [7:0] _T_185; 
  wire [7:0] _T_186; 
  wire  _T_187; 
  wire [3:0] _T_188; 
  wire [3:0] _T_189; 
  wire  _T_190; 
  wire  _T_191; 
  wire  _T_192; 
  wire  _T_193; 
  wire [1:0] _T_194; 
  wire [1:0] _T_195; 
  wire  _T_196; 
  wire  _T_197; 
  wire  _T_198; 
  wire [1:0] _T_199; 
  wire [1:0] _T_200; 
  wire [1:0] _T_201; 
  wire [2:0] _T_202; 
  wire [3:0] _T_203; 
  wire [3:0] _T_204; 
  wire  _T_205; 
  wire  _T_206; 
  wire  _T_207; 
  wire  _T_208; 
  wire [1:0] _T_209; 
  wire [1:0] _T_210; 
  wire  _T_211; 
  wire  _T_212; 
  wire  _T_213; 
  wire [1:0] _T_214; 
  wire [1:0] _T_215; 
  wire [1:0] _T_216; 
  wire [2:0] _T_217; 
  wire [2:0] _T_218; 
  wire [3:0] _T_219; 
  wire [3:0] _T_220; 
  wire [4:0] _T_221; 
  wire [15:0] _T_222; 
  wire [15:0] _T_223; 
  wire  _T_224; 
  wire [7:0] _T_225; 
  wire [7:0] _T_226; 
  wire  _T_227; 
  wire [3:0] _T_228; 
  wire [3:0] _T_229; 
  wire  _T_230; 
  wire  _T_231; 
  wire  _T_232; 
  wire  _T_233; 
  wire [1:0] _T_234; 
  wire [1:0] _T_235; 
  wire  _T_236; 
  wire  _T_237; 
  wire  _T_238; 
  wire [1:0] _T_239; 
  wire [1:0] _T_240; 
  wire [1:0] _T_241; 
  wire [2:0] _T_242; 
  wire [3:0] _T_243; 
  wire [3:0] _T_244; 
  wire  _T_245; 
  wire  _T_246; 
  wire  _T_247; 
  wire  _T_248; 
  wire [1:0] _T_249; 
  wire [1:0] _T_250; 
  wire  _T_251; 
  wire  _T_252; 
  wire  _T_253; 
  wire [1:0] _T_254; 
  wire [1:0] _T_255; 
  wire [1:0] _T_256; 
  wire [2:0] _T_257; 
  wire [2:0] _T_258; 
  wire [3:0] _T_259; 
  wire [7:0] _T_260; 
  wire [7:0] _T_261; 
  wire  _T_262; 
  wire [3:0] _T_263; 
  wire [3:0] _T_264; 
  wire  _T_265; 
  wire  _T_266; 
  wire  _T_267; 
  wire  _T_268; 
  wire [1:0] _T_269; 
  wire [1:0] _T_270; 
  wire  _T_271; 
  wire  _T_272; 
  wire  _T_273; 
  wire [1:0] _T_274; 
  wire [1:0] _T_275; 
  wire [1:0] _T_276; 
  wire [2:0] _T_277; 
  wire [3:0] _T_278; 
  wire [3:0] _T_279; 
  wire  _T_280; 
  wire  _T_281; 
  wire  _T_282; 
  wire  _T_283; 
  wire [1:0] _T_284; 
  wire [1:0] _T_285; 
  wire  _T_286; 
  wire  _T_287; 
  wire  _T_288; 
  wire [1:0] _T_289; 
  wire [1:0] _T_290; 
  wire [1:0] _T_291; 
  wire [2:0] _T_292; 
  wire [2:0] _T_293; 
  wire [3:0] _T_294; 
  wire [3:0] _T_295; 
  wire [4:0] _T_296; 
  wire [4:0] _T_297; 
  wire [5:0] _T_298; 
  wire [31:0] _T_301; 
  wire [31:0] _T_302; 
  wire  _T_303; 
  wire [15:0] _T_304; 
  wire [15:0] _T_305; 
  wire  _T_306; 
  wire [7:0] _T_307; 
  wire [7:0] _T_308; 
  wire  _T_309; 
  wire [3:0] _T_310; 
  wire [3:0] _T_311; 
  wire  _T_312; 
  wire  _T_313; 
  wire  _T_314; 
  wire  _T_315; 
  wire [1:0] _T_316; 
  wire [1:0] _T_317; 
  wire  _T_318; 
  wire  _T_319; 
  wire  _T_320; 
  wire [1:0] _T_321; 
  wire [1:0] _T_322; 
  wire [1:0] _T_323; 
  wire [2:0] _T_324; 
  wire [3:0] _T_325; 
  wire [3:0] _T_326; 
  wire  _T_327; 
  wire  _T_328; 
  wire  _T_329; 
  wire  _T_330; 
  wire [1:0] _T_331; 
  wire [1:0] _T_332; 
  wire  _T_333; 
  wire  _T_334; 
  wire  _T_335; 
  wire [1:0] _T_336; 
  wire [1:0] _T_337; 
  wire [1:0] _T_338; 
  wire [2:0] _T_339; 
  wire [2:0] _T_340; 
  wire [3:0] _T_341; 
  wire [7:0] _T_342; 
  wire [7:0] _T_343; 
  wire  _T_344; 
  wire [3:0] _T_345; 
  wire [3:0] _T_346; 
  wire  _T_347; 
  wire  _T_348; 
  wire  _T_349; 
  wire  _T_350; 
  wire [1:0] _T_351; 
  wire [1:0] _T_352; 
  wire  _T_353; 
  wire  _T_354; 
  wire  _T_355; 
  wire [1:0] _T_356; 
  wire [1:0] _T_357; 
  wire [1:0] _T_358; 
  wire [2:0] _T_359; 
  wire [3:0] _T_360; 
  wire [3:0] _T_361; 
  wire  _T_362; 
  wire  _T_363; 
  wire  _T_364; 
  wire  _T_365; 
  wire [1:0] _T_366; 
  wire [1:0] _T_367; 
  wire  _T_368; 
  wire  _T_369; 
  wire  _T_370; 
  wire [1:0] _T_371; 
  wire [1:0] _T_372; 
  wire [1:0] _T_373; 
  wire [2:0] _T_374; 
  wire [2:0] _T_375; 
  wire [3:0] _T_376; 
  wire [3:0] _T_377; 
  wire [4:0] _T_378; 
  wire [15:0] _T_379; 
  wire [15:0] _T_380; 
  wire  _T_381; 
  wire [7:0] _T_382; 
  wire [7:0] _T_383; 
  wire  _T_384; 
  wire [3:0] _T_385; 
  wire [3:0] _T_386; 
  wire  _T_387; 
  wire  _T_388; 
  wire  _T_389; 
  wire  _T_390; 
  wire [1:0] _T_391; 
  wire [1:0] _T_392; 
  wire  _T_393; 
  wire  _T_394; 
  wire  _T_395; 
  wire [1:0] _T_396; 
  wire [1:0] _T_397; 
  wire [1:0] _T_398; 
  wire [2:0] _T_399; 
  wire [3:0] _T_400; 
  wire [3:0] _T_401; 
  wire  _T_402; 
  wire  _T_403; 
  wire  _T_404; 
  wire  _T_405; 
  wire [1:0] _T_406; 
  wire [1:0] _T_407; 
  wire  _T_408; 
  wire  _T_409; 
  wire  _T_410; 
  wire [1:0] _T_411; 
  wire [1:0] _T_412; 
  wire [1:0] _T_413; 
  wire [2:0] _T_414; 
  wire [2:0] _T_415; 
  wire [3:0] _T_416; 
  wire [7:0] _T_417; 
  wire [7:0] _T_418; 
  wire  _T_419; 
  wire [3:0] _T_420; 
  wire [3:0] _T_421; 
  wire  _T_422; 
  wire  _T_423; 
  wire  _T_424; 
  wire  _T_425; 
  wire [1:0] _T_426; 
  wire [1:0] _T_427; 
  wire  _T_428; 
  wire  _T_429; 
  wire  _T_430; 
  wire [1:0] _T_431; 
  wire [1:0] _T_432; 
  wire [1:0] _T_433; 
  wire [2:0] _T_434; 
  wire [3:0] _T_435; 
  wire [3:0] _T_436; 
  wire  _T_437; 
  wire  _T_438; 
  wire  _T_439; 
  wire  _T_440; 
  wire [1:0] _T_441; 
  wire [1:0] _T_442; 
  wire  _T_443; 
  wire  _T_444; 
  wire  _T_445; 
  wire [1:0] _T_446; 
  wire [1:0] _T_447; 
  wire [1:0] _T_448; 
  wire [2:0] _T_449; 
  wire [2:0] _T_450; 
  wire [3:0] _T_451; 
  wire [3:0] _T_452; 
  wire [4:0] _T_453; 
  wire [4:0] _T_454; 
  wire [5:0] _T_455; 
  wire [6:0] _T_458; 
  wire [6:0] _T_459; 
  wire [5:0] _T_460; 
  wire [5:0] _T_461; 
  wire  _T_463; 
  wire  _T_464; 
  wire  _T_465; 
  wire  _T_466; 
  wire [126:0] _GEN_39; 
  wire [126:0] _T_468; 
  wire [128:0] _GEN_16; 
  wire  _T_471; 
  wire  _T_472; 
  wire  _T_473; 
  wire  _T_474; 
  wire  _T_475; 
  wire  _T_480; 
  wire [2:0] _T_481; 
  wire  _T_482; 
  wire [64:0] _T_484; 
  wire [2:0] _T_486; 
  wire  outMul; 
  wire  _T_489; 
  wire  _T_492; 
  wire [31:0] _T_493; 
  wire [31:0] _T_494; 
  wire [31:0] loOut; 
  wire  _T_497; 
  wire [31:0] _T_499; 
  wire [31:0] hiOut; 
  wire  _T_502; 
  wire  _T_503; 
  assign _T_22 = io_req_bits_fn & 4'h4; 
  assign cmdMul = _T_22 == 4'h0; 
  assign _T_25 = io_req_bits_fn & 4'h5; 
  assign _T_26 = _T_25 == 4'h1; 
  assign _T_27 = io_req_bits_fn & 4'h2; 
  assign _T_28 = _T_27 == 4'h2; 
  assign cmdHi = _T_26 | _T_28; 
  assign _T_31 = io_req_bits_fn & 4'h6; 
  assign _T_32 = _T_31 == 4'h0; 
  assign _T_33 = io_req_bits_fn & 4'h1; 
  assign _T_34 = _T_33 == 4'h0; 
  assign lhsSigned = _T_32 | _T_34; 
  assign _T_38 = _T_25 == 4'h4; 
  assign rhsSigned = _T_32 | _T_38; 
  assign _T_41 = io_req_bits_dw == 1'h0; 
  assign _T_43 = io_req_bits_in1[31]; 
  assign _T_44 = io_req_bits_in1[63]; 
  assign _T_45 = _T_41 ? _T_43 : _T_44; 
  assign lhs_sign = lhsSigned & _T_45; 
  assign _T_47 = lhs_sign ? 32'hffffffff : 32'h0; 
  assign _T_48 = io_req_bits_in1[63:32]; 
  assign _T_49 = _T_41 ? _T_47 : _T_48; 
  assign _T_50 = io_req_bits_in1[31:0]; 
  assign lhs_in = {_T_49,_T_50}; 
  assign _T_53 = io_req_bits_in2[31]; 
  assign _T_54 = io_req_bits_in2[63]; 
  assign _T_55 = _T_41 ? _T_53 : _T_54; 
  assign rhs_sign = rhsSigned & _T_55; 
  assign _T_57 = rhs_sign ? 32'hffffffff : 32'h0; 
  assign _T_58 = io_req_bits_in2[63:32]; 
  assign _T_59 = _T_41 ? _T_57 : _T_58; 
  assign _T_60 = io_req_bits_in2[31:0]; 
  assign rhs_in = {_T_59,_T_60}; 
  assign _T_61 = remainder[128:64]; 
  assign _T_62 = _T_61 - divisor; 
  assign _T_63 = $unsigned(_T_62); 
  assign subtractor = _T_63[64:0]; 
  assign _T_64 = remainder[128:65]; 
  assign _T_65 = remainder[63:0]; 
  assign result = resHi ? _T_64 : _T_65; 
  assign _T_66 = 64'h0 - result; 
  assign _T_67 = $unsigned(_T_66); 
  assign negated_remainder = _T_67[63:0]; 
  assign _T_68 = state == 3'h1; 
  assign _T_69 = remainder[63]; 
  assign _T_70 = divisor[63]; 
  assign _T_71 = state == 3'h5; 
  assign _T_72 = state == 3'h2; 
  assign _T_73 = remainder[129:65]; 
  assign _T_75 = {_T_73,_T_65}; 
  assign _T_76 = remainder[64]; 
  assign _T_77 = _T_75[63:0]; 
  assign _T_78 = _T_75[128:64]; 
  assign _T_79 = $signed(_T_78); 
  assign _T_80 = $signed(divisor); 
  assign _T_81 = _T_77[7:0]; 
  assign _T_82 = {_T_76,_T_81}; 
  assign _T_83 = $signed(_T_82); 
  assign _GEN_37 = {{56{_T_83[8]}},_T_83}; 
  assign _T_84 = $signed(_GEN_37) * $signed(_T_80); 
  assign _GEN_38 = {{9{_T_79[64]}},_T_79}; 
  assign _T_86 = $signed(_T_84) + $signed(_GEN_38); 
  assign _T_87 = $signed(_T_86); 
  assign _T_88 = _T_77[63:8]; 
  assign _T_89 = $unsigned(_T_87); 
  assign _T_90 = {_T_89,_T_88}; 
  assign _T_91 = count == 7'h6; 
  assign _T_92 = _T_91 & neg_out; 
  assign _T_93 = count * 7'h8; 
  assign _T_94 = _T_93[5:0]; 
  assign _T_95 = $signed(-65'sh10000000000000000) >>> _T_94; 
  assign _T_96 = _T_95[63:0]; 
  assign _T_97 = count != 7'h7; 
  assign _T_99 = count != 7'h0; 
  assign _T_100 = _T_97 & _T_99; 
  assign _T_101 = isHi == 1'h0; 
  assign _T_102 = _T_100 & _T_101; 
  assign _T_103 = ~ _T_96; 
  assign _T_104 = _T_77 & _T_103; 
  assign _T_105 = _T_104 == 64'h0; 
  assign _T_106 = _T_102 & _T_105; 
  assign _T_108 = 11'h40 - _T_93; 
  assign _T_109 = $unsigned(_T_108); 
  assign _T_110 = _T_109[10:0]; 
  assign _T_111 = _T_110[5:0]; 
  assign _T_112 = _T_75 >> _T_111; 
  assign _T_113 = _T_90[128:64]; 
  assign _T_114 = _T_106 ? {{1'd0}, _T_112} : _T_90; 
  assign _T_115 = _T_114[63:0]; 
  assign _T_116 = {_T_113,_T_115}; 
  assign _T_117 = _T_116[128:64]; 
  assign _T_118 = _T_116[63:0]; 
  assign _T_119 = {_T_117,_T_92}; 
  assign _T_120 = {_T_119,_T_118}; 
  assign _T_122 = count + 7'h1; 
  assign _T_123 = count == 7'h7; 
  assign _T_124 = _T_106 | _T_123; 
  assign _T_125 = state == 3'h3; 
  assign _T_126 = subtractor[64]; 
  assign _T_127 = remainder[127:64]; 
  assign _T_128 = subtractor[63:0]; 
  assign _T_129 = _T_126 ? _T_127 : _T_128; 
  assign _T_131 = _T_126 == 1'h0; 
  assign _T_132 = {_T_129,_T_65}; 
  assign _T_133 = {_T_132,_T_131}; 
  assign _T_134 = count == 7'h40; 
  assign _T_138 = count == 7'h0; 
  assign _T_141 = _T_138 & _T_131; 
  assign _T_143 = divisor[63:0]; 
  assign _T_144 = _T_143[63:32]; 
  assign _T_145 = _T_143[31:0]; 
  assign _T_146 = _T_144 != 32'h0; 
  assign _T_147 = _T_144[31:16]; 
  assign _T_148 = _T_144[15:0]; 
  assign _T_149 = _T_147 != 16'h0; 
  assign _T_150 = _T_147[15:8]; 
  assign _T_151 = _T_147[7:0]; 
  assign _T_152 = _T_150 != 8'h0; 
  assign _T_153 = _T_150[7:4]; 
  assign _T_154 = _T_150[3:0]; 
  assign _T_155 = _T_153 != 4'h0; 
  assign _T_156 = _T_153[3]; 
  assign _T_157 = _T_153[2]; 
  assign _T_158 = _T_153[1]; 
  assign _T_159 = _T_157 ? 2'h2 : {{1'd0}, _T_158}; 
  assign _T_160 = _T_156 ? 2'h3 : _T_159; 
  assign _T_161 = _T_154[3]; 
  assign _T_162 = _T_154[2]; 
  assign _T_163 = _T_154[1]; 
  assign _T_164 = _T_162 ? 2'h2 : {{1'd0}, _T_163}; 
  assign _T_165 = _T_161 ? 2'h3 : _T_164; 
  assign _T_166 = _T_155 ? _T_160 : _T_165; 
  assign _T_167 = {_T_155,_T_166}; 
  assign _T_168 = _T_151[7:4]; 
  assign _T_169 = _T_151[3:0]; 
  assign _T_170 = _T_168 != 4'h0; 
  assign _T_171 = _T_168[3]; 
  assign _T_172 = _T_168[2]; 
  assign _T_173 = _T_168[1]; 
  assign _T_174 = _T_172 ? 2'h2 : {{1'd0}, _T_173}; 
  assign _T_175 = _T_171 ? 2'h3 : _T_174; 
  assign _T_176 = _T_169[3]; 
  assign _T_177 = _T_169[2]; 
  assign _T_178 = _T_169[1]; 
  assign _T_179 = _T_177 ? 2'h2 : {{1'd0}, _T_178}; 
  assign _T_180 = _T_176 ? 2'h3 : _T_179; 
  assign _T_181 = _T_170 ? _T_175 : _T_180; 
  assign _T_182 = {_T_170,_T_181}; 
  assign _T_183 = _T_152 ? _T_167 : _T_182; 
  assign _T_184 = {_T_152,_T_183}; 
  assign _T_185 = _T_148[15:8]; 
  assign _T_186 = _T_148[7:0]; 
  assign _T_187 = _T_185 != 8'h0; 
  assign _T_188 = _T_185[7:4]; 
  assign _T_189 = _T_185[3:0]; 
  assign _T_190 = _T_188 != 4'h0; 
  assign _T_191 = _T_188[3]; 
  assign _T_192 = _T_188[2]; 
  assign _T_193 = _T_188[1]; 
  assign _T_194 = _T_192 ? 2'h2 : {{1'd0}, _T_193}; 
  assign _T_195 = _T_191 ? 2'h3 : _T_194; 
  assign _T_196 = _T_189[3]; 
  assign _T_197 = _T_189[2]; 
  assign _T_198 = _T_189[1]; 
  assign _T_199 = _T_197 ? 2'h2 : {{1'd0}, _T_198}; 
  assign _T_200 = _T_196 ? 2'h3 : _T_199; 
  assign _T_201 = _T_190 ? _T_195 : _T_200; 
  assign _T_202 = {_T_190,_T_201}; 
  assign _T_203 = _T_186[7:4]; 
  assign _T_204 = _T_186[3:0]; 
  assign _T_205 = _T_203 != 4'h0; 
  assign _T_206 = _T_203[3]; 
  assign _T_207 = _T_203[2]; 
  assign _T_208 = _T_203[1]; 
  assign _T_209 = _T_207 ? 2'h2 : {{1'd0}, _T_208}; 
  assign _T_210 = _T_206 ? 2'h3 : _T_209; 
  assign _T_211 = _T_204[3]; 
  assign _T_212 = _T_204[2]; 
  assign _T_213 = _T_204[1]; 
  assign _T_214 = _T_212 ? 2'h2 : {{1'd0}, _T_213}; 
  assign _T_215 = _T_211 ? 2'h3 : _T_214; 
  assign _T_216 = _T_205 ? _T_210 : _T_215; 
  assign _T_217 = {_T_205,_T_216}; 
  assign _T_218 = _T_187 ? _T_202 : _T_217; 
  assign _T_219 = {_T_187,_T_218}; 
  assign _T_220 = _T_149 ? _T_184 : _T_219; 
  assign _T_221 = {_T_149,_T_220}; 
  assign _T_222 = _T_145[31:16]; 
  assign _T_223 = _T_145[15:0]; 
  assign _T_224 = _T_222 != 16'h0; 
  assign _T_225 = _T_222[15:8]; 
  assign _T_226 = _T_222[7:0]; 
  assign _T_227 = _T_225 != 8'h0; 
  assign _T_228 = _T_225[7:4]; 
  assign _T_229 = _T_225[3:0]; 
  assign _T_230 = _T_228 != 4'h0; 
  assign _T_231 = _T_228[3]; 
  assign _T_232 = _T_228[2]; 
  assign _T_233 = _T_228[1]; 
  assign _T_234 = _T_232 ? 2'h2 : {{1'd0}, _T_233}; 
  assign _T_235 = _T_231 ? 2'h3 : _T_234; 
  assign _T_236 = _T_229[3]; 
  assign _T_237 = _T_229[2]; 
  assign _T_238 = _T_229[1]; 
  assign _T_239 = _T_237 ? 2'h2 : {{1'd0}, _T_238}; 
  assign _T_240 = _T_236 ? 2'h3 : _T_239; 
  assign _T_241 = _T_230 ? _T_235 : _T_240; 
  assign _T_242 = {_T_230,_T_241}; 
  assign _T_243 = _T_226[7:4]; 
  assign _T_244 = _T_226[3:0]; 
  assign _T_245 = _T_243 != 4'h0; 
  assign _T_246 = _T_243[3]; 
  assign _T_247 = _T_243[2]; 
  assign _T_248 = _T_243[1]; 
  assign _T_249 = _T_247 ? 2'h2 : {{1'd0}, _T_248}; 
  assign _T_250 = _T_246 ? 2'h3 : _T_249; 
  assign _T_251 = _T_244[3]; 
  assign _T_252 = _T_244[2]; 
  assign _T_253 = _T_244[1]; 
  assign _T_254 = _T_252 ? 2'h2 : {{1'd0}, _T_253}; 
  assign _T_255 = _T_251 ? 2'h3 : _T_254; 
  assign _T_256 = _T_245 ? _T_250 : _T_255; 
  assign _T_257 = {_T_245,_T_256}; 
  assign _T_258 = _T_227 ? _T_242 : _T_257; 
  assign _T_259 = {_T_227,_T_258}; 
  assign _T_260 = _T_223[15:8]; 
  assign _T_261 = _T_223[7:0]; 
  assign _T_262 = _T_260 != 8'h0; 
  assign _T_263 = _T_260[7:4]; 
  assign _T_264 = _T_260[3:0]; 
  assign _T_265 = _T_263 != 4'h0; 
  assign _T_266 = _T_263[3]; 
  assign _T_267 = _T_263[2]; 
  assign _T_268 = _T_263[1]; 
  assign _T_269 = _T_267 ? 2'h2 : {{1'd0}, _T_268}; 
  assign _T_270 = _T_266 ? 2'h3 : _T_269; 
  assign _T_271 = _T_264[3]; 
  assign _T_272 = _T_264[2]; 
  assign _T_273 = _T_264[1]; 
  assign _T_274 = _T_272 ? 2'h2 : {{1'd0}, _T_273}; 
  assign _T_275 = _T_271 ? 2'h3 : _T_274; 
  assign _T_276 = _T_265 ? _T_270 : _T_275; 
  assign _T_277 = {_T_265,_T_276}; 
  assign _T_278 = _T_261[7:4]; 
  assign _T_279 = _T_261[3:0]; 
  assign _T_280 = _T_278 != 4'h0; 
  assign _T_281 = _T_278[3]; 
  assign _T_282 = _T_278[2]; 
  assign _T_283 = _T_278[1]; 
  assign _T_284 = _T_282 ? 2'h2 : {{1'd0}, _T_283}; 
  assign _T_285 = _T_281 ? 2'h3 : _T_284; 
  assign _T_286 = _T_279[3]; 
  assign _T_287 = _T_279[2]; 
  assign _T_288 = _T_279[1]; 
  assign _T_289 = _T_287 ? 2'h2 : {{1'd0}, _T_288}; 
  assign _T_290 = _T_286 ? 2'h3 : _T_289; 
  assign _T_291 = _T_280 ? _T_285 : _T_290; 
  assign _T_292 = {_T_280,_T_291}; 
  assign _T_293 = _T_262 ? _T_277 : _T_292; 
  assign _T_294 = {_T_262,_T_293}; 
  assign _T_295 = _T_224 ? _T_259 : _T_294; 
  assign _T_296 = {_T_224,_T_295}; 
  assign _T_297 = _T_146 ? _T_221 : _T_296; 
  assign _T_298 = {_T_146,_T_297}; 
  assign _T_301 = _T_65[63:32]; 
  assign _T_302 = _T_65[31:0]; 
  assign _T_303 = _T_301 != 32'h0; 
  assign _T_304 = _T_301[31:16]; 
  assign _T_305 = _T_301[15:0]; 
  assign _T_306 = _T_304 != 16'h0; 
  assign _T_307 = _T_304[15:8]; 
  assign _T_308 = _T_304[7:0]; 
  assign _T_309 = _T_307 != 8'h0; 
  assign _T_310 = _T_307[7:4]; 
  assign _T_311 = _T_307[3:0]; 
  assign _T_312 = _T_310 != 4'h0; 
  assign _T_313 = _T_310[3]; 
  assign _T_314 = _T_310[2]; 
  assign _T_315 = _T_310[1]; 
  assign _T_316 = _T_314 ? 2'h2 : {{1'd0}, _T_315}; 
  assign _T_317 = _T_313 ? 2'h3 : _T_316; 
  assign _T_318 = _T_311[3]; 
  assign _T_319 = _T_311[2]; 
  assign _T_320 = _T_311[1]; 
  assign _T_321 = _T_319 ? 2'h2 : {{1'd0}, _T_320}; 
  assign _T_322 = _T_318 ? 2'h3 : _T_321; 
  assign _T_323 = _T_312 ? _T_317 : _T_322; 
  assign _T_324 = {_T_312,_T_323}; 
  assign _T_325 = _T_308[7:4]; 
  assign _T_326 = _T_308[3:0]; 
  assign _T_327 = _T_325 != 4'h0; 
  assign _T_328 = _T_325[3]; 
  assign _T_329 = _T_325[2]; 
  assign _T_330 = _T_325[1]; 
  assign _T_331 = _T_329 ? 2'h2 : {{1'd0}, _T_330}; 
  assign _T_332 = _T_328 ? 2'h3 : _T_331; 
  assign _T_333 = _T_326[3]; 
  assign _T_334 = _T_326[2]; 
  assign _T_335 = _T_326[1]; 
  assign _T_336 = _T_334 ? 2'h2 : {{1'd0}, _T_335}; 
  assign _T_337 = _T_333 ? 2'h3 : _T_336; 
  assign _T_338 = _T_327 ? _T_332 : _T_337; 
  assign _T_339 = {_T_327,_T_338}; 
  assign _T_340 = _T_309 ? _T_324 : _T_339; 
  assign _T_341 = {_T_309,_T_340}; 
  assign _T_342 = _T_305[15:8]; 
  assign _T_343 = _T_305[7:0]; 
  assign _T_344 = _T_342 != 8'h0; 
  assign _T_345 = _T_342[7:4]; 
  assign _T_346 = _T_342[3:0]; 
  assign _T_347 = _T_345 != 4'h0; 
  assign _T_348 = _T_345[3]; 
  assign _T_349 = _T_345[2]; 
  assign _T_350 = _T_345[1]; 
  assign _T_351 = _T_349 ? 2'h2 : {{1'd0}, _T_350}; 
  assign _T_352 = _T_348 ? 2'h3 : _T_351; 
  assign _T_353 = _T_346[3]; 
  assign _T_354 = _T_346[2]; 
  assign _T_355 = _T_346[1]; 
  assign _T_356 = _T_354 ? 2'h2 : {{1'd0}, _T_355}; 
  assign _T_357 = _T_353 ? 2'h3 : _T_356; 
  assign _T_358 = _T_347 ? _T_352 : _T_357; 
  assign _T_359 = {_T_347,_T_358}; 
  assign _T_360 = _T_343[7:4]; 
  assign _T_361 = _T_343[3:0]; 
  assign _T_362 = _T_360 != 4'h0; 
  assign _T_363 = _T_360[3]; 
  assign _T_364 = _T_360[2]; 
  assign _T_365 = _T_360[1]; 
  assign _T_366 = _T_364 ? 2'h2 : {{1'd0}, _T_365}; 
  assign _T_367 = _T_363 ? 2'h3 : _T_366; 
  assign _T_368 = _T_361[3]; 
  assign _T_369 = _T_361[2]; 
  assign _T_370 = _T_361[1]; 
  assign _T_371 = _T_369 ? 2'h2 : {{1'd0}, _T_370}; 
  assign _T_372 = _T_368 ? 2'h3 : _T_371; 
  assign _T_373 = _T_362 ? _T_367 : _T_372; 
  assign _T_374 = {_T_362,_T_373}; 
  assign _T_375 = _T_344 ? _T_359 : _T_374; 
  assign _T_376 = {_T_344,_T_375}; 
  assign _T_377 = _T_306 ? _T_341 : _T_376; 
  assign _T_378 = {_T_306,_T_377}; 
  assign _T_379 = _T_302[31:16]; 
  assign _T_380 = _T_302[15:0]; 
  assign _T_381 = _T_379 != 16'h0; 
  assign _T_382 = _T_379[15:8]; 
  assign _T_383 = _T_379[7:0]; 
  assign _T_384 = _T_382 != 8'h0; 
  assign _T_385 = _T_382[7:4]; 
  assign _T_386 = _T_382[3:0]; 
  assign _T_387 = _T_385 != 4'h0; 
  assign _T_388 = _T_385[3]; 
  assign _T_389 = _T_385[2]; 
  assign _T_390 = _T_385[1]; 
  assign _T_391 = _T_389 ? 2'h2 : {{1'd0}, _T_390}; 
  assign _T_392 = _T_388 ? 2'h3 : _T_391; 
  assign _T_393 = _T_386[3]; 
  assign _T_394 = _T_386[2]; 
  assign _T_395 = _T_386[1]; 
  assign _T_396 = _T_394 ? 2'h2 : {{1'd0}, _T_395}; 
  assign _T_397 = _T_393 ? 2'h3 : _T_396; 
  assign _T_398 = _T_387 ? _T_392 : _T_397; 
  assign _T_399 = {_T_387,_T_398}; 
  assign _T_400 = _T_383[7:4]; 
  assign _T_401 = _T_383[3:0]; 
  assign _T_402 = _T_400 != 4'h0; 
  assign _T_403 = _T_400[3]; 
  assign _T_404 = _T_400[2]; 
  assign _T_405 = _T_400[1]; 
  assign _T_406 = _T_404 ? 2'h2 : {{1'd0}, _T_405}; 
  assign _T_407 = _T_403 ? 2'h3 : _T_406; 
  assign _T_408 = _T_401[3]; 
  assign _T_409 = _T_401[2]; 
  assign _T_410 = _T_401[1]; 
  assign _T_411 = _T_409 ? 2'h2 : {{1'd0}, _T_410}; 
  assign _T_412 = _T_408 ? 2'h3 : _T_411; 
  assign _T_413 = _T_402 ? _T_407 : _T_412; 
  assign _T_414 = {_T_402,_T_413}; 
  assign _T_415 = _T_384 ? _T_399 : _T_414; 
  assign _T_416 = {_T_384,_T_415}; 
  assign _T_417 = _T_380[15:8]; 
  assign _T_418 = _T_380[7:0]; 
  assign _T_419 = _T_417 != 8'h0; 
  assign _T_420 = _T_417[7:4]; 
  assign _T_421 = _T_417[3:0]; 
  assign _T_422 = _T_420 != 4'h0; 
  assign _T_423 = _T_420[3]; 
  assign _T_424 = _T_420[2]; 
  assign _T_425 = _T_420[1]; 
  assign _T_426 = _T_424 ? 2'h2 : {{1'd0}, _T_425}; 
  assign _T_427 = _T_423 ? 2'h3 : _T_426; 
  assign _T_428 = _T_421[3]; 
  assign _T_429 = _T_421[2]; 
  assign _T_430 = _T_421[1]; 
  assign _T_431 = _T_429 ? 2'h2 : {{1'd0}, _T_430}; 
  assign _T_432 = _T_428 ? 2'h3 : _T_431; 
  assign _T_433 = _T_422 ? _T_427 : _T_432; 
  assign _T_434 = {_T_422,_T_433}; 
  assign _T_435 = _T_418[7:4]; 
  assign _T_436 = _T_418[3:0]; 
  assign _T_437 = _T_435 != 4'h0; 
  assign _T_438 = _T_435[3]; 
  assign _T_439 = _T_435[2]; 
  assign _T_440 = _T_435[1]; 
  assign _T_441 = _T_439 ? 2'h2 : {{1'd0}, _T_440}; 
  assign _T_442 = _T_438 ? 2'h3 : _T_441; 
  assign _T_443 = _T_436[3]; 
  assign _T_444 = _T_436[2]; 
  assign _T_445 = _T_436[1]; 
  assign _T_446 = _T_444 ? 2'h2 : {{1'd0}, _T_445}; 
  assign _T_447 = _T_443 ? 2'h3 : _T_446; 
  assign _T_448 = _T_437 ? _T_442 : _T_447; 
  assign _T_449 = {_T_437,_T_448}; 
  assign _T_450 = _T_419 ? _T_434 : _T_449; 
  assign _T_451 = {_T_419,_T_450}; 
  assign _T_452 = _T_381 ? _T_416 : _T_451; 
  assign _T_453 = {_T_381,_T_452}; 
  assign _T_454 = _T_303 ? _T_378 : _T_453; 
  assign _T_455 = {_T_303,_T_454}; 
  assign _T_458 = _T_455 - _T_298; 
  assign _T_459 = $unsigned(_T_458); 
  assign _T_460 = _T_459[5:0]; 
  assign _T_461 = ~ _T_460; 
  assign _T_463 = _T_141 == 1'h0; 
  assign _T_464 = _T_138 & _T_463; 
  assign _T_465 = _T_461 >= 6'h1; 
  assign _T_466 = _T_464 & _T_465; 
  assign _GEN_39 = {{63'd0}, _T_65}; 
  assign _T_468 = _GEN_39 << _T_461; 
  assign _GEN_16 = _T_466 ? {{2'd0}, _T_468} : _T_133; 
  assign _T_471 = _T_141 & _T_101; 
  assign _T_472 = io_resp_ready & io_resp_valid; 
  assign _T_473 = _T_472 | io_kill; 
  assign _T_474 = io_req_ready & io_req_valid; 
  assign _T_475 = lhs_sign | rhs_sign; 
  assign _T_480 = cmdMul & _T_41; 
  assign _T_481 = _T_480 ? 3'h4 : 3'h0; 
  assign _T_482 = lhs_sign != rhs_sign; 
  assign _T_484 = {rhs_sign,rhs_in}; 
  assign _T_486 = state & 3'h1; 
  assign outMul = _T_486 == 3'h0; 
  assign _T_489 = req_dw == 1'h0; 
  assign _T_492 = _T_489 & outMul; 
  assign _T_493 = result[63:32]; 
  assign _T_494 = result[31:0]; 
  assign loOut = _T_492 ? _T_493 : _T_494; 
  assign _T_497 = loOut[31]; 
  assign _T_499 = _T_497 ? 32'hffffffff : 32'h0; 
  assign hiOut = _T_489 ? _T_499 : _T_493; 
  assign _T_502 = state == 3'h6; 
  assign _T_503 = state == 3'h7; 
  assign io_req_ready = state == 3'h0; 
  assign io_resp_valid = _T_502 | _T_503; 
  assign io_resp_bits_data = {hiOut,loOut}; 
  assign io_resp_bits_tag = req_tag; 
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
  state = _RAND_0[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  req_dw = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  req_tag = _RAND_2[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  count = _RAND_3[6:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  neg_out = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  isHi = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  resHi = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {3{`RANDOM}};
  divisor = _RAND_7[64:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {5{`RANDOM}};
  remainder = _RAND_8[129:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      state <= 3'h0;
    end else begin
      if (_T_474) begin
        if (cmdMul) begin
          state <= 3'h2;
        end else begin
          if (_T_475) begin
            state <= 3'h1;
          end else begin
            state <= 3'h3;
          end
        end
      end else begin
        if (_T_473) begin
          state <= 3'h0;
        end else begin
          if (_T_125) begin
            if (_T_134) begin
              if (neg_out) begin
                state <= 3'h5;
              end else begin
                state <= 3'h7;
              end
            end else begin
              if (_T_72) begin
                if (_T_124) begin
                  state <= 3'h6;
                end else begin
                  if (_T_71) begin
                    state <= 3'h7;
                  end else begin
                    if (_T_68) begin
                      state <= 3'h3;
                    end
                  end
                end
              end else begin
                if (_T_71) begin
                  state <= 3'h7;
                end else begin
                  if (_T_68) begin
                    state <= 3'h3;
                  end
                end
              end
            end
          end else begin
            if (_T_72) begin
              if (_T_124) begin
                state <= 3'h6;
              end else begin
                if (_T_71) begin
                  state <= 3'h7;
                end else begin
                  if (_T_68) begin
                    state <= 3'h3;
                  end
                end
              end
            end else begin
              if (_T_71) begin
                state <= 3'h7;
              end else begin
                if (_T_68) begin
                  state <= 3'h3;
                end
              end
            end
          end
        end
      end
    end
    if (_T_474) begin
      req_dw <= io_req_bits_dw;
    end
    if (_T_474) begin
      req_tag <= io_req_bits_tag;
    end
    if (_T_474) begin
      count <= {{4'd0}, _T_481};
    end else begin
      if (_T_125) begin
        if (_T_466) begin
          count <= {{1'd0}, _T_461};
        end else begin
          count <= _T_122;
        end
      end else begin
        if (_T_72) begin
          count <= _T_122;
        end
      end
    end
    if (_T_474) begin
      if (cmdHi) begin
        neg_out <= lhs_sign;
      end else begin
        neg_out <= _T_482;
      end
    end else begin
      if (_T_125) begin
        if (_T_471) begin
          neg_out <= 1'h0;
        end
      end
    end
    if (_T_474) begin
      isHi <= cmdHi;
    end
    if (_T_474) begin
      resHi <= 1'h0;
    end else begin
      if (_T_125) begin
        if (_T_134) begin
          resHi <= isHi;
        end else begin
          if (_T_72) begin
            if (_T_124) begin
              resHi <= isHi;
            end else begin
              if (_T_71) begin
                resHi <= 1'h0;
              end
            end
          end else begin
            if (_T_71) begin
              resHi <= 1'h0;
            end
          end
        end
      end else begin
        if (_T_72) begin
          if (_T_124) begin
            resHi <= isHi;
          end else begin
            if (_T_71) begin
              resHi <= 1'h0;
            end
          end
        end else begin
          if (_T_71) begin
            resHi <= 1'h0;
          end
        end
      end
    end
    if (_T_474) begin
      divisor <= _T_484;
    end else begin
      if (_T_68) begin
        if (_T_70) begin
          divisor <= subtractor;
        end
      end
    end
    if (_T_474) begin
      remainder <= {{66'd0}, lhs_in};
    end else begin
      if (_T_125) begin
        remainder <= {{1'd0}, _GEN_16};
      end else begin
        if (_T_72) begin
          remainder <= _T_120;
        end else begin
          if (_T_71) begin
            remainder <= {{66'd0}, negated_remainder};
          end else begin
            if (_T_68) begin
              if (_T_69) begin
                remainder <= {{66'd0}, negated_remainder};
              end
            end
          end
        end
      end
    end
  end
endmodule
