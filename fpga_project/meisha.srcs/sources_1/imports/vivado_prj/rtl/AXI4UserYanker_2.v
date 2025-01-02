module AXI4UserYanker_2( 
  input         clock, 
  input         reset, 
  output        auto_in_aw_ready, 
  input         auto_in_aw_valid, 
  input  [37:0] auto_in_aw_bits_addr, 
  input  [13:0] auto_in_aw_bits_user, 
  output        auto_in_w_ready, 
  input         auto_in_w_valid, 
  input  [31:0] auto_in_w_bits_data, 
  input  [3:0]  auto_in_w_bits_strb, 
  input         auto_in_b_ready, 
  output        auto_in_b_valid, 
  output [1:0]  auto_in_b_bits_resp, 
  output [13:0] auto_in_b_bits_user, 
  output        auto_in_ar_ready, 
  input         auto_in_ar_valid, 
  input  [37:0] auto_in_ar_bits_addr, 
  input  [13:0] auto_in_ar_bits_user, 
  input         auto_in_r_ready, 
  output        auto_in_r_valid, 
  output [31:0] auto_in_r_bits_data, 
  output [1:0]  auto_in_r_bits_resp, 
  output [13:0] auto_in_r_bits_user, 
  output        auto_in_r_bits_last, 
  input         auto_out_aw_ready, 
  output        auto_out_aw_valid, 
  output [37:0] auto_out_aw_bits_addr, 
  input         auto_out_w_ready, 
  output        auto_out_w_valid, 
  output [31:0] auto_out_w_bits_data, 
  output [3:0]  auto_out_w_bits_strb, 
  output        auto_out_b_ready, 
  input         auto_out_b_valid, 
  input  [1:0]  auto_out_b_bits_resp, 
  input         auto_out_ar_ready, 
  output        auto_out_ar_valid, 
  output [37:0] auto_out_ar_bits_addr, 
  output        auto_out_r_ready, 
  input         auto_out_r_valid, 
  input  [31:0] auto_out_r_bits_data, 
  input  [1:0]  auto_out_r_bits_resp, 
  input         auto_out_r_bits_last 
);
  wire  Queue_clock; 
  wire  Queue_reset; 
  wire  Queue_io_enq_ready; 
  wire  Queue_io_enq_valid; 
  wire [13:0] Queue_io_enq_bits; 
  wire  Queue_io_deq_ready; 
  wire  Queue_io_deq_valid; 
  wire [13:0] Queue_io_deq_bits; 
  wire  Queue_1_clock; 
  wire  Queue_1_reset; 
  wire  Queue_1_io_enq_ready; 
  wire  Queue_1_io_enq_valid; 
  wire [13:0] Queue_1_io_enq_bits; 
  wire  Queue_1_io_deq_ready; 
  wire  Queue_1_io_deq_valid; 
  wire [13:0] Queue_1_io_deq_bits; 
  wire  _T_224_0; 
  wire  _T_247; 
  wire  _T_234_0; 
  wire  _T_248; 
  wire  _T_250; 
  wire  _T_251; 
  wire  _T_252; 
  wire  _T_260_0; 
  wire  _T_283; 
  wire  _T_270_0; 
  wire  _T_284; 
  wire  _T_286; 
  wire  _T_287; 
  Queue_145 Queue ( 
    .clock(Queue_clock),
    .reset(Queue_reset),
    .io_enq_ready(Queue_io_enq_ready),
    .io_enq_valid(Queue_io_enq_valid),
    .io_enq_bits(Queue_io_enq_bits),
    .io_deq_ready(Queue_io_deq_ready),
    .io_deq_valid(Queue_io_deq_valid),
    .io_deq_bits(Queue_io_deq_bits)
  );
  Queue_145 Queue_1 ( 
    .clock(Queue_1_clock),
    .reset(Queue_1_reset),
    .io_enq_ready(Queue_1_io_enq_ready),
    .io_enq_valid(Queue_1_io_enq_valid),
    .io_enq_bits(Queue_1_io_enq_bits),
    .io_deq_ready(Queue_1_io_deq_ready),
    .io_deq_valid(Queue_1_io_deq_valid),
    .io_deq_bits(Queue_1_io_deq_bits)
  );
  assign _T_224_0 = Queue_io_enq_ready; 
  assign _T_247 = auto_out_r_valid == 1'h0; 
  assign _T_234_0 = Queue_io_deq_valid; 
  assign _T_248 = _T_247 | _T_234_0; 
  assign _T_250 = _T_248 | reset; 
  assign _T_251 = _T_250 == 1'h0; 
  assign _T_252 = auto_out_r_valid & auto_in_r_ready; 
  assign _T_260_0 = Queue_1_io_enq_ready; 
  assign _T_283 = auto_out_b_valid == 1'h0; 
  assign _T_270_0 = Queue_1_io_deq_valid; 
  assign _T_284 = _T_283 | _T_270_0; 
  assign _T_286 = _T_284 | reset; 
  assign _T_287 = _T_286 == 1'h0; 
  assign auto_in_aw_ready = auto_out_aw_ready & _T_260_0; 
  assign auto_in_w_ready = auto_out_w_ready; 
  assign auto_in_b_valid = auto_out_b_valid; 
  assign auto_in_b_bits_resp = auto_out_b_bits_resp; 
  assign auto_in_b_bits_user = Queue_1_io_deq_bits; 
  assign auto_in_ar_ready = auto_out_ar_ready & _T_224_0; 
  assign auto_in_r_valid = auto_out_r_valid; 
  assign auto_in_r_bits_data = auto_out_r_bits_data; 
  assign auto_in_r_bits_resp = auto_out_r_bits_resp; 
  assign auto_in_r_bits_user = Queue_io_deq_bits; 
  assign auto_in_r_bits_last = auto_out_r_bits_last; 
  assign auto_out_aw_valid = auto_in_aw_valid & _T_260_0; 
  assign auto_out_aw_bits_addr = auto_in_aw_bits_addr; 
  assign auto_out_w_valid = auto_in_w_valid; 
  assign auto_out_w_bits_data = auto_in_w_bits_data; 
  assign auto_out_w_bits_strb = auto_in_w_bits_strb; 
  assign auto_out_b_ready = auto_in_b_ready; 
  assign auto_out_ar_valid = auto_in_ar_valid & _T_224_0; 
  assign auto_out_ar_bits_addr = auto_in_ar_bits_addr; 
  assign auto_out_r_ready = auto_in_r_ready; 
  assign Queue_clock = clock; 
  assign Queue_reset = reset; 
  assign Queue_io_enq_valid = auto_in_ar_valid & auto_out_ar_ready; 
  assign Queue_io_enq_bits = auto_in_ar_bits_user; 
  assign Queue_io_deq_ready = _T_252 & auto_out_r_bits_last; 
  assign Queue_1_clock = clock; 
  assign Queue_1_reset = reset; 
  assign Queue_1_io_enq_valid = auto_in_aw_valid & auto_out_aw_ready; 
  assign Queue_1_io_enq_bits = auto_in_aw_bits_user; 
  assign Queue_1_io_deq_ready = auto_out_b_valid & auto_in_b_ready; 
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_251) begin
          $fwrite(32'h80000002,"Assertion failed\n    at UserYanker.scala:54 assert (!out.r.valid || r_valid) // Q must be ready faster than the response\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_251) begin
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
        if (_T_287) begin
          $fwrite(32'h80000002,"Assertion failed\n    at UserYanker.scala:75 assert (!out.b.valid || b_valid) // Q must be ready faster than the response\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_287) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
