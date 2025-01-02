module IntToFP( 
  input         clock, 
  input         reset, 
  input         io_in_valid, 
  input         io_in_bits_singleIn, 
  input         io_in_bits_wflags, 
  input  [2:0]  io_in_bits_rm, 
  input  [1:0]  io_in_bits_typ, 
  input  [63:0] io_in_bits_in1, 
  output [64:0] io_out_bits_data, 
  output [4:0]  io_out_bits_exc 
);
  wire  INToRecFN_io_signedIn; 
  wire [63:0] INToRecFN_io_in; 
  wire [2:0] INToRecFN_io_roundingMode; 
  wire [32:0] INToRecFN_io_out; 
  wire [4:0] INToRecFN_io_exceptionFlags; 
  wire  INToRecFN_1_io_signedIn; 
  wire [63:0] INToRecFN_1_io_in; 
  wire [2:0] INToRecFN_1_io_roundingMode; 
  wire [64:0] INToRecFN_1_io_out; 
  wire [4:0] INToRecFN_1_io_exceptionFlags; 
  reg  in_valid; 
  reg [31:0] _RAND_0;
  reg  in_bits_singleIn; 
  reg [31:0] _RAND_1;
  reg  in_bits_wflags; 
  reg [31:0] _RAND_2;
  reg [2:0] in_bits_rm; 
  reg [31:0] _RAND_3;
  reg [1:0] in_bits_typ; 
  reg [31:0] _RAND_4;
  reg [63:0] in_bits_in1; 
  reg [63:0] _RAND_5;
  wire  tag; 
  wire [63:0] _T_21; 
  wire [63:0] _T_22; 
  wire  _T_23; 
  wire [10:0] _T_24; 
  wire [51:0] _T_25; 
  wire  _T_26; 
  wire  _T_27; 
  wire [31:0] _T_28; 
  wire [15:0] _T_31; 
  wire [31:0] _T_32; 
  wire [15:0] _T_33; 
  wire [31:0] _GEN_24; 
  wire [31:0] _T_34; 
  wire [31:0] _T_36; 
  wire [31:0] _T_37; 
  wire [23:0] _T_41; 
  wire [31:0] _GEN_25; 
  wire [31:0] _T_42; 
  wire [23:0] _T_43; 
  wire [31:0] _GEN_26; 
  wire [31:0] _T_44; 
  wire [31:0] _T_46; 
  wire [31:0] _T_47; 
  wire [27:0] _T_51; 
  wire [31:0] _GEN_27; 
  wire [31:0] _T_52; 
  wire [27:0] _T_53; 
  wire [31:0] _GEN_28; 
  wire [31:0] _T_54; 
  wire [31:0] _T_56; 
  wire [31:0] _T_57; 
  wire [29:0] _T_61; 
  wire [31:0] _GEN_29; 
  wire [31:0] _T_62; 
  wire [29:0] _T_63; 
  wire [31:0] _GEN_30; 
  wire [31:0] _T_64; 
  wire [31:0] _T_66; 
  wire [31:0] _T_67; 
  wire [30:0] _T_71; 
  wire [31:0] _GEN_31; 
  wire [31:0] _T_72; 
  wire [30:0] _T_73; 
  wire [31:0] _GEN_32; 
  wire [31:0] _T_74; 
  wire [31:0] _T_76; 
  wire [31:0] _T_77; 
  wire [19:0] _T_78; 
  wire [15:0] _T_79; 
  wire [7:0] _T_82; 
  wire [15:0] _T_83; 
  wire [7:0] _T_84; 
  wire [15:0] _GEN_33; 
  wire [15:0] _T_85; 
  wire [15:0] _T_87; 
  wire [15:0] _T_88; 
  wire [11:0] _T_92; 
  wire [15:0] _GEN_34; 
  wire [15:0] _T_93; 
  wire [11:0] _T_94; 
  wire [15:0] _GEN_35; 
  wire [15:0] _T_95; 
  wire [15:0] _T_97; 
  wire [15:0] _T_98; 
  wire [13:0] _T_102; 
  wire [15:0] _GEN_36; 
  wire [15:0] _T_103; 
  wire [13:0] _T_104; 
  wire [15:0] _GEN_37; 
  wire [15:0] _T_105; 
  wire [15:0] _T_107; 
  wire [15:0] _T_108; 
  wire [14:0] _T_112; 
  wire [15:0] _GEN_38; 
  wire [15:0] _T_113; 
  wire [14:0] _T_114; 
  wire [15:0] _GEN_39; 
  wire [15:0] _T_115; 
  wire [15:0] _T_117; 
  wire [15:0] _T_118; 
  wire [3:0] _T_119; 
  wire [1:0] _T_120; 
  wire  _T_121; 
  wire  _T_122; 
  wire [1:0] _T_123; 
  wire [1:0] _T_124; 
  wire  _T_125; 
  wire  _T_126; 
  wire [1:0] _T_127; 
  wire [3:0] _T_128; 
  wire [19:0] _T_129; 
  wire [51:0] _T_130; 
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
  wire  _T_161; 
  wire  _T_162; 
  wire  _T_163; 
  wire  _T_164; 
  wire  _T_165; 
  wire  _T_166; 
  wire  _T_167; 
  wire  _T_168; 
  wire  _T_169; 
  wire  _T_170; 
  wire  _T_171; 
  wire  _T_172; 
  wire  _T_173; 
  wire  _T_174; 
  wire  _T_175; 
  wire  _T_176; 
  wire  _T_177; 
  wire  _T_178; 
  wire  _T_179; 
  wire  _T_180; 
  wire  _T_181; 
  wire [5:0] _T_183; 
  wire [5:0] _T_184; 
  wire [5:0] _T_185; 
  wire [5:0] _T_186; 
  wire [5:0] _T_187; 
  wire [5:0] _T_188; 
  wire [5:0] _T_189; 
  wire [5:0] _T_190; 
  wire [5:0] _T_191; 
  wire [5:0] _T_192; 
  wire [5:0] _T_193; 
  wire [5:0] _T_194; 
  wire [5:0] _T_195; 
  wire [5:0] _T_196; 
  wire [5:0] _T_197; 
  wire [5:0] _T_198; 
  wire [5:0] _T_199; 
  wire [5:0] _T_200; 
  wire [5:0] _T_201; 
  wire [5:0] _T_202; 
  wire [5:0] _T_203; 
  wire [5:0] _T_204; 
  wire [5:0] _T_205; 
  wire [5:0] _T_206; 
  wire [5:0] _T_207; 
  wire [5:0] _T_208; 
  wire [5:0] _T_209; 
  wire [5:0] _T_210; 
  wire [5:0] _T_211; 
  wire [5:0] _T_212; 
  wire [5:0] _T_213; 
  wire [5:0] _T_214; 
  wire [5:0] _T_215; 
  wire [5:0] _T_216; 
  wire [5:0] _T_217; 
  wire [5:0] _T_218; 
  wire [5:0] _T_219; 
  wire [5:0] _T_220; 
  wire [5:0] _T_221; 
  wire [5:0] _T_222; 
  wire [5:0] _T_223; 
  wire [5:0] _T_224; 
  wire [5:0] _T_225; 
  wire [5:0] _T_226; 
  wire [5:0] _T_227; 
  wire [5:0] _T_228; 
  wire [5:0] _T_229; 
  wire [5:0] _T_230; 
  wire [5:0] _T_231; 
  wire [5:0] _T_232; 
  wire [5:0] _T_233; 
  wire [114:0] _GEN_40; 
  wire [114:0] _T_234; 
  wire [50:0] _T_235; 
  wire [51:0] _GEN_41; 
  wire [51:0] _T_236; 
  wire [11:0] _GEN_42; 
  wire [11:0] _T_237; 
  wire [11:0] _T_238; 
  wire [1:0] _T_239; 
  wire [10:0] _GEN_43; 
  wire [10:0] _T_240; 
  wire [11:0] _GEN_44; 
  wire [11:0] _T_242; 
  wire  _T_243; 
  wire [1:0] _T_244; 
  wire  _T_245; 
  wire  _T_248; 
  wire  _T_249; 
  wire [12:0] _T_252; 
  wire  _T_253; 
  wire [51:0] _T_254; 
  wire [1:0] _T_255; 
  wire [53:0] _T_256; 
  wire [2:0] _T_257; 
  wire [2:0] _T_258; 
  wire [2:0] _GEN_45; 
  wire [2:0] _T_260; 
  wire [8:0] _T_261; 
  wire [51:0] _T_262; 
  wire [60:0] _T_263; 
  wire [3:0] _T_264; 
  wire [64:0] _T_265; 
  wire  _T_266; 
  wire [7:0] _T_267; 
  wire [22:0] _T_268; 
  wire  _T_269; 
  wire  _T_270; 
  wire [15:0] _T_271; 
  wire [7:0] _T_274; 
  wire [15:0] _T_275; 
  wire [7:0] _T_276; 
  wire [15:0] _GEN_46; 
  wire [15:0] _T_277; 
  wire [15:0] _T_279; 
  wire [15:0] _T_280; 
  wire [11:0] _T_284; 
  wire [15:0] _GEN_47; 
  wire [15:0] _T_285; 
  wire [11:0] _T_286; 
  wire [15:0] _GEN_48; 
  wire [15:0] _T_287; 
  wire [15:0] _T_289; 
  wire [15:0] _T_290; 
  wire [13:0] _T_294; 
  wire [15:0] _GEN_49; 
  wire [15:0] _T_295; 
  wire [13:0] _T_296; 
  wire [15:0] _GEN_50; 
  wire [15:0] _T_297; 
  wire [15:0] _T_299; 
  wire [15:0] _T_300; 
  wire [14:0] _T_304; 
  wire [15:0] _GEN_51; 
  wire [15:0] _T_305; 
  wire [14:0] _T_306; 
  wire [15:0] _GEN_52; 
  wire [15:0] _T_307; 
  wire [15:0] _T_309; 
  wire [15:0] _T_310; 
  wire [6:0] _T_311; 
  wire [3:0] _T_312; 
  wire [1:0] _T_313; 
  wire  _T_314; 
  wire  _T_315; 
  wire [1:0] _T_316; 
  wire [1:0] _T_317; 
  wire  _T_318; 
  wire  _T_319; 
  wire [1:0] _T_320; 
  wire [3:0] _T_321; 
  wire [2:0] _T_322; 
  wire [1:0] _T_323; 
  wire  _T_324; 
  wire  _T_325; 
  wire [1:0] _T_326; 
  wire  _T_327; 
  wire [2:0] _T_328; 
  wire [6:0] _T_329; 
  wire [22:0] _T_330; 
  wire  _T_331; 
  wire  _T_332; 
  wire  _T_333; 
  wire  _T_334; 
  wire  _T_335; 
  wire  _T_336; 
  wire  _T_337; 
  wire  _T_338; 
  wire  _T_339; 
  wire  _T_340; 
  wire  _T_341; 
  wire  _T_342; 
  wire  _T_343; 
  wire  _T_344; 
  wire  _T_345; 
  wire  _T_346; 
  wire  _T_347; 
  wire  _T_348; 
  wire  _T_349; 
  wire  _T_350; 
  wire  _T_351; 
  wire  _T_352; 
  wire [4:0] _T_354; 
  wire [4:0] _T_355; 
  wire [4:0] _T_356; 
  wire [4:0] _T_357; 
  wire [4:0] _T_358; 
  wire [4:0] _T_359; 
  wire [4:0] _T_360; 
  wire [4:0] _T_361; 
  wire [4:0] _T_362; 
  wire [4:0] _T_363; 
  wire [4:0] _T_364; 
  wire [4:0] _T_365; 
  wire [4:0] _T_366; 
  wire [4:0] _T_367; 
  wire [4:0] _T_368; 
  wire [4:0] _T_369; 
  wire [4:0] _T_370; 
  wire [4:0] _T_371; 
  wire [4:0] _T_372; 
  wire [4:0] _T_373; 
  wire [4:0] _T_374; 
  wire [4:0] _T_375; 
  wire [53:0] _GEN_53; 
  wire [53:0] _T_376; 
  wire [21:0] _T_377; 
  wire [22:0] _GEN_54; 
  wire [22:0] _T_378; 
  wire [8:0] _GEN_55; 
  wire [8:0] _T_379; 
  wire [8:0] _T_380; 
  wire [1:0] _T_381; 
  wire [7:0] _GEN_56; 
  wire [7:0] _T_382; 
  wire [8:0] _GEN_57; 
  wire [8:0] _T_384; 
  wire  _T_385; 
  wire [1:0] _T_386; 
  wire  _T_387; 
  wire  _T_390; 
  wire  _T_391; 
  wire [9:0] _T_394; 
  wire  _T_395; 
  wire [22:0] _T_396; 
  wire [1:0] _T_397; 
  wire [24:0] _T_398; 
  wire [2:0] _T_399; 
  wire [2:0] _T_400; 
  wire [2:0] _GEN_58; 
  wire [2:0] _T_402; 
  wire [5:0] _T_403; 
  wire [22:0] _T_404; 
  wire [28:0] _T_405; 
  wire [3:0] _T_406; 
  wire [32:0] _T_407; 
  wire [3:0] _T_408; 
  wire [19:0] _T_409; 
  wire [19:0] _T_410; 
  wire  _T_411; 
  wire [6:0] _T_412; 
  wire  _T_413; 
  wire  _T_415; 
  wire [30:0] _T_416; 
  wire [20:0] _T_417; 
  wire [51:0] _T_418; 
  wire [7:0] _T_419; 
  wire [4:0] _T_420; 
  wire [12:0] _T_421; 
  wire [64:0] _T_422; 
  wire [2:0] _T_423; 
  wire [2:0] _T_424; 
  wire  _T_425; 
  wire [63:0] _T_427; 
  wire [31:0] _T_430; 
  wire  _T_431; 
  wire  _T_432; 
  wire  _T_433; 
  wire [32:0] _T_434; 
  wire [31:0] _T_435; 
  wire [32:0] _T_436; 
  wire [63:0] _GEN_19; 
  wire [64:0] _T_442; 
  wire [2:0] _T_443; 
  wire [2:0] _T_444; 
  wire  _T_445; 
  wire [64:0] _T_446; 
  wire [31:0] _T_447; 
  wire [64:0] _T_448; 
  reg [64:0] _T_456_data; 
  reg [95:0] _RAND_6;
  reg [4:0] _T_456_exc; 
  reg [31:0] _RAND_7;
  INToRecFN INToRecFN ( 
    .io_signedIn(INToRecFN_io_signedIn),
    .io_in(INToRecFN_io_in),
    .io_roundingMode(INToRecFN_io_roundingMode),
    .io_out(INToRecFN_io_out),
    .io_exceptionFlags(INToRecFN_io_exceptionFlags)
  );
  INToRecFN_1 INToRecFN_1 ( 
    .io_signedIn(INToRecFN_1_io_signedIn),
    .io_in(INToRecFN_1_io_in),
    .io_roundingMode(INToRecFN_1_io_roundingMode),
    .io_out(INToRecFN_1_io_out),
    .io_exceptionFlags(INToRecFN_1_io_exceptionFlags)
  );
  assign tag = in_bits_singleIn == 1'h0; 
  assign _T_21 = tag ? 64'h0 : 64'hffffffff00000000; 
  assign _T_22 = _T_21 | in_bits_in1; 
  assign _T_23 = _T_22[63]; 
  assign _T_24 = _T_22[62:52]; 
  assign _T_25 = _T_22[51:0]; 
  assign _T_26 = _T_24 == 11'h0; 
  assign _T_27 = _T_25 == 52'h0; 
  assign _T_28 = _T_25[31:0]; 
  assign _T_31 = _T_28[31:16]; 
  assign _T_32 = {{16'd0}, _T_31}; 
  assign _T_33 = _T_28[15:0]; 
  assign _GEN_24 = {{16'd0}, _T_33}; 
  assign _T_34 = _GEN_24 << 16; 
  assign _T_36 = _T_34 & 32'hffff0000; 
  assign _T_37 = _T_32 | _T_36; 
  assign _T_41 = _T_37[31:8]; 
  assign _GEN_25 = {{8'd0}, _T_41}; 
  assign _T_42 = _GEN_25 & 32'hff00ff; 
  assign _T_43 = _T_37[23:0]; 
  assign _GEN_26 = {{8'd0}, _T_43}; 
  assign _T_44 = _GEN_26 << 8; 
  assign _T_46 = _T_44 & 32'hff00ff00; 
  assign _T_47 = _T_42 | _T_46; 
  assign _T_51 = _T_47[31:4]; 
  assign _GEN_27 = {{4'd0}, _T_51}; 
  assign _T_52 = _GEN_27 & 32'hf0f0f0f; 
  assign _T_53 = _T_47[27:0]; 
  assign _GEN_28 = {{4'd0}, _T_53}; 
  assign _T_54 = _GEN_28 << 4; 
  assign _T_56 = _T_54 & 32'hf0f0f0f0; 
  assign _T_57 = _T_52 | _T_56; 
  assign _T_61 = _T_57[31:2]; 
  assign _GEN_29 = {{2'd0}, _T_61}; 
  assign _T_62 = _GEN_29 & 32'h33333333; 
  assign _T_63 = _T_57[29:0]; 
  assign _GEN_30 = {{2'd0}, _T_63}; 
  assign _T_64 = _GEN_30 << 2; 
  assign _T_66 = _T_64 & 32'hcccccccc; 
  assign _T_67 = _T_62 | _T_66; 
  assign _T_71 = _T_67[31:1]; 
  assign _GEN_31 = {{1'd0}, _T_71}; 
  assign _T_72 = _GEN_31 & 32'h55555555; 
  assign _T_73 = _T_67[30:0]; 
  assign _GEN_32 = {{1'd0}, _T_73}; 
  assign _T_74 = _GEN_32 << 1; 
  assign _T_76 = _T_74 & 32'haaaaaaaa; 
  assign _T_77 = _T_72 | _T_76; 
  assign _T_78 = _T_25[51:32]; 
  assign _T_79 = _T_78[15:0]; 
  assign _T_82 = _T_79[15:8]; 
  assign _T_83 = {{8'd0}, _T_82}; 
  assign _T_84 = _T_79[7:0]; 
  assign _GEN_33 = {{8'd0}, _T_84}; 
  assign _T_85 = _GEN_33 << 8; 
  assign _T_87 = _T_85 & 16'hff00; 
  assign _T_88 = _T_83 | _T_87; 
  assign _T_92 = _T_88[15:4]; 
  assign _GEN_34 = {{4'd0}, _T_92}; 
  assign _T_93 = _GEN_34 & 16'hf0f; 
  assign _T_94 = _T_88[11:0]; 
  assign _GEN_35 = {{4'd0}, _T_94}; 
  assign _T_95 = _GEN_35 << 4; 
  assign _T_97 = _T_95 & 16'hf0f0; 
  assign _T_98 = _T_93 | _T_97; 
  assign _T_102 = _T_98[15:2]; 
  assign _GEN_36 = {{2'd0}, _T_102}; 
  assign _T_103 = _GEN_36 & 16'h3333; 
  assign _T_104 = _T_98[13:0]; 
  assign _GEN_37 = {{2'd0}, _T_104}; 
  assign _T_105 = _GEN_37 << 2; 
  assign _T_107 = _T_105 & 16'hcccc; 
  assign _T_108 = _T_103 | _T_107; 
  assign _T_112 = _T_108[15:1]; 
  assign _GEN_38 = {{1'd0}, _T_112}; 
  assign _T_113 = _GEN_38 & 16'h5555; 
  assign _T_114 = _T_108[14:0]; 
  assign _GEN_39 = {{1'd0}, _T_114}; 
  assign _T_115 = _GEN_39 << 1; 
  assign _T_117 = _T_115 & 16'haaaa; 
  assign _T_118 = _T_113 | _T_117; 
  assign _T_119 = _T_78[19:16]; 
  assign _T_120 = _T_119[1:0]; 
  assign _T_121 = _T_120[0]; 
  assign _T_122 = _T_120[1]; 
  assign _T_123 = {_T_121,_T_122}; 
  assign _T_124 = _T_119[3:2]; 
  assign _T_125 = _T_124[0]; 
  assign _T_126 = _T_124[1]; 
  assign _T_127 = {_T_125,_T_126}; 
  assign _T_128 = {_T_123,_T_127}; 
  assign _T_129 = {_T_118,_T_128}; 
  assign _T_130 = {_T_77,_T_129}; 
  assign _T_131 = _T_130[0]; 
  assign _T_132 = _T_130[1]; 
  assign _T_133 = _T_130[2]; 
  assign _T_134 = _T_130[3]; 
  assign _T_135 = _T_130[4]; 
  assign _T_136 = _T_130[5]; 
  assign _T_137 = _T_130[6]; 
  assign _T_138 = _T_130[7]; 
  assign _T_139 = _T_130[8]; 
  assign _T_140 = _T_130[9]; 
  assign _T_141 = _T_130[10]; 
  assign _T_142 = _T_130[11]; 
  assign _T_143 = _T_130[12]; 
  assign _T_144 = _T_130[13]; 
  assign _T_145 = _T_130[14]; 
  assign _T_146 = _T_130[15]; 
  assign _T_147 = _T_130[16]; 
  assign _T_148 = _T_130[17]; 
  assign _T_149 = _T_130[18]; 
  assign _T_150 = _T_130[19]; 
  assign _T_151 = _T_130[20]; 
  assign _T_152 = _T_130[21]; 
  assign _T_153 = _T_130[22]; 
  assign _T_154 = _T_130[23]; 
  assign _T_155 = _T_130[24]; 
  assign _T_156 = _T_130[25]; 
  assign _T_157 = _T_130[26]; 
  assign _T_158 = _T_130[27]; 
  assign _T_159 = _T_130[28]; 
  assign _T_160 = _T_130[29]; 
  assign _T_161 = _T_130[30]; 
  assign _T_162 = _T_130[31]; 
  assign _T_163 = _T_130[32]; 
  assign _T_164 = _T_130[33]; 
  assign _T_165 = _T_130[34]; 
  assign _T_166 = _T_130[35]; 
  assign _T_167 = _T_130[36]; 
  assign _T_168 = _T_130[37]; 
  assign _T_169 = _T_130[38]; 
  assign _T_170 = _T_130[39]; 
  assign _T_171 = _T_130[40]; 
  assign _T_172 = _T_130[41]; 
  assign _T_173 = _T_130[42]; 
  assign _T_174 = _T_130[43]; 
  assign _T_175 = _T_130[44]; 
  assign _T_176 = _T_130[45]; 
  assign _T_177 = _T_130[46]; 
  assign _T_178 = _T_130[47]; 
  assign _T_179 = _T_130[48]; 
  assign _T_180 = _T_130[49]; 
  assign _T_181 = _T_130[50]; 
  assign _T_183 = _T_181 ? 6'h32 : 6'h33; 
  assign _T_184 = _T_180 ? 6'h31 : _T_183; 
  assign _T_185 = _T_179 ? 6'h30 : _T_184; 
  assign _T_186 = _T_178 ? 6'h2f : _T_185; 
  assign _T_187 = _T_177 ? 6'h2e : _T_186; 
  assign _T_188 = _T_176 ? 6'h2d : _T_187; 
  assign _T_189 = _T_175 ? 6'h2c : _T_188; 
  assign _T_190 = _T_174 ? 6'h2b : _T_189; 
  assign _T_191 = _T_173 ? 6'h2a : _T_190; 
  assign _T_192 = _T_172 ? 6'h29 : _T_191; 
  assign _T_193 = _T_171 ? 6'h28 : _T_192; 
  assign _T_194 = _T_170 ? 6'h27 : _T_193; 
  assign _T_195 = _T_169 ? 6'h26 : _T_194; 
  assign _T_196 = _T_168 ? 6'h25 : _T_195; 
  assign _T_197 = _T_167 ? 6'h24 : _T_196; 
  assign _T_198 = _T_166 ? 6'h23 : _T_197; 
  assign _T_199 = _T_165 ? 6'h22 : _T_198; 
  assign _T_200 = _T_164 ? 6'h21 : _T_199; 
  assign _T_201 = _T_163 ? 6'h20 : _T_200; 
  assign _T_202 = _T_162 ? 6'h1f : _T_201; 
  assign _T_203 = _T_161 ? 6'h1e : _T_202; 
  assign _T_204 = _T_160 ? 6'h1d : _T_203; 
  assign _T_205 = _T_159 ? 6'h1c : _T_204; 
  assign _T_206 = _T_158 ? 6'h1b : _T_205; 
  assign _T_207 = _T_157 ? 6'h1a : _T_206; 
  assign _T_208 = _T_156 ? 6'h19 : _T_207; 
  assign _T_209 = _T_155 ? 6'h18 : _T_208; 
  assign _T_210 = _T_154 ? 6'h17 : _T_209; 
  assign _T_211 = _T_153 ? 6'h16 : _T_210; 
  assign _T_212 = _T_152 ? 6'h15 : _T_211; 
  assign _T_213 = _T_151 ? 6'h14 : _T_212; 
  assign _T_214 = _T_150 ? 6'h13 : _T_213; 
  assign _T_215 = _T_149 ? 6'h12 : _T_214; 
  assign _T_216 = _T_148 ? 6'h11 : _T_215; 
  assign _T_217 = _T_147 ? 6'h10 : _T_216; 
  assign _T_218 = _T_146 ? 6'hf : _T_217; 
  assign _T_219 = _T_145 ? 6'he : _T_218; 
  assign _T_220 = _T_144 ? 6'hd : _T_219; 
  assign _T_221 = _T_143 ? 6'hc : _T_220; 
  assign _T_222 = _T_142 ? 6'hb : _T_221; 
  assign _T_223 = _T_141 ? 6'ha : _T_222; 
  assign _T_224 = _T_140 ? 6'h9 : _T_223; 
  assign _T_225 = _T_139 ? 6'h8 : _T_224; 
  assign _T_226 = _T_138 ? 6'h7 : _T_225; 
  assign _T_227 = _T_137 ? 6'h6 : _T_226; 
  assign _T_228 = _T_136 ? 6'h5 : _T_227; 
  assign _T_229 = _T_135 ? 6'h4 : _T_228; 
  assign _T_230 = _T_134 ? 6'h3 : _T_229; 
  assign _T_231 = _T_133 ? 6'h2 : _T_230; 
  assign _T_232 = _T_132 ? 6'h1 : _T_231; 
  assign _T_233 = _T_131 ? 6'h0 : _T_232; 
  assign _GEN_40 = {{63'd0}, _T_25}; 
  assign _T_234 = _GEN_40 << _T_233; 
  assign _T_235 = _T_234[50:0]; 
  assign _GEN_41 = {{1'd0}, _T_235}; 
  assign _T_236 = _GEN_41 << 1; 
  assign _GEN_42 = {{6'd0}, _T_233}; 
  assign _T_237 = _GEN_42 ^ 12'hfff; 
  assign _T_238 = _T_26 ? _T_237 : {{1'd0}, _T_24}; 
  assign _T_239 = _T_26 ? 2'h2 : 2'h1; 
  assign _GEN_43 = {{9'd0}, _T_239}; 
  assign _T_240 = 11'h400 | _GEN_43; 
  assign _GEN_44 = {{1'd0}, _T_240}; 
  assign _T_242 = _T_238 + _GEN_44; 
  assign _T_243 = _T_26 & _T_27; 
  assign _T_244 = _T_242[11:10]; 
  assign _T_245 = _T_244 == 2'h3; 
  assign _T_248 = _T_27 == 1'h0; 
  assign _T_249 = _T_245 & _T_248; 
  assign _T_252 = {1'b0,$signed(_T_242)}; 
  assign _T_253 = _T_243 == 1'h0; 
  assign _T_254 = _T_26 ? _T_236 : _T_25; 
  assign _T_255 = {1'h0,_T_253}; 
  assign _T_256 = {_T_255,_T_254}; 
  assign _T_257 = _T_252[11:9]; 
  assign _T_258 = _T_243 ? 3'h0 : _T_257; 
  assign _GEN_45 = {{2'd0}, _T_249}; 
  assign _T_260 = _T_258 | _GEN_45; 
  assign _T_261 = _T_252[8:0]; 
  assign _T_262 = _T_256[51:0]; 
  assign _T_263 = {_T_261,_T_262}; 
  assign _T_264 = {_T_23,_T_260}; 
  assign _T_265 = {_T_264,_T_263}; 
  assign _T_266 = _T_22[31]; 
  assign _T_267 = _T_22[30:23]; 
  assign _T_268 = _T_22[22:0]; 
  assign _T_269 = _T_267 == 8'h0; 
  assign _T_270 = _T_268 == 23'h0; 
  assign _T_271 = _T_268[15:0]; 
  assign _T_274 = _T_271[15:8]; 
  assign _T_275 = {{8'd0}, _T_274}; 
  assign _T_276 = _T_271[7:0]; 
  assign _GEN_46 = {{8'd0}, _T_276}; 
  assign _T_277 = _GEN_46 << 8; 
  assign _T_279 = _T_277 & 16'hff00; 
  assign _T_280 = _T_275 | _T_279; 
  assign _T_284 = _T_280[15:4]; 
  assign _GEN_47 = {{4'd0}, _T_284}; 
  assign _T_285 = _GEN_47 & 16'hf0f; 
  assign _T_286 = _T_280[11:0]; 
  assign _GEN_48 = {{4'd0}, _T_286}; 
  assign _T_287 = _GEN_48 << 4; 
  assign _T_289 = _T_287 & 16'hf0f0; 
  assign _T_290 = _T_285 | _T_289; 
  assign _T_294 = _T_290[15:2]; 
  assign _GEN_49 = {{2'd0}, _T_294}; 
  assign _T_295 = _GEN_49 & 16'h3333; 
  assign _T_296 = _T_290[13:0]; 
  assign _GEN_50 = {{2'd0}, _T_296}; 
  assign _T_297 = _GEN_50 << 2; 
  assign _T_299 = _T_297 & 16'hcccc; 
  assign _T_300 = _T_295 | _T_299; 
  assign _T_304 = _T_300[15:1]; 
  assign _GEN_51 = {{1'd0}, _T_304}; 
  assign _T_305 = _GEN_51 & 16'h5555; 
  assign _T_306 = _T_300[14:0]; 
  assign _GEN_52 = {{1'd0}, _T_306}; 
  assign _T_307 = _GEN_52 << 1; 
  assign _T_309 = _T_307 & 16'haaaa; 
  assign _T_310 = _T_305 | _T_309; 
  assign _T_311 = _T_268[22:16]; 
  assign _T_312 = _T_311[3:0]; 
  assign _T_313 = _T_312[1:0]; 
  assign _T_314 = _T_313[0]; 
  assign _T_315 = _T_313[1]; 
  assign _T_316 = {_T_314,_T_315}; 
  assign _T_317 = _T_312[3:2]; 
  assign _T_318 = _T_317[0]; 
  assign _T_319 = _T_317[1]; 
  assign _T_320 = {_T_318,_T_319}; 
  assign _T_321 = {_T_316,_T_320}; 
  assign _T_322 = _T_311[6:4]; 
  assign _T_323 = _T_322[1:0]; 
  assign _T_324 = _T_323[0]; 
  assign _T_325 = _T_323[1]; 
  assign _T_326 = {_T_324,_T_325}; 
  assign _T_327 = _T_322[2]; 
  assign _T_328 = {_T_326,_T_327}; 
  assign _T_329 = {_T_321,_T_328}; 
  assign _T_330 = {_T_310,_T_329}; 
  assign _T_331 = _T_330[0]; 
  assign _T_332 = _T_330[1]; 
  assign _T_333 = _T_330[2]; 
  assign _T_334 = _T_330[3]; 
  assign _T_335 = _T_330[4]; 
  assign _T_336 = _T_330[5]; 
  assign _T_337 = _T_330[6]; 
  assign _T_338 = _T_330[7]; 
  assign _T_339 = _T_330[8]; 
  assign _T_340 = _T_330[9]; 
  assign _T_341 = _T_330[10]; 
  assign _T_342 = _T_330[11]; 
  assign _T_343 = _T_330[12]; 
  assign _T_344 = _T_330[13]; 
  assign _T_345 = _T_330[14]; 
  assign _T_346 = _T_330[15]; 
  assign _T_347 = _T_330[16]; 
  assign _T_348 = _T_330[17]; 
  assign _T_349 = _T_330[18]; 
  assign _T_350 = _T_330[19]; 
  assign _T_351 = _T_330[20]; 
  assign _T_352 = _T_330[21]; 
  assign _T_354 = _T_352 ? 5'h15 : 5'h16; 
  assign _T_355 = _T_351 ? 5'h14 : _T_354; 
  assign _T_356 = _T_350 ? 5'h13 : _T_355; 
  assign _T_357 = _T_349 ? 5'h12 : _T_356; 
  assign _T_358 = _T_348 ? 5'h11 : _T_357; 
  assign _T_359 = _T_347 ? 5'h10 : _T_358; 
  assign _T_360 = _T_346 ? 5'hf : _T_359; 
  assign _T_361 = _T_345 ? 5'he : _T_360; 
  assign _T_362 = _T_344 ? 5'hd : _T_361; 
  assign _T_363 = _T_343 ? 5'hc : _T_362; 
  assign _T_364 = _T_342 ? 5'hb : _T_363; 
  assign _T_365 = _T_341 ? 5'ha : _T_364; 
  assign _T_366 = _T_340 ? 5'h9 : _T_365; 
  assign _T_367 = _T_339 ? 5'h8 : _T_366; 
  assign _T_368 = _T_338 ? 5'h7 : _T_367; 
  assign _T_369 = _T_337 ? 5'h6 : _T_368; 
  assign _T_370 = _T_336 ? 5'h5 : _T_369; 
  assign _T_371 = _T_335 ? 5'h4 : _T_370; 
  assign _T_372 = _T_334 ? 5'h3 : _T_371; 
  assign _T_373 = _T_333 ? 5'h2 : _T_372; 
  assign _T_374 = _T_332 ? 5'h1 : _T_373; 
  assign _T_375 = _T_331 ? 5'h0 : _T_374; 
  assign _GEN_53 = {{31'd0}, _T_268}; 
  assign _T_376 = _GEN_53 << _T_375; 
  assign _T_377 = _T_376[21:0]; 
  assign _GEN_54 = {{1'd0}, _T_377}; 
  assign _T_378 = _GEN_54 << 1; 
  assign _GEN_55 = {{4'd0}, _T_375}; 
  assign _T_379 = _GEN_55 ^ 9'h1ff; 
  assign _T_380 = _T_269 ? _T_379 : {{1'd0}, _T_267}; 
  assign _T_381 = _T_269 ? 2'h2 : 2'h1; 
  assign _GEN_56 = {{6'd0}, _T_381}; 
  assign _T_382 = 8'h80 | _GEN_56; 
  assign _GEN_57 = {{1'd0}, _T_382}; 
  assign _T_384 = _T_380 + _GEN_57; 
  assign _T_385 = _T_269 & _T_270; 
  assign _T_386 = _T_384[8:7]; 
  assign _T_387 = _T_386 == 2'h3; 
  assign _T_390 = _T_270 == 1'h0; 
  assign _T_391 = _T_387 & _T_390; 
  assign _T_394 = {1'b0,$signed(_T_384)}; 
  assign _T_395 = _T_385 == 1'h0; 
  assign _T_396 = _T_269 ? _T_378 : _T_268; 
  assign _T_397 = {1'h0,_T_395}; 
  assign _T_398 = {_T_397,_T_396}; 
  assign _T_399 = _T_394[8:6]; 
  assign _T_400 = _T_385 ? 3'h0 : _T_399; 
  assign _GEN_58 = {{2'd0}, _T_391}; 
  assign _T_402 = _T_400 | _GEN_58; 
  assign _T_403 = _T_394[5:0]; 
  assign _T_404 = _T_398[22:0]; 
  assign _T_405 = {_T_403,_T_404}; 
  assign _T_406 = {_T_266,_T_402}; 
  assign _T_407 = {_T_406,_T_405}; 
  assign _T_408 = _T_265[64:61]; 
  assign _T_409 = _T_265[51:32]; 
  assign _T_410 = ~ _T_409; 
  assign _T_411 = _T_410 == 20'h0; 
  assign _T_412 = _T_265[59:53]; 
  assign _T_413 = _T_407[31]; 
  assign _T_415 = _T_407[32]; 
  assign _T_416 = _T_407[30:0]; 
  assign _T_417 = {_T_409,_T_415}; 
  assign _T_418 = {_T_417,_T_416}; 
  assign _T_419 = {_T_412,_T_413}; 
  assign _T_420 = {_T_408,_T_411}; 
  assign _T_421 = {_T_420,_T_419}; 
  assign _T_422 = {_T_421,_T_418}; 
  assign _T_423 = _T_265[63:61]; 
  assign _T_424 = ~ _T_423; 
  assign _T_425 = _T_424 == 3'h0; 
  assign _T_427 = $signed(in_bits_in1); 
  assign _T_430 = in_bits_in1[31:0]; 
  assign _T_431 = in_bits_typ[1]; 
  assign _T_432 = _T_431 == 1'h0; 
  assign _T_433 = in_bits_typ[0]; 
  assign _T_434 = {1'b0,$signed(_T_430)}; 
  assign _T_435 = $signed(_T_430); 
  assign _T_436 = _T_433 ? $signed(_T_434) : $signed({{1{_T_435[31]}},_T_435}); 
  assign _GEN_19 = _T_432 ? $signed({{31{_T_436[32]}},_T_436}) : $signed(_T_427); 
  assign _T_442 = INToRecFN_1_io_out & 65'h1efefffffffffffff; 
  assign _T_443 = INToRecFN_1_io_out[63:61]; 
  assign _T_444 = ~ _T_443; 
  assign _T_445 = _T_444 == 3'h0; 
  assign _T_446 = _T_445 ? _T_442 : INToRecFN_1_io_out; 
  assign _T_447 = _T_446[64:33]; 
  assign _T_448 = {_T_447,INToRecFN_io_out}; 
  assign io_out_bits_data = _T_456_data; 
  assign io_out_bits_exc = _T_456_exc; 
  assign INToRecFN_io_signedIn = ~ _T_433; 
  assign INToRecFN_io_in = $unsigned(_GEN_19); 
  assign INToRecFN_io_roundingMode = in_bits_rm; 
  assign INToRecFN_1_io_signedIn = ~ _T_433; 
  assign INToRecFN_1_io_in = $unsigned(_GEN_19); 
  assign INToRecFN_1_io_roundingMode = in_bits_rm; 
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
  in_valid = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  in_bits_singleIn = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  in_bits_wflags = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  in_bits_rm = _RAND_3[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  in_bits_typ = _RAND_4[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {2{`RANDOM}};
  in_bits_in1 = _RAND_5[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {3{`RANDOM}};
  _T_456_data = _RAND_6[64:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  _T_456_exc = _RAND_7[4:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      in_valid <= 1'h0;
    end else begin
      in_valid <= io_in_valid;
    end
    if (io_in_valid) begin
      in_bits_singleIn <= io_in_bits_singleIn;
    end
    if (io_in_valid) begin
      in_bits_wflags <= io_in_bits_wflags;
    end
    if (io_in_valid) begin
      in_bits_rm <= io_in_bits_rm;
    end
    if (io_in_valid) begin
      in_bits_typ <= io_in_bits_typ;
    end
    if (io_in_valid) begin
      in_bits_in1 <= io_in_bits_in1;
    end
    if (in_valid) begin
      if (in_bits_wflags) begin
        if (tag) begin
          if (_T_445) begin
            _T_456_data <= _T_442;
          end else begin
            _T_456_data <= INToRecFN_1_io_out;
          end
        end else begin
          _T_456_data <= _T_448;
        end
      end else begin
        if (_T_425) begin
          _T_456_data <= _T_422;
        end else begin
          _T_456_data <= _T_265;
        end
      end
    end
    if (in_valid) begin
      if (in_bits_wflags) begin
        if (tag) begin
          _T_456_exc <= INToRecFN_1_io_exceptionFlags;
        end else begin
          _T_456_exc <= INToRecFN_io_exceptionFlags;
        end
      end else begin
        _T_456_exc <= 5'h0;
      end
    end
  end
endmodule
