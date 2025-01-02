module AXI4IdIndexer_1( 
  output        auto_in_aw_ready, 
  input         auto_in_aw_valid, 
  input  [3:0]  auto_in_aw_bits_id, 
  input  [30:0] auto_in_aw_bits_addr, 
  input  [7:0]  auto_in_aw_bits_len, 
  input  [2:0]  auto_in_aw_bits_size, 
  input  [1:0]  auto_in_aw_bits_burst, 
  input  [8:0]  auto_in_aw_bits_user, 
  output        auto_in_w_ready, 
  input         auto_in_w_valid, 
  input  [63:0] auto_in_w_bits_data, 
  input  [7:0]  auto_in_w_bits_strb, 
  input         auto_in_w_bits_last, 
  input         auto_in_b_ready, 
  output        auto_in_b_valid, 
  output [3:0]  auto_in_b_bits_id, 
  output [1:0]  auto_in_b_bits_resp, 
  output [8:0]  auto_in_b_bits_user, 
  output        auto_in_ar_ready, 
  input         auto_in_ar_valid, 
  input  [3:0]  auto_in_ar_bits_id, 
  input  [30:0] auto_in_ar_bits_addr, 
  input  [7:0]  auto_in_ar_bits_len, 
  input  [2:0]  auto_in_ar_bits_size, 
  input  [1:0]  auto_in_ar_bits_burst, 
  input  [8:0]  auto_in_ar_bits_user, 
  input         auto_in_r_ready, 
  output        auto_in_r_valid, 
  output [3:0]  auto_in_r_bits_id, 
  output [63:0] auto_in_r_bits_data, 
  output [1:0]  auto_in_r_bits_resp, 
  output [8:0]  auto_in_r_bits_user, 
  output        auto_in_r_bits_last, 
  input         auto_out_aw_ready, 
  output        auto_out_aw_valid, 
  output [3:0]  auto_out_aw_bits_id, 
  output [30:0] auto_out_aw_bits_addr, 
  output [7:0]  auto_out_aw_bits_len, 
  output [2:0]  auto_out_aw_bits_size, 
  output [1:0]  auto_out_aw_bits_burst, 
  output [8:0]  auto_out_aw_bits_user, 
  input         auto_out_w_ready, 
  output        auto_out_w_valid, 
  output [63:0] auto_out_w_bits_data, 
  output [7:0]  auto_out_w_bits_strb, 
  output        auto_out_w_bits_last, 
  output        auto_out_b_ready, 
  input         auto_out_b_valid, 
  input  [3:0]  auto_out_b_bits_id, 
  input  [1:0]  auto_out_b_bits_resp, 
  input  [8:0]  auto_out_b_bits_user, 
  input         auto_out_ar_ready, 
  output        auto_out_ar_valid, 
  output [3:0]  auto_out_ar_bits_id, 
  output [30:0] auto_out_ar_bits_addr, 
  output [7:0]  auto_out_ar_bits_len, 
  output [2:0]  auto_out_ar_bits_size, 
  output [1:0]  auto_out_ar_bits_burst, 
  output [8:0]  auto_out_ar_bits_user, 
  output        auto_out_r_ready, 
  input         auto_out_r_valid, 
  input  [3:0]  auto_out_r_bits_id, 
  input  [63:0] auto_out_r_bits_data, 
  input  [1:0]  auto_out_r_bits_resp, 
  input  [8:0]  auto_out_r_bits_user, 
  input         auto_out_r_bits_last 
);
  assign auto_in_aw_ready = auto_out_aw_ready; 
  assign auto_in_w_ready = auto_out_w_ready; 
  assign auto_in_b_valid = auto_out_b_valid; 
  assign auto_in_b_bits_id = auto_out_b_bits_id; 
  assign auto_in_b_bits_resp = auto_out_b_bits_resp; 
  assign auto_in_b_bits_user = auto_out_b_bits_user; 
  assign auto_in_ar_ready = auto_out_ar_ready; 
  assign auto_in_r_valid = auto_out_r_valid; 
  assign auto_in_r_bits_id = auto_out_r_bits_id; 
  assign auto_in_r_bits_data = auto_out_r_bits_data; 
  assign auto_in_r_bits_resp = auto_out_r_bits_resp; 
  assign auto_in_r_bits_user = auto_out_r_bits_user; 
  assign auto_in_r_bits_last = auto_out_r_bits_last; 
  assign auto_out_aw_valid = auto_in_aw_valid; 
  assign auto_out_aw_bits_id = auto_in_aw_bits_id; 
  assign auto_out_aw_bits_addr = auto_in_aw_bits_addr; 
  assign auto_out_aw_bits_len = auto_in_aw_bits_len; 
  assign auto_out_aw_bits_size = auto_in_aw_bits_size; 
  assign auto_out_aw_bits_burst = auto_in_aw_bits_burst; 
  assign auto_out_aw_bits_user = auto_in_aw_bits_user; 
  assign auto_out_w_valid = auto_in_w_valid; 
  assign auto_out_w_bits_data = auto_in_w_bits_data; 
  assign auto_out_w_bits_strb = auto_in_w_bits_strb; 
  assign auto_out_w_bits_last = auto_in_w_bits_last; 
  assign auto_out_b_ready = auto_in_b_ready; 
  assign auto_out_ar_valid = auto_in_ar_valid; 
  assign auto_out_ar_bits_id = auto_in_ar_bits_id; 
  assign auto_out_ar_bits_addr = auto_in_ar_bits_addr; 
  assign auto_out_ar_bits_len = auto_in_ar_bits_len; 
  assign auto_out_ar_bits_size = auto_in_ar_bits_size; 
  assign auto_out_ar_bits_burst = auto_in_ar_bits_burst; 
  assign auto_out_ar_bits_user = auto_in_ar_bits_user; 
  assign auto_out_r_ready = auto_in_r_ready; 
endmodule
