module AXI4Fragmenter( 
  input         clock, 
  input         reset, 
  output        auto_in_aw_ready, 
  input         auto_in_aw_valid, 
  input  [37:0] auto_in_aw_bits_addr, 
  input  [7:0]  auto_in_aw_bits_len, 
  input  [2:0]  auto_in_aw_bits_size, 
  input  [1:0]  auto_in_aw_bits_burst, 
  output        auto_in_w_ready, 
  input         auto_in_w_valid, 
  input  [63:0] auto_in_w_bits_data, 
  input  [7:0]  auto_in_w_bits_strb, 
  input         auto_in_w_bits_last, 
  input         auto_in_b_ready, 
  output        auto_in_b_valid, 
  output [1:0]  auto_in_b_bits_resp, 
  output        auto_in_ar_ready, 
  input         auto_in_ar_valid, 
  input  [37:0] auto_in_ar_bits_addr, 
  input  [7:0]  auto_in_ar_bits_len, 
  input  [2:0]  auto_in_ar_bits_size, 
  input  [1:0]  auto_in_ar_bits_burst, 
  input         auto_in_r_ready, 
  output        auto_in_r_valid, 
  output [63:0] auto_in_r_bits_data, 
  output [1:0]  auto_in_r_bits_resp, 
  output        auto_in_r_bits_last, 
  input         auto_out_aw_ready, 
  output        auto_out_aw_valid, 
  output        auto_out_aw_bits_id, 
  output [37:0] auto_out_aw_bits_addr, 
  output [7:0]  auto_out_aw_bits_len, 
  output [2:0]  auto_out_aw_bits_size, 
  output        auto_out_aw_bits_user, 
  input         auto_out_w_ready, 
  output        auto_out_w_valid, 
  output [63:0] auto_out_w_bits_data, 
  output [7:0]  auto_out_w_bits_strb, 
  output        auto_out_w_bits_last, 
  output        auto_out_b_ready, 
  input         auto_out_b_valid, 
  input  [1:0]  auto_out_b_bits_resp, 
  input         auto_out_b_bits_user, 
  input         auto_out_ar_ready, 
  output        auto_out_ar_valid, 
  output        auto_out_ar_bits_id, 
  output [37:0] auto_out_ar_bits_addr, 
  output [7:0]  auto_out_ar_bits_len, 
  output [2:0]  auto_out_ar_bits_size, 
  output        auto_out_ar_bits_user, 
  output        auto_out_r_ready, 
  input         auto_out_r_valid, 
  input  [63:0] auto_out_r_bits_data, 
  input  [1:0]  auto_out_r_bits_resp, 
  input         auto_out_r_bits_user, 
  input         auto_out_r_bits_last 
);
  wire  Queue_clock; 
  wire  Queue_reset; 
  wire  Queue_io_enq_ready; 
  wire  Queue_io_enq_valid; 
  wire [37:0] Queue_io_enq_bits_addr; 
  wire [7:0] Queue_io_enq_bits_len; 
  wire [2:0] Queue_io_enq_bits_size; 
  wire [1:0] Queue_io_enq_bits_burst; 
  wire  Queue_io_deq_ready; 
  wire  Queue_io_deq_valid; 
  wire  Queue_io_deq_bits_id; 
  wire [37:0] Queue_io_deq_bits_addr; 
  wire [7:0] Queue_io_deq_bits_len; 
  wire [2:0] Queue_io_deq_bits_size; 
  wire [1:0] Queue_io_deq_bits_burst; 
  wire  Queue_1_clock; 
  wire  Queue_1_reset; 
  wire  Queue_1_io_enq_ready; 
  wire  Queue_1_io_enq_valid; 
  wire [37:0] Queue_1_io_enq_bits_addr; 
  wire [7:0] Queue_1_io_enq_bits_len; 
  wire [2:0] Queue_1_io_enq_bits_size; 
  wire [1:0] Queue_1_io_enq_bits_burst; 
  wire  Queue_1_io_deq_ready; 
  wire  Queue_1_io_deq_valid; 
  wire  Queue_1_io_deq_bits_id; 
  wire [37:0] Queue_1_io_deq_bits_addr; 
  wire [7:0] Queue_1_io_deq_bits_len; 
  wire [2:0] Queue_1_io_deq_bits_size; 
  wire [1:0] Queue_1_io_deq_bits_burst; 
  wire  Queue_2_clock; 
  wire  Queue_2_reset; 
  wire  Queue_2_io_enq_ready; 
  wire  Queue_2_io_enq_valid; 
  wire [63:0] Queue_2_io_enq_bits_data; 
  wire [7:0] Queue_2_io_enq_bits_strb; 
  wire  Queue_2_io_enq_bits_last; 
  wire  Queue_2_io_deq_ready; 
  wire  Queue_2_io_deq_valid; 
  wire [63:0] Queue_2_io_deq_bits_data; 
  wire [7:0] Queue_2_io_deq_bits_strb; 
  wire  Queue_2_io_deq_bits_last; 
  reg  _T_234; 
  reg [31:0] _RAND_0;
  reg [37:0] _T_236; 
  reg [63:0] _RAND_1;
  reg [7:0] _T_238; 
  reg [31:0] _RAND_2;
  wire [7:0] _T_225_bits_len; 
  wire [7:0] _T_239; 
  wire [37:0] _T_225_bits_addr; 
  wire [37:0] _T_240; 
  wire [34:0] _T_242; 
  wire [7:0] _T_243; 
  wire [37:0] _T_244; 
  wire [38:0] _T_245; 
  wire [38:0] _T_246; 
  wire [38:0] _T_247; 
  wire  _T_248; 
  wire [37:0] _T_249; 
  wire [38:0] _T_250; 
  wire [38:0] _T_251; 
  wire [38:0] _T_252; 
  wire  _T_253; 
  wire [37:0] _T_254; 
  wire [38:0] _T_255; 
  wire [38:0] _T_256; 
  wire [38:0] _T_257; 
  wire  _T_258; 
  wire [38:0] _T_260; 
  wire [38:0] _T_261; 
  wire [38:0] _T_262; 
  wire  _T_263; 
  wire [37:0] _T_264; 
  wire [38:0] _T_265; 
  wire [38:0] _T_266; 
  wire [38:0] _T_267; 
  wire  _T_268; 
  wire [38:0] _T_271; 
  wire [38:0] _T_272; 
  wire  _T_273; 
  wire [37:0] _T_274; 
  wire [38:0] _T_275; 
  wire [38:0] _T_276; 
  wire [38:0] _T_277; 
  wire  _T_278; 
  wire  _T_279; 
  wire  _T_280; 
  wire  _T_281; 
  wire  _T_282; 
  wire  _T_283; 
  wire  _T_284; 
  wire [37:0] _T_285; 
  wire [38:0] _T_286; 
  wire [38:0] _T_287; 
  wire [38:0] _T_288; 
  wire  _T_289; 
  wire [2:0] _T_291; 
  wire [3:0] _T_292; 
  wire [3:0] _GEN_13; 
  wire [3:0] _T_293; 
  wire [6:0] _T_296; 
  wire [7:0] _GEN_14; 
  wire [7:0] _T_297; 
  wire [5:0] _T_298; 
  wire [7:0] _GEN_15; 
  wire [7:0] _T_299; 
  wire [3:0] _T_300; 
  wire [7:0] _GEN_16; 
  wire [7:0] _T_301; 
  wire [6:0] _T_303; 
  wire [7:0] _T_304; 
  wire [8:0] _GEN_17; 
  wire [8:0] _T_305; 
  wire [7:0] _T_306; 
  wire [7:0] _T_307; 
  wire [9:0] _GEN_18; 
  wire [9:0] _T_308; 
  wire [7:0] _T_309; 
  wire [7:0] _T_310; 
  wire [11:0] _GEN_19; 
  wire [11:0] _T_311; 
  wire [7:0] _T_312; 
  wire [7:0] _T_313; 
  wire [7:0] _T_315; 
  wire [7:0] _GEN_20; 
  wire [7:0] _T_316; 
  wire [8:0] _GEN_21; 
  wire [8:0] _T_317; 
  wire [7:0] _T_318; 
  wire [7:0] _T_319; 
  wire [9:0] _GEN_22; 
  wire [9:0] _T_320; 
  wire [7:0] _T_321; 
  wire [7:0] _T_322; 
  wire [11:0] _GEN_23; 
  wire [11:0] _T_323; 
  wire [7:0] _T_324; 
  wire [7:0] _T_325; 
  wire [7:0] _T_327; 
  wire [7:0] _T_328; 
  wire [7:0] _GEN_24; 
  wire [7:0] _T_329; 
  wire [1:0] _T_225_bits_burst; 
  wire  _T_330; 
  wire [2:0] _T_225_bits_size; 
  wire  _T_331; 
  wire  _T_332; 
  wire [7:0] _T_333; 
  wire [8:0] _GEN_25; 
  wire [8:0] _T_334; 
  wire [8:0] _T_335; 
  wire [8:0] _T_336; 
  wire [8:0] _T_337; 
  wire [8:0] _T_338; 
  wire [15:0] _GEN_26; 
  wire [15:0] _T_339; 
  wire [37:0] _GEN_27; 
  wire [37:0] _T_341; 
  wire [15:0] _T_342; 
  wire [22:0] _GEN_28; 
  wire [22:0] _T_343; 
  wire [14:0] _T_344; 
  wire  _T_347; 
  wire [37:0] _GEN_29; 
  wire [37:0] _T_348; 
  wire [37:0] _T_349; 
  wire [37:0] _T_350; 
  wire [37:0] _T_351; 
  wire [37:0] _T_352; 
  wire  _T_354; 
  wire [37:0] _T_356; 
  wire [9:0] _T_358; 
  wire [2:0] _T_359; 
  wire [2:0] _T_360; 
  wire [37:0] _GEN_31; 
  wire [37:0] _T_361; 
  wire  _T_225_valid; 
  wire  _T_363; 
  wire  _T_364; 
  wire [8:0] _GEN_32; 
  wire [9:0] _T_365; 
  wire [9:0] _T_366; 
  wire [8:0] _T_367; 
  wire [8:0] _GEN_4; 
  reg  _T_381; 
  reg [31:0] _RAND_3;
  reg [37:0] _T_383; 
  reg [63:0] _RAND_4;
  reg [7:0] _T_385; 
  reg [31:0] _RAND_5;
  wire [7:0] _T_372_bits_len; 
  wire [7:0] _T_386; 
  wire [37:0] _T_372_bits_addr; 
  wire [37:0] _T_387; 
  wire [34:0] _T_389; 
  wire [7:0] _T_390; 
  wire [37:0] _T_391; 
  wire [38:0] _T_392; 
  wire [38:0] _T_393; 
  wire [38:0] _T_394; 
  wire  _T_395; 
  wire [37:0] _T_396; 
  wire [38:0] _T_397; 
  wire [38:0] _T_398; 
  wire [38:0] _T_399; 
  wire  _T_400; 
  wire [37:0] _T_401; 
  wire [38:0] _T_402; 
  wire [38:0] _T_403; 
  wire [38:0] _T_404; 
  wire  _T_405; 
  wire [38:0] _T_407; 
  wire [38:0] _T_408; 
  wire [38:0] _T_409; 
  wire  _T_410; 
  wire [37:0] _T_411; 
  wire [38:0] _T_412; 
  wire [38:0] _T_413; 
  wire [38:0] _T_414; 
  wire  _T_415; 
  wire [37:0] _T_416; 
  wire [38:0] _T_417; 
  wire [38:0] _T_418; 
  wire [38:0] _T_419; 
  wire  _T_420; 
  wire  _T_421; 
  wire  _T_422; 
  wire  _T_423; 
  wire  _T_424; 
  wire  _T_425; 
  wire [37:0] _T_426; 
  wire [38:0] _T_427; 
  wire [38:0] _T_428; 
  wire [38:0] _T_429; 
  wire  _T_430; 
  wire [37:0] _T_431; 
  wire [38:0] _T_432; 
  wire [38:0] _T_433; 
  wire [38:0] _T_434; 
  wire  _T_435; 
  wire  _T_436; 
  wire [2:0] _T_438; 
  wire [3:0] _T_439; 
  wire [3:0] _GEN_33; 
  wire [3:0] _T_440; 
  wire [6:0] _T_443; 
  wire [7:0] _GEN_34; 
  wire [7:0] _T_444; 
  wire [5:0] _T_445; 
  wire [7:0] _GEN_35; 
  wire [7:0] _T_446; 
  wire [3:0] _T_447; 
  wire [7:0] _GEN_36; 
  wire [7:0] _T_448; 
  wire [6:0] _T_450; 
  wire [7:0] _T_451; 
  wire [8:0] _GEN_37; 
  wire [8:0] _T_452; 
  wire [7:0] _T_453; 
  wire [7:0] _T_454; 
  wire [9:0] _GEN_38; 
  wire [9:0] _T_455; 
  wire [7:0] _T_456; 
  wire [7:0] _T_457; 
  wire [11:0] _GEN_39; 
  wire [11:0] _T_458; 
  wire [7:0] _T_459; 
  wire [7:0] _T_460; 
  wire [7:0] _T_462; 
  wire [7:0] _GEN_40; 
  wire [7:0] _T_463; 
  wire [8:0] _GEN_41; 
  wire [8:0] _T_464; 
  wire [7:0] _T_465; 
  wire [7:0] _T_466; 
  wire [9:0] _GEN_42; 
  wire [9:0] _T_467; 
  wire [7:0] _T_468; 
  wire [7:0] _T_469; 
  wire [11:0] _GEN_43; 
  wire [11:0] _T_470; 
  wire [7:0] _T_471; 
  wire [7:0] _T_472; 
  wire [7:0] _T_474; 
  wire [7:0] _T_475; 
  wire [7:0] _GEN_44; 
  wire [7:0] _T_476; 
  wire [1:0] _T_372_bits_burst; 
  wire  _T_477; 
  wire [2:0] _T_372_bits_size; 
  wire  _T_478; 
  wire  _T_479; 
  wire [7:0] _T_480; 
  wire [8:0] _GEN_45; 
  wire [8:0] _T_481; 
  wire [8:0] _T_482; 
  wire [8:0] _T_483; 
  wire [8:0] _T_484; 
  wire [8:0] _T_485; 
  wire [15:0] _GEN_46; 
  wire [15:0] _T_486; 
  wire [37:0] _GEN_47; 
  wire [37:0] _T_488; 
  wire [15:0] _T_489; 
  wire [22:0] _GEN_48; 
  wire [22:0] _T_490; 
  wire [14:0] _T_491; 
  wire  _T_494; 
  wire [37:0] _GEN_49; 
  wire [37:0] _T_495; 
  wire [37:0] _T_496; 
  wire [37:0] _T_497; 
  wire [37:0] _T_498; 
  wire [37:0] _T_499; 
  wire  _T_501; 
  reg [8:0] _T_538; 
  reg [31:0] _RAND_6;
  wire  _T_539; 
  reg  _T_524; 
  reg [31:0] _RAND_7;
  wire  _T_533; 
  wire  _T_534; 
  wire [37:0] _T_503; 
  wire [9:0] _T_505; 
  wire [2:0] _T_506; 
  wire [2:0] _T_507; 
  wire [37:0] _GEN_51; 
  wire [37:0] _T_508; 
  wire  _T_372_valid; 
  wire  _T_510; 
  wire  _T_511; 
  wire [8:0] _GEN_52; 
  wire [9:0] _T_512; 
  wire [9:0] _T_513; 
  wire [8:0] _T_514; 
  wire [8:0] _GEN_9; 
  wire  _T_535; 
  wire  _T_536; 
  wire  _T_529; 
  wire  _T_532; 
  wire  _T_530; 
  wire [8:0] _T_540; 
  wire [8:0] _T_541; 
  wire  _T_542; 
  wire  _T_519_valid; 
  wire  _T_554; 
  wire  _T_555; 
  wire  _T_556; 
  wire  _T_543; 
  wire [8:0] _GEN_53; 
  wire [9:0] _T_544; 
  wire [9:0] _T_545; 
  wire [8:0] _T_546; 
  wire  _T_548; 
  wire  _T_549; 
  wire  _T_550; 
  wire  _T_552; 
  wire  _T_553; 
  wire  _T_560; 
  wire  _T_519_bits_last; 
  wire  _T_561; 
  wire  _T_562; 
  wire  _T_563; 
  wire  _T_565; 
  wire  _T_566; 
  wire  _T_571; 
  wire  _T_572; 
  reg [1:0] _T_586_0; 
  reg [31:0] _RAND_8;
  wire  _T_598; 
  wire [1:0] _T_600; 
  Queue_153 Queue ( 
    .clock(Queue_clock),
    .reset(Queue_reset),
    .io_enq_ready(Queue_io_enq_ready),
    .io_enq_valid(Queue_io_enq_valid),
    .io_enq_bits_addr(Queue_io_enq_bits_addr),
    .io_enq_bits_len(Queue_io_enq_bits_len),
    .io_enq_bits_size(Queue_io_enq_bits_size),
    .io_enq_bits_burst(Queue_io_enq_bits_burst),
    .io_deq_ready(Queue_io_deq_ready),
    .io_deq_valid(Queue_io_deq_valid),
    .io_deq_bits_id(Queue_io_deq_bits_id),
    .io_deq_bits_addr(Queue_io_deq_bits_addr),
    .io_deq_bits_len(Queue_io_deq_bits_len),
    .io_deq_bits_size(Queue_io_deq_bits_size),
    .io_deq_bits_burst(Queue_io_deq_bits_burst)
  );
  Queue_153 Queue_1 ( 
    .clock(Queue_1_clock),
    .reset(Queue_1_reset),
    .io_enq_ready(Queue_1_io_enq_ready),
    .io_enq_valid(Queue_1_io_enq_valid),
    .io_enq_bits_addr(Queue_1_io_enq_bits_addr),
    .io_enq_bits_len(Queue_1_io_enq_bits_len),
    .io_enq_bits_size(Queue_1_io_enq_bits_size),
    .io_enq_bits_burst(Queue_1_io_enq_bits_burst),
    .io_deq_ready(Queue_1_io_deq_ready),
    .io_deq_valid(Queue_1_io_deq_valid),
    .io_deq_bits_id(Queue_1_io_deq_bits_id),
    .io_deq_bits_addr(Queue_1_io_deq_bits_addr),
    .io_deq_bits_len(Queue_1_io_deq_bits_len),
    .io_deq_bits_size(Queue_1_io_deq_bits_size),
    .io_deq_bits_burst(Queue_1_io_deq_bits_burst)
  );
  Queue_44 Queue_2 ( 
    .clock(Queue_2_clock),
    .reset(Queue_2_reset),
    .io_enq_ready(Queue_2_io_enq_ready),
    .io_enq_valid(Queue_2_io_enq_valid),
    .io_enq_bits_data(Queue_2_io_enq_bits_data),
    .io_enq_bits_strb(Queue_2_io_enq_bits_strb),
    .io_enq_bits_last(Queue_2_io_enq_bits_last),
    .io_deq_ready(Queue_2_io_deq_ready),
    .io_deq_valid(Queue_2_io_deq_valid),
    .io_deq_bits_data(Queue_2_io_deq_bits_data),
    .io_deq_bits_strb(Queue_2_io_deq_bits_strb),
    .io_deq_bits_last(Queue_2_io_deq_bits_last)
  );
  assign _T_225_bits_len = Queue_io_deq_bits_len; 
  assign _T_239 = _T_234 ? _T_238 : _T_225_bits_len; 
  assign _T_225_bits_addr = Queue_io_deq_bits_addr; 
  assign _T_240 = _T_234 ? _T_236 : _T_225_bits_addr; 
  assign _T_242 = _T_240[37:3]; 
  assign _T_243 = _T_242[7:0]; 
  assign _T_244 = _T_240 ^ 38'h40000000; 
  assign _T_245 = {1'b0,$signed(_T_244)}; 
  assign _T_246 = $signed(_T_245) & $signed(39'sh20ca000000); 
  assign _T_247 = $signed(_T_246); 
  assign _T_248 = $signed(_T_247) == $signed(39'sh0); 
  assign _T_249 = _T_240 ^ 38'h8000000; 
  assign _T_250 = {1'b0,$signed(_T_249)}; 
  assign _T_251 = $signed(_T_250) & $signed(39'sh20c8000000); 
  assign _T_252 = $signed(_T_251); 
  assign _T_253 = $signed(_T_252) == $signed(39'sh0); 
  assign _T_254 = _T_240 ^ 38'h2000000; 
  assign _T_255 = {1'b0,$signed(_T_254)}; 
  assign _T_256 = $signed(_T_255) & $signed(39'sh20ca000000); 
  assign _T_257 = $signed(_T_256); 
  assign _T_258 = $signed(_T_257) == $signed(39'sh0); 
  assign _T_260 = {1'b0,$signed(_T_240)}; 
  assign _T_261 = $signed(_T_260) & $signed(39'sh20ca002000); 
  assign _T_262 = $signed(_T_261); 
  assign _T_263 = $signed(_T_262) == $signed(39'sh0); 
  assign _T_264 = _T_240 ^ 38'h80000000; 
  assign _T_265 = {1'b0,$signed(_T_264)}; 
  assign _T_266 = $signed(_T_265) & $signed(39'sh20c0000000); 
  assign _T_267 = $signed(_T_266); 
  assign _T_268 = $signed(_T_267) == $signed(39'sh0); 
  assign _T_271 = $signed(_T_245) & $signed(39'sh20c0000000); 
  assign _T_272 = $signed(_T_271); 
  assign _T_273 = $signed(_T_272) == $signed(39'sh0); 
  assign _T_274 = _T_240 ^ 38'h2000000000; 
  assign _T_275 = {1'b0,$signed(_T_274)}; 
  assign _T_276 = $signed(_T_275) & $signed(39'sh20c8000000); 
  assign _T_277 = $signed(_T_276); 
  assign _T_278 = $signed(_T_277) == $signed(39'sh0); 
  assign _T_279 = _T_248 | _T_253; 
  assign _T_280 = _T_279 | _T_258; 
  assign _T_281 = _T_280 | _T_263; 
  assign _T_282 = _T_281 | _T_268; 
  assign _T_283 = _T_282 | _T_273; 
  assign _T_284 = _T_283 | _T_278; 
  assign _T_285 = _T_240 ^ 38'h2000; 
  assign _T_286 = {1'b0,$signed(_T_285)}; 
  assign _T_287 = $signed(_T_286) & $signed(39'sh20ca002000); 
  assign _T_288 = $signed(_T_287); 
  assign _T_289 = $signed(_T_288) == $signed(39'sh0); 
  assign _T_291 = _T_284 ? 3'h7 : 3'h0; 
  assign _T_292 = _T_289 ? 4'hf : 4'h0; 
  assign _GEN_13 = {{1'd0}, _T_291}; 
  assign _T_293 = _GEN_13 | _T_292; 
  assign _T_296 = _T_239[7:1]; 
  assign _GEN_14 = {{1'd0}, _T_296}; 
  assign _T_297 = _T_239 | _GEN_14; 
  assign _T_298 = _T_297[7:2]; 
  assign _GEN_15 = {{2'd0}, _T_298}; 
  assign _T_299 = _T_297 | _GEN_15; 
  assign _T_300 = _T_299[7:4]; 
  assign _GEN_16 = {{4'd0}, _T_300}; 
  assign _T_301 = _T_299 | _GEN_16; 
  assign _T_303 = _T_301[7:1]; 
  assign _T_304 = ~ _T_239; 
  assign _GEN_17 = {{1'd0}, _T_304}; 
  assign _T_305 = _GEN_17 << 1; 
  assign _T_306 = _T_305[7:0]; 
  assign _T_307 = _T_304 | _T_306; 
  assign _GEN_18 = {{2'd0}, _T_307}; 
  assign _T_308 = _GEN_18 << 2; 
  assign _T_309 = _T_308[7:0]; 
  assign _T_310 = _T_307 | _T_309; 
  assign _GEN_19 = {{4'd0}, _T_310}; 
  assign _T_311 = _GEN_19 << 4; 
  assign _T_312 = _T_311[7:0]; 
  assign _T_313 = _T_310 | _T_312; 
  assign _T_315 = ~ _T_313; 
  assign _GEN_20 = {{1'd0}, _T_303}; 
  assign _T_316 = _GEN_20 | _T_315; 
  assign _GEN_21 = {{1'd0}, _T_243}; 
  assign _T_317 = _GEN_21 << 1; 
  assign _T_318 = _T_317[7:0]; 
  assign _T_319 = _T_243 | _T_318; 
  assign _GEN_22 = {{2'd0}, _T_319}; 
  assign _T_320 = _GEN_22 << 2; 
  assign _T_321 = _T_320[7:0]; 
  assign _T_322 = _T_319 | _T_321; 
  assign _GEN_23 = {{4'd0}, _T_322}; 
  assign _T_323 = _GEN_23 << 4; 
  assign _T_324 = _T_323[7:0]; 
  assign _T_325 = _T_322 | _T_324; 
  assign _T_327 = ~ _T_325; 
  assign _T_328 = _T_316 & _T_327; 
  assign _GEN_24 = {{4'd0}, _T_293}; 
  assign _T_329 = _T_328 & _GEN_24; 
  assign _T_225_bits_burst = Queue_io_deq_bits_burst; 
  assign _T_330 = _T_225_bits_burst == 2'h0; 
  assign _T_225_bits_size = Queue_io_deq_bits_size; 
  assign _T_331 = _T_225_bits_size != 3'h3; 
  assign _T_332 = _T_330 | _T_331; 
  assign _T_333 = _T_332 ? 8'h0 : _T_329; 
  assign _GEN_25 = {{1'd0}, _T_333}; 
  assign _T_334 = _GEN_25 << 1; 
  assign _T_335 = _T_334 | 9'h1; 
  assign _T_336 = {1'h0,_T_333}; 
  assign _T_337 = ~ _T_336; 
  assign _T_338 = _T_335 & _T_337; 
  assign _GEN_26 = {{7'd0}, _T_338}; 
  assign _T_339 = _GEN_26 << _T_225_bits_size; 
  assign _GEN_27 = {{22'd0}, _T_339}; 
  assign _T_341 = _T_240 + _GEN_27; 
  assign _T_342 = {_T_225_bits_len,8'hff}; 
  assign _GEN_28 = {{7'd0}, _T_342}; 
  assign _T_343 = _GEN_28 << _T_225_bits_size; 
  assign _T_344 = _T_343[22:8]; 
  assign _T_347 = _T_225_bits_burst == 2'h2; 
  assign _GEN_29 = {{23'd0}, _T_344}; 
  assign _T_348 = _T_341 & _GEN_29; 
  assign _T_349 = ~ _T_225_bits_addr; 
  assign _T_350 = _T_349 | _GEN_29; 
  assign _T_351 = ~ _T_350; 
  assign _T_352 = _T_348 | _T_351; 
  assign _T_354 = _T_333 == _T_239; 
  assign _T_356 = ~ _T_240; 
  assign _T_358 = 10'h7 << _T_225_bits_size; 
  assign _T_359 = _T_358[2:0]; 
  assign _T_360 = ~ _T_359; 
  assign _GEN_31 = {{35'd0}, _T_360}; 
  assign _T_361 = _T_356 | _GEN_31; 
  assign _T_225_valid = Queue_io_deq_valid; 
  assign _T_363 = auto_out_ar_ready & _T_225_valid; 
  assign _T_364 = _T_354 == 1'h0; 
  assign _GEN_32 = {{1'd0}, _T_239}; 
  assign _T_365 = _GEN_32 - _T_338; 
  assign _T_366 = $unsigned(_T_365); 
  assign _T_367 = _T_366[8:0]; 
  assign _GEN_4 = _T_363 ? _T_367 : {{1'd0}, _T_238}; 
  assign _T_372_bits_len = Queue_1_io_deq_bits_len; 
  assign _T_386 = _T_381 ? _T_385 : _T_372_bits_len; 
  assign _T_372_bits_addr = Queue_1_io_deq_bits_addr; 
  assign _T_387 = _T_381 ? _T_383 : _T_372_bits_addr; 
  assign _T_389 = _T_387[37:3]; 
  assign _T_390 = _T_389[7:0]; 
  assign _T_391 = _T_387 ^ 38'h60000000; 
  assign _T_392 = {1'b0,$signed(_T_391)}; 
  assign _T_393 = $signed(_T_392) & $signed(39'sh20ea000000); 
  assign _T_394 = $signed(_T_393); 
  assign _T_395 = $signed(_T_394) == $signed(39'sh0); 
  assign _T_396 = _T_387 ^ 38'h8000000; 
  assign _T_397 = {1'b0,$signed(_T_396)}; 
  assign _T_398 = $signed(_T_397) & $signed(39'sh20e8000000); 
  assign _T_399 = $signed(_T_398); 
  assign _T_400 = $signed(_T_399) == $signed(39'sh0); 
  assign _T_401 = _T_387 ^ 38'h2000000; 
  assign _T_402 = {1'b0,$signed(_T_401)}; 
  assign _T_403 = $signed(_T_402) & $signed(39'sh20ea000000); 
  assign _T_404 = $signed(_T_403); 
  assign _T_405 = $signed(_T_404) == $signed(39'sh0); 
  assign _T_407 = {1'b0,$signed(_T_387)}; 
  assign _T_408 = $signed(_T_407) & $signed(39'sh20ea002000); 
  assign _T_409 = $signed(_T_408); 
  assign _T_410 = $signed(_T_409) == $signed(39'sh0); 
  assign _T_411 = _T_387 ^ 38'h80000000; 
  assign _T_412 = {1'b0,$signed(_T_411)}; 
  assign _T_413 = $signed(_T_412) & $signed(39'sh20c0000000); 
  assign _T_414 = $signed(_T_413); 
  assign _T_415 = $signed(_T_414) == $signed(39'sh0); 
  assign _T_416 = _T_387 ^ 38'h2000000000; 
  assign _T_417 = {1'b0,$signed(_T_416)}; 
  assign _T_418 = $signed(_T_417) & $signed(39'sh20e8000000); 
  assign _T_419 = $signed(_T_418); 
  assign _T_420 = $signed(_T_419) == $signed(39'sh0); 
  assign _T_421 = _T_395 | _T_400; 
  assign _T_422 = _T_421 | _T_405; 
  assign _T_423 = _T_422 | _T_410; 
  assign _T_424 = _T_423 | _T_415; 
  assign _T_425 = _T_424 | _T_420; 
  assign _T_426 = _T_387 ^ 38'h2000; 
  assign _T_427 = {1'b0,$signed(_T_426)}; 
  assign _T_428 = $signed(_T_427) & $signed(39'sh20ea002000); 
  assign _T_429 = $signed(_T_428); 
  assign _T_430 = $signed(_T_429) == $signed(39'sh0); 
  assign _T_431 = _T_387 ^ 38'h40000000; 
  assign _T_432 = {1'b0,$signed(_T_431)}; 
  assign _T_433 = $signed(_T_432) & $signed(39'sh20e0000000); 
  assign _T_434 = $signed(_T_433); 
  assign _T_435 = $signed(_T_434) == $signed(39'sh0); 
  assign _T_436 = _T_430 | _T_435; 
  assign _T_438 = _T_425 ? 3'h7 : 3'h0; 
  assign _T_439 = _T_436 ? 4'hf : 4'h0; 
  assign _GEN_33 = {{1'd0}, _T_438}; 
  assign _T_440 = _GEN_33 | _T_439; 
  assign _T_443 = _T_386[7:1]; 
  assign _GEN_34 = {{1'd0}, _T_443}; 
  assign _T_444 = _T_386 | _GEN_34; 
  assign _T_445 = _T_444[7:2]; 
  assign _GEN_35 = {{2'd0}, _T_445}; 
  assign _T_446 = _T_444 | _GEN_35; 
  assign _T_447 = _T_446[7:4]; 
  assign _GEN_36 = {{4'd0}, _T_447}; 
  assign _T_448 = _T_446 | _GEN_36; 
  assign _T_450 = _T_448[7:1]; 
  assign _T_451 = ~ _T_386; 
  assign _GEN_37 = {{1'd0}, _T_451}; 
  assign _T_452 = _GEN_37 << 1; 
  assign _T_453 = _T_452[7:0]; 
  assign _T_454 = _T_451 | _T_453; 
  assign _GEN_38 = {{2'd0}, _T_454}; 
  assign _T_455 = _GEN_38 << 2; 
  assign _T_456 = _T_455[7:0]; 
  assign _T_457 = _T_454 | _T_456; 
  assign _GEN_39 = {{4'd0}, _T_457}; 
  assign _T_458 = _GEN_39 << 4; 
  assign _T_459 = _T_458[7:0]; 
  assign _T_460 = _T_457 | _T_459; 
  assign _T_462 = ~ _T_460; 
  assign _GEN_40 = {{1'd0}, _T_450}; 
  assign _T_463 = _GEN_40 | _T_462; 
  assign _GEN_41 = {{1'd0}, _T_390}; 
  assign _T_464 = _GEN_41 << 1; 
  assign _T_465 = _T_464[7:0]; 
  assign _T_466 = _T_390 | _T_465; 
  assign _GEN_42 = {{2'd0}, _T_466}; 
  assign _T_467 = _GEN_42 << 2; 
  assign _T_468 = _T_467[7:0]; 
  assign _T_469 = _T_466 | _T_468; 
  assign _GEN_43 = {{4'd0}, _T_469}; 
  assign _T_470 = _GEN_43 << 4; 
  assign _T_471 = _T_470[7:0]; 
  assign _T_472 = _T_469 | _T_471; 
  assign _T_474 = ~ _T_472; 
  assign _T_475 = _T_463 & _T_474; 
  assign _GEN_44 = {{4'd0}, _T_440}; 
  assign _T_476 = _T_475 & _GEN_44; 
  assign _T_372_bits_burst = Queue_1_io_deq_bits_burst; 
  assign _T_477 = _T_372_bits_burst == 2'h0; 
  assign _T_372_bits_size = Queue_1_io_deq_bits_size; 
  assign _T_478 = _T_372_bits_size != 3'h3; 
  assign _T_479 = _T_477 | _T_478; 
  assign _T_480 = _T_479 ? 8'h0 : _T_476; 
  assign _GEN_45 = {{1'd0}, _T_480}; 
  assign _T_481 = _GEN_45 << 1; 
  assign _T_482 = _T_481 | 9'h1; 
  assign _T_483 = {1'h0,_T_480}; 
  assign _T_484 = ~ _T_483; 
  assign _T_485 = _T_482 & _T_484; 
  assign _GEN_46 = {{7'd0}, _T_485}; 
  assign _T_486 = _GEN_46 << _T_372_bits_size; 
  assign _GEN_47 = {{22'd0}, _T_486}; 
  assign _T_488 = _T_387 + _GEN_47; 
  assign _T_489 = {_T_372_bits_len,8'hff}; 
  assign _GEN_48 = {{7'd0}, _T_489}; 
  assign _T_490 = _GEN_48 << _T_372_bits_size; 
  assign _T_491 = _T_490[22:8]; 
  assign _T_494 = _T_372_bits_burst == 2'h2; 
  assign _GEN_49 = {{23'd0}, _T_491}; 
  assign _T_495 = _T_488 & _GEN_49; 
  assign _T_496 = ~ _T_372_bits_addr; 
  assign _T_497 = _T_496 | _GEN_49; 
  assign _T_498 = ~ _T_497; 
  assign _T_499 = _T_495 | _T_498; 
  assign _T_501 = _T_480 == _T_386; 
  assign _T_539 = _T_538 == 9'h0; 
  assign _T_533 = _T_539 | _T_524; 
  assign _T_534 = auto_out_aw_ready & _T_533; 
  assign _T_503 = ~ _T_387; 
  assign _T_505 = 10'h7 << _T_372_bits_size; 
  assign _T_506 = _T_505[2:0]; 
  assign _T_507 = ~ _T_506; 
  assign _GEN_51 = {{35'd0}, _T_507}; 
  assign _T_508 = _T_503 | _GEN_51; 
  assign _T_372_valid = Queue_1_io_deq_valid; 
  assign _T_510 = _T_534 & _T_372_valid; 
  assign _T_511 = _T_501 == 1'h0; 
  assign _GEN_52 = {{1'd0}, _T_386}; 
  assign _T_512 = _GEN_52 - _T_485; 
  assign _T_513 = $unsigned(_T_512); 
  assign _T_514 = _T_513[8:0]; 
  assign _GEN_9 = _T_510 ? _T_514 : {{1'd0}, _T_385}; 
  assign _T_535 = _T_524 == 1'h0; 
  assign _T_536 = _T_372_valid & _T_535; 
  assign _T_529 = _T_536 & _T_539; 
  assign _T_532 = _T_372_valid & _T_533; 
  assign _T_530 = auto_out_aw_ready & _T_532; 
  assign _T_540 = _T_536 ? _T_485 : 9'h0; 
  assign _T_541 = _T_539 ? _T_540 : _T_538; 
  assign _T_542 = _T_541 == 9'h1; 
  assign _T_519_valid = Queue_2_io_deq_valid; 
  assign _T_554 = _T_539 == 1'h0; 
  assign _T_555 = _T_554 | _T_536; 
  assign _T_556 = _T_519_valid & _T_555; 
  assign _T_543 = auto_out_w_ready & _T_556; 
  assign _GEN_53 = {{8'd0}, _T_543}; 
  assign _T_544 = _T_541 - _GEN_53; 
  assign _T_545 = $unsigned(_T_544); 
  assign _T_546 = _T_545[8:0]; 
  assign _T_548 = _T_543 == 1'h0; 
  assign _T_549 = _T_541 != 9'h0; 
  assign _T_550 = _T_548 | _T_549; 
  assign _T_552 = _T_550 | reset; 
  assign _T_553 = _T_552 == 1'h0; 
  assign _T_560 = _T_556 == 1'h0; 
  assign _T_519_bits_last = Queue_2_io_deq_bits_last; 
  assign _T_561 = _T_519_bits_last == 1'h0; 
  assign _T_562 = _T_560 | _T_561; 
  assign _T_563 = _T_562 | _T_542; 
  assign _T_565 = _T_563 | reset; 
  assign _T_566 = _T_565 == 1'h0; 
  assign _T_571 = auto_out_b_bits_user == 1'h0; 
  assign _T_572 = auto_in_b_ready | _T_571; 
  assign _T_598 = _T_572 & auto_out_b_valid; 
  assign _T_600 = _T_586_0 | auto_out_b_bits_resp; 
  assign auto_in_aw_ready = Queue_1_io_enq_ready; 
  assign auto_in_w_ready = Queue_2_io_enq_ready; 
  assign auto_in_b_valid = auto_out_b_valid & auto_out_b_bits_user; 
  assign auto_in_b_bits_resp = auto_out_b_bits_resp | _T_586_0; 
  assign auto_in_ar_ready = Queue_io_enq_ready; 
  assign auto_in_r_valid = auto_out_r_valid; 
  assign auto_in_r_bits_data = auto_out_r_bits_data; 
  assign auto_in_r_bits_resp = auto_out_r_bits_resp; 
  assign auto_in_r_bits_last = auto_out_r_bits_last & auto_out_r_bits_user; 
  assign auto_out_aw_valid = _T_372_valid & _T_533; 
  assign auto_out_aw_bits_id = Queue_1_io_deq_bits_id; 
  assign auto_out_aw_bits_addr = ~ _T_508; 
  assign auto_out_aw_bits_len = _T_479 ? 8'h0 : _T_476; 
  assign auto_out_aw_bits_size = Queue_1_io_deq_bits_size; 
  assign auto_out_aw_bits_user = _T_480 == _T_386; 
  assign auto_out_w_valid = _T_519_valid & _T_555; 
  assign auto_out_w_bits_data = Queue_2_io_deq_bits_data; 
  assign auto_out_w_bits_strb = Queue_2_io_deq_bits_strb; 
  assign auto_out_w_bits_last = _T_541 == 9'h1; 
  assign auto_out_b_ready = auto_in_b_ready | _T_571; 
  assign auto_out_ar_valid = Queue_io_deq_valid; 
  assign auto_out_ar_bits_id = Queue_io_deq_bits_id; 
  assign auto_out_ar_bits_addr = ~ _T_361; 
  assign auto_out_ar_bits_len = _T_332 ? 8'h0 : _T_329; 
  assign auto_out_ar_bits_size = Queue_io_deq_bits_size; 
  assign auto_out_ar_bits_user = _T_333 == _T_239; 
  assign auto_out_r_ready = auto_in_r_ready; 
  assign Queue_clock = clock; 
  assign Queue_reset = reset; 
  assign Queue_io_enq_valid = auto_in_ar_valid; 
  assign Queue_io_enq_bits_addr = auto_in_ar_bits_addr; 
  assign Queue_io_enq_bits_len = auto_in_ar_bits_len; 
  assign Queue_io_enq_bits_size = auto_in_ar_bits_size; 
  assign Queue_io_enq_bits_burst = auto_in_ar_bits_burst; 
  assign Queue_io_deq_ready = auto_out_ar_ready & _T_354; 
  assign Queue_1_clock = clock; 
  assign Queue_1_reset = reset; 
  assign Queue_1_io_enq_valid = auto_in_aw_valid; 
  assign Queue_1_io_enq_bits_addr = auto_in_aw_bits_addr; 
  assign Queue_1_io_enq_bits_len = auto_in_aw_bits_len; 
  assign Queue_1_io_enq_bits_size = auto_in_aw_bits_size; 
  assign Queue_1_io_enq_bits_burst = auto_in_aw_bits_burst; 
  assign Queue_1_io_deq_ready = _T_534 & _T_501; 
  assign Queue_2_clock = clock; 
  assign Queue_2_reset = reset; 
  assign Queue_2_io_enq_valid = auto_in_w_valid; 
  assign Queue_2_io_enq_bits_data = auto_in_w_bits_data; 
  assign Queue_2_io_enq_bits_strb = auto_in_w_bits_strb; 
  assign Queue_2_io_enq_bits_last = auto_in_w_bits_last; 
  assign Queue_2_io_deq_ready = auto_out_w_ready & _T_555; 
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
  _T_234 = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {2{`RANDOM}};
  _T_236 = _RAND_1[37:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  _T_238 = _RAND_2[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  _T_381 = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {2{`RANDOM}};
  _T_383 = _RAND_4[37:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  _T_385 = _RAND_5[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  _T_538 = _RAND_6[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  _T_524 = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  _T_586_0 = _RAND_8[1:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      _T_234 <= 1'h0;
    end else begin
      if (_T_363) begin
        _T_234 <= _T_364;
      end
    end
    if (_T_363) begin
      if (_T_330) begin
        _T_236 <= _T_225_bits_addr;
      end else begin
        if (_T_347) begin
          _T_236 <= _T_352;
        end else begin
          _T_236 <= _T_341;
        end
      end
    end
    _T_238 <= _GEN_4[7:0];
    if (reset) begin
      _T_381 <= 1'h0;
    end else begin
      if (_T_510) begin
        _T_381 <= _T_511;
      end
    end
    if (_T_510) begin
      if (_T_477) begin
        _T_383 <= _T_372_bits_addr;
      end else begin
        if (_T_494) begin
          _T_383 <= _T_499;
        end else begin
          _T_383 <= _T_488;
        end
      end
    end
    _T_385 <= _GEN_9[7:0];
    if (reset) begin
      _T_538 <= 9'h0;
    end else begin
      _T_538 <= _T_546;
    end
    if (reset) begin
      _T_524 <= 1'h0;
    end else begin
      if (_T_530) begin
        _T_524 <= 1'h0;
      end else begin
        if (_T_529) begin
          _T_524 <= 1'h1;
        end
      end
    end
    if (reset) begin
      _T_586_0 <= 2'h0;
    end else begin
      if (_T_598) begin
        if (auto_out_b_bits_user) begin
          _T_586_0 <= 2'h0;
        end else begin
          _T_586_0 <= _T_600;
        end
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_553) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Fragmenter.scala:167 assert (!out.w.fire() || w_todo =/= UInt(0)) // underflow impossible\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_553) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_566) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Fragmenter.scala:176 assert (!out.w.valid || !in_w.bits.last || w_last)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_566) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
