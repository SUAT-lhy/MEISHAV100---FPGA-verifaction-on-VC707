module TLToAXI4_2( 
  input         clock, 
  input         reset, 
  output        auto_in_a_ready, 
  input         auto_in_a_valid, 
  input  [2:0]  auto_in_a_bits_opcode, 
  input  [2:0]  auto_in_a_bits_param, 
  input  [1:0]  auto_in_a_bits_size, 
  input  [9:0]  auto_in_a_bits_source, 
  input  [37:0] auto_in_a_bits_address, 
  input  [3:0]  auto_in_a_bits_mask, 
  input  [31:0] auto_in_a_bits_data, 
  input         auto_in_a_bits_corrupt, 
  input         auto_in_d_ready, 
  output        auto_in_d_valid, 
  output [2:0]  auto_in_d_bits_opcode, 
  output [1:0]  auto_in_d_bits_size, 
  output [9:0]  auto_in_d_bits_source, 
  output        auto_in_d_bits_denied, 
  output [31:0] auto_in_d_bits_data, 
  output        auto_in_d_bits_corrupt, 
  input         auto_out_aw_ready, 
  output        auto_out_aw_valid, 
  output [37:0] auto_out_aw_bits_addr, 
  output [13:0] auto_out_aw_bits_user, 
  input         auto_out_w_ready, 
  output        auto_out_w_valid, 
  output [31:0] auto_out_w_bits_data, 
  output [3:0]  auto_out_w_bits_strb, 
  output        auto_out_b_ready, 
  input         auto_out_b_valid, 
  input  [1:0]  auto_out_b_bits_resp, 
  input  [13:0] auto_out_b_bits_user, 
  input         auto_out_ar_ready, 
  output        auto_out_ar_valid, 
  output [37:0] auto_out_ar_bits_addr, 
  output [13:0] auto_out_ar_bits_user, 
  output        auto_out_r_ready, 
  input         auto_out_r_valid, 
  input  [31:0] auto_out_r_bits_data, 
  input  [1:0]  auto_out_r_bits_resp, 
  input  [13:0] auto_out_r_bits_user, 
  input         auto_out_r_bits_last 
);
  wire  TLMonitor_clock; 
  wire  TLMonitor_reset; 
  wire  TLMonitor_io_in_a_ready; 
  wire  TLMonitor_io_in_a_valid; 
  wire [2:0] TLMonitor_io_in_a_bits_opcode; 
  wire [2:0] TLMonitor_io_in_a_bits_param; 
  wire [1:0] TLMonitor_io_in_a_bits_size; 
  wire [9:0] TLMonitor_io_in_a_bits_source; 
  wire [37:0] TLMonitor_io_in_a_bits_address; 
  wire [3:0] TLMonitor_io_in_a_bits_mask; 
  wire  TLMonitor_io_in_a_bits_corrupt; 
  wire  TLMonitor_io_in_d_ready; 
  wire  TLMonitor_io_in_d_valid; 
  wire [2:0] TLMonitor_io_in_d_bits_opcode; 
  wire [1:0] TLMonitor_io_in_d_bits_size; 
  wire [9:0] TLMonitor_io_in_d_bits_source; 
  wire  TLMonitor_io_in_d_bits_denied; 
  wire  TLMonitor_io_in_d_bits_corrupt; 
  wire  Queue_clock; 
  wire  Queue_reset; 
  wire  Queue_io_enq_ready; 
  wire  Queue_io_enq_valid; 
  wire [31:0] Queue_io_enq_bits_data; 
  wire [3:0] Queue_io_enq_bits_strb; 
  wire  Queue_io_deq_ready; 
  wire  Queue_io_deq_valid; 
  wire [31:0] Queue_io_deq_bits_data; 
  wire [3:0] Queue_io_deq_bits_strb; 
  wire  Queue_1_clock; 
  wire  Queue_1_reset; 
  wire  Queue_1_io_enq_ready; 
  wire  Queue_1_io_enq_valid; 
  wire [37:0] Queue_1_io_enq_bits_addr; 
  wire [13:0] Queue_1_io_enq_bits_user; 
  wire  Queue_1_io_enq_bits_wen; 
  wire  Queue_1_io_deq_ready; 
  wire  Queue_1_io_deq_valid; 
  wire [37:0] Queue_1_io_deq_bits_addr; 
  wire [13:0] Queue_1_io_deq_bits_user; 
  wire  Queue_1_io_deq_bits_wen; 
  wire  _T_2259; 
  wire  _T_2260; 
  reg [9:0] _T_2384; 
  reg [31:0] _RAND_0;
  wire  _T_2387; 
  wire  _T_2411; 
  reg  _T_2386; 
  reg [31:0] _RAND_1;
  wire  _T_2410; 
  wire  _T_2412; 
  wire  _T_2413; 
  wire  _T_2414; 
  reg  _T_2271; 
  reg [31:0] _RAND_2;
  wire  _T_2275; 
  wire  _T_2341; 
  wire  _T_2342; 
  reg  _T_2329; 
  reg [31:0] _RAND_3;
  wire  _T_2302_ready; 
  wire  _T_2343; 
  wire  _T_2305_ready; 
  wire  _T_2344; 
  wire  _T_2345; 
  wire  _T_2346; 
  wire  _T_2261; 
  wire [1:0] _T_2272; 
  wire [1:0] _T_2273; 
  wire  _T_2274; 
  wire [11:0] _GEN_1990; 
  wire [11:0] _T_2292; 
  wire [11:0] _GEN_1991; 
  wire [11:0] _T_2293; 
  wire [9:0] _T_2294; 
  wire [1:0] _T_2295; 
  wire [9:0] _T_2296; 
  wire [1:0] _T_2297; 
  wire  _T_2320_bits_wen; 
  wire  _T_2324; 
  wire  _T_2320_valid; 
  wire  _T_2348; 
  wire  _T_2349; 
  wire  _T_2350; 
  wire  _T_2351; 
  wire  _T_2352; 
  wire  _T_2355; 
  reg  _T_2359; 
  reg [31:0] _RAND_4;
  wire  _T_2360; 
  wire  _T_2361; 
  wire  _T_2362; 
  wire  _T_2363; 
  wire  _T_2365; 
  reg  _T_2367; 
  reg [31:0] _RAND_5;
  wire  _T_2369; 
  reg  _T_2371; 
  reg [31:0] _RAND_6;
  wire  _GEN_1988; 
  wire  _T_2373; 
  wire  _T_2374; 
  wire  _T_2375; 
  wire  _T_2382; 
  wire  _T_2388; 
  wire  _T_2391; 
  wire  _T_2392; 
  wire [9:0] _GEN_1992; 
  wire [9:0] _T_2394; 
  wire [9:0] _GEN_1993; 
  wire [10:0] _T_2395; 
  wire [10:0] _T_2396; 
  wire [9:0] _T_2397; 
  wire  _T_2398; 
  wire  _T_2399; 
  wire  _T_2400; 
  wire  _T_2402; 
  wire  _T_2403; 
  wire  _T_2404; 
  wire  _T_2405; 
  wire  _T_2406; 
  wire  _T_2408; 
  wire  _T_2409; 
  TLMonitor_84 TLMonitor ( 
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
  Queue_147 Queue ( 
    .clock(Queue_clock),
    .reset(Queue_reset),
    .io_enq_ready(Queue_io_enq_ready),
    .io_enq_valid(Queue_io_enq_valid),
    .io_enq_bits_data(Queue_io_enq_bits_data),
    .io_enq_bits_strb(Queue_io_enq_bits_strb),
    .io_deq_ready(Queue_io_deq_ready),
    .io_deq_valid(Queue_io_deq_valid),
    .io_deq_bits_data(Queue_io_deq_bits_data),
    .io_deq_bits_strb(Queue_io_deq_bits_strb)
  );
  Queue_148 Queue_1 ( 
    .clock(Queue_1_clock),
    .reset(Queue_1_reset),
    .io_enq_ready(Queue_1_io_enq_ready),
    .io_enq_valid(Queue_1_io_enq_valid),
    .io_enq_bits_addr(Queue_1_io_enq_bits_addr),
    .io_enq_bits_user(Queue_1_io_enq_bits_user),
    .io_enq_bits_wen(Queue_1_io_enq_bits_wen),
    .io_deq_ready(Queue_1_io_deq_ready),
    .io_deq_valid(Queue_1_io_deq_valid),
    .io_deq_bits_addr(Queue_1_io_deq_bits_addr),
    .io_deq_bits_user(Queue_1_io_deq_bits_user),
    .io_deq_bits_wen(Queue_1_io_deq_bits_wen)
  );
  assign _T_2259 = auto_in_a_bits_opcode[2]; 
  assign _T_2260 = _T_2259 == 1'h0; 
  assign _T_2387 = _T_2384 == 10'h0; 
  assign _T_2411 = _T_2387 == 1'h0; 
  assign _T_2410 = _T_2386 != _T_2260; 
  assign _T_2412 = _T_2411 & _T_2410; 
  assign _T_2413 = _T_2384 == 10'h3e0; 
  assign _T_2414 = _T_2412 | _T_2413; 
  assign _T_2275 = _T_2271 == 1'h0; 
  assign _T_2341 = _T_2414 & _T_2275; 
  assign _T_2342 = _T_2341 == 1'h0; 
  assign _T_2302_ready = Queue_1_io_enq_ready; 
  assign _T_2343 = _T_2329 | _T_2302_ready; 
  assign _T_2305_ready = Queue_io_enq_ready; 
  assign _T_2344 = _T_2343 & _T_2305_ready; 
  assign _T_2345 = _T_2260 ? _T_2344 : _T_2302_ready; 
  assign _T_2346 = _T_2342 & _T_2345; 
  assign _T_2261 = _T_2346 & auto_in_a_valid; 
  assign _T_2272 = _T_2271 - 1'h1; 
  assign _T_2273 = $unsigned(_T_2272); 
  assign _T_2274 = _T_2273[0:0]; 
  assign _GEN_1990 = {{10'd0}, auto_in_a_bits_size}; 
  assign _T_2292 = _GEN_1990 << 10; 
  assign _GEN_1991 = {{2'd0}, auto_in_a_bits_source}; 
  assign _T_2293 = _GEN_1991 | _T_2292; 
  assign _T_2294 = auto_out_r_bits_user[9:0]; 
  assign _T_2295 = auto_out_r_bits_user[11:10]; 
  assign _T_2296 = auto_out_b_bits_user[9:0]; 
  assign _T_2297 = auto_out_b_bits_user[11:10]; 
  assign _T_2320_bits_wen = Queue_1_io_deq_bits_wen; 
  assign _T_2324 = _T_2320_bits_wen == 1'h0; 
  assign _T_2320_valid = Queue_1_io_deq_valid; 
  assign _T_2348 = _T_2342 & auto_in_a_valid; 
  assign _T_2349 = _T_2329 == 1'h0; 
  assign _T_2350 = _T_2349 & _T_2305_ready; 
  assign _T_2351 = _T_2260 ? _T_2350 : 1'h1; 
  assign _T_2352 = _T_2348 & _T_2351; 
  assign _T_2355 = _T_2348 & _T_2260; 
  assign _T_2360 = auto_in_d_ready & auto_out_r_valid; 
  assign _T_2361 = auto_out_r_bits_last == 1'h0; 
  assign _T_2362 = auto_out_r_valid | _T_2359; 
  assign _T_2363 = _T_2362 == 1'h0; 
  assign _T_2365 = _T_2362 ? auto_out_r_valid : auto_out_b_valid; 
  assign _T_2369 = auto_out_r_bits_resp == 2'h3; 
  assign _GEN_1988 = _T_2367 ? _T_2369 : _T_2371; 
  assign _T_2373 = auto_out_r_bits_resp != 2'h0; 
  assign _T_2374 = auto_out_b_bits_resp != 2'h0; 
  assign _T_2375 = _T_2373 | _GEN_1988; 
  assign _T_2382 = _T_2362 ? auto_out_r_bits_last : 1'h1; 
  assign _T_2388 = _T_2302_ready & _T_2352; 
  assign _T_2391 = auto_in_d_ready & _T_2365; 
  assign _T_2392 = _T_2382 & _T_2391; 
  assign _GEN_1992 = {{9'd0}, _T_2388}; 
  assign _T_2394 = _T_2384 + _GEN_1992; 
  assign _GEN_1993 = {{9'd0}, _T_2392}; 
  assign _T_2395 = _T_2394 - _GEN_1993; 
  assign _T_2396 = $unsigned(_T_2395); 
  assign _T_2397 = _T_2396[9:0]; 
  assign _T_2398 = _T_2392 == 1'h0; 
  assign _T_2399 = _T_2384 != 10'h0; 
  assign _T_2400 = _T_2398 | _T_2399; 
  assign _T_2402 = _T_2400 | reset; 
  assign _T_2403 = _T_2402 == 1'h0; 
  assign _T_2404 = _T_2388 == 1'h0; 
  assign _T_2405 = _T_2384 != 10'h3e0; 
  assign _T_2406 = _T_2404 | _T_2405; 
  assign _T_2408 = _T_2406 | reset; 
  assign _T_2409 = _T_2408 == 1'h0; 
  assign auto_in_a_ready = _T_2342 & _T_2345; 
  assign auto_in_d_valid = _T_2362 ? auto_out_r_valid : auto_out_b_valid; 
  assign auto_in_d_bits_opcode = _T_2362 ? 3'h1 : 3'h0; 
  assign auto_in_d_bits_size = _T_2362 ? _T_2295 : _T_2297; 
  assign auto_in_d_bits_source = _T_2362 ? _T_2294 : _T_2296; 
  assign auto_in_d_bits_denied = _T_2362 ? _GEN_1988 : _T_2374; 
  assign auto_in_d_bits_data = auto_out_r_bits_data; 
  assign auto_in_d_bits_corrupt = _T_2362 ? _T_2375 : 1'h0; 
  assign auto_out_aw_valid = _T_2320_valid & _T_2320_bits_wen; 
  assign auto_out_aw_bits_addr = Queue_1_io_deq_bits_addr; 
  assign auto_out_aw_bits_user = Queue_1_io_deq_bits_user; 
  assign auto_out_w_valid = Queue_io_deq_valid; 
  assign auto_out_w_bits_data = Queue_io_deq_bits_data; 
  assign auto_out_w_bits_strb = Queue_io_deq_bits_strb; 
  assign auto_out_b_ready = auto_in_d_ready & _T_2363; 
  assign auto_out_ar_valid = _T_2320_valid & _T_2324; 
  assign auto_out_ar_bits_addr = Queue_1_io_deq_bits_addr; 
  assign auto_out_ar_bits_user = Queue_1_io_deq_bits_user; 
  assign auto_out_r_ready = auto_in_d_ready; 
  assign TLMonitor_clock = clock; 
  assign TLMonitor_reset = reset; 
  assign TLMonitor_io_in_a_ready = _T_2342 & _T_2345; 
  assign TLMonitor_io_in_a_valid = auto_in_a_valid; 
  assign TLMonitor_io_in_a_bits_opcode = auto_in_a_bits_opcode; 
  assign TLMonitor_io_in_a_bits_param = auto_in_a_bits_param; 
  assign TLMonitor_io_in_a_bits_size = auto_in_a_bits_size; 
  assign TLMonitor_io_in_a_bits_source = auto_in_a_bits_source; 
  assign TLMonitor_io_in_a_bits_address = auto_in_a_bits_address; 
  assign TLMonitor_io_in_a_bits_mask = auto_in_a_bits_mask; 
  assign TLMonitor_io_in_a_bits_corrupt = auto_in_a_bits_corrupt; 
  assign TLMonitor_io_in_d_ready = auto_in_d_ready; 
  assign TLMonitor_io_in_d_valid = _T_2362 ? auto_out_r_valid : auto_out_b_valid; 
  assign TLMonitor_io_in_d_bits_opcode = _T_2362 ? 3'h1 : 3'h0; 
  assign TLMonitor_io_in_d_bits_size = _T_2362 ? _T_2295 : _T_2297; 
  assign TLMonitor_io_in_d_bits_source = _T_2362 ? _T_2294 : _T_2296; 
  assign TLMonitor_io_in_d_bits_denied = _T_2362 ? _GEN_1988 : _T_2374; 
  assign TLMonitor_io_in_d_bits_corrupt = _T_2362 ? _T_2375 : 1'h0; 
  assign Queue_clock = clock; 
  assign Queue_reset = reset; 
  assign Queue_io_enq_valid = _T_2355 & _T_2343; 
  assign Queue_io_enq_bits_data = auto_in_a_bits_data; 
  assign Queue_io_enq_bits_strb = auto_in_a_bits_mask; 
  assign Queue_io_deq_ready = auto_out_w_ready; 
  assign Queue_1_clock = clock; 
  assign Queue_1_reset = reset; 
  assign Queue_1_io_enq_valid = _T_2348 & _T_2351; 
  assign Queue_1_io_enq_bits_addr = auto_in_a_bits_address; 
  assign Queue_1_io_enq_bits_user = {{2'd0}, _T_2293}; 
  assign Queue_1_io_enq_bits_wen = _T_2259 == 1'h0; 
  assign Queue_1_io_deq_ready = _T_2320_bits_wen ? auto_out_aw_ready : auto_out_ar_ready; 
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
  _T_2384 = _RAND_0[9:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  _T_2386 = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  _T_2271 = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  _T_2329 = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  _T_2359 = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  _T_2367 = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  _T_2371 = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      _T_2384 <= 10'h0;
    end else begin
      _T_2384 <= _T_2397;
    end
    if (_T_2388) begin
      _T_2386 <= _T_2260;
    end
    if (reset) begin
      _T_2271 <= 1'h0;
    end else begin
      if (_T_2261) begin
        if (_T_2275) begin
          _T_2271 <= 1'h0;
        end else begin
          _T_2271 <= _T_2274;
        end
      end
    end
    if (reset) begin
      _T_2329 <= 1'h0;
    end else begin
      if (_T_2261) begin
        _T_2329 <= 1'h0;
      end
    end
    if (reset) begin
      _T_2359 <= 1'h0;
    end else begin
      if (_T_2360) begin
        _T_2359 <= _T_2361;
      end
    end
    if (reset) begin
      _T_2367 <= 1'h1;
    end else begin
      if (_T_2360) begin
        _T_2367 <= auto_out_r_bits_last;
      end
    end
    if (_T_2367) begin
      _T_2371 <= _T_2369;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed\n    at ToAXI4.scala:125 assert (a_source  < UInt(BigInt(1) << sourceBits))\n"); 
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
          $fwrite(32'h80000002,"Assertion failed\n    at ToAXI4.scala:126 assert (a_size    < UInt(BigInt(1) << sizeBits))\n"); 
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
        if (_T_2403) begin
          $fwrite(32'h80000002,"Assertion failed\n    at ToAXI4.scala:233 assert (!dec || count =/= UInt(0))        // underflow\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2403) begin
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
        if (_T_2409) begin
          $fwrite(32'h80000002,"Assertion failed\n    at ToAXI4.scala:234 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2409) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
