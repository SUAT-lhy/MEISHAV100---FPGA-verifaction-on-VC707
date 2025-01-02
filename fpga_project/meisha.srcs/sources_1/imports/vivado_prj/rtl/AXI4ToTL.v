module AXI4ToTL( 
  input         clock, 
  input         reset, 
  output        auto_in_aw_ready, 
  input         auto_in_aw_valid, 
  input         auto_in_aw_bits_id, 
  input  [37:0] auto_in_aw_bits_addr, 
  input  [7:0]  auto_in_aw_bits_len, 
  input  [2:0]  auto_in_aw_bits_size, 
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
  input         auto_in_ar_bits_id, 
  input  [37:0] auto_in_ar_bits_addr, 
  input  [7:0]  auto_in_ar_bits_len, 
  input  [2:0]  auto_in_ar_bits_size, 
  input         auto_in_r_ready, 
  output        auto_in_r_valid, 
  output [63:0] auto_in_r_bits_data, 
  output [1:0]  auto_in_r_bits_resp, 
  output        auto_in_r_bits_last, 
  input         auto_out_a_ready, 
  output        auto_out_a_valid, 
  output [2:0]  auto_out_a_bits_opcode, 
  output [2:0]  auto_out_a_bits_param, 
  output [2:0]  auto_out_a_bits_size, 
  output [3:0]  auto_out_a_bits_source, 
  output [37:0] auto_out_a_bits_address, 
  output [7:0]  auto_out_a_bits_mask, 
  output [63:0] auto_out_a_bits_data, 
  output        auto_out_a_bits_corrupt, 
  output        auto_out_d_ready, 
  input         auto_out_d_valid, 
  input  [2:0]  auto_out_d_bits_opcode, 
  input  [2:0]  auto_out_d_bits_size, 
  input         auto_out_d_bits_denied, 
  input  [63:0] auto_out_d_bits_data, 
  input         auto_out_d_bits_corrupt 
);
  wire  Queue_clock; 
  wire  Queue_reset; 
  wire  Queue_io_enq_ready; 
  wire  Queue_io_enq_valid; 
  wire [63:0] Queue_io_enq_bits_data; 
  wire [1:0] Queue_io_enq_bits_resp; 
  wire  Queue_io_enq_bits_last; 
  wire  Queue_io_deq_ready; 
  wire  Queue_io_deq_valid; 
  wire [63:0] Queue_io_deq_bits_data; 
  wire [1:0] Queue_io_deq_bits_resp; 
  wire  Queue_io_deq_bits_last; 
  wire  Queue_1_clock; 
  wire  Queue_1_reset; 
  wire  Queue_1_io_enq_ready; 
  wire  Queue_1_io_enq_valid; 
  wire [1:0] Queue_1_io_enq_bits_resp; 
  wire  Queue_1_io_deq_ready; 
  wire  Queue_1_io_deq_valid; 
  wire [1:0] Queue_1_io_deq_bits_resp; 
  wire [15:0] _T_224; 
  wire [22:0] _GEN_5; 
  wire [22:0] _T_225; 
  wire [14:0] _T_226; 
  wire [15:0] _GEN_6; 
  wire [15:0] _T_227; 
  wire [15:0] _T_228; 
  wire [15:0] _T_229; 
  wire [15:0] _T_230; 
  wire [15:0] _T_231; 
  wire [7:0] _T_232; 
  wire [7:0] _T_233; 
  wire  _T_234; 
  wire [7:0] _T_235; 
  wire [3:0] _T_236; 
  wire [3:0] _T_237; 
  wire  _T_238; 
  wire [3:0] _T_239; 
  wire [1:0] _T_240; 
  wire [1:0] _T_241; 
  wire  _T_242; 
  wire [1:0] _T_243; 
  wire  _T_244; 
  wire [1:0] _T_245; 
  wire [2:0] _T_246; 
  wire [3:0] _T_247; 
  wire  _T_249; 
  wire [37:0] _T_252; 
  wire [38:0] _T_253; 
  wire [38:0] _T_254; 
  wire [38:0] _T_255; 
  wire  _T_256; 
  wire  _T_257; 
  wire  _T_259; 
  wire [37:0] _T_262; 
  wire [38:0] _T_263; 
  wire [38:0] _T_264; 
  wire [38:0] _T_265; 
  wire  _T_266; 
  wire [37:0] _T_267; 
  wire [38:0] _T_268; 
  wire [38:0] _T_269; 
  wire [38:0] _T_270; 
  wire  _T_271; 
  wire [37:0] _T_272; 
  wire [38:0] _T_273; 
  wire [38:0] _T_274; 
  wire [38:0] _T_275; 
  wire  _T_276; 
  wire [37:0] _T_277; 
  wire [38:0] _T_278; 
  wire [38:0] _T_279; 
  wire [38:0] _T_280; 
  wire  _T_281; 
  wire [38:0] _T_283; 
  wire [38:0] _T_284; 
  wire [38:0] _T_285; 
  wire  _T_286; 
  wire [37:0] _T_287; 
  wire [38:0] _T_288; 
  wire [38:0] _T_289; 
  wire [38:0] _T_290; 
  wire  _T_291; 
  wire [37:0] _T_292; 
  wire [38:0] _T_293; 
  wire [38:0] _T_294; 
  wire [38:0] _T_295; 
  wire  _T_296; 
  wire [37:0] _T_297; 
  wire [38:0] _T_298; 
  wire [38:0] _T_299; 
  wire [38:0] _T_300; 
  wire  _T_301; 
  wire [37:0] _T_302; 
  wire [38:0] _T_303; 
  wire [38:0] _T_304; 
  wire [38:0] _T_305; 
  wire  _T_306; 
  wire  _T_307; 
  wire  _T_308; 
  wire  _T_309; 
  wire  _T_310; 
  wire  _T_311; 
  wire  _T_312; 
  wire  _T_313; 
  wire  _T_314; 
  wire  _T_315; 
  wire  _T_317; 
  wire [2:0] _T_318; 
  wire [13:0] _GEN_7; 
  wire [13:0] _T_319; 
  wire [37:0] _T_320; 
  reg [3:0] _T_334_0; 
  reg [31:0] _RAND_0;
  wire [2:0] _T_345; 
  wire [3:0] _T_346; 
  wire [4:0] _T_347; 
  wire  _T_348; 
  wire [29:0] _T_350; 
  wire [14:0] _T_351; 
  wire [14:0] _T_352; 
  wire  _T_353; 
  wire  _T_354; 
  wire  _T_356; 
  wire  _T_357; 
  wire [1:0] _T_419; 
  wire [3:0] _T_420; 
  wire [2:0] _T_421; 
  wire [2:0] _T_422; 
  wire  _T_423; 
  wire  _T_424; 
  wire  _T_425; 
  wire  _T_426; 
  wire  _T_428; 
  wire  _T_429; 
  wire  _T_431; 
  wire  _T_432; 
  wire  _T_433; 
  wire  _T_434; 
  wire  _T_435; 
  wire  _T_436; 
  wire  _T_437; 
  wire  _T_438; 
  wire  _T_439; 
  wire  _T_440; 
  wire  _T_441; 
  wire  _T_442; 
  wire  _T_443; 
  wire  _T_444; 
  wire  _T_445; 
  wire  _T_446; 
  wire  _T_447; 
  wire  _T_448; 
  wire  _T_449; 
  wire  _T_450; 
  wire  _T_451; 
  wire  _T_452; 
  wire  _T_453; 
  wire  _T_454; 
  wire  _T_455; 
  wire  _T_456; 
  wire  _T_457; 
  wire  _T_458; 
  wire  _T_459; 
  wire  _T_460; 
  wire  _T_461; 
  wire  _T_462; 
  wire  _T_463; 
  wire  _T_464; 
  wire  _T_465; 
  wire  _T_466; 
  wire  _T_467; 
  wire  _T_468; 
  wire  _T_469; 
  wire  _T_470; 
  wire  _T_471; 
  wire  _T_472; 
  wire  _T_473; 
  wire  _T_474; 
  wire [1:0] _T_475; 
  wire [1:0] _T_476; 
  wire [3:0] _T_477; 
  wire [1:0] _T_478; 
  wire [1:0] _T_479; 
  wire [3:0] _T_480; 
  wire [7:0] _T_481; 
  reg [7:0] _T_710; 
  reg [31:0] _RAND_1;
  wire  _T_711; 
  wire  _T_636; 
  wire [1:0] _T_713; 
  reg [1:0] _T_721; 
  reg [31:0] _RAND_2;
  wire [1:0] _T_722; 
  wire [1:0] _T_723; 
  wire [3:0] _T_724; 
  wire [2:0] _T_725; 
  wire [3:0] _GEN_8; 
  wire [3:0] _T_726; 
  wire [2:0] _T_728; 
  wire [3:0] _GEN_9; 
  wire [3:0] _T_729; 
  wire [3:0] _GEN_10; 
  wire [3:0] _T_730; 
  wire [1:0] _T_731; 
  wire [1:0] _T_732; 
  wire [1:0] _T_733; 
  wire [1:0] _T_734; 
  wire  _T_743; 
  reg  _T_806_0; 
  reg [31:0] _RAND_3;
  wire  _T_825_0; 
  wire  _T_833; 
  wire  _T_482; 
  wire [3:0] _T_485; 
  wire [15:0] _T_489; 
  wire [22:0] _GEN_11; 
  wire [22:0] _T_490; 
  wire [14:0] _T_491; 
  wire [15:0] _GEN_12; 
  wire [15:0] _T_492; 
  wire [15:0] _T_493; 
  wire [15:0] _T_494; 
  wire [15:0] _T_495; 
  wire [15:0] _T_496; 
  wire [7:0] _T_497; 
  wire [7:0] _T_498; 
  wire  _T_499; 
  wire [7:0] _T_500; 
  wire [3:0] _T_501; 
  wire [3:0] _T_502; 
  wire  _T_503; 
  wire [3:0] _T_504; 
  wire [1:0] _T_505; 
  wire [1:0] _T_506; 
  wire  _T_507; 
  wire [1:0] _T_508; 
  wire  _T_509; 
  wire [1:0] _T_510; 
  wire [2:0] _T_511; 
  wire [3:0] _T_512; 
  wire  _T_514; 
  wire [37:0] _T_517; 
  wire [38:0] _T_518; 
  wire [38:0] _T_519; 
  wire [38:0] _T_520; 
  wire  _T_521; 
  wire [37:0] _T_522; 
  wire [38:0] _T_523; 
  wire [38:0] _T_524; 
  wire [38:0] _T_525; 
  wire  _T_526; 
  wire  _T_527; 
  wire  _T_528; 
  wire  _T_530; 
  wire [37:0] _T_533; 
  wire [38:0] _T_534; 
  wire [38:0] _T_535; 
  wire [38:0] _T_536; 
  wire  _T_537; 
  wire [37:0] _T_538; 
  wire [38:0] _T_539; 
  wire [38:0] _T_540; 
  wire [38:0] _T_541; 
  wire  _T_542; 
  wire [37:0] _T_543; 
  wire [38:0] _T_544; 
  wire [38:0] _T_545; 
  wire [38:0] _T_546; 
  wire  _T_547; 
  wire [37:0] _T_548; 
  wire [38:0] _T_549; 
  wire [38:0] _T_550; 
  wire [38:0] _T_551; 
  wire  _T_552; 
  wire [38:0] _T_554; 
  wire [38:0] _T_555; 
  wire [38:0] _T_556; 
  wire  _T_557; 
  wire [37:0] _T_558; 
  wire [38:0] _T_559; 
  wire [38:0] _T_560; 
  wire [38:0] _T_561; 
  wire  _T_562; 
  wire [37:0] _T_563; 
  wire [38:0] _T_564; 
  wire [38:0] _T_565; 
  wire [38:0] _T_566; 
  wire  _T_567; 
  wire  _T_568; 
  wire  _T_569; 
  wire  _T_570; 
  wire  _T_571; 
  wire  _T_572; 
  wire  _T_573; 
  wire  _T_574; 
  wire  _T_583; 
  wire [2:0] _T_585; 
  wire [13:0] _GEN_13; 
  wire [13:0] _T_586; 
  wire [37:0] _T_587; 
  reg [3:0] _T_601_0; 
  reg [31:0] _RAND_4;
  wire [2:0] _T_612; 
  wire [3:0] _T_613; 
  wire [4:0] _T_614; 
  wire  _T_615; 
  wire [29:0] _T_617; 
  wire [14:0] _T_618; 
  wire [14:0] _T_619; 
  wire  _T_620; 
  wire  _T_621; 
  wire  _T_623; 
  wire  _T_624; 
  wire  _T_626; 
  wire  _T_627; 
  wire  _T_628; 
  wire  _T_629; 
  wire  _T_631; 
  wire  _T_632; 
  wire  _T_744; 
  reg  _T_806_1; 
  reg [31:0] _RAND_5;
  wire  _T_825_1; 
  wire  _T_834; 
  wire  _T_633; 
  wire  _T_634; 
  wire  _T_705; 
  wire [3:0] _T_708; 
  wire  _T_712; 
  wire  _T_715; 
  wire  _T_717; 
  wire  _T_718; 
  wire  _T_735; 
  wire  _T_736; 
  wire [1:0] _T_737; 
  wire [2:0] _GEN_14; 
  wire [2:0] _T_738; 
  wire [1:0] _T_739; 
  wire [1:0] _T_740; 
  wire  _T_753; 
  wire  _T_754; 
  wire  _T_764; 
  wire  _T_766; 
  wire  _T_769; 
  wire  _T_770; 
  wire  _T_773; 
  wire  _T_774; 
  wire  _T_775; 
  wire  _T_776; 
  wire  _T_778; 
  wire  _T_780; 
  wire  _T_781; 
  wire  _T_837; 
  wire  _T_838; 
  wire  _T_839; 
  wire  _T_842; 
  wire  _T_785; 
  wire [7:0] _GEN_15; 
  wire [8:0] _T_786; 
  wire [8:0] _T_787; 
  wire [7:0] _T_788; 
  wire  _T_817_0; 
  wire  _T_817_1; 
  wire [45:0] _T_845; 
  wire [110:0] _T_846; 
  wire [2:0] _T_417_size; 
  wire [3:0] _T_417_source; 
  wire [6:0] _T_847; 
  wire [12:0] _T_849; 
  wire [123:0] _T_850; 
  wire [123:0] _T_851; 
  wire [64:0] _T_852; 
  wire [45:0] _T_853; 
  wire [110:0] _T_854; 
  wire [2:0] _T_704_size; 
  wire [3:0] _T_704_source; 
  wire [6:0] _T_855; 
  wire [12:0] _T_857; 
  wire [123:0] _T_858; 
  wire [123:0] _T_859; 
  wire [123:0] _T_860; 
  wire  _T_879; 
  wire  _T_881; 
  wire  _T_876_ready; 
  wire  _T_873_ready; 
  wire  _T_903; 
  wire  _T_882; 
  wire [13:0] _T_884; 
  wire [6:0] _T_885; 
  wire [6:0] _T_886; 
  wire [3:0] _T_887; 
  wire [3:0] _T_889; 
  reg [3:0] _T_891; 
  reg [31:0] _RAND_6;
  wire [4:0] _T_892; 
  wire [4:0] _T_893; 
  wire [3:0] _T_894; 
  wire  _T_895; 
  wire  _T_896; 
  wire  _T_897; 
  wire  _T_905; 
  reg [3:0] _T_938_0; 
  reg [31:0] _RAND_7;
  wire  _T_952; 
  wire  _T_921_valid; 
  wire  _T_957; 
  wire  _T_953; 
  wire [3:0] _T_956; 
  Queue_149 Queue ( 
    .clock(Queue_clock),
    .reset(Queue_reset),
    .io_enq_ready(Queue_io_enq_ready),
    .io_enq_valid(Queue_io_enq_valid),
    .io_enq_bits_data(Queue_io_enq_bits_data),
    .io_enq_bits_resp(Queue_io_enq_bits_resp),
    .io_enq_bits_last(Queue_io_enq_bits_last),
    .io_deq_ready(Queue_io_deq_ready),
    .io_deq_valid(Queue_io_deq_valid),
    .io_deq_bits_data(Queue_io_deq_bits_data),
    .io_deq_bits_resp(Queue_io_deq_bits_resp),
    .io_deq_bits_last(Queue_io_deq_bits_last)
  );
  Queue_150 Queue_1 ( 
    .clock(Queue_1_clock),
    .reset(Queue_1_reset),
    .io_enq_ready(Queue_1_io_enq_ready),
    .io_enq_valid(Queue_1_io_enq_valid),
    .io_enq_bits_resp(Queue_1_io_enq_bits_resp),
    .io_deq_ready(Queue_1_io_deq_ready),
    .io_deq_valid(Queue_1_io_deq_valid),
    .io_deq_bits_resp(Queue_1_io_deq_bits_resp)
  );
  assign _T_224 = {auto_in_ar_bits_len,8'hff}; 
  assign _GEN_5 = {{7'd0}, _T_224}; 
  assign _T_225 = _GEN_5 << auto_in_ar_bits_size; 
  assign _T_226 = _T_225[22:8]; 
  assign _GEN_6 = {{1'd0}, _T_226}; 
  assign _T_227 = _GEN_6 << 1; 
  assign _T_228 = _T_227 | 16'h1; 
  assign _T_229 = {1'h0,_T_226}; 
  assign _T_230 = ~ _T_229; 
  assign _T_231 = _T_228 & _T_230; 
  assign _T_232 = _T_231[15:8]; 
  assign _T_233 = _T_231[7:0]; 
  assign _T_234 = _T_232 != 8'h0; 
  assign _T_235 = _T_232 | _T_233; 
  assign _T_236 = _T_235[7:4]; 
  assign _T_237 = _T_235[3:0]; 
  assign _T_238 = _T_236 != 4'h0; 
  assign _T_239 = _T_236 | _T_237; 
  assign _T_240 = _T_239[3:2]; 
  assign _T_241 = _T_239[1:0]; 
  assign _T_242 = _T_240 != 2'h0; 
  assign _T_243 = _T_240 | _T_241; 
  assign _T_244 = _T_243[1]; 
  assign _T_245 = {_T_242,_T_244}; 
  assign _T_246 = {_T_238,_T_245}; 
  assign _T_247 = {_T_234,_T_246}; 
  assign _T_249 = _T_247 <= 4'h7; 
  assign _T_252 = auto_in_ar_bits_addr ^ 38'h3000; 
  assign _T_253 = {1'b0,$signed(_T_252)}; 
  assign _T_254 = $signed(_T_253) & $signed(-39'sh1000); 
  assign _T_255 = $signed(_T_254); 
  assign _T_256 = $signed(_T_255) == $signed(39'sh0); 
  assign _T_257 = _T_249 & _T_256; 
  assign _T_259 = _T_247 <= 4'h6; 
  assign _T_262 = auto_in_ar_bits_addr ^ 38'h64000000; 
  assign _T_263 = {1'b0,$signed(_T_262)}; 
  assign _T_264 = $signed(_T_263) & $signed(-39'sh2000); 
  assign _T_265 = $signed(_T_264); 
  assign _T_266 = $signed(_T_265) == $signed(39'sh0); 
  assign _T_267 = auto_in_ar_bits_addr ^ 38'h64002000; 
  assign _T_268 = {1'b0,$signed(_T_267)}; 
  assign _T_269 = $signed(_T_268) & $signed(-39'sh1000); 
  assign _T_270 = $signed(_T_269); 
  assign _T_271 = $signed(_T_270) == $signed(39'sh0); 
  assign _T_272 = auto_in_ar_bits_addr ^ 38'hc000000; 
  assign _T_273 = {1'b0,$signed(_T_272)}; 
  assign _T_274 = $signed(_T_273) & $signed(-39'sh4000000); 
  assign _T_275 = $signed(_T_274); 
  assign _T_276 = $signed(_T_275) == $signed(39'sh0); 
  assign _T_277 = auto_in_ar_bits_addr ^ 38'h2000000; 
  assign _T_278 = {1'b0,$signed(_T_277)}; 
  assign _T_279 = $signed(_T_278) & $signed(-39'sh10000); 
  assign _T_280 = $signed(_T_279); 
  assign _T_281 = $signed(_T_280) == $signed(39'sh0); 
  assign _T_283 = {1'b0,$signed(auto_in_ar_bits_addr)}; 
  assign _T_284 = $signed(_T_283) & $signed(-39'sh1000); 
  assign _T_285 = $signed(_T_284); 
  assign _T_286 = $signed(_T_285) == $signed(39'sh0); 
  assign _T_287 = auto_in_ar_bits_addr ^ 38'h10000; 
  assign _T_288 = {1'b0,$signed(_T_287)}; 
  assign _T_289 = $signed(_T_288) & $signed(-39'sh2000); 
  assign _T_290 = $signed(_T_289); 
  assign _T_291 = $signed(_T_290) == $signed(39'sh0); 
  assign _T_292 = auto_in_ar_bits_addr ^ 38'h80000000; 
  assign _T_293 = {1'b0,$signed(_T_292)}; 
  assign _T_294 = $signed(_T_293) & $signed(-39'sh40000000); 
  assign _T_295 = $signed(_T_294); 
  assign _T_296 = $signed(_T_295) == $signed(39'sh0); 
  assign _T_297 = auto_in_ar_bits_addr ^ 38'h40000000; 
  assign _T_298 = {1'b0,$signed(_T_297)}; 
  assign _T_299 = $signed(_T_298) & $signed(-39'sh20000000); 
  assign _T_300 = $signed(_T_299); 
  assign _T_301 = $signed(_T_300) == $signed(39'sh0); 
  assign _T_302 = auto_in_ar_bits_addr ^ 38'h2000000000; 
  assign _T_303 = {1'b0,$signed(_T_302)}; 
  assign _T_304 = $signed(_T_303) & $signed(-39'sh4000000); 
  assign _T_305 = $signed(_T_304); 
  assign _T_306 = $signed(_T_305) == $signed(39'sh0); 
  assign _T_307 = _T_266 | _T_271; 
  assign _T_308 = _T_307 | _T_276; 
  assign _T_309 = _T_308 | _T_281; 
  assign _T_310 = _T_309 | _T_286; 
  assign _T_311 = _T_310 | _T_291; 
  assign _T_312 = _T_311 | _T_296; 
  assign _T_313 = _T_312 | _T_301; 
  assign _T_314 = _T_313 | _T_306; 
  assign _T_315 = _T_259 & _T_314; 
  assign _T_317 = _T_257 | _T_315; 
  assign _T_318 = auto_in_ar_bits_addr[2:0]; 
  assign _GEN_7 = {{11'd0}, _T_318}; 
  assign _T_319 = 14'h3000 | _GEN_7; 
  assign _T_320 = _T_317 ? auto_in_ar_bits_addr : {{24'd0}, _T_319}; 
  assign _T_345 = _T_334_0[2:0]; 
  assign _T_346 = {auto_in_ar_bits_id,_T_345}; 
  assign _T_347 = {_T_346,1'h0}; 
  assign _T_348 = auto_in_ar_valid == 1'h0; 
  assign _T_350 = 30'h7fff << _T_247; 
  assign _T_351 = _T_350[14:0]; 
  assign _T_352 = ~ _T_351; 
  assign _T_353 = _T_226 == _T_352; 
  assign _T_354 = _T_348 | _T_353; 
  assign _T_356 = _T_354 | reset; 
  assign _T_357 = _T_356 == 1'h0; 
  assign _T_419 = _T_247[1:0]; 
  assign _T_420 = 4'h1 << _T_419; 
  assign _T_421 = _T_420[2:0]; 
  assign _T_422 = _T_421 | 3'h1; 
  assign _T_423 = _T_247 >= 4'h3; 
  assign _T_424 = _T_422[2]; 
  assign _T_425 = _T_320[2]; 
  assign _T_426 = _T_425 == 1'h0; 
  assign _T_428 = _T_424 & _T_426; 
  assign _T_429 = _T_423 | _T_428; 
  assign _T_431 = _T_424 & _T_425; 
  assign _T_432 = _T_423 | _T_431; 
  assign _T_433 = _T_422[1]; 
  assign _T_434 = _T_320[1]; 
  assign _T_435 = _T_434 == 1'h0; 
  assign _T_436 = _T_426 & _T_435; 
  assign _T_437 = _T_433 & _T_436; 
  assign _T_438 = _T_429 | _T_437; 
  assign _T_439 = _T_426 & _T_434; 
  assign _T_440 = _T_433 & _T_439; 
  assign _T_441 = _T_429 | _T_440; 
  assign _T_442 = _T_425 & _T_435; 
  assign _T_443 = _T_433 & _T_442; 
  assign _T_444 = _T_432 | _T_443; 
  assign _T_445 = _T_425 & _T_434; 
  assign _T_446 = _T_433 & _T_445; 
  assign _T_447 = _T_432 | _T_446; 
  assign _T_448 = _T_422[0]; 
  assign _T_449 = _T_320[0]; 
  assign _T_450 = _T_449 == 1'h0; 
  assign _T_451 = _T_436 & _T_450; 
  assign _T_452 = _T_448 & _T_451; 
  assign _T_453 = _T_438 | _T_452; 
  assign _T_454 = _T_436 & _T_449; 
  assign _T_455 = _T_448 & _T_454; 
  assign _T_456 = _T_438 | _T_455; 
  assign _T_457 = _T_439 & _T_450; 
  assign _T_458 = _T_448 & _T_457; 
  assign _T_459 = _T_441 | _T_458; 
  assign _T_460 = _T_439 & _T_449; 
  assign _T_461 = _T_448 & _T_460; 
  assign _T_462 = _T_441 | _T_461; 
  assign _T_463 = _T_442 & _T_450; 
  assign _T_464 = _T_448 & _T_463; 
  assign _T_465 = _T_444 | _T_464; 
  assign _T_466 = _T_442 & _T_449; 
  assign _T_467 = _T_448 & _T_466; 
  assign _T_468 = _T_444 | _T_467; 
  assign _T_469 = _T_445 & _T_450; 
  assign _T_470 = _T_448 & _T_469; 
  assign _T_471 = _T_447 | _T_470; 
  assign _T_472 = _T_445 & _T_449; 
  assign _T_473 = _T_448 & _T_472; 
  assign _T_474 = _T_447 | _T_473; 
  assign _T_475 = {_T_456,_T_453}; 
  assign _T_476 = {_T_462,_T_459}; 
  assign _T_477 = {_T_476,_T_475}; 
  assign _T_478 = {_T_468,_T_465}; 
  assign _T_479 = {_T_474,_T_471}; 
  assign _T_480 = {_T_479,_T_478}; 
  assign _T_481 = {_T_480,_T_477}; 
  assign _T_711 = _T_710 == 8'h0; 
  assign _T_636 = auto_in_aw_valid & auto_in_w_valid; 
  assign _T_713 = {_T_636,auto_in_ar_valid}; 
  assign _T_722 = ~ _T_721; 
  assign _T_723 = _T_713 & _T_722; 
  assign _T_724 = {_T_723,_T_713}; 
  assign _T_725 = _T_724[3:1]; 
  assign _GEN_8 = {{1'd0}, _T_725}; 
  assign _T_726 = _T_724 | _GEN_8; 
  assign _T_728 = _T_726[3:1]; 
  assign _GEN_9 = {{2'd0}, _T_721}; 
  assign _T_729 = _GEN_9 << 2; 
  assign _GEN_10 = {{1'd0}, _T_728}; 
  assign _T_730 = _GEN_10 | _T_729; 
  assign _T_731 = _T_730[3:2]; 
  assign _T_732 = _T_730[1:0]; 
  assign _T_733 = _T_731 & _T_732; 
  assign _T_734 = ~ _T_733; 
  assign _T_743 = _T_734[0]; 
  assign _T_825_0 = _T_711 ? _T_743 : _T_806_0; 
  assign _T_833 = auto_out_a_ready & _T_825_0; 
  assign _T_482 = _T_833 & auto_in_ar_valid; 
  assign _T_485 = _T_334_0 + 4'h1; 
  assign _T_489 = {auto_in_aw_bits_len,8'hff}; 
  assign _GEN_11 = {{7'd0}, _T_489}; 
  assign _T_490 = _GEN_11 << auto_in_aw_bits_size; 
  assign _T_491 = _T_490[22:8]; 
  assign _GEN_12 = {{1'd0}, _T_491}; 
  assign _T_492 = _GEN_12 << 1; 
  assign _T_493 = _T_492 | 16'h1; 
  assign _T_494 = {1'h0,_T_491}; 
  assign _T_495 = ~ _T_494; 
  assign _T_496 = _T_493 & _T_495; 
  assign _T_497 = _T_496[15:8]; 
  assign _T_498 = _T_496[7:0]; 
  assign _T_499 = _T_497 != 8'h0; 
  assign _T_500 = _T_497 | _T_498; 
  assign _T_501 = _T_500[7:4]; 
  assign _T_502 = _T_500[3:0]; 
  assign _T_503 = _T_501 != 4'h0; 
  assign _T_504 = _T_501 | _T_502; 
  assign _T_505 = _T_504[3:2]; 
  assign _T_506 = _T_504[1:0]; 
  assign _T_507 = _T_505 != 2'h0; 
  assign _T_508 = _T_505 | _T_506; 
  assign _T_509 = _T_508[1]; 
  assign _T_510 = {_T_507,_T_509}; 
  assign _T_511 = {_T_503,_T_510}; 
  assign _T_512 = {_T_499,_T_511}; 
  assign _T_514 = _T_512 <= 4'h7; 
  assign _T_517 = auto_in_aw_bits_addr ^ 38'h3000; 
  assign _T_518 = {1'b0,$signed(_T_517)}; 
  assign _T_519 = $signed(_T_518) & $signed(-39'sh1000); 
  assign _T_520 = $signed(_T_519); 
  assign _T_521 = $signed(_T_520) == $signed(39'sh0); 
  assign _T_522 = auto_in_aw_bits_addr ^ 38'h40000000; 
  assign _T_523 = {1'b0,$signed(_T_522)}; 
  assign _T_524 = $signed(_T_523) & $signed(-39'sh20000000); 
  assign _T_525 = $signed(_T_524); 
  assign _T_526 = $signed(_T_525) == $signed(39'sh0); 
  assign _T_527 = _T_521 | _T_526; 
  assign _T_528 = _T_514 & _T_527; 
  assign _T_530 = _T_512 <= 4'h6; 
  assign _T_533 = auto_in_aw_bits_addr ^ 38'h64000000; 
  assign _T_534 = {1'b0,$signed(_T_533)}; 
  assign _T_535 = $signed(_T_534) & $signed(-39'sh2000); 
  assign _T_536 = $signed(_T_535); 
  assign _T_537 = $signed(_T_536) == $signed(39'sh0); 
  assign _T_538 = auto_in_aw_bits_addr ^ 38'h64002000; 
  assign _T_539 = {1'b0,$signed(_T_538)}; 
  assign _T_540 = $signed(_T_539) & $signed(-39'sh1000); 
  assign _T_541 = $signed(_T_540); 
  assign _T_542 = $signed(_T_541) == $signed(39'sh0); 
  assign _T_543 = auto_in_aw_bits_addr ^ 38'hc000000; 
  assign _T_544 = {1'b0,$signed(_T_543)}; 
  assign _T_545 = $signed(_T_544) & $signed(-39'sh4000000); 
  assign _T_546 = $signed(_T_545); 
  assign _T_547 = $signed(_T_546) == $signed(39'sh0); 
  assign _T_548 = auto_in_aw_bits_addr ^ 38'h2000000; 
  assign _T_549 = {1'b0,$signed(_T_548)}; 
  assign _T_550 = $signed(_T_549) & $signed(-39'sh10000); 
  assign _T_551 = $signed(_T_550); 
  assign _T_552 = $signed(_T_551) == $signed(39'sh0); 
  assign _T_554 = {1'b0,$signed(auto_in_aw_bits_addr)}; 
  assign _T_555 = $signed(_T_554) & $signed(-39'sh1000); 
  assign _T_556 = $signed(_T_555); 
  assign _T_557 = $signed(_T_556) == $signed(39'sh0); 
  assign _T_558 = auto_in_aw_bits_addr ^ 38'h80000000; 
  assign _T_559 = {1'b0,$signed(_T_558)}; 
  assign _T_560 = $signed(_T_559) & $signed(-39'sh40000000); 
  assign _T_561 = $signed(_T_560); 
  assign _T_562 = $signed(_T_561) == $signed(39'sh0); 
  assign _T_563 = auto_in_aw_bits_addr ^ 38'h2000000000; 
  assign _T_564 = {1'b0,$signed(_T_563)}; 
  assign _T_565 = $signed(_T_564) & $signed(-39'sh4000000); 
  assign _T_566 = $signed(_T_565); 
  assign _T_567 = $signed(_T_566) == $signed(39'sh0); 
  assign _T_568 = _T_537 | _T_542; 
  assign _T_569 = _T_568 | _T_547; 
  assign _T_570 = _T_569 | _T_552; 
  assign _T_571 = _T_570 | _T_557; 
  assign _T_572 = _T_571 | _T_562; 
  assign _T_573 = _T_572 | _T_567; 
  assign _T_574 = _T_530 & _T_573; 
  assign _T_583 = _T_528 | _T_574; 
  assign _T_585 = auto_in_aw_bits_addr[2:0]; 
  assign _GEN_13 = {{11'd0}, _T_585}; 
  assign _T_586 = 14'h3000 | _GEN_13; 
  assign _T_587 = _T_583 ? auto_in_aw_bits_addr : {{24'd0}, _T_586}; 
  assign _T_612 = _T_601_0[2:0]; 
  assign _T_613 = {auto_in_aw_bits_id,_T_612}; 
  assign _T_614 = {_T_613,1'h1}; 
  assign _T_615 = auto_in_aw_valid == 1'h0; 
  assign _T_617 = 30'h7fff << _T_512; 
  assign _T_618 = _T_617[14:0]; 
  assign _T_619 = ~ _T_618; 
  assign _T_620 = _T_491 == _T_619; 
  assign _T_621 = _T_615 | _T_620; 
  assign _T_623 = _T_621 | reset; 
  assign _T_624 = _T_623 == 1'h0; 
  assign _T_626 = auto_in_aw_bits_len == 8'h0; 
  assign _T_627 = _T_615 | _T_626; 
  assign _T_628 = auto_in_aw_bits_size == 3'h3; 
  assign _T_629 = _T_627 | _T_628; 
  assign _T_631 = _T_629 | reset; 
  assign _T_632 = _T_631 == 1'h0; 
  assign _T_744 = _T_734[1]; 
  assign _T_825_1 = _T_711 ? _T_744 : _T_806_1; 
  assign _T_834 = auto_out_a_ready & _T_825_1; 
  assign _T_633 = _T_834 & auto_in_w_valid; 
  assign _T_634 = _T_633 & auto_in_w_bits_last; 
  assign _T_705 = _T_634 & auto_in_aw_valid; 
  assign _T_708 = _T_601_0 + 4'h1; 
  assign _T_712 = _T_711 & auto_out_a_ready; 
  assign _T_715 = _T_713 == _T_713; 
  assign _T_717 = _T_715 | reset; 
  assign _T_718 = _T_717 == 1'h0; 
  assign _T_735 = _T_713 != 2'h0; 
  assign _T_736 = _T_712 & _T_735; 
  assign _T_737 = _T_734 & _T_713; 
  assign _GEN_14 = {{1'd0}, _T_737}; 
  assign _T_738 = _GEN_14 << 1; 
  assign _T_739 = _T_738[1:0]; 
  assign _T_740 = _T_737 | _T_739; 
  assign _T_753 = _T_743 & auto_in_ar_valid; 
  assign _T_754 = _T_744 & _T_636; 
  assign _T_764 = _T_753 | _T_754; 
  assign _T_766 = _T_753 == 1'h0; 
  assign _T_769 = _T_754 == 1'h0; 
  assign _T_770 = _T_766 | _T_769; 
  assign _T_773 = _T_770 | reset; 
  assign _T_774 = _T_773 == 1'h0; 
  assign _T_775 = auto_in_ar_valid | _T_636; 
  assign _T_776 = _T_775 == 1'h0; 
  assign _T_778 = _T_776 | _T_764; 
  assign _T_780 = _T_778 | reset; 
  assign _T_781 = _T_780 == 1'h0; 
  assign _T_837 = _T_806_0 ? auto_in_ar_valid : 1'h0; 
  assign _T_838 = _T_806_1 ? _T_636 : 1'h0; 
  assign _T_839 = _T_837 | _T_838; 
  assign _T_842 = _T_711 ? _T_775 : _T_839; 
  assign _T_785 = auto_out_a_ready & _T_842; 
  assign _GEN_15 = {{7'd0}, _T_785}; 
  assign _T_786 = _T_710 - _GEN_15; 
  assign _T_787 = $unsigned(_T_786); 
  assign _T_788 = _T_787[7:0]; 
  assign _T_817_0 = _T_711 ? _T_753 : _T_806_0; 
  assign _T_817_1 = _T_711 ? _T_754 : _T_806_1; 
  assign _T_845 = {_T_320,_T_481}; 
  assign _T_846 = {_T_845,65'h0}; 
  assign _T_417_size = _T_247[2:0]; 
  assign _T_417_source = _T_347[3:0]; 
  assign _T_847 = {_T_417_size,_T_417_source}; 
  assign _T_849 = {6'h20,_T_847}; 
  assign _T_850 = {_T_849,_T_846}; 
  assign _T_851 = _T_817_0 ? _T_850 : 124'h0; 
  assign _T_852 = {auto_in_w_bits_data,1'h0}; 
  assign _T_853 = {_T_587,auto_in_w_bits_strb}; 
  assign _T_854 = {_T_853,_T_852}; 
  assign _T_704_size = _T_512[2:0]; 
  assign _T_704_source = _T_614[3:0]; 
  assign _T_855 = {_T_704_size,_T_704_source}; 
  assign _T_857 = {6'h8,_T_855}; 
  assign _T_858 = {_T_857,_T_854}; 
  assign _T_859 = _T_817_1 ? _T_858 : 124'h0; 
  assign _T_860 = _T_851 | _T_859; 
  assign _T_879 = auto_out_d_bits_denied | auto_out_d_bits_corrupt; 
  assign _T_881 = auto_out_d_bits_opcode[0]; 
  assign _T_876_ready = Queue_io_enq_ready; 
  assign _T_873_ready = Queue_1_io_enq_ready; 
  assign _T_903 = _T_881 ? _T_876_ready : _T_873_ready; 
  assign _T_882 = _T_903 & auto_out_d_valid; 
  assign _T_884 = 14'h7f << auto_out_d_bits_size; 
  assign _T_885 = _T_884[6:0]; 
  assign _T_886 = ~ _T_885; 
  assign _T_887 = _T_886[6:3]; 
  assign _T_889 = _T_881 ? _T_887 : 4'h0; 
  assign _T_892 = _T_891 - 4'h1; 
  assign _T_893 = $unsigned(_T_892); 
  assign _T_894 = _T_893[3:0]; 
  assign _T_895 = _T_891 == 4'h0; 
  assign _T_896 = _T_891 == 4'h1; 
  assign _T_897 = _T_889 == 4'h0; 
  assign _T_905 = _T_881 == 1'h0; 
  assign _T_952 = _T_938_0 != _T_601_0; 
  assign _T_921_valid = Queue_1_io_deq_valid; 
  assign _T_957 = _T_921_valid & _T_952; 
  assign _T_953 = auto_in_b_ready & _T_957; 
  assign _T_956 = _T_938_0 + 4'h1; 
  assign auto_in_aw_ready = _T_633 & auto_in_w_bits_last; 
  assign auto_in_w_ready = _T_834 & auto_in_aw_valid; 
  assign auto_in_b_valid = _T_921_valid & _T_952; 
  assign auto_in_b_bits_resp = Queue_1_io_deq_bits_resp; 
  assign auto_in_ar_ready = auto_out_a_ready & _T_825_0; 
  assign auto_in_r_valid = Queue_io_deq_valid; 
  assign auto_in_r_bits_data = Queue_io_deq_bits_data; 
  assign auto_in_r_bits_resp = Queue_io_deq_bits_resp; 
  assign auto_in_r_bits_last = Queue_io_deq_bits_last; 
  assign auto_out_a_valid = _T_711 ? _T_775 : _T_839; 
  assign auto_out_a_bits_opcode = _T_860[123:121]; 
  assign auto_out_a_bits_param = _T_860[120:118]; 
  assign auto_out_a_bits_size = _T_860[117:115]; 
  assign auto_out_a_bits_source = _T_860[114:111]; 
  assign auto_out_a_bits_address = _T_860[110:73]; 
  assign auto_out_a_bits_mask = _T_860[72:65]; 
  assign auto_out_a_bits_data = _T_860[64:1]; 
  assign auto_out_a_bits_corrupt = _T_860[0]; 
  assign auto_out_d_ready = _T_881 ? _T_876_ready : _T_873_ready; 
  assign Queue_clock = clock; 
  assign Queue_reset = reset; 
  assign Queue_io_enq_valid = auto_out_d_valid & _T_881; 
  assign Queue_io_enq_bits_data = auto_out_d_bits_data; 
  assign Queue_io_enq_bits_resp = _T_879 ? 2'h2 : 2'h0; 
  assign Queue_io_enq_bits_last = _T_896 | _T_897; 
  assign Queue_io_deq_ready = auto_in_r_ready; 
  assign Queue_1_clock = clock; 
  assign Queue_1_reset = reset; 
  assign Queue_1_io_enq_valid = auto_out_d_valid & _T_905; 
  assign Queue_1_io_enq_bits_resp = _T_879 ? 2'h2 : 2'h0; 
  assign Queue_1_io_deq_ready = auto_in_b_ready & _T_952; 
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
  _T_334_0 = _RAND_0[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  _T_710 = _RAND_1[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  _T_721 = _RAND_2[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  _T_806_0 = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  _T_601_0 = _RAND_4[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  _T_806_1 = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  _T_891 = _RAND_6[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  _T_938_0 = _RAND_7[3:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      _T_334_0 <= 4'h0;
    end else begin
      if (_T_482) begin
        _T_334_0 <= _T_485;
      end
    end
    if (reset) begin
      _T_710 <= 8'h0;
    end else begin
      if (_T_712) begin
        if (_T_754) begin
          _T_710 <= auto_in_aw_bits_len;
        end else begin
          _T_710 <= 8'h0;
        end
      end else begin
        _T_710 <= _T_788;
      end
    end
    if (reset) begin
      _T_721 <= 2'h3;
    end else begin
      if (_T_736) begin
        _T_721 <= _T_740;
      end
    end
    if (reset) begin
      _T_806_0 <= 1'h0;
    end else begin
      if (_T_711) begin
        _T_806_0 <= _T_753;
      end
    end
    if (reset) begin
      _T_601_0 <= 4'h0;
    end else begin
      if (_T_705) begin
        _T_601_0 <= _T_708;
      end
    end
    if (reset) begin
      _T_806_1 <= 1'h0;
    end else begin
      if (_T_711) begin
        _T_806_1 <= _T_754;
      end
    end
    if (reset) begin
      _T_891 <= 4'h0;
    end else begin
      if (_T_882) begin
        if (_T_895) begin
          if (_T_881) begin
            _T_891 <= _T_887;
          end else begin
            _T_891 <= 4'h0;
          end
        end else begin
          _T_891 <= _T_894;
        end
      end
    end
    if (reset) begin
      _T_938_0 <= 4'h0;
    end else begin
      if (_T_953) begin
        _T_938_0 <= _T_956;
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_357) begin
          $fwrite(32'h80000002,"Assertion failed\n    at ToTL.scala:77 assert (!in.ar.valid || r_size1 === UIntToOH1(r_size, beatCountBits)) // because aligned\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_357) begin
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
        if (_T_624) begin
          $fwrite(32'h80000002,"Assertion failed\n    at ToTL.scala:95 assert (!in.aw.valid || w_size1 === UIntToOH1(w_size, beatCountBits)) // because aligned\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_624) begin
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
        if (_T_632) begin
          $fwrite(32'h80000002,"Assertion failed\n    at ToTL.scala:96 assert (!in.aw.valid || in.aw.bits.len === UInt(0) || in.aw.bits.size === UInt(log2Ceil(beatBytes))) // because aligned\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_632) begin
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
        if (_T_718) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Arbiter.scala:19 assert (valid === valids)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_718) begin
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
        if (_T_774) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Arbiter.scala:68 assert((prefixOR zip winner) map { case (p,w) => !p || !w } reduce {_ && _})\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_774) begin
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
        if (_T_781) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Arbiter.scala:70 assert (!valids.reduce(_||_) || winner.reduce(_||_))\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_781) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
