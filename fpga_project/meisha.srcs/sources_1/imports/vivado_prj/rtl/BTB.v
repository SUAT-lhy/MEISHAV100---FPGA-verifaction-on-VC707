module BTB( 
  input         clock, 
  input         reset, 
  input  [38:0] io_req_bits_addr, 
  output        io_resp_valid, 
  output        io_resp_bits_taken, 
  output        io_resp_bits_bridx, 
  output [38:0] io_resp_bits_target, 
  output [4:0]  io_resp_bits_entry, 
  output [7:0]  io_resp_bits_bht_history, 
  output        io_resp_bits_bht_value, 
  input         io_btb_update_valid, 
  input  [4:0]  io_btb_update_bits_prediction_entry, 
  input  [38:0] io_btb_update_bits_pc, 
  input         io_btb_update_bits_isValid, 
  input  [38:0] io_btb_update_bits_br_pc, 
  input  [1:0]  io_btb_update_bits_cfiType, 
  input         io_bht_update_valid, 
  input  [7:0]  io_bht_update_bits_prediction_history, 
  input  [38:0] io_bht_update_bits_pc, 
  input         io_bht_update_bits_branch, 
  input         io_bht_update_bits_taken, 
  input         io_bht_update_bits_mispredict, 
  input         io_bht_advance_valid, 
  input         io_bht_advance_bits_bht_value, 
  input         io_ras_update_valid, 
  input  [1:0]  io_ras_update_bits_cfiType, 
  input  [38:0] io_ras_update_bits_returnAddr, 
  output        io_ras_head_valid, 
  output [38:0] io_ras_head_bits, 
  input         io_flush 
);
  reg  _T_1161 [0:511]; 
  reg [31:0] _RAND_0;
  wire  _T_1161__T_1232_data; 
  wire [8:0] _T_1161__T_1232_addr; 
  wire  _T_1161__T_1245_data; 
  wire [8:0] _T_1161__T_1245_addr; 
  wire  _T_1161__T_1245_mask; 
  wire  _T_1161__T_1245_en; 
  reg [12:0] idxs_0; 
  reg [31:0] _RAND_1;
  reg [12:0] idxs_1; 
  reg [31:0] _RAND_2;
  reg [12:0] idxs_2; 
  reg [31:0] _RAND_3;
  reg [12:0] idxs_3; 
  reg [31:0] _RAND_4;
  reg [12:0] idxs_4; 
  reg [31:0] _RAND_5;
  reg [12:0] idxs_5; 
  reg [31:0] _RAND_6;
  reg [12:0] idxs_6; 
  reg [31:0] _RAND_7;
  reg [12:0] idxs_7; 
  reg [31:0] _RAND_8;
  reg [12:0] idxs_8; 
  reg [31:0] _RAND_9;
  reg [12:0] idxs_9; 
  reg [31:0] _RAND_10;
  reg [12:0] idxs_10; 
  reg [31:0] _RAND_11;
  reg [12:0] idxs_11; 
  reg [31:0] _RAND_12;
  reg [12:0] idxs_12; 
  reg [31:0] _RAND_13;
  reg [12:0] idxs_13; 
  reg [31:0] _RAND_14;
  reg [12:0] idxs_14; 
  reg [31:0] _RAND_15;
  reg [12:0] idxs_15; 
  reg [31:0] _RAND_16;
  reg [12:0] idxs_16; 
  reg [31:0] _RAND_17;
  reg [12:0] idxs_17; 
  reg [31:0] _RAND_18;
  reg [12:0] idxs_18; 
  reg [31:0] _RAND_19;
  reg [12:0] idxs_19; 
  reg [31:0] _RAND_20;
  reg [12:0] idxs_20; 
  reg [31:0] _RAND_21;
  reg [12:0] idxs_21; 
  reg [31:0] _RAND_22;
  reg [12:0] idxs_22; 
  reg [31:0] _RAND_23;
  reg [12:0] idxs_23; 
  reg [31:0] _RAND_24;
  reg [12:0] idxs_24; 
  reg [31:0] _RAND_25;
  reg [12:0] idxs_25; 
  reg [31:0] _RAND_26;
  reg [12:0] idxs_26; 
  reg [31:0] _RAND_27;
  reg [12:0] idxs_27; 
  reg [31:0] _RAND_28;
  reg [2:0] idxPages_0; 
  reg [31:0] _RAND_29;
  reg [2:0] idxPages_1; 
  reg [31:0] _RAND_30;
  reg [2:0] idxPages_2; 
  reg [31:0] _RAND_31;
  reg [2:0] idxPages_3; 
  reg [31:0] _RAND_32;
  reg [2:0] idxPages_4; 
  reg [31:0] _RAND_33;
  reg [2:0] idxPages_5; 
  reg [31:0] _RAND_34;
  reg [2:0] idxPages_6; 
  reg [31:0] _RAND_35;
  reg [2:0] idxPages_7; 
  reg [31:0] _RAND_36;
  reg [2:0] idxPages_8; 
  reg [31:0] _RAND_37;
  reg [2:0] idxPages_9; 
  reg [31:0] _RAND_38;
  reg [2:0] idxPages_10; 
  reg [31:0] _RAND_39;
  reg [2:0] idxPages_11; 
  reg [31:0] _RAND_40;
  reg [2:0] idxPages_12; 
  reg [31:0] _RAND_41;
  reg [2:0] idxPages_13; 
  reg [31:0] _RAND_42;
  reg [2:0] idxPages_14; 
  reg [31:0] _RAND_43;
  reg [2:0] idxPages_15; 
  reg [31:0] _RAND_44;
  reg [2:0] idxPages_16; 
  reg [31:0] _RAND_45;
  reg [2:0] idxPages_17; 
  reg [31:0] _RAND_46;
  reg [2:0] idxPages_18; 
  reg [31:0] _RAND_47;
  reg [2:0] idxPages_19; 
  reg [31:0] _RAND_48;
  reg [2:0] idxPages_20; 
  reg [31:0] _RAND_49;
  reg [2:0] idxPages_21; 
  reg [31:0] _RAND_50;
  reg [2:0] idxPages_22; 
  reg [31:0] _RAND_51;
  reg [2:0] idxPages_23; 
  reg [31:0] _RAND_52;
  reg [2:0] idxPages_24; 
  reg [31:0] _RAND_53;
  reg [2:0] idxPages_25; 
  reg [31:0] _RAND_54;
  reg [2:0] idxPages_26; 
  reg [31:0] _RAND_55;
  reg [2:0] idxPages_27; 
  reg [31:0] _RAND_56;
  reg [12:0] tgts_0; 
  reg [31:0] _RAND_57;
  reg [12:0] tgts_1; 
  reg [31:0] _RAND_58;
  reg [12:0] tgts_2; 
  reg [31:0] _RAND_59;
  reg [12:0] tgts_3; 
  reg [31:0] _RAND_60;
  reg [12:0] tgts_4; 
  reg [31:0] _RAND_61;
  reg [12:0] tgts_5; 
  reg [31:0] _RAND_62;
  reg [12:0] tgts_6; 
  reg [31:0] _RAND_63;
  reg [12:0] tgts_7; 
  reg [31:0] _RAND_64;
  reg [12:0] tgts_8; 
  reg [31:0] _RAND_65;
  reg [12:0] tgts_9; 
  reg [31:0] _RAND_66;
  reg [12:0] tgts_10; 
  reg [31:0] _RAND_67;
  reg [12:0] tgts_11; 
  reg [31:0] _RAND_68;
  reg [12:0] tgts_12; 
  reg [31:0] _RAND_69;
  reg [12:0] tgts_13; 
  reg [31:0] _RAND_70;
  reg [12:0] tgts_14; 
  reg [31:0] _RAND_71;
  reg [12:0] tgts_15; 
  reg [31:0] _RAND_72;
  reg [12:0] tgts_16; 
  reg [31:0] _RAND_73;
  reg [12:0] tgts_17; 
  reg [31:0] _RAND_74;
  reg [12:0] tgts_18; 
  reg [31:0] _RAND_75;
  reg [12:0] tgts_19; 
  reg [31:0] _RAND_76;
  reg [12:0] tgts_20; 
  reg [31:0] _RAND_77;
  reg [12:0] tgts_21; 
  reg [31:0] _RAND_78;
  reg [12:0] tgts_22; 
  reg [31:0] _RAND_79;
  reg [12:0] tgts_23; 
  reg [31:0] _RAND_80;
  reg [12:0] tgts_24; 
  reg [31:0] _RAND_81;
  reg [12:0] tgts_25; 
  reg [31:0] _RAND_82;
  reg [12:0] tgts_26; 
  reg [31:0] _RAND_83;
  reg [12:0] tgts_27; 
  reg [31:0] _RAND_84;
  reg [2:0] tgtPages_0; 
  reg [31:0] _RAND_85;
  reg [2:0] tgtPages_1; 
  reg [31:0] _RAND_86;
  reg [2:0] tgtPages_2; 
  reg [31:0] _RAND_87;
  reg [2:0] tgtPages_3; 
  reg [31:0] _RAND_88;
  reg [2:0] tgtPages_4; 
  reg [31:0] _RAND_89;
  reg [2:0] tgtPages_5; 
  reg [31:0] _RAND_90;
  reg [2:0] tgtPages_6; 
  reg [31:0] _RAND_91;
  reg [2:0] tgtPages_7; 
  reg [31:0] _RAND_92;
  reg [2:0] tgtPages_8; 
  reg [31:0] _RAND_93;
  reg [2:0] tgtPages_9; 
  reg [31:0] _RAND_94;
  reg [2:0] tgtPages_10; 
  reg [31:0] _RAND_95;
  reg [2:0] tgtPages_11; 
  reg [31:0] _RAND_96;
  reg [2:0] tgtPages_12; 
  reg [31:0] _RAND_97;
  reg [2:0] tgtPages_13; 
  reg [31:0] _RAND_98;
  reg [2:0] tgtPages_14; 
  reg [31:0] _RAND_99;
  reg [2:0] tgtPages_15; 
  reg [31:0] _RAND_100;
  reg [2:0] tgtPages_16; 
  reg [31:0] _RAND_101;
  reg [2:0] tgtPages_17; 
  reg [31:0] _RAND_102;
  reg [2:0] tgtPages_18; 
  reg [31:0] _RAND_103;
  reg [2:0] tgtPages_19; 
  reg [31:0] _RAND_104;
  reg [2:0] tgtPages_20; 
  reg [31:0] _RAND_105;
  reg [2:0] tgtPages_21; 
  reg [31:0] _RAND_106;
  reg [2:0] tgtPages_22; 
  reg [31:0] _RAND_107;
  reg [2:0] tgtPages_23; 
  reg [31:0] _RAND_108;
  reg [2:0] tgtPages_24; 
  reg [31:0] _RAND_109;
  reg [2:0] tgtPages_25; 
  reg [31:0] _RAND_110;
  reg [2:0] tgtPages_26; 
  reg [31:0] _RAND_111;
  reg [2:0] tgtPages_27; 
  reg [31:0] _RAND_112;
  reg [24:0] pages_0; 
  reg [31:0] _RAND_113;
  reg [24:0] pages_1; 
  reg [31:0] _RAND_114;
  reg [24:0] pages_2; 
  reg [31:0] _RAND_115;
  reg [24:0] pages_3; 
  reg [31:0] _RAND_116;
  reg [24:0] pages_4; 
  reg [31:0] _RAND_117;
  reg [24:0] pages_5; 
  reg [31:0] _RAND_118;
  reg [5:0] pageValid; 
  reg [31:0] _RAND_119;
  reg [27:0] isValid; 
  reg [31:0] _RAND_120;
  reg [1:0] cfiType_0; 
  reg [31:0] _RAND_121;
  reg [1:0] cfiType_1; 
  reg [31:0] _RAND_122;
  reg [1:0] cfiType_2; 
  reg [31:0] _RAND_123;
  reg [1:0] cfiType_3; 
  reg [31:0] _RAND_124;
  reg [1:0] cfiType_4; 
  reg [31:0] _RAND_125;
  reg [1:0] cfiType_5; 
  reg [31:0] _RAND_126;
  reg [1:0] cfiType_6; 
  reg [31:0] _RAND_127;
  reg [1:0] cfiType_7; 
  reg [31:0] _RAND_128;
  reg [1:0] cfiType_8; 
  reg [31:0] _RAND_129;
  reg [1:0] cfiType_9; 
  reg [31:0] _RAND_130;
  reg [1:0] cfiType_10; 
  reg [31:0] _RAND_131;
  reg [1:0] cfiType_11; 
  reg [31:0] _RAND_132;
  reg [1:0] cfiType_12; 
  reg [31:0] _RAND_133;
  reg [1:0] cfiType_13; 
  reg [31:0] _RAND_134;
  reg [1:0] cfiType_14; 
  reg [31:0] _RAND_135;
  reg [1:0] cfiType_15; 
  reg [31:0] _RAND_136;
  reg [1:0] cfiType_16; 
  reg [31:0] _RAND_137;
  reg [1:0] cfiType_17; 
  reg [31:0] _RAND_138;
  reg [1:0] cfiType_18; 
  reg [31:0] _RAND_139;
  reg [1:0] cfiType_19; 
  reg [31:0] _RAND_140;
  reg [1:0] cfiType_20; 
  reg [31:0] _RAND_141;
  reg [1:0] cfiType_21; 
  reg [31:0] _RAND_142;
  reg [1:0] cfiType_22; 
  reg [31:0] _RAND_143;
  reg [1:0] cfiType_23; 
  reg [31:0] _RAND_144;
  reg [1:0] cfiType_24; 
  reg [31:0] _RAND_145;
  reg [1:0] cfiType_25; 
  reg [31:0] _RAND_146;
  reg [1:0] cfiType_26; 
  reg [31:0] _RAND_147;
  reg [1:0] cfiType_27; 
  reg [31:0] _RAND_148;
  reg  brIdx_0; 
  reg [31:0] _RAND_149;
  reg  brIdx_1; 
  reg [31:0] _RAND_150;
  reg  brIdx_2; 
  reg [31:0] _RAND_151;
  reg  brIdx_3; 
  reg [31:0] _RAND_152;
  reg  brIdx_4; 
  reg [31:0] _RAND_153;
  reg  brIdx_5; 
  reg [31:0] _RAND_154;
  reg  brIdx_6; 
  reg [31:0] _RAND_155;
  reg  brIdx_7; 
  reg [31:0] _RAND_156;
  reg  brIdx_8; 
  reg [31:0] _RAND_157;
  reg  brIdx_9; 
  reg [31:0] _RAND_158;
  reg  brIdx_10; 
  reg [31:0] _RAND_159;
  reg  brIdx_11; 
  reg [31:0] _RAND_160;
  reg  brIdx_12; 
  reg [31:0] _RAND_161;
  reg  brIdx_13; 
  reg [31:0] _RAND_162;
  reg  brIdx_14; 
  reg [31:0] _RAND_163;
  reg  brIdx_15; 
  reg [31:0] _RAND_164;
  reg  brIdx_16; 
  reg [31:0] _RAND_165;
  reg  brIdx_17; 
  reg [31:0] _RAND_166;
  reg  brIdx_18; 
  reg [31:0] _RAND_167;
  reg  brIdx_19; 
  reg [31:0] _RAND_168;
  reg  brIdx_20; 
  reg [31:0] _RAND_169;
  reg  brIdx_21; 
  reg [31:0] _RAND_170;
  reg  brIdx_22; 
  reg [31:0] _RAND_171;
  reg  brIdx_23; 
  reg [31:0] _RAND_172;
  reg  brIdx_24; 
  reg [31:0] _RAND_173;
  reg  brIdx_25; 
  reg [31:0] _RAND_174;
  reg  brIdx_26; 
  reg [31:0] _RAND_175;
  reg  brIdx_27; 
  reg [31:0] _RAND_176;
  reg  r_btb_update_valid; 
  reg [31:0] _RAND_177;
  reg [4:0] r_btb_update_bits_prediction_entry; 
  reg [31:0] _RAND_178;
  reg [38:0] r_btb_update_bits_pc; 
  reg [63:0] _RAND_179;
  reg  r_btb_update_bits_isValid; 
  reg [31:0] _RAND_180;
  reg [38:0] r_btb_update_bits_br_pc; 
  reg [63:0] _RAND_181;
  reg [1:0] r_btb_update_bits_cfiType; 
  reg [31:0] _RAND_182;
  wire [24:0] _T_248; 
  wire  _T_249; 
  wire  _T_250; 
  wire  _T_251; 
  wire  _T_252; 
  wire  _T_253; 
  wire  _T_254; 
  wire [1:0] _T_255; 
  wire [2:0] _T_256; 
  wire [1:0] _T_257; 
  wire [2:0] _T_258; 
  wire [5:0] _T_259; 
  wire [5:0] pageHit; 
  wire [12:0] _T_260; 
  wire  _T_261; 
  wire  _T_262; 
  wire  _T_263; 
  wire  _T_264; 
  wire  _T_265; 
  wire  _T_266; 
  wire  _T_267; 
  wire  _T_268; 
  wire  _T_269; 
  wire  _T_270; 
  wire  _T_271; 
  wire  _T_272; 
  wire  _T_273; 
  wire  _T_274; 
  wire  _T_275; 
  wire  _T_276; 
  wire  _T_277; 
  wire  _T_278; 
  wire  _T_279; 
  wire  _T_280; 
  wire  _T_281; 
  wire  _T_282; 
  wire  _T_283; 
  wire  _T_284; 
  wire  _T_285; 
  wire  _T_286; 
  wire  _T_287; 
  wire  _T_288; 
  wire [1:0] _T_289; 
  wire [2:0] _T_290; 
  wire [1:0] _T_291; 
  wire [1:0] _T_292; 
  wire [3:0] _T_293; 
  wire [6:0] _T_294; 
  wire [1:0] _T_295; 
  wire [2:0] _T_296; 
  wire [1:0] _T_297; 
  wire [1:0] _T_298; 
  wire [3:0] _T_299; 
  wire [6:0] _T_300; 
  wire [13:0] _T_301; 
  wire [1:0] _T_302; 
  wire [2:0] _T_303; 
  wire [1:0] _T_304; 
  wire [1:0] _T_305; 
  wire [3:0] _T_306; 
  wire [6:0] _T_307; 
  wire [1:0] _T_308; 
  wire [2:0] _T_309; 
  wire [1:0] _T_310; 
  wire [1:0] _T_311; 
  wire [3:0] _T_312; 
  wire [6:0] _T_313; 
  wire [13:0] _T_314; 
  wire [27:0] _T_315; 
  wire [27:0] idxHit; 
  wire [24:0] _T_316; 
  wire  _T_317; 
  wire  _T_318; 
  wire  _T_319; 
  wire  _T_320; 
  wire  _T_321; 
  wire  _T_322; 
  wire [1:0] _T_323; 
  wire [2:0] _T_324; 
  wire [1:0] _T_325; 
  wire [2:0] _T_326; 
  wire [5:0] _T_327; 
  wire [5:0] updatePageHit; 
  wire  updateHit; 
  wire  useUpdatePageHit; 
  wire  usePageHit; 
  wire  doIdxPageRepl; 
  reg [2:0] nextPageRepl; 
  reg [31:0] _RAND_183;
  wire [4:0] _T_329; 
  wire  _T_330; 
  wire [5:0] _T_331; 
  wire [7:0] _T_332; 
  wire [7:0] _T_333; 
  wire [7:0] _GEN_438; 
  wire [7:0] idxPageRepl; 
  wire [7:0] idxPageUpdateOH; 
  wire [3:0] _T_334; 
  wire [3:0] _T_335; 
  wire  _T_336; 
  wire [3:0] _T_337; 
  wire [1:0] _T_338; 
  wire [1:0] _T_339; 
  wire  _T_340; 
  wire [1:0] _T_341; 
  wire  _T_342; 
  wire [1:0] _T_343; 
  wire [2:0] idxPageUpdate; 
  wire [7:0] idxPageReplEn; 
  wire  samePage; 
  wire  _T_346; 
  wire  _T_347; 
  wire  doTgtPageRepl; 
  wire [4:0] _T_348; 
  wire  _T_349; 
  wire [5:0] _T_350; 
  wire [7:0] tgtPageRepl; 
  wire [7:0] _T_351; 
  wire [7:0] _GEN_439; 
  wire [7:0] _T_352; 
  wire [3:0] _T_353; 
  wire [3:0] _T_354; 
  wire  _T_355; 
  wire [3:0] _T_356; 
  wire [1:0] _T_357; 
  wire [1:0] _T_358; 
  wire  _T_359; 
  wire [1:0] _T_360; 
  wire  _T_361; 
  wire [1:0] _T_362; 
  wire [2:0] tgtPageUpdate; 
  wire [7:0] tgtPageReplEn; 
  wire  _T_363; 
  wire  _T_364; 
  wire  _T_365; 
  wire [1:0] _T_366; 
  wire [2:0] _GEN_440; 
  wire [2:0] _T_368; 
  wire  _T_369; 
  wire  _T_370; 
  reg [26:0] _T_373; 
  reg [31:0] _RAND_184;
  wire [27:0] _GEN_441; 
  wire [27:0] _T_374; 
  wire [27:0] _T_378; 
  wire  _T_379; 
  wire [1:0] _T_381; 
  wire [5:0] _T_382; 
  wire [4:0] _T_383; 
  wire  _T_384; 
  wire [27:0] _T_385; 
  wire  _T_386; 
  wire  _T_387; 
  wire [2:0] _T_388; 
  wire [5:0] _T_389; 
  wire [4:0] _T_390; 
  wire  _T_391; 
  wire [27:0] _T_392; 
  wire  _T_393; 
  wire  _T_394; 
  wire [3:0] _T_395; 
  wire [5:0] _T_396; 
  wire [4:0] _T_397; 
  wire  _T_398; 
  wire [27:0] _T_399; 
  wire  _T_400; 
  wire  _T_401; 
  wire [4:0] _T_402; 
  wire [5:0] _T_403; 
  wire [4:0] _T_404; 
  wire  _T_405; 
  wire [27:0] _T_406; 
  wire  _T_407; 
  wire  _T_408; 
  wire [5:0] _T_409; 
  wire [4:0] _T_410; 
  wire [4:0] waddr; 
  reg  r_resp_valid; 
  reg [31:0] _RAND_185;
  reg  r_resp_bits_taken; 
  reg [31:0] _RAND_186;
  reg [4:0] r_resp_bits_entry; 
  reg [31:0] _RAND_187;
  wire  _T_419; 
  wire  _T_420; 
  wire [4:0] _T_421; 
  wire  _T_423; 
  wire  _T_424; 
  wire [1:0] _T_425; 
  wire [27:0] _GEN_443; 
  wire [27:0] _T_426; 
  wire [27:0] _T_427; 
  wire [27:0] _T_428; 
  wire [27:0] _T_429; 
  wire [27:0] _T_430; 
  wire [1:0] _T_431; 
  wire  _T_432; 
  wire  _T_433; 
  wire [3:0] _T_434; 
  wire [27:0] _GEN_445; 
  wire [27:0] _T_435; 
  wire [27:0] _T_436; 
  wire [27:0] _T_437; 
  wire [27:0] _T_438; 
  wire [27:0] _T_439; 
  wire [2:0] _T_440; 
  wire  _T_441; 
  wire  _T_442; 
  wire [7:0] _T_443; 
  wire [27:0] _GEN_447; 
  wire [27:0] _T_444; 
  wire [27:0] _T_445; 
  wire [27:0] _T_446; 
  wire [27:0] _T_447; 
  wire [27:0] _T_448; 
  wire [3:0] _T_449; 
  wire  _T_450; 
  wire  _T_451; 
  wire [15:0] _T_452; 
  wire [27:0] _GEN_449; 
  wire [27:0] _T_453; 
  wire [27:0] _T_454; 
  wire [27:0] _T_455; 
  wire [27:0] _T_456; 
  wire [27:0] _T_457; 
  wire [4:0] _T_458; 
  wire  _T_459; 
  wire  _T_460; 
  wire [31:0] _T_461; 
  wire [31:0] _GEN_451; 
  wire [31:0] _T_462; 
  wire [27:0] _T_463; 
  wire [31:0] _GEN_452; 
  wire [31:0] _T_464; 
  wire [31:0] _T_465; 
  wire [31:0] _T_466; 
  wire [26:0] _T_468; 
  wire [31:0] _T_469; 
  wire [12:0] _T_471; 
  wire [3:0] _T_475; 
  wire [2:0] _idxPages_waddr; 
  wire [31:0] _GEN_453; 
  wire [31:0] _T_478; 
  wire [31:0] _T_479; 
  wire [31:0] _T_480; 
  wire [31:0] _T_481; 
  wire [37:0] _T_483; 
  wire  _brIdx_waddr; 
  wire  _T_484; 
  wire  _T_485; 
  wire [7:0] _T_486; 
  wire  _T_490; 
  wire  _T_491; 
  wire  _T_492; 
  wire [7:0] _T_493; 
  wire  _T_497; 
  wire  _T_498; 
  wire  _T_499; 
  wire [7:0] _GEN_455; 
  wire [7:0] _T_500; 
  wire [7:0] _T_501; 
  wire [31:0] _GEN_338; 
  wire [7:0] _GEN_373; 
  wire [6:0] _GEN_456; 
  wire [6:0] _T_502; 
  wire  _T_503; 
  wire  _T_504; 
  wire  _T_505; 
  wire  _T_506; 
  wire  _T_507; 
  wire  _T_508; 
  wire  _T_509; 
  wire  _T_510; 
  wire  _T_511; 
  wire  _T_512; 
  wire  _T_513; 
  wire  _T_514; 
  wire  _T_515; 
  wire  _T_516; 
  wire  _T_517; 
  wire  _T_518; 
  wire  _T_519; 
  wire  _T_520; 
  wire  _T_521; 
  wire  _T_522; 
  wire  _T_523; 
  wire  _T_524; 
  wire  _T_525; 
  wire  _T_526; 
  wire  _T_527; 
  wire  _T_528; 
  wire  _T_529; 
  wire  _T_530; 
  wire [2:0] _T_532; 
  wire [2:0] _T_533; 
  wire [2:0] _T_534; 
  wire [2:0] _T_535; 
  wire [2:0] _T_536; 
  wire [2:0] _T_537; 
  wire [2:0] _T_538; 
  wire [2:0] _T_539; 
  wire [2:0] _T_540; 
  wire [2:0] _T_541; 
  wire [2:0] _T_542; 
  wire [2:0] _T_543; 
  wire [2:0] _T_544; 
  wire [2:0] _T_545; 
  wire [2:0] _T_546; 
  wire [2:0] _T_547; 
  wire [2:0] _T_548; 
  wire [2:0] _T_549; 
  wire [2:0] _T_550; 
  wire [2:0] _T_551; 
  wire [2:0] _T_552; 
  wire [2:0] _T_553; 
  wire [2:0] _T_554; 
  wire [2:0] _T_555; 
  wire [2:0] _T_556; 
  wire [2:0] _T_557; 
  wire [2:0] _T_558; 
  wire [2:0] _T_559; 
  wire [2:0] _T_560; 
  wire [2:0] _T_561; 
  wire [2:0] _T_562; 
  wire [2:0] _T_563; 
  wire [2:0] _T_564; 
  wire [2:0] _T_565; 
  wire [2:0] _T_566; 
  wire [2:0] _T_567; 
  wire [2:0] _T_568; 
  wire [2:0] _T_569; 
  wire [2:0] _T_570; 
  wire [2:0] _T_571; 
  wire [2:0] _T_572; 
  wire [2:0] _T_573; 
  wire [2:0] _T_574; 
  wire [2:0] _T_575; 
  wire [2:0] _T_576; 
  wire [2:0] _T_577; 
  wire [2:0] _T_578; 
  wire [2:0] _T_579; 
  wire [2:0] _T_580; 
  wire [2:0] _T_581; 
  wire [2:0] _T_582; 
  wire [2:0] _T_583; 
  wire [2:0] _T_584; 
  wire [2:0] _T_585; 
  wire [2:0] _T_586; 
  wire [6:0] _T_589; 
  wire [2:0] _T_620; 
  wire [2:0] _T_621; 
  wire [2:0] _T_622; 
  wire [2:0] _T_623; 
  wire [2:0] _T_624; 
  wire [2:0] _T_625; 
  wire [2:0] _T_626; 
  wire [2:0] _T_627; 
  wire [2:0] _T_628; 
  wire [2:0] _T_629; 
  wire [2:0] _T_630; 
  wire [2:0] _T_631; 
  wire [2:0] _T_632; 
  wire [2:0] _T_633; 
  wire [2:0] _T_634; 
  wire [2:0] _T_635; 
  wire [2:0] _T_636; 
  wire [2:0] _T_637; 
  wire [2:0] _T_638; 
  wire [2:0] _T_639; 
  wire [2:0] _T_640; 
  wire [2:0] _T_641; 
  wire [2:0] _T_642; 
  wire [2:0] _T_643; 
  wire [2:0] _T_644; 
  wire [2:0] _T_645; 
  wire [2:0] _T_646; 
  wire [2:0] _T_647; 
  wire [2:0] _T_648; 
  wire [2:0] _T_649; 
  wire [2:0] _T_650; 
  wire [2:0] _T_651; 
  wire [2:0] _T_652; 
  wire [2:0] _T_653; 
  wire [2:0] _T_654; 
  wire [2:0] _T_655; 
  wire [2:0] _T_656; 
  wire [2:0] _T_657; 
  wire [2:0] _T_658; 
  wire [2:0] _T_659; 
  wire [2:0] _T_660; 
  wire [2:0] _T_661; 
  wire [2:0] _T_662; 
  wire [2:0] _T_663; 
  wire [2:0] _T_664; 
  wire [2:0] _T_665; 
  wire [2:0] _T_666; 
  wire [2:0] _T_667; 
  wire [2:0] _T_668; 
  wire [2:0] _T_669; 
  wire [2:0] _T_670; 
  wire [2:0] _T_671; 
  wire [2:0] _T_672; 
  wire [2:0] _T_673; 
  wire [2:0] _T_674; 
  wire [12:0] _T_707; 
  wire [12:0] _T_708; 
  wire [12:0] _T_709; 
  wire [12:0] _T_710; 
  wire [12:0] _T_711; 
  wire [12:0] _T_712; 
  wire [12:0] _T_713; 
  wire [12:0] _T_714; 
  wire [12:0] _T_715; 
  wire [12:0] _T_716; 
  wire [12:0] _T_717; 
  wire [12:0] _T_718; 
  wire [12:0] _T_719; 
  wire [12:0] _T_720; 
  wire [12:0] _T_721; 
  wire [12:0] _T_722; 
  wire [12:0] _T_723; 
  wire [12:0] _T_724; 
  wire [12:0] _T_725; 
  wire [12:0] _T_726; 
  wire [12:0] _T_727; 
  wire [12:0] _T_728; 
  wire [12:0] _T_729; 
  wire [12:0] _T_730; 
  wire [12:0] _T_731; 
  wire [12:0] _T_732; 
  wire [12:0] _T_733; 
  wire [12:0] _T_734; 
  wire [12:0] _T_735; 
  wire [12:0] _T_736; 
  wire [12:0] _T_737; 
  wire [12:0] _T_738; 
  wire [12:0] _T_739; 
  wire [12:0] _T_740; 
  wire [12:0] _T_741; 
  wire [12:0] _T_742; 
  wire [12:0] _T_743; 
  wire [12:0] _T_744; 
  wire [12:0] _T_745; 
  wire [12:0] _T_746; 
  wire [12:0] _T_747; 
  wire [12:0] _T_748; 
  wire [12:0] _T_749; 
  wire [12:0] _T_750; 
  wire [12:0] _T_751; 
  wire [12:0] _T_752; 
  wire [12:0] _T_753; 
  wire [12:0] _T_754; 
  wire [12:0] _T_755; 
  wire [12:0] _T_756; 
  wire [12:0] _T_757; 
  wire [12:0] _T_758; 
  wire [12:0] _T_759; 
  wire [12:0] _T_760; 
  wire [12:0] _T_761; 
  wire [13:0] _GEN_457; 
  wire [13:0] _T_764; 
  wire [24:0] _GEN_375; 
  wire [24:0] _GEN_376; 
  wire [24:0] _GEN_377; 
  wire [24:0] _GEN_378; 
  wire [24:0] _GEN_379; 
  wire [38:0] _T_765; 
  wire [11:0] _T_766; 
  wire [15:0] _T_767; 
  wire  _T_768; 
  wire [15:0] _GEN_458; 
  wire [15:0] _T_769; 
  wire [7:0] _T_770; 
  wire [7:0] _T_771; 
  wire  _T_772; 
  wire [7:0] _T_773; 
  wire [3:0] _T_774; 
  wire [3:0] _T_775; 
  wire  _T_776; 
  wire [3:0] _T_777; 
  wire [1:0] _T_778; 
  wire [1:0] _T_779; 
  wire  _T_780; 
  wire [1:0] _T_781; 
  wire  _T_782; 
  wire [1:0] _T_783; 
  wire [2:0] _T_784; 
  wire [3:0] _T_785; 
  wire  _T_816; 
  wire  _T_817; 
  wire  _T_818; 
  wire  _T_819; 
  wire  _T_820; 
  wire  _T_821; 
  wire  _T_822; 
  wire  _T_823; 
  wire  _T_824; 
  wire  _T_825; 
  wire  _T_826; 
  wire  _T_827; 
  wire  _T_828; 
  wire  _T_829; 
  wire  _T_830; 
  wire  _T_831; 
  wire  _T_832; 
  wire  _T_833; 
  wire  _T_834; 
  wire  _T_835; 
  wire  _T_836; 
  wire  _T_837; 
  wire  _T_838; 
  wire  _T_839; 
  wire  _T_840; 
  wire  _T_841; 
  wire  _T_842; 
  wire  _T_843; 
  wire  _T_844; 
  wire  _T_845; 
  wire  _T_846; 
  wire  _T_847; 
  wire  _T_848; 
  wire  _T_849; 
  wire  _T_850; 
  wire  _T_851; 
  wire  _T_852; 
  wire  _T_853; 
  wire  _T_854; 
  wire  _T_855; 
  wire  _T_856; 
  wire  _T_857; 
  wire  _T_858; 
  wire  _T_859; 
  wire  _T_860; 
  wire  _T_861; 
  wire  _T_862; 
  wire  _T_863; 
  wire  _T_864; 
  wire  _T_865; 
  wire  _T_866; 
  wire  _T_867; 
  wire  _T_868; 
  wire  _T_869; 
  wire [13:0] _T_967; 
  wire [6:0] _T_968; 
  wire [2:0] _T_969; 
  wire  _T_970; 
  wire [1:0] _T_972; 
  wire  _T_973; 
  wire  _T_975; 
  wire  _T_977; 
  wire  _T_979; 
  wire  _T_981; 
  wire  _T_983; 
  wire  _T_984; 
  wire [3:0] _T_985; 
  wire [1:0] _T_986; 
  wire  _T_987; 
  wire  _T_989; 
  wire  _T_991; 
  wire  _T_993; 
  wire [1:0] _T_995; 
  wire  _T_996; 
  wire  _T_998; 
  wire  _T_1000; 
  wire  _T_1002; 
  wire  _T_1004; 
  wire  _T_1005; 
  wire  _T_1006; 
  wire  _T_1007; 
  wire  _T_1008; 
  wire  _T_1009; 
  wire  _T_1010; 
  wire  _T_1011; 
  wire [6:0] _T_1012; 
  wire [2:0] _T_1013; 
  wire  _T_1014; 
  wire [1:0] _T_1016; 
  wire  _T_1017; 
  wire  _T_1019; 
  wire  _T_1021; 
  wire  _T_1023; 
  wire  _T_1025; 
  wire  _T_1027; 
  wire  _T_1028; 
  wire [3:0] _T_1029; 
  wire [1:0] _T_1030; 
  wire  _T_1031; 
  wire  _T_1033; 
  wire  _T_1035; 
  wire  _T_1037; 
  wire [1:0] _T_1039; 
  wire  _T_1040; 
  wire  _T_1042; 
  wire  _T_1044; 
  wire  _T_1046; 
  wire  _T_1048; 
  wire  _T_1049; 
  wire  _T_1050; 
  wire  _T_1051; 
  wire  _T_1052; 
  wire  _T_1053; 
  wire  _T_1054; 
  wire  _T_1055; 
  wire  _T_1056; 
  wire  _T_1057; 
  wire  _T_1058; 
  wire  _T_1059; 
  wire [13:0] _T_1060; 
  wire [6:0] _T_1061; 
  wire [2:0] _T_1062; 
  wire  _T_1063; 
  wire [1:0] _T_1065; 
  wire  _T_1066; 
  wire  _T_1068; 
  wire  _T_1070; 
  wire  _T_1072; 
  wire  _T_1074; 
  wire  _T_1076; 
  wire  _T_1077; 
  wire [3:0] _T_1078; 
  wire [1:0] _T_1079; 
  wire  _T_1080; 
  wire  _T_1082; 
  wire  _T_1084; 
  wire  _T_1086; 
  wire [1:0] _T_1088; 
  wire  _T_1089; 
  wire  _T_1091; 
  wire  _T_1093; 
  wire  _T_1095; 
  wire  _T_1097; 
  wire  _T_1098; 
  wire  _T_1099; 
  wire  _T_1100; 
  wire  _T_1101; 
  wire  _T_1102; 
  wire  _T_1103; 
  wire  _T_1104; 
  wire [6:0] _T_1105; 
  wire [2:0] _T_1106; 
  wire  _T_1107; 
  wire [1:0] _T_1109; 
  wire  _T_1110; 
  wire  _T_1112; 
  wire  _T_1114; 
  wire  _T_1116; 
  wire  _T_1118; 
  wire  _T_1120; 
  wire  _T_1121; 
  wire [3:0] _T_1122; 
  wire [1:0] _T_1123; 
  wire  _T_1124; 
  wire  _T_1126; 
  wire  _T_1128; 
  wire  _T_1130; 
  wire [1:0] _T_1132; 
  wire  _T_1133; 
  wire  _T_1135; 
  wire  _T_1137; 
  wire  _T_1139; 
  wire  _T_1141; 
  wire  _T_1142; 
  wire  _T_1143; 
  wire  _T_1144; 
  wire  _T_1145; 
  wire  _T_1146; 
  wire  _T_1147; 
  wire  _T_1148; 
  wire  _T_1149; 
  wire  _T_1150; 
  wire  _T_1151; 
  wire  _T_1152; 
  wire  _T_1154; 
  wire  _T_1155; 
  wire  _T_1156; 
  wire [27:0] _T_1157; 
  wire [27:0] _T_1158; 
  wire [31:0] _GEN_380; 
  wire [31:0] _GEN_381; 
  reg [7:0] _T_1163; 
  reg [31:0] _RAND_188;
  wire  _T_1164; 
  wire  _T_1165; 
  wire  _T_1166; 
  wire  _T_1167; 
  wire  _T_1168; 
  wire  _T_1169; 
  wire  _T_1170; 
  wire  _T_1171; 
  wire  _T_1172; 
  wire  _T_1173; 
  wire  _T_1174; 
  wire  _T_1175; 
  wire  _T_1176; 
  wire  _T_1177; 
  wire  _T_1178; 
  wire  _T_1179; 
  wire  _T_1180; 
  wire  _T_1181; 
  wire  _T_1182; 
  wire  _T_1183; 
  wire  _T_1184; 
  wire  _T_1185; 
  wire  _T_1186; 
  wire  _T_1187; 
  wire  _T_1188; 
  wire  _T_1189; 
  wire  _T_1190; 
  wire  _T_1191; 
  wire [1:0] _T_1192; 
  wire [2:0] _T_1193; 
  wire [1:0] _T_1194; 
  wire [1:0] _T_1195; 
  wire [3:0] _T_1196; 
  wire [6:0] _T_1197; 
  wire [1:0] _T_1198; 
  wire [2:0] _T_1199; 
  wire [1:0] _T_1200; 
  wire [1:0] _T_1201; 
  wire [3:0] _T_1202; 
  wire [6:0] _T_1203; 
  wire [13:0] _T_1204; 
  wire [1:0] _T_1205; 
  wire [2:0] _T_1206; 
  wire [1:0] _T_1207; 
  wire [1:0] _T_1208; 
  wire [3:0] _T_1209; 
  wire [6:0] _T_1210; 
  wire [1:0] _T_1211; 
  wire [2:0] _T_1212; 
  wire [1:0] _T_1213; 
  wire [1:0] _T_1214; 
  wire [3:0] _T_1215; 
  wire [6:0] _T_1216; 
  wire [13:0] _T_1217; 
  wire [27:0] _T_1218; 
  wire [27:0] _T_1219; 
  wire  _T_1220; 
  wire [36:0] _T_1223; 
  wire [8:0] _T_1224; 
  wire [27:0] _T_1225; 
  wire [1:0] _T_1226; 
  wire [8:0] _GEN_459; 
  wire [8:0] _T_1227; 
  wire [15:0] _T_1228; 
  wire [2:0] _T_1229; 
  wire [8:0] _GEN_460; 
  wire [8:0] _T_1230; 
  wire [6:0] _T_1234; 
  wire [7:0] _T_1235; 
  wire [36:0] _T_1236; 
  wire [8:0] _T_1237; 
  wire [27:0] _T_1238; 
  wire [1:0] _T_1239; 
  wire [8:0] _GEN_461; 
  wire [8:0] _T_1240; 
  wire [15:0] _T_1241; 
  wire [2:0] _T_1242; 
  wire [8:0] _GEN_462; 
  wire [8:0] _T_1243; 
  wire [6:0] _T_1246; 
  wire [7:0] _T_1247; 
  wire  _T_1222_value; 
  wire  _T_1249; 
  wire  _T_1250; 
  reg [2:0] _T_1252; 
  reg [31:0] _RAND_189;
  reg [2:0] _T_1254; 
  reg [31:0] _RAND_190;
  reg [38:0] _T_1258_0; 
  reg [63:0] _RAND_191;
  reg [38:0] _T_1258_1; 
  reg [63:0] _RAND_192;
  reg [38:0] _T_1258_2; 
  reg [63:0] _RAND_193;
  reg [38:0] _T_1258_3; 
  reg [63:0] _RAND_194;
  reg [38:0] _T_1258_4; 
  reg [63:0] _RAND_195;
  reg [38:0] _T_1258_5; 
  reg [63:0] _RAND_196;
  wire  _T_1267; 
  wire  _T_1268; 
  wire  _T_1269; 
  wire  _T_1270; 
  wire  _T_1271; 
  wire  _T_1272; 
  wire  _T_1273; 
  wire  _T_1274; 
  wire  _T_1275; 
  wire  _T_1276; 
  wire  _T_1277; 
  wire  _T_1278; 
  wire  _T_1279; 
  wire  _T_1280; 
  wire  _T_1281; 
  wire  _T_1282; 
  wire  _T_1283; 
  wire  _T_1284; 
  wire  _T_1285; 
  wire  _T_1286; 
  wire  _T_1287; 
  wire  _T_1288; 
  wire  _T_1289; 
  wire  _T_1290; 
  wire  _T_1291; 
  wire  _T_1292; 
  wire  _T_1293; 
  wire  _T_1294; 
  wire [1:0] _T_1295; 
  wire [2:0] _T_1296; 
  wire [1:0] _T_1297; 
  wire [1:0] _T_1298; 
  wire [3:0] _T_1299; 
  wire [6:0] _T_1300; 
  wire [1:0] _T_1301; 
  wire [2:0] _T_1302; 
  wire [1:0] _T_1303; 
  wire [1:0] _T_1304; 
  wire [3:0] _T_1305; 
  wire [6:0] _T_1306; 
  wire [13:0] _T_1307; 
  wire [1:0] _T_1308; 
  wire [2:0] _T_1309; 
  wire [1:0] _T_1310; 
  wire [1:0] _T_1311; 
  wire [3:0] _T_1312; 
  wire [6:0] _T_1313; 
  wire [1:0] _T_1314; 
  wire [2:0] _T_1315; 
  wire [1:0] _T_1316; 
  wire [1:0] _T_1317; 
  wire [3:0] _T_1318; 
  wire [6:0] _T_1319; 
  wire [13:0] _T_1320; 
  wire [27:0] _T_1321; 
  wire [27:0] _T_1322; 
  wire  _T_1323; 
  wire  _T_1324; 
  wire  _T_1325; 
  wire [38:0] _GEN_399; 
  wire [38:0] _GEN_400; 
  wire [38:0] _GEN_401; 
  wire [38:0] _GEN_402; 
  wire [38:0] _GEN_403; 
  wire  _T_1329; 
  wire  _T_1331; 
  wire  _T_1332; 
  wire [2:0] _T_1334; 
  wire  _T_1335; 
  wire [2:0] _T_1338; 
  wire [2:0] _T_1339; 
  wire  _T_1341; 
  wire [3:0] _T_1344; 
  wire [3:0] _T_1345; 
  wire [2:0] _T_1346; 
  wire  _T_1347; 
  wire [3:0] _T_1349; 
  wire [3:0] _T_1350; 
  wire [2:0] _T_1351; 
  assign _T_1161__T_1232_addr = _T_1227 ^ _T_1230;
  assign _T_1161__T_1232_data = _T_1161[_T_1161__T_1232_addr]; 
  assign _T_1161__T_1245_data = io_bht_update_bits_taken;
  assign _T_1161__T_1245_addr = _T_1240 ^ _T_1243;
  assign _T_1161__T_1245_mask = 1'h1;
  assign _T_1161__T_1245_en = io_bht_update_valid ? io_bht_update_bits_branch : 1'h0;
  assign _T_248 = io_req_bits_addr[38:14]; 
  assign _T_249 = pages_0 == _T_248; 
  assign _T_250 = pages_1 == _T_248; 
  assign _T_251 = pages_2 == _T_248; 
  assign _T_252 = pages_3 == _T_248; 
  assign _T_253 = pages_4 == _T_248; 
  assign _T_254 = pages_5 == _T_248; 
  assign _T_255 = {_T_251,_T_250}; 
  assign _T_256 = {_T_255,_T_249}; 
  assign _T_257 = {_T_254,_T_253}; 
  assign _T_258 = {_T_257,_T_252}; 
  assign _T_259 = {_T_258,_T_256}; 
  assign pageHit = pageValid & _T_259; 
  assign _T_260 = io_req_bits_addr[13:1]; 
  assign _T_261 = idxs_0 == _T_260; 
  assign _T_262 = idxs_1 == _T_260; 
  assign _T_263 = idxs_2 == _T_260; 
  assign _T_264 = idxs_3 == _T_260; 
  assign _T_265 = idxs_4 == _T_260; 
  assign _T_266 = idxs_5 == _T_260; 
  assign _T_267 = idxs_6 == _T_260; 
  assign _T_268 = idxs_7 == _T_260; 
  assign _T_269 = idxs_8 == _T_260; 
  assign _T_270 = idxs_9 == _T_260; 
  assign _T_271 = idxs_10 == _T_260; 
  assign _T_272 = idxs_11 == _T_260; 
  assign _T_273 = idxs_12 == _T_260; 
  assign _T_274 = idxs_13 == _T_260; 
  assign _T_275 = idxs_14 == _T_260; 
  assign _T_276 = idxs_15 == _T_260; 
  assign _T_277 = idxs_16 == _T_260; 
  assign _T_278 = idxs_17 == _T_260; 
  assign _T_279 = idxs_18 == _T_260; 
  assign _T_280 = idxs_19 == _T_260; 
  assign _T_281 = idxs_20 == _T_260; 
  assign _T_282 = idxs_21 == _T_260; 
  assign _T_283 = idxs_22 == _T_260; 
  assign _T_284 = idxs_23 == _T_260; 
  assign _T_285 = idxs_24 == _T_260; 
  assign _T_286 = idxs_25 == _T_260; 
  assign _T_287 = idxs_26 == _T_260; 
  assign _T_288 = idxs_27 == _T_260; 
  assign _T_289 = {_T_263,_T_262}; 
  assign _T_290 = {_T_289,_T_261}; 
  assign _T_291 = {_T_265,_T_264}; 
  assign _T_292 = {_T_267,_T_266}; 
  assign _T_293 = {_T_292,_T_291}; 
  assign _T_294 = {_T_293,_T_290}; 
  assign _T_295 = {_T_270,_T_269}; 
  assign _T_296 = {_T_295,_T_268}; 
  assign _T_297 = {_T_272,_T_271}; 
  assign _T_298 = {_T_274,_T_273}; 
  assign _T_299 = {_T_298,_T_297}; 
  assign _T_300 = {_T_299,_T_296}; 
  assign _T_301 = {_T_300,_T_294}; 
  assign _T_302 = {_T_277,_T_276}; 
  assign _T_303 = {_T_302,_T_275}; 
  assign _T_304 = {_T_279,_T_278}; 
  assign _T_305 = {_T_281,_T_280}; 
  assign _T_306 = {_T_305,_T_304}; 
  assign _T_307 = {_T_306,_T_303}; 
  assign _T_308 = {_T_284,_T_283}; 
  assign _T_309 = {_T_308,_T_282}; 
  assign _T_310 = {_T_286,_T_285}; 
  assign _T_311 = {_T_288,_T_287}; 
  assign _T_312 = {_T_311,_T_310}; 
  assign _T_313 = {_T_312,_T_309}; 
  assign _T_314 = {_T_313,_T_307}; 
  assign _T_315 = {_T_314,_T_301}; 
  assign idxHit = _T_315 & isValid; 
  assign _T_316 = r_btb_update_bits_pc[38:14]; 
  assign _T_317 = pages_0 == _T_316; 
  assign _T_318 = pages_1 == _T_316; 
  assign _T_319 = pages_2 == _T_316; 
  assign _T_320 = pages_3 == _T_316; 
  assign _T_321 = pages_4 == _T_316; 
  assign _T_322 = pages_5 == _T_316; 
  assign _T_323 = {_T_319,_T_318}; 
  assign _T_324 = {_T_323,_T_317}; 
  assign _T_325 = {_T_322,_T_321}; 
  assign _T_326 = {_T_325,_T_320}; 
  assign _T_327 = {_T_326,_T_324}; 
  assign updatePageHit = pageValid & _T_327; 
  assign updateHit = r_btb_update_bits_prediction_entry < 5'h1c; 
  assign useUpdatePageHit = updatePageHit != 6'h0; 
  assign usePageHit = pageHit != 6'h0; 
  assign doIdxPageRepl = useUpdatePageHit == 1'h0; 
  assign _T_329 = pageHit[4:0]; 
  assign _T_330 = pageHit[5]; 
  assign _T_331 = {_T_329,_T_330}; 
  assign _T_332 = 8'h1 << nextPageRepl; 
  assign _T_333 = usePageHit ? 8'h0 : _T_332; 
  assign _GEN_438 = {{2'd0}, _T_331}; 
  assign idxPageRepl = _GEN_438 | _T_333; 
  assign idxPageUpdateOH = useUpdatePageHit ? {{2'd0}, updatePageHit} : idxPageRepl; 
  assign _T_334 = idxPageUpdateOH[7:4]; 
  assign _T_335 = idxPageUpdateOH[3:0]; 
  assign _T_336 = _T_334 != 4'h0; 
  assign _T_337 = _T_334 | _T_335; 
  assign _T_338 = _T_337[3:2]; 
  assign _T_339 = _T_337[1:0]; 
  assign _T_340 = _T_338 != 2'h0; 
  assign _T_341 = _T_338 | _T_339; 
  assign _T_342 = _T_341[1]; 
  assign _T_343 = {_T_340,_T_342}; 
  assign idxPageUpdate = {_T_336,_T_343}; 
  assign idxPageReplEn = doIdxPageRepl ? idxPageRepl : 8'h0; 
  assign samePage = _T_316 == _T_248; 
  assign _T_346 = samePage == 1'h0; 
  assign _T_347 = usePageHit == 1'h0; 
  assign doTgtPageRepl = _T_346 & _T_347; 
  assign _T_348 = idxPageUpdateOH[4:0]; 
  assign _T_349 = idxPageUpdateOH[5]; 
  assign _T_350 = {_T_348,_T_349}; 
  assign tgtPageRepl = samePage ? idxPageUpdateOH : {{2'd0}, _T_350}; 
  assign _T_351 = usePageHit ? 8'h0 : tgtPageRepl; 
  assign _GEN_439 = {{2'd0}, pageHit}; 
  assign _T_352 = _GEN_439 | _T_351; 
  assign _T_353 = _T_352[7:4]; 
  assign _T_354 = _T_352[3:0]; 
  assign _T_355 = _T_353 != 4'h0; 
  assign _T_356 = _T_353 | _T_354; 
  assign _T_357 = _T_356[3:2]; 
  assign _T_358 = _T_356[1:0]; 
  assign _T_359 = _T_357 != 2'h0; 
  assign _T_360 = _T_357 | _T_358; 
  assign _T_361 = _T_360[1]; 
  assign _T_362 = {_T_359,_T_361}; 
  assign tgtPageUpdate = {_T_355,_T_362}; 
  assign tgtPageReplEn = doTgtPageRepl ? tgtPageRepl : 8'h0; 
  assign _T_363 = doIdxPageRepl | doTgtPageRepl; 
  assign _T_364 = r_btb_update_valid & _T_363; 
  assign _T_365 = doIdxPageRepl & doTgtPageRepl; 
  assign _T_366 = _T_365 ? 2'h2 : 2'h1; 
  assign _GEN_440 = {{1'd0}, _T_366}; 
  assign _T_368 = nextPageRepl + _GEN_440; 
  assign _T_369 = _T_368 >= 3'h6; 
  assign _T_370 = _T_368[0]; 
  assign _GEN_441 = {{1'd0}, _T_373}; 
  assign _T_374 = _GEN_441 << 1; 
  assign _T_378 = _T_374 >> 1'h1; 
  assign _T_379 = _T_378[0]; 
  assign _T_381 = {1'h1,_T_379}; 
  assign _T_382 = {_T_381,4'h8}; 
  assign _T_383 = _T_382[4:0]; 
  assign _T_384 = _T_383 < 5'h1c; 
  assign _T_385 = _T_374 >> _T_381; 
  assign _T_386 = _T_385[0]; 
  assign _T_387 = _T_384 & _T_386; 
  assign _T_388 = {_T_381,_T_387}; 
  assign _T_389 = {_T_388,3'h4}; 
  assign _T_390 = _T_389[4:0]; 
  assign _T_391 = _T_390 < 5'h1c; 
  assign _T_392 = _T_374 >> _T_388; 
  assign _T_393 = _T_392[0]; 
  assign _T_394 = _T_391 & _T_393; 
  assign _T_395 = {_T_388,_T_394}; 
  assign _T_396 = {_T_395,2'h2}; 
  assign _T_397 = _T_396[4:0]; 
  assign _T_398 = _T_397 < 5'h1c; 
  assign _T_399 = _T_374 >> _T_395; 
  assign _T_400 = _T_399[0]; 
  assign _T_401 = _T_398 & _T_400; 
  assign _T_402 = {_T_395,_T_401}; 
  assign _T_403 = {_T_402,1'h1}; 
  assign _T_404 = _T_403[4:0]; 
  assign _T_405 = _T_404 < 5'h1c; 
  assign _T_406 = _T_374 >> _T_402; 
  assign _T_407 = _T_406[0]; 
  assign _T_408 = _T_405 & _T_407; 
  assign _T_409 = {_T_402,_T_408}; 
  assign _T_410 = _T_409[4:0]; 
  assign waddr = updateHit ? r_btb_update_bits_prediction_entry : _T_410; 
  assign _T_419 = r_resp_valid & r_resp_bits_taken; 
  assign _T_420 = _T_419 | r_btb_update_valid; 
  assign _T_421 = r_btb_update_valid ? waddr : r_resp_bits_entry; 
  assign _T_423 = _T_421[4]; 
  assign _T_424 = _T_423 == 1'h0; 
  assign _T_425 = 2'h1 << 1'h1; 
  assign _GEN_443 = {{26'd0}, _T_425}; 
  assign _T_426 = _T_374 | _GEN_443; 
  assign _T_427 = ~ _T_374; 
  assign _T_428 = _T_427 | _GEN_443; 
  assign _T_429 = ~ _T_428; 
  assign _T_430 = _T_424 ? _T_426 : _T_429; 
  assign _T_431 = {1'h1,_T_423}; 
  assign _T_432 = _T_421[3]; 
  assign _T_433 = _T_432 == 1'h0; 
  assign _T_434 = 4'h1 << _T_431; 
  assign _GEN_445 = {{24'd0}, _T_434}; 
  assign _T_435 = _T_430 | _GEN_445; 
  assign _T_436 = ~ _T_430; 
  assign _T_437 = _T_436 | _GEN_445; 
  assign _T_438 = ~ _T_437; 
  assign _T_439 = _T_433 ? _T_435 : _T_438; 
  assign _T_440 = {_T_431,_T_432}; 
  assign _T_441 = _T_421[2]; 
  assign _T_442 = _T_441 == 1'h0; 
  assign _T_443 = 8'h1 << _T_440; 
  assign _GEN_447 = {{20'd0}, _T_443}; 
  assign _T_444 = _T_439 | _GEN_447; 
  assign _T_445 = ~ _T_439; 
  assign _T_446 = _T_445 | _GEN_447; 
  assign _T_447 = ~ _T_446; 
  assign _T_448 = _T_442 ? _T_444 : _T_447; 
  assign _T_449 = {_T_440,_T_441}; 
  assign _T_450 = _T_421[1]; 
  assign _T_451 = _T_450 == 1'h0; 
  assign _T_452 = 16'h1 << _T_449; 
  assign _GEN_449 = {{12'd0}, _T_452}; 
  assign _T_453 = _T_448 | _GEN_449; 
  assign _T_454 = ~ _T_448; 
  assign _T_455 = _T_454 | _GEN_449; 
  assign _T_456 = ~ _T_455; 
  assign _T_457 = _T_451 ? _T_453 : _T_456; 
  assign _T_458 = {_T_449,_T_450}; 
  assign _T_459 = _T_421[0]; 
  assign _T_460 = _T_459 == 1'h0; 
  assign _T_461 = 32'h1 << _T_458; 
  assign _GEN_451 = {{4'd0}, _T_457}; 
  assign _T_462 = _GEN_451 | _T_461; 
  assign _T_463 = ~ _T_457; 
  assign _GEN_452 = {{4'd0}, _T_463}; 
  assign _T_464 = _GEN_452 | _T_461; 
  assign _T_465 = ~ _T_464; 
  assign _T_466 = _T_460 ? _T_462 : _T_465; 
  assign _T_468 = _T_466[27:1]; 
  assign _T_469 = 32'h1 << waddr; 
  assign _T_471 = r_btb_update_bits_pc[13:1]; 
  assign _T_475 = idxPageUpdate + 3'h1; 
  assign _idxPages_waddr = _T_475[2:0]; 
  assign _GEN_453 = {{4'd0}, isValid}; 
  assign _T_478 = _GEN_453 | _T_469; 
  assign _T_479 = ~ _T_469; 
  assign _T_480 = _GEN_453 & _T_479; 
  assign _T_481 = r_btb_update_bits_isValid ? _T_478 : _T_480; 
  assign _T_483 = r_btb_update_bits_br_pc[38:1]; 
  assign _brIdx_waddr = _T_483[0]; 
  assign _T_484 = idxPageUpdate[0]; 
  assign _T_485 = _T_484 == 1'h0; 
  assign _T_486 = _T_485 ? idxPageReplEn : tgtPageReplEn; 
  assign _T_490 = _T_486[0]; 
  assign _T_491 = _T_486[2]; 
  assign _T_492 = _T_486[4]; 
  assign _T_493 = _T_485 ? tgtPageReplEn : idxPageReplEn; 
  assign _T_497 = _T_493[1]; 
  assign _T_498 = _T_493[3]; 
  assign _T_499 = _T_493[5]; 
  assign _GEN_455 = {{2'd0}, pageValid}; 
  assign _T_500 = _GEN_455 | tgtPageReplEn; 
  assign _T_501 = _T_500 | idxPageReplEn; 
  assign _GEN_338 = r_btb_update_valid ? _T_481 : {{4'd0}, isValid}; 
  assign _GEN_373 = r_btb_update_valid ? _T_501 : {{2'd0}, pageValid}; 
  assign _GEN_456 = {{1'd0}, pageHit}; 
  assign _T_502 = _GEN_456 << 1; 
  assign _T_503 = idxHit[0]; 
  assign _T_504 = idxHit[1]; 
  assign _T_505 = idxHit[2]; 
  assign _T_506 = idxHit[3]; 
  assign _T_507 = idxHit[4]; 
  assign _T_508 = idxHit[5]; 
  assign _T_509 = idxHit[6]; 
  assign _T_510 = idxHit[7]; 
  assign _T_511 = idxHit[8]; 
  assign _T_512 = idxHit[9]; 
  assign _T_513 = idxHit[10]; 
  assign _T_514 = idxHit[11]; 
  assign _T_515 = idxHit[12]; 
  assign _T_516 = idxHit[13]; 
  assign _T_517 = idxHit[14]; 
  assign _T_518 = idxHit[15]; 
  assign _T_519 = idxHit[16]; 
  assign _T_520 = idxHit[17]; 
  assign _T_521 = idxHit[18]; 
  assign _T_522 = idxHit[19]; 
  assign _T_523 = idxHit[20]; 
  assign _T_524 = idxHit[21]; 
  assign _T_525 = idxHit[22]; 
  assign _T_526 = idxHit[23]; 
  assign _T_527 = idxHit[24]; 
  assign _T_528 = idxHit[25]; 
  assign _T_529 = idxHit[26]; 
  assign _T_530 = idxHit[27]; 
  assign _T_532 = _T_503 ? idxPages_0 : 3'h0; 
  assign _T_533 = _T_504 ? idxPages_1 : 3'h0; 
  assign _T_534 = _T_505 ? idxPages_2 : 3'h0; 
  assign _T_535 = _T_506 ? idxPages_3 : 3'h0; 
  assign _T_536 = _T_507 ? idxPages_4 : 3'h0; 
  assign _T_537 = _T_508 ? idxPages_5 : 3'h0; 
  assign _T_538 = _T_509 ? idxPages_6 : 3'h0; 
  assign _T_539 = _T_510 ? idxPages_7 : 3'h0; 
  assign _T_540 = _T_511 ? idxPages_8 : 3'h0; 
  assign _T_541 = _T_512 ? idxPages_9 : 3'h0; 
  assign _T_542 = _T_513 ? idxPages_10 : 3'h0; 
  assign _T_543 = _T_514 ? idxPages_11 : 3'h0; 
  assign _T_544 = _T_515 ? idxPages_12 : 3'h0; 
  assign _T_545 = _T_516 ? idxPages_13 : 3'h0; 
  assign _T_546 = _T_517 ? idxPages_14 : 3'h0; 
  assign _T_547 = _T_518 ? idxPages_15 : 3'h0; 
  assign _T_548 = _T_519 ? idxPages_16 : 3'h0; 
  assign _T_549 = _T_520 ? idxPages_17 : 3'h0; 
  assign _T_550 = _T_521 ? idxPages_18 : 3'h0; 
  assign _T_551 = _T_522 ? idxPages_19 : 3'h0; 
  assign _T_552 = _T_523 ? idxPages_20 : 3'h0; 
  assign _T_553 = _T_524 ? idxPages_21 : 3'h0; 
  assign _T_554 = _T_525 ? idxPages_22 : 3'h0; 
  assign _T_555 = _T_526 ? idxPages_23 : 3'h0; 
  assign _T_556 = _T_527 ? idxPages_24 : 3'h0; 
  assign _T_557 = _T_528 ? idxPages_25 : 3'h0; 
  assign _T_558 = _T_529 ? idxPages_26 : 3'h0; 
  assign _T_559 = _T_530 ? idxPages_27 : 3'h0; 
  assign _T_560 = _T_532 | _T_533; 
  assign _T_561 = _T_560 | _T_534; 
  assign _T_562 = _T_561 | _T_535; 
  assign _T_563 = _T_562 | _T_536; 
  assign _T_564 = _T_563 | _T_537; 
  assign _T_565 = _T_564 | _T_538; 
  assign _T_566 = _T_565 | _T_539; 
  assign _T_567 = _T_566 | _T_540; 
  assign _T_568 = _T_567 | _T_541; 
  assign _T_569 = _T_568 | _T_542; 
  assign _T_570 = _T_569 | _T_543; 
  assign _T_571 = _T_570 | _T_544; 
  assign _T_572 = _T_571 | _T_545; 
  assign _T_573 = _T_572 | _T_546; 
  assign _T_574 = _T_573 | _T_547; 
  assign _T_575 = _T_574 | _T_548; 
  assign _T_576 = _T_575 | _T_549; 
  assign _T_577 = _T_576 | _T_550; 
  assign _T_578 = _T_577 | _T_551; 
  assign _T_579 = _T_578 | _T_552; 
  assign _T_580 = _T_579 | _T_553; 
  assign _T_581 = _T_580 | _T_554; 
  assign _T_582 = _T_581 | _T_555; 
  assign _T_583 = _T_582 | _T_556; 
  assign _T_584 = _T_583 | _T_557; 
  assign _T_585 = _T_584 | _T_558; 
  assign _T_586 = _T_585 | _T_559; 
  assign _T_589 = _T_502 >> _T_586; 
  assign _T_620 = _T_503 ? tgtPages_0 : 3'h0; 
  assign _T_621 = _T_504 ? tgtPages_1 : 3'h0; 
  assign _T_622 = _T_505 ? tgtPages_2 : 3'h0; 
  assign _T_623 = _T_506 ? tgtPages_3 : 3'h0; 
  assign _T_624 = _T_507 ? tgtPages_4 : 3'h0; 
  assign _T_625 = _T_508 ? tgtPages_5 : 3'h0; 
  assign _T_626 = _T_509 ? tgtPages_6 : 3'h0; 
  assign _T_627 = _T_510 ? tgtPages_7 : 3'h0; 
  assign _T_628 = _T_511 ? tgtPages_8 : 3'h0; 
  assign _T_629 = _T_512 ? tgtPages_9 : 3'h0; 
  assign _T_630 = _T_513 ? tgtPages_10 : 3'h0; 
  assign _T_631 = _T_514 ? tgtPages_11 : 3'h0; 
  assign _T_632 = _T_515 ? tgtPages_12 : 3'h0; 
  assign _T_633 = _T_516 ? tgtPages_13 : 3'h0; 
  assign _T_634 = _T_517 ? tgtPages_14 : 3'h0; 
  assign _T_635 = _T_518 ? tgtPages_15 : 3'h0; 
  assign _T_636 = _T_519 ? tgtPages_16 : 3'h0; 
  assign _T_637 = _T_520 ? tgtPages_17 : 3'h0; 
  assign _T_638 = _T_521 ? tgtPages_18 : 3'h0; 
  assign _T_639 = _T_522 ? tgtPages_19 : 3'h0; 
  assign _T_640 = _T_523 ? tgtPages_20 : 3'h0; 
  assign _T_641 = _T_524 ? tgtPages_21 : 3'h0; 
  assign _T_642 = _T_525 ? tgtPages_22 : 3'h0; 
  assign _T_643 = _T_526 ? tgtPages_23 : 3'h0; 
  assign _T_644 = _T_527 ? tgtPages_24 : 3'h0; 
  assign _T_645 = _T_528 ? tgtPages_25 : 3'h0; 
  assign _T_646 = _T_529 ? tgtPages_26 : 3'h0; 
  assign _T_647 = _T_530 ? tgtPages_27 : 3'h0; 
  assign _T_648 = _T_620 | _T_621; 
  assign _T_649 = _T_648 | _T_622; 
  assign _T_650 = _T_649 | _T_623; 
  assign _T_651 = _T_650 | _T_624; 
  assign _T_652 = _T_651 | _T_625; 
  assign _T_653 = _T_652 | _T_626; 
  assign _T_654 = _T_653 | _T_627; 
  assign _T_655 = _T_654 | _T_628; 
  assign _T_656 = _T_655 | _T_629; 
  assign _T_657 = _T_656 | _T_630; 
  assign _T_658 = _T_657 | _T_631; 
  assign _T_659 = _T_658 | _T_632; 
  assign _T_660 = _T_659 | _T_633; 
  assign _T_661 = _T_660 | _T_634; 
  assign _T_662 = _T_661 | _T_635; 
  assign _T_663 = _T_662 | _T_636; 
  assign _T_664 = _T_663 | _T_637; 
  assign _T_665 = _T_664 | _T_638; 
  assign _T_666 = _T_665 | _T_639; 
  assign _T_667 = _T_666 | _T_640; 
  assign _T_668 = _T_667 | _T_641; 
  assign _T_669 = _T_668 | _T_642; 
  assign _T_670 = _T_669 | _T_643; 
  assign _T_671 = _T_670 | _T_644; 
  assign _T_672 = _T_671 | _T_645; 
  assign _T_673 = _T_672 | _T_646; 
  assign _T_674 = _T_673 | _T_647; 
  assign _T_707 = _T_503 ? tgts_0 : 13'h0; 
  assign _T_708 = _T_504 ? tgts_1 : 13'h0; 
  assign _T_709 = _T_505 ? tgts_2 : 13'h0; 
  assign _T_710 = _T_506 ? tgts_3 : 13'h0; 
  assign _T_711 = _T_507 ? tgts_4 : 13'h0; 
  assign _T_712 = _T_508 ? tgts_5 : 13'h0; 
  assign _T_713 = _T_509 ? tgts_6 : 13'h0; 
  assign _T_714 = _T_510 ? tgts_7 : 13'h0; 
  assign _T_715 = _T_511 ? tgts_8 : 13'h0; 
  assign _T_716 = _T_512 ? tgts_9 : 13'h0; 
  assign _T_717 = _T_513 ? tgts_10 : 13'h0; 
  assign _T_718 = _T_514 ? tgts_11 : 13'h0; 
  assign _T_719 = _T_515 ? tgts_12 : 13'h0; 
  assign _T_720 = _T_516 ? tgts_13 : 13'h0; 
  assign _T_721 = _T_517 ? tgts_14 : 13'h0; 
  assign _T_722 = _T_518 ? tgts_15 : 13'h0; 
  assign _T_723 = _T_519 ? tgts_16 : 13'h0; 
  assign _T_724 = _T_520 ? tgts_17 : 13'h0; 
  assign _T_725 = _T_521 ? tgts_18 : 13'h0; 
  assign _T_726 = _T_522 ? tgts_19 : 13'h0; 
  assign _T_727 = _T_523 ? tgts_20 : 13'h0; 
  assign _T_728 = _T_524 ? tgts_21 : 13'h0; 
  assign _T_729 = _T_525 ? tgts_22 : 13'h0; 
  assign _T_730 = _T_526 ? tgts_23 : 13'h0; 
  assign _T_731 = _T_527 ? tgts_24 : 13'h0; 
  assign _T_732 = _T_528 ? tgts_25 : 13'h0; 
  assign _T_733 = _T_529 ? tgts_26 : 13'h0; 
  assign _T_734 = _T_530 ? tgts_27 : 13'h0; 
  assign _T_735 = _T_707 | _T_708; 
  assign _T_736 = _T_735 | _T_709; 
  assign _T_737 = _T_736 | _T_710; 
  assign _T_738 = _T_737 | _T_711; 
  assign _T_739 = _T_738 | _T_712; 
  assign _T_740 = _T_739 | _T_713; 
  assign _T_741 = _T_740 | _T_714; 
  assign _T_742 = _T_741 | _T_715; 
  assign _T_743 = _T_742 | _T_716; 
  assign _T_744 = _T_743 | _T_717; 
  assign _T_745 = _T_744 | _T_718; 
  assign _T_746 = _T_745 | _T_719; 
  assign _T_747 = _T_746 | _T_720; 
  assign _T_748 = _T_747 | _T_721; 
  assign _T_749 = _T_748 | _T_722; 
  assign _T_750 = _T_749 | _T_723; 
  assign _T_751 = _T_750 | _T_724; 
  assign _T_752 = _T_751 | _T_725; 
  assign _T_753 = _T_752 | _T_726; 
  assign _T_754 = _T_753 | _T_727; 
  assign _T_755 = _T_754 | _T_728; 
  assign _T_756 = _T_755 | _T_729; 
  assign _T_757 = _T_756 | _T_730; 
  assign _T_758 = _T_757 | _T_731; 
  assign _T_759 = _T_758 | _T_732; 
  assign _T_760 = _T_759 | _T_733; 
  assign _T_761 = _T_760 | _T_734; 
  assign _GEN_457 = {{1'd0}, _T_761}; 
  assign _T_764 = _GEN_457 << 1; 
  assign _GEN_375 = 3'h1 == _T_674 ? pages_1 : pages_0; 
  assign _GEN_376 = 3'h2 == _T_674 ? pages_2 : _GEN_375; 
  assign _GEN_377 = 3'h3 == _T_674 ? pages_3 : _GEN_376; 
  assign _GEN_378 = 3'h4 == _T_674 ? pages_4 : _GEN_377; 
  assign _GEN_379 = 3'h5 == _T_674 ? pages_5 : _GEN_378; 
  assign _T_765 = {_GEN_379,_T_764}; 
  assign _T_766 = idxHit[27:16]; 
  assign _T_767 = idxHit[15:0]; 
  assign _T_768 = _T_766 != 12'h0; 
  assign _GEN_458 = {{4'd0}, _T_766}; 
  assign _T_769 = _GEN_458 | _T_767; 
  assign _T_770 = _T_769[15:8]; 
  assign _T_771 = _T_769[7:0]; 
  assign _T_772 = _T_770 != 8'h0; 
  assign _T_773 = _T_770 | _T_771; 
  assign _T_774 = _T_773[7:4]; 
  assign _T_775 = _T_773[3:0]; 
  assign _T_776 = _T_774 != 4'h0; 
  assign _T_777 = _T_774 | _T_775; 
  assign _T_778 = _T_777[3:2]; 
  assign _T_779 = _T_777[1:0]; 
  assign _T_780 = _T_778 != 2'h0; 
  assign _T_781 = _T_778 | _T_779; 
  assign _T_782 = _T_781[1]; 
  assign _T_783 = {_T_780,_T_782}; 
  assign _T_784 = {_T_776,_T_783}; 
  assign _T_785 = {_T_772,_T_784}; 
  assign _T_816 = _T_503 ? brIdx_0 : 1'h0; 
  assign _T_817 = _T_504 ? brIdx_1 : 1'h0; 
  assign _T_818 = _T_505 ? brIdx_2 : 1'h0; 
  assign _T_819 = _T_506 ? brIdx_3 : 1'h0; 
  assign _T_820 = _T_507 ? brIdx_4 : 1'h0; 
  assign _T_821 = _T_508 ? brIdx_5 : 1'h0; 
  assign _T_822 = _T_509 ? brIdx_6 : 1'h0; 
  assign _T_823 = _T_510 ? brIdx_7 : 1'h0; 
  assign _T_824 = _T_511 ? brIdx_8 : 1'h0; 
  assign _T_825 = _T_512 ? brIdx_9 : 1'h0; 
  assign _T_826 = _T_513 ? brIdx_10 : 1'h0; 
  assign _T_827 = _T_514 ? brIdx_11 : 1'h0; 
  assign _T_828 = _T_515 ? brIdx_12 : 1'h0; 
  assign _T_829 = _T_516 ? brIdx_13 : 1'h0; 
  assign _T_830 = _T_517 ? brIdx_14 : 1'h0; 
  assign _T_831 = _T_518 ? brIdx_15 : 1'h0; 
  assign _T_832 = _T_519 ? brIdx_16 : 1'h0; 
  assign _T_833 = _T_520 ? brIdx_17 : 1'h0; 
  assign _T_834 = _T_521 ? brIdx_18 : 1'h0; 
  assign _T_835 = _T_522 ? brIdx_19 : 1'h0; 
  assign _T_836 = _T_523 ? brIdx_20 : 1'h0; 
  assign _T_837 = _T_524 ? brIdx_21 : 1'h0; 
  assign _T_838 = _T_525 ? brIdx_22 : 1'h0; 
  assign _T_839 = _T_526 ? brIdx_23 : 1'h0; 
  assign _T_840 = _T_527 ? brIdx_24 : 1'h0; 
  assign _T_841 = _T_528 ? brIdx_25 : 1'h0; 
  assign _T_842 = _T_529 ? brIdx_26 : 1'h0; 
  assign _T_843 = _T_530 ? brIdx_27 : 1'h0; 
  assign _T_844 = _T_816 | _T_817; 
  assign _T_845 = _T_844 | _T_818; 
  assign _T_846 = _T_845 | _T_819; 
  assign _T_847 = _T_846 | _T_820; 
  assign _T_848 = _T_847 | _T_821; 
  assign _T_849 = _T_848 | _T_822; 
  assign _T_850 = _T_849 | _T_823; 
  assign _T_851 = _T_850 | _T_824; 
  assign _T_852 = _T_851 | _T_825; 
  assign _T_853 = _T_852 | _T_826; 
  assign _T_854 = _T_853 | _T_827; 
  assign _T_855 = _T_854 | _T_828; 
  assign _T_856 = _T_855 | _T_829; 
  assign _T_857 = _T_856 | _T_830; 
  assign _T_858 = _T_857 | _T_831; 
  assign _T_859 = _T_858 | _T_832; 
  assign _T_860 = _T_859 | _T_833; 
  assign _T_861 = _T_860 | _T_834; 
  assign _T_862 = _T_861 | _T_835; 
  assign _T_863 = _T_862 | _T_836; 
  assign _T_864 = _T_863 | _T_837; 
  assign _T_865 = _T_864 | _T_838; 
  assign _T_866 = _T_865 | _T_839; 
  assign _T_867 = _T_866 | _T_840; 
  assign _T_868 = _T_867 | _T_841; 
  assign _T_869 = _T_868 | _T_842; 
  assign _T_967 = idxHit[13:0]; 
  assign _T_968 = _T_967[6:0]; 
  assign _T_969 = _T_968[2:0]; 
  assign _T_970 = _T_969[0]; 
  assign _T_972 = _T_969[2:1]; 
  assign _T_973 = _T_972[0]; 
  assign _T_975 = _T_972[1]; 
  assign _T_977 = _T_973 | _T_975; 
  assign _T_979 = _T_973 & _T_975; 
  assign _T_981 = _T_970 | _T_977; 
  assign _T_983 = _T_970 & _T_977; 
  assign _T_984 = _T_979 | _T_983; 
  assign _T_985 = _T_968[6:3]; 
  assign _T_986 = _T_985[1:0]; 
  assign _T_987 = _T_986[0]; 
  assign _T_989 = _T_986[1]; 
  assign _T_991 = _T_987 | _T_989; 
  assign _T_993 = _T_987 & _T_989; 
  assign _T_995 = _T_985[3:2]; 
  assign _T_996 = _T_995[0]; 
  assign _T_998 = _T_995[1]; 
  assign _T_1000 = _T_996 | _T_998; 
  assign _T_1002 = _T_996 & _T_998; 
  assign _T_1004 = _T_991 | _T_1000; 
  assign _T_1005 = _T_993 | _T_1002; 
  assign _T_1006 = _T_991 & _T_1000; 
  assign _T_1007 = _T_1005 | _T_1006; 
  assign _T_1008 = _T_981 | _T_1004; 
  assign _T_1009 = _T_984 | _T_1007; 
  assign _T_1010 = _T_981 & _T_1004; 
  assign _T_1011 = _T_1009 | _T_1010; 
  assign _T_1012 = _T_967[13:7]; 
  assign _T_1013 = _T_1012[2:0]; 
  assign _T_1014 = _T_1013[0]; 
  assign _T_1016 = _T_1013[2:1]; 
  assign _T_1017 = _T_1016[0]; 
  assign _T_1019 = _T_1016[1]; 
  assign _T_1021 = _T_1017 | _T_1019; 
  assign _T_1023 = _T_1017 & _T_1019; 
  assign _T_1025 = _T_1014 | _T_1021; 
  assign _T_1027 = _T_1014 & _T_1021; 
  assign _T_1028 = _T_1023 | _T_1027; 
  assign _T_1029 = _T_1012[6:3]; 
  assign _T_1030 = _T_1029[1:0]; 
  assign _T_1031 = _T_1030[0]; 
  assign _T_1033 = _T_1030[1]; 
  assign _T_1035 = _T_1031 | _T_1033; 
  assign _T_1037 = _T_1031 & _T_1033; 
  assign _T_1039 = _T_1029[3:2]; 
  assign _T_1040 = _T_1039[0]; 
  assign _T_1042 = _T_1039[1]; 
  assign _T_1044 = _T_1040 | _T_1042; 
  assign _T_1046 = _T_1040 & _T_1042; 
  assign _T_1048 = _T_1035 | _T_1044; 
  assign _T_1049 = _T_1037 | _T_1046; 
  assign _T_1050 = _T_1035 & _T_1044; 
  assign _T_1051 = _T_1049 | _T_1050; 
  assign _T_1052 = _T_1025 | _T_1048; 
  assign _T_1053 = _T_1028 | _T_1051; 
  assign _T_1054 = _T_1025 & _T_1048; 
  assign _T_1055 = _T_1053 | _T_1054; 
  assign _T_1056 = _T_1008 | _T_1052; 
  assign _T_1057 = _T_1011 | _T_1055; 
  assign _T_1058 = _T_1008 & _T_1052; 
  assign _T_1059 = _T_1057 | _T_1058; 
  assign _T_1060 = idxHit[27:14]; 
  assign _T_1061 = _T_1060[6:0]; 
  assign _T_1062 = _T_1061[2:0]; 
  assign _T_1063 = _T_1062[0]; 
  assign _T_1065 = _T_1062[2:1]; 
  assign _T_1066 = _T_1065[0]; 
  assign _T_1068 = _T_1065[1]; 
  assign _T_1070 = _T_1066 | _T_1068; 
  assign _T_1072 = _T_1066 & _T_1068; 
  assign _T_1074 = _T_1063 | _T_1070; 
  assign _T_1076 = _T_1063 & _T_1070; 
  assign _T_1077 = _T_1072 | _T_1076; 
  assign _T_1078 = _T_1061[6:3]; 
  assign _T_1079 = _T_1078[1:0]; 
  assign _T_1080 = _T_1079[0]; 
  assign _T_1082 = _T_1079[1]; 
  assign _T_1084 = _T_1080 | _T_1082; 
  assign _T_1086 = _T_1080 & _T_1082; 
  assign _T_1088 = _T_1078[3:2]; 
  assign _T_1089 = _T_1088[0]; 
  assign _T_1091 = _T_1088[1]; 
  assign _T_1093 = _T_1089 | _T_1091; 
  assign _T_1095 = _T_1089 & _T_1091; 
  assign _T_1097 = _T_1084 | _T_1093; 
  assign _T_1098 = _T_1086 | _T_1095; 
  assign _T_1099 = _T_1084 & _T_1093; 
  assign _T_1100 = _T_1098 | _T_1099; 
  assign _T_1101 = _T_1074 | _T_1097; 
  assign _T_1102 = _T_1077 | _T_1100; 
  assign _T_1103 = _T_1074 & _T_1097; 
  assign _T_1104 = _T_1102 | _T_1103; 
  assign _T_1105 = _T_1060[13:7]; 
  assign _T_1106 = _T_1105[2:0]; 
  assign _T_1107 = _T_1106[0]; 
  assign _T_1109 = _T_1106[2:1]; 
  assign _T_1110 = _T_1109[0]; 
  assign _T_1112 = _T_1109[1]; 
  assign _T_1114 = _T_1110 | _T_1112; 
  assign _T_1116 = _T_1110 & _T_1112; 
  assign _T_1118 = _T_1107 | _T_1114; 
  assign _T_1120 = _T_1107 & _T_1114; 
  assign _T_1121 = _T_1116 | _T_1120; 
  assign _T_1122 = _T_1105[6:3]; 
  assign _T_1123 = _T_1122[1:0]; 
  assign _T_1124 = _T_1123[0]; 
  assign _T_1126 = _T_1123[1]; 
  assign _T_1128 = _T_1124 | _T_1126; 
  assign _T_1130 = _T_1124 & _T_1126; 
  assign _T_1132 = _T_1122[3:2]; 
  assign _T_1133 = _T_1132[0]; 
  assign _T_1135 = _T_1132[1]; 
  assign _T_1137 = _T_1133 | _T_1135; 
  assign _T_1139 = _T_1133 & _T_1135; 
  assign _T_1141 = _T_1128 | _T_1137; 
  assign _T_1142 = _T_1130 | _T_1139; 
  assign _T_1143 = _T_1128 & _T_1137; 
  assign _T_1144 = _T_1142 | _T_1143; 
  assign _T_1145 = _T_1118 | _T_1141; 
  assign _T_1146 = _T_1121 | _T_1144; 
  assign _T_1147 = _T_1118 & _T_1141; 
  assign _T_1148 = _T_1146 | _T_1147; 
  assign _T_1149 = _T_1101 | _T_1145; 
  assign _T_1150 = _T_1104 | _T_1148; 
  assign _T_1151 = _T_1101 & _T_1145; 
  assign _T_1152 = _T_1150 | _T_1151; 
  assign _T_1154 = _T_1059 | _T_1152; 
  assign _T_1155 = _T_1056 & _T_1149; 
  assign _T_1156 = _T_1154 | _T_1155; 
  assign _T_1157 = ~ idxHit; 
  assign _T_1158 = isValid & _T_1157; 
  assign _GEN_380 = _T_1156 ? {{4'd0}, _T_1158} : _GEN_338; 
  assign _GEN_381 = io_flush ? 32'h0 : _GEN_380; 
  assign _T_1164 = cfiType_0 == 2'h0; 
  assign _T_1165 = cfiType_1 == 2'h0; 
  assign _T_1166 = cfiType_2 == 2'h0; 
  assign _T_1167 = cfiType_3 == 2'h0; 
  assign _T_1168 = cfiType_4 == 2'h0; 
  assign _T_1169 = cfiType_5 == 2'h0; 
  assign _T_1170 = cfiType_6 == 2'h0; 
  assign _T_1171 = cfiType_7 == 2'h0; 
  assign _T_1172 = cfiType_8 == 2'h0; 
  assign _T_1173 = cfiType_9 == 2'h0; 
  assign _T_1174 = cfiType_10 == 2'h0; 
  assign _T_1175 = cfiType_11 == 2'h0; 
  assign _T_1176 = cfiType_12 == 2'h0; 
  assign _T_1177 = cfiType_13 == 2'h0; 
  assign _T_1178 = cfiType_14 == 2'h0; 
  assign _T_1179 = cfiType_15 == 2'h0; 
  assign _T_1180 = cfiType_16 == 2'h0; 
  assign _T_1181 = cfiType_17 == 2'h0; 
  assign _T_1182 = cfiType_18 == 2'h0; 
  assign _T_1183 = cfiType_19 == 2'h0; 
  assign _T_1184 = cfiType_20 == 2'h0; 
  assign _T_1185 = cfiType_21 == 2'h0; 
  assign _T_1186 = cfiType_22 == 2'h0; 
  assign _T_1187 = cfiType_23 == 2'h0; 
  assign _T_1188 = cfiType_24 == 2'h0; 
  assign _T_1189 = cfiType_25 == 2'h0; 
  assign _T_1190 = cfiType_26 == 2'h0; 
  assign _T_1191 = cfiType_27 == 2'h0; 
  assign _T_1192 = {_T_1166,_T_1165}; 
  assign _T_1193 = {_T_1192,_T_1164}; 
  assign _T_1194 = {_T_1168,_T_1167}; 
  assign _T_1195 = {_T_1170,_T_1169}; 
  assign _T_1196 = {_T_1195,_T_1194}; 
  assign _T_1197 = {_T_1196,_T_1193}; 
  assign _T_1198 = {_T_1173,_T_1172}; 
  assign _T_1199 = {_T_1198,_T_1171}; 
  assign _T_1200 = {_T_1175,_T_1174}; 
  assign _T_1201 = {_T_1177,_T_1176}; 
  assign _T_1202 = {_T_1201,_T_1200}; 
  assign _T_1203 = {_T_1202,_T_1199}; 
  assign _T_1204 = {_T_1203,_T_1197}; 
  assign _T_1205 = {_T_1180,_T_1179}; 
  assign _T_1206 = {_T_1205,_T_1178}; 
  assign _T_1207 = {_T_1182,_T_1181}; 
  assign _T_1208 = {_T_1184,_T_1183}; 
  assign _T_1209 = {_T_1208,_T_1207}; 
  assign _T_1210 = {_T_1209,_T_1206}; 
  assign _T_1211 = {_T_1187,_T_1186}; 
  assign _T_1212 = {_T_1211,_T_1185}; 
  assign _T_1213 = {_T_1189,_T_1188}; 
  assign _T_1214 = {_T_1191,_T_1190}; 
  assign _T_1215 = {_T_1214,_T_1213}; 
  assign _T_1216 = {_T_1215,_T_1212}; 
  assign _T_1217 = {_T_1216,_T_1210}; 
  assign _T_1218 = {_T_1217,_T_1204}; 
  assign _T_1219 = idxHit & _T_1218; 
  assign _T_1220 = _T_1219 != 28'h0; 
  assign _T_1223 = io_req_bits_addr[38:2]; 
  assign _T_1224 = _T_1223[8:0]; 
  assign _T_1225 = _T_1223[36:9]; 
  assign _T_1226 = _T_1225[1:0]; 
  assign _GEN_459 = {{7'd0}, _T_1226}; 
  assign _T_1227 = _T_1224 ^ _GEN_459; 
  assign _T_1228 = 8'hdd * _T_1163; 
  assign _T_1229 = _T_1228[7:5]; 
  assign _GEN_460 = {{6'd0}, _T_1229}; 
  assign _T_1230 = _GEN_460 << 6; 
  assign _T_1234 = _T_1163[7:1]; 
  assign _T_1235 = {io_bht_advance_bits_bht_value,_T_1234}; 
  assign _T_1236 = io_bht_update_bits_pc[38:2]; 
  assign _T_1237 = _T_1236[8:0]; 
  assign _T_1238 = _T_1236[36:9]; 
  assign _T_1239 = _T_1238[1:0]; 
  assign _GEN_461 = {{7'd0}, _T_1239}; 
  assign _T_1240 = _T_1237 ^ _GEN_461; 
  assign _T_1241 = 8'hdd * io_bht_update_bits_prediction_history; 
  assign _T_1242 = _T_1241[7:5]; 
  assign _GEN_462 = {{6'd0}, _T_1242}; 
  assign _T_1243 = _GEN_462 << 6; 
  assign _T_1246 = io_bht_update_bits_prediction_history[7:1]; 
  assign _T_1247 = {io_bht_update_bits_taken,_T_1246}; 
  assign _T_1222_value = _T_1161__T_1232_data; 
  assign _T_1249 = _T_1222_value == 1'h0; 
  assign _T_1250 = _T_1249 & _T_1220; 
  assign _T_1267 = cfiType_0 == 2'h3; 
  assign _T_1268 = cfiType_1 == 2'h3; 
  assign _T_1269 = cfiType_2 == 2'h3; 
  assign _T_1270 = cfiType_3 == 2'h3; 
  assign _T_1271 = cfiType_4 == 2'h3; 
  assign _T_1272 = cfiType_5 == 2'h3; 
  assign _T_1273 = cfiType_6 == 2'h3; 
  assign _T_1274 = cfiType_7 == 2'h3; 
  assign _T_1275 = cfiType_8 == 2'h3; 
  assign _T_1276 = cfiType_9 == 2'h3; 
  assign _T_1277 = cfiType_10 == 2'h3; 
  assign _T_1278 = cfiType_11 == 2'h3; 
  assign _T_1279 = cfiType_12 == 2'h3; 
  assign _T_1280 = cfiType_13 == 2'h3; 
  assign _T_1281 = cfiType_14 == 2'h3; 
  assign _T_1282 = cfiType_15 == 2'h3; 
  assign _T_1283 = cfiType_16 == 2'h3; 
  assign _T_1284 = cfiType_17 == 2'h3; 
  assign _T_1285 = cfiType_18 == 2'h3; 
  assign _T_1286 = cfiType_19 == 2'h3; 
  assign _T_1287 = cfiType_20 == 2'h3; 
  assign _T_1288 = cfiType_21 == 2'h3; 
  assign _T_1289 = cfiType_22 == 2'h3; 
  assign _T_1290 = cfiType_23 == 2'h3; 
  assign _T_1291 = cfiType_24 == 2'h3; 
  assign _T_1292 = cfiType_25 == 2'h3; 
  assign _T_1293 = cfiType_26 == 2'h3; 
  assign _T_1294 = cfiType_27 == 2'h3; 
  assign _T_1295 = {_T_1269,_T_1268}; 
  assign _T_1296 = {_T_1295,_T_1267}; 
  assign _T_1297 = {_T_1271,_T_1270}; 
  assign _T_1298 = {_T_1273,_T_1272}; 
  assign _T_1299 = {_T_1298,_T_1297}; 
  assign _T_1300 = {_T_1299,_T_1296}; 
  assign _T_1301 = {_T_1276,_T_1275}; 
  assign _T_1302 = {_T_1301,_T_1274}; 
  assign _T_1303 = {_T_1278,_T_1277}; 
  assign _T_1304 = {_T_1280,_T_1279}; 
  assign _T_1305 = {_T_1304,_T_1303}; 
  assign _T_1306 = {_T_1305,_T_1302}; 
  assign _T_1307 = {_T_1306,_T_1300}; 
  assign _T_1308 = {_T_1283,_T_1282}; 
  assign _T_1309 = {_T_1308,_T_1281}; 
  assign _T_1310 = {_T_1285,_T_1284}; 
  assign _T_1311 = {_T_1287,_T_1286}; 
  assign _T_1312 = {_T_1311,_T_1310}; 
  assign _T_1313 = {_T_1312,_T_1309}; 
  assign _T_1314 = {_T_1290,_T_1289}; 
  assign _T_1315 = {_T_1314,_T_1288}; 
  assign _T_1316 = {_T_1292,_T_1291}; 
  assign _T_1317 = {_T_1294,_T_1293}; 
  assign _T_1318 = {_T_1317,_T_1316}; 
  assign _T_1319 = {_T_1318,_T_1315}; 
  assign _T_1320 = {_T_1319,_T_1313}; 
  assign _T_1321 = {_T_1320,_T_1307}; 
  assign _T_1322 = idxHit & _T_1321; 
  assign _T_1323 = _T_1322 != 28'h0; 
  assign _T_1324 = _T_1252 == 3'h0; 
  assign _T_1325 = _T_1324 == 1'h0; 
  assign _GEN_399 = 3'h1 == _T_1254 ? _T_1258_1 : _T_1258_0; 
  assign _GEN_400 = 3'h2 == _T_1254 ? _T_1258_2 : _GEN_399; 
  assign _GEN_401 = 3'h3 == _T_1254 ? _T_1258_3 : _GEN_400; 
  assign _GEN_402 = 3'h4 == _T_1254 ? _T_1258_4 : _GEN_401; 
  assign _GEN_403 = 3'h5 == _T_1254 ? _T_1258_5 : _GEN_402; 
  assign _T_1329 = _T_1325 & _T_1323; 
  assign _T_1331 = io_ras_update_bits_cfiType == 2'h2; 
  assign _T_1332 = _T_1252 < 3'h6; 
  assign _T_1334 = _T_1252 + 3'h1; 
  assign _T_1335 = _T_1254 < 3'h5; 
  assign _T_1338 = _T_1254 + 3'h1; 
  assign _T_1339 = _T_1335 ? _T_1338 : 3'h0; 
  assign _T_1341 = io_ras_update_bits_cfiType == 2'h3; 
  assign _T_1344 = _T_1252 - 3'h1; 
  assign _T_1345 = $unsigned(_T_1344); 
  assign _T_1346 = _T_1345[2:0]; 
  assign _T_1347 = _T_1254 > 3'h0; 
  assign _T_1349 = _T_1254 - 3'h1; 
  assign _T_1350 = $unsigned(_T_1349); 
  assign _T_1351 = _T_1350[2:0]; 
  assign io_resp_valid = _T_589[0]; 
  assign io_resp_bits_taken = _T_1250 ? 1'h0 : 1'h1; 
  assign io_resp_bits_bridx = _T_869 | _T_843; 
  assign io_resp_bits_target = _T_1329 ? _GEN_403 : _T_765; 
  assign io_resp_bits_entry = {_T_768,_T_785}; 
  assign io_resp_bits_bht_history = _T_1163; 
  assign io_resp_bits_bht_value = _T_1161__T_1232_data; 
  assign io_ras_head_valid = _T_1324 == 1'h0; 
  assign io_ras_head_bits = 3'h5 == _T_1254 ? _T_1258_5 : _GEN_402; 
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
  _RAND_0 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 512; initvar = initvar+1)
    _T_1161[initvar] = _RAND_0[0:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  idxs_0 = _RAND_1[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  idxs_1 = _RAND_2[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  idxs_2 = _RAND_3[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  idxs_3 = _RAND_4[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  idxs_4 = _RAND_5[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  idxs_5 = _RAND_6[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  idxs_6 = _RAND_7[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  idxs_7 = _RAND_8[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  idxs_8 = _RAND_9[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  idxs_9 = _RAND_10[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  idxs_10 = _RAND_11[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  idxs_11 = _RAND_12[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  idxs_12 = _RAND_13[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  idxs_13 = _RAND_14[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  idxs_14 = _RAND_15[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{`RANDOM}};
  idxs_15 = _RAND_16[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{`RANDOM}};
  idxs_16 = _RAND_17[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{`RANDOM}};
  idxs_17 = _RAND_18[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{`RANDOM}};
  idxs_18 = _RAND_19[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{`RANDOM}};
  idxs_19 = _RAND_20[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_21 = {1{`RANDOM}};
  idxs_20 = _RAND_21[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_22 = {1{`RANDOM}};
  idxs_21 = _RAND_22[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_23 = {1{`RANDOM}};
  idxs_22 = _RAND_23[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_24 = {1{`RANDOM}};
  idxs_23 = _RAND_24[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_25 = {1{`RANDOM}};
  idxs_24 = _RAND_25[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_26 = {1{`RANDOM}};
  idxs_25 = _RAND_26[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_27 = {1{`RANDOM}};
  idxs_26 = _RAND_27[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_28 = {1{`RANDOM}};
  idxs_27 = _RAND_28[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_29 = {1{`RANDOM}};
  idxPages_0 = _RAND_29[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_30 = {1{`RANDOM}};
  idxPages_1 = _RAND_30[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_31 = {1{`RANDOM}};
  idxPages_2 = _RAND_31[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_32 = {1{`RANDOM}};
  idxPages_3 = _RAND_32[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_33 = {1{`RANDOM}};
  idxPages_4 = _RAND_33[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_34 = {1{`RANDOM}};
  idxPages_5 = _RAND_34[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_35 = {1{`RANDOM}};
  idxPages_6 = _RAND_35[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_36 = {1{`RANDOM}};
  idxPages_7 = _RAND_36[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_37 = {1{`RANDOM}};
  idxPages_8 = _RAND_37[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_38 = {1{`RANDOM}};
  idxPages_9 = _RAND_38[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_39 = {1{`RANDOM}};
  idxPages_10 = _RAND_39[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_40 = {1{`RANDOM}};
  idxPages_11 = _RAND_40[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_41 = {1{`RANDOM}};
  idxPages_12 = _RAND_41[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_42 = {1{`RANDOM}};
  idxPages_13 = _RAND_42[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_43 = {1{`RANDOM}};
  idxPages_14 = _RAND_43[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_44 = {1{`RANDOM}};
  idxPages_15 = _RAND_44[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_45 = {1{`RANDOM}};
  idxPages_16 = _RAND_45[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_46 = {1{`RANDOM}};
  idxPages_17 = _RAND_46[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_47 = {1{`RANDOM}};
  idxPages_18 = _RAND_47[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_48 = {1{`RANDOM}};
  idxPages_19 = _RAND_48[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_49 = {1{`RANDOM}};
  idxPages_20 = _RAND_49[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_50 = {1{`RANDOM}};
  idxPages_21 = _RAND_50[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_51 = {1{`RANDOM}};
  idxPages_22 = _RAND_51[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_52 = {1{`RANDOM}};
  idxPages_23 = _RAND_52[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_53 = {1{`RANDOM}};
  idxPages_24 = _RAND_53[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_54 = {1{`RANDOM}};
  idxPages_25 = _RAND_54[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_55 = {1{`RANDOM}};
  idxPages_26 = _RAND_55[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_56 = {1{`RANDOM}};
  idxPages_27 = _RAND_56[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_57 = {1{`RANDOM}};
  tgts_0 = _RAND_57[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_58 = {1{`RANDOM}};
  tgts_1 = _RAND_58[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_59 = {1{`RANDOM}};
  tgts_2 = _RAND_59[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_60 = {1{`RANDOM}};
  tgts_3 = _RAND_60[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_61 = {1{`RANDOM}};
  tgts_4 = _RAND_61[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_62 = {1{`RANDOM}};
  tgts_5 = _RAND_62[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_63 = {1{`RANDOM}};
  tgts_6 = _RAND_63[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_64 = {1{`RANDOM}};
  tgts_7 = _RAND_64[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_65 = {1{`RANDOM}};
  tgts_8 = _RAND_65[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_66 = {1{`RANDOM}};
  tgts_9 = _RAND_66[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_67 = {1{`RANDOM}};
  tgts_10 = _RAND_67[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_68 = {1{`RANDOM}};
  tgts_11 = _RAND_68[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_69 = {1{`RANDOM}};
  tgts_12 = _RAND_69[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_70 = {1{`RANDOM}};
  tgts_13 = _RAND_70[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_71 = {1{`RANDOM}};
  tgts_14 = _RAND_71[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_72 = {1{`RANDOM}};
  tgts_15 = _RAND_72[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_73 = {1{`RANDOM}};
  tgts_16 = _RAND_73[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_74 = {1{`RANDOM}};
  tgts_17 = _RAND_74[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_75 = {1{`RANDOM}};
  tgts_18 = _RAND_75[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_76 = {1{`RANDOM}};
  tgts_19 = _RAND_76[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_77 = {1{`RANDOM}};
  tgts_20 = _RAND_77[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_78 = {1{`RANDOM}};
  tgts_21 = _RAND_78[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_79 = {1{`RANDOM}};
  tgts_22 = _RAND_79[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_80 = {1{`RANDOM}};
  tgts_23 = _RAND_80[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_81 = {1{`RANDOM}};
  tgts_24 = _RAND_81[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_82 = {1{`RANDOM}};
  tgts_25 = _RAND_82[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_83 = {1{`RANDOM}};
  tgts_26 = _RAND_83[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_84 = {1{`RANDOM}};
  tgts_27 = _RAND_84[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_85 = {1{`RANDOM}};
  tgtPages_0 = _RAND_85[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_86 = {1{`RANDOM}};
  tgtPages_1 = _RAND_86[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_87 = {1{`RANDOM}};
  tgtPages_2 = _RAND_87[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_88 = {1{`RANDOM}};
  tgtPages_3 = _RAND_88[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_89 = {1{`RANDOM}};
  tgtPages_4 = _RAND_89[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_90 = {1{`RANDOM}};
  tgtPages_5 = _RAND_90[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_91 = {1{`RANDOM}};
  tgtPages_6 = _RAND_91[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_92 = {1{`RANDOM}};
  tgtPages_7 = _RAND_92[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_93 = {1{`RANDOM}};
  tgtPages_8 = _RAND_93[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_94 = {1{`RANDOM}};
  tgtPages_9 = _RAND_94[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_95 = {1{`RANDOM}};
  tgtPages_10 = _RAND_95[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_96 = {1{`RANDOM}};
  tgtPages_11 = _RAND_96[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_97 = {1{`RANDOM}};
  tgtPages_12 = _RAND_97[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_98 = {1{`RANDOM}};
  tgtPages_13 = _RAND_98[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_99 = {1{`RANDOM}};
  tgtPages_14 = _RAND_99[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_100 = {1{`RANDOM}};
  tgtPages_15 = _RAND_100[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_101 = {1{`RANDOM}};
  tgtPages_16 = _RAND_101[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_102 = {1{`RANDOM}};
  tgtPages_17 = _RAND_102[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_103 = {1{`RANDOM}};
  tgtPages_18 = _RAND_103[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_104 = {1{`RANDOM}};
  tgtPages_19 = _RAND_104[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_105 = {1{`RANDOM}};
  tgtPages_20 = _RAND_105[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_106 = {1{`RANDOM}};
  tgtPages_21 = _RAND_106[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_107 = {1{`RANDOM}};
  tgtPages_22 = _RAND_107[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_108 = {1{`RANDOM}};
  tgtPages_23 = _RAND_108[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_109 = {1{`RANDOM}};
  tgtPages_24 = _RAND_109[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_110 = {1{`RANDOM}};
  tgtPages_25 = _RAND_110[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_111 = {1{`RANDOM}};
  tgtPages_26 = _RAND_111[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_112 = {1{`RANDOM}};
  tgtPages_27 = _RAND_112[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_113 = {1{`RANDOM}};
  pages_0 = _RAND_113[24:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_114 = {1{`RANDOM}};
  pages_1 = _RAND_114[24:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_115 = {1{`RANDOM}};
  pages_2 = _RAND_115[24:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_116 = {1{`RANDOM}};
  pages_3 = _RAND_116[24:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_117 = {1{`RANDOM}};
  pages_4 = _RAND_117[24:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_118 = {1{`RANDOM}};
  pages_5 = _RAND_118[24:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_119 = {1{`RANDOM}};
  pageValid = _RAND_119[5:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_120 = {1{`RANDOM}};
  isValid = _RAND_120[27:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_121 = {1{`RANDOM}};
  cfiType_0 = _RAND_121[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_122 = {1{`RANDOM}};
  cfiType_1 = _RAND_122[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_123 = {1{`RANDOM}};
  cfiType_2 = _RAND_123[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_124 = {1{`RANDOM}};
  cfiType_3 = _RAND_124[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_125 = {1{`RANDOM}};
  cfiType_4 = _RAND_125[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_126 = {1{`RANDOM}};
  cfiType_5 = _RAND_126[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_127 = {1{`RANDOM}};
  cfiType_6 = _RAND_127[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_128 = {1{`RANDOM}};
  cfiType_7 = _RAND_128[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_129 = {1{`RANDOM}};
  cfiType_8 = _RAND_129[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_130 = {1{`RANDOM}};
  cfiType_9 = _RAND_130[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_131 = {1{`RANDOM}};
  cfiType_10 = _RAND_131[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_132 = {1{`RANDOM}};
  cfiType_11 = _RAND_132[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_133 = {1{`RANDOM}};
  cfiType_12 = _RAND_133[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_134 = {1{`RANDOM}};
  cfiType_13 = _RAND_134[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_135 = {1{`RANDOM}};
  cfiType_14 = _RAND_135[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_136 = {1{`RANDOM}};
  cfiType_15 = _RAND_136[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_137 = {1{`RANDOM}};
  cfiType_16 = _RAND_137[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_138 = {1{`RANDOM}};
  cfiType_17 = _RAND_138[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_139 = {1{`RANDOM}};
  cfiType_18 = _RAND_139[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_140 = {1{`RANDOM}};
  cfiType_19 = _RAND_140[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_141 = {1{`RANDOM}};
  cfiType_20 = _RAND_141[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_142 = {1{`RANDOM}};
  cfiType_21 = _RAND_142[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_143 = {1{`RANDOM}};
  cfiType_22 = _RAND_143[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_144 = {1{`RANDOM}};
  cfiType_23 = _RAND_144[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_145 = {1{`RANDOM}};
  cfiType_24 = _RAND_145[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_146 = {1{`RANDOM}};
  cfiType_25 = _RAND_146[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_147 = {1{`RANDOM}};
  cfiType_26 = _RAND_147[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_148 = {1{`RANDOM}};
  cfiType_27 = _RAND_148[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_149 = {1{`RANDOM}};
  brIdx_0 = _RAND_149[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_150 = {1{`RANDOM}};
  brIdx_1 = _RAND_150[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_151 = {1{`RANDOM}};
  brIdx_2 = _RAND_151[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_152 = {1{`RANDOM}};
  brIdx_3 = _RAND_152[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_153 = {1{`RANDOM}};
  brIdx_4 = _RAND_153[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_154 = {1{`RANDOM}};
  brIdx_5 = _RAND_154[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_155 = {1{`RANDOM}};
  brIdx_6 = _RAND_155[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_156 = {1{`RANDOM}};
  brIdx_7 = _RAND_156[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_157 = {1{`RANDOM}};
  brIdx_8 = _RAND_157[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_158 = {1{`RANDOM}};
  brIdx_9 = _RAND_158[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_159 = {1{`RANDOM}};
  brIdx_10 = _RAND_159[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_160 = {1{`RANDOM}};
  brIdx_11 = _RAND_160[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_161 = {1{`RANDOM}};
  brIdx_12 = _RAND_161[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_162 = {1{`RANDOM}};
  brIdx_13 = _RAND_162[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_163 = {1{`RANDOM}};
  brIdx_14 = _RAND_163[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_164 = {1{`RANDOM}};
  brIdx_15 = _RAND_164[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_165 = {1{`RANDOM}};
  brIdx_16 = _RAND_165[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_166 = {1{`RANDOM}};
  brIdx_17 = _RAND_166[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_167 = {1{`RANDOM}};
  brIdx_18 = _RAND_167[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_168 = {1{`RANDOM}};
  brIdx_19 = _RAND_168[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_169 = {1{`RANDOM}};
  brIdx_20 = _RAND_169[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_170 = {1{`RANDOM}};
  brIdx_21 = _RAND_170[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_171 = {1{`RANDOM}};
  brIdx_22 = _RAND_171[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_172 = {1{`RANDOM}};
  brIdx_23 = _RAND_172[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_173 = {1{`RANDOM}};
  brIdx_24 = _RAND_173[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_174 = {1{`RANDOM}};
  brIdx_25 = _RAND_174[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_175 = {1{`RANDOM}};
  brIdx_26 = _RAND_175[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_176 = {1{`RANDOM}};
  brIdx_27 = _RAND_176[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_177 = {1{`RANDOM}};
  r_btb_update_valid = _RAND_177[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_178 = {1{`RANDOM}};
  r_btb_update_bits_prediction_entry = _RAND_178[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_179 = {2{`RANDOM}};
  r_btb_update_bits_pc = _RAND_179[38:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_180 = {1{`RANDOM}};
  r_btb_update_bits_isValid = _RAND_180[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_181 = {2{`RANDOM}};
  r_btb_update_bits_br_pc = _RAND_181[38:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_182 = {1{`RANDOM}};
  r_btb_update_bits_cfiType = _RAND_182[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_183 = {1{`RANDOM}};
  nextPageRepl = _RAND_183[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_184 = {1{`RANDOM}};
  _T_373 = _RAND_184[26:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_185 = {1{`RANDOM}};
  r_resp_valid = _RAND_185[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_186 = {1{`RANDOM}};
  r_resp_bits_taken = _RAND_186[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_187 = {1{`RANDOM}};
  r_resp_bits_entry = _RAND_187[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_188 = {1{`RANDOM}};
  _T_1163 = _RAND_188[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_189 = {1{`RANDOM}};
  _T_1252 = _RAND_189[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_190 = {1{`RANDOM}};
  _T_1254 = _RAND_190[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_191 = {2{`RANDOM}};
  _T_1258_0 = _RAND_191[38:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_192 = {2{`RANDOM}};
  _T_1258_1 = _RAND_192[38:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_193 = {2{`RANDOM}};
  _T_1258_2 = _RAND_193[38:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_194 = {2{`RANDOM}};
  _T_1258_3 = _RAND_194[38:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_195 = {2{`RANDOM}};
  _T_1258_4 = _RAND_195[38:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_196 = {2{`RANDOM}};
  _T_1258_5 = _RAND_196[38:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if(_T_1161__T_1245_en & _T_1161__T_1245_mask) begin
      _T_1161[_T_1161__T_1245_addr] <= _T_1161__T_1245_data; 
    end
    if (r_btb_update_valid) begin
      if (5'h0 == waddr) begin
        idxs_0 <= _T_471;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h1 == waddr) begin
        idxs_1 <= _T_471;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h2 == waddr) begin
        idxs_2 <= _T_471;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h3 == waddr) begin
        idxs_3 <= _T_471;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h4 == waddr) begin
        idxs_4 <= _T_471;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h5 == waddr) begin
        idxs_5 <= _T_471;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h6 == waddr) begin
        idxs_6 <= _T_471;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h7 == waddr) begin
        idxs_7 <= _T_471;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h8 == waddr) begin
        idxs_8 <= _T_471;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h9 == waddr) begin
        idxs_9 <= _T_471;
      end
    end
    if (r_btb_update_valid) begin
      if (5'ha == waddr) begin
        idxs_10 <= _T_471;
      end
    end
    if (r_btb_update_valid) begin
      if (5'hb == waddr) begin
        idxs_11 <= _T_471;
      end
    end
    if (r_btb_update_valid) begin
      if (5'hc == waddr) begin
        idxs_12 <= _T_471;
      end
    end
    if (r_btb_update_valid) begin
      if (5'hd == waddr) begin
        idxs_13 <= _T_471;
      end
    end
    if (r_btb_update_valid) begin
      if (5'he == waddr) begin
        idxs_14 <= _T_471;
      end
    end
    if (r_btb_update_valid) begin
      if (5'hf == waddr) begin
        idxs_15 <= _T_471;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h10 == waddr) begin
        idxs_16 <= _T_471;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h11 == waddr) begin
        idxs_17 <= _T_471;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h12 == waddr) begin
        idxs_18 <= _T_471;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h13 == waddr) begin
        idxs_19 <= _T_471;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h14 == waddr) begin
        idxs_20 <= _T_471;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h15 == waddr) begin
        idxs_21 <= _T_471;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h16 == waddr) begin
        idxs_22 <= _T_471;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h17 == waddr) begin
        idxs_23 <= _T_471;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h18 == waddr) begin
        idxs_24 <= _T_471;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h19 == waddr) begin
        idxs_25 <= _T_471;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h1a == waddr) begin
        idxs_26 <= _T_471;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h1b == waddr) begin
        idxs_27 <= _T_471;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h0 == waddr) begin
        idxPages_0 <= _idxPages_waddr;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h1 == waddr) begin
        idxPages_1 <= _idxPages_waddr;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h2 == waddr) begin
        idxPages_2 <= _idxPages_waddr;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h3 == waddr) begin
        idxPages_3 <= _idxPages_waddr;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h4 == waddr) begin
        idxPages_4 <= _idxPages_waddr;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h5 == waddr) begin
        idxPages_5 <= _idxPages_waddr;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h6 == waddr) begin
        idxPages_6 <= _idxPages_waddr;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h7 == waddr) begin
        idxPages_7 <= _idxPages_waddr;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h8 == waddr) begin
        idxPages_8 <= _idxPages_waddr;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h9 == waddr) begin
        idxPages_9 <= _idxPages_waddr;
      end
    end
    if (r_btb_update_valid) begin
      if (5'ha == waddr) begin
        idxPages_10 <= _idxPages_waddr;
      end
    end
    if (r_btb_update_valid) begin
      if (5'hb == waddr) begin
        idxPages_11 <= _idxPages_waddr;
      end
    end
    if (r_btb_update_valid) begin
      if (5'hc == waddr) begin
        idxPages_12 <= _idxPages_waddr;
      end
    end
    if (r_btb_update_valid) begin
      if (5'hd == waddr) begin
        idxPages_13 <= _idxPages_waddr;
      end
    end
    if (r_btb_update_valid) begin
      if (5'he == waddr) begin
        idxPages_14 <= _idxPages_waddr;
      end
    end
    if (r_btb_update_valid) begin
      if (5'hf == waddr) begin
        idxPages_15 <= _idxPages_waddr;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h10 == waddr) begin
        idxPages_16 <= _idxPages_waddr;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h11 == waddr) begin
        idxPages_17 <= _idxPages_waddr;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h12 == waddr) begin
        idxPages_18 <= _idxPages_waddr;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h13 == waddr) begin
        idxPages_19 <= _idxPages_waddr;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h14 == waddr) begin
        idxPages_20 <= _idxPages_waddr;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h15 == waddr) begin
        idxPages_21 <= _idxPages_waddr;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h16 == waddr) begin
        idxPages_22 <= _idxPages_waddr;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h17 == waddr) begin
        idxPages_23 <= _idxPages_waddr;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h18 == waddr) begin
        idxPages_24 <= _idxPages_waddr;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h19 == waddr) begin
        idxPages_25 <= _idxPages_waddr;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h1a == waddr) begin
        idxPages_26 <= _idxPages_waddr;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h1b == waddr) begin
        idxPages_27 <= _idxPages_waddr;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h0 == waddr) begin
        tgts_0 <= _T_260;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h1 == waddr) begin
        tgts_1 <= _T_260;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h2 == waddr) begin
        tgts_2 <= _T_260;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h3 == waddr) begin
        tgts_3 <= _T_260;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h4 == waddr) begin
        tgts_4 <= _T_260;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h5 == waddr) begin
        tgts_5 <= _T_260;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h6 == waddr) begin
        tgts_6 <= _T_260;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h7 == waddr) begin
        tgts_7 <= _T_260;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h8 == waddr) begin
        tgts_8 <= _T_260;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h9 == waddr) begin
        tgts_9 <= _T_260;
      end
    end
    if (r_btb_update_valid) begin
      if (5'ha == waddr) begin
        tgts_10 <= _T_260;
      end
    end
    if (r_btb_update_valid) begin
      if (5'hb == waddr) begin
        tgts_11 <= _T_260;
      end
    end
    if (r_btb_update_valid) begin
      if (5'hc == waddr) begin
        tgts_12 <= _T_260;
      end
    end
    if (r_btb_update_valid) begin
      if (5'hd == waddr) begin
        tgts_13 <= _T_260;
      end
    end
    if (r_btb_update_valid) begin
      if (5'he == waddr) begin
        tgts_14 <= _T_260;
      end
    end
    if (r_btb_update_valid) begin
      if (5'hf == waddr) begin
        tgts_15 <= _T_260;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h10 == waddr) begin
        tgts_16 <= _T_260;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h11 == waddr) begin
        tgts_17 <= _T_260;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h12 == waddr) begin
        tgts_18 <= _T_260;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h13 == waddr) begin
        tgts_19 <= _T_260;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h14 == waddr) begin
        tgts_20 <= _T_260;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h15 == waddr) begin
        tgts_21 <= _T_260;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h16 == waddr) begin
        tgts_22 <= _T_260;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h17 == waddr) begin
        tgts_23 <= _T_260;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h18 == waddr) begin
        tgts_24 <= _T_260;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h19 == waddr) begin
        tgts_25 <= _T_260;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h1a == waddr) begin
        tgts_26 <= _T_260;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h1b == waddr) begin
        tgts_27 <= _T_260;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h0 == waddr) begin
        tgtPages_0 <= tgtPageUpdate;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h1 == waddr) begin
        tgtPages_1 <= tgtPageUpdate;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h2 == waddr) begin
        tgtPages_2 <= tgtPageUpdate;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h3 == waddr) begin
        tgtPages_3 <= tgtPageUpdate;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h4 == waddr) begin
        tgtPages_4 <= tgtPageUpdate;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h5 == waddr) begin
        tgtPages_5 <= tgtPageUpdate;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h6 == waddr) begin
        tgtPages_6 <= tgtPageUpdate;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h7 == waddr) begin
        tgtPages_7 <= tgtPageUpdate;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h8 == waddr) begin
        tgtPages_8 <= tgtPageUpdate;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h9 == waddr) begin
        tgtPages_9 <= tgtPageUpdate;
      end
    end
    if (r_btb_update_valid) begin
      if (5'ha == waddr) begin
        tgtPages_10 <= tgtPageUpdate;
      end
    end
    if (r_btb_update_valid) begin
      if (5'hb == waddr) begin
        tgtPages_11 <= tgtPageUpdate;
      end
    end
    if (r_btb_update_valid) begin
      if (5'hc == waddr) begin
        tgtPages_12 <= tgtPageUpdate;
      end
    end
    if (r_btb_update_valid) begin
      if (5'hd == waddr) begin
        tgtPages_13 <= tgtPageUpdate;
      end
    end
    if (r_btb_update_valid) begin
      if (5'he == waddr) begin
        tgtPages_14 <= tgtPageUpdate;
      end
    end
    if (r_btb_update_valid) begin
      if (5'hf == waddr) begin
        tgtPages_15 <= tgtPageUpdate;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h10 == waddr) begin
        tgtPages_16 <= tgtPageUpdate;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h11 == waddr) begin
        tgtPages_17 <= tgtPageUpdate;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h12 == waddr) begin
        tgtPages_18 <= tgtPageUpdate;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h13 == waddr) begin
        tgtPages_19 <= tgtPageUpdate;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h14 == waddr) begin
        tgtPages_20 <= tgtPageUpdate;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h15 == waddr) begin
        tgtPages_21 <= tgtPageUpdate;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h16 == waddr) begin
        tgtPages_22 <= tgtPageUpdate;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h17 == waddr) begin
        tgtPages_23 <= tgtPageUpdate;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h18 == waddr) begin
        tgtPages_24 <= tgtPageUpdate;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h19 == waddr) begin
        tgtPages_25 <= tgtPageUpdate;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h1a == waddr) begin
        tgtPages_26 <= tgtPageUpdate;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h1b == waddr) begin
        tgtPages_27 <= tgtPageUpdate;
      end
    end
    if (r_btb_update_valid) begin
      if (_T_490) begin
        if (_T_485) begin
          pages_0 <= _T_316;
        end else begin
          pages_0 <= _T_248;
        end
      end
    end
    if (r_btb_update_valid) begin
      if (_T_497) begin
        if (_T_485) begin
          pages_1 <= _T_248;
        end else begin
          pages_1 <= _T_316;
        end
      end
    end
    if (r_btb_update_valid) begin
      if (_T_491) begin
        if (_T_485) begin
          pages_2 <= _T_316;
        end else begin
          pages_2 <= _T_248;
        end
      end
    end
    if (r_btb_update_valid) begin
      if (_T_498) begin
        if (_T_485) begin
          pages_3 <= _T_248;
        end else begin
          pages_3 <= _T_316;
        end
      end
    end
    if (r_btb_update_valid) begin
      if (_T_492) begin
        if (_T_485) begin
          pages_4 <= _T_316;
        end else begin
          pages_4 <= _T_248;
        end
      end
    end
    if (r_btb_update_valid) begin
      if (_T_499) begin
        if (_T_485) begin
          pages_5 <= _T_248;
        end else begin
          pages_5 <= _T_316;
        end
      end
    end
    if (reset) begin
      pageValid <= 6'h0;
    end else begin
      pageValid <= _GEN_373[5:0];
    end
    if (reset) begin
      isValid <= 28'h0;
    end else begin
      isValid <= _GEN_381[27:0];
    end
    if (r_btb_update_valid) begin
      if (5'h0 == waddr) begin
        cfiType_0 <= r_btb_update_bits_cfiType;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h1 == waddr) begin
        cfiType_1 <= r_btb_update_bits_cfiType;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h2 == waddr) begin
        cfiType_2 <= r_btb_update_bits_cfiType;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h3 == waddr) begin
        cfiType_3 <= r_btb_update_bits_cfiType;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h4 == waddr) begin
        cfiType_4 <= r_btb_update_bits_cfiType;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h5 == waddr) begin
        cfiType_5 <= r_btb_update_bits_cfiType;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h6 == waddr) begin
        cfiType_6 <= r_btb_update_bits_cfiType;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h7 == waddr) begin
        cfiType_7 <= r_btb_update_bits_cfiType;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h8 == waddr) begin
        cfiType_8 <= r_btb_update_bits_cfiType;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h9 == waddr) begin
        cfiType_9 <= r_btb_update_bits_cfiType;
      end
    end
    if (r_btb_update_valid) begin
      if (5'ha == waddr) begin
        cfiType_10 <= r_btb_update_bits_cfiType;
      end
    end
    if (r_btb_update_valid) begin
      if (5'hb == waddr) begin
        cfiType_11 <= r_btb_update_bits_cfiType;
      end
    end
    if (r_btb_update_valid) begin
      if (5'hc == waddr) begin
        cfiType_12 <= r_btb_update_bits_cfiType;
      end
    end
    if (r_btb_update_valid) begin
      if (5'hd == waddr) begin
        cfiType_13 <= r_btb_update_bits_cfiType;
      end
    end
    if (r_btb_update_valid) begin
      if (5'he == waddr) begin
        cfiType_14 <= r_btb_update_bits_cfiType;
      end
    end
    if (r_btb_update_valid) begin
      if (5'hf == waddr) begin
        cfiType_15 <= r_btb_update_bits_cfiType;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h10 == waddr) begin
        cfiType_16 <= r_btb_update_bits_cfiType;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h11 == waddr) begin
        cfiType_17 <= r_btb_update_bits_cfiType;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h12 == waddr) begin
        cfiType_18 <= r_btb_update_bits_cfiType;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h13 == waddr) begin
        cfiType_19 <= r_btb_update_bits_cfiType;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h14 == waddr) begin
        cfiType_20 <= r_btb_update_bits_cfiType;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h15 == waddr) begin
        cfiType_21 <= r_btb_update_bits_cfiType;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h16 == waddr) begin
        cfiType_22 <= r_btb_update_bits_cfiType;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h17 == waddr) begin
        cfiType_23 <= r_btb_update_bits_cfiType;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h18 == waddr) begin
        cfiType_24 <= r_btb_update_bits_cfiType;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h19 == waddr) begin
        cfiType_25 <= r_btb_update_bits_cfiType;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h1a == waddr) begin
        cfiType_26 <= r_btb_update_bits_cfiType;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h1b == waddr) begin
        cfiType_27 <= r_btb_update_bits_cfiType;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h0 == waddr) begin
        brIdx_0 <= _brIdx_waddr;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h1 == waddr) begin
        brIdx_1 <= _brIdx_waddr;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h2 == waddr) begin
        brIdx_2 <= _brIdx_waddr;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h3 == waddr) begin
        brIdx_3 <= _brIdx_waddr;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h4 == waddr) begin
        brIdx_4 <= _brIdx_waddr;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h5 == waddr) begin
        brIdx_5 <= _brIdx_waddr;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h6 == waddr) begin
        brIdx_6 <= _brIdx_waddr;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h7 == waddr) begin
        brIdx_7 <= _brIdx_waddr;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h8 == waddr) begin
        brIdx_8 <= _brIdx_waddr;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h9 == waddr) begin
        brIdx_9 <= _brIdx_waddr;
      end
    end
    if (r_btb_update_valid) begin
      if (5'ha == waddr) begin
        brIdx_10 <= _brIdx_waddr;
      end
    end
    if (r_btb_update_valid) begin
      if (5'hb == waddr) begin
        brIdx_11 <= _brIdx_waddr;
      end
    end
    if (r_btb_update_valid) begin
      if (5'hc == waddr) begin
        brIdx_12 <= _brIdx_waddr;
      end
    end
    if (r_btb_update_valid) begin
      if (5'hd == waddr) begin
        brIdx_13 <= _brIdx_waddr;
      end
    end
    if (r_btb_update_valid) begin
      if (5'he == waddr) begin
        brIdx_14 <= _brIdx_waddr;
      end
    end
    if (r_btb_update_valid) begin
      if (5'hf == waddr) begin
        brIdx_15 <= _brIdx_waddr;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h10 == waddr) begin
        brIdx_16 <= _brIdx_waddr;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h11 == waddr) begin
        brIdx_17 <= _brIdx_waddr;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h12 == waddr) begin
        brIdx_18 <= _brIdx_waddr;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h13 == waddr) begin
        brIdx_19 <= _brIdx_waddr;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h14 == waddr) begin
        brIdx_20 <= _brIdx_waddr;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h15 == waddr) begin
        brIdx_21 <= _brIdx_waddr;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h16 == waddr) begin
        brIdx_22 <= _brIdx_waddr;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h17 == waddr) begin
        brIdx_23 <= _brIdx_waddr;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h18 == waddr) begin
        brIdx_24 <= _brIdx_waddr;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h19 == waddr) begin
        brIdx_25 <= _brIdx_waddr;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h1a == waddr) begin
        brIdx_26 <= _brIdx_waddr;
      end
    end
    if (r_btb_update_valid) begin
      if (5'h1b == waddr) begin
        brIdx_27 <= _brIdx_waddr;
      end
    end
    if (reset) begin
      r_btb_update_valid <= 1'h0;
    end else begin
      r_btb_update_valid <= io_btb_update_valid;
    end
    if (io_btb_update_valid) begin
      r_btb_update_bits_prediction_entry <= io_btb_update_bits_prediction_entry;
    end
    if (io_btb_update_valid) begin
      r_btb_update_bits_pc <= io_btb_update_bits_pc;
    end
    if (io_btb_update_valid) begin
      r_btb_update_bits_isValid <= io_btb_update_bits_isValid;
    end
    if (io_btb_update_valid) begin
      r_btb_update_bits_br_pc <= io_btb_update_bits_br_pc;
    end
    if (io_btb_update_valid) begin
      r_btb_update_bits_cfiType <= io_btb_update_bits_cfiType;
    end
    if (_T_364) begin
      if (_T_369) begin
        nextPageRepl <= {{2'd0}, _T_370};
      end else begin
        nextPageRepl <= _T_368;
      end
    end
    if (_T_420) begin
      _T_373 <= _T_468;
    end
    if (reset) begin
      r_resp_valid <= 1'h0;
    end else begin
      r_resp_valid <= io_resp_valid;
    end
    if (io_resp_valid) begin
      r_resp_bits_taken <= io_resp_bits_taken;
    end
    if (io_resp_valid) begin
      r_resp_bits_entry <= io_resp_bits_entry;
    end
    if (io_bht_update_valid) begin
      if (io_bht_update_bits_branch) begin
        if (io_bht_update_bits_mispredict) begin
          _T_1163 <= _T_1247;
        end else begin
          if (io_bht_advance_valid) begin
            _T_1163 <= _T_1235;
          end
        end
      end else begin
        if (io_bht_update_bits_mispredict) begin
          _T_1163 <= io_bht_update_bits_prediction_history;
        end else begin
          if (io_bht_advance_valid) begin
            _T_1163 <= _T_1235;
          end
        end
      end
    end else begin
      if (io_bht_advance_valid) begin
        _T_1163 <= _T_1235;
      end
    end
    if (io_ras_update_valid) begin
      if (_T_1331) begin
        if (_T_1332) begin
          _T_1252 <= _T_1334;
        end
      end else begin
        if (_T_1341) begin
          if (_T_1325) begin
            _T_1252 <= _T_1346;
          end
        end
      end
    end
    if (io_ras_update_valid) begin
      if (_T_1331) begin
        if (_T_1335) begin
          _T_1254 <= _T_1338;
        end else begin
          _T_1254 <= 3'h0;
        end
      end else begin
        if (_T_1341) begin
          if (_T_1325) begin
            if (_T_1347) begin
              _T_1254 <= _T_1351;
            end else begin
              _T_1254 <= 3'h5;
            end
          end
        end
      end
    end
    if (io_ras_update_valid) begin
      if (_T_1331) begin
        if (3'h0 == _T_1339) begin
          _T_1258_0 <= io_ras_update_bits_returnAddr;
        end
      end
    end
    if (io_ras_update_valid) begin
      if (_T_1331) begin
        if (3'h1 == _T_1339) begin
          _T_1258_1 <= io_ras_update_bits_returnAddr;
        end
      end
    end
    if (io_ras_update_valid) begin
      if (_T_1331) begin
        if (3'h2 == _T_1339) begin
          _T_1258_2 <= io_ras_update_bits_returnAddr;
        end
      end
    end
    if (io_ras_update_valid) begin
      if (_T_1331) begin
        if (3'h3 == _T_1339) begin
          _T_1258_3 <= io_ras_update_bits_returnAddr;
        end
      end
    end
    if (io_ras_update_valid) begin
      if (_T_1331) begin
        if (3'h4 == _T_1339) begin
          _T_1258_4 <= io_ras_update_bits_returnAddr;
        end
      end
    end
    if (io_ras_update_valid) begin
      if (_T_1331) begin
        if (3'h5 == _T_1339) begin
          _T_1258_5 <= io_ras_update_bits_returnAddr;
        end
      end
    end
  end
endmodule
