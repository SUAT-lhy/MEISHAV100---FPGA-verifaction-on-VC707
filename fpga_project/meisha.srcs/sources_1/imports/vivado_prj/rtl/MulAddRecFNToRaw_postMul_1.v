module MulAddRecFNToRaw_postMul_1( 
  input          io_fromPreMul_isSigNaNAny, 
  input          io_fromPreMul_isNaNAOrB, 
  input          io_fromPreMul_isInfA, 
  input          io_fromPreMul_isZeroA, 
  input          io_fromPreMul_isInfB, 
  input          io_fromPreMul_isZeroB, 
  input          io_fromPreMul_signProd, 
  input          io_fromPreMul_isNaNC, 
  input          io_fromPreMul_isInfC, 
  input          io_fromPreMul_isZeroC, 
  input  [12:0]  io_fromPreMul_sExpSum, 
  input          io_fromPreMul_doSubMags, 
  input          io_fromPreMul_CIsDominant, 
  input  [5:0]   io_fromPreMul_CDom_CAlignDist, 
  input  [54:0]  io_fromPreMul_highAlignedSigC, 
  input          io_fromPreMul_bit0AlignedSigC, 
  input  [106:0] io_mulAddResult, 
  input  [2:0]   io_roundingMode, 
  output         io_invalidExc, 
  output         io_rawOut_isNaN, 
  output         io_rawOut_isInf, 
  output         io_rawOut_isZero, 
  output         io_rawOut_sign, 
  output [12:0]  io_rawOut_sExp, 
  output [55:0]  io_rawOut_sig 
);
  wire  roundingMode_min; 
  wire  CDom_sign; 
  wire  _T_9; 
  wire [54:0] _T_11; 
  wire [54:0] _T_12; 
  wire [105:0] _T_13; 
  wire [160:0] _T_14; 
  wire [161:0] sigSum; 
  wire [1:0] _T_15; 
  wire [12:0] _GEN_0; 
  wire [12:0] _T_17; 
  wire [12:0] CDom_sExp; 
  wire [107:0] _T_18; 
  wire [107:0] _T_19; 
  wire [1:0] _T_20; 
  wire [104:0] _T_21; 
  wire [2:0] _T_22; 
  wire [107:0] _T_23; 
  wire [107:0] CDom_absSigSum; 
  wire [52:0] _T_24; 
  wire [52:0] _T_25; 
  wire  _T_26; 
  wire [53:0] _T_27; 
  wire  _T_28; 
  wire  CDom_absSigSumExtra; 
  wire [170:0] _GEN_1; 
  wire [170:0] _T_29; 
  wire [57:0] CDom_mainSig; 
  wire [52:0] _T_30; 
  wire [54:0] _GEN_2; 
  wire [54:0] _T_31; 
  wire [3:0] _T_52; 
  wire  _T_53; 
  wire [3:0] _T_54; 
  wire  _T_55; 
  wire [3:0] _T_56; 
  wire  _T_57; 
  wire [3:0] _T_58; 
  wire  _T_59; 
  wire [3:0] _T_60; 
  wire  _T_61; 
  wire [3:0] _T_62; 
  wire  _T_63; 
  wire [3:0] _T_64; 
  wire  _T_65; 
  wire [3:0] _T_66; 
  wire  _T_67; 
  wire [3:0] _T_68; 
  wire  _T_69; 
  wire [3:0] _T_70; 
  wire  _T_71; 
  wire [3:0] _T_72; 
  wire  _T_73; 
  wire [3:0] _T_74; 
  wire  _T_75; 
  wire [3:0] _T_76; 
  wire  _T_77; 
  wire [2:0] _T_78; 
  wire  _T_79; 
  wire [1:0] _T_80; 
  wire [2:0] _T_81; 
  wire [1:0] _T_82; 
  wire [1:0] _T_83; 
  wire [3:0] _T_84; 
  wire [6:0] _T_85; 
  wire [1:0] _T_86; 
  wire [2:0] _T_87; 
  wire [1:0] _T_88; 
  wire [1:0] _T_89; 
  wire [3:0] _T_90; 
  wire [6:0] _T_91; 
  wire [13:0] _T_92; 
  wire [3:0] _T_93; 
  wire [3:0] _T_94; 
  wire [16:0] _T_95; 
  wire [12:0] _T_96; 
  wire [7:0] _T_97; 
  wire [3:0] _T_100; 
  wire [7:0] _T_101; 
  wire [3:0] _T_102; 
  wire [7:0] _GEN_3; 
  wire [7:0] _T_103; 
  wire [7:0] _T_105; 
  wire [7:0] _T_106; 
  wire [5:0] _T_110; 
  wire [7:0] _GEN_4; 
  wire [7:0] _T_111; 
  wire [5:0] _T_112; 
  wire [7:0] _GEN_5; 
  wire [7:0] _T_113; 
  wire [7:0] _T_115; 
  wire [7:0] _T_116; 
  wire [6:0] _T_120; 
  wire [7:0] _GEN_6; 
  wire [7:0] _T_121; 
  wire [6:0] _T_122; 
  wire [7:0] _GEN_7; 
  wire [7:0] _T_123; 
  wire [7:0] _T_125; 
  wire [7:0] _T_126; 
  wire [4:0] _T_127; 
  wire [3:0] _T_128; 
  wire [1:0] _T_129; 
  wire  _T_130; 
  wire  _T_131; 
  wire [1:0] _T_132; 
  wire [1:0] _T_133; 
  wire  _T_134; 
  wire  _T_135; 
  wire [1:0] _T_136; 
  wire [3:0] _T_137; 
  wire  _T_138; 
  wire [4:0] _T_139; 
  wire [12:0] _T_140; 
  wire [13:0] _GEN_8; 
  wire [13:0] _T_141; 
  wire  CDom_reduced4SigExtra; 
  wire [54:0] _T_142; 
  wire [2:0] _T_143; 
  wire  _T_144; 
  wire  _T_145; 
  wire  _T_146; 
  wire [55:0] CDom_sig; 
  wire  notCDom_signSigSum; 
  wire [108:0] _T_147; 
  wire [108:0] _T_148; 
  wire [108:0] _GEN_9; 
  wire [108:0] _T_151; 
  wire [108:0] notCDom_absSigSum; 
  wire [1:0] _T_213; 
  wire  _T_214; 
  wire [1:0] _T_215; 
  wire  _T_216; 
  wire [1:0] _T_217; 
  wire  _T_218; 
  wire [1:0] _T_219; 
  wire  _T_220; 
  wire [1:0] _T_221; 
  wire  _T_222; 
  wire [1:0] _T_223; 
  wire  _T_224; 
  wire [1:0] _T_225; 
  wire  _T_226; 
  wire [1:0] _T_227; 
  wire  _T_228; 
  wire [1:0] _T_229; 
  wire  _T_230; 
  wire [1:0] _T_231; 
  wire  _T_232; 
  wire [1:0] _T_233; 
  wire  _T_234; 
  wire [1:0] _T_235; 
  wire  _T_236; 
  wire [1:0] _T_237; 
  wire  _T_238; 
  wire [1:0] _T_239; 
  wire  _T_240; 
  wire [1:0] _T_241; 
  wire  _T_242; 
  wire [1:0] _T_243; 
  wire  _T_244; 
  wire [1:0] _T_245; 
  wire  _T_246; 
  wire [1:0] _T_247; 
  wire  _T_248; 
  wire [1:0] _T_249; 
  wire  _T_250; 
  wire [1:0] _T_251; 
  wire  _T_252; 
  wire [1:0] _T_253; 
  wire  _T_254; 
  wire [1:0] _T_255; 
  wire  _T_256; 
  wire [1:0] _T_257; 
  wire  _T_258; 
  wire [1:0] _T_259; 
  wire  _T_260; 
  wire [1:0] _T_261; 
  wire  _T_262; 
  wire [1:0] _T_263; 
  wire  _T_264; 
  wire [1:0] _T_265; 
  wire  _T_266; 
  wire [1:0] _T_267; 
  wire  _T_268; 
  wire [1:0] _T_269; 
  wire  _T_270; 
  wire [1:0] _T_271; 
  wire  _T_272; 
  wire [1:0] _T_273; 
  wire  _T_274; 
  wire [1:0] _T_275; 
  wire  _T_276; 
  wire [1:0] _T_277; 
  wire  _T_278; 
  wire [1:0] _T_279; 
  wire  _T_280; 
  wire [1:0] _T_281; 
  wire  _T_282; 
  wire [1:0] _T_283; 
  wire  _T_284; 
  wire [1:0] _T_285; 
  wire  _T_286; 
  wire [1:0] _T_287; 
  wire  _T_288; 
  wire [1:0] _T_289; 
  wire  _T_290; 
  wire [1:0] _T_291; 
  wire  _T_292; 
  wire [1:0] _T_293; 
  wire  _T_294; 
  wire [1:0] _T_295; 
  wire  _T_296; 
  wire [1:0] _T_297; 
  wire  _T_298; 
  wire [1:0] _T_299; 
  wire  _T_300; 
  wire [1:0] _T_301; 
  wire  _T_302; 
  wire [1:0] _T_303; 
  wire  _T_304; 
  wire [1:0] _T_305; 
  wire  _T_306; 
  wire [1:0] _T_307; 
  wire  _T_308; 
  wire [1:0] _T_309; 
  wire  _T_310; 
  wire [1:0] _T_311; 
  wire  _T_312; 
  wire [1:0] _T_313; 
  wire  _T_314; 
  wire [1:0] _T_315; 
  wire  _T_316; 
  wire [1:0] _T_317; 
  wire  _T_318; 
  wire [1:0] _T_319; 
  wire  _T_320; 
  wire  _T_321; 
  wire [1:0] _T_323; 
  wire [2:0] _T_324; 
  wire [1:0] _T_325; 
  wire [2:0] _T_326; 
  wire [5:0] _T_327; 
  wire [1:0] _T_328; 
  wire [2:0] _T_329; 
  wire [1:0] _T_330; 
  wire [1:0] _T_331; 
  wire [3:0] _T_332; 
  wire [6:0] _T_333; 
  wire [12:0] _T_334; 
  wire [1:0] _T_335; 
  wire [2:0] _T_336; 
  wire [1:0] _T_337; 
  wire [1:0] _T_338; 
  wire [3:0] _T_339; 
  wire [6:0] _T_340; 
  wire [1:0] _T_341; 
  wire [2:0] _T_342; 
  wire [1:0] _T_343; 
  wire [1:0] _T_344; 
  wire [3:0] _T_345; 
  wire [6:0] _T_346; 
  wire [13:0] _T_347; 
  wire [26:0] _T_348; 
  wire [1:0] _T_349; 
  wire [2:0] _T_350; 
  wire [1:0] _T_351; 
  wire [1:0] _T_352; 
  wire [3:0] _T_353; 
  wire [6:0] _T_354; 
  wire [1:0] _T_355; 
  wire [2:0] _T_356; 
  wire [1:0] _T_357; 
  wire [1:0] _T_358; 
  wire [3:0] _T_359; 
  wire [6:0] _T_360; 
  wire [13:0] _T_361; 
  wire [1:0] _T_362; 
  wire [2:0] _T_363; 
  wire [1:0] _T_364; 
  wire [1:0] _T_365; 
  wire [3:0] _T_366; 
  wire [6:0] _T_367; 
  wire [1:0] _T_368; 
  wire [2:0] _T_369; 
  wire [1:0] _T_370; 
  wire [1:0] _T_371; 
  wire [3:0] _T_372; 
  wire [6:0] _T_373; 
  wire [13:0] _T_374; 
  wire [27:0] _T_375; 
  wire [54:0] notCDom_reduced2AbsSigSum; 
  wire [31:0] _T_376; 
  wire [15:0] _T_379; 
  wire [31:0] _T_380; 
  wire [15:0] _T_381; 
  wire [31:0] _GEN_10; 
  wire [31:0] _T_382; 
  wire [31:0] _T_384; 
  wire [31:0] _T_385; 
  wire [23:0] _T_389; 
  wire [31:0] _GEN_11; 
  wire [31:0] _T_390; 
  wire [23:0] _T_391; 
  wire [31:0] _GEN_12; 
  wire [31:0] _T_392; 
  wire [31:0] _T_394; 
  wire [31:0] _T_395; 
  wire [27:0] _T_399; 
  wire [31:0] _GEN_13; 
  wire [31:0] _T_400; 
  wire [27:0] _T_401; 
  wire [31:0] _GEN_14; 
  wire [31:0] _T_402; 
  wire [31:0] _T_404; 
  wire [31:0] _T_405; 
  wire [29:0] _T_409; 
  wire [31:0] _GEN_15; 
  wire [31:0] _T_410; 
  wire [29:0] _T_411; 
  wire [31:0] _GEN_16; 
  wire [31:0] _T_412; 
  wire [31:0] _T_414; 
  wire [31:0] _T_415; 
  wire [30:0] _T_419; 
  wire [31:0] _GEN_17; 
  wire [31:0] _T_420; 
  wire [30:0] _T_421; 
  wire [31:0] _GEN_18; 
  wire [31:0] _T_422; 
  wire [31:0] _T_424; 
  wire [31:0] _T_425; 
  wire [22:0] _T_426; 
  wire [15:0] _T_427; 
  wire [7:0] _T_430; 
  wire [15:0] _T_431; 
  wire [7:0] _T_432; 
  wire [15:0] _GEN_19; 
  wire [15:0] _T_433; 
  wire [15:0] _T_435; 
  wire [15:0] _T_436; 
  wire [11:0] _T_440; 
  wire [15:0] _GEN_20; 
  wire [15:0] _T_441; 
  wire [11:0] _T_442; 
  wire [15:0] _GEN_21; 
  wire [15:0] _T_443; 
  wire [15:0] _T_445; 
  wire [15:0] _T_446; 
  wire [13:0] _T_450; 
  wire [15:0] _GEN_22; 
  wire [15:0] _T_451; 
  wire [13:0] _T_452; 
  wire [15:0] _GEN_23; 
  wire [15:0] _T_453; 
  wire [15:0] _T_455; 
  wire [15:0] _T_456; 
  wire [14:0] _T_460; 
  wire [15:0] _GEN_24; 
  wire [15:0] _T_461; 
  wire [14:0] _T_462; 
  wire [15:0] _GEN_25; 
  wire [15:0] _T_463; 
  wire [15:0] _T_465; 
  wire [15:0] _T_466; 
  wire [6:0] _T_467; 
  wire [3:0] _T_468; 
  wire [1:0] _T_469; 
  wire  _T_470; 
  wire  _T_471; 
  wire [1:0] _T_472; 
  wire [1:0] _T_473; 
  wire  _T_474; 
  wire  _T_475; 
  wire [1:0] _T_476; 
  wire [3:0] _T_477; 
  wire [2:0] _T_478; 
  wire [1:0] _T_479; 
  wire  _T_480; 
  wire  _T_481; 
  wire [1:0] _T_482; 
  wire  _T_483; 
  wire [2:0] _T_484; 
  wire [6:0] _T_485; 
  wire [22:0] _T_486; 
  wire [54:0] _T_487; 
  wire  _T_488; 
  wire  _T_489; 
  wire  _T_490; 
  wire  _T_491; 
  wire  _T_492; 
  wire  _T_493; 
  wire  _T_494; 
  wire  _T_495; 
  wire  _T_496; 
  wire  _T_497; 
  wire  _T_498; 
  wire  _T_499; 
  wire  _T_500; 
  wire  _T_501; 
  wire  _T_502; 
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
  wire  _T_531; 
  wire  _T_532; 
  wire  _T_533; 
  wire  _T_534; 
  wire  _T_535; 
  wire  _T_536; 
  wire  _T_537; 
  wire  _T_538; 
  wire  _T_539; 
  wire  _T_540; 
  wire  _T_541; 
  wire [5:0] _T_543; 
  wire [5:0] _T_544; 
  wire [5:0] _T_545; 
  wire [5:0] _T_546; 
  wire [5:0] _T_547; 
  wire [5:0] _T_548; 
  wire [5:0] _T_549; 
  wire [5:0] _T_550; 
  wire [5:0] _T_551; 
  wire [5:0] _T_552; 
  wire [5:0] _T_553; 
  wire [5:0] _T_554; 
  wire [5:0] _T_555; 
  wire [5:0] _T_556; 
  wire [5:0] _T_557; 
  wire [5:0] _T_558; 
  wire [5:0] _T_559; 
  wire [5:0] _T_560; 
  wire [5:0] _T_561; 
  wire [5:0] _T_562; 
  wire [5:0] _T_563; 
  wire [5:0] _T_564; 
  wire [5:0] _T_565; 
  wire [5:0] _T_566; 
  wire [5:0] _T_567; 
  wire [5:0] _T_568; 
  wire [5:0] _T_569; 
  wire [5:0] _T_570; 
  wire [5:0] _T_571; 
  wire [5:0] _T_572; 
  wire [5:0] _T_573; 
  wire [5:0] _T_574; 
  wire [5:0] _T_575; 
  wire [5:0] _T_576; 
  wire [5:0] _T_577; 
  wire [5:0] _T_578; 
  wire [5:0] _T_579; 
  wire [5:0] _T_580; 
  wire [5:0] _T_581; 
  wire [5:0] _T_582; 
  wire [5:0] _T_583; 
  wire [5:0] _T_584; 
  wire [5:0] _T_585; 
  wire [5:0] _T_586; 
  wire [5:0] _T_587; 
  wire [5:0] _T_588; 
  wire [5:0] _T_589; 
  wire [5:0] _T_590; 
  wire [5:0] _T_591; 
  wire [5:0] _T_592; 
  wire [5:0] _T_593; 
  wire [5:0] _T_594; 
  wire [5:0] _T_595; 
  wire [5:0] notCDom_normDistReduced2; 
  wire [6:0] _GEN_26; 
  wire [6:0] notCDom_nearNormDist; 
  wire [7:0] _T_596; 
  wire [12:0] _GEN_27; 
  wire [12:0] _T_598; 
  wire [12:0] notCDom_sExp; 
  wire [235:0] _GEN_28; 
  wire [235:0] _T_599; 
  wire [57:0] notCDom_mainSig; 
  wire [26:0] _T_600; 
  wire [1:0] _T_622; 
  wire  _T_623; 
  wire [1:0] _T_624; 
  wire  _T_625; 
  wire [1:0] _T_626; 
  wire  _T_627; 
  wire [1:0] _T_628; 
  wire  _T_629; 
  wire [1:0] _T_630; 
  wire  _T_631; 
  wire [1:0] _T_632; 
  wire  _T_633; 
  wire [1:0] _T_634; 
  wire  _T_635; 
  wire [1:0] _T_636; 
  wire  _T_637; 
  wire [1:0] _T_638; 
  wire  _T_639; 
  wire [1:0] _T_640; 
  wire  _T_641; 
  wire [1:0] _T_642; 
  wire  _T_643; 
  wire [1:0] _T_644; 
  wire  _T_645; 
  wire [1:0] _T_646; 
  wire  _T_647; 
  wire  _T_648; 
  wire [1:0] _T_650; 
  wire [2:0] _T_651; 
  wire [1:0] _T_652; 
  wire [1:0] _T_653; 
  wire [3:0] _T_654; 
  wire [6:0] _T_655; 
  wire [1:0] _T_656; 
  wire [2:0] _T_657; 
  wire [1:0] _T_658; 
  wire [1:0] _T_659; 
  wire [3:0] _T_660; 
  wire [6:0] _T_661; 
  wire [13:0] _T_662; 
  wire [4:0] _T_663; 
  wire [4:0] _T_664; 
  wire [32:0] _T_665; 
  wire [12:0] _T_666; 
  wire [7:0] _T_667; 
  wire [3:0] _T_670; 
  wire [7:0] _T_671; 
  wire [3:0] _T_672; 
  wire [7:0] _GEN_29; 
  wire [7:0] _T_673; 
  wire [7:0] _T_675; 
  wire [7:0] _T_676; 
  wire [5:0] _T_680; 
  wire [7:0] _GEN_30; 
  wire [7:0] _T_681; 
  wire [5:0] _T_682; 
  wire [7:0] _GEN_31; 
  wire [7:0] _T_683; 
  wire [7:0] _T_685; 
  wire [7:0] _T_686; 
  wire [6:0] _T_690; 
  wire [7:0] _GEN_32; 
  wire [7:0] _T_691; 
  wire [6:0] _T_692; 
  wire [7:0] _GEN_33; 
  wire [7:0] _T_693; 
  wire [7:0] _T_695; 
  wire [7:0] _T_696; 
  wire [4:0] _T_697; 
  wire [3:0] _T_698; 
  wire [1:0] _T_699; 
  wire  _T_700; 
  wire  _T_701; 
  wire [1:0] _T_702; 
  wire [1:0] _T_703; 
  wire  _T_704; 
  wire  _T_705; 
  wire [1:0] _T_706; 
  wire [3:0] _T_707; 
  wire  _T_708; 
  wire [4:0] _T_709; 
  wire [12:0] _T_710; 
  wire [13:0] _GEN_34; 
  wire [13:0] _T_711; 
  wire  notCDom_reduced4SigExtra; 
  wire [54:0] _T_712; 
  wire [2:0] _T_713; 
  wire  _T_714; 
  wire  _T_715; 
  wire [55:0] notCDom_sig; 
  wire [1:0] _T_716; 
  wire  notCDom_completeCancellation; 
  wire  _T_717; 
  wire  notCDom_sign; 
  wire  notNaN_isInfProd; 
  wire  notNaN_isInfOut; 
  wire  _T_718; 
  wire  notNaN_addZeros; 
  wire  _T_719; 
  wire  _T_720; 
  wire  _T_721; 
  wire  _T_722; 
  wire  _T_723; 
  wire  _T_725; 
  wire  _T_726; 
  wire  _T_727; 
  wire  _T_730; 
  wire  _T_731; 
  wire  _T_733; 
  wire  _T_734; 
  wire  _T_735; 
  wire  _T_736; 
  wire  _T_737; 
  wire  _T_738; 
  wire  _T_739; 
  wire  _T_740; 
  wire  _T_741; 
  wire  _T_742; 
  wire  _T_743; 
  wire  _T_744; 
  wire  _T_745; 
  wire  _T_746; 
  wire  _T_747; 
  wire  _T_748; 
  wire  _T_749; 
  assign roundingMode_min = io_roundingMode == 3'h2; 
  assign CDom_sign = io_fromPreMul_signProd ^ io_fromPreMul_doSubMags; 
  assign _T_9 = io_mulAddResult[106]; 
  assign _T_11 = io_fromPreMul_highAlignedSigC + 55'h1; 
  assign _T_12 = _T_9 ? _T_11 : io_fromPreMul_highAlignedSigC; 
  assign _T_13 = io_mulAddResult[105:0]; 
  assign _T_14 = {_T_12,_T_13}; 
  assign sigSum = {_T_14,io_fromPreMul_bit0AlignedSigC}; 
  assign _T_15 = {1'b0,$signed(io_fromPreMul_doSubMags)}; 
  assign _GEN_0 = {{11{_T_15[1]}},_T_15}; 
  assign _T_17 = $signed(io_fromPreMul_sExpSum) - $signed(_GEN_0); 
  assign CDom_sExp = $signed(_T_17); 
  assign _T_18 = sigSum[161:54]; 
  assign _T_19 = ~ _T_18; 
  assign _T_20 = io_fromPreMul_highAlignedSigC[54:53]; 
  assign _T_21 = sigSum[159:55]; 
  assign _T_22 = {1'h0,_T_20}; 
  assign _T_23 = {_T_22,_T_21}; 
  assign CDom_absSigSum = io_fromPreMul_doSubMags ? _T_19 : _T_23; 
  assign _T_24 = sigSum[53:1]; 
  assign _T_25 = ~ _T_24; 
  assign _T_26 = _T_25 != 53'h0; 
  assign _T_27 = sigSum[54:1]; 
  assign _T_28 = _T_27 != 54'h0; 
  assign CDom_absSigSumExtra = io_fromPreMul_doSubMags ? _T_26 : _T_28; 
  assign _GEN_1 = {{63'd0}, CDom_absSigSum}; 
  assign _T_29 = _GEN_1 << io_fromPreMul_CDom_CAlignDist; 
  assign CDom_mainSig = _T_29[107:50]; 
  assign _T_30 = CDom_absSigSum[52:0]; 
  assign _GEN_2 = {{2'd0}, _T_30}; 
  assign _T_31 = _GEN_2 << 2; 
  assign _T_52 = _T_31[3:0]; 
  assign _T_53 = _T_52 != 4'h0; 
  assign _T_54 = _T_31[7:4]; 
  assign _T_55 = _T_54 != 4'h0; 
  assign _T_56 = _T_31[11:8]; 
  assign _T_57 = _T_56 != 4'h0; 
  assign _T_58 = _T_31[15:12]; 
  assign _T_59 = _T_58 != 4'h0; 
  assign _T_60 = _T_31[19:16]; 
  assign _T_61 = _T_60 != 4'h0; 
  assign _T_62 = _T_31[23:20]; 
  assign _T_63 = _T_62 != 4'h0; 
  assign _T_64 = _T_31[27:24]; 
  assign _T_65 = _T_64 != 4'h0; 
  assign _T_66 = _T_31[31:28]; 
  assign _T_67 = _T_66 != 4'h0; 
  assign _T_68 = _T_31[35:32]; 
  assign _T_69 = _T_68 != 4'h0; 
  assign _T_70 = _T_31[39:36]; 
  assign _T_71 = _T_70 != 4'h0; 
  assign _T_72 = _T_31[43:40]; 
  assign _T_73 = _T_72 != 4'h0; 
  assign _T_74 = _T_31[47:44]; 
  assign _T_75 = _T_74 != 4'h0; 
  assign _T_76 = _T_31[51:48]; 
  assign _T_77 = _T_76 != 4'h0; 
  assign _T_78 = _T_31[54:52]; 
  assign _T_79 = _T_78 != 3'h0; 
  assign _T_80 = {_T_57,_T_55}; 
  assign _T_81 = {_T_80,_T_53}; 
  assign _T_82 = {_T_61,_T_59}; 
  assign _T_83 = {_T_65,_T_63}; 
  assign _T_84 = {_T_83,_T_82}; 
  assign _T_85 = {_T_84,_T_81}; 
  assign _T_86 = {_T_71,_T_69}; 
  assign _T_87 = {_T_86,_T_67}; 
  assign _T_88 = {_T_75,_T_73}; 
  assign _T_89 = {_T_79,_T_77}; 
  assign _T_90 = {_T_89,_T_88}; 
  assign _T_91 = {_T_90,_T_87}; 
  assign _T_92 = {_T_91,_T_85}; 
  assign _T_93 = io_fromPreMul_CDom_CAlignDist[5:2]; 
  assign _T_94 = ~ _T_93; 
  assign _T_95 = $signed(-17'sh10000) >>> _T_94; 
  assign _T_96 = _T_95[13:1]; 
  assign _T_97 = _T_96[7:0]; 
  assign _T_100 = _T_97[7:4]; 
  assign _T_101 = {{4'd0}, _T_100}; 
  assign _T_102 = _T_97[3:0]; 
  assign _GEN_3 = {{4'd0}, _T_102}; 
  assign _T_103 = _GEN_3 << 4; 
  assign _T_105 = _T_103 & 8'hf0; 
  assign _T_106 = _T_101 | _T_105; 
  assign _T_110 = _T_106[7:2]; 
  assign _GEN_4 = {{2'd0}, _T_110}; 
  assign _T_111 = _GEN_4 & 8'h33; 
  assign _T_112 = _T_106[5:0]; 
  assign _GEN_5 = {{2'd0}, _T_112}; 
  assign _T_113 = _GEN_5 << 2; 
  assign _T_115 = _T_113 & 8'hcc; 
  assign _T_116 = _T_111 | _T_115; 
  assign _T_120 = _T_116[7:1]; 
  assign _GEN_6 = {{1'd0}, _T_120}; 
  assign _T_121 = _GEN_6 & 8'h55; 
  assign _T_122 = _T_116[6:0]; 
  assign _GEN_7 = {{1'd0}, _T_122}; 
  assign _T_123 = _GEN_7 << 1; 
  assign _T_125 = _T_123 & 8'haa; 
  assign _T_126 = _T_121 | _T_125; 
  assign _T_127 = _T_96[12:8]; 
  assign _T_128 = _T_127[3:0]; 
  assign _T_129 = _T_128[1:0]; 
  assign _T_130 = _T_129[0]; 
  assign _T_131 = _T_129[1]; 
  assign _T_132 = {_T_130,_T_131}; 
  assign _T_133 = _T_128[3:2]; 
  assign _T_134 = _T_133[0]; 
  assign _T_135 = _T_133[1]; 
  assign _T_136 = {_T_134,_T_135}; 
  assign _T_137 = {_T_132,_T_136}; 
  assign _T_138 = _T_127[4]; 
  assign _T_139 = {_T_137,_T_138}; 
  assign _T_140 = {_T_126,_T_139}; 
  assign _GEN_8 = {{1'd0}, _T_140}; 
  assign _T_141 = _T_92 & _GEN_8; 
  assign CDom_reduced4SigExtra = _T_141 != 14'h0; 
  assign _T_142 = CDom_mainSig[57:3]; 
  assign _T_143 = CDom_mainSig[2:0]; 
  assign _T_144 = _T_143 != 3'h0; 
  assign _T_145 = _T_144 | CDom_reduced4SigExtra; 
  assign _T_146 = _T_145 | CDom_absSigSumExtra; 
  assign CDom_sig = {_T_142,_T_146}; 
  assign notCDom_signSigSum = sigSum[109]; 
  assign _T_147 = sigSum[108:0]; 
  assign _T_148 = ~ _T_147; 
  assign _GEN_9 = {{108'd0}, io_fromPreMul_doSubMags}; 
  assign _T_151 = _T_147 + _GEN_9; 
  assign notCDom_absSigSum = notCDom_signSigSum ? _T_148 : _T_151; 
  assign _T_213 = notCDom_absSigSum[1:0]; 
  assign _T_214 = _T_213 != 2'h0; 
  assign _T_215 = notCDom_absSigSum[3:2]; 
  assign _T_216 = _T_215 != 2'h0; 
  assign _T_217 = notCDom_absSigSum[5:4]; 
  assign _T_218 = _T_217 != 2'h0; 
  assign _T_219 = notCDom_absSigSum[7:6]; 
  assign _T_220 = _T_219 != 2'h0; 
  assign _T_221 = notCDom_absSigSum[9:8]; 
  assign _T_222 = _T_221 != 2'h0; 
  assign _T_223 = notCDom_absSigSum[11:10]; 
  assign _T_224 = _T_223 != 2'h0; 
  assign _T_225 = notCDom_absSigSum[13:12]; 
  assign _T_226 = _T_225 != 2'h0; 
  assign _T_227 = notCDom_absSigSum[15:14]; 
  assign _T_228 = _T_227 != 2'h0; 
  assign _T_229 = notCDom_absSigSum[17:16]; 
  assign _T_230 = _T_229 != 2'h0; 
  assign _T_231 = notCDom_absSigSum[19:18]; 
  assign _T_232 = _T_231 != 2'h0; 
  assign _T_233 = notCDom_absSigSum[21:20]; 
  assign _T_234 = _T_233 != 2'h0; 
  assign _T_235 = notCDom_absSigSum[23:22]; 
  assign _T_236 = _T_235 != 2'h0; 
  assign _T_237 = notCDom_absSigSum[25:24]; 
  assign _T_238 = _T_237 != 2'h0; 
  assign _T_239 = notCDom_absSigSum[27:26]; 
  assign _T_240 = _T_239 != 2'h0; 
  assign _T_241 = notCDom_absSigSum[29:28]; 
  assign _T_242 = _T_241 != 2'h0; 
  assign _T_243 = notCDom_absSigSum[31:30]; 
  assign _T_244 = _T_243 != 2'h0; 
  assign _T_245 = notCDom_absSigSum[33:32]; 
  assign _T_246 = _T_245 != 2'h0; 
  assign _T_247 = notCDom_absSigSum[35:34]; 
  assign _T_248 = _T_247 != 2'h0; 
  assign _T_249 = notCDom_absSigSum[37:36]; 
  assign _T_250 = _T_249 != 2'h0; 
  assign _T_251 = notCDom_absSigSum[39:38]; 
  assign _T_252 = _T_251 != 2'h0; 
  assign _T_253 = notCDom_absSigSum[41:40]; 
  assign _T_254 = _T_253 != 2'h0; 
  assign _T_255 = notCDom_absSigSum[43:42]; 
  assign _T_256 = _T_255 != 2'h0; 
  assign _T_257 = notCDom_absSigSum[45:44]; 
  assign _T_258 = _T_257 != 2'h0; 
  assign _T_259 = notCDom_absSigSum[47:46]; 
  assign _T_260 = _T_259 != 2'h0; 
  assign _T_261 = notCDom_absSigSum[49:48]; 
  assign _T_262 = _T_261 != 2'h0; 
  assign _T_263 = notCDom_absSigSum[51:50]; 
  assign _T_264 = _T_263 != 2'h0; 
  assign _T_265 = notCDom_absSigSum[53:52]; 
  assign _T_266 = _T_265 != 2'h0; 
  assign _T_267 = notCDom_absSigSum[55:54]; 
  assign _T_268 = _T_267 != 2'h0; 
  assign _T_269 = notCDom_absSigSum[57:56]; 
  assign _T_270 = _T_269 != 2'h0; 
  assign _T_271 = notCDom_absSigSum[59:58]; 
  assign _T_272 = _T_271 != 2'h0; 
  assign _T_273 = notCDom_absSigSum[61:60]; 
  assign _T_274 = _T_273 != 2'h0; 
  assign _T_275 = notCDom_absSigSum[63:62]; 
  assign _T_276 = _T_275 != 2'h0; 
  assign _T_277 = notCDom_absSigSum[65:64]; 
  assign _T_278 = _T_277 != 2'h0; 
  assign _T_279 = notCDom_absSigSum[67:66]; 
  assign _T_280 = _T_279 != 2'h0; 
  assign _T_281 = notCDom_absSigSum[69:68]; 
  assign _T_282 = _T_281 != 2'h0; 
  assign _T_283 = notCDom_absSigSum[71:70]; 
  assign _T_284 = _T_283 != 2'h0; 
  assign _T_285 = notCDom_absSigSum[73:72]; 
  assign _T_286 = _T_285 != 2'h0; 
  assign _T_287 = notCDom_absSigSum[75:74]; 
  assign _T_288 = _T_287 != 2'h0; 
  assign _T_289 = notCDom_absSigSum[77:76]; 
  assign _T_290 = _T_289 != 2'h0; 
  assign _T_291 = notCDom_absSigSum[79:78]; 
  assign _T_292 = _T_291 != 2'h0; 
  assign _T_293 = notCDom_absSigSum[81:80]; 
  assign _T_294 = _T_293 != 2'h0; 
  assign _T_295 = notCDom_absSigSum[83:82]; 
  assign _T_296 = _T_295 != 2'h0; 
  assign _T_297 = notCDom_absSigSum[85:84]; 
  assign _T_298 = _T_297 != 2'h0; 
  assign _T_299 = notCDom_absSigSum[87:86]; 
  assign _T_300 = _T_299 != 2'h0; 
  assign _T_301 = notCDom_absSigSum[89:88]; 
  assign _T_302 = _T_301 != 2'h0; 
  assign _T_303 = notCDom_absSigSum[91:90]; 
  assign _T_304 = _T_303 != 2'h0; 
  assign _T_305 = notCDom_absSigSum[93:92]; 
  assign _T_306 = _T_305 != 2'h0; 
  assign _T_307 = notCDom_absSigSum[95:94]; 
  assign _T_308 = _T_307 != 2'h0; 
  assign _T_309 = notCDom_absSigSum[97:96]; 
  assign _T_310 = _T_309 != 2'h0; 
  assign _T_311 = notCDom_absSigSum[99:98]; 
  assign _T_312 = _T_311 != 2'h0; 
  assign _T_313 = notCDom_absSigSum[101:100]; 
  assign _T_314 = _T_313 != 2'h0; 
  assign _T_315 = notCDom_absSigSum[103:102]; 
  assign _T_316 = _T_315 != 2'h0; 
  assign _T_317 = notCDom_absSigSum[105:104]; 
  assign _T_318 = _T_317 != 2'h0; 
  assign _T_319 = notCDom_absSigSum[107:106]; 
  assign _T_320 = _T_319 != 2'h0; 
  assign _T_321 = notCDom_absSigSum[108]; 
  assign _T_323 = {_T_218,_T_216}; 
  assign _T_324 = {_T_323,_T_214}; 
  assign _T_325 = {_T_224,_T_222}; 
  assign _T_326 = {_T_325,_T_220}; 
  assign _T_327 = {_T_326,_T_324}; 
  assign _T_328 = {_T_230,_T_228}; 
  assign _T_329 = {_T_328,_T_226}; 
  assign _T_330 = {_T_234,_T_232}; 
  assign _T_331 = {_T_238,_T_236}; 
  assign _T_332 = {_T_331,_T_330}; 
  assign _T_333 = {_T_332,_T_329}; 
  assign _T_334 = {_T_333,_T_327}; 
  assign _T_335 = {_T_244,_T_242}; 
  assign _T_336 = {_T_335,_T_240}; 
  assign _T_337 = {_T_248,_T_246}; 
  assign _T_338 = {_T_252,_T_250}; 
  assign _T_339 = {_T_338,_T_337}; 
  assign _T_340 = {_T_339,_T_336}; 
  assign _T_341 = {_T_258,_T_256}; 
  assign _T_342 = {_T_341,_T_254}; 
  assign _T_343 = {_T_262,_T_260}; 
  assign _T_344 = {_T_266,_T_264}; 
  assign _T_345 = {_T_344,_T_343}; 
  assign _T_346 = {_T_345,_T_342}; 
  assign _T_347 = {_T_346,_T_340}; 
  assign _T_348 = {_T_347,_T_334}; 
  assign _T_349 = {_T_272,_T_270}; 
  assign _T_350 = {_T_349,_T_268}; 
  assign _T_351 = {_T_276,_T_274}; 
  assign _T_352 = {_T_280,_T_278}; 
  assign _T_353 = {_T_352,_T_351}; 
  assign _T_354 = {_T_353,_T_350}; 
  assign _T_355 = {_T_286,_T_284}; 
  assign _T_356 = {_T_355,_T_282}; 
  assign _T_357 = {_T_290,_T_288}; 
  assign _T_358 = {_T_294,_T_292}; 
  assign _T_359 = {_T_358,_T_357}; 
  assign _T_360 = {_T_359,_T_356}; 
  assign _T_361 = {_T_360,_T_354}; 
  assign _T_362 = {_T_300,_T_298}; 
  assign _T_363 = {_T_362,_T_296}; 
  assign _T_364 = {_T_304,_T_302}; 
  assign _T_365 = {_T_308,_T_306}; 
  assign _T_366 = {_T_365,_T_364}; 
  assign _T_367 = {_T_366,_T_363}; 
  assign _T_368 = {_T_314,_T_312}; 
  assign _T_369 = {_T_368,_T_310}; 
  assign _T_370 = {_T_318,_T_316}; 
  assign _T_371 = {_T_321,_T_320}; 
  assign _T_372 = {_T_371,_T_370}; 
  assign _T_373 = {_T_372,_T_369}; 
  assign _T_374 = {_T_373,_T_367}; 
  assign _T_375 = {_T_374,_T_361}; 
  assign notCDom_reduced2AbsSigSum = {_T_375,_T_348}; 
  assign _T_376 = notCDom_reduced2AbsSigSum[31:0]; 
  assign _T_379 = _T_376[31:16]; 
  assign _T_380 = {{16'd0}, _T_379}; 
  assign _T_381 = _T_376[15:0]; 
  assign _GEN_10 = {{16'd0}, _T_381}; 
  assign _T_382 = _GEN_10 << 16; 
  assign _T_384 = _T_382 & 32'hffff0000; 
  assign _T_385 = _T_380 | _T_384; 
  assign _T_389 = _T_385[31:8]; 
  assign _GEN_11 = {{8'd0}, _T_389}; 
  assign _T_390 = _GEN_11 & 32'hff00ff; 
  assign _T_391 = _T_385[23:0]; 
  assign _GEN_12 = {{8'd0}, _T_391}; 
  assign _T_392 = _GEN_12 << 8; 
  assign _T_394 = _T_392 & 32'hff00ff00; 
  assign _T_395 = _T_390 | _T_394; 
  assign _T_399 = _T_395[31:4]; 
  assign _GEN_13 = {{4'd0}, _T_399}; 
  assign _T_400 = _GEN_13 & 32'hf0f0f0f; 
  assign _T_401 = _T_395[27:0]; 
  assign _GEN_14 = {{4'd0}, _T_401}; 
  assign _T_402 = _GEN_14 << 4; 
  assign _T_404 = _T_402 & 32'hf0f0f0f0; 
  assign _T_405 = _T_400 | _T_404; 
  assign _T_409 = _T_405[31:2]; 
  assign _GEN_15 = {{2'd0}, _T_409}; 
  assign _T_410 = _GEN_15 & 32'h33333333; 
  assign _T_411 = _T_405[29:0]; 
  assign _GEN_16 = {{2'd0}, _T_411}; 
  assign _T_412 = _GEN_16 << 2; 
  assign _T_414 = _T_412 & 32'hcccccccc; 
  assign _T_415 = _T_410 | _T_414; 
  assign _T_419 = _T_415[31:1]; 
  assign _GEN_17 = {{1'd0}, _T_419}; 
  assign _T_420 = _GEN_17 & 32'h55555555; 
  assign _T_421 = _T_415[30:0]; 
  assign _GEN_18 = {{1'd0}, _T_421}; 
  assign _T_422 = _GEN_18 << 1; 
  assign _T_424 = _T_422 & 32'haaaaaaaa; 
  assign _T_425 = _T_420 | _T_424; 
  assign _T_426 = notCDom_reduced2AbsSigSum[54:32]; 
  assign _T_427 = _T_426[15:0]; 
  assign _T_430 = _T_427[15:8]; 
  assign _T_431 = {{8'd0}, _T_430}; 
  assign _T_432 = _T_427[7:0]; 
  assign _GEN_19 = {{8'd0}, _T_432}; 
  assign _T_433 = _GEN_19 << 8; 
  assign _T_435 = _T_433 & 16'hff00; 
  assign _T_436 = _T_431 | _T_435; 
  assign _T_440 = _T_436[15:4]; 
  assign _GEN_20 = {{4'd0}, _T_440}; 
  assign _T_441 = _GEN_20 & 16'hf0f; 
  assign _T_442 = _T_436[11:0]; 
  assign _GEN_21 = {{4'd0}, _T_442}; 
  assign _T_443 = _GEN_21 << 4; 
  assign _T_445 = _T_443 & 16'hf0f0; 
  assign _T_446 = _T_441 | _T_445; 
  assign _T_450 = _T_446[15:2]; 
  assign _GEN_22 = {{2'd0}, _T_450}; 
  assign _T_451 = _GEN_22 & 16'h3333; 
  assign _T_452 = _T_446[13:0]; 
  assign _GEN_23 = {{2'd0}, _T_452}; 
  assign _T_453 = _GEN_23 << 2; 
  assign _T_455 = _T_453 & 16'hcccc; 
  assign _T_456 = _T_451 | _T_455; 
  assign _T_460 = _T_456[15:1]; 
  assign _GEN_24 = {{1'd0}, _T_460}; 
  assign _T_461 = _GEN_24 & 16'h5555; 
  assign _T_462 = _T_456[14:0]; 
  assign _GEN_25 = {{1'd0}, _T_462}; 
  assign _T_463 = _GEN_25 << 1; 
  assign _T_465 = _T_463 & 16'haaaa; 
  assign _T_466 = _T_461 | _T_465; 
  assign _T_467 = _T_426[22:16]; 
  assign _T_468 = _T_467[3:0]; 
  assign _T_469 = _T_468[1:0]; 
  assign _T_470 = _T_469[0]; 
  assign _T_471 = _T_469[1]; 
  assign _T_472 = {_T_470,_T_471}; 
  assign _T_473 = _T_468[3:2]; 
  assign _T_474 = _T_473[0]; 
  assign _T_475 = _T_473[1]; 
  assign _T_476 = {_T_474,_T_475}; 
  assign _T_477 = {_T_472,_T_476}; 
  assign _T_478 = _T_467[6:4]; 
  assign _T_479 = _T_478[1:0]; 
  assign _T_480 = _T_479[0]; 
  assign _T_481 = _T_479[1]; 
  assign _T_482 = {_T_480,_T_481}; 
  assign _T_483 = _T_478[2]; 
  assign _T_484 = {_T_482,_T_483}; 
  assign _T_485 = {_T_477,_T_484}; 
  assign _T_486 = {_T_466,_T_485}; 
  assign _T_487 = {_T_425,_T_486}; 
  assign _T_488 = _T_487[0]; 
  assign _T_489 = _T_487[1]; 
  assign _T_490 = _T_487[2]; 
  assign _T_491 = _T_487[3]; 
  assign _T_492 = _T_487[4]; 
  assign _T_493 = _T_487[5]; 
  assign _T_494 = _T_487[6]; 
  assign _T_495 = _T_487[7]; 
  assign _T_496 = _T_487[8]; 
  assign _T_497 = _T_487[9]; 
  assign _T_498 = _T_487[10]; 
  assign _T_499 = _T_487[11]; 
  assign _T_500 = _T_487[12]; 
  assign _T_501 = _T_487[13]; 
  assign _T_502 = _T_487[14]; 
  assign _T_503 = _T_487[15]; 
  assign _T_504 = _T_487[16]; 
  assign _T_505 = _T_487[17]; 
  assign _T_506 = _T_487[18]; 
  assign _T_507 = _T_487[19]; 
  assign _T_508 = _T_487[20]; 
  assign _T_509 = _T_487[21]; 
  assign _T_510 = _T_487[22]; 
  assign _T_511 = _T_487[23]; 
  assign _T_512 = _T_487[24]; 
  assign _T_513 = _T_487[25]; 
  assign _T_514 = _T_487[26]; 
  assign _T_515 = _T_487[27]; 
  assign _T_516 = _T_487[28]; 
  assign _T_517 = _T_487[29]; 
  assign _T_518 = _T_487[30]; 
  assign _T_519 = _T_487[31]; 
  assign _T_520 = _T_487[32]; 
  assign _T_521 = _T_487[33]; 
  assign _T_522 = _T_487[34]; 
  assign _T_523 = _T_487[35]; 
  assign _T_524 = _T_487[36]; 
  assign _T_525 = _T_487[37]; 
  assign _T_526 = _T_487[38]; 
  assign _T_527 = _T_487[39]; 
  assign _T_528 = _T_487[40]; 
  assign _T_529 = _T_487[41]; 
  assign _T_530 = _T_487[42]; 
  assign _T_531 = _T_487[43]; 
  assign _T_532 = _T_487[44]; 
  assign _T_533 = _T_487[45]; 
  assign _T_534 = _T_487[46]; 
  assign _T_535 = _T_487[47]; 
  assign _T_536 = _T_487[48]; 
  assign _T_537 = _T_487[49]; 
  assign _T_538 = _T_487[50]; 
  assign _T_539 = _T_487[51]; 
  assign _T_540 = _T_487[52]; 
  assign _T_541 = _T_487[53]; 
  assign _T_543 = _T_541 ? 6'h35 : 6'h36; 
  assign _T_544 = _T_540 ? 6'h34 : _T_543; 
  assign _T_545 = _T_539 ? 6'h33 : _T_544; 
  assign _T_546 = _T_538 ? 6'h32 : _T_545; 
  assign _T_547 = _T_537 ? 6'h31 : _T_546; 
  assign _T_548 = _T_536 ? 6'h30 : _T_547; 
  assign _T_549 = _T_535 ? 6'h2f : _T_548; 
  assign _T_550 = _T_534 ? 6'h2e : _T_549; 
  assign _T_551 = _T_533 ? 6'h2d : _T_550; 
  assign _T_552 = _T_532 ? 6'h2c : _T_551; 
  assign _T_553 = _T_531 ? 6'h2b : _T_552; 
  assign _T_554 = _T_530 ? 6'h2a : _T_553; 
  assign _T_555 = _T_529 ? 6'h29 : _T_554; 
  assign _T_556 = _T_528 ? 6'h28 : _T_555; 
  assign _T_557 = _T_527 ? 6'h27 : _T_556; 
  assign _T_558 = _T_526 ? 6'h26 : _T_557; 
  assign _T_559 = _T_525 ? 6'h25 : _T_558; 
  assign _T_560 = _T_524 ? 6'h24 : _T_559; 
  assign _T_561 = _T_523 ? 6'h23 : _T_560; 
  assign _T_562 = _T_522 ? 6'h22 : _T_561; 
  assign _T_563 = _T_521 ? 6'h21 : _T_562; 
  assign _T_564 = _T_520 ? 6'h20 : _T_563; 
  assign _T_565 = _T_519 ? 6'h1f : _T_564; 
  assign _T_566 = _T_518 ? 6'h1e : _T_565; 
  assign _T_567 = _T_517 ? 6'h1d : _T_566; 
  assign _T_568 = _T_516 ? 6'h1c : _T_567; 
  assign _T_569 = _T_515 ? 6'h1b : _T_568; 
  assign _T_570 = _T_514 ? 6'h1a : _T_569; 
  assign _T_571 = _T_513 ? 6'h19 : _T_570; 
  assign _T_572 = _T_512 ? 6'h18 : _T_571; 
  assign _T_573 = _T_511 ? 6'h17 : _T_572; 
  assign _T_574 = _T_510 ? 6'h16 : _T_573; 
  assign _T_575 = _T_509 ? 6'h15 : _T_574; 
  assign _T_576 = _T_508 ? 6'h14 : _T_575; 
  assign _T_577 = _T_507 ? 6'h13 : _T_576; 
  assign _T_578 = _T_506 ? 6'h12 : _T_577; 
  assign _T_579 = _T_505 ? 6'h11 : _T_578; 
  assign _T_580 = _T_504 ? 6'h10 : _T_579; 
  assign _T_581 = _T_503 ? 6'hf : _T_580; 
  assign _T_582 = _T_502 ? 6'he : _T_581; 
  assign _T_583 = _T_501 ? 6'hd : _T_582; 
  assign _T_584 = _T_500 ? 6'hc : _T_583; 
  assign _T_585 = _T_499 ? 6'hb : _T_584; 
  assign _T_586 = _T_498 ? 6'ha : _T_585; 
  assign _T_587 = _T_497 ? 6'h9 : _T_586; 
  assign _T_588 = _T_496 ? 6'h8 : _T_587; 
  assign _T_589 = _T_495 ? 6'h7 : _T_588; 
  assign _T_590 = _T_494 ? 6'h6 : _T_589; 
  assign _T_591 = _T_493 ? 6'h5 : _T_590; 
  assign _T_592 = _T_492 ? 6'h4 : _T_591; 
  assign _T_593 = _T_491 ? 6'h3 : _T_592; 
  assign _T_594 = _T_490 ? 6'h2 : _T_593; 
  assign _T_595 = _T_489 ? 6'h1 : _T_594; 
  assign notCDom_normDistReduced2 = _T_488 ? 6'h0 : _T_595; 
  assign _GEN_26 = {{1'd0}, notCDom_normDistReduced2}; 
  assign notCDom_nearNormDist = _GEN_26 << 1; 
  assign _T_596 = {1'b0,$signed(notCDom_nearNormDist)}; 
  assign _GEN_27 = {{5{_T_596[7]}},_T_596}; 
  assign _T_598 = $signed(io_fromPreMul_sExpSum) - $signed(_GEN_27); 
  assign notCDom_sExp = $signed(_T_598); 
  assign _GEN_28 = {{127'd0}, notCDom_absSigSum}; 
  assign _T_599 = _GEN_28 << notCDom_nearNormDist; 
  assign notCDom_mainSig = _T_599[109:52]; 
  assign _T_600 = notCDom_reduced2AbsSigSum[26:0]; 
  assign _T_622 = _T_600[1:0]; 
  assign _T_623 = _T_622 != 2'h0; 
  assign _T_624 = _T_600[3:2]; 
  assign _T_625 = _T_624 != 2'h0; 
  assign _T_626 = _T_600[5:4]; 
  assign _T_627 = _T_626 != 2'h0; 
  assign _T_628 = _T_600[7:6]; 
  assign _T_629 = _T_628 != 2'h0; 
  assign _T_630 = _T_600[9:8]; 
  assign _T_631 = _T_630 != 2'h0; 
  assign _T_632 = _T_600[11:10]; 
  assign _T_633 = _T_632 != 2'h0; 
  assign _T_634 = _T_600[13:12]; 
  assign _T_635 = _T_634 != 2'h0; 
  assign _T_636 = _T_600[15:14]; 
  assign _T_637 = _T_636 != 2'h0; 
  assign _T_638 = _T_600[17:16]; 
  assign _T_639 = _T_638 != 2'h0; 
  assign _T_640 = _T_600[19:18]; 
  assign _T_641 = _T_640 != 2'h0; 
  assign _T_642 = _T_600[21:20]; 
  assign _T_643 = _T_642 != 2'h0; 
  assign _T_644 = _T_600[23:22]; 
  assign _T_645 = _T_644 != 2'h0; 
  assign _T_646 = _T_600[25:24]; 
  assign _T_647 = _T_646 != 2'h0; 
  assign _T_648 = _T_600[26]; 
  assign _T_650 = {_T_627,_T_625}; 
  assign _T_651 = {_T_650,_T_623}; 
  assign _T_652 = {_T_631,_T_629}; 
  assign _T_653 = {_T_635,_T_633}; 
  assign _T_654 = {_T_653,_T_652}; 
  assign _T_655 = {_T_654,_T_651}; 
  assign _T_656 = {_T_641,_T_639}; 
  assign _T_657 = {_T_656,_T_637}; 
  assign _T_658 = {_T_645,_T_643}; 
  assign _T_659 = {_T_648,_T_647}; 
  assign _T_660 = {_T_659,_T_658}; 
  assign _T_661 = {_T_660,_T_657}; 
  assign _T_662 = {_T_661,_T_655}; 
  assign _T_663 = notCDom_normDistReduced2[5:1]; 
  assign _T_664 = ~ _T_663; 
  assign _T_665 = $signed(-33'sh100000000) >>> _T_664; 
  assign _T_666 = _T_665[13:1]; 
  assign _T_667 = _T_666[7:0]; 
  assign _T_670 = _T_667[7:4]; 
  assign _T_671 = {{4'd0}, _T_670}; 
  assign _T_672 = _T_667[3:0]; 
  assign _GEN_29 = {{4'd0}, _T_672}; 
  assign _T_673 = _GEN_29 << 4; 
  assign _T_675 = _T_673 & 8'hf0; 
  assign _T_676 = _T_671 | _T_675; 
  assign _T_680 = _T_676[7:2]; 
  assign _GEN_30 = {{2'd0}, _T_680}; 
  assign _T_681 = _GEN_30 & 8'h33; 
  assign _T_682 = _T_676[5:0]; 
  assign _GEN_31 = {{2'd0}, _T_682}; 
  assign _T_683 = _GEN_31 << 2; 
  assign _T_685 = _T_683 & 8'hcc; 
  assign _T_686 = _T_681 | _T_685; 
  assign _T_690 = _T_686[7:1]; 
  assign _GEN_32 = {{1'd0}, _T_690}; 
  assign _T_691 = _GEN_32 & 8'h55; 
  assign _T_692 = _T_686[6:0]; 
  assign _GEN_33 = {{1'd0}, _T_692}; 
  assign _T_693 = _GEN_33 << 1; 
  assign _T_695 = _T_693 & 8'haa; 
  assign _T_696 = _T_691 | _T_695; 
  assign _T_697 = _T_666[12:8]; 
  assign _T_698 = _T_697[3:0]; 
  assign _T_699 = _T_698[1:0]; 
  assign _T_700 = _T_699[0]; 
  assign _T_701 = _T_699[1]; 
  assign _T_702 = {_T_700,_T_701}; 
  assign _T_703 = _T_698[3:2]; 
  assign _T_704 = _T_703[0]; 
  assign _T_705 = _T_703[1]; 
  assign _T_706 = {_T_704,_T_705}; 
  assign _T_707 = {_T_702,_T_706}; 
  assign _T_708 = _T_697[4]; 
  assign _T_709 = {_T_707,_T_708}; 
  assign _T_710 = {_T_696,_T_709}; 
  assign _GEN_34 = {{1'd0}, _T_710}; 
  assign _T_711 = _T_662 & _GEN_34; 
  assign notCDom_reduced4SigExtra = _T_711 != 14'h0; 
  assign _T_712 = notCDom_mainSig[57:3]; 
  assign _T_713 = notCDom_mainSig[2:0]; 
  assign _T_714 = _T_713 != 3'h0; 
  assign _T_715 = _T_714 | notCDom_reduced4SigExtra; 
  assign notCDom_sig = {_T_712,_T_715}; 
  assign _T_716 = notCDom_sig[55:54]; 
  assign notCDom_completeCancellation = _T_716 == 2'h0; 
  assign _T_717 = io_fromPreMul_signProd ^ notCDom_signSigSum; 
  assign notCDom_sign = notCDom_completeCancellation ? roundingMode_min : _T_717; 
  assign notNaN_isInfProd = io_fromPreMul_isInfA | io_fromPreMul_isInfB; 
  assign notNaN_isInfOut = notNaN_isInfProd | io_fromPreMul_isInfC; 
  assign _T_718 = io_fromPreMul_isZeroA | io_fromPreMul_isZeroB; 
  assign notNaN_addZeros = _T_718 & io_fromPreMul_isZeroC; 
  assign _T_719 = io_fromPreMul_isInfA & io_fromPreMul_isZeroB; 
  assign _T_720 = io_fromPreMul_isSigNaNAny | _T_719; 
  assign _T_721 = io_fromPreMul_isZeroA & io_fromPreMul_isInfB; 
  assign _T_722 = _T_720 | _T_721; 
  assign _T_723 = io_fromPreMul_isNaNAOrB == 1'h0; 
  assign _T_725 = _T_723 & notNaN_isInfProd; 
  assign _T_726 = _T_725 & io_fromPreMul_isInfC; 
  assign _T_727 = _T_726 & io_fromPreMul_doSubMags; 
  assign _T_730 = io_fromPreMul_CIsDominant == 1'h0; 
  assign _T_731 = _T_730 & notCDom_completeCancellation; 
  assign _T_733 = notNaN_isInfProd & io_fromPreMul_signProd; 
  assign _T_734 = io_fromPreMul_isInfC & CDom_sign; 
  assign _T_735 = _T_733 | _T_734; 
  assign _T_736 = roundingMode_min == 1'h0; 
  assign _T_737 = notNaN_addZeros & _T_736; 
  assign _T_738 = _T_737 & io_fromPreMul_signProd; 
  assign _T_739 = _T_738 & CDom_sign; 
  assign _T_740 = _T_735 | _T_739; 
  assign _T_741 = notNaN_addZeros & roundingMode_min; 
  assign _T_742 = io_fromPreMul_signProd | CDom_sign; 
  assign _T_743 = _T_741 & _T_742; 
  assign _T_744 = _T_740 | _T_743; 
  assign _T_745 = notNaN_isInfOut == 1'h0; 
  assign _T_746 = notNaN_addZeros == 1'h0; 
  assign _T_747 = _T_745 & _T_746; 
  assign _T_748 = io_fromPreMul_CIsDominant ? CDom_sign : notCDom_sign; 
  assign _T_749 = _T_747 & _T_748; 
  assign io_invalidExc = _T_722 | _T_727; 
  assign io_rawOut_isNaN = io_fromPreMul_isNaNAOrB | io_fromPreMul_isNaNC; 
  assign io_rawOut_isInf = notNaN_isInfProd | io_fromPreMul_isInfC; 
  assign io_rawOut_isZero = notNaN_addZeros | _T_731; 
  assign io_rawOut_sign = _T_744 | _T_749; 
  assign io_rawOut_sExp = io_fromPreMul_CIsDominant ? $signed(CDom_sExp) : $signed(notCDom_sExp); 
  assign io_rawOut_sig = io_fromPreMul_CIsDominant ? CDom_sig : notCDom_sig; 
endmodule