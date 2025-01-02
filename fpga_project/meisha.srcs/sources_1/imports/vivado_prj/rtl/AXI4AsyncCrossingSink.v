module AXI4AsyncCrossingSink( 
  input         clock, 
  input         reset, 
  input  [3:0]  auto_in_aw_mem_0_id, 
  input  [31:0] auto_in_aw_mem_0_addr, 
  input  [7:0]  auto_in_aw_mem_0_len, 
  input  [2:0]  auto_in_aw_mem_0_size, 
  input  [1:0]  auto_in_aw_mem_0_burst, 
  input         auto_in_aw_mem_0_lock, 
  input  [3:0]  auto_in_aw_mem_0_cache, 
  input  [2:0]  auto_in_aw_mem_0_prot, 
  input  [3:0]  auto_in_aw_mem_0_qos, 
  input  [3:0]  auto_in_aw_mem_1_id, 
  input  [31:0] auto_in_aw_mem_1_addr, 
  input  [7:0]  auto_in_aw_mem_1_len, 
  input  [2:0]  auto_in_aw_mem_1_size, 
  input  [1:0]  auto_in_aw_mem_1_burst, 
  input         auto_in_aw_mem_1_lock, 
  input  [3:0]  auto_in_aw_mem_1_cache, 
  input  [2:0]  auto_in_aw_mem_1_prot, 
  input  [3:0]  auto_in_aw_mem_1_qos, 
  input  [3:0]  auto_in_aw_mem_2_id, 
  input  [31:0] auto_in_aw_mem_2_addr, 
  input  [7:0]  auto_in_aw_mem_2_len, 
  input  [2:0]  auto_in_aw_mem_2_size, 
  input  [1:0]  auto_in_aw_mem_2_burst, 
  input         auto_in_aw_mem_2_lock, 
  input  [3:0]  auto_in_aw_mem_2_cache, 
  input  [2:0]  auto_in_aw_mem_2_prot, 
  input  [3:0]  auto_in_aw_mem_2_qos, 
  input  [3:0]  auto_in_aw_mem_3_id, 
  input  [31:0] auto_in_aw_mem_3_addr, 
  input  [7:0]  auto_in_aw_mem_3_len, 
  input  [2:0]  auto_in_aw_mem_3_size, 
  input  [1:0]  auto_in_aw_mem_3_burst, 
  input         auto_in_aw_mem_3_lock, 
  input  [3:0]  auto_in_aw_mem_3_cache, 
  input  [2:0]  auto_in_aw_mem_3_prot, 
  input  [3:0]  auto_in_aw_mem_3_qos, 
  input  [3:0]  auto_in_aw_mem_4_id, 
  input  [31:0] auto_in_aw_mem_4_addr, 
  input  [7:0]  auto_in_aw_mem_4_len, 
  input  [2:0]  auto_in_aw_mem_4_size, 
  input  [1:0]  auto_in_aw_mem_4_burst, 
  input         auto_in_aw_mem_4_lock, 
  input  [3:0]  auto_in_aw_mem_4_cache, 
  input  [2:0]  auto_in_aw_mem_4_prot, 
  input  [3:0]  auto_in_aw_mem_4_qos, 
  input  [3:0]  auto_in_aw_mem_5_id, 
  input  [31:0] auto_in_aw_mem_5_addr, 
  input  [7:0]  auto_in_aw_mem_5_len, 
  input  [2:0]  auto_in_aw_mem_5_size, 
  input  [1:0]  auto_in_aw_mem_5_burst, 
  input         auto_in_aw_mem_5_lock, 
  input  [3:0]  auto_in_aw_mem_5_cache, 
  input  [2:0]  auto_in_aw_mem_5_prot, 
  input  [3:0]  auto_in_aw_mem_5_qos, 
  input  [3:0]  auto_in_aw_mem_6_id, 
  input  [31:0] auto_in_aw_mem_6_addr, 
  input  [7:0]  auto_in_aw_mem_6_len, 
  input  [2:0]  auto_in_aw_mem_6_size, 
  input  [1:0]  auto_in_aw_mem_6_burst, 
  input         auto_in_aw_mem_6_lock, 
  input  [3:0]  auto_in_aw_mem_6_cache, 
  input  [2:0]  auto_in_aw_mem_6_prot, 
  input  [3:0]  auto_in_aw_mem_6_qos, 
  input  [3:0]  auto_in_aw_mem_7_id, 
  input  [31:0] auto_in_aw_mem_7_addr, 
  input  [7:0]  auto_in_aw_mem_7_len, 
  input  [2:0]  auto_in_aw_mem_7_size, 
  input  [1:0]  auto_in_aw_mem_7_burst, 
  input         auto_in_aw_mem_7_lock, 
  input  [3:0]  auto_in_aw_mem_7_cache, 
  input  [2:0]  auto_in_aw_mem_7_prot, 
  input  [3:0]  auto_in_aw_mem_7_qos, 
  output [3:0]  auto_in_aw_ridx, 
  input  [3:0]  auto_in_aw_widx, 
  output        auto_in_aw_safe_ridx_valid, 
  input         auto_in_aw_safe_widx_valid, 
  input         auto_in_aw_safe_source_reset_n, 
  output        auto_in_aw_safe_sink_reset_n, 
  input  [63:0] auto_in_w_mem_0_data, 
  input  [7:0]  auto_in_w_mem_0_strb, 
  input         auto_in_w_mem_0_last, 
  input  [63:0] auto_in_w_mem_1_data, 
  input  [7:0]  auto_in_w_mem_1_strb, 
  input         auto_in_w_mem_1_last, 
  input  [63:0] auto_in_w_mem_2_data, 
  input  [7:0]  auto_in_w_mem_2_strb, 
  input         auto_in_w_mem_2_last, 
  input  [63:0] auto_in_w_mem_3_data, 
  input  [7:0]  auto_in_w_mem_3_strb, 
  input         auto_in_w_mem_3_last, 
  input  [63:0] auto_in_w_mem_4_data, 
  input  [7:0]  auto_in_w_mem_4_strb, 
  input         auto_in_w_mem_4_last, 
  input  [63:0] auto_in_w_mem_5_data, 
  input  [7:0]  auto_in_w_mem_5_strb, 
  input         auto_in_w_mem_5_last, 
  input  [63:0] auto_in_w_mem_6_data, 
  input  [7:0]  auto_in_w_mem_6_strb, 
  input         auto_in_w_mem_6_last, 
  input  [63:0] auto_in_w_mem_7_data, 
  input  [7:0]  auto_in_w_mem_7_strb, 
  input         auto_in_w_mem_7_last, 
  output [3:0]  auto_in_w_ridx, 
  input  [3:0]  auto_in_w_widx, 
  output        auto_in_w_safe_ridx_valid, 
  input         auto_in_w_safe_widx_valid, 
  input         auto_in_w_safe_source_reset_n, 
  output        auto_in_w_safe_sink_reset_n, 
  output [3:0]  auto_in_b_mem_0_id, 
  output [1:0]  auto_in_b_mem_0_resp, 
  output [3:0]  auto_in_b_mem_1_id, 
  output [1:0]  auto_in_b_mem_1_resp, 
  output [3:0]  auto_in_b_mem_2_id, 
  output [1:0]  auto_in_b_mem_2_resp, 
  output [3:0]  auto_in_b_mem_3_id, 
  output [1:0]  auto_in_b_mem_3_resp, 
  output [3:0]  auto_in_b_mem_4_id, 
  output [1:0]  auto_in_b_mem_4_resp, 
  output [3:0]  auto_in_b_mem_5_id, 
  output [1:0]  auto_in_b_mem_5_resp, 
  output [3:0]  auto_in_b_mem_6_id, 
  output [1:0]  auto_in_b_mem_6_resp, 
  output [3:0]  auto_in_b_mem_7_id, 
  output [1:0]  auto_in_b_mem_7_resp, 
  input  [3:0]  auto_in_b_ridx, 
  output [3:0]  auto_in_b_widx, 
  input         auto_in_b_safe_ridx_valid, 
  output        auto_in_b_safe_widx_valid, 
  output        auto_in_b_safe_source_reset_n, 
  input         auto_in_b_safe_sink_reset_n, 
  input  [3:0]  auto_in_ar_mem_0_id, 
  input  [31:0] auto_in_ar_mem_0_addr, 
  input  [7:0]  auto_in_ar_mem_0_len, 
  input  [2:0]  auto_in_ar_mem_0_size, 
  input  [1:0]  auto_in_ar_mem_0_burst, 
  input         auto_in_ar_mem_0_lock, 
  input  [3:0]  auto_in_ar_mem_0_cache, 
  input  [2:0]  auto_in_ar_mem_0_prot, 
  input  [3:0]  auto_in_ar_mem_0_qos, 
  input  [3:0]  auto_in_ar_mem_1_id, 
  input  [31:0] auto_in_ar_mem_1_addr, 
  input  [7:0]  auto_in_ar_mem_1_len, 
  input  [2:0]  auto_in_ar_mem_1_size, 
  input  [1:0]  auto_in_ar_mem_1_burst, 
  input         auto_in_ar_mem_1_lock, 
  input  [3:0]  auto_in_ar_mem_1_cache, 
  input  [2:0]  auto_in_ar_mem_1_prot, 
  input  [3:0]  auto_in_ar_mem_1_qos, 
  input  [3:0]  auto_in_ar_mem_2_id, 
  input  [31:0] auto_in_ar_mem_2_addr, 
  input  [7:0]  auto_in_ar_mem_2_len, 
  input  [2:0]  auto_in_ar_mem_2_size, 
  input  [1:0]  auto_in_ar_mem_2_burst, 
  input         auto_in_ar_mem_2_lock, 
  input  [3:0]  auto_in_ar_mem_2_cache, 
  input  [2:0]  auto_in_ar_mem_2_prot, 
  input  [3:0]  auto_in_ar_mem_2_qos, 
  input  [3:0]  auto_in_ar_mem_3_id, 
  input  [31:0] auto_in_ar_mem_3_addr, 
  input  [7:0]  auto_in_ar_mem_3_len, 
  input  [2:0]  auto_in_ar_mem_3_size, 
  input  [1:0]  auto_in_ar_mem_3_burst, 
  input         auto_in_ar_mem_3_lock, 
  input  [3:0]  auto_in_ar_mem_3_cache, 
  input  [2:0]  auto_in_ar_mem_3_prot, 
  input  [3:0]  auto_in_ar_mem_3_qos, 
  input  [3:0]  auto_in_ar_mem_4_id, 
  input  [31:0] auto_in_ar_mem_4_addr, 
  input  [7:0]  auto_in_ar_mem_4_len, 
  input  [2:0]  auto_in_ar_mem_4_size, 
  input  [1:0]  auto_in_ar_mem_4_burst, 
  input         auto_in_ar_mem_4_lock, 
  input  [3:0]  auto_in_ar_mem_4_cache, 
  input  [2:0]  auto_in_ar_mem_4_prot, 
  input  [3:0]  auto_in_ar_mem_4_qos, 
  input  [3:0]  auto_in_ar_mem_5_id, 
  input  [31:0] auto_in_ar_mem_5_addr, 
  input  [7:0]  auto_in_ar_mem_5_len, 
  input  [2:0]  auto_in_ar_mem_5_size, 
  input  [1:0]  auto_in_ar_mem_5_burst, 
  input         auto_in_ar_mem_5_lock, 
  input  [3:0]  auto_in_ar_mem_5_cache, 
  input  [2:0]  auto_in_ar_mem_5_prot, 
  input  [3:0]  auto_in_ar_mem_5_qos, 
  input  [3:0]  auto_in_ar_mem_6_id, 
  input  [31:0] auto_in_ar_mem_6_addr, 
  input  [7:0]  auto_in_ar_mem_6_len, 
  input  [2:0]  auto_in_ar_mem_6_size, 
  input  [1:0]  auto_in_ar_mem_6_burst, 
  input         auto_in_ar_mem_6_lock, 
  input  [3:0]  auto_in_ar_mem_6_cache, 
  input  [2:0]  auto_in_ar_mem_6_prot, 
  input  [3:0]  auto_in_ar_mem_6_qos, 
  input  [3:0]  auto_in_ar_mem_7_id, 
  input  [31:0] auto_in_ar_mem_7_addr, 
  input  [7:0]  auto_in_ar_mem_7_len, 
  input  [2:0]  auto_in_ar_mem_7_size, 
  input  [1:0]  auto_in_ar_mem_7_burst, 
  input         auto_in_ar_mem_7_lock, 
  input  [3:0]  auto_in_ar_mem_7_cache, 
  input  [2:0]  auto_in_ar_mem_7_prot, 
  input  [3:0]  auto_in_ar_mem_7_qos, 
  output [3:0]  auto_in_ar_ridx, 
  input  [3:0]  auto_in_ar_widx, 
  output        auto_in_ar_safe_ridx_valid, 
  input         auto_in_ar_safe_widx_valid, 
  input         auto_in_ar_safe_source_reset_n, 
  output        auto_in_ar_safe_sink_reset_n, 
  output [3:0]  auto_in_r_mem_0_id, 
  output [63:0] auto_in_r_mem_0_data, 
  output [1:0]  auto_in_r_mem_0_resp, 
  output        auto_in_r_mem_0_last, 
  output [3:0]  auto_in_r_mem_1_id, 
  output [63:0] auto_in_r_mem_1_data, 
  output [1:0]  auto_in_r_mem_1_resp, 
  output        auto_in_r_mem_1_last, 
  output [3:0]  auto_in_r_mem_2_id, 
  output [63:0] auto_in_r_mem_2_data, 
  output [1:0]  auto_in_r_mem_2_resp, 
  output        auto_in_r_mem_2_last, 
  output [3:0]  auto_in_r_mem_3_id, 
  output [63:0] auto_in_r_mem_3_data, 
  output [1:0]  auto_in_r_mem_3_resp, 
  output        auto_in_r_mem_3_last, 
  output [3:0]  auto_in_r_mem_4_id, 
  output [63:0] auto_in_r_mem_4_data, 
  output [1:0]  auto_in_r_mem_4_resp, 
  output        auto_in_r_mem_4_last, 
  output [3:0]  auto_in_r_mem_5_id, 
  output [63:0] auto_in_r_mem_5_data, 
  output [1:0]  auto_in_r_mem_5_resp, 
  output        auto_in_r_mem_5_last, 
  output [3:0]  auto_in_r_mem_6_id, 
  output [63:0] auto_in_r_mem_6_data, 
  output [1:0]  auto_in_r_mem_6_resp, 
  output        auto_in_r_mem_6_last, 
  output [3:0]  auto_in_r_mem_7_id, 
  output [63:0] auto_in_r_mem_7_data, 
  output [1:0]  auto_in_r_mem_7_resp, 
  output        auto_in_r_mem_7_last, 
  input  [3:0]  auto_in_r_ridx, 
  output [3:0]  auto_in_r_widx, 
  input         auto_in_r_safe_ridx_valid, 
  output        auto_in_r_safe_widx_valid, 
  output        auto_in_r_safe_source_reset_n, 
  input         auto_in_r_safe_sink_reset_n, 
  input         auto_out_aw_ready, 
  output        auto_out_aw_valid, 
  output [3:0]  auto_out_aw_bits_id, 
  output [31:0] auto_out_aw_bits_addr, 
  output [7:0]  auto_out_aw_bits_len, 
  output [2:0]  auto_out_aw_bits_size, 
  output [1:0]  auto_out_aw_bits_burst, 
  output        auto_out_aw_bits_lock, 
  output [2:0]  auto_out_aw_bits_prot, 
  output [3:0]  auto_out_aw_bits_qos, 
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
  output [31:0] auto_out_ar_bits_addr, 
  output [7:0]  auto_out_ar_bits_len, 
  output [2:0]  auto_out_ar_bits_size, 
  output [1:0]  auto_out_ar_bits_burst, 
  output        auto_out_ar_bits_lock, 
  output [2:0]  auto_out_ar_bits_prot, 
  output [3:0]  auto_out_ar_bits_qos, 
  output        auto_out_r_ready, 
  input         auto_out_r_valid, 
  input  [3:0]  auto_out_r_bits_id, 
  input  [63:0] auto_out_r_bits_data, 
  input  [1:0]  auto_out_r_bits_resp, 
  input         auto_out_r_bits_last 
);
  wire  AsyncQueueSink_clock; 
  wire  AsyncQueueSink_reset; 
  wire  AsyncQueueSink_io_deq_ready; 
  wire  AsyncQueueSink_io_deq_valid; 
  wire [3:0] AsyncQueueSink_io_deq_bits_id; 
  wire [31:0] AsyncQueueSink_io_deq_bits_addr; 
  wire [7:0] AsyncQueueSink_io_deq_bits_len; 
  wire [2:0] AsyncQueueSink_io_deq_bits_size; 
  wire [1:0] AsyncQueueSink_io_deq_bits_burst; 
  wire  AsyncQueueSink_io_deq_bits_lock; 
  wire [3:0] AsyncQueueSink_io_deq_bits_cache; 
  wire [2:0] AsyncQueueSink_io_deq_bits_prot; 
  wire [3:0] AsyncQueueSink_io_deq_bits_qos; 
  wire [3:0] AsyncQueueSink_io_async_mem_0_id; 
  wire [31:0] AsyncQueueSink_io_async_mem_0_addr; 
  wire [7:0] AsyncQueueSink_io_async_mem_0_len; 
  wire [2:0] AsyncQueueSink_io_async_mem_0_size; 
  wire [1:0] AsyncQueueSink_io_async_mem_0_burst; 
  wire  AsyncQueueSink_io_async_mem_0_lock; 
  wire [3:0] AsyncQueueSink_io_async_mem_0_cache; 
  wire [2:0] AsyncQueueSink_io_async_mem_0_prot; 
  wire [3:0] AsyncQueueSink_io_async_mem_0_qos; 
  wire [3:0] AsyncQueueSink_io_async_mem_1_id; 
  wire [31:0] AsyncQueueSink_io_async_mem_1_addr; 
  wire [7:0] AsyncQueueSink_io_async_mem_1_len; 
  wire [2:0] AsyncQueueSink_io_async_mem_1_size; 
  wire [1:0] AsyncQueueSink_io_async_mem_1_burst; 
  wire  AsyncQueueSink_io_async_mem_1_lock; 
  wire [3:0] AsyncQueueSink_io_async_mem_1_cache; 
  wire [2:0] AsyncQueueSink_io_async_mem_1_prot; 
  wire [3:0] AsyncQueueSink_io_async_mem_1_qos; 
  wire [3:0] AsyncQueueSink_io_async_mem_2_id; 
  wire [31:0] AsyncQueueSink_io_async_mem_2_addr; 
  wire [7:0] AsyncQueueSink_io_async_mem_2_len; 
  wire [2:0] AsyncQueueSink_io_async_mem_2_size; 
  wire [1:0] AsyncQueueSink_io_async_mem_2_burst; 
  wire  AsyncQueueSink_io_async_mem_2_lock; 
  wire [3:0] AsyncQueueSink_io_async_mem_2_cache; 
  wire [2:0] AsyncQueueSink_io_async_mem_2_prot; 
  wire [3:0] AsyncQueueSink_io_async_mem_2_qos; 
  wire [3:0] AsyncQueueSink_io_async_mem_3_id; 
  wire [31:0] AsyncQueueSink_io_async_mem_3_addr; 
  wire [7:0] AsyncQueueSink_io_async_mem_3_len; 
  wire [2:0] AsyncQueueSink_io_async_mem_3_size; 
  wire [1:0] AsyncQueueSink_io_async_mem_3_burst; 
  wire  AsyncQueueSink_io_async_mem_3_lock; 
  wire [3:0] AsyncQueueSink_io_async_mem_3_cache; 
  wire [2:0] AsyncQueueSink_io_async_mem_3_prot; 
  wire [3:0] AsyncQueueSink_io_async_mem_3_qos; 
  wire [3:0] AsyncQueueSink_io_async_mem_4_id; 
  wire [31:0] AsyncQueueSink_io_async_mem_4_addr; 
  wire [7:0] AsyncQueueSink_io_async_mem_4_len; 
  wire [2:0] AsyncQueueSink_io_async_mem_4_size; 
  wire [1:0] AsyncQueueSink_io_async_mem_4_burst; 
  wire  AsyncQueueSink_io_async_mem_4_lock; 
  wire [3:0] AsyncQueueSink_io_async_mem_4_cache; 
  wire [2:0] AsyncQueueSink_io_async_mem_4_prot; 
  wire [3:0] AsyncQueueSink_io_async_mem_4_qos; 
  wire [3:0] AsyncQueueSink_io_async_mem_5_id; 
  wire [31:0] AsyncQueueSink_io_async_mem_5_addr; 
  wire [7:0] AsyncQueueSink_io_async_mem_5_len; 
  wire [2:0] AsyncQueueSink_io_async_mem_5_size; 
  wire [1:0] AsyncQueueSink_io_async_mem_5_burst; 
  wire  AsyncQueueSink_io_async_mem_5_lock; 
  wire [3:0] AsyncQueueSink_io_async_mem_5_cache; 
  wire [2:0] AsyncQueueSink_io_async_mem_5_prot; 
  wire [3:0] AsyncQueueSink_io_async_mem_5_qos; 
  wire [3:0] AsyncQueueSink_io_async_mem_6_id; 
  wire [31:0] AsyncQueueSink_io_async_mem_6_addr; 
  wire [7:0] AsyncQueueSink_io_async_mem_6_len; 
  wire [2:0] AsyncQueueSink_io_async_mem_6_size; 
  wire [1:0] AsyncQueueSink_io_async_mem_6_burst; 
  wire  AsyncQueueSink_io_async_mem_6_lock; 
  wire [3:0] AsyncQueueSink_io_async_mem_6_cache; 
  wire [2:0] AsyncQueueSink_io_async_mem_6_prot; 
  wire [3:0] AsyncQueueSink_io_async_mem_6_qos; 
  wire [3:0] AsyncQueueSink_io_async_mem_7_id; 
  wire [31:0] AsyncQueueSink_io_async_mem_7_addr; 
  wire [7:0] AsyncQueueSink_io_async_mem_7_len; 
  wire [2:0] AsyncQueueSink_io_async_mem_7_size; 
  wire [1:0] AsyncQueueSink_io_async_mem_7_burst; 
  wire  AsyncQueueSink_io_async_mem_7_lock; 
  wire [3:0] AsyncQueueSink_io_async_mem_7_cache; 
  wire [2:0] AsyncQueueSink_io_async_mem_7_prot; 
  wire [3:0] AsyncQueueSink_io_async_mem_7_qos; 
  wire [3:0] AsyncQueueSink_io_async_ridx; 
  wire [3:0] AsyncQueueSink_io_async_widx; 
  wire  AsyncQueueSink_io_async_safe_ridx_valid; 
  wire  AsyncQueueSink_io_async_safe_widx_valid; 
  wire  AsyncQueueSink_io_async_safe_source_reset_n; 
  wire  AsyncQueueSink_io_async_safe_sink_reset_n; 
  wire  AsyncQueueSink_1_clock; 
  wire  AsyncQueueSink_1_reset; 
  wire  AsyncQueueSink_1_io_deq_ready; 
  wire  AsyncQueueSink_1_io_deq_valid; 
  wire [3:0] AsyncQueueSink_1_io_deq_bits_id; 
  wire [31:0] AsyncQueueSink_1_io_deq_bits_addr; 
  wire [7:0] AsyncQueueSink_1_io_deq_bits_len; 
  wire [2:0] AsyncQueueSink_1_io_deq_bits_size; 
  wire [1:0] AsyncQueueSink_1_io_deq_bits_burst; 
  wire  AsyncQueueSink_1_io_deq_bits_lock; 
  wire [3:0] AsyncQueueSink_1_io_deq_bits_cache; 
  wire [2:0] AsyncQueueSink_1_io_deq_bits_prot; 
  wire [3:0] AsyncQueueSink_1_io_deq_bits_qos; 
  wire [3:0] AsyncQueueSink_1_io_async_mem_0_id; 
  wire [31:0] AsyncQueueSink_1_io_async_mem_0_addr; 
  wire [7:0] AsyncQueueSink_1_io_async_mem_0_len; 
  wire [2:0] AsyncQueueSink_1_io_async_mem_0_size; 
  wire [1:0] AsyncQueueSink_1_io_async_mem_0_burst; 
  wire  AsyncQueueSink_1_io_async_mem_0_lock; 
  wire [3:0] AsyncQueueSink_1_io_async_mem_0_cache; 
  wire [2:0] AsyncQueueSink_1_io_async_mem_0_prot; 
  wire [3:0] AsyncQueueSink_1_io_async_mem_0_qos; 
  wire [3:0] AsyncQueueSink_1_io_async_mem_1_id; 
  wire [31:0] AsyncQueueSink_1_io_async_mem_1_addr; 
  wire [7:0] AsyncQueueSink_1_io_async_mem_1_len; 
  wire [2:0] AsyncQueueSink_1_io_async_mem_1_size; 
  wire [1:0] AsyncQueueSink_1_io_async_mem_1_burst; 
  wire  AsyncQueueSink_1_io_async_mem_1_lock; 
  wire [3:0] AsyncQueueSink_1_io_async_mem_1_cache; 
  wire [2:0] AsyncQueueSink_1_io_async_mem_1_prot; 
  wire [3:0] AsyncQueueSink_1_io_async_mem_1_qos; 
  wire [3:0] AsyncQueueSink_1_io_async_mem_2_id; 
  wire [31:0] AsyncQueueSink_1_io_async_mem_2_addr; 
  wire [7:0] AsyncQueueSink_1_io_async_mem_2_len; 
  wire [2:0] AsyncQueueSink_1_io_async_mem_2_size; 
  wire [1:0] AsyncQueueSink_1_io_async_mem_2_burst; 
  wire  AsyncQueueSink_1_io_async_mem_2_lock; 
  wire [3:0] AsyncQueueSink_1_io_async_mem_2_cache; 
  wire [2:0] AsyncQueueSink_1_io_async_mem_2_prot; 
  wire [3:0] AsyncQueueSink_1_io_async_mem_2_qos; 
  wire [3:0] AsyncQueueSink_1_io_async_mem_3_id; 
  wire [31:0] AsyncQueueSink_1_io_async_mem_3_addr; 
  wire [7:0] AsyncQueueSink_1_io_async_mem_3_len; 
  wire [2:0] AsyncQueueSink_1_io_async_mem_3_size; 
  wire [1:0] AsyncQueueSink_1_io_async_mem_3_burst; 
  wire  AsyncQueueSink_1_io_async_mem_3_lock; 
  wire [3:0] AsyncQueueSink_1_io_async_mem_3_cache; 
  wire [2:0] AsyncQueueSink_1_io_async_mem_3_prot; 
  wire [3:0] AsyncQueueSink_1_io_async_mem_3_qos; 
  wire [3:0] AsyncQueueSink_1_io_async_mem_4_id; 
  wire [31:0] AsyncQueueSink_1_io_async_mem_4_addr; 
  wire [7:0] AsyncQueueSink_1_io_async_mem_4_len; 
  wire [2:0] AsyncQueueSink_1_io_async_mem_4_size; 
  wire [1:0] AsyncQueueSink_1_io_async_mem_4_burst; 
  wire  AsyncQueueSink_1_io_async_mem_4_lock; 
  wire [3:0] AsyncQueueSink_1_io_async_mem_4_cache; 
  wire [2:0] AsyncQueueSink_1_io_async_mem_4_prot; 
  wire [3:0] AsyncQueueSink_1_io_async_mem_4_qos; 
  wire [3:0] AsyncQueueSink_1_io_async_mem_5_id; 
  wire [31:0] AsyncQueueSink_1_io_async_mem_5_addr; 
  wire [7:0] AsyncQueueSink_1_io_async_mem_5_len; 
  wire [2:0] AsyncQueueSink_1_io_async_mem_5_size; 
  wire [1:0] AsyncQueueSink_1_io_async_mem_5_burst; 
  wire  AsyncQueueSink_1_io_async_mem_5_lock; 
  wire [3:0] AsyncQueueSink_1_io_async_mem_5_cache; 
  wire [2:0] AsyncQueueSink_1_io_async_mem_5_prot; 
  wire [3:0] AsyncQueueSink_1_io_async_mem_5_qos; 
  wire [3:0] AsyncQueueSink_1_io_async_mem_6_id; 
  wire [31:0] AsyncQueueSink_1_io_async_mem_6_addr; 
  wire [7:0] AsyncQueueSink_1_io_async_mem_6_len; 
  wire [2:0] AsyncQueueSink_1_io_async_mem_6_size; 
  wire [1:0] AsyncQueueSink_1_io_async_mem_6_burst; 
  wire  AsyncQueueSink_1_io_async_mem_6_lock; 
  wire [3:0] AsyncQueueSink_1_io_async_mem_6_cache; 
  wire [2:0] AsyncQueueSink_1_io_async_mem_6_prot; 
  wire [3:0] AsyncQueueSink_1_io_async_mem_6_qos; 
  wire [3:0] AsyncQueueSink_1_io_async_mem_7_id; 
  wire [31:0] AsyncQueueSink_1_io_async_mem_7_addr; 
  wire [7:0] AsyncQueueSink_1_io_async_mem_7_len; 
  wire [2:0] AsyncQueueSink_1_io_async_mem_7_size; 
  wire [1:0] AsyncQueueSink_1_io_async_mem_7_burst; 
  wire  AsyncQueueSink_1_io_async_mem_7_lock; 
  wire [3:0] AsyncQueueSink_1_io_async_mem_7_cache; 
  wire [2:0] AsyncQueueSink_1_io_async_mem_7_prot; 
  wire [3:0] AsyncQueueSink_1_io_async_mem_7_qos; 
  wire [3:0] AsyncQueueSink_1_io_async_ridx; 
  wire [3:0] AsyncQueueSink_1_io_async_widx; 
  wire  AsyncQueueSink_1_io_async_safe_ridx_valid; 
  wire  AsyncQueueSink_1_io_async_safe_widx_valid; 
  wire  AsyncQueueSink_1_io_async_safe_source_reset_n; 
  wire  AsyncQueueSink_1_io_async_safe_sink_reset_n; 
  wire  AsyncQueueSink_2_clock; 
  wire  AsyncQueueSink_2_reset; 
  wire  AsyncQueueSink_2_io_deq_ready; 
  wire  AsyncQueueSink_2_io_deq_valid; 
  wire [63:0] AsyncQueueSink_2_io_deq_bits_data; 
  wire [7:0] AsyncQueueSink_2_io_deq_bits_strb; 
  wire  AsyncQueueSink_2_io_deq_bits_last; 
  wire [63:0] AsyncQueueSink_2_io_async_mem_0_data; 
  wire [7:0] AsyncQueueSink_2_io_async_mem_0_strb; 
  wire  AsyncQueueSink_2_io_async_mem_0_last; 
  wire [63:0] AsyncQueueSink_2_io_async_mem_1_data; 
  wire [7:0] AsyncQueueSink_2_io_async_mem_1_strb; 
  wire  AsyncQueueSink_2_io_async_mem_1_last; 
  wire [63:0] AsyncQueueSink_2_io_async_mem_2_data; 
  wire [7:0] AsyncQueueSink_2_io_async_mem_2_strb; 
  wire  AsyncQueueSink_2_io_async_mem_2_last; 
  wire [63:0] AsyncQueueSink_2_io_async_mem_3_data; 
  wire [7:0] AsyncQueueSink_2_io_async_mem_3_strb; 
  wire  AsyncQueueSink_2_io_async_mem_3_last; 
  wire [63:0] AsyncQueueSink_2_io_async_mem_4_data; 
  wire [7:0] AsyncQueueSink_2_io_async_mem_4_strb; 
  wire  AsyncQueueSink_2_io_async_mem_4_last; 
  wire [63:0] AsyncQueueSink_2_io_async_mem_5_data; 
  wire [7:0] AsyncQueueSink_2_io_async_mem_5_strb; 
  wire  AsyncQueueSink_2_io_async_mem_5_last; 
  wire [63:0] AsyncQueueSink_2_io_async_mem_6_data; 
  wire [7:0] AsyncQueueSink_2_io_async_mem_6_strb; 
  wire  AsyncQueueSink_2_io_async_mem_6_last; 
  wire [63:0] AsyncQueueSink_2_io_async_mem_7_data; 
  wire [7:0] AsyncQueueSink_2_io_async_mem_7_strb; 
  wire  AsyncQueueSink_2_io_async_mem_7_last; 
  wire [3:0] AsyncQueueSink_2_io_async_ridx; 
  wire [3:0] AsyncQueueSink_2_io_async_widx; 
  wire  AsyncQueueSink_2_io_async_safe_ridx_valid; 
  wire  AsyncQueueSink_2_io_async_safe_widx_valid; 
  wire  AsyncQueueSink_2_io_async_safe_source_reset_n; 
  wire  AsyncQueueSink_2_io_async_safe_sink_reset_n; 
  wire  AsyncQueueSource_clock; 
  wire  AsyncQueueSource_reset; 
  wire  AsyncQueueSource_io_enq_ready; 
  wire  AsyncQueueSource_io_enq_valid; 
  wire [3:0] AsyncQueueSource_io_enq_bits_id; 
  wire [63:0] AsyncQueueSource_io_enq_bits_data; 
  wire [1:0] AsyncQueueSource_io_enq_bits_resp; 
  wire  AsyncQueueSource_io_enq_bits_last; 
  wire [3:0] AsyncQueueSource_io_async_mem_0_id; 
  wire [63:0] AsyncQueueSource_io_async_mem_0_data; 
  wire [1:0] AsyncQueueSource_io_async_mem_0_resp; 
  wire  AsyncQueueSource_io_async_mem_0_last; 
  wire [3:0] AsyncQueueSource_io_async_mem_1_id; 
  wire [63:0] AsyncQueueSource_io_async_mem_1_data; 
  wire [1:0] AsyncQueueSource_io_async_mem_1_resp; 
  wire  AsyncQueueSource_io_async_mem_1_last; 
  wire [3:0] AsyncQueueSource_io_async_mem_2_id; 
  wire [63:0] AsyncQueueSource_io_async_mem_2_data; 
  wire [1:0] AsyncQueueSource_io_async_mem_2_resp; 
  wire  AsyncQueueSource_io_async_mem_2_last; 
  wire [3:0] AsyncQueueSource_io_async_mem_3_id; 
  wire [63:0] AsyncQueueSource_io_async_mem_3_data; 
  wire [1:0] AsyncQueueSource_io_async_mem_3_resp; 
  wire  AsyncQueueSource_io_async_mem_3_last; 
  wire [3:0] AsyncQueueSource_io_async_mem_4_id; 
  wire [63:0] AsyncQueueSource_io_async_mem_4_data; 
  wire [1:0] AsyncQueueSource_io_async_mem_4_resp; 
  wire  AsyncQueueSource_io_async_mem_4_last; 
  wire [3:0] AsyncQueueSource_io_async_mem_5_id; 
  wire [63:0] AsyncQueueSource_io_async_mem_5_data; 
  wire [1:0] AsyncQueueSource_io_async_mem_5_resp; 
  wire  AsyncQueueSource_io_async_mem_5_last; 
  wire [3:0] AsyncQueueSource_io_async_mem_6_id; 
  wire [63:0] AsyncQueueSource_io_async_mem_6_data; 
  wire [1:0] AsyncQueueSource_io_async_mem_6_resp; 
  wire  AsyncQueueSource_io_async_mem_6_last; 
  wire [3:0] AsyncQueueSource_io_async_mem_7_id; 
  wire [63:0] AsyncQueueSource_io_async_mem_7_data; 
  wire [1:0] AsyncQueueSource_io_async_mem_7_resp; 
  wire  AsyncQueueSource_io_async_mem_7_last; 
  wire [3:0] AsyncQueueSource_io_async_ridx; 
  wire [3:0] AsyncQueueSource_io_async_widx; 
  wire  AsyncQueueSource_io_async_safe_ridx_valid; 
  wire  AsyncQueueSource_io_async_safe_widx_valid; 
  wire  AsyncQueueSource_io_async_safe_source_reset_n; 
  wire  AsyncQueueSource_io_async_safe_sink_reset_n; 
  wire  AsyncQueueSource_1_clock; 
  wire  AsyncQueueSource_1_reset; 
  wire  AsyncQueueSource_1_io_enq_ready; 
  wire  AsyncQueueSource_1_io_enq_valid; 
  wire [3:0] AsyncQueueSource_1_io_enq_bits_id; 
  wire [1:0] AsyncQueueSource_1_io_enq_bits_resp; 
  wire [3:0] AsyncQueueSource_1_io_async_mem_0_id; 
  wire [1:0] AsyncQueueSource_1_io_async_mem_0_resp; 
  wire [3:0] AsyncQueueSource_1_io_async_mem_1_id; 
  wire [1:0] AsyncQueueSource_1_io_async_mem_1_resp; 
  wire [3:0] AsyncQueueSource_1_io_async_mem_2_id; 
  wire [1:0] AsyncQueueSource_1_io_async_mem_2_resp; 
  wire [3:0] AsyncQueueSource_1_io_async_mem_3_id; 
  wire [1:0] AsyncQueueSource_1_io_async_mem_3_resp; 
  wire [3:0] AsyncQueueSource_1_io_async_mem_4_id; 
  wire [1:0] AsyncQueueSource_1_io_async_mem_4_resp; 
  wire [3:0] AsyncQueueSource_1_io_async_mem_5_id; 
  wire [1:0] AsyncQueueSource_1_io_async_mem_5_resp; 
  wire [3:0] AsyncQueueSource_1_io_async_mem_6_id; 
  wire [1:0] AsyncQueueSource_1_io_async_mem_6_resp; 
  wire [3:0] AsyncQueueSource_1_io_async_mem_7_id; 
  wire [1:0] AsyncQueueSource_1_io_async_mem_7_resp; 
  wire [3:0] AsyncQueueSource_1_io_async_ridx; 
  wire [3:0] AsyncQueueSource_1_io_async_widx; 
  wire  AsyncQueueSource_1_io_async_safe_ridx_valid; 
  wire  AsyncQueueSource_1_io_async_safe_widx_valid; 
  wire  AsyncQueueSource_1_io_async_safe_source_reset_n; 
  wire  AsyncQueueSource_1_io_async_safe_sink_reset_n; 
  AsyncQueueSink_3 AsyncQueueSink ( 
    .clock(AsyncQueueSink_clock),
    .reset(AsyncQueueSink_reset),
    .io_deq_ready(AsyncQueueSink_io_deq_ready),
    .io_deq_valid(AsyncQueueSink_io_deq_valid),
    .io_deq_bits_id(AsyncQueueSink_io_deq_bits_id),
    .io_deq_bits_addr(AsyncQueueSink_io_deq_bits_addr),
    .io_deq_bits_len(AsyncQueueSink_io_deq_bits_len),
    .io_deq_bits_size(AsyncQueueSink_io_deq_bits_size),
    .io_deq_bits_burst(AsyncQueueSink_io_deq_bits_burst),
    .io_deq_bits_lock(AsyncQueueSink_io_deq_bits_lock),
    .io_deq_bits_cache(AsyncQueueSink_io_deq_bits_cache),
    .io_deq_bits_prot(AsyncQueueSink_io_deq_bits_prot),
    .io_deq_bits_qos(AsyncQueueSink_io_deq_bits_qos),
    .io_async_mem_0_id(AsyncQueueSink_io_async_mem_0_id),
    .io_async_mem_0_addr(AsyncQueueSink_io_async_mem_0_addr),
    .io_async_mem_0_len(AsyncQueueSink_io_async_mem_0_len),
    .io_async_mem_0_size(AsyncQueueSink_io_async_mem_0_size),
    .io_async_mem_0_burst(AsyncQueueSink_io_async_mem_0_burst),
    .io_async_mem_0_lock(AsyncQueueSink_io_async_mem_0_lock),
    .io_async_mem_0_cache(AsyncQueueSink_io_async_mem_0_cache),
    .io_async_mem_0_prot(AsyncQueueSink_io_async_mem_0_prot),
    .io_async_mem_0_qos(AsyncQueueSink_io_async_mem_0_qos),
    .io_async_mem_1_id(AsyncQueueSink_io_async_mem_1_id),
    .io_async_mem_1_addr(AsyncQueueSink_io_async_mem_1_addr),
    .io_async_mem_1_len(AsyncQueueSink_io_async_mem_1_len),
    .io_async_mem_1_size(AsyncQueueSink_io_async_mem_1_size),
    .io_async_mem_1_burst(AsyncQueueSink_io_async_mem_1_burst),
    .io_async_mem_1_lock(AsyncQueueSink_io_async_mem_1_lock),
    .io_async_mem_1_cache(AsyncQueueSink_io_async_mem_1_cache),
    .io_async_mem_1_prot(AsyncQueueSink_io_async_mem_1_prot),
    .io_async_mem_1_qos(AsyncQueueSink_io_async_mem_1_qos),
    .io_async_mem_2_id(AsyncQueueSink_io_async_mem_2_id),
    .io_async_mem_2_addr(AsyncQueueSink_io_async_mem_2_addr),
    .io_async_mem_2_len(AsyncQueueSink_io_async_mem_2_len),
    .io_async_mem_2_size(AsyncQueueSink_io_async_mem_2_size),
    .io_async_mem_2_burst(AsyncQueueSink_io_async_mem_2_burst),
    .io_async_mem_2_lock(AsyncQueueSink_io_async_mem_2_lock),
    .io_async_mem_2_cache(AsyncQueueSink_io_async_mem_2_cache),
    .io_async_mem_2_prot(AsyncQueueSink_io_async_mem_2_prot),
    .io_async_mem_2_qos(AsyncQueueSink_io_async_mem_2_qos),
    .io_async_mem_3_id(AsyncQueueSink_io_async_mem_3_id),
    .io_async_mem_3_addr(AsyncQueueSink_io_async_mem_3_addr),
    .io_async_mem_3_len(AsyncQueueSink_io_async_mem_3_len),
    .io_async_mem_3_size(AsyncQueueSink_io_async_mem_3_size),
    .io_async_mem_3_burst(AsyncQueueSink_io_async_mem_3_burst),
    .io_async_mem_3_lock(AsyncQueueSink_io_async_mem_3_lock),
    .io_async_mem_3_cache(AsyncQueueSink_io_async_mem_3_cache),
    .io_async_mem_3_prot(AsyncQueueSink_io_async_mem_3_prot),
    .io_async_mem_3_qos(AsyncQueueSink_io_async_mem_3_qos),
    .io_async_mem_4_id(AsyncQueueSink_io_async_mem_4_id),
    .io_async_mem_4_addr(AsyncQueueSink_io_async_mem_4_addr),
    .io_async_mem_4_len(AsyncQueueSink_io_async_mem_4_len),
    .io_async_mem_4_size(AsyncQueueSink_io_async_mem_4_size),
    .io_async_mem_4_burst(AsyncQueueSink_io_async_mem_4_burst),
    .io_async_mem_4_lock(AsyncQueueSink_io_async_mem_4_lock),
    .io_async_mem_4_cache(AsyncQueueSink_io_async_mem_4_cache),
    .io_async_mem_4_prot(AsyncQueueSink_io_async_mem_4_prot),
    .io_async_mem_4_qos(AsyncQueueSink_io_async_mem_4_qos),
    .io_async_mem_5_id(AsyncQueueSink_io_async_mem_5_id),
    .io_async_mem_5_addr(AsyncQueueSink_io_async_mem_5_addr),
    .io_async_mem_5_len(AsyncQueueSink_io_async_mem_5_len),
    .io_async_mem_5_size(AsyncQueueSink_io_async_mem_5_size),
    .io_async_mem_5_burst(AsyncQueueSink_io_async_mem_5_burst),
    .io_async_mem_5_lock(AsyncQueueSink_io_async_mem_5_lock),
    .io_async_mem_5_cache(AsyncQueueSink_io_async_mem_5_cache),
    .io_async_mem_5_prot(AsyncQueueSink_io_async_mem_5_prot),
    .io_async_mem_5_qos(AsyncQueueSink_io_async_mem_5_qos),
    .io_async_mem_6_id(AsyncQueueSink_io_async_mem_6_id),
    .io_async_mem_6_addr(AsyncQueueSink_io_async_mem_6_addr),
    .io_async_mem_6_len(AsyncQueueSink_io_async_mem_6_len),
    .io_async_mem_6_size(AsyncQueueSink_io_async_mem_6_size),
    .io_async_mem_6_burst(AsyncQueueSink_io_async_mem_6_burst),
    .io_async_mem_6_lock(AsyncQueueSink_io_async_mem_6_lock),
    .io_async_mem_6_cache(AsyncQueueSink_io_async_mem_6_cache),
    .io_async_mem_6_prot(AsyncQueueSink_io_async_mem_6_prot),
    .io_async_mem_6_qos(AsyncQueueSink_io_async_mem_6_qos),
    .io_async_mem_7_id(AsyncQueueSink_io_async_mem_7_id),
    .io_async_mem_7_addr(AsyncQueueSink_io_async_mem_7_addr),
    .io_async_mem_7_len(AsyncQueueSink_io_async_mem_7_len),
    .io_async_mem_7_size(AsyncQueueSink_io_async_mem_7_size),
    .io_async_mem_7_burst(AsyncQueueSink_io_async_mem_7_burst),
    .io_async_mem_7_lock(AsyncQueueSink_io_async_mem_7_lock),
    .io_async_mem_7_cache(AsyncQueueSink_io_async_mem_7_cache),
    .io_async_mem_7_prot(AsyncQueueSink_io_async_mem_7_prot),
    .io_async_mem_7_qos(AsyncQueueSink_io_async_mem_7_qos),
    .io_async_ridx(AsyncQueueSink_io_async_ridx),
    .io_async_widx(AsyncQueueSink_io_async_widx),
    .io_async_safe_ridx_valid(AsyncQueueSink_io_async_safe_ridx_valid),
    .io_async_safe_widx_valid(AsyncQueueSink_io_async_safe_widx_valid),
    .io_async_safe_source_reset_n(AsyncQueueSink_io_async_safe_source_reset_n),
    .io_async_safe_sink_reset_n(AsyncQueueSink_io_async_safe_sink_reset_n)
  );
  AsyncQueueSink_3 AsyncQueueSink_1 ( 
    .clock(AsyncQueueSink_1_clock),
    .reset(AsyncQueueSink_1_reset),
    .io_deq_ready(AsyncQueueSink_1_io_deq_ready),
    .io_deq_valid(AsyncQueueSink_1_io_deq_valid),
    .io_deq_bits_id(AsyncQueueSink_1_io_deq_bits_id),
    .io_deq_bits_addr(AsyncQueueSink_1_io_deq_bits_addr),
    .io_deq_bits_len(AsyncQueueSink_1_io_deq_bits_len),
    .io_deq_bits_size(AsyncQueueSink_1_io_deq_bits_size),
    .io_deq_bits_burst(AsyncQueueSink_1_io_deq_bits_burst),
    .io_deq_bits_lock(AsyncQueueSink_1_io_deq_bits_lock),
    .io_deq_bits_cache(AsyncQueueSink_1_io_deq_bits_cache),
    .io_deq_bits_prot(AsyncQueueSink_1_io_deq_bits_prot),
    .io_deq_bits_qos(AsyncQueueSink_1_io_deq_bits_qos),
    .io_async_mem_0_id(AsyncQueueSink_1_io_async_mem_0_id),
    .io_async_mem_0_addr(AsyncQueueSink_1_io_async_mem_0_addr),
    .io_async_mem_0_len(AsyncQueueSink_1_io_async_mem_0_len),
    .io_async_mem_0_size(AsyncQueueSink_1_io_async_mem_0_size),
    .io_async_mem_0_burst(AsyncQueueSink_1_io_async_mem_0_burst),
    .io_async_mem_0_lock(AsyncQueueSink_1_io_async_mem_0_lock),
    .io_async_mem_0_cache(AsyncQueueSink_1_io_async_mem_0_cache),
    .io_async_mem_0_prot(AsyncQueueSink_1_io_async_mem_0_prot),
    .io_async_mem_0_qos(AsyncQueueSink_1_io_async_mem_0_qos),
    .io_async_mem_1_id(AsyncQueueSink_1_io_async_mem_1_id),
    .io_async_mem_1_addr(AsyncQueueSink_1_io_async_mem_1_addr),
    .io_async_mem_1_len(AsyncQueueSink_1_io_async_mem_1_len),
    .io_async_mem_1_size(AsyncQueueSink_1_io_async_mem_1_size),
    .io_async_mem_1_burst(AsyncQueueSink_1_io_async_mem_1_burst),
    .io_async_mem_1_lock(AsyncQueueSink_1_io_async_mem_1_lock),
    .io_async_mem_1_cache(AsyncQueueSink_1_io_async_mem_1_cache),
    .io_async_mem_1_prot(AsyncQueueSink_1_io_async_mem_1_prot),
    .io_async_mem_1_qos(AsyncQueueSink_1_io_async_mem_1_qos),
    .io_async_mem_2_id(AsyncQueueSink_1_io_async_mem_2_id),
    .io_async_mem_2_addr(AsyncQueueSink_1_io_async_mem_2_addr),
    .io_async_mem_2_len(AsyncQueueSink_1_io_async_mem_2_len),
    .io_async_mem_2_size(AsyncQueueSink_1_io_async_mem_2_size),
    .io_async_mem_2_burst(AsyncQueueSink_1_io_async_mem_2_burst),
    .io_async_mem_2_lock(AsyncQueueSink_1_io_async_mem_2_lock),
    .io_async_mem_2_cache(AsyncQueueSink_1_io_async_mem_2_cache),
    .io_async_mem_2_prot(AsyncQueueSink_1_io_async_mem_2_prot),
    .io_async_mem_2_qos(AsyncQueueSink_1_io_async_mem_2_qos),
    .io_async_mem_3_id(AsyncQueueSink_1_io_async_mem_3_id),
    .io_async_mem_3_addr(AsyncQueueSink_1_io_async_mem_3_addr),
    .io_async_mem_3_len(AsyncQueueSink_1_io_async_mem_3_len),
    .io_async_mem_3_size(AsyncQueueSink_1_io_async_mem_3_size),
    .io_async_mem_3_burst(AsyncQueueSink_1_io_async_mem_3_burst),
    .io_async_mem_3_lock(AsyncQueueSink_1_io_async_mem_3_lock),
    .io_async_mem_3_cache(AsyncQueueSink_1_io_async_mem_3_cache),
    .io_async_mem_3_prot(AsyncQueueSink_1_io_async_mem_3_prot),
    .io_async_mem_3_qos(AsyncQueueSink_1_io_async_mem_3_qos),
    .io_async_mem_4_id(AsyncQueueSink_1_io_async_mem_4_id),
    .io_async_mem_4_addr(AsyncQueueSink_1_io_async_mem_4_addr),
    .io_async_mem_4_len(AsyncQueueSink_1_io_async_mem_4_len),
    .io_async_mem_4_size(AsyncQueueSink_1_io_async_mem_4_size),
    .io_async_mem_4_burst(AsyncQueueSink_1_io_async_mem_4_burst),
    .io_async_mem_4_lock(AsyncQueueSink_1_io_async_mem_4_lock),
    .io_async_mem_4_cache(AsyncQueueSink_1_io_async_mem_4_cache),
    .io_async_mem_4_prot(AsyncQueueSink_1_io_async_mem_4_prot),
    .io_async_mem_4_qos(AsyncQueueSink_1_io_async_mem_4_qos),
    .io_async_mem_5_id(AsyncQueueSink_1_io_async_mem_5_id),
    .io_async_mem_5_addr(AsyncQueueSink_1_io_async_mem_5_addr),
    .io_async_mem_5_len(AsyncQueueSink_1_io_async_mem_5_len),
    .io_async_mem_5_size(AsyncQueueSink_1_io_async_mem_5_size),
    .io_async_mem_5_burst(AsyncQueueSink_1_io_async_mem_5_burst),
    .io_async_mem_5_lock(AsyncQueueSink_1_io_async_mem_5_lock),
    .io_async_mem_5_cache(AsyncQueueSink_1_io_async_mem_5_cache),
    .io_async_mem_5_prot(AsyncQueueSink_1_io_async_mem_5_prot),
    .io_async_mem_5_qos(AsyncQueueSink_1_io_async_mem_5_qos),
    .io_async_mem_6_id(AsyncQueueSink_1_io_async_mem_6_id),
    .io_async_mem_6_addr(AsyncQueueSink_1_io_async_mem_6_addr),
    .io_async_mem_6_len(AsyncQueueSink_1_io_async_mem_6_len),
    .io_async_mem_6_size(AsyncQueueSink_1_io_async_mem_6_size),
    .io_async_mem_6_burst(AsyncQueueSink_1_io_async_mem_6_burst),
    .io_async_mem_6_lock(AsyncQueueSink_1_io_async_mem_6_lock),
    .io_async_mem_6_cache(AsyncQueueSink_1_io_async_mem_6_cache),
    .io_async_mem_6_prot(AsyncQueueSink_1_io_async_mem_6_prot),
    .io_async_mem_6_qos(AsyncQueueSink_1_io_async_mem_6_qos),
    .io_async_mem_7_id(AsyncQueueSink_1_io_async_mem_7_id),
    .io_async_mem_7_addr(AsyncQueueSink_1_io_async_mem_7_addr),
    .io_async_mem_7_len(AsyncQueueSink_1_io_async_mem_7_len),
    .io_async_mem_7_size(AsyncQueueSink_1_io_async_mem_7_size),
    .io_async_mem_7_burst(AsyncQueueSink_1_io_async_mem_7_burst),
    .io_async_mem_7_lock(AsyncQueueSink_1_io_async_mem_7_lock),
    .io_async_mem_7_cache(AsyncQueueSink_1_io_async_mem_7_cache),
    .io_async_mem_7_prot(AsyncQueueSink_1_io_async_mem_7_prot),
    .io_async_mem_7_qos(AsyncQueueSink_1_io_async_mem_7_qos),
    .io_async_ridx(AsyncQueueSink_1_io_async_ridx),
    .io_async_widx(AsyncQueueSink_1_io_async_widx),
    .io_async_safe_ridx_valid(AsyncQueueSink_1_io_async_safe_ridx_valid),
    .io_async_safe_widx_valid(AsyncQueueSink_1_io_async_safe_widx_valid),
    .io_async_safe_source_reset_n(AsyncQueueSink_1_io_async_safe_source_reset_n),
    .io_async_safe_sink_reset_n(AsyncQueueSink_1_io_async_safe_sink_reset_n)
  );
  AsyncQueueSink_5 AsyncQueueSink_2 ( 
    .clock(AsyncQueueSink_2_clock),
    .reset(AsyncQueueSink_2_reset),
    .io_deq_ready(AsyncQueueSink_2_io_deq_ready),
    .io_deq_valid(AsyncQueueSink_2_io_deq_valid),
    .io_deq_bits_data(AsyncQueueSink_2_io_deq_bits_data),
    .io_deq_bits_strb(AsyncQueueSink_2_io_deq_bits_strb),
    .io_deq_bits_last(AsyncQueueSink_2_io_deq_bits_last),
    .io_async_mem_0_data(AsyncQueueSink_2_io_async_mem_0_data),
    .io_async_mem_0_strb(AsyncQueueSink_2_io_async_mem_0_strb),
    .io_async_mem_0_last(AsyncQueueSink_2_io_async_mem_0_last),
    .io_async_mem_1_data(AsyncQueueSink_2_io_async_mem_1_data),
    .io_async_mem_1_strb(AsyncQueueSink_2_io_async_mem_1_strb),
    .io_async_mem_1_last(AsyncQueueSink_2_io_async_mem_1_last),
    .io_async_mem_2_data(AsyncQueueSink_2_io_async_mem_2_data),
    .io_async_mem_2_strb(AsyncQueueSink_2_io_async_mem_2_strb),
    .io_async_mem_2_last(AsyncQueueSink_2_io_async_mem_2_last),
    .io_async_mem_3_data(AsyncQueueSink_2_io_async_mem_3_data),
    .io_async_mem_3_strb(AsyncQueueSink_2_io_async_mem_3_strb),
    .io_async_mem_3_last(AsyncQueueSink_2_io_async_mem_3_last),
    .io_async_mem_4_data(AsyncQueueSink_2_io_async_mem_4_data),
    .io_async_mem_4_strb(AsyncQueueSink_2_io_async_mem_4_strb),
    .io_async_mem_4_last(AsyncQueueSink_2_io_async_mem_4_last),
    .io_async_mem_5_data(AsyncQueueSink_2_io_async_mem_5_data),
    .io_async_mem_5_strb(AsyncQueueSink_2_io_async_mem_5_strb),
    .io_async_mem_5_last(AsyncQueueSink_2_io_async_mem_5_last),
    .io_async_mem_6_data(AsyncQueueSink_2_io_async_mem_6_data),
    .io_async_mem_6_strb(AsyncQueueSink_2_io_async_mem_6_strb),
    .io_async_mem_6_last(AsyncQueueSink_2_io_async_mem_6_last),
    .io_async_mem_7_data(AsyncQueueSink_2_io_async_mem_7_data),
    .io_async_mem_7_strb(AsyncQueueSink_2_io_async_mem_7_strb),
    .io_async_mem_7_last(AsyncQueueSink_2_io_async_mem_7_last),
    .io_async_ridx(AsyncQueueSink_2_io_async_ridx),
    .io_async_widx(AsyncQueueSink_2_io_async_widx),
    .io_async_safe_ridx_valid(AsyncQueueSink_2_io_async_safe_ridx_valid),
    .io_async_safe_widx_valid(AsyncQueueSink_2_io_async_safe_widx_valid),
    .io_async_safe_source_reset_n(AsyncQueueSink_2_io_async_safe_source_reset_n),
    .io_async_safe_sink_reset_n(AsyncQueueSink_2_io_async_safe_sink_reset_n)
  );
  AsyncQueueSource_3 AsyncQueueSource ( 
    .clock(AsyncQueueSource_clock),
    .reset(AsyncQueueSource_reset),
    .io_enq_ready(AsyncQueueSource_io_enq_ready),
    .io_enq_valid(AsyncQueueSource_io_enq_valid),
    .io_enq_bits_id(AsyncQueueSource_io_enq_bits_id),
    .io_enq_bits_data(AsyncQueueSource_io_enq_bits_data),
    .io_enq_bits_resp(AsyncQueueSource_io_enq_bits_resp),
    .io_enq_bits_last(AsyncQueueSource_io_enq_bits_last),
    .io_async_mem_0_id(AsyncQueueSource_io_async_mem_0_id),
    .io_async_mem_0_data(AsyncQueueSource_io_async_mem_0_data),
    .io_async_mem_0_resp(AsyncQueueSource_io_async_mem_0_resp),
    .io_async_mem_0_last(AsyncQueueSource_io_async_mem_0_last),
    .io_async_mem_1_id(AsyncQueueSource_io_async_mem_1_id),
    .io_async_mem_1_data(AsyncQueueSource_io_async_mem_1_data),
    .io_async_mem_1_resp(AsyncQueueSource_io_async_mem_1_resp),
    .io_async_mem_1_last(AsyncQueueSource_io_async_mem_1_last),
    .io_async_mem_2_id(AsyncQueueSource_io_async_mem_2_id),
    .io_async_mem_2_data(AsyncQueueSource_io_async_mem_2_data),
    .io_async_mem_2_resp(AsyncQueueSource_io_async_mem_2_resp),
    .io_async_mem_2_last(AsyncQueueSource_io_async_mem_2_last),
    .io_async_mem_3_id(AsyncQueueSource_io_async_mem_3_id),
    .io_async_mem_3_data(AsyncQueueSource_io_async_mem_3_data),
    .io_async_mem_3_resp(AsyncQueueSource_io_async_mem_3_resp),
    .io_async_mem_3_last(AsyncQueueSource_io_async_mem_3_last),
    .io_async_mem_4_id(AsyncQueueSource_io_async_mem_4_id),
    .io_async_mem_4_data(AsyncQueueSource_io_async_mem_4_data),
    .io_async_mem_4_resp(AsyncQueueSource_io_async_mem_4_resp),
    .io_async_mem_4_last(AsyncQueueSource_io_async_mem_4_last),
    .io_async_mem_5_id(AsyncQueueSource_io_async_mem_5_id),
    .io_async_mem_5_data(AsyncQueueSource_io_async_mem_5_data),
    .io_async_mem_5_resp(AsyncQueueSource_io_async_mem_5_resp),
    .io_async_mem_5_last(AsyncQueueSource_io_async_mem_5_last),
    .io_async_mem_6_id(AsyncQueueSource_io_async_mem_6_id),
    .io_async_mem_6_data(AsyncQueueSource_io_async_mem_6_data),
    .io_async_mem_6_resp(AsyncQueueSource_io_async_mem_6_resp),
    .io_async_mem_6_last(AsyncQueueSource_io_async_mem_6_last),
    .io_async_mem_7_id(AsyncQueueSource_io_async_mem_7_id),
    .io_async_mem_7_data(AsyncQueueSource_io_async_mem_7_data),
    .io_async_mem_7_resp(AsyncQueueSource_io_async_mem_7_resp),
    .io_async_mem_7_last(AsyncQueueSource_io_async_mem_7_last),
    .io_async_ridx(AsyncQueueSource_io_async_ridx),
    .io_async_widx(AsyncQueueSource_io_async_widx),
    .io_async_safe_ridx_valid(AsyncQueueSource_io_async_safe_ridx_valid),
    .io_async_safe_widx_valid(AsyncQueueSource_io_async_safe_widx_valid),
    .io_async_safe_source_reset_n(AsyncQueueSource_io_async_safe_source_reset_n),
    .io_async_safe_sink_reset_n(AsyncQueueSource_io_async_safe_sink_reset_n)
  );
  AsyncQueueSource_4 AsyncQueueSource_1 ( 
    .clock(AsyncQueueSource_1_clock),
    .reset(AsyncQueueSource_1_reset),
    .io_enq_ready(AsyncQueueSource_1_io_enq_ready),
    .io_enq_valid(AsyncQueueSource_1_io_enq_valid),
    .io_enq_bits_id(AsyncQueueSource_1_io_enq_bits_id),
    .io_enq_bits_resp(AsyncQueueSource_1_io_enq_bits_resp),
    .io_async_mem_0_id(AsyncQueueSource_1_io_async_mem_0_id),
    .io_async_mem_0_resp(AsyncQueueSource_1_io_async_mem_0_resp),
    .io_async_mem_1_id(AsyncQueueSource_1_io_async_mem_1_id),
    .io_async_mem_1_resp(AsyncQueueSource_1_io_async_mem_1_resp),
    .io_async_mem_2_id(AsyncQueueSource_1_io_async_mem_2_id),
    .io_async_mem_2_resp(AsyncQueueSource_1_io_async_mem_2_resp),
    .io_async_mem_3_id(AsyncQueueSource_1_io_async_mem_3_id),
    .io_async_mem_3_resp(AsyncQueueSource_1_io_async_mem_3_resp),
    .io_async_mem_4_id(AsyncQueueSource_1_io_async_mem_4_id),
    .io_async_mem_4_resp(AsyncQueueSource_1_io_async_mem_4_resp),
    .io_async_mem_5_id(AsyncQueueSource_1_io_async_mem_5_id),
    .io_async_mem_5_resp(AsyncQueueSource_1_io_async_mem_5_resp),
    .io_async_mem_6_id(AsyncQueueSource_1_io_async_mem_6_id),
    .io_async_mem_6_resp(AsyncQueueSource_1_io_async_mem_6_resp),
    .io_async_mem_7_id(AsyncQueueSource_1_io_async_mem_7_id),
    .io_async_mem_7_resp(AsyncQueueSource_1_io_async_mem_7_resp),
    .io_async_ridx(AsyncQueueSource_1_io_async_ridx),
    .io_async_widx(AsyncQueueSource_1_io_async_widx),
    .io_async_safe_ridx_valid(AsyncQueueSource_1_io_async_safe_ridx_valid),
    .io_async_safe_widx_valid(AsyncQueueSource_1_io_async_safe_widx_valid),
    .io_async_safe_source_reset_n(AsyncQueueSource_1_io_async_safe_source_reset_n),
    .io_async_safe_sink_reset_n(AsyncQueueSource_1_io_async_safe_sink_reset_n)
  );
  assign auto_in_aw_ridx = AsyncQueueSink_1_io_async_ridx; 
  assign auto_in_aw_safe_ridx_valid = AsyncQueueSink_1_io_async_safe_ridx_valid; 
  assign auto_in_aw_safe_sink_reset_n = AsyncQueueSink_1_io_async_safe_sink_reset_n; 
  assign auto_in_w_ridx = AsyncQueueSink_2_io_async_ridx; 
  assign auto_in_w_safe_ridx_valid = AsyncQueueSink_2_io_async_safe_ridx_valid; 
  assign auto_in_w_safe_sink_reset_n = AsyncQueueSink_2_io_async_safe_sink_reset_n; 
  assign auto_in_b_mem_0_id = AsyncQueueSource_1_io_async_mem_0_id; 
  assign auto_in_b_mem_0_resp = AsyncQueueSource_1_io_async_mem_0_resp; 
  assign auto_in_b_mem_1_id = AsyncQueueSource_1_io_async_mem_1_id; 
  assign auto_in_b_mem_1_resp = AsyncQueueSource_1_io_async_mem_1_resp; 
  assign auto_in_b_mem_2_id = AsyncQueueSource_1_io_async_mem_2_id; 
  assign auto_in_b_mem_2_resp = AsyncQueueSource_1_io_async_mem_2_resp; 
  assign auto_in_b_mem_3_id = AsyncQueueSource_1_io_async_mem_3_id; 
  assign auto_in_b_mem_3_resp = AsyncQueueSource_1_io_async_mem_3_resp; 
  assign auto_in_b_mem_4_id = AsyncQueueSource_1_io_async_mem_4_id; 
  assign auto_in_b_mem_4_resp = AsyncQueueSource_1_io_async_mem_4_resp; 
  assign auto_in_b_mem_5_id = AsyncQueueSource_1_io_async_mem_5_id; 
  assign auto_in_b_mem_5_resp = AsyncQueueSource_1_io_async_mem_5_resp; 
  assign auto_in_b_mem_6_id = AsyncQueueSource_1_io_async_mem_6_id; 
  assign auto_in_b_mem_6_resp = AsyncQueueSource_1_io_async_mem_6_resp; 
  assign auto_in_b_mem_7_id = AsyncQueueSource_1_io_async_mem_7_id; 
  assign auto_in_b_mem_7_resp = AsyncQueueSource_1_io_async_mem_7_resp; 
  assign auto_in_b_widx = AsyncQueueSource_1_io_async_widx; 
  assign auto_in_b_safe_widx_valid = AsyncQueueSource_1_io_async_safe_widx_valid; 
  assign auto_in_b_safe_source_reset_n = AsyncQueueSource_1_io_async_safe_source_reset_n; 
  assign auto_in_ar_ridx = AsyncQueueSink_io_async_ridx; 
  assign auto_in_ar_safe_ridx_valid = AsyncQueueSink_io_async_safe_ridx_valid; 
  assign auto_in_ar_safe_sink_reset_n = AsyncQueueSink_io_async_safe_sink_reset_n; 
  assign auto_in_r_mem_0_id = AsyncQueueSource_io_async_mem_0_id; 
  assign auto_in_r_mem_0_data = AsyncQueueSource_io_async_mem_0_data; 
  assign auto_in_r_mem_0_resp = AsyncQueueSource_io_async_mem_0_resp; 
  assign auto_in_r_mem_0_last = AsyncQueueSource_io_async_mem_0_last; 
  assign auto_in_r_mem_1_id = AsyncQueueSource_io_async_mem_1_id; 
  assign auto_in_r_mem_1_data = AsyncQueueSource_io_async_mem_1_data; 
  assign auto_in_r_mem_1_resp = AsyncQueueSource_io_async_mem_1_resp; 
  assign auto_in_r_mem_1_last = AsyncQueueSource_io_async_mem_1_last; 
  assign auto_in_r_mem_2_id = AsyncQueueSource_io_async_mem_2_id; 
  assign auto_in_r_mem_2_data = AsyncQueueSource_io_async_mem_2_data; 
  assign auto_in_r_mem_2_resp = AsyncQueueSource_io_async_mem_2_resp; 
  assign auto_in_r_mem_2_last = AsyncQueueSource_io_async_mem_2_last; 
  assign auto_in_r_mem_3_id = AsyncQueueSource_io_async_mem_3_id; 
  assign auto_in_r_mem_3_data = AsyncQueueSource_io_async_mem_3_data; 
  assign auto_in_r_mem_3_resp = AsyncQueueSource_io_async_mem_3_resp; 
  assign auto_in_r_mem_3_last = AsyncQueueSource_io_async_mem_3_last; 
  assign auto_in_r_mem_4_id = AsyncQueueSource_io_async_mem_4_id; 
  assign auto_in_r_mem_4_data = AsyncQueueSource_io_async_mem_4_data; 
  assign auto_in_r_mem_4_resp = AsyncQueueSource_io_async_mem_4_resp; 
  assign auto_in_r_mem_4_last = AsyncQueueSource_io_async_mem_4_last; 
  assign auto_in_r_mem_5_id = AsyncQueueSource_io_async_mem_5_id; 
  assign auto_in_r_mem_5_data = AsyncQueueSource_io_async_mem_5_data; 
  assign auto_in_r_mem_5_resp = AsyncQueueSource_io_async_mem_5_resp; 
  assign auto_in_r_mem_5_last = AsyncQueueSource_io_async_mem_5_last; 
  assign auto_in_r_mem_6_id = AsyncQueueSource_io_async_mem_6_id; 
  assign auto_in_r_mem_6_data = AsyncQueueSource_io_async_mem_6_data; 
  assign auto_in_r_mem_6_resp = AsyncQueueSource_io_async_mem_6_resp; 
  assign auto_in_r_mem_6_last = AsyncQueueSource_io_async_mem_6_last; 
  assign auto_in_r_mem_7_id = AsyncQueueSource_io_async_mem_7_id; 
  assign auto_in_r_mem_7_data = AsyncQueueSource_io_async_mem_7_data; 
  assign auto_in_r_mem_7_resp = AsyncQueueSource_io_async_mem_7_resp; 
  assign auto_in_r_mem_7_last = AsyncQueueSource_io_async_mem_7_last; 
  assign auto_in_r_widx = AsyncQueueSource_io_async_widx; 
  assign auto_in_r_safe_widx_valid = AsyncQueueSource_io_async_safe_widx_valid; 
  assign auto_in_r_safe_source_reset_n = AsyncQueueSource_io_async_safe_source_reset_n; 
  assign auto_out_aw_valid = AsyncQueueSink_1_io_deq_valid; 
  assign auto_out_aw_bits_id = AsyncQueueSink_1_io_deq_bits_id; 
  assign auto_out_aw_bits_addr = AsyncQueueSink_1_io_deq_bits_addr; 
  assign auto_out_aw_bits_len = AsyncQueueSink_1_io_deq_bits_len; 
  assign auto_out_aw_bits_size = AsyncQueueSink_1_io_deq_bits_size; 
  assign auto_out_aw_bits_burst = AsyncQueueSink_1_io_deq_bits_burst; 
  assign auto_out_aw_bits_lock = AsyncQueueSink_1_io_deq_bits_lock; 
  assign auto_out_aw_bits_prot = AsyncQueueSink_1_io_deq_bits_prot; 
  assign auto_out_aw_bits_qos = AsyncQueueSink_1_io_deq_bits_qos; 
  assign auto_out_w_valid = AsyncQueueSink_2_io_deq_valid; 
  assign auto_out_w_bits_data = AsyncQueueSink_2_io_deq_bits_data; 
  assign auto_out_w_bits_strb = AsyncQueueSink_2_io_deq_bits_strb; 
  assign auto_out_w_bits_last = AsyncQueueSink_2_io_deq_bits_last; 
  assign auto_out_b_ready = AsyncQueueSource_1_io_enq_ready; 
  assign auto_out_ar_valid = AsyncQueueSink_io_deq_valid; 
  assign auto_out_ar_bits_id = AsyncQueueSink_io_deq_bits_id; 
  assign auto_out_ar_bits_addr = AsyncQueueSink_io_deq_bits_addr; 
  assign auto_out_ar_bits_len = AsyncQueueSink_io_deq_bits_len; 
  assign auto_out_ar_bits_size = AsyncQueueSink_io_deq_bits_size; 
  assign auto_out_ar_bits_burst = AsyncQueueSink_io_deq_bits_burst; 
  assign auto_out_ar_bits_lock = AsyncQueueSink_io_deq_bits_lock; 
  assign auto_out_ar_bits_prot = AsyncQueueSink_io_deq_bits_prot; 
  assign auto_out_ar_bits_qos = AsyncQueueSink_io_deq_bits_qos; 
  assign auto_out_r_ready = AsyncQueueSource_io_enq_ready; 
  assign AsyncQueueSink_clock = clock; 
  assign AsyncQueueSink_reset = reset; 
  assign AsyncQueueSink_io_deq_ready = auto_out_ar_ready; 
  assign AsyncQueueSink_io_async_mem_0_id = auto_in_ar_mem_0_id; 
  assign AsyncQueueSink_io_async_mem_0_addr = auto_in_ar_mem_0_addr; 
  assign AsyncQueueSink_io_async_mem_0_len = auto_in_ar_mem_0_len; 
  assign AsyncQueueSink_io_async_mem_0_size = auto_in_ar_mem_0_size; 
  assign AsyncQueueSink_io_async_mem_0_burst = auto_in_ar_mem_0_burst; 
  assign AsyncQueueSink_io_async_mem_0_lock = auto_in_ar_mem_0_lock; 
  assign AsyncQueueSink_io_async_mem_0_cache = auto_in_ar_mem_0_cache; 
  assign AsyncQueueSink_io_async_mem_0_prot = auto_in_ar_mem_0_prot; 
  assign AsyncQueueSink_io_async_mem_0_qos = auto_in_ar_mem_0_qos; 
  assign AsyncQueueSink_io_async_mem_1_id = auto_in_ar_mem_1_id; 
  assign AsyncQueueSink_io_async_mem_1_addr = auto_in_ar_mem_1_addr; 
  assign AsyncQueueSink_io_async_mem_1_len = auto_in_ar_mem_1_len; 
  assign AsyncQueueSink_io_async_mem_1_size = auto_in_ar_mem_1_size; 
  assign AsyncQueueSink_io_async_mem_1_burst = auto_in_ar_mem_1_burst; 
  assign AsyncQueueSink_io_async_mem_1_lock = auto_in_ar_mem_1_lock; 
  assign AsyncQueueSink_io_async_mem_1_cache = auto_in_ar_mem_1_cache; 
  assign AsyncQueueSink_io_async_mem_1_prot = auto_in_ar_mem_1_prot; 
  assign AsyncQueueSink_io_async_mem_1_qos = auto_in_ar_mem_1_qos; 
  assign AsyncQueueSink_io_async_mem_2_id = auto_in_ar_mem_2_id; 
  assign AsyncQueueSink_io_async_mem_2_addr = auto_in_ar_mem_2_addr; 
  assign AsyncQueueSink_io_async_mem_2_len = auto_in_ar_mem_2_len; 
  assign AsyncQueueSink_io_async_mem_2_size = auto_in_ar_mem_2_size; 
  assign AsyncQueueSink_io_async_mem_2_burst = auto_in_ar_mem_2_burst; 
  assign AsyncQueueSink_io_async_mem_2_lock = auto_in_ar_mem_2_lock; 
  assign AsyncQueueSink_io_async_mem_2_cache = auto_in_ar_mem_2_cache; 
  assign AsyncQueueSink_io_async_mem_2_prot = auto_in_ar_mem_2_prot; 
  assign AsyncQueueSink_io_async_mem_2_qos = auto_in_ar_mem_2_qos; 
  assign AsyncQueueSink_io_async_mem_3_id = auto_in_ar_mem_3_id; 
  assign AsyncQueueSink_io_async_mem_3_addr = auto_in_ar_mem_3_addr; 
  assign AsyncQueueSink_io_async_mem_3_len = auto_in_ar_mem_3_len; 
  assign AsyncQueueSink_io_async_mem_3_size = auto_in_ar_mem_3_size; 
  assign AsyncQueueSink_io_async_mem_3_burst = auto_in_ar_mem_3_burst; 
  assign AsyncQueueSink_io_async_mem_3_lock = auto_in_ar_mem_3_lock; 
  assign AsyncQueueSink_io_async_mem_3_cache = auto_in_ar_mem_3_cache; 
  assign AsyncQueueSink_io_async_mem_3_prot = auto_in_ar_mem_3_prot; 
  assign AsyncQueueSink_io_async_mem_3_qos = auto_in_ar_mem_3_qos; 
  assign AsyncQueueSink_io_async_mem_4_id = auto_in_ar_mem_4_id; 
  assign AsyncQueueSink_io_async_mem_4_addr = auto_in_ar_mem_4_addr; 
  assign AsyncQueueSink_io_async_mem_4_len = auto_in_ar_mem_4_len; 
  assign AsyncQueueSink_io_async_mem_4_size = auto_in_ar_mem_4_size; 
  assign AsyncQueueSink_io_async_mem_4_burst = auto_in_ar_mem_4_burst; 
  assign AsyncQueueSink_io_async_mem_4_lock = auto_in_ar_mem_4_lock; 
  assign AsyncQueueSink_io_async_mem_4_cache = auto_in_ar_mem_4_cache; 
  assign AsyncQueueSink_io_async_mem_4_prot = auto_in_ar_mem_4_prot; 
  assign AsyncQueueSink_io_async_mem_4_qos = auto_in_ar_mem_4_qos; 
  assign AsyncQueueSink_io_async_mem_5_id = auto_in_ar_mem_5_id; 
  assign AsyncQueueSink_io_async_mem_5_addr = auto_in_ar_mem_5_addr; 
  assign AsyncQueueSink_io_async_mem_5_len = auto_in_ar_mem_5_len; 
  assign AsyncQueueSink_io_async_mem_5_size = auto_in_ar_mem_5_size; 
  assign AsyncQueueSink_io_async_mem_5_burst = auto_in_ar_mem_5_burst; 
  assign AsyncQueueSink_io_async_mem_5_lock = auto_in_ar_mem_5_lock; 
  assign AsyncQueueSink_io_async_mem_5_cache = auto_in_ar_mem_5_cache; 
  assign AsyncQueueSink_io_async_mem_5_prot = auto_in_ar_mem_5_prot; 
  assign AsyncQueueSink_io_async_mem_5_qos = auto_in_ar_mem_5_qos; 
  assign AsyncQueueSink_io_async_mem_6_id = auto_in_ar_mem_6_id; 
  assign AsyncQueueSink_io_async_mem_6_addr = auto_in_ar_mem_6_addr; 
  assign AsyncQueueSink_io_async_mem_6_len = auto_in_ar_mem_6_len; 
  assign AsyncQueueSink_io_async_mem_6_size = auto_in_ar_mem_6_size; 
  assign AsyncQueueSink_io_async_mem_6_burst = auto_in_ar_mem_6_burst; 
  assign AsyncQueueSink_io_async_mem_6_lock = auto_in_ar_mem_6_lock; 
  assign AsyncQueueSink_io_async_mem_6_cache = auto_in_ar_mem_6_cache; 
  assign AsyncQueueSink_io_async_mem_6_prot = auto_in_ar_mem_6_prot; 
  assign AsyncQueueSink_io_async_mem_6_qos = auto_in_ar_mem_6_qos; 
  assign AsyncQueueSink_io_async_mem_7_id = auto_in_ar_mem_7_id; 
  assign AsyncQueueSink_io_async_mem_7_addr = auto_in_ar_mem_7_addr; 
  assign AsyncQueueSink_io_async_mem_7_len = auto_in_ar_mem_7_len; 
  assign AsyncQueueSink_io_async_mem_7_size = auto_in_ar_mem_7_size; 
  assign AsyncQueueSink_io_async_mem_7_burst = auto_in_ar_mem_7_burst; 
  assign AsyncQueueSink_io_async_mem_7_lock = auto_in_ar_mem_7_lock; 
  assign AsyncQueueSink_io_async_mem_7_cache = auto_in_ar_mem_7_cache; 
  assign AsyncQueueSink_io_async_mem_7_prot = auto_in_ar_mem_7_prot; 
  assign AsyncQueueSink_io_async_mem_7_qos = auto_in_ar_mem_7_qos; 
  assign AsyncQueueSink_io_async_widx = auto_in_ar_widx; 
  assign AsyncQueueSink_io_async_safe_widx_valid = auto_in_ar_safe_widx_valid; 
  assign AsyncQueueSink_io_async_safe_source_reset_n = auto_in_ar_safe_source_reset_n; 
  assign AsyncQueueSink_1_clock = clock; 
  assign AsyncQueueSink_1_reset = reset; 
  assign AsyncQueueSink_1_io_deq_ready = auto_out_aw_ready; 
  assign AsyncQueueSink_1_io_async_mem_0_id = auto_in_aw_mem_0_id; 
  assign AsyncQueueSink_1_io_async_mem_0_addr = auto_in_aw_mem_0_addr; 
  assign AsyncQueueSink_1_io_async_mem_0_len = auto_in_aw_mem_0_len; 
  assign AsyncQueueSink_1_io_async_mem_0_size = auto_in_aw_mem_0_size; 
  assign AsyncQueueSink_1_io_async_mem_0_burst = auto_in_aw_mem_0_burst; 
  assign AsyncQueueSink_1_io_async_mem_0_lock = auto_in_aw_mem_0_lock; 
  assign AsyncQueueSink_1_io_async_mem_0_cache = auto_in_aw_mem_0_cache; 
  assign AsyncQueueSink_1_io_async_mem_0_prot = auto_in_aw_mem_0_prot; 
  assign AsyncQueueSink_1_io_async_mem_0_qos = auto_in_aw_mem_0_qos; 
  assign AsyncQueueSink_1_io_async_mem_1_id = auto_in_aw_mem_1_id; 
  assign AsyncQueueSink_1_io_async_mem_1_addr = auto_in_aw_mem_1_addr; 
  assign AsyncQueueSink_1_io_async_mem_1_len = auto_in_aw_mem_1_len; 
  assign AsyncQueueSink_1_io_async_mem_1_size = auto_in_aw_mem_1_size; 
  assign AsyncQueueSink_1_io_async_mem_1_burst = auto_in_aw_mem_1_burst; 
  assign AsyncQueueSink_1_io_async_mem_1_lock = auto_in_aw_mem_1_lock; 
  assign AsyncQueueSink_1_io_async_mem_1_cache = auto_in_aw_mem_1_cache; 
  assign AsyncQueueSink_1_io_async_mem_1_prot = auto_in_aw_mem_1_prot; 
  assign AsyncQueueSink_1_io_async_mem_1_qos = auto_in_aw_mem_1_qos; 
  assign AsyncQueueSink_1_io_async_mem_2_id = auto_in_aw_mem_2_id; 
  assign AsyncQueueSink_1_io_async_mem_2_addr = auto_in_aw_mem_2_addr; 
  assign AsyncQueueSink_1_io_async_mem_2_len = auto_in_aw_mem_2_len; 
  assign AsyncQueueSink_1_io_async_mem_2_size = auto_in_aw_mem_2_size; 
  assign AsyncQueueSink_1_io_async_mem_2_burst = auto_in_aw_mem_2_burst; 
  assign AsyncQueueSink_1_io_async_mem_2_lock = auto_in_aw_mem_2_lock; 
  assign AsyncQueueSink_1_io_async_mem_2_cache = auto_in_aw_mem_2_cache; 
  assign AsyncQueueSink_1_io_async_mem_2_prot = auto_in_aw_mem_2_prot; 
  assign AsyncQueueSink_1_io_async_mem_2_qos = auto_in_aw_mem_2_qos; 
  assign AsyncQueueSink_1_io_async_mem_3_id = auto_in_aw_mem_3_id; 
  assign AsyncQueueSink_1_io_async_mem_3_addr = auto_in_aw_mem_3_addr; 
  assign AsyncQueueSink_1_io_async_mem_3_len = auto_in_aw_mem_3_len; 
  assign AsyncQueueSink_1_io_async_mem_3_size = auto_in_aw_mem_3_size; 
  assign AsyncQueueSink_1_io_async_mem_3_burst = auto_in_aw_mem_3_burst; 
  assign AsyncQueueSink_1_io_async_mem_3_lock = auto_in_aw_mem_3_lock; 
  assign AsyncQueueSink_1_io_async_mem_3_cache = auto_in_aw_mem_3_cache; 
  assign AsyncQueueSink_1_io_async_mem_3_prot = auto_in_aw_mem_3_prot; 
  assign AsyncQueueSink_1_io_async_mem_3_qos = auto_in_aw_mem_3_qos; 
  assign AsyncQueueSink_1_io_async_mem_4_id = auto_in_aw_mem_4_id; 
  assign AsyncQueueSink_1_io_async_mem_4_addr = auto_in_aw_mem_4_addr; 
  assign AsyncQueueSink_1_io_async_mem_4_len = auto_in_aw_mem_4_len; 
  assign AsyncQueueSink_1_io_async_mem_4_size = auto_in_aw_mem_4_size; 
  assign AsyncQueueSink_1_io_async_mem_4_burst = auto_in_aw_mem_4_burst; 
  assign AsyncQueueSink_1_io_async_mem_4_lock = auto_in_aw_mem_4_lock; 
  assign AsyncQueueSink_1_io_async_mem_4_cache = auto_in_aw_mem_4_cache; 
  assign AsyncQueueSink_1_io_async_mem_4_prot = auto_in_aw_mem_4_prot; 
  assign AsyncQueueSink_1_io_async_mem_4_qos = auto_in_aw_mem_4_qos; 
  assign AsyncQueueSink_1_io_async_mem_5_id = auto_in_aw_mem_5_id; 
  assign AsyncQueueSink_1_io_async_mem_5_addr = auto_in_aw_mem_5_addr; 
  assign AsyncQueueSink_1_io_async_mem_5_len = auto_in_aw_mem_5_len; 
  assign AsyncQueueSink_1_io_async_mem_5_size = auto_in_aw_mem_5_size; 
  assign AsyncQueueSink_1_io_async_mem_5_burst = auto_in_aw_mem_5_burst; 
  assign AsyncQueueSink_1_io_async_mem_5_lock = auto_in_aw_mem_5_lock; 
  assign AsyncQueueSink_1_io_async_mem_5_cache = auto_in_aw_mem_5_cache; 
  assign AsyncQueueSink_1_io_async_mem_5_prot = auto_in_aw_mem_5_prot; 
  assign AsyncQueueSink_1_io_async_mem_5_qos = auto_in_aw_mem_5_qos; 
  assign AsyncQueueSink_1_io_async_mem_6_id = auto_in_aw_mem_6_id; 
  assign AsyncQueueSink_1_io_async_mem_6_addr = auto_in_aw_mem_6_addr; 
  assign AsyncQueueSink_1_io_async_mem_6_len = auto_in_aw_mem_6_len; 
  assign AsyncQueueSink_1_io_async_mem_6_size = auto_in_aw_mem_6_size; 
  assign AsyncQueueSink_1_io_async_mem_6_burst = auto_in_aw_mem_6_burst; 
  assign AsyncQueueSink_1_io_async_mem_6_lock = auto_in_aw_mem_6_lock; 
  assign AsyncQueueSink_1_io_async_mem_6_cache = auto_in_aw_mem_6_cache; 
  assign AsyncQueueSink_1_io_async_mem_6_prot = auto_in_aw_mem_6_prot; 
  assign AsyncQueueSink_1_io_async_mem_6_qos = auto_in_aw_mem_6_qos; 
  assign AsyncQueueSink_1_io_async_mem_7_id = auto_in_aw_mem_7_id; 
  assign AsyncQueueSink_1_io_async_mem_7_addr = auto_in_aw_mem_7_addr; 
  assign AsyncQueueSink_1_io_async_mem_7_len = auto_in_aw_mem_7_len; 
  assign AsyncQueueSink_1_io_async_mem_7_size = auto_in_aw_mem_7_size; 
  assign AsyncQueueSink_1_io_async_mem_7_burst = auto_in_aw_mem_7_burst; 
  assign AsyncQueueSink_1_io_async_mem_7_lock = auto_in_aw_mem_7_lock; 
  assign AsyncQueueSink_1_io_async_mem_7_cache = auto_in_aw_mem_7_cache; 
  assign AsyncQueueSink_1_io_async_mem_7_prot = auto_in_aw_mem_7_prot; 
  assign AsyncQueueSink_1_io_async_mem_7_qos = auto_in_aw_mem_7_qos; 
  assign AsyncQueueSink_1_io_async_widx = auto_in_aw_widx; 
  assign AsyncQueueSink_1_io_async_safe_widx_valid = auto_in_aw_safe_widx_valid; 
  assign AsyncQueueSink_1_io_async_safe_source_reset_n = auto_in_aw_safe_source_reset_n; 
  assign AsyncQueueSink_2_clock = clock; 
  assign AsyncQueueSink_2_reset = reset; 
  assign AsyncQueueSink_2_io_deq_ready = auto_out_w_ready; 
  assign AsyncQueueSink_2_io_async_mem_0_data = auto_in_w_mem_0_data; 
  assign AsyncQueueSink_2_io_async_mem_0_strb = auto_in_w_mem_0_strb; 
  assign AsyncQueueSink_2_io_async_mem_0_last = auto_in_w_mem_0_last; 
  assign AsyncQueueSink_2_io_async_mem_1_data = auto_in_w_mem_1_data; 
  assign AsyncQueueSink_2_io_async_mem_1_strb = auto_in_w_mem_1_strb; 
  assign AsyncQueueSink_2_io_async_mem_1_last = auto_in_w_mem_1_last; 
  assign AsyncQueueSink_2_io_async_mem_2_data = auto_in_w_mem_2_data; 
  assign AsyncQueueSink_2_io_async_mem_2_strb = auto_in_w_mem_2_strb; 
  assign AsyncQueueSink_2_io_async_mem_2_last = auto_in_w_mem_2_last; 
  assign AsyncQueueSink_2_io_async_mem_3_data = auto_in_w_mem_3_data; 
  assign AsyncQueueSink_2_io_async_mem_3_strb = auto_in_w_mem_3_strb; 
  assign AsyncQueueSink_2_io_async_mem_3_last = auto_in_w_mem_3_last; 
  assign AsyncQueueSink_2_io_async_mem_4_data = auto_in_w_mem_4_data; 
  assign AsyncQueueSink_2_io_async_mem_4_strb = auto_in_w_mem_4_strb; 
  assign AsyncQueueSink_2_io_async_mem_4_last = auto_in_w_mem_4_last; 
  assign AsyncQueueSink_2_io_async_mem_5_data = auto_in_w_mem_5_data; 
  assign AsyncQueueSink_2_io_async_mem_5_strb = auto_in_w_mem_5_strb; 
  assign AsyncQueueSink_2_io_async_mem_5_last = auto_in_w_mem_5_last; 
  assign AsyncQueueSink_2_io_async_mem_6_data = auto_in_w_mem_6_data; 
  assign AsyncQueueSink_2_io_async_mem_6_strb = auto_in_w_mem_6_strb; 
  assign AsyncQueueSink_2_io_async_mem_6_last = auto_in_w_mem_6_last; 
  assign AsyncQueueSink_2_io_async_mem_7_data = auto_in_w_mem_7_data; 
  assign AsyncQueueSink_2_io_async_mem_7_strb = auto_in_w_mem_7_strb; 
  assign AsyncQueueSink_2_io_async_mem_7_last = auto_in_w_mem_7_last; 
  assign AsyncQueueSink_2_io_async_widx = auto_in_w_widx; 
  assign AsyncQueueSink_2_io_async_safe_widx_valid = auto_in_w_safe_widx_valid; 
  assign AsyncQueueSink_2_io_async_safe_source_reset_n = auto_in_w_safe_source_reset_n; 
  assign AsyncQueueSource_clock = clock; 
  assign AsyncQueueSource_reset = reset; 
  assign AsyncQueueSource_io_enq_valid = auto_out_r_valid; 
  assign AsyncQueueSource_io_enq_bits_id = auto_out_r_bits_id; 
  assign AsyncQueueSource_io_enq_bits_data = auto_out_r_bits_data; 
  assign AsyncQueueSource_io_enq_bits_resp = auto_out_r_bits_resp; 
  assign AsyncQueueSource_io_enq_bits_last = auto_out_r_bits_last; 
  assign AsyncQueueSource_io_async_ridx = auto_in_r_ridx; 
  assign AsyncQueueSource_io_async_safe_ridx_valid = auto_in_r_safe_ridx_valid; 
  assign AsyncQueueSource_io_async_safe_sink_reset_n = auto_in_r_safe_sink_reset_n; 
  assign AsyncQueueSource_1_clock = clock; 
  assign AsyncQueueSource_1_reset = reset; 
  assign AsyncQueueSource_1_io_enq_valid = auto_out_b_valid; 
  assign AsyncQueueSource_1_io_enq_bits_id = auto_out_b_bits_id; 
  assign AsyncQueueSource_1_io_enq_bits_resp = auto_out_b_bits_resp; 
  assign AsyncQueueSource_1_io_async_ridx = auto_in_b_ridx; 
  assign AsyncQueueSource_1_io_async_safe_ridx_valid = auto_in_b_safe_ridx_valid; 
  assign AsyncQueueSource_1_io_async_safe_sink_reset_n = auto_in_b_safe_sink_reset_n; 
endmodule
