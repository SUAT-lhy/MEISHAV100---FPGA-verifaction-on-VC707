module AXI4Buffer( 
  input         clock, 
  input         reset, 
  output        auto_in_aw_ready, 
  input         auto_in_aw_valid, 
  input  [3:0]  auto_in_aw_bits_id, 
  input  [30:0] auto_in_aw_bits_addr, 
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
  output [3:0]  auto_in_b_bits_id, 
  output [1:0]  auto_in_b_bits_resp, 
  output        auto_in_ar_ready, 
  input         auto_in_ar_valid, 
  input  [3:0]  auto_in_ar_bits_id, 
  input  [30:0] auto_in_ar_bits_addr, 
  input  [7:0]  auto_in_ar_bits_len, 
  input  [2:0]  auto_in_ar_bits_size, 
  input  [1:0]  auto_in_ar_bits_burst, 
  input         auto_in_r_ready, 
  output        auto_in_r_valid, 
  output [3:0]  auto_in_r_bits_id, 
  output [63:0] auto_in_r_bits_data, 
  output [1:0]  auto_in_r_bits_resp, 
  output        auto_in_r_bits_last, 
  input         auto_out_aw_ready, 
  output        auto_out_aw_valid, 
  output [3:0]  auto_out_aw_bits_id, 
  output [30:0] auto_out_aw_bits_addr, 
  output [7:0]  auto_out_aw_bits_len, 
  output [2:0]  auto_out_aw_bits_size, 
  output [1:0]  auto_out_aw_bits_burst, 
  input         auto_out_w_ready, 
  output        auto_out_w_valid, 
  output [63:0] auto_out_w_bits_data, 
  output [7:0]  auto_out_w_bits_strb, 
  output        auto_out_w_bits_last, 
  output        auto_out_b_ready, 
  input         auto_out_b_valid, 
  input  [3:0]  auto_out_b_bits_id, 
  input  [1:0]  auto_out_b_bits_resp, 
  input         auto_out_ar_ready, 
  output        auto_out_ar_valid, 
  output [3:0]  auto_out_ar_bits_id, 
  output [30:0] auto_out_ar_bits_addr, 
  output [7:0]  auto_out_ar_bits_len, 
  output [2:0]  auto_out_ar_bits_size, 
  output [1:0]  auto_out_ar_bits_burst, 
  output        auto_out_r_ready, 
  input         auto_out_r_valid, 
  input  [3:0]  auto_out_r_bits_id, 
  input  [63:0] auto_out_r_bits_data, 
  input  [1:0]  auto_out_r_bits_resp, 
  input         auto_out_r_bits_last 
);
  wire  Queue_clock; 
  wire  Queue_reset; 
  wire  Queue_io_enq_ready; 
  wire  Queue_io_enq_valid; 
  wire [3:0] Queue_io_enq_bits_id; 
  wire [30:0] Queue_io_enq_bits_addr; 
  wire [7:0] Queue_io_enq_bits_len; 
  wire [2:0] Queue_io_enq_bits_size; 
  wire [1:0] Queue_io_enq_bits_burst; 
  wire  Queue_io_deq_ready; 
  wire  Queue_io_deq_valid; 
  wire [3:0] Queue_io_deq_bits_id; 
  wire [30:0] Queue_io_deq_bits_addr; 
  wire [7:0] Queue_io_deq_bits_len; 
  wire [2:0] Queue_io_deq_bits_size; 
  wire [1:0] Queue_io_deq_bits_burst; 
  wire  Queue_1_clock; 
  wire  Queue_1_reset; 
  wire  Queue_1_io_enq_ready; 
  wire  Queue_1_io_enq_valid; 
  wire [63:0] Queue_1_io_enq_bits_data; 
  wire [7:0] Queue_1_io_enq_bits_strb; 
  wire  Queue_1_io_enq_bits_last; 
  wire  Queue_1_io_deq_ready; 
  wire  Queue_1_io_deq_valid; 
  wire [63:0] Queue_1_io_deq_bits_data; 
  wire [7:0] Queue_1_io_deq_bits_strb; 
  wire  Queue_1_io_deq_bits_last; 
  wire  Queue_2_clock; 
  wire  Queue_2_reset; 
  wire  Queue_2_io_enq_ready; 
  wire  Queue_2_io_enq_valid; 
  wire [3:0] Queue_2_io_enq_bits_id; 
  wire [1:0] Queue_2_io_enq_bits_resp; 
  wire  Queue_2_io_deq_ready; 
  wire  Queue_2_io_deq_valid; 
  wire [3:0] Queue_2_io_deq_bits_id; 
  wire [1:0] Queue_2_io_deq_bits_resp; 
  wire  Queue_3_clock; 
  wire  Queue_3_reset; 
  wire  Queue_3_io_enq_ready; 
  wire  Queue_3_io_enq_valid; 
  wire [3:0] Queue_3_io_enq_bits_id; 
  wire [30:0] Queue_3_io_enq_bits_addr; 
  wire [7:0] Queue_3_io_enq_bits_len; 
  wire [2:0] Queue_3_io_enq_bits_size; 
  wire [1:0] Queue_3_io_enq_bits_burst; 
  wire  Queue_3_io_deq_ready; 
  wire  Queue_3_io_deq_valid; 
  wire [3:0] Queue_3_io_deq_bits_id; 
  wire [30:0] Queue_3_io_deq_bits_addr; 
  wire [7:0] Queue_3_io_deq_bits_len; 
  wire [2:0] Queue_3_io_deq_bits_size; 
  wire [1:0] Queue_3_io_deq_bits_burst; 
  wire  Queue_4_clock; 
  wire  Queue_4_reset; 
  wire  Queue_4_io_enq_ready; 
  wire  Queue_4_io_enq_valid; 
  wire [3:0] Queue_4_io_enq_bits_id; 
  wire [63:0] Queue_4_io_enq_bits_data; 
  wire [1:0] Queue_4_io_enq_bits_resp; 
  wire  Queue_4_io_enq_bits_last; 
  wire  Queue_4_io_deq_ready; 
  wire  Queue_4_io_deq_valid; 
  wire [3:0] Queue_4_io_deq_bits_id; 
  wire [63:0] Queue_4_io_deq_bits_data; 
  wire [1:0] Queue_4_io_deq_bits_resp; 
  wire  Queue_4_io_deq_bits_last; 
  Queue_94 Queue ( 
    .clock(Queue_clock),
    .reset(Queue_reset),
    .io_enq_ready(Queue_io_enq_ready),
    .io_enq_valid(Queue_io_enq_valid),
    .io_enq_bits_id(Queue_io_enq_bits_id),
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
  Queue_95 Queue_1 ( 
    .clock(Queue_1_clock),
    .reset(Queue_1_reset),
    .io_enq_ready(Queue_1_io_enq_ready),
    .io_enq_valid(Queue_1_io_enq_valid),
    .io_enq_bits_data(Queue_1_io_enq_bits_data),
    .io_enq_bits_strb(Queue_1_io_enq_bits_strb),
    .io_enq_bits_last(Queue_1_io_enq_bits_last),
    .io_deq_ready(Queue_1_io_deq_ready),
    .io_deq_valid(Queue_1_io_deq_valid),
    .io_deq_bits_data(Queue_1_io_deq_bits_data),
    .io_deq_bits_strb(Queue_1_io_deq_bits_strb),
    .io_deq_bits_last(Queue_1_io_deq_bits_last)
  );
  Queue_96 Queue_2 ( 
    .clock(Queue_2_clock),
    .reset(Queue_2_reset),
    .io_enq_ready(Queue_2_io_enq_ready),
    .io_enq_valid(Queue_2_io_enq_valid),
    .io_enq_bits_id(Queue_2_io_enq_bits_id),
    .io_enq_bits_resp(Queue_2_io_enq_bits_resp),
    .io_deq_ready(Queue_2_io_deq_ready),
    .io_deq_valid(Queue_2_io_deq_valid),
    .io_deq_bits_id(Queue_2_io_deq_bits_id),
    .io_deq_bits_resp(Queue_2_io_deq_bits_resp)
  );
  Queue_94 Queue_3 ( 
    .clock(Queue_3_clock),
    .reset(Queue_3_reset),
    .io_enq_ready(Queue_3_io_enq_ready),
    .io_enq_valid(Queue_3_io_enq_valid),
    .io_enq_bits_id(Queue_3_io_enq_bits_id),
    .io_enq_bits_addr(Queue_3_io_enq_bits_addr),
    .io_enq_bits_len(Queue_3_io_enq_bits_len),
    .io_enq_bits_size(Queue_3_io_enq_bits_size),
    .io_enq_bits_burst(Queue_3_io_enq_bits_burst),
    .io_deq_ready(Queue_3_io_deq_ready),
    .io_deq_valid(Queue_3_io_deq_valid),
    .io_deq_bits_id(Queue_3_io_deq_bits_id),
    .io_deq_bits_addr(Queue_3_io_deq_bits_addr),
    .io_deq_bits_len(Queue_3_io_deq_bits_len),
    .io_deq_bits_size(Queue_3_io_deq_bits_size),
    .io_deq_bits_burst(Queue_3_io_deq_bits_burst)
  );
  Queue_98 Queue_4 ( 
    .clock(Queue_4_clock),
    .reset(Queue_4_reset),
    .io_enq_ready(Queue_4_io_enq_ready),
    .io_enq_valid(Queue_4_io_enq_valid),
    .io_enq_bits_id(Queue_4_io_enq_bits_id),
    .io_enq_bits_data(Queue_4_io_enq_bits_data),
    .io_enq_bits_resp(Queue_4_io_enq_bits_resp),
    .io_enq_bits_last(Queue_4_io_enq_bits_last),
    .io_deq_ready(Queue_4_io_deq_ready),
    .io_deq_valid(Queue_4_io_deq_valid),
    .io_deq_bits_id(Queue_4_io_deq_bits_id),
    .io_deq_bits_data(Queue_4_io_deq_bits_data),
    .io_deq_bits_resp(Queue_4_io_deq_bits_resp),
    .io_deq_bits_last(Queue_4_io_deq_bits_last)
  );
  assign auto_in_aw_ready = Queue_io_enq_ready; 
  assign auto_in_w_ready = Queue_1_io_enq_ready; 
  assign auto_in_b_valid = Queue_2_io_deq_valid; 
  assign auto_in_b_bits_id = Queue_2_io_deq_bits_id; 
  assign auto_in_b_bits_resp = Queue_2_io_deq_bits_resp; 
  assign auto_in_ar_ready = Queue_3_io_enq_ready; 
  assign auto_in_r_valid = Queue_4_io_deq_valid; 
  assign auto_in_r_bits_id = Queue_4_io_deq_bits_id; 
  assign auto_in_r_bits_data = Queue_4_io_deq_bits_data; 
  assign auto_in_r_bits_resp = Queue_4_io_deq_bits_resp; 
  assign auto_in_r_bits_last = Queue_4_io_deq_bits_last; 
  assign auto_out_aw_valid = Queue_io_deq_valid; 
  assign auto_out_aw_bits_id = Queue_io_deq_bits_id; 
  assign auto_out_aw_bits_addr = Queue_io_deq_bits_addr; 
  assign auto_out_aw_bits_len = Queue_io_deq_bits_len; 
  assign auto_out_aw_bits_size = Queue_io_deq_bits_size; 
  assign auto_out_aw_bits_burst = Queue_io_deq_bits_burst; 
  assign auto_out_w_valid = Queue_1_io_deq_valid; 
  assign auto_out_w_bits_data = Queue_1_io_deq_bits_data; 
  assign auto_out_w_bits_strb = Queue_1_io_deq_bits_strb; 
  assign auto_out_w_bits_last = Queue_1_io_deq_bits_last; 
  assign auto_out_b_ready = Queue_2_io_enq_ready; 
  assign auto_out_ar_valid = Queue_3_io_deq_valid; 
  assign auto_out_ar_bits_id = Queue_3_io_deq_bits_id; 
  assign auto_out_ar_bits_addr = Queue_3_io_deq_bits_addr; 
  assign auto_out_ar_bits_len = Queue_3_io_deq_bits_len; 
  assign auto_out_ar_bits_size = Queue_3_io_deq_bits_size; 
  assign auto_out_ar_bits_burst = Queue_3_io_deq_bits_burst; 
  assign auto_out_r_ready = Queue_4_io_enq_ready; 
  assign Queue_clock = clock; 
  assign Queue_reset = reset; 
  assign Queue_io_enq_valid = auto_in_aw_valid; 
  assign Queue_io_enq_bits_id = auto_in_aw_bits_id; 
  assign Queue_io_enq_bits_addr = auto_in_aw_bits_addr; 
  assign Queue_io_enq_bits_len = auto_in_aw_bits_len; 
  assign Queue_io_enq_bits_size = auto_in_aw_bits_size; 
  assign Queue_io_enq_bits_burst = auto_in_aw_bits_burst; 
  assign Queue_io_deq_ready = auto_out_aw_ready; 
  assign Queue_1_clock = clock; 
  assign Queue_1_reset = reset; 
  assign Queue_1_io_enq_valid = auto_in_w_valid; 
  assign Queue_1_io_enq_bits_data = auto_in_w_bits_data; 
  assign Queue_1_io_enq_bits_strb = auto_in_w_bits_strb; 
  assign Queue_1_io_enq_bits_last = auto_in_w_bits_last; 
  assign Queue_1_io_deq_ready = auto_out_w_ready; 
  assign Queue_2_clock = clock; 
  assign Queue_2_reset = reset; 
  assign Queue_2_io_enq_valid = auto_out_b_valid; 
  assign Queue_2_io_enq_bits_id = auto_out_b_bits_id; 
  assign Queue_2_io_enq_bits_resp = auto_out_b_bits_resp; 
  assign Queue_2_io_deq_ready = auto_in_b_ready; 
  assign Queue_3_clock = clock; 
  assign Queue_3_reset = reset; 
  assign Queue_3_io_enq_valid = auto_in_ar_valid; 
  assign Queue_3_io_enq_bits_id = auto_in_ar_bits_id; 
  assign Queue_3_io_enq_bits_addr = auto_in_ar_bits_addr; 
  assign Queue_3_io_enq_bits_len = auto_in_ar_bits_len; 
  assign Queue_3_io_enq_bits_size = auto_in_ar_bits_size; 
  assign Queue_3_io_enq_bits_burst = auto_in_ar_bits_burst; 
  assign Queue_3_io_deq_ready = auto_out_ar_ready; 
  assign Queue_4_clock = clock; 
  assign Queue_4_reset = reset; 
  assign Queue_4_io_enq_valid = auto_out_r_valid; 
  assign Queue_4_io_enq_bits_id = auto_out_r_bits_id; 
  assign Queue_4_io_enq_bits_data = auto_out_r_bits_data; 
  assign Queue_4_io_enq_bits_resp = auto_out_r_bits_resp; 
  assign Queue_4_io_enq_bits_last = auto_out_r_bits_last; 
  assign Queue_4_io_deq_ready = auto_in_r_ready; 
endmodule
