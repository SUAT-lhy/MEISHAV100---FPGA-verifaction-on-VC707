module TLFragmenter_3( 
  input         clock, 
  input         reset, 
  output        auto_in_a_ready, 
  input         auto_in_a_valid, 
  input  [2:0]  auto_in_a_bits_opcode, 
  input  [2:0]  auto_in_a_bits_param, 
  input  [2:0]  auto_in_a_bits_size, 
  input  [4:0]  auto_in_a_bits_source, 
  input  [16:0] auto_in_a_bits_address, 
  input  [3:0]  auto_in_a_bits_mask, 
  input         auto_in_a_bits_corrupt, 
  input         auto_in_d_ready, 
  output        auto_in_d_valid, 
  output [2:0]  auto_in_d_bits_size, 
  output [4:0]  auto_in_d_bits_source, 
  output [31:0] auto_in_d_bits_data, 
  input         auto_out_a_ready, 
  output        auto_out_a_valid, 
  output [2:0]  auto_out_a_bits_opcode, 
  output [2:0]  auto_out_a_bits_param, 
  output [1:0]  auto_out_a_bits_size, 
  output [9:0]  auto_out_a_bits_source, 
  output [16:0] auto_out_a_bits_address, 
  output [3:0]  auto_out_a_bits_mask, 
  output        auto_out_a_bits_corrupt, 
  output        auto_out_d_ready, 
  input         auto_out_d_valid, 
  input  [1:0]  auto_out_d_bits_size, 
  input  [9:0]  auto_out_d_bits_source, 
  input  [31:0] auto_out_d_bits_data 
);
  wire  TLMonitor_clock; 
  wire  TLMonitor_reset; 
  wire  TLMonitor_io_in_a_ready; 
  wire  TLMonitor_io_in_a_valid; 
  wire [2:0] TLMonitor_io_in_a_bits_opcode; 
  wire [2:0] TLMonitor_io_in_a_bits_param; 
  wire [2:0] TLMonitor_io_in_a_bits_size; 
  wire [4:0] TLMonitor_io_in_a_bits_source; 
  wire [16:0] TLMonitor_io_in_a_bits_address; 
  wire [3:0] TLMonitor_io_in_a_bits_mask; 
  wire  TLMonitor_io_in_a_bits_corrupt; 
  wire  TLMonitor_io_in_d_ready; 
  wire  TLMonitor_io_in_d_valid; 
  wire [2:0] TLMonitor_io_in_d_bits_size; 
  wire [4:0] TLMonitor_io_in_d_bits_source; 
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
  wire [16:0] Repeater_io_enq_bits_address; 
  wire [3:0] Repeater_io_enq_bits_mask; 
  wire  Repeater_io_enq_bits_corrupt; 
  wire  Repeater_io_deq_ready; 
  wire  Repeater_io_deq_valid; 
  wire [2:0] Repeater_io_deq_bits_opcode; 
  wire [2:0] Repeater_io_deq_bits_param; 
  wire [2:0] Repeater_io_deq_bits_size; 
  wire [4:0] Repeater_io_deq_bits_source; 
  wire [16:0] Repeater_io_deq_bits_address; 
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
  wire [4:0] _T_256; 
  wire [1:0] _T_257; 
  wire [1:0] _T_258; 
  wire [5:0] _GEN_7; 
  wire [5:0] _T_273; 
  wire [5:0] _GEN_8; 
  wire [5:0] _T_274; 
  wire [6:0] _GEN_9; 
  wire [6:0] _T_275; 
  wire [6:0] _T_276; 
  wire [6:0] _T_277; 
  wire [6:0] _T_278; 
  wire [6:0] _T_279; 
  wire [2:0] _T_280; 
  wire [3:0] _T_281; 
  wire  _T_282; 
  wire [3:0] _GEN_10; 
  wire [3:0] _T_283; 
  wire [1:0] _T_284; 
  wire [1:0] _T_285; 
  wire  _T_286; 
  wire [1:0] _T_287; 
  wire  _T_288; 
  wire [1:0] _T_289; 
  wire [2:0] _T_290; 
  wire  _T_291; 
  wire [4:0] _T_292; 
  wire [4:0] _T_293; 
  wire [3:0] _T_294; 
  wire  _T_296; 
  wire  _T_330; 
  wire [2:0] _T_331; 
  wire [12:0] _T_333; 
  wire [5:0] _T_334; 
  wire [5:0] _T_335; 
  wire [8:0] _T_337; 
  wire [1:0] _T_338; 
  wire [1:0] _T_339; 
  reg [3:0] _T_344; 
  reg [31:0] _RAND_3;
  wire  _T_345; 
  wire [3:0] _T_346; 
  wire [4:0] _T_347; 
  wire [4:0] _T_348; 
  wire [3:0] _T_349; 
  wire [3:0] _T_350; 
  wire [3:0] _T_351; 
  wire [3:0] _T_354; 
  reg  _T_362; 
  reg [31:0] _RAND_4;
  wire  _GEN_5; 
  wire  _T_364; 
  wire  _T_92_a_valid; 
  wire  _T_365; 
  wire [5:0] _GEN_11; 
  wire [5:0] _T_369; 
  wire [5:0] _T_370; 
  wire [5:0] _T_371; 
  wire [5:0] _GEN_12; 
  wire [5:0] _T_372; 
  wire [5:0] _T_373; 
  wire [5:0] _T_374; 
  wire [16:0] _GEN_13; 
  wire [5:0] _T_376; 
  wire  _T_378; 
  wire  _T_385; 
  wire  _T_386; 
  wire  _T_388; 
  wire  _T_389; 
  TLMonitor_17 TLMonitor ( 
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
    .io_in_d_bits_size(TLMonitor_io_in_d_bits_size),
    .io_in_d_bits_source(TLMonitor_io_in_d_bits_source)
  );
  Repeater_3 Repeater ( 
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
  assign _T_256 = 5'h3 << auto_out_d_bits_size; 
  assign _T_257 = _T_256[1:0]; 
  assign _T_258 = ~ _T_257; 
  assign _GEN_7 = {{2'd0}, _T_249}; 
  assign _T_273 = _GEN_7 << 2; 
  assign _GEN_8 = {{4'd0}, _T_258}; 
  assign _T_274 = _T_273 | _GEN_8; 
  assign _GEN_9 = {{1'd0}, _T_274}; 
  assign _T_275 = _GEN_9 << 1; 
  assign _T_276 = _T_275 | 7'h1; 
  assign _T_277 = {1'h0,_T_274}; 
  assign _T_278 = ~ _T_277; 
  assign _T_279 = _T_276 & _T_278; 
  assign _T_280 = _T_279[6:4]; 
  assign _T_281 = _T_279[3:0]; 
  assign _T_282 = _T_280 != 3'h0; 
  assign _GEN_10 = {{1'd0}, _T_280}; 
  assign _T_283 = _GEN_10 | _T_281; 
  assign _T_284 = _T_283[3:2]; 
  assign _T_285 = _T_283[1:0]; 
  assign _T_286 = _T_284 != 2'h0; 
  assign _T_287 = _T_284 | _T_285; 
  assign _T_288 = _T_287[1]; 
  assign _T_289 = {_T_286,_T_288}; 
  assign _T_290 = {_T_282,_T_289}; 
  assign _T_291 = auto_in_d_ready & auto_out_d_valid; 
  assign _T_292 = _T_244 - 4'h1; 
  assign _T_293 = $unsigned(_T_292); 
  assign _T_294 = _T_293[3:0]; 
  assign _T_296 = auto_out_d_bits_source[4]; 
  assign _T_330 = Repeater_io_deq_bits_size > 3'h2; 
  assign _T_331 = _T_330 ? 3'h2 : Repeater_io_deq_bits_size; 
  assign _T_333 = 13'h3f << Repeater_io_deq_bits_size; 
  assign _T_334 = _T_333[5:0]; 
  assign _T_335 = ~ _T_334; 
  assign _T_337 = 9'h3 << _T_331; 
  assign _T_338 = _T_337[1:0]; 
  assign _T_339 = ~ _T_338; 
  assign _T_345 = _T_344 == 4'h0; 
  assign _T_346 = _T_335[5:2]; 
  assign _T_347 = _T_344 - 4'h1; 
  assign _T_348 = $unsigned(_T_347); 
  assign _T_349 = _T_348[3:0]; 
  assign _T_350 = _T_345 ? _T_346 : _T_349; 
  assign _T_351 = ~ _T_350; 
  assign _T_354 = ~ _T_351; 
  assign _GEN_5 = _T_345 ? _T_248 : _T_362; 
  assign _T_364 = _GEN_5 == 1'h0; 
  assign _T_92_a_valid = Repeater_io_deq_valid; 
  assign _T_365 = auto_out_a_ready & _T_92_a_valid; 
  assign _GEN_11 = {{2'd0}, _T_350}; 
  assign _T_369 = _GEN_11 << 2; 
  assign _T_370 = ~ _T_335; 
  assign _T_371 = _T_369 | _T_370; 
  assign _GEN_12 = {{4'd0}, _T_339}; 
  assign _T_372 = _T_371 | _GEN_12; 
  assign _T_373 = _T_372 | 6'h3; 
  assign _T_374 = ~ _T_373; 
  assign _GEN_13 = {{11'd0}, _T_374}; 
  assign _T_376 = {Repeater_io_deq_bits_source,_T_364}; 
  assign _T_378 = Repeater_io_full == 1'h0; 
  assign _T_385 = Repeater_io_deq_bits_mask == 4'hf; 
  assign _T_386 = _T_378 | _T_385; 
  assign _T_388 = _T_386 | reset; 
  assign _T_389 = _T_388 == 1'h0; 
  assign auto_in_a_ready = Repeater_io_enq_ready; 
  assign auto_in_d_valid = auto_out_d_valid; 
  assign auto_in_d_bits_size = _T_250 ? _T_290 : _T_246; 
  assign auto_in_d_bits_source = auto_out_d_bits_source[9:5]; 
  assign auto_in_d_bits_data = auto_out_d_bits_data; 
  assign auto_out_a_valid = Repeater_io_deq_valid; 
  assign auto_out_a_bits_opcode = Repeater_io_deq_bits_opcode; 
  assign auto_out_a_bits_param = Repeater_io_deq_bits_param; 
  assign auto_out_a_bits_size = _T_331[1:0]; 
  assign auto_out_a_bits_source = {_T_376,_T_354}; 
  assign auto_out_a_bits_address = Repeater_io_deq_bits_address | _GEN_13; 
  assign auto_out_a_bits_mask = Repeater_io_full ? 4'hf : auto_in_a_bits_mask; 
  assign auto_out_a_bits_corrupt = Repeater_io_deq_bits_corrupt; 
  assign auto_out_d_ready = auto_in_d_ready; 
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
  assign TLMonitor_io_in_d_valid = auto_out_d_valid; 
  assign TLMonitor_io_in_d_bits_size = _T_250 ? _T_290 : _T_246; 
  assign TLMonitor_io_in_d_bits_source = auto_out_d_bits_source[9:5]; 
  assign Repeater_clock = clock; 
  assign Repeater_reset = reset; 
  assign Repeater_io_repeat = _T_354 != 4'h0; 
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
  _T_344 = _RAND_3[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  _T_362 = _RAND_4[0:0];
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
    if (reset) begin
      _T_344 <= 4'h0;
    end else begin
      if (_T_365) begin
        _T_344 <= _T_354;
      end
    end
    if (_T_345) begin
      _T_362 <= _T_248;
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
        if (1'h0) begin
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
        if (_T_389) begin
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
        if (_T_389) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
