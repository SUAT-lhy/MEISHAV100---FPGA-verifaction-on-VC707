module AXI4AsyncCrossingSource( 
  input         clock, 
  input         reset, 
  output        auto_in_aw_ready, 
  input         auto_in_aw_valid, 
  input  [3:0]  auto_in_aw_bits_id, 
  input  [31:0] auto_in_aw_bits_addr, 
  input  [7:0]  auto_in_aw_bits_len, 
  input  [2:0]  auto_in_aw_bits_size, 
  input  [1:0]  auto_in_aw_bits_burst, 
  input         auto_in_aw_bits_lock, 
  input  [3:0]  auto_in_aw_bits_cache, 
  input  [2:0]  auto_in_aw_bits_prot, 
  input  [3:0]  auto_in_aw_bits_qos, 
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
  input  [31:0] auto_in_ar_bits_addr, 
  input  [7:0]  auto_in_ar_bits_len, 
  input  [2:0]  auto_in_ar_bits_size, 
  input  [1:0]  auto_in_ar_bits_burst, 
  input         auto_in_ar_bits_lock, 
  input  [3:0]  auto_in_ar_bits_cache, 
  input  [2:0]  auto_in_ar_bits_prot, 
  input  [3:0]  auto_in_ar_bits_qos, 
  input         auto_in_r_ready, 
  output        auto_in_r_valid, 
  output [3:0]  auto_in_r_bits_id, 
  output [63:0] auto_in_r_bits_data, 
  output [1:0]  auto_in_r_bits_resp, 
  output        auto_in_r_bits_last, 
  output [3:0]  auto_out_aw_mem_0_id, 
  output [31:0] auto_out_aw_mem_0_addr, 
  output [7:0]  auto_out_aw_mem_0_len, 
  output [2:0]  auto_out_aw_mem_0_size, 
  output [1:0]  auto_out_aw_mem_0_burst, 
  output        auto_out_aw_mem_0_lock, 
  output [3:0]  auto_out_aw_mem_0_cache, 
  output [2:0]  auto_out_aw_mem_0_prot, 
  output [3:0]  auto_out_aw_mem_0_qos, 
  output [3:0]  auto_out_aw_mem_1_id, 
  output [31:0] auto_out_aw_mem_1_addr, 
  output [7:0]  auto_out_aw_mem_1_len, 
  output [2:0]  auto_out_aw_mem_1_size, 
  output [1:0]  auto_out_aw_mem_1_burst, 
  output        auto_out_aw_mem_1_lock, 
  output [3:0]  auto_out_aw_mem_1_cache, 
  output [2:0]  auto_out_aw_mem_1_prot, 
  output [3:0]  auto_out_aw_mem_1_qos, 
  output [3:0]  auto_out_aw_mem_2_id, 
  output [31:0] auto_out_aw_mem_2_addr, 
  output [7:0]  auto_out_aw_mem_2_len, 
  output [2:0]  auto_out_aw_mem_2_size, 
  output [1:0]  auto_out_aw_mem_2_burst, 
  output        auto_out_aw_mem_2_lock, 
  output [3:0]  auto_out_aw_mem_2_cache, 
  output [2:0]  auto_out_aw_mem_2_prot, 
  output [3:0]  auto_out_aw_mem_2_qos, 
  output [3:0]  auto_out_aw_mem_3_id, 
  output [31:0] auto_out_aw_mem_3_addr, 
  output [7:0]  auto_out_aw_mem_3_len, 
  output [2:0]  auto_out_aw_mem_3_size, 
  output [1:0]  auto_out_aw_mem_3_burst, 
  output        auto_out_aw_mem_3_lock, 
  output [3:0]  auto_out_aw_mem_3_cache, 
  output [2:0]  auto_out_aw_mem_3_prot, 
  output [3:0]  auto_out_aw_mem_3_qos, 
  output [3:0]  auto_out_aw_mem_4_id, 
  output [31:0] auto_out_aw_mem_4_addr, 
  output [7:0]  auto_out_aw_mem_4_len, 
  output [2:0]  auto_out_aw_mem_4_size, 
  output [1:0]  auto_out_aw_mem_4_burst, 
  output        auto_out_aw_mem_4_lock, 
  output [3:0]  auto_out_aw_mem_4_cache, 
  output [2:0]  auto_out_aw_mem_4_prot, 
  output [3:0]  auto_out_aw_mem_4_qos, 
  output [3:0]  auto_out_aw_mem_5_id, 
  output [31:0] auto_out_aw_mem_5_addr, 
  output [7:0]  auto_out_aw_mem_5_len, 
  output [2:0]  auto_out_aw_mem_5_size, 
  output [1:0]  auto_out_aw_mem_5_burst, 
  output        auto_out_aw_mem_5_lock, 
  output [3:0]  auto_out_aw_mem_5_cache, 
  output [2:0]  auto_out_aw_mem_5_prot, 
  output [3:0]  auto_out_aw_mem_5_qos, 
  output [3:0]  auto_out_aw_mem_6_id, 
  output [31:0] auto_out_aw_mem_6_addr, 
  output [7:0]  auto_out_aw_mem_6_len, 
  output [2:0]  auto_out_aw_mem_6_size, 
  output [1:0]  auto_out_aw_mem_6_burst, 
  output        auto_out_aw_mem_6_lock, 
  output [3:0]  auto_out_aw_mem_6_cache, 
  output [2:0]  auto_out_aw_mem_6_prot, 
  output [3:0]  auto_out_aw_mem_6_qos, 
  output [3:0]  auto_out_aw_mem_7_id, 
  output [31:0] auto_out_aw_mem_7_addr, 
  output [7:0]  auto_out_aw_mem_7_len, 
  output [2:0]  auto_out_aw_mem_7_size, 
  output [1:0]  auto_out_aw_mem_7_burst, 
  output        auto_out_aw_mem_7_lock, 
  output [3:0]  auto_out_aw_mem_7_cache, 
  output [2:0]  auto_out_aw_mem_7_prot, 
  output [3:0]  auto_out_aw_mem_7_qos, 
  input  [3:0]  auto_out_aw_ridx, 
  output [3:0]  auto_out_aw_widx, 
  input         auto_out_aw_safe_ridx_valid, 
  output        auto_out_aw_safe_widx_valid, 
  output        auto_out_aw_safe_source_reset_n, 
  input         auto_out_aw_safe_sink_reset_n, 
  output [63:0] auto_out_w_mem_0_data, 
  output [7:0]  auto_out_w_mem_0_strb, 
  output        auto_out_w_mem_0_last, 
  output [63:0] auto_out_w_mem_1_data, 
  output [7:0]  auto_out_w_mem_1_strb, 
  output        auto_out_w_mem_1_last, 
  output [63:0] auto_out_w_mem_2_data, 
  output [7:0]  auto_out_w_mem_2_strb, 
  output        auto_out_w_mem_2_last, 
  output [63:0] auto_out_w_mem_3_data, 
  output [7:0]  auto_out_w_mem_3_strb, 
  output        auto_out_w_mem_3_last, 
  output [63:0] auto_out_w_mem_4_data, 
  output [7:0]  auto_out_w_mem_4_strb, 
  output        auto_out_w_mem_4_last, 
  output [63:0] auto_out_w_mem_5_data, 
  output [7:0]  auto_out_w_mem_5_strb, 
  output        auto_out_w_mem_5_last, 
  output [63:0] auto_out_w_mem_6_data, 
  output [7:0]  auto_out_w_mem_6_strb, 
  output        auto_out_w_mem_6_last, 
  output [63:0] auto_out_w_mem_7_data, 
  output [7:0]  auto_out_w_mem_7_strb, 
  output        auto_out_w_mem_7_last, 
  input  [3:0]  auto_out_w_ridx, 
  output [3:0]  auto_out_w_widx, 
  input         auto_out_w_safe_ridx_valid, 
  output        auto_out_w_safe_widx_valid, 
  output        auto_out_w_safe_source_reset_n, 
  input         auto_out_w_safe_sink_reset_n, 
  input  [3:0]  auto_out_b_mem_0_id, 
  input  [1:0]  auto_out_b_mem_0_resp, 
  input  [3:0]  auto_out_b_mem_1_id, 
  input  [1:0]  auto_out_b_mem_1_resp, 
  input  [3:0]  auto_out_b_mem_2_id, 
  input  [1:0]  auto_out_b_mem_2_resp, 
  input  [3:0]  auto_out_b_mem_3_id, 
  input  [1:0]  auto_out_b_mem_3_resp, 
  input  [3:0]  auto_out_b_mem_4_id, 
  input  [1:0]  auto_out_b_mem_4_resp, 
  input  [3:0]  auto_out_b_mem_5_id, 
  input  [1:0]  auto_out_b_mem_5_resp, 
  input  [3:0]  auto_out_b_mem_6_id, 
  input  [1:0]  auto_out_b_mem_6_resp, 
  input  [3:0]  auto_out_b_mem_7_id, 
  input  [1:0]  auto_out_b_mem_7_resp, 
  output [3:0]  auto_out_b_ridx, 
  input  [3:0]  auto_out_b_widx, 
  output        auto_out_b_safe_ridx_valid, 
  input         auto_out_b_safe_widx_valid, 
  input         auto_out_b_safe_source_reset_n, 
  output        auto_out_b_safe_sink_reset_n, 
  output [3:0]  auto_out_ar_mem_0_id, 
  output [31:0] auto_out_ar_mem_0_addr, 
  output [7:0]  auto_out_ar_mem_0_len, 
  output [2:0]  auto_out_ar_mem_0_size, 
  output [1:0]  auto_out_ar_mem_0_burst, 
  output        auto_out_ar_mem_0_lock, 
  output [3:0]  auto_out_ar_mem_0_cache, 
  output [2:0]  auto_out_ar_mem_0_prot, 
  output [3:0]  auto_out_ar_mem_0_qos, 
  output [3:0]  auto_out_ar_mem_1_id, 
  output [31:0] auto_out_ar_mem_1_addr, 
  output [7:0]  auto_out_ar_mem_1_len, 
  output [2:0]  auto_out_ar_mem_1_size, 
  output [1:0]  auto_out_ar_mem_1_burst, 
  output        auto_out_ar_mem_1_lock, 
  output [3:0]  auto_out_ar_mem_1_cache, 
  output [2:0]  auto_out_ar_mem_1_prot, 
  output [3:0]  auto_out_ar_mem_1_qos, 
  output [3:0]  auto_out_ar_mem_2_id, 
  output [31:0] auto_out_ar_mem_2_addr, 
  output [7:0]  auto_out_ar_mem_2_len, 
  output [2:0]  auto_out_ar_mem_2_size, 
  output [1:0]  auto_out_ar_mem_2_burst, 
  output        auto_out_ar_mem_2_lock, 
  output [3:0]  auto_out_ar_mem_2_cache, 
  output [2:0]  auto_out_ar_mem_2_prot, 
  output [3:0]  auto_out_ar_mem_2_qos, 
  output [3:0]  auto_out_ar_mem_3_id, 
  output [31:0] auto_out_ar_mem_3_addr, 
  output [7:0]  auto_out_ar_mem_3_len, 
  output [2:0]  auto_out_ar_mem_3_size, 
  output [1:0]  auto_out_ar_mem_3_burst, 
  output        auto_out_ar_mem_3_lock, 
  output [3:0]  auto_out_ar_mem_3_cache, 
  output [2:0]  auto_out_ar_mem_3_prot, 
  output [3:0]  auto_out_ar_mem_3_qos, 
  output [3:0]  auto_out_ar_mem_4_id, 
  output [31:0] auto_out_ar_mem_4_addr, 
  output [7:0]  auto_out_ar_mem_4_len, 
  output [2:0]  auto_out_ar_mem_4_size, 
  output [1:0]  auto_out_ar_mem_4_burst, 
  output        auto_out_ar_mem_4_lock, 
  output [3:0]  auto_out_ar_mem_4_cache, 
  output [2:0]  auto_out_ar_mem_4_prot, 
  output [3:0]  auto_out_ar_mem_4_qos, 
  output [3:0]  auto_out_ar_mem_5_id, 
  output [31:0] auto_out_ar_mem_5_addr, 
  output [7:0]  auto_out_ar_mem_5_len, 
  output [2:0]  auto_out_ar_mem_5_size, 
  output [1:0]  auto_out_ar_mem_5_burst, 
  output        auto_out_ar_mem_5_lock, 
  output [3:0]  auto_out_ar_mem_5_cache, 
  output [2:0]  auto_out_ar_mem_5_prot, 
  output [3:0]  auto_out_ar_mem_5_qos, 
  output [3:0]  auto_out_ar_mem_6_id, 
  output [31:0] auto_out_ar_mem_6_addr, 
  output [7:0]  auto_out_ar_mem_6_len, 
  output [2:0]  auto_out_ar_mem_6_size, 
  output [1:0]  auto_out_ar_mem_6_burst, 
  output        auto_out_ar_mem_6_lock, 
  output [3:0]  auto_out_ar_mem_6_cache, 
  output [2:0]  auto_out_ar_mem_6_prot, 
  output [3:0]  auto_out_ar_mem_6_qos, 
  output [3:0]  auto_out_ar_mem_7_id, 
  output [31:0] auto_out_ar_mem_7_addr, 
  output [7:0]  auto_out_ar_mem_7_len, 
  output [2:0]  auto_out_ar_mem_7_size, 
  output [1:0]  auto_out_ar_mem_7_burst, 
  output        auto_out_ar_mem_7_lock, 
  output [3:0]  auto_out_ar_mem_7_cache, 
  output [2:0]  auto_out_ar_mem_7_prot, 
  output [3:0]  auto_out_ar_mem_7_qos, 
  input  [3:0]  auto_out_ar_ridx, 
  output [3:0]  auto_out_ar_widx, 
  input         auto_out_ar_safe_ridx_valid, 
  output        auto_out_ar_safe_widx_valid, 
  output        auto_out_ar_safe_source_reset_n, 
  input         auto_out_ar_safe_sink_reset_n, 
  input  [3:0]  auto_out_r_mem_0_id, 
  input  [63:0] auto_out_r_mem_0_data, 
  input  [1:0]  auto_out_r_mem_0_resp, 
  input         auto_out_r_mem_0_last, 
  input  [3:0]  auto_out_r_mem_1_id, 
  input  [63:0] auto_out_r_mem_1_data, 
  input  [1:0]  auto_out_r_mem_1_resp, 
  input         auto_out_r_mem_1_last, 
  input  [3:0]  auto_out_r_mem_2_id, 
  input  [63:0] auto_out_r_mem_2_data, 
  input  [1:0]  auto_out_r_mem_2_resp, 
  input         auto_out_r_mem_2_last, 
  input  [3:0]  auto_out_r_mem_3_id, 
  input  [63:0] auto_out_r_mem_3_data, 
  input  [1:0]  auto_out_r_mem_3_resp, 
  input         auto_out_r_mem_3_last, 
  input  [3:0]  auto_out_r_mem_4_id, 
  input  [63:0] auto_out_r_mem_4_data, 
  input  [1:0]  auto_out_r_mem_4_resp, 
  input         auto_out_r_mem_4_last, 
  input  [3:0]  auto_out_r_mem_5_id, 
  input  [63:0] auto_out_r_mem_5_data, 
  input  [1:0]  auto_out_r_mem_5_resp, 
  input         auto_out_r_mem_5_last, 
  input  [3:0]  auto_out_r_mem_6_id, 
  input  [63:0] auto_out_r_mem_6_data, 
  input  [1:0]  auto_out_r_mem_6_resp, 
  input         auto_out_r_mem_6_last, 
  input  [3:0]  auto_out_r_mem_7_id, 
  input  [63:0] auto_out_r_mem_7_data, 
  input  [1:0]  auto_out_r_mem_7_resp, 
  input         auto_out_r_mem_7_last, 
  output [3:0]  auto_out_r_ridx, 
  input  [3:0]  auto_out_r_widx, 
  output        auto_out_r_safe_ridx_valid, 
  input         auto_out_r_safe_widx_valid, 
  input         auto_out_r_safe_source_reset_n, 
  output        auto_out_r_safe_sink_reset_n 
);
  wire  AsyncQueueSource_clock; 
  wire  AsyncQueueSource_reset; 
  wire  AsyncQueueSource_io_enq_ready; 
  wire  AsyncQueueSource_io_enq_valid; 
  wire [3:0] AsyncQueueSource_io_enq_bits_id; 
  wire [31:0] AsyncQueueSource_io_enq_bits_addr; 
  wire [7:0] AsyncQueueSource_io_enq_bits_len; 
  wire [2:0] AsyncQueueSource_io_enq_bits_size; 
  wire [1:0] AsyncQueueSource_io_enq_bits_burst; 
  wire  AsyncQueueSource_io_enq_bits_lock; 
  wire [3:0] AsyncQueueSource_io_enq_bits_cache; 
  wire [2:0] AsyncQueueSource_io_enq_bits_prot; 
  wire [3:0] AsyncQueueSource_io_enq_bits_qos; 
  wire [3:0] AsyncQueueSource_io_async_mem_0_id; 
  wire [31:0] AsyncQueueSource_io_async_mem_0_addr; 
  wire [7:0] AsyncQueueSource_io_async_mem_0_len; 
  wire [2:0] AsyncQueueSource_io_async_mem_0_size; 
  wire [1:0] AsyncQueueSource_io_async_mem_0_burst; 
  wire  AsyncQueueSource_io_async_mem_0_lock; 
  wire [3:0] AsyncQueueSource_io_async_mem_0_cache; 
  wire [2:0] AsyncQueueSource_io_async_mem_0_prot; 
  wire [3:0] AsyncQueueSource_io_async_mem_0_qos; 
  wire [3:0] AsyncQueueSource_io_async_mem_1_id; 
  wire [31:0] AsyncQueueSource_io_async_mem_1_addr; 
  wire [7:0] AsyncQueueSource_io_async_mem_1_len; 
  wire [2:0] AsyncQueueSource_io_async_mem_1_size; 
  wire [1:0] AsyncQueueSource_io_async_mem_1_burst; 
  wire  AsyncQueueSource_io_async_mem_1_lock; 
  wire [3:0] AsyncQueueSource_io_async_mem_1_cache; 
  wire [2:0] AsyncQueueSource_io_async_mem_1_prot; 
  wire [3:0] AsyncQueueSource_io_async_mem_1_qos; 
  wire [3:0] AsyncQueueSource_io_async_mem_2_id; 
  wire [31:0] AsyncQueueSource_io_async_mem_2_addr; 
  wire [7:0] AsyncQueueSource_io_async_mem_2_len; 
  wire [2:0] AsyncQueueSource_io_async_mem_2_size; 
  wire [1:0] AsyncQueueSource_io_async_mem_2_burst; 
  wire  AsyncQueueSource_io_async_mem_2_lock; 
  wire [3:0] AsyncQueueSource_io_async_mem_2_cache; 
  wire [2:0] AsyncQueueSource_io_async_mem_2_prot; 
  wire [3:0] AsyncQueueSource_io_async_mem_2_qos; 
  wire [3:0] AsyncQueueSource_io_async_mem_3_id; 
  wire [31:0] AsyncQueueSource_io_async_mem_3_addr; 
  wire [7:0] AsyncQueueSource_io_async_mem_3_len; 
  wire [2:0] AsyncQueueSource_io_async_mem_3_size; 
  wire [1:0] AsyncQueueSource_io_async_mem_3_burst; 
  wire  AsyncQueueSource_io_async_mem_3_lock; 
  wire [3:0] AsyncQueueSource_io_async_mem_3_cache; 
  wire [2:0] AsyncQueueSource_io_async_mem_3_prot; 
  wire [3:0] AsyncQueueSource_io_async_mem_3_qos; 
  wire [3:0] AsyncQueueSource_io_async_mem_4_id; 
  wire [31:0] AsyncQueueSource_io_async_mem_4_addr; 
  wire [7:0] AsyncQueueSource_io_async_mem_4_len; 
  wire [2:0] AsyncQueueSource_io_async_mem_4_size; 
  wire [1:0] AsyncQueueSource_io_async_mem_4_burst; 
  wire  AsyncQueueSource_io_async_mem_4_lock; 
  wire [3:0] AsyncQueueSource_io_async_mem_4_cache; 
  wire [2:0] AsyncQueueSource_io_async_mem_4_prot; 
  wire [3:0] AsyncQueueSource_io_async_mem_4_qos; 
  wire [3:0] AsyncQueueSource_io_async_mem_5_id; 
  wire [31:0] AsyncQueueSource_io_async_mem_5_addr; 
  wire [7:0] AsyncQueueSource_io_async_mem_5_len; 
  wire [2:0] AsyncQueueSource_io_async_mem_5_size; 
  wire [1:0] AsyncQueueSource_io_async_mem_5_burst; 
  wire  AsyncQueueSource_io_async_mem_5_lock; 
  wire [3:0] AsyncQueueSource_io_async_mem_5_cache; 
  wire [2:0] AsyncQueueSource_io_async_mem_5_prot; 
  wire [3:0] AsyncQueueSource_io_async_mem_5_qos; 
  wire [3:0] AsyncQueueSource_io_async_mem_6_id; 
  wire [31:0] AsyncQueueSource_io_async_mem_6_addr; 
  wire [7:0] AsyncQueueSource_io_async_mem_6_len; 
  wire [2:0] AsyncQueueSource_io_async_mem_6_size; 
  wire [1:0] AsyncQueueSource_io_async_mem_6_burst; 
  wire  AsyncQueueSource_io_async_mem_6_lock; 
  wire [3:0] AsyncQueueSource_io_async_mem_6_cache; 
  wire [2:0] AsyncQueueSource_io_async_mem_6_prot; 
  wire [3:0] AsyncQueueSource_io_async_mem_6_qos; 
  wire [3:0] AsyncQueueSource_io_async_mem_7_id; 
  wire [31:0] AsyncQueueSource_io_async_mem_7_addr; 
  wire [7:0] AsyncQueueSource_io_async_mem_7_len; 
  wire [2:0] AsyncQueueSource_io_async_mem_7_size; 
  wire [1:0] AsyncQueueSource_io_async_mem_7_burst; 
  wire  AsyncQueueSource_io_async_mem_7_lock; 
  wire [3:0] AsyncQueueSource_io_async_mem_7_cache; 
  wire [2:0] AsyncQueueSource_io_async_mem_7_prot; 
  wire [3:0] AsyncQueueSource_io_async_mem_7_qos; 
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
  wire [31:0] AsyncQueueSource_1_io_enq_bits_addr; 
  wire [7:0] AsyncQueueSource_1_io_enq_bits_len; 
  wire [2:0] AsyncQueueSource_1_io_enq_bits_size; 
  wire [1:0] AsyncQueueSource_1_io_enq_bits_burst; 
  wire  AsyncQueueSource_1_io_enq_bits_lock; 
  wire [3:0] AsyncQueueSource_1_io_enq_bits_cache; 
  wire [2:0] AsyncQueueSource_1_io_enq_bits_prot; 
  wire [3:0] AsyncQueueSource_1_io_enq_bits_qos; 
  wire [3:0] AsyncQueueSource_1_io_async_mem_0_id; 
  wire [31:0] AsyncQueueSource_1_io_async_mem_0_addr; 
  wire [7:0] AsyncQueueSource_1_io_async_mem_0_len; 
  wire [2:0] AsyncQueueSource_1_io_async_mem_0_size; 
  wire [1:0] AsyncQueueSource_1_io_async_mem_0_burst; 
  wire  AsyncQueueSource_1_io_async_mem_0_lock; 
  wire [3:0] AsyncQueueSource_1_io_async_mem_0_cache; 
  wire [2:0] AsyncQueueSource_1_io_async_mem_0_prot; 
  wire [3:0] AsyncQueueSource_1_io_async_mem_0_qos; 
  wire [3:0] AsyncQueueSource_1_io_async_mem_1_id; 
  wire [31:0] AsyncQueueSource_1_io_async_mem_1_addr; 
  wire [7:0] AsyncQueueSource_1_io_async_mem_1_len; 
  wire [2:0] AsyncQueueSource_1_io_async_mem_1_size; 
  wire [1:0] AsyncQueueSource_1_io_async_mem_1_burst; 
  wire  AsyncQueueSource_1_io_async_mem_1_lock; 
  wire [3:0] AsyncQueueSource_1_io_async_mem_1_cache; 
  wire [2:0] AsyncQueueSource_1_io_async_mem_1_prot; 
  wire [3:0] AsyncQueueSource_1_io_async_mem_1_qos; 
  wire [3:0] AsyncQueueSource_1_io_async_mem_2_id; 
  wire [31:0] AsyncQueueSource_1_io_async_mem_2_addr; 
  wire [7:0] AsyncQueueSource_1_io_async_mem_2_len; 
  wire [2:0] AsyncQueueSource_1_io_async_mem_2_size; 
  wire [1:0] AsyncQueueSource_1_io_async_mem_2_burst; 
  wire  AsyncQueueSource_1_io_async_mem_2_lock; 
  wire [3:0] AsyncQueueSource_1_io_async_mem_2_cache; 
  wire [2:0] AsyncQueueSource_1_io_async_mem_2_prot; 
  wire [3:0] AsyncQueueSource_1_io_async_mem_2_qos; 
  wire [3:0] AsyncQueueSource_1_io_async_mem_3_id; 
  wire [31:0] AsyncQueueSource_1_io_async_mem_3_addr; 
  wire [7:0] AsyncQueueSource_1_io_async_mem_3_len; 
  wire [2:0] AsyncQueueSource_1_io_async_mem_3_size; 
  wire [1:0] AsyncQueueSource_1_io_async_mem_3_burst; 
  wire  AsyncQueueSource_1_io_async_mem_3_lock; 
  wire [3:0] AsyncQueueSource_1_io_async_mem_3_cache; 
  wire [2:0] AsyncQueueSource_1_io_async_mem_3_prot; 
  wire [3:0] AsyncQueueSource_1_io_async_mem_3_qos; 
  wire [3:0] AsyncQueueSource_1_io_async_mem_4_id; 
  wire [31:0] AsyncQueueSource_1_io_async_mem_4_addr; 
  wire [7:0] AsyncQueueSource_1_io_async_mem_4_len; 
  wire [2:0] AsyncQueueSource_1_io_async_mem_4_size; 
  wire [1:0] AsyncQueueSource_1_io_async_mem_4_burst; 
  wire  AsyncQueueSource_1_io_async_mem_4_lock; 
  wire [3:0] AsyncQueueSource_1_io_async_mem_4_cache; 
  wire [2:0] AsyncQueueSource_1_io_async_mem_4_prot; 
  wire [3:0] AsyncQueueSource_1_io_async_mem_4_qos; 
  wire [3:0] AsyncQueueSource_1_io_async_mem_5_id; 
  wire [31:0] AsyncQueueSource_1_io_async_mem_5_addr; 
  wire [7:0] AsyncQueueSource_1_io_async_mem_5_len; 
  wire [2:0] AsyncQueueSource_1_io_async_mem_5_size; 
  wire [1:0] AsyncQueueSource_1_io_async_mem_5_burst; 
  wire  AsyncQueueSource_1_io_async_mem_5_lock; 
  wire [3:0] AsyncQueueSource_1_io_async_mem_5_cache; 
  wire [2:0] AsyncQueueSource_1_io_async_mem_5_prot; 
  wire [3:0] AsyncQueueSource_1_io_async_mem_5_qos; 
  wire [3:0] AsyncQueueSource_1_io_async_mem_6_id; 
  wire [31:0] AsyncQueueSource_1_io_async_mem_6_addr; 
  wire [7:0] AsyncQueueSource_1_io_async_mem_6_len; 
  wire [2:0] AsyncQueueSource_1_io_async_mem_6_size; 
  wire [1:0] AsyncQueueSource_1_io_async_mem_6_burst; 
  wire  AsyncQueueSource_1_io_async_mem_6_lock; 
  wire [3:0] AsyncQueueSource_1_io_async_mem_6_cache; 
  wire [2:0] AsyncQueueSource_1_io_async_mem_6_prot; 
  wire [3:0] AsyncQueueSource_1_io_async_mem_6_qos; 
  wire [3:0] AsyncQueueSource_1_io_async_mem_7_id; 
  wire [31:0] AsyncQueueSource_1_io_async_mem_7_addr; 
  wire [7:0] AsyncQueueSource_1_io_async_mem_7_len; 
  wire [2:0] AsyncQueueSource_1_io_async_mem_7_size; 
  wire [1:0] AsyncQueueSource_1_io_async_mem_7_burst; 
  wire  AsyncQueueSource_1_io_async_mem_7_lock; 
  wire [3:0] AsyncQueueSource_1_io_async_mem_7_cache; 
  wire [2:0] AsyncQueueSource_1_io_async_mem_7_prot; 
  wire [3:0] AsyncQueueSource_1_io_async_mem_7_qos; 
  wire [3:0] AsyncQueueSource_1_io_async_ridx; 
  wire [3:0] AsyncQueueSource_1_io_async_widx; 
  wire  AsyncQueueSource_1_io_async_safe_ridx_valid; 
  wire  AsyncQueueSource_1_io_async_safe_widx_valid; 
  wire  AsyncQueueSource_1_io_async_safe_source_reset_n; 
  wire  AsyncQueueSource_1_io_async_safe_sink_reset_n; 
  wire  AsyncQueueSource_2_clock; 
  wire  AsyncQueueSource_2_reset; 
  wire  AsyncQueueSource_2_io_enq_ready; 
  wire  AsyncQueueSource_2_io_enq_valid; 
  wire [63:0] AsyncQueueSource_2_io_enq_bits_data; 
  wire [7:0] AsyncQueueSource_2_io_enq_bits_strb; 
  wire  AsyncQueueSource_2_io_enq_bits_last; 
  wire [63:0] AsyncQueueSource_2_io_async_mem_0_data; 
  wire [7:0] AsyncQueueSource_2_io_async_mem_0_strb; 
  wire  AsyncQueueSource_2_io_async_mem_0_last; 
  wire [63:0] AsyncQueueSource_2_io_async_mem_1_data; 
  wire [7:0] AsyncQueueSource_2_io_async_mem_1_strb; 
  wire  AsyncQueueSource_2_io_async_mem_1_last; 
  wire [63:0] AsyncQueueSource_2_io_async_mem_2_data; 
  wire [7:0] AsyncQueueSource_2_io_async_mem_2_strb; 
  wire  AsyncQueueSource_2_io_async_mem_2_last; 
  wire [63:0] AsyncQueueSource_2_io_async_mem_3_data; 
  wire [7:0] AsyncQueueSource_2_io_async_mem_3_strb; 
  wire  AsyncQueueSource_2_io_async_mem_3_last; 
  wire [63:0] AsyncQueueSource_2_io_async_mem_4_data; 
  wire [7:0] AsyncQueueSource_2_io_async_mem_4_strb; 
  wire  AsyncQueueSource_2_io_async_mem_4_last; 
  wire [63:0] AsyncQueueSource_2_io_async_mem_5_data; 
  wire [7:0] AsyncQueueSource_2_io_async_mem_5_strb; 
  wire  AsyncQueueSource_2_io_async_mem_5_last; 
  wire [63:0] AsyncQueueSource_2_io_async_mem_6_data; 
  wire [7:0] AsyncQueueSource_2_io_async_mem_6_strb; 
  wire  AsyncQueueSource_2_io_async_mem_6_last; 
  wire [63:0] AsyncQueueSource_2_io_async_mem_7_data; 
  wire [7:0] AsyncQueueSource_2_io_async_mem_7_strb; 
  wire  AsyncQueueSource_2_io_async_mem_7_last; 
  wire [3:0] AsyncQueueSource_2_io_async_ridx; 
  wire [3:0] AsyncQueueSource_2_io_async_widx; 
  wire  AsyncQueueSource_2_io_async_safe_ridx_valid; 
  wire  AsyncQueueSource_2_io_async_safe_widx_valid; 
  wire  AsyncQueueSource_2_io_async_safe_source_reset_n; 
  wire  AsyncQueueSource_2_io_async_safe_sink_reset_n; 
  wire  AsyncQueueSink_clock; 
  wire  AsyncQueueSink_reset; 
  wire  AsyncQueueSink_io_deq_ready; 
  wire  AsyncQueueSink_io_deq_valid; 
  wire [3:0] AsyncQueueSink_io_deq_bits_id; 
  wire [63:0] AsyncQueueSink_io_deq_bits_data; 
  wire [1:0] AsyncQueueSink_io_deq_bits_resp; 
  wire  AsyncQueueSink_io_deq_bits_last; 
  wire [3:0] AsyncQueueSink_io_async_mem_0_id; 
  wire [63:0] AsyncQueueSink_io_async_mem_0_data; 
  wire [1:0] AsyncQueueSink_io_async_mem_0_resp; 
  wire  AsyncQueueSink_io_async_mem_0_last; 
  wire [3:0] AsyncQueueSink_io_async_mem_1_id; 
  wire [63:0] AsyncQueueSink_io_async_mem_1_data; 
  wire [1:0] AsyncQueueSink_io_async_mem_1_resp; 
  wire  AsyncQueueSink_io_async_mem_1_last; 
  wire [3:0] AsyncQueueSink_io_async_mem_2_id; 
  wire [63:0] AsyncQueueSink_io_async_mem_2_data; 
  wire [1:0] AsyncQueueSink_io_async_mem_2_resp; 
  wire  AsyncQueueSink_io_async_mem_2_last; 
  wire [3:0] AsyncQueueSink_io_async_mem_3_id; 
  wire [63:0] AsyncQueueSink_io_async_mem_3_data; 
  wire [1:0] AsyncQueueSink_io_async_mem_3_resp; 
  wire  AsyncQueueSink_io_async_mem_3_last; 
  wire [3:0] AsyncQueueSink_io_async_mem_4_id; 
  wire [63:0] AsyncQueueSink_io_async_mem_4_data; 
  wire [1:0] AsyncQueueSink_io_async_mem_4_resp; 
  wire  AsyncQueueSink_io_async_mem_4_last; 
  wire [3:0] AsyncQueueSink_io_async_mem_5_id; 
  wire [63:0] AsyncQueueSink_io_async_mem_5_data; 
  wire [1:0] AsyncQueueSink_io_async_mem_5_resp; 
  wire  AsyncQueueSink_io_async_mem_5_last; 
  wire [3:0] AsyncQueueSink_io_async_mem_6_id; 
  wire [63:0] AsyncQueueSink_io_async_mem_6_data; 
  wire [1:0] AsyncQueueSink_io_async_mem_6_resp; 
  wire  AsyncQueueSink_io_async_mem_6_last; 
  wire [3:0] AsyncQueueSink_io_async_mem_7_id; 
  wire [63:0] AsyncQueueSink_io_async_mem_7_data; 
  wire [1:0] AsyncQueueSink_io_async_mem_7_resp; 
  wire  AsyncQueueSink_io_async_mem_7_last; 
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
  wire [1:0] AsyncQueueSink_1_io_deq_bits_resp; 
  wire [3:0] AsyncQueueSink_1_io_async_mem_0_id; 
  wire [1:0] AsyncQueueSink_1_io_async_mem_0_resp; 
  wire [3:0] AsyncQueueSink_1_io_async_mem_1_id; 
  wire [1:0] AsyncQueueSink_1_io_async_mem_1_resp; 
  wire [3:0] AsyncQueueSink_1_io_async_mem_2_id; 
  wire [1:0] AsyncQueueSink_1_io_async_mem_2_resp; 
  wire [3:0] AsyncQueueSink_1_io_async_mem_3_id; 
  wire [1:0] AsyncQueueSink_1_io_async_mem_3_resp; 
  wire [3:0] AsyncQueueSink_1_io_async_mem_4_id; 
  wire [1:0] AsyncQueueSink_1_io_async_mem_4_resp; 
  wire [3:0] AsyncQueueSink_1_io_async_mem_5_id; 
  wire [1:0] AsyncQueueSink_1_io_async_mem_5_resp; 
  wire [3:0] AsyncQueueSink_1_io_async_mem_6_id; 
  wire [1:0] AsyncQueueSink_1_io_async_mem_6_resp; 
  wire [3:0] AsyncQueueSink_1_io_async_mem_7_id; 
  wire [1:0] AsyncQueueSink_1_io_async_mem_7_resp; 
  wire [3:0] AsyncQueueSink_1_io_async_ridx; 
  wire [3:0] AsyncQueueSink_1_io_async_widx; 
  wire  AsyncQueueSink_1_io_async_safe_ridx_valid; 
  wire  AsyncQueueSink_1_io_async_safe_widx_valid; 
  wire  AsyncQueueSink_1_io_async_safe_source_reset_n; 
  wire  AsyncQueueSink_1_io_async_safe_sink_reset_n; 
  AsyncQueueSource_5 AsyncQueueSource ( 
    .clock(AsyncQueueSource_clock),
    .reset(AsyncQueueSource_reset),
    .io_enq_ready(AsyncQueueSource_io_enq_ready),
    .io_enq_valid(AsyncQueueSource_io_enq_valid),
    .io_enq_bits_id(AsyncQueueSource_io_enq_bits_id),
    .io_enq_bits_addr(AsyncQueueSource_io_enq_bits_addr),
    .io_enq_bits_len(AsyncQueueSource_io_enq_bits_len),
    .io_enq_bits_size(AsyncQueueSource_io_enq_bits_size),
    .io_enq_bits_burst(AsyncQueueSource_io_enq_bits_burst),
    .io_enq_bits_lock(AsyncQueueSource_io_enq_bits_lock),
    .io_enq_bits_cache(AsyncQueueSource_io_enq_bits_cache),
    .io_enq_bits_prot(AsyncQueueSource_io_enq_bits_prot),
    .io_enq_bits_qos(AsyncQueueSource_io_enq_bits_qos),
    .io_async_mem_0_id(AsyncQueueSource_io_async_mem_0_id),
    .io_async_mem_0_addr(AsyncQueueSource_io_async_mem_0_addr),
    .io_async_mem_0_len(AsyncQueueSource_io_async_mem_0_len),
    .io_async_mem_0_size(AsyncQueueSource_io_async_mem_0_size),
    .io_async_mem_0_burst(AsyncQueueSource_io_async_mem_0_burst),
    .io_async_mem_0_lock(AsyncQueueSource_io_async_mem_0_lock),
    .io_async_mem_0_cache(AsyncQueueSource_io_async_mem_0_cache),
    .io_async_mem_0_prot(AsyncQueueSource_io_async_mem_0_prot),
    .io_async_mem_0_qos(AsyncQueueSource_io_async_mem_0_qos),
    .io_async_mem_1_id(AsyncQueueSource_io_async_mem_1_id),
    .io_async_mem_1_addr(AsyncQueueSource_io_async_mem_1_addr),
    .io_async_mem_1_len(AsyncQueueSource_io_async_mem_1_len),
    .io_async_mem_1_size(AsyncQueueSource_io_async_mem_1_size),
    .io_async_mem_1_burst(AsyncQueueSource_io_async_mem_1_burst),
    .io_async_mem_1_lock(AsyncQueueSource_io_async_mem_1_lock),
    .io_async_mem_1_cache(AsyncQueueSource_io_async_mem_1_cache),
    .io_async_mem_1_prot(AsyncQueueSource_io_async_mem_1_prot),
    .io_async_mem_1_qos(AsyncQueueSource_io_async_mem_1_qos),
    .io_async_mem_2_id(AsyncQueueSource_io_async_mem_2_id),
    .io_async_mem_2_addr(AsyncQueueSource_io_async_mem_2_addr),
    .io_async_mem_2_len(AsyncQueueSource_io_async_mem_2_len),
    .io_async_mem_2_size(AsyncQueueSource_io_async_mem_2_size),
    .io_async_mem_2_burst(AsyncQueueSource_io_async_mem_2_burst),
    .io_async_mem_2_lock(AsyncQueueSource_io_async_mem_2_lock),
    .io_async_mem_2_cache(AsyncQueueSource_io_async_mem_2_cache),
    .io_async_mem_2_prot(AsyncQueueSource_io_async_mem_2_prot),
    .io_async_mem_2_qos(AsyncQueueSource_io_async_mem_2_qos),
    .io_async_mem_3_id(AsyncQueueSource_io_async_mem_3_id),
    .io_async_mem_3_addr(AsyncQueueSource_io_async_mem_3_addr),
    .io_async_mem_3_len(AsyncQueueSource_io_async_mem_3_len),
    .io_async_mem_3_size(AsyncQueueSource_io_async_mem_3_size),
    .io_async_mem_3_burst(AsyncQueueSource_io_async_mem_3_burst),
    .io_async_mem_3_lock(AsyncQueueSource_io_async_mem_3_lock),
    .io_async_mem_3_cache(AsyncQueueSource_io_async_mem_3_cache),
    .io_async_mem_3_prot(AsyncQueueSource_io_async_mem_3_prot),
    .io_async_mem_3_qos(AsyncQueueSource_io_async_mem_3_qos),
    .io_async_mem_4_id(AsyncQueueSource_io_async_mem_4_id),
    .io_async_mem_4_addr(AsyncQueueSource_io_async_mem_4_addr),
    .io_async_mem_4_len(AsyncQueueSource_io_async_mem_4_len),
    .io_async_mem_4_size(AsyncQueueSource_io_async_mem_4_size),
    .io_async_mem_4_burst(AsyncQueueSource_io_async_mem_4_burst),
    .io_async_mem_4_lock(AsyncQueueSource_io_async_mem_4_lock),
    .io_async_mem_4_cache(AsyncQueueSource_io_async_mem_4_cache),
    .io_async_mem_4_prot(AsyncQueueSource_io_async_mem_4_prot),
    .io_async_mem_4_qos(AsyncQueueSource_io_async_mem_4_qos),
    .io_async_mem_5_id(AsyncQueueSource_io_async_mem_5_id),
    .io_async_mem_5_addr(AsyncQueueSource_io_async_mem_5_addr),
    .io_async_mem_5_len(AsyncQueueSource_io_async_mem_5_len),
    .io_async_mem_5_size(AsyncQueueSource_io_async_mem_5_size),
    .io_async_mem_5_burst(AsyncQueueSource_io_async_mem_5_burst),
    .io_async_mem_5_lock(AsyncQueueSource_io_async_mem_5_lock),
    .io_async_mem_5_cache(AsyncQueueSource_io_async_mem_5_cache),
    .io_async_mem_5_prot(AsyncQueueSource_io_async_mem_5_prot),
    .io_async_mem_5_qos(AsyncQueueSource_io_async_mem_5_qos),
    .io_async_mem_6_id(AsyncQueueSource_io_async_mem_6_id),
    .io_async_mem_6_addr(AsyncQueueSource_io_async_mem_6_addr),
    .io_async_mem_6_len(AsyncQueueSource_io_async_mem_6_len),
    .io_async_mem_6_size(AsyncQueueSource_io_async_mem_6_size),
    .io_async_mem_6_burst(AsyncQueueSource_io_async_mem_6_burst),
    .io_async_mem_6_lock(AsyncQueueSource_io_async_mem_6_lock),
    .io_async_mem_6_cache(AsyncQueueSource_io_async_mem_6_cache),
    .io_async_mem_6_prot(AsyncQueueSource_io_async_mem_6_prot),
    .io_async_mem_6_qos(AsyncQueueSource_io_async_mem_6_qos),
    .io_async_mem_7_id(AsyncQueueSource_io_async_mem_7_id),
    .io_async_mem_7_addr(AsyncQueueSource_io_async_mem_7_addr),
    .io_async_mem_7_len(AsyncQueueSource_io_async_mem_7_len),
    .io_async_mem_7_size(AsyncQueueSource_io_async_mem_7_size),
    .io_async_mem_7_burst(AsyncQueueSource_io_async_mem_7_burst),
    .io_async_mem_7_lock(AsyncQueueSource_io_async_mem_7_lock),
    .io_async_mem_7_cache(AsyncQueueSource_io_async_mem_7_cache),
    .io_async_mem_7_prot(AsyncQueueSource_io_async_mem_7_prot),
    .io_async_mem_7_qos(AsyncQueueSource_io_async_mem_7_qos),
    .io_async_ridx(AsyncQueueSource_io_async_ridx),
    .io_async_widx(AsyncQueueSource_io_async_widx),
    .io_async_safe_ridx_valid(AsyncQueueSource_io_async_safe_ridx_valid),
    .io_async_safe_widx_valid(AsyncQueueSource_io_async_safe_widx_valid),
    .io_async_safe_source_reset_n(AsyncQueueSource_io_async_safe_source_reset_n),
    .io_async_safe_sink_reset_n(AsyncQueueSource_io_async_safe_sink_reset_n)
  );
  AsyncQueueSource_5 AsyncQueueSource_1 ( 
    .clock(AsyncQueueSource_1_clock),
    .reset(AsyncQueueSource_1_reset),
    .io_enq_ready(AsyncQueueSource_1_io_enq_ready),
    .io_enq_valid(AsyncQueueSource_1_io_enq_valid),
    .io_enq_bits_id(AsyncQueueSource_1_io_enq_bits_id),
    .io_enq_bits_addr(AsyncQueueSource_1_io_enq_bits_addr),
    .io_enq_bits_len(AsyncQueueSource_1_io_enq_bits_len),
    .io_enq_bits_size(AsyncQueueSource_1_io_enq_bits_size),
    .io_enq_bits_burst(AsyncQueueSource_1_io_enq_bits_burst),
    .io_enq_bits_lock(AsyncQueueSource_1_io_enq_bits_lock),
    .io_enq_bits_cache(AsyncQueueSource_1_io_enq_bits_cache),
    .io_enq_bits_prot(AsyncQueueSource_1_io_enq_bits_prot),
    .io_enq_bits_qos(AsyncQueueSource_1_io_enq_bits_qos),
    .io_async_mem_0_id(AsyncQueueSource_1_io_async_mem_0_id),
    .io_async_mem_0_addr(AsyncQueueSource_1_io_async_mem_0_addr),
    .io_async_mem_0_len(AsyncQueueSource_1_io_async_mem_0_len),
    .io_async_mem_0_size(AsyncQueueSource_1_io_async_mem_0_size),
    .io_async_mem_0_burst(AsyncQueueSource_1_io_async_mem_0_burst),
    .io_async_mem_0_lock(AsyncQueueSource_1_io_async_mem_0_lock),
    .io_async_mem_0_cache(AsyncQueueSource_1_io_async_mem_0_cache),
    .io_async_mem_0_prot(AsyncQueueSource_1_io_async_mem_0_prot),
    .io_async_mem_0_qos(AsyncQueueSource_1_io_async_mem_0_qos),
    .io_async_mem_1_id(AsyncQueueSource_1_io_async_mem_1_id),
    .io_async_mem_1_addr(AsyncQueueSource_1_io_async_mem_1_addr),
    .io_async_mem_1_len(AsyncQueueSource_1_io_async_mem_1_len),
    .io_async_mem_1_size(AsyncQueueSource_1_io_async_mem_1_size),
    .io_async_mem_1_burst(AsyncQueueSource_1_io_async_mem_1_burst),
    .io_async_mem_1_lock(AsyncQueueSource_1_io_async_mem_1_lock),
    .io_async_mem_1_cache(AsyncQueueSource_1_io_async_mem_1_cache),
    .io_async_mem_1_prot(AsyncQueueSource_1_io_async_mem_1_prot),
    .io_async_mem_1_qos(AsyncQueueSource_1_io_async_mem_1_qos),
    .io_async_mem_2_id(AsyncQueueSource_1_io_async_mem_2_id),
    .io_async_mem_2_addr(AsyncQueueSource_1_io_async_mem_2_addr),
    .io_async_mem_2_len(AsyncQueueSource_1_io_async_mem_2_len),
    .io_async_mem_2_size(AsyncQueueSource_1_io_async_mem_2_size),
    .io_async_mem_2_burst(AsyncQueueSource_1_io_async_mem_2_burst),
    .io_async_mem_2_lock(AsyncQueueSource_1_io_async_mem_2_lock),
    .io_async_mem_2_cache(AsyncQueueSource_1_io_async_mem_2_cache),
    .io_async_mem_2_prot(AsyncQueueSource_1_io_async_mem_2_prot),
    .io_async_mem_2_qos(AsyncQueueSource_1_io_async_mem_2_qos),
    .io_async_mem_3_id(AsyncQueueSource_1_io_async_mem_3_id),
    .io_async_mem_3_addr(AsyncQueueSource_1_io_async_mem_3_addr),
    .io_async_mem_3_len(AsyncQueueSource_1_io_async_mem_3_len),
    .io_async_mem_3_size(AsyncQueueSource_1_io_async_mem_3_size),
    .io_async_mem_3_burst(AsyncQueueSource_1_io_async_mem_3_burst),
    .io_async_mem_3_lock(AsyncQueueSource_1_io_async_mem_3_lock),
    .io_async_mem_3_cache(AsyncQueueSource_1_io_async_mem_3_cache),
    .io_async_mem_3_prot(AsyncQueueSource_1_io_async_mem_3_prot),
    .io_async_mem_3_qos(AsyncQueueSource_1_io_async_mem_3_qos),
    .io_async_mem_4_id(AsyncQueueSource_1_io_async_mem_4_id),
    .io_async_mem_4_addr(AsyncQueueSource_1_io_async_mem_4_addr),
    .io_async_mem_4_len(AsyncQueueSource_1_io_async_mem_4_len),
    .io_async_mem_4_size(AsyncQueueSource_1_io_async_mem_4_size),
    .io_async_mem_4_burst(AsyncQueueSource_1_io_async_mem_4_burst),
    .io_async_mem_4_lock(AsyncQueueSource_1_io_async_mem_4_lock),
    .io_async_mem_4_cache(AsyncQueueSource_1_io_async_mem_4_cache),
    .io_async_mem_4_prot(AsyncQueueSource_1_io_async_mem_4_prot),
    .io_async_mem_4_qos(AsyncQueueSource_1_io_async_mem_4_qos),
    .io_async_mem_5_id(AsyncQueueSource_1_io_async_mem_5_id),
    .io_async_mem_5_addr(AsyncQueueSource_1_io_async_mem_5_addr),
    .io_async_mem_5_len(AsyncQueueSource_1_io_async_mem_5_len),
    .io_async_mem_5_size(AsyncQueueSource_1_io_async_mem_5_size),
    .io_async_mem_5_burst(AsyncQueueSource_1_io_async_mem_5_burst),
    .io_async_mem_5_lock(AsyncQueueSource_1_io_async_mem_5_lock),
    .io_async_mem_5_cache(AsyncQueueSource_1_io_async_mem_5_cache),
    .io_async_mem_5_prot(AsyncQueueSource_1_io_async_mem_5_prot),
    .io_async_mem_5_qos(AsyncQueueSource_1_io_async_mem_5_qos),
    .io_async_mem_6_id(AsyncQueueSource_1_io_async_mem_6_id),
    .io_async_mem_6_addr(AsyncQueueSource_1_io_async_mem_6_addr),
    .io_async_mem_6_len(AsyncQueueSource_1_io_async_mem_6_len),
    .io_async_mem_6_size(AsyncQueueSource_1_io_async_mem_6_size),
    .io_async_mem_6_burst(AsyncQueueSource_1_io_async_mem_6_burst),
    .io_async_mem_6_lock(AsyncQueueSource_1_io_async_mem_6_lock),
    .io_async_mem_6_cache(AsyncQueueSource_1_io_async_mem_6_cache),
    .io_async_mem_6_prot(AsyncQueueSource_1_io_async_mem_6_prot),
    .io_async_mem_6_qos(AsyncQueueSource_1_io_async_mem_6_qos),
    .io_async_mem_7_id(AsyncQueueSource_1_io_async_mem_7_id),
    .io_async_mem_7_addr(AsyncQueueSource_1_io_async_mem_7_addr),
    .io_async_mem_7_len(AsyncQueueSource_1_io_async_mem_7_len),
    .io_async_mem_7_size(AsyncQueueSource_1_io_async_mem_7_size),
    .io_async_mem_7_burst(AsyncQueueSource_1_io_async_mem_7_burst),
    .io_async_mem_7_lock(AsyncQueueSource_1_io_async_mem_7_lock),
    .io_async_mem_7_cache(AsyncQueueSource_1_io_async_mem_7_cache),
    .io_async_mem_7_prot(AsyncQueueSource_1_io_async_mem_7_prot),
    .io_async_mem_7_qos(AsyncQueueSource_1_io_async_mem_7_qos),
    .io_async_ridx(AsyncQueueSource_1_io_async_ridx),
    .io_async_widx(AsyncQueueSource_1_io_async_widx),
    .io_async_safe_ridx_valid(AsyncQueueSource_1_io_async_safe_ridx_valid),
    .io_async_safe_widx_valid(AsyncQueueSource_1_io_async_safe_widx_valid),
    .io_async_safe_source_reset_n(AsyncQueueSource_1_io_async_safe_source_reset_n),
    .io_async_safe_sink_reset_n(AsyncQueueSource_1_io_async_safe_sink_reset_n)
  );
  AsyncQueueSource_7 AsyncQueueSource_2 ( 
    .clock(AsyncQueueSource_2_clock),
    .reset(AsyncQueueSource_2_reset),
    .io_enq_ready(AsyncQueueSource_2_io_enq_ready),
    .io_enq_valid(AsyncQueueSource_2_io_enq_valid),
    .io_enq_bits_data(AsyncQueueSource_2_io_enq_bits_data),
    .io_enq_bits_strb(AsyncQueueSource_2_io_enq_bits_strb),
    .io_enq_bits_last(AsyncQueueSource_2_io_enq_bits_last),
    .io_async_mem_0_data(AsyncQueueSource_2_io_async_mem_0_data),
    .io_async_mem_0_strb(AsyncQueueSource_2_io_async_mem_0_strb),
    .io_async_mem_0_last(AsyncQueueSource_2_io_async_mem_0_last),
    .io_async_mem_1_data(AsyncQueueSource_2_io_async_mem_1_data),
    .io_async_mem_1_strb(AsyncQueueSource_2_io_async_mem_1_strb),
    .io_async_mem_1_last(AsyncQueueSource_2_io_async_mem_1_last),
    .io_async_mem_2_data(AsyncQueueSource_2_io_async_mem_2_data),
    .io_async_mem_2_strb(AsyncQueueSource_2_io_async_mem_2_strb),
    .io_async_mem_2_last(AsyncQueueSource_2_io_async_mem_2_last),
    .io_async_mem_3_data(AsyncQueueSource_2_io_async_mem_3_data),
    .io_async_mem_3_strb(AsyncQueueSource_2_io_async_mem_3_strb),
    .io_async_mem_3_last(AsyncQueueSource_2_io_async_mem_3_last),
    .io_async_mem_4_data(AsyncQueueSource_2_io_async_mem_4_data),
    .io_async_mem_4_strb(AsyncQueueSource_2_io_async_mem_4_strb),
    .io_async_mem_4_last(AsyncQueueSource_2_io_async_mem_4_last),
    .io_async_mem_5_data(AsyncQueueSource_2_io_async_mem_5_data),
    .io_async_mem_5_strb(AsyncQueueSource_2_io_async_mem_5_strb),
    .io_async_mem_5_last(AsyncQueueSource_2_io_async_mem_5_last),
    .io_async_mem_6_data(AsyncQueueSource_2_io_async_mem_6_data),
    .io_async_mem_6_strb(AsyncQueueSource_2_io_async_mem_6_strb),
    .io_async_mem_6_last(AsyncQueueSource_2_io_async_mem_6_last),
    .io_async_mem_7_data(AsyncQueueSource_2_io_async_mem_7_data),
    .io_async_mem_7_strb(AsyncQueueSource_2_io_async_mem_7_strb),
    .io_async_mem_7_last(AsyncQueueSource_2_io_async_mem_7_last),
    .io_async_ridx(AsyncQueueSource_2_io_async_ridx),
    .io_async_widx(AsyncQueueSource_2_io_async_widx),
    .io_async_safe_ridx_valid(AsyncQueueSource_2_io_async_safe_ridx_valid),
    .io_async_safe_widx_valid(AsyncQueueSource_2_io_async_safe_widx_valid),
    .io_async_safe_source_reset_n(AsyncQueueSource_2_io_async_safe_source_reset_n),
    .io_async_safe_sink_reset_n(AsyncQueueSource_2_io_async_safe_sink_reset_n)
  );
  AsyncQueueSink_6 AsyncQueueSink ( 
    .clock(AsyncQueueSink_clock),
    .reset(AsyncQueueSink_reset),
    .io_deq_ready(AsyncQueueSink_io_deq_ready),
    .io_deq_valid(AsyncQueueSink_io_deq_valid),
    .io_deq_bits_id(AsyncQueueSink_io_deq_bits_id),
    .io_deq_bits_data(AsyncQueueSink_io_deq_bits_data),
    .io_deq_bits_resp(AsyncQueueSink_io_deq_bits_resp),
    .io_deq_bits_last(AsyncQueueSink_io_deq_bits_last),
    .io_async_mem_0_id(AsyncQueueSink_io_async_mem_0_id),
    .io_async_mem_0_data(AsyncQueueSink_io_async_mem_0_data),
    .io_async_mem_0_resp(AsyncQueueSink_io_async_mem_0_resp),
    .io_async_mem_0_last(AsyncQueueSink_io_async_mem_0_last),
    .io_async_mem_1_id(AsyncQueueSink_io_async_mem_1_id),
    .io_async_mem_1_data(AsyncQueueSink_io_async_mem_1_data),
    .io_async_mem_1_resp(AsyncQueueSink_io_async_mem_1_resp),
    .io_async_mem_1_last(AsyncQueueSink_io_async_mem_1_last),
    .io_async_mem_2_id(AsyncQueueSink_io_async_mem_2_id),
    .io_async_mem_2_data(AsyncQueueSink_io_async_mem_2_data),
    .io_async_mem_2_resp(AsyncQueueSink_io_async_mem_2_resp),
    .io_async_mem_2_last(AsyncQueueSink_io_async_mem_2_last),
    .io_async_mem_3_id(AsyncQueueSink_io_async_mem_3_id),
    .io_async_mem_3_data(AsyncQueueSink_io_async_mem_3_data),
    .io_async_mem_3_resp(AsyncQueueSink_io_async_mem_3_resp),
    .io_async_mem_3_last(AsyncQueueSink_io_async_mem_3_last),
    .io_async_mem_4_id(AsyncQueueSink_io_async_mem_4_id),
    .io_async_mem_4_data(AsyncQueueSink_io_async_mem_4_data),
    .io_async_mem_4_resp(AsyncQueueSink_io_async_mem_4_resp),
    .io_async_mem_4_last(AsyncQueueSink_io_async_mem_4_last),
    .io_async_mem_5_id(AsyncQueueSink_io_async_mem_5_id),
    .io_async_mem_5_data(AsyncQueueSink_io_async_mem_5_data),
    .io_async_mem_5_resp(AsyncQueueSink_io_async_mem_5_resp),
    .io_async_mem_5_last(AsyncQueueSink_io_async_mem_5_last),
    .io_async_mem_6_id(AsyncQueueSink_io_async_mem_6_id),
    .io_async_mem_6_data(AsyncQueueSink_io_async_mem_6_data),
    .io_async_mem_6_resp(AsyncQueueSink_io_async_mem_6_resp),
    .io_async_mem_6_last(AsyncQueueSink_io_async_mem_6_last),
    .io_async_mem_7_id(AsyncQueueSink_io_async_mem_7_id),
    .io_async_mem_7_data(AsyncQueueSink_io_async_mem_7_data),
    .io_async_mem_7_resp(AsyncQueueSink_io_async_mem_7_resp),
    .io_async_mem_7_last(AsyncQueueSink_io_async_mem_7_last),
    .io_async_ridx(AsyncQueueSink_io_async_ridx),
    .io_async_widx(AsyncQueueSink_io_async_widx),
    .io_async_safe_ridx_valid(AsyncQueueSink_io_async_safe_ridx_valid),
    .io_async_safe_widx_valid(AsyncQueueSink_io_async_safe_widx_valid),
    .io_async_safe_source_reset_n(AsyncQueueSink_io_async_safe_source_reset_n),
    .io_async_safe_sink_reset_n(AsyncQueueSink_io_async_safe_sink_reset_n)
  );
  AsyncQueueSink_7 AsyncQueueSink_1 ( 
    .clock(AsyncQueueSink_1_clock),
    .reset(AsyncQueueSink_1_reset),
    .io_deq_ready(AsyncQueueSink_1_io_deq_ready),
    .io_deq_valid(AsyncQueueSink_1_io_deq_valid),
    .io_deq_bits_id(AsyncQueueSink_1_io_deq_bits_id),
    .io_deq_bits_resp(AsyncQueueSink_1_io_deq_bits_resp),
    .io_async_mem_0_id(AsyncQueueSink_1_io_async_mem_0_id),
    .io_async_mem_0_resp(AsyncQueueSink_1_io_async_mem_0_resp),
    .io_async_mem_1_id(AsyncQueueSink_1_io_async_mem_1_id),
    .io_async_mem_1_resp(AsyncQueueSink_1_io_async_mem_1_resp),
    .io_async_mem_2_id(AsyncQueueSink_1_io_async_mem_2_id),
    .io_async_mem_2_resp(AsyncQueueSink_1_io_async_mem_2_resp),
    .io_async_mem_3_id(AsyncQueueSink_1_io_async_mem_3_id),
    .io_async_mem_3_resp(AsyncQueueSink_1_io_async_mem_3_resp),
    .io_async_mem_4_id(AsyncQueueSink_1_io_async_mem_4_id),
    .io_async_mem_4_resp(AsyncQueueSink_1_io_async_mem_4_resp),
    .io_async_mem_5_id(AsyncQueueSink_1_io_async_mem_5_id),
    .io_async_mem_5_resp(AsyncQueueSink_1_io_async_mem_5_resp),
    .io_async_mem_6_id(AsyncQueueSink_1_io_async_mem_6_id),
    .io_async_mem_6_resp(AsyncQueueSink_1_io_async_mem_6_resp),
    .io_async_mem_7_id(AsyncQueueSink_1_io_async_mem_7_id),
    .io_async_mem_7_resp(AsyncQueueSink_1_io_async_mem_7_resp),
    .io_async_ridx(AsyncQueueSink_1_io_async_ridx),
    .io_async_widx(AsyncQueueSink_1_io_async_widx),
    .io_async_safe_ridx_valid(AsyncQueueSink_1_io_async_safe_ridx_valid),
    .io_async_safe_widx_valid(AsyncQueueSink_1_io_async_safe_widx_valid),
    .io_async_safe_source_reset_n(AsyncQueueSink_1_io_async_safe_source_reset_n),
    .io_async_safe_sink_reset_n(AsyncQueueSink_1_io_async_safe_sink_reset_n)
  );
  assign auto_in_aw_ready = AsyncQueueSource_1_io_enq_ready; 
  assign auto_in_w_ready = AsyncQueueSource_2_io_enq_ready; 
  assign auto_in_b_valid = AsyncQueueSink_1_io_deq_valid; 
  assign auto_in_b_bits_id = AsyncQueueSink_1_io_deq_bits_id; 
  assign auto_in_b_bits_resp = AsyncQueueSink_1_io_deq_bits_resp; 
  assign auto_in_ar_ready = AsyncQueueSource_io_enq_ready; 
  assign auto_in_r_valid = AsyncQueueSink_io_deq_valid; 
  assign auto_in_r_bits_id = AsyncQueueSink_io_deq_bits_id; 
  assign auto_in_r_bits_data = AsyncQueueSink_io_deq_bits_data; 
  assign auto_in_r_bits_resp = AsyncQueueSink_io_deq_bits_resp; 
  assign auto_in_r_bits_last = AsyncQueueSink_io_deq_bits_last; 
  assign auto_out_aw_mem_0_id = AsyncQueueSource_1_io_async_mem_0_id; 
  assign auto_out_aw_mem_0_addr = AsyncQueueSource_1_io_async_mem_0_addr; 
  assign auto_out_aw_mem_0_len = AsyncQueueSource_1_io_async_mem_0_len; 
  assign auto_out_aw_mem_0_size = AsyncQueueSource_1_io_async_mem_0_size; 
  assign auto_out_aw_mem_0_burst = AsyncQueueSource_1_io_async_mem_0_burst; 
  assign auto_out_aw_mem_0_lock = AsyncQueueSource_1_io_async_mem_0_lock; 
  assign auto_out_aw_mem_0_cache = AsyncQueueSource_1_io_async_mem_0_cache; 
  assign auto_out_aw_mem_0_prot = AsyncQueueSource_1_io_async_mem_0_prot; 
  assign auto_out_aw_mem_0_qos = AsyncQueueSource_1_io_async_mem_0_qos; 
  assign auto_out_aw_mem_1_id = AsyncQueueSource_1_io_async_mem_1_id; 
  assign auto_out_aw_mem_1_addr = AsyncQueueSource_1_io_async_mem_1_addr; 
  assign auto_out_aw_mem_1_len = AsyncQueueSource_1_io_async_mem_1_len; 
  assign auto_out_aw_mem_1_size = AsyncQueueSource_1_io_async_mem_1_size; 
  assign auto_out_aw_mem_1_burst = AsyncQueueSource_1_io_async_mem_1_burst; 
  assign auto_out_aw_mem_1_lock = AsyncQueueSource_1_io_async_mem_1_lock; 
  assign auto_out_aw_mem_1_cache = AsyncQueueSource_1_io_async_mem_1_cache; 
  assign auto_out_aw_mem_1_prot = AsyncQueueSource_1_io_async_mem_1_prot; 
  assign auto_out_aw_mem_1_qos = AsyncQueueSource_1_io_async_mem_1_qos; 
  assign auto_out_aw_mem_2_id = AsyncQueueSource_1_io_async_mem_2_id; 
  assign auto_out_aw_mem_2_addr = AsyncQueueSource_1_io_async_mem_2_addr; 
  assign auto_out_aw_mem_2_len = AsyncQueueSource_1_io_async_mem_2_len; 
  assign auto_out_aw_mem_2_size = AsyncQueueSource_1_io_async_mem_2_size; 
  assign auto_out_aw_mem_2_burst = AsyncQueueSource_1_io_async_mem_2_burst; 
  assign auto_out_aw_mem_2_lock = AsyncQueueSource_1_io_async_mem_2_lock; 
  assign auto_out_aw_mem_2_cache = AsyncQueueSource_1_io_async_mem_2_cache; 
  assign auto_out_aw_mem_2_prot = AsyncQueueSource_1_io_async_mem_2_prot; 
  assign auto_out_aw_mem_2_qos = AsyncQueueSource_1_io_async_mem_2_qos; 
  assign auto_out_aw_mem_3_id = AsyncQueueSource_1_io_async_mem_3_id; 
  assign auto_out_aw_mem_3_addr = AsyncQueueSource_1_io_async_mem_3_addr; 
  assign auto_out_aw_mem_3_len = AsyncQueueSource_1_io_async_mem_3_len; 
  assign auto_out_aw_mem_3_size = AsyncQueueSource_1_io_async_mem_3_size; 
  assign auto_out_aw_mem_3_burst = AsyncQueueSource_1_io_async_mem_3_burst; 
  assign auto_out_aw_mem_3_lock = AsyncQueueSource_1_io_async_mem_3_lock; 
  assign auto_out_aw_mem_3_cache = AsyncQueueSource_1_io_async_mem_3_cache; 
  assign auto_out_aw_mem_3_prot = AsyncQueueSource_1_io_async_mem_3_prot; 
  assign auto_out_aw_mem_3_qos = AsyncQueueSource_1_io_async_mem_3_qos; 
  assign auto_out_aw_mem_4_id = AsyncQueueSource_1_io_async_mem_4_id; 
  assign auto_out_aw_mem_4_addr = AsyncQueueSource_1_io_async_mem_4_addr; 
  assign auto_out_aw_mem_4_len = AsyncQueueSource_1_io_async_mem_4_len; 
  assign auto_out_aw_mem_4_size = AsyncQueueSource_1_io_async_mem_4_size; 
  assign auto_out_aw_mem_4_burst = AsyncQueueSource_1_io_async_mem_4_burst; 
  assign auto_out_aw_mem_4_lock = AsyncQueueSource_1_io_async_mem_4_lock; 
  assign auto_out_aw_mem_4_cache = AsyncQueueSource_1_io_async_mem_4_cache; 
  assign auto_out_aw_mem_4_prot = AsyncQueueSource_1_io_async_mem_4_prot; 
  assign auto_out_aw_mem_4_qos = AsyncQueueSource_1_io_async_mem_4_qos; 
  assign auto_out_aw_mem_5_id = AsyncQueueSource_1_io_async_mem_5_id; 
  assign auto_out_aw_mem_5_addr = AsyncQueueSource_1_io_async_mem_5_addr; 
  assign auto_out_aw_mem_5_len = AsyncQueueSource_1_io_async_mem_5_len; 
  assign auto_out_aw_mem_5_size = AsyncQueueSource_1_io_async_mem_5_size; 
  assign auto_out_aw_mem_5_burst = AsyncQueueSource_1_io_async_mem_5_burst; 
  assign auto_out_aw_mem_5_lock = AsyncQueueSource_1_io_async_mem_5_lock; 
  assign auto_out_aw_mem_5_cache = AsyncQueueSource_1_io_async_mem_5_cache; 
  assign auto_out_aw_mem_5_prot = AsyncQueueSource_1_io_async_mem_5_prot; 
  assign auto_out_aw_mem_5_qos = AsyncQueueSource_1_io_async_mem_5_qos; 
  assign auto_out_aw_mem_6_id = AsyncQueueSource_1_io_async_mem_6_id; 
  assign auto_out_aw_mem_6_addr = AsyncQueueSource_1_io_async_mem_6_addr; 
  assign auto_out_aw_mem_6_len = AsyncQueueSource_1_io_async_mem_6_len; 
  assign auto_out_aw_mem_6_size = AsyncQueueSource_1_io_async_mem_6_size; 
  assign auto_out_aw_mem_6_burst = AsyncQueueSource_1_io_async_mem_6_burst; 
  assign auto_out_aw_mem_6_lock = AsyncQueueSource_1_io_async_mem_6_lock; 
  assign auto_out_aw_mem_6_cache = AsyncQueueSource_1_io_async_mem_6_cache; 
  assign auto_out_aw_mem_6_prot = AsyncQueueSource_1_io_async_mem_6_prot; 
  assign auto_out_aw_mem_6_qos = AsyncQueueSource_1_io_async_mem_6_qos; 
  assign auto_out_aw_mem_7_id = AsyncQueueSource_1_io_async_mem_7_id; 
  assign auto_out_aw_mem_7_addr = AsyncQueueSource_1_io_async_mem_7_addr; 
  assign auto_out_aw_mem_7_len = AsyncQueueSource_1_io_async_mem_7_len; 
  assign auto_out_aw_mem_7_size = AsyncQueueSource_1_io_async_mem_7_size; 
  assign auto_out_aw_mem_7_burst = AsyncQueueSource_1_io_async_mem_7_burst; 
  assign auto_out_aw_mem_7_lock = AsyncQueueSource_1_io_async_mem_7_lock; 
  assign auto_out_aw_mem_7_cache = AsyncQueueSource_1_io_async_mem_7_cache; 
  assign auto_out_aw_mem_7_prot = AsyncQueueSource_1_io_async_mem_7_prot; 
  assign auto_out_aw_mem_7_qos = AsyncQueueSource_1_io_async_mem_7_qos; 
  assign auto_out_aw_widx = AsyncQueueSource_1_io_async_widx; 
  assign auto_out_aw_safe_widx_valid = AsyncQueueSource_1_io_async_safe_widx_valid; 
  assign auto_out_aw_safe_source_reset_n = AsyncQueueSource_1_io_async_safe_source_reset_n; 
  assign auto_out_w_mem_0_data = AsyncQueueSource_2_io_async_mem_0_data; 
  assign auto_out_w_mem_0_strb = AsyncQueueSource_2_io_async_mem_0_strb; 
  assign auto_out_w_mem_0_last = AsyncQueueSource_2_io_async_mem_0_last; 
  assign auto_out_w_mem_1_data = AsyncQueueSource_2_io_async_mem_1_data; 
  assign auto_out_w_mem_1_strb = AsyncQueueSource_2_io_async_mem_1_strb; 
  assign auto_out_w_mem_1_last = AsyncQueueSource_2_io_async_mem_1_last; 
  assign auto_out_w_mem_2_data = AsyncQueueSource_2_io_async_mem_2_data; 
  assign auto_out_w_mem_2_strb = AsyncQueueSource_2_io_async_mem_2_strb; 
  assign auto_out_w_mem_2_last = AsyncQueueSource_2_io_async_mem_2_last; 
  assign auto_out_w_mem_3_data = AsyncQueueSource_2_io_async_mem_3_data; 
  assign auto_out_w_mem_3_strb = AsyncQueueSource_2_io_async_mem_3_strb; 
  assign auto_out_w_mem_3_last = AsyncQueueSource_2_io_async_mem_3_last; 
  assign auto_out_w_mem_4_data = AsyncQueueSource_2_io_async_mem_4_data; 
  assign auto_out_w_mem_4_strb = AsyncQueueSource_2_io_async_mem_4_strb; 
  assign auto_out_w_mem_4_last = AsyncQueueSource_2_io_async_mem_4_last; 
  assign auto_out_w_mem_5_data = AsyncQueueSource_2_io_async_mem_5_data; 
  assign auto_out_w_mem_5_strb = AsyncQueueSource_2_io_async_mem_5_strb; 
  assign auto_out_w_mem_5_last = AsyncQueueSource_2_io_async_mem_5_last; 
  assign auto_out_w_mem_6_data = AsyncQueueSource_2_io_async_mem_6_data; 
  assign auto_out_w_mem_6_strb = AsyncQueueSource_2_io_async_mem_6_strb; 
  assign auto_out_w_mem_6_last = AsyncQueueSource_2_io_async_mem_6_last; 
  assign auto_out_w_mem_7_data = AsyncQueueSource_2_io_async_mem_7_data; 
  assign auto_out_w_mem_7_strb = AsyncQueueSource_2_io_async_mem_7_strb; 
  assign auto_out_w_mem_7_last = AsyncQueueSource_2_io_async_mem_7_last; 
  assign auto_out_w_widx = AsyncQueueSource_2_io_async_widx; 
  assign auto_out_w_safe_widx_valid = AsyncQueueSource_2_io_async_safe_widx_valid; 
  assign auto_out_w_safe_source_reset_n = AsyncQueueSource_2_io_async_safe_source_reset_n; 
  assign auto_out_b_ridx = AsyncQueueSink_1_io_async_ridx; 
  assign auto_out_b_safe_ridx_valid = AsyncQueueSink_1_io_async_safe_ridx_valid; 
  assign auto_out_b_safe_sink_reset_n = AsyncQueueSink_1_io_async_safe_sink_reset_n; 
  assign auto_out_ar_mem_0_id = AsyncQueueSource_io_async_mem_0_id; 
  assign auto_out_ar_mem_0_addr = AsyncQueueSource_io_async_mem_0_addr; 
  assign auto_out_ar_mem_0_len = AsyncQueueSource_io_async_mem_0_len; 
  assign auto_out_ar_mem_0_size = AsyncQueueSource_io_async_mem_0_size; 
  assign auto_out_ar_mem_0_burst = AsyncQueueSource_io_async_mem_0_burst; 
  assign auto_out_ar_mem_0_lock = AsyncQueueSource_io_async_mem_0_lock; 
  assign auto_out_ar_mem_0_cache = AsyncQueueSource_io_async_mem_0_cache; 
  assign auto_out_ar_mem_0_prot = AsyncQueueSource_io_async_mem_0_prot; 
  assign auto_out_ar_mem_0_qos = AsyncQueueSource_io_async_mem_0_qos; 
  assign auto_out_ar_mem_1_id = AsyncQueueSource_io_async_mem_1_id; 
  assign auto_out_ar_mem_1_addr = AsyncQueueSource_io_async_mem_1_addr; 
  assign auto_out_ar_mem_1_len = AsyncQueueSource_io_async_mem_1_len; 
  assign auto_out_ar_mem_1_size = AsyncQueueSource_io_async_mem_1_size; 
  assign auto_out_ar_mem_1_burst = AsyncQueueSource_io_async_mem_1_burst; 
  assign auto_out_ar_mem_1_lock = AsyncQueueSource_io_async_mem_1_lock; 
  assign auto_out_ar_mem_1_cache = AsyncQueueSource_io_async_mem_1_cache; 
  assign auto_out_ar_mem_1_prot = AsyncQueueSource_io_async_mem_1_prot; 
  assign auto_out_ar_mem_1_qos = AsyncQueueSource_io_async_mem_1_qos; 
  assign auto_out_ar_mem_2_id = AsyncQueueSource_io_async_mem_2_id; 
  assign auto_out_ar_mem_2_addr = AsyncQueueSource_io_async_mem_2_addr; 
  assign auto_out_ar_mem_2_len = AsyncQueueSource_io_async_mem_2_len; 
  assign auto_out_ar_mem_2_size = AsyncQueueSource_io_async_mem_2_size; 
  assign auto_out_ar_mem_2_burst = AsyncQueueSource_io_async_mem_2_burst; 
  assign auto_out_ar_mem_2_lock = AsyncQueueSource_io_async_mem_2_lock; 
  assign auto_out_ar_mem_2_cache = AsyncQueueSource_io_async_mem_2_cache; 
  assign auto_out_ar_mem_2_prot = AsyncQueueSource_io_async_mem_2_prot; 
  assign auto_out_ar_mem_2_qos = AsyncQueueSource_io_async_mem_2_qos; 
  assign auto_out_ar_mem_3_id = AsyncQueueSource_io_async_mem_3_id; 
  assign auto_out_ar_mem_3_addr = AsyncQueueSource_io_async_mem_3_addr; 
  assign auto_out_ar_mem_3_len = AsyncQueueSource_io_async_mem_3_len; 
  assign auto_out_ar_mem_3_size = AsyncQueueSource_io_async_mem_3_size; 
  assign auto_out_ar_mem_3_burst = AsyncQueueSource_io_async_mem_3_burst; 
  assign auto_out_ar_mem_3_lock = AsyncQueueSource_io_async_mem_3_lock; 
  assign auto_out_ar_mem_3_cache = AsyncQueueSource_io_async_mem_3_cache; 
  assign auto_out_ar_mem_3_prot = AsyncQueueSource_io_async_mem_3_prot; 
  assign auto_out_ar_mem_3_qos = AsyncQueueSource_io_async_mem_3_qos; 
  assign auto_out_ar_mem_4_id = AsyncQueueSource_io_async_mem_4_id; 
  assign auto_out_ar_mem_4_addr = AsyncQueueSource_io_async_mem_4_addr; 
  assign auto_out_ar_mem_4_len = AsyncQueueSource_io_async_mem_4_len; 
  assign auto_out_ar_mem_4_size = AsyncQueueSource_io_async_mem_4_size; 
  assign auto_out_ar_mem_4_burst = AsyncQueueSource_io_async_mem_4_burst; 
  assign auto_out_ar_mem_4_lock = AsyncQueueSource_io_async_mem_4_lock; 
  assign auto_out_ar_mem_4_cache = AsyncQueueSource_io_async_mem_4_cache; 
  assign auto_out_ar_mem_4_prot = AsyncQueueSource_io_async_mem_4_prot; 
  assign auto_out_ar_mem_4_qos = AsyncQueueSource_io_async_mem_4_qos; 
  assign auto_out_ar_mem_5_id = AsyncQueueSource_io_async_mem_5_id; 
  assign auto_out_ar_mem_5_addr = AsyncQueueSource_io_async_mem_5_addr; 
  assign auto_out_ar_mem_5_len = AsyncQueueSource_io_async_mem_5_len; 
  assign auto_out_ar_mem_5_size = AsyncQueueSource_io_async_mem_5_size; 
  assign auto_out_ar_mem_5_burst = AsyncQueueSource_io_async_mem_5_burst; 
  assign auto_out_ar_mem_5_lock = AsyncQueueSource_io_async_mem_5_lock; 
  assign auto_out_ar_mem_5_cache = AsyncQueueSource_io_async_mem_5_cache; 
  assign auto_out_ar_mem_5_prot = AsyncQueueSource_io_async_mem_5_prot; 
  assign auto_out_ar_mem_5_qos = AsyncQueueSource_io_async_mem_5_qos; 
  assign auto_out_ar_mem_6_id = AsyncQueueSource_io_async_mem_6_id; 
  assign auto_out_ar_mem_6_addr = AsyncQueueSource_io_async_mem_6_addr; 
  assign auto_out_ar_mem_6_len = AsyncQueueSource_io_async_mem_6_len; 
  assign auto_out_ar_mem_6_size = AsyncQueueSource_io_async_mem_6_size; 
  assign auto_out_ar_mem_6_burst = AsyncQueueSource_io_async_mem_6_burst; 
  assign auto_out_ar_mem_6_lock = AsyncQueueSource_io_async_mem_6_lock; 
  assign auto_out_ar_mem_6_cache = AsyncQueueSource_io_async_mem_6_cache; 
  assign auto_out_ar_mem_6_prot = AsyncQueueSource_io_async_mem_6_prot; 
  assign auto_out_ar_mem_6_qos = AsyncQueueSource_io_async_mem_6_qos; 
  assign auto_out_ar_mem_7_id = AsyncQueueSource_io_async_mem_7_id; 
  assign auto_out_ar_mem_7_addr = AsyncQueueSource_io_async_mem_7_addr; 
  assign auto_out_ar_mem_7_len = AsyncQueueSource_io_async_mem_7_len; 
  assign auto_out_ar_mem_7_size = AsyncQueueSource_io_async_mem_7_size; 
  assign auto_out_ar_mem_7_burst = AsyncQueueSource_io_async_mem_7_burst; 
  assign auto_out_ar_mem_7_lock = AsyncQueueSource_io_async_mem_7_lock; 
  assign auto_out_ar_mem_7_cache = AsyncQueueSource_io_async_mem_7_cache; 
  assign auto_out_ar_mem_7_prot = AsyncQueueSource_io_async_mem_7_prot; 
  assign auto_out_ar_mem_7_qos = AsyncQueueSource_io_async_mem_7_qos; 
  assign auto_out_ar_widx = AsyncQueueSource_io_async_widx; 
  assign auto_out_ar_safe_widx_valid = AsyncQueueSource_io_async_safe_widx_valid; 
  assign auto_out_ar_safe_source_reset_n = AsyncQueueSource_io_async_safe_source_reset_n; 
  assign auto_out_r_ridx = AsyncQueueSink_io_async_ridx; 
  assign auto_out_r_safe_ridx_valid = AsyncQueueSink_io_async_safe_ridx_valid; 
  assign auto_out_r_safe_sink_reset_n = AsyncQueueSink_io_async_safe_sink_reset_n; 
  assign AsyncQueueSource_clock = clock; 
  assign AsyncQueueSource_reset = reset; 
  assign AsyncQueueSource_io_enq_valid = auto_in_ar_valid; 
  assign AsyncQueueSource_io_enq_bits_id = auto_in_ar_bits_id; 
  assign AsyncQueueSource_io_enq_bits_addr = auto_in_ar_bits_addr; 
  assign AsyncQueueSource_io_enq_bits_len = auto_in_ar_bits_len; 
  assign AsyncQueueSource_io_enq_bits_size = auto_in_ar_bits_size; 
  assign AsyncQueueSource_io_enq_bits_burst = auto_in_ar_bits_burst; 
  assign AsyncQueueSource_io_enq_bits_lock = auto_in_ar_bits_lock; 
  assign AsyncQueueSource_io_enq_bits_cache = auto_in_ar_bits_cache; 
  assign AsyncQueueSource_io_enq_bits_prot = auto_in_ar_bits_prot; 
  assign AsyncQueueSource_io_enq_bits_qos = auto_in_ar_bits_qos; 
  assign AsyncQueueSource_io_async_ridx = auto_out_ar_ridx; 
  assign AsyncQueueSource_io_async_safe_ridx_valid = auto_out_ar_safe_ridx_valid; 
  assign AsyncQueueSource_io_async_safe_sink_reset_n = auto_out_ar_safe_sink_reset_n; 
  assign AsyncQueueSource_1_clock = clock; 
  assign AsyncQueueSource_1_reset = reset; 
  assign AsyncQueueSource_1_io_enq_valid = auto_in_aw_valid; 
  assign AsyncQueueSource_1_io_enq_bits_id = auto_in_aw_bits_id; 
  assign AsyncQueueSource_1_io_enq_bits_addr = auto_in_aw_bits_addr; 
  assign AsyncQueueSource_1_io_enq_bits_len = auto_in_aw_bits_len; 
  assign AsyncQueueSource_1_io_enq_bits_size = auto_in_aw_bits_size; 
  assign AsyncQueueSource_1_io_enq_bits_burst = auto_in_aw_bits_burst; 
  assign AsyncQueueSource_1_io_enq_bits_lock = auto_in_aw_bits_lock; 
  assign AsyncQueueSource_1_io_enq_bits_cache = auto_in_aw_bits_cache; 
  assign AsyncQueueSource_1_io_enq_bits_prot = auto_in_aw_bits_prot; 
  assign AsyncQueueSource_1_io_enq_bits_qos = auto_in_aw_bits_qos; 
  assign AsyncQueueSource_1_io_async_ridx = auto_out_aw_ridx; 
  assign AsyncQueueSource_1_io_async_safe_ridx_valid = auto_out_aw_safe_ridx_valid; 
  assign AsyncQueueSource_1_io_async_safe_sink_reset_n = auto_out_aw_safe_sink_reset_n; 
  assign AsyncQueueSource_2_clock = clock; 
  assign AsyncQueueSource_2_reset = reset; 
  assign AsyncQueueSource_2_io_enq_valid = auto_in_w_valid; 
  assign AsyncQueueSource_2_io_enq_bits_data = auto_in_w_bits_data; 
  assign AsyncQueueSource_2_io_enq_bits_strb = auto_in_w_bits_strb; 
  assign AsyncQueueSource_2_io_enq_bits_last = auto_in_w_bits_last; 
  assign AsyncQueueSource_2_io_async_ridx = auto_out_w_ridx; 
  assign AsyncQueueSource_2_io_async_safe_ridx_valid = auto_out_w_safe_ridx_valid; 
  assign AsyncQueueSource_2_io_async_safe_sink_reset_n = auto_out_w_safe_sink_reset_n; 
  assign AsyncQueueSink_clock = clock; 
  assign AsyncQueueSink_reset = reset; 
  assign AsyncQueueSink_io_deq_ready = auto_in_r_ready; 
  assign AsyncQueueSink_io_async_mem_0_id = auto_out_r_mem_0_id; 
  assign AsyncQueueSink_io_async_mem_0_data = auto_out_r_mem_0_data; 
  assign AsyncQueueSink_io_async_mem_0_resp = auto_out_r_mem_0_resp; 
  assign AsyncQueueSink_io_async_mem_0_last = auto_out_r_mem_0_last; 
  assign AsyncQueueSink_io_async_mem_1_id = auto_out_r_mem_1_id; 
  assign AsyncQueueSink_io_async_mem_1_data = auto_out_r_mem_1_data; 
  assign AsyncQueueSink_io_async_mem_1_resp = auto_out_r_mem_1_resp; 
  assign AsyncQueueSink_io_async_mem_1_last = auto_out_r_mem_1_last; 
  assign AsyncQueueSink_io_async_mem_2_id = auto_out_r_mem_2_id; 
  assign AsyncQueueSink_io_async_mem_2_data = auto_out_r_mem_2_data; 
  assign AsyncQueueSink_io_async_mem_2_resp = auto_out_r_mem_2_resp; 
  assign AsyncQueueSink_io_async_mem_2_last = auto_out_r_mem_2_last; 
  assign AsyncQueueSink_io_async_mem_3_id = auto_out_r_mem_3_id; 
  assign AsyncQueueSink_io_async_mem_3_data = auto_out_r_mem_3_data; 
  assign AsyncQueueSink_io_async_mem_3_resp = auto_out_r_mem_3_resp; 
  assign AsyncQueueSink_io_async_mem_3_last = auto_out_r_mem_3_last; 
  assign AsyncQueueSink_io_async_mem_4_id = auto_out_r_mem_4_id; 
  assign AsyncQueueSink_io_async_mem_4_data = auto_out_r_mem_4_data; 
  assign AsyncQueueSink_io_async_mem_4_resp = auto_out_r_mem_4_resp; 
  assign AsyncQueueSink_io_async_mem_4_last = auto_out_r_mem_4_last; 
  assign AsyncQueueSink_io_async_mem_5_id = auto_out_r_mem_5_id; 
  assign AsyncQueueSink_io_async_mem_5_data = auto_out_r_mem_5_data; 
  assign AsyncQueueSink_io_async_mem_5_resp = auto_out_r_mem_5_resp; 
  assign AsyncQueueSink_io_async_mem_5_last = auto_out_r_mem_5_last; 
  assign AsyncQueueSink_io_async_mem_6_id = auto_out_r_mem_6_id; 
  assign AsyncQueueSink_io_async_mem_6_data = auto_out_r_mem_6_data; 
  assign AsyncQueueSink_io_async_mem_6_resp = auto_out_r_mem_6_resp; 
  assign AsyncQueueSink_io_async_mem_6_last = auto_out_r_mem_6_last; 
  assign AsyncQueueSink_io_async_mem_7_id = auto_out_r_mem_7_id; 
  assign AsyncQueueSink_io_async_mem_7_data = auto_out_r_mem_7_data; 
  assign AsyncQueueSink_io_async_mem_7_resp = auto_out_r_mem_7_resp; 
  assign AsyncQueueSink_io_async_mem_7_last = auto_out_r_mem_7_last; 
  assign AsyncQueueSink_io_async_widx = auto_out_r_widx; 
  assign AsyncQueueSink_io_async_safe_widx_valid = auto_out_r_safe_widx_valid; 
  assign AsyncQueueSink_io_async_safe_source_reset_n = auto_out_r_safe_source_reset_n; 
  assign AsyncQueueSink_1_clock = clock; 
  assign AsyncQueueSink_1_reset = reset; 
  assign AsyncQueueSink_1_io_deq_ready = auto_in_b_ready; 
  assign AsyncQueueSink_1_io_async_mem_0_id = auto_out_b_mem_0_id; 
  assign AsyncQueueSink_1_io_async_mem_0_resp = auto_out_b_mem_0_resp; 
  assign AsyncQueueSink_1_io_async_mem_1_id = auto_out_b_mem_1_id; 
  assign AsyncQueueSink_1_io_async_mem_1_resp = auto_out_b_mem_1_resp; 
  assign AsyncQueueSink_1_io_async_mem_2_id = auto_out_b_mem_2_id; 
  assign AsyncQueueSink_1_io_async_mem_2_resp = auto_out_b_mem_2_resp; 
  assign AsyncQueueSink_1_io_async_mem_3_id = auto_out_b_mem_3_id; 
  assign AsyncQueueSink_1_io_async_mem_3_resp = auto_out_b_mem_3_resp; 
  assign AsyncQueueSink_1_io_async_mem_4_id = auto_out_b_mem_4_id; 
  assign AsyncQueueSink_1_io_async_mem_4_resp = auto_out_b_mem_4_resp; 
  assign AsyncQueueSink_1_io_async_mem_5_id = auto_out_b_mem_5_id; 
  assign AsyncQueueSink_1_io_async_mem_5_resp = auto_out_b_mem_5_resp; 
  assign AsyncQueueSink_1_io_async_mem_6_id = auto_out_b_mem_6_id; 
  assign AsyncQueueSink_1_io_async_mem_6_resp = auto_out_b_mem_6_resp; 
  assign AsyncQueueSink_1_io_async_mem_7_id = auto_out_b_mem_7_id; 
  assign AsyncQueueSink_1_io_async_mem_7_resp = auto_out_b_mem_7_resp; 
  assign AsyncQueueSink_1_io_async_widx = auto_out_b_widx; 
  assign AsyncQueueSink_1_io_async_safe_widx_valid = auto_out_b_safe_widx_valid; 
  assign AsyncQueueSink_1_io_async_safe_source_reset_n = auto_out_b_safe_source_reset_n; 
endmodule
