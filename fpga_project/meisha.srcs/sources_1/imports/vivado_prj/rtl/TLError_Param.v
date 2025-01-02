module TLError_Param # (
    parameter ADDRESS_WIDTH = 32,
    parameter DATA_WIDTH   = 64,
    parameter SIZE_WIDTH   = 3,
    parameter MASK_WIDTH   = DATA_WIDTH/8,
    parameter BYTES_LOG2_WIDTH = $clog2(MASK_WIDTH),
    parameter SOURCE_WIDTH   = 4
    ) (
  input         clock,
  input         reset,
  output        auto_in_a_ready,
  input         auto_in_a_valid,
  input  [2:0]  auto_in_a_bits_opcode,
  input  [2:0]  auto_in_a_bits_size,
  input  [SOURCE_WIDTH-1:0]  auto_in_a_bits_source,
  input  [12:0] auto_in_a_bits_address,
  input  [3:0]  auto_in_a_bits_mask,
  input         auto_in_d_ready,
  output        auto_in_d_valid,
  output [2:0]  auto_in_d_bits_opcode,
  output [2:0]  auto_in_d_bits_size,
  output [SOURCE_WIDTH-1:0]  auto_in_d_bits_source,
  output        auto_in_d_bits_denied,
  output        auto_in_d_bits_corrupt
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  wire  monitor_clock;
  wire  monitor_reset;
  wire  monitor_io_in_a_ready;
  wire  monitor_io_in_a_valid;
  wire [2:0] monitor_io_in_a_bits_opcode;
  wire [2:0] monitor_io_in_a_bits_size;
  wire [SOURCE_WIDTH-1:0] monitor_io_in_a_bits_source;
  wire [12:0] monitor_io_in_a_bits_address;
  wire [3:0] monitor_io_in_a_bits_mask;
  wire  monitor_io_in_d_ready;
  wire  monitor_io_in_d_valid;
  wire [2:0] monitor_io_in_d_bits_opcode;
  wire [2:0] monitor_io_in_d_bits_size;
  wire [SOURCE_WIDTH-1:0] monitor_io_in_d_bits_source;
  wire  monitor_io_in_d_bits_denied;
  wire  monitor_io_in_d_bits_corrupt;
  wire  a_clock;
  wire  a_reset;
  wire  a_io_enq_ready;
  wire  a_io_enq_valid;
  wire [2:0] a_io_enq_bits_opcode;
  wire [2:0] a_io_enq_bits_size;
  wire [SOURCE_WIDTH-1:0] a_io_enq_bits_source;
  wire  a_io_deq_ready;
  wire  a_io_deq_valid;
  wire [2:0] a_io_deq_bits_opcode;
  wire [2:0] a_io_deq_bits_size;
  wire [SOURCE_WIDTH-1:0] a_io_deq_bits_source;
  reg  idle;
  wire  _a_last_T = a_io_deq_ready & a_io_deq_valid;
  wire [12:0] _a_last_beats1_decode_T_1 = 13'h3f << a_io_deq_bits_size;
  wire [5:0] _a_last_beats1_decode_T_3 = ~_a_last_beats1_decode_T_1[5:0];
  wire [3:0] a_last_beats1_decode = _a_last_beats1_decode_T_3[5:2];
  wire  a_last_beats1_opdata = ~a_io_deq_bits_opcode[2];
  wire [3:0] a_last_beats1 = a_last_beats1_opdata ? a_last_beats1_decode : 4'h0;
  reg [3:0] a_last_counter;
  wire [3:0] a_last_counter1 = a_last_counter - 4'h1;
  wire  a_last_first = a_last_counter == 4'h0;
  wire  a_last = a_last_counter == 4'h1 | a_last_beats1 == 4'h0;
  reg [3:0] beatsLeft;
  wire  idle_1 = beatsLeft == 4'h0;
  wire  da_valid = a_io_deq_valid & a_last & idle;
  wire [1:0] _readys_T = {da_valid,1'h0};
  wire [2:0] _readys_T_1 = {_readys_T, 1'h0};
  wire [1:0] _readys_T_3 = _readys_T | _readys_T_1[1:0];
  wire [2:0] _readys_T_5 = {_readys_T_3, 1'h0};
  wire [1:0] _readys_T_7 = ~_readys_T_5[1:0];
  wire  readys_1 = _readys_T_7[1];
  reg  state_1;
  wire  allowed_1 = idle_1 ? readys_1 : state_1;
  wire  out_1_ready = auto_in_d_ready & allowed_1;
  wire  _T = out_1_ready & da_valid;
  wire [2:0] da_bits_size = a_io_deq_bits_size;
  wire [12:0] _beats1_decode_T_1 = 13'h3f << da_bits_size;
  wire [5:0] _beats1_decode_T_3 = ~_beats1_decode_T_1[5:0];
  wire [3:0] beats1_decode = _beats1_decode_T_3[5:2];
  wire [2:0] _GEN_4 = 3'h2 == a_io_deq_bits_opcode ? 3'h1 : 3'h0;
  wire [2:0] _GEN_5 = 3'h3 == a_io_deq_bits_opcode ? 3'h1 : _GEN_4;
  wire [2:0] _GEN_6 = 3'h4 == a_io_deq_bits_opcode ? 3'h1 : _GEN_5;
  wire [2:0] _GEN_7 = 3'h5 == a_io_deq_bits_opcode ? 3'h2 : _GEN_6;
  wire [2:0] _GEN_8 = 3'h6 == a_io_deq_bits_opcode ? 3'h4 : _GEN_7;
  wire [2:0] da_bits_opcode = 3'h7 == a_io_deq_bits_opcode ? 3'h4 : _GEN_8;
  wire  beats1_opdata = da_bits_opcode[0];
  wire [3:0] beats1 = beats1_opdata ? beats1_decode : 4'h0;
  reg [3:0] counter;
  wire [3:0] counter1 = counter - 4'h1;
  wire  da_first = counter == 4'h0;
  wire  da_last = counter == 4'h1 | beats1 == 4'h0;
  wire  _GEN_12 = _T & da_bits_opcode == 3'h4 ? 1'h0 : idle;
  wire  latch = idle_1 & auto_in_d_ready;
  wire  earlyWinner_1 = readys_1 & da_valid;
  wire  _T_22 = ~da_valid;
  wire  muxStateEarly_1 = idle_1 ? earlyWinner_1 : state_1;
  wire  _sink_ACancel_earlyValid_T_2 = state_1 & da_valid;
  wire  sink_ACancel_earlyValid = idle_1 ? da_valid : _sink_ACancel_earlyValid_T_2;
  wire  _beatsLeft_T_2 = auto_in_d_ready & sink_ACancel_earlyValid;
  wire [3:0] _GEN_17 = {{3'd0}, _beatsLeft_T_2};
  wire [3:0] _beatsLeft_T_4 = beatsLeft - _GEN_17;
  wire [SOURCE_WIDTH-1:0] da_bits_source = a_io_deq_bits_source;
  
  TLError_Queue_Param # (
      .SOURCE_WIDTH(SOURCE_WIDTH)
    ) a (
    .clock(a_clock),
    .reset(a_reset),
    .io_enq_ready(a_io_enq_ready),
    .io_enq_valid(a_io_enq_valid),
    .io_enq_bits_opcode(a_io_enq_bits_opcode),
    .io_enq_bits_size(a_io_enq_bits_size),
    .io_enq_bits_source(a_io_enq_bits_source),
    .io_deq_ready(a_io_deq_ready),
    .io_deq_valid(a_io_deq_valid),
    .io_deq_bits_opcode(a_io_deq_bits_opcode),
    .io_deq_bits_size(a_io_deq_bits_size),
    .io_deq_bits_source(a_io_deq_bits_source)
  );
  assign auto_in_a_ready = a_io_enq_ready;
  assign auto_in_d_valid = idle_1 ? da_valid : _sink_ACancel_earlyValid_T_2;
  assign auto_in_d_bits_opcode = muxStateEarly_1 ? da_bits_opcode : 3'h0;
  assign auto_in_d_bits_size = muxStateEarly_1 ? da_bits_size : 3'h0;
  assign auto_in_d_bits_source = muxStateEarly_1 ? da_bits_source : {SOURCE_WIDTH{1'h0}};
  assign auto_in_d_bits_denied = idle_1 ? earlyWinner_1 : state_1;
  assign auto_in_d_bits_corrupt = muxStateEarly_1 & beats1_opdata;
  assign monitor_clock = clock;
  assign monitor_reset = reset;
  assign monitor_io_in_a_ready = a_io_enq_ready;
  assign monitor_io_in_a_valid = auto_in_a_valid;
  assign monitor_io_in_a_bits_opcode = auto_in_a_bits_opcode;
  assign monitor_io_in_a_bits_size = auto_in_a_bits_size;
  assign monitor_io_in_a_bits_source = auto_in_a_bits_source;
  assign monitor_io_in_a_bits_address = auto_in_a_bits_address;
  assign monitor_io_in_a_bits_mask = auto_in_a_bits_mask;
  assign monitor_io_in_d_ready = auto_in_d_ready;
  assign monitor_io_in_d_valid = idle_1 ? da_valid : _sink_ACancel_earlyValid_T_2;
  assign monitor_io_in_d_bits_opcode = muxStateEarly_1 ? da_bits_opcode : 3'h0;
  assign monitor_io_in_d_bits_size = muxStateEarly_1 ? da_bits_size : 3'h0;
  assign monitor_io_in_d_bits_source = muxStateEarly_1 ? da_bits_source : {SOURCE_WIDTH{1'h0}};
  assign monitor_io_in_d_bits_denied = idle_1 ? earlyWinner_1 : state_1;
  assign monitor_io_in_d_bits_corrupt = muxStateEarly_1 & beats1_opdata;
  assign a_clock = clock;
  assign a_reset = reset;
  assign a_io_enq_valid = auto_in_a_valid;
  assign a_io_enq_bits_opcode = auto_in_a_bits_opcode;
  assign a_io_enq_bits_size = auto_in_a_bits_size;
  assign a_io_enq_bits_source = auto_in_a_bits_source;
  assign a_io_deq_ready = out_1_ready & da_last & idle | ~a_last;
  always @(posedge clock) begin
    idle <= reset | _GEN_12;
    if (reset) begin
      a_last_counter <= 4'h0;
    end else if (_a_last_T) begin
      if (a_last_first) begin
        if (a_last_beats1_opdata) begin
          a_last_counter <= a_last_beats1_decode;
        end else begin
          a_last_counter <= 4'h0;
        end
      end else begin
        a_last_counter <= a_last_counter1;
      end
    end
    if (reset) begin
      beatsLeft <= 4'h0;
    end else if (latch) begin
      if (earlyWinner_1) begin
        if (beats1_opdata) begin
          beatsLeft <= beats1_decode;
        end else begin
          beatsLeft <= 4'h0;
        end
      end else begin
        beatsLeft <= 4'h0;
      end
    end else begin
      beatsLeft <= _beatsLeft_T_4;
    end
    if (reset) begin
      state_1 <= 1'h0;
    end else if (idle_1) begin
      state_1 <= earlyWinner_1;
    end
    if (reset) begin
      counter <= 4'h0;
    end else if (_T) begin
      if (da_first) begin
        if (beats1_opdata) begin
          counter <= beats1_decode;
        end else begin
          counter <= 4'h0;
        end
      end else begin
        counter <= counter1;
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(idle | da_first | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Error.scala:49 assert (idle || da_first) // we only send Grant, never GrantData => simplified flow control below\n"
            );
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(idle | da_first | reset)) begin
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
        if (~(~da_valid | earlyWinner_1 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Arbiter.scala:107 assert (!earlyValids.reduce(_||_) || earlyWinner.reduce(_||_))\n"
            );
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~da_valid | earlyWinner_1 | reset)) begin
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
        if (~(_T_22 | da_valid | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Arbiter.scala:108 assert (!validQuals .reduce(_||_) || validQuals .reduce(_||_))\n"
            );
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_22 | da_valid | reset)) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
// Register and memory initialization
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
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
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
  idle = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  a_last_counter = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  beatsLeft = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  state_1 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  counter = _RAND_4[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule