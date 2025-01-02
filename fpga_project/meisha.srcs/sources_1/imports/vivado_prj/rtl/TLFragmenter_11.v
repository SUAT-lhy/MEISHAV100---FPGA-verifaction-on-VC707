module TLFragmenter_11( 
  input         clock, 
  input         reset, 
  output        auto_in_a_ready, 
  input         auto_in_a_valid, 
  input  [2:0]  auto_in_a_bits_opcode, 
  input  [2:0]  auto_in_a_bits_param, 
  input  [2:0]  auto_in_a_bits_size, 
  input  [4:0]  auto_in_a_bits_source, 
  input  [37:0] auto_in_a_bits_address, 
  input  [3:0]  auto_in_a_bits_mask, 
  input  [31:0] auto_in_a_bits_data, 
  input         auto_in_a_bits_corrupt, 
  input         auto_in_d_ready, 
  output        auto_in_d_valid, 
  output [2:0]  auto_in_d_bits_opcode, 
  output [2:0]  auto_in_d_bits_size, 
  output [4:0]  auto_in_d_bits_source, 
  output        auto_in_d_bits_denied, 
  output [31:0] auto_in_d_bits_data, 
  output        auto_in_d_bits_corrupt, 
  input         auto_out_a_ready, 
  output        auto_out_a_valid, 
  output [2:0]  auto_out_a_bits_opcode, 
  output [2:0]  auto_out_a_bits_param, 
  output [1:0]  auto_out_a_bits_size, 
  output [9:0]  auto_out_a_bits_source, 
  output [37:0] auto_out_a_bits_address, 
  output [3:0]  auto_out_a_bits_mask, 
  output [31:0] auto_out_a_bits_data, 
  output        auto_out_a_bits_corrupt, 
  output        auto_out_d_ready, 
  input         auto_out_d_valid, 
  input  [2:0]  auto_out_d_bits_opcode, 
  input  [1:0]  auto_out_d_bits_size, 
  input  [9:0]  auto_out_d_bits_source, 
  input         auto_out_d_bits_denied, 
  input  [31:0] auto_out_d_bits_data, 
  input         auto_out_d_bits_corrupt 
);
  wire  TLMonitor_clock; 
  wire  TLMonitor_reset; 
  wire  TLMonitor_io_in_a_ready; 
  wire  TLMonitor_io_in_a_valid; 
  wire [2:0] TLMonitor_io_in_a_bits_opcode; 
  wire [2:0] TLMonitor_io_in_a_bits_param; 
  wire [2:0] TLMonitor_io_in_a_bits_size; 
  wire [4:0] TLMonitor_io_in_a_bits_source; 
  wire [37:0] TLMonitor_io_in_a_bits_address; 
  wire [3:0] TLMonitor_io_in_a_bits_mask; 
  wire  TLMonitor_io_in_a_bits_corrupt; 
  wire  TLMonitor_io_in_d_ready; 
  wire  TLMonitor_io_in_d_valid; 
  wire [2:0] TLMonitor_io_in_d_bits_opcode; 
  wire [2:0] TLMonitor_io_in_d_bits_size; 
  wire [4:0] TLMonitor_io_in_d_bits_source; 
  wire  TLMonitor_io_in_d_bits_denied; 
  wire  TLMonitor_io_in_d_bits_corrupt; 
  wire  Repeater_clock; 
  wire  Repeater_reset; 
  wire  Repeater_io_repeat; 
  wire  Repeater_io_full; 
  wire  Repeater_io_enq_ready; 
  wire  Repeater_io_enq_valid; 
  wire [2:0] Repeater_io_enq_bits_opcode; 
  wire [2:0] Repeater_io_enq_bits_param; 
  wire [2:0] Repeater_io_enq_bits_size; 
  wire [4:0] Repeater_io_enq_bits_source; 
  wire [37:0] Repeater_io_enq_bits_address; 
  wire [3:0] Repeater_io_enq_bits_mask; 
  wire  Repeater_io_enq_bits_corrupt; 
  wire  Repeater_io_deq_ready; 
  wire  Repeater_io_deq_valid; 
  wire [2:0] Repeater_io_deq_bits_opcode; 
  wire [2:0] Repeater_io_deq_bits_param; 
  wire [2:0] Repeater_io_deq_bits_size; 
  wire [4:0] Repeater_io_deq_bits_source; 
  wire [37:0] Repeater_io_deq_bits_address; 
  wire [3:0] Repeater_io_deq_bits_mask; 
  wire  Repeater_io_deq_bits_corrupt; 
  reg [3:0] _T_244; 
  reg [31:0] _RAND_0;
  reg [2:0] _T_246; 
  reg [31:0] _RAND_1;
  reg  _T_248; 
  reg [31:0] _RAND_2;
  wire [3:0] _T_249; 
  wire  _T_250; 
  wire  _T_251; 
  wire [3:0] _T_253; 
  wire [2:0] _T_254; 
  wire [4:0] _T_256; 
  wire [1:0] _T_257; 
  wire [1:0] _T_258; 
  wire  _T_259; 
  wire  _T_271; 
  wire  _T_272; 
  wire [5:0] _GEN_10; 
  wire [5:0] _T_273; 
  wire [5:0] _GEN_11; 
  wire [5:0] _T_274; 
  wire [6:0] _GEN_12; 
  wire [6:0] _T_275; 
  wire [6:0] _T_276; 
  wire [6:0] _T_277; 
  wire [6:0] _T_278; 
  wire [6:0] _T_279; 
  wire [2:0] _T_280; 
  wire [3:0] _T_281; 
  wire  _T_282; 
  wire [3:0] _GEN_13; 
  wire [3:0] _T_283; 
  wire [1:0] _T_284; 
  wire [1:0] _T_285; 
  wire  _T_286; 
  wire [1:0] _T_287; 
  wire  _T_288; 
  wire [1:0] _T_289; 
  wire [2:0] _T_290; 
  wire  _T_297; 
  wire  _T_299; 
  wire  _T_300; 
  wire  _T_301; 
  wire  _T_291; 
  wire [3:0] _GEN_14; 
  wire [4:0] _T_292; 
  wire [4:0] _T_293; 
  wire [3:0] _T_294; 
  wire  _T_296; 
  wire  _T_302; 
  reg  _T_307; 
  reg [31:0] _RAND_3;
  wire  _T_308; 
  wire  _T_309; 
  wire  _T_310; 
  reg  _T_313; 
  reg [31:0] _RAND_4;
  wire  _GEN_6; 
  wire  _T_339; 
  wire [2:0] _T_340; 
  wire [12:0] _T_342; 
  wire [5:0] _T_343; 
  wire [5:0] _T_344; 
  wire [8:0] _T_346; 
  wire [1:0] _T_347; 
  wire [1:0] _T_348; 
  wire  _T_349; 
  wire  _T_350; 
  reg [3:0] _T_353; 
  reg [31:0] _RAND_5;
  wire  _T_354; 
  wire [3:0] _T_355; 
  wire [4:0] _T_356; 
  wire [4:0] _T_357; 
  wire [3:0] _T_358; 
  wire [3:0] _T_359; 
  wire [3:0] _T_360; 
  wire [3:0] _T_363; 
  reg  _T_371; 
  reg [31:0] _RAND_6;
  wire  _GEN_8; 
  wire  _T_373; 
  wire  _T_92_a_valid; 
  wire  _T_374; 
  wire  _T_375; 
  wire  _T_376; 
  wire [5:0] _GEN_15; 
  wire [5:0] _T_378; 
  wire [5:0] _T_379; 
  wire [5:0] _T_380; 
  wire [5:0] _GEN_16; 
  wire [5:0] _T_381; 
  wire [5:0] _T_382; 
  wire [5:0] _T_383; 
  wire [37:0] _GEN_17; 
  wire [5:0] _T_385; 
  wire  _T_387; 
  wire  _T_389; 
  wire  _T_391; 
  wire  _T_392; 
  wire  _T_394; 
  wire  _T_395; 
  wire  _T_397; 
  wire  _T_398; 
  TLMonitor_85 TLMonitor ( 
    .clock(TLMonitor_clock),
    .reset(TLMonitor_reset),
    .io_in_a_ready(TLMonitor_io_in_a_ready),
    .io_in_a_valid(TLMonitor_io_in_a_valid),
    .io_in_a_bits_opcode(TLMonitor_io_in_a_bits_opcode),
    .io_in_a_bits_param(TLMonitor_io_in_a_bits_param),
    .io_in_a_bits_size(TLMonitor_io_in_a_bits_size),
    .io_in_a_bits_source(TLMonitor_io_in_a_bits_source),
    .io_in_a_bits_address(TLMonitor_io_in_a_bits_address),
    .io_in_a_bits_mask(TLMonitor_io_in_a_bits_mask),
    .io_in_a_bits_corrupt(TLMonitor_io_in_a_bits_corrupt),
    .io_in_d_ready(TLMonitor_io_in_d_ready),
    .io_in_d_valid(TLMonitor_io_in_d_valid),
    .io_in_d_bits_opcode(TLMonitor_io_in_d_bits_opcode),
    .io_in_d_bits_size(TLMonitor_io_in_d_bits_size),
    .io_in_d_bits_source(TLMonitor_io_in_d_bits_source),
    .io_in_d_bits_denied(TLMonitor_io_in_d_bits_denied),
    .io_in_d_bits_corrupt(TLMonitor_io_in_d_bits_corrupt)
  );
  Repeater_9 Repeater ( 
    .clock(Repeater_clock),
    .reset(Repeater_reset),
    .io_repeat(Repeater_io_repeat),
    .io_full(Repeater_io_full),
    .io_enq_ready(Repeater_io_enq_ready),
    .io_enq_valid(Repeater_io_enq_valid),
    .io_enq_bits_opcode(Repeater_io_enq_bits_opcode),
    .io_enq_bits_param(Repeater_io_enq_bits_param),
    .io_enq_bits_size(Repeater_io_enq_bits_size),
    .io_enq_bits_source(Repeater_io_enq_bits_source),
    .io_enq_bits_address(Repeater_io_enq_bits_address),
    .io_enq_bits_mask(Repeater_io_enq_bits_mask),
    .io_enq_bits_corrupt(Repeater_io_enq_bits_corrupt),
    .io_deq_ready(Repeater_io_deq_ready),
    .io_deq_valid(Repeater_io_deq_valid),
    .io_deq_bits_opcode(Repeater_io_deq_bits_opcode),
    .io_deq_bits_param(Repeater_io_deq_bits_param),
    .io_deq_bits_size(Repeater_io_deq_bits_size),
    .io_deq_bits_source(Repeater_io_deq_bits_source),
    .io_deq_bits_address(Repeater_io_deq_bits_address),
    .io_deq_bits_mask(Repeater_io_deq_bits_mask),
    .io_deq_bits_corrupt(Repeater_io_deq_bits_corrupt)
  );
  assign _T_249 = auto_out_d_bits_source[3:0]; 
  assign _T_250 = _T_244 == 4'h0; 
  assign _T_251 = _T_249 == 4'h0; 
  assign _T_253 = 4'h1 << auto_out_d_bits_size; 
  assign _T_254 = _T_253[2:0]; 
  assign _T_256 = 5'h3 << auto_out_d_bits_size; 
  assign _T_257 = _T_256[1:0]; 
  assign _T_258 = ~ _T_257; 
  assign _T_259 = auto_out_d_bits_opcode[0]; 
  assign _T_271 = _T_254[2:2]; 
  assign _T_272 = _T_259 ? 1'h1 : _T_271; 
  assign _GEN_10 = {{2'd0}, _T_249}; 
  assign _T_273 = _GEN_10 << 2; 
  assign _GEN_11 = {{4'd0}, _T_258}; 
  assign _T_274 = _T_273 | _GEN_11; 
  assign _GEN_12 = {{1'd0}, _T_274}; 
  assign _T_275 = _GEN_12 << 1; 
  assign _T_276 = _T_275 | 7'h1; 
  assign _T_277 = {1'h0,_T_274}; 
  assign _T_278 = ~ _T_277; 
  assign _T_279 = _T_276 & _T_278; 
  assign _T_280 = _T_279[6:4]; 
  assign _T_281 = _T_279[3:0]; 
  assign _T_282 = _T_280 != 3'h0; 
  assign _GEN_13 = {{1'd0}, _T_280}; 
  assign _T_283 = _GEN_13 | _T_281; 
  assign _T_284 = _T_283[3:2]; 
  assign _T_285 = _T_283[1:0]; 
  assign _T_286 = _T_284 != 2'h0; 
  assign _T_287 = _T_284 | _T_285; 
  assign _T_288 = _T_287[1]; 
  assign _T_289 = {_T_286,_T_288}; 
  assign _T_290 = {_T_282,_T_289}; 
  assign _T_297 = _T_259 == 1'h0; 
  assign _T_299 = _T_251 == 1'h0; 
  assign _T_300 = _T_297 & _T_299; 
  assign _T_301 = auto_in_d_ready | _T_300; 
  assign _T_291 = _T_301 & auto_out_d_valid; 
  assign _GEN_14 = {{3'd0}, _T_272}; 
  assign _T_292 = _T_244 - _GEN_14; 
  assign _T_293 = $unsigned(_T_292); 
  assign _T_294 = _T_293[3:0]; 
  assign _T_296 = auto_out_d_bits_source[4]; 
  assign _T_302 = _T_300 == 1'h0; 
  assign _T_308 = _T_250 == 1'h0; 
  assign _T_309 = _T_308 & _T_307; 
  assign _T_310 = _T_309 | auto_out_d_bits_denied; 
  assign _GEN_6 = _T_250 ? auto_out_d_bits_denied : _T_313; 
  assign _T_339 = Repeater_io_deq_bits_size > 3'h2; 
  assign _T_340 = _T_339 ? 3'h2 : Repeater_io_deq_bits_size; 
  assign _T_342 = 13'h3f << Repeater_io_deq_bits_size; 
  assign _T_343 = _T_342[5:0]; 
  assign _T_344 = ~ _T_343; 
  assign _T_346 = 9'h3 << _T_340; 
  assign _T_347 = _T_346[1:0]; 
  assign _T_348 = ~ _T_347; 
  assign _T_349 = Repeater_io_deq_bits_opcode[2]; 
  assign _T_350 = _T_349 == 1'h0; 
  assign _T_354 = _T_353 == 4'h0; 
  assign _T_355 = _T_344[5:2]; 
  assign _T_356 = _T_353 - 4'h1; 
  assign _T_357 = $unsigned(_T_356); 
  assign _T_358 = _T_357[3:0]; 
  assign _T_359 = _T_354 ? _T_355 : _T_358; 
  assign _T_360 = ~ _T_359; 
  assign _T_363 = ~ _T_360; 
  assign _GEN_8 = _T_354 ? _T_248 : _T_371; 
  assign _T_373 = _GEN_8 == 1'h0; 
  assign _T_92_a_valid = Repeater_io_deq_valid; 
  assign _T_374 = auto_out_a_ready & _T_92_a_valid; 
  assign _T_375 = _T_350 == 1'h0; 
  assign _T_376 = _T_363 != 4'h0; 
  assign _GEN_15 = {{2'd0}, _T_359}; 
  assign _T_378 = _GEN_15 << 2; 
  assign _T_379 = ~ _T_344; 
  assign _T_380 = _T_378 | _T_379; 
  assign _GEN_16 = {{4'd0}, _T_348}; 
  assign _T_381 = _T_380 | _GEN_16; 
  assign _T_382 = _T_381 | 6'h3; 
  assign _T_383 = ~ _T_382; 
  assign _GEN_17 = {{32'd0}, _T_383}; 
  assign _T_385 = {Repeater_io_deq_bits_source,_T_373}; 
  assign _T_387 = Repeater_io_full == 1'h0; 
  assign _T_389 = _T_387 | _T_375; 
  assign _T_391 = _T_389 | reset; 
  assign _T_392 = _T_391 == 1'h0; 
  assign _T_394 = Repeater_io_deq_bits_mask == 4'hf; 
  assign _T_395 = _T_387 | _T_394; 
  assign _T_397 = _T_395 | reset; 
  assign _T_398 = _T_397 == 1'h0; 
  assign auto_in_a_ready = Repeater_io_enq_ready; 
  assign auto_in_d_valid = auto_out_d_valid & _T_302; 
  assign auto_in_d_bits_opcode = auto_out_d_bits_opcode; 
  assign auto_in_d_bits_size = _T_250 ? _T_290 : _T_246; 
  assign auto_in_d_bits_source = auto_out_d_bits_source[9:5]; 
  assign auto_in_d_bits_denied = _T_259 ? _GEN_6 : _T_310; 
  assign auto_in_d_bits_data = auto_out_d_bits_data; 
  assign auto_in_d_bits_corrupt = auto_out_d_bits_corrupt; 
  assign auto_out_a_valid = Repeater_io_deq_valid; 
  assign auto_out_a_bits_opcode = Repeater_io_deq_bits_opcode; 
  assign auto_out_a_bits_param = Repeater_io_deq_bits_param; 
  assign auto_out_a_bits_size = _T_340[1:0]; 
  assign auto_out_a_bits_source = {_T_385,_T_363}; 
  assign auto_out_a_bits_address = Repeater_io_deq_bits_address | _GEN_17; 
  assign auto_out_a_bits_mask = Repeater_io_full ? 4'hf : auto_in_a_bits_mask; 
  assign auto_out_a_bits_data = auto_in_a_bits_data; 
  assign auto_out_a_bits_corrupt = Repeater_io_deq_bits_corrupt; 
  assign auto_out_d_ready = auto_in_d_ready | _T_300; 
  assign TLMonitor_clock = clock; 
  assign TLMonitor_reset = reset; 
  assign TLMonitor_io_in_a_ready = Repeater_io_enq_ready; 
  assign TLMonitor_io_in_a_valid = auto_in_a_valid; 
  assign TLMonitor_io_in_a_bits_opcode = auto_in_a_bits_opcode; 
  assign TLMonitor_io_in_a_bits_param = auto_in_a_bits_param; 
  assign TLMonitor_io_in_a_bits_size = auto_in_a_bits_size; 
  assign TLMonitor_io_in_a_bits_source = auto_in_a_bits_source; 
  assign TLMonitor_io_in_a_bits_address = auto_in_a_bits_address; 
  assign TLMonitor_io_in_a_bits_mask = auto_in_a_bits_mask; 
  assign TLMonitor_io_in_a_bits_corrupt = auto_in_a_bits_corrupt; 
  assign TLMonitor_io_in_d_ready = auto_in_d_ready; 
  assign TLMonitor_io_in_d_valid = auto_out_d_valid & _T_302; 
  assign TLMonitor_io_in_d_bits_opcode = auto_out_d_bits_opcode; 
  assign TLMonitor_io_in_d_bits_size = _T_250 ? _T_290 : _T_246; 
  assign TLMonitor_io_in_d_bits_source = auto_out_d_bits_source[9:5]; 
  assign TLMonitor_io_in_d_bits_denied = _T_259 ? _GEN_6 : _T_310; 
  assign TLMonitor_io_in_d_bits_corrupt = auto_out_d_bits_corrupt; 
  assign Repeater_clock = clock; 
  assign Repeater_reset = reset; 
  assign Repeater_io_repeat = _T_375 & _T_376; 
  assign Repeater_io_enq_valid = auto_in_a_valid; 
  assign Repeater_io_enq_bits_opcode = auto_in_a_bits_opcode; 
  assign Repeater_io_enq_bits_param = auto_in_a_bits_param; 
  assign Repeater_io_enq_bits_size = auto_in_a_bits_size; 
  assign Repeater_io_enq_bits_source = auto_in_a_bits_source; 
  assign Repeater_io_enq_bits_address = auto_in_a_bits_address; 
  assign Repeater_io_enq_bits_mask = auto_in_a_bits_mask; 
  assign Repeater_io_enq_bits_corrupt = auto_in_a_bits_corrupt; 
  assign Repeater_io_deq_ready = auto_out_a_ready; 
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
  _T_244 = _RAND_0[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  _T_246 = _RAND_1[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  _T_248 = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  _T_307 = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  _T_313 = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  _T_353 = _RAND_5[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  _T_371 = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      _T_244 <= 4'h0;
    end else begin
      if (_T_291) begin
        if (_T_250) begin
          _T_244 <= _T_249;
        end else begin
          _T_244 <= _T_294;
        end
      end
    end
    if (_T_291) begin
      if (_T_250) begin
        _T_246 <= _T_290;
      end
    end
    if (reset) begin
      _T_248 <= 1'h0;
    end else begin
      if (_T_291) begin
        if (_T_250) begin
          _T_248 <= _T_296;
        end
      end
    end
    if (_T_291) begin
      _T_307 <= _T_310;
    end
    if (_T_250) begin
      _T_313 <= auto_out_d_bits_denied;
    end
    if (reset) begin
      _T_353 <= 4'h0;
    end else begin
      if (_T_374) begin
        _T_353 <= _T_363;
      end
    end
    if (_T_354) begin
      _T_371 <= _T_248;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Fragmenter.scala:180 assert (!out.d.valid || (acknum_fragment & acknum_size) === UInt(0))\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
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
        if (_T_392) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Fragmenter.scala:286 assert (!repeater.io.full || !aHasData)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_392) begin
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
        if (_T_398) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Fragmenter.scala:289 assert (!repeater.io.full || in_a.bits.mask === fullMask)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_398) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
