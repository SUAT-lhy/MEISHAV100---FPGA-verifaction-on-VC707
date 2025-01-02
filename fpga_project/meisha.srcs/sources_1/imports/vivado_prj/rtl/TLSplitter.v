module TLSplitter( 
  input         clock, 
  input         reset, 
  output        auto_in_3_a_ready, 
  input         auto_in_3_a_valid, 
  input  [2:0]  auto_in_3_a_bits_opcode, 
  input  [2:0]  auto_in_3_a_bits_param, 
  input  [2:0]  auto_in_3_a_bits_size, 
  input  [1:0]  auto_in_3_a_bits_source, 
  input  [37:0] auto_in_3_a_bits_address, 
  input  [7:0]  auto_in_3_a_bits_mask, 
  input  [63:0] auto_in_3_a_bits_data, 
  input         auto_in_3_a_bits_corrupt, 
  input         auto_in_3_b_ready, 
  output        auto_in_3_b_valid, 
  output [2:0]  auto_in_3_b_bits_opcode, 
  output [1:0]  auto_in_3_b_bits_param, 
  output [2:0]  auto_in_3_b_bits_size, 
  output [1:0]  auto_in_3_b_bits_source, 
  output [37:0] auto_in_3_b_bits_address, 
  output [7:0]  auto_in_3_b_bits_mask, 
  output        auto_in_3_b_bits_corrupt, 
  output        auto_in_3_c_ready, 
  input         auto_in_3_c_valid, 
  input  [2:0]  auto_in_3_c_bits_opcode, 
  input  [2:0]  auto_in_3_c_bits_param, 
  input  [2:0]  auto_in_3_c_bits_size, 
  input  [1:0]  auto_in_3_c_bits_source, 
  input  [37:0] auto_in_3_c_bits_address, 
  input  [63:0] auto_in_3_c_bits_data, 
  input         auto_in_3_c_bits_corrupt, 
  input         auto_in_3_d_ready, 
  output        auto_in_3_d_valid, 
  output [2:0]  auto_in_3_d_bits_opcode, 
  output [1:0]  auto_in_3_d_bits_param, 
  output [2:0]  auto_in_3_d_bits_size, 
  output [1:0]  auto_in_3_d_bits_source, 
  output [2:0]  auto_in_3_d_bits_sink, 
  output        auto_in_3_d_bits_denied, 
  output [63:0] auto_in_3_d_bits_data, 
  output        auto_in_3_d_bits_corrupt, 
  output        auto_in_3_e_ready, 
  input         auto_in_3_e_valid, 
  input  [2:0]  auto_in_3_e_bits_sink, 
  output        auto_in_2_a_ready, 
  input         auto_in_2_a_valid, 
  input  [2:0]  auto_in_2_a_bits_opcode, 
  input  [2:0]  auto_in_2_a_bits_param, 
  input  [2:0]  auto_in_2_a_bits_size, 
  input  [1:0]  auto_in_2_a_bits_source, 
  input  [37:0] auto_in_2_a_bits_address, 
  input  [7:0]  auto_in_2_a_bits_mask, 
  input  [63:0] auto_in_2_a_bits_data, 
  input         auto_in_2_a_bits_corrupt, 
  input         auto_in_2_b_ready, 
  output        auto_in_2_b_valid, 
  output [2:0]  auto_in_2_b_bits_opcode, 
  output [1:0]  auto_in_2_b_bits_param, 
  output [2:0]  auto_in_2_b_bits_size, 
  output [1:0]  auto_in_2_b_bits_source, 
  output [37:0] auto_in_2_b_bits_address, 
  output [7:0]  auto_in_2_b_bits_mask, 
  output        auto_in_2_b_bits_corrupt, 
  output        auto_in_2_c_ready, 
  input         auto_in_2_c_valid, 
  input  [2:0]  auto_in_2_c_bits_opcode, 
  input  [2:0]  auto_in_2_c_bits_param, 
  input  [2:0]  auto_in_2_c_bits_size, 
  input  [1:0]  auto_in_2_c_bits_source, 
  input  [37:0] auto_in_2_c_bits_address, 
  input  [63:0] auto_in_2_c_bits_data, 
  input         auto_in_2_c_bits_corrupt, 
  input         auto_in_2_d_ready, 
  output        auto_in_2_d_valid, 
  output [2:0]  auto_in_2_d_bits_opcode, 
  output [1:0]  auto_in_2_d_bits_param, 
  output [2:0]  auto_in_2_d_bits_size, 
  output [1:0]  auto_in_2_d_bits_source, 
  output [2:0]  auto_in_2_d_bits_sink, 
  output        auto_in_2_d_bits_denied, 
  output [63:0] auto_in_2_d_bits_data, 
  output        auto_in_2_d_bits_corrupt, 
  output        auto_in_2_e_ready, 
  input         auto_in_2_e_valid, 
  input  [2:0]  auto_in_2_e_bits_sink, 
  output        auto_in_1_a_ready, 
  input         auto_in_1_a_valid, 
  input  [2:0]  auto_in_1_a_bits_opcode, 
  input  [2:0]  auto_in_1_a_bits_param, 
  input  [2:0]  auto_in_1_a_bits_size, 
  input  [1:0]  auto_in_1_a_bits_source, 
  input  [37:0] auto_in_1_a_bits_address, 
  input  [7:0]  auto_in_1_a_bits_mask, 
  input  [63:0] auto_in_1_a_bits_data, 
  input         auto_in_1_a_bits_corrupt, 
  input         auto_in_1_b_ready, 
  output        auto_in_1_b_valid, 
  output [2:0]  auto_in_1_b_bits_opcode, 
  output [1:0]  auto_in_1_b_bits_param, 
  output [2:0]  auto_in_1_b_bits_size, 
  output [1:0]  auto_in_1_b_bits_source, 
  output [37:0] auto_in_1_b_bits_address, 
  output [7:0]  auto_in_1_b_bits_mask, 
  output        auto_in_1_b_bits_corrupt, 
  output        auto_in_1_c_ready, 
  input         auto_in_1_c_valid, 
  input  [2:0]  auto_in_1_c_bits_opcode, 
  input  [2:0]  auto_in_1_c_bits_param, 
  input  [2:0]  auto_in_1_c_bits_size, 
  input  [1:0]  auto_in_1_c_bits_source, 
  input  [37:0] auto_in_1_c_bits_address, 
  input  [63:0] auto_in_1_c_bits_data, 
  input         auto_in_1_c_bits_corrupt, 
  input         auto_in_1_d_ready, 
  output        auto_in_1_d_valid, 
  output [2:0]  auto_in_1_d_bits_opcode, 
  output [1:0]  auto_in_1_d_bits_param, 
  output [2:0]  auto_in_1_d_bits_size, 
  output [1:0]  auto_in_1_d_bits_source, 
  output [2:0]  auto_in_1_d_bits_sink, 
  output        auto_in_1_d_bits_denied, 
  output [63:0] auto_in_1_d_bits_data, 
  output        auto_in_1_d_bits_corrupt, 
  output        auto_in_1_e_ready, 
  input         auto_in_1_e_valid, 
  input  [2:0]  auto_in_1_e_bits_sink, 
  output        auto_in_0_a_ready, 
  input         auto_in_0_a_valid, 
  input  [2:0]  auto_in_0_a_bits_opcode, 
  input  [2:0]  auto_in_0_a_bits_param, 
  input  [2:0]  auto_in_0_a_bits_size, 
  input  [1:0]  auto_in_0_a_bits_source, 
  input  [37:0] auto_in_0_a_bits_address, 
  input  [7:0]  auto_in_0_a_bits_mask, 
  input  [63:0] auto_in_0_a_bits_data, 
  input         auto_in_0_a_bits_corrupt, 
  input         auto_in_0_b_ready, 
  output        auto_in_0_b_valid, 
  output [2:0]  auto_in_0_b_bits_opcode, 
  output [1:0]  auto_in_0_b_bits_param, 
  output [2:0]  auto_in_0_b_bits_size, 
  output [1:0]  auto_in_0_b_bits_source, 
  output [37:0] auto_in_0_b_bits_address, 
  output [7:0]  auto_in_0_b_bits_mask, 
  output        auto_in_0_b_bits_corrupt, 
  output        auto_in_0_c_ready, 
  input         auto_in_0_c_valid, 
  input  [2:0]  auto_in_0_c_bits_opcode, 
  input  [2:0]  auto_in_0_c_bits_param, 
  input  [2:0]  auto_in_0_c_bits_size, 
  input  [1:0]  auto_in_0_c_bits_source, 
  input  [37:0] auto_in_0_c_bits_address, 
  input  [63:0] auto_in_0_c_bits_data, 
  input         auto_in_0_c_bits_corrupt, 
  input         auto_in_0_d_ready, 
  output        auto_in_0_d_valid, 
  output [2:0]  auto_in_0_d_bits_opcode, 
  output [1:0]  auto_in_0_d_bits_param, 
  output [2:0]  auto_in_0_d_bits_size, 
  output [1:0]  auto_in_0_d_bits_source, 
  output [2:0]  auto_in_0_d_bits_sink, 
  output        auto_in_0_d_bits_denied, 
  output [63:0] auto_in_0_d_bits_data, 
  output        auto_in_0_d_bits_corrupt, 
  output        auto_in_0_e_ready, 
  input         auto_in_0_e_valid, 
  input  [2:0]  auto_in_0_e_bits_sink, 
  input         auto_out_3_a_ready, 
  output        auto_out_3_a_valid, 
  output [2:0]  auto_out_3_a_bits_opcode, 
  output [2:0]  auto_out_3_a_bits_param, 
  output [2:0]  auto_out_3_a_bits_size, 
  output [1:0]  auto_out_3_a_bits_source, 
  output [37:0] auto_out_3_a_bits_address, 
  output [7:0]  auto_out_3_a_bits_mask, 
  output [63:0] auto_out_3_a_bits_data, 
  output        auto_out_3_a_bits_corrupt, 
  output        auto_out_3_b_ready, 
  input         auto_out_3_b_valid, 
  input  [2:0]  auto_out_3_b_bits_opcode, 
  input  [1:0]  auto_out_3_b_bits_param, 
  input  [2:0]  auto_out_3_b_bits_size, 
  input  [1:0]  auto_out_3_b_bits_source, 
  input  [37:0] auto_out_3_b_bits_address, 
  input  [7:0]  auto_out_3_b_bits_mask, 
  input         auto_out_3_b_bits_corrupt, 
  input         auto_out_3_c_ready, 
  output        auto_out_3_c_valid, 
  output [2:0]  auto_out_3_c_bits_opcode, 
  output [2:0]  auto_out_3_c_bits_param, 
  output [2:0]  auto_out_3_c_bits_size, 
  output [1:0]  auto_out_3_c_bits_source, 
  output [37:0] auto_out_3_c_bits_address, 
  output [63:0] auto_out_3_c_bits_data, 
  output        auto_out_3_c_bits_corrupt, 
  output        auto_out_3_d_ready, 
  input         auto_out_3_d_valid, 
  input  [2:0]  auto_out_3_d_bits_opcode, 
  input  [1:0]  auto_out_3_d_bits_param, 
  input  [2:0]  auto_out_3_d_bits_size, 
  input  [1:0]  auto_out_3_d_bits_source, 
  input  [2:0]  auto_out_3_d_bits_sink, 
  input         auto_out_3_d_bits_denied, 
  input  [63:0] auto_out_3_d_bits_data, 
  input         auto_out_3_d_bits_corrupt, 
  input         auto_out_3_e_ready, 
  output        auto_out_3_e_valid, 
  output [2:0]  auto_out_3_e_bits_sink, 
  input         auto_out_2_a_ready, 
  output        auto_out_2_a_valid, 
  output [2:0]  auto_out_2_a_bits_opcode, 
  output [2:0]  auto_out_2_a_bits_param, 
  output [2:0]  auto_out_2_a_bits_size, 
  output [1:0]  auto_out_2_a_bits_source, 
  output [37:0] auto_out_2_a_bits_address, 
  output [7:0]  auto_out_2_a_bits_mask, 
  output [63:0] auto_out_2_a_bits_data, 
  output        auto_out_2_a_bits_corrupt, 
  output        auto_out_2_b_ready, 
  input         auto_out_2_b_valid, 
  input  [2:0]  auto_out_2_b_bits_opcode, 
  input  [1:0]  auto_out_2_b_bits_param, 
  input  [2:0]  auto_out_2_b_bits_size, 
  input  [1:0]  auto_out_2_b_bits_source, 
  input  [37:0] auto_out_2_b_bits_address, 
  input  [7:0]  auto_out_2_b_bits_mask, 
  input         auto_out_2_b_bits_corrupt, 
  input         auto_out_2_c_ready, 
  output        auto_out_2_c_valid, 
  output [2:0]  auto_out_2_c_bits_opcode, 
  output [2:0]  auto_out_2_c_bits_param, 
  output [2:0]  auto_out_2_c_bits_size, 
  output [1:0]  auto_out_2_c_bits_source, 
  output [37:0] auto_out_2_c_bits_address, 
  output [63:0] auto_out_2_c_bits_data, 
  output        auto_out_2_c_bits_corrupt, 
  output        auto_out_2_d_ready, 
  input         auto_out_2_d_valid, 
  input  [2:0]  auto_out_2_d_bits_opcode, 
  input  [1:0]  auto_out_2_d_bits_param, 
  input  [2:0]  auto_out_2_d_bits_size, 
  input  [1:0]  auto_out_2_d_bits_source, 
  input  [2:0]  auto_out_2_d_bits_sink, 
  input         auto_out_2_d_bits_denied, 
  input  [63:0] auto_out_2_d_bits_data, 
  input         auto_out_2_d_bits_corrupt, 
  input         auto_out_2_e_ready, 
  output        auto_out_2_e_valid, 
  output [2:0]  auto_out_2_e_bits_sink, 
  input         auto_out_1_a_ready, 
  output        auto_out_1_a_valid, 
  output [2:0]  auto_out_1_a_bits_opcode, 
  output [2:0]  auto_out_1_a_bits_param, 
  output [2:0]  auto_out_1_a_bits_size, 
  output [1:0]  auto_out_1_a_bits_source, 
  output [37:0] auto_out_1_a_bits_address, 
  output [7:0]  auto_out_1_a_bits_mask, 
  output [63:0] auto_out_1_a_bits_data, 
  output        auto_out_1_a_bits_corrupt, 
  output        auto_out_1_b_ready, 
  input         auto_out_1_b_valid, 
  input  [2:0]  auto_out_1_b_bits_opcode, 
  input  [1:0]  auto_out_1_b_bits_param, 
  input  [2:0]  auto_out_1_b_bits_size, 
  input  [1:0]  auto_out_1_b_bits_source, 
  input  [37:0] auto_out_1_b_bits_address, 
  input  [7:0]  auto_out_1_b_bits_mask, 
  input         auto_out_1_b_bits_corrupt, 
  input         auto_out_1_c_ready, 
  output        auto_out_1_c_valid, 
  output [2:0]  auto_out_1_c_bits_opcode, 
  output [2:0]  auto_out_1_c_bits_param, 
  output [2:0]  auto_out_1_c_bits_size, 
  output [1:0]  auto_out_1_c_bits_source, 
  output [37:0] auto_out_1_c_bits_address, 
  output [63:0] auto_out_1_c_bits_data, 
  output        auto_out_1_c_bits_corrupt, 
  output        auto_out_1_d_ready, 
  input         auto_out_1_d_valid, 
  input  [2:0]  auto_out_1_d_bits_opcode, 
  input  [1:0]  auto_out_1_d_bits_param, 
  input  [2:0]  auto_out_1_d_bits_size, 
  input  [1:0]  auto_out_1_d_bits_source, 
  input  [2:0]  auto_out_1_d_bits_sink, 
  input         auto_out_1_d_bits_denied, 
  input  [63:0] auto_out_1_d_bits_data, 
  input         auto_out_1_d_bits_corrupt, 
  input         auto_out_1_e_ready, 
  output        auto_out_1_e_valid, 
  output [2:0]  auto_out_1_e_bits_sink, 
  input         auto_out_0_a_ready, 
  output        auto_out_0_a_valid, 
  output [2:0]  auto_out_0_a_bits_opcode, 
  output [2:0]  auto_out_0_a_bits_param, 
  output [2:0]  auto_out_0_a_bits_size, 
  output [1:0]  auto_out_0_a_bits_source, 
  output [37:0] auto_out_0_a_bits_address, 
  output [7:0]  auto_out_0_a_bits_mask, 
  output [63:0] auto_out_0_a_bits_data, 
  output        auto_out_0_a_bits_corrupt, 
  output        auto_out_0_b_ready, 
  input         auto_out_0_b_valid, 
  input  [2:0]  auto_out_0_b_bits_opcode, 
  input  [1:0]  auto_out_0_b_bits_param, 
  input  [2:0]  auto_out_0_b_bits_size, 
  input  [1:0]  auto_out_0_b_bits_source, 
  input  [37:0] auto_out_0_b_bits_address, 
  input  [7:0]  auto_out_0_b_bits_mask, 
  input         auto_out_0_b_bits_corrupt, 
  input         auto_out_0_c_ready, 
  output        auto_out_0_c_valid, 
  output [2:0]  auto_out_0_c_bits_opcode, 
  output [2:0]  auto_out_0_c_bits_param, 
  output [2:0]  auto_out_0_c_bits_size, 
  output [1:0]  auto_out_0_c_bits_source, 
  output [37:0] auto_out_0_c_bits_address, 
  output [63:0] auto_out_0_c_bits_data, 
  output        auto_out_0_c_bits_corrupt, 
  output        auto_out_0_d_ready, 
  input         auto_out_0_d_valid, 
  input  [2:0]  auto_out_0_d_bits_opcode, 
  input  [1:0]  auto_out_0_d_bits_param, 
  input  [2:0]  auto_out_0_d_bits_size, 
  input  [1:0]  auto_out_0_d_bits_source, 
  input  [2:0]  auto_out_0_d_bits_sink, 
  input         auto_out_0_d_bits_denied, 
  input  [63:0] auto_out_0_d_bits_data, 
  input         auto_out_0_d_bits_corrupt, 
  input         auto_out_0_e_ready, 
  output        auto_out_0_e_valid, 
  output [2:0]  auto_out_0_e_bits_sink 
);
  wire  TLMonitor_clock; 
  wire  TLMonitor_reset; 
  wire  TLMonitor_io_in_a_ready; 
  wire  TLMonitor_io_in_a_valid; 
  wire [2:0] TLMonitor_io_in_a_bits_opcode; 
  wire [2:0] TLMonitor_io_in_a_bits_param; 
  wire [2:0] TLMonitor_io_in_a_bits_size; 
  wire [1:0] TLMonitor_io_in_a_bits_source; 
  wire [37:0] TLMonitor_io_in_a_bits_address; 
  wire [7:0] TLMonitor_io_in_a_bits_mask; 
  wire  TLMonitor_io_in_a_bits_corrupt; 
  wire  TLMonitor_io_in_b_ready; 
  wire  TLMonitor_io_in_b_valid; 
  wire [2:0] TLMonitor_io_in_b_bits_opcode; 
  wire [1:0] TLMonitor_io_in_b_bits_param; 
  wire [2:0] TLMonitor_io_in_b_bits_size; 
  wire [1:0] TLMonitor_io_in_b_bits_source; 
  wire [37:0] TLMonitor_io_in_b_bits_address; 
  wire [7:0] TLMonitor_io_in_b_bits_mask; 
  wire  TLMonitor_io_in_b_bits_corrupt; 
  wire  TLMonitor_io_in_c_ready; 
  wire  TLMonitor_io_in_c_valid; 
  wire [2:0] TLMonitor_io_in_c_bits_opcode; 
  wire [2:0] TLMonitor_io_in_c_bits_param; 
  wire [2:0] TLMonitor_io_in_c_bits_size; 
  wire [1:0] TLMonitor_io_in_c_bits_source; 
  wire [37:0] TLMonitor_io_in_c_bits_address; 
  wire  TLMonitor_io_in_c_bits_corrupt; 
  wire  TLMonitor_io_in_d_ready; 
  wire  TLMonitor_io_in_d_valid; 
  wire [2:0] TLMonitor_io_in_d_bits_opcode; 
  wire [1:0] TLMonitor_io_in_d_bits_param; 
  wire [2:0] TLMonitor_io_in_d_bits_size; 
  wire [1:0] TLMonitor_io_in_d_bits_source; 
  wire [2:0] TLMonitor_io_in_d_bits_sink; 
  wire  TLMonitor_io_in_d_bits_denied; 
  wire  TLMonitor_io_in_d_bits_corrupt; 
  wire  TLMonitor_io_in_e_ready; 
  wire  TLMonitor_io_in_e_valid; 
  wire [2:0] TLMonitor_io_in_e_bits_sink; 
  wire  TLMonitor_1_clock; 
  wire  TLMonitor_1_reset; 
  wire  TLMonitor_1_io_in_a_ready; 
  wire  TLMonitor_1_io_in_a_valid; 
  wire [2:0] TLMonitor_1_io_in_a_bits_opcode; 
  wire [2:0] TLMonitor_1_io_in_a_bits_param; 
  wire [2:0] TLMonitor_1_io_in_a_bits_size; 
  wire [1:0] TLMonitor_1_io_in_a_bits_source; 
  wire [37:0] TLMonitor_1_io_in_a_bits_address; 
  wire [7:0] TLMonitor_1_io_in_a_bits_mask; 
  wire  TLMonitor_1_io_in_a_bits_corrupt; 
  wire  TLMonitor_1_io_in_b_ready; 
  wire  TLMonitor_1_io_in_b_valid; 
  wire [2:0] TLMonitor_1_io_in_b_bits_opcode; 
  wire [1:0] TLMonitor_1_io_in_b_bits_param; 
  wire [2:0] TLMonitor_1_io_in_b_bits_size; 
  wire [1:0] TLMonitor_1_io_in_b_bits_source; 
  wire [37:0] TLMonitor_1_io_in_b_bits_address; 
  wire [7:0] TLMonitor_1_io_in_b_bits_mask; 
  wire  TLMonitor_1_io_in_b_bits_corrupt; 
  wire  TLMonitor_1_io_in_c_ready; 
  wire  TLMonitor_1_io_in_c_valid; 
  wire [2:0] TLMonitor_1_io_in_c_bits_opcode; 
  wire [2:0] TLMonitor_1_io_in_c_bits_param; 
  wire [2:0] TLMonitor_1_io_in_c_bits_size; 
  wire [1:0] TLMonitor_1_io_in_c_bits_source; 
  wire [37:0] TLMonitor_1_io_in_c_bits_address; 
  wire  TLMonitor_1_io_in_c_bits_corrupt; 
  wire  TLMonitor_1_io_in_d_ready; 
  wire  TLMonitor_1_io_in_d_valid; 
  wire [2:0] TLMonitor_1_io_in_d_bits_opcode; 
  wire [1:0] TLMonitor_1_io_in_d_bits_param; 
  wire [2:0] TLMonitor_1_io_in_d_bits_size; 
  wire [1:0] TLMonitor_1_io_in_d_bits_source; 
  wire [2:0] TLMonitor_1_io_in_d_bits_sink; 
  wire  TLMonitor_1_io_in_d_bits_denied; 
  wire  TLMonitor_1_io_in_d_bits_corrupt; 
  wire  TLMonitor_1_io_in_e_ready; 
  wire  TLMonitor_1_io_in_e_valid; 
  wire [2:0] TLMonitor_1_io_in_e_bits_sink; 
  wire  TLMonitor_2_clock; 
  wire  TLMonitor_2_reset; 
  wire  TLMonitor_2_io_in_a_ready; 
  wire  TLMonitor_2_io_in_a_valid; 
  wire [2:0] TLMonitor_2_io_in_a_bits_opcode; 
  wire [2:0] TLMonitor_2_io_in_a_bits_param; 
  wire [2:0] TLMonitor_2_io_in_a_bits_size; 
  wire [1:0] TLMonitor_2_io_in_a_bits_source; 
  wire [37:0] TLMonitor_2_io_in_a_bits_address; 
  wire [7:0] TLMonitor_2_io_in_a_bits_mask; 
  wire  TLMonitor_2_io_in_a_bits_corrupt; 
  wire  TLMonitor_2_io_in_b_ready; 
  wire  TLMonitor_2_io_in_b_valid; 
  wire [2:0] TLMonitor_2_io_in_b_bits_opcode; 
  wire [1:0] TLMonitor_2_io_in_b_bits_param; 
  wire [2:0] TLMonitor_2_io_in_b_bits_size; 
  wire [1:0] TLMonitor_2_io_in_b_bits_source; 
  wire [37:0] TLMonitor_2_io_in_b_bits_address; 
  wire [7:0] TLMonitor_2_io_in_b_bits_mask; 
  wire  TLMonitor_2_io_in_b_bits_corrupt; 
  wire  TLMonitor_2_io_in_c_ready; 
  wire  TLMonitor_2_io_in_c_valid; 
  wire [2:0] TLMonitor_2_io_in_c_bits_opcode; 
  wire [2:0] TLMonitor_2_io_in_c_bits_param; 
  wire [2:0] TLMonitor_2_io_in_c_bits_size; 
  wire [1:0] TLMonitor_2_io_in_c_bits_source; 
  wire [37:0] TLMonitor_2_io_in_c_bits_address; 
  wire  TLMonitor_2_io_in_c_bits_corrupt; 
  wire  TLMonitor_2_io_in_d_ready; 
  wire  TLMonitor_2_io_in_d_valid; 
  wire [2:0] TLMonitor_2_io_in_d_bits_opcode; 
  wire [1:0] TLMonitor_2_io_in_d_bits_param; 
  wire [2:0] TLMonitor_2_io_in_d_bits_size; 
  wire [1:0] TLMonitor_2_io_in_d_bits_source; 
  wire [2:0] TLMonitor_2_io_in_d_bits_sink; 
  wire  TLMonitor_2_io_in_d_bits_denied; 
  wire  TLMonitor_2_io_in_d_bits_corrupt; 
  wire  TLMonitor_2_io_in_e_ready; 
  wire  TLMonitor_2_io_in_e_valid; 
  wire [2:0] TLMonitor_2_io_in_e_bits_sink; 
  wire  TLMonitor_3_clock; 
  wire  TLMonitor_3_reset; 
  wire  TLMonitor_3_io_in_a_ready; 
  wire  TLMonitor_3_io_in_a_valid; 
  wire [2:0] TLMonitor_3_io_in_a_bits_opcode; 
  wire [2:0] TLMonitor_3_io_in_a_bits_param; 
  wire [2:0] TLMonitor_3_io_in_a_bits_size; 
  wire [1:0] TLMonitor_3_io_in_a_bits_source; 
  wire [37:0] TLMonitor_3_io_in_a_bits_address; 
  wire [7:0] TLMonitor_3_io_in_a_bits_mask; 
  wire  TLMonitor_3_io_in_a_bits_corrupt; 
  wire  TLMonitor_3_io_in_b_ready; 
  wire  TLMonitor_3_io_in_b_valid; 
  wire [2:0] TLMonitor_3_io_in_b_bits_opcode; 
  wire [1:0] TLMonitor_3_io_in_b_bits_param; 
  wire [2:0] TLMonitor_3_io_in_b_bits_size; 
  wire [1:0] TLMonitor_3_io_in_b_bits_source; 
  wire [37:0] TLMonitor_3_io_in_b_bits_address; 
  wire [7:0] TLMonitor_3_io_in_b_bits_mask; 
  wire  TLMonitor_3_io_in_b_bits_corrupt; 
  wire  TLMonitor_3_io_in_c_ready; 
  wire  TLMonitor_3_io_in_c_valid; 
  wire [2:0] TLMonitor_3_io_in_c_bits_opcode; 
  wire [2:0] TLMonitor_3_io_in_c_bits_param; 
  wire [2:0] TLMonitor_3_io_in_c_bits_size; 
  wire [1:0] TLMonitor_3_io_in_c_bits_source; 
  wire [37:0] TLMonitor_3_io_in_c_bits_address; 
  wire  TLMonitor_3_io_in_c_bits_corrupt; 
  wire  TLMonitor_3_io_in_d_ready; 
  wire  TLMonitor_3_io_in_d_valid; 
  wire [2:0] TLMonitor_3_io_in_d_bits_opcode; 
  wire [1:0] TLMonitor_3_io_in_d_bits_param; 
  wire [2:0] TLMonitor_3_io_in_d_bits_size; 
  wire [1:0] TLMonitor_3_io_in_d_bits_source; 
  wire [2:0] TLMonitor_3_io_in_d_bits_sink; 
  wire  TLMonitor_3_io_in_d_bits_denied; 
  wire  TLMonitor_3_io_in_d_bits_corrupt; 
  wire  TLMonitor_3_io_in_e_ready; 
  wire  TLMonitor_3_io_in_e_valid; 
  wire [2:0] TLMonitor_3_io_in_e_bits_sink; 
  TLMonitor_23 TLMonitor ( 
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
    .io_in_b_ready(TLMonitor_io_in_b_ready),
    .io_in_b_valid(TLMonitor_io_in_b_valid),
    .io_in_b_bits_opcode(TLMonitor_io_in_b_bits_opcode),
    .io_in_b_bits_param(TLMonitor_io_in_b_bits_param),
    .io_in_b_bits_size(TLMonitor_io_in_b_bits_size),
    .io_in_b_bits_source(TLMonitor_io_in_b_bits_source),
    .io_in_b_bits_address(TLMonitor_io_in_b_bits_address),
    .io_in_b_bits_mask(TLMonitor_io_in_b_bits_mask),
    .io_in_b_bits_corrupt(TLMonitor_io_in_b_bits_corrupt),
    .io_in_c_ready(TLMonitor_io_in_c_ready),
    .io_in_c_valid(TLMonitor_io_in_c_valid),
    .io_in_c_bits_opcode(TLMonitor_io_in_c_bits_opcode),
    .io_in_c_bits_param(TLMonitor_io_in_c_bits_param),
    .io_in_c_bits_size(TLMonitor_io_in_c_bits_size),
    .io_in_c_bits_source(TLMonitor_io_in_c_bits_source),
    .io_in_c_bits_address(TLMonitor_io_in_c_bits_address),
    .io_in_c_bits_corrupt(TLMonitor_io_in_c_bits_corrupt),
    .io_in_d_ready(TLMonitor_io_in_d_ready),
    .io_in_d_valid(TLMonitor_io_in_d_valid),
    .io_in_d_bits_opcode(TLMonitor_io_in_d_bits_opcode),
    .io_in_d_bits_param(TLMonitor_io_in_d_bits_param),
    .io_in_d_bits_size(TLMonitor_io_in_d_bits_size),
    .io_in_d_bits_source(TLMonitor_io_in_d_bits_source),
    .io_in_d_bits_sink(TLMonitor_io_in_d_bits_sink),
    .io_in_d_bits_denied(TLMonitor_io_in_d_bits_denied),
    .io_in_d_bits_corrupt(TLMonitor_io_in_d_bits_corrupt),
    .io_in_e_ready(TLMonitor_io_in_e_ready),
    .io_in_e_valid(TLMonitor_io_in_e_valid),
    .io_in_e_bits_sink(TLMonitor_io_in_e_bits_sink)
  );
  TLMonitor_23 TLMonitor_1 ( 
    .clock(TLMonitor_1_clock),
    .reset(TLMonitor_1_reset),
    .io_in_a_ready(TLMonitor_1_io_in_a_ready),
    .io_in_a_valid(TLMonitor_1_io_in_a_valid),
    .io_in_a_bits_opcode(TLMonitor_1_io_in_a_bits_opcode),
    .io_in_a_bits_param(TLMonitor_1_io_in_a_bits_param),
    .io_in_a_bits_size(TLMonitor_1_io_in_a_bits_size),
    .io_in_a_bits_source(TLMonitor_1_io_in_a_bits_source),
    .io_in_a_bits_address(TLMonitor_1_io_in_a_bits_address),
    .io_in_a_bits_mask(TLMonitor_1_io_in_a_bits_mask),
    .io_in_a_bits_corrupt(TLMonitor_1_io_in_a_bits_corrupt),
    .io_in_b_ready(TLMonitor_1_io_in_b_ready),
    .io_in_b_valid(TLMonitor_1_io_in_b_valid),
    .io_in_b_bits_opcode(TLMonitor_1_io_in_b_bits_opcode),
    .io_in_b_bits_param(TLMonitor_1_io_in_b_bits_param),
    .io_in_b_bits_size(TLMonitor_1_io_in_b_bits_size),
    .io_in_b_bits_source(TLMonitor_1_io_in_b_bits_source),
    .io_in_b_bits_address(TLMonitor_1_io_in_b_bits_address),
    .io_in_b_bits_mask(TLMonitor_1_io_in_b_bits_mask),
    .io_in_b_bits_corrupt(TLMonitor_1_io_in_b_bits_corrupt),
    .io_in_c_ready(TLMonitor_1_io_in_c_ready),
    .io_in_c_valid(TLMonitor_1_io_in_c_valid),
    .io_in_c_bits_opcode(TLMonitor_1_io_in_c_bits_opcode),
    .io_in_c_bits_param(TLMonitor_1_io_in_c_bits_param),
    .io_in_c_bits_size(TLMonitor_1_io_in_c_bits_size),
    .io_in_c_bits_source(TLMonitor_1_io_in_c_bits_source),
    .io_in_c_bits_address(TLMonitor_1_io_in_c_bits_address),
    .io_in_c_bits_corrupt(TLMonitor_1_io_in_c_bits_corrupt),
    .io_in_d_ready(TLMonitor_1_io_in_d_ready),
    .io_in_d_valid(TLMonitor_1_io_in_d_valid),
    .io_in_d_bits_opcode(TLMonitor_1_io_in_d_bits_opcode),
    .io_in_d_bits_param(TLMonitor_1_io_in_d_bits_param),
    .io_in_d_bits_size(TLMonitor_1_io_in_d_bits_size),
    .io_in_d_bits_source(TLMonitor_1_io_in_d_bits_source),
    .io_in_d_bits_sink(TLMonitor_1_io_in_d_bits_sink),
    .io_in_d_bits_denied(TLMonitor_1_io_in_d_bits_denied),
    .io_in_d_bits_corrupt(TLMonitor_1_io_in_d_bits_corrupt),
    .io_in_e_ready(TLMonitor_1_io_in_e_ready),
    .io_in_e_valid(TLMonitor_1_io_in_e_valid),
    .io_in_e_bits_sink(TLMonitor_1_io_in_e_bits_sink)
  );
  TLMonitor_23 TLMonitor_2 ( 
    .clock(TLMonitor_2_clock),
    .reset(TLMonitor_2_reset),
    .io_in_a_ready(TLMonitor_2_io_in_a_ready),
    .io_in_a_valid(TLMonitor_2_io_in_a_valid),
    .io_in_a_bits_opcode(TLMonitor_2_io_in_a_bits_opcode),
    .io_in_a_bits_param(TLMonitor_2_io_in_a_bits_param),
    .io_in_a_bits_size(TLMonitor_2_io_in_a_bits_size),
    .io_in_a_bits_source(TLMonitor_2_io_in_a_bits_source),
    .io_in_a_bits_address(TLMonitor_2_io_in_a_bits_address),
    .io_in_a_bits_mask(TLMonitor_2_io_in_a_bits_mask),
    .io_in_a_bits_corrupt(TLMonitor_2_io_in_a_bits_corrupt),
    .io_in_b_ready(TLMonitor_2_io_in_b_ready),
    .io_in_b_valid(TLMonitor_2_io_in_b_valid),
    .io_in_b_bits_opcode(TLMonitor_2_io_in_b_bits_opcode),
    .io_in_b_bits_param(TLMonitor_2_io_in_b_bits_param),
    .io_in_b_bits_size(TLMonitor_2_io_in_b_bits_size),
    .io_in_b_bits_source(TLMonitor_2_io_in_b_bits_source),
    .io_in_b_bits_address(TLMonitor_2_io_in_b_bits_address),
    .io_in_b_bits_mask(TLMonitor_2_io_in_b_bits_mask),
    .io_in_b_bits_corrupt(TLMonitor_2_io_in_b_bits_corrupt),
    .io_in_c_ready(TLMonitor_2_io_in_c_ready),
    .io_in_c_valid(TLMonitor_2_io_in_c_valid),
    .io_in_c_bits_opcode(TLMonitor_2_io_in_c_bits_opcode),
    .io_in_c_bits_param(TLMonitor_2_io_in_c_bits_param),
    .io_in_c_bits_size(TLMonitor_2_io_in_c_bits_size),
    .io_in_c_bits_source(TLMonitor_2_io_in_c_bits_source),
    .io_in_c_bits_address(TLMonitor_2_io_in_c_bits_address),
    .io_in_c_bits_corrupt(TLMonitor_2_io_in_c_bits_corrupt),
    .io_in_d_ready(TLMonitor_2_io_in_d_ready),
    .io_in_d_valid(TLMonitor_2_io_in_d_valid),
    .io_in_d_bits_opcode(TLMonitor_2_io_in_d_bits_opcode),
    .io_in_d_bits_param(TLMonitor_2_io_in_d_bits_param),
    .io_in_d_bits_size(TLMonitor_2_io_in_d_bits_size),
    .io_in_d_bits_source(TLMonitor_2_io_in_d_bits_source),
    .io_in_d_bits_sink(TLMonitor_2_io_in_d_bits_sink),
    .io_in_d_bits_denied(TLMonitor_2_io_in_d_bits_denied),
    .io_in_d_bits_corrupt(TLMonitor_2_io_in_d_bits_corrupt),
    .io_in_e_ready(TLMonitor_2_io_in_e_ready),
    .io_in_e_valid(TLMonitor_2_io_in_e_valid),
    .io_in_e_bits_sink(TLMonitor_2_io_in_e_bits_sink)
  );
  TLMonitor_23 TLMonitor_3 ( 
    .clock(TLMonitor_3_clock),
    .reset(TLMonitor_3_reset),
    .io_in_a_ready(TLMonitor_3_io_in_a_ready),
    .io_in_a_valid(TLMonitor_3_io_in_a_valid),
    .io_in_a_bits_opcode(TLMonitor_3_io_in_a_bits_opcode),
    .io_in_a_bits_param(TLMonitor_3_io_in_a_bits_param),
    .io_in_a_bits_size(TLMonitor_3_io_in_a_bits_size),
    .io_in_a_bits_source(TLMonitor_3_io_in_a_bits_source),
    .io_in_a_bits_address(TLMonitor_3_io_in_a_bits_address),
    .io_in_a_bits_mask(TLMonitor_3_io_in_a_bits_mask),
    .io_in_a_bits_corrupt(TLMonitor_3_io_in_a_bits_corrupt),
    .io_in_b_ready(TLMonitor_3_io_in_b_ready),
    .io_in_b_valid(TLMonitor_3_io_in_b_valid),
    .io_in_b_bits_opcode(TLMonitor_3_io_in_b_bits_opcode),
    .io_in_b_bits_param(TLMonitor_3_io_in_b_bits_param),
    .io_in_b_bits_size(TLMonitor_3_io_in_b_bits_size),
    .io_in_b_bits_source(TLMonitor_3_io_in_b_bits_source),
    .io_in_b_bits_address(TLMonitor_3_io_in_b_bits_address),
    .io_in_b_bits_mask(TLMonitor_3_io_in_b_bits_mask),
    .io_in_b_bits_corrupt(TLMonitor_3_io_in_b_bits_corrupt),
    .io_in_c_ready(TLMonitor_3_io_in_c_ready),
    .io_in_c_valid(TLMonitor_3_io_in_c_valid),
    .io_in_c_bits_opcode(TLMonitor_3_io_in_c_bits_opcode),
    .io_in_c_bits_param(TLMonitor_3_io_in_c_bits_param),
    .io_in_c_bits_size(TLMonitor_3_io_in_c_bits_size),
    .io_in_c_bits_source(TLMonitor_3_io_in_c_bits_source),
    .io_in_c_bits_address(TLMonitor_3_io_in_c_bits_address),
    .io_in_c_bits_corrupt(TLMonitor_3_io_in_c_bits_corrupt),
    .io_in_d_ready(TLMonitor_3_io_in_d_ready),
    .io_in_d_valid(TLMonitor_3_io_in_d_valid),
    .io_in_d_bits_opcode(TLMonitor_3_io_in_d_bits_opcode),
    .io_in_d_bits_param(TLMonitor_3_io_in_d_bits_param),
    .io_in_d_bits_size(TLMonitor_3_io_in_d_bits_size),
    .io_in_d_bits_source(TLMonitor_3_io_in_d_bits_source),
    .io_in_d_bits_sink(TLMonitor_3_io_in_d_bits_sink),
    .io_in_d_bits_denied(TLMonitor_3_io_in_d_bits_denied),
    .io_in_d_bits_corrupt(TLMonitor_3_io_in_d_bits_corrupt),
    .io_in_e_ready(TLMonitor_3_io_in_e_ready),
    .io_in_e_valid(TLMonitor_3_io_in_e_valid),
    .io_in_e_bits_sink(TLMonitor_3_io_in_e_bits_sink)
  );
  assign auto_in_3_a_ready = auto_out_3_a_ready; 
  assign auto_in_3_b_valid = auto_out_3_b_valid; 
  assign auto_in_3_b_bits_opcode = auto_out_3_b_bits_opcode; 
  assign auto_in_3_b_bits_param = auto_out_3_b_bits_param; 
  assign auto_in_3_b_bits_size = auto_out_3_b_bits_size; 
  assign auto_in_3_b_bits_source = auto_out_3_b_bits_source; 
  assign auto_in_3_b_bits_address = auto_out_3_b_bits_address; 
  assign auto_in_3_b_bits_mask = auto_out_3_b_bits_mask; 
  assign auto_in_3_b_bits_corrupt = auto_out_3_b_bits_corrupt; 
  assign auto_in_3_c_ready = auto_out_3_c_ready; 
  assign auto_in_3_d_valid = auto_out_3_d_valid; 
  assign auto_in_3_d_bits_opcode = auto_out_3_d_bits_opcode; 
  assign auto_in_3_d_bits_param = auto_out_3_d_bits_param; 
  assign auto_in_3_d_bits_size = auto_out_3_d_bits_size; 
  assign auto_in_3_d_bits_source = auto_out_3_d_bits_source; 
  assign auto_in_3_d_bits_sink = auto_out_3_d_bits_sink; 
  assign auto_in_3_d_bits_denied = auto_out_3_d_bits_denied; 
  assign auto_in_3_d_bits_data = auto_out_3_d_bits_data; 
  assign auto_in_3_d_bits_corrupt = auto_out_3_d_bits_corrupt; 
  assign auto_in_3_e_ready = auto_out_3_e_ready; 
  assign auto_in_2_a_ready = auto_out_2_a_ready; 
  assign auto_in_2_b_valid = auto_out_2_b_valid; 
  assign auto_in_2_b_bits_opcode = auto_out_2_b_bits_opcode; 
  assign auto_in_2_b_bits_param = auto_out_2_b_bits_param; 
  assign auto_in_2_b_bits_size = auto_out_2_b_bits_size; 
  assign auto_in_2_b_bits_source = auto_out_2_b_bits_source; 
  assign auto_in_2_b_bits_address = auto_out_2_b_bits_address; 
  assign auto_in_2_b_bits_mask = auto_out_2_b_bits_mask; 
  assign auto_in_2_b_bits_corrupt = auto_out_2_b_bits_corrupt; 
  assign auto_in_2_c_ready = auto_out_2_c_ready; 
  assign auto_in_2_d_valid = auto_out_2_d_valid; 
  assign auto_in_2_d_bits_opcode = auto_out_2_d_bits_opcode; 
  assign auto_in_2_d_bits_param = auto_out_2_d_bits_param; 
  assign auto_in_2_d_bits_size = auto_out_2_d_bits_size; 
  assign auto_in_2_d_bits_source = auto_out_2_d_bits_source; 
  assign auto_in_2_d_bits_sink = auto_out_2_d_bits_sink; 
  assign auto_in_2_d_bits_denied = auto_out_2_d_bits_denied; 
  assign auto_in_2_d_bits_data = auto_out_2_d_bits_data; 
  assign auto_in_2_d_bits_corrupt = auto_out_2_d_bits_corrupt; 
  assign auto_in_2_e_ready = auto_out_2_e_ready; 
  assign auto_in_1_a_ready = auto_out_1_a_ready; 
  assign auto_in_1_b_valid = auto_out_1_b_valid; 
  assign auto_in_1_b_bits_opcode = auto_out_1_b_bits_opcode; 
  assign auto_in_1_b_bits_param = auto_out_1_b_bits_param; 
  assign auto_in_1_b_bits_size = auto_out_1_b_bits_size; 
  assign auto_in_1_b_bits_source = auto_out_1_b_bits_source; 
  assign auto_in_1_b_bits_address = auto_out_1_b_bits_address; 
  assign auto_in_1_b_bits_mask = auto_out_1_b_bits_mask; 
  assign auto_in_1_b_bits_corrupt = auto_out_1_b_bits_corrupt; 
  assign auto_in_1_c_ready = auto_out_1_c_ready; 
  assign auto_in_1_d_valid = auto_out_1_d_valid; 
  assign auto_in_1_d_bits_opcode = auto_out_1_d_bits_opcode; 
  assign auto_in_1_d_bits_param = auto_out_1_d_bits_param; 
  assign auto_in_1_d_bits_size = auto_out_1_d_bits_size; 
  assign auto_in_1_d_bits_source = auto_out_1_d_bits_source; 
  assign auto_in_1_d_bits_sink = auto_out_1_d_bits_sink; 
  assign auto_in_1_d_bits_denied = auto_out_1_d_bits_denied; 
  assign auto_in_1_d_bits_data = auto_out_1_d_bits_data; 
  assign auto_in_1_d_bits_corrupt = auto_out_1_d_bits_corrupt; 
  assign auto_in_1_e_ready = auto_out_1_e_ready; 
  assign auto_in_0_a_ready = auto_out_0_a_ready; 
  assign auto_in_0_b_valid = auto_out_0_b_valid; 
  assign auto_in_0_b_bits_opcode = auto_out_0_b_bits_opcode; 
  assign auto_in_0_b_bits_param = auto_out_0_b_bits_param; 
  assign auto_in_0_b_bits_size = auto_out_0_b_bits_size; 
  assign auto_in_0_b_bits_source = auto_out_0_b_bits_source; 
  assign auto_in_0_b_bits_address = auto_out_0_b_bits_address; 
  assign auto_in_0_b_bits_mask = auto_out_0_b_bits_mask; 
  assign auto_in_0_b_bits_corrupt = auto_out_0_b_bits_corrupt; 
  assign auto_in_0_c_ready = auto_out_0_c_ready; 
  assign auto_in_0_d_valid = auto_out_0_d_valid; 
  assign auto_in_0_d_bits_opcode = auto_out_0_d_bits_opcode; 
  assign auto_in_0_d_bits_param = auto_out_0_d_bits_param; 
  assign auto_in_0_d_bits_size = auto_out_0_d_bits_size; 
  assign auto_in_0_d_bits_source = auto_out_0_d_bits_source; 
  assign auto_in_0_d_bits_sink = auto_out_0_d_bits_sink; 
  assign auto_in_0_d_bits_denied = auto_out_0_d_bits_denied; 
  assign auto_in_0_d_bits_data = auto_out_0_d_bits_data; 
  assign auto_in_0_d_bits_corrupt = auto_out_0_d_bits_corrupt; 
  assign auto_in_0_e_ready = auto_out_0_e_ready; 
  assign auto_out_3_a_valid = auto_in_3_a_valid; 
  assign auto_out_3_a_bits_opcode = auto_in_3_a_bits_opcode; 
  assign auto_out_3_a_bits_param = auto_in_3_a_bits_param; 
  assign auto_out_3_a_bits_size = auto_in_3_a_bits_size; 
  assign auto_out_3_a_bits_source = auto_in_3_a_bits_source; 
  assign auto_out_3_a_bits_address = auto_in_3_a_bits_address; 
  assign auto_out_3_a_bits_mask = auto_in_3_a_bits_mask; 
  assign auto_out_3_a_bits_data = auto_in_3_a_bits_data; 
  assign auto_out_3_a_bits_corrupt = auto_in_3_a_bits_corrupt; 
  assign auto_out_3_b_ready = auto_in_3_b_ready; 
  assign auto_out_3_c_valid = auto_in_3_c_valid; 
  assign auto_out_3_c_bits_opcode = auto_in_3_c_bits_opcode; 
  assign auto_out_3_c_bits_param = auto_in_3_c_bits_param; 
  assign auto_out_3_c_bits_size = auto_in_3_c_bits_size; 
  assign auto_out_3_c_bits_source = auto_in_3_c_bits_source; 
  assign auto_out_3_c_bits_address = auto_in_3_c_bits_address; 
  assign auto_out_3_c_bits_data = auto_in_3_c_bits_data; 
  assign auto_out_3_c_bits_corrupt = auto_in_3_c_bits_corrupt; 
  assign auto_out_3_d_ready = auto_in_3_d_ready; 
  assign auto_out_3_e_valid = auto_in_3_e_valid; 
  assign auto_out_3_e_bits_sink = auto_in_3_e_bits_sink; 
  assign auto_out_2_a_valid = auto_in_2_a_valid; 
  assign auto_out_2_a_bits_opcode = auto_in_2_a_bits_opcode; 
  assign auto_out_2_a_bits_param = auto_in_2_a_bits_param; 
  assign auto_out_2_a_bits_size = auto_in_2_a_bits_size; 
  assign auto_out_2_a_bits_source = auto_in_2_a_bits_source; 
  assign auto_out_2_a_bits_address = auto_in_2_a_bits_address; 
  assign auto_out_2_a_bits_mask = auto_in_2_a_bits_mask; 
  assign auto_out_2_a_bits_data = auto_in_2_a_bits_data; 
  assign auto_out_2_a_bits_corrupt = auto_in_2_a_bits_corrupt; 
  assign auto_out_2_b_ready = auto_in_2_b_ready; 
  assign auto_out_2_c_valid = auto_in_2_c_valid; 
  assign auto_out_2_c_bits_opcode = auto_in_2_c_bits_opcode; 
  assign auto_out_2_c_bits_param = auto_in_2_c_bits_param; 
  assign auto_out_2_c_bits_size = auto_in_2_c_bits_size; 
  assign auto_out_2_c_bits_source = auto_in_2_c_bits_source; 
  assign auto_out_2_c_bits_address = auto_in_2_c_bits_address; 
  assign auto_out_2_c_bits_data = auto_in_2_c_bits_data; 
  assign auto_out_2_c_bits_corrupt = auto_in_2_c_bits_corrupt; 
  assign auto_out_2_d_ready = auto_in_2_d_ready; 
  assign auto_out_2_e_valid = auto_in_2_e_valid; 
  assign auto_out_2_e_bits_sink = auto_in_2_e_bits_sink; 
  assign auto_out_1_a_valid = auto_in_1_a_valid; 
  assign auto_out_1_a_bits_opcode = auto_in_1_a_bits_opcode; 
  assign auto_out_1_a_bits_param = auto_in_1_a_bits_param; 
  assign auto_out_1_a_bits_size = auto_in_1_a_bits_size; 
  assign auto_out_1_a_bits_source = auto_in_1_a_bits_source; 
  assign auto_out_1_a_bits_address = auto_in_1_a_bits_address; 
  assign auto_out_1_a_bits_mask = auto_in_1_a_bits_mask; 
  assign auto_out_1_a_bits_data = auto_in_1_a_bits_data; 
  assign auto_out_1_a_bits_corrupt = auto_in_1_a_bits_corrupt; 
  assign auto_out_1_b_ready = auto_in_1_b_ready; 
  assign auto_out_1_c_valid = auto_in_1_c_valid; 
  assign auto_out_1_c_bits_opcode = auto_in_1_c_bits_opcode; 
  assign auto_out_1_c_bits_param = auto_in_1_c_bits_param; 
  assign auto_out_1_c_bits_size = auto_in_1_c_bits_size; 
  assign auto_out_1_c_bits_source = auto_in_1_c_bits_source; 
  assign auto_out_1_c_bits_address = auto_in_1_c_bits_address; 
  assign auto_out_1_c_bits_data = auto_in_1_c_bits_data; 
  assign auto_out_1_c_bits_corrupt = auto_in_1_c_bits_corrupt; 
  assign auto_out_1_d_ready = auto_in_1_d_ready; 
  assign auto_out_1_e_valid = auto_in_1_e_valid; 
  assign auto_out_1_e_bits_sink = auto_in_1_e_bits_sink; 
  assign auto_out_0_a_valid = auto_in_0_a_valid; 
  assign auto_out_0_a_bits_opcode = auto_in_0_a_bits_opcode; 
  assign auto_out_0_a_bits_param = auto_in_0_a_bits_param; 
  assign auto_out_0_a_bits_size = auto_in_0_a_bits_size; 
  assign auto_out_0_a_bits_source = auto_in_0_a_bits_source; 
  assign auto_out_0_a_bits_address = auto_in_0_a_bits_address; 
  assign auto_out_0_a_bits_mask = auto_in_0_a_bits_mask; 
  assign auto_out_0_a_bits_data = auto_in_0_a_bits_data; 
  assign auto_out_0_a_bits_corrupt = auto_in_0_a_bits_corrupt; 
  assign auto_out_0_b_ready = auto_in_0_b_ready; 
  assign auto_out_0_c_valid = auto_in_0_c_valid; 
  assign auto_out_0_c_bits_opcode = auto_in_0_c_bits_opcode; 
  assign auto_out_0_c_bits_param = auto_in_0_c_bits_param; 
  assign auto_out_0_c_bits_size = auto_in_0_c_bits_size; 
  assign auto_out_0_c_bits_source = auto_in_0_c_bits_source; 
  assign auto_out_0_c_bits_address = auto_in_0_c_bits_address; 
  assign auto_out_0_c_bits_data = auto_in_0_c_bits_data; 
  assign auto_out_0_c_bits_corrupt = auto_in_0_c_bits_corrupt; 
  assign auto_out_0_d_ready = auto_in_0_d_ready; 
  assign auto_out_0_e_valid = auto_in_0_e_valid; 
  assign auto_out_0_e_bits_sink = auto_in_0_e_bits_sink; 
  assign TLMonitor_clock = clock; 
  assign TLMonitor_reset = reset; 
  assign TLMonitor_io_in_a_ready = auto_out_0_a_ready; 
  assign TLMonitor_io_in_a_valid = auto_in_0_a_valid; 
  assign TLMonitor_io_in_a_bits_opcode = auto_in_0_a_bits_opcode; 
  assign TLMonitor_io_in_a_bits_param = auto_in_0_a_bits_param; 
  assign TLMonitor_io_in_a_bits_size = auto_in_0_a_bits_size; 
  assign TLMonitor_io_in_a_bits_source = auto_in_0_a_bits_source; 
  assign TLMonitor_io_in_a_bits_address = auto_in_0_a_bits_address; 
  assign TLMonitor_io_in_a_bits_mask = auto_in_0_a_bits_mask; 
  assign TLMonitor_io_in_a_bits_corrupt = auto_in_0_a_bits_corrupt; 
  assign TLMonitor_io_in_b_ready = auto_in_0_b_ready; 
  assign TLMonitor_io_in_b_valid = auto_out_0_b_valid; 
  assign TLMonitor_io_in_b_bits_opcode = auto_out_0_b_bits_opcode; 
  assign TLMonitor_io_in_b_bits_param = auto_out_0_b_bits_param; 
  assign TLMonitor_io_in_b_bits_size = auto_out_0_b_bits_size; 
  assign TLMonitor_io_in_b_bits_source = auto_out_0_b_bits_source; 
  assign TLMonitor_io_in_b_bits_address = auto_out_0_b_bits_address; 
  assign TLMonitor_io_in_b_bits_mask = auto_out_0_b_bits_mask; 
  assign TLMonitor_io_in_b_bits_corrupt = auto_out_0_b_bits_corrupt; 
  assign TLMonitor_io_in_c_ready = auto_out_0_c_ready; 
  assign TLMonitor_io_in_c_valid = auto_in_0_c_valid; 
  assign TLMonitor_io_in_c_bits_opcode = auto_in_0_c_bits_opcode; 
  assign TLMonitor_io_in_c_bits_param = auto_in_0_c_bits_param; 
  assign TLMonitor_io_in_c_bits_size = auto_in_0_c_bits_size; 
  assign TLMonitor_io_in_c_bits_source = auto_in_0_c_bits_source; 
  assign TLMonitor_io_in_c_bits_address = auto_in_0_c_bits_address; 
  assign TLMonitor_io_in_c_bits_corrupt = auto_in_0_c_bits_corrupt; 
  assign TLMonitor_io_in_d_ready = auto_in_0_d_ready; 
  assign TLMonitor_io_in_d_valid = auto_out_0_d_valid; 
  assign TLMonitor_io_in_d_bits_opcode = auto_out_0_d_bits_opcode; 
  assign TLMonitor_io_in_d_bits_param = auto_out_0_d_bits_param; 
  assign TLMonitor_io_in_d_bits_size = auto_out_0_d_bits_size; 
  assign TLMonitor_io_in_d_bits_source = auto_out_0_d_bits_source; 
  assign TLMonitor_io_in_d_bits_sink = auto_out_0_d_bits_sink; 
  assign TLMonitor_io_in_d_bits_denied = auto_out_0_d_bits_denied; 
  assign TLMonitor_io_in_d_bits_corrupt = auto_out_0_d_bits_corrupt; 
  assign TLMonitor_io_in_e_ready = auto_out_0_e_ready; 
  assign TLMonitor_io_in_e_valid = auto_in_0_e_valid; 
  assign TLMonitor_io_in_e_bits_sink = auto_in_0_e_bits_sink; 
  assign TLMonitor_1_clock = clock; 
  assign TLMonitor_1_reset = reset; 
  assign TLMonitor_1_io_in_a_ready = auto_out_1_a_ready; 
  assign TLMonitor_1_io_in_a_valid = auto_in_1_a_valid; 
  assign TLMonitor_1_io_in_a_bits_opcode = auto_in_1_a_bits_opcode; 
  assign TLMonitor_1_io_in_a_bits_param = auto_in_1_a_bits_param; 
  assign TLMonitor_1_io_in_a_bits_size = auto_in_1_a_bits_size; 
  assign TLMonitor_1_io_in_a_bits_source = auto_in_1_a_bits_source; 
  assign TLMonitor_1_io_in_a_bits_address = auto_in_1_a_bits_address; 
  assign TLMonitor_1_io_in_a_bits_mask = auto_in_1_a_bits_mask; 
  assign TLMonitor_1_io_in_a_bits_corrupt = auto_in_1_a_bits_corrupt; 
  assign TLMonitor_1_io_in_b_ready = auto_in_1_b_ready; 
  assign TLMonitor_1_io_in_b_valid = auto_out_1_b_valid; 
  assign TLMonitor_1_io_in_b_bits_opcode = auto_out_1_b_bits_opcode; 
  assign TLMonitor_1_io_in_b_bits_param = auto_out_1_b_bits_param; 
  assign TLMonitor_1_io_in_b_bits_size = auto_out_1_b_bits_size; 
  assign TLMonitor_1_io_in_b_bits_source = auto_out_1_b_bits_source; 
  assign TLMonitor_1_io_in_b_bits_address = auto_out_1_b_bits_address; 
  assign TLMonitor_1_io_in_b_bits_mask = auto_out_1_b_bits_mask; 
  assign TLMonitor_1_io_in_b_bits_corrupt = auto_out_1_b_bits_corrupt; 
  assign TLMonitor_1_io_in_c_ready = auto_out_1_c_ready; 
  assign TLMonitor_1_io_in_c_valid = auto_in_1_c_valid; 
  assign TLMonitor_1_io_in_c_bits_opcode = auto_in_1_c_bits_opcode; 
  assign TLMonitor_1_io_in_c_bits_param = auto_in_1_c_bits_param; 
  assign TLMonitor_1_io_in_c_bits_size = auto_in_1_c_bits_size; 
  assign TLMonitor_1_io_in_c_bits_source = auto_in_1_c_bits_source; 
  assign TLMonitor_1_io_in_c_bits_address = auto_in_1_c_bits_address; 
  assign TLMonitor_1_io_in_c_bits_corrupt = auto_in_1_c_bits_corrupt; 
  assign TLMonitor_1_io_in_d_ready = auto_in_1_d_ready; 
  assign TLMonitor_1_io_in_d_valid = auto_out_1_d_valid; 
  assign TLMonitor_1_io_in_d_bits_opcode = auto_out_1_d_bits_opcode; 
  assign TLMonitor_1_io_in_d_bits_param = auto_out_1_d_bits_param; 
  assign TLMonitor_1_io_in_d_bits_size = auto_out_1_d_bits_size; 
  assign TLMonitor_1_io_in_d_bits_source = auto_out_1_d_bits_source; 
  assign TLMonitor_1_io_in_d_bits_sink = auto_out_1_d_bits_sink; 
  assign TLMonitor_1_io_in_d_bits_denied = auto_out_1_d_bits_denied; 
  assign TLMonitor_1_io_in_d_bits_corrupt = auto_out_1_d_bits_corrupt; 
  assign TLMonitor_1_io_in_e_ready = auto_out_1_e_ready; 
  assign TLMonitor_1_io_in_e_valid = auto_in_1_e_valid; 
  assign TLMonitor_1_io_in_e_bits_sink = auto_in_1_e_bits_sink; 
  assign TLMonitor_2_clock = clock; 
  assign TLMonitor_2_reset = reset; 
  assign TLMonitor_2_io_in_a_ready = auto_out_2_a_ready; 
  assign TLMonitor_2_io_in_a_valid = auto_in_2_a_valid; 
  assign TLMonitor_2_io_in_a_bits_opcode = auto_in_2_a_bits_opcode; 
  assign TLMonitor_2_io_in_a_bits_param = auto_in_2_a_bits_param; 
  assign TLMonitor_2_io_in_a_bits_size = auto_in_2_a_bits_size; 
  assign TLMonitor_2_io_in_a_bits_source = auto_in_2_a_bits_source; 
  assign TLMonitor_2_io_in_a_bits_address = auto_in_2_a_bits_address; 
  assign TLMonitor_2_io_in_a_bits_mask = auto_in_2_a_bits_mask; 
  assign TLMonitor_2_io_in_a_bits_corrupt = auto_in_2_a_bits_corrupt; 
  assign TLMonitor_2_io_in_b_ready = auto_in_2_b_ready; 
  assign TLMonitor_2_io_in_b_valid = auto_out_2_b_valid; 
  assign TLMonitor_2_io_in_b_bits_opcode = auto_out_2_b_bits_opcode; 
  assign TLMonitor_2_io_in_b_bits_param = auto_out_2_b_bits_param; 
  assign TLMonitor_2_io_in_b_bits_size = auto_out_2_b_bits_size; 
  assign TLMonitor_2_io_in_b_bits_source = auto_out_2_b_bits_source; 
  assign TLMonitor_2_io_in_b_bits_address = auto_out_2_b_bits_address; 
  assign TLMonitor_2_io_in_b_bits_mask = auto_out_2_b_bits_mask; 
  assign TLMonitor_2_io_in_b_bits_corrupt = auto_out_2_b_bits_corrupt; 
  assign TLMonitor_2_io_in_c_ready = auto_out_2_c_ready; 
  assign TLMonitor_2_io_in_c_valid = auto_in_2_c_valid; 
  assign TLMonitor_2_io_in_c_bits_opcode = auto_in_2_c_bits_opcode; 
  assign TLMonitor_2_io_in_c_bits_param = auto_in_2_c_bits_param; 
  assign TLMonitor_2_io_in_c_bits_size = auto_in_2_c_bits_size; 
  assign TLMonitor_2_io_in_c_bits_source = auto_in_2_c_bits_source; 
  assign TLMonitor_2_io_in_c_bits_address = auto_in_2_c_bits_address; 
  assign TLMonitor_2_io_in_c_bits_corrupt = auto_in_2_c_bits_corrupt; 
  assign TLMonitor_2_io_in_d_ready = auto_in_2_d_ready; 
  assign TLMonitor_2_io_in_d_valid = auto_out_2_d_valid; 
  assign TLMonitor_2_io_in_d_bits_opcode = auto_out_2_d_bits_opcode; 
  assign TLMonitor_2_io_in_d_bits_param = auto_out_2_d_bits_param; 
  assign TLMonitor_2_io_in_d_bits_size = auto_out_2_d_bits_size; 
  assign TLMonitor_2_io_in_d_bits_source = auto_out_2_d_bits_source; 
  assign TLMonitor_2_io_in_d_bits_sink = auto_out_2_d_bits_sink; 
  assign TLMonitor_2_io_in_d_bits_denied = auto_out_2_d_bits_denied; 
  assign TLMonitor_2_io_in_d_bits_corrupt = auto_out_2_d_bits_corrupt; 
  assign TLMonitor_2_io_in_e_ready = auto_out_2_e_ready; 
  assign TLMonitor_2_io_in_e_valid = auto_in_2_e_valid; 
  assign TLMonitor_2_io_in_e_bits_sink = auto_in_2_e_bits_sink; 
  assign TLMonitor_3_clock = clock; 
  assign TLMonitor_3_reset = reset; 
  assign TLMonitor_3_io_in_a_ready = auto_out_3_a_ready; 
  assign TLMonitor_3_io_in_a_valid = auto_in_3_a_valid; 
  assign TLMonitor_3_io_in_a_bits_opcode = auto_in_3_a_bits_opcode; 
  assign TLMonitor_3_io_in_a_bits_param = auto_in_3_a_bits_param; 
  assign TLMonitor_3_io_in_a_bits_size = auto_in_3_a_bits_size; 
  assign TLMonitor_3_io_in_a_bits_source = auto_in_3_a_bits_source; 
  assign TLMonitor_3_io_in_a_bits_address = auto_in_3_a_bits_address; 
  assign TLMonitor_3_io_in_a_bits_mask = auto_in_3_a_bits_mask; 
  assign TLMonitor_3_io_in_a_bits_corrupt = auto_in_3_a_bits_corrupt; 
  assign TLMonitor_3_io_in_b_ready = auto_in_3_b_ready; 
  assign TLMonitor_3_io_in_b_valid = auto_out_3_b_valid; 
  assign TLMonitor_3_io_in_b_bits_opcode = auto_out_3_b_bits_opcode; 
  assign TLMonitor_3_io_in_b_bits_param = auto_out_3_b_bits_param; 
  assign TLMonitor_3_io_in_b_bits_size = auto_out_3_b_bits_size; 
  assign TLMonitor_3_io_in_b_bits_source = auto_out_3_b_bits_source; 
  assign TLMonitor_3_io_in_b_bits_address = auto_out_3_b_bits_address; 
  assign TLMonitor_3_io_in_b_bits_mask = auto_out_3_b_bits_mask; 
  assign TLMonitor_3_io_in_b_bits_corrupt = auto_out_3_b_bits_corrupt; 
  assign TLMonitor_3_io_in_c_ready = auto_out_3_c_ready; 
  assign TLMonitor_3_io_in_c_valid = auto_in_3_c_valid; 
  assign TLMonitor_3_io_in_c_bits_opcode = auto_in_3_c_bits_opcode; 
  assign TLMonitor_3_io_in_c_bits_param = auto_in_3_c_bits_param; 
  assign TLMonitor_3_io_in_c_bits_size = auto_in_3_c_bits_size; 
  assign TLMonitor_3_io_in_c_bits_source = auto_in_3_c_bits_source; 
  assign TLMonitor_3_io_in_c_bits_address = auto_in_3_c_bits_address; 
  assign TLMonitor_3_io_in_c_bits_corrupt = auto_in_3_c_bits_corrupt; 
  assign TLMonitor_3_io_in_d_ready = auto_in_3_d_ready; 
  assign TLMonitor_3_io_in_d_valid = auto_out_3_d_valid; 
  assign TLMonitor_3_io_in_d_bits_opcode = auto_out_3_d_bits_opcode; 
  assign TLMonitor_3_io_in_d_bits_param = auto_out_3_d_bits_param; 
  assign TLMonitor_3_io_in_d_bits_size = auto_out_3_d_bits_size; 
  assign TLMonitor_3_io_in_d_bits_source = auto_out_3_d_bits_source; 
  assign TLMonitor_3_io_in_d_bits_sink = auto_out_3_d_bits_sink; 
  assign TLMonitor_3_io_in_d_bits_denied = auto_out_3_d_bits_denied; 
  assign TLMonitor_3_io_in_d_bits_corrupt = auto_out_3_d_bits_corrupt; 
  assign TLMonitor_3_io_in_e_ready = auto_out_3_e_ready; 
  assign TLMonitor_3_io_in_e_valid = auto_in_3_e_valid; 
  assign TLMonitor_3_io_in_e_bits_sink = auto_in_3_e_bits_sink; 
endmodule
