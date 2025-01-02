module XilinxVC707MIG( 
  output  ddr_io_c2b_clk
  ,output  ddr_io_c2b_rst
  ,output  ddr_io_c2b_send
  ,output [7:0] ddr_io_c2b_data,
  input  ddr_io_b2c_clk
  ,input  ddr_io_b2c_rst
  ,input  ddr_io_b2c_send
  ,input [7:0] ddr_io_b2c_data,

  output wire [31:0] transferDataReg,
  output wire        send_1p_valid,
  // rx dfx
  output wire [31:0] b2c_data_concat,
  output wire        b2c_data_valid,

  input         chiplink_clock,
  input         chiplink_reset,
  
  input wire mig_input_takeover_en,

  input  ddr_master_0_awready
  ,output  ddr_master_0_awvalid
  ,output [3:0] ddr_master_0_awid
  ,output [31:0] ddr_master_0_awaddr
  ,output [7:0] ddr_master_0_awlen
  ,output [2:0] ddr_master_0_awsize
  ,output [1:0] ddr_master_0_awburst
  ,input  ddr_master_0_wready
  ,output  ddr_master_0_wvalid
  ,output [63:0] ddr_master_0_wdata
  ,output [7:0] ddr_master_0_wstrb
  ,output  ddr_master_0_wlast
  ,output  ddr_master_0_bready
  ,input  ddr_master_0_bvalid
  ,input [3:0] ddr_master_0_bid
  ,input [1:0] ddr_master_0_bresp
  ,input  ddr_master_0_arready
  ,output  ddr_master_0_arvalid
  ,output [3:0] ddr_master_0_arid
  ,output [31:0] ddr_master_0_araddr
  ,output [7:0] ddr_master_0_arlen
  ,output [2:0] ddr_master_0_arsize
  ,output [1:0] ddr_master_0_arburst
  ,output  ddr_master_0_rready
  ,input  ddr_master_0_rvalid
  ,input [3:0] ddr_master_0_rid
  ,input [63:0] ddr_master_0_rdata
  ,input [1:0] ddr_master_0_rresp
  ,input  ddr_master_0_rlast,

  input         clock, 
  input         reset, 
  output        auto_buffer_in_a_ready, 
  input         auto_buffer_in_a_valid, 
  input  [2:0]  auto_buffer_in_a_bits_opcode, 
  input  [2:0]  auto_buffer_in_a_bits_param, 
  input  [2:0]  auto_buffer_in_a_bits_size, 
  input  [6:0]  auto_buffer_in_a_bits_source, 
  input  [31:0] auto_buffer_in_a_bits_address, 
  input  [7:0]  auto_buffer_in_a_bits_mask, 
  input  [63:0] auto_buffer_in_a_bits_data, 
  input         auto_buffer_in_a_bits_corrupt, 
  input         auto_buffer_in_d_ready, 
  output        auto_buffer_in_d_valid, 
  output [2:0]  auto_buffer_in_d_bits_opcode, 
  output [1:0]  auto_buffer_in_d_bits_param, 
  output [2:0]  auto_buffer_in_d_bits_size, 
  output [6:0]  auto_buffer_in_d_bits_source, 
  output        auto_buffer_in_d_bits_sink, 
  output        auto_buffer_in_d_bits_denied, 
  output [63:0] auto_buffer_in_d_bits_data, 
  output        auto_buffer_in_d_bits_corrupt, 
  output [13:0] io_port_ddr3_addr, 
  output [2:0]  io_port_ddr3_ba, 
  output        io_port_ddr3_ras_n, 
  output        io_port_ddr3_cas_n, 
  output        io_port_ddr3_we_n, 
  output        io_port_ddr3_reset_n, 
  output        io_port_ddr3_ck_p, 
  output        io_port_ddr3_ck_n, 
  output        io_port_ddr3_cke, 
  output        io_port_ddr3_cs_n, 
  output [7:0]  io_port_ddr3_dm, 
  output        io_port_ddr3_odt, 
  // inout  [63:0] io_port_ddr3_dq, 
  // inout  [7:0]  io_port_ddr3_dqs_n, 
  // inout  [7:0]  io_port_ddr3_dqs_p, 
  input         io_port_sys_clk_i, 
  output        io_port_ui_clk, 
  output        io_port_ui_clk_sync_rst, 
  output        io_port_mmcm_locked, 
  input         io_port_aresetn, 
  input         io_port_sys_rst 
);
  wire  buffer_clock; 
  wire  buffer_reset; 
  wire  buffer_auto_in_a_ready; 
  wire  buffer_auto_in_a_valid; 
  wire [2:0] buffer_auto_in_a_bits_opcode; 
  wire [2:0] buffer_auto_in_a_bits_param; 
  wire [2:0] buffer_auto_in_a_bits_size; 
  wire [6:0] buffer_auto_in_a_bits_source; 
  wire [31:0] buffer_auto_in_a_bits_address; 
  wire [7:0] buffer_auto_in_a_bits_mask; 
  wire [63:0] buffer_auto_in_a_bits_data; 
  wire  buffer_auto_in_a_bits_corrupt; 
  wire  buffer_auto_in_d_ready; 
  wire  buffer_auto_in_d_valid; 
  wire [2:0] buffer_auto_in_d_bits_opcode; 
  wire [1:0] buffer_auto_in_d_bits_param; 
  wire [2:0] buffer_auto_in_d_bits_size; 
  wire [6:0] buffer_auto_in_d_bits_source; 
  wire  buffer_auto_in_d_bits_sink; 
  wire  buffer_auto_in_d_bits_denied; 
  wire [63:0] buffer_auto_in_d_bits_data; 
  wire  buffer_auto_in_d_bits_corrupt; 
  wire  buffer_auto_out_a_ready; 
  wire  buffer_auto_out_a_valid; 
  wire [2:0] buffer_auto_out_a_bits_opcode; 
  wire [2:0] buffer_auto_out_a_bits_param; 
  wire [2:0] buffer_auto_out_a_bits_size; 
  wire [6:0] buffer_auto_out_a_bits_source; 
  wire [31:0] buffer_auto_out_a_bits_address; 
  wire [7:0] buffer_auto_out_a_bits_mask; 
  wire [63:0] buffer_auto_out_a_bits_data; 
  wire  buffer_auto_out_a_bits_corrupt; 
  wire  buffer_auto_out_d_ready; 
  wire  buffer_auto_out_d_valid; 
  wire [2:0] buffer_auto_out_d_bits_opcode; 
  wire [2:0] buffer_auto_out_d_bits_size; 
  wire [6:0] buffer_auto_out_d_bits_source; 
  wire  buffer_auto_out_d_bits_denied; 
  wire [63:0] buffer_auto_out_d_bits_data; 
  wire  buffer_auto_out_d_bits_corrupt; 
  wire  toaxi4_clock; 
  wire  toaxi4_reset; 


  wire  toaxi4_auto_in_a_ready; 
  wire  toaxi4_auto_in_a_valid; 
  wire [2:0] toaxi4_auto_in_a_bits_opcode; 
  wire [2:0] toaxi4_auto_in_a_bits_param; 
  wire [2:0] toaxi4_auto_in_a_bits_size; 
  wire [6:0] toaxi4_auto_in_a_bits_source; 
  wire [31:0] toaxi4_auto_in_a_bits_address; 
  wire [7:0] toaxi4_auto_in_a_bits_mask; 
  wire [63:0] toaxi4_auto_in_a_bits_data; 
  wire  toaxi4_auto_in_a_bits_corrupt; 
  wire  toaxi4_auto_in_d_ready; 
  wire  toaxi4_auto_in_d_valid; 
  wire [2:0] toaxi4_auto_in_d_bits_opcode; 
  wire [2:0] toaxi4_auto_in_d_bits_size; 
  wire [6:0] toaxi4_auto_in_d_bits_source; 
  wire  toaxi4_auto_in_d_bits_denied; 
  wire [63:0] toaxi4_auto_in_d_bits_data; 
  wire  toaxi4_auto_in_d_bits_corrupt; 


  
  wire  toaxi4_shrink_auto_in_a_ready; 
  wire  toaxi4_shrink_auto_in_a_valid; 
  wire [2:0] toaxi4_shrink_auto_in_a_bits_opcode; 
  wire [2:0] toaxi4_shrink_auto_in_a_bits_param; 
  wire [2:0] toaxi4_shrink_auto_in_a_bits_size; 
  wire [3:0] toaxi4_shrink_auto_in_a_bits_source; 
  wire [31:0] toaxi4_shrink_auto_in_a_bits_address; 
  wire [7:0] toaxi4_shrink_auto_in_a_bits_mask; 
  wire [63:0] toaxi4_shrink_auto_in_a_bits_data; 
  wire  toaxi4_shrink_auto_in_a_bits_corrupt; 
  wire  toaxi4_shrink_auto_in_d_ready; 
  wire  toaxi4_shrink_auto_in_d_valid; 
  wire [2:0] toaxi4_shrink_auto_in_d_bits_opcode; 
  wire [2:0] toaxi4_shrink_auto_in_d_bits_size; 
  wire [3:0] toaxi4_shrink_auto_in_d_bits_source; 
  wire [2:0] toaxi4_shrink_auto_in_d_bits_source_unused; 
  wire  toaxi4_shrink_auto_in_d_bits_denied; 
  wire [63:0] toaxi4_shrink_auto_in_d_bits_data; 
  wire  toaxi4_shrink_auto_in_d_bits_corrupt; 


  wire  toaxi4_auto_out_aw_ready; 
  wire  toaxi4_auto_out_aw_valid; 
  wire [5:0] toaxi4_auto_out_aw_bits_id; 
  wire [31:0] toaxi4_auto_out_aw_bits_addr; 
  wire [7:0] toaxi4_auto_out_aw_bits_len; 
  wire [2:0] toaxi4_auto_out_aw_bits_size; 
  wire [1:0] toaxi4_auto_out_aw_bits_burst; 
  wire  toaxi4_auto_out_aw_bits_lock; 
  wire [3:0] toaxi4_auto_out_aw_bits_cache; 
  wire [2:0] toaxi4_auto_out_aw_bits_prot; 
  wire [3:0] toaxi4_auto_out_aw_bits_qos; 
  wire [10:0] toaxi4_auto_out_aw_bits_user; 
  wire  toaxi4_auto_out_w_ready; 
  wire  toaxi4_auto_out_w_valid; 
  wire [63:0] toaxi4_auto_out_w_bits_data; 
  wire [7:0] toaxi4_auto_out_w_bits_strb; 
  wire  toaxi4_auto_out_w_bits_last; 
  wire  toaxi4_auto_out_b_ready; 
  wire  toaxi4_auto_out_b_valid; 
  wire [5:0] toaxi4_auto_out_b_bits_id; 
  wire [1:0] toaxi4_auto_out_b_bits_resp; 
  wire [10:0] toaxi4_auto_out_b_bits_user; 
  wire  toaxi4_auto_out_ar_ready; 
  wire  toaxi4_auto_out_ar_valid; 
  wire [5:0] toaxi4_auto_out_ar_bits_id; 
  wire [31:0] toaxi4_auto_out_ar_bits_addr; 
  wire [7:0] toaxi4_auto_out_ar_bits_len; 
  wire [2:0] toaxi4_auto_out_ar_bits_size; 
  wire [1:0] toaxi4_auto_out_ar_bits_burst; 
  wire  toaxi4_auto_out_ar_bits_lock; 
  wire [3:0] toaxi4_auto_out_ar_bits_cache; 
  wire [2:0] toaxi4_auto_out_ar_bits_prot; 
  wire [3:0] toaxi4_auto_out_ar_bits_qos; 
  wire [10:0] toaxi4_auto_out_ar_bits_user; 
  wire  toaxi4_auto_out_r_ready; 
  wire  toaxi4_auto_out_r_valid; 
  wire [5:0] toaxi4_auto_out_r_bits_id; 
  wire [63:0] toaxi4_auto_out_r_bits_data; 
  wire [1:0] toaxi4_auto_out_r_bits_resp; 
  wire [10:0] toaxi4_auto_out_r_bits_user; 
  wire  toaxi4_auto_out_r_bits_last; 

  wire  toaxi4_index_buf_awready; 
  wire  toaxi4_index_buf_awvalid; 
  wire [5:0] toaxi4_index_buf_awid; 
  wire [31:0] toaxi4_index_buf_awaddr; 
  wire [7:0] toaxi4_index_buf_awlen; 
  wire [2:0] toaxi4_index_buf_awsize; 
  wire [1:0] toaxi4_index_buf_awburst; 
  wire  toaxi4_index_buf_awlock; 
  wire [3:0] toaxi4_index_buf_awcache; 
  wire [2:0] toaxi4_index_buf_awprot; 
  wire [3:0] toaxi4_index_buf_awqos; 
  wire [10:0] toaxi4_index_buf_awuser; 
  wire  toaxi4_index_buf_wready; 
  wire  toaxi4_index_buf_wvalid; 
  wire [63:0] toaxi4_index_buf_wdata; 
  wire [7:0] toaxi4_index_buf_wstrb; 
  wire  toaxi4_index_buf_wlast; 
  wire  toaxi4_index_buf_bready; 
  wire  toaxi4_index_buf_bvalid; 
  wire [5:0] toaxi4_index_buf_bid; 
  wire [1:0] toaxi4_index_buf_bresp; 
  wire [10:0] toaxi4_index_buf_buser; 
  wire  toaxi4_index_buf_arready; 
  wire  toaxi4_index_buf_arvalid; 
  wire [5:0] toaxi4_index_buf_arid; 
  wire [31:0] toaxi4_index_buf_araddr; 
  wire [7:0] toaxi4_index_buf_arlen; 
  wire [2:0] toaxi4_index_buf_arsize; 
  wire [1:0] toaxi4_index_buf_arburst; 
  wire  toaxi4_index_buf_arlock; 
  wire [3:0] toaxi4_index_buf_arcache; 
  wire [2:0] toaxi4_index_buf_arprot; 
  wire [3:0] toaxi4_index_buf_arqos; 
  wire [10:0] toaxi4_index_buf_aruser; 
  wire  toaxi4_index_buf_rready; 
  wire  toaxi4_index_buf_rvalid; 
  wire [5:0] toaxi4_index_buf_rid; 
  wire [63:0] toaxi4_index_buf_rdata; 
  wire [1:0] toaxi4_index_buf_rresp; 
  wire [10:0] toaxi4_index_buf_ruser; 
  wire  toaxi4_index_buf_rlast; 

  wire  indexer_auto_in_aw_ready; 
  wire  indexer_auto_in_aw_valid; 
  wire [5:0] indexer_auto_in_aw_bits_id; 
  wire [31:0] indexer_auto_in_aw_bits_addr; 
  wire [7:0] indexer_auto_in_aw_bits_len; 
  wire [2:0] indexer_auto_in_aw_bits_size; 
  wire [1:0] indexer_auto_in_aw_bits_burst; 
  wire  indexer_auto_in_aw_bits_lock; 
  wire [3:0] indexer_auto_in_aw_bits_cache; 
  wire [2:0] indexer_auto_in_aw_bits_prot; 
  wire [3:0] indexer_auto_in_aw_bits_qos; 
  wire [10:0] indexer_auto_in_aw_bits_user; 
  wire  indexer_auto_in_w_ready; 
  wire  indexer_auto_in_w_valid; 
  wire [63:0] indexer_auto_in_w_bits_data; 
  wire [7:0] indexer_auto_in_w_bits_strb; 
  wire  indexer_auto_in_w_bits_last; 
  wire  indexer_auto_in_b_ready; 
  wire  indexer_auto_in_b_valid; 
  wire [5:0] indexer_auto_in_b_bits_id; 
  wire [1:0] indexer_auto_in_b_bits_resp; 
  wire [10:0] indexer_auto_in_b_bits_user; 
  wire  indexer_auto_in_ar_ready; 
  wire  indexer_auto_in_ar_valid; 
  wire [5:0] indexer_auto_in_ar_bits_id; 
  wire [31:0] indexer_auto_in_ar_bits_addr; 
  wire [7:0] indexer_auto_in_ar_bits_len; 
  wire [2:0] indexer_auto_in_ar_bits_size; 
  wire [1:0] indexer_auto_in_ar_bits_burst; 
  wire  indexer_auto_in_ar_bits_lock; 
  wire [3:0] indexer_auto_in_ar_bits_cache; 
  wire [2:0] indexer_auto_in_ar_bits_prot; 
  wire [3:0] indexer_auto_in_ar_bits_qos; 
  wire [10:0] indexer_auto_in_ar_bits_user; 
  wire  indexer_auto_in_r_ready; 
  wire  indexer_auto_in_r_valid; 
  wire [5:0] indexer_auto_in_r_bits_id; 
  wire [63:0] indexer_auto_in_r_bits_data; 
  wire [1:0] indexer_auto_in_r_bits_resp; 
  wire [10:0] indexer_auto_in_r_bits_user; 
  wire  indexer_auto_in_r_bits_last; 
  wire  indexer_auto_out_aw_ready; 
  wire  indexer_auto_out_aw_valid; 
  wire [3:0] indexer_auto_out_aw_bits_id; 
  wire [31:0] indexer_auto_out_aw_bits_addr; 
  wire [7:0] indexer_auto_out_aw_bits_len; 
  wire [2:0] indexer_auto_out_aw_bits_size; 
  wire [1:0] indexer_auto_out_aw_bits_burst; 
  wire  indexer_auto_out_aw_bits_lock; 
  wire [3:0] indexer_auto_out_aw_bits_cache; 
  wire [2:0] indexer_auto_out_aw_bits_prot; 
  wire [3:0] indexer_auto_out_aw_bits_qos; 
  wire [12:0] indexer_auto_out_aw_bits_user; 
  wire  indexer_auto_out_w_ready; 
  wire  indexer_auto_out_w_valid; 
  wire [63:0] indexer_auto_out_w_bits_data; 
  wire [7:0] indexer_auto_out_w_bits_strb; 
  wire  indexer_auto_out_w_bits_last; 
  wire  indexer_auto_out_b_ready; 
  wire  indexer_auto_out_b_valid; 
  wire [3:0] indexer_auto_out_b_bits_id; 
  wire [1:0] indexer_auto_out_b_bits_resp; 
  wire [12:0] indexer_auto_out_b_bits_user; 
  wire  indexer_auto_out_ar_ready; 
  wire  indexer_auto_out_ar_valid; 
  wire [3:0] indexer_auto_out_ar_bits_id; 
  wire [31:0] indexer_auto_out_ar_bits_addr; 
  wire [7:0] indexer_auto_out_ar_bits_len; 
  wire [2:0] indexer_auto_out_ar_bits_size; 
  wire [1:0] indexer_auto_out_ar_bits_burst; 
  wire  indexer_auto_out_ar_bits_lock; 
  wire [3:0] indexer_auto_out_ar_bits_cache; 
  wire [2:0] indexer_auto_out_ar_bits_prot; 
  wire [3:0] indexer_auto_out_ar_bits_qos; 
  wire [12:0] indexer_auto_out_ar_bits_user; 
  wire  indexer_auto_out_r_ready; 
  wire  indexer_auto_out_r_valid; 
  wire [3:0] indexer_auto_out_r_bits_id; 
  wire [63:0] indexer_auto_out_r_bits_data; 
  wire [1:0] indexer_auto_out_r_bits_resp; 
  wire [12:0] indexer_auto_out_r_bits_user; 
  wire  indexer_auto_out_r_bits_last; 
  wire  deint_clock; 
  wire  deint_reset; 
  wire  deint_auto_in_aw_ready; 
  wire  deint_auto_in_aw_valid; 
  wire [3:0] deint_auto_in_aw_bits_id; 
  wire [31:0] deint_auto_in_aw_bits_addr; 
  wire [7:0] deint_auto_in_aw_bits_len; 
  wire [2:0] deint_auto_in_aw_bits_size; 
  wire [1:0] deint_auto_in_aw_bits_burst; 
  wire  deint_auto_in_aw_bits_lock; 
  wire [3:0] deint_auto_in_aw_bits_cache; 
  wire [2:0] deint_auto_in_aw_bits_prot; 
  wire [3:0] deint_auto_in_aw_bits_qos; 
  wire [12:0] deint_auto_in_aw_bits_user; 
  wire  deint_auto_in_w_ready; 
  wire  deint_auto_in_w_valid; 
  wire [63:0] deint_auto_in_w_bits_data; 
  wire [7:0] deint_auto_in_w_bits_strb; 
  wire  deint_auto_in_w_bits_last; 
  wire  deint_auto_in_b_ready; 
  wire  deint_auto_in_b_valid; 
  wire [3:0] deint_auto_in_b_bits_id; 
  wire [1:0] deint_auto_in_b_bits_resp; 
  wire [12:0] deint_auto_in_b_bits_user; 
  wire  deint_auto_in_ar_ready; 
  wire  deint_auto_in_ar_valid; 
  wire [3:0] deint_auto_in_ar_bits_id; 
  wire [31:0] deint_auto_in_ar_bits_addr; 
  wire [7:0] deint_auto_in_ar_bits_len; 
  wire [2:0] deint_auto_in_ar_bits_size; 
  wire [1:0] deint_auto_in_ar_bits_burst; 
  wire  deint_auto_in_ar_bits_lock; 
  wire [3:0] deint_auto_in_ar_bits_cache; 
  wire [2:0] deint_auto_in_ar_bits_prot; 
  wire [3:0] deint_auto_in_ar_bits_qos; 
  wire [12:0] deint_auto_in_ar_bits_user; 
  wire  deint_auto_in_r_ready; 
  wire  deint_auto_in_r_valid; 
  wire [3:0] deint_auto_in_r_bits_id; 
  wire [63:0] deint_auto_in_r_bits_data; 
  wire [1:0] deint_auto_in_r_bits_resp; 
  wire [12:0] deint_auto_in_r_bits_user; 
  wire  deint_auto_in_r_bits_last; 
  wire  deint_auto_out_aw_ready; 
  wire  deint_auto_out_aw_valid; 
  wire [3:0] deint_auto_out_aw_bits_id; 
  wire [31:0] deint_auto_out_aw_bits_addr; 
  wire [7:0] deint_auto_out_aw_bits_len; 
  wire [2:0] deint_auto_out_aw_bits_size; 
  wire [1:0] deint_auto_out_aw_bits_burst; 
  wire  deint_auto_out_aw_bits_lock; 
  wire [3:0] deint_auto_out_aw_bits_cache; 
  wire [2:0] deint_auto_out_aw_bits_prot; 
  wire [3:0] deint_auto_out_aw_bits_qos; 
  wire [12:0] deint_auto_out_aw_bits_user; 
  wire  deint_auto_out_w_ready; 
  wire  deint_auto_out_w_valid; 
  wire [63:0] deint_auto_out_w_bits_data; 
  wire [7:0] deint_auto_out_w_bits_strb; 
  wire  deint_auto_out_w_bits_last; 
  wire  deint_auto_out_b_ready; 
  wire  deint_auto_out_b_valid; 
  wire [3:0] deint_auto_out_b_bits_id; 
  wire [1:0] deint_auto_out_b_bits_resp; 
  wire [12:0] deint_auto_out_b_bits_user; 
  wire  deint_auto_out_ar_ready; 
  wire  deint_auto_out_ar_valid; 
  wire [3:0] deint_auto_out_ar_bits_id; 
  wire [31:0] deint_auto_out_ar_bits_addr; 
  wire [7:0] deint_auto_out_ar_bits_len; 
  wire [2:0] deint_auto_out_ar_bits_size; 
  wire [1:0] deint_auto_out_ar_bits_burst; 
  wire  deint_auto_out_ar_bits_lock; 
  wire [3:0] deint_auto_out_ar_bits_cache; 
  wire [2:0] deint_auto_out_ar_bits_prot; 
  wire [3:0] deint_auto_out_ar_bits_qos; 
  wire [12:0] deint_auto_out_ar_bits_user; 
  wire  deint_auto_out_r_ready; 
  wire  deint_auto_out_r_valid; 
  wire [3:0] deint_auto_out_r_bits_id; 
  wire [63:0] deint_auto_out_r_bits_data; 
  wire [1:0] deint_auto_out_r_bits_resp; 
  wire [12:0] deint_auto_out_r_bits_user; 
  wire  deint_auto_out_r_bits_last; 
  wire  yank_clock; 
  wire  yank_reset; 
  wire  yank_auto_in_aw_ready; 
  wire  yank_auto_in_aw_valid; 
  wire [3:0] yank_auto_in_aw_bits_id; 
  wire [31:0] yank_auto_in_aw_bits_addr; 
  wire [7:0] yank_auto_in_aw_bits_len; 
  wire [2:0] yank_auto_in_aw_bits_size; 
  wire [1:0] yank_auto_in_aw_bits_burst; 
  wire  yank_auto_in_aw_bits_lock; 
  wire [3:0] yank_auto_in_aw_bits_cache; 
  wire [2:0] yank_auto_in_aw_bits_prot; 
  wire [3:0] yank_auto_in_aw_bits_qos; 
  wire [12:0] yank_auto_in_aw_bits_user; 
  wire  yank_auto_in_w_ready; 
  wire  yank_auto_in_w_valid; 
  wire [63:0] yank_auto_in_w_bits_data; 
  wire [7:0] yank_auto_in_w_bits_strb; 
  wire  yank_auto_in_w_bits_last; 
  wire  yank_auto_in_b_ready; 
  wire  yank_auto_in_b_valid; 
  wire [3:0] yank_auto_in_b_bits_id; 
  wire [1:0] yank_auto_in_b_bits_resp; 
  wire [12:0] yank_auto_in_b_bits_user; 
  wire  yank_auto_in_ar_ready; 
  wire  yank_auto_in_ar_valid; 
  wire [3:0] yank_auto_in_ar_bits_id; 
  wire [31:0] yank_auto_in_ar_bits_addr; 
  wire [7:0] yank_auto_in_ar_bits_len; 
  wire [2:0] yank_auto_in_ar_bits_size; 
  wire [1:0] yank_auto_in_ar_bits_burst; 
  wire  yank_auto_in_ar_bits_lock; 
  wire [3:0] yank_auto_in_ar_bits_cache; 
  wire [2:0] yank_auto_in_ar_bits_prot; 
  wire [3:0] yank_auto_in_ar_bits_qos; 
  wire [12:0] yank_auto_in_ar_bits_user; 
  wire  yank_auto_in_r_ready; 
  wire  yank_auto_in_r_valid; 
  wire [3:0] yank_auto_in_r_bits_id; 
  wire [63:0] yank_auto_in_r_bits_data; 
  wire [1:0] yank_auto_in_r_bits_resp; 
  wire [12:0] yank_auto_in_r_bits_user; 
  wire  yank_auto_in_r_bits_last; 
  wire  yank_auto_out_aw_ready; 
  wire  yank_auto_out_aw_valid; 
  wire [3:0] yank_auto_out_aw_bits_id; 
  wire [31:0] yank_auto_out_aw_bits_addr; 
  wire [7:0] yank_auto_out_aw_bits_len; 
  wire [2:0] yank_auto_out_aw_bits_size; 
  wire [1:0] yank_auto_out_aw_bits_burst; 
  wire  yank_auto_out_aw_bits_lock; 
  wire [3:0] yank_auto_out_aw_bits_cache; 
  wire [2:0] yank_auto_out_aw_bits_prot; 
  wire [3:0] yank_auto_out_aw_bits_qos; 
  wire  yank_auto_out_w_ready; 
  wire  yank_auto_out_w_valid; 
  wire [63:0] yank_auto_out_w_bits_data; 
  wire [7:0] yank_auto_out_w_bits_strb; 
  wire  yank_auto_out_w_bits_last; 
  wire  yank_auto_out_b_ready; 
  wire  yank_auto_out_b_valid; 
  wire [3:0] yank_auto_out_b_bits_id; 
  wire [1:0] yank_auto_out_b_bits_resp; 
  wire  yank_auto_out_ar_ready; 
  wire  yank_auto_out_ar_valid; 
  wire [3:0] yank_auto_out_ar_bits_id; 
  wire [31:0] yank_auto_out_ar_bits_addr; 
  wire [7:0] yank_auto_out_ar_bits_len; 
  wire [2:0] yank_auto_out_ar_bits_size; 
  wire [1:0] yank_auto_out_ar_bits_burst; 
  wire  yank_auto_out_ar_bits_lock; 
  wire [3:0] yank_auto_out_ar_bits_cache; 
  wire [2:0] yank_auto_out_ar_bits_prot; 
  wire [3:0] yank_auto_out_ar_bits_qos; 
  wire  yank_auto_out_r_ready; 
  wire  yank_auto_out_r_valid; 
  wire [3:0] yank_auto_out_r_bits_id; 
  wire [63:0] yank_auto_out_r_bits_data; 
  wire [1:0] yank_auto_out_r_bits_resp; 
  wire  yank_auto_out_r_bits_last; 
  wire [3:0] island_auto_axi4in_xing_in_aw_mem_0_id; 
  wire [31:0] island_auto_axi4in_xing_in_aw_mem_0_addr; 
  wire [7:0] island_auto_axi4in_xing_in_aw_mem_0_len; 
  wire [2:0] island_auto_axi4in_xing_in_aw_mem_0_size; 
  wire [1:0] island_auto_axi4in_xing_in_aw_mem_0_burst; 
  wire  island_auto_axi4in_xing_in_aw_mem_0_lock; 
  wire [3:0] island_auto_axi4in_xing_in_aw_mem_0_cache; 
  wire [2:0] island_auto_axi4in_xing_in_aw_mem_0_prot; 
  wire [3:0] island_auto_axi4in_xing_in_aw_mem_0_qos; 
  wire [3:0] island_auto_axi4in_xing_in_aw_mem_1_id; 
  wire [31:0] island_auto_axi4in_xing_in_aw_mem_1_addr; 
  wire [7:0] island_auto_axi4in_xing_in_aw_mem_1_len; 
  wire [2:0] island_auto_axi4in_xing_in_aw_mem_1_size; 
  wire [1:0] island_auto_axi4in_xing_in_aw_mem_1_burst; 
  wire  island_auto_axi4in_xing_in_aw_mem_1_lock; 
  wire [3:0] island_auto_axi4in_xing_in_aw_mem_1_cache; 
  wire [2:0] island_auto_axi4in_xing_in_aw_mem_1_prot; 
  wire [3:0] island_auto_axi4in_xing_in_aw_mem_1_qos; 
  wire [3:0] island_auto_axi4in_xing_in_aw_mem_2_id; 
  wire [31:0] island_auto_axi4in_xing_in_aw_mem_2_addr; 
  wire [7:0] island_auto_axi4in_xing_in_aw_mem_2_len; 
  wire [2:0] island_auto_axi4in_xing_in_aw_mem_2_size; 
  wire [1:0] island_auto_axi4in_xing_in_aw_mem_2_burst; 
  wire  island_auto_axi4in_xing_in_aw_mem_2_lock; 
  wire [3:0] island_auto_axi4in_xing_in_aw_mem_2_cache; 
  wire [2:0] island_auto_axi4in_xing_in_aw_mem_2_prot; 
  wire [3:0] island_auto_axi4in_xing_in_aw_mem_2_qos; 
  wire [3:0] island_auto_axi4in_xing_in_aw_mem_3_id; 
  wire [31:0] island_auto_axi4in_xing_in_aw_mem_3_addr; 
  wire [7:0] island_auto_axi4in_xing_in_aw_mem_3_len; 
  wire [2:0] island_auto_axi4in_xing_in_aw_mem_3_size; 
  wire [1:0] island_auto_axi4in_xing_in_aw_mem_3_burst; 
  wire  island_auto_axi4in_xing_in_aw_mem_3_lock; 
  wire [3:0] island_auto_axi4in_xing_in_aw_mem_3_cache; 
  wire [2:0] island_auto_axi4in_xing_in_aw_mem_3_prot; 
  wire [3:0] island_auto_axi4in_xing_in_aw_mem_3_qos; 
  wire [3:0] island_auto_axi4in_xing_in_aw_mem_4_id; 
  wire [31:0] island_auto_axi4in_xing_in_aw_mem_4_addr; 
  wire [7:0] island_auto_axi4in_xing_in_aw_mem_4_len; 
  wire [2:0] island_auto_axi4in_xing_in_aw_mem_4_size; 
  wire [1:0] island_auto_axi4in_xing_in_aw_mem_4_burst; 
  wire  island_auto_axi4in_xing_in_aw_mem_4_lock; 
  wire [3:0] island_auto_axi4in_xing_in_aw_mem_4_cache; 
  wire [2:0] island_auto_axi4in_xing_in_aw_mem_4_prot; 
  wire [3:0] island_auto_axi4in_xing_in_aw_mem_4_qos; 
  wire [3:0] island_auto_axi4in_xing_in_aw_mem_5_id; 
  wire [31:0] island_auto_axi4in_xing_in_aw_mem_5_addr; 
  wire [7:0] island_auto_axi4in_xing_in_aw_mem_5_len; 
  wire [2:0] island_auto_axi4in_xing_in_aw_mem_5_size; 
  wire [1:0] island_auto_axi4in_xing_in_aw_mem_5_burst; 
  wire  island_auto_axi4in_xing_in_aw_mem_5_lock; 
  wire [3:0] island_auto_axi4in_xing_in_aw_mem_5_cache; 
  wire [2:0] island_auto_axi4in_xing_in_aw_mem_5_prot; 
  wire [3:0] island_auto_axi4in_xing_in_aw_mem_5_qos; 
  wire [3:0] island_auto_axi4in_xing_in_aw_mem_6_id; 
  wire [31:0] island_auto_axi4in_xing_in_aw_mem_6_addr; 
  wire [7:0] island_auto_axi4in_xing_in_aw_mem_6_len; 
  wire [2:0] island_auto_axi4in_xing_in_aw_mem_6_size; 
  wire [1:0] island_auto_axi4in_xing_in_aw_mem_6_burst; 
  wire  island_auto_axi4in_xing_in_aw_mem_6_lock; 
  wire [3:0] island_auto_axi4in_xing_in_aw_mem_6_cache; 
  wire [2:0] island_auto_axi4in_xing_in_aw_mem_6_prot; 
  wire [3:0] island_auto_axi4in_xing_in_aw_mem_6_qos; 
  wire [3:0] island_auto_axi4in_xing_in_aw_mem_7_id; 
  wire [31:0] island_auto_axi4in_xing_in_aw_mem_7_addr; 
  wire [7:0] island_auto_axi4in_xing_in_aw_mem_7_len; 
  wire [2:0] island_auto_axi4in_xing_in_aw_mem_7_size; 
  wire [1:0] island_auto_axi4in_xing_in_aw_mem_7_burst; 
  wire  island_auto_axi4in_xing_in_aw_mem_7_lock; 
  wire [3:0] island_auto_axi4in_xing_in_aw_mem_7_cache; 
  wire [2:0] island_auto_axi4in_xing_in_aw_mem_7_prot; 
  wire [3:0] island_auto_axi4in_xing_in_aw_mem_7_qos; 
  wire [3:0] island_auto_axi4in_xing_in_aw_ridx; 
  wire [3:0] island_auto_axi4in_xing_in_aw_widx; 
  wire  island_auto_axi4in_xing_in_aw_safe_ridx_valid; 
  wire  island_auto_axi4in_xing_in_aw_safe_widx_valid; 
  wire  island_auto_axi4in_xing_in_aw_safe_source_reset_n; 
  wire  island_auto_axi4in_xing_in_aw_safe_sink_reset_n; 
  wire [63:0] island_auto_axi4in_xing_in_w_mem_0_data; 
  wire [7:0] island_auto_axi4in_xing_in_w_mem_0_strb; 
  wire  island_auto_axi4in_xing_in_w_mem_0_last; 
  wire [63:0] island_auto_axi4in_xing_in_w_mem_1_data; 
  wire [7:0] island_auto_axi4in_xing_in_w_mem_1_strb; 
  wire  island_auto_axi4in_xing_in_w_mem_1_last; 
  wire [63:0] island_auto_axi4in_xing_in_w_mem_2_data; 
  wire [7:0] island_auto_axi4in_xing_in_w_mem_2_strb; 
  wire  island_auto_axi4in_xing_in_w_mem_2_last; 
  wire [63:0] island_auto_axi4in_xing_in_w_mem_3_data; 
  wire [7:0] island_auto_axi4in_xing_in_w_mem_3_strb; 
  wire  island_auto_axi4in_xing_in_w_mem_3_last; 
  wire [63:0] island_auto_axi4in_xing_in_w_mem_4_data; 
  wire [7:0] island_auto_axi4in_xing_in_w_mem_4_strb; 
  wire  island_auto_axi4in_xing_in_w_mem_4_last; 
  wire [63:0] island_auto_axi4in_xing_in_w_mem_5_data; 
  wire [7:0] island_auto_axi4in_xing_in_w_mem_5_strb; 
  wire  island_auto_axi4in_xing_in_w_mem_5_last; 
  wire [63:0] island_auto_axi4in_xing_in_w_mem_6_data; 
  wire [7:0] island_auto_axi4in_xing_in_w_mem_6_strb; 
  wire  island_auto_axi4in_xing_in_w_mem_6_last; 
  wire [63:0] island_auto_axi4in_xing_in_w_mem_7_data; 
  wire [7:0] island_auto_axi4in_xing_in_w_mem_7_strb; 
  wire  island_auto_axi4in_xing_in_w_mem_7_last; 
  wire [3:0] island_auto_axi4in_xing_in_w_ridx; 
  wire [3:0] island_auto_axi4in_xing_in_w_widx; 
  wire  island_auto_axi4in_xing_in_w_safe_ridx_valid; 
  wire  island_auto_axi4in_xing_in_w_safe_widx_valid; 
  wire  island_auto_axi4in_xing_in_w_safe_source_reset_n; 
  wire  island_auto_axi4in_xing_in_w_safe_sink_reset_n; 
  wire [3:0] island_auto_axi4in_xing_in_b_mem_0_id; 
  wire [1:0] island_auto_axi4in_xing_in_b_mem_0_resp; 
  wire [3:0] island_auto_axi4in_xing_in_b_mem_1_id; 
  wire [1:0] island_auto_axi4in_xing_in_b_mem_1_resp; 
  wire [3:0] island_auto_axi4in_xing_in_b_mem_2_id; 
  wire [1:0] island_auto_axi4in_xing_in_b_mem_2_resp; 
  wire [3:0] island_auto_axi4in_xing_in_b_mem_3_id; 
  wire [1:0] island_auto_axi4in_xing_in_b_mem_3_resp; 
  wire [3:0] island_auto_axi4in_xing_in_b_mem_4_id; 
  wire [1:0] island_auto_axi4in_xing_in_b_mem_4_resp; 
  wire [3:0] island_auto_axi4in_xing_in_b_mem_5_id; 
  wire [1:0] island_auto_axi4in_xing_in_b_mem_5_resp; 
  wire [3:0] island_auto_axi4in_xing_in_b_mem_6_id; 
  wire [1:0] island_auto_axi4in_xing_in_b_mem_6_resp; 
  wire [3:0] island_auto_axi4in_xing_in_b_mem_7_id; 
  wire [1:0] island_auto_axi4in_xing_in_b_mem_7_resp; 
  wire [3:0] island_auto_axi4in_xing_in_b_ridx; 
  wire [3:0] island_auto_axi4in_xing_in_b_widx; 
  wire  island_auto_axi4in_xing_in_b_safe_ridx_valid; 
  wire  island_auto_axi4in_xing_in_b_safe_widx_valid; 
  wire  island_auto_axi4in_xing_in_b_safe_source_reset_n; 
  wire  island_auto_axi4in_xing_in_b_safe_sink_reset_n; 
  wire [3:0] island_auto_axi4in_xing_in_ar_mem_0_id; 
  wire [31:0] island_auto_axi4in_xing_in_ar_mem_0_addr; 
  wire [7:0] island_auto_axi4in_xing_in_ar_mem_0_len; 
  wire [2:0] island_auto_axi4in_xing_in_ar_mem_0_size; 
  wire [1:0] island_auto_axi4in_xing_in_ar_mem_0_burst; 
  wire  island_auto_axi4in_xing_in_ar_mem_0_lock; 
  wire [3:0] island_auto_axi4in_xing_in_ar_mem_0_cache; 
  wire [2:0] island_auto_axi4in_xing_in_ar_mem_0_prot; 
  wire [3:0] island_auto_axi4in_xing_in_ar_mem_0_qos; 
  wire [3:0] island_auto_axi4in_xing_in_ar_mem_1_id; 
  wire [31:0] island_auto_axi4in_xing_in_ar_mem_1_addr; 
  wire [7:0] island_auto_axi4in_xing_in_ar_mem_1_len; 
  wire [2:0] island_auto_axi4in_xing_in_ar_mem_1_size; 
  wire [1:0] island_auto_axi4in_xing_in_ar_mem_1_burst; 
  wire  island_auto_axi4in_xing_in_ar_mem_1_lock; 
  wire [3:0] island_auto_axi4in_xing_in_ar_mem_1_cache; 
  wire [2:0] island_auto_axi4in_xing_in_ar_mem_1_prot; 
  wire [3:0] island_auto_axi4in_xing_in_ar_mem_1_qos; 
  wire [3:0] island_auto_axi4in_xing_in_ar_mem_2_id; 
  wire [31:0] island_auto_axi4in_xing_in_ar_mem_2_addr; 
  wire [7:0] island_auto_axi4in_xing_in_ar_mem_2_len; 
  wire [2:0] island_auto_axi4in_xing_in_ar_mem_2_size; 
  wire [1:0] island_auto_axi4in_xing_in_ar_mem_2_burst; 
  wire  island_auto_axi4in_xing_in_ar_mem_2_lock; 
  wire [3:0] island_auto_axi4in_xing_in_ar_mem_2_cache; 
  wire [2:0] island_auto_axi4in_xing_in_ar_mem_2_prot; 
  wire [3:0] island_auto_axi4in_xing_in_ar_mem_2_qos; 
  wire [3:0] island_auto_axi4in_xing_in_ar_mem_3_id; 
  wire [31:0] island_auto_axi4in_xing_in_ar_mem_3_addr; 
  wire [7:0] island_auto_axi4in_xing_in_ar_mem_3_len; 
  wire [2:0] island_auto_axi4in_xing_in_ar_mem_3_size; 
  wire [1:0] island_auto_axi4in_xing_in_ar_mem_3_burst; 
  wire  island_auto_axi4in_xing_in_ar_mem_3_lock; 
  wire [3:0] island_auto_axi4in_xing_in_ar_mem_3_cache; 
  wire [2:0] island_auto_axi4in_xing_in_ar_mem_3_prot; 
  wire [3:0] island_auto_axi4in_xing_in_ar_mem_3_qos; 
  wire [3:0] island_auto_axi4in_xing_in_ar_mem_4_id; 
  wire [31:0] island_auto_axi4in_xing_in_ar_mem_4_addr; 
  wire [7:0] island_auto_axi4in_xing_in_ar_mem_4_len; 
  wire [2:0] island_auto_axi4in_xing_in_ar_mem_4_size; 
  wire [1:0] island_auto_axi4in_xing_in_ar_mem_4_burst; 
  wire  island_auto_axi4in_xing_in_ar_mem_4_lock; 
  wire [3:0] island_auto_axi4in_xing_in_ar_mem_4_cache; 
  wire [2:0] island_auto_axi4in_xing_in_ar_mem_4_prot; 
  wire [3:0] island_auto_axi4in_xing_in_ar_mem_4_qos; 
  wire [3:0] island_auto_axi4in_xing_in_ar_mem_5_id; 
  wire [31:0] island_auto_axi4in_xing_in_ar_mem_5_addr; 
  wire [7:0] island_auto_axi4in_xing_in_ar_mem_5_len; 
  wire [2:0] island_auto_axi4in_xing_in_ar_mem_5_size; 
  wire [1:0] island_auto_axi4in_xing_in_ar_mem_5_burst; 
  wire  island_auto_axi4in_xing_in_ar_mem_5_lock; 
  wire [3:0] island_auto_axi4in_xing_in_ar_mem_5_cache; 
  wire [2:0] island_auto_axi4in_xing_in_ar_mem_5_prot; 
  wire [3:0] island_auto_axi4in_xing_in_ar_mem_5_qos; 
  wire [3:0] island_auto_axi4in_xing_in_ar_mem_6_id; 
  wire [31:0] island_auto_axi4in_xing_in_ar_mem_6_addr; 
  wire [7:0] island_auto_axi4in_xing_in_ar_mem_6_len; 
  wire [2:0] island_auto_axi4in_xing_in_ar_mem_6_size; 
  wire [1:0] island_auto_axi4in_xing_in_ar_mem_6_burst; 
  wire  island_auto_axi4in_xing_in_ar_mem_6_lock; 
  wire [3:0] island_auto_axi4in_xing_in_ar_mem_6_cache; 
  wire [2:0] island_auto_axi4in_xing_in_ar_mem_6_prot; 
  wire [3:0] island_auto_axi4in_xing_in_ar_mem_6_qos; 
  wire [3:0] island_auto_axi4in_xing_in_ar_mem_7_id; 
  wire [31:0] island_auto_axi4in_xing_in_ar_mem_7_addr; 
  wire [7:0] island_auto_axi4in_xing_in_ar_mem_7_len; 
  wire [2:0] island_auto_axi4in_xing_in_ar_mem_7_size; 
  wire [1:0] island_auto_axi4in_xing_in_ar_mem_7_burst; 
  wire  island_auto_axi4in_xing_in_ar_mem_7_lock; 
  wire [3:0] island_auto_axi4in_xing_in_ar_mem_7_cache; 
  wire [2:0] island_auto_axi4in_xing_in_ar_mem_7_prot; 
  wire [3:0] island_auto_axi4in_xing_in_ar_mem_7_qos; 
  wire [3:0] island_auto_axi4in_xing_in_ar_ridx; 
  wire [3:0] island_auto_axi4in_xing_in_ar_widx; 
  wire  island_auto_axi4in_xing_in_ar_safe_ridx_valid; 
  wire  island_auto_axi4in_xing_in_ar_safe_widx_valid; 
  wire  island_auto_axi4in_xing_in_ar_safe_source_reset_n; 
  wire  island_auto_axi4in_xing_in_ar_safe_sink_reset_n; 
  wire [3:0] island_auto_axi4in_xing_in_r_mem_0_id; 
  wire [63:0] island_auto_axi4in_xing_in_r_mem_0_data; 
  wire [1:0] island_auto_axi4in_xing_in_r_mem_0_resp; 
  wire  island_auto_axi4in_xing_in_r_mem_0_last; 
  wire [3:0] island_auto_axi4in_xing_in_r_mem_1_id; 
  wire [63:0] island_auto_axi4in_xing_in_r_mem_1_data; 
  wire [1:0] island_auto_axi4in_xing_in_r_mem_1_resp; 
  wire  island_auto_axi4in_xing_in_r_mem_1_last; 
  wire [3:0] island_auto_axi4in_xing_in_r_mem_2_id; 
  wire [63:0] island_auto_axi4in_xing_in_r_mem_2_data; 
  wire [1:0] island_auto_axi4in_xing_in_r_mem_2_resp; 
  wire  island_auto_axi4in_xing_in_r_mem_2_last; 
  wire [3:0] island_auto_axi4in_xing_in_r_mem_3_id; 
  wire [63:0] island_auto_axi4in_xing_in_r_mem_3_data; 
  wire [1:0] island_auto_axi4in_xing_in_r_mem_3_resp; 
  wire  island_auto_axi4in_xing_in_r_mem_3_last; 
  wire [3:0] island_auto_axi4in_xing_in_r_mem_4_id; 
  wire [63:0] island_auto_axi4in_xing_in_r_mem_4_data; 
  wire [1:0] island_auto_axi4in_xing_in_r_mem_4_resp; 
  wire  island_auto_axi4in_xing_in_r_mem_4_last; 
  wire [3:0] island_auto_axi4in_xing_in_r_mem_5_id; 
  wire [63:0] island_auto_axi4in_xing_in_r_mem_5_data; 
  wire [1:0] island_auto_axi4in_xing_in_r_mem_5_resp; 
  wire  island_auto_axi4in_xing_in_r_mem_5_last; 
  wire [3:0] island_auto_axi4in_xing_in_r_mem_6_id; 
  wire [63:0] island_auto_axi4in_xing_in_r_mem_6_data; 
  wire [1:0] island_auto_axi4in_xing_in_r_mem_6_resp; 
  wire  island_auto_axi4in_xing_in_r_mem_6_last; 
  wire [3:0] island_auto_axi4in_xing_in_r_mem_7_id; 
  wire [63:0] island_auto_axi4in_xing_in_r_mem_7_data; 
  wire [1:0] island_auto_axi4in_xing_in_r_mem_7_resp; 
  wire  island_auto_axi4in_xing_in_r_mem_7_last; 
  wire [3:0] island_auto_axi4in_xing_in_r_ridx; 
  wire [3:0] island_auto_axi4in_xing_in_r_widx; 
  wire  island_auto_axi4in_xing_in_r_safe_ridx_valid; 
  wire  island_auto_axi4in_xing_in_r_safe_widx_valid; 
  wire  island_auto_axi4in_xing_in_r_safe_source_reset_n; 
  wire  island_auto_axi4in_xing_in_r_safe_sink_reset_n; 
  wire [13:0] island_io_port_ddr3_addr; 
  wire [2:0] island_io_port_ddr3_ba; 
  wire  island_io_port_ddr3_ras_n; 
  wire  island_io_port_ddr3_cas_n; 
  wire  island_io_port_ddr3_we_n; 
  wire  island_io_port_ddr3_reset_n; 
  wire  island_io_port_ddr3_ck_p; 
  wire  island_io_port_ddr3_ck_n; 
  wire  island_io_port_ddr3_cke; 
  wire  island_io_port_ddr3_cs_n; 
  wire [7:0] island_io_port_ddr3_dm; 
  wire  island_io_port_ddr3_odt; 
  wire  island_io_port_sys_clk_i; 
  wire  island_io_port_ui_clk; 
  wire  island_io_port_ui_clk_sync_rst; 
  wire  island_io_port_mmcm_locked; 
  wire  island_io_port_aresetn; 
  wire  island_io_port_sys_rst; 
  wire  axi4asource_clock; 
  wire  axi4asource_reset; 
  wire  axi4asource_auto_in_aw_ready; 
  wire  axi4asource_auto_in_aw_valid; 
  wire [3:0] axi4asource_auto_in_aw_bits_id; 
  wire [31:0] axi4asource_auto_in_aw_bits_addr; 
  wire [7:0] axi4asource_auto_in_aw_bits_len; 
  wire [2:0] axi4asource_auto_in_aw_bits_size; 
  wire [1:0] axi4asource_auto_in_aw_bits_burst; 
  wire  axi4asource_auto_in_aw_bits_lock; 
  wire [3:0] axi4asource_auto_in_aw_bits_cache; 
  wire [2:0] axi4asource_auto_in_aw_bits_prot; 
  wire [3:0] axi4asource_auto_in_aw_bits_qos; 
  wire  axi4asource_auto_in_w_ready; 
  wire  axi4asource_auto_in_w_valid; 
  wire [63:0] axi4asource_auto_in_w_bits_data; 
  wire [7:0] axi4asource_auto_in_w_bits_strb; 
  wire  axi4asource_auto_in_w_bits_last; 
  wire  axi4asource_auto_in_b_ready; 
  wire  axi4asource_auto_in_b_valid; 
  wire [3:0] axi4asource_auto_in_b_bits_id; 
  wire [1:0] axi4asource_auto_in_b_bits_resp; 
  wire  axi4asource_auto_in_ar_ready; 
  wire  axi4asource_auto_in_ar_valid; 
  wire [3:0] axi4asource_auto_in_ar_bits_id; 
  wire [31:0] axi4asource_auto_in_ar_bits_addr; 
  wire [7:0] axi4asource_auto_in_ar_bits_len; 
  wire [2:0] axi4asource_auto_in_ar_bits_size; 
  wire [1:0] axi4asource_auto_in_ar_bits_burst; 
  wire  axi4asource_auto_in_ar_bits_lock; 
  wire [3:0] axi4asource_auto_in_ar_bits_cache; 
  wire [2:0] axi4asource_auto_in_ar_bits_prot; 
  wire [3:0] axi4asource_auto_in_ar_bits_qos; 
  wire  axi4asource_auto_in_r_ready; 
  wire  axi4asource_auto_in_r_valid; 
  wire [3:0] axi4asource_auto_in_r_bits_id; 
  wire [63:0] axi4asource_auto_in_r_bits_data; 
  wire [1:0] axi4asource_auto_in_r_bits_resp; 
  wire  axi4asource_auto_in_r_bits_last; 
  wire [3:0] axi4asource_auto_out_aw_mem_0_id; 
  wire [31:0] axi4asource_auto_out_aw_mem_0_addr; 
  wire [7:0] axi4asource_auto_out_aw_mem_0_len; 
  wire [2:0] axi4asource_auto_out_aw_mem_0_size; 
  wire [1:0] axi4asource_auto_out_aw_mem_0_burst; 
  wire  axi4asource_auto_out_aw_mem_0_lock; 
  wire [3:0] axi4asource_auto_out_aw_mem_0_cache; 
  wire [2:0] axi4asource_auto_out_aw_mem_0_prot; 
  wire [3:0] axi4asource_auto_out_aw_mem_0_qos; 
  wire [3:0] axi4asource_auto_out_aw_mem_1_id; 
  wire [31:0] axi4asource_auto_out_aw_mem_1_addr; 
  wire [7:0] axi4asource_auto_out_aw_mem_1_len; 
  wire [2:0] axi4asource_auto_out_aw_mem_1_size; 
  wire [1:0] axi4asource_auto_out_aw_mem_1_burst; 
  wire  axi4asource_auto_out_aw_mem_1_lock; 
  wire [3:0] axi4asource_auto_out_aw_mem_1_cache; 
  wire [2:0] axi4asource_auto_out_aw_mem_1_prot; 
  wire [3:0] axi4asource_auto_out_aw_mem_1_qos; 
  wire [3:0] axi4asource_auto_out_aw_mem_2_id; 
  wire [31:0] axi4asource_auto_out_aw_mem_2_addr; 
  wire [7:0] axi4asource_auto_out_aw_mem_2_len; 
  wire [2:0] axi4asource_auto_out_aw_mem_2_size; 
  wire [1:0] axi4asource_auto_out_aw_mem_2_burst; 
  wire  axi4asource_auto_out_aw_mem_2_lock; 
  wire [3:0] axi4asource_auto_out_aw_mem_2_cache; 
  wire [2:0] axi4asource_auto_out_aw_mem_2_prot; 
  wire [3:0] axi4asource_auto_out_aw_mem_2_qos; 
  wire [3:0] axi4asource_auto_out_aw_mem_3_id; 
  wire [31:0] axi4asource_auto_out_aw_mem_3_addr; 
  wire [7:0] axi4asource_auto_out_aw_mem_3_len; 
  wire [2:0] axi4asource_auto_out_aw_mem_3_size; 
  wire [1:0] axi4asource_auto_out_aw_mem_3_burst; 
  wire  axi4asource_auto_out_aw_mem_3_lock; 
  wire [3:0] axi4asource_auto_out_aw_mem_3_cache; 
  wire [2:0] axi4asource_auto_out_aw_mem_3_prot; 
  wire [3:0] axi4asource_auto_out_aw_mem_3_qos; 
  wire [3:0] axi4asource_auto_out_aw_mem_4_id; 
  wire [31:0] axi4asource_auto_out_aw_mem_4_addr; 
  wire [7:0] axi4asource_auto_out_aw_mem_4_len; 
  wire [2:0] axi4asource_auto_out_aw_mem_4_size; 
  wire [1:0] axi4asource_auto_out_aw_mem_4_burst; 
  wire  axi4asource_auto_out_aw_mem_4_lock; 
  wire [3:0] axi4asource_auto_out_aw_mem_4_cache; 
  wire [2:0] axi4asource_auto_out_aw_mem_4_prot; 
  wire [3:0] axi4asource_auto_out_aw_mem_4_qos; 
  wire [3:0] axi4asource_auto_out_aw_mem_5_id; 
  wire [31:0] axi4asource_auto_out_aw_mem_5_addr; 
  wire [7:0] axi4asource_auto_out_aw_mem_5_len; 
  wire [2:0] axi4asource_auto_out_aw_mem_5_size; 
  wire [1:0] axi4asource_auto_out_aw_mem_5_burst; 
  wire  axi4asource_auto_out_aw_mem_5_lock; 
  wire [3:0] axi4asource_auto_out_aw_mem_5_cache; 
  wire [2:0] axi4asource_auto_out_aw_mem_5_prot; 
  wire [3:0] axi4asource_auto_out_aw_mem_5_qos; 
  wire [3:0] axi4asource_auto_out_aw_mem_6_id; 
  wire [31:0] axi4asource_auto_out_aw_mem_6_addr; 
  wire [7:0] axi4asource_auto_out_aw_mem_6_len; 
  wire [2:0] axi4asource_auto_out_aw_mem_6_size; 
  wire [1:0] axi4asource_auto_out_aw_mem_6_burst; 
  wire  axi4asource_auto_out_aw_mem_6_lock; 
  wire [3:0] axi4asource_auto_out_aw_mem_6_cache; 
  wire [2:0] axi4asource_auto_out_aw_mem_6_prot; 
  wire [3:0] axi4asource_auto_out_aw_mem_6_qos; 
  wire [3:0] axi4asource_auto_out_aw_mem_7_id; 
  wire [31:0] axi4asource_auto_out_aw_mem_7_addr; 
  wire [7:0] axi4asource_auto_out_aw_mem_7_len; 
  wire [2:0] axi4asource_auto_out_aw_mem_7_size; 
  wire [1:0] axi4asource_auto_out_aw_mem_7_burst; 
  wire  axi4asource_auto_out_aw_mem_7_lock; 
  wire [3:0] axi4asource_auto_out_aw_mem_7_cache; 
  wire [2:0] axi4asource_auto_out_aw_mem_7_prot; 
  wire [3:0] axi4asource_auto_out_aw_mem_7_qos; 
  wire [3:0] axi4asource_auto_out_aw_ridx; 
  wire [3:0] axi4asource_auto_out_aw_widx; 
  wire  axi4asource_auto_out_aw_safe_ridx_valid; 
  wire  axi4asource_auto_out_aw_safe_widx_valid; 
  wire  axi4asource_auto_out_aw_safe_source_reset_n; 
  wire  axi4asource_auto_out_aw_safe_sink_reset_n; 
  wire [63:0] axi4asource_auto_out_w_mem_0_data; 
  wire [7:0] axi4asource_auto_out_w_mem_0_strb; 
  wire  axi4asource_auto_out_w_mem_0_last; 
  wire [63:0] axi4asource_auto_out_w_mem_1_data; 
  wire [7:0] axi4asource_auto_out_w_mem_1_strb; 
  wire  axi4asource_auto_out_w_mem_1_last; 
  wire [63:0] axi4asource_auto_out_w_mem_2_data; 
  wire [7:0] axi4asource_auto_out_w_mem_2_strb; 
  wire  axi4asource_auto_out_w_mem_2_last; 
  wire [63:0] axi4asource_auto_out_w_mem_3_data; 
  wire [7:0] axi4asource_auto_out_w_mem_3_strb; 
  wire  axi4asource_auto_out_w_mem_3_last; 
  wire [63:0] axi4asource_auto_out_w_mem_4_data; 
  wire [7:0] axi4asource_auto_out_w_mem_4_strb; 
  wire  axi4asource_auto_out_w_mem_4_last; 
  wire [63:0] axi4asource_auto_out_w_mem_5_data; 
  wire [7:0] axi4asource_auto_out_w_mem_5_strb; 
  wire  axi4asource_auto_out_w_mem_5_last; 
  wire [63:0] axi4asource_auto_out_w_mem_6_data; 
  wire [7:0] axi4asource_auto_out_w_mem_6_strb; 
  wire  axi4asource_auto_out_w_mem_6_last; 
  wire [63:0] axi4asource_auto_out_w_mem_7_data; 
  wire [7:0] axi4asource_auto_out_w_mem_7_strb; 
  wire  axi4asource_auto_out_w_mem_7_last; 
  wire [3:0] axi4asource_auto_out_w_ridx; 
  wire [3:0] axi4asource_auto_out_w_widx; 
  wire  axi4asource_auto_out_w_safe_ridx_valid; 
  wire  axi4asource_auto_out_w_safe_widx_valid; 
  wire  axi4asource_auto_out_w_safe_source_reset_n; 
  wire  axi4asource_auto_out_w_safe_sink_reset_n; 
  wire [3:0] axi4asource_auto_out_b_mem_0_id; 
  wire [1:0] axi4asource_auto_out_b_mem_0_resp; 
  wire [3:0] axi4asource_auto_out_b_mem_1_id; 
  wire [1:0] axi4asource_auto_out_b_mem_1_resp; 
  wire [3:0] axi4asource_auto_out_b_mem_2_id; 
  wire [1:0] axi4asource_auto_out_b_mem_2_resp; 
  wire [3:0] axi4asource_auto_out_b_mem_3_id; 
  wire [1:0] axi4asource_auto_out_b_mem_3_resp; 
  wire [3:0] axi4asource_auto_out_b_mem_4_id; 
  wire [1:0] axi4asource_auto_out_b_mem_4_resp; 
  wire [3:0] axi4asource_auto_out_b_mem_5_id; 
  wire [1:0] axi4asource_auto_out_b_mem_5_resp; 
  wire [3:0] axi4asource_auto_out_b_mem_6_id; 
  wire [1:0] axi4asource_auto_out_b_mem_6_resp; 
  wire [3:0] axi4asource_auto_out_b_mem_7_id; 
  wire [1:0] axi4asource_auto_out_b_mem_7_resp; 
  wire [3:0] axi4asource_auto_out_b_ridx; 
  wire [3:0] axi4asource_auto_out_b_widx; 
  wire  axi4asource_auto_out_b_safe_ridx_valid; 
  wire  axi4asource_auto_out_b_safe_widx_valid; 
  wire  axi4asource_auto_out_b_safe_source_reset_n; 
  wire  axi4asource_auto_out_b_safe_sink_reset_n; 
  wire [3:0] axi4asource_auto_out_ar_mem_0_id; 
  wire [31:0] axi4asource_auto_out_ar_mem_0_addr; 
  wire [7:0] axi4asource_auto_out_ar_mem_0_len; 
  wire [2:0] axi4asource_auto_out_ar_mem_0_size; 
  wire [1:0] axi4asource_auto_out_ar_mem_0_burst; 
  wire  axi4asource_auto_out_ar_mem_0_lock; 
  wire [3:0] axi4asource_auto_out_ar_mem_0_cache; 
  wire [2:0] axi4asource_auto_out_ar_mem_0_prot; 
  wire [3:0] axi4asource_auto_out_ar_mem_0_qos; 
  wire [3:0] axi4asource_auto_out_ar_mem_1_id; 
  wire [31:0] axi4asource_auto_out_ar_mem_1_addr; 
  wire [7:0] axi4asource_auto_out_ar_mem_1_len; 
  wire [2:0] axi4asource_auto_out_ar_mem_1_size; 
  wire [1:0] axi4asource_auto_out_ar_mem_1_burst; 
  wire  axi4asource_auto_out_ar_mem_1_lock; 
  wire [3:0] axi4asource_auto_out_ar_mem_1_cache; 
  wire [2:0] axi4asource_auto_out_ar_mem_1_prot; 
  wire [3:0] axi4asource_auto_out_ar_mem_1_qos; 
  wire [3:0] axi4asource_auto_out_ar_mem_2_id; 
  wire [31:0] axi4asource_auto_out_ar_mem_2_addr; 
  wire [7:0] axi4asource_auto_out_ar_mem_2_len; 
  wire [2:0] axi4asource_auto_out_ar_mem_2_size; 
  wire [1:0] axi4asource_auto_out_ar_mem_2_burst; 
  wire  axi4asource_auto_out_ar_mem_2_lock; 
  wire [3:0] axi4asource_auto_out_ar_mem_2_cache; 
  wire [2:0] axi4asource_auto_out_ar_mem_2_prot; 
  wire [3:0] axi4asource_auto_out_ar_mem_2_qos; 
  wire [3:0] axi4asource_auto_out_ar_mem_3_id; 
  wire [31:0] axi4asource_auto_out_ar_mem_3_addr; 
  wire [7:0] axi4asource_auto_out_ar_mem_3_len; 
  wire [2:0] axi4asource_auto_out_ar_mem_3_size; 
  wire [1:0] axi4asource_auto_out_ar_mem_3_burst; 
  wire  axi4asource_auto_out_ar_mem_3_lock; 
  wire [3:0] axi4asource_auto_out_ar_mem_3_cache; 
  wire [2:0] axi4asource_auto_out_ar_mem_3_prot; 
  wire [3:0] axi4asource_auto_out_ar_mem_3_qos; 
  wire [3:0] axi4asource_auto_out_ar_mem_4_id; 
  wire [31:0] axi4asource_auto_out_ar_mem_4_addr; 
  wire [7:0] axi4asource_auto_out_ar_mem_4_len; 
  wire [2:0] axi4asource_auto_out_ar_mem_4_size; 
  wire [1:0] axi4asource_auto_out_ar_mem_4_burst; 
  wire  axi4asource_auto_out_ar_mem_4_lock; 
  wire [3:0] axi4asource_auto_out_ar_mem_4_cache; 
  wire [2:0] axi4asource_auto_out_ar_mem_4_prot; 
  wire [3:0] axi4asource_auto_out_ar_mem_4_qos; 
  wire [3:0] axi4asource_auto_out_ar_mem_5_id; 
  wire [31:0] axi4asource_auto_out_ar_mem_5_addr; 
  wire [7:0] axi4asource_auto_out_ar_mem_5_len; 
  wire [2:0] axi4asource_auto_out_ar_mem_5_size; 
  wire [1:0] axi4asource_auto_out_ar_mem_5_burst; 
  wire  axi4asource_auto_out_ar_mem_5_lock; 
  wire [3:0] axi4asource_auto_out_ar_mem_5_cache; 
  wire [2:0] axi4asource_auto_out_ar_mem_5_prot; 
  wire [3:0] axi4asource_auto_out_ar_mem_5_qos; 
  wire [3:0] axi4asource_auto_out_ar_mem_6_id; 
  wire [31:0] axi4asource_auto_out_ar_mem_6_addr; 
  wire [7:0] axi4asource_auto_out_ar_mem_6_len; 
  wire [2:0] axi4asource_auto_out_ar_mem_6_size; 
  wire [1:0] axi4asource_auto_out_ar_mem_6_burst; 
  wire  axi4asource_auto_out_ar_mem_6_lock; 
  wire [3:0] axi4asource_auto_out_ar_mem_6_cache; 
  wire [2:0] axi4asource_auto_out_ar_mem_6_prot; 
  wire [3:0] axi4asource_auto_out_ar_mem_6_qos; 
  wire [3:0] axi4asource_auto_out_ar_mem_7_id; 
  wire [31:0] axi4asource_auto_out_ar_mem_7_addr; 
  wire [7:0] axi4asource_auto_out_ar_mem_7_len; 
  wire [2:0] axi4asource_auto_out_ar_mem_7_size; 
  wire [1:0] axi4asource_auto_out_ar_mem_7_burst; 
  wire  axi4asource_auto_out_ar_mem_7_lock; 
  wire [3:0] axi4asource_auto_out_ar_mem_7_cache; 
  wire [2:0] axi4asource_auto_out_ar_mem_7_prot; 
  wire [3:0] axi4asource_auto_out_ar_mem_7_qos; 
  wire [3:0] axi4asource_auto_out_ar_ridx; 
  wire [3:0] axi4asource_auto_out_ar_widx; 
  wire  axi4asource_auto_out_ar_safe_ridx_valid; 
  wire  axi4asource_auto_out_ar_safe_widx_valid; 
  wire  axi4asource_auto_out_ar_safe_source_reset_n; 
  wire  axi4asource_auto_out_ar_safe_sink_reset_n; 
  wire [3:0] axi4asource_auto_out_r_mem_0_id; 
  wire [63:0] axi4asource_auto_out_r_mem_0_data; 
  wire [1:0] axi4asource_auto_out_r_mem_0_resp; 
  wire  axi4asource_auto_out_r_mem_0_last; 
  wire [3:0] axi4asource_auto_out_r_mem_1_id; 
  wire [63:0] axi4asource_auto_out_r_mem_1_data; 
  wire [1:0] axi4asource_auto_out_r_mem_1_resp; 
  wire  axi4asource_auto_out_r_mem_1_last; 
  wire [3:0] axi4asource_auto_out_r_mem_2_id; 
  wire [63:0] axi4asource_auto_out_r_mem_2_data; 
  wire [1:0] axi4asource_auto_out_r_mem_2_resp; 
  wire  axi4asource_auto_out_r_mem_2_last; 
  wire [3:0] axi4asource_auto_out_r_mem_3_id; 
  wire [63:0] axi4asource_auto_out_r_mem_3_data; 
  wire [1:0] axi4asource_auto_out_r_mem_3_resp; 
  wire  axi4asource_auto_out_r_mem_3_last; 
  wire [3:0] axi4asource_auto_out_r_mem_4_id; 
  wire [63:0] axi4asource_auto_out_r_mem_4_data; 
  wire [1:0] axi4asource_auto_out_r_mem_4_resp; 
  wire  axi4asource_auto_out_r_mem_4_last; 
  wire [3:0] axi4asource_auto_out_r_mem_5_id; 
  wire [63:0] axi4asource_auto_out_r_mem_5_data; 
  wire [1:0] axi4asource_auto_out_r_mem_5_resp; 
  wire  axi4asource_auto_out_r_mem_5_last; 
  wire [3:0] axi4asource_auto_out_r_mem_6_id; 
  wire [63:0] axi4asource_auto_out_r_mem_6_data; 
  wire [1:0] axi4asource_auto_out_r_mem_6_resp; 
  wire  axi4asource_auto_out_r_mem_6_last; 
  wire [3:0] axi4asource_auto_out_r_mem_7_id; 
  wire [63:0] axi4asource_auto_out_r_mem_7_data; 
  wire [1:0] axi4asource_auto_out_r_mem_7_resp; 
  wire  axi4asource_auto_out_r_mem_7_last; 
  wire [3:0] axi4asource_auto_out_r_ridx; 
  wire [3:0] axi4asource_auto_out_r_widx; 
  wire  axi4asource_auto_out_r_safe_ridx_valid; 
  wire  axi4asource_auto_out_r_safe_widx_valid; 
  wire  axi4asource_auto_out_r_safe_source_reset_n; 
  wire  axi4asource_auto_out_r_safe_sink_reset_n; 
  TLBuffer_33 buffer ( 
    .clock(buffer_clock),
    .reset(buffer_reset),
    .auto_in_a_ready(buffer_auto_in_a_ready),
    .auto_in_a_valid(buffer_auto_in_a_valid),
    .auto_in_a_bits_opcode(buffer_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(buffer_auto_in_a_bits_param),
    .auto_in_a_bits_size(buffer_auto_in_a_bits_size),
    .auto_in_a_bits_source(buffer_auto_in_a_bits_source),
    .auto_in_a_bits_address(buffer_auto_in_a_bits_address),
    .auto_in_a_bits_mask(buffer_auto_in_a_bits_mask),
    .auto_in_a_bits_data(buffer_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(buffer_auto_in_a_bits_corrupt),
    .auto_in_d_ready(buffer_auto_in_d_ready),
    .auto_in_d_valid(buffer_auto_in_d_valid),
    .auto_in_d_bits_opcode(buffer_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(buffer_auto_in_d_bits_param),
    .auto_in_d_bits_size(buffer_auto_in_d_bits_size),
    .auto_in_d_bits_source(buffer_auto_in_d_bits_source),
    .auto_in_d_bits_sink(buffer_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(buffer_auto_in_d_bits_denied),
    .auto_in_d_bits_data(buffer_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(buffer_auto_in_d_bits_corrupt),
    .auto_out_a_ready(buffer_auto_out_a_ready),
    .auto_out_a_valid(buffer_auto_out_a_valid),
    .auto_out_a_bits_opcode(buffer_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(buffer_auto_out_a_bits_param),
    .auto_out_a_bits_size(buffer_auto_out_a_bits_size),
    .auto_out_a_bits_source(buffer_auto_out_a_bits_source),
    .auto_out_a_bits_address(buffer_auto_out_a_bits_address),
    .auto_out_a_bits_mask(buffer_auto_out_a_bits_mask),
    .auto_out_a_bits_data(buffer_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt(buffer_auto_out_a_bits_corrupt),
    .auto_out_d_ready(buffer_auto_out_d_ready),
    .auto_out_d_valid(buffer_auto_out_d_valid),
    .auto_out_d_bits_opcode(buffer_auto_out_d_bits_opcode),
    .auto_out_d_bits_size(buffer_auto_out_d_bits_size),
    .auto_out_d_bits_source(buffer_auto_out_d_bits_source),
    .auto_out_d_bits_denied(buffer_auto_out_d_bits_denied),
    .auto_out_d_bits_data(buffer_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(buffer_auto_out_d_bits_corrupt)
  );

TLSourceShrinker_Param #(
    .ADDRESS_WIDTH(32),
    .DATA_WIDTH(64),
    .SIZE_WIDTH(3),
    .USER_WIDTH(1)
) u_tl2axi4_shrink_chiplink(
    .clock(clock),
    .reset(reset),
    .auto_in_a_ready(toaxi4_auto_in_a_ready),
    .auto_in_a_valid(toaxi4_auto_in_a_valid),
    .auto_in_a_bits_opcode(toaxi4_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(toaxi4_auto_in_a_bits_param),
    .auto_in_a_bits_size(toaxi4_auto_in_a_bits_size),
    .auto_in_a_bits_source(toaxi4_auto_in_a_bits_source),
    .auto_in_a_bits_address(toaxi4_auto_in_a_bits_address),
    .auto_in_a_bits_mask(toaxi4_auto_in_a_bits_mask),
    .auto_in_a_bits_data(toaxi4_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(toaxi4_auto_in_a_bits_corrupt),
    .auto_in_d_ready(toaxi4_auto_in_d_ready),
    .auto_in_d_valid(toaxi4_auto_in_d_valid),
    .auto_in_d_bits_opcode(toaxi4_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(),
    .auto_in_d_bits_size(toaxi4_auto_in_d_bits_size),
    .auto_in_d_bits_source(toaxi4_auto_in_d_bits_source),
    .auto_in_d_bits_sink(),
    .auto_in_d_bits_denied(toaxi4_auto_in_d_bits_denied),
    .auto_in_d_bits_data(toaxi4_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(toaxi4_auto_in_d_bits_corrupt),

    .auto_out_a_ready(toaxi4_shrink_auto_in_a_ready),
    .auto_out_a_valid(toaxi4_shrink_auto_in_a_valid),
    .auto_out_a_bits_opcode(toaxi4_shrink_auto_in_a_bits_opcode),
    .auto_out_a_bits_param(toaxi4_shrink_auto_in_a_bits_param),
    .auto_out_a_bits_size(toaxi4_shrink_auto_in_a_bits_size),
    .auto_out_a_bits_source(toaxi4_shrink_auto_in_a_bits_source),
    .auto_out_a_bits_address(toaxi4_shrink_auto_in_a_bits_address),
    .auto_out_a_bits_mask(toaxi4_shrink_auto_in_a_bits_mask),
    .auto_out_a_bits_data(toaxi4_shrink_auto_in_a_bits_data),
    .auto_out_a_bits_corrupt(toaxi4_shrink_auto_in_a_bits_corrupt),
    .auto_out_d_ready(toaxi4_shrink_auto_in_d_ready),
    .auto_out_d_valid(toaxi4_shrink_auto_in_d_valid),
    .auto_out_d_bits_opcode(toaxi4_shrink_auto_in_d_bits_opcode),
    .auto_out_d_bits_param(2'b0),
    .auto_out_d_bits_size(toaxi4_shrink_auto_in_d_bits_size),
    .auto_out_d_bits_source(toaxi4_shrink_auto_in_d_bits_source),
    .auto_out_d_bits_sink(1'b0),
    .auto_out_d_bits_denied(toaxi4_shrink_auto_in_d_bits_denied),
    .auto_out_d_bits_data(toaxi4_shrink_auto_in_d_bits_data),
    .auto_out_d_bits_corrupt(toaxi4_shrink_auto_in_d_bits_corrupt)

);


`ifndef CHIPLINK_CONNECT_DIRECT_TL    

  TLToAXI4 toaxi4 ( 
    .clock(toaxi4_clock),
    .reset(toaxi4_reset),
    .auto_in_a_ready(toaxi4_shrink_auto_in_a_ready),
    .auto_in_a_valid(toaxi4_shrink_auto_in_a_valid),
    .auto_in_a_bits_opcode(toaxi4_shrink_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(toaxi4_shrink_auto_in_a_bits_param),
    .auto_in_a_bits_size(toaxi4_shrink_auto_in_a_bits_size),
    .auto_in_a_bits_source({3'h0, toaxi4_shrink_auto_in_a_bits_source}),
    .auto_in_a_bits_address(toaxi4_shrink_auto_in_a_bits_address),
    .auto_in_a_bits_mask(toaxi4_shrink_auto_in_a_bits_mask),
    .auto_in_a_bits_data(toaxi4_shrink_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(toaxi4_shrink_auto_in_a_bits_corrupt),
    .auto_in_d_ready(toaxi4_shrink_auto_in_d_ready),
    .auto_in_d_valid(toaxi4_shrink_auto_in_d_valid),
    .auto_in_d_bits_opcode(toaxi4_shrink_auto_in_d_bits_opcode),
    .auto_in_d_bits_size(toaxi4_shrink_auto_in_d_bits_size),
    .auto_in_d_bits_source({toaxi4_shrink_auto_in_d_bits_source_unused, toaxi4_shrink_auto_in_d_bits_source}),
    .auto_in_d_bits_denied(toaxi4_shrink_auto_in_d_bits_denied),
    .auto_in_d_bits_data(toaxi4_shrink_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(toaxi4_shrink_auto_in_d_bits_corrupt),
    .auto_out_aw_ready(toaxi4_index_buf_awready),
    .auto_out_aw_valid(toaxi4_index_buf_awvalid),
    .auto_out_aw_bits_id(toaxi4_index_buf_awid),
    .auto_out_aw_bits_addr(toaxi4_index_buf_awaddr),
    .auto_out_aw_bits_len(toaxi4_index_buf_awlen),
    .auto_out_aw_bits_size(toaxi4_index_buf_awsize),
    .auto_out_aw_bits_burst(toaxi4_index_buf_awburst),
    .auto_out_aw_bits_lock(toaxi4_index_buf_awlock),
    .auto_out_aw_bits_cache(toaxi4_index_buf_awcache),
    .auto_out_aw_bits_prot(toaxi4_index_buf_awprot),
    .auto_out_aw_bits_qos(toaxi4_index_buf_awqos),
    .auto_out_aw_bits_user(toaxi4_index_buf_awuser),
    .auto_out_w_ready(toaxi4_index_buf_wready),
    .auto_out_w_valid(toaxi4_index_buf_wvalid),
    .auto_out_w_bits_data(toaxi4_index_buf_wdata),
    .auto_out_w_bits_strb(toaxi4_index_buf_wstrb),
    .auto_out_w_bits_last(toaxi4_index_buf_wlast),
    .auto_out_b_ready(toaxi4_index_buf_bready),
    .auto_out_b_valid(toaxi4_index_buf_bvalid),
    .auto_out_b_bits_id(toaxi4_index_buf_bid),
    .auto_out_b_bits_resp(toaxi4_index_buf_bresp),
    .auto_out_b_bits_user(toaxi4_index_buf_buser),
    .auto_out_ar_ready(toaxi4_index_buf_arready),
    .auto_out_ar_valid(toaxi4_index_buf_arvalid),
    .auto_out_ar_bits_id(toaxi4_index_buf_arid),
    .auto_out_ar_bits_addr(toaxi4_index_buf_araddr),
    .auto_out_ar_bits_len(toaxi4_index_buf_arlen),
    .auto_out_ar_bits_size(toaxi4_index_buf_arsize),
    .auto_out_ar_bits_burst(toaxi4_index_buf_arburst),
    .auto_out_ar_bits_lock(toaxi4_index_buf_arlock),
    .auto_out_ar_bits_cache(toaxi4_index_buf_arcache),
    .auto_out_ar_bits_prot(toaxi4_index_buf_arprot),
    .auto_out_ar_bits_qos(toaxi4_index_buf_arqos),
    .auto_out_ar_bits_user(toaxi4_index_buf_aruser),
    .auto_out_r_ready(toaxi4_index_buf_rready),
    .auto_out_r_valid(toaxi4_index_buf_rvalid),
    .auto_out_r_bits_id(toaxi4_index_buf_rid),
    .auto_out_r_bits_data(toaxi4_index_buf_rdata),
    .auto_out_r_bits_resp(toaxi4_index_buf_rresp),
    .auto_out_r_bits_user(toaxi4_index_buf_ruser),
    .auto_out_r_bits_last(toaxi4_index_buf_rlast)
  );

  assign toaxi4_auto_out_aw_bits_lock = 1'b0; 
  assign toaxi4_auto_out_aw_bits_cache = 4'b0; 
  assign toaxi4_auto_out_aw_bits_prot = 3'b0; 
  assign toaxi4_auto_out_aw_bits_qos = 4'b0; 

  assign toaxi4_auto_out_ar_bits_lock = 1'b0; 
  assign toaxi4_auto_out_ar_bits_cache = 4'b0; 
  assign toaxi4_auto_out_ar_bits_prot = 3'b0; 
  assign toaxi4_auto_out_ar_bits_qos = 4'b0; 

  AXI4Buffer_Param #(
    .ADDR_WIDTH(32),
    .DATA_WIDTH(64),
    .ID_WIDTH(6 + 11)  // id + user
  ) toaxi4_index_buf ( 
    .clock(toaxi4_clock),
    .reset(toaxi4_reset),
    .auto_in_awready(toaxi4_index_buf_awready),
    .auto_in_awvalid(toaxi4_index_buf_awvalid),
    .auto_in_awid({toaxi4_index_buf_awid, toaxi4_index_buf_awuser}),
    .auto_in_awaddr(toaxi4_index_buf_awaddr),
    .auto_in_awlen(toaxi4_index_buf_awlen),
    .auto_in_awsize(toaxi4_index_buf_awsize),
    .auto_in_awburst(toaxi4_index_buf_awburst),
    .auto_in_wready(toaxi4_index_buf_wready),
    .auto_in_wvalid(toaxi4_index_buf_wvalid),
    .auto_in_wdata(toaxi4_index_buf_wdata),
    .auto_in_wstrb(toaxi4_index_buf_wstrb),
    .auto_in_wlast(toaxi4_index_buf_wlast),
    .auto_in_bready(toaxi4_index_buf_bready),
    .auto_in_bvalid(toaxi4_index_buf_bvalid),
    .auto_in_bid({toaxi4_index_buf_bid, toaxi4_index_buf_buser}),
    .auto_in_bresp(toaxi4_index_buf_bresp),
    .auto_in_arready(toaxi4_index_buf_arready),
    .auto_in_arvalid(toaxi4_index_buf_arvalid),
    .auto_in_arid({toaxi4_index_buf_arid, toaxi4_index_buf_aruser}),
    .auto_in_araddr(toaxi4_index_buf_araddr),
    .auto_in_arlen(toaxi4_index_buf_arlen),
    .auto_in_arsize(toaxi4_index_buf_arsize),
    .auto_in_arburst(toaxi4_index_buf_arburst),
    .auto_in_rready(toaxi4_index_buf_rready),
    .auto_in_rvalid(toaxi4_index_buf_rvalid),
    .auto_in_rid({toaxi4_index_buf_rid, toaxi4_index_buf_ruser}),
    .auto_in_rdata(toaxi4_index_buf_rdata),
    .auto_in_rresp(toaxi4_index_buf_rresp),
    .auto_in_rlast(toaxi4_index_buf_rlast),

    .auto_out_awready(toaxi4_auto_out_aw_ready),
    .auto_out_awvalid(toaxi4_auto_out_aw_valid),
    .auto_out_awid({toaxi4_auto_out_aw_bits_id, toaxi4_auto_out_aw_bits_user}),
    .auto_out_awaddr(toaxi4_auto_out_aw_bits_addr),
    .auto_out_awlen(toaxi4_auto_out_aw_bits_len),
    .auto_out_awsize(toaxi4_auto_out_aw_bits_size),
    .auto_out_awburst(toaxi4_auto_out_aw_bits_burst),
    // .auto_out_awlock(toaxi4_auto_out_aw_bits_lock),
    // .auto_out_awcache(toaxi4_auto_out_aw_bits_cache),
    // .auto_out_awprot(toaxi4_auto_out_aw_bits_prot),
    // .auto_out_awqos(toaxi4_auto_out_aw_bits_qos),
    // .auto_out_awuser(toaxi4_auto_out_aw_bits_user),
    .auto_out_wready(toaxi4_auto_out_w_ready),
    .auto_out_wvalid(toaxi4_auto_out_w_valid),
    .auto_out_wdata(toaxi4_auto_out_w_bits_data),
    .auto_out_wstrb(toaxi4_auto_out_w_bits_strb),
    .auto_out_wlast(toaxi4_auto_out_w_bits_last),
    .auto_out_bready(toaxi4_auto_out_b_ready),
    .auto_out_bvalid(toaxi4_auto_out_b_valid),
    .auto_out_bid({toaxi4_auto_out_b_bits_id, toaxi4_auto_out_b_bits_user}),
    .auto_out_bresp(toaxi4_auto_out_b_bits_resp),
    // .auto_out_buser(toaxi4_auto_out_b_bits_user),
    .auto_out_arready(toaxi4_auto_out_ar_ready),
    .auto_out_arvalid(toaxi4_auto_out_ar_valid),
    .auto_out_arid({toaxi4_auto_out_ar_bits_id, toaxi4_auto_out_ar_bits_user}),
    .auto_out_araddr(toaxi4_auto_out_ar_bits_addr),
    .auto_out_arlen(toaxi4_auto_out_ar_bits_len),
    .auto_out_arsize(toaxi4_auto_out_ar_bits_size),
    .auto_out_arburst(toaxi4_auto_out_ar_bits_burst),
    // .auto_out_arlock(toaxi4_auto_out_ar_bits_lock),
    // .auto_out_arcache(toaxi4_auto_out_ar_bits_cache),
    // .auto_out_arprot(toaxi4_auto_out_ar_bits_prot),
    // .auto_out_arqos(toaxi4_auto_out_ar_bits_qos),
    // .auto_out_aruser(toaxi4_auto_out_ar_bits_user),
    .auto_out_rready(toaxi4_auto_out_r_ready),
    .auto_out_rvalid(toaxi4_auto_out_r_valid),
    .auto_out_rid({toaxi4_auto_out_r_bits_id, toaxi4_auto_out_r_bits_user}),
    .auto_out_rdata(toaxi4_auto_out_r_bits_data),
    .auto_out_rresp(toaxi4_auto_out_r_bits_resp),
    // .auto_out_ruser(toaxi4_auto_out_r_bits_user),
    .auto_out_rlast(toaxi4_auto_out_r_bits_last)
  /*
    .auto_out_awready(axi4yank_1_auto_out_awready),
    .auto_out_awvalid(axi4yank_1_auto_out_awvalid),
    .auto_out_awid({axi4yank_1_auto_out_awid}),
    .auto_out_awaddr(axi4yank_1_auto_out_awaddr),
    .auto_out_awlen(axi4yank_1_auto_out_awlen),
    .auto_out_awsize(axi4yank_1_auto_out_awsize),
    .auto_out_awburst(axi4yank_1_auto_out_awburst),
    .auto_out_wready(axi4yank_1_auto_out_wready),
    .auto_out_wvalid(axi4yank_1_auto_out_wvalid),
    .auto_out_wdata(axi4yank_1_auto_out_wdata),
    .auto_out_wstrb(axi4yank_1_auto_out_wstrb),
    .auto_out_wlast(axi4yank_1_auto_out_wlast),
    .auto_out_bready(axi4yank_1_auto_out_bready),
    .auto_out_bvalid(axi4yank_1_auto_out_bvalid),
    .auto_out_bid({axi4yank_1_auto_out_bid}),
    .auto_out_bresp(axi4yank_1_auto_out_bresp),
    .auto_out_arready(axi4yank_1_auto_out_arready),
    .auto_out_arvalid(axi4yank_1_auto_out_arvalid),
    .auto_out_arid({axi4yank_1_auto_out_arid}),
    .auto_out_araddr(axi4yank_1_auto_out_araddr),
    .auto_out_arlen(axi4yank_1_auto_out_arlen),
    .auto_out_arsize(axi4yank_1_auto_out_arsize),
    .auto_out_arburst(axi4yank_1_auto_out_arburst),
    .auto_out_rready(axi4yank_1_auto_out_rready),
    .auto_out_rvalid(axi4yank_1_auto_out_rvalid),
    .auto_out_rid({axi4yank_1_auto_out_rid}),
    .auto_out_rdata(axi4yank_1_auto_out_rdata),
    .auto_out_rresp(axi4yank_1_auto_out_rresp),
    .auto_out_rlast(axi4yank_1_auto_out_rlast)
    */
  );


  AXI4IdIndexer indexer ( 
    .auto_in_aw_ready(indexer_auto_in_aw_ready),
    .auto_in_aw_valid(indexer_auto_in_aw_valid),
    .auto_in_aw_bits_id(indexer_auto_in_aw_bits_id),
    .auto_in_aw_bits_addr(indexer_auto_in_aw_bits_addr),
    .auto_in_aw_bits_len(indexer_auto_in_aw_bits_len),
    .auto_in_aw_bits_size(indexer_auto_in_aw_bits_size),
    .auto_in_aw_bits_burst(indexer_auto_in_aw_bits_burst),
    .auto_in_aw_bits_lock(indexer_auto_in_aw_bits_lock),
    .auto_in_aw_bits_cache(indexer_auto_in_aw_bits_cache),
    .auto_in_aw_bits_prot(indexer_auto_in_aw_bits_prot),
    .auto_in_aw_bits_qos(indexer_auto_in_aw_bits_qos),
    .auto_in_aw_bits_user(indexer_auto_in_aw_bits_user),
    .auto_in_w_ready(indexer_auto_in_w_ready),
    .auto_in_w_valid(indexer_auto_in_w_valid),
    .auto_in_w_bits_data(indexer_auto_in_w_bits_data),
    .auto_in_w_bits_strb(indexer_auto_in_w_bits_strb),
    .auto_in_w_bits_last(indexer_auto_in_w_bits_last),
    .auto_in_b_ready(indexer_auto_in_b_ready),
    .auto_in_b_valid(indexer_auto_in_b_valid),
    .auto_in_b_bits_id(indexer_auto_in_b_bits_id),
    .auto_in_b_bits_resp(indexer_auto_in_b_bits_resp),
    .auto_in_b_bits_user(indexer_auto_in_b_bits_user),
    .auto_in_ar_ready(indexer_auto_in_ar_ready),
    .auto_in_ar_valid(indexer_auto_in_ar_valid),
    .auto_in_ar_bits_id(indexer_auto_in_ar_bits_id),
    .auto_in_ar_bits_addr(indexer_auto_in_ar_bits_addr),
    .auto_in_ar_bits_len(indexer_auto_in_ar_bits_len),
    .auto_in_ar_bits_size(indexer_auto_in_ar_bits_size),
    .auto_in_ar_bits_burst(indexer_auto_in_ar_bits_burst),
    .auto_in_ar_bits_lock(indexer_auto_in_ar_bits_lock),
    .auto_in_ar_bits_cache(indexer_auto_in_ar_bits_cache),
    .auto_in_ar_bits_prot(indexer_auto_in_ar_bits_prot),
    .auto_in_ar_bits_qos(indexer_auto_in_ar_bits_qos),
    .auto_in_ar_bits_user(indexer_auto_in_ar_bits_user),
    .auto_in_r_ready(indexer_auto_in_r_ready),
    .auto_in_r_valid(indexer_auto_in_r_valid),
    .auto_in_r_bits_id(indexer_auto_in_r_bits_id),
    .auto_in_r_bits_data(indexer_auto_in_r_bits_data),
    .auto_in_r_bits_resp(indexer_auto_in_r_bits_resp),
    .auto_in_r_bits_user(indexer_auto_in_r_bits_user),
    .auto_in_r_bits_last(indexer_auto_in_r_bits_last),
    .auto_out_aw_ready(indexer_auto_out_aw_ready),
    .auto_out_aw_valid(indexer_auto_out_aw_valid),
    .auto_out_aw_bits_id(indexer_auto_out_aw_bits_id),
    .auto_out_aw_bits_addr(indexer_auto_out_aw_bits_addr),
    .auto_out_aw_bits_len(indexer_auto_out_aw_bits_len),
    .auto_out_aw_bits_size(indexer_auto_out_aw_bits_size),
    .auto_out_aw_bits_burst(indexer_auto_out_aw_bits_burst),
    .auto_out_aw_bits_lock(indexer_auto_out_aw_bits_lock),
    .auto_out_aw_bits_cache(indexer_auto_out_aw_bits_cache),
    .auto_out_aw_bits_prot(indexer_auto_out_aw_bits_prot),
    .auto_out_aw_bits_qos(indexer_auto_out_aw_bits_qos),
    .auto_out_aw_bits_user(indexer_auto_out_aw_bits_user),
    .auto_out_w_ready(indexer_auto_out_w_ready),
    .auto_out_w_valid(indexer_auto_out_w_valid),
    .auto_out_w_bits_data(indexer_auto_out_w_bits_data),
    .auto_out_w_bits_strb(indexer_auto_out_w_bits_strb),
    .auto_out_w_bits_last(indexer_auto_out_w_bits_last),
    .auto_out_b_ready(indexer_auto_out_b_ready),
    .auto_out_b_valid(indexer_auto_out_b_valid),
    .auto_out_b_bits_id(indexer_auto_out_b_bits_id),
    .auto_out_b_bits_resp(indexer_auto_out_b_bits_resp),
    .auto_out_b_bits_user(indexer_auto_out_b_bits_user),
    .auto_out_ar_ready(indexer_auto_out_ar_ready),
    .auto_out_ar_valid(indexer_auto_out_ar_valid),
    .auto_out_ar_bits_id(indexer_auto_out_ar_bits_id),
    .auto_out_ar_bits_addr(indexer_auto_out_ar_bits_addr),
    .auto_out_ar_bits_len(indexer_auto_out_ar_bits_len),
    .auto_out_ar_bits_size(indexer_auto_out_ar_bits_size),
    .auto_out_ar_bits_burst(indexer_auto_out_ar_bits_burst),
    .auto_out_ar_bits_lock(indexer_auto_out_ar_bits_lock),
    .auto_out_ar_bits_cache(indexer_auto_out_ar_bits_cache),
    .auto_out_ar_bits_prot(indexer_auto_out_ar_bits_prot),
    .auto_out_ar_bits_qos(indexer_auto_out_ar_bits_qos),
    .auto_out_ar_bits_user(indexer_auto_out_ar_bits_user),
    .auto_out_r_ready(indexer_auto_out_r_ready),
    .auto_out_r_valid(indexer_auto_out_r_valid),
    .auto_out_r_bits_id(indexer_auto_out_r_bits_id),
    .auto_out_r_bits_data(indexer_auto_out_r_bits_data),
    .auto_out_r_bits_resp(indexer_auto_out_r_bits_resp),
    .auto_out_r_bits_user(indexer_auto_out_r_bits_user),
    .auto_out_r_bits_last(indexer_auto_out_r_bits_last)
  );
  AXI4Deinterleaver deint ( 
    .clock(deint_clock),
    .reset(deint_reset),
    .auto_in_aw_ready(deint_auto_in_aw_ready),
    .auto_in_aw_valid(deint_auto_in_aw_valid),
    .auto_in_aw_bits_id(deint_auto_in_aw_bits_id),
    .auto_in_aw_bits_addr(deint_auto_in_aw_bits_addr),
    .auto_in_aw_bits_len(deint_auto_in_aw_bits_len),
    .auto_in_aw_bits_size(deint_auto_in_aw_bits_size),
    .auto_in_aw_bits_burst(deint_auto_in_aw_bits_burst),
    .auto_in_aw_bits_lock(deint_auto_in_aw_bits_lock),
    .auto_in_aw_bits_cache(deint_auto_in_aw_bits_cache),
    .auto_in_aw_bits_prot(deint_auto_in_aw_bits_prot),
    .auto_in_aw_bits_qos(deint_auto_in_aw_bits_qos),
    .auto_in_aw_bits_user(deint_auto_in_aw_bits_user),
    .auto_in_w_ready(deint_auto_in_w_ready),
    .auto_in_w_valid(deint_auto_in_w_valid),
    .auto_in_w_bits_data(deint_auto_in_w_bits_data),
    .auto_in_w_bits_strb(deint_auto_in_w_bits_strb),
    .auto_in_w_bits_last(deint_auto_in_w_bits_last),
    .auto_in_b_ready(deint_auto_in_b_ready),
    .auto_in_b_valid(deint_auto_in_b_valid),
    .auto_in_b_bits_id(deint_auto_in_b_bits_id),
    .auto_in_b_bits_resp(deint_auto_in_b_bits_resp),
    .auto_in_b_bits_user(deint_auto_in_b_bits_user),
    .auto_in_ar_ready(deint_auto_in_ar_ready),
    .auto_in_ar_valid(deint_auto_in_ar_valid),
    .auto_in_ar_bits_id(deint_auto_in_ar_bits_id),
    .auto_in_ar_bits_addr(deint_auto_in_ar_bits_addr),
    .auto_in_ar_bits_len(deint_auto_in_ar_bits_len),
    .auto_in_ar_bits_size(deint_auto_in_ar_bits_size),
    .auto_in_ar_bits_burst(deint_auto_in_ar_bits_burst),
    .auto_in_ar_bits_lock(deint_auto_in_ar_bits_lock),
    .auto_in_ar_bits_cache(deint_auto_in_ar_bits_cache),
    .auto_in_ar_bits_prot(deint_auto_in_ar_bits_prot),
    .auto_in_ar_bits_qos(deint_auto_in_ar_bits_qos),
    .auto_in_ar_bits_user(deint_auto_in_ar_bits_user),
    .auto_in_r_ready(deint_auto_in_r_ready),
    .auto_in_r_valid(deint_auto_in_r_valid),
    .auto_in_r_bits_id(deint_auto_in_r_bits_id),
    .auto_in_r_bits_data(deint_auto_in_r_bits_data),
    .auto_in_r_bits_resp(deint_auto_in_r_bits_resp),
    .auto_in_r_bits_user(deint_auto_in_r_bits_user),
    .auto_in_r_bits_last(deint_auto_in_r_bits_last),
    .auto_out_aw_ready(deint_auto_out_aw_ready),
    .auto_out_aw_valid(deint_auto_out_aw_valid),
    .auto_out_aw_bits_id(deint_auto_out_aw_bits_id),
    .auto_out_aw_bits_addr(deint_auto_out_aw_bits_addr),
    .auto_out_aw_bits_len(deint_auto_out_aw_bits_len),
    .auto_out_aw_bits_size(deint_auto_out_aw_bits_size),
    .auto_out_aw_bits_burst(deint_auto_out_aw_bits_burst),
    .auto_out_aw_bits_lock(deint_auto_out_aw_bits_lock),
    .auto_out_aw_bits_cache(deint_auto_out_aw_bits_cache),
    .auto_out_aw_bits_prot(deint_auto_out_aw_bits_prot),
    .auto_out_aw_bits_qos(deint_auto_out_aw_bits_qos),
    .auto_out_aw_bits_user(deint_auto_out_aw_bits_user),
    .auto_out_w_ready(deint_auto_out_w_ready),
    .auto_out_w_valid(deint_auto_out_w_valid),
    .auto_out_w_bits_data(deint_auto_out_w_bits_data),
    .auto_out_w_bits_strb(deint_auto_out_w_bits_strb),
    .auto_out_w_bits_last(deint_auto_out_w_bits_last),
    .auto_out_b_ready(deint_auto_out_b_ready),
    .auto_out_b_valid(deint_auto_out_b_valid),
    .auto_out_b_bits_id(deint_auto_out_b_bits_id),
    .auto_out_b_bits_resp(deint_auto_out_b_bits_resp),
    .auto_out_b_bits_user(deint_auto_out_b_bits_user),
    .auto_out_ar_ready(deint_auto_out_ar_ready),
    .auto_out_ar_valid(deint_auto_out_ar_valid),
    .auto_out_ar_bits_id(deint_auto_out_ar_bits_id),
    .auto_out_ar_bits_addr(deint_auto_out_ar_bits_addr),
    .auto_out_ar_bits_len(deint_auto_out_ar_bits_len),
    .auto_out_ar_bits_size(deint_auto_out_ar_bits_size),
    .auto_out_ar_bits_burst(deint_auto_out_ar_bits_burst),
    .auto_out_ar_bits_lock(deint_auto_out_ar_bits_lock),
    .auto_out_ar_bits_cache(deint_auto_out_ar_bits_cache),
    .auto_out_ar_bits_prot(deint_auto_out_ar_bits_prot),
    .auto_out_ar_bits_qos(deint_auto_out_ar_bits_qos),
    .auto_out_ar_bits_user(deint_auto_out_ar_bits_user),
    .auto_out_r_ready(deint_auto_out_r_ready),
    .auto_out_r_valid(deint_auto_out_r_valid),
    .auto_out_r_bits_id(deint_auto_out_r_bits_id),
    .auto_out_r_bits_data(deint_auto_out_r_bits_data),
    .auto_out_r_bits_resp(deint_auto_out_r_bits_resp),
    .auto_out_r_bits_user(deint_auto_out_r_bits_user),
    .auto_out_r_bits_last(deint_auto_out_r_bits_last)
  );
  AXI4UserYanker yank ( 
    .clock(yank_clock),
    .reset(yank_reset),
    .auto_in_aw_ready(yank_auto_in_aw_ready),
    .auto_in_aw_valid(yank_auto_in_aw_valid),
    .auto_in_aw_bits_id(yank_auto_in_aw_bits_id),
    .auto_in_aw_bits_addr(yank_auto_in_aw_bits_addr),
    .auto_in_aw_bits_len(yank_auto_in_aw_bits_len),
    .auto_in_aw_bits_size(yank_auto_in_aw_bits_size),
    .auto_in_aw_bits_burst(yank_auto_in_aw_bits_burst),
    .auto_in_aw_bits_lock(yank_auto_in_aw_bits_lock),
    .auto_in_aw_bits_cache(yank_auto_in_aw_bits_cache),
    .auto_in_aw_bits_prot(yank_auto_in_aw_bits_prot),
    .auto_in_aw_bits_qos(yank_auto_in_aw_bits_qos),
    .auto_in_aw_bits_user(yank_auto_in_aw_bits_user),
    .auto_in_w_ready(yank_auto_in_w_ready),
    .auto_in_w_valid(yank_auto_in_w_valid),
    .auto_in_w_bits_data(yank_auto_in_w_bits_data),
    .auto_in_w_bits_strb(yank_auto_in_w_bits_strb),
    .auto_in_w_bits_last(yank_auto_in_w_bits_last),
    .auto_in_b_ready(yank_auto_in_b_ready),
    .auto_in_b_valid(yank_auto_in_b_valid),
    .auto_in_b_bits_id(yank_auto_in_b_bits_id),
    .auto_in_b_bits_resp(yank_auto_in_b_bits_resp),
    .auto_in_b_bits_user(yank_auto_in_b_bits_user),
    .auto_in_ar_ready(yank_auto_in_ar_ready),
    .auto_in_ar_valid(yank_auto_in_ar_valid),
    .auto_in_ar_bits_id(yank_auto_in_ar_bits_id),
    .auto_in_ar_bits_addr(yank_auto_in_ar_bits_addr),
    .auto_in_ar_bits_len(yank_auto_in_ar_bits_len),
    .auto_in_ar_bits_size(yank_auto_in_ar_bits_size),
    .auto_in_ar_bits_burst(yank_auto_in_ar_bits_burst),
    .auto_in_ar_bits_lock(yank_auto_in_ar_bits_lock),
    .auto_in_ar_bits_cache(yank_auto_in_ar_bits_cache),
    .auto_in_ar_bits_prot(yank_auto_in_ar_bits_prot),
    .auto_in_ar_bits_qos(yank_auto_in_ar_bits_qos),
    .auto_in_ar_bits_user(yank_auto_in_ar_bits_user),
    .auto_in_r_ready(yank_auto_in_r_ready),
    .auto_in_r_valid(yank_auto_in_r_valid),
    .auto_in_r_bits_id(yank_auto_in_r_bits_id),
    .auto_in_r_bits_data(yank_auto_in_r_bits_data),
    .auto_in_r_bits_resp(yank_auto_in_r_bits_resp),
    .auto_in_r_bits_user(yank_auto_in_r_bits_user),
    .auto_in_r_bits_last(yank_auto_in_r_bits_last),
    .auto_out_aw_ready(yank_auto_out_aw_ready),
    .auto_out_aw_valid(yank_auto_out_aw_valid),
    .auto_out_aw_bits_id(yank_auto_out_aw_bits_id),
    .auto_out_aw_bits_addr(yank_auto_out_aw_bits_addr),
    .auto_out_aw_bits_len(yank_auto_out_aw_bits_len),
    .auto_out_aw_bits_size(yank_auto_out_aw_bits_size),
    .auto_out_aw_bits_burst(yank_auto_out_aw_bits_burst),
    .auto_out_aw_bits_lock(yank_auto_out_aw_bits_lock),
    .auto_out_aw_bits_cache(yank_auto_out_aw_bits_cache),
    .auto_out_aw_bits_prot(yank_auto_out_aw_bits_prot),
    .auto_out_aw_bits_qos(yank_auto_out_aw_bits_qos),
    .auto_out_w_ready(yank_auto_out_w_ready),
    .auto_out_w_valid(yank_auto_out_w_valid),
    .auto_out_w_bits_data(yank_auto_out_w_bits_data),
    .auto_out_w_bits_strb(yank_auto_out_w_bits_strb),
    .auto_out_w_bits_last(yank_auto_out_w_bits_last),
    .auto_out_b_ready(yank_auto_out_b_ready),
    .auto_out_b_valid(yank_auto_out_b_valid),
    .auto_out_b_bits_id(yank_auto_out_b_bits_id),
    .auto_out_b_bits_resp(yank_auto_out_b_bits_resp),
    .auto_out_ar_ready(yank_auto_out_ar_ready),
    .auto_out_ar_valid(yank_auto_out_ar_valid),
    .auto_out_ar_bits_id(yank_auto_out_ar_bits_id),
    .auto_out_ar_bits_addr(yank_auto_out_ar_bits_addr),
    .auto_out_ar_bits_len(yank_auto_out_ar_bits_len),
    .auto_out_ar_bits_size(yank_auto_out_ar_bits_size),
    .auto_out_ar_bits_burst(yank_auto_out_ar_bits_burst),
    .auto_out_ar_bits_lock(yank_auto_out_ar_bits_lock),
    .auto_out_ar_bits_cache(yank_auto_out_ar_bits_cache),
    .auto_out_ar_bits_prot(yank_auto_out_ar_bits_prot),
    .auto_out_ar_bits_qos(yank_auto_out_ar_bits_qos),
    .auto_out_r_ready(yank_auto_out_r_ready),
    .auto_out_r_valid(yank_auto_out_r_valid),
    .auto_out_r_bits_id(yank_auto_out_r_bits_id),
    .auto_out_r_bits_data(yank_auto_out_r_bits_data),
    .auto_out_r_bits_resp(yank_auto_out_r_bits_resp),
    .auto_out_r_bits_last(yank_auto_out_r_bits_last)
  );

  AXI4AsyncCrossingSource axi4asource ( 
    .clock(axi4asource_clock),
    .reset(axi4asource_reset),
    .auto_in_aw_ready(axi4asource_auto_in_aw_ready),
    .auto_in_aw_valid(axi4asource_auto_in_aw_valid),
    .auto_in_aw_bits_id(axi4asource_auto_in_aw_bits_id),
    .auto_in_aw_bits_addr(axi4asource_auto_in_aw_bits_addr),
    .auto_in_aw_bits_len(axi4asource_auto_in_aw_bits_len),
    .auto_in_aw_bits_size(axi4asource_auto_in_aw_bits_size),
    .auto_in_aw_bits_burst(axi4asource_auto_in_aw_bits_burst),
    .auto_in_aw_bits_lock(axi4asource_auto_in_aw_bits_lock),
    .auto_in_aw_bits_cache(axi4asource_auto_in_aw_bits_cache),
    .auto_in_aw_bits_prot(axi4asource_auto_in_aw_bits_prot),
    .auto_in_aw_bits_qos(axi4asource_auto_in_aw_bits_qos),
    .auto_in_w_ready(axi4asource_auto_in_w_ready),
    .auto_in_w_valid(axi4asource_auto_in_w_valid),
    .auto_in_w_bits_data(axi4asource_auto_in_w_bits_data),
    .auto_in_w_bits_strb(axi4asource_auto_in_w_bits_strb),
    .auto_in_w_bits_last(axi4asource_auto_in_w_bits_last),
    .auto_in_b_ready(axi4asource_auto_in_b_ready),
    .auto_in_b_valid(axi4asource_auto_in_b_valid),
    .auto_in_b_bits_id(axi4asource_auto_in_b_bits_id),
    .auto_in_b_bits_resp(axi4asource_auto_in_b_bits_resp),
    .auto_in_ar_ready(axi4asource_auto_in_ar_ready),
    .auto_in_ar_valid(axi4asource_auto_in_ar_valid),
    .auto_in_ar_bits_id(axi4asource_auto_in_ar_bits_id),
    .auto_in_ar_bits_addr(axi4asource_auto_in_ar_bits_addr),
    .auto_in_ar_bits_len(axi4asource_auto_in_ar_bits_len),
    .auto_in_ar_bits_size(axi4asource_auto_in_ar_bits_size),
    .auto_in_ar_bits_burst(axi4asource_auto_in_ar_bits_burst),
    .auto_in_ar_bits_lock(axi4asource_auto_in_ar_bits_lock),
    .auto_in_ar_bits_cache(axi4asource_auto_in_ar_bits_cache),
    .auto_in_ar_bits_prot(axi4asource_auto_in_ar_bits_prot),
    .auto_in_ar_bits_qos(axi4asource_auto_in_ar_bits_qos),
    .auto_in_r_ready(axi4asource_auto_in_r_ready),
    .auto_in_r_valid(axi4asource_auto_in_r_valid),
    .auto_in_r_bits_id(axi4asource_auto_in_r_bits_id),
    .auto_in_r_bits_data(axi4asource_auto_in_r_bits_data),
    .auto_in_r_bits_resp(axi4asource_auto_in_r_bits_resp),
    .auto_in_r_bits_last(axi4asource_auto_in_r_bits_last),
    .auto_out_aw_mem_0_id(axi4asource_auto_out_aw_mem_0_id),
    .auto_out_aw_mem_0_addr(axi4asource_auto_out_aw_mem_0_addr),
    .auto_out_aw_mem_0_len(axi4asource_auto_out_aw_mem_0_len),
    .auto_out_aw_mem_0_size(axi4asource_auto_out_aw_mem_0_size),
    .auto_out_aw_mem_0_burst(axi4asource_auto_out_aw_mem_0_burst),
    .auto_out_aw_mem_0_lock(axi4asource_auto_out_aw_mem_0_lock),
    .auto_out_aw_mem_0_cache(axi4asource_auto_out_aw_mem_0_cache),
    .auto_out_aw_mem_0_prot(axi4asource_auto_out_aw_mem_0_prot),
    .auto_out_aw_mem_0_qos(axi4asource_auto_out_aw_mem_0_qos),
    .auto_out_aw_mem_1_id(axi4asource_auto_out_aw_mem_1_id),
    .auto_out_aw_mem_1_addr(axi4asource_auto_out_aw_mem_1_addr),
    .auto_out_aw_mem_1_len(axi4asource_auto_out_aw_mem_1_len),
    .auto_out_aw_mem_1_size(axi4asource_auto_out_aw_mem_1_size),
    .auto_out_aw_mem_1_burst(axi4asource_auto_out_aw_mem_1_burst),
    .auto_out_aw_mem_1_lock(axi4asource_auto_out_aw_mem_1_lock),
    .auto_out_aw_mem_1_cache(axi4asource_auto_out_aw_mem_1_cache),
    .auto_out_aw_mem_1_prot(axi4asource_auto_out_aw_mem_1_prot),
    .auto_out_aw_mem_1_qos(axi4asource_auto_out_aw_mem_1_qos),
    .auto_out_aw_mem_2_id(axi4asource_auto_out_aw_mem_2_id),
    .auto_out_aw_mem_2_addr(axi4asource_auto_out_aw_mem_2_addr),
    .auto_out_aw_mem_2_len(axi4asource_auto_out_aw_mem_2_len),
    .auto_out_aw_mem_2_size(axi4asource_auto_out_aw_mem_2_size),
    .auto_out_aw_mem_2_burst(axi4asource_auto_out_aw_mem_2_burst),
    .auto_out_aw_mem_2_lock(axi4asource_auto_out_aw_mem_2_lock),
    .auto_out_aw_mem_2_cache(axi4asource_auto_out_aw_mem_2_cache),
    .auto_out_aw_mem_2_prot(axi4asource_auto_out_aw_mem_2_prot),
    .auto_out_aw_mem_2_qos(axi4asource_auto_out_aw_mem_2_qos),
    .auto_out_aw_mem_3_id(axi4asource_auto_out_aw_mem_3_id),
    .auto_out_aw_mem_3_addr(axi4asource_auto_out_aw_mem_3_addr),
    .auto_out_aw_mem_3_len(axi4asource_auto_out_aw_mem_3_len),
    .auto_out_aw_mem_3_size(axi4asource_auto_out_aw_mem_3_size),
    .auto_out_aw_mem_3_burst(axi4asource_auto_out_aw_mem_3_burst),
    .auto_out_aw_mem_3_lock(axi4asource_auto_out_aw_mem_3_lock),
    .auto_out_aw_mem_3_cache(axi4asource_auto_out_aw_mem_3_cache),
    .auto_out_aw_mem_3_prot(axi4asource_auto_out_aw_mem_3_prot),
    .auto_out_aw_mem_3_qos(axi4asource_auto_out_aw_mem_3_qos),
    .auto_out_aw_mem_4_id(axi4asource_auto_out_aw_mem_4_id),
    .auto_out_aw_mem_4_addr(axi4asource_auto_out_aw_mem_4_addr),
    .auto_out_aw_mem_4_len(axi4asource_auto_out_aw_mem_4_len),
    .auto_out_aw_mem_4_size(axi4asource_auto_out_aw_mem_4_size),
    .auto_out_aw_mem_4_burst(axi4asource_auto_out_aw_mem_4_burst),
    .auto_out_aw_mem_4_lock(axi4asource_auto_out_aw_mem_4_lock),
    .auto_out_aw_mem_4_cache(axi4asource_auto_out_aw_mem_4_cache),
    .auto_out_aw_mem_4_prot(axi4asource_auto_out_aw_mem_4_prot),
    .auto_out_aw_mem_4_qos(axi4asource_auto_out_aw_mem_4_qos),
    .auto_out_aw_mem_5_id(axi4asource_auto_out_aw_mem_5_id),
    .auto_out_aw_mem_5_addr(axi4asource_auto_out_aw_mem_5_addr),
    .auto_out_aw_mem_5_len(axi4asource_auto_out_aw_mem_5_len),
    .auto_out_aw_mem_5_size(axi4asource_auto_out_aw_mem_5_size),
    .auto_out_aw_mem_5_burst(axi4asource_auto_out_aw_mem_5_burst),
    .auto_out_aw_mem_5_lock(axi4asource_auto_out_aw_mem_5_lock),
    .auto_out_aw_mem_5_cache(axi4asource_auto_out_aw_mem_5_cache),
    .auto_out_aw_mem_5_prot(axi4asource_auto_out_aw_mem_5_prot),
    .auto_out_aw_mem_5_qos(axi4asource_auto_out_aw_mem_5_qos),
    .auto_out_aw_mem_6_id(axi4asource_auto_out_aw_mem_6_id),
    .auto_out_aw_mem_6_addr(axi4asource_auto_out_aw_mem_6_addr),
    .auto_out_aw_mem_6_len(axi4asource_auto_out_aw_mem_6_len),
    .auto_out_aw_mem_6_size(axi4asource_auto_out_aw_mem_6_size),
    .auto_out_aw_mem_6_burst(axi4asource_auto_out_aw_mem_6_burst),
    .auto_out_aw_mem_6_lock(axi4asource_auto_out_aw_mem_6_lock),
    .auto_out_aw_mem_6_cache(axi4asource_auto_out_aw_mem_6_cache),
    .auto_out_aw_mem_6_prot(axi4asource_auto_out_aw_mem_6_prot),
    .auto_out_aw_mem_6_qos(axi4asource_auto_out_aw_mem_6_qos),
    .auto_out_aw_mem_7_id(axi4asource_auto_out_aw_mem_7_id),
    .auto_out_aw_mem_7_addr(axi4asource_auto_out_aw_mem_7_addr),
    .auto_out_aw_mem_7_len(axi4asource_auto_out_aw_mem_7_len),
    .auto_out_aw_mem_7_size(axi4asource_auto_out_aw_mem_7_size),
    .auto_out_aw_mem_7_burst(axi4asource_auto_out_aw_mem_7_burst),
    .auto_out_aw_mem_7_lock(axi4asource_auto_out_aw_mem_7_lock),
    .auto_out_aw_mem_7_cache(axi4asource_auto_out_aw_mem_7_cache),
    .auto_out_aw_mem_7_prot(axi4asource_auto_out_aw_mem_7_prot),
    .auto_out_aw_mem_7_qos(axi4asource_auto_out_aw_mem_7_qos),
    .auto_out_aw_ridx(axi4asource_auto_out_aw_ridx),
    .auto_out_aw_widx(axi4asource_auto_out_aw_widx),
    .auto_out_aw_safe_ridx_valid(axi4asource_auto_out_aw_safe_ridx_valid),
    .auto_out_aw_safe_widx_valid(axi4asource_auto_out_aw_safe_widx_valid),
    .auto_out_aw_safe_source_reset_n(axi4asource_auto_out_aw_safe_source_reset_n),
    .auto_out_aw_safe_sink_reset_n(axi4asource_auto_out_aw_safe_sink_reset_n),
    .auto_out_w_mem_0_data(axi4asource_auto_out_w_mem_0_data),
    .auto_out_w_mem_0_strb(axi4asource_auto_out_w_mem_0_strb),
    .auto_out_w_mem_0_last(axi4asource_auto_out_w_mem_0_last),
    .auto_out_w_mem_1_data(axi4asource_auto_out_w_mem_1_data),
    .auto_out_w_mem_1_strb(axi4asource_auto_out_w_mem_1_strb),
    .auto_out_w_mem_1_last(axi4asource_auto_out_w_mem_1_last),
    .auto_out_w_mem_2_data(axi4asource_auto_out_w_mem_2_data),
    .auto_out_w_mem_2_strb(axi4asource_auto_out_w_mem_2_strb),
    .auto_out_w_mem_2_last(axi4asource_auto_out_w_mem_2_last),
    .auto_out_w_mem_3_data(axi4asource_auto_out_w_mem_3_data),
    .auto_out_w_mem_3_strb(axi4asource_auto_out_w_mem_3_strb),
    .auto_out_w_mem_3_last(axi4asource_auto_out_w_mem_3_last),
    .auto_out_w_mem_4_data(axi4asource_auto_out_w_mem_4_data),
    .auto_out_w_mem_4_strb(axi4asource_auto_out_w_mem_4_strb),
    .auto_out_w_mem_4_last(axi4asource_auto_out_w_mem_4_last),
    .auto_out_w_mem_5_data(axi4asource_auto_out_w_mem_5_data),
    .auto_out_w_mem_5_strb(axi4asource_auto_out_w_mem_5_strb),
    .auto_out_w_mem_5_last(axi4asource_auto_out_w_mem_5_last),
    .auto_out_w_mem_6_data(axi4asource_auto_out_w_mem_6_data),
    .auto_out_w_mem_6_strb(axi4asource_auto_out_w_mem_6_strb),
    .auto_out_w_mem_6_last(axi4asource_auto_out_w_mem_6_last),
    .auto_out_w_mem_7_data(axi4asource_auto_out_w_mem_7_data),
    .auto_out_w_mem_7_strb(axi4asource_auto_out_w_mem_7_strb),
    .auto_out_w_mem_7_last(axi4asource_auto_out_w_mem_7_last),
    .auto_out_w_ridx(axi4asource_auto_out_w_ridx),
    .auto_out_w_widx(axi4asource_auto_out_w_widx),
    .auto_out_w_safe_ridx_valid(axi4asource_auto_out_w_safe_ridx_valid),
    .auto_out_w_safe_widx_valid(axi4asource_auto_out_w_safe_widx_valid),
    .auto_out_w_safe_source_reset_n(axi4asource_auto_out_w_safe_source_reset_n),
    .auto_out_w_safe_sink_reset_n(axi4asource_auto_out_w_safe_sink_reset_n),
    .auto_out_b_mem_0_id(axi4asource_auto_out_b_mem_0_id),
    .auto_out_b_mem_0_resp(axi4asource_auto_out_b_mem_0_resp),
    .auto_out_b_mem_1_id(axi4asource_auto_out_b_mem_1_id),
    .auto_out_b_mem_1_resp(axi4asource_auto_out_b_mem_1_resp),
    .auto_out_b_mem_2_id(axi4asource_auto_out_b_mem_2_id),
    .auto_out_b_mem_2_resp(axi4asource_auto_out_b_mem_2_resp),
    .auto_out_b_mem_3_id(axi4asource_auto_out_b_mem_3_id),
    .auto_out_b_mem_3_resp(axi4asource_auto_out_b_mem_3_resp),
    .auto_out_b_mem_4_id(axi4asource_auto_out_b_mem_4_id),
    .auto_out_b_mem_4_resp(axi4asource_auto_out_b_mem_4_resp),
    .auto_out_b_mem_5_id(axi4asource_auto_out_b_mem_5_id),
    .auto_out_b_mem_5_resp(axi4asource_auto_out_b_mem_5_resp),
    .auto_out_b_mem_6_id(axi4asource_auto_out_b_mem_6_id),
    .auto_out_b_mem_6_resp(axi4asource_auto_out_b_mem_6_resp),
    .auto_out_b_mem_7_id(axi4asource_auto_out_b_mem_7_id),
    .auto_out_b_mem_7_resp(axi4asource_auto_out_b_mem_7_resp),
    .auto_out_b_ridx(axi4asource_auto_out_b_ridx),
    .auto_out_b_widx(axi4asource_auto_out_b_widx),
    .auto_out_b_safe_ridx_valid(axi4asource_auto_out_b_safe_ridx_valid),
    .auto_out_b_safe_widx_valid(axi4asource_auto_out_b_safe_widx_valid),
    .auto_out_b_safe_source_reset_n(axi4asource_auto_out_b_safe_source_reset_n),
    .auto_out_b_safe_sink_reset_n(axi4asource_auto_out_b_safe_sink_reset_n),
    .auto_out_ar_mem_0_id(axi4asource_auto_out_ar_mem_0_id),
    .auto_out_ar_mem_0_addr(axi4asource_auto_out_ar_mem_0_addr),
    .auto_out_ar_mem_0_len(axi4asource_auto_out_ar_mem_0_len),
    .auto_out_ar_mem_0_size(axi4asource_auto_out_ar_mem_0_size),
    .auto_out_ar_mem_0_burst(axi4asource_auto_out_ar_mem_0_burst),
    .auto_out_ar_mem_0_lock(axi4asource_auto_out_ar_mem_0_lock),
    .auto_out_ar_mem_0_cache(axi4asource_auto_out_ar_mem_0_cache),
    .auto_out_ar_mem_0_prot(axi4asource_auto_out_ar_mem_0_prot),
    .auto_out_ar_mem_0_qos(axi4asource_auto_out_ar_mem_0_qos),
    .auto_out_ar_mem_1_id(axi4asource_auto_out_ar_mem_1_id),
    .auto_out_ar_mem_1_addr(axi4asource_auto_out_ar_mem_1_addr),
    .auto_out_ar_mem_1_len(axi4asource_auto_out_ar_mem_1_len),
    .auto_out_ar_mem_1_size(axi4asource_auto_out_ar_mem_1_size),
    .auto_out_ar_mem_1_burst(axi4asource_auto_out_ar_mem_1_burst),
    .auto_out_ar_mem_1_lock(axi4asource_auto_out_ar_mem_1_lock),
    .auto_out_ar_mem_1_cache(axi4asource_auto_out_ar_mem_1_cache),
    .auto_out_ar_mem_1_prot(axi4asource_auto_out_ar_mem_1_prot),
    .auto_out_ar_mem_1_qos(axi4asource_auto_out_ar_mem_1_qos),
    .auto_out_ar_mem_2_id(axi4asource_auto_out_ar_mem_2_id),
    .auto_out_ar_mem_2_addr(axi4asource_auto_out_ar_mem_2_addr),
    .auto_out_ar_mem_2_len(axi4asource_auto_out_ar_mem_2_len),
    .auto_out_ar_mem_2_size(axi4asource_auto_out_ar_mem_2_size),
    .auto_out_ar_mem_2_burst(axi4asource_auto_out_ar_mem_2_burst),
    .auto_out_ar_mem_2_lock(axi4asource_auto_out_ar_mem_2_lock),
    .auto_out_ar_mem_2_cache(axi4asource_auto_out_ar_mem_2_cache),
    .auto_out_ar_mem_2_prot(axi4asource_auto_out_ar_mem_2_prot),
    .auto_out_ar_mem_2_qos(axi4asource_auto_out_ar_mem_2_qos),
    .auto_out_ar_mem_3_id(axi4asource_auto_out_ar_mem_3_id),
    .auto_out_ar_mem_3_addr(axi4asource_auto_out_ar_mem_3_addr),
    .auto_out_ar_mem_3_len(axi4asource_auto_out_ar_mem_3_len),
    .auto_out_ar_mem_3_size(axi4asource_auto_out_ar_mem_3_size),
    .auto_out_ar_mem_3_burst(axi4asource_auto_out_ar_mem_3_burst),
    .auto_out_ar_mem_3_lock(axi4asource_auto_out_ar_mem_3_lock),
    .auto_out_ar_mem_3_cache(axi4asource_auto_out_ar_mem_3_cache),
    .auto_out_ar_mem_3_prot(axi4asource_auto_out_ar_mem_3_prot),
    .auto_out_ar_mem_3_qos(axi4asource_auto_out_ar_mem_3_qos),
    .auto_out_ar_mem_4_id(axi4asource_auto_out_ar_mem_4_id),
    .auto_out_ar_mem_4_addr(axi4asource_auto_out_ar_mem_4_addr),
    .auto_out_ar_mem_4_len(axi4asource_auto_out_ar_mem_4_len),
    .auto_out_ar_mem_4_size(axi4asource_auto_out_ar_mem_4_size),
    .auto_out_ar_mem_4_burst(axi4asource_auto_out_ar_mem_4_burst),
    .auto_out_ar_mem_4_lock(axi4asource_auto_out_ar_mem_4_lock),
    .auto_out_ar_mem_4_cache(axi4asource_auto_out_ar_mem_4_cache),
    .auto_out_ar_mem_4_prot(axi4asource_auto_out_ar_mem_4_prot),
    .auto_out_ar_mem_4_qos(axi4asource_auto_out_ar_mem_4_qos),
    .auto_out_ar_mem_5_id(axi4asource_auto_out_ar_mem_5_id),
    .auto_out_ar_mem_5_addr(axi4asource_auto_out_ar_mem_5_addr),
    .auto_out_ar_mem_5_len(axi4asource_auto_out_ar_mem_5_len),
    .auto_out_ar_mem_5_size(axi4asource_auto_out_ar_mem_5_size),
    .auto_out_ar_mem_5_burst(axi4asource_auto_out_ar_mem_5_burst),
    .auto_out_ar_mem_5_lock(axi4asource_auto_out_ar_mem_5_lock),
    .auto_out_ar_mem_5_cache(axi4asource_auto_out_ar_mem_5_cache),
    .auto_out_ar_mem_5_prot(axi4asource_auto_out_ar_mem_5_prot),
    .auto_out_ar_mem_5_qos(axi4asource_auto_out_ar_mem_5_qos),
    .auto_out_ar_mem_6_id(axi4asource_auto_out_ar_mem_6_id),
    .auto_out_ar_mem_6_addr(axi4asource_auto_out_ar_mem_6_addr),
    .auto_out_ar_mem_6_len(axi4asource_auto_out_ar_mem_6_len),
    .auto_out_ar_mem_6_size(axi4asource_auto_out_ar_mem_6_size),
    .auto_out_ar_mem_6_burst(axi4asource_auto_out_ar_mem_6_burst),
    .auto_out_ar_mem_6_lock(axi4asource_auto_out_ar_mem_6_lock),
    .auto_out_ar_mem_6_cache(axi4asource_auto_out_ar_mem_6_cache),
    .auto_out_ar_mem_6_prot(axi4asource_auto_out_ar_mem_6_prot),
    .auto_out_ar_mem_6_qos(axi4asource_auto_out_ar_mem_6_qos),
    .auto_out_ar_mem_7_id(axi4asource_auto_out_ar_mem_7_id),
    .auto_out_ar_mem_7_addr(axi4asource_auto_out_ar_mem_7_addr),
    .auto_out_ar_mem_7_len(axi4asource_auto_out_ar_mem_7_len),
    .auto_out_ar_mem_7_size(axi4asource_auto_out_ar_mem_7_size),
    .auto_out_ar_mem_7_burst(axi4asource_auto_out_ar_mem_7_burst),
    .auto_out_ar_mem_7_lock(axi4asource_auto_out_ar_mem_7_lock),
    .auto_out_ar_mem_7_cache(axi4asource_auto_out_ar_mem_7_cache),
    .auto_out_ar_mem_7_prot(axi4asource_auto_out_ar_mem_7_prot),
    .auto_out_ar_mem_7_qos(axi4asource_auto_out_ar_mem_7_qos),
    .auto_out_ar_ridx(axi4asource_auto_out_ar_ridx),
    .auto_out_ar_widx(axi4asource_auto_out_ar_widx),
    .auto_out_ar_safe_ridx_valid(axi4asource_auto_out_ar_safe_ridx_valid),
    .auto_out_ar_safe_widx_valid(axi4asource_auto_out_ar_safe_widx_valid),
    .auto_out_ar_safe_source_reset_n(axi4asource_auto_out_ar_safe_source_reset_n),
    .auto_out_ar_safe_sink_reset_n(axi4asource_auto_out_ar_safe_sink_reset_n),
    .auto_out_r_mem_0_id(axi4asource_auto_out_r_mem_0_id),
    .auto_out_r_mem_0_data(axi4asource_auto_out_r_mem_0_data),
    .auto_out_r_mem_0_resp(axi4asource_auto_out_r_mem_0_resp),
    .auto_out_r_mem_0_last(axi4asource_auto_out_r_mem_0_last),
    .auto_out_r_mem_1_id(axi4asource_auto_out_r_mem_1_id),
    .auto_out_r_mem_1_data(axi4asource_auto_out_r_mem_1_data),
    .auto_out_r_mem_1_resp(axi4asource_auto_out_r_mem_1_resp),
    .auto_out_r_mem_1_last(axi4asource_auto_out_r_mem_1_last),
    .auto_out_r_mem_2_id(axi4asource_auto_out_r_mem_2_id),
    .auto_out_r_mem_2_data(axi4asource_auto_out_r_mem_2_data),
    .auto_out_r_mem_2_resp(axi4asource_auto_out_r_mem_2_resp),
    .auto_out_r_mem_2_last(axi4asource_auto_out_r_mem_2_last),
    .auto_out_r_mem_3_id(axi4asource_auto_out_r_mem_3_id),
    .auto_out_r_mem_3_data(axi4asource_auto_out_r_mem_3_data),
    .auto_out_r_mem_3_resp(axi4asource_auto_out_r_mem_3_resp),
    .auto_out_r_mem_3_last(axi4asource_auto_out_r_mem_3_last),
    .auto_out_r_mem_4_id(axi4asource_auto_out_r_mem_4_id),
    .auto_out_r_mem_4_data(axi4asource_auto_out_r_mem_4_data),
    .auto_out_r_mem_4_resp(axi4asource_auto_out_r_mem_4_resp),
    .auto_out_r_mem_4_last(axi4asource_auto_out_r_mem_4_last),
    .auto_out_r_mem_5_id(axi4asource_auto_out_r_mem_5_id),
    .auto_out_r_mem_5_data(axi4asource_auto_out_r_mem_5_data),
    .auto_out_r_mem_5_resp(axi4asource_auto_out_r_mem_5_resp),
    .auto_out_r_mem_5_last(axi4asource_auto_out_r_mem_5_last),
    .auto_out_r_mem_6_id(axi4asource_auto_out_r_mem_6_id),
    .auto_out_r_mem_6_data(axi4asource_auto_out_r_mem_6_data),
    .auto_out_r_mem_6_resp(axi4asource_auto_out_r_mem_6_resp),
    .auto_out_r_mem_6_last(axi4asource_auto_out_r_mem_6_last),
    .auto_out_r_mem_7_id(axi4asource_auto_out_r_mem_7_id),
    .auto_out_r_mem_7_data(axi4asource_auto_out_r_mem_7_data),
    .auto_out_r_mem_7_resp(axi4asource_auto_out_r_mem_7_resp),
    .auto_out_r_mem_7_last(axi4asource_auto_out_r_mem_7_last),
    .auto_out_r_ridx(axi4asource_auto_out_r_ridx),
    .auto_out_r_widx(axi4asource_auto_out_r_widx),
    .auto_out_r_safe_ridx_valid(axi4asource_auto_out_r_safe_ridx_valid),
    .auto_out_r_safe_widx_valid(axi4asource_auto_out_r_safe_widx_valid),
    .auto_out_r_safe_source_reset_n(axi4asource_auto_out_r_safe_source_reset_n),
    .auto_out_r_safe_sink_reset_n(axi4asource_auto_out_r_safe_sink_reset_n)
  );
  
`endif

  XilinxVC707MIGIsland island ( 
    .transferDataReg(transferDataReg),
    .send_1p_valid(send_1p_valid),
    .b2c_data_concat(b2c_data_concat),
    .b2c_data_valid(b2c_data_valid),

    .ddr_io_c2b_clk(ddr_io_c2b_clk)
    ,.ddr_io_c2b_rst(ddr_io_c2b_rst)
    ,.ddr_io_c2b_send(ddr_io_c2b_send)
    ,.ddr_io_c2b_data(ddr_io_c2b_data)
    ,.ddr_io_b2c_clk(ddr_io_b2c_clk)
    ,.ddr_io_b2c_rst(ddr_io_b2c_rst)
    ,.ddr_io_b2c_send(ddr_io_b2c_send)
    ,.ddr_io_b2c_data(ddr_io_b2c_data),
    .chiplink_clock(chiplink_clock),
    .chiplink_reset(chiplink_reset),
    .mig_input_takeover_en(mig_input_takeover_en),
  `ifdef CHIPLINK_CONNECT_DIRECT_TL
    .widget_auto_in_a_ready(toaxi4_shrink_auto_in_a_ready),
    .widget_auto_in_a_valid(toaxi4_shrink_auto_in_a_valid),
    .widget_auto_in_a_bits_opcode(toaxi4_shrink_auto_in_a_bits_opcode),
    //.widget_auto_in_a_bits_param(toaxi4_shrink_auto_in_a_bits_param),
    .widget_auto_in_a_bits_size(toaxi4_shrink_auto_in_a_bits_size),
    .widget_auto_in_a_bits_source(toaxi4_shrink_auto_in_a_bits_source),
    .widget_auto_in_a_bits_address(toaxi4_shrink_auto_in_a_bits_address),
    .widget_auto_in_a_bits_mask(toaxi4_shrink_auto_in_a_bits_mask),
    .widget_auto_in_a_bits_data(toaxi4_shrink_auto_in_a_bits_data),
    //.widget_auto_in_a_bits_corrupt(toaxi4_shrink_auto_in_a_bits_corrupt),
    .widget_auto_in_d_ready(toaxi4_shrink_auto_in_d_ready),
    .widget_auto_in_d_valid(toaxi4_shrink_auto_in_d_valid),
    .widget_auto_in_d_bits_opcode(toaxi4_shrink_auto_in_d_bits_opcode),
    //.widget_auto_in_d_bits_param(2'b0),
    .widget_auto_in_d_bits_size(toaxi4_shrink_auto_in_d_bits_size),
    .widget_auto_in_d_bits_source(toaxi4_shrink_auto_in_d_bits_source),
    //.widget_auto_in_d_bits_sink(1'b0),
    .widget_auto_in_d_bits_denied(toaxi4_shrink_auto_in_d_bits_denied),
    .widget_auto_in_d_bits_data(toaxi4_shrink_auto_in_d_bits_data),
    .widget_auto_in_d_bits_corrupt(toaxi4_shrink_auto_in_d_bits_corrupt),
  `endif
    .ddr_master_0_awready(ddr_master_0_awready)
    ,.ddr_master_0_awvalid(ddr_master_0_awvalid)
    ,.ddr_master_0_awid(ddr_master_0_awid)
    ,.ddr_master_0_awaddr(ddr_master_0_awaddr)
    ,.ddr_master_0_awlen(ddr_master_0_awlen)
    ,.ddr_master_0_awsize(ddr_master_0_awsize)
    ,.ddr_master_0_awburst(ddr_master_0_awburst)
    ,.ddr_master_0_wready(ddr_master_0_wready)
    ,.ddr_master_0_wvalid(ddr_master_0_wvalid)
    ,.ddr_master_0_wdata(ddr_master_0_wdata)
    ,.ddr_master_0_wstrb(ddr_master_0_wstrb)
    ,.ddr_master_0_wlast(ddr_master_0_wlast)
    ,.ddr_master_0_bready(ddr_master_0_bready)
    ,.ddr_master_0_bvalid(ddr_master_0_bvalid)
    ,.ddr_master_0_bid(ddr_master_0_bid)
    ,.ddr_master_0_bresp(ddr_master_0_bresp)
    ,.ddr_master_0_arready(ddr_master_0_arready)
    ,.ddr_master_0_arvalid(ddr_master_0_arvalid)
    ,.ddr_master_0_arid(ddr_master_0_arid)
    ,.ddr_master_0_araddr(ddr_master_0_araddr)
    ,.ddr_master_0_arlen(ddr_master_0_arlen)
    ,.ddr_master_0_arsize(ddr_master_0_arsize)
    ,.ddr_master_0_arburst(ddr_master_0_arburst)
    ,.ddr_master_0_rready(ddr_master_0_rready)
    ,.ddr_master_0_rvalid(ddr_master_0_rvalid)
    ,.ddr_master_0_rid(ddr_master_0_rid)
    ,.ddr_master_0_rdata(ddr_master_0_rdata)
    ,.ddr_master_0_rresp(ddr_master_0_rresp)
    ,.ddr_master_0_rlast(ddr_master_0_rlast),
  `ifndef CHIPLINK_CONNECT_DIRECT_TL
    .auto_axi4in_xing_in_aw_mem_0_id(island_auto_axi4in_xing_in_aw_mem_0_id),
    .auto_axi4in_xing_in_aw_mem_0_addr(island_auto_axi4in_xing_in_aw_mem_0_addr),
    .auto_axi4in_xing_in_aw_mem_0_len(island_auto_axi4in_xing_in_aw_mem_0_len),
    .auto_axi4in_xing_in_aw_mem_0_size(island_auto_axi4in_xing_in_aw_mem_0_size),
    .auto_axi4in_xing_in_aw_mem_0_burst(island_auto_axi4in_xing_in_aw_mem_0_burst),
    .auto_axi4in_xing_in_aw_mem_0_lock(island_auto_axi4in_xing_in_aw_mem_0_lock),
    .auto_axi4in_xing_in_aw_mem_0_cache(island_auto_axi4in_xing_in_aw_mem_0_cache),
    .auto_axi4in_xing_in_aw_mem_0_prot(island_auto_axi4in_xing_in_aw_mem_0_prot),
    .auto_axi4in_xing_in_aw_mem_0_qos(island_auto_axi4in_xing_in_aw_mem_0_qos),
    .auto_axi4in_xing_in_aw_mem_1_id(island_auto_axi4in_xing_in_aw_mem_1_id),
    .auto_axi4in_xing_in_aw_mem_1_addr(island_auto_axi4in_xing_in_aw_mem_1_addr),
    .auto_axi4in_xing_in_aw_mem_1_len(island_auto_axi4in_xing_in_aw_mem_1_len),
    .auto_axi4in_xing_in_aw_mem_1_size(island_auto_axi4in_xing_in_aw_mem_1_size),
    .auto_axi4in_xing_in_aw_mem_1_burst(island_auto_axi4in_xing_in_aw_mem_1_burst),
    .auto_axi4in_xing_in_aw_mem_1_lock(island_auto_axi4in_xing_in_aw_mem_1_lock),
    .auto_axi4in_xing_in_aw_mem_1_cache(island_auto_axi4in_xing_in_aw_mem_1_cache),
    .auto_axi4in_xing_in_aw_mem_1_prot(island_auto_axi4in_xing_in_aw_mem_1_prot),
    .auto_axi4in_xing_in_aw_mem_1_qos(island_auto_axi4in_xing_in_aw_mem_1_qos),
    .auto_axi4in_xing_in_aw_mem_2_id(island_auto_axi4in_xing_in_aw_mem_2_id),
    .auto_axi4in_xing_in_aw_mem_2_addr(island_auto_axi4in_xing_in_aw_mem_2_addr),
    .auto_axi4in_xing_in_aw_mem_2_len(island_auto_axi4in_xing_in_aw_mem_2_len),
    .auto_axi4in_xing_in_aw_mem_2_size(island_auto_axi4in_xing_in_aw_mem_2_size),
    .auto_axi4in_xing_in_aw_mem_2_burst(island_auto_axi4in_xing_in_aw_mem_2_burst),
    .auto_axi4in_xing_in_aw_mem_2_lock(island_auto_axi4in_xing_in_aw_mem_2_lock),
    .auto_axi4in_xing_in_aw_mem_2_cache(island_auto_axi4in_xing_in_aw_mem_2_cache),
    .auto_axi4in_xing_in_aw_mem_2_prot(island_auto_axi4in_xing_in_aw_mem_2_prot),
    .auto_axi4in_xing_in_aw_mem_2_qos(island_auto_axi4in_xing_in_aw_mem_2_qos),
    .auto_axi4in_xing_in_aw_mem_3_id(island_auto_axi4in_xing_in_aw_mem_3_id),
    .auto_axi4in_xing_in_aw_mem_3_addr(island_auto_axi4in_xing_in_aw_mem_3_addr),
    .auto_axi4in_xing_in_aw_mem_3_len(island_auto_axi4in_xing_in_aw_mem_3_len),
    .auto_axi4in_xing_in_aw_mem_3_size(island_auto_axi4in_xing_in_aw_mem_3_size),
    .auto_axi4in_xing_in_aw_mem_3_burst(island_auto_axi4in_xing_in_aw_mem_3_burst),
    .auto_axi4in_xing_in_aw_mem_3_lock(island_auto_axi4in_xing_in_aw_mem_3_lock),
    .auto_axi4in_xing_in_aw_mem_3_cache(island_auto_axi4in_xing_in_aw_mem_3_cache),
    .auto_axi4in_xing_in_aw_mem_3_prot(island_auto_axi4in_xing_in_aw_mem_3_prot),
    .auto_axi4in_xing_in_aw_mem_3_qos(island_auto_axi4in_xing_in_aw_mem_3_qos),
    .auto_axi4in_xing_in_aw_mem_4_id(island_auto_axi4in_xing_in_aw_mem_4_id),
    .auto_axi4in_xing_in_aw_mem_4_addr(island_auto_axi4in_xing_in_aw_mem_4_addr),
    .auto_axi4in_xing_in_aw_mem_4_len(island_auto_axi4in_xing_in_aw_mem_4_len),
    .auto_axi4in_xing_in_aw_mem_4_size(island_auto_axi4in_xing_in_aw_mem_4_size),
    .auto_axi4in_xing_in_aw_mem_4_burst(island_auto_axi4in_xing_in_aw_mem_4_burst),
    .auto_axi4in_xing_in_aw_mem_4_lock(island_auto_axi4in_xing_in_aw_mem_4_lock),
    .auto_axi4in_xing_in_aw_mem_4_cache(island_auto_axi4in_xing_in_aw_mem_4_cache),
    .auto_axi4in_xing_in_aw_mem_4_prot(island_auto_axi4in_xing_in_aw_mem_4_prot),
    .auto_axi4in_xing_in_aw_mem_4_qos(island_auto_axi4in_xing_in_aw_mem_4_qos),
    .auto_axi4in_xing_in_aw_mem_5_id(island_auto_axi4in_xing_in_aw_mem_5_id),
    .auto_axi4in_xing_in_aw_mem_5_addr(island_auto_axi4in_xing_in_aw_mem_5_addr),
    .auto_axi4in_xing_in_aw_mem_5_len(island_auto_axi4in_xing_in_aw_mem_5_len),
    .auto_axi4in_xing_in_aw_mem_5_size(island_auto_axi4in_xing_in_aw_mem_5_size),
    .auto_axi4in_xing_in_aw_mem_5_burst(island_auto_axi4in_xing_in_aw_mem_5_burst),
    .auto_axi4in_xing_in_aw_mem_5_lock(island_auto_axi4in_xing_in_aw_mem_5_lock),
    .auto_axi4in_xing_in_aw_mem_5_cache(island_auto_axi4in_xing_in_aw_mem_5_cache),
    .auto_axi4in_xing_in_aw_mem_5_prot(island_auto_axi4in_xing_in_aw_mem_5_prot),
    .auto_axi4in_xing_in_aw_mem_5_qos(island_auto_axi4in_xing_in_aw_mem_5_qos),
    .auto_axi4in_xing_in_aw_mem_6_id(island_auto_axi4in_xing_in_aw_mem_6_id),
    .auto_axi4in_xing_in_aw_mem_6_addr(island_auto_axi4in_xing_in_aw_mem_6_addr),
    .auto_axi4in_xing_in_aw_mem_6_len(island_auto_axi4in_xing_in_aw_mem_6_len),
    .auto_axi4in_xing_in_aw_mem_6_size(island_auto_axi4in_xing_in_aw_mem_6_size),
    .auto_axi4in_xing_in_aw_mem_6_burst(island_auto_axi4in_xing_in_aw_mem_6_burst),
    .auto_axi4in_xing_in_aw_mem_6_lock(island_auto_axi4in_xing_in_aw_mem_6_lock),
    .auto_axi4in_xing_in_aw_mem_6_cache(island_auto_axi4in_xing_in_aw_mem_6_cache),
    .auto_axi4in_xing_in_aw_mem_6_prot(island_auto_axi4in_xing_in_aw_mem_6_prot),
    .auto_axi4in_xing_in_aw_mem_6_qos(island_auto_axi4in_xing_in_aw_mem_6_qos),
    .auto_axi4in_xing_in_aw_mem_7_id(island_auto_axi4in_xing_in_aw_mem_7_id),
    .auto_axi4in_xing_in_aw_mem_7_addr(island_auto_axi4in_xing_in_aw_mem_7_addr),
    .auto_axi4in_xing_in_aw_mem_7_len(island_auto_axi4in_xing_in_aw_mem_7_len),
    .auto_axi4in_xing_in_aw_mem_7_size(island_auto_axi4in_xing_in_aw_mem_7_size),
    .auto_axi4in_xing_in_aw_mem_7_burst(island_auto_axi4in_xing_in_aw_mem_7_burst),
    .auto_axi4in_xing_in_aw_mem_7_lock(island_auto_axi4in_xing_in_aw_mem_7_lock),
    .auto_axi4in_xing_in_aw_mem_7_cache(island_auto_axi4in_xing_in_aw_mem_7_cache),
    .auto_axi4in_xing_in_aw_mem_7_prot(island_auto_axi4in_xing_in_aw_mem_7_prot),
    .auto_axi4in_xing_in_aw_mem_7_qos(island_auto_axi4in_xing_in_aw_mem_7_qos),
    .auto_axi4in_xing_in_aw_ridx(island_auto_axi4in_xing_in_aw_ridx),
    .auto_axi4in_xing_in_aw_widx(island_auto_axi4in_xing_in_aw_widx),
    .auto_axi4in_xing_in_aw_safe_ridx_valid(island_auto_axi4in_xing_in_aw_safe_ridx_valid),
    .auto_axi4in_xing_in_aw_safe_widx_valid(island_auto_axi4in_xing_in_aw_safe_widx_valid),
    .auto_axi4in_xing_in_aw_safe_source_reset_n(island_auto_axi4in_xing_in_aw_safe_source_reset_n),
    .auto_axi4in_xing_in_aw_safe_sink_reset_n(island_auto_axi4in_xing_in_aw_safe_sink_reset_n),
    .auto_axi4in_xing_in_w_mem_0_data(island_auto_axi4in_xing_in_w_mem_0_data),
    .auto_axi4in_xing_in_w_mem_0_strb(island_auto_axi4in_xing_in_w_mem_0_strb),
    .auto_axi4in_xing_in_w_mem_0_last(island_auto_axi4in_xing_in_w_mem_0_last),
    .auto_axi4in_xing_in_w_mem_1_data(island_auto_axi4in_xing_in_w_mem_1_data),
    .auto_axi4in_xing_in_w_mem_1_strb(island_auto_axi4in_xing_in_w_mem_1_strb),
    .auto_axi4in_xing_in_w_mem_1_last(island_auto_axi4in_xing_in_w_mem_1_last),
    .auto_axi4in_xing_in_w_mem_2_data(island_auto_axi4in_xing_in_w_mem_2_data),
    .auto_axi4in_xing_in_w_mem_2_strb(island_auto_axi4in_xing_in_w_mem_2_strb),
    .auto_axi4in_xing_in_w_mem_2_last(island_auto_axi4in_xing_in_w_mem_2_last),
    .auto_axi4in_xing_in_w_mem_3_data(island_auto_axi4in_xing_in_w_mem_3_data),
    .auto_axi4in_xing_in_w_mem_3_strb(island_auto_axi4in_xing_in_w_mem_3_strb),
    .auto_axi4in_xing_in_w_mem_3_last(island_auto_axi4in_xing_in_w_mem_3_last),
    .auto_axi4in_xing_in_w_mem_4_data(island_auto_axi4in_xing_in_w_mem_4_data),
    .auto_axi4in_xing_in_w_mem_4_strb(island_auto_axi4in_xing_in_w_mem_4_strb),
    .auto_axi4in_xing_in_w_mem_4_last(island_auto_axi4in_xing_in_w_mem_4_last),
    .auto_axi4in_xing_in_w_mem_5_data(island_auto_axi4in_xing_in_w_mem_5_data),
    .auto_axi4in_xing_in_w_mem_5_strb(island_auto_axi4in_xing_in_w_mem_5_strb),
    .auto_axi4in_xing_in_w_mem_5_last(island_auto_axi4in_xing_in_w_mem_5_last),
    .auto_axi4in_xing_in_w_mem_6_data(island_auto_axi4in_xing_in_w_mem_6_data),
    .auto_axi4in_xing_in_w_mem_6_strb(island_auto_axi4in_xing_in_w_mem_6_strb),
    .auto_axi4in_xing_in_w_mem_6_last(island_auto_axi4in_xing_in_w_mem_6_last),
    .auto_axi4in_xing_in_w_mem_7_data(island_auto_axi4in_xing_in_w_mem_7_data),
    .auto_axi4in_xing_in_w_mem_7_strb(island_auto_axi4in_xing_in_w_mem_7_strb),
    .auto_axi4in_xing_in_w_mem_7_last(island_auto_axi4in_xing_in_w_mem_7_last),
    .auto_axi4in_xing_in_w_ridx(island_auto_axi4in_xing_in_w_ridx),
    .auto_axi4in_xing_in_w_widx(island_auto_axi4in_xing_in_w_widx),
    .auto_axi4in_xing_in_w_safe_ridx_valid(island_auto_axi4in_xing_in_w_safe_ridx_valid),
    .auto_axi4in_xing_in_w_safe_widx_valid(island_auto_axi4in_xing_in_w_safe_widx_valid),
    .auto_axi4in_xing_in_w_safe_source_reset_n(island_auto_axi4in_xing_in_w_safe_source_reset_n),
    .auto_axi4in_xing_in_w_safe_sink_reset_n(island_auto_axi4in_xing_in_w_safe_sink_reset_n),
    .auto_axi4in_xing_in_b_mem_0_id(island_auto_axi4in_xing_in_b_mem_0_id),
    .auto_axi4in_xing_in_b_mem_0_resp(island_auto_axi4in_xing_in_b_mem_0_resp),
    .auto_axi4in_xing_in_b_mem_1_id(island_auto_axi4in_xing_in_b_mem_1_id),
    .auto_axi4in_xing_in_b_mem_1_resp(island_auto_axi4in_xing_in_b_mem_1_resp),
    .auto_axi4in_xing_in_b_mem_2_id(island_auto_axi4in_xing_in_b_mem_2_id),
    .auto_axi4in_xing_in_b_mem_2_resp(island_auto_axi4in_xing_in_b_mem_2_resp),
    .auto_axi4in_xing_in_b_mem_3_id(island_auto_axi4in_xing_in_b_mem_3_id),
    .auto_axi4in_xing_in_b_mem_3_resp(island_auto_axi4in_xing_in_b_mem_3_resp),
    .auto_axi4in_xing_in_b_mem_4_id(island_auto_axi4in_xing_in_b_mem_4_id),
    .auto_axi4in_xing_in_b_mem_4_resp(island_auto_axi4in_xing_in_b_mem_4_resp),
    .auto_axi4in_xing_in_b_mem_5_id(island_auto_axi4in_xing_in_b_mem_5_id),
    .auto_axi4in_xing_in_b_mem_5_resp(island_auto_axi4in_xing_in_b_mem_5_resp),
    .auto_axi4in_xing_in_b_mem_6_id(island_auto_axi4in_xing_in_b_mem_6_id),
    .auto_axi4in_xing_in_b_mem_6_resp(island_auto_axi4in_xing_in_b_mem_6_resp),
    .auto_axi4in_xing_in_b_mem_7_id(island_auto_axi4in_xing_in_b_mem_7_id),
    .auto_axi4in_xing_in_b_mem_7_resp(island_auto_axi4in_xing_in_b_mem_7_resp),
    .auto_axi4in_xing_in_b_ridx(island_auto_axi4in_xing_in_b_ridx),
    .auto_axi4in_xing_in_b_widx(island_auto_axi4in_xing_in_b_widx),
    .auto_axi4in_xing_in_b_safe_ridx_valid(island_auto_axi4in_xing_in_b_safe_ridx_valid),
    .auto_axi4in_xing_in_b_safe_widx_valid(island_auto_axi4in_xing_in_b_safe_widx_valid),
    .auto_axi4in_xing_in_b_safe_source_reset_n(island_auto_axi4in_xing_in_b_safe_source_reset_n),
    .auto_axi4in_xing_in_b_safe_sink_reset_n(island_auto_axi4in_xing_in_b_safe_sink_reset_n),
    .auto_axi4in_xing_in_ar_mem_0_id(island_auto_axi4in_xing_in_ar_mem_0_id),
    .auto_axi4in_xing_in_ar_mem_0_addr(island_auto_axi4in_xing_in_ar_mem_0_addr),
    .auto_axi4in_xing_in_ar_mem_0_len(island_auto_axi4in_xing_in_ar_mem_0_len),
    .auto_axi4in_xing_in_ar_mem_0_size(island_auto_axi4in_xing_in_ar_mem_0_size),
    .auto_axi4in_xing_in_ar_mem_0_burst(island_auto_axi4in_xing_in_ar_mem_0_burst),
    .auto_axi4in_xing_in_ar_mem_0_lock(island_auto_axi4in_xing_in_ar_mem_0_lock),
    .auto_axi4in_xing_in_ar_mem_0_cache(island_auto_axi4in_xing_in_ar_mem_0_cache),
    .auto_axi4in_xing_in_ar_mem_0_prot(island_auto_axi4in_xing_in_ar_mem_0_prot),
    .auto_axi4in_xing_in_ar_mem_0_qos(island_auto_axi4in_xing_in_ar_mem_0_qos),
    .auto_axi4in_xing_in_ar_mem_1_id(island_auto_axi4in_xing_in_ar_mem_1_id),
    .auto_axi4in_xing_in_ar_mem_1_addr(island_auto_axi4in_xing_in_ar_mem_1_addr),
    .auto_axi4in_xing_in_ar_mem_1_len(island_auto_axi4in_xing_in_ar_mem_1_len),
    .auto_axi4in_xing_in_ar_mem_1_size(island_auto_axi4in_xing_in_ar_mem_1_size),
    .auto_axi4in_xing_in_ar_mem_1_burst(island_auto_axi4in_xing_in_ar_mem_1_burst),
    .auto_axi4in_xing_in_ar_mem_1_lock(island_auto_axi4in_xing_in_ar_mem_1_lock),
    .auto_axi4in_xing_in_ar_mem_1_cache(island_auto_axi4in_xing_in_ar_mem_1_cache),
    .auto_axi4in_xing_in_ar_mem_1_prot(island_auto_axi4in_xing_in_ar_mem_1_prot),
    .auto_axi4in_xing_in_ar_mem_1_qos(island_auto_axi4in_xing_in_ar_mem_1_qos),
    .auto_axi4in_xing_in_ar_mem_2_id(island_auto_axi4in_xing_in_ar_mem_2_id),
    .auto_axi4in_xing_in_ar_mem_2_addr(island_auto_axi4in_xing_in_ar_mem_2_addr),
    .auto_axi4in_xing_in_ar_mem_2_len(island_auto_axi4in_xing_in_ar_mem_2_len),
    .auto_axi4in_xing_in_ar_mem_2_size(island_auto_axi4in_xing_in_ar_mem_2_size),
    .auto_axi4in_xing_in_ar_mem_2_burst(island_auto_axi4in_xing_in_ar_mem_2_burst),
    .auto_axi4in_xing_in_ar_mem_2_lock(island_auto_axi4in_xing_in_ar_mem_2_lock),
    .auto_axi4in_xing_in_ar_mem_2_cache(island_auto_axi4in_xing_in_ar_mem_2_cache),
    .auto_axi4in_xing_in_ar_mem_2_prot(island_auto_axi4in_xing_in_ar_mem_2_prot),
    .auto_axi4in_xing_in_ar_mem_2_qos(island_auto_axi4in_xing_in_ar_mem_2_qos),
    .auto_axi4in_xing_in_ar_mem_3_id(island_auto_axi4in_xing_in_ar_mem_3_id),
    .auto_axi4in_xing_in_ar_mem_3_addr(island_auto_axi4in_xing_in_ar_mem_3_addr),
    .auto_axi4in_xing_in_ar_mem_3_len(island_auto_axi4in_xing_in_ar_mem_3_len),
    .auto_axi4in_xing_in_ar_mem_3_size(island_auto_axi4in_xing_in_ar_mem_3_size),
    .auto_axi4in_xing_in_ar_mem_3_burst(island_auto_axi4in_xing_in_ar_mem_3_burst),
    .auto_axi4in_xing_in_ar_mem_3_lock(island_auto_axi4in_xing_in_ar_mem_3_lock),
    .auto_axi4in_xing_in_ar_mem_3_cache(island_auto_axi4in_xing_in_ar_mem_3_cache),
    .auto_axi4in_xing_in_ar_mem_3_prot(island_auto_axi4in_xing_in_ar_mem_3_prot),
    .auto_axi4in_xing_in_ar_mem_3_qos(island_auto_axi4in_xing_in_ar_mem_3_qos),
    .auto_axi4in_xing_in_ar_mem_4_id(island_auto_axi4in_xing_in_ar_mem_4_id),
    .auto_axi4in_xing_in_ar_mem_4_addr(island_auto_axi4in_xing_in_ar_mem_4_addr),
    .auto_axi4in_xing_in_ar_mem_4_len(island_auto_axi4in_xing_in_ar_mem_4_len),
    .auto_axi4in_xing_in_ar_mem_4_size(island_auto_axi4in_xing_in_ar_mem_4_size),
    .auto_axi4in_xing_in_ar_mem_4_burst(island_auto_axi4in_xing_in_ar_mem_4_burst),
    .auto_axi4in_xing_in_ar_mem_4_lock(island_auto_axi4in_xing_in_ar_mem_4_lock),
    .auto_axi4in_xing_in_ar_mem_4_cache(island_auto_axi4in_xing_in_ar_mem_4_cache),
    .auto_axi4in_xing_in_ar_mem_4_prot(island_auto_axi4in_xing_in_ar_mem_4_prot),
    .auto_axi4in_xing_in_ar_mem_4_qos(island_auto_axi4in_xing_in_ar_mem_4_qos),
    .auto_axi4in_xing_in_ar_mem_5_id(island_auto_axi4in_xing_in_ar_mem_5_id),
    .auto_axi4in_xing_in_ar_mem_5_addr(island_auto_axi4in_xing_in_ar_mem_5_addr),
    .auto_axi4in_xing_in_ar_mem_5_len(island_auto_axi4in_xing_in_ar_mem_5_len),
    .auto_axi4in_xing_in_ar_mem_5_size(island_auto_axi4in_xing_in_ar_mem_5_size),
    .auto_axi4in_xing_in_ar_mem_5_burst(island_auto_axi4in_xing_in_ar_mem_5_burst),
    .auto_axi4in_xing_in_ar_mem_5_lock(island_auto_axi4in_xing_in_ar_mem_5_lock),
    .auto_axi4in_xing_in_ar_mem_5_cache(island_auto_axi4in_xing_in_ar_mem_5_cache),
    .auto_axi4in_xing_in_ar_mem_5_prot(island_auto_axi4in_xing_in_ar_mem_5_prot),
    .auto_axi4in_xing_in_ar_mem_5_qos(island_auto_axi4in_xing_in_ar_mem_5_qos),
    .auto_axi4in_xing_in_ar_mem_6_id(island_auto_axi4in_xing_in_ar_mem_6_id),
    .auto_axi4in_xing_in_ar_mem_6_addr(island_auto_axi4in_xing_in_ar_mem_6_addr),
    .auto_axi4in_xing_in_ar_mem_6_len(island_auto_axi4in_xing_in_ar_mem_6_len),
    .auto_axi4in_xing_in_ar_mem_6_size(island_auto_axi4in_xing_in_ar_mem_6_size),
    .auto_axi4in_xing_in_ar_mem_6_burst(island_auto_axi4in_xing_in_ar_mem_6_burst),
    .auto_axi4in_xing_in_ar_mem_6_lock(island_auto_axi4in_xing_in_ar_mem_6_lock),
    .auto_axi4in_xing_in_ar_mem_6_cache(island_auto_axi4in_xing_in_ar_mem_6_cache),
    .auto_axi4in_xing_in_ar_mem_6_prot(island_auto_axi4in_xing_in_ar_mem_6_prot),
    .auto_axi4in_xing_in_ar_mem_6_qos(island_auto_axi4in_xing_in_ar_mem_6_qos),
    .auto_axi4in_xing_in_ar_mem_7_id(island_auto_axi4in_xing_in_ar_mem_7_id),
    .auto_axi4in_xing_in_ar_mem_7_addr(island_auto_axi4in_xing_in_ar_mem_7_addr),
    .auto_axi4in_xing_in_ar_mem_7_len(island_auto_axi4in_xing_in_ar_mem_7_len),
    .auto_axi4in_xing_in_ar_mem_7_size(island_auto_axi4in_xing_in_ar_mem_7_size),
    .auto_axi4in_xing_in_ar_mem_7_burst(island_auto_axi4in_xing_in_ar_mem_7_burst),
    .auto_axi4in_xing_in_ar_mem_7_lock(island_auto_axi4in_xing_in_ar_mem_7_lock),
    .auto_axi4in_xing_in_ar_mem_7_cache(island_auto_axi4in_xing_in_ar_mem_7_cache),
    .auto_axi4in_xing_in_ar_mem_7_prot(island_auto_axi4in_xing_in_ar_mem_7_prot),
    .auto_axi4in_xing_in_ar_mem_7_qos(island_auto_axi4in_xing_in_ar_mem_7_qos),
    .auto_axi4in_xing_in_ar_ridx(island_auto_axi4in_xing_in_ar_ridx),
    .auto_axi4in_xing_in_ar_widx(island_auto_axi4in_xing_in_ar_widx),
    .auto_axi4in_xing_in_ar_safe_ridx_valid(island_auto_axi4in_xing_in_ar_safe_ridx_valid),
    .auto_axi4in_xing_in_ar_safe_widx_valid(island_auto_axi4in_xing_in_ar_safe_widx_valid),
    .auto_axi4in_xing_in_ar_safe_source_reset_n(island_auto_axi4in_xing_in_ar_safe_source_reset_n),
    .auto_axi4in_xing_in_ar_safe_sink_reset_n(island_auto_axi4in_xing_in_ar_safe_sink_reset_n),
    .auto_axi4in_xing_in_r_mem_0_id(island_auto_axi4in_xing_in_r_mem_0_id),
    .auto_axi4in_xing_in_r_mem_0_data(island_auto_axi4in_xing_in_r_mem_0_data),
    .auto_axi4in_xing_in_r_mem_0_resp(island_auto_axi4in_xing_in_r_mem_0_resp),
    .auto_axi4in_xing_in_r_mem_0_last(island_auto_axi4in_xing_in_r_mem_0_last),
    .auto_axi4in_xing_in_r_mem_1_id(island_auto_axi4in_xing_in_r_mem_1_id),
    .auto_axi4in_xing_in_r_mem_1_data(island_auto_axi4in_xing_in_r_mem_1_data),
    .auto_axi4in_xing_in_r_mem_1_resp(island_auto_axi4in_xing_in_r_mem_1_resp),
    .auto_axi4in_xing_in_r_mem_1_last(island_auto_axi4in_xing_in_r_mem_1_last),
    .auto_axi4in_xing_in_r_mem_2_id(island_auto_axi4in_xing_in_r_mem_2_id),
    .auto_axi4in_xing_in_r_mem_2_data(island_auto_axi4in_xing_in_r_mem_2_data),
    .auto_axi4in_xing_in_r_mem_2_resp(island_auto_axi4in_xing_in_r_mem_2_resp),
    .auto_axi4in_xing_in_r_mem_2_last(island_auto_axi4in_xing_in_r_mem_2_last),
    .auto_axi4in_xing_in_r_mem_3_id(island_auto_axi4in_xing_in_r_mem_3_id),
    .auto_axi4in_xing_in_r_mem_3_data(island_auto_axi4in_xing_in_r_mem_3_data),
    .auto_axi4in_xing_in_r_mem_3_resp(island_auto_axi4in_xing_in_r_mem_3_resp),
    .auto_axi4in_xing_in_r_mem_3_last(island_auto_axi4in_xing_in_r_mem_3_last),
    .auto_axi4in_xing_in_r_mem_4_id(island_auto_axi4in_xing_in_r_mem_4_id),
    .auto_axi4in_xing_in_r_mem_4_data(island_auto_axi4in_xing_in_r_mem_4_data),
    .auto_axi4in_xing_in_r_mem_4_resp(island_auto_axi4in_xing_in_r_mem_4_resp),
    .auto_axi4in_xing_in_r_mem_4_last(island_auto_axi4in_xing_in_r_mem_4_last),
    .auto_axi4in_xing_in_r_mem_5_id(island_auto_axi4in_xing_in_r_mem_5_id),
    .auto_axi4in_xing_in_r_mem_5_data(island_auto_axi4in_xing_in_r_mem_5_data),
    .auto_axi4in_xing_in_r_mem_5_resp(island_auto_axi4in_xing_in_r_mem_5_resp),
    .auto_axi4in_xing_in_r_mem_5_last(island_auto_axi4in_xing_in_r_mem_5_last),
    .auto_axi4in_xing_in_r_mem_6_id(island_auto_axi4in_xing_in_r_mem_6_id),
    .auto_axi4in_xing_in_r_mem_6_data(island_auto_axi4in_xing_in_r_mem_6_data),
    .auto_axi4in_xing_in_r_mem_6_resp(island_auto_axi4in_xing_in_r_mem_6_resp),
    .auto_axi4in_xing_in_r_mem_6_last(island_auto_axi4in_xing_in_r_mem_6_last),
    .auto_axi4in_xing_in_r_mem_7_id(island_auto_axi4in_xing_in_r_mem_7_id),
    .auto_axi4in_xing_in_r_mem_7_data(island_auto_axi4in_xing_in_r_mem_7_data),
    .auto_axi4in_xing_in_r_mem_7_resp(island_auto_axi4in_xing_in_r_mem_7_resp),
    .auto_axi4in_xing_in_r_mem_7_last(island_auto_axi4in_xing_in_r_mem_7_last),
    .auto_axi4in_xing_in_r_ridx(island_auto_axi4in_xing_in_r_ridx),
    .auto_axi4in_xing_in_r_widx(island_auto_axi4in_xing_in_r_widx),
    .auto_axi4in_xing_in_r_safe_ridx_valid(island_auto_axi4in_xing_in_r_safe_ridx_valid),
    .auto_axi4in_xing_in_r_safe_widx_valid(island_auto_axi4in_xing_in_r_safe_widx_valid),
    .auto_axi4in_xing_in_r_safe_source_reset_n(island_auto_axi4in_xing_in_r_safe_source_reset_n),
    .auto_axi4in_xing_in_r_safe_sink_reset_n(island_auto_axi4in_xing_in_r_safe_sink_reset_n),
  `endif
    .io_port_ddr3_addr(island_io_port_ddr3_addr),
    .io_port_ddr3_ba(island_io_port_ddr3_ba),
    .io_port_ddr3_ras_n(island_io_port_ddr3_ras_n),
    .io_port_ddr3_cas_n(island_io_port_ddr3_cas_n),
    .io_port_ddr3_we_n(island_io_port_ddr3_we_n),
    .io_port_ddr3_reset_n(island_io_port_ddr3_reset_n),
    .io_port_ddr3_ck_p(island_io_port_ddr3_ck_p),
    .io_port_ddr3_ck_n(island_io_port_ddr3_ck_n),
    .io_port_ddr3_cke(island_io_port_ddr3_cke),
    .io_port_ddr3_cs_n(island_io_port_ddr3_cs_n),
    .io_port_ddr3_dm(island_io_port_ddr3_dm),
    .io_port_ddr3_odt(island_io_port_ddr3_odt),
    // .io_port_ddr3_dq(io_port_ddr3_dq),
    // .io_port_ddr3_dqs_n(io_port_ddr3_dqs_n),
    // .io_port_ddr3_dqs_p(io_port_ddr3_dqs_p),
    .io_port_sys_clk_i(island_io_port_sys_clk_i),
    .io_port_ui_clk(island_io_port_ui_clk),
    .io_port_ui_clk_sync_rst(island_io_port_ui_clk_sync_rst),
    .io_port_mmcm_locked(island_io_port_mmcm_locked),
    .io_port_aresetn(island_io_port_aresetn),
    .io_port_sys_rst(island_io_port_sys_rst)
  );

  assign auto_buffer_in_a_ready = buffer_auto_in_a_ready; 
  assign auto_buffer_in_d_valid = buffer_auto_in_d_valid; 
  assign auto_buffer_in_d_bits_opcode = buffer_auto_in_d_bits_opcode; 
  assign auto_buffer_in_d_bits_param = buffer_auto_in_d_bits_param; 
  assign auto_buffer_in_d_bits_size = buffer_auto_in_d_bits_size; 
  assign auto_buffer_in_d_bits_source = buffer_auto_in_d_bits_source; 
  assign auto_buffer_in_d_bits_sink = buffer_auto_in_d_bits_sink; 
  assign auto_buffer_in_d_bits_denied = buffer_auto_in_d_bits_denied; 
  assign auto_buffer_in_d_bits_data = buffer_auto_in_d_bits_data; 
  assign auto_buffer_in_d_bits_corrupt = buffer_auto_in_d_bits_corrupt; 
  assign io_port_ddr3_addr = island_io_port_ddr3_addr; 
  assign io_port_ddr3_ba = island_io_port_ddr3_ba; 
  assign io_port_ddr3_ras_n = island_io_port_ddr3_ras_n; 
  assign io_port_ddr3_cas_n = island_io_port_ddr3_cas_n; 
  assign io_port_ddr3_we_n = island_io_port_ddr3_we_n; 
  assign io_port_ddr3_reset_n = island_io_port_ddr3_reset_n; 
  assign io_port_ddr3_ck_p = island_io_port_ddr3_ck_p; 
  assign io_port_ddr3_ck_n = island_io_port_ddr3_ck_n; 
  assign io_port_ddr3_cke = island_io_port_ddr3_cke; 
  assign io_port_ddr3_cs_n = island_io_port_ddr3_cs_n; 
  assign io_port_ddr3_dm = island_io_port_ddr3_dm; 
  assign io_port_ddr3_odt = island_io_port_ddr3_odt; 
  assign io_port_ui_clk = island_io_port_ui_clk; 
  assign io_port_ui_clk_sync_rst = island_io_port_ui_clk_sync_rst; 
  assign io_port_mmcm_locked = island_io_port_mmcm_locked; 
  assign buffer_clock = clock; 
  assign buffer_reset = reset; 
  assign buffer_auto_in_a_valid = auto_buffer_in_a_valid; 
  assign buffer_auto_in_a_bits_opcode = auto_buffer_in_a_bits_opcode; 
  assign buffer_auto_in_a_bits_param = auto_buffer_in_a_bits_param; 
  assign buffer_auto_in_a_bits_size = auto_buffer_in_a_bits_size; 
  assign buffer_auto_in_a_bits_source = auto_buffer_in_a_bits_source; 
  assign buffer_auto_in_a_bits_address = auto_buffer_in_a_bits_address; 
  assign buffer_auto_in_a_bits_mask = auto_buffer_in_a_bits_mask; 
  assign buffer_auto_in_a_bits_data = auto_buffer_in_a_bits_data; 
  assign buffer_auto_in_a_bits_corrupt = auto_buffer_in_a_bits_corrupt; 
  assign buffer_auto_in_d_ready = auto_buffer_in_d_ready; 
  assign buffer_auto_out_a_ready = toaxi4_auto_in_a_ready; 
  assign buffer_auto_out_d_valid = toaxi4_auto_in_d_valid; 
  assign buffer_auto_out_d_bits_opcode = toaxi4_auto_in_d_bits_opcode; 
  assign buffer_auto_out_d_bits_size = toaxi4_auto_in_d_bits_size; 
  assign buffer_auto_out_d_bits_source = toaxi4_auto_in_d_bits_source; 
  assign buffer_auto_out_d_bits_denied = toaxi4_auto_in_d_bits_denied; 
  assign buffer_auto_out_d_bits_data = toaxi4_auto_in_d_bits_data; 
  assign buffer_auto_out_d_bits_corrupt = toaxi4_auto_in_d_bits_corrupt; 
`ifndef CHIPLINK_CONNECT_DIRECT_TL  
  assign toaxi4_clock = clock; 
  assign toaxi4_reset = reset; 
`endif
  assign toaxi4_auto_in_a_valid = buffer_auto_out_a_valid; 
  assign toaxi4_auto_in_a_bits_opcode = buffer_auto_out_a_bits_opcode; 
  assign toaxi4_auto_in_a_bits_param = buffer_auto_out_a_bits_param; 
  assign toaxi4_auto_in_a_bits_size = buffer_auto_out_a_bits_size; 
  assign toaxi4_auto_in_a_bits_source = buffer_auto_out_a_bits_source; 
  assign toaxi4_auto_in_a_bits_address = buffer_auto_out_a_bits_address; 
  assign toaxi4_auto_in_a_bits_mask = buffer_auto_out_a_bits_mask; 
  assign toaxi4_auto_in_a_bits_data = buffer_auto_out_a_bits_data; 
  assign toaxi4_auto_in_a_bits_corrupt = buffer_auto_out_a_bits_corrupt; 
  assign toaxi4_auto_in_d_ready = buffer_auto_out_d_ready; 

`ifndef CHIPLINK_CONNECT_DIRECT_TL  
  assign toaxi4_auto_out_aw_ready = indexer_auto_in_aw_ready; 
  assign toaxi4_auto_out_w_ready = indexer_auto_in_w_ready; 
  assign toaxi4_auto_out_b_valid = indexer_auto_in_b_valid; 
  assign toaxi4_auto_out_b_bits_id = indexer_auto_in_b_bits_id; 
  assign toaxi4_auto_out_b_bits_resp = indexer_auto_in_b_bits_resp; 
  assign toaxi4_auto_out_b_bits_user = indexer_auto_in_b_bits_user; 
  assign toaxi4_auto_out_ar_ready = indexer_auto_in_ar_ready; 
  assign toaxi4_auto_out_r_valid = indexer_auto_in_r_valid; 
  assign toaxi4_auto_out_r_bits_id = indexer_auto_in_r_bits_id; 
  assign toaxi4_auto_out_r_bits_data = indexer_auto_in_r_bits_data; 
  assign toaxi4_auto_out_r_bits_resp = indexer_auto_in_r_bits_resp; 
  assign toaxi4_auto_out_r_bits_user = indexer_auto_in_r_bits_user; 
  assign toaxi4_auto_out_r_bits_last = indexer_auto_in_r_bits_last; 
  assign indexer_auto_in_aw_valid = toaxi4_auto_out_aw_valid; 
  assign indexer_auto_in_aw_bits_id = toaxi4_auto_out_aw_bits_id; 
  assign indexer_auto_in_aw_bits_addr = toaxi4_auto_out_aw_bits_addr; 
  assign indexer_auto_in_aw_bits_len = toaxi4_auto_out_aw_bits_len; 
  assign indexer_auto_in_aw_bits_size = toaxi4_auto_out_aw_bits_size; 
  assign indexer_auto_in_aw_bits_burst = toaxi4_auto_out_aw_bits_burst; 
  assign indexer_auto_in_aw_bits_lock = toaxi4_auto_out_aw_bits_lock; 
  assign indexer_auto_in_aw_bits_cache = toaxi4_auto_out_aw_bits_cache; 
  assign indexer_auto_in_aw_bits_prot = toaxi4_auto_out_aw_bits_prot; 
  assign indexer_auto_in_aw_bits_qos = toaxi4_auto_out_aw_bits_qos; 
  assign indexer_auto_in_aw_bits_user = toaxi4_auto_out_aw_bits_user; 
  assign indexer_auto_in_w_valid = toaxi4_auto_out_w_valid; 
  assign indexer_auto_in_w_bits_data = toaxi4_auto_out_w_bits_data; 
  assign indexer_auto_in_w_bits_strb = toaxi4_auto_out_w_bits_strb; 
  assign indexer_auto_in_w_bits_last = toaxi4_auto_out_w_bits_last; 
  assign indexer_auto_in_b_ready = toaxi4_auto_out_b_ready; 
  assign indexer_auto_in_ar_valid = toaxi4_auto_out_ar_valid; 
  assign indexer_auto_in_ar_bits_id = toaxi4_auto_out_ar_bits_id; 
  assign indexer_auto_in_ar_bits_addr = toaxi4_auto_out_ar_bits_addr; 
  assign indexer_auto_in_ar_bits_len = toaxi4_auto_out_ar_bits_len; 
  assign indexer_auto_in_ar_bits_size = toaxi4_auto_out_ar_bits_size; 
  assign indexer_auto_in_ar_bits_burst = toaxi4_auto_out_ar_bits_burst; 
  assign indexer_auto_in_ar_bits_lock = toaxi4_auto_out_ar_bits_lock; 
  assign indexer_auto_in_ar_bits_cache = toaxi4_auto_out_ar_bits_cache; 
  assign indexer_auto_in_ar_bits_prot = toaxi4_auto_out_ar_bits_prot; 
  assign indexer_auto_in_ar_bits_qos = toaxi4_auto_out_ar_bits_qos; 
  assign indexer_auto_in_ar_bits_user = toaxi4_auto_out_ar_bits_user; 
  assign indexer_auto_in_r_ready = toaxi4_auto_out_r_ready; 
  assign indexer_auto_out_aw_ready = deint_auto_in_aw_ready; 
  assign indexer_auto_out_w_ready = deint_auto_in_w_ready; 
  assign indexer_auto_out_b_valid = deint_auto_in_b_valid; 
  assign indexer_auto_out_b_bits_id = deint_auto_in_b_bits_id; 
  assign indexer_auto_out_b_bits_resp = deint_auto_in_b_bits_resp; 
  assign indexer_auto_out_b_bits_user = deint_auto_in_b_bits_user; 
  assign indexer_auto_out_ar_ready = deint_auto_in_ar_ready; 
  assign indexer_auto_out_r_valid = deint_auto_in_r_valid; 
  assign indexer_auto_out_r_bits_id = deint_auto_in_r_bits_id; 
  assign indexer_auto_out_r_bits_data = deint_auto_in_r_bits_data; 
  assign indexer_auto_out_r_bits_resp = deint_auto_in_r_bits_resp; 
  assign indexer_auto_out_r_bits_user = deint_auto_in_r_bits_user; 
  assign indexer_auto_out_r_bits_last = deint_auto_in_r_bits_last; 
  assign deint_clock = clock; 
  assign deint_reset = reset; 
  assign deint_auto_in_aw_valid = indexer_auto_out_aw_valid; 
  assign deint_auto_in_aw_bits_id = indexer_auto_out_aw_bits_id; 
  assign deint_auto_in_aw_bits_addr = indexer_auto_out_aw_bits_addr; 
  assign deint_auto_in_aw_bits_len = indexer_auto_out_aw_bits_len; 
  assign deint_auto_in_aw_bits_size = indexer_auto_out_aw_bits_size; 
  assign deint_auto_in_aw_bits_burst = indexer_auto_out_aw_bits_burst; 
  assign deint_auto_in_aw_bits_lock = indexer_auto_out_aw_bits_lock; 
  assign deint_auto_in_aw_bits_cache = indexer_auto_out_aw_bits_cache; 
  assign deint_auto_in_aw_bits_prot = indexer_auto_out_aw_bits_prot; 
  assign deint_auto_in_aw_bits_qos = indexer_auto_out_aw_bits_qos; 
  assign deint_auto_in_aw_bits_user = indexer_auto_out_aw_bits_user; 
  assign deint_auto_in_w_valid = indexer_auto_out_w_valid; 
  assign deint_auto_in_w_bits_data = indexer_auto_out_w_bits_data; 
  assign deint_auto_in_w_bits_strb = indexer_auto_out_w_bits_strb; 
  assign deint_auto_in_w_bits_last = indexer_auto_out_w_bits_last; 
  assign deint_auto_in_b_ready = indexer_auto_out_b_ready; 
  assign deint_auto_in_ar_valid = indexer_auto_out_ar_valid; 
  assign deint_auto_in_ar_bits_id = indexer_auto_out_ar_bits_id; 
  assign deint_auto_in_ar_bits_addr = indexer_auto_out_ar_bits_addr; 
  assign deint_auto_in_ar_bits_len = indexer_auto_out_ar_bits_len; 
  assign deint_auto_in_ar_bits_size = indexer_auto_out_ar_bits_size; 
  assign deint_auto_in_ar_bits_burst = indexer_auto_out_ar_bits_burst; 
  assign deint_auto_in_ar_bits_lock = indexer_auto_out_ar_bits_lock; 
  assign deint_auto_in_ar_bits_cache = indexer_auto_out_ar_bits_cache; 
  assign deint_auto_in_ar_bits_prot = indexer_auto_out_ar_bits_prot; 
  assign deint_auto_in_ar_bits_qos = indexer_auto_out_ar_bits_qos; 
  assign deint_auto_in_ar_bits_user = indexer_auto_out_ar_bits_user; 
  assign deint_auto_in_r_ready = indexer_auto_out_r_ready; 
  assign deint_auto_out_aw_ready = yank_auto_in_aw_ready; 
  assign deint_auto_out_w_ready = yank_auto_in_w_ready; 
  assign deint_auto_out_b_valid = yank_auto_in_b_valid; 
  assign deint_auto_out_b_bits_id = yank_auto_in_b_bits_id; 
  assign deint_auto_out_b_bits_resp = yank_auto_in_b_bits_resp; 
  assign deint_auto_out_b_bits_user = yank_auto_in_b_bits_user; 
  assign deint_auto_out_ar_ready = yank_auto_in_ar_ready; 
  assign deint_auto_out_r_valid = yank_auto_in_r_valid; 
  assign deint_auto_out_r_bits_id = yank_auto_in_r_bits_id; 
  assign deint_auto_out_r_bits_data = yank_auto_in_r_bits_data; 
  assign deint_auto_out_r_bits_resp = yank_auto_in_r_bits_resp; 
  assign deint_auto_out_r_bits_user = yank_auto_in_r_bits_user; 
  assign deint_auto_out_r_bits_last = yank_auto_in_r_bits_last; 
  assign yank_clock = clock; 
  assign yank_reset = reset; 
  assign yank_auto_in_aw_valid = deint_auto_out_aw_valid; 
  assign yank_auto_in_aw_bits_id = deint_auto_out_aw_bits_id; 
  assign yank_auto_in_aw_bits_addr = deint_auto_out_aw_bits_addr; 
  assign yank_auto_in_aw_bits_len = deint_auto_out_aw_bits_len; 
  assign yank_auto_in_aw_bits_size = deint_auto_out_aw_bits_size; 
  assign yank_auto_in_aw_bits_burst = deint_auto_out_aw_bits_burst; 
  assign yank_auto_in_aw_bits_lock = deint_auto_out_aw_bits_lock; 
  assign yank_auto_in_aw_bits_cache = deint_auto_out_aw_bits_cache; 
  assign yank_auto_in_aw_bits_prot = deint_auto_out_aw_bits_prot; 
  assign yank_auto_in_aw_bits_qos = deint_auto_out_aw_bits_qos; 
  assign yank_auto_in_aw_bits_user = deint_auto_out_aw_bits_user; 
  assign yank_auto_in_w_valid = deint_auto_out_w_valid; 
  assign yank_auto_in_w_bits_data = deint_auto_out_w_bits_data; 
  assign yank_auto_in_w_bits_strb = deint_auto_out_w_bits_strb; 
  assign yank_auto_in_w_bits_last = deint_auto_out_w_bits_last; 
  assign yank_auto_in_b_ready = deint_auto_out_b_ready; 
  assign yank_auto_in_ar_valid = deint_auto_out_ar_valid; 
  assign yank_auto_in_ar_bits_id = deint_auto_out_ar_bits_id; 
  assign yank_auto_in_ar_bits_addr = deint_auto_out_ar_bits_addr; 
  assign yank_auto_in_ar_bits_len = deint_auto_out_ar_bits_len; 
  assign yank_auto_in_ar_bits_size = deint_auto_out_ar_bits_size; 
  assign yank_auto_in_ar_bits_burst = deint_auto_out_ar_bits_burst; 
  assign yank_auto_in_ar_bits_lock = deint_auto_out_ar_bits_lock; 
  assign yank_auto_in_ar_bits_cache = deint_auto_out_ar_bits_cache; 
  assign yank_auto_in_ar_bits_prot = deint_auto_out_ar_bits_prot; 
  assign yank_auto_in_ar_bits_qos = deint_auto_out_ar_bits_qos; 
  assign yank_auto_in_ar_bits_user = deint_auto_out_ar_bits_user; 
  assign yank_auto_in_r_ready = deint_auto_out_r_ready;  
  assign yank_auto_out_aw_ready = axi4asource_auto_in_aw_ready; 
  assign yank_auto_out_w_ready = axi4asource_auto_in_w_ready; 
  assign yank_auto_out_b_valid = axi4asource_auto_in_b_valid; 
  assign yank_auto_out_b_bits_id = axi4asource_auto_in_b_bits_id; 
  assign yank_auto_out_b_bits_resp = axi4asource_auto_in_b_bits_resp; 
  assign yank_auto_out_ar_ready = axi4asource_auto_in_ar_ready; 
  assign yank_auto_out_r_valid = axi4asource_auto_in_r_valid; 
  assign yank_auto_out_r_bits_id = axi4asource_auto_in_r_bits_id; 
  assign yank_auto_out_r_bits_data = axi4asource_auto_in_r_bits_data; 
  assign yank_auto_out_r_bits_resp = axi4asource_auto_in_r_bits_resp; 
  assign yank_auto_out_r_bits_last = axi4asource_auto_in_r_bits_last;
  assign island_auto_axi4in_xing_in_aw_mem_0_id = axi4asource_auto_out_aw_mem_0_id; 
  assign island_auto_axi4in_xing_in_aw_mem_0_addr = axi4asource_auto_out_aw_mem_0_addr; 
  assign island_auto_axi4in_xing_in_aw_mem_0_len = axi4asource_auto_out_aw_mem_0_len; 
  assign island_auto_axi4in_xing_in_aw_mem_0_size = axi4asource_auto_out_aw_mem_0_size; 
  assign island_auto_axi4in_xing_in_aw_mem_0_burst = axi4asource_auto_out_aw_mem_0_burst; 
  assign island_auto_axi4in_xing_in_aw_mem_0_lock = axi4asource_auto_out_aw_mem_0_lock; 
  assign island_auto_axi4in_xing_in_aw_mem_0_cache = axi4asource_auto_out_aw_mem_0_cache; 
  assign island_auto_axi4in_xing_in_aw_mem_0_prot = axi4asource_auto_out_aw_mem_0_prot; 
  assign island_auto_axi4in_xing_in_aw_mem_0_qos = axi4asource_auto_out_aw_mem_0_qos; 
  assign island_auto_axi4in_xing_in_aw_mem_1_id = axi4asource_auto_out_aw_mem_1_id; 
  assign island_auto_axi4in_xing_in_aw_mem_1_addr = axi4asource_auto_out_aw_mem_1_addr; 
  assign island_auto_axi4in_xing_in_aw_mem_1_len = axi4asource_auto_out_aw_mem_1_len; 
  assign island_auto_axi4in_xing_in_aw_mem_1_size = axi4asource_auto_out_aw_mem_1_size; 
  assign island_auto_axi4in_xing_in_aw_mem_1_burst = axi4asource_auto_out_aw_mem_1_burst; 
  assign island_auto_axi4in_xing_in_aw_mem_1_lock = axi4asource_auto_out_aw_mem_1_lock; 
  assign island_auto_axi4in_xing_in_aw_mem_1_cache = axi4asource_auto_out_aw_mem_1_cache; 
  assign island_auto_axi4in_xing_in_aw_mem_1_prot = axi4asource_auto_out_aw_mem_1_prot; 
  assign island_auto_axi4in_xing_in_aw_mem_1_qos = axi4asource_auto_out_aw_mem_1_qos; 
  assign island_auto_axi4in_xing_in_aw_mem_2_id = axi4asource_auto_out_aw_mem_2_id; 
  assign island_auto_axi4in_xing_in_aw_mem_2_addr = axi4asource_auto_out_aw_mem_2_addr; 
  assign island_auto_axi4in_xing_in_aw_mem_2_len = axi4asource_auto_out_aw_mem_2_len; 
  assign island_auto_axi4in_xing_in_aw_mem_2_size = axi4asource_auto_out_aw_mem_2_size; 
  assign island_auto_axi4in_xing_in_aw_mem_2_burst = axi4asource_auto_out_aw_mem_2_burst; 
  assign island_auto_axi4in_xing_in_aw_mem_2_lock = axi4asource_auto_out_aw_mem_2_lock; 
  assign island_auto_axi4in_xing_in_aw_mem_2_cache = axi4asource_auto_out_aw_mem_2_cache; 
  assign island_auto_axi4in_xing_in_aw_mem_2_prot = axi4asource_auto_out_aw_mem_2_prot; 
  assign island_auto_axi4in_xing_in_aw_mem_2_qos = axi4asource_auto_out_aw_mem_2_qos; 
  assign island_auto_axi4in_xing_in_aw_mem_3_id = axi4asource_auto_out_aw_mem_3_id; 
  assign island_auto_axi4in_xing_in_aw_mem_3_addr = axi4asource_auto_out_aw_mem_3_addr; 
  assign island_auto_axi4in_xing_in_aw_mem_3_len = axi4asource_auto_out_aw_mem_3_len; 
  assign island_auto_axi4in_xing_in_aw_mem_3_size = axi4asource_auto_out_aw_mem_3_size; 
  assign island_auto_axi4in_xing_in_aw_mem_3_burst = axi4asource_auto_out_aw_mem_3_burst; 
  assign island_auto_axi4in_xing_in_aw_mem_3_lock = axi4asource_auto_out_aw_mem_3_lock; 
  assign island_auto_axi4in_xing_in_aw_mem_3_cache = axi4asource_auto_out_aw_mem_3_cache; 
  assign island_auto_axi4in_xing_in_aw_mem_3_prot = axi4asource_auto_out_aw_mem_3_prot; 
  assign island_auto_axi4in_xing_in_aw_mem_3_qos = axi4asource_auto_out_aw_mem_3_qos; 
  assign island_auto_axi4in_xing_in_aw_mem_4_id = axi4asource_auto_out_aw_mem_4_id; 
  assign island_auto_axi4in_xing_in_aw_mem_4_addr = axi4asource_auto_out_aw_mem_4_addr; 
  assign island_auto_axi4in_xing_in_aw_mem_4_len = axi4asource_auto_out_aw_mem_4_len; 
  assign island_auto_axi4in_xing_in_aw_mem_4_size = axi4asource_auto_out_aw_mem_4_size; 
  assign island_auto_axi4in_xing_in_aw_mem_4_burst = axi4asource_auto_out_aw_mem_4_burst; 
  assign island_auto_axi4in_xing_in_aw_mem_4_lock = axi4asource_auto_out_aw_mem_4_lock; 
  assign island_auto_axi4in_xing_in_aw_mem_4_cache = axi4asource_auto_out_aw_mem_4_cache; 
  assign island_auto_axi4in_xing_in_aw_mem_4_prot = axi4asource_auto_out_aw_mem_4_prot; 
  assign island_auto_axi4in_xing_in_aw_mem_4_qos = axi4asource_auto_out_aw_mem_4_qos; 
  assign island_auto_axi4in_xing_in_aw_mem_5_id = axi4asource_auto_out_aw_mem_5_id; 
  assign island_auto_axi4in_xing_in_aw_mem_5_addr = axi4asource_auto_out_aw_mem_5_addr; 
  assign island_auto_axi4in_xing_in_aw_mem_5_len = axi4asource_auto_out_aw_mem_5_len; 
  assign island_auto_axi4in_xing_in_aw_mem_5_size = axi4asource_auto_out_aw_mem_5_size; 
  assign island_auto_axi4in_xing_in_aw_mem_5_burst = axi4asource_auto_out_aw_mem_5_burst; 
  assign island_auto_axi4in_xing_in_aw_mem_5_lock = axi4asource_auto_out_aw_mem_5_lock; 
  assign island_auto_axi4in_xing_in_aw_mem_5_cache = axi4asource_auto_out_aw_mem_5_cache; 
  assign island_auto_axi4in_xing_in_aw_mem_5_prot = axi4asource_auto_out_aw_mem_5_prot; 
  assign island_auto_axi4in_xing_in_aw_mem_5_qos = axi4asource_auto_out_aw_mem_5_qos; 
  assign island_auto_axi4in_xing_in_aw_mem_6_id = axi4asource_auto_out_aw_mem_6_id; 
  assign island_auto_axi4in_xing_in_aw_mem_6_addr = axi4asource_auto_out_aw_mem_6_addr; 
  assign island_auto_axi4in_xing_in_aw_mem_6_len = axi4asource_auto_out_aw_mem_6_len; 
  assign island_auto_axi4in_xing_in_aw_mem_6_size = axi4asource_auto_out_aw_mem_6_size; 
  assign island_auto_axi4in_xing_in_aw_mem_6_burst = axi4asource_auto_out_aw_mem_6_burst; 
  assign island_auto_axi4in_xing_in_aw_mem_6_lock = axi4asource_auto_out_aw_mem_6_lock; 
  assign island_auto_axi4in_xing_in_aw_mem_6_cache = axi4asource_auto_out_aw_mem_6_cache; 
  assign island_auto_axi4in_xing_in_aw_mem_6_prot = axi4asource_auto_out_aw_mem_6_prot; 
  assign island_auto_axi4in_xing_in_aw_mem_6_qos = axi4asource_auto_out_aw_mem_6_qos; 
  assign island_auto_axi4in_xing_in_aw_mem_7_id = axi4asource_auto_out_aw_mem_7_id; 
  assign island_auto_axi4in_xing_in_aw_mem_7_addr = axi4asource_auto_out_aw_mem_7_addr; 
  assign island_auto_axi4in_xing_in_aw_mem_7_len = axi4asource_auto_out_aw_mem_7_len; 
  assign island_auto_axi4in_xing_in_aw_mem_7_size = axi4asource_auto_out_aw_mem_7_size; 
  assign island_auto_axi4in_xing_in_aw_mem_7_burst = axi4asource_auto_out_aw_mem_7_burst; 
  assign island_auto_axi4in_xing_in_aw_mem_7_lock = axi4asource_auto_out_aw_mem_7_lock; 
  assign island_auto_axi4in_xing_in_aw_mem_7_cache = axi4asource_auto_out_aw_mem_7_cache; 
  assign island_auto_axi4in_xing_in_aw_mem_7_prot = axi4asource_auto_out_aw_mem_7_prot; 
  assign island_auto_axi4in_xing_in_aw_mem_7_qos = axi4asource_auto_out_aw_mem_7_qos; 
  assign island_auto_axi4in_xing_in_aw_widx = axi4asource_auto_out_aw_widx; 
  assign island_auto_axi4in_xing_in_aw_safe_widx_valid = axi4asource_auto_out_aw_safe_widx_valid; 
  assign island_auto_axi4in_xing_in_aw_safe_source_reset_n = axi4asource_auto_out_aw_safe_source_reset_n; 
  assign island_auto_axi4in_xing_in_w_mem_0_data = axi4asource_auto_out_w_mem_0_data; 
  assign island_auto_axi4in_xing_in_w_mem_0_strb = axi4asource_auto_out_w_mem_0_strb; 
  assign island_auto_axi4in_xing_in_w_mem_0_last = axi4asource_auto_out_w_mem_0_last; 
  assign island_auto_axi4in_xing_in_w_mem_1_data = axi4asource_auto_out_w_mem_1_data; 
  assign island_auto_axi4in_xing_in_w_mem_1_strb = axi4asource_auto_out_w_mem_1_strb; 
  assign island_auto_axi4in_xing_in_w_mem_1_last = axi4asource_auto_out_w_mem_1_last; 
  assign island_auto_axi4in_xing_in_w_mem_2_data = axi4asource_auto_out_w_mem_2_data; 
  assign island_auto_axi4in_xing_in_w_mem_2_strb = axi4asource_auto_out_w_mem_2_strb; 
  assign island_auto_axi4in_xing_in_w_mem_2_last = axi4asource_auto_out_w_mem_2_last; 
  assign island_auto_axi4in_xing_in_w_mem_3_data = axi4asource_auto_out_w_mem_3_data; 
  assign island_auto_axi4in_xing_in_w_mem_3_strb = axi4asource_auto_out_w_mem_3_strb; 
  assign island_auto_axi4in_xing_in_w_mem_3_last = axi4asource_auto_out_w_mem_3_last; 
  assign island_auto_axi4in_xing_in_w_mem_4_data = axi4asource_auto_out_w_mem_4_data; 
  assign island_auto_axi4in_xing_in_w_mem_4_strb = axi4asource_auto_out_w_mem_4_strb; 
  assign island_auto_axi4in_xing_in_w_mem_4_last = axi4asource_auto_out_w_mem_4_last; 
  assign island_auto_axi4in_xing_in_w_mem_5_data = axi4asource_auto_out_w_mem_5_data; 
  assign island_auto_axi4in_xing_in_w_mem_5_strb = axi4asource_auto_out_w_mem_5_strb; 
  assign island_auto_axi4in_xing_in_w_mem_5_last = axi4asource_auto_out_w_mem_5_last; 
  assign island_auto_axi4in_xing_in_w_mem_6_data = axi4asource_auto_out_w_mem_6_data; 
  assign island_auto_axi4in_xing_in_w_mem_6_strb = axi4asource_auto_out_w_mem_6_strb; 
  assign island_auto_axi4in_xing_in_w_mem_6_last = axi4asource_auto_out_w_mem_6_last; 
  assign island_auto_axi4in_xing_in_w_mem_7_data = axi4asource_auto_out_w_mem_7_data; 
  assign island_auto_axi4in_xing_in_w_mem_7_strb = axi4asource_auto_out_w_mem_7_strb; 
  assign island_auto_axi4in_xing_in_w_mem_7_last = axi4asource_auto_out_w_mem_7_last; 
  assign island_auto_axi4in_xing_in_w_widx = axi4asource_auto_out_w_widx; 
  assign island_auto_axi4in_xing_in_w_safe_widx_valid = axi4asource_auto_out_w_safe_widx_valid; 
  assign island_auto_axi4in_xing_in_w_safe_source_reset_n = axi4asource_auto_out_w_safe_source_reset_n; 
  assign island_auto_axi4in_xing_in_b_ridx = axi4asource_auto_out_b_ridx; 
  assign island_auto_axi4in_xing_in_b_safe_ridx_valid = axi4asource_auto_out_b_safe_ridx_valid; 
  assign island_auto_axi4in_xing_in_b_safe_sink_reset_n = axi4asource_auto_out_b_safe_sink_reset_n; 
  assign island_auto_axi4in_xing_in_ar_mem_0_id = axi4asource_auto_out_ar_mem_0_id; 
  assign island_auto_axi4in_xing_in_ar_mem_0_addr = axi4asource_auto_out_ar_mem_0_addr; 
  assign island_auto_axi4in_xing_in_ar_mem_0_len = axi4asource_auto_out_ar_mem_0_len; 
  assign island_auto_axi4in_xing_in_ar_mem_0_size = axi4asource_auto_out_ar_mem_0_size; 
  assign island_auto_axi4in_xing_in_ar_mem_0_burst = axi4asource_auto_out_ar_mem_0_burst; 
  assign island_auto_axi4in_xing_in_ar_mem_0_lock = axi4asource_auto_out_ar_mem_0_lock; 
  assign island_auto_axi4in_xing_in_ar_mem_0_cache = axi4asource_auto_out_ar_mem_0_cache; 
  assign island_auto_axi4in_xing_in_ar_mem_0_prot = axi4asource_auto_out_ar_mem_0_prot; 
  assign island_auto_axi4in_xing_in_ar_mem_0_qos = axi4asource_auto_out_ar_mem_0_qos; 
  assign island_auto_axi4in_xing_in_ar_mem_1_id = axi4asource_auto_out_ar_mem_1_id; 
  assign island_auto_axi4in_xing_in_ar_mem_1_addr = axi4asource_auto_out_ar_mem_1_addr; 
  assign island_auto_axi4in_xing_in_ar_mem_1_len = axi4asource_auto_out_ar_mem_1_len; 
  assign island_auto_axi4in_xing_in_ar_mem_1_size = axi4asource_auto_out_ar_mem_1_size; 
  assign island_auto_axi4in_xing_in_ar_mem_1_burst = axi4asource_auto_out_ar_mem_1_burst; 
  assign island_auto_axi4in_xing_in_ar_mem_1_lock = axi4asource_auto_out_ar_mem_1_lock; 
  assign island_auto_axi4in_xing_in_ar_mem_1_cache = axi4asource_auto_out_ar_mem_1_cache; 
  assign island_auto_axi4in_xing_in_ar_mem_1_prot = axi4asource_auto_out_ar_mem_1_prot; 
  assign island_auto_axi4in_xing_in_ar_mem_1_qos = axi4asource_auto_out_ar_mem_1_qos; 
  assign island_auto_axi4in_xing_in_ar_mem_2_id = axi4asource_auto_out_ar_mem_2_id; 
  assign island_auto_axi4in_xing_in_ar_mem_2_addr = axi4asource_auto_out_ar_mem_2_addr; 
  assign island_auto_axi4in_xing_in_ar_mem_2_len = axi4asource_auto_out_ar_mem_2_len; 
  assign island_auto_axi4in_xing_in_ar_mem_2_size = axi4asource_auto_out_ar_mem_2_size; 
  assign island_auto_axi4in_xing_in_ar_mem_2_burst = axi4asource_auto_out_ar_mem_2_burst; 
  assign island_auto_axi4in_xing_in_ar_mem_2_lock = axi4asource_auto_out_ar_mem_2_lock; 
  assign island_auto_axi4in_xing_in_ar_mem_2_cache = axi4asource_auto_out_ar_mem_2_cache; 
  assign island_auto_axi4in_xing_in_ar_mem_2_prot = axi4asource_auto_out_ar_mem_2_prot; 
  assign island_auto_axi4in_xing_in_ar_mem_2_qos = axi4asource_auto_out_ar_mem_2_qos; 
  assign island_auto_axi4in_xing_in_ar_mem_3_id = axi4asource_auto_out_ar_mem_3_id; 
  assign island_auto_axi4in_xing_in_ar_mem_3_addr = axi4asource_auto_out_ar_mem_3_addr; 
  assign island_auto_axi4in_xing_in_ar_mem_3_len = axi4asource_auto_out_ar_mem_3_len; 
  assign island_auto_axi4in_xing_in_ar_mem_3_size = axi4asource_auto_out_ar_mem_3_size; 
  assign island_auto_axi4in_xing_in_ar_mem_3_burst = axi4asource_auto_out_ar_mem_3_burst; 
  assign island_auto_axi4in_xing_in_ar_mem_3_lock = axi4asource_auto_out_ar_mem_3_lock; 
  assign island_auto_axi4in_xing_in_ar_mem_3_cache = axi4asource_auto_out_ar_mem_3_cache; 
  assign island_auto_axi4in_xing_in_ar_mem_3_prot = axi4asource_auto_out_ar_mem_3_prot; 
  assign island_auto_axi4in_xing_in_ar_mem_3_qos = axi4asource_auto_out_ar_mem_3_qos; 
  assign island_auto_axi4in_xing_in_ar_mem_4_id = axi4asource_auto_out_ar_mem_4_id; 
  assign island_auto_axi4in_xing_in_ar_mem_4_addr = axi4asource_auto_out_ar_mem_4_addr; 
  assign island_auto_axi4in_xing_in_ar_mem_4_len = axi4asource_auto_out_ar_mem_4_len; 
  assign island_auto_axi4in_xing_in_ar_mem_4_size = axi4asource_auto_out_ar_mem_4_size; 
  assign island_auto_axi4in_xing_in_ar_mem_4_burst = axi4asource_auto_out_ar_mem_4_burst; 
  assign island_auto_axi4in_xing_in_ar_mem_4_lock = axi4asource_auto_out_ar_mem_4_lock; 
  assign island_auto_axi4in_xing_in_ar_mem_4_cache = axi4asource_auto_out_ar_mem_4_cache; 
  assign island_auto_axi4in_xing_in_ar_mem_4_prot = axi4asource_auto_out_ar_mem_4_prot; 
  assign island_auto_axi4in_xing_in_ar_mem_4_qos = axi4asource_auto_out_ar_mem_4_qos; 
  assign island_auto_axi4in_xing_in_ar_mem_5_id = axi4asource_auto_out_ar_mem_5_id; 
  assign island_auto_axi4in_xing_in_ar_mem_5_addr = axi4asource_auto_out_ar_mem_5_addr; 
  assign island_auto_axi4in_xing_in_ar_mem_5_len = axi4asource_auto_out_ar_mem_5_len; 
  assign island_auto_axi4in_xing_in_ar_mem_5_size = axi4asource_auto_out_ar_mem_5_size; 
  assign island_auto_axi4in_xing_in_ar_mem_5_burst = axi4asource_auto_out_ar_mem_5_burst; 
  assign island_auto_axi4in_xing_in_ar_mem_5_lock = axi4asource_auto_out_ar_mem_5_lock; 
  assign island_auto_axi4in_xing_in_ar_mem_5_cache = axi4asource_auto_out_ar_mem_5_cache; 
  assign island_auto_axi4in_xing_in_ar_mem_5_prot = axi4asource_auto_out_ar_mem_5_prot; 
  assign island_auto_axi4in_xing_in_ar_mem_5_qos = axi4asource_auto_out_ar_mem_5_qos; 
  assign island_auto_axi4in_xing_in_ar_mem_6_id = axi4asource_auto_out_ar_mem_6_id; 
  assign island_auto_axi4in_xing_in_ar_mem_6_addr = axi4asource_auto_out_ar_mem_6_addr; 
  assign island_auto_axi4in_xing_in_ar_mem_6_len = axi4asource_auto_out_ar_mem_6_len; 
  assign island_auto_axi4in_xing_in_ar_mem_6_size = axi4asource_auto_out_ar_mem_6_size; 
  assign island_auto_axi4in_xing_in_ar_mem_6_burst = axi4asource_auto_out_ar_mem_6_burst; 
  assign island_auto_axi4in_xing_in_ar_mem_6_lock = axi4asource_auto_out_ar_mem_6_lock; 
  assign island_auto_axi4in_xing_in_ar_mem_6_cache = axi4asource_auto_out_ar_mem_6_cache; 
  assign island_auto_axi4in_xing_in_ar_mem_6_prot = axi4asource_auto_out_ar_mem_6_prot; 
  assign island_auto_axi4in_xing_in_ar_mem_6_qos = axi4asource_auto_out_ar_mem_6_qos; 
  assign island_auto_axi4in_xing_in_ar_mem_7_id = axi4asource_auto_out_ar_mem_7_id; 
  assign island_auto_axi4in_xing_in_ar_mem_7_addr = axi4asource_auto_out_ar_mem_7_addr; 
  assign island_auto_axi4in_xing_in_ar_mem_7_len = axi4asource_auto_out_ar_mem_7_len; 
  assign island_auto_axi4in_xing_in_ar_mem_7_size = axi4asource_auto_out_ar_mem_7_size; 
  assign island_auto_axi4in_xing_in_ar_mem_7_burst = axi4asource_auto_out_ar_mem_7_burst; 
  assign island_auto_axi4in_xing_in_ar_mem_7_lock = axi4asource_auto_out_ar_mem_7_lock; 
  assign island_auto_axi4in_xing_in_ar_mem_7_cache = axi4asource_auto_out_ar_mem_7_cache; 
  assign island_auto_axi4in_xing_in_ar_mem_7_prot = axi4asource_auto_out_ar_mem_7_prot; 
  assign island_auto_axi4in_xing_in_ar_mem_7_qos = axi4asource_auto_out_ar_mem_7_qos; 
  assign island_auto_axi4in_xing_in_ar_widx = axi4asource_auto_out_ar_widx; 
  assign island_auto_axi4in_xing_in_ar_safe_widx_valid = axi4asource_auto_out_ar_safe_widx_valid; 
  assign island_auto_axi4in_xing_in_ar_safe_source_reset_n = axi4asource_auto_out_ar_safe_source_reset_n; 
  assign island_auto_axi4in_xing_in_r_ridx = axi4asource_auto_out_r_ridx; 
  assign island_auto_axi4in_xing_in_r_safe_ridx_valid = axi4asource_auto_out_r_safe_ridx_valid; 
  assign island_auto_axi4in_xing_in_r_safe_sink_reset_n = axi4asource_auto_out_r_safe_sink_reset_n;  
  `endif
  assign island_io_port_sys_clk_i = io_port_sys_clk_i; 
  assign island_io_port_aresetn = io_port_aresetn; 
  assign island_io_port_sys_rst = io_port_sys_rst; 
`ifndef CHIPLINK_CONNECT_DIRECT_TL  
  assign axi4asource_clock = clock; 
  assign axi4asource_reset = reset; 
  assign axi4asource_auto_in_aw_valid = yank_auto_out_aw_valid; 
  assign axi4asource_auto_in_aw_bits_id = yank_auto_out_aw_bits_id; 
  assign axi4asource_auto_in_aw_bits_addr = yank_auto_out_aw_bits_addr; 
  assign axi4asource_auto_in_aw_bits_len = yank_auto_out_aw_bits_len; 
  assign axi4asource_auto_in_aw_bits_size = yank_auto_out_aw_bits_size; 
  assign axi4asource_auto_in_aw_bits_burst = yank_auto_out_aw_bits_burst; 
  assign axi4asource_auto_in_aw_bits_lock = yank_auto_out_aw_bits_lock; 
  assign axi4asource_auto_in_aw_bits_cache = yank_auto_out_aw_bits_cache; 
  assign axi4asource_auto_in_aw_bits_prot = yank_auto_out_aw_bits_prot; 
  assign axi4asource_auto_in_aw_bits_qos = yank_auto_out_aw_bits_qos; 
  assign axi4asource_auto_in_w_valid = yank_auto_out_w_valid; 
  assign axi4asource_auto_in_w_bits_data = yank_auto_out_w_bits_data; 
  assign axi4asource_auto_in_w_bits_strb = yank_auto_out_w_bits_strb; 
  assign axi4asource_auto_in_w_bits_last = yank_auto_out_w_bits_last; 
  assign axi4asource_auto_in_b_ready = yank_auto_out_b_ready; 
  assign axi4asource_auto_in_ar_valid = yank_auto_out_ar_valid; 
  assign axi4asource_auto_in_ar_bits_id = yank_auto_out_ar_bits_id; 
  assign axi4asource_auto_in_ar_bits_addr = yank_auto_out_ar_bits_addr; 
  assign axi4asource_auto_in_ar_bits_len = yank_auto_out_ar_bits_len; 
  assign axi4asource_auto_in_ar_bits_size = yank_auto_out_ar_bits_size; 
  assign axi4asource_auto_in_ar_bits_burst = yank_auto_out_ar_bits_burst; 
  assign axi4asource_auto_in_ar_bits_lock = yank_auto_out_ar_bits_lock; 
  assign axi4asource_auto_in_ar_bits_cache = yank_auto_out_ar_bits_cache; 
  assign axi4asource_auto_in_ar_bits_prot = yank_auto_out_ar_bits_prot; 
  assign axi4asource_auto_in_ar_bits_qos = yank_auto_out_ar_bits_qos; 
  assign axi4asource_auto_in_r_ready = yank_auto_out_r_ready; 
  assign axi4asource_auto_out_aw_ridx = island_auto_axi4in_xing_in_aw_ridx; 
  assign axi4asource_auto_out_aw_safe_ridx_valid = island_auto_axi4in_xing_in_aw_safe_ridx_valid; 
  assign axi4asource_auto_out_aw_safe_sink_reset_n = island_auto_axi4in_xing_in_aw_safe_sink_reset_n; 
  assign axi4asource_auto_out_w_ridx = island_auto_axi4in_xing_in_w_ridx; 
  assign axi4asource_auto_out_w_safe_ridx_valid = island_auto_axi4in_xing_in_w_safe_ridx_valid; 
  assign axi4asource_auto_out_w_safe_sink_reset_n = island_auto_axi4in_xing_in_w_safe_sink_reset_n; 
  assign axi4asource_auto_out_b_mem_0_id = island_auto_axi4in_xing_in_b_mem_0_id; 
  assign axi4asource_auto_out_b_mem_0_resp = island_auto_axi4in_xing_in_b_mem_0_resp; 
  assign axi4asource_auto_out_b_mem_1_id = island_auto_axi4in_xing_in_b_mem_1_id; 
  assign axi4asource_auto_out_b_mem_1_resp = island_auto_axi4in_xing_in_b_mem_1_resp; 
  assign axi4asource_auto_out_b_mem_2_id = island_auto_axi4in_xing_in_b_mem_2_id; 
  assign axi4asource_auto_out_b_mem_2_resp = island_auto_axi4in_xing_in_b_mem_2_resp; 
  assign axi4asource_auto_out_b_mem_3_id = island_auto_axi4in_xing_in_b_mem_3_id; 
  assign axi4asource_auto_out_b_mem_3_resp = island_auto_axi4in_xing_in_b_mem_3_resp; 
  assign axi4asource_auto_out_b_mem_4_id = island_auto_axi4in_xing_in_b_mem_4_id; 
  assign axi4asource_auto_out_b_mem_4_resp = island_auto_axi4in_xing_in_b_mem_4_resp; 
  assign axi4asource_auto_out_b_mem_5_id = island_auto_axi4in_xing_in_b_mem_5_id; 
  assign axi4asource_auto_out_b_mem_5_resp = island_auto_axi4in_xing_in_b_mem_5_resp; 
  assign axi4asource_auto_out_b_mem_6_id = island_auto_axi4in_xing_in_b_mem_6_id; 
  assign axi4asource_auto_out_b_mem_6_resp = island_auto_axi4in_xing_in_b_mem_6_resp; 
  assign axi4asource_auto_out_b_mem_7_id = island_auto_axi4in_xing_in_b_mem_7_id; 
  assign axi4asource_auto_out_b_mem_7_resp = island_auto_axi4in_xing_in_b_mem_7_resp; 
  assign axi4asource_auto_out_b_widx = island_auto_axi4in_xing_in_b_widx; 
  assign axi4asource_auto_out_b_safe_widx_valid = island_auto_axi4in_xing_in_b_safe_widx_valid; 
  assign axi4asource_auto_out_b_safe_source_reset_n = island_auto_axi4in_xing_in_b_safe_source_reset_n; 
  assign axi4asource_auto_out_ar_ridx = island_auto_axi4in_xing_in_ar_ridx; 
  assign axi4asource_auto_out_ar_safe_ridx_valid = island_auto_axi4in_xing_in_ar_safe_ridx_valid; 
  assign axi4asource_auto_out_ar_safe_sink_reset_n = island_auto_axi4in_xing_in_ar_safe_sink_reset_n; 
  assign axi4asource_auto_out_r_mem_0_id = island_auto_axi4in_xing_in_r_mem_0_id; 
  assign axi4asource_auto_out_r_mem_0_data = island_auto_axi4in_xing_in_r_mem_0_data; 
  assign axi4asource_auto_out_r_mem_0_resp = island_auto_axi4in_xing_in_r_mem_0_resp; 
  assign axi4asource_auto_out_r_mem_0_last = island_auto_axi4in_xing_in_r_mem_0_last; 
  assign axi4asource_auto_out_r_mem_1_id = island_auto_axi4in_xing_in_r_mem_1_id; 
  assign axi4asource_auto_out_r_mem_1_data = island_auto_axi4in_xing_in_r_mem_1_data; 
  assign axi4asource_auto_out_r_mem_1_resp = island_auto_axi4in_xing_in_r_mem_1_resp; 
  assign axi4asource_auto_out_r_mem_1_last = island_auto_axi4in_xing_in_r_mem_1_last; 
  assign axi4asource_auto_out_r_mem_2_id = island_auto_axi4in_xing_in_r_mem_2_id; 
  assign axi4asource_auto_out_r_mem_2_data = island_auto_axi4in_xing_in_r_mem_2_data; 
  assign axi4asource_auto_out_r_mem_2_resp = island_auto_axi4in_xing_in_r_mem_2_resp; 
  assign axi4asource_auto_out_r_mem_2_last = island_auto_axi4in_xing_in_r_mem_2_last; 
  assign axi4asource_auto_out_r_mem_3_id = island_auto_axi4in_xing_in_r_mem_3_id; 
  assign axi4asource_auto_out_r_mem_3_data = island_auto_axi4in_xing_in_r_mem_3_data; 
  assign axi4asource_auto_out_r_mem_3_resp = island_auto_axi4in_xing_in_r_mem_3_resp; 
  assign axi4asource_auto_out_r_mem_3_last = island_auto_axi4in_xing_in_r_mem_3_last; 
  assign axi4asource_auto_out_r_mem_4_id = island_auto_axi4in_xing_in_r_mem_4_id; 
  assign axi4asource_auto_out_r_mem_4_data = island_auto_axi4in_xing_in_r_mem_4_data; 
  assign axi4asource_auto_out_r_mem_4_resp = island_auto_axi4in_xing_in_r_mem_4_resp; 
  assign axi4asource_auto_out_r_mem_4_last = island_auto_axi4in_xing_in_r_mem_4_last; 
  assign axi4asource_auto_out_r_mem_5_id = island_auto_axi4in_xing_in_r_mem_5_id; 
  assign axi4asource_auto_out_r_mem_5_data = island_auto_axi4in_xing_in_r_mem_5_data; 
  assign axi4asource_auto_out_r_mem_5_resp = island_auto_axi4in_xing_in_r_mem_5_resp; 
  assign axi4asource_auto_out_r_mem_5_last = island_auto_axi4in_xing_in_r_mem_5_last; 
  assign axi4asource_auto_out_r_mem_6_id = island_auto_axi4in_xing_in_r_mem_6_id; 
  assign axi4asource_auto_out_r_mem_6_data = island_auto_axi4in_xing_in_r_mem_6_data; 
  assign axi4asource_auto_out_r_mem_6_resp = island_auto_axi4in_xing_in_r_mem_6_resp; 
  assign axi4asource_auto_out_r_mem_6_last = island_auto_axi4in_xing_in_r_mem_6_last; 
  assign axi4asource_auto_out_r_mem_7_id = island_auto_axi4in_xing_in_r_mem_7_id; 
  assign axi4asource_auto_out_r_mem_7_data = island_auto_axi4in_xing_in_r_mem_7_data; 
  assign axi4asource_auto_out_r_mem_7_resp = island_auto_axi4in_xing_in_r_mem_7_resp; 
  assign axi4asource_auto_out_r_mem_7_last = island_auto_axi4in_xing_in_r_mem_7_last; 
  assign axi4asource_auto_out_r_widx = island_auto_axi4in_xing_in_r_widx; 
  assign axi4asource_auto_out_r_safe_widx_valid = island_auto_axi4in_xing_in_r_safe_widx_valid; 
  `endif

endmodule

