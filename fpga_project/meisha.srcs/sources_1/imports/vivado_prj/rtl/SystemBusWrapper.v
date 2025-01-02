module SystemBusWrapper( 
  input         clock, 
  input         reset,   
  input         tile_clock, 
  input         tile_reset, 
  input         tile_1_clock, 
  input         tile_1_reset,
  input         tile_2_clock, 
  input         tile_2_reset,
  input         tile_3_clock, 
  input         tile_3_reset, 
  input         auto_coupler_to_slave_named_pcie_0_widget_out_1_a_ready, 
  output        auto_coupler_to_slave_named_pcie_0_widget_out_1_a_valid, 
  output [2:0]  auto_coupler_to_slave_named_pcie_0_widget_out_1_a_bits_opcode, 
  output [2:0]  auto_coupler_to_slave_named_pcie_0_widget_out_1_a_bits_param, 
  output [2:0]  auto_coupler_to_slave_named_pcie_0_widget_out_1_a_bits_size, 
  output [4:0]  auto_coupler_to_slave_named_pcie_0_widget_out_1_a_bits_source, 
  output [37:0] auto_coupler_to_slave_named_pcie_0_widget_out_1_a_bits_address, 
  output [3:0]  auto_coupler_to_slave_named_pcie_0_widget_out_1_a_bits_mask, 
  output [31:0] auto_coupler_to_slave_named_pcie_0_widget_out_1_a_bits_data, 
  output        auto_coupler_to_slave_named_pcie_0_widget_out_1_a_bits_corrupt, 
  output        auto_coupler_to_slave_named_pcie_0_widget_out_1_d_ready, 
  input         auto_coupler_to_slave_named_pcie_0_widget_out_1_d_valid, 
  input  [2:0]  auto_coupler_to_slave_named_pcie_0_widget_out_1_d_bits_opcode, 
  input  [1:0]  auto_coupler_to_slave_named_pcie_0_widget_out_1_d_bits_param, 
  input  [2:0]  auto_coupler_to_slave_named_pcie_0_widget_out_1_d_bits_size, 
  input  [4:0]  auto_coupler_to_slave_named_pcie_0_widget_out_1_d_bits_source, 
  input         auto_coupler_to_slave_named_pcie_0_widget_out_1_d_bits_sink, 
  input         auto_coupler_to_slave_named_pcie_0_widget_out_1_d_bits_denied, 
  input  [31:0] auto_coupler_to_slave_named_pcie_0_widget_out_1_d_bits_data, 
  input         auto_coupler_to_slave_named_pcie_0_widget_out_1_d_bits_corrupt, 
  input         auto_coupler_to_slave_named_pcie_0_widget_out_0_a_ready, 
  output        auto_coupler_to_slave_named_pcie_0_widget_out_0_a_valid, 
  output [2:0]  auto_coupler_to_slave_named_pcie_0_widget_out_0_a_bits_opcode, 
  output [2:0]  auto_coupler_to_slave_named_pcie_0_widget_out_0_a_bits_param, 
  output [2:0]  auto_coupler_to_slave_named_pcie_0_widget_out_0_a_bits_size, 
  output [4:0]  auto_coupler_to_slave_named_pcie_0_widget_out_0_a_bits_source, 
  output [30:0] auto_coupler_to_slave_named_pcie_0_widget_out_0_a_bits_address, 
  output [7:0]  auto_coupler_to_slave_named_pcie_0_widget_out_0_a_bits_mask, 
  output [63:0] auto_coupler_to_slave_named_pcie_0_widget_out_0_a_bits_data, 
  output        auto_coupler_to_slave_named_pcie_0_widget_out_0_a_bits_corrupt, 
  output        auto_coupler_to_slave_named_pcie_0_widget_out_0_d_ready, 
  input         auto_coupler_to_slave_named_pcie_0_widget_out_0_d_valid, 
  input  [2:0]  auto_coupler_to_slave_named_pcie_0_widget_out_0_d_bits_opcode, 
  input  [1:0]  auto_coupler_to_slave_named_pcie_0_widget_out_0_d_bits_param, 
  input  [2:0]  auto_coupler_to_slave_named_pcie_0_widget_out_0_d_bits_size, 
  input  [4:0]  auto_coupler_to_slave_named_pcie_0_widget_out_0_d_bits_source, 
  input         auto_coupler_to_slave_named_pcie_0_widget_out_0_d_bits_sink, 
  input         auto_coupler_to_slave_named_pcie_0_widget_out_0_d_bits_denied, 
  input  [63:0] auto_coupler_to_slave_named_pcie_0_widget_out_0_d_bits_data, 
  input         auto_coupler_to_slave_named_pcie_0_widget_out_0_d_bits_corrupt, 
  output        auto_coupler_from_master_named_pcie_0_fixer_in_a_ready, 
  input         auto_coupler_from_master_named_pcie_0_fixer_in_a_valid, 
  input  [2:0]  auto_coupler_from_master_named_pcie_0_fixer_in_a_bits_opcode, 
  input  [2:0]  auto_coupler_from_master_named_pcie_0_fixer_in_a_bits_param, 
  input  [2:0]  auto_coupler_from_master_named_pcie_0_fixer_in_a_bits_size, 
  input  [3:0]  auto_coupler_from_master_named_pcie_0_fixer_in_a_bits_source, 
  input  [37:0] auto_coupler_from_master_named_pcie_0_fixer_in_a_bits_address, 
  input  [7:0]  auto_coupler_from_master_named_pcie_0_fixer_in_a_bits_mask, 
  input  [63:0] auto_coupler_from_master_named_pcie_0_fixer_in_a_bits_data, 
  input         auto_coupler_from_master_named_pcie_0_fixer_in_a_bits_corrupt, 
  input         auto_coupler_from_master_named_pcie_0_fixer_in_d_ready, 
  output        auto_coupler_from_master_named_pcie_0_fixer_in_d_valid, 
  output [2:0]  auto_coupler_from_master_named_pcie_0_fixer_in_d_bits_opcode, 
  output [1:0]  auto_coupler_from_master_named_pcie_0_fixer_in_d_bits_param, 
  output [2:0]  auto_coupler_from_master_named_pcie_0_fixer_in_d_bits_size, 
  output [3:0]  auto_coupler_from_master_named_pcie_0_fixer_in_d_bits_source, 
  output [2:0]  auto_coupler_from_master_named_pcie_0_fixer_in_d_bits_sink, 
  output        auto_coupler_from_master_named_pcie_0_fixer_in_d_bits_denied, 
  output [63:0] auto_coupler_from_master_named_pcie_0_fixer_in_d_bits_data, 
  output        auto_coupler_from_master_named_pcie_0_fixer_in_d_bits_corrupt, 
  output        auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_ready, 
  input         auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_valid, 
  input  [2:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_bits_opcode, 
  input  [2:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_bits_param, 
  input  [2:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_bits_size, 
  input  [1:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_bits_source, 
  input  [37:0] auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_bits_address, 
  input  [7:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_bits_mask, 
  input  [63:0] auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_bits_data, 
  input         auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_bits_corrupt, 
  input         auto_coupler_from_tile_named_tile_tl_master_xing_in_3_b_ready, 
  output        auto_coupler_from_tile_named_tile_tl_master_xing_in_3_b_valid, 
  output [2:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_3_b_bits_opcode, 
  output [1:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_3_b_bits_param, 
  output [2:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_3_b_bits_size, 
  output [1:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_3_b_bits_source, 
  output [37:0] auto_coupler_from_tile_named_tile_tl_master_xing_in_3_b_bits_address, 
  output [7:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_3_b_bits_mask, 
  output        auto_coupler_from_tile_named_tile_tl_master_xing_in_3_b_bits_corrupt, 
  output        auto_coupler_from_tile_named_tile_tl_master_xing_in_3_c_ready, 
  input         auto_coupler_from_tile_named_tile_tl_master_xing_in_3_c_valid, 
  input  [2:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_3_c_bits_opcode, 
  input  [2:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_3_c_bits_param, 
  input  [2:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_3_c_bits_size, 
  input  [1:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_3_c_bits_source, 
  input  [37:0] auto_coupler_from_tile_named_tile_tl_master_xing_in_3_c_bits_address, 
  input  [63:0] auto_coupler_from_tile_named_tile_tl_master_xing_in_3_c_bits_data, 
  input         auto_coupler_from_tile_named_tile_tl_master_xing_in_3_c_bits_corrupt, 
  input         auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_ready, 
  output        auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_valid, 
  output [2:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_bits_opcode, 
  output [1:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_bits_param, 
  output [2:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_bits_size, 
  output [1:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_bits_source, 
  output [2:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_bits_sink, 
  output        auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_bits_denied, 
  output [63:0] auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_bits_data, 
  output        auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_bits_corrupt, 
  output        auto_coupler_from_tile_named_tile_tl_master_xing_in_3_e_ready, 
  input         auto_coupler_from_tile_named_tile_tl_master_xing_in_3_e_valid, 
  input  [2:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_3_e_bits_sink, 
  output        auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_ready, 
  input         auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_valid, 
  input  [2:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_bits_opcode, 
  input  [2:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_bits_param, 
  input  [2:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_bits_size, 
  input  [1:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_bits_source, 
  input  [37:0] auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_bits_address, 
  input  [7:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_bits_mask, 
  input  [63:0] auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_bits_data, 
  input         auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_bits_corrupt, 
  input         auto_coupler_from_tile_named_tile_tl_master_xing_in_2_b_ready, 
  output        auto_coupler_from_tile_named_tile_tl_master_xing_in_2_b_valid, 
  output [2:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_2_b_bits_opcode, 
  output [1:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_2_b_bits_param, 
  output [2:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_2_b_bits_size, 
  output [1:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_2_b_bits_source, 
  output [37:0] auto_coupler_from_tile_named_tile_tl_master_xing_in_2_b_bits_address, 
  output [7:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_2_b_bits_mask, 
  output        auto_coupler_from_tile_named_tile_tl_master_xing_in_2_b_bits_corrupt, 
  output        auto_coupler_from_tile_named_tile_tl_master_xing_in_2_c_ready, 
  input         auto_coupler_from_tile_named_tile_tl_master_xing_in_2_c_valid, 
  input  [2:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_2_c_bits_opcode, 
  input  [2:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_2_c_bits_param, 
  input  [2:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_2_c_bits_size, 
  input  [1:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_2_c_bits_source, 
  input  [37:0] auto_coupler_from_tile_named_tile_tl_master_xing_in_2_c_bits_address, 
  input  [63:0] auto_coupler_from_tile_named_tile_tl_master_xing_in_2_c_bits_data, 
  input         auto_coupler_from_tile_named_tile_tl_master_xing_in_2_c_bits_corrupt, 
  input         auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_ready, 
  output        auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_valid, 
  output [2:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_bits_opcode, 
  output [1:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_bits_param, 
  output [2:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_bits_size, 
  output [1:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_bits_source, 
  output [2:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_bits_sink, 
  output        auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_bits_denied, 
  output [63:0] auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_bits_data, 
  output        auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_bits_corrupt, 
  output        auto_coupler_from_tile_named_tile_tl_master_xing_in_2_e_ready, 
  input         auto_coupler_from_tile_named_tile_tl_master_xing_in_2_e_valid, 
  input  [2:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_2_e_bits_sink, 
  output        auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_ready, 
  input         auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_valid, 
  input  [2:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_bits_opcode, 
  input  [2:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_bits_param, 
  input  [2:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_bits_size, 
  input  [1:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_bits_source, 
  input  [37:0] auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_bits_address, 
  input  [7:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_bits_mask, 
  input  [63:0] auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_bits_data, 
  input         auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_bits_corrupt, 
  input         auto_coupler_from_tile_named_tile_tl_master_xing_in_1_b_ready, 
  output        auto_coupler_from_tile_named_tile_tl_master_xing_in_1_b_valid, 
  output [2:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_1_b_bits_opcode, 
  output [1:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_1_b_bits_param, 
  output [2:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_1_b_bits_size, 
  output [1:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_1_b_bits_source, 
  output [37:0] auto_coupler_from_tile_named_tile_tl_master_xing_in_1_b_bits_address, 
  output [7:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_1_b_bits_mask, 
  output        auto_coupler_from_tile_named_tile_tl_master_xing_in_1_b_bits_corrupt, 
  output        auto_coupler_from_tile_named_tile_tl_master_xing_in_1_c_ready, 
  input         auto_coupler_from_tile_named_tile_tl_master_xing_in_1_c_valid, 
  input  [2:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_1_c_bits_opcode, 
  input  [2:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_1_c_bits_param, 
  input  [2:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_1_c_bits_size, 
  input  [1:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_1_c_bits_source, 
  input  [37:0] auto_coupler_from_tile_named_tile_tl_master_xing_in_1_c_bits_address, 
  input  [63:0] auto_coupler_from_tile_named_tile_tl_master_xing_in_1_c_bits_data, 
  input         auto_coupler_from_tile_named_tile_tl_master_xing_in_1_c_bits_corrupt, 
  input         auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_ready, 
  output        auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_valid, 
  output [2:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_bits_opcode, 
  output [1:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_bits_param, 
  output [2:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_bits_size, 
  output [1:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_bits_source, 
  output [2:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_bits_sink, 
  output        auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_bits_denied, 
  output [63:0] auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_bits_data, 
  output        auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_bits_corrupt, 
  output        auto_coupler_from_tile_named_tile_tl_master_xing_in_1_e_ready, 
  input         auto_coupler_from_tile_named_tile_tl_master_xing_in_1_e_valid, 
  input  [2:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_1_e_bits_sink, 
  output        auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_ready, 
  input         auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_valid, 
  input  [2:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_bits_opcode, 
  input  [2:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_bits_param, 
  input  [2:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_bits_size, 
  input  [1:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_bits_source, 
  input  [37:0] auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_bits_address, 
  input  [7:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_bits_mask, 
  input  [63:0] auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_bits_data, 
  input         auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_bits_corrupt, 
  input         auto_coupler_from_tile_named_tile_tl_master_xing_in_0_b_ready, 
  output        auto_coupler_from_tile_named_tile_tl_master_xing_in_0_b_valid, 
  output [2:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_0_b_bits_opcode, 
  output [1:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_0_b_bits_param, 
  output [2:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_0_b_bits_size, 
  output [1:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_0_b_bits_source, 
  output [37:0] auto_coupler_from_tile_named_tile_tl_master_xing_in_0_b_bits_address, 
  output [7:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_0_b_bits_mask, 
  output        auto_coupler_from_tile_named_tile_tl_master_xing_in_0_b_bits_corrupt, 
  output        auto_coupler_from_tile_named_tile_tl_master_xing_in_0_c_ready, 
  input         auto_coupler_from_tile_named_tile_tl_master_xing_in_0_c_valid, 
  input  [2:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_0_c_bits_opcode, 
  input  [2:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_0_c_bits_param, 
  input  [2:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_0_c_bits_size, 
  input  [1:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_0_c_bits_source, 
  input  [37:0] auto_coupler_from_tile_named_tile_tl_master_xing_in_0_c_bits_address, 
  input  [63:0] auto_coupler_from_tile_named_tile_tl_master_xing_in_0_c_bits_data, 
  input         auto_coupler_from_tile_named_tile_tl_master_xing_in_0_c_bits_corrupt, 
  input         auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_ready, 
  output        auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_valid, 
  output [2:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_bits_opcode, 
  output [1:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_bits_param, 
  output [2:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_bits_size, 
  output [1:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_bits_source, 
  output [2:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_bits_sink, 
  output        auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_bits_denied, 
  output [63:0] auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_bits_data, 
  output        auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_bits_corrupt, 
  output        auto_coupler_from_tile_named_tile_tl_master_xing_in_0_e_ready, 
  input         auto_coupler_from_tile_named_tile_tl_master_xing_in_0_e_valid, 
  input  [2:0]  auto_coupler_from_tile_named_tile_tl_master_xing_in_0_e_bits_sink, 
  input         auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_a_ready, 
  output        auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_a_valid, 
  output [2:0]  auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_opcode, 
  output [2:0]  auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_param, 
  output [1:0]  auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_size, 
  output [9:0]  auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_source, 
  output [16:0] auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_address, 
  output [3:0]  auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_mask, 
  output        auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_corrupt, 
  output        auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_d_ready, 
  input         auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_d_valid, 
  input  [1:0]  auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_d_bits_size, 
  input  [9:0]  auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_d_bits_source, 
  input  [31:0] auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_d_bits_data, 
  input         auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_ready, 
  output        auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_valid, 
  output [2:0]  auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_bits_opcode, 
  output [2:0]  auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_bits_param, 
  output [1:0]  auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_bits_size, 
  output [8:0]  auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_bits_source, 
  output [11:0] auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_bits_address, 
  output [7:0]  auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_bits_mask, 
  output [63:0] auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_bits_data, 
  output        auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_bits_corrupt, 
  output        auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_d_ready, 
  input         auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_d_valid, 
  input  [2:0]  auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_d_bits_opcode, 
  input  [1:0]  auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_d_bits_size, 
  input  [8:0]  auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_d_bits_source, 
  input  [63:0] auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_d_bits_data, 
  input         auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_ready, 
  output        auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_valid, 
  output [2:0]  auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_bits_opcode, 
  output [2:0]  auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_bits_param, 
  output [1:0]  auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_bits_size, 
  output [8:0]  auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_bits_source, 
  output [25:0] auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_bits_address, 
  output [7:0]  auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_bits_mask, 
  output [63:0] auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_bits_data, 
  output        auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_bits_corrupt, 
  output        auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_d_ready, 
  input         auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_d_valid, 
  input  [2:0]  auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_d_bits_opcode, 
  input  [1:0]  auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_d_bits_size, 
  input  [8:0]  auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_d_bits_source, 
  input  [63:0] auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_d_bits_data, 
  input         auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_ready, 
  output        auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_valid, 
  output [2:0]  auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_bits_opcode, 
  output [2:0]  auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_bits_param, 
  output [1:0]  auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_bits_size, 
  output [8:0]  auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_bits_source, 
  output [27:0] auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_bits_address, 
  output [7:0]  auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_bits_mask, 
  output [63:0] auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_bits_data, 
  output        auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_bits_corrupt, 
  output        auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_d_ready, 
  input         auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_d_valid, 
  input  [2:0]  auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_d_bits_opcode, 
  input  [1:0]  auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_d_bits_size, 
  input  [8:0]  auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_d_bits_source, 
  input  [63:0] auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_d_bits_data, 
  input         auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_ready, 
  output        auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_valid, 
  output [2:0]  auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_bits_opcode, 
  output [2:0]  auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_bits_param, 
  output [2:0]  auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_bits_size, 
  output [4:0]  auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_bits_source, 
  output [30:0] auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_bits_address, 
  output [7:0]  auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_bits_mask, 
  output [63:0] auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_bits_data, 
  output        auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_bits_corrupt, 
  output        auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_ready, 
  input         auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_valid, 
  input  [2:0]  auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_bits_opcode, 
  input  [1:0]  auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_bits_param, 
  input  [2:0]  auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_bits_size, 
  input  [4:0]  auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_bits_source, 
  input         auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_bits_sink, 
  input         auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_bits_denied, 
  input  [63:0] auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_bits_data, 
  input         auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_bits_corrupt, 
  input         auto_system_bus_xbar_out_a_ready, 
  output        auto_system_bus_xbar_out_a_valid, 
  output [2:0]  auto_system_bus_xbar_out_a_bits_opcode, 
  output [2:0]  auto_system_bus_xbar_out_a_bits_param, 
  output [2:0]  auto_system_bus_xbar_out_a_bits_size, 
  output [4:0]  auto_system_bus_xbar_out_a_bits_source, 
  output [31:0] auto_system_bus_xbar_out_a_bits_address, 
  output [7:0]  auto_system_bus_xbar_out_a_bits_mask, 
  output [63:0] auto_system_bus_xbar_out_a_bits_data, 
  output        auto_system_bus_xbar_out_a_bits_corrupt, 
  output        auto_system_bus_xbar_out_b_ready, 
  input         auto_system_bus_xbar_out_b_valid, 
  input  [1:0]  auto_system_bus_xbar_out_b_bits_param, 
  input  [4:0]  auto_system_bus_xbar_out_b_bits_source, 
  input  [31:0] auto_system_bus_xbar_out_b_bits_address, 
  input         auto_system_bus_xbar_out_c_ready, 
  output        auto_system_bus_xbar_out_c_valid, 
  output [2:0]  auto_system_bus_xbar_out_c_bits_opcode, 
  output [2:0]  auto_system_bus_xbar_out_c_bits_param, 
  output [2:0]  auto_system_bus_xbar_out_c_bits_size, 
  output [4:0]  auto_system_bus_xbar_out_c_bits_source, 
  output [31:0] auto_system_bus_xbar_out_c_bits_address, 
  output [63:0] auto_system_bus_xbar_out_c_bits_data, 
  output        auto_system_bus_xbar_out_c_bits_corrupt, 
  output        auto_system_bus_xbar_out_d_ready, 
  input         auto_system_bus_xbar_out_d_valid, 
  input  [2:0]  auto_system_bus_xbar_out_d_bits_opcode, 
  input  [1:0]  auto_system_bus_xbar_out_d_bits_param, 
  input  [2:0]  auto_system_bus_xbar_out_d_bits_size, 
  input  [4:0]  auto_system_bus_xbar_out_d_bits_source, 
  input  [1:0]  auto_system_bus_xbar_out_d_bits_sink, 
  input         auto_system_bus_xbar_out_d_bits_denied, 
  input  [63:0] auto_system_bus_xbar_out_d_bits_data, 
  input         auto_system_bus_xbar_out_d_bits_corrupt, 
  output        auto_system_bus_xbar_out_e_valid, 
  output [1:0]  auto_system_bus_xbar_out_e_bits_sink 
);
  wire  system_bus_xbar_clock; 
  wire  system_bus_xbar_reset; 
  wire  system_bus_xbar_auto_in_4_a_ready; 
  wire  system_bus_xbar_auto_in_4_a_valid; 
  wire [2:0] system_bus_xbar_auto_in_4_a_bits_opcode; 
  wire [2:0] system_bus_xbar_auto_in_4_a_bits_param; 
  wire [2:0] system_bus_xbar_auto_in_4_a_bits_size; 
  wire [3:0] system_bus_xbar_auto_in_4_a_bits_source; 
  wire [37:0] system_bus_xbar_auto_in_4_a_bits_address; 
  wire [7:0] system_bus_xbar_auto_in_4_a_bits_mask; 
  wire [63:0] system_bus_xbar_auto_in_4_a_bits_data; 
  wire  system_bus_xbar_auto_in_4_a_bits_corrupt; 
  wire  system_bus_xbar_auto_in_4_d_ready; 
  wire  system_bus_xbar_auto_in_4_d_valid; 
  wire [2:0] system_bus_xbar_auto_in_4_d_bits_opcode; 
  wire [1:0] system_bus_xbar_auto_in_4_d_bits_param; 
  wire [2:0] system_bus_xbar_auto_in_4_d_bits_size; 
  wire [3:0] system_bus_xbar_auto_in_4_d_bits_source; 
  wire [2:0] system_bus_xbar_auto_in_4_d_bits_sink; 
  wire  system_bus_xbar_auto_in_4_d_bits_denied; 
  wire [63:0] system_bus_xbar_auto_in_4_d_bits_data; 
  wire  system_bus_xbar_auto_in_4_d_bits_corrupt; 
  wire  system_bus_xbar_auto_in_3_a_ready; 
  wire  system_bus_xbar_auto_in_3_a_valid; 
  wire [2:0] system_bus_xbar_auto_in_3_a_bits_opcode; 
  wire [2:0] system_bus_xbar_auto_in_3_a_bits_param; 
  wire [2:0] system_bus_xbar_auto_in_3_a_bits_size; 
  wire [1:0] system_bus_xbar_auto_in_3_a_bits_source; 
  wire [37:0] system_bus_xbar_auto_in_3_a_bits_address; 
  wire [7:0] system_bus_xbar_auto_in_3_a_bits_mask; 
  wire [63:0] system_bus_xbar_auto_in_3_a_bits_data; 
  wire  system_bus_xbar_auto_in_3_a_bits_corrupt; 
  wire  system_bus_xbar_auto_in_3_b_ready; 
  wire  system_bus_xbar_auto_in_3_b_valid; 
  wire [2:0] system_bus_xbar_auto_in_3_b_bits_opcode; 
  wire [1:0] system_bus_xbar_auto_in_3_b_bits_param; 
  wire [2:0] system_bus_xbar_auto_in_3_b_bits_size; 
  wire [1:0] system_bus_xbar_auto_in_3_b_bits_source; 
  wire [37:0] system_bus_xbar_auto_in_3_b_bits_address; 
  wire [7:0] system_bus_xbar_auto_in_3_b_bits_mask; 
  wire  system_bus_xbar_auto_in_3_b_bits_corrupt; 
  wire  system_bus_xbar_auto_in_3_c_ready; 
  wire  system_bus_xbar_auto_in_3_c_valid; 
  wire [2:0] system_bus_xbar_auto_in_3_c_bits_opcode; 
  wire [2:0] system_bus_xbar_auto_in_3_c_bits_param; 
  wire [2:0] system_bus_xbar_auto_in_3_c_bits_size; 
  wire [1:0] system_bus_xbar_auto_in_3_c_bits_source; 
  wire [37:0] system_bus_xbar_auto_in_3_c_bits_address; 
  wire [63:0] system_bus_xbar_auto_in_3_c_bits_data; 
  wire  system_bus_xbar_auto_in_3_c_bits_corrupt; 
  wire  system_bus_xbar_auto_in_3_d_ready; 
  wire  system_bus_xbar_auto_in_3_d_valid; 
  wire [2:0] system_bus_xbar_auto_in_3_d_bits_opcode; 
  wire [1:0] system_bus_xbar_auto_in_3_d_bits_param; 
  wire [2:0] system_bus_xbar_auto_in_3_d_bits_size; 
  wire [1:0] system_bus_xbar_auto_in_3_d_bits_source; 
  wire [2:0] system_bus_xbar_auto_in_3_d_bits_sink; 
  wire  system_bus_xbar_auto_in_3_d_bits_denied; 
  wire [63:0] system_bus_xbar_auto_in_3_d_bits_data; 
  wire  system_bus_xbar_auto_in_3_d_bits_corrupt; 
  wire  system_bus_xbar_auto_in_3_e_ready; 
  wire  system_bus_xbar_auto_in_3_e_valid; 
  wire [2:0] system_bus_xbar_auto_in_3_e_bits_sink; 
  wire  system_bus_xbar_auto_in_2_a_ready; 
  wire  system_bus_xbar_auto_in_2_a_valid; 
  wire [2:0] system_bus_xbar_auto_in_2_a_bits_opcode; 
  wire [2:0] system_bus_xbar_auto_in_2_a_bits_param; 
  wire [2:0] system_bus_xbar_auto_in_2_a_bits_size; 
  wire [1:0] system_bus_xbar_auto_in_2_a_bits_source; 
  wire [37:0] system_bus_xbar_auto_in_2_a_bits_address; 
  wire [7:0] system_bus_xbar_auto_in_2_a_bits_mask; 
  wire [63:0] system_bus_xbar_auto_in_2_a_bits_data; 
  wire  system_bus_xbar_auto_in_2_a_bits_corrupt; 
  wire  system_bus_xbar_auto_in_2_b_ready; 
  wire  system_bus_xbar_auto_in_2_b_valid; 
  wire [2:0] system_bus_xbar_auto_in_2_b_bits_opcode; 
  wire [1:0] system_bus_xbar_auto_in_2_b_bits_param; 
  wire [2:0] system_bus_xbar_auto_in_2_b_bits_size; 
  wire [1:0] system_bus_xbar_auto_in_2_b_bits_source; 
  wire [37:0] system_bus_xbar_auto_in_2_b_bits_address; 
  wire [7:0] system_bus_xbar_auto_in_2_b_bits_mask; 
  wire  system_bus_xbar_auto_in_2_b_bits_corrupt; 
  wire  system_bus_xbar_auto_in_2_c_ready; 
  wire  system_bus_xbar_auto_in_2_c_valid; 
  wire [2:0] system_bus_xbar_auto_in_2_c_bits_opcode; 
  wire [2:0] system_bus_xbar_auto_in_2_c_bits_param; 
  wire [2:0] system_bus_xbar_auto_in_2_c_bits_size; 
  wire [1:0] system_bus_xbar_auto_in_2_c_bits_source; 
  wire [37:0] system_bus_xbar_auto_in_2_c_bits_address; 
  wire [63:0] system_bus_xbar_auto_in_2_c_bits_data; 
  wire  system_bus_xbar_auto_in_2_c_bits_corrupt; 
  wire  system_bus_xbar_auto_in_2_d_ready; 
  wire  system_bus_xbar_auto_in_2_d_valid; 
  wire [2:0] system_bus_xbar_auto_in_2_d_bits_opcode; 
  wire [1:0] system_bus_xbar_auto_in_2_d_bits_param; 
  wire [2:0] system_bus_xbar_auto_in_2_d_bits_size; 
  wire [1:0] system_bus_xbar_auto_in_2_d_bits_source; 
  wire [2:0] system_bus_xbar_auto_in_2_d_bits_sink; 
  wire  system_bus_xbar_auto_in_2_d_bits_denied; 
  wire [63:0] system_bus_xbar_auto_in_2_d_bits_data; 
  wire  system_bus_xbar_auto_in_2_d_bits_corrupt; 
  wire  system_bus_xbar_auto_in_2_e_ready; 
  wire  system_bus_xbar_auto_in_2_e_valid; 
  wire [2:0] system_bus_xbar_auto_in_2_e_bits_sink; 
  wire  system_bus_xbar_auto_in_1_a_ready; 
  wire  system_bus_xbar_auto_in_1_a_valid; 
  wire [2:0] system_bus_xbar_auto_in_1_a_bits_opcode; 
  wire [2:0] system_bus_xbar_auto_in_1_a_bits_param; 
  wire [2:0] system_bus_xbar_auto_in_1_a_bits_size; 
  wire [1:0] system_bus_xbar_auto_in_1_a_bits_source; 
  wire [37:0] system_bus_xbar_auto_in_1_a_bits_address; 
  wire [7:0] system_bus_xbar_auto_in_1_a_bits_mask; 
  wire [63:0] system_bus_xbar_auto_in_1_a_bits_data; 
  wire  system_bus_xbar_auto_in_1_a_bits_corrupt; 
  wire  system_bus_xbar_auto_in_1_b_ready; 
  wire  system_bus_xbar_auto_in_1_b_valid; 
  wire [2:0] system_bus_xbar_auto_in_1_b_bits_opcode; 
  wire [1:0] system_bus_xbar_auto_in_1_b_bits_param; 
  wire [2:0] system_bus_xbar_auto_in_1_b_bits_size; 
  wire [1:0] system_bus_xbar_auto_in_1_b_bits_source; 
  wire [37:0] system_bus_xbar_auto_in_1_b_bits_address; 
  wire [7:0] system_bus_xbar_auto_in_1_b_bits_mask; 
  wire  system_bus_xbar_auto_in_1_b_bits_corrupt; 
  wire  system_bus_xbar_auto_in_1_c_ready; 
  wire  system_bus_xbar_auto_in_1_c_valid; 
  wire [2:0] system_bus_xbar_auto_in_1_c_bits_opcode; 
  wire [2:0] system_bus_xbar_auto_in_1_c_bits_param; 
  wire [2:0] system_bus_xbar_auto_in_1_c_bits_size; 
  wire [1:0] system_bus_xbar_auto_in_1_c_bits_source; 
  wire [37:0] system_bus_xbar_auto_in_1_c_bits_address; 
  wire [63:0] system_bus_xbar_auto_in_1_c_bits_data; 
  wire  system_bus_xbar_auto_in_1_c_bits_corrupt; 
  wire  system_bus_xbar_auto_in_1_d_ready; 
  wire  system_bus_xbar_auto_in_1_d_valid; 
  wire [2:0] system_bus_xbar_auto_in_1_d_bits_opcode; 
  wire [1:0] system_bus_xbar_auto_in_1_d_bits_param; 
  wire [2:0] system_bus_xbar_auto_in_1_d_bits_size; 
  wire [1:0] system_bus_xbar_auto_in_1_d_bits_source; 
  wire [2:0] system_bus_xbar_auto_in_1_d_bits_sink; 
  wire  system_bus_xbar_auto_in_1_d_bits_denied; 
  wire [63:0] system_bus_xbar_auto_in_1_d_bits_data; 
  wire  system_bus_xbar_auto_in_1_d_bits_corrupt; 
  wire  system_bus_xbar_auto_in_1_e_ready; 
  wire  system_bus_xbar_auto_in_1_e_valid; 
  wire [2:0] system_bus_xbar_auto_in_1_e_bits_sink; 
  wire  system_bus_xbar_auto_in_0_a_ready; 
  wire  system_bus_xbar_auto_in_0_a_valid; 
  wire [2:0] system_bus_xbar_auto_in_0_a_bits_opcode; 
  wire [2:0] system_bus_xbar_auto_in_0_a_bits_param; 
  wire [2:0] system_bus_xbar_auto_in_0_a_bits_size; 
  wire [1:0] system_bus_xbar_auto_in_0_a_bits_source; 
  wire [37:0] system_bus_xbar_auto_in_0_a_bits_address; 
  wire [7:0] system_bus_xbar_auto_in_0_a_bits_mask; 
  wire [63:0] system_bus_xbar_auto_in_0_a_bits_data; 
  wire  system_bus_xbar_auto_in_0_a_bits_corrupt; 
  wire  system_bus_xbar_auto_in_0_b_ready; 
  wire  system_bus_xbar_auto_in_0_b_valid; 
  wire [2:0] system_bus_xbar_auto_in_0_b_bits_opcode; 
  wire [1:0] system_bus_xbar_auto_in_0_b_bits_param; 
  wire [2:0] system_bus_xbar_auto_in_0_b_bits_size; 
  wire [1:0] system_bus_xbar_auto_in_0_b_bits_source; 
  wire [37:0] system_bus_xbar_auto_in_0_b_bits_address; 
  wire [7:0] system_bus_xbar_auto_in_0_b_bits_mask; 
  wire  system_bus_xbar_auto_in_0_b_bits_corrupt; 
  wire  system_bus_xbar_auto_in_0_c_ready; 
  wire  system_bus_xbar_auto_in_0_c_valid; 
  wire [2:0] system_bus_xbar_auto_in_0_c_bits_opcode; 
  wire [2:0] system_bus_xbar_auto_in_0_c_bits_param; 
  wire [2:0] system_bus_xbar_auto_in_0_c_bits_size; 
  wire [1:0] system_bus_xbar_auto_in_0_c_bits_source; 
  wire [37:0] system_bus_xbar_auto_in_0_c_bits_address; 
  wire [63:0] system_bus_xbar_auto_in_0_c_bits_data; 
  wire  system_bus_xbar_auto_in_0_c_bits_corrupt; 
  wire  system_bus_xbar_auto_in_0_d_ready; 
  wire  system_bus_xbar_auto_in_0_d_valid; 
  wire [2:0] system_bus_xbar_auto_in_0_d_bits_opcode; 
  wire [1:0] system_bus_xbar_auto_in_0_d_bits_param; 
  wire [2:0] system_bus_xbar_auto_in_0_d_bits_size; 
  wire [1:0] system_bus_xbar_auto_in_0_d_bits_source; 
  wire [2:0] system_bus_xbar_auto_in_0_d_bits_sink; 
  wire  system_bus_xbar_auto_in_0_d_bits_denied; 
  wire [63:0] system_bus_xbar_auto_in_0_d_bits_data; 
  wire  system_bus_xbar_auto_in_0_d_bits_corrupt; 
  wire  system_bus_xbar_auto_in_0_e_ready; 
  wire  system_bus_xbar_auto_in_0_e_valid; 
  wire [2:0] system_bus_xbar_auto_in_0_e_bits_sink; 
  wire  system_bus_xbar_auto_out_4_a_ready; 
  wire  system_bus_xbar_auto_out_4_a_valid; 
  wire [2:0] system_bus_xbar_auto_out_4_a_bits_opcode; 
  wire [2:0] system_bus_xbar_auto_out_4_a_bits_param; 
  wire [2:0] system_bus_xbar_auto_out_4_a_bits_size; 
  wire [4:0] system_bus_xbar_auto_out_4_a_bits_source; 
  wire [37:0] system_bus_xbar_auto_out_4_a_bits_address; 
  wire [7:0] system_bus_xbar_auto_out_4_a_bits_mask; 
  wire [63:0] system_bus_xbar_auto_out_4_a_bits_data; 
  wire  system_bus_xbar_auto_out_4_a_bits_corrupt; 
  wire  system_bus_xbar_auto_out_4_d_ready; 
  wire  system_bus_xbar_auto_out_4_d_valid; 
  wire [2:0] system_bus_xbar_auto_out_4_d_bits_opcode; 
  wire [1:0] system_bus_xbar_auto_out_4_d_bits_param; 
  wire [2:0] system_bus_xbar_auto_out_4_d_bits_size; 
  wire [4:0] system_bus_xbar_auto_out_4_d_bits_source; 
  wire  system_bus_xbar_auto_out_4_d_bits_sink; 
  wire  system_bus_xbar_auto_out_4_d_bits_denied; 
  wire [63:0] system_bus_xbar_auto_out_4_d_bits_data; 
  wire  system_bus_xbar_auto_out_4_d_bits_corrupt; 
  wire  system_bus_xbar_auto_out_3_a_ready; 
  wire  system_bus_xbar_auto_out_3_a_valid; 
  wire [2:0] system_bus_xbar_auto_out_3_a_bits_opcode; 
  wire [2:0] system_bus_xbar_auto_out_3_a_bits_param; 
  wire [2:0] system_bus_xbar_auto_out_3_a_bits_size; 
  wire [4:0] system_bus_xbar_auto_out_3_a_bits_source; 
  wire [30:0] system_bus_xbar_auto_out_3_a_bits_address; 
  wire [7:0] system_bus_xbar_auto_out_3_a_bits_mask; 
  wire [63:0] system_bus_xbar_auto_out_3_a_bits_data; 
  wire  system_bus_xbar_auto_out_3_a_bits_corrupt; 
  wire  system_bus_xbar_auto_out_3_d_ready; 
  wire  system_bus_xbar_auto_out_3_d_valid; 
  wire [2:0] system_bus_xbar_auto_out_3_d_bits_opcode; 
  wire [1:0] system_bus_xbar_auto_out_3_d_bits_param; 
  wire [2:0] system_bus_xbar_auto_out_3_d_bits_size; 
  wire [4:0] system_bus_xbar_auto_out_3_d_bits_source; 
  wire  system_bus_xbar_auto_out_3_d_bits_sink; 
  wire  system_bus_xbar_auto_out_3_d_bits_denied; 
  wire [63:0] system_bus_xbar_auto_out_3_d_bits_data; 
  wire  system_bus_xbar_auto_out_3_d_bits_corrupt; 
  wire  system_bus_xbar_auto_out_2_a_ready; 
  wire  system_bus_xbar_auto_out_2_a_valid; 
  wire [2:0] system_bus_xbar_auto_out_2_a_bits_opcode; 
  wire [2:0] system_bus_xbar_auto_out_2_a_bits_param; 
  wire [2:0] system_bus_xbar_auto_out_2_a_bits_size; 
  wire [4:0] system_bus_xbar_auto_out_2_a_bits_source; 
  wire [31:0] system_bus_xbar_auto_out_2_a_bits_address; 
  wire [7:0] system_bus_xbar_auto_out_2_a_bits_mask; 
  wire [63:0] system_bus_xbar_auto_out_2_a_bits_data; 
  wire  system_bus_xbar_auto_out_2_a_bits_corrupt; 
  wire  system_bus_xbar_auto_out_2_b_ready; 
  wire  system_bus_xbar_auto_out_2_b_valid; 
  wire [1:0] system_bus_xbar_auto_out_2_b_bits_param; 
  wire [4:0] system_bus_xbar_auto_out_2_b_bits_source; 
  wire [31:0] system_bus_xbar_auto_out_2_b_bits_address; 
  wire  system_bus_xbar_auto_out_2_c_ready; 
  wire  system_bus_xbar_auto_out_2_c_valid; 
  wire [2:0] system_bus_xbar_auto_out_2_c_bits_opcode; 
  wire [2:0] system_bus_xbar_auto_out_2_c_bits_param; 
  wire [2:0] system_bus_xbar_auto_out_2_c_bits_size; 
  wire [4:0] system_bus_xbar_auto_out_2_c_bits_source; 
  wire [31:0] system_bus_xbar_auto_out_2_c_bits_address; 
  wire [63:0] system_bus_xbar_auto_out_2_c_bits_data; 
  wire  system_bus_xbar_auto_out_2_c_bits_corrupt; 
  wire  system_bus_xbar_auto_out_2_d_ready; 
  wire  system_bus_xbar_auto_out_2_d_valid; 
  wire [2:0] system_bus_xbar_auto_out_2_d_bits_opcode; 
  wire [1:0] system_bus_xbar_auto_out_2_d_bits_param; 
  wire [2:0] system_bus_xbar_auto_out_2_d_bits_size; 
  wire [4:0] system_bus_xbar_auto_out_2_d_bits_source; 
  wire [1:0] system_bus_xbar_auto_out_2_d_bits_sink; 
  wire  system_bus_xbar_auto_out_2_d_bits_denied; 
  wire [63:0] system_bus_xbar_auto_out_2_d_bits_data; 
  wire  system_bus_xbar_auto_out_2_d_bits_corrupt; 
  wire  system_bus_xbar_auto_out_2_e_valid; 
  wire [1:0] system_bus_xbar_auto_out_2_e_bits_sink; 
  wire  system_bus_xbar_auto_out_1_a_ready; 
  wire  system_bus_xbar_auto_out_1_a_valid; 
  wire [2:0] system_bus_xbar_auto_out_1_a_bits_opcode; 
  wire [2:0] system_bus_xbar_auto_out_1_a_bits_param; 
  wire [2:0] system_bus_xbar_auto_out_1_a_bits_size; 
  wire [4:0] system_bus_xbar_auto_out_1_a_bits_source; 
  wire [13:0] system_bus_xbar_auto_out_1_a_bits_address; 
  wire [7:0] system_bus_xbar_auto_out_1_a_bits_mask; 
  wire  system_bus_xbar_auto_out_1_a_bits_corrupt; 
  wire  system_bus_xbar_auto_out_1_b_ready; 
  wire  system_bus_xbar_auto_out_1_b_valid; 
  wire [2:0] system_bus_xbar_auto_out_1_b_bits_opcode; 
  wire [1:0] system_bus_xbar_auto_out_1_b_bits_param; 
  wire [2:0] system_bus_xbar_auto_out_1_b_bits_size; 
  wire [4:0] system_bus_xbar_auto_out_1_b_bits_source; 
  wire [13:0] system_bus_xbar_auto_out_1_b_bits_address; 
  wire [7:0] system_bus_xbar_auto_out_1_b_bits_mask; 
  wire [63:0] system_bus_xbar_auto_out_1_b_bits_data; 
  wire  system_bus_xbar_auto_out_1_b_bits_corrupt; 
  wire  system_bus_xbar_auto_out_1_c_ready; 
  wire  system_bus_xbar_auto_out_1_c_valid; 
  wire [2:0] system_bus_xbar_auto_out_1_c_bits_opcode; 
  wire [2:0] system_bus_xbar_auto_out_1_c_bits_param; 
  wire [2:0] system_bus_xbar_auto_out_1_c_bits_size; 
  wire [4:0] system_bus_xbar_auto_out_1_c_bits_source; 
  wire [13:0] system_bus_xbar_auto_out_1_c_bits_address; 
  wire  system_bus_xbar_auto_out_1_c_bits_corrupt; 
  wire  system_bus_xbar_auto_out_1_d_ready; 
  wire  system_bus_xbar_auto_out_1_d_valid; 
  wire [2:0] system_bus_xbar_auto_out_1_d_bits_opcode; 
  wire [1:0] system_bus_xbar_auto_out_1_d_bits_param; 
  wire [2:0] system_bus_xbar_auto_out_1_d_bits_size; 
  wire [4:0] system_bus_xbar_auto_out_1_d_bits_source; 
  wire  system_bus_xbar_auto_out_1_d_bits_sink; 
  wire  system_bus_xbar_auto_out_1_d_bits_denied; 
  wire [63:0] system_bus_xbar_auto_out_1_d_bits_data; 
  wire  system_bus_xbar_auto_out_1_d_bits_corrupt; 
  wire  system_bus_xbar_auto_out_1_e_ready; 
  wire  system_bus_xbar_auto_out_1_e_valid; 
  wire  system_bus_xbar_auto_out_0_a_ready; 
  wire  system_bus_xbar_auto_out_0_a_valid; 
  wire [2:0] system_bus_xbar_auto_out_0_a_bits_opcode; 
  wire [2:0] system_bus_xbar_auto_out_0_a_bits_param; 
  wire [2:0] system_bus_xbar_auto_out_0_a_bits_size; 
  wire [4:0] system_bus_xbar_auto_out_0_a_bits_source; 
  wire [30:0] system_bus_xbar_auto_out_0_a_bits_address; 
  wire [7:0] system_bus_xbar_auto_out_0_a_bits_mask; 
  wire [63:0] system_bus_xbar_auto_out_0_a_bits_data; 
  wire  system_bus_xbar_auto_out_0_a_bits_corrupt; 
  wire  system_bus_xbar_auto_out_0_d_ready; 
  wire  system_bus_xbar_auto_out_0_d_valid; 
  wire [2:0] system_bus_xbar_auto_out_0_d_bits_opcode; 
  wire [1:0] system_bus_xbar_auto_out_0_d_bits_param; 
  wire [2:0] system_bus_xbar_auto_out_0_d_bits_size; 
  wire [4:0] system_bus_xbar_auto_out_0_d_bits_source; 
  wire  system_bus_xbar_auto_out_0_d_bits_sink; 
  wire  system_bus_xbar_auto_out_0_d_bits_denied; 
  wire [63:0] system_bus_xbar_auto_out_0_d_bits_data; 
  wire  system_bus_xbar_auto_out_0_d_bits_corrupt; 
  wire  control_bus_clock; 
  wire  control_bus_reset; 
  wire  control_bus_auto_coupler_to_slave_named_MaskROM_fragmenter_out_a_ready; 
  wire  control_bus_auto_coupler_to_slave_named_MaskROM_fragmenter_out_a_valid; 
  wire [2:0] control_bus_auto_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_opcode; 
  wire [2:0] control_bus_auto_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_param; 
  wire [1:0] control_bus_auto_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_size; 
  wire [9:0] control_bus_auto_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_source; 
  wire [16:0] control_bus_auto_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_address; 
  wire [3:0] control_bus_auto_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_mask; 
  wire  control_bus_auto_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_corrupt; 
  wire  control_bus_auto_coupler_to_slave_named_MaskROM_fragmenter_out_d_ready; 
  wire  control_bus_auto_coupler_to_slave_named_MaskROM_fragmenter_out_d_valid; 
  wire [1:0] control_bus_auto_coupler_to_slave_named_MaskROM_fragmenter_out_d_bits_size; 
  wire [9:0] control_bus_auto_coupler_to_slave_named_MaskROM_fragmenter_out_d_bits_source; 
  wire [31:0] control_bus_auto_coupler_to_slave_named_MaskROM_fragmenter_out_d_bits_data; 
  wire  control_bus_auto_coupler_to_slave_named_debug_fragmenter_out_a_ready; 
  wire  control_bus_auto_coupler_to_slave_named_debug_fragmenter_out_a_valid; 
  wire [2:0] control_bus_auto_coupler_to_slave_named_debug_fragmenter_out_a_bits_opcode; 
  wire [2:0] control_bus_auto_coupler_to_slave_named_debug_fragmenter_out_a_bits_param; 
  wire [1:0] control_bus_auto_coupler_to_slave_named_debug_fragmenter_out_a_bits_size; 
  wire [8:0] control_bus_auto_coupler_to_slave_named_debug_fragmenter_out_a_bits_source; 
  wire [11:0] control_bus_auto_coupler_to_slave_named_debug_fragmenter_out_a_bits_address; 
  wire [7:0] control_bus_auto_coupler_to_slave_named_debug_fragmenter_out_a_bits_mask; 
  wire [63:0] control_bus_auto_coupler_to_slave_named_debug_fragmenter_out_a_bits_data; 
  wire  control_bus_auto_coupler_to_slave_named_debug_fragmenter_out_a_bits_corrupt; 
  wire  control_bus_auto_coupler_to_slave_named_debug_fragmenter_out_d_ready; 
  wire  control_bus_auto_coupler_to_slave_named_debug_fragmenter_out_d_valid; 
  wire [2:0] control_bus_auto_coupler_to_slave_named_debug_fragmenter_out_d_bits_opcode; 
  wire [1:0] control_bus_auto_coupler_to_slave_named_debug_fragmenter_out_d_bits_size; 
  wire [8:0] control_bus_auto_coupler_to_slave_named_debug_fragmenter_out_d_bits_source; 
  wire [63:0] control_bus_auto_coupler_to_slave_named_debug_fragmenter_out_d_bits_data; 
  wire  control_bus_auto_coupler_to_slave_named_clint_fragmenter_out_a_ready; 
  wire  control_bus_auto_coupler_to_slave_named_clint_fragmenter_out_a_valid; 
  wire [2:0] control_bus_auto_coupler_to_slave_named_clint_fragmenter_out_a_bits_opcode; 
  wire [2:0] control_bus_auto_coupler_to_slave_named_clint_fragmenter_out_a_bits_param; 
  wire [1:0] control_bus_auto_coupler_to_slave_named_clint_fragmenter_out_a_bits_size; 
  wire [8:0] control_bus_auto_coupler_to_slave_named_clint_fragmenter_out_a_bits_source; 
  wire [25:0] control_bus_auto_coupler_to_slave_named_clint_fragmenter_out_a_bits_address; 
  wire [7:0] control_bus_auto_coupler_to_slave_named_clint_fragmenter_out_a_bits_mask; 
  wire [63:0] control_bus_auto_coupler_to_slave_named_clint_fragmenter_out_a_bits_data; 
  wire  control_bus_auto_coupler_to_slave_named_clint_fragmenter_out_a_bits_corrupt; 
  wire  control_bus_auto_coupler_to_slave_named_clint_fragmenter_out_d_ready; 
  wire  control_bus_auto_coupler_to_slave_named_clint_fragmenter_out_d_valid; 
  wire [2:0] control_bus_auto_coupler_to_slave_named_clint_fragmenter_out_d_bits_opcode; 
  wire [1:0] control_bus_auto_coupler_to_slave_named_clint_fragmenter_out_d_bits_size; 
  wire [8:0] control_bus_auto_coupler_to_slave_named_clint_fragmenter_out_d_bits_source; 
  wire [63:0] control_bus_auto_coupler_to_slave_named_clint_fragmenter_out_d_bits_data; 
  wire  control_bus_auto_coupler_to_slave_named_plic_fragmenter_out_a_ready; 
  wire  control_bus_auto_coupler_to_slave_named_plic_fragmenter_out_a_valid; 
  wire [2:0] control_bus_auto_coupler_to_slave_named_plic_fragmenter_out_a_bits_opcode; 
  wire [2:0] control_bus_auto_coupler_to_slave_named_plic_fragmenter_out_a_bits_param; 
  wire [1:0] control_bus_auto_coupler_to_slave_named_plic_fragmenter_out_a_bits_size; 
  wire [8:0] control_bus_auto_coupler_to_slave_named_plic_fragmenter_out_a_bits_source; 
  wire [27:0] control_bus_auto_coupler_to_slave_named_plic_fragmenter_out_a_bits_address; 
  wire [7:0] control_bus_auto_coupler_to_slave_named_plic_fragmenter_out_a_bits_mask; 
  wire [63:0] control_bus_auto_coupler_to_slave_named_plic_fragmenter_out_a_bits_data; 
  wire  control_bus_auto_coupler_to_slave_named_plic_fragmenter_out_a_bits_corrupt; 
  wire  control_bus_auto_coupler_to_slave_named_plic_fragmenter_out_d_ready; 
  wire  control_bus_auto_coupler_to_slave_named_plic_fragmenter_out_d_valid; 
  wire [2:0] control_bus_auto_coupler_to_slave_named_plic_fragmenter_out_d_bits_opcode; 
  wire [1:0] control_bus_auto_coupler_to_slave_named_plic_fragmenter_out_d_bits_size; 
  wire [8:0] control_bus_auto_coupler_to_slave_named_plic_fragmenter_out_d_bits_source; 
  wire [63:0] control_bus_auto_coupler_to_slave_named_plic_fragmenter_out_d_bits_data; 
  wire  control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_a_ready; 
  wire  control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_a_valid; 
  wire [2:0] control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_a_bits_opcode; 
  wire [2:0] control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_a_bits_param; 
  wire [2:0] control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_a_bits_size; 
  wire [4:0] control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_a_bits_source; 
  wire [30:0] control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_a_bits_address; 
  wire [7:0] control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_a_bits_mask; 
  wire [63:0] control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_a_bits_data; 
  wire  control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_a_bits_corrupt; 
  wire  control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_d_ready; 
  wire  control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_d_valid; 
  wire [2:0] control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_d_bits_opcode; 
  wire [1:0] control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_d_bits_param; 
  wire [2:0] control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_d_bits_size; 
  wire [4:0] control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_d_bits_source; 
  wire  control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_d_bits_sink; 
  wire  control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_d_bits_denied; 
  wire [63:0] control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_d_bits_data; 
  wire  control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_d_bits_corrupt; 
  wire  control_bus_auto_from_sbus_in_a_ready; 
  wire  control_bus_auto_from_sbus_in_a_valid; 
  wire [2:0] control_bus_auto_from_sbus_in_a_bits_opcode; 
  wire [2:0] control_bus_auto_from_sbus_in_a_bits_param; 
  wire [2:0] control_bus_auto_from_sbus_in_a_bits_size; 
  wire [4:0] control_bus_auto_from_sbus_in_a_bits_source; 
  wire [30:0] control_bus_auto_from_sbus_in_a_bits_address; 
  wire [7:0] control_bus_auto_from_sbus_in_a_bits_mask; 
  wire [63:0] control_bus_auto_from_sbus_in_a_bits_data; 
  wire  control_bus_auto_from_sbus_in_a_bits_corrupt; 
  wire  control_bus_auto_from_sbus_in_d_ready; 
  wire  control_bus_auto_from_sbus_in_d_valid; 
  wire [2:0] control_bus_auto_from_sbus_in_d_bits_opcode; 
  wire [1:0] control_bus_auto_from_sbus_in_d_bits_param; 
  wire [2:0] control_bus_auto_from_sbus_in_d_bits_size; 
  wire [4:0] control_bus_auto_from_sbus_in_d_bits_source; 
  wire  control_bus_auto_from_sbus_in_d_bits_sink; 
  wire  control_bus_auto_from_sbus_in_d_bits_denied; 
  wire [63:0] control_bus_auto_from_sbus_in_d_bits_data; 
  wire  control_bus_auto_from_sbus_in_d_bits_corrupt; 
  wire  coupler_to_bus_named_cbus_clock; 
  wire  coupler_to_bus_named_cbus_reset; 
  wire  coupler_to_bus_named_cbus_auto_buffer_in_a_ready; 
  wire  coupler_to_bus_named_cbus_auto_buffer_in_a_valid; 
  wire [2:0] coupler_to_bus_named_cbus_auto_buffer_in_a_bits_opcode; 
  wire [2:0] coupler_to_bus_named_cbus_auto_buffer_in_a_bits_param; 
  wire [2:0] coupler_to_bus_named_cbus_auto_buffer_in_a_bits_size; 
  wire [4:0] coupler_to_bus_named_cbus_auto_buffer_in_a_bits_source; 
  wire [30:0] coupler_to_bus_named_cbus_auto_buffer_in_a_bits_address; 
  wire [7:0] coupler_to_bus_named_cbus_auto_buffer_in_a_bits_mask; 
  wire [63:0] coupler_to_bus_named_cbus_auto_buffer_in_a_bits_data; 
  wire  coupler_to_bus_named_cbus_auto_buffer_in_a_bits_corrupt; 
  wire  coupler_to_bus_named_cbus_auto_buffer_in_d_ready; 
  wire  coupler_to_bus_named_cbus_auto_buffer_in_d_valid; 
  wire [2:0] coupler_to_bus_named_cbus_auto_buffer_in_d_bits_opcode; 
  wire [1:0] coupler_to_bus_named_cbus_auto_buffer_in_d_bits_param; 
  wire [2:0] coupler_to_bus_named_cbus_auto_buffer_in_d_bits_size; 
  wire [4:0] coupler_to_bus_named_cbus_auto_buffer_in_d_bits_source; 
  wire  coupler_to_bus_named_cbus_auto_buffer_in_d_bits_sink; 
  wire  coupler_to_bus_named_cbus_auto_buffer_in_d_bits_denied; 
  wire [63:0] coupler_to_bus_named_cbus_auto_buffer_in_d_bits_data; 
  wire  coupler_to_bus_named_cbus_auto_buffer_in_d_bits_corrupt; 
  wire  coupler_to_bus_named_cbus_auto_from_sbus_out_a_ready; 
  wire  coupler_to_bus_named_cbus_auto_from_sbus_out_a_valid; 
  wire [2:0] coupler_to_bus_named_cbus_auto_from_sbus_out_a_bits_opcode; 
  wire [2:0] coupler_to_bus_named_cbus_auto_from_sbus_out_a_bits_param; 
  wire [2:0] coupler_to_bus_named_cbus_auto_from_sbus_out_a_bits_size; 
  wire [4:0] coupler_to_bus_named_cbus_auto_from_sbus_out_a_bits_source; 
  wire [30:0] coupler_to_bus_named_cbus_auto_from_sbus_out_a_bits_address; 
  wire [7:0] coupler_to_bus_named_cbus_auto_from_sbus_out_a_bits_mask; 
  wire [63:0] coupler_to_bus_named_cbus_auto_from_sbus_out_a_bits_data; 
  wire  coupler_to_bus_named_cbus_auto_from_sbus_out_a_bits_corrupt; 
  wire  coupler_to_bus_named_cbus_auto_from_sbus_out_d_ready; 
  wire  coupler_to_bus_named_cbus_auto_from_sbus_out_d_valid; 
  wire [2:0] coupler_to_bus_named_cbus_auto_from_sbus_out_d_bits_opcode; 
  wire [1:0] coupler_to_bus_named_cbus_auto_from_sbus_out_d_bits_param; 
  wire [2:0] coupler_to_bus_named_cbus_auto_from_sbus_out_d_bits_size; 
  wire [4:0] coupler_to_bus_named_cbus_auto_from_sbus_out_d_bits_source; 
  wire  coupler_to_bus_named_cbus_auto_from_sbus_out_d_bits_sink; 
  wire  coupler_to_bus_named_cbus_auto_from_sbus_out_d_bits_denied; 
  wire [63:0] coupler_to_bus_named_cbus_auto_from_sbus_out_d_bits_data; 
  wire  coupler_to_bus_named_cbus_auto_from_sbus_out_d_bits_corrupt; 
  wire  master_splitter_clock; 
  wire  master_splitter_reset; 
  wire  master_splitter_auto_in_3_a_ready; 
  wire  master_splitter_auto_in_3_a_valid; 
  wire [2:0] master_splitter_auto_in_3_a_bits_opcode; 
  wire [2:0] master_splitter_auto_in_3_a_bits_param; 
  wire [2:0] master_splitter_auto_in_3_a_bits_size; 
  wire [1:0] master_splitter_auto_in_3_a_bits_source; 
  wire [37:0] master_splitter_auto_in_3_a_bits_address; 
  wire [7:0] master_splitter_auto_in_3_a_bits_mask; 
  wire [63:0] master_splitter_auto_in_3_a_bits_data; 
  wire  master_splitter_auto_in_3_a_bits_corrupt; 
  wire  master_splitter_auto_in_3_b_ready; 
  wire  master_splitter_auto_in_3_b_valid; 
  wire [2:0] master_splitter_auto_in_3_b_bits_opcode; 
  wire [1:0] master_splitter_auto_in_3_b_bits_param; 
  wire [2:0] master_splitter_auto_in_3_b_bits_size; 
  wire [1:0] master_splitter_auto_in_3_b_bits_source; 
  wire [37:0] master_splitter_auto_in_3_b_bits_address; 
  wire [7:0] master_splitter_auto_in_3_b_bits_mask; 
  wire  master_splitter_auto_in_3_b_bits_corrupt; 
  wire  master_splitter_auto_in_3_c_ready; 
  wire  master_splitter_auto_in_3_c_valid; 
  wire [2:0] master_splitter_auto_in_3_c_bits_opcode; 
  wire [2:0] master_splitter_auto_in_3_c_bits_param; 
  wire [2:0] master_splitter_auto_in_3_c_bits_size; 
  wire [1:0] master_splitter_auto_in_3_c_bits_source; 
  wire [37:0] master_splitter_auto_in_3_c_bits_address; 
  wire [63:0] master_splitter_auto_in_3_c_bits_data; 
  wire  master_splitter_auto_in_3_c_bits_corrupt; 
  wire  master_splitter_auto_in_3_d_ready; 
  wire  master_splitter_auto_in_3_d_valid; 
  wire [2:0] master_splitter_auto_in_3_d_bits_opcode; 
  wire [1:0] master_splitter_auto_in_3_d_bits_param; 
  wire [2:0] master_splitter_auto_in_3_d_bits_size; 
  wire [1:0] master_splitter_auto_in_3_d_bits_source; 
  wire [2:0] master_splitter_auto_in_3_d_bits_sink; 
  wire  master_splitter_auto_in_3_d_bits_denied; 
  wire [63:0] master_splitter_auto_in_3_d_bits_data; 
  wire  master_splitter_auto_in_3_d_bits_corrupt; 
  wire  master_splitter_auto_in_3_e_ready; 
  wire  master_splitter_auto_in_3_e_valid; 
  wire [2:0] master_splitter_auto_in_3_e_bits_sink; 
  wire  master_splitter_auto_in_2_a_ready; 
  wire  master_splitter_auto_in_2_a_valid; 
  wire [2:0] master_splitter_auto_in_2_a_bits_opcode; 
  wire [2:0] master_splitter_auto_in_2_a_bits_param; 
  wire [2:0] master_splitter_auto_in_2_a_bits_size; 
  wire [1:0] master_splitter_auto_in_2_a_bits_source; 
  wire [37:0] master_splitter_auto_in_2_a_bits_address; 
  wire [7:0] master_splitter_auto_in_2_a_bits_mask; 
  wire [63:0] master_splitter_auto_in_2_a_bits_data; 
  wire  master_splitter_auto_in_2_a_bits_corrupt; 
  wire  master_splitter_auto_in_2_b_ready; 
  wire  master_splitter_auto_in_2_b_valid; 
  wire [2:0] master_splitter_auto_in_2_b_bits_opcode; 
  wire [1:0] master_splitter_auto_in_2_b_bits_param; 
  wire [2:0] master_splitter_auto_in_2_b_bits_size; 
  wire [1:0] master_splitter_auto_in_2_b_bits_source; 
  wire [37:0] master_splitter_auto_in_2_b_bits_address; 
  wire [7:0] master_splitter_auto_in_2_b_bits_mask; 
  wire  master_splitter_auto_in_2_b_bits_corrupt; 
  wire  master_splitter_auto_in_2_c_ready; 
  wire  master_splitter_auto_in_2_c_valid; 
  wire [2:0] master_splitter_auto_in_2_c_bits_opcode; 
  wire [2:0] master_splitter_auto_in_2_c_bits_param; 
  wire [2:0] master_splitter_auto_in_2_c_bits_size; 
  wire [1:0] master_splitter_auto_in_2_c_bits_source; 
  wire [37:0] master_splitter_auto_in_2_c_bits_address; 
  wire [63:0] master_splitter_auto_in_2_c_bits_data; 
  wire  master_splitter_auto_in_2_c_bits_corrupt; 
  wire  master_splitter_auto_in_2_d_ready; 
  wire  master_splitter_auto_in_2_d_valid; 
  wire [2:0] master_splitter_auto_in_2_d_bits_opcode; 
  wire [1:0] master_splitter_auto_in_2_d_bits_param; 
  wire [2:0] master_splitter_auto_in_2_d_bits_size; 
  wire [1:0] master_splitter_auto_in_2_d_bits_source; 
  wire [2:0] master_splitter_auto_in_2_d_bits_sink; 
  wire  master_splitter_auto_in_2_d_bits_denied; 
  wire [63:0] master_splitter_auto_in_2_d_bits_data; 
  wire  master_splitter_auto_in_2_d_bits_corrupt; 
  wire  master_splitter_auto_in_2_e_ready; 
  wire  master_splitter_auto_in_2_e_valid; 
  wire [2:0] master_splitter_auto_in_2_e_bits_sink; 
  wire  master_splitter_auto_in_1_a_ready; 
  wire  master_splitter_auto_in_1_a_valid; 
  wire [2:0] master_splitter_auto_in_1_a_bits_opcode; 
  wire [2:0] master_splitter_auto_in_1_a_bits_param; 
  wire [2:0] master_splitter_auto_in_1_a_bits_size; 
  wire [1:0] master_splitter_auto_in_1_a_bits_source; 
  wire [37:0] master_splitter_auto_in_1_a_bits_address; 
  wire [7:0] master_splitter_auto_in_1_a_bits_mask; 
  wire [63:0] master_splitter_auto_in_1_a_bits_data; 
  wire  master_splitter_auto_in_1_a_bits_corrupt; 
  wire  master_splitter_auto_in_1_b_ready; 
  wire  master_splitter_auto_in_1_b_valid; 
  wire [2:0] master_splitter_auto_in_1_b_bits_opcode; 
  wire [1:0] master_splitter_auto_in_1_b_bits_param; 
  wire [2:0] master_splitter_auto_in_1_b_bits_size; 
  wire [1:0] master_splitter_auto_in_1_b_bits_source; 
  wire [37:0] master_splitter_auto_in_1_b_bits_address; 
  wire [7:0] master_splitter_auto_in_1_b_bits_mask; 
  wire  master_splitter_auto_in_1_b_bits_corrupt; 
  wire  master_splitter_auto_in_1_c_ready; 
  wire  master_splitter_auto_in_1_c_valid; 
  wire [2:0] master_splitter_auto_in_1_c_bits_opcode; 
  wire [2:0] master_splitter_auto_in_1_c_bits_param; 
  wire [2:0] master_splitter_auto_in_1_c_bits_size; 
  wire [1:0] master_splitter_auto_in_1_c_bits_source; 
  wire [37:0] master_splitter_auto_in_1_c_bits_address; 
  wire [63:0] master_splitter_auto_in_1_c_bits_data; 
  wire  master_splitter_auto_in_1_c_bits_corrupt; 
  wire  master_splitter_auto_in_1_d_ready; 
  wire  master_splitter_auto_in_1_d_valid; 
  wire [2:0] master_splitter_auto_in_1_d_bits_opcode; 
  wire [1:0] master_splitter_auto_in_1_d_bits_param; 
  wire [2:0] master_splitter_auto_in_1_d_bits_size; 
  wire [1:0] master_splitter_auto_in_1_d_bits_source; 
  wire [2:0] master_splitter_auto_in_1_d_bits_sink; 
  wire  master_splitter_auto_in_1_d_bits_denied; 
  wire [63:0] master_splitter_auto_in_1_d_bits_data; 
  wire  master_splitter_auto_in_1_d_bits_corrupt; 
  wire  master_splitter_auto_in_1_e_ready; 
  wire  master_splitter_auto_in_1_e_valid; 
  wire [2:0] master_splitter_auto_in_1_e_bits_sink; 
  wire  master_splitter_auto_in_0_a_ready; 
  wire  master_splitter_auto_in_0_a_valid; 
  wire [2:0] master_splitter_auto_in_0_a_bits_opcode; 
  wire [2:0] master_splitter_auto_in_0_a_bits_param; 
  wire [2:0] master_splitter_auto_in_0_a_bits_size; 
  wire [1:0] master_splitter_auto_in_0_a_bits_source; 
  wire [37:0] master_splitter_auto_in_0_a_bits_address; 
  wire [7:0] master_splitter_auto_in_0_a_bits_mask; 
  wire [63:0] master_splitter_auto_in_0_a_bits_data; 
  wire  master_splitter_auto_in_0_a_bits_corrupt; 
  wire  master_splitter_auto_in_0_b_ready; 
  wire  master_splitter_auto_in_0_b_valid; 
  wire [2:0] master_splitter_auto_in_0_b_bits_opcode; 
  wire [1:0] master_splitter_auto_in_0_b_bits_param; 
  wire [2:0] master_splitter_auto_in_0_b_bits_size; 
  wire [1:0] master_splitter_auto_in_0_b_bits_source; 
  wire [37:0] master_splitter_auto_in_0_b_bits_address; 
  wire [7:0] master_splitter_auto_in_0_b_bits_mask; 
  wire  master_splitter_auto_in_0_b_bits_corrupt; 
  wire  master_splitter_auto_in_0_c_ready; 
  wire  master_splitter_auto_in_0_c_valid; 
  wire [2:0] master_splitter_auto_in_0_c_bits_opcode; 
  wire [2:0] master_splitter_auto_in_0_c_bits_param; 
  wire [2:0] master_splitter_auto_in_0_c_bits_size; 
  wire [1:0] master_splitter_auto_in_0_c_bits_source; 
  wire [37:0] master_splitter_auto_in_0_c_bits_address; 
  wire [63:0] master_splitter_auto_in_0_c_bits_data; 
  wire  master_splitter_auto_in_0_c_bits_corrupt; 
  wire  master_splitter_auto_in_0_d_ready; 
  wire  master_splitter_auto_in_0_d_valid; 
  wire [2:0] master_splitter_auto_in_0_d_bits_opcode; 
  wire [1:0] master_splitter_auto_in_0_d_bits_param; 
  wire [2:0] master_splitter_auto_in_0_d_bits_size; 
  wire [1:0] master_splitter_auto_in_0_d_bits_source; 
  wire [2:0] master_splitter_auto_in_0_d_bits_sink; 
  wire  master_splitter_auto_in_0_d_bits_denied; 
  wire [63:0] master_splitter_auto_in_0_d_bits_data; 
  wire  master_splitter_auto_in_0_d_bits_corrupt; 
  wire  master_splitter_auto_in_0_e_ready; 
  wire  master_splitter_auto_in_0_e_valid; 
  wire [2:0] master_splitter_auto_in_0_e_bits_sink; 
  wire  master_splitter_auto_out_3_a_ready; 
  wire  master_splitter_auto_out_3_a_valid; 
  wire [2:0] master_splitter_auto_out_3_a_bits_opcode; 
  wire [2:0] master_splitter_auto_out_3_a_bits_param; 
  wire [2:0] master_splitter_auto_out_3_a_bits_size; 
  wire [1:0] master_splitter_auto_out_3_a_bits_source; 
  wire [37:0] master_splitter_auto_out_3_a_bits_address; 
  wire [7:0] master_splitter_auto_out_3_a_bits_mask; 
  wire [63:0] master_splitter_auto_out_3_a_bits_data; 
  wire  master_splitter_auto_out_3_a_bits_corrupt; 
  wire  master_splitter_auto_out_3_b_ready; 
  wire  master_splitter_auto_out_3_b_valid; 
  wire [2:0] master_splitter_auto_out_3_b_bits_opcode; 
  wire [1:0] master_splitter_auto_out_3_b_bits_param; 
  wire [2:0] master_splitter_auto_out_3_b_bits_size; 
  wire [1:0] master_splitter_auto_out_3_b_bits_source; 
  wire [37:0] master_splitter_auto_out_3_b_bits_address; 
  wire [7:0] master_splitter_auto_out_3_b_bits_mask; 
  wire  master_splitter_auto_out_3_b_bits_corrupt; 
  wire  master_splitter_auto_out_3_c_ready; 
  wire  master_splitter_auto_out_3_c_valid; 
  wire [2:0] master_splitter_auto_out_3_c_bits_opcode; 
  wire [2:0] master_splitter_auto_out_3_c_bits_param; 
  wire [2:0] master_splitter_auto_out_3_c_bits_size; 
  wire [1:0] master_splitter_auto_out_3_c_bits_source; 
  wire [37:0] master_splitter_auto_out_3_c_bits_address; 
  wire [63:0] master_splitter_auto_out_3_c_bits_data; 
  wire  master_splitter_auto_out_3_c_bits_corrupt; 
  wire  master_splitter_auto_out_3_d_ready; 
  wire  master_splitter_auto_out_3_d_valid; 
  wire [2:0] master_splitter_auto_out_3_d_bits_opcode; 
  wire [1:0] master_splitter_auto_out_3_d_bits_param; 
  wire [2:0] master_splitter_auto_out_3_d_bits_size; 
  wire [1:0] master_splitter_auto_out_3_d_bits_source; 
  wire [2:0] master_splitter_auto_out_3_d_bits_sink; 
  wire  master_splitter_auto_out_3_d_bits_denied; 
  wire [63:0] master_splitter_auto_out_3_d_bits_data; 
  wire  master_splitter_auto_out_3_d_bits_corrupt; 
  wire  master_splitter_auto_out_3_e_ready; 
  wire  master_splitter_auto_out_3_e_valid; 
  wire [2:0] master_splitter_auto_out_3_e_bits_sink; 
  wire  master_splitter_auto_out_2_a_ready; 
  wire  master_splitter_auto_out_2_a_valid; 
  wire [2:0] master_splitter_auto_out_2_a_bits_opcode; 
  wire [2:0] master_splitter_auto_out_2_a_bits_param; 
  wire [2:0] master_splitter_auto_out_2_a_bits_size; 
  wire [1:0] master_splitter_auto_out_2_a_bits_source; 
  wire [37:0] master_splitter_auto_out_2_a_bits_address; 
  wire [7:0] master_splitter_auto_out_2_a_bits_mask; 
  wire [63:0] master_splitter_auto_out_2_a_bits_data; 
  wire  master_splitter_auto_out_2_a_bits_corrupt; 
  wire  master_splitter_auto_out_2_b_ready; 
  wire  master_splitter_auto_out_2_b_valid; 
  wire [2:0] master_splitter_auto_out_2_b_bits_opcode; 
  wire [1:0] master_splitter_auto_out_2_b_bits_param; 
  wire [2:0] master_splitter_auto_out_2_b_bits_size; 
  wire [1:0] master_splitter_auto_out_2_b_bits_source; 
  wire [37:0] master_splitter_auto_out_2_b_bits_address; 
  wire [7:0] master_splitter_auto_out_2_b_bits_mask; 
  wire  master_splitter_auto_out_2_b_bits_corrupt; 
  wire  master_splitter_auto_out_2_c_ready; 
  wire  master_splitter_auto_out_2_c_valid; 
  wire [2:0] master_splitter_auto_out_2_c_bits_opcode; 
  wire [2:0] master_splitter_auto_out_2_c_bits_param; 
  wire [2:0] master_splitter_auto_out_2_c_bits_size; 
  wire [1:0] master_splitter_auto_out_2_c_bits_source; 
  wire [37:0] master_splitter_auto_out_2_c_bits_address; 
  wire [63:0] master_splitter_auto_out_2_c_bits_data; 
  wire  master_splitter_auto_out_2_c_bits_corrupt; 
  wire  master_splitter_auto_out_2_d_ready; 
  wire  master_splitter_auto_out_2_d_valid; 
  wire [2:0] master_splitter_auto_out_2_d_bits_opcode; 
  wire [1:0] master_splitter_auto_out_2_d_bits_param; 
  wire [2:0] master_splitter_auto_out_2_d_bits_size; 
  wire [1:0] master_splitter_auto_out_2_d_bits_source; 
  wire [2:0] master_splitter_auto_out_2_d_bits_sink; 
  wire  master_splitter_auto_out_2_d_bits_denied; 
  wire [63:0] master_splitter_auto_out_2_d_bits_data; 
  wire  master_splitter_auto_out_2_d_bits_corrupt; 
  wire  master_splitter_auto_out_2_e_ready; 
  wire  master_splitter_auto_out_2_e_valid; 
  wire [2:0] master_splitter_auto_out_2_e_bits_sink; 
  wire  master_splitter_auto_out_1_a_ready; 
  wire  master_splitter_auto_out_1_a_valid; 
  wire [2:0] master_splitter_auto_out_1_a_bits_opcode; 
  wire [2:0] master_splitter_auto_out_1_a_bits_param; 
  wire [2:0] master_splitter_auto_out_1_a_bits_size; 
  wire [1:0] master_splitter_auto_out_1_a_bits_source; 
  wire [37:0] master_splitter_auto_out_1_a_bits_address; 
  wire [7:0] master_splitter_auto_out_1_a_bits_mask; 
  wire [63:0] master_splitter_auto_out_1_a_bits_data; 
  wire  master_splitter_auto_out_1_a_bits_corrupt; 
  wire  master_splitter_auto_out_1_b_ready; 
  wire  master_splitter_auto_out_1_b_valid; 
  wire [2:0] master_splitter_auto_out_1_b_bits_opcode; 
  wire [1:0] master_splitter_auto_out_1_b_bits_param; 
  wire [2:0] master_splitter_auto_out_1_b_bits_size; 
  wire [1:0] master_splitter_auto_out_1_b_bits_source; 
  wire [37:0] master_splitter_auto_out_1_b_bits_address; 
  wire [7:0] master_splitter_auto_out_1_b_bits_mask; 
  wire  master_splitter_auto_out_1_b_bits_corrupt; 
  wire  master_splitter_auto_out_1_c_ready; 
  wire  master_splitter_auto_out_1_c_valid; 
  wire [2:0] master_splitter_auto_out_1_c_bits_opcode; 
  wire [2:0] master_splitter_auto_out_1_c_bits_param; 
  wire [2:0] master_splitter_auto_out_1_c_bits_size; 
  wire [1:0] master_splitter_auto_out_1_c_bits_source; 
  wire [37:0] master_splitter_auto_out_1_c_bits_address; 
  wire [63:0] master_splitter_auto_out_1_c_bits_data; 
  wire  master_splitter_auto_out_1_c_bits_corrupt; 
  wire  master_splitter_auto_out_1_d_ready; 
  wire  master_splitter_auto_out_1_d_valid; 
  wire [2:0] master_splitter_auto_out_1_d_bits_opcode; 
  wire [1:0] master_splitter_auto_out_1_d_bits_param; 
  wire [2:0] master_splitter_auto_out_1_d_bits_size; 
  wire [1:0] master_splitter_auto_out_1_d_bits_source; 
  wire [2:0] master_splitter_auto_out_1_d_bits_sink; 
  wire  master_splitter_auto_out_1_d_bits_denied; 
  wire [63:0] master_splitter_auto_out_1_d_bits_data; 
  wire  master_splitter_auto_out_1_d_bits_corrupt; 
  wire  master_splitter_auto_out_1_e_ready; 
  wire  master_splitter_auto_out_1_e_valid; 
  wire [2:0] master_splitter_auto_out_1_e_bits_sink; 
  wire  master_splitter_auto_out_0_a_ready; 
  wire  master_splitter_auto_out_0_a_valid; 
  wire [2:0] master_splitter_auto_out_0_a_bits_opcode; 
  wire [2:0] master_splitter_auto_out_0_a_bits_param; 
  wire [2:0] master_splitter_auto_out_0_a_bits_size; 
  wire [1:0] master_splitter_auto_out_0_a_bits_source; 
  wire [37:0] master_splitter_auto_out_0_a_bits_address; 
  wire [7:0] master_splitter_auto_out_0_a_bits_mask; 
  wire [63:0] master_splitter_auto_out_0_a_bits_data; 
  wire  master_splitter_auto_out_0_a_bits_corrupt; 
  wire  master_splitter_auto_out_0_b_ready; 
  wire  master_splitter_auto_out_0_b_valid; 
  wire [2:0] master_splitter_auto_out_0_b_bits_opcode; 
  wire [1:0] master_splitter_auto_out_0_b_bits_param; 
  wire [2:0] master_splitter_auto_out_0_b_bits_size; 
  wire [1:0] master_splitter_auto_out_0_b_bits_source; 
  wire [37:0] master_splitter_auto_out_0_b_bits_address; 
  wire [7:0] master_splitter_auto_out_0_b_bits_mask; 
  wire  master_splitter_auto_out_0_b_bits_corrupt; 
  wire  master_splitter_auto_out_0_c_ready; 
  wire  master_splitter_auto_out_0_c_valid; 
  wire [2:0] master_splitter_auto_out_0_c_bits_opcode; 
  wire [2:0] master_splitter_auto_out_0_c_bits_param; 
  wire [2:0] master_splitter_auto_out_0_c_bits_size; 
  wire [1:0] master_splitter_auto_out_0_c_bits_source; 
  wire [37:0] master_splitter_auto_out_0_c_bits_address; 
  wire [63:0] master_splitter_auto_out_0_c_bits_data; 
  wire  master_splitter_auto_out_0_c_bits_corrupt; 
  wire  master_splitter_auto_out_0_d_ready; 
  wire  master_splitter_auto_out_0_d_valid; 
  wire [2:0] master_splitter_auto_out_0_d_bits_opcode; 
  wire [1:0] master_splitter_auto_out_0_d_bits_param; 
  wire [2:0] master_splitter_auto_out_0_d_bits_size; 
  wire [1:0] master_splitter_auto_out_0_d_bits_source; 
  wire [2:0] master_splitter_auto_out_0_d_bits_sink; 
  wire  master_splitter_auto_out_0_d_bits_denied; 
  wire [63:0] master_splitter_auto_out_0_d_bits_data; 
  wire  master_splitter_auto_out_0_d_bits_corrupt; 
  wire  master_splitter_auto_out_0_e_ready; 
  wire  master_splitter_auto_out_0_e_valid; 
  wire [2:0] master_splitter_auto_out_0_e_bits_sink; 
  wire  wrapped_error_device_clock; 
  wire  wrapped_error_device_reset; 
  wire  wrapped_error_device_auto_buffer_in_a_ready; 
  wire  wrapped_error_device_auto_buffer_in_a_valid; 
  wire [2:0] wrapped_error_device_auto_buffer_in_a_bits_opcode; 
  wire [2:0] wrapped_error_device_auto_buffer_in_a_bits_param; 
  wire [2:0] wrapped_error_device_auto_buffer_in_a_bits_size; 
  wire [4:0] wrapped_error_device_auto_buffer_in_a_bits_source; 
  wire [13:0] wrapped_error_device_auto_buffer_in_a_bits_address; 
  wire [7:0] wrapped_error_device_auto_buffer_in_a_bits_mask; 
  wire  wrapped_error_device_auto_buffer_in_a_bits_corrupt; 
  wire  wrapped_error_device_auto_buffer_in_b_ready; 
  wire  wrapped_error_device_auto_buffer_in_b_valid; 
  wire [2:0] wrapped_error_device_auto_buffer_in_b_bits_opcode; 
  wire [1:0] wrapped_error_device_auto_buffer_in_b_bits_param; 
  wire [2:0] wrapped_error_device_auto_buffer_in_b_bits_size; 
  wire [4:0] wrapped_error_device_auto_buffer_in_b_bits_source; 
  wire [13:0] wrapped_error_device_auto_buffer_in_b_bits_address; 
  wire [7:0] wrapped_error_device_auto_buffer_in_b_bits_mask; 
  wire [63:0] wrapped_error_device_auto_buffer_in_b_bits_data; 
  wire  wrapped_error_device_auto_buffer_in_b_bits_corrupt; 
  wire  wrapped_error_device_auto_buffer_in_c_ready; 
  wire  wrapped_error_device_auto_buffer_in_c_valid; 
  wire [2:0] wrapped_error_device_auto_buffer_in_c_bits_opcode; 
  wire [2:0] wrapped_error_device_auto_buffer_in_c_bits_param; 
  wire [2:0] wrapped_error_device_auto_buffer_in_c_bits_size; 
  wire [4:0] wrapped_error_device_auto_buffer_in_c_bits_source; 
  wire [13:0] wrapped_error_device_auto_buffer_in_c_bits_address; 
  wire  wrapped_error_device_auto_buffer_in_c_bits_corrupt; 
  wire  wrapped_error_device_auto_buffer_in_d_ready; 
  wire  wrapped_error_device_auto_buffer_in_d_valid; 
  wire [2:0] wrapped_error_device_auto_buffer_in_d_bits_opcode; 
  wire [1:0] wrapped_error_device_auto_buffer_in_d_bits_param; 
  wire [2:0] wrapped_error_device_auto_buffer_in_d_bits_size; 
  wire [4:0] wrapped_error_device_auto_buffer_in_d_bits_source; 
  wire  wrapped_error_device_auto_buffer_in_d_bits_sink; 
  wire  wrapped_error_device_auto_buffer_in_d_bits_denied; 
  wire [63:0] wrapped_error_device_auto_buffer_in_d_bits_data; 
  wire  wrapped_error_device_auto_buffer_in_d_bits_corrupt; 
  wire  wrapped_error_device_auto_buffer_in_e_ready; 
  wire  wrapped_error_device_auto_buffer_in_e_valid; 
  wire  coupler_from_tile_named_tile_clock; 
  wire  coupler_from_tile_named_tile_reset; 
  wire  coupler_from_tile_named_tile_auto_buffer_out_a_ready; 
  wire  coupler_from_tile_named_tile_auto_buffer_out_a_valid; 
  wire [2:0] coupler_from_tile_named_tile_auto_buffer_out_a_bits_opcode; 
  wire [2:0] coupler_from_tile_named_tile_auto_buffer_out_a_bits_param; 
  wire [2:0] coupler_from_tile_named_tile_auto_buffer_out_a_bits_size; 
  wire [1:0] coupler_from_tile_named_tile_auto_buffer_out_a_bits_source; 
  wire [37:0] coupler_from_tile_named_tile_auto_buffer_out_a_bits_address; 
  wire [7:0] coupler_from_tile_named_tile_auto_buffer_out_a_bits_mask; 
  wire [63:0] coupler_from_tile_named_tile_auto_buffer_out_a_bits_data; 
  wire  coupler_from_tile_named_tile_auto_buffer_out_a_bits_corrupt; 
  wire  coupler_from_tile_named_tile_auto_buffer_out_b_ready; 
  wire  coupler_from_tile_named_tile_auto_buffer_out_b_valid; 
  wire [2:0] coupler_from_tile_named_tile_auto_buffer_out_b_bits_opcode; 
  wire [1:0] coupler_from_tile_named_tile_auto_buffer_out_b_bits_param; 
  wire [2:0] coupler_from_tile_named_tile_auto_buffer_out_b_bits_size; 
  wire [1:0] coupler_from_tile_named_tile_auto_buffer_out_b_bits_source; 
  wire [37:0] coupler_from_tile_named_tile_auto_buffer_out_b_bits_address; 
  wire [7:0] coupler_from_tile_named_tile_auto_buffer_out_b_bits_mask; 
  wire  coupler_from_tile_named_tile_auto_buffer_out_b_bits_corrupt; 
  wire  coupler_from_tile_named_tile_auto_buffer_out_c_ready; 
  wire  coupler_from_tile_named_tile_auto_buffer_out_c_valid; 
  wire [2:0] coupler_from_tile_named_tile_auto_buffer_out_c_bits_opcode; 
  wire [2:0] coupler_from_tile_named_tile_auto_buffer_out_c_bits_param; 
  wire [2:0] coupler_from_tile_named_tile_auto_buffer_out_c_bits_size; 
  wire [1:0] coupler_from_tile_named_tile_auto_buffer_out_c_bits_source; 
  wire [37:0] coupler_from_tile_named_tile_auto_buffer_out_c_bits_address; 
  wire [63:0] coupler_from_tile_named_tile_auto_buffer_out_c_bits_data; 
  wire  coupler_from_tile_named_tile_auto_buffer_out_c_bits_corrupt; 
  wire  coupler_from_tile_named_tile_auto_buffer_out_d_ready; 
  wire  coupler_from_tile_named_tile_auto_buffer_out_d_valid; 
  wire [2:0] coupler_from_tile_named_tile_auto_buffer_out_d_bits_opcode; 
  wire [1:0] coupler_from_tile_named_tile_auto_buffer_out_d_bits_param; 
  wire [2:0] coupler_from_tile_named_tile_auto_buffer_out_d_bits_size; 
  wire [1:0] coupler_from_tile_named_tile_auto_buffer_out_d_bits_source; 
  wire [2:0] coupler_from_tile_named_tile_auto_buffer_out_d_bits_sink; 
  wire  coupler_from_tile_named_tile_auto_buffer_out_d_bits_denied; 
  wire [63:0] coupler_from_tile_named_tile_auto_buffer_out_d_bits_data; 
  wire  coupler_from_tile_named_tile_auto_buffer_out_d_bits_corrupt; 
  wire  coupler_from_tile_named_tile_auto_buffer_out_e_ready; 
  wire  coupler_from_tile_named_tile_auto_buffer_out_e_valid; 
  wire [2:0] coupler_from_tile_named_tile_auto_buffer_out_e_bits_sink; 
  wire  coupler_from_tile_named_tile_auto_tl_master_xing_in_a_ready; 
  wire  coupler_from_tile_named_tile_auto_tl_master_xing_in_a_valid; 
  wire [2:0] coupler_from_tile_named_tile_auto_tl_master_xing_in_a_bits_opcode; 
  wire [2:0] coupler_from_tile_named_tile_auto_tl_master_xing_in_a_bits_param; 
  wire [2:0] coupler_from_tile_named_tile_auto_tl_master_xing_in_a_bits_size; 
  wire [1:0] coupler_from_tile_named_tile_auto_tl_master_xing_in_a_bits_source; 
  wire [37:0] coupler_from_tile_named_tile_auto_tl_master_xing_in_a_bits_address; 
  wire [7:0] coupler_from_tile_named_tile_auto_tl_master_xing_in_a_bits_mask; 
  wire [63:0] coupler_from_tile_named_tile_auto_tl_master_xing_in_a_bits_data; 
  wire  coupler_from_tile_named_tile_auto_tl_master_xing_in_a_bits_corrupt; 
  wire  coupler_from_tile_named_tile_auto_tl_master_xing_in_b_ready; 
  wire  coupler_from_tile_named_tile_auto_tl_master_xing_in_b_valid; 
  wire [2:0] coupler_from_tile_named_tile_auto_tl_master_xing_in_b_bits_opcode; 
  wire [1:0] coupler_from_tile_named_tile_auto_tl_master_xing_in_b_bits_param; 
  wire [2:0] coupler_from_tile_named_tile_auto_tl_master_xing_in_b_bits_size; 
  wire [1:0] coupler_from_tile_named_tile_auto_tl_master_xing_in_b_bits_source; 
  wire [37:0] coupler_from_tile_named_tile_auto_tl_master_xing_in_b_bits_address; 
  wire [7:0] coupler_from_tile_named_tile_auto_tl_master_xing_in_b_bits_mask; 
  wire  coupler_from_tile_named_tile_auto_tl_master_xing_in_b_bits_corrupt; 
  wire  coupler_from_tile_named_tile_auto_tl_master_xing_in_c_ready; 
  wire  coupler_from_tile_named_tile_auto_tl_master_xing_in_c_valid; 
  wire [2:0] coupler_from_tile_named_tile_auto_tl_master_xing_in_c_bits_opcode; 
  wire [2:0] coupler_from_tile_named_tile_auto_tl_master_xing_in_c_bits_param; 
  wire [2:0] coupler_from_tile_named_tile_auto_tl_master_xing_in_c_bits_size; 
  wire [1:0] coupler_from_tile_named_tile_auto_tl_master_xing_in_c_bits_source; 
  wire [37:0] coupler_from_tile_named_tile_auto_tl_master_xing_in_c_bits_address; 
  wire [63:0] coupler_from_tile_named_tile_auto_tl_master_xing_in_c_bits_data; 
  wire  coupler_from_tile_named_tile_auto_tl_master_xing_in_c_bits_corrupt; 
  wire  coupler_from_tile_named_tile_auto_tl_master_xing_in_d_ready; 
  wire  coupler_from_tile_named_tile_auto_tl_master_xing_in_d_valid; 
  wire [2:0] coupler_from_tile_named_tile_auto_tl_master_xing_in_d_bits_opcode; 
  wire [1:0] coupler_from_tile_named_tile_auto_tl_master_xing_in_d_bits_param; 
  wire [2:0] coupler_from_tile_named_tile_auto_tl_master_xing_in_d_bits_size; 
  wire [1:0] coupler_from_tile_named_tile_auto_tl_master_xing_in_d_bits_source; 
  wire [2:0] coupler_from_tile_named_tile_auto_tl_master_xing_in_d_bits_sink; 
  wire  coupler_from_tile_named_tile_auto_tl_master_xing_in_d_bits_denied; 
  wire [63:0] coupler_from_tile_named_tile_auto_tl_master_xing_in_d_bits_data; 
  wire  coupler_from_tile_named_tile_auto_tl_master_xing_in_d_bits_corrupt; 
  wire  coupler_from_tile_named_tile_auto_tl_master_xing_in_e_ready; 
  wire  coupler_from_tile_named_tile_auto_tl_master_xing_in_e_valid; 
  wire [2:0] coupler_from_tile_named_tile_auto_tl_master_xing_in_e_bits_sink; 
  wire  coupler_from_tile_named_tile_1_clock; 
  wire  coupler_from_tile_named_tile_1_reset; 
  wire  coupler_from_tile_named_tile_1_auto_buffer_out_a_ready; 
  wire  coupler_from_tile_named_tile_1_auto_buffer_out_a_valid; 
  wire [2:0] coupler_from_tile_named_tile_1_auto_buffer_out_a_bits_opcode; 
  wire [2:0] coupler_from_tile_named_tile_1_auto_buffer_out_a_bits_param; 
  wire [2:0] coupler_from_tile_named_tile_1_auto_buffer_out_a_bits_size; 
  wire [1:0] coupler_from_tile_named_tile_1_auto_buffer_out_a_bits_source; 
  wire [37:0] coupler_from_tile_named_tile_1_auto_buffer_out_a_bits_address; 
  wire [7:0] coupler_from_tile_named_tile_1_auto_buffer_out_a_bits_mask; 
  wire [63:0] coupler_from_tile_named_tile_1_auto_buffer_out_a_bits_data; 
  wire  coupler_from_tile_named_tile_1_auto_buffer_out_a_bits_corrupt; 
  wire  coupler_from_tile_named_tile_1_auto_buffer_out_b_ready; 
  wire  coupler_from_tile_named_tile_1_auto_buffer_out_b_valid; 
  wire [2:0] coupler_from_tile_named_tile_1_auto_buffer_out_b_bits_opcode; 
  wire [1:0] coupler_from_tile_named_tile_1_auto_buffer_out_b_bits_param; 
  wire [2:0] coupler_from_tile_named_tile_1_auto_buffer_out_b_bits_size; 
  wire [1:0] coupler_from_tile_named_tile_1_auto_buffer_out_b_bits_source; 
  wire [37:0] coupler_from_tile_named_tile_1_auto_buffer_out_b_bits_address; 
  wire [7:0] coupler_from_tile_named_tile_1_auto_buffer_out_b_bits_mask; 
  wire  coupler_from_tile_named_tile_1_auto_buffer_out_b_bits_corrupt; 
  wire  coupler_from_tile_named_tile_1_auto_buffer_out_c_ready; 
  wire  coupler_from_tile_named_tile_1_auto_buffer_out_c_valid; 
  wire [2:0] coupler_from_tile_named_tile_1_auto_buffer_out_c_bits_opcode; 
  wire [2:0] coupler_from_tile_named_tile_1_auto_buffer_out_c_bits_param; 
  wire [2:0] coupler_from_tile_named_tile_1_auto_buffer_out_c_bits_size; 
  wire [1:0] coupler_from_tile_named_tile_1_auto_buffer_out_c_bits_source; 
  wire [37:0] coupler_from_tile_named_tile_1_auto_buffer_out_c_bits_address; 
  wire [63:0] coupler_from_tile_named_tile_1_auto_buffer_out_c_bits_data; 
  wire  coupler_from_tile_named_tile_1_auto_buffer_out_c_bits_corrupt; 
  wire  coupler_from_tile_named_tile_1_auto_buffer_out_d_ready; 
  wire  coupler_from_tile_named_tile_1_auto_buffer_out_d_valid; 
  wire [2:0] coupler_from_tile_named_tile_1_auto_buffer_out_d_bits_opcode; 
  wire [1:0] coupler_from_tile_named_tile_1_auto_buffer_out_d_bits_param; 
  wire [2:0] coupler_from_tile_named_tile_1_auto_buffer_out_d_bits_size; 
  wire [1:0] coupler_from_tile_named_tile_1_auto_buffer_out_d_bits_source; 
  wire [2:0] coupler_from_tile_named_tile_1_auto_buffer_out_d_bits_sink; 
  wire  coupler_from_tile_named_tile_1_auto_buffer_out_d_bits_denied; 
  wire [63:0] coupler_from_tile_named_tile_1_auto_buffer_out_d_bits_data; 
  wire  coupler_from_tile_named_tile_1_auto_buffer_out_d_bits_corrupt; 
  wire  coupler_from_tile_named_tile_1_auto_buffer_out_e_ready; 
  wire  coupler_from_tile_named_tile_1_auto_buffer_out_e_valid; 
  wire [2:0] coupler_from_tile_named_tile_1_auto_buffer_out_e_bits_sink; 
  wire  coupler_from_tile_named_tile_1_auto_tl_master_xing_in_a_ready; 
  wire  coupler_from_tile_named_tile_1_auto_tl_master_xing_in_a_valid; 
  wire [2:0] coupler_from_tile_named_tile_1_auto_tl_master_xing_in_a_bits_opcode; 
  wire [2:0] coupler_from_tile_named_tile_1_auto_tl_master_xing_in_a_bits_param; 
  wire [2:0] coupler_from_tile_named_tile_1_auto_tl_master_xing_in_a_bits_size; 
  wire [1:0] coupler_from_tile_named_tile_1_auto_tl_master_xing_in_a_bits_source; 
  wire [37:0] coupler_from_tile_named_tile_1_auto_tl_master_xing_in_a_bits_address; 
  wire [7:0] coupler_from_tile_named_tile_1_auto_tl_master_xing_in_a_bits_mask; 
  wire [63:0] coupler_from_tile_named_tile_1_auto_tl_master_xing_in_a_bits_data; 
  wire  coupler_from_tile_named_tile_1_auto_tl_master_xing_in_a_bits_corrupt; 
  wire  coupler_from_tile_named_tile_1_auto_tl_master_xing_in_b_ready; 
  wire  coupler_from_tile_named_tile_1_auto_tl_master_xing_in_b_valid; 
  wire [2:0] coupler_from_tile_named_tile_1_auto_tl_master_xing_in_b_bits_opcode; 
  wire [1:0] coupler_from_tile_named_tile_1_auto_tl_master_xing_in_b_bits_param; 
  wire [2:0] coupler_from_tile_named_tile_1_auto_tl_master_xing_in_b_bits_size; 
  wire [1:0] coupler_from_tile_named_tile_1_auto_tl_master_xing_in_b_bits_source; 
  wire [37:0] coupler_from_tile_named_tile_1_auto_tl_master_xing_in_b_bits_address; 
  wire [7:0] coupler_from_tile_named_tile_1_auto_tl_master_xing_in_b_bits_mask; 
  wire  coupler_from_tile_named_tile_1_auto_tl_master_xing_in_b_bits_corrupt; 
  wire  coupler_from_tile_named_tile_1_auto_tl_master_xing_in_c_ready; 
  wire  coupler_from_tile_named_tile_1_auto_tl_master_xing_in_c_valid; 
  wire [2:0] coupler_from_tile_named_tile_1_auto_tl_master_xing_in_c_bits_opcode; 
  wire [2:0] coupler_from_tile_named_tile_1_auto_tl_master_xing_in_c_bits_param; 
  wire [2:0] coupler_from_tile_named_tile_1_auto_tl_master_xing_in_c_bits_size; 
  wire [1:0] coupler_from_tile_named_tile_1_auto_tl_master_xing_in_c_bits_source; 
  wire [37:0] coupler_from_tile_named_tile_1_auto_tl_master_xing_in_c_bits_address; 
  wire [63:0] coupler_from_tile_named_tile_1_auto_tl_master_xing_in_c_bits_data; 
  wire  coupler_from_tile_named_tile_1_auto_tl_master_xing_in_c_bits_corrupt; 
  wire  coupler_from_tile_named_tile_1_auto_tl_master_xing_in_d_ready; 
  wire  coupler_from_tile_named_tile_1_auto_tl_master_xing_in_d_valid; 
  wire [2:0] coupler_from_tile_named_tile_1_auto_tl_master_xing_in_d_bits_opcode; 
  wire [1:0] coupler_from_tile_named_tile_1_auto_tl_master_xing_in_d_bits_param; 
  wire [2:0] coupler_from_tile_named_tile_1_auto_tl_master_xing_in_d_bits_size; 
  wire [1:0] coupler_from_tile_named_tile_1_auto_tl_master_xing_in_d_bits_source; 
  wire [2:0] coupler_from_tile_named_tile_1_auto_tl_master_xing_in_d_bits_sink; 
  wire  coupler_from_tile_named_tile_1_auto_tl_master_xing_in_d_bits_denied; 
  wire [63:0] coupler_from_tile_named_tile_1_auto_tl_master_xing_in_d_bits_data; 
  wire  coupler_from_tile_named_tile_1_auto_tl_master_xing_in_d_bits_corrupt; 
  wire  coupler_from_tile_named_tile_1_auto_tl_master_xing_in_e_ready; 
  wire  coupler_from_tile_named_tile_1_auto_tl_master_xing_in_e_valid; 
  wire [2:0] coupler_from_tile_named_tile_1_auto_tl_master_xing_in_e_bits_sink; 
  wire  coupler_from_tile_named_tile_2_clock; 
  wire  coupler_from_tile_named_tile_2_reset; 
  wire  coupler_from_tile_named_tile_2_auto_buffer_out_a_ready; 
  wire  coupler_from_tile_named_tile_2_auto_buffer_out_a_valid; 
  wire [2:0] coupler_from_tile_named_tile_2_auto_buffer_out_a_bits_opcode; 
  wire [2:0] coupler_from_tile_named_tile_2_auto_buffer_out_a_bits_param; 
  wire [2:0] coupler_from_tile_named_tile_2_auto_buffer_out_a_bits_size; 
  wire [1:0] coupler_from_tile_named_tile_2_auto_buffer_out_a_bits_source; 
  wire [37:0] coupler_from_tile_named_tile_2_auto_buffer_out_a_bits_address; 
  wire [7:0] coupler_from_tile_named_tile_2_auto_buffer_out_a_bits_mask; 
  wire [63:0] coupler_from_tile_named_tile_2_auto_buffer_out_a_bits_data; 
  wire  coupler_from_tile_named_tile_2_auto_buffer_out_a_bits_corrupt; 
  wire  coupler_from_tile_named_tile_2_auto_buffer_out_b_ready; 
  wire  coupler_from_tile_named_tile_2_auto_buffer_out_b_valid; 
  wire [2:0] coupler_from_tile_named_tile_2_auto_buffer_out_b_bits_opcode; 
  wire [1:0] coupler_from_tile_named_tile_2_auto_buffer_out_b_bits_param; 
  wire [2:0] coupler_from_tile_named_tile_2_auto_buffer_out_b_bits_size; 
  wire [1:0] coupler_from_tile_named_tile_2_auto_buffer_out_b_bits_source; 
  wire [37:0] coupler_from_tile_named_tile_2_auto_buffer_out_b_bits_address; 
  wire [7:0] coupler_from_tile_named_tile_2_auto_buffer_out_b_bits_mask; 
  wire  coupler_from_tile_named_tile_2_auto_buffer_out_b_bits_corrupt; 
  wire  coupler_from_tile_named_tile_2_auto_buffer_out_c_ready; 
  wire  coupler_from_tile_named_tile_2_auto_buffer_out_c_valid; 
  wire [2:0] coupler_from_tile_named_tile_2_auto_buffer_out_c_bits_opcode; 
  wire [2:0] coupler_from_tile_named_tile_2_auto_buffer_out_c_bits_param; 
  wire [2:0] coupler_from_tile_named_tile_2_auto_buffer_out_c_bits_size; 
  wire [1:0] coupler_from_tile_named_tile_2_auto_buffer_out_c_bits_source; 
  wire [37:0] coupler_from_tile_named_tile_2_auto_buffer_out_c_bits_address; 
  wire [63:0] coupler_from_tile_named_tile_2_auto_buffer_out_c_bits_data; 
  wire  coupler_from_tile_named_tile_2_auto_buffer_out_c_bits_corrupt; 
  wire  coupler_from_tile_named_tile_2_auto_buffer_out_d_ready; 
  wire  coupler_from_tile_named_tile_2_auto_buffer_out_d_valid; 
  wire [2:0] coupler_from_tile_named_tile_2_auto_buffer_out_d_bits_opcode; 
  wire [1:0] coupler_from_tile_named_tile_2_auto_buffer_out_d_bits_param; 
  wire [2:0] coupler_from_tile_named_tile_2_auto_buffer_out_d_bits_size; 
  wire [1:0] coupler_from_tile_named_tile_2_auto_buffer_out_d_bits_source; 
  wire [2:0] coupler_from_tile_named_tile_2_auto_buffer_out_d_bits_sink; 
  wire  coupler_from_tile_named_tile_2_auto_buffer_out_d_bits_denied; 
  wire [63:0] coupler_from_tile_named_tile_2_auto_buffer_out_d_bits_data; 
  wire  coupler_from_tile_named_tile_2_auto_buffer_out_d_bits_corrupt; 
  wire  coupler_from_tile_named_tile_2_auto_buffer_out_e_ready; 
  wire  coupler_from_tile_named_tile_2_auto_buffer_out_e_valid; 
  wire [2:0] coupler_from_tile_named_tile_2_auto_buffer_out_e_bits_sink; 
  wire  coupler_from_tile_named_tile_2_auto_tl_master_xing_in_a_ready; 
  wire  coupler_from_tile_named_tile_2_auto_tl_master_xing_in_a_valid; 
  wire [2:0] coupler_from_tile_named_tile_2_auto_tl_master_xing_in_a_bits_opcode; 
  wire [2:0] coupler_from_tile_named_tile_2_auto_tl_master_xing_in_a_bits_param; 
  wire [2:0] coupler_from_tile_named_tile_2_auto_tl_master_xing_in_a_bits_size; 
  wire [1:0] coupler_from_tile_named_tile_2_auto_tl_master_xing_in_a_bits_source; 
  wire [37:0] coupler_from_tile_named_tile_2_auto_tl_master_xing_in_a_bits_address; 
  wire [7:0] coupler_from_tile_named_tile_2_auto_tl_master_xing_in_a_bits_mask; 
  wire [63:0] coupler_from_tile_named_tile_2_auto_tl_master_xing_in_a_bits_data; 
  wire  coupler_from_tile_named_tile_2_auto_tl_master_xing_in_a_bits_corrupt; 
  wire  coupler_from_tile_named_tile_2_auto_tl_master_xing_in_b_ready; 
  wire  coupler_from_tile_named_tile_2_auto_tl_master_xing_in_b_valid; 
  wire [2:0] coupler_from_tile_named_tile_2_auto_tl_master_xing_in_b_bits_opcode; 
  wire [1:0] coupler_from_tile_named_tile_2_auto_tl_master_xing_in_b_bits_param; 
  wire [2:0] coupler_from_tile_named_tile_2_auto_tl_master_xing_in_b_bits_size; 
  wire [1:0] coupler_from_tile_named_tile_2_auto_tl_master_xing_in_b_bits_source; 
  wire [37:0] coupler_from_tile_named_tile_2_auto_tl_master_xing_in_b_bits_address; 
  wire [7:0] coupler_from_tile_named_tile_2_auto_tl_master_xing_in_b_bits_mask; 
  wire  coupler_from_tile_named_tile_2_auto_tl_master_xing_in_b_bits_corrupt; 
  wire  coupler_from_tile_named_tile_2_auto_tl_master_xing_in_c_ready; 
  wire  coupler_from_tile_named_tile_2_auto_tl_master_xing_in_c_valid; 
  wire [2:0] coupler_from_tile_named_tile_2_auto_tl_master_xing_in_c_bits_opcode; 
  wire [2:0] coupler_from_tile_named_tile_2_auto_tl_master_xing_in_c_bits_param; 
  wire [2:0] coupler_from_tile_named_tile_2_auto_tl_master_xing_in_c_bits_size; 
  wire [1:0] coupler_from_tile_named_tile_2_auto_tl_master_xing_in_c_bits_source; 
  wire [37:0] coupler_from_tile_named_tile_2_auto_tl_master_xing_in_c_bits_address; 
  wire [63:0] coupler_from_tile_named_tile_2_auto_tl_master_xing_in_c_bits_data; 
  wire  coupler_from_tile_named_tile_2_auto_tl_master_xing_in_c_bits_corrupt; 
  wire  coupler_from_tile_named_tile_2_auto_tl_master_xing_in_d_ready; 
  wire  coupler_from_tile_named_tile_2_auto_tl_master_xing_in_d_valid; 
  wire [2:0] coupler_from_tile_named_tile_2_auto_tl_master_xing_in_d_bits_opcode; 
  wire [1:0] coupler_from_tile_named_tile_2_auto_tl_master_xing_in_d_bits_param; 
  wire [2:0] coupler_from_tile_named_tile_2_auto_tl_master_xing_in_d_bits_size; 
  wire [1:0] coupler_from_tile_named_tile_2_auto_tl_master_xing_in_d_bits_source; 
  wire [2:0] coupler_from_tile_named_tile_2_auto_tl_master_xing_in_d_bits_sink; 
  wire  coupler_from_tile_named_tile_2_auto_tl_master_xing_in_d_bits_denied; 
  wire [63:0] coupler_from_tile_named_tile_2_auto_tl_master_xing_in_d_bits_data; 
  wire  coupler_from_tile_named_tile_2_auto_tl_master_xing_in_d_bits_corrupt; 
  wire  coupler_from_tile_named_tile_2_auto_tl_master_xing_in_e_ready; 
  wire  coupler_from_tile_named_tile_2_auto_tl_master_xing_in_e_valid; 
  wire [2:0] coupler_from_tile_named_tile_2_auto_tl_master_xing_in_e_bits_sink; 
  wire  coupler_from_tile_named_tile_3_clock; 
  wire  coupler_from_tile_named_tile_3_reset; 
  wire  coupler_from_tile_named_tile_3_auto_buffer_out_a_ready; 
  wire  coupler_from_tile_named_tile_3_auto_buffer_out_a_valid; 
  wire [2:0] coupler_from_tile_named_tile_3_auto_buffer_out_a_bits_opcode; 
  wire [2:0] coupler_from_tile_named_tile_3_auto_buffer_out_a_bits_param; 
  wire [2:0] coupler_from_tile_named_tile_3_auto_buffer_out_a_bits_size; 
  wire [1:0] coupler_from_tile_named_tile_3_auto_buffer_out_a_bits_source; 
  wire [37:0] coupler_from_tile_named_tile_3_auto_buffer_out_a_bits_address; 
  wire [7:0] coupler_from_tile_named_tile_3_auto_buffer_out_a_bits_mask; 
  wire [63:0] coupler_from_tile_named_tile_3_auto_buffer_out_a_bits_data; 
  wire  coupler_from_tile_named_tile_3_auto_buffer_out_a_bits_corrupt; 
  wire  coupler_from_tile_named_tile_3_auto_buffer_out_b_ready; 
  wire  coupler_from_tile_named_tile_3_auto_buffer_out_b_valid; 
  wire [2:0] coupler_from_tile_named_tile_3_auto_buffer_out_b_bits_opcode; 
  wire [1:0] coupler_from_tile_named_tile_3_auto_buffer_out_b_bits_param; 
  wire [2:0] coupler_from_tile_named_tile_3_auto_buffer_out_b_bits_size; 
  wire [1:0] coupler_from_tile_named_tile_3_auto_buffer_out_b_bits_source; 
  wire [37:0] coupler_from_tile_named_tile_3_auto_buffer_out_b_bits_address; 
  wire [7:0] coupler_from_tile_named_tile_3_auto_buffer_out_b_bits_mask; 
  wire  coupler_from_tile_named_tile_3_auto_buffer_out_b_bits_corrupt; 
  wire  coupler_from_tile_named_tile_3_auto_buffer_out_c_ready; 
  wire  coupler_from_tile_named_tile_3_auto_buffer_out_c_valid; 
  wire [2:0] coupler_from_tile_named_tile_3_auto_buffer_out_c_bits_opcode; 
  wire [2:0] coupler_from_tile_named_tile_3_auto_buffer_out_c_bits_param; 
  wire [2:0] coupler_from_tile_named_tile_3_auto_buffer_out_c_bits_size; 
  wire [1:0] coupler_from_tile_named_tile_3_auto_buffer_out_c_bits_source; 
  wire [37:0] coupler_from_tile_named_tile_3_auto_buffer_out_c_bits_address; 
  wire [63:0] coupler_from_tile_named_tile_3_auto_buffer_out_c_bits_data; 
  wire  coupler_from_tile_named_tile_3_auto_buffer_out_c_bits_corrupt; 
  wire  coupler_from_tile_named_tile_3_auto_buffer_out_d_ready; 
  wire  coupler_from_tile_named_tile_3_auto_buffer_out_d_valid; 
  wire [2:0] coupler_from_tile_named_tile_3_auto_buffer_out_d_bits_opcode; 
  wire [1:0] coupler_from_tile_named_tile_3_auto_buffer_out_d_bits_param; 
  wire [2:0] coupler_from_tile_named_tile_3_auto_buffer_out_d_bits_size; 
  wire [1:0] coupler_from_tile_named_tile_3_auto_buffer_out_d_bits_source; 
  wire [2:0] coupler_from_tile_named_tile_3_auto_buffer_out_d_bits_sink; 
  wire  coupler_from_tile_named_tile_3_auto_buffer_out_d_bits_denied; 
  wire [63:0] coupler_from_tile_named_tile_3_auto_buffer_out_d_bits_data; 
  wire  coupler_from_tile_named_tile_3_auto_buffer_out_d_bits_corrupt; 
  wire  coupler_from_tile_named_tile_3_auto_buffer_out_e_ready; 
  wire  coupler_from_tile_named_tile_3_auto_buffer_out_e_valid; 
  wire [2:0] coupler_from_tile_named_tile_3_auto_buffer_out_e_bits_sink; 
  wire  coupler_from_tile_named_tile_3_auto_tl_master_xing_in_a_ready; 
  wire  coupler_from_tile_named_tile_3_auto_tl_master_xing_in_a_valid; 
  wire [2:0] coupler_from_tile_named_tile_3_auto_tl_master_xing_in_a_bits_opcode; 
  wire [2:0] coupler_from_tile_named_tile_3_auto_tl_master_xing_in_a_bits_param; 
  wire [2:0] coupler_from_tile_named_tile_3_auto_tl_master_xing_in_a_bits_size; 
  wire [1:0] coupler_from_tile_named_tile_3_auto_tl_master_xing_in_a_bits_source; 
  wire [37:0] coupler_from_tile_named_tile_3_auto_tl_master_xing_in_a_bits_address; 
  wire [7:0] coupler_from_tile_named_tile_3_auto_tl_master_xing_in_a_bits_mask; 
  wire [63:0] coupler_from_tile_named_tile_3_auto_tl_master_xing_in_a_bits_data; 
  wire  coupler_from_tile_named_tile_3_auto_tl_master_xing_in_a_bits_corrupt; 
  wire  coupler_from_tile_named_tile_3_auto_tl_master_xing_in_b_ready; 
  wire  coupler_from_tile_named_tile_3_auto_tl_master_xing_in_b_valid; 
  wire [2:0] coupler_from_tile_named_tile_3_auto_tl_master_xing_in_b_bits_opcode; 
  wire [1:0] coupler_from_tile_named_tile_3_auto_tl_master_xing_in_b_bits_param; 
  wire [2:0] coupler_from_tile_named_tile_3_auto_tl_master_xing_in_b_bits_size; 
  wire [1:0] coupler_from_tile_named_tile_3_auto_tl_master_xing_in_b_bits_source; 
  wire [37:0] coupler_from_tile_named_tile_3_auto_tl_master_xing_in_b_bits_address; 
  wire [7:0] coupler_from_tile_named_tile_3_auto_tl_master_xing_in_b_bits_mask; 
  wire  coupler_from_tile_named_tile_3_auto_tl_master_xing_in_b_bits_corrupt; 
  wire  coupler_from_tile_named_tile_3_auto_tl_master_xing_in_c_ready; 
  wire  coupler_from_tile_named_tile_3_auto_tl_master_xing_in_c_valid; 
  wire [2:0] coupler_from_tile_named_tile_3_auto_tl_master_xing_in_c_bits_opcode; 
  wire [2:0] coupler_from_tile_named_tile_3_auto_tl_master_xing_in_c_bits_param; 
  wire [2:0] coupler_from_tile_named_tile_3_auto_tl_master_xing_in_c_bits_size; 
  wire [1:0] coupler_from_tile_named_tile_3_auto_tl_master_xing_in_c_bits_source; 
  wire [37:0] coupler_from_tile_named_tile_3_auto_tl_master_xing_in_c_bits_address; 
  wire [63:0] coupler_from_tile_named_tile_3_auto_tl_master_xing_in_c_bits_data; 
  wire  coupler_from_tile_named_tile_3_auto_tl_master_xing_in_c_bits_corrupt; 
  wire  coupler_from_tile_named_tile_3_auto_tl_master_xing_in_d_ready; 
  wire  coupler_from_tile_named_tile_3_auto_tl_master_xing_in_d_valid; 
  wire [2:0] coupler_from_tile_named_tile_3_auto_tl_master_xing_in_d_bits_opcode; 
  wire [1:0] coupler_from_tile_named_tile_3_auto_tl_master_xing_in_d_bits_param; 
  wire [2:0] coupler_from_tile_named_tile_3_auto_tl_master_xing_in_d_bits_size; 
  wire [1:0] coupler_from_tile_named_tile_3_auto_tl_master_xing_in_d_bits_source; 
  wire [2:0] coupler_from_tile_named_tile_3_auto_tl_master_xing_in_d_bits_sink; 
  wire  coupler_from_tile_named_tile_3_auto_tl_master_xing_in_d_bits_denied; 
  wire [63:0] coupler_from_tile_named_tile_3_auto_tl_master_xing_in_d_bits_data; 
  wire  coupler_from_tile_named_tile_3_auto_tl_master_xing_in_d_bits_corrupt; 
  wire  coupler_from_tile_named_tile_3_auto_tl_master_xing_in_e_ready; 
  wire  coupler_from_tile_named_tile_3_auto_tl_master_xing_in_e_valid; 
  wire [2:0] coupler_from_tile_named_tile_3_auto_tl_master_xing_in_e_bits_sink; 
  wire  coupler_from_master_named_pcie_0_clock; 
  wire  coupler_from_master_named_pcie_0_reset; 
  wire  coupler_from_master_named_pcie_0_auto_fixer_in_a_ready; 
  wire  coupler_from_master_named_pcie_0_auto_fixer_in_a_valid; 
  wire [2:0] coupler_from_master_named_pcie_0_auto_fixer_in_a_bits_opcode; 
  wire [2:0] coupler_from_master_named_pcie_0_auto_fixer_in_a_bits_param; 
  wire [2:0] coupler_from_master_named_pcie_0_auto_fixer_in_a_bits_size; 
  wire [3:0] coupler_from_master_named_pcie_0_auto_fixer_in_a_bits_source; 
  wire [37:0] coupler_from_master_named_pcie_0_auto_fixer_in_a_bits_address; 
  wire [7:0] coupler_from_master_named_pcie_0_auto_fixer_in_a_bits_mask; 
  wire [63:0] coupler_from_master_named_pcie_0_auto_fixer_in_a_bits_data; 
  wire  coupler_from_master_named_pcie_0_auto_fixer_in_a_bits_corrupt; 
  wire  coupler_from_master_named_pcie_0_auto_fixer_in_d_ready; 
  wire  coupler_from_master_named_pcie_0_auto_fixer_in_d_valid; 
  wire [2:0] coupler_from_master_named_pcie_0_auto_fixer_in_d_bits_opcode; 
  wire [1:0] coupler_from_master_named_pcie_0_auto_fixer_in_d_bits_param; 
  wire [2:0] coupler_from_master_named_pcie_0_auto_fixer_in_d_bits_size; 
  wire [3:0] coupler_from_master_named_pcie_0_auto_fixer_in_d_bits_source; 
  wire [2:0] coupler_from_master_named_pcie_0_auto_fixer_in_d_bits_sink; 
  wire  coupler_from_master_named_pcie_0_auto_fixer_in_d_bits_denied; 
  wire [63:0] coupler_from_master_named_pcie_0_auto_fixer_in_d_bits_data; 
  wire  coupler_from_master_named_pcie_0_auto_fixer_in_d_bits_corrupt; 
  wire  coupler_from_master_named_pcie_0_auto_buffer_out_a_ready; 
  wire  coupler_from_master_named_pcie_0_auto_buffer_out_a_valid; 
  wire [2:0] coupler_from_master_named_pcie_0_auto_buffer_out_a_bits_opcode; 
  wire [2:0] coupler_from_master_named_pcie_0_auto_buffer_out_a_bits_param; 
  wire [2:0] coupler_from_master_named_pcie_0_auto_buffer_out_a_bits_size; 
  wire [3:0] coupler_from_master_named_pcie_0_auto_buffer_out_a_bits_source; 
  wire [37:0] coupler_from_master_named_pcie_0_auto_buffer_out_a_bits_address; 
  wire [7:0] coupler_from_master_named_pcie_0_auto_buffer_out_a_bits_mask; 
  wire [63:0] coupler_from_master_named_pcie_0_auto_buffer_out_a_bits_data; 
  wire  coupler_from_master_named_pcie_0_auto_buffer_out_a_bits_corrupt; 
  wire  coupler_from_master_named_pcie_0_auto_buffer_out_d_ready; 
  wire  coupler_from_master_named_pcie_0_auto_buffer_out_d_valid; 
  wire [2:0] coupler_from_master_named_pcie_0_auto_buffer_out_d_bits_opcode; 
  wire [1:0] coupler_from_master_named_pcie_0_auto_buffer_out_d_bits_param; 
  wire [2:0] coupler_from_master_named_pcie_0_auto_buffer_out_d_bits_size; 
  wire [3:0] coupler_from_master_named_pcie_0_auto_buffer_out_d_bits_source; 
  wire [2:0] coupler_from_master_named_pcie_0_auto_buffer_out_d_bits_sink; 
  wire  coupler_from_master_named_pcie_0_auto_buffer_out_d_bits_denied; 
  wire [63:0] coupler_from_master_named_pcie_0_auto_buffer_out_d_bits_data; 
  wire  coupler_from_master_named_pcie_0_auto_buffer_out_d_bits_corrupt; 
  wire  coupler_to_slave_named_pcie_0_clock; 
  wire  coupler_to_slave_named_pcie_0_reset; 
  wire  coupler_to_slave_named_pcie_0_auto_buffer_in_1_a_ready; 
  wire  coupler_to_slave_named_pcie_0_auto_buffer_in_1_a_valid; 
  wire [2:0] coupler_to_slave_named_pcie_0_auto_buffer_in_1_a_bits_opcode; 
  wire [2:0] coupler_to_slave_named_pcie_0_auto_buffer_in_1_a_bits_param; 
  wire [2:0] coupler_to_slave_named_pcie_0_auto_buffer_in_1_a_bits_size; 
  wire [4:0] coupler_to_slave_named_pcie_0_auto_buffer_in_1_a_bits_source; 
  wire [37:0] coupler_to_slave_named_pcie_0_auto_buffer_in_1_a_bits_address; 
  wire [7:0] coupler_to_slave_named_pcie_0_auto_buffer_in_1_a_bits_mask; 
  wire [63:0] coupler_to_slave_named_pcie_0_auto_buffer_in_1_a_bits_data; 
  wire  coupler_to_slave_named_pcie_0_auto_buffer_in_1_a_bits_corrupt; 
  wire  coupler_to_slave_named_pcie_0_auto_buffer_in_1_d_ready; 
  wire  coupler_to_slave_named_pcie_0_auto_buffer_in_1_d_valid; 
  wire [2:0] coupler_to_slave_named_pcie_0_auto_buffer_in_1_d_bits_opcode; 
  wire [1:0] coupler_to_slave_named_pcie_0_auto_buffer_in_1_d_bits_param; 
  wire [2:0] coupler_to_slave_named_pcie_0_auto_buffer_in_1_d_bits_size; 
  wire [4:0] coupler_to_slave_named_pcie_0_auto_buffer_in_1_d_bits_source; 
  wire  coupler_to_slave_named_pcie_0_auto_buffer_in_1_d_bits_sink; 
  wire  coupler_to_slave_named_pcie_0_auto_buffer_in_1_d_bits_denied; 
  wire [63:0] coupler_to_slave_named_pcie_0_auto_buffer_in_1_d_bits_data; 
  wire  coupler_to_slave_named_pcie_0_auto_buffer_in_1_d_bits_corrupt; 
  wire  coupler_to_slave_named_pcie_0_auto_buffer_in_0_a_ready; 
  wire  coupler_to_slave_named_pcie_0_auto_buffer_in_0_a_valid; 
  wire [2:0] coupler_to_slave_named_pcie_0_auto_buffer_in_0_a_bits_opcode; 
  wire [2:0] coupler_to_slave_named_pcie_0_auto_buffer_in_0_a_bits_param; 
  wire [2:0] coupler_to_slave_named_pcie_0_auto_buffer_in_0_a_bits_size; 
  wire [4:0] coupler_to_slave_named_pcie_0_auto_buffer_in_0_a_bits_source; 
  wire [30:0] coupler_to_slave_named_pcie_0_auto_buffer_in_0_a_bits_address; 
  wire [7:0] coupler_to_slave_named_pcie_0_auto_buffer_in_0_a_bits_mask; 
  wire [63:0] coupler_to_slave_named_pcie_0_auto_buffer_in_0_a_bits_data; 
  wire  coupler_to_slave_named_pcie_0_auto_buffer_in_0_a_bits_corrupt; 
  wire  coupler_to_slave_named_pcie_0_auto_buffer_in_0_d_ready; 
  wire  coupler_to_slave_named_pcie_0_auto_buffer_in_0_d_valid; 
  wire [2:0] coupler_to_slave_named_pcie_0_auto_buffer_in_0_d_bits_opcode; 
  wire [1:0] coupler_to_slave_named_pcie_0_auto_buffer_in_0_d_bits_param; 
  wire [2:0] coupler_to_slave_named_pcie_0_auto_buffer_in_0_d_bits_size; 
  wire [4:0] coupler_to_slave_named_pcie_0_auto_buffer_in_0_d_bits_source; 
  wire  coupler_to_slave_named_pcie_0_auto_buffer_in_0_d_bits_sink; 
  wire  coupler_to_slave_named_pcie_0_auto_buffer_in_0_d_bits_denied; 
  wire [63:0] coupler_to_slave_named_pcie_0_auto_buffer_in_0_d_bits_data; 
  wire  coupler_to_slave_named_pcie_0_auto_buffer_in_0_d_bits_corrupt; 
  wire  coupler_to_slave_named_pcie_0_auto_widget_out_1_a_ready; 
  wire  coupler_to_slave_named_pcie_0_auto_widget_out_1_a_valid; 
  wire [2:0] coupler_to_slave_named_pcie_0_auto_widget_out_1_a_bits_opcode; 
  wire [2:0] coupler_to_slave_named_pcie_0_auto_widget_out_1_a_bits_param; 
  wire [2:0] coupler_to_slave_named_pcie_0_auto_widget_out_1_a_bits_size; 
  wire [4:0] coupler_to_slave_named_pcie_0_auto_widget_out_1_a_bits_source; 
  wire [37:0] coupler_to_slave_named_pcie_0_auto_widget_out_1_a_bits_address; 
  wire [3:0] coupler_to_slave_named_pcie_0_auto_widget_out_1_a_bits_mask; 
  wire [31:0] coupler_to_slave_named_pcie_0_auto_widget_out_1_a_bits_data; 
  wire  coupler_to_slave_named_pcie_0_auto_widget_out_1_a_bits_corrupt; 
  wire  coupler_to_slave_named_pcie_0_auto_widget_out_1_d_ready; 
  wire  coupler_to_slave_named_pcie_0_auto_widget_out_1_d_valid; 
  wire [2:0] coupler_to_slave_named_pcie_0_auto_widget_out_1_d_bits_opcode; 
  wire [1:0] coupler_to_slave_named_pcie_0_auto_widget_out_1_d_bits_param; 
  wire [2:0] coupler_to_slave_named_pcie_0_auto_widget_out_1_d_bits_size; 
  wire [4:0] coupler_to_slave_named_pcie_0_auto_widget_out_1_d_bits_source; 
  wire  coupler_to_slave_named_pcie_0_auto_widget_out_1_d_bits_sink; 
  wire  coupler_to_slave_named_pcie_0_auto_widget_out_1_d_bits_denied; 
  wire [31:0] coupler_to_slave_named_pcie_0_auto_widget_out_1_d_bits_data; 
  wire  coupler_to_slave_named_pcie_0_auto_widget_out_1_d_bits_corrupt; 
  wire  coupler_to_slave_named_pcie_0_auto_widget_out_0_a_ready; 
  wire  coupler_to_slave_named_pcie_0_auto_widget_out_0_a_valid; 
  wire [2:0] coupler_to_slave_named_pcie_0_auto_widget_out_0_a_bits_opcode; 
  wire [2:0] coupler_to_slave_named_pcie_0_auto_widget_out_0_a_bits_param; 
  wire [2:0] coupler_to_slave_named_pcie_0_auto_widget_out_0_a_bits_size; 
  wire [4:0] coupler_to_slave_named_pcie_0_auto_widget_out_0_a_bits_source; 
  wire [30:0] coupler_to_slave_named_pcie_0_auto_widget_out_0_a_bits_address; 
  wire [7:0] coupler_to_slave_named_pcie_0_auto_widget_out_0_a_bits_mask; 
  wire [63:0] coupler_to_slave_named_pcie_0_auto_widget_out_0_a_bits_data; 
  wire  coupler_to_slave_named_pcie_0_auto_widget_out_0_a_bits_corrupt; 
  wire  coupler_to_slave_named_pcie_0_auto_widget_out_0_d_ready; 
  wire  coupler_to_slave_named_pcie_0_auto_widget_out_0_d_valid; 
  wire [2:0] coupler_to_slave_named_pcie_0_auto_widget_out_0_d_bits_opcode; 
  wire [1:0] coupler_to_slave_named_pcie_0_auto_widget_out_0_d_bits_param; 
  wire [2:0] coupler_to_slave_named_pcie_0_auto_widget_out_0_d_bits_size; 
  wire [4:0] coupler_to_slave_named_pcie_0_auto_widget_out_0_d_bits_source; 
  wire  coupler_to_slave_named_pcie_0_auto_widget_out_0_d_bits_sink; 
  wire  coupler_to_slave_named_pcie_0_auto_widget_out_0_d_bits_denied; 
  wire [63:0] coupler_to_slave_named_pcie_0_auto_widget_out_0_d_bits_data; 
  wire  coupler_to_slave_named_pcie_0_auto_widget_out_0_d_bits_corrupt; 
  TLXbar system_bus_xbar ( 
    .clock(system_bus_xbar_clock),
    .reset(system_bus_xbar_reset),
    .auto_in_4_a_ready(system_bus_xbar_auto_in_4_a_ready),
    .auto_in_4_a_valid(system_bus_xbar_auto_in_4_a_valid),
    .auto_in_4_a_bits_opcode(system_bus_xbar_auto_in_4_a_bits_opcode),
    .auto_in_4_a_bits_param(system_bus_xbar_auto_in_4_a_bits_param),
    .auto_in_4_a_bits_size(system_bus_xbar_auto_in_4_a_bits_size),
    .auto_in_4_a_bits_source(system_bus_xbar_auto_in_4_a_bits_source),
    .auto_in_4_a_bits_address(system_bus_xbar_auto_in_4_a_bits_address),
    .auto_in_4_a_bits_mask(system_bus_xbar_auto_in_4_a_bits_mask),
    .auto_in_4_a_bits_data(system_bus_xbar_auto_in_4_a_bits_data),
    .auto_in_4_a_bits_corrupt(system_bus_xbar_auto_in_4_a_bits_corrupt),
    .auto_in_4_d_ready(system_bus_xbar_auto_in_4_d_ready),
    .auto_in_4_d_valid(system_bus_xbar_auto_in_4_d_valid),
    .auto_in_4_d_bits_opcode(system_bus_xbar_auto_in_4_d_bits_opcode),
    .auto_in_4_d_bits_param(system_bus_xbar_auto_in_4_d_bits_param),
    .auto_in_4_d_bits_size(system_bus_xbar_auto_in_4_d_bits_size),
    .auto_in_4_d_bits_source(system_bus_xbar_auto_in_4_d_bits_source),
    .auto_in_4_d_bits_sink(system_bus_xbar_auto_in_4_d_bits_sink),
    .auto_in_4_d_bits_denied(system_bus_xbar_auto_in_4_d_bits_denied),
    .auto_in_4_d_bits_data(system_bus_xbar_auto_in_4_d_bits_data),
    .auto_in_4_d_bits_corrupt(system_bus_xbar_auto_in_4_d_bits_corrupt),
    .auto_in_3_a_ready(system_bus_xbar_auto_in_3_a_ready),
    .auto_in_3_a_valid(system_bus_xbar_auto_in_3_a_valid),
    .auto_in_3_a_bits_opcode(system_bus_xbar_auto_in_3_a_bits_opcode),
    .auto_in_3_a_bits_param(system_bus_xbar_auto_in_3_a_bits_param),
    .auto_in_3_a_bits_size(system_bus_xbar_auto_in_3_a_bits_size),
    .auto_in_3_a_bits_source(system_bus_xbar_auto_in_3_a_bits_source),
    .auto_in_3_a_bits_address(system_bus_xbar_auto_in_3_a_bits_address),
    .auto_in_3_a_bits_mask(system_bus_xbar_auto_in_3_a_bits_mask),
    .auto_in_3_a_bits_data(system_bus_xbar_auto_in_3_a_bits_data),
    .auto_in_3_a_bits_corrupt(system_bus_xbar_auto_in_3_a_bits_corrupt),
    .auto_in_3_b_ready(system_bus_xbar_auto_in_3_b_ready),
    .auto_in_3_b_valid(system_bus_xbar_auto_in_3_b_valid),
    .auto_in_3_b_bits_opcode(system_bus_xbar_auto_in_3_b_bits_opcode),
    .auto_in_3_b_bits_param(system_bus_xbar_auto_in_3_b_bits_param),
    .auto_in_3_b_bits_size(system_bus_xbar_auto_in_3_b_bits_size),
    .auto_in_3_b_bits_source(system_bus_xbar_auto_in_3_b_bits_source),
    .auto_in_3_b_bits_address(system_bus_xbar_auto_in_3_b_bits_address),
    .auto_in_3_b_bits_mask(system_bus_xbar_auto_in_3_b_bits_mask),
    .auto_in_3_b_bits_corrupt(system_bus_xbar_auto_in_3_b_bits_corrupt),
    .auto_in_3_c_ready(system_bus_xbar_auto_in_3_c_ready),
    .auto_in_3_c_valid(system_bus_xbar_auto_in_3_c_valid),
    .auto_in_3_c_bits_opcode(system_bus_xbar_auto_in_3_c_bits_opcode),
    .auto_in_3_c_bits_param(system_bus_xbar_auto_in_3_c_bits_param),
    .auto_in_3_c_bits_size(system_bus_xbar_auto_in_3_c_bits_size),
    .auto_in_3_c_bits_source(system_bus_xbar_auto_in_3_c_bits_source),
    .auto_in_3_c_bits_address(system_bus_xbar_auto_in_3_c_bits_address),
    .auto_in_3_c_bits_data(system_bus_xbar_auto_in_3_c_bits_data),
    .auto_in_3_c_bits_corrupt(system_bus_xbar_auto_in_3_c_bits_corrupt),
    .auto_in_3_d_ready(system_bus_xbar_auto_in_3_d_ready),
    .auto_in_3_d_valid(system_bus_xbar_auto_in_3_d_valid),
    .auto_in_3_d_bits_opcode(system_bus_xbar_auto_in_3_d_bits_opcode),
    .auto_in_3_d_bits_param(system_bus_xbar_auto_in_3_d_bits_param),
    .auto_in_3_d_bits_size(system_bus_xbar_auto_in_3_d_bits_size),
    .auto_in_3_d_bits_source(system_bus_xbar_auto_in_3_d_bits_source),
    .auto_in_3_d_bits_sink(system_bus_xbar_auto_in_3_d_bits_sink),
    .auto_in_3_d_bits_denied(system_bus_xbar_auto_in_3_d_bits_denied),
    .auto_in_3_d_bits_data(system_bus_xbar_auto_in_3_d_bits_data),
    .auto_in_3_d_bits_corrupt(system_bus_xbar_auto_in_3_d_bits_corrupt),
    .auto_in_3_e_ready(system_bus_xbar_auto_in_3_e_ready),
    .auto_in_3_e_valid(system_bus_xbar_auto_in_3_e_valid),
    .auto_in_3_e_bits_sink(system_bus_xbar_auto_in_3_e_bits_sink),
    .auto_in_2_a_ready(system_bus_xbar_auto_in_2_a_ready),
    .auto_in_2_a_valid(system_bus_xbar_auto_in_2_a_valid),
    .auto_in_2_a_bits_opcode(system_bus_xbar_auto_in_2_a_bits_opcode),
    .auto_in_2_a_bits_param(system_bus_xbar_auto_in_2_a_bits_param),
    .auto_in_2_a_bits_size(system_bus_xbar_auto_in_2_a_bits_size),
    .auto_in_2_a_bits_source(system_bus_xbar_auto_in_2_a_bits_source),
    .auto_in_2_a_bits_address(system_bus_xbar_auto_in_2_a_bits_address),
    .auto_in_2_a_bits_mask(system_bus_xbar_auto_in_2_a_bits_mask),
    .auto_in_2_a_bits_data(system_bus_xbar_auto_in_2_a_bits_data),
    .auto_in_2_a_bits_corrupt(system_bus_xbar_auto_in_2_a_bits_corrupt),
    .auto_in_2_b_ready(system_bus_xbar_auto_in_2_b_ready),
    .auto_in_2_b_valid(system_bus_xbar_auto_in_2_b_valid),
    .auto_in_2_b_bits_opcode(system_bus_xbar_auto_in_2_b_bits_opcode),
    .auto_in_2_b_bits_param(system_bus_xbar_auto_in_2_b_bits_param),
    .auto_in_2_b_bits_size(system_bus_xbar_auto_in_2_b_bits_size),
    .auto_in_2_b_bits_source(system_bus_xbar_auto_in_2_b_bits_source),
    .auto_in_2_b_bits_address(system_bus_xbar_auto_in_2_b_bits_address),
    .auto_in_2_b_bits_mask(system_bus_xbar_auto_in_2_b_bits_mask),
    .auto_in_2_b_bits_corrupt(system_bus_xbar_auto_in_2_b_bits_corrupt),
    .auto_in_2_c_ready(system_bus_xbar_auto_in_2_c_ready),
    .auto_in_2_c_valid(system_bus_xbar_auto_in_2_c_valid),
    .auto_in_2_c_bits_opcode(system_bus_xbar_auto_in_2_c_bits_opcode),
    .auto_in_2_c_bits_param(system_bus_xbar_auto_in_2_c_bits_param),
    .auto_in_2_c_bits_size(system_bus_xbar_auto_in_2_c_bits_size),
    .auto_in_2_c_bits_source(system_bus_xbar_auto_in_2_c_bits_source),
    .auto_in_2_c_bits_address(system_bus_xbar_auto_in_2_c_bits_address),
    .auto_in_2_c_bits_data(system_bus_xbar_auto_in_2_c_bits_data),
    .auto_in_2_c_bits_corrupt(system_bus_xbar_auto_in_2_c_bits_corrupt),
    .auto_in_2_d_ready(system_bus_xbar_auto_in_2_d_ready),
    .auto_in_2_d_valid(system_bus_xbar_auto_in_2_d_valid),
    .auto_in_2_d_bits_opcode(system_bus_xbar_auto_in_2_d_bits_opcode),
    .auto_in_2_d_bits_param(system_bus_xbar_auto_in_2_d_bits_param),
    .auto_in_2_d_bits_size(system_bus_xbar_auto_in_2_d_bits_size),
    .auto_in_2_d_bits_source(system_bus_xbar_auto_in_2_d_bits_source),
    .auto_in_2_d_bits_sink(system_bus_xbar_auto_in_2_d_bits_sink),
    .auto_in_2_d_bits_denied(system_bus_xbar_auto_in_2_d_bits_denied),
    .auto_in_2_d_bits_data(system_bus_xbar_auto_in_2_d_bits_data),
    .auto_in_2_d_bits_corrupt(system_bus_xbar_auto_in_2_d_bits_corrupt),
    .auto_in_2_e_ready(system_bus_xbar_auto_in_2_e_ready),
    .auto_in_2_e_valid(system_bus_xbar_auto_in_2_e_valid),
    .auto_in_2_e_bits_sink(system_bus_xbar_auto_in_2_e_bits_sink),
    .auto_in_1_a_ready(system_bus_xbar_auto_in_1_a_ready),
    .auto_in_1_a_valid(system_bus_xbar_auto_in_1_a_valid),
    .auto_in_1_a_bits_opcode(system_bus_xbar_auto_in_1_a_bits_opcode),
    .auto_in_1_a_bits_param(system_bus_xbar_auto_in_1_a_bits_param),
    .auto_in_1_a_bits_size(system_bus_xbar_auto_in_1_a_bits_size),
    .auto_in_1_a_bits_source(system_bus_xbar_auto_in_1_a_bits_source),
    .auto_in_1_a_bits_address(system_bus_xbar_auto_in_1_a_bits_address),
    .auto_in_1_a_bits_mask(system_bus_xbar_auto_in_1_a_bits_mask),
    .auto_in_1_a_bits_data(system_bus_xbar_auto_in_1_a_bits_data),
    .auto_in_1_a_bits_corrupt(system_bus_xbar_auto_in_1_a_bits_corrupt),
    .auto_in_1_b_ready(system_bus_xbar_auto_in_1_b_ready),
    .auto_in_1_b_valid(system_bus_xbar_auto_in_1_b_valid),
    .auto_in_1_b_bits_opcode(system_bus_xbar_auto_in_1_b_bits_opcode),
    .auto_in_1_b_bits_param(system_bus_xbar_auto_in_1_b_bits_param),
    .auto_in_1_b_bits_size(system_bus_xbar_auto_in_1_b_bits_size),
    .auto_in_1_b_bits_source(system_bus_xbar_auto_in_1_b_bits_source),
    .auto_in_1_b_bits_address(system_bus_xbar_auto_in_1_b_bits_address),
    .auto_in_1_b_bits_mask(system_bus_xbar_auto_in_1_b_bits_mask),
    .auto_in_1_b_bits_corrupt(system_bus_xbar_auto_in_1_b_bits_corrupt),
    .auto_in_1_c_ready(system_bus_xbar_auto_in_1_c_ready),
    .auto_in_1_c_valid(system_bus_xbar_auto_in_1_c_valid),
    .auto_in_1_c_bits_opcode(system_bus_xbar_auto_in_1_c_bits_opcode),
    .auto_in_1_c_bits_param(system_bus_xbar_auto_in_1_c_bits_param),
    .auto_in_1_c_bits_size(system_bus_xbar_auto_in_1_c_bits_size),
    .auto_in_1_c_bits_source(system_bus_xbar_auto_in_1_c_bits_source),
    .auto_in_1_c_bits_address(system_bus_xbar_auto_in_1_c_bits_address),
    .auto_in_1_c_bits_data(system_bus_xbar_auto_in_1_c_bits_data),
    .auto_in_1_c_bits_corrupt(system_bus_xbar_auto_in_1_c_bits_corrupt),
    .auto_in_1_d_ready(system_bus_xbar_auto_in_1_d_ready),
    .auto_in_1_d_valid(system_bus_xbar_auto_in_1_d_valid),
    .auto_in_1_d_bits_opcode(system_bus_xbar_auto_in_1_d_bits_opcode),
    .auto_in_1_d_bits_param(system_bus_xbar_auto_in_1_d_bits_param),
    .auto_in_1_d_bits_size(system_bus_xbar_auto_in_1_d_bits_size),
    .auto_in_1_d_bits_source(system_bus_xbar_auto_in_1_d_bits_source),
    .auto_in_1_d_bits_sink(system_bus_xbar_auto_in_1_d_bits_sink),
    .auto_in_1_d_bits_denied(system_bus_xbar_auto_in_1_d_bits_denied),
    .auto_in_1_d_bits_data(system_bus_xbar_auto_in_1_d_bits_data),
    .auto_in_1_d_bits_corrupt(system_bus_xbar_auto_in_1_d_bits_corrupt),
    .auto_in_1_e_ready(system_bus_xbar_auto_in_1_e_ready),
    .auto_in_1_e_valid(system_bus_xbar_auto_in_1_e_valid),
    .auto_in_1_e_bits_sink(system_bus_xbar_auto_in_1_e_bits_sink),
    .auto_in_0_a_ready(system_bus_xbar_auto_in_0_a_ready),
    .auto_in_0_a_valid(system_bus_xbar_auto_in_0_a_valid),
    .auto_in_0_a_bits_opcode(system_bus_xbar_auto_in_0_a_bits_opcode),
    .auto_in_0_a_bits_param(system_bus_xbar_auto_in_0_a_bits_param),
    .auto_in_0_a_bits_size(system_bus_xbar_auto_in_0_a_bits_size),
    .auto_in_0_a_bits_source(system_bus_xbar_auto_in_0_a_bits_source),
    .auto_in_0_a_bits_address(system_bus_xbar_auto_in_0_a_bits_address),
    .auto_in_0_a_bits_mask(system_bus_xbar_auto_in_0_a_bits_mask),
    .auto_in_0_a_bits_data(system_bus_xbar_auto_in_0_a_bits_data),
    .auto_in_0_a_bits_corrupt(system_bus_xbar_auto_in_0_a_bits_corrupt),
    .auto_in_0_b_ready(system_bus_xbar_auto_in_0_b_ready),
    .auto_in_0_b_valid(system_bus_xbar_auto_in_0_b_valid),
    .auto_in_0_b_bits_opcode(system_bus_xbar_auto_in_0_b_bits_opcode),
    .auto_in_0_b_bits_param(system_bus_xbar_auto_in_0_b_bits_param),
    .auto_in_0_b_bits_size(system_bus_xbar_auto_in_0_b_bits_size),
    .auto_in_0_b_bits_source(system_bus_xbar_auto_in_0_b_bits_source),
    .auto_in_0_b_bits_address(system_bus_xbar_auto_in_0_b_bits_address),
    .auto_in_0_b_bits_mask(system_bus_xbar_auto_in_0_b_bits_mask),
    .auto_in_0_b_bits_corrupt(system_bus_xbar_auto_in_0_b_bits_corrupt),
    .auto_in_0_c_ready(system_bus_xbar_auto_in_0_c_ready),
    .auto_in_0_c_valid(system_bus_xbar_auto_in_0_c_valid),
    .auto_in_0_c_bits_opcode(system_bus_xbar_auto_in_0_c_bits_opcode),
    .auto_in_0_c_bits_param(system_bus_xbar_auto_in_0_c_bits_param),
    .auto_in_0_c_bits_size(system_bus_xbar_auto_in_0_c_bits_size),
    .auto_in_0_c_bits_source(system_bus_xbar_auto_in_0_c_bits_source),
    .auto_in_0_c_bits_address(system_bus_xbar_auto_in_0_c_bits_address),
    .auto_in_0_c_bits_data(system_bus_xbar_auto_in_0_c_bits_data),
    .auto_in_0_c_bits_corrupt(system_bus_xbar_auto_in_0_c_bits_corrupt),
    .auto_in_0_d_ready(system_bus_xbar_auto_in_0_d_ready),
    .auto_in_0_d_valid(system_bus_xbar_auto_in_0_d_valid),
    .auto_in_0_d_bits_opcode(system_bus_xbar_auto_in_0_d_bits_opcode),
    .auto_in_0_d_bits_param(system_bus_xbar_auto_in_0_d_bits_param),
    .auto_in_0_d_bits_size(system_bus_xbar_auto_in_0_d_bits_size),
    .auto_in_0_d_bits_source(system_bus_xbar_auto_in_0_d_bits_source),
    .auto_in_0_d_bits_sink(system_bus_xbar_auto_in_0_d_bits_sink),
    .auto_in_0_d_bits_denied(system_bus_xbar_auto_in_0_d_bits_denied),
    .auto_in_0_d_bits_data(system_bus_xbar_auto_in_0_d_bits_data),
    .auto_in_0_d_bits_corrupt(system_bus_xbar_auto_in_0_d_bits_corrupt),
    .auto_in_0_e_ready(system_bus_xbar_auto_in_0_e_ready),
    .auto_in_0_e_valid(system_bus_xbar_auto_in_0_e_valid),
    .auto_in_0_e_bits_sink(system_bus_xbar_auto_in_0_e_bits_sink),
    .auto_out_4_a_ready(system_bus_xbar_auto_out_4_a_ready),
    .auto_out_4_a_valid(system_bus_xbar_auto_out_4_a_valid),
    .auto_out_4_a_bits_opcode(system_bus_xbar_auto_out_4_a_bits_opcode),
    .auto_out_4_a_bits_param(system_bus_xbar_auto_out_4_a_bits_param),
    .auto_out_4_a_bits_size(system_bus_xbar_auto_out_4_a_bits_size),
    .auto_out_4_a_bits_source(system_bus_xbar_auto_out_4_a_bits_source),
    .auto_out_4_a_bits_address(system_bus_xbar_auto_out_4_a_bits_address),
    .auto_out_4_a_bits_mask(system_bus_xbar_auto_out_4_a_bits_mask),
    .auto_out_4_a_bits_data(system_bus_xbar_auto_out_4_a_bits_data),
    .auto_out_4_a_bits_corrupt(system_bus_xbar_auto_out_4_a_bits_corrupt),
    .auto_out_4_d_ready(system_bus_xbar_auto_out_4_d_ready),
    .auto_out_4_d_valid(system_bus_xbar_auto_out_4_d_valid),
    .auto_out_4_d_bits_opcode(system_bus_xbar_auto_out_4_d_bits_opcode),
    .auto_out_4_d_bits_param(system_bus_xbar_auto_out_4_d_bits_param),
    .auto_out_4_d_bits_size(system_bus_xbar_auto_out_4_d_bits_size),
    .auto_out_4_d_bits_source(system_bus_xbar_auto_out_4_d_bits_source),
    .auto_out_4_d_bits_sink(system_bus_xbar_auto_out_4_d_bits_sink),
    .auto_out_4_d_bits_denied(system_bus_xbar_auto_out_4_d_bits_denied),
    .auto_out_4_d_bits_data(system_bus_xbar_auto_out_4_d_bits_data),
    .auto_out_4_d_bits_corrupt(system_bus_xbar_auto_out_4_d_bits_corrupt),
    .auto_out_3_a_ready(system_bus_xbar_auto_out_3_a_ready),
    .auto_out_3_a_valid(system_bus_xbar_auto_out_3_a_valid),
    .auto_out_3_a_bits_opcode(system_bus_xbar_auto_out_3_a_bits_opcode),
    .auto_out_3_a_bits_param(system_bus_xbar_auto_out_3_a_bits_param),
    .auto_out_3_a_bits_size(system_bus_xbar_auto_out_3_a_bits_size),
    .auto_out_3_a_bits_source(system_bus_xbar_auto_out_3_a_bits_source),
    .auto_out_3_a_bits_address(system_bus_xbar_auto_out_3_a_bits_address),
    .auto_out_3_a_bits_mask(system_bus_xbar_auto_out_3_a_bits_mask),
    .auto_out_3_a_bits_data(system_bus_xbar_auto_out_3_a_bits_data),
    .auto_out_3_a_bits_corrupt(system_bus_xbar_auto_out_3_a_bits_corrupt),
    .auto_out_3_d_ready(system_bus_xbar_auto_out_3_d_ready),
    .auto_out_3_d_valid(system_bus_xbar_auto_out_3_d_valid),
    .auto_out_3_d_bits_opcode(system_bus_xbar_auto_out_3_d_bits_opcode),
    .auto_out_3_d_bits_param(system_bus_xbar_auto_out_3_d_bits_param),
    .auto_out_3_d_bits_size(system_bus_xbar_auto_out_3_d_bits_size),
    .auto_out_3_d_bits_source(system_bus_xbar_auto_out_3_d_bits_source),
    .auto_out_3_d_bits_sink(system_bus_xbar_auto_out_3_d_bits_sink),
    .auto_out_3_d_bits_denied(system_bus_xbar_auto_out_3_d_bits_denied),
    .auto_out_3_d_bits_data(system_bus_xbar_auto_out_3_d_bits_data),
    .auto_out_3_d_bits_corrupt(system_bus_xbar_auto_out_3_d_bits_corrupt),
    .auto_out_2_a_ready(system_bus_xbar_auto_out_2_a_ready),
    .auto_out_2_a_valid(system_bus_xbar_auto_out_2_a_valid),
    .auto_out_2_a_bits_opcode(system_bus_xbar_auto_out_2_a_bits_opcode),
    .auto_out_2_a_bits_param(system_bus_xbar_auto_out_2_a_bits_param),
    .auto_out_2_a_bits_size(system_bus_xbar_auto_out_2_a_bits_size),
    .auto_out_2_a_bits_source(system_bus_xbar_auto_out_2_a_bits_source),
    .auto_out_2_a_bits_address(system_bus_xbar_auto_out_2_a_bits_address),
    .auto_out_2_a_bits_mask(system_bus_xbar_auto_out_2_a_bits_mask),
    .auto_out_2_a_bits_data(system_bus_xbar_auto_out_2_a_bits_data),
    .auto_out_2_a_bits_corrupt(system_bus_xbar_auto_out_2_a_bits_corrupt),
    .auto_out_2_b_ready(system_bus_xbar_auto_out_2_b_ready),
    .auto_out_2_b_valid(system_bus_xbar_auto_out_2_b_valid),
    .auto_out_2_b_bits_param(system_bus_xbar_auto_out_2_b_bits_param),
    .auto_out_2_b_bits_source(system_bus_xbar_auto_out_2_b_bits_source),
    .auto_out_2_b_bits_address(system_bus_xbar_auto_out_2_b_bits_address),
    .auto_out_2_c_ready(system_bus_xbar_auto_out_2_c_ready),
    .auto_out_2_c_valid(system_bus_xbar_auto_out_2_c_valid),
    .auto_out_2_c_bits_opcode(system_bus_xbar_auto_out_2_c_bits_opcode),
    .auto_out_2_c_bits_param(system_bus_xbar_auto_out_2_c_bits_param),
    .auto_out_2_c_bits_size(system_bus_xbar_auto_out_2_c_bits_size),
    .auto_out_2_c_bits_source(system_bus_xbar_auto_out_2_c_bits_source),
    .auto_out_2_c_bits_address(system_bus_xbar_auto_out_2_c_bits_address),
    .auto_out_2_c_bits_data(system_bus_xbar_auto_out_2_c_bits_data),
    .auto_out_2_c_bits_corrupt(system_bus_xbar_auto_out_2_c_bits_corrupt),
    .auto_out_2_d_ready(system_bus_xbar_auto_out_2_d_ready),
    .auto_out_2_d_valid(system_bus_xbar_auto_out_2_d_valid),
    .auto_out_2_d_bits_opcode(system_bus_xbar_auto_out_2_d_bits_opcode),
    .auto_out_2_d_bits_param(system_bus_xbar_auto_out_2_d_bits_param),
    .auto_out_2_d_bits_size(system_bus_xbar_auto_out_2_d_bits_size),
    .auto_out_2_d_bits_source(system_bus_xbar_auto_out_2_d_bits_source),
    .auto_out_2_d_bits_sink(system_bus_xbar_auto_out_2_d_bits_sink),
    .auto_out_2_d_bits_denied(system_bus_xbar_auto_out_2_d_bits_denied),
    .auto_out_2_d_bits_data(system_bus_xbar_auto_out_2_d_bits_data),
    .auto_out_2_d_bits_corrupt(system_bus_xbar_auto_out_2_d_bits_corrupt),
    .auto_out_2_e_valid(system_bus_xbar_auto_out_2_e_valid),
    .auto_out_2_e_bits_sink(system_bus_xbar_auto_out_2_e_bits_sink),
    .auto_out_1_a_ready(system_bus_xbar_auto_out_1_a_ready),
    .auto_out_1_a_valid(system_bus_xbar_auto_out_1_a_valid),
    .auto_out_1_a_bits_opcode(system_bus_xbar_auto_out_1_a_bits_opcode),
    .auto_out_1_a_bits_param(system_bus_xbar_auto_out_1_a_bits_param),
    .auto_out_1_a_bits_size(system_bus_xbar_auto_out_1_a_bits_size),
    .auto_out_1_a_bits_source(system_bus_xbar_auto_out_1_a_bits_source),
    .auto_out_1_a_bits_address(system_bus_xbar_auto_out_1_a_bits_address),
    .auto_out_1_a_bits_mask(system_bus_xbar_auto_out_1_a_bits_mask),
    .auto_out_1_a_bits_corrupt(system_bus_xbar_auto_out_1_a_bits_corrupt),
    .auto_out_1_b_ready(system_bus_xbar_auto_out_1_b_ready),
    .auto_out_1_b_valid(system_bus_xbar_auto_out_1_b_valid),
    .auto_out_1_b_bits_opcode(system_bus_xbar_auto_out_1_b_bits_opcode),
    .auto_out_1_b_bits_param(system_bus_xbar_auto_out_1_b_bits_param),
    .auto_out_1_b_bits_size(system_bus_xbar_auto_out_1_b_bits_size),
    .auto_out_1_b_bits_source(system_bus_xbar_auto_out_1_b_bits_source),
    .auto_out_1_b_bits_address(system_bus_xbar_auto_out_1_b_bits_address),
    .auto_out_1_b_bits_mask(system_bus_xbar_auto_out_1_b_bits_mask),
    .auto_out_1_b_bits_data(system_bus_xbar_auto_out_1_b_bits_data),
    .auto_out_1_b_bits_corrupt(system_bus_xbar_auto_out_1_b_bits_corrupt),
    .auto_out_1_c_ready(system_bus_xbar_auto_out_1_c_ready),
    .auto_out_1_c_valid(system_bus_xbar_auto_out_1_c_valid),
    .auto_out_1_c_bits_opcode(system_bus_xbar_auto_out_1_c_bits_opcode),
    .auto_out_1_c_bits_param(system_bus_xbar_auto_out_1_c_bits_param),
    .auto_out_1_c_bits_size(system_bus_xbar_auto_out_1_c_bits_size),
    .auto_out_1_c_bits_source(system_bus_xbar_auto_out_1_c_bits_source),
    .auto_out_1_c_bits_address(system_bus_xbar_auto_out_1_c_bits_address),
    .auto_out_1_c_bits_corrupt(system_bus_xbar_auto_out_1_c_bits_corrupt),
    .auto_out_1_d_ready(system_bus_xbar_auto_out_1_d_ready),
    .auto_out_1_d_valid(system_bus_xbar_auto_out_1_d_valid),
    .auto_out_1_d_bits_opcode(system_bus_xbar_auto_out_1_d_bits_opcode),
    .auto_out_1_d_bits_param(system_bus_xbar_auto_out_1_d_bits_param),
    .auto_out_1_d_bits_size(system_bus_xbar_auto_out_1_d_bits_size),
    .auto_out_1_d_bits_source(system_bus_xbar_auto_out_1_d_bits_source),
    .auto_out_1_d_bits_sink(system_bus_xbar_auto_out_1_d_bits_sink),
    .auto_out_1_d_bits_denied(system_bus_xbar_auto_out_1_d_bits_denied),
    .auto_out_1_d_bits_data(system_bus_xbar_auto_out_1_d_bits_data),
    .auto_out_1_d_bits_corrupt(system_bus_xbar_auto_out_1_d_bits_corrupt),
    .auto_out_1_e_ready(system_bus_xbar_auto_out_1_e_ready),
    .auto_out_1_e_valid(system_bus_xbar_auto_out_1_e_valid),
    .auto_out_0_a_ready(system_bus_xbar_auto_out_0_a_ready),
    .auto_out_0_a_valid(system_bus_xbar_auto_out_0_a_valid),
    .auto_out_0_a_bits_opcode(system_bus_xbar_auto_out_0_a_bits_opcode),
    .auto_out_0_a_bits_param(system_bus_xbar_auto_out_0_a_bits_param),
    .auto_out_0_a_bits_size(system_bus_xbar_auto_out_0_a_bits_size),
    .auto_out_0_a_bits_source(system_bus_xbar_auto_out_0_a_bits_source),
    .auto_out_0_a_bits_address(system_bus_xbar_auto_out_0_a_bits_address),
    .auto_out_0_a_bits_mask(system_bus_xbar_auto_out_0_a_bits_mask),
    .auto_out_0_a_bits_data(system_bus_xbar_auto_out_0_a_bits_data),
    .auto_out_0_a_bits_corrupt(system_bus_xbar_auto_out_0_a_bits_corrupt),
    .auto_out_0_d_ready(system_bus_xbar_auto_out_0_d_ready),
    .auto_out_0_d_valid(system_bus_xbar_auto_out_0_d_valid),
    .auto_out_0_d_bits_opcode(system_bus_xbar_auto_out_0_d_bits_opcode),
    .auto_out_0_d_bits_param(system_bus_xbar_auto_out_0_d_bits_param),
    .auto_out_0_d_bits_size(system_bus_xbar_auto_out_0_d_bits_size),
    .auto_out_0_d_bits_source(system_bus_xbar_auto_out_0_d_bits_source),
    .auto_out_0_d_bits_sink(system_bus_xbar_auto_out_0_d_bits_sink),
    .auto_out_0_d_bits_denied(system_bus_xbar_auto_out_0_d_bits_denied),
    .auto_out_0_d_bits_data(system_bus_xbar_auto_out_0_d_bits_data),
    .auto_out_0_d_bits_corrupt(system_bus_xbar_auto_out_0_d_bits_corrupt)
  );
  PeripheryBus control_bus ( 
    .clock(control_bus_clock),
    .reset(control_bus_reset),
    .auto_coupler_to_slave_named_MaskROM_fragmenter_out_a_ready(control_bus_auto_coupler_to_slave_named_MaskROM_fragmenter_out_a_ready),
    .auto_coupler_to_slave_named_MaskROM_fragmenter_out_a_valid(control_bus_auto_coupler_to_slave_named_MaskROM_fragmenter_out_a_valid),
    .auto_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_opcode(control_bus_auto_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_opcode),
    .auto_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_param(control_bus_auto_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_param),
    .auto_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_size(control_bus_auto_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_size),
    .auto_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_source(control_bus_auto_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_source),
    .auto_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_address(control_bus_auto_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_address),
    .auto_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_mask(control_bus_auto_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_mask),
    .auto_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_corrupt(control_bus_auto_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_corrupt),
    .auto_coupler_to_slave_named_MaskROM_fragmenter_out_d_ready(control_bus_auto_coupler_to_slave_named_MaskROM_fragmenter_out_d_ready),
    .auto_coupler_to_slave_named_MaskROM_fragmenter_out_d_valid(control_bus_auto_coupler_to_slave_named_MaskROM_fragmenter_out_d_valid),
    .auto_coupler_to_slave_named_MaskROM_fragmenter_out_d_bits_size(control_bus_auto_coupler_to_slave_named_MaskROM_fragmenter_out_d_bits_size),
    .auto_coupler_to_slave_named_MaskROM_fragmenter_out_d_bits_source(control_bus_auto_coupler_to_slave_named_MaskROM_fragmenter_out_d_bits_source),
    .auto_coupler_to_slave_named_MaskROM_fragmenter_out_d_bits_data(control_bus_auto_coupler_to_slave_named_MaskROM_fragmenter_out_d_bits_data),
    .auto_coupler_to_slave_named_debug_fragmenter_out_a_ready(control_bus_auto_coupler_to_slave_named_debug_fragmenter_out_a_ready),
    .auto_coupler_to_slave_named_debug_fragmenter_out_a_valid(control_bus_auto_coupler_to_slave_named_debug_fragmenter_out_a_valid),
    .auto_coupler_to_slave_named_debug_fragmenter_out_a_bits_opcode(control_bus_auto_coupler_to_slave_named_debug_fragmenter_out_a_bits_opcode),
    .auto_coupler_to_slave_named_debug_fragmenter_out_a_bits_param(control_bus_auto_coupler_to_slave_named_debug_fragmenter_out_a_bits_param),
    .auto_coupler_to_slave_named_debug_fragmenter_out_a_bits_size(control_bus_auto_coupler_to_slave_named_debug_fragmenter_out_a_bits_size),
    .auto_coupler_to_slave_named_debug_fragmenter_out_a_bits_source(control_bus_auto_coupler_to_slave_named_debug_fragmenter_out_a_bits_source),
    .auto_coupler_to_slave_named_debug_fragmenter_out_a_bits_address(control_bus_auto_coupler_to_slave_named_debug_fragmenter_out_a_bits_address),
    .auto_coupler_to_slave_named_debug_fragmenter_out_a_bits_mask(control_bus_auto_coupler_to_slave_named_debug_fragmenter_out_a_bits_mask),
    .auto_coupler_to_slave_named_debug_fragmenter_out_a_bits_data(control_bus_auto_coupler_to_slave_named_debug_fragmenter_out_a_bits_data),
    .auto_coupler_to_slave_named_debug_fragmenter_out_a_bits_corrupt(control_bus_auto_coupler_to_slave_named_debug_fragmenter_out_a_bits_corrupt),
    .auto_coupler_to_slave_named_debug_fragmenter_out_d_ready(control_bus_auto_coupler_to_slave_named_debug_fragmenter_out_d_ready),
    .auto_coupler_to_slave_named_debug_fragmenter_out_d_valid(control_bus_auto_coupler_to_slave_named_debug_fragmenter_out_d_valid),
    .auto_coupler_to_slave_named_debug_fragmenter_out_d_bits_opcode(control_bus_auto_coupler_to_slave_named_debug_fragmenter_out_d_bits_opcode),
    .auto_coupler_to_slave_named_debug_fragmenter_out_d_bits_size(control_bus_auto_coupler_to_slave_named_debug_fragmenter_out_d_bits_size),
    .auto_coupler_to_slave_named_debug_fragmenter_out_d_bits_source(control_bus_auto_coupler_to_slave_named_debug_fragmenter_out_d_bits_source),
    .auto_coupler_to_slave_named_debug_fragmenter_out_d_bits_data(control_bus_auto_coupler_to_slave_named_debug_fragmenter_out_d_bits_data),
    .auto_coupler_to_slave_named_clint_fragmenter_out_a_ready(control_bus_auto_coupler_to_slave_named_clint_fragmenter_out_a_ready),
    .auto_coupler_to_slave_named_clint_fragmenter_out_a_valid(control_bus_auto_coupler_to_slave_named_clint_fragmenter_out_a_valid),
    .auto_coupler_to_slave_named_clint_fragmenter_out_a_bits_opcode(control_bus_auto_coupler_to_slave_named_clint_fragmenter_out_a_bits_opcode),
    .auto_coupler_to_slave_named_clint_fragmenter_out_a_bits_param(control_bus_auto_coupler_to_slave_named_clint_fragmenter_out_a_bits_param),
    .auto_coupler_to_slave_named_clint_fragmenter_out_a_bits_size(control_bus_auto_coupler_to_slave_named_clint_fragmenter_out_a_bits_size),
    .auto_coupler_to_slave_named_clint_fragmenter_out_a_bits_source(control_bus_auto_coupler_to_slave_named_clint_fragmenter_out_a_bits_source),
    .auto_coupler_to_slave_named_clint_fragmenter_out_a_bits_address(control_bus_auto_coupler_to_slave_named_clint_fragmenter_out_a_bits_address),
    .auto_coupler_to_slave_named_clint_fragmenter_out_a_bits_mask(control_bus_auto_coupler_to_slave_named_clint_fragmenter_out_a_bits_mask),
    .auto_coupler_to_slave_named_clint_fragmenter_out_a_bits_data(control_bus_auto_coupler_to_slave_named_clint_fragmenter_out_a_bits_data),
    .auto_coupler_to_slave_named_clint_fragmenter_out_a_bits_corrupt(control_bus_auto_coupler_to_slave_named_clint_fragmenter_out_a_bits_corrupt),
    .auto_coupler_to_slave_named_clint_fragmenter_out_d_ready(control_bus_auto_coupler_to_slave_named_clint_fragmenter_out_d_ready),
    .auto_coupler_to_slave_named_clint_fragmenter_out_d_valid(control_bus_auto_coupler_to_slave_named_clint_fragmenter_out_d_valid),
    .auto_coupler_to_slave_named_clint_fragmenter_out_d_bits_opcode(control_bus_auto_coupler_to_slave_named_clint_fragmenter_out_d_bits_opcode),
    .auto_coupler_to_slave_named_clint_fragmenter_out_d_bits_size(control_bus_auto_coupler_to_slave_named_clint_fragmenter_out_d_bits_size),
    .auto_coupler_to_slave_named_clint_fragmenter_out_d_bits_source(control_bus_auto_coupler_to_slave_named_clint_fragmenter_out_d_bits_source),
    .auto_coupler_to_slave_named_clint_fragmenter_out_d_bits_data(control_bus_auto_coupler_to_slave_named_clint_fragmenter_out_d_bits_data),
    .auto_coupler_to_slave_named_plic_fragmenter_out_a_ready(control_bus_auto_coupler_to_slave_named_plic_fragmenter_out_a_ready),
    .auto_coupler_to_slave_named_plic_fragmenter_out_a_valid(control_bus_auto_coupler_to_slave_named_plic_fragmenter_out_a_valid),
    .auto_coupler_to_slave_named_plic_fragmenter_out_a_bits_opcode(control_bus_auto_coupler_to_slave_named_plic_fragmenter_out_a_bits_opcode),
    .auto_coupler_to_slave_named_plic_fragmenter_out_a_bits_param(control_bus_auto_coupler_to_slave_named_plic_fragmenter_out_a_bits_param),
    .auto_coupler_to_slave_named_plic_fragmenter_out_a_bits_size(control_bus_auto_coupler_to_slave_named_plic_fragmenter_out_a_bits_size),
    .auto_coupler_to_slave_named_plic_fragmenter_out_a_bits_source(control_bus_auto_coupler_to_slave_named_plic_fragmenter_out_a_bits_source),
    .auto_coupler_to_slave_named_plic_fragmenter_out_a_bits_address(control_bus_auto_coupler_to_slave_named_plic_fragmenter_out_a_bits_address),
    .auto_coupler_to_slave_named_plic_fragmenter_out_a_bits_mask(control_bus_auto_coupler_to_slave_named_plic_fragmenter_out_a_bits_mask),
    .auto_coupler_to_slave_named_plic_fragmenter_out_a_bits_data(control_bus_auto_coupler_to_slave_named_plic_fragmenter_out_a_bits_data),
    .auto_coupler_to_slave_named_plic_fragmenter_out_a_bits_corrupt(control_bus_auto_coupler_to_slave_named_plic_fragmenter_out_a_bits_corrupt),
    .auto_coupler_to_slave_named_plic_fragmenter_out_d_ready(control_bus_auto_coupler_to_slave_named_plic_fragmenter_out_d_ready),
    .auto_coupler_to_slave_named_plic_fragmenter_out_d_valid(control_bus_auto_coupler_to_slave_named_plic_fragmenter_out_d_valid),
    .auto_coupler_to_slave_named_plic_fragmenter_out_d_bits_opcode(control_bus_auto_coupler_to_slave_named_plic_fragmenter_out_d_bits_opcode),
    .auto_coupler_to_slave_named_plic_fragmenter_out_d_bits_size(control_bus_auto_coupler_to_slave_named_plic_fragmenter_out_d_bits_size),
    .auto_coupler_to_slave_named_plic_fragmenter_out_d_bits_source(control_bus_auto_coupler_to_slave_named_plic_fragmenter_out_d_bits_source),
    .auto_coupler_to_slave_named_plic_fragmenter_out_d_bits_data(control_bus_auto_coupler_to_slave_named_plic_fragmenter_out_d_bits_data),
    .auto_coupler_to_bus_named_pbus_from_cbus_out_a_ready(control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_a_ready),
    .auto_coupler_to_bus_named_pbus_from_cbus_out_a_valid(control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_a_valid),
    .auto_coupler_to_bus_named_pbus_from_cbus_out_a_bits_opcode(control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_a_bits_opcode),
    .auto_coupler_to_bus_named_pbus_from_cbus_out_a_bits_param(control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_a_bits_param),
    .auto_coupler_to_bus_named_pbus_from_cbus_out_a_bits_size(control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_a_bits_size),
    .auto_coupler_to_bus_named_pbus_from_cbus_out_a_bits_source(control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_a_bits_source),
    .auto_coupler_to_bus_named_pbus_from_cbus_out_a_bits_address(control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_a_bits_address),
    .auto_coupler_to_bus_named_pbus_from_cbus_out_a_bits_mask(control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_a_bits_mask),
    .auto_coupler_to_bus_named_pbus_from_cbus_out_a_bits_data(control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_a_bits_data),
    .auto_coupler_to_bus_named_pbus_from_cbus_out_a_bits_corrupt(control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_a_bits_corrupt),
    .auto_coupler_to_bus_named_pbus_from_cbus_out_d_ready(control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_d_ready),
    .auto_coupler_to_bus_named_pbus_from_cbus_out_d_valid(control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_d_valid),
    .auto_coupler_to_bus_named_pbus_from_cbus_out_d_bits_opcode(control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_d_bits_opcode),
    .auto_coupler_to_bus_named_pbus_from_cbus_out_d_bits_param(control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_d_bits_param),
    .auto_coupler_to_bus_named_pbus_from_cbus_out_d_bits_size(control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_d_bits_size),
    .auto_coupler_to_bus_named_pbus_from_cbus_out_d_bits_source(control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_d_bits_source),
    .auto_coupler_to_bus_named_pbus_from_cbus_out_d_bits_sink(control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_d_bits_sink),
    .auto_coupler_to_bus_named_pbus_from_cbus_out_d_bits_denied(control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_d_bits_denied),
    .auto_coupler_to_bus_named_pbus_from_cbus_out_d_bits_data(control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_d_bits_data),
    .auto_coupler_to_bus_named_pbus_from_cbus_out_d_bits_corrupt(control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_d_bits_corrupt),
    .auto_from_sbus_in_a_ready(control_bus_auto_from_sbus_in_a_ready),
    .auto_from_sbus_in_a_valid(control_bus_auto_from_sbus_in_a_valid),
    .auto_from_sbus_in_a_bits_opcode(control_bus_auto_from_sbus_in_a_bits_opcode),
    .auto_from_sbus_in_a_bits_param(control_bus_auto_from_sbus_in_a_bits_param),
    .auto_from_sbus_in_a_bits_size(control_bus_auto_from_sbus_in_a_bits_size),
    .auto_from_sbus_in_a_bits_source(control_bus_auto_from_sbus_in_a_bits_source),
    .auto_from_sbus_in_a_bits_address(control_bus_auto_from_sbus_in_a_bits_address),
    .auto_from_sbus_in_a_bits_mask(control_bus_auto_from_sbus_in_a_bits_mask),
    .auto_from_sbus_in_a_bits_data(control_bus_auto_from_sbus_in_a_bits_data),
    .auto_from_sbus_in_a_bits_corrupt(control_bus_auto_from_sbus_in_a_bits_corrupt),
    .auto_from_sbus_in_d_ready(control_bus_auto_from_sbus_in_d_ready),
    .auto_from_sbus_in_d_valid(control_bus_auto_from_sbus_in_d_valid),
    .auto_from_sbus_in_d_bits_opcode(control_bus_auto_from_sbus_in_d_bits_opcode),
    .auto_from_sbus_in_d_bits_param(control_bus_auto_from_sbus_in_d_bits_param),
    .auto_from_sbus_in_d_bits_size(control_bus_auto_from_sbus_in_d_bits_size),
    .auto_from_sbus_in_d_bits_source(control_bus_auto_from_sbus_in_d_bits_source),
    .auto_from_sbus_in_d_bits_sink(control_bus_auto_from_sbus_in_d_bits_sink),
    .auto_from_sbus_in_d_bits_denied(control_bus_auto_from_sbus_in_d_bits_denied),
    .auto_from_sbus_in_d_bits_data(control_bus_auto_from_sbus_in_d_bits_data),
    .auto_from_sbus_in_d_bits_corrupt(control_bus_auto_from_sbus_in_d_bits_corrupt)
  );
  SimpleLazyModule_10 coupler_to_bus_named_cbus ( 
    .clock(coupler_to_bus_named_cbus_clock),
    .reset(coupler_to_bus_named_cbus_reset),
    .auto_buffer_in_a_ready(coupler_to_bus_named_cbus_auto_buffer_in_a_ready),
    .auto_buffer_in_a_valid(coupler_to_bus_named_cbus_auto_buffer_in_a_valid),
    .auto_buffer_in_a_bits_opcode(coupler_to_bus_named_cbus_auto_buffer_in_a_bits_opcode),
    .auto_buffer_in_a_bits_param(coupler_to_bus_named_cbus_auto_buffer_in_a_bits_param),
    .auto_buffer_in_a_bits_size(coupler_to_bus_named_cbus_auto_buffer_in_a_bits_size),
    .auto_buffer_in_a_bits_source(coupler_to_bus_named_cbus_auto_buffer_in_a_bits_source),
    .auto_buffer_in_a_bits_address(coupler_to_bus_named_cbus_auto_buffer_in_a_bits_address),
    .auto_buffer_in_a_bits_mask(coupler_to_bus_named_cbus_auto_buffer_in_a_bits_mask),
    .auto_buffer_in_a_bits_data(coupler_to_bus_named_cbus_auto_buffer_in_a_bits_data),
    .auto_buffer_in_a_bits_corrupt(coupler_to_bus_named_cbus_auto_buffer_in_a_bits_corrupt),
    .auto_buffer_in_d_ready(coupler_to_bus_named_cbus_auto_buffer_in_d_ready),
    .auto_buffer_in_d_valid(coupler_to_bus_named_cbus_auto_buffer_in_d_valid),
    .auto_buffer_in_d_bits_opcode(coupler_to_bus_named_cbus_auto_buffer_in_d_bits_opcode),
    .auto_buffer_in_d_bits_param(coupler_to_bus_named_cbus_auto_buffer_in_d_bits_param),
    .auto_buffer_in_d_bits_size(coupler_to_bus_named_cbus_auto_buffer_in_d_bits_size),
    .auto_buffer_in_d_bits_source(coupler_to_bus_named_cbus_auto_buffer_in_d_bits_source),
    .auto_buffer_in_d_bits_sink(coupler_to_bus_named_cbus_auto_buffer_in_d_bits_sink),
    .auto_buffer_in_d_bits_denied(coupler_to_bus_named_cbus_auto_buffer_in_d_bits_denied),
    .auto_buffer_in_d_bits_data(coupler_to_bus_named_cbus_auto_buffer_in_d_bits_data),
    .auto_buffer_in_d_bits_corrupt(coupler_to_bus_named_cbus_auto_buffer_in_d_bits_corrupt),
    .auto_from_sbus_out_a_ready(coupler_to_bus_named_cbus_auto_from_sbus_out_a_ready),
    .auto_from_sbus_out_a_valid(coupler_to_bus_named_cbus_auto_from_sbus_out_a_valid),
    .auto_from_sbus_out_a_bits_opcode(coupler_to_bus_named_cbus_auto_from_sbus_out_a_bits_opcode),
    .auto_from_sbus_out_a_bits_param(coupler_to_bus_named_cbus_auto_from_sbus_out_a_bits_param),
    .auto_from_sbus_out_a_bits_size(coupler_to_bus_named_cbus_auto_from_sbus_out_a_bits_size),
    .auto_from_sbus_out_a_bits_source(coupler_to_bus_named_cbus_auto_from_sbus_out_a_bits_source),
    .auto_from_sbus_out_a_bits_address(coupler_to_bus_named_cbus_auto_from_sbus_out_a_bits_address),
    .auto_from_sbus_out_a_bits_mask(coupler_to_bus_named_cbus_auto_from_sbus_out_a_bits_mask),
    .auto_from_sbus_out_a_bits_data(coupler_to_bus_named_cbus_auto_from_sbus_out_a_bits_data),
    .auto_from_sbus_out_a_bits_corrupt(coupler_to_bus_named_cbus_auto_from_sbus_out_a_bits_corrupt),
    .auto_from_sbus_out_d_ready(coupler_to_bus_named_cbus_auto_from_sbus_out_d_ready),
    .auto_from_sbus_out_d_valid(coupler_to_bus_named_cbus_auto_from_sbus_out_d_valid),
    .auto_from_sbus_out_d_bits_opcode(coupler_to_bus_named_cbus_auto_from_sbus_out_d_bits_opcode),
    .auto_from_sbus_out_d_bits_param(coupler_to_bus_named_cbus_auto_from_sbus_out_d_bits_param),
    .auto_from_sbus_out_d_bits_size(coupler_to_bus_named_cbus_auto_from_sbus_out_d_bits_size),
    .auto_from_sbus_out_d_bits_source(coupler_to_bus_named_cbus_auto_from_sbus_out_d_bits_source),
    .auto_from_sbus_out_d_bits_sink(coupler_to_bus_named_cbus_auto_from_sbus_out_d_bits_sink),
    .auto_from_sbus_out_d_bits_denied(coupler_to_bus_named_cbus_auto_from_sbus_out_d_bits_denied),
    .auto_from_sbus_out_d_bits_data(coupler_to_bus_named_cbus_auto_from_sbus_out_d_bits_data),
    .auto_from_sbus_out_d_bits_corrupt(coupler_to_bus_named_cbus_auto_from_sbus_out_d_bits_corrupt)
  );
  TLSplitter master_splitter ( 
    .clock(master_splitter_clock),
    .reset(master_splitter_reset),
    .auto_in_3_a_ready(master_splitter_auto_in_3_a_ready),
    .auto_in_3_a_valid(master_splitter_auto_in_3_a_valid),
    .auto_in_3_a_bits_opcode(master_splitter_auto_in_3_a_bits_opcode),
    .auto_in_3_a_bits_param(master_splitter_auto_in_3_a_bits_param),
    .auto_in_3_a_bits_size(master_splitter_auto_in_3_a_bits_size),
    .auto_in_3_a_bits_source(master_splitter_auto_in_3_a_bits_source),
    .auto_in_3_a_bits_address(master_splitter_auto_in_3_a_bits_address),
    .auto_in_3_a_bits_mask(master_splitter_auto_in_3_a_bits_mask),
    .auto_in_3_a_bits_data(master_splitter_auto_in_3_a_bits_data),
    .auto_in_3_a_bits_corrupt(master_splitter_auto_in_3_a_bits_corrupt),
    .auto_in_3_b_ready(master_splitter_auto_in_3_b_ready),
    .auto_in_3_b_valid(master_splitter_auto_in_3_b_valid),
    .auto_in_3_b_bits_opcode(master_splitter_auto_in_3_b_bits_opcode),
    .auto_in_3_b_bits_param(master_splitter_auto_in_3_b_bits_param),
    .auto_in_3_b_bits_size(master_splitter_auto_in_3_b_bits_size),
    .auto_in_3_b_bits_source(master_splitter_auto_in_3_b_bits_source),
    .auto_in_3_b_bits_address(master_splitter_auto_in_3_b_bits_address),
    .auto_in_3_b_bits_mask(master_splitter_auto_in_3_b_bits_mask),
    .auto_in_3_b_bits_corrupt(master_splitter_auto_in_3_b_bits_corrupt),
    .auto_in_3_c_ready(master_splitter_auto_in_3_c_ready),
    .auto_in_3_c_valid(master_splitter_auto_in_3_c_valid),
    .auto_in_3_c_bits_opcode(master_splitter_auto_in_3_c_bits_opcode),
    .auto_in_3_c_bits_param(master_splitter_auto_in_3_c_bits_param),
    .auto_in_3_c_bits_size(master_splitter_auto_in_3_c_bits_size),
    .auto_in_3_c_bits_source(master_splitter_auto_in_3_c_bits_source),
    .auto_in_3_c_bits_address(master_splitter_auto_in_3_c_bits_address),
    .auto_in_3_c_bits_data(master_splitter_auto_in_3_c_bits_data),
    .auto_in_3_c_bits_corrupt(master_splitter_auto_in_3_c_bits_corrupt),
    .auto_in_3_d_ready(master_splitter_auto_in_3_d_ready),
    .auto_in_3_d_valid(master_splitter_auto_in_3_d_valid),
    .auto_in_3_d_bits_opcode(master_splitter_auto_in_3_d_bits_opcode),
    .auto_in_3_d_bits_param(master_splitter_auto_in_3_d_bits_param),
    .auto_in_3_d_bits_size(master_splitter_auto_in_3_d_bits_size),
    .auto_in_3_d_bits_source(master_splitter_auto_in_3_d_bits_source),
    .auto_in_3_d_bits_sink(master_splitter_auto_in_3_d_bits_sink),
    .auto_in_3_d_bits_denied(master_splitter_auto_in_3_d_bits_denied),
    .auto_in_3_d_bits_data(master_splitter_auto_in_3_d_bits_data),
    .auto_in_3_d_bits_corrupt(master_splitter_auto_in_3_d_bits_corrupt),
    .auto_in_3_e_ready(master_splitter_auto_in_3_e_ready),
    .auto_in_3_e_valid(master_splitter_auto_in_3_e_valid),
    .auto_in_3_e_bits_sink(master_splitter_auto_in_3_e_bits_sink),
    .auto_in_2_a_ready(master_splitter_auto_in_2_a_ready),
    .auto_in_2_a_valid(master_splitter_auto_in_2_a_valid),
    .auto_in_2_a_bits_opcode(master_splitter_auto_in_2_a_bits_opcode),
    .auto_in_2_a_bits_param(master_splitter_auto_in_2_a_bits_param),
    .auto_in_2_a_bits_size(master_splitter_auto_in_2_a_bits_size),
    .auto_in_2_a_bits_source(master_splitter_auto_in_2_a_bits_source),
    .auto_in_2_a_bits_address(master_splitter_auto_in_2_a_bits_address),
    .auto_in_2_a_bits_mask(master_splitter_auto_in_2_a_bits_mask),
    .auto_in_2_a_bits_data(master_splitter_auto_in_2_a_bits_data),
    .auto_in_2_a_bits_corrupt(master_splitter_auto_in_2_a_bits_corrupt),
    .auto_in_2_b_ready(master_splitter_auto_in_2_b_ready),
    .auto_in_2_b_valid(master_splitter_auto_in_2_b_valid),
    .auto_in_2_b_bits_opcode(master_splitter_auto_in_2_b_bits_opcode),
    .auto_in_2_b_bits_param(master_splitter_auto_in_2_b_bits_param),
    .auto_in_2_b_bits_size(master_splitter_auto_in_2_b_bits_size),
    .auto_in_2_b_bits_source(master_splitter_auto_in_2_b_bits_source),
    .auto_in_2_b_bits_address(master_splitter_auto_in_2_b_bits_address),
    .auto_in_2_b_bits_mask(master_splitter_auto_in_2_b_bits_mask),
    .auto_in_2_b_bits_corrupt(master_splitter_auto_in_2_b_bits_corrupt),
    .auto_in_2_c_ready(master_splitter_auto_in_2_c_ready),
    .auto_in_2_c_valid(master_splitter_auto_in_2_c_valid),
    .auto_in_2_c_bits_opcode(master_splitter_auto_in_2_c_bits_opcode),
    .auto_in_2_c_bits_param(master_splitter_auto_in_2_c_bits_param),
    .auto_in_2_c_bits_size(master_splitter_auto_in_2_c_bits_size),
    .auto_in_2_c_bits_source(master_splitter_auto_in_2_c_bits_source),
    .auto_in_2_c_bits_address(master_splitter_auto_in_2_c_bits_address),
    .auto_in_2_c_bits_data(master_splitter_auto_in_2_c_bits_data),
    .auto_in_2_c_bits_corrupt(master_splitter_auto_in_2_c_bits_corrupt),
    .auto_in_2_d_ready(master_splitter_auto_in_2_d_ready),
    .auto_in_2_d_valid(master_splitter_auto_in_2_d_valid),
    .auto_in_2_d_bits_opcode(master_splitter_auto_in_2_d_bits_opcode),
    .auto_in_2_d_bits_param(master_splitter_auto_in_2_d_bits_param),
    .auto_in_2_d_bits_size(master_splitter_auto_in_2_d_bits_size),
    .auto_in_2_d_bits_source(master_splitter_auto_in_2_d_bits_source),
    .auto_in_2_d_bits_sink(master_splitter_auto_in_2_d_bits_sink),
    .auto_in_2_d_bits_denied(master_splitter_auto_in_2_d_bits_denied),
    .auto_in_2_d_bits_data(master_splitter_auto_in_2_d_bits_data),
    .auto_in_2_d_bits_corrupt(master_splitter_auto_in_2_d_bits_corrupt),
    .auto_in_2_e_ready(master_splitter_auto_in_2_e_ready),
    .auto_in_2_e_valid(master_splitter_auto_in_2_e_valid),
    .auto_in_2_e_bits_sink(master_splitter_auto_in_2_e_bits_sink),
    .auto_in_1_a_ready(master_splitter_auto_in_1_a_ready),
    .auto_in_1_a_valid(master_splitter_auto_in_1_a_valid),
    .auto_in_1_a_bits_opcode(master_splitter_auto_in_1_a_bits_opcode),
    .auto_in_1_a_bits_param(master_splitter_auto_in_1_a_bits_param),
    .auto_in_1_a_bits_size(master_splitter_auto_in_1_a_bits_size),
    .auto_in_1_a_bits_source(master_splitter_auto_in_1_a_bits_source),
    .auto_in_1_a_bits_address(master_splitter_auto_in_1_a_bits_address),
    .auto_in_1_a_bits_mask(master_splitter_auto_in_1_a_bits_mask),
    .auto_in_1_a_bits_data(master_splitter_auto_in_1_a_bits_data),
    .auto_in_1_a_bits_corrupt(master_splitter_auto_in_1_a_bits_corrupt),
    .auto_in_1_b_ready(master_splitter_auto_in_1_b_ready),
    .auto_in_1_b_valid(master_splitter_auto_in_1_b_valid),
    .auto_in_1_b_bits_opcode(master_splitter_auto_in_1_b_bits_opcode),
    .auto_in_1_b_bits_param(master_splitter_auto_in_1_b_bits_param),
    .auto_in_1_b_bits_size(master_splitter_auto_in_1_b_bits_size),
    .auto_in_1_b_bits_source(master_splitter_auto_in_1_b_bits_source),
    .auto_in_1_b_bits_address(master_splitter_auto_in_1_b_bits_address),
    .auto_in_1_b_bits_mask(master_splitter_auto_in_1_b_bits_mask),
    .auto_in_1_b_bits_corrupt(master_splitter_auto_in_1_b_bits_corrupt),
    .auto_in_1_c_ready(master_splitter_auto_in_1_c_ready),
    .auto_in_1_c_valid(master_splitter_auto_in_1_c_valid),
    .auto_in_1_c_bits_opcode(master_splitter_auto_in_1_c_bits_opcode),
    .auto_in_1_c_bits_param(master_splitter_auto_in_1_c_bits_param),
    .auto_in_1_c_bits_size(master_splitter_auto_in_1_c_bits_size),
    .auto_in_1_c_bits_source(master_splitter_auto_in_1_c_bits_source),
    .auto_in_1_c_bits_address(master_splitter_auto_in_1_c_bits_address),
    .auto_in_1_c_bits_data(master_splitter_auto_in_1_c_bits_data),
    .auto_in_1_c_bits_corrupt(master_splitter_auto_in_1_c_bits_corrupt),
    .auto_in_1_d_ready(master_splitter_auto_in_1_d_ready),
    .auto_in_1_d_valid(master_splitter_auto_in_1_d_valid),
    .auto_in_1_d_bits_opcode(master_splitter_auto_in_1_d_bits_opcode),
    .auto_in_1_d_bits_param(master_splitter_auto_in_1_d_bits_param),
    .auto_in_1_d_bits_size(master_splitter_auto_in_1_d_bits_size),
    .auto_in_1_d_bits_source(master_splitter_auto_in_1_d_bits_source),
    .auto_in_1_d_bits_sink(master_splitter_auto_in_1_d_bits_sink),
    .auto_in_1_d_bits_denied(master_splitter_auto_in_1_d_bits_denied),
    .auto_in_1_d_bits_data(master_splitter_auto_in_1_d_bits_data),
    .auto_in_1_d_bits_corrupt(master_splitter_auto_in_1_d_bits_corrupt),
    .auto_in_1_e_ready(master_splitter_auto_in_1_e_ready),
    .auto_in_1_e_valid(master_splitter_auto_in_1_e_valid),
    .auto_in_1_e_bits_sink(master_splitter_auto_in_1_e_bits_sink),
    .auto_in_0_a_ready(master_splitter_auto_in_0_a_ready),
    .auto_in_0_a_valid(master_splitter_auto_in_0_a_valid),
    .auto_in_0_a_bits_opcode(master_splitter_auto_in_0_a_bits_opcode),
    .auto_in_0_a_bits_param(master_splitter_auto_in_0_a_bits_param),
    .auto_in_0_a_bits_size(master_splitter_auto_in_0_a_bits_size),
    .auto_in_0_a_bits_source(master_splitter_auto_in_0_a_bits_source),
    .auto_in_0_a_bits_address(master_splitter_auto_in_0_a_bits_address),
    .auto_in_0_a_bits_mask(master_splitter_auto_in_0_a_bits_mask),
    .auto_in_0_a_bits_data(master_splitter_auto_in_0_a_bits_data),
    .auto_in_0_a_bits_corrupt(master_splitter_auto_in_0_a_bits_corrupt),
    .auto_in_0_b_ready(master_splitter_auto_in_0_b_ready),
    .auto_in_0_b_valid(master_splitter_auto_in_0_b_valid),
    .auto_in_0_b_bits_opcode(master_splitter_auto_in_0_b_bits_opcode),
    .auto_in_0_b_bits_param(master_splitter_auto_in_0_b_bits_param),
    .auto_in_0_b_bits_size(master_splitter_auto_in_0_b_bits_size),
    .auto_in_0_b_bits_source(master_splitter_auto_in_0_b_bits_source),
    .auto_in_0_b_bits_address(master_splitter_auto_in_0_b_bits_address),
    .auto_in_0_b_bits_mask(master_splitter_auto_in_0_b_bits_mask),
    .auto_in_0_b_bits_corrupt(master_splitter_auto_in_0_b_bits_corrupt),
    .auto_in_0_c_ready(master_splitter_auto_in_0_c_ready),
    .auto_in_0_c_valid(master_splitter_auto_in_0_c_valid),
    .auto_in_0_c_bits_opcode(master_splitter_auto_in_0_c_bits_opcode),
    .auto_in_0_c_bits_param(master_splitter_auto_in_0_c_bits_param),
    .auto_in_0_c_bits_size(master_splitter_auto_in_0_c_bits_size),
    .auto_in_0_c_bits_source(master_splitter_auto_in_0_c_bits_source),
    .auto_in_0_c_bits_address(master_splitter_auto_in_0_c_bits_address),
    .auto_in_0_c_bits_data(master_splitter_auto_in_0_c_bits_data),
    .auto_in_0_c_bits_corrupt(master_splitter_auto_in_0_c_bits_corrupt),
    .auto_in_0_d_ready(master_splitter_auto_in_0_d_ready),
    .auto_in_0_d_valid(master_splitter_auto_in_0_d_valid),
    .auto_in_0_d_bits_opcode(master_splitter_auto_in_0_d_bits_opcode),
    .auto_in_0_d_bits_param(master_splitter_auto_in_0_d_bits_param),
    .auto_in_0_d_bits_size(master_splitter_auto_in_0_d_bits_size),
    .auto_in_0_d_bits_source(master_splitter_auto_in_0_d_bits_source),
    .auto_in_0_d_bits_sink(master_splitter_auto_in_0_d_bits_sink),
    .auto_in_0_d_bits_denied(master_splitter_auto_in_0_d_bits_denied),
    .auto_in_0_d_bits_data(master_splitter_auto_in_0_d_bits_data),
    .auto_in_0_d_bits_corrupt(master_splitter_auto_in_0_d_bits_corrupt),
    .auto_in_0_e_ready(master_splitter_auto_in_0_e_ready),
    .auto_in_0_e_valid(master_splitter_auto_in_0_e_valid),
    .auto_in_0_e_bits_sink(master_splitter_auto_in_0_e_bits_sink),
    .auto_out_3_a_ready(master_splitter_auto_out_3_a_ready),
    .auto_out_3_a_valid(master_splitter_auto_out_3_a_valid),
    .auto_out_3_a_bits_opcode(master_splitter_auto_out_3_a_bits_opcode),
    .auto_out_3_a_bits_param(master_splitter_auto_out_3_a_bits_param),
    .auto_out_3_a_bits_size(master_splitter_auto_out_3_a_bits_size),
    .auto_out_3_a_bits_source(master_splitter_auto_out_3_a_bits_source),
    .auto_out_3_a_bits_address(master_splitter_auto_out_3_a_bits_address),
    .auto_out_3_a_bits_mask(master_splitter_auto_out_3_a_bits_mask),
    .auto_out_3_a_bits_data(master_splitter_auto_out_3_a_bits_data),
    .auto_out_3_a_bits_corrupt(master_splitter_auto_out_3_a_bits_corrupt),
    .auto_out_3_b_ready(master_splitter_auto_out_3_b_ready),
    .auto_out_3_b_valid(master_splitter_auto_out_3_b_valid),
    .auto_out_3_b_bits_opcode(master_splitter_auto_out_3_b_bits_opcode),
    .auto_out_3_b_bits_param(master_splitter_auto_out_3_b_bits_param),
    .auto_out_3_b_bits_size(master_splitter_auto_out_3_b_bits_size),
    .auto_out_3_b_bits_source(master_splitter_auto_out_3_b_bits_source),
    .auto_out_3_b_bits_address(master_splitter_auto_out_3_b_bits_address),
    .auto_out_3_b_bits_mask(master_splitter_auto_out_3_b_bits_mask),
    .auto_out_3_b_bits_corrupt(master_splitter_auto_out_3_b_bits_corrupt),
    .auto_out_3_c_ready(master_splitter_auto_out_3_c_ready),
    .auto_out_3_c_valid(master_splitter_auto_out_3_c_valid),
    .auto_out_3_c_bits_opcode(master_splitter_auto_out_3_c_bits_opcode),
    .auto_out_3_c_bits_param(master_splitter_auto_out_3_c_bits_param),
    .auto_out_3_c_bits_size(master_splitter_auto_out_3_c_bits_size),
    .auto_out_3_c_bits_source(master_splitter_auto_out_3_c_bits_source),
    .auto_out_3_c_bits_address(master_splitter_auto_out_3_c_bits_address),
    .auto_out_3_c_bits_data(master_splitter_auto_out_3_c_bits_data),
    .auto_out_3_c_bits_corrupt(master_splitter_auto_out_3_c_bits_corrupt),
    .auto_out_3_d_ready(master_splitter_auto_out_3_d_ready),
    .auto_out_3_d_valid(master_splitter_auto_out_3_d_valid),
    .auto_out_3_d_bits_opcode(master_splitter_auto_out_3_d_bits_opcode),
    .auto_out_3_d_bits_param(master_splitter_auto_out_3_d_bits_param),
    .auto_out_3_d_bits_size(master_splitter_auto_out_3_d_bits_size),
    .auto_out_3_d_bits_source(master_splitter_auto_out_3_d_bits_source),
    .auto_out_3_d_bits_sink(master_splitter_auto_out_3_d_bits_sink),
    .auto_out_3_d_bits_denied(master_splitter_auto_out_3_d_bits_denied),
    .auto_out_3_d_bits_data(master_splitter_auto_out_3_d_bits_data),
    .auto_out_3_d_bits_corrupt(master_splitter_auto_out_3_d_bits_corrupt),
    .auto_out_3_e_ready(master_splitter_auto_out_3_e_ready),
    .auto_out_3_e_valid(master_splitter_auto_out_3_e_valid),
    .auto_out_3_e_bits_sink(master_splitter_auto_out_3_e_bits_sink),
    .auto_out_2_a_ready(master_splitter_auto_out_2_a_ready),
    .auto_out_2_a_valid(master_splitter_auto_out_2_a_valid),
    .auto_out_2_a_bits_opcode(master_splitter_auto_out_2_a_bits_opcode),
    .auto_out_2_a_bits_param(master_splitter_auto_out_2_a_bits_param),
    .auto_out_2_a_bits_size(master_splitter_auto_out_2_a_bits_size),
    .auto_out_2_a_bits_source(master_splitter_auto_out_2_a_bits_source),
    .auto_out_2_a_bits_address(master_splitter_auto_out_2_a_bits_address),
    .auto_out_2_a_bits_mask(master_splitter_auto_out_2_a_bits_mask),
    .auto_out_2_a_bits_data(master_splitter_auto_out_2_a_bits_data),
    .auto_out_2_a_bits_corrupt(master_splitter_auto_out_2_a_bits_corrupt),
    .auto_out_2_b_ready(master_splitter_auto_out_2_b_ready),
    .auto_out_2_b_valid(master_splitter_auto_out_2_b_valid),
    .auto_out_2_b_bits_opcode(master_splitter_auto_out_2_b_bits_opcode),
    .auto_out_2_b_bits_param(master_splitter_auto_out_2_b_bits_param),
    .auto_out_2_b_bits_size(master_splitter_auto_out_2_b_bits_size),
    .auto_out_2_b_bits_source(master_splitter_auto_out_2_b_bits_source),
    .auto_out_2_b_bits_address(master_splitter_auto_out_2_b_bits_address),
    .auto_out_2_b_bits_mask(master_splitter_auto_out_2_b_bits_mask),
    .auto_out_2_b_bits_corrupt(master_splitter_auto_out_2_b_bits_corrupt),
    .auto_out_2_c_ready(master_splitter_auto_out_2_c_ready),
    .auto_out_2_c_valid(master_splitter_auto_out_2_c_valid),
    .auto_out_2_c_bits_opcode(master_splitter_auto_out_2_c_bits_opcode),
    .auto_out_2_c_bits_param(master_splitter_auto_out_2_c_bits_param),
    .auto_out_2_c_bits_size(master_splitter_auto_out_2_c_bits_size),
    .auto_out_2_c_bits_source(master_splitter_auto_out_2_c_bits_source),
    .auto_out_2_c_bits_address(master_splitter_auto_out_2_c_bits_address),
    .auto_out_2_c_bits_data(master_splitter_auto_out_2_c_bits_data),
    .auto_out_2_c_bits_corrupt(master_splitter_auto_out_2_c_bits_corrupt),
    .auto_out_2_d_ready(master_splitter_auto_out_2_d_ready),
    .auto_out_2_d_valid(master_splitter_auto_out_2_d_valid),
    .auto_out_2_d_bits_opcode(master_splitter_auto_out_2_d_bits_opcode),
    .auto_out_2_d_bits_param(master_splitter_auto_out_2_d_bits_param),
    .auto_out_2_d_bits_size(master_splitter_auto_out_2_d_bits_size),
    .auto_out_2_d_bits_source(master_splitter_auto_out_2_d_bits_source),
    .auto_out_2_d_bits_sink(master_splitter_auto_out_2_d_bits_sink),
    .auto_out_2_d_bits_denied(master_splitter_auto_out_2_d_bits_denied),
    .auto_out_2_d_bits_data(master_splitter_auto_out_2_d_bits_data),
    .auto_out_2_d_bits_corrupt(master_splitter_auto_out_2_d_bits_corrupt),
    .auto_out_2_e_ready(master_splitter_auto_out_2_e_ready),
    .auto_out_2_e_valid(master_splitter_auto_out_2_e_valid),
    .auto_out_2_e_bits_sink(master_splitter_auto_out_2_e_bits_sink),
    .auto_out_1_a_ready(master_splitter_auto_out_1_a_ready),
    .auto_out_1_a_valid(master_splitter_auto_out_1_a_valid),
    .auto_out_1_a_bits_opcode(master_splitter_auto_out_1_a_bits_opcode),
    .auto_out_1_a_bits_param(master_splitter_auto_out_1_a_bits_param),
    .auto_out_1_a_bits_size(master_splitter_auto_out_1_a_bits_size),
    .auto_out_1_a_bits_source(master_splitter_auto_out_1_a_bits_source),
    .auto_out_1_a_bits_address(master_splitter_auto_out_1_a_bits_address),
    .auto_out_1_a_bits_mask(master_splitter_auto_out_1_a_bits_mask),
    .auto_out_1_a_bits_data(master_splitter_auto_out_1_a_bits_data),
    .auto_out_1_a_bits_corrupt(master_splitter_auto_out_1_a_bits_corrupt),
    .auto_out_1_b_ready(master_splitter_auto_out_1_b_ready),
    .auto_out_1_b_valid(master_splitter_auto_out_1_b_valid),
    .auto_out_1_b_bits_opcode(master_splitter_auto_out_1_b_bits_opcode),
    .auto_out_1_b_bits_param(master_splitter_auto_out_1_b_bits_param),
    .auto_out_1_b_bits_size(master_splitter_auto_out_1_b_bits_size),
    .auto_out_1_b_bits_source(master_splitter_auto_out_1_b_bits_source),
    .auto_out_1_b_bits_address(master_splitter_auto_out_1_b_bits_address),
    .auto_out_1_b_bits_mask(master_splitter_auto_out_1_b_bits_mask),
    .auto_out_1_b_bits_corrupt(master_splitter_auto_out_1_b_bits_corrupt),
    .auto_out_1_c_ready(master_splitter_auto_out_1_c_ready),
    .auto_out_1_c_valid(master_splitter_auto_out_1_c_valid),
    .auto_out_1_c_bits_opcode(master_splitter_auto_out_1_c_bits_opcode),
    .auto_out_1_c_bits_param(master_splitter_auto_out_1_c_bits_param),
    .auto_out_1_c_bits_size(master_splitter_auto_out_1_c_bits_size),
    .auto_out_1_c_bits_source(master_splitter_auto_out_1_c_bits_source),
    .auto_out_1_c_bits_address(master_splitter_auto_out_1_c_bits_address),
    .auto_out_1_c_bits_data(master_splitter_auto_out_1_c_bits_data),
    .auto_out_1_c_bits_corrupt(master_splitter_auto_out_1_c_bits_corrupt),
    .auto_out_1_d_ready(master_splitter_auto_out_1_d_ready),
    .auto_out_1_d_valid(master_splitter_auto_out_1_d_valid),
    .auto_out_1_d_bits_opcode(master_splitter_auto_out_1_d_bits_opcode),
    .auto_out_1_d_bits_param(master_splitter_auto_out_1_d_bits_param),
    .auto_out_1_d_bits_size(master_splitter_auto_out_1_d_bits_size),
    .auto_out_1_d_bits_source(master_splitter_auto_out_1_d_bits_source),
    .auto_out_1_d_bits_sink(master_splitter_auto_out_1_d_bits_sink),
    .auto_out_1_d_bits_denied(master_splitter_auto_out_1_d_bits_denied),
    .auto_out_1_d_bits_data(master_splitter_auto_out_1_d_bits_data),
    .auto_out_1_d_bits_corrupt(master_splitter_auto_out_1_d_bits_corrupt),
    .auto_out_1_e_ready(master_splitter_auto_out_1_e_ready),
    .auto_out_1_e_valid(master_splitter_auto_out_1_e_valid),
    .auto_out_1_e_bits_sink(master_splitter_auto_out_1_e_bits_sink),
    .auto_out_0_a_ready(master_splitter_auto_out_0_a_ready),
    .auto_out_0_a_valid(master_splitter_auto_out_0_a_valid),
    .auto_out_0_a_bits_opcode(master_splitter_auto_out_0_a_bits_opcode),
    .auto_out_0_a_bits_param(master_splitter_auto_out_0_a_bits_param),
    .auto_out_0_a_bits_size(master_splitter_auto_out_0_a_bits_size),
    .auto_out_0_a_bits_source(master_splitter_auto_out_0_a_bits_source),
    .auto_out_0_a_bits_address(master_splitter_auto_out_0_a_bits_address),
    .auto_out_0_a_bits_mask(master_splitter_auto_out_0_a_bits_mask),
    .auto_out_0_a_bits_data(master_splitter_auto_out_0_a_bits_data),
    .auto_out_0_a_bits_corrupt(master_splitter_auto_out_0_a_bits_corrupt),
    .auto_out_0_b_ready(master_splitter_auto_out_0_b_ready),
    .auto_out_0_b_valid(master_splitter_auto_out_0_b_valid),
    .auto_out_0_b_bits_opcode(master_splitter_auto_out_0_b_bits_opcode),
    .auto_out_0_b_bits_param(master_splitter_auto_out_0_b_bits_param),
    .auto_out_0_b_bits_size(master_splitter_auto_out_0_b_bits_size),
    .auto_out_0_b_bits_source(master_splitter_auto_out_0_b_bits_source),
    .auto_out_0_b_bits_address(master_splitter_auto_out_0_b_bits_address),
    .auto_out_0_b_bits_mask(master_splitter_auto_out_0_b_bits_mask),
    .auto_out_0_b_bits_corrupt(master_splitter_auto_out_0_b_bits_corrupt),
    .auto_out_0_c_ready(master_splitter_auto_out_0_c_ready),
    .auto_out_0_c_valid(master_splitter_auto_out_0_c_valid),
    .auto_out_0_c_bits_opcode(master_splitter_auto_out_0_c_bits_opcode),
    .auto_out_0_c_bits_param(master_splitter_auto_out_0_c_bits_param),
    .auto_out_0_c_bits_size(master_splitter_auto_out_0_c_bits_size),
    .auto_out_0_c_bits_source(master_splitter_auto_out_0_c_bits_source),
    .auto_out_0_c_bits_address(master_splitter_auto_out_0_c_bits_address),
    .auto_out_0_c_bits_data(master_splitter_auto_out_0_c_bits_data),
    .auto_out_0_c_bits_corrupt(master_splitter_auto_out_0_c_bits_corrupt),
    .auto_out_0_d_ready(master_splitter_auto_out_0_d_ready),
    .auto_out_0_d_valid(master_splitter_auto_out_0_d_valid),
    .auto_out_0_d_bits_opcode(master_splitter_auto_out_0_d_bits_opcode),
    .auto_out_0_d_bits_param(master_splitter_auto_out_0_d_bits_param),
    .auto_out_0_d_bits_size(master_splitter_auto_out_0_d_bits_size),
    .auto_out_0_d_bits_source(master_splitter_auto_out_0_d_bits_source),
    .auto_out_0_d_bits_sink(master_splitter_auto_out_0_d_bits_sink),
    .auto_out_0_d_bits_denied(master_splitter_auto_out_0_d_bits_denied),
    .auto_out_0_d_bits_data(master_splitter_auto_out_0_d_bits_data),
    .auto_out_0_d_bits_corrupt(master_splitter_auto_out_0_d_bits_corrupt),
    .auto_out_0_e_ready(master_splitter_auto_out_0_e_ready),
    .auto_out_0_e_valid(master_splitter_auto_out_0_e_valid),
    .auto_out_0_e_bits_sink(master_splitter_auto_out_0_e_bits_sink)
  );
  SimpleLazyModule_11 wrapped_error_device ( 
    .clock(wrapped_error_device_clock),
    .reset(wrapped_error_device_reset),
    .auto_buffer_in_a_ready(wrapped_error_device_auto_buffer_in_a_ready),
    .auto_buffer_in_a_valid(wrapped_error_device_auto_buffer_in_a_valid),
    .auto_buffer_in_a_bits_opcode(wrapped_error_device_auto_buffer_in_a_bits_opcode),
    .auto_buffer_in_a_bits_param(wrapped_error_device_auto_buffer_in_a_bits_param),
    .auto_buffer_in_a_bits_size(wrapped_error_device_auto_buffer_in_a_bits_size),
    .auto_buffer_in_a_bits_source(wrapped_error_device_auto_buffer_in_a_bits_source),
    .auto_buffer_in_a_bits_address(wrapped_error_device_auto_buffer_in_a_bits_address),
    .auto_buffer_in_a_bits_mask(wrapped_error_device_auto_buffer_in_a_bits_mask),
    .auto_buffer_in_a_bits_corrupt(wrapped_error_device_auto_buffer_in_a_bits_corrupt),
    .auto_buffer_in_b_ready(wrapped_error_device_auto_buffer_in_b_ready),
    .auto_buffer_in_b_valid(wrapped_error_device_auto_buffer_in_b_valid),
    .auto_buffer_in_b_bits_opcode(wrapped_error_device_auto_buffer_in_b_bits_opcode),
    .auto_buffer_in_b_bits_param(wrapped_error_device_auto_buffer_in_b_bits_param),
    .auto_buffer_in_b_bits_size(wrapped_error_device_auto_buffer_in_b_bits_size),
    .auto_buffer_in_b_bits_source(wrapped_error_device_auto_buffer_in_b_bits_source),
    .auto_buffer_in_b_bits_address(wrapped_error_device_auto_buffer_in_b_bits_address),
    .auto_buffer_in_b_bits_mask(wrapped_error_device_auto_buffer_in_b_bits_mask),
    .auto_buffer_in_b_bits_data(wrapped_error_device_auto_buffer_in_b_bits_data),
    .auto_buffer_in_b_bits_corrupt(wrapped_error_device_auto_buffer_in_b_bits_corrupt),
    .auto_buffer_in_c_ready(wrapped_error_device_auto_buffer_in_c_ready),
    .auto_buffer_in_c_valid(wrapped_error_device_auto_buffer_in_c_valid),
    .auto_buffer_in_c_bits_opcode(wrapped_error_device_auto_buffer_in_c_bits_opcode),
    .auto_buffer_in_c_bits_param(wrapped_error_device_auto_buffer_in_c_bits_param),
    .auto_buffer_in_c_bits_size(wrapped_error_device_auto_buffer_in_c_bits_size),
    .auto_buffer_in_c_bits_source(wrapped_error_device_auto_buffer_in_c_bits_source),
    .auto_buffer_in_c_bits_address(wrapped_error_device_auto_buffer_in_c_bits_address),
    .auto_buffer_in_c_bits_corrupt(wrapped_error_device_auto_buffer_in_c_bits_corrupt),
    .auto_buffer_in_d_ready(wrapped_error_device_auto_buffer_in_d_ready),
    .auto_buffer_in_d_valid(wrapped_error_device_auto_buffer_in_d_valid),
    .auto_buffer_in_d_bits_opcode(wrapped_error_device_auto_buffer_in_d_bits_opcode),
    .auto_buffer_in_d_bits_param(wrapped_error_device_auto_buffer_in_d_bits_param),
    .auto_buffer_in_d_bits_size(wrapped_error_device_auto_buffer_in_d_bits_size),
    .auto_buffer_in_d_bits_source(wrapped_error_device_auto_buffer_in_d_bits_source),
    .auto_buffer_in_d_bits_sink(wrapped_error_device_auto_buffer_in_d_bits_sink),
    .auto_buffer_in_d_bits_denied(wrapped_error_device_auto_buffer_in_d_bits_denied),
    .auto_buffer_in_d_bits_data(wrapped_error_device_auto_buffer_in_d_bits_data),
    .auto_buffer_in_d_bits_corrupt(wrapped_error_device_auto_buffer_in_d_bits_corrupt),
    .auto_buffer_in_e_ready(wrapped_error_device_auto_buffer_in_e_ready),
    .auto_buffer_in_e_valid(wrapped_error_device_auto_buffer_in_e_valid)
  );
  Simple_Tile_X2X coupler_from_tile_named_tile ( 
    .s_clock(tile_clock),
    .s_reset(tile_reset),
    .m_clock(coupler_from_tile_named_tile_clock),
    .m_reset(coupler_from_tile_named_tile_reset),
    .auto_buffer_out_a_ready(coupler_from_tile_named_tile_auto_buffer_out_a_ready),
    .auto_buffer_out_a_valid(coupler_from_tile_named_tile_auto_buffer_out_a_valid),
    .auto_buffer_out_a_bits_opcode(coupler_from_tile_named_tile_auto_buffer_out_a_bits_opcode),
    .auto_buffer_out_a_bits_param(coupler_from_tile_named_tile_auto_buffer_out_a_bits_param),
    .auto_buffer_out_a_bits_size(coupler_from_tile_named_tile_auto_buffer_out_a_bits_size),
    .auto_buffer_out_a_bits_source(coupler_from_tile_named_tile_auto_buffer_out_a_bits_source),
    .auto_buffer_out_a_bits_address(coupler_from_tile_named_tile_auto_buffer_out_a_bits_address),
    .auto_buffer_out_a_bits_mask(coupler_from_tile_named_tile_auto_buffer_out_a_bits_mask),
    .auto_buffer_out_a_bits_data(coupler_from_tile_named_tile_auto_buffer_out_a_bits_data),
    .auto_buffer_out_a_bits_corrupt(coupler_from_tile_named_tile_auto_buffer_out_a_bits_corrupt),
    .auto_buffer_out_b_ready(coupler_from_tile_named_tile_auto_buffer_out_b_ready),
    .auto_buffer_out_b_valid(coupler_from_tile_named_tile_auto_buffer_out_b_valid),
    .auto_buffer_out_b_bits_opcode(coupler_from_tile_named_tile_auto_buffer_out_b_bits_opcode),
    .auto_buffer_out_b_bits_param(coupler_from_tile_named_tile_auto_buffer_out_b_bits_param),
    .auto_buffer_out_b_bits_size(coupler_from_tile_named_tile_auto_buffer_out_b_bits_size),
    .auto_buffer_out_b_bits_source(coupler_from_tile_named_tile_auto_buffer_out_b_bits_source),
    .auto_buffer_out_b_bits_address(coupler_from_tile_named_tile_auto_buffer_out_b_bits_address),
    .auto_buffer_out_b_bits_mask(coupler_from_tile_named_tile_auto_buffer_out_b_bits_mask),
    .auto_buffer_out_b_bits_corrupt(coupler_from_tile_named_tile_auto_buffer_out_b_bits_corrupt),
    .auto_buffer_out_c_ready(coupler_from_tile_named_tile_auto_buffer_out_c_ready),
    .auto_buffer_out_c_valid(coupler_from_tile_named_tile_auto_buffer_out_c_valid),
    .auto_buffer_out_c_bits_opcode(coupler_from_tile_named_tile_auto_buffer_out_c_bits_opcode),
    .auto_buffer_out_c_bits_param(coupler_from_tile_named_tile_auto_buffer_out_c_bits_param),
    .auto_buffer_out_c_bits_size(coupler_from_tile_named_tile_auto_buffer_out_c_bits_size),
    .auto_buffer_out_c_bits_source(coupler_from_tile_named_tile_auto_buffer_out_c_bits_source),
    .auto_buffer_out_c_bits_address(coupler_from_tile_named_tile_auto_buffer_out_c_bits_address),
    .auto_buffer_out_c_bits_data(coupler_from_tile_named_tile_auto_buffer_out_c_bits_data),
    .auto_buffer_out_c_bits_corrupt(coupler_from_tile_named_tile_auto_buffer_out_c_bits_corrupt),
    .auto_buffer_out_d_ready(coupler_from_tile_named_tile_auto_buffer_out_d_ready),
    .auto_buffer_out_d_valid(coupler_from_tile_named_tile_auto_buffer_out_d_valid),
    .auto_buffer_out_d_bits_opcode(coupler_from_tile_named_tile_auto_buffer_out_d_bits_opcode),
    .auto_buffer_out_d_bits_param(coupler_from_tile_named_tile_auto_buffer_out_d_bits_param),
    .auto_buffer_out_d_bits_size(coupler_from_tile_named_tile_auto_buffer_out_d_bits_size),
    .auto_buffer_out_d_bits_source(coupler_from_tile_named_tile_auto_buffer_out_d_bits_source),
    .auto_buffer_out_d_bits_sink(coupler_from_tile_named_tile_auto_buffer_out_d_bits_sink),
    .auto_buffer_out_d_bits_denied(coupler_from_tile_named_tile_auto_buffer_out_d_bits_denied),
    .auto_buffer_out_d_bits_data(coupler_from_tile_named_tile_auto_buffer_out_d_bits_data),
    .auto_buffer_out_d_bits_corrupt(coupler_from_tile_named_tile_auto_buffer_out_d_bits_corrupt),
    .auto_buffer_out_e_ready(coupler_from_tile_named_tile_auto_buffer_out_e_ready),
    .auto_buffer_out_e_valid(coupler_from_tile_named_tile_auto_buffer_out_e_valid),
    .auto_buffer_out_e_bits_sink(coupler_from_tile_named_tile_auto_buffer_out_e_bits_sink),
    .auto_tl_master_xing_in_a_ready(coupler_from_tile_named_tile_auto_tl_master_xing_in_a_ready),
    .auto_tl_master_xing_in_a_valid(coupler_from_tile_named_tile_auto_tl_master_xing_in_a_valid),
    .auto_tl_master_xing_in_a_bits_opcode(coupler_from_tile_named_tile_auto_tl_master_xing_in_a_bits_opcode),
    .auto_tl_master_xing_in_a_bits_param(coupler_from_tile_named_tile_auto_tl_master_xing_in_a_bits_param),
    .auto_tl_master_xing_in_a_bits_size(coupler_from_tile_named_tile_auto_tl_master_xing_in_a_bits_size),
    .auto_tl_master_xing_in_a_bits_source(coupler_from_tile_named_tile_auto_tl_master_xing_in_a_bits_source),
    .auto_tl_master_xing_in_a_bits_address(coupler_from_tile_named_tile_auto_tl_master_xing_in_a_bits_address),
    .auto_tl_master_xing_in_a_bits_mask(coupler_from_tile_named_tile_auto_tl_master_xing_in_a_bits_mask),
    .auto_tl_master_xing_in_a_bits_data(coupler_from_tile_named_tile_auto_tl_master_xing_in_a_bits_data),
    .auto_tl_master_xing_in_a_bits_corrupt(coupler_from_tile_named_tile_auto_tl_master_xing_in_a_bits_corrupt),
    .auto_tl_master_xing_in_b_ready(coupler_from_tile_named_tile_auto_tl_master_xing_in_b_ready),
    .auto_tl_master_xing_in_b_valid(coupler_from_tile_named_tile_auto_tl_master_xing_in_b_valid),
    .auto_tl_master_xing_in_b_bits_opcode(coupler_from_tile_named_tile_auto_tl_master_xing_in_b_bits_opcode),
    .auto_tl_master_xing_in_b_bits_param(coupler_from_tile_named_tile_auto_tl_master_xing_in_b_bits_param),
    .auto_tl_master_xing_in_b_bits_size(coupler_from_tile_named_tile_auto_tl_master_xing_in_b_bits_size),
    .auto_tl_master_xing_in_b_bits_source(coupler_from_tile_named_tile_auto_tl_master_xing_in_b_bits_source),
    .auto_tl_master_xing_in_b_bits_address(coupler_from_tile_named_tile_auto_tl_master_xing_in_b_bits_address),
    .auto_tl_master_xing_in_b_bits_mask(coupler_from_tile_named_tile_auto_tl_master_xing_in_b_bits_mask),
    .auto_tl_master_xing_in_b_bits_corrupt(coupler_from_tile_named_tile_auto_tl_master_xing_in_b_bits_corrupt),
    .auto_tl_master_xing_in_c_ready(coupler_from_tile_named_tile_auto_tl_master_xing_in_c_ready),
    .auto_tl_master_xing_in_c_valid(coupler_from_tile_named_tile_auto_tl_master_xing_in_c_valid),
    .auto_tl_master_xing_in_c_bits_opcode(coupler_from_tile_named_tile_auto_tl_master_xing_in_c_bits_opcode),
    .auto_tl_master_xing_in_c_bits_param(coupler_from_tile_named_tile_auto_tl_master_xing_in_c_bits_param),
    .auto_tl_master_xing_in_c_bits_size(coupler_from_tile_named_tile_auto_tl_master_xing_in_c_bits_size),
    .auto_tl_master_xing_in_c_bits_source(coupler_from_tile_named_tile_auto_tl_master_xing_in_c_bits_source),
    .auto_tl_master_xing_in_c_bits_address(coupler_from_tile_named_tile_auto_tl_master_xing_in_c_bits_address),
    .auto_tl_master_xing_in_c_bits_data(coupler_from_tile_named_tile_auto_tl_master_xing_in_c_bits_data),
    .auto_tl_master_xing_in_c_bits_corrupt(coupler_from_tile_named_tile_auto_tl_master_xing_in_c_bits_corrupt),
    .auto_tl_master_xing_in_d_ready(coupler_from_tile_named_tile_auto_tl_master_xing_in_d_ready),
    .auto_tl_master_xing_in_d_valid(coupler_from_tile_named_tile_auto_tl_master_xing_in_d_valid),
    .auto_tl_master_xing_in_d_bits_opcode(coupler_from_tile_named_tile_auto_tl_master_xing_in_d_bits_opcode),
    .auto_tl_master_xing_in_d_bits_param(coupler_from_tile_named_tile_auto_tl_master_xing_in_d_bits_param),
    .auto_tl_master_xing_in_d_bits_size(coupler_from_tile_named_tile_auto_tl_master_xing_in_d_bits_size),
    .auto_tl_master_xing_in_d_bits_source(coupler_from_tile_named_tile_auto_tl_master_xing_in_d_bits_source),
    .auto_tl_master_xing_in_d_bits_sink(coupler_from_tile_named_tile_auto_tl_master_xing_in_d_bits_sink),
    .auto_tl_master_xing_in_d_bits_denied(coupler_from_tile_named_tile_auto_tl_master_xing_in_d_bits_denied),
    .auto_tl_master_xing_in_d_bits_data(coupler_from_tile_named_tile_auto_tl_master_xing_in_d_bits_data),
    .auto_tl_master_xing_in_d_bits_corrupt(coupler_from_tile_named_tile_auto_tl_master_xing_in_d_bits_corrupt),
    .auto_tl_master_xing_in_e_ready(coupler_from_tile_named_tile_auto_tl_master_xing_in_e_ready),
    .auto_tl_master_xing_in_e_valid(coupler_from_tile_named_tile_auto_tl_master_xing_in_e_valid),
    .auto_tl_master_xing_in_e_bits_sink(coupler_from_tile_named_tile_auto_tl_master_xing_in_e_bits_sink)
  );
  Simple_Tile_X2X coupler_from_tile_named_tile_1 ( 
    .s_clock(tile_1_clock),
    .s_reset(tile_1_reset),
    .m_clock(coupler_from_tile_named_tile_1_clock),
    .m_reset(coupler_from_tile_named_tile_1_reset),
    .auto_buffer_out_a_ready(coupler_from_tile_named_tile_1_auto_buffer_out_a_ready),
    .auto_buffer_out_a_valid(coupler_from_tile_named_tile_1_auto_buffer_out_a_valid),
    .auto_buffer_out_a_bits_opcode(coupler_from_tile_named_tile_1_auto_buffer_out_a_bits_opcode),
    .auto_buffer_out_a_bits_param(coupler_from_tile_named_tile_1_auto_buffer_out_a_bits_param),
    .auto_buffer_out_a_bits_size(coupler_from_tile_named_tile_1_auto_buffer_out_a_bits_size),
    .auto_buffer_out_a_bits_source(coupler_from_tile_named_tile_1_auto_buffer_out_a_bits_source),
    .auto_buffer_out_a_bits_address(coupler_from_tile_named_tile_1_auto_buffer_out_a_bits_address),
    .auto_buffer_out_a_bits_mask(coupler_from_tile_named_tile_1_auto_buffer_out_a_bits_mask),
    .auto_buffer_out_a_bits_data(coupler_from_tile_named_tile_1_auto_buffer_out_a_bits_data),
    .auto_buffer_out_a_bits_corrupt(coupler_from_tile_named_tile_1_auto_buffer_out_a_bits_corrupt),
    .auto_buffer_out_b_ready(coupler_from_tile_named_tile_1_auto_buffer_out_b_ready),
    .auto_buffer_out_b_valid(coupler_from_tile_named_tile_1_auto_buffer_out_b_valid),
    .auto_buffer_out_b_bits_opcode(coupler_from_tile_named_tile_1_auto_buffer_out_b_bits_opcode),
    .auto_buffer_out_b_bits_param(coupler_from_tile_named_tile_1_auto_buffer_out_b_bits_param),
    .auto_buffer_out_b_bits_size(coupler_from_tile_named_tile_1_auto_buffer_out_b_bits_size),
    .auto_buffer_out_b_bits_source(coupler_from_tile_named_tile_1_auto_buffer_out_b_bits_source),
    .auto_buffer_out_b_bits_address(coupler_from_tile_named_tile_1_auto_buffer_out_b_bits_address),
    .auto_buffer_out_b_bits_mask(coupler_from_tile_named_tile_1_auto_buffer_out_b_bits_mask),
    .auto_buffer_out_b_bits_corrupt(coupler_from_tile_named_tile_1_auto_buffer_out_b_bits_corrupt),
    .auto_buffer_out_c_ready(coupler_from_tile_named_tile_1_auto_buffer_out_c_ready),
    .auto_buffer_out_c_valid(coupler_from_tile_named_tile_1_auto_buffer_out_c_valid),
    .auto_buffer_out_c_bits_opcode(coupler_from_tile_named_tile_1_auto_buffer_out_c_bits_opcode),
    .auto_buffer_out_c_bits_param(coupler_from_tile_named_tile_1_auto_buffer_out_c_bits_param),
    .auto_buffer_out_c_bits_size(coupler_from_tile_named_tile_1_auto_buffer_out_c_bits_size),
    .auto_buffer_out_c_bits_source(coupler_from_tile_named_tile_1_auto_buffer_out_c_bits_source),
    .auto_buffer_out_c_bits_address(coupler_from_tile_named_tile_1_auto_buffer_out_c_bits_address),
    .auto_buffer_out_c_bits_data(coupler_from_tile_named_tile_1_auto_buffer_out_c_bits_data),
    .auto_buffer_out_c_bits_corrupt(coupler_from_tile_named_tile_1_auto_buffer_out_c_bits_corrupt),
    .auto_buffer_out_d_ready(coupler_from_tile_named_tile_1_auto_buffer_out_d_ready),
    .auto_buffer_out_d_valid(coupler_from_tile_named_tile_1_auto_buffer_out_d_valid),
    .auto_buffer_out_d_bits_opcode(coupler_from_tile_named_tile_1_auto_buffer_out_d_bits_opcode),
    .auto_buffer_out_d_bits_param(coupler_from_tile_named_tile_1_auto_buffer_out_d_bits_param),
    .auto_buffer_out_d_bits_size(coupler_from_tile_named_tile_1_auto_buffer_out_d_bits_size),
    .auto_buffer_out_d_bits_source(coupler_from_tile_named_tile_1_auto_buffer_out_d_bits_source),
    .auto_buffer_out_d_bits_sink(coupler_from_tile_named_tile_1_auto_buffer_out_d_bits_sink),
    .auto_buffer_out_d_bits_denied(coupler_from_tile_named_tile_1_auto_buffer_out_d_bits_denied),
    .auto_buffer_out_d_bits_data(coupler_from_tile_named_tile_1_auto_buffer_out_d_bits_data),
    .auto_buffer_out_d_bits_corrupt(coupler_from_tile_named_tile_1_auto_buffer_out_d_bits_corrupt),
    .auto_buffer_out_e_ready(coupler_from_tile_named_tile_1_auto_buffer_out_e_ready),
    .auto_buffer_out_e_valid(coupler_from_tile_named_tile_1_auto_buffer_out_e_valid),
    .auto_buffer_out_e_bits_sink(coupler_from_tile_named_tile_1_auto_buffer_out_e_bits_sink),
    .auto_tl_master_xing_in_a_ready(coupler_from_tile_named_tile_1_auto_tl_master_xing_in_a_ready),
    .auto_tl_master_xing_in_a_valid(coupler_from_tile_named_tile_1_auto_tl_master_xing_in_a_valid),
    .auto_tl_master_xing_in_a_bits_opcode(coupler_from_tile_named_tile_1_auto_tl_master_xing_in_a_bits_opcode),
    .auto_tl_master_xing_in_a_bits_param(coupler_from_tile_named_tile_1_auto_tl_master_xing_in_a_bits_param),
    .auto_tl_master_xing_in_a_bits_size(coupler_from_tile_named_tile_1_auto_tl_master_xing_in_a_bits_size),
    .auto_tl_master_xing_in_a_bits_source(coupler_from_tile_named_tile_1_auto_tl_master_xing_in_a_bits_source),
    .auto_tl_master_xing_in_a_bits_address(coupler_from_tile_named_tile_1_auto_tl_master_xing_in_a_bits_address),
    .auto_tl_master_xing_in_a_bits_mask(coupler_from_tile_named_tile_1_auto_tl_master_xing_in_a_bits_mask),
    .auto_tl_master_xing_in_a_bits_data(coupler_from_tile_named_tile_1_auto_tl_master_xing_in_a_bits_data),
    .auto_tl_master_xing_in_a_bits_corrupt(coupler_from_tile_named_tile_1_auto_tl_master_xing_in_a_bits_corrupt),
    .auto_tl_master_xing_in_b_ready(coupler_from_tile_named_tile_1_auto_tl_master_xing_in_b_ready),
    .auto_tl_master_xing_in_b_valid(coupler_from_tile_named_tile_1_auto_tl_master_xing_in_b_valid),
    .auto_tl_master_xing_in_b_bits_opcode(coupler_from_tile_named_tile_1_auto_tl_master_xing_in_b_bits_opcode),
    .auto_tl_master_xing_in_b_bits_param(coupler_from_tile_named_tile_1_auto_tl_master_xing_in_b_bits_param),
    .auto_tl_master_xing_in_b_bits_size(coupler_from_tile_named_tile_1_auto_tl_master_xing_in_b_bits_size),
    .auto_tl_master_xing_in_b_bits_source(coupler_from_tile_named_tile_1_auto_tl_master_xing_in_b_bits_source),
    .auto_tl_master_xing_in_b_bits_address(coupler_from_tile_named_tile_1_auto_tl_master_xing_in_b_bits_address),
    .auto_tl_master_xing_in_b_bits_mask(coupler_from_tile_named_tile_1_auto_tl_master_xing_in_b_bits_mask),
    .auto_tl_master_xing_in_b_bits_corrupt(coupler_from_tile_named_tile_1_auto_tl_master_xing_in_b_bits_corrupt),
    .auto_tl_master_xing_in_c_ready(coupler_from_tile_named_tile_1_auto_tl_master_xing_in_c_ready),
    .auto_tl_master_xing_in_c_valid(coupler_from_tile_named_tile_1_auto_tl_master_xing_in_c_valid),
    .auto_tl_master_xing_in_c_bits_opcode(coupler_from_tile_named_tile_1_auto_tl_master_xing_in_c_bits_opcode),
    .auto_tl_master_xing_in_c_bits_param(coupler_from_tile_named_tile_1_auto_tl_master_xing_in_c_bits_param),
    .auto_tl_master_xing_in_c_bits_size(coupler_from_tile_named_tile_1_auto_tl_master_xing_in_c_bits_size),
    .auto_tl_master_xing_in_c_bits_source(coupler_from_tile_named_tile_1_auto_tl_master_xing_in_c_bits_source),
    .auto_tl_master_xing_in_c_bits_address(coupler_from_tile_named_tile_1_auto_tl_master_xing_in_c_bits_address),
    .auto_tl_master_xing_in_c_bits_data(coupler_from_tile_named_tile_1_auto_tl_master_xing_in_c_bits_data),
    .auto_tl_master_xing_in_c_bits_corrupt(coupler_from_tile_named_tile_1_auto_tl_master_xing_in_c_bits_corrupt),
    .auto_tl_master_xing_in_d_ready(coupler_from_tile_named_tile_1_auto_tl_master_xing_in_d_ready),
    .auto_tl_master_xing_in_d_valid(coupler_from_tile_named_tile_1_auto_tl_master_xing_in_d_valid),
    .auto_tl_master_xing_in_d_bits_opcode(coupler_from_tile_named_tile_1_auto_tl_master_xing_in_d_bits_opcode),
    .auto_tl_master_xing_in_d_bits_param(coupler_from_tile_named_tile_1_auto_tl_master_xing_in_d_bits_param),
    .auto_tl_master_xing_in_d_bits_size(coupler_from_tile_named_tile_1_auto_tl_master_xing_in_d_bits_size),
    .auto_tl_master_xing_in_d_bits_source(coupler_from_tile_named_tile_1_auto_tl_master_xing_in_d_bits_source),
    .auto_tl_master_xing_in_d_bits_sink(coupler_from_tile_named_tile_1_auto_tl_master_xing_in_d_bits_sink),
    .auto_tl_master_xing_in_d_bits_denied(coupler_from_tile_named_tile_1_auto_tl_master_xing_in_d_bits_denied),
    .auto_tl_master_xing_in_d_bits_data(coupler_from_tile_named_tile_1_auto_tl_master_xing_in_d_bits_data),
    .auto_tl_master_xing_in_d_bits_corrupt(coupler_from_tile_named_tile_1_auto_tl_master_xing_in_d_bits_corrupt),
    .auto_tl_master_xing_in_e_ready(coupler_from_tile_named_tile_1_auto_tl_master_xing_in_e_ready),
    .auto_tl_master_xing_in_e_valid(coupler_from_tile_named_tile_1_auto_tl_master_xing_in_e_valid),
    .auto_tl_master_xing_in_e_bits_sink(coupler_from_tile_named_tile_1_auto_tl_master_xing_in_e_bits_sink)
  );
  Simple_Tile_X2X coupler_from_tile_named_tile_2 ( 
    .s_clock(tile_2_clock),
    .s_reset(tile_2_reset),
    .m_clock(coupler_from_tile_named_tile_2_clock),
    .m_reset(coupler_from_tile_named_tile_2_reset),
    .auto_buffer_out_a_ready(coupler_from_tile_named_tile_2_auto_buffer_out_a_ready),
    .auto_buffer_out_a_valid(coupler_from_tile_named_tile_2_auto_buffer_out_a_valid),
    .auto_buffer_out_a_bits_opcode(coupler_from_tile_named_tile_2_auto_buffer_out_a_bits_opcode),
    .auto_buffer_out_a_bits_param(coupler_from_tile_named_tile_2_auto_buffer_out_a_bits_param),
    .auto_buffer_out_a_bits_size(coupler_from_tile_named_tile_2_auto_buffer_out_a_bits_size),
    .auto_buffer_out_a_bits_source(coupler_from_tile_named_tile_2_auto_buffer_out_a_bits_source),
    .auto_buffer_out_a_bits_address(coupler_from_tile_named_tile_2_auto_buffer_out_a_bits_address),
    .auto_buffer_out_a_bits_mask(coupler_from_tile_named_tile_2_auto_buffer_out_a_bits_mask),
    .auto_buffer_out_a_bits_data(coupler_from_tile_named_tile_2_auto_buffer_out_a_bits_data),
    .auto_buffer_out_a_bits_corrupt(coupler_from_tile_named_tile_2_auto_buffer_out_a_bits_corrupt),
    .auto_buffer_out_b_ready(coupler_from_tile_named_tile_2_auto_buffer_out_b_ready),
    .auto_buffer_out_b_valid(coupler_from_tile_named_tile_2_auto_buffer_out_b_valid),
    .auto_buffer_out_b_bits_opcode(coupler_from_tile_named_tile_2_auto_buffer_out_b_bits_opcode),
    .auto_buffer_out_b_bits_param(coupler_from_tile_named_tile_2_auto_buffer_out_b_bits_param),
    .auto_buffer_out_b_bits_size(coupler_from_tile_named_tile_2_auto_buffer_out_b_bits_size),
    .auto_buffer_out_b_bits_source(coupler_from_tile_named_tile_2_auto_buffer_out_b_bits_source),
    .auto_buffer_out_b_bits_address(coupler_from_tile_named_tile_2_auto_buffer_out_b_bits_address),
    .auto_buffer_out_b_bits_mask(coupler_from_tile_named_tile_2_auto_buffer_out_b_bits_mask),
    .auto_buffer_out_b_bits_corrupt(coupler_from_tile_named_tile_2_auto_buffer_out_b_bits_corrupt),
    .auto_buffer_out_c_ready(coupler_from_tile_named_tile_2_auto_buffer_out_c_ready),
    .auto_buffer_out_c_valid(coupler_from_tile_named_tile_2_auto_buffer_out_c_valid),
    .auto_buffer_out_c_bits_opcode(coupler_from_tile_named_tile_2_auto_buffer_out_c_bits_opcode),
    .auto_buffer_out_c_bits_param(coupler_from_tile_named_tile_2_auto_buffer_out_c_bits_param),
    .auto_buffer_out_c_bits_size(coupler_from_tile_named_tile_2_auto_buffer_out_c_bits_size),
    .auto_buffer_out_c_bits_source(coupler_from_tile_named_tile_2_auto_buffer_out_c_bits_source),
    .auto_buffer_out_c_bits_address(coupler_from_tile_named_tile_2_auto_buffer_out_c_bits_address),
    .auto_buffer_out_c_bits_data(coupler_from_tile_named_tile_2_auto_buffer_out_c_bits_data),
    .auto_buffer_out_c_bits_corrupt(coupler_from_tile_named_tile_2_auto_buffer_out_c_bits_corrupt),
    .auto_buffer_out_d_ready(coupler_from_tile_named_tile_2_auto_buffer_out_d_ready),
    .auto_buffer_out_d_valid(coupler_from_tile_named_tile_2_auto_buffer_out_d_valid),
    .auto_buffer_out_d_bits_opcode(coupler_from_tile_named_tile_2_auto_buffer_out_d_bits_opcode),
    .auto_buffer_out_d_bits_param(coupler_from_tile_named_tile_2_auto_buffer_out_d_bits_param),
    .auto_buffer_out_d_bits_size(coupler_from_tile_named_tile_2_auto_buffer_out_d_bits_size),
    .auto_buffer_out_d_bits_source(coupler_from_tile_named_tile_2_auto_buffer_out_d_bits_source),
    .auto_buffer_out_d_bits_sink(coupler_from_tile_named_tile_2_auto_buffer_out_d_bits_sink),
    .auto_buffer_out_d_bits_denied(coupler_from_tile_named_tile_2_auto_buffer_out_d_bits_denied),
    .auto_buffer_out_d_bits_data(coupler_from_tile_named_tile_2_auto_buffer_out_d_bits_data),
    .auto_buffer_out_d_bits_corrupt(coupler_from_tile_named_tile_2_auto_buffer_out_d_bits_corrupt),
    .auto_buffer_out_e_ready(coupler_from_tile_named_tile_2_auto_buffer_out_e_ready),
    .auto_buffer_out_e_valid(coupler_from_tile_named_tile_2_auto_buffer_out_e_valid),
    .auto_buffer_out_e_bits_sink(coupler_from_tile_named_tile_2_auto_buffer_out_e_bits_sink),
    .auto_tl_master_xing_in_a_ready(coupler_from_tile_named_tile_2_auto_tl_master_xing_in_a_ready),
    .auto_tl_master_xing_in_a_valid(coupler_from_tile_named_tile_2_auto_tl_master_xing_in_a_valid),
    .auto_tl_master_xing_in_a_bits_opcode(coupler_from_tile_named_tile_2_auto_tl_master_xing_in_a_bits_opcode),
    .auto_tl_master_xing_in_a_bits_param(coupler_from_tile_named_tile_2_auto_tl_master_xing_in_a_bits_param),
    .auto_tl_master_xing_in_a_bits_size(coupler_from_tile_named_tile_2_auto_tl_master_xing_in_a_bits_size),
    .auto_tl_master_xing_in_a_bits_source(coupler_from_tile_named_tile_2_auto_tl_master_xing_in_a_bits_source),
    .auto_tl_master_xing_in_a_bits_address(coupler_from_tile_named_tile_2_auto_tl_master_xing_in_a_bits_address),
    .auto_tl_master_xing_in_a_bits_mask(coupler_from_tile_named_tile_2_auto_tl_master_xing_in_a_bits_mask),
    .auto_tl_master_xing_in_a_bits_data(coupler_from_tile_named_tile_2_auto_tl_master_xing_in_a_bits_data),
    .auto_tl_master_xing_in_a_bits_corrupt(coupler_from_tile_named_tile_2_auto_tl_master_xing_in_a_bits_corrupt),
    .auto_tl_master_xing_in_b_ready(coupler_from_tile_named_tile_2_auto_tl_master_xing_in_b_ready),
    .auto_tl_master_xing_in_b_valid(coupler_from_tile_named_tile_2_auto_tl_master_xing_in_b_valid),
    .auto_tl_master_xing_in_b_bits_opcode(coupler_from_tile_named_tile_2_auto_tl_master_xing_in_b_bits_opcode),
    .auto_tl_master_xing_in_b_bits_param(coupler_from_tile_named_tile_2_auto_tl_master_xing_in_b_bits_param),
    .auto_tl_master_xing_in_b_bits_size(coupler_from_tile_named_tile_2_auto_tl_master_xing_in_b_bits_size),
    .auto_tl_master_xing_in_b_bits_source(coupler_from_tile_named_tile_2_auto_tl_master_xing_in_b_bits_source),
    .auto_tl_master_xing_in_b_bits_address(coupler_from_tile_named_tile_2_auto_tl_master_xing_in_b_bits_address),
    .auto_tl_master_xing_in_b_bits_mask(coupler_from_tile_named_tile_2_auto_tl_master_xing_in_b_bits_mask),
    .auto_tl_master_xing_in_b_bits_corrupt(coupler_from_tile_named_tile_2_auto_tl_master_xing_in_b_bits_corrupt),
    .auto_tl_master_xing_in_c_ready(coupler_from_tile_named_tile_2_auto_tl_master_xing_in_c_ready),
    .auto_tl_master_xing_in_c_valid(coupler_from_tile_named_tile_2_auto_tl_master_xing_in_c_valid),
    .auto_tl_master_xing_in_c_bits_opcode(coupler_from_tile_named_tile_2_auto_tl_master_xing_in_c_bits_opcode),
    .auto_tl_master_xing_in_c_bits_param(coupler_from_tile_named_tile_2_auto_tl_master_xing_in_c_bits_param),
    .auto_tl_master_xing_in_c_bits_size(coupler_from_tile_named_tile_2_auto_tl_master_xing_in_c_bits_size),
    .auto_tl_master_xing_in_c_bits_source(coupler_from_tile_named_tile_2_auto_tl_master_xing_in_c_bits_source),
    .auto_tl_master_xing_in_c_bits_address(coupler_from_tile_named_tile_2_auto_tl_master_xing_in_c_bits_address),
    .auto_tl_master_xing_in_c_bits_data(coupler_from_tile_named_tile_2_auto_tl_master_xing_in_c_bits_data),
    .auto_tl_master_xing_in_c_bits_corrupt(coupler_from_tile_named_tile_2_auto_tl_master_xing_in_c_bits_corrupt),
    .auto_tl_master_xing_in_d_ready(coupler_from_tile_named_tile_2_auto_tl_master_xing_in_d_ready),
    .auto_tl_master_xing_in_d_valid(coupler_from_tile_named_tile_2_auto_tl_master_xing_in_d_valid),
    .auto_tl_master_xing_in_d_bits_opcode(coupler_from_tile_named_tile_2_auto_tl_master_xing_in_d_bits_opcode),
    .auto_tl_master_xing_in_d_bits_param(coupler_from_tile_named_tile_2_auto_tl_master_xing_in_d_bits_param),
    .auto_tl_master_xing_in_d_bits_size(coupler_from_tile_named_tile_2_auto_tl_master_xing_in_d_bits_size),
    .auto_tl_master_xing_in_d_bits_source(coupler_from_tile_named_tile_2_auto_tl_master_xing_in_d_bits_source),
    .auto_tl_master_xing_in_d_bits_sink(coupler_from_tile_named_tile_2_auto_tl_master_xing_in_d_bits_sink),
    .auto_tl_master_xing_in_d_bits_denied(coupler_from_tile_named_tile_2_auto_tl_master_xing_in_d_bits_denied),
    .auto_tl_master_xing_in_d_bits_data(coupler_from_tile_named_tile_2_auto_tl_master_xing_in_d_bits_data),
    .auto_tl_master_xing_in_d_bits_corrupt(coupler_from_tile_named_tile_2_auto_tl_master_xing_in_d_bits_corrupt),
    .auto_tl_master_xing_in_e_ready(coupler_from_tile_named_tile_2_auto_tl_master_xing_in_e_ready),
    .auto_tl_master_xing_in_e_valid(coupler_from_tile_named_tile_2_auto_tl_master_xing_in_e_valid),
    .auto_tl_master_xing_in_e_bits_sink(coupler_from_tile_named_tile_2_auto_tl_master_xing_in_e_bits_sink)
  );
  Simple_Tile_X2X coupler_from_tile_named_tile_3 ( 
    .s_clock(tile_3_clock),
    .s_reset(tile_3_reset),
    .m_clock(coupler_from_tile_named_tile_3_clock),
    .m_reset(coupler_from_tile_named_tile_3_reset),
    .auto_buffer_out_a_ready(coupler_from_tile_named_tile_3_auto_buffer_out_a_ready),
    .auto_buffer_out_a_valid(coupler_from_tile_named_tile_3_auto_buffer_out_a_valid),
    .auto_buffer_out_a_bits_opcode(coupler_from_tile_named_tile_3_auto_buffer_out_a_bits_opcode),
    .auto_buffer_out_a_bits_param(coupler_from_tile_named_tile_3_auto_buffer_out_a_bits_param),
    .auto_buffer_out_a_bits_size(coupler_from_tile_named_tile_3_auto_buffer_out_a_bits_size),
    .auto_buffer_out_a_bits_source(coupler_from_tile_named_tile_3_auto_buffer_out_a_bits_source),
    .auto_buffer_out_a_bits_address(coupler_from_tile_named_tile_3_auto_buffer_out_a_bits_address),
    .auto_buffer_out_a_bits_mask(coupler_from_tile_named_tile_3_auto_buffer_out_a_bits_mask),
    .auto_buffer_out_a_bits_data(coupler_from_tile_named_tile_3_auto_buffer_out_a_bits_data),
    .auto_buffer_out_a_bits_corrupt(coupler_from_tile_named_tile_3_auto_buffer_out_a_bits_corrupt),
    .auto_buffer_out_b_ready(coupler_from_tile_named_tile_3_auto_buffer_out_b_ready),
    .auto_buffer_out_b_valid(coupler_from_tile_named_tile_3_auto_buffer_out_b_valid),
    .auto_buffer_out_b_bits_opcode(coupler_from_tile_named_tile_3_auto_buffer_out_b_bits_opcode),
    .auto_buffer_out_b_bits_param(coupler_from_tile_named_tile_3_auto_buffer_out_b_bits_param),
    .auto_buffer_out_b_bits_size(coupler_from_tile_named_tile_3_auto_buffer_out_b_bits_size),
    .auto_buffer_out_b_bits_source(coupler_from_tile_named_tile_3_auto_buffer_out_b_bits_source),
    .auto_buffer_out_b_bits_address(coupler_from_tile_named_tile_3_auto_buffer_out_b_bits_address),
    .auto_buffer_out_b_bits_mask(coupler_from_tile_named_tile_3_auto_buffer_out_b_bits_mask),
    .auto_buffer_out_b_bits_corrupt(coupler_from_tile_named_tile_3_auto_buffer_out_b_bits_corrupt),
    .auto_buffer_out_c_ready(coupler_from_tile_named_tile_3_auto_buffer_out_c_ready),
    .auto_buffer_out_c_valid(coupler_from_tile_named_tile_3_auto_buffer_out_c_valid),
    .auto_buffer_out_c_bits_opcode(coupler_from_tile_named_tile_3_auto_buffer_out_c_bits_opcode),
    .auto_buffer_out_c_bits_param(coupler_from_tile_named_tile_3_auto_buffer_out_c_bits_param),
    .auto_buffer_out_c_bits_size(coupler_from_tile_named_tile_3_auto_buffer_out_c_bits_size),
    .auto_buffer_out_c_bits_source(coupler_from_tile_named_tile_3_auto_buffer_out_c_bits_source),
    .auto_buffer_out_c_bits_address(coupler_from_tile_named_tile_3_auto_buffer_out_c_bits_address),
    .auto_buffer_out_c_bits_data(coupler_from_tile_named_tile_3_auto_buffer_out_c_bits_data),
    .auto_buffer_out_c_bits_corrupt(coupler_from_tile_named_tile_3_auto_buffer_out_c_bits_corrupt),
    .auto_buffer_out_d_ready(coupler_from_tile_named_tile_3_auto_buffer_out_d_ready),
    .auto_buffer_out_d_valid(coupler_from_tile_named_tile_3_auto_buffer_out_d_valid),
    .auto_buffer_out_d_bits_opcode(coupler_from_tile_named_tile_3_auto_buffer_out_d_bits_opcode),
    .auto_buffer_out_d_bits_param(coupler_from_tile_named_tile_3_auto_buffer_out_d_bits_param),
    .auto_buffer_out_d_bits_size(coupler_from_tile_named_tile_3_auto_buffer_out_d_bits_size),
    .auto_buffer_out_d_bits_source(coupler_from_tile_named_tile_3_auto_buffer_out_d_bits_source),
    .auto_buffer_out_d_bits_sink(coupler_from_tile_named_tile_3_auto_buffer_out_d_bits_sink),
    .auto_buffer_out_d_bits_denied(coupler_from_tile_named_tile_3_auto_buffer_out_d_bits_denied),
    .auto_buffer_out_d_bits_data(coupler_from_tile_named_tile_3_auto_buffer_out_d_bits_data),
    .auto_buffer_out_d_bits_corrupt(coupler_from_tile_named_tile_3_auto_buffer_out_d_bits_corrupt),
    .auto_buffer_out_e_ready(coupler_from_tile_named_tile_3_auto_buffer_out_e_ready),
    .auto_buffer_out_e_valid(coupler_from_tile_named_tile_3_auto_buffer_out_e_valid),
    .auto_buffer_out_e_bits_sink(coupler_from_tile_named_tile_3_auto_buffer_out_e_bits_sink),
    .auto_tl_master_xing_in_a_ready(coupler_from_tile_named_tile_3_auto_tl_master_xing_in_a_ready),
    .auto_tl_master_xing_in_a_valid(coupler_from_tile_named_tile_3_auto_tl_master_xing_in_a_valid),
    .auto_tl_master_xing_in_a_bits_opcode(coupler_from_tile_named_tile_3_auto_tl_master_xing_in_a_bits_opcode),
    .auto_tl_master_xing_in_a_bits_param(coupler_from_tile_named_tile_3_auto_tl_master_xing_in_a_bits_param),
    .auto_tl_master_xing_in_a_bits_size(coupler_from_tile_named_tile_3_auto_tl_master_xing_in_a_bits_size),
    .auto_tl_master_xing_in_a_bits_source(coupler_from_tile_named_tile_3_auto_tl_master_xing_in_a_bits_source),
    .auto_tl_master_xing_in_a_bits_address(coupler_from_tile_named_tile_3_auto_tl_master_xing_in_a_bits_address),
    .auto_tl_master_xing_in_a_bits_mask(coupler_from_tile_named_tile_3_auto_tl_master_xing_in_a_bits_mask),
    .auto_tl_master_xing_in_a_bits_data(coupler_from_tile_named_tile_3_auto_tl_master_xing_in_a_bits_data),
    .auto_tl_master_xing_in_a_bits_corrupt(coupler_from_tile_named_tile_3_auto_tl_master_xing_in_a_bits_corrupt),
    .auto_tl_master_xing_in_b_ready(coupler_from_tile_named_tile_3_auto_tl_master_xing_in_b_ready),
    .auto_tl_master_xing_in_b_valid(coupler_from_tile_named_tile_3_auto_tl_master_xing_in_b_valid),
    .auto_tl_master_xing_in_b_bits_opcode(coupler_from_tile_named_tile_3_auto_tl_master_xing_in_b_bits_opcode),
    .auto_tl_master_xing_in_b_bits_param(coupler_from_tile_named_tile_3_auto_tl_master_xing_in_b_bits_param),
    .auto_tl_master_xing_in_b_bits_size(coupler_from_tile_named_tile_3_auto_tl_master_xing_in_b_bits_size),
    .auto_tl_master_xing_in_b_bits_source(coupler_from_tile_named_tile_3_auto_tl_master_xing_in_b_bits_source),
    .auto_tl_master_xing_in_b_bits_address(coupler_from_tile_named_tile_3_auto_tl_master_xing_in_b_bits_address),
    .auto_tl_master_xing_in_b_bits_mask(coupler_from_tile_named_tile_3_auto_tl_master_xing_in_b_bits_mask),
    .auto_tl_master_xing_in_b_bits_corrupt(coupler_from_tile_named_tile_3_auto_tl_master_xing_in_b_bits_corrupt),
    .auto_tl_master_xing_in_c_ready(coupler_from_tile_named_tile_3_auto_tl_master_xing_in_c_ready),
    .auto_tl_master_xing_in_c_valid(coupler_from_tile_named_tile_3_auto_tl_master_xing_in_c_valid),
    .auto_tl_master_xing_in_c_bits_opcode(coupler_from_tile_named_tile_3_auto_tl_master_xing_in_c_bits_opcode),
    .auto_tl_master_xing_in_c_bits_param(coupler_from_tile_named_tile_3_auto_tl_master_xing_in_c_bits_param),
    .auto_tl_master_xing_in_c_bits_size(coupler_from_tile_named_tile_3_auto_tl_master_xing_in_c_bits_size),
    .auto_tl_master_xing_in_c_bits_source(coupler_from_tile_named_tile_3_auto_tl_master_xing_in_c_bits_source),
    .auto_tl_master_xing_in_c_bits_address(coupler_from_tile_named_tile_3_auto_tl_master_xing_in_c_bits_address),
    .auto_tl_master_xing_in_c_bits_data(coupler_from_tile_named_tile_3_auto_tl_master_xing_in_c_bits_data),
    .auto_tl_master_xing_in_c_bits_corrupt(coupler_from_tile_named_tile_3_auto_tl_master_xing_in_c_bits_corrupt),
    .auto_tl_master_xing_in_d_ready(coupler_from_tile_named_tile_3_auto_tl_master_xing_in_d_ready),
    .auto_tl_master_xing_in_d_valid(coupler_from_tile_named_tile_3_auto_tl_master_xing_in_d_valid),
    .auto_tl_master_xing_in_d_bits_opcode(coupler_from_tile_named_tile_3_auto_tl_master_xing_in_d_bits_opcode),
    .auto_tl_master_xing_in_d_bits_param(coupler_from_tile_named_tile_3_auto_tl_master_xing_in_d_bits_param),
    .auto_tl_master_xing_in_d_bits_size(coupler_from_tile_named_tile_3_auto_tl_master_xing_in_d_bits_size),
    .auto_tl_master_xing_in_d_bits_source(coupler_from_tile_named_tile_3_auto_tl_master_xing_in_d_bits_source),
    .auto_tl_master_xing_in_d_bits_sink(coupler_from_tile_named_tile_3_auto_tl_master_xing_in_d_bits_sink),
    .auto_tl_master_xing_in_d_bits_denied(coupler_from_tile_named_tile_3_auto_tl_master_xing_in_d_bits_denied),
    .auto_tl_master_xing_in_d_bits_data(coupler_from_tile_named_tile_3_auto_tl_master_xing_in_d_bits_data),
    .auto_tl_master_xing_in_d_bits_corrupt(coupler_from_tile_named_tile_3_auto_tl_master_xing_in_d_bits_corrupt),
    .auto_tl_master_xing_in_e_ready(coupler_from_tile_named_tile_3_auto_tl_master_xing_in_e_ready),
    .auto_tl_master_xing_in_e_valid(coupler_from_tile_named_tile_3_auto_tl_master_xing_in_e_valid),
    .auto_tl_master_xing_in_e_bits_sink(coupler_from_tile_named_tile_3_auto_tl_master_xing_in_e_bits_sink)
  );
  SimpleLazyModule_18 coupler_from_master_named_pcie_0 ( 
    .clock(coupler_from_master_named_pcie_0_clock),
    .reset(coupler_from_master_named_pcie_0_reset),
    .auto_fixer_in_a_ready(coupler_from_master_named_pcie_0_auto_fixer_in_a_ready),
    .auto_fixer_in_a_valid(coupler_from_master_named_pcie_0_auto_fixer_in_a_valid),
    .auto_fixer_in_a_bits_opcode(coupler_from_master_named_pcie_0_auto_fixer_in_a_bits_opcode),
    .auto_fixer_in_a_bits_param(coupler_from_master_named_pcie_0_auto_fixer_in_a_bits_param),
    .auto_fixer_in_a_bits_size(coupler_from_master_named_pcie_0_auto_fixer_in_a_bits_size),
    .auto_fixer_in_a_bits_source(coupler_from_master_named_pcie_0_auto_fixer_in_a_bits_source),
    .auto_fixer_in_a_bits_address(coupler_from_master_named_pcie_0_auto_fixer_in_a_bits_address),
    .auto_fixer_in_a_bits_mask(coupler_from_master_named_pcie_0_auto_fixer_in_a_bits_mask),
    .auto_fixer_in_a_bits_data(coupler_from_master_named_pcie_0_auto_fixer_in_a_bits_data),
    .auto_fixer_in_a_bits_corrupt(coupler_from_master_named_pcie_0_auto_fixer_in_a_bits_corrupt),
    .auto_fixer_in_d_ready(coupler_from_master_named_pcie_0_auto_fixer_in_d_ready),
    .auto_fixer_in_d_valid(coupler_from_master_named_pcie_0_auto_fixer_in_d_valid),
    .auto_fixer_in_d_bits_opcode(coupler_from_master_named_pcie_0_auto_fixer_in_d_bits_opcode),
    .auto_fixer_in_d_bits_param(coupler_from_master_named_pcie_0_auto_fixer_in_d_bits_param),
    .auto_fixer_in_d_bits_size(coupler_from_master_named_pcie_0_auto_fixer_in_d_bits_size),
    .auto_fixer_in_d_bits_source(coupler_from_master_named_pcie_0_auto_fixer_in_d_bits_source),
    .auto_fixer_in_d_bits_sink(coupler_from_master_named_pcie_0_auto_fixer_in_d_bits_sink),
    .auto_fixer_in_d_bits_denied(coupler_from_master_named_pcie_0_auto_fixer_in_d_bits_denied),
    .auto_fixer_in_d_bits_data(coupler_from_master_named_pcie_0_auto_fixer_in_d_bits_data),
    .auto_fixer_in_d_bits_corrupt(coupler_from_master_named_pcie_0_auto_fixer_in_d_bits_corrupt),
    .auto_buffer_out_a_ready(coupler_from_master_named_pcie_0_auto_buffer_out_a_ready),
    .auto_buffer_out_a_valid(coupler_from_master_named_pcie_0_auto_buffer_out_a_valid),
    .auto_buffer_out_a_bits_opcode(coupler_from_master_named_pcie_0_auto_buffer_out_a_bits_opcode),
    .auto_buffer_out_a_bits_param(coupler_from_master_named_pcie_0_auto_buffer_out_a_bits_param),
    .auto_buffer_out_a_bits_size(coupler_from_master_named_pcie_0_auto_buffer_out_a_bits_size),
    .auto_buffer_out_a_bits_source(coupler_from_master_named_pcie_0_auto_buffer_out_a_bits_source),
    .auto_buffer_out_a_bits_address(coupler_from_master_named_pcie_0_auto_buffer_out_a_bits_address),
    .auto_buffer_out_a_bits_mask(coupler_from_master_named_pcie_0_auto_buffer_out_a_bits_mask),
    .auto_buffer_out_a_bits_data(coupler_from_master_named_pcie_0_auto_buffer_out_a_bits_data),
    .auto_buffer_out_a_bits_corrupt(coupler_from_master_named_pcie_0_auto_buffer_out_a_bits_corrupt),
    .auto_buffer_out_d_ready(coupler_from_master_named_pcie_0_auto_buffer_out_d_ready),
    .auto_buffer_out_d_valid(coupler_from_master_named_pcie_0_auto_buffer_out_d_valid),
    .auto_buffer_out_d_bits_opcode(coupler_from_master_named_pcie_0_auto_buffer_out_d_bits_opcode),
    .auto_buffer_out_d_bits_param(coupler_from_master_named_pcie_0_auto_buffer_out_d_bits_param),
    .auto_buffer_out_d_bits_size(coupler_from_master_named_pcie_0_auto_buffer_out_d_bits_size),
    .auto_buffer_out_d_bits_source(coupler_from_master_named_pcie_0_auto_buffer_out_d_bits_source),
    .auto_buffer_out_d_bits_sink(coupler_from_master_named_pcie_0_auto_buffer_out_d_bits_sink),
    .auto_buffer_out_d_bits_denied(coupler_from_master_named_pcie_0_auto_buffer_out_d_bits_denied),
    .auto_buffer_out_d_bits_data(coupler_from_master_named_pcie_0_auto_buffer_out_d_bits_data),
    .auto_buffer_out_d_bits_corrupt(coupler_from_master_named_pcie_0_auto_buffer_out_d_bits_corrupt)
  );
  SimpleLazyModule_19 coupler_to_slave_named_pcie_0 ( 
    .clock(coupler_to_slave_named_pcie_0_clock),
    .reset(coupler_to_slave_named_pcie_0_reset),
    .auto_buffer_in_1_a_ready(coupler_to_slave_named_pcie_0_auto_buffer_in_1_a_ready),
    .auto_buffer_in_1_a_valid(coupler_to_slave_named_pcie_0_auto_buffer_in_1_a_valid),
    .auto_buffer_in_1_a_bits_opcode(coupler_to_slave_named_pcie_0_auto_buffer_in_1_a_bits_opcode),
    .auto_buffer_in_1_a_bits_param(coupler_to_slave_named_pcie_0_auto_buffer_in_1_a_bits_param),
    .auto_buffer_in_1_a_bits_size(coupler_to_slave_named_pcie_0_auto_buffer_in_1_a_bits_size),
    .auto_buffer_in_1_a_bits_source(coupler_to_slave_named_pcie_0_auto_buffer_in_1_a_bits_source),
    .auto_buffer_in_1_a_bits_address(coupler_to_slave_named_pcie_0_auto_buffer_in_1_a_bits_address),
    .auto_buffer_in_1_a_bits_mask(coupler_to_slave_named_pcie_0_auto_buffer_in_1_a_bits_mask),
    .auto_buffer_in_1_a_bits_data(coupler_to_slave_named_pcie_0_auto_buffer_in_1_a_bits_data),
    .auto_buffer_in_1_a_bits_corrupt(coupler_to_slave_named_pcie_0_auto_buffer_in_1_a_bits_corrupt),
    .auto_buffer_in_1_d_ready(coupler_to_slave_named_pcie_0_auto_buffer_in_1_d_ready),
    .auto_buffer_in_1_d_valid(coupler_to_slave_named_pcie_0_auto_buffer_in_1_d_valid),
    .auto_buffer_in_1_d_bits_opcode(coupler_to_slave_named_pcie_0_auto_buffer_in_1_d_bits_opcode),
    .auto_buffer_in_1_d_bits_param(coupler_to_slave_named_pcie_0_auto_buffer_in_1_d_bits_param),
    .auto_buffer_in_1_d_bits_size(coupler_to_slave_named_pcie_0_auto_buffer_in_1_d_bits_size),
    .auto_buffer_in_1_d_bits_source(coupler_to_slave_named_pcie_0_auto_buffer_in_1_d_bits_source),
    .auto_buffer_in_1_d_bits_sink(coupler_to_slave_named_pcie_0_auto_buffer_in_1_d_bits_sink),
    .auto_buffer_in_1_d_bits_denied(coupler_to_slave_named_pcie_0_auto_buffer_in_1_d_bits_denied),
    .auto_buffer_in_1_d_bits_data(coupler_to_slave_named_pcie_0_auto_buffer_in_1_d_bits_data),
    .auto_buffer_in_1_d_bits_corrupt(coupler_to_slave_named_pcie_0_auto_buffer_in_1_d_bits_corrupt),
    .auto_buffer_in_0_a_ready(coupler_to_slave_named_pcie_0_auto_buffer_in_0_a_ready),
    .auto_buffer_in_0_a_valid(coupler_to_slave_named_pcie_0_auto_buffer_in_0_a_valid),
    .auto_buffer_in_0_a_bits_opcode(coupler_to_slave_named_pcie_0_auto_buffer_in_0_a_bits_opcode),
    .auto_buffer_in_0_a_bits_param(coupler_to_slave_named_pcie_0_auto_buffer_in_0_a_bits_param),
    .auto_buffer_in_0_a_bits_size(coupler_to_slave_named_pcie_0_auto_buffer_in_0_a_bits_size),
    .auto_buffer_in_0_a_bits_source(coupler_to_slave_named_pcie_0_auto_buffer_in_0_a_bits_source),
    .auto_buffer_in_0_a_bits_address(coupler_to_slave_named_pcie_0_auto_buffer_in_0_a_bits_address),
    .auto_buffer_in_0_a_bits_mask(coupler_to_slave_named_pcie_0_auto_buffer_in_0_a_bits_mask),
    .auto_buffer_in_0_a_bits_data(coupler_to_slave_named_pcie_0_auto_buffer_in_0_a_bits_data),
    .auto_buffer_in_0_a_bits_corrupt(coupler_to_slave_named_pcie_0_auto_buffer_in_0_a_bits_corrupt),
    .auto_buffer_in_0_d_ready(coupler_to_slave_named_pcie_0_auto_buffer_in_0_d_ready),
    .auto_buffer_in_0_d_valid(coupler_to_slave_named_pcie_0_auto_buffer_in_0_d_valid),
    .auto_buffer_in_0_d_bits_opcode(coupler_to_slave_named_pcie_0_auto_buffer_in_0_d_bits_opcode),
    .auto_buffer_in_0_d_bits_param(coupler_to_slave_named_pcie_0_auto_buffer_in_0_d_bits_param),
    .auto_buffer_in_0_d_bits_size(coupler_to_slave_named_pcie_0_auto_buffer_in_0_d_bits_size),
    .auto_buffer_in_0_d_bits_source(coupler_to_slave_named_pcie_0_auto_buffer_in_0_d_bits_source),
    .auto_buffer_in_0_d_bits_sink(coupler_to_slave_named_pcie_0_auto_buffer_in_0_d_bits_sink),
    .auto_buffer_in_0_d_bits_denied(coupler_to_slave_named_pcie_0_auto_buffer_in_0_d_bits_denied),
    .auto_buffer_in_0_d_bits_data(coupler_to_slave_named_pcie_0_auto_buffer_in_0_d_bits_data),
    .auto_buffer_in_0_d_bits_corrupt(coupler_to_slave_named_pcie_0_auto_buffer_in_0_d_bits_corrupt),
    .auto_widget_out_1_a_ready(coupler_to_slave_named_pcie_0_auto_widget_out_1_a_ready),
    .auto_widget_out_1_a_valid(coupler_to_slave_named_pcie_0_auto_widget_out_1_a_valid),
    .auto_widget_out_1_a_bits_opcode(coupler_to_slave_named_pcie_0_auto_widget_out_1_a_bits_opcode),
    .auto_widget_out_1_a_bits_param(coupler_to_slave_named_pcie_0_auto_widget_out_1_a_bits_param),
    .auto_widget_out_1_a_bits_size(coupler_to_slave_named_pcie_0_auto_widget_out_1_a_bits_size),
    .auto_widget_out_1_a_bits_source(coupler_to_slave_named_pcie_0_auto_widget_out_1_a_bits_source),
    .auto_widget_out_1_a_bits_address(coupler_to_slave_named_pcie_0_auto_widget_out_1_a_bits_address),
    .auto_widget_out_1_a_bits_mask(coupler_to_slave_named_pcie_0_auto_widget_out_1_a_bits_mask),
    .auto_widget_out_1_a_bits_data(coupler_to_slave_named_pcie_0_auto_widget_out_1_a_bits_data),
    .auto_widget_out_1_a_bits_corrupt(coupler_to_slave_named_pcie_0_auto_widget_out_1_a_bits_corrupt),
    .auto_widget_out_1_d_ready(coupler_to_slave_named_pcie_0_auto_widget_out_1_d_ready),
    .auto_widget_out_1_d_valid(coupler_to_slave_named_pcie_0_auto_widget_out_1_d_valid),
    .auto_widget_out_1_d_bits_opcode(coupler_to_slave_named_pcie_0_auto_widget_out_1_d_bits_opcode),
    .auto_widget_out_1_d_bits_param(coupler_to_slave_named_pcie_0_auto_widget_out_1_d_bits_param),
    .auto_widget_out_1_d_bits_size(coupler_to_slave_named_pcie_0_auto_widget_out_1_d_bits_size),
    .auto_widget_out_1_d_bits_source(coupler_to_slave_named_pcie_0_auto_widget_out_1_d_bits_source),
    .auto_widget_out_1_d_bits_sink(coupler_to_slave_named_pcie_0_auto_widget_out_1_d_bits_sink),
    .auto_widget_out_1_d_bits_denied(coupler_to_slave_named_pcie_0_auto_widget_out_1_d_bits_denied),
    .auto_widget_out_1_d_bits_data(coupler_to_slave_named_pcie_0_auto_widget_out_1_d_bits_data),
    .auto_widget_out_1_d_bits_corrupt(coupler_to_slave_named_pcie_0_auto_widget_out_1_d_bits_corrupt),
    .auto_widget_out_0_a_ready(coupler_to_slave_named_pcie_0_auto_widget_out_0_a_ready),
    .auto_widget_out_0_a_valid(coupler_to_slave_named_pcie_0_auto_widget_out_0_a_valid),
    .auto_widget_out_0_a_bits_opcode(coupler_to_slave_named_pcie_0_auto_widget_out_0_a_bits_opcode),
    .auto_widget_out_0_a_bits_param(coupler_to_slave_named_pcie_0_auto_widget_out_0_a_bits_param),
    .auto_widget_out_0_a_bits_size(coupler_to_slave_named_pcie_0_auto_widget_out_0_a_bits_size),
    .auto_widget_out_0_a_bits_source(coupler_to_slave_named_pcie_0_auto_widget_out_0_a_bits_source),
    .auto_widget_out_0_a_bits_address(coupler_to_slave_named_pcie_0_auto_widget_out_0_a_bits_address),
    .auto_widget_out_0_a_bits_mask(coupler_to_slave_named_pcie_0_auto_widget_out_0_a_bits_mask),
    .auto_widget_out_0_a_bits_data(coupler_to_slave_named_pcie_0_auto_widget_out_0_a_bits_data),
    .auto_widget_out_0_a_bits_corrupt(coupler_to_slave_named_pcie_0_auto_widget_out_0_a_bits_corrupt),
    .auto_widget_out_0_d_ready(coupler_to_slave_named_pcie_0_auto_widget_out_0_d_ready),
    .auto_widget_out_0_d_valid(coupler_to_slave_named_pcie_0_auto_widget_out_0_d_valid),
    .auto_widget_out_0_d_bits_opcode(coupler_to_slave_named_pcie_0_auto_widget_out_0_d_bits_opcode),
    .auto_widget_out_0_d_bits_param(coupler_to_slave_named_pcie_0_auto_widget_out_0_d_bits_param),
    .auto_widget_out_0_d_bits_size(coupler_to_slave_named_pcie_0_auto_widget_out_0_d_bits_size),
    .auto_widget_out_0_d_bits_source(coupler_to_slave_named_pcie_0_auto_widget_out_0_d_bits_source),
    .auto_widget_out_0_d_bits_sink(coupler_to_slave_named_pcie_0_auto_widget_out_0_d_bits_sink),
    .auto_widget_out_0_d_bits_denied(coupler_to_slave_named_pcie_0_auto_widget_out_0_d_bits_denied),
    .auto_widget_out_0_d_bits_data(coupler_to_slave_named_pcie_0_auto_widget_out_0_d_bits_data),
    .auto_widget_out_0_d_bits_corrupt(coupler_to_slave_named_pcie_0_auto_widget_out_0_d_bits_corrupt)
  );
  assign auto_coupler_to_slave_named_pcie_0_widget_out_1_a_valid = coupler_to_slave_named_pcie_0_auto_widget_out_1_a_valid; 
  assign auto_coupler_to_slave_named_pcie_0_widget_out_1_a_bits_opcode = coupler_to_slave_named_pcie_0_auto_widget_out_1_a_bits_opcode; 
  assign auto_coupler_to_slave_named_pcie_0_widget_out_1_a_bits_param = coupler_to_slave_named_pcie_0_auto_widget_out_1_a_bits_param; 
  assign auto_coupler_to_slave_named_pcie_0_widget_out_1_a_bits_size = coupler_to_slave_named_pcie_0_auto_widget_out_1_a_bits_size; 
  assign auto_coupler_to_slave_named_pcie_0_widget_out_1_a_bits_source = coupler_to_slave_named_pcie_0_auto_widget_out_1_a_bits_source; 
  assign auto_coupler_to_slave_named_pcie_0_widget_out_1_a_bits_address = coupler_to_slave_named_pcie_0_auto_widget_out_1_a_bits_address; 
  assign auto_coupler_to_slave_named_pcie_0_widget_out_1_a_bits_mask = coupler_to_slave_named_pcie_0_auto_widget_out_1_a_bits_mask; 
  assign auto_coupler_to_slave_named_pcie_0_widget_out_1_a_bits_data = coupler_to_slave_named_pcie_0_auto_widget_out_1_a_bits_data; 
  assign auto_coupler_to_slave_named_pcie_0_widget_out_1_a_bits_corrupt = coupler_to_slave_named_pcie_0_auto_widget_out_1_a_bits_corrupt; 
  assign auto_coupler_to_slave_named_pcie_0_widget_out_1_d_ready = coupler_to_slave_named_pcie_0_auto_widget_out_1_d_ready; 
  assign auto_coupler_to_slave_named_pcie_0_widget_out_0_a_valid = coupler_to_slave_named_pcie_0_auto_widget_out_0_a_valid; 
  assign auto_coupler_to_slave_named_pcie_0_widget_out_0_a_bits_opcode = coupler_to_slave_named_pcie_0_auto_widget_out_0_a_bits_opcode; 
  assign auto_coupler_to_slave_named_pcie_0_widget_out_0_a_bits_param = coupler_to_slave_named_pcie_0_auto_widget_out_0_a_bits_param; 
  assign auto_coupler_to_slave_named_pcie_0_widget_out_0_a_bits_size = coupler_to_slave_named_pcie_0_auto_widget_out_0_a_bits_size; 
  assign auto_coupler_to_slave_named_pcie_0_widget_out_0_a_bits_source = coupler_to_slave_named_pcie_0_auto_widget_out_0_a_bits_source; 
  assign auto_coupler_to_slave_named_pcie_0_widget_out_0_a_bits_address = coupler_to_slave_named_pcie_0_auto_widget_out_0_a_bits_address; 
  assign auto_coupler_to_slave_named_pcie_0_widget_out_0_a_bits_mask = coupler_to_slave_named_pcie_0_auto_widget_out_0_a_bits_mask; 
  assign auto_coupler_to_slave_named_pcie_0_widget_out_0_a_bits_data = coupler_to_slave_named_pcie_0_auto_widget_out_0_a_bits_data; 
  assign auto_coupler_to_slave_named_pcie_0_widget_out_0_a_bits_corrupt = coupler_to_slave_named_pcie_0_auto_widget_out_0_a_bits_corrupt; 
  assign auto_coupler_to_slave_named_pcie_0_widget_out_0_d_ready = coupler_to_slave_named_pcie_0_auto_widget_out_0_d_ready; 
  assign auto_coupler_from_master_named_pcie_0_fixer_in_a_ready = coupler_from_master_named_pcie_0_auto_fixer_in_a_ready; 
  assign auto_coupler_from_master_named_pcie_0_fixer_in_d_valid = coupler_from_master_named_pcie_0_auto_fixer_in_d_valid; 
  assign auto_coupler_from_master_named_pcie_0_fixer_in_d_bits_opcode = coupler_from_master_named_pcie_0_auto_fixer_in_d_bits_opcode; 
  assign auto_coupler_from_master_named_pcie_0_fixer_in_d_bits_param = coupler_from_master_named_pcie_0_auto_fixer_in_d_bits_param; 
  assign auto_coupler_from_master_named_pcie_0_fixer_in_d_bits_size = coupler_from_master_named_pcie_0_auto_fixer_in_d_bits_size; 
  assign auto_coupler_from_master_named_pcie_0_fixer_in_d_bits_source = coupler_from_master_named_pcie_0_auto_fixer_in_d_bits_source; 
  assign auto_coupler_from_master_named_pcie_0_fixer_in_d_bits_sink = coupler_from_master_named_pcie_0_auto_fixer_in_d_bits_sink; 
  assign auto_coupler_from_master_named_pcie_0_fixer_in_d_bits_denied = coupler_from_master_named_pcie_0_auto_fixer_in_d_bits_denied; 
  assign auto_coupler_from_master_named_pcie_0_fixer_in_d_bits_data = coupler_from_master_named_pcie_0_auto_fixer_in_d_bits_data; 
  assign auto_coupler_from_master_named_pcie_0_fixer_in_d_bits_corrupt = coupler_from_master_named_pcie_0_auto_fixer_in_d_bits_corrupt; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_ready = coupler_from_tile_named_tile_3_auto_tl_master_xing_in_a_ready; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_3_b_valid = coupler_from_tile_named_tile_3_auto_tl_master_xing_in_b_valid; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_3_b_bits_opcode = coupler_from_tile_named_tile_3_auto_tl_master_xing_in_b_bits_opcode; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_3_b_bits_param = coupler_from_tile_named_tile_3_auto_tl_master_xing_in_b_bits_param; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_3_b_bits_size = coupler_from_tile_named_tile_3_auto_tl_master_xing_in_b_bits_size; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_3_b_bits_source = coupler_from_tile_named_tile_3_auto_tl_master_xing_in_b_bits_source; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_3_b_bits_address = coupler_from_tile_named_tile_3_auto_tl_master_xing_in_b_bits_address; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_3_b_bits_mask = coupler_from_tile_named_tile_3_auto_tl_master_xing_in_b_bits_mask; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_3_b_bits_corrupt = coupler_from_tile_named_tile_3_auto_tl_master_xing_in_b_bits_corrupt; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_3_c_ready = coupler_from_tile_named_tile_3_auto_tl_master_xing_in_c_ready; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_valid = coupler_from_tile_named_tile_3_auto_tl_master_xing_in_d_valid; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_bits_opcode = coupler_from_tile_named_tile_3_auto_tl_master_xing_in_d_bits_opcode; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_bits_param = coupler_from_tile_named_tile_3_auto_tl_master_xing_in_d_bits_param; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_bits_size = coupler_from_tile_named_tile_3_auto_tl_master_xing_in_d_bits_size; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_bits_source = coupler_from_tile_named_tile_3_auto_tl_master_xing_in_d_bits_source; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_bits_sink = coupler_from_tile_named_tile_3_auto_tl_master_xing_in_d_bits_sink; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_bits_denied = coupler_from_tile_named_tile_3_auto_tl_master_xing_in_d_bits_denied; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_bits_data = coupler_from_tile_named_tile_3_auto_tl_master_xing_in_d_bits_data; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_bits_corrupt = coupler_from_tile_named_tile_3_auto_tl_master_xing_in_d_bits_corrupt; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_3_e_ready = coupler_from_tile_named_tile_3_auto_tl_master_xing_in_e_ready; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_ready = coupler_from_tile_named_tile_2_auto_tl_master_xing_in_a_ready; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_2_b_valid = coupler_from_tile_named_tile_2_auto_tl_master_xing_in_b_valid; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_2_b_bits_opcode = coupler_from_tile_named_tile_2_auto_tl_master_xing_in_b_bits_opcode; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_2_b_bits_param = coupler_from_tile_named_tile_2_auto_tl_master_xing_in_b_bits_param; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_2_b_bits_size = coupler_from_tile_named_tile_2_auto_tl_master_xing_in_b_bits_size; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_2_b_bits_source = coupler_from_tile_named_tile_2_auto_tl_master_xing_in_b_bits_source; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_2_b_bits_address = coupler_from_tile_named_tile_2_auto_tl_master_xing_in_b_bits_address; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_2_b_bits_mask = coupler_from_tile_named_tile_2_auto_tl_master_xing_in_b_bits_mask; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_2_b_bits_corrupt = coupler_from_tile_named_tile_2_auto_tl_master_xing_in_b_bits_corrupt; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_2_c_ready = coupler_from_tile_named_tile_2_auto_tl_master_xing_in_c_ready; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_valid = coupler_from_tile_named_tile_2_auto_tl_master_xing_in_d_valid; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_bits_opcode = coupler_from_tile_named_tile_2_auto_tl_master_xing_in_d_bits_opcode; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_bits_param = coupler_from_tile_named_tile_2_auto_tl_master_xing_in_d_bits_param; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_bits_size = coupler_from_tile_named_tile_2_auto_tl_master_xing_in_d_bits_size; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_bits_source = coupler_from_tile_named_tile_2_auto_tl_master_xing_in_d_bits_source; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_bits_sink = coupler_from_tile_named_tile_2_auto_tl_master_xing_in_d_bits_sink; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_bits_denied = coupler_from_tile_named_tile_2_auto_tl_master_xing_in_d_bits_denied; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_bits_data = coupler_from_tile_named_tile_2_auto_tl_master_xing_in_d_bits_data; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_bits_corrupt = coupler_from_tile_named_tile_2_auto_tl_master_xing_in_d_bits_corrupt; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_2_e_ready = coupler_from_tile_named_tile_2_auto_tl_master_xing_in_e_ready; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_ready = coupler_from_tile_named_tile_1_auto_tl_master_xing_in_a_ready; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_1_b_valid = coupler_from_tile_named_tile_1_auto_tl_master_xing_in_b_valid; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_1_b_bits_opcode = coupler_from_tile_named_tile_1_auto_tl_master_xing_in_b_bits_opcode; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_1_b_bits_param = coupler_from_tile_named_tile_1_auto_tl_master_xing_in_b_bits_param; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_1_b_bits_size = coupler_from_tile_named_tile_1_auto_tl_master_xing_in_b_bits_size; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_1_b_bits_source = coupler_from_tile_named_tile_1_auto_tl_master_xing_in_b_bits_source; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_1_b_bits_address = coupler_from_tile_named_tile_1_auto_tl_master_xing_in_b_bits_address; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_1_b_bits_mask = coupler_from_tile_named_tile_1_auto_tl_master_xing_in_b_bits_mask; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_1_b_bits_corrupt = coupler_from_tile_named_tile_1_auto_tl_master_xing_in_b_bits_corrupt; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_1_c_ready = coupler_from_tile_named_tile_1_auto_tl_master_xing_in_c_ready; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_valid = coupler_from_tile_named_tile_1_auto_tl_master_xing_in_d_valid; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_bits_opcode = coupler_from_tile_named_tile_1_auto_tl_master_xing_in_d_bits_opcode; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_bits_param = coupler_from_tile_named_tile_1_auto_tl_master_xing_in_d_bits_param; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_bits_size = coupler_from_tile_named_tile_1_auto_tl_master_xing_in_d_bits_size; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_bits_source = coupler_from_tile_named_tile_1_auto_tl_master_xing_in_d_bits_source; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_bits_sink = coupler_from_tile_named_tile_1_auto_tl_master_xing_in_d_bits_sink; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_bits_denied = coupler_from_tile_named_tile_1_auto_tl_master_xing_in_d_bits_denied; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_bits_data = coupler_from_tile_named_tile_1_auto_tl_master_xing_in_d_bits_data; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_bits_corrupt = coupler_from_tile_named_tile_1_auto_tl_master_xing_in_d_bits_corrupt; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_1_e_ready = coupler_from_tile_named_tile_1_auto_tl_master_xing_in_e_ready; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_ready = coupler_from_tile_named_tile_auto_tl_master_xing_in_a_ready; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_0_b_valid = coupler_from_tile_named_tile_auto_tl_master_xing_in_b_valid; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_0_b_bits_opcode = coupler_from_tile_named_tile_auto_tl_master_xing_in_b_bits_opcode; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_0_b_bits_param = coupler_from_tile_named_tile_auto_tl_master_xing_in_b_bits_param; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_0_b_bits_size = coupler_from_tile_named_tile_auto_tl_master_xing_in_b_bits_size; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_0_b_bits_source = coupler_from_tile_named_tile_auto_tl_master_xing_in_b_bits_source; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_0_b_bits_address = coupler_from_tile_named_tile_auto_tl_master_xing_in_b_bits_address; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_0_b_bits_mask = coupler_from_tile_named_tile_auto_tl_master_xing_in_b_bits_mask; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_0_b_bits_corrupt = coupler_from_tile_named_tile_auto_tl_master_xing_in_b_bits_corrupt; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_0_c_ready = coupler_from_tile_named_tile_auto_tl_master_xing_in_c_ready; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_valid = coupler_from_tile_named_tile_auto_tl_master_xing_in_d_valid; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_bits_opcode = coupler_from_tile_named_tile_auto_tl_master_xing_in_d_bits_opcode; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_bits_param = coupler_from_tile_named_tile_auto_tl_master_xing_in_d_bits_param; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_bits_size = coupler_from_tile_named_tile_auto_tl_master_xing_in_d_bits_size; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_bits_source = coupler_from_tile_named_tile_auto_tl_master_xing_in_d_bits_source; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_bits_sink = coupler_from_tile_named_tile_auto_tl_master_xing_in_d_bits_sink; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_bits_denied = coupler_from_tile_named_tile_auto_tl_master_xing_in_d_bits_denied; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_bits_data = coupler_from_tile_named_tile_auto_tl_master_xing_in_d_bits_data; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_bits_corrupt = coupler_from_tile_named_tile_auto_tl_master_xing_in_d_bits_corrupt; 
  assign auto_coupler_from_tile_named_tile_tl_master_xing_in_0_e_ready = coupler_from_tile_named_tile_auto_tl_master_xing_in_e_ready; 
  assign auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_a_valid = control_bus_auto_coupler_to_slave_named_MaskROM_fragmenter_out_a_valid; 
  assign auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_opcode = control_bus_auto_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_opcode; 
  assign auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_param = control_bus_auto_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_param; 
  assign auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_size = control_bus_auto_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_size; 
  assign auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_source = control_bus_auto_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_source; 
  assign auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_address = control_bus_auto_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_address; 
  assign auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_mask = control_bus_auto_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_mask; 
  assign auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_corrupt = control_bus_auto_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_corrupt; 
  assign auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_d_ready = control_bus_auto_coupler_to_slave_named_MaskROM_fragmenter_out_d_ready; 
  assign auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_valid = control_bus_auto_coupler_to_slave_named_debug_fragmenter_out_a_valid; 
  assign auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_bits_opcode = control_bus_auto_coupler_to_slave_named_debug_fragmenter_out_a_bits_opcode; 
  assign auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_bits_param = control_bus_auto_coupler_to_slave_named_debug_fragmenter_out_a_bits_param; 
  assign auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_bits_size = control_bus_auto_coupler_to_slave_named_debug_fragmenter_out_a_bits_size; 
  assign auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_bits_source = control_bus_auto_coupler_to_slave_named_debug_fragmenter_out_a_bits_source; 
  assign auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_bits_address = control_bus_auto_coupler_to_slave_named_debug_fragmenter_out_a_bits_address; 
  assign auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_bits_mask = control_bus_auto_coupler_to_slave_named_debug_fragmenter_out_a_bits_mask; 
  assign auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_bits_data = control_bus_auto_coupler_to_slave_named_debug_fragmenter_out_a_bits_data; 
  assign auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_bits_corrupt = control_bus_auto_coupler_to_slave_named_debug_fragmenter_out_a_bits_corrupt; 
  assign auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_d_ready = control_bus_auto_coupler_to_slave_named_debug_fragmenter_out_d_ready; 
  assign auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_valid = control_bus_auto_coupler_to_slave_named_clint_fragmenter_out_a_valid; 
  assign auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_bits_opcode = control_bus_auto_coupler_to_slave_named_clint_fragmenter_out_a_bits_opcode; 
  assign auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_bits_param = control_bus_auto_coupler_to_slave_named_clint_fragmenter_out_a_bits_param; 
  assign auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_bits_size = control_bus_auto_coupler_to_slave_named_clint_fragmenter_out_a_bits_size; 
  assign auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_bits_source = control_bus_auto_coupler_to_slave_named_clint_fragmenter_out_a_bits_source; 
  assign auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_bits_address = control_bus_auto_coupler_to_slave_named_clint_fragmenter_out_a_bits_address; 
  assign auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_bits_mask = control_bus_auto_coupler_to_slave_named_clint_fragmenter_out_a_bits_mask; 
  assign auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_bits_data = control_bus_auto_coupler_to_slave_named_clint_fragmenter_out_a_bits_data; 
  assign auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_bits_corrupt = control_bus_auto_coupler_to_slave_named_clint_fragmenter_out_a_bits_corrupt; 
  assign auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_d_ready = control_bus_auto_coupler_to_slave_named_clint_fragmenter_out_d_ready; 
  assign auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_valid = control_bus_auto_coupler_to_slave_named_plic_fragmenter_out_a_valid; 
  assign auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_bits_opcode = control_bus_auto_coupler_to_slave_named_plic_fragmenter_out_a_bits_opcode; 
  assign auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_bits_param = control_bus_auto_coupler_to_slave_named_plic_fragmenter_out_a_bits_param; 
  assign auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_bits_size = control_bus_auto_coupler_to_slave_named_plic_fragmenter_out_a_bits_size; 
  assign auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_bits_source = control_bus_auto_coupler_to_slave_named_plic_fragmenter_out_a_bits_source; 
  assign auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_bits_address = control_bus_auto_coupler_to_slave_named_plic_fragmenter_out_a_bits_address; 
  assign auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_bits_mask = control_bus_auto_coupler_to_slave_named_plic_fragmenter_out_a_bits_mask; 
  assign auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_bits_data = control_bus_auto_coupler_to_slave_named_plic_fragmenter_out_a_bits_data; 
  assign auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_bits_corrupt = control_bus_auto_coupler_to_slave_named_plic_fragmenter_out_a_bits_corrupt; 
  assign auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_d_ready = control_bus_auto_coupler_to_slave_named_plic_fragmenter_out_d_ready; 
  assign auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_valid = control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_a_valid; 
  assign auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_bits_opcode = control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_a_bits_opcode; 
  assign auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_bits_param = control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_a_bits_param; 
  assign auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_bits_size = control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_a_bits_size; 
  assign auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_bits_source = control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_a_bits_source; 
  assign auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_bits_address = control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_a_bits_address; 
  assign auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_bits_mask = control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_a_bits_mask; 
  assign auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_bits_data = control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_a_bits_data; 
  assign auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_bits_corrupt = control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_a_bits_corrupt; 
  assign auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_ready = control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_d_ready; 
  assign auto_system_bus_xbar_out_a_valid = system_bus_xbar_auto_out_2_a_valid; 
  assign auto_system_bus_xbar_out_a_bits_opcode = system_bus_xbar_auto_out_2_a_bits_opcode; 
  assign auto_system_bus_xbar_out_a_bits_param = system_bus_xbar_auto_out_2_a_bits_param; 
  assign auto_system_bus_xbar_out_a_bits_size = system_bus_xbar_auto_out_2_a_bits_size; 
  assign auto_system_bus_xbar_out_a_bits_source = system_bus_xbar_auto_out_2_a_bits_source; 
  assign auto_system_bus_xbar_out_a_bits_address = system_bus_xbar_auto_out_2_a_bits_address; 
  assign auto_system_bus_xbar_out_a_bits_mask = system_bus_xbar_auto_out_2_a_bits_mask; 
  assign auto_system_bus_xbar_out_a_bits_data = system_bus_xbar_auto_out_2_a_bits_data; 
  assign auto_system_bus_xbar_out_a_bits_corrupt = system_bus_xbar_auto_out_2_a_bits_corrupt; 
  assign auto_system_bus_xbar_out_b_ready = system_bus_xbar_auto_out_2_b_ready; 
  assign auto_system_bus_xbar_out_c_valid = system_bus_xbar_auto_out_2_c_valid; 
  assign auto_system_bus_xbar_out_c_bits_opcode = system_bus_xbar_auto_out_2_c_bits_opcode; 
  assign auto_system_bus_xbar_out_c_bits_param = system_bus_xbar_auto_out_2_c_bits_param; 
  assign auto_system_bus_xbar_out_c_bits_size = system_bus_xbar_auto_out_2_c_bits_size; 
  assign auto_system_bus_xbar_out_c_bits_source = system_bus_xbar_auto_out_2_c_bits_source; 
  assign auto_system_bus_xbar_out_c_bits_address = system_bus_xbar_auto_out_2_c_bits_address; 
  assign auto_system_bus_xbar_out_c_bits_data = system_bus_xbar_auto_out_2_c_bits_data; 
  assign auto_system_bus_xbar_out_c_bits_corrupt = system_bus_xbar_auto_out_2_c_bits_corrupt; 
  assign auto_system_bus_xbar_out_d_ready = system_bus_xbar_auto_out_2_d_ready; 
  assign auto_system_bus_xbar_out_e_valid = system_bus_xbar_auto_out_2_e_valid; 
  assign auto_system_bus_xbar_out_e_bits_sink = system_bus_xbar_auto_out_2_e_bits_sink; 
  assign system_bus_xbar_clock = clock; 
  assign system_bus_xbar_reset = reset; 
  assign system_bus_xbar_auto_in_4_a_valid = coupler_from_master_named_pcie_0_auto_buffer_out_a_valid; 
  assign system_bus_xbar_auto_in_4_a_bits_opcode = coupler_from_master_named_pcie_0_auto_buffer_out_a_bits_opcode; 
  assign system_bus_xbar_auto_in_4_a_bits_param = coupler_from_master_named_pcie_0_auto_buffer_out_a_bits_param; 
  assign system_bus_xbar_auto_in_4_a_bits_size = coupler_from_master_named_pcie_0_auto_buffer_out_a_bits_size; 
  assign system_bus_xbar_auto_in_4_a_bits_source = coupler_from_master_named_pcie_0_auto_buffer_out_a_bits_source; 
  assign system_bus_xbar_auto_in_4_a_bits_address = coupler_from_master_named_pcie_0_auto_buffer_out_a_bits_address; 
  assign system_bus_xbar_auto_in_4_a_bits_mask = coupler_from_master_named_pcie_0_auto_buffer_out_a_bits_mask; 
  assign system_bus_xbar_auto_in_4_a_bits_data = coupler_from_master_named_pcie_0_auto_buffer_out_a_bits_data; 
  assign system_bus_xbar_auto_in_4_a_bits_corrupt = coupler_from_master_named_pcie_0_auto_buffer_out_a_bits_corrupt; 
  assign system_bus_xbar_auto_in_4_d_ready = coupler_from_master_named_pcie_0_auto_buffer_out_d_ready; 
  assign system_bus_xbar_auto_in_3_a_valid = master_splitter_auto_out_3_a_valid; 
  assign system_bus_xbar_auto_in_3_a_bits_opcode = master_splitter_auto_out_3_a_bits_opcode; 
  assign system_bus_xbar_auto_in_3_a_bits_param = master_splitter_auto_out_3_a_bits_param; 
  assign system_bus_xbar_auto_in_3_a_bits_size = master_splitter_auto_out_3_a_bits_size; 
  assign system_bus_xbar_auto_in_3_a_bits_source = master_splitter_auto_out_3_a_bits_source; 
  assign system_bus_xbar_auto_in_3_a_bits_address = master_splitter_auto_out_3_a_bits_address; 
  assign system_bus_xbar_auto_in_3_a_bits_mask = master_splitter_auto_out_3_a_bits_mask; 
  assign system_bus_xbar_auto_in_3_a_bits_data = master_splitter_auto_out_3_a_bits_data; 
  assign system_bus_xbar_auto_in_3_a_bits_corrupt = master_splitter_auto_out_3_a_bits_corrupt; 
  assign system_bus_xbar_auto_in_3_b_ready = master_splitter_auto_out_3_b_ready; 
  assign system_bus_xbar_auto_in_3_c_valid = master_splitter_auto_out_3_c_valid; 
  assign system_bus_xbar_auto_in_3_c_bits_opcode = master_splitter_auto_out_3_c_bits_opcode; 
  assign system_bus_xbar_auto_in_3_c_bits_param = master_splitter_auto_out_3_c_bits_param; 
  assign system_bus_xbar_auto_in_3_c_bits_size = master_splitter_auto_out_3_c_bits_size; 
  assign system_bus_xbar_auto_in_3_c_bits_source = master_splitter_auto_out_3_c_bits_source; 
  assign system_bus_xbar_auto_in_3_c_bits_address = master_splitter_auto_out_3_c_bits_address; 
  assign system_bus_xbar_auto_in_3_c_bits_data = master_splitter_auto_out_3_c_bits_data; 
  assign system_bus_xbar_auto_in_3_c_bits_corrupt = master_splitter_auto_out_3_c_bits_corrupt; 
  assign system_bus_xbar_auto_in_3_d_ready = master_splitter_auto_out_3_d_ready; 
  assign system_bus_xbar_auto_in_3_e_valid = master_splitter_auto_out_3_e_valid; 
  assign system_bus_xbar_auto_in_3_e_bits_sink = master_splitter_auto_out_3_e_bits_sink; 
  assign system_bus_xbar_auto_in_2_a_valid = master_splitter_auto_out_2_a_valid; 
  assign system_bus_xbar_auto_in_2_a_bits_opcode = master_splitter_auto_out_2_a_bits_opcode; 
  assign system_bus_xbar_auto_in_2_a_bits_param = master_splitter_auto_out_2_a_bits_param; 
  assign system_bus_xbar_auto_in_2_a_bits_size = master_splitter_auto_out_2_a_bits_size; 
  assign system_bus_xbar_auto_in_2_a_bits_source = master_splitter_auto_out_2_a_bits_source; 
  assign system_bus_xbar_auto_in_2_a_bits_address = master_splitter_auto_out_2_a_bits_address; 
  assign system_bus_xbar_auto_in_2_a_bits_mask = master_splitter_auto_out_2_a_bits_mask; 
  assign system_bus_xbar_auto_in_2_a_bits_data = master_splitter_auto_out_2_a_bits_data; 
  assign system_bus_xbar_auto_in_2_a_bits_corrupt = master_splitter_auto_out_2_a_bits_corrupt; 
  assign system_bus_xbar_auto_in_2_b_ready = master_splitter_auto_out_2_b_ready; 
  assign system_bus_xbar_auto_in_2_c_valid = master_splitter_auto_out_2_c_valid; 
  assign system_bus_xbar_auto_in_2_c_bits_opcode = master_splitter_auto_out_2_c_bits_opcode; 
  assign system_bus_xbar_auto_in_2_c_bits_param = master_splitter_auto_out_2_c_bits_param; 
  assign system_bus_xbar_auto_in_2_c_bits_size = master_splitter_auto_out_2_c_bits_size; 
  assign system_bus_xbar_auto_in_2_c_bits_source = master_splitter_auto_out_2_c_bits_source; 
  assign system_bus_xbar_auto_in_2_c_bits_address = master_splitter_auto_out_2_c_bits_address; 
  assign system_bus_xbar_auto_in_2_c_bits_data = master_splitter_auto_out_2_c_bits_data; 
  assign system_bus_xbar_auto_in_2_c_bits_corrupt = master_splitter_auto_out_2_c_bits_corrupt; 
  assign system_bus_xbar_auto_in_2_d_ready = master_splitter_auto_out_2_d_ready; 
  assign system_bus_xbar_auto_in_2_e_valid = master_splitter_auto_out_2_e_valid; 
  assign system_bus_xbar_auto_in_2_e_bits_sink = master_splitter_auto_out_2_e_bits_sink; 
  assign system_bus_xbar_auto_in_1_a_valid = master_splitter_auto_out_1_a_valid; 
  assign system_bus_xbar_auto_in_1_a_bits_opcode = master_splitter_auto_out_1_a_bits_opcode; 
  assign system_bus_xbar_auto_in_1_a_bits_param = master_splitter_auto_out_1_a_bits_param; 
  assign system_bus_xbar_auto_in_1_a_bits_size = master_splitter_auto_out_1_a_bits_size; 
  assign system_bus_xbar_auto_in_1_a_bits_source = master_splitter_auto_out_1_a_bits_source; 
  assign system_bus_xbar_auto_in_1_a_bits_address = master_splitter_auto_out_1_a_bits_address; 
  assign system_bus_xbar_auto_in_1_a_bits_mask = master_splitter_auto_out_1_a_bits_mask; 
  assign system_bus_xbar_auto_in_1_a_bits_data = master_splitter_auto_out_1_a_bits_data; 
  assign system_bus_xbar_auto_in_1_a_bits_corrupt = master_splitter_auto_out_1_a_bits_corrupt; 
  assign system_bus_xbar_auto_in_1_b_ready = master_splitter_auto_out_1_b_ready; 
  assign system_bus_xbar_auto_in_1_c_valid = master_splitter_auto_out_1_c_valid; 
  assign system_bus_xbar_auto_in_1_c_bits_opcode = master_splitter_auto_out_1_c_bits_opcode; 
  assign system_bus_xbar_auto_in_1_c_bits_param = master_splitter_auto_out_1_c_bits_param; 
  assign system_bus_xbar_auto_in_1_c_bits_size = master_splitter_auto_out_1_c_bits_size; 
  assign system_bus_xbar_auto_in_1_c_bits_source = master_splitter_auto_out_1_c_bits_source; 
  assign system_bus_xbar_auto_in_1_c_bits_address = master_splitter_auto_out_1_c_bits_address; 
  assign system_bus_xbar_auto_in_1_c_bits_data = master_splitter_auto_out_1_c_bits_data; 
  assign system_bus_xbar_auto_in_1_c_bits_corrupt = master_splitter_auto_out_1_c_bits_corrupt; 
  assign system_bus_xbar_auto_in_1_d_ready = master_splitter_auto_out_1_d_ready; 
  assign system_bus_xbar_auto_in_1_e_valid = master_splitter_auto_out_1_e_valid; 
  assign system_bus_xbar_auto_in_1_e_bits_sink = master_splitter_auto_out_1_e_bits_sink; 
  assign system_bus_xbar_auto_in_0_a_valid = master_splitter_auto_out_0_a_valid; 
  assign system_bus_xbar_auto_in_0_a_bits_opcode = master_splitter_auto_out_0_a_bits_opcode; 
  assign system_bus_xbar_auto_in_0_a_bits_param = master_splitter_auto_out_0_a_bits_param; 
  assign system_bus_xbar_auto_in_0_a_bits_size = master_splitter_auto_out_0_a_bits_size; 
  assign system_bus_xbar_auto_in_0_a_bits_source = master_splitter_auto_out_0_a_bits_source; 
  assign system_bus_xbar_auto_in_0_a_bits_address = master_splitter_auto_out_0_a_bits_address; 
  assign system_bus_xbar_auto_in_0_a_bits_mask = master_splitter_auto_out_0_a_bits_mask; 
  assign system_bus_xbar_auto_in_0_a_bits_data = master_splitter_auto_out_0_a_bits_data; 
  assign system_bus_xbar_auto_in_0_a_bits_corrupt = master_splitter_auto_out_0_a_bits_corrupt; 
  assign system_bus_xbar_auto_in_0_b_ready = master_splitter_auto_out_0_b_ready; 
  assign system_bus_xbar_auto_in_0_c_valid = master_splitter_auto_out_0_c_valid; 
  assign system_bus_xbar_auto_in_0_c_bits_opcode = master_splitter_auto_out_0_c_bits_opcode; 
  assign system_bus_xbar_auto_in_0_c_bits_param = master_splitter_auto_out_0_c_bits_param; 
  assign system_bus_xbar_auto_in_0_c_bits_size = master_splitter_auto_out_0_c_bits_size; 
  assign system_bus_xbar_auto_in_0_c_bits_source = master_splitter_auto_out_0_c_bits_source; 
  assign system_bus_xbar_auto_in_0_c_bits_address = master_splitter_auto_out_0_c_bits_address; 
  assign system_bus_xbar_auto_in_0_c_bits_data = master_splitter_auto_out_0_c_bits_data; 
  assign system_bus_xbar_auto_in_0_c_bits_corrupt = master_splitter_auto_out_0_c_bits_corrupt; 
  assign system_bus_xbar_auto_in_0_d_ready = master_splitter_auto_out_0_d_ready; 
  assign system_bus_xbar_auto_in_0_e_valid = master_splitter_auto_out_0_e_valid; 
  assign system_bus_xbar_auto_in_0_e_bits_sink = master_splitter_auto_out_0_e_bits_sink; 
  assign system_bus_xbar_auto_out_4_a_ready = coupler_to_slave_named_pcie_0_auto_buffer_in_1_a_ready; 
  assign system_bus_xbar_auto_out_4_d_valid = coupler_to_slave_named_pcie_0_auto_buffer_in_1_d_valid; 
  assign system_bus_xbar_auto_out_4_d_bits_opcode = coupler_to_slave_named_pcie_0_auto_buffer_in_1_d_bits_opcode; 
  assign system_bus_xbar_auto_out_4_d_bits_param = coupler_to_slave_named_pcie_0_auto_buffer_in_1_d_bits_param; 
  assign system_bus_xbar_auto_out_4_d_bits_size = coupler_to_slave_named_pcie_0_auto_buffer_in_1_d_bits_size; 
  assign system_bus_xbar_auto_out_4_d_bits_source = coupler_to_slave_named_pcie_0_auto_buffer_in_1_d_bits_source; 
  assign system_bus_xbar_auto_out_4_d_bits_sink = coupler_to_slave_named_pcie_0_auto_buffer_in_1_d_bits_sink; 
  assign system_bus_xbar_auto_out_4_d_bits_denied = coupler_to_slave_named_pcie_0_auto_buffer_in_1_d_bits_denied; 
  assign system_bus_xbar_auto_out_4_d_bits_data = coupler_to_slave_named_pcie_0_auto_buffer_in_1_d_bits_data; 
  assign system_bus_xbar_auto_out_4_d_bits_corrupt = coupler_to_slave_named_pcie_0_auto_buffer_in_1_d_bits_corrupt; 
  assign system_bus_xbar_auto_out_3_a_ready = coupler_to_slave_named_pcie_0_auto_buffer_in_0_a_ready; 
  assign system_bus_xbar_auto_out_3_d_valid = coupler_to_slave_named_pcie_0_auto_buffer_in_0_d_valid; 
  assign system_bus_xbar_auto_out_3_d_bits_opcode = coupler_to_slave_named_pcie_0_auto_buffer_in_0_d_bits_opcode; 
  assign system_bus_xbar_auto_out_3_d_bits_param = coupler_to_slave_named_pcie_0_auto_buffer_in_0_d_bits_param; 
  assign system_bus_xbar_auto_out_3_d_bits_size = coupler_to_slave_named_pcie_0_auto_buffer_in_0_d_bits_size; 
  assign system_bus_xbar_auto_out_3_d_bits_source = coupler_to_slave_named_pcie_0_auto_buffer_in_0_d_bits_source; 
  assign system_bus_xbar_auto_out_3_d_bits_sink = coupler_to_slave_named_pcie_0_auto_buffer_in_0_d_bits_sink; 
  assign system_bus_xbar_auto_out_3_d_bits_denied = coupler_to_slave_named_pcie_0_auto_buffer_in_0_d_bits_denied; 
  assign system_bus_xbar_auto_out_3_d_bits_data = coupler_to_slave_named_pcie_0_auto_buffer_in_0_d_bits_data; 
  assign system_bus_xbar_auto_out_3_d_bits_corrupt = coupler_to_slave_named_pcie_0_auto_buffer_in_0_d_bits_corrupt; 
  assign system_bus_xbar_auto_out_2_a_ready = auto_system_bus_xbar_out_a_ready; 
  assign system_bus_xbar_auto_out_2_b_valid = auto_system_bus_xbar_out_b_valid; 
  assign system_bus_xbar_auto_out_2_b_bits_param = auto_system_bus_xbar_out_b_bits_param; 
  assign system_bus_xbar_auto_out_2_b_bits_source = auto_system_bus_xbar_out_b_bits_source; 
  assign system_bus_xbar_auto_out_2_b_bits_address = auto_system_bus_xbar_out_b_bits_address; 
  assign system_bus_xbar_auto_out_2_c_ready = auto_system_bus_xbar_out_c_ready; 
  assign system_bus_xbar_auto_out_2_d_valid = auto_system_bus_xbar_out_d_valid; 
  assign system_bus_xbar_auto_out_2_d_bits_opcode = auto_system_bus_xbar_out_d_bits_opcode; 
  assign system_bus_xbar_auto_out_2_d_bits_param = auto_system_bus_xbar_out_d_bits_param; 
  assign system_bus_xbar_auto_out_2_d_bits_size = auto_system_bus_xbar_out_d_bits_size; 
  assign system_bus_xbar_auto_out_2_d_bits_source = auto_system_bus_xbar_out_d_bits_source; 
  assign system_bus_xbar_auto_out_2_d_bits_sink = auto_system_bus_xbar_out_d_bits_sink; 
  assign system_bus_xbar_auto_out_2_d_bits_denied = auto_system_bus_xbar_out_d_bits_denied; 
  assign system_bus_xbar_auto_out_2_d_bits_data = auto_system_bus_xbar_out_d_bits_data; 
  assign system_bus_xbar_auto_out_2_d_bits_corrupt = auto_system_bus_xbar_out_d_bits_corrupt; 
  assign system_bus_xbar_auto_out_1_a_ready = wrapped_error_device_auto_buffer_in_a_ready; 
  assign system_bus_xbar_auto_out_1_b_valid = wrapped_error_device_auto_buffer_in_b_valid; 
  assign system_bus_xbar_auto_out_1_b_bits_opcode = wrapped_error_device_auto_buffer_in_b_bits_opcode; 
  assign system_bus_xbar_auto_out_1_b_bits_param = wrapped_error_device_auto_buffer_in_b_bits_param; 
  assign system_bus_xbar_auto_out_1_b_bits_size = wrapped_error_device_auto_buffer_in_b_bits_size; 
  assign system_bus_xbar_auto_out_1_b_bits_source = wrapped_error_device_auto_buffer_in_b_bits_source; 
  assign system_bus_xbar_auto_out_1_b_bits_address = wrapped_error_device_auto_buffer_in_b_bits_address; 
  assign system_bus_xbar_auto_out_1_b_bits_mask = wrapped_error_device_auto_buffer_in_b_bits_mask; 
  assign system_bus_xbar_auto_out_1_b_bits_data = wrapped_error_device_auto_buffer_in_b_bits_data; 
  assign system_bus_xbar_auto_out_1_b_bits_corrupt = wrapped_error_device_auto_buffer_in_b_bits_corrupt; 
  assign system_bus_xbar_auto_out_1_c_ready = wrapped_error_device_auto_buffer_in_c_ready; 
  assign system_bus_xbar_auto_out_1_d_valid = wrapped_error_device_auto_buffer_in_d_valid; 
  assign system_bus_xbar_auto_out_1_d_bits_opcode = wrapped_error_device_auto_buffer_in_d_bits_opcode; 
  assign system_bus_xbar_auto_out_1_d_bits_param = wrapped_error_device_auto_buffer_in_d_bits_param; 
  assign system_bus_xbar_auto_out_1_d_bits_size = wrapped_error_device_auto_buffer_in_d_bits_size; 
  assign system_bus_xbar_auto_out_1_d_bits_source = wrapped_error_device_auto_buffer_in_d_bits_source; 
  assign system_bus_xbar_auto_out_1_d_bits_sink = wrapped_error_device_auto_buffer_in_d_bits_sink; 
  assign system_bus_xbar_auto_out_1_d_bits_denied = wrapped_error_device_auto_buffer_in_d_bits_denied; 
  assign system_bus_xbar_auto_out_1_d_bits_data = wrapped_error_device_auto_buffer_in_d_bits_data; 
  assign system_bus_xbar_auto_out_1_d_bits_corrupt = wrapped_error_device_auto_buffer_in_d_bits_corrupt; 
  assign system_bus_xbar_auto_out_1_e_ready = wrapped_error_device_auto_buffer_in_e_ready; 
  assign system_bus_xbar_auto_out_0_a_ready = coupler_to_bus_named_cbus_auto_buffer_in_a_ready; 
  assign system_bus_xbar_auto_out_0_d_valid = coupler_to_bus_named_cbus_auto_buffer_in_d_valid; 
  assign system_bus_xbar_auto_out_0_d_bits_opcode = coupler_to_bus_named_cbus_auto_buffer_in_d_bits_opcode; 
  assign system_bus_xbar_auto_out_0_d_bits_param = coupler_to_bus_named_cbus_auto_buffer_in_d_bits_param; 
  assign system_bus_xbar_auto_out_0_d_bits_size = coupler_to_bus_named_cbus_auto_buffer_in_d_bits_size; 
  assign system_bus_xbar_auto_out_0_d_bits_source = coupler_to_bus_named_cbus_auto_buffer_in_d_bits_source; 
  assign system_bus_xbar_auto_out_0_d_bits_sink = coupler_to_bus_named_cbus_auto_buffer_in_d_bits_sink; 
  assign system_bus_xbar_auto_out_0_d_bits_denied = coupler_to_bus_named_cbus_auto_buffer_in_d_bits_denied; 
  assign system_bus_xbar_auto_out_0_d_bits_data = coupler_to_bus_named_cbus_auto_buffer_in_d_bits_data; 
  assign system_bus_xbar_auto_out_0_d_bits_corrupt = coupler_to_bus_named_cbus_auto_buffer_in_d_bits_corrupt; 
  assign control_bus_clock = clock; 
  assign control_bus_reset = reset; 
  assign control_bus_auto_coupler_to_slave_named_MaskROM_fragmenter_out_a_ready = auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_a_ready; 
  assign control_bus_auto_coupler_to_slave_named_MaskROM_fragmenter_out_d_valid = auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_d_valid; 
  assign control_bus_auto_coupler_to_slave_named_MaskROM_fragmenter_out_d_bits_size = auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_d_bits_size; 
  assign control_bus_auto_coupler_to_slave_named_MaskROM_fragmenter_out_d_bits_source = auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_d_bits_source; 
  assign control_bus_auto_coupler_to_slave_named_MaskROM_fragmenter_out_d_bits_data = auto_control_bus_coupler_to_slave_named_MaskROM_fragmenter_out_d_bits_data; 
  assign control_bus_auto_coupler_to_slave_named_debug_fragmenter_out_a_ready = auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_a_ready; 
  assign control_bus_auto_coupler_to_slave_named_debug_fragmenter_out_d_valid = auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_d_valid; 
  assign control_bus_auto_coupler_to_slave_named_debug_fragmenter_out_d_bits_opcode = auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_d_bits_opcode; 
  assign control_bus_auto_coupler_to_slave_named_debug_fragmenter_out_d_bits_size = auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_d_bits_size; 
  assign control_bus_auto_coupler_to_slave_named_debug_fragmenter_out_d_bits_source = auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_d_bits_source; 
  assign control_bus_auto_coupler_to_slave_named_debug_fragmenter_out_d_bits_data = auto_control_bus_coupler_to_slave_named_debug_fragmenter_out_d_bits_data; 
  assign control_bus_auto_coupler_to_slave_named_clint_fragmenter_out_a_ready = auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_a_ready; 
  assign control_bus_auto_coupler_to_slave_named_clint_fragmenter_out_d_valid = auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_d_valid; 
  assign control_bus_auto_coupler_to_slave_named_clint_fragmenter_out_d_bits_opcode = auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_d_bits_opcode; 
  assign control_bus_auto_coupler_to_slave_named_clint_fragmenter_out_d_bits_size = auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_d_bits_size; 
  assign control_bus_auto_coupler_to_slave_named_clint_fragmenter_out_d_bits_source = auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_d_bits_source; 
  assign control_bus_auto_coupler_to_slave_named_clint_fragmenter_out_d_bits_data = auto_control_bus_coupler_to_slave_named_clint_fragmenter_out_d_bits_data; 
  assign control_bus_auto_coupler_to_slave_named_plic_fragmenter_out_a_ready = auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_a_ready; 
  assign control_bus_auto_coupler_to_slave_named_plic_fragmenter_out_d_valid = auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_d_valid; 
  assign control_bus_auto_coupler_to_slave_named_plic_fragmenter_out_d_bits_opcode = auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_d_bits_opcode; 
  assign control_bus_auto_coupler_to_slave_named_plic_fragmenter_out_d_bits_size = auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_d_bits_size; 
  assign control_bus_auto_coupler_to_slave_named_plic_fragmenter_out_d_bits_source = auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_d_bits_source; 
  assign control_bus_auto_coupler_to_slave_named_plic_fragmenter_out_d_bits_data = auto_control_bus_coupler_to_slave_named_plic_fragmenter_out_d_bits_data; 
  assign control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_a_ready = auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_a_ready; 
  assign control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_d_valid = auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_valid; 
  assign control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_d_bits_opcode = auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_bits_opcode; 
  assign control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_d_bits_param = auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_bits_param; 
  assign control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_d_bits_size = auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_bits_size; 
  assign control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_d_bits_source = auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_bits_source; 
  assign control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_d_bits_sink = auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_bits_sink; 
  assign control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_d_bits_denied = auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_bits_denied; 
  assign control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_d_bits_data = auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_bits_data; 
  assign control_bus_auto_coupler_to_bus_named_pbus_from_cbus_out_d_bits_corrupt = auto_control_bus_coupler_to_bus_named_pbus_from_cbus_out_d_bits_corrupt; 
  assign control_bus_auto_from_sbus_in_a_valid = coupler_to_bus_named_cbus_auto_from_sbus_out_a_valid; 
  assign control_bus_auto_from_sbus_in_a_bits_opcode = coupler_to_bus_named_cbus_auto_from_sbus_out_a_bits_opcode; 
  assign control_bus_auto_from_sbus_in_a_bits_param = coupler_to_bus_named_cbus_auto_from_sbus_out_a_bits_param; 
  assign control_bus_auto_from_sbus_in_a_bits_size = coupler_to_bus_named_cbus_auto_from_sbus_out_a_bits_size; 
  assign control_bus_auto_from_sbus_in_a_bits_source = coupler_to_bus_named_cbus_auto_from_sbus_out_a_bits_source; 
  assign control_bus_auto_from_sbus_in_a_bits_address = coupler_to_bus_named_cbus_auto_from_sbus_out_a_bits_address; 
  assign control_bus_auto_from_sbus_in_a_bits_mask = coupler_to_bus_named_cbus_auto_from_sbus_out_a_bits_mask; 
  assign control_bus_auto_from_sbus_in_a_bits_data = coupler_to_bus_named_cbus_auto_from_sbus_out_a_bits_data; 
  assign control_bus_auto_from_sbus_in_a_bits_corrupt = coupler_to_bus_named_cbus_auto_from_sbus_out_a_bits_corrupt; 
  assign control_bus_auto_from_sbus_in_d_ready = coupler_to_bus_named_cbus_auto_from_sbus_out_d_ready; 
  assign coupler_to_bus_named_cbus_clock = clock; 
  assign coupler_to_bus_named_cbus_reset = reset; 
  assign coupler_to_bus_named_cbus_auto_buffer_in_a_valid = system_bus_xbar_auto_out_0_a_valid; 
  assign coupler_to_bus_named_cbus_auto_buffer_in_a_bits_opcode = system_bus_xbar_auto_out_0_a_bits_opcode; 
  assign coupler_to_bus_named_cbus_auto_buffer_in_a_bits_param = system_bus_xbar_auto_out_0_a_bits_param; 
  assign coupler_to_bus_named_cbus_auto_buffer_in_a_bits_size = system_bus_xbar_auto_out_0_a_bits_size; 
  assign coupler_to_bus_named_cbus_auto_buffer_in_a_bits_source = system_bus_xbar_auto_out_0_a_bits_source; 
  assign coupler_to_bus_named_cbus_auto_buffer_in_a_bits_address = system_bus_xbar_auto_out_0_a_bits_address; 
  assign coupler_to_bus_named_cbus_auto_buffer_in_a_bits_mask = system_bus_xbar_auto_out_0_a_bits_mask; 
  assign coupler_to_bus_named_cbus_auto_buffer_in_a_bits_data = system_bus_xbar_auto_out_0_a_bits_data; 
  assign coupler_to_bus_named_cbus_auto_buffer_in_a_bits_corrupt = system_bus_xbar_auto_out_0_a_bits_corrupt; 
  assign coupler_to_bus_named_cbus_auto_buffer_in_d_ready = system_bus_xbar_auto_out_0_d_ready; 
  assign coupler_to_bus_named_cbus_auto_from_sbus_out_a_ready = control_bus_auto_from_sbus_in_a_ready; 
  assign coupler_to_bus_named_cbus_auto_from_sbus_out_d_valid = control_bus_auto_from_sbus_in_d_valid; 
  assign coupler_to_bus_named_cbus_auto_from_sbus_out_d_bits_opcode = control_bus_auto_from_sbus_in_d_bits_opcode; 
  assign coupler_to_bus_named_cbus_auto_from_sbus_out_d_bits_param = control_bus_auto_from_sbus_in_d_bits_param; 
  assign coupler_to_bus_named_cbus_auto_from_sbus_out_d_bits_size = control_bus_auto_from_sbus_in_d_bits_size; 
  assign coupler_to_bus_named_cbus_auto_from_sbus_out_d_bits_source = control_bus_auto_from_sbus_in_d_bits_source; 
  assign coupler_to_bus_named_cbus_auto_from_sbus_out_d_bits_sink = control_bus_auto_from_sbus_in_d_bits_sink; 
  assign coupler_to_bus_named_cbus_auto_from_sbus_out_d_bits_denied = control_bus_auto_from_sbus_in_d_bits_denied; 
  assign coupler_to_bus_named_cbus_auto_from_sbus_out_d_bits_data = control_bus_auto_from_sbus_in_d_bits_data; 
  assign coupler_to_bus_named_cbus_auto_from_sbus_out_d_bits_corrupt = control_bus_auto_from_sbus_in_d_bits_corrupt; 
  assign master_splitter_clock = clock; 
  assign master_splitter_reset = reset; 
  assign master_splitter_auto_in_3_a_valid = coupler_from_tile_named_tile_3_auto_buffer_out_a_valid; 
  assign master_splitter_auto_in_3_a_bits_opcode = coupler_from_tile_named_tile_3_auto_buffer_out_a_bits_opcode; 
  assign master_splitter_auto_in_3_a_bits_param = coupler_from_tile_named_tile_3_auto_buffer_out_a_bits_param; 
  assign master_splitter_auto_in_3_a_bits_size = coupler_from_tile_named_tile_3_auto_buffer_out_a_bits_size; 
  assign master_splitter_auto_in_3_a_bits_source = coupler_from_tile_named_tile_3_auto_buffer_out_a_bits_source; 
  assign master_splitter_auto_in_3_a_bits_address = coupler_from_tile_named_tile_3_auto_buffer_out_a_bits_address; 
  assign master_splitter_auto_in_3_a_bits_mask = coupler_from_tile_named_tile_3_auto_buffer_out_a_bits_mask; 
  assign master_splitter_auto_in_3_a_bits_data = coupler_from_tile_named_tile_3_auto_buffer_out_a_bits_data; 
  assign master_splitter_auto_in_3_a_bits_corrupt = coupler_from_tile_named_tile_3_auto_buffer_out_a_bits_corrupt; 
  assign master_splitter_auto_in_3_b_ready = coupler_from_tile_named_tile_3_auto_buffer_out_b_ready; 
  assign master_splitter_auto_in_3_c_valid = coupler_from_tile_named_tile_3_auto_buffer_out_c_valid; 
  assign master_splitter_auto_in_3_c_bits_opcode = coupler_from_tile_named_tile_3_auto_buffer_out_c_bits_opcode; 
  assign master_splitter_auto_in_3_c_bits_param = coupler_from_tile_named_tile_3_auto_buffer_out_c_bits_param; 
  assign master_splitter_auto_in_3_c_bits_size = coupler_from_tile_named_tile_3_auto_buffer_out_c_bits_size; 
  assign master_splitter_auto_in_3_c_bits_source = coupler_from_tile_named_tile_3_auto_buffer_out_c_bits_source; 
  assign master_splitter_auto_in_3_c_bits_address = coupler_from_tile_named_tile_3_auto_buffer_out_c_bits_address; 
  assign master_splitter_auto_in_3_c_bits_data = coupler_from_tile_named_tile_3_auto_buffer_out_c_bits_data; 
  assign master_splitter_auto_in_3_c_bits_corrupt = coupler_from_tile_named_tile_3_auto_buffer_out_c_bits_corrupt; 
  assign master_splitter_auto_in_3_d_ready = coupler_from_tile_named_tile_3_auto_buffer_out_d_ready; 
  assign master_splitter_auto_in_3_e_valid = coupler_from_tile_named_tile_3_auto_buffer_out_e_valid; 
  assign master_splitter_auto_in_3_e_bits_sink = coupler_from_tile_named_tile_3_auto_buffer_out_e_bits_sink; 
  assign master_splitter_auto_in_2_a_valid = coupler_from_tile_named_tile_2_auto_buffer_out_a_valid; 
  assign master_splitter_auto_in_2_a_bits_opcode = coupler_from_tile_named_tile_2_auto_buffer_out_a_bits_opcode; 
  assign master_splitter_auto_in_2_a_bits_param = coupler_from_tile_named_tile_2_auto_buffer_out_a_bits_param; 
  assign master_splitter_auto_in_2_a_bits_size = coupler_from_tile_named_tile_2_auto_buffer_out_a_bits_size; 
  assign master_splitter_auto_in_2_a_bits_source = coupler_from_tile_named_tile_2_auto_buffer_out_a_bits_source; 
  assign master_splitter_auto_in_2_a_bits_address = coupler_from_tile_named_tile_2_auto_buffer_out_a_bits_address; 
  assign master_splitter_auto_in_2_a_bits_mask = coupler_from_tile_named_tile_2_auto_buffer_out_a_bits_mask; 
  assign master_splitter_auto_in_2_a_bits_data = coupler_from_tile_named_tile_2_auto_buffer_out_a_bits_data; 
  assign master_splitter_auto_in_2_a_bits_corrupt = coupler_from_tile_named_tile_2_auto_buffer_out_a_bits_corrupt; 
  assign master_splitter_auto_in_2_b_ready = coupler_from_tile_named_tile_2_auto_buffer_out_b_ready; 
  assign master_splitter_auto_in_2_c_valid = coupler_from_tile_named_tile_2_auto_buffer_out_c_valid; 
  assign master_splitter_auto_in_2_c_bits_opcode = coupler_from_tile_named_tile_2_auto_buffer_out_c_bits_opcode; 
  assign master_splitter_auto_in_2_c_bits_param = coupler_from_tile_named_tile_2_auto_buffer_out_c_bits_param; 
  assign master_splitter_auto_in_2_c_bits_size = coupler_from_tile_named_tile_2_auto_buffer_out_c_bits_size; 
  assign master_splitter_auto_in_2_c_bits_source = coupler_from_tile_named_tile_2_auto_buffer_out_c_bits_source; 
  assign master_splitter_auto_in_2_c_bits_address = coupler_from_tile_named_tile_2_auto_buffer_out_c_bits_address; 
  assign master_splitter_auto_in_2_c_bits_data = coupler_from_tile_named_tile_2_auto_buffer_out_c_bits_data; 
  assign master_splitter_auto_in_2_c_bits_corrupt = coupler_from_tile_named_tile_2_auto_buffer_out_c_bits_corrupt; 
  assign master_splitter_auto_in_2_d_ready = coupler_from_tile_named_tile_2_auto_buffer_out_d_ready; 
  assign master_splitter_auto_in_2_e_valid = coupler_from_tile_named_tile_2_auto_buffer_out_e_valid; 
  assign master_splitter_auto_in_2_e_bits_sink = coupler_from_tile_named_tile_2_auto_buffer_out_e_bits_sink; 
  assign master_splitter_auto_in_1_a_valid = coupler_from_tile_named_tile_1_auto_buffer_out_a_valid; 
  assign master_splitter_auto_in_1_a_bits_opcode = coupler_from_tile_named_tile_1_auto_buffer_out_a_bits_opcode; 
  assign master_splitter_auto_in_1_a_bits_param = coupler_from_tile_named_tile_1_auto_buffer_out_a_bits_param; 
  assign master_splitter_auto_in_1_a_bits_size = coupler_from_tile_named_tile_1_auto_buffer_out_a_bits_size; 
  assign master_splitter_auto_in_1_a_bits_source = coupler_from_tile_named_tile_1_auto_buffer_out_a_bits_source; 
  assign master_splitter_auto_in_1_a_bits_address = coupler_from_tile_named_tile_1_auto_buffer_out_a_bits_address; 
  assign master_splitter_auto_in_1_a_bits_mask = coupler_from_tile_named_tile_1_auto_buffer_out_a_bits_mask; 
  assign master_splitter_auto_in_1_a_bits_data = coupler_from_tile_named_tile_1_auto_buffer_out_a_bits_data; 
  assign master_splitter_auto_in_1_a_bits_corrupt = coupler_from_tile_named_tile_1_auto_buffer_out_a_bits_corrupt; 
  assign master_splitter_auto_in_1_b_ready = coupler_from_tile_named_tile_1_auto_buffer_out_b_ready; 
  assign master_splitter_auto_in_1_c_valid = coupler_from_tile_named_tile_1_auto_buffer_out_c_valid; 
  assign master_splitter_auto_in_1_c_bits_opcode = coupler_from_tile_named_tile_1_auto_buffer_out_c_bits_opcode; 
  assign master_splitter_auto_in_1_c_bits_param = coupler_from_tile_named_tile_1_auto_buffer_out_c_bits_param; 
  assign master_splitter_auto_in_1_c_bits_size = coupler_from_tile_named_tile_1_auto_buffer_out_c_bits_size; 
  assign master_splitter_auto_in_1_c_bits_source = coupler_from_tile_named_tile_1_auto_buffer_out_c_bits_source; 
  assign master_splitter_auto_in_1_c_bits_address = coupler_from_tile_named_tile_1_auto_buffer_out_c_bits_address; 
  assign master_splitter_auto_in_1_c_bits_data = coupler_from_tile_named_tile_1_auto_buffer_out_c_bits_data; 
  assign master_splitter_auto_in_1_c_bits_corrupt = coupler_from_tile_named_tile_1_auto_buffer_out_c_bits_corrupt; 
  assign master_splitter_auto_in_1_d_ready = coupler_from_tile_named_tile_1_auto_buffer_out_d_ready; 
  assign master_splitter_auto_in_1_e_valid = coupler_from_tile_named_tile_1_auto_buffer_out_e_valid; 
  assign master_splitter_auto_in_1_e_bits_sink = coupler_from_tile_named_tile_1_auto_buffer_out_e_bits_sink; 
  assign master_splitter_auto_in_0_a_valid = coupler_from_tile_named_tile_auto_buffer_out_a_valid; 
  assign master_splitter_auto_in_0_a_bits_opcode = coupler_from_tile_named_tile_auto_buffer_out_a_bits_opcode; 
  assign master_splitter_auto_in_0_a_bits_param = coupler_from_tile_named_tile_auto_buffer_out_a_bits_param; 
  assign master_splitter_auto_in_0_a_bits_size = coupler_from_tile_named_tile_auto_buffer_out_a_bits_size; 
  assign master_splitter_auto_in_0_a_bits_source = coupler_from_tile_named_tile_auto_buffer_out_a_bits_source; 
  assign master_splitter_auto_in_0_a_bits_address = coupler_from_tile_named_tile_auto_buffer_out_a_bits_address; 
  assign master_splitter_auto_in_0_a_bits_mask = coupler_from_tile_named_tile_auto_buffer_out_a_bits_mask; 
  assign master_splitter_auto_in_0_a_bits_data = coupler_from_tile_named_tile_auto_buffer_out_a_bits_data; 
  assign master_splitter_auto_in_0_a_bits_corrupt = coupler_from_tile_named_tile_auto_buffer_out_a_bits_corrupt; 
  assign master_splitter_auto_in_0_b_ready = coupler_from_tile_named_tile_auto_buffer_out_b_ready; 
  assign master_splitter_auto_in_0_c_valid = coupler_from_tile_named_tile_auto_buffer_out_c_valid; 
  assign master_splitter_auto_in_0_c_bits_opcode = coupler_from_tile_named_tile_auto_buffer_out_c_bits_opcode; 
  assign master_splitter_auto_in_0_c_bits_param = coupler_from_tile_named_tile_auto_buffer_out_c_bits_param; 
  assign master_splitter_auto_in_0_c_bits_size = coupler_from_tile_named_tile_auto_buffer_out_c_bits_size; 
  assign master_splitter_auto_in_0_c_bits_source = coupler_from_tile_named_tile_auto_buffer_out_c_bits_source; 
  assign master_splitter_auto_in_0_c_bits_address = coupler_from_tile_named_tile_auto_buffer_out_c_bits_address; 
  assign master_splitter_auto_in_0_c_bits_data = coupler_from_tile_named_tile_auto_buffer_out_c_bits_data; 
  assign master_splitter_auto_in_0_c_bits_corrupt = coupler_from_tile_named_tile_auto_buffer_out_c_bits_corrupt; 
  assign master_splitter_auto_in_0_d_ready = coupler_from_tile_named_tile_auto_buffer_out_d_ready; 
  assign master_splitter_auto_in_0_e_valid = coupler_from_tile_named_tile_auto_buffer_out_e_valid; 
  assign master_splitter_auto_in_0_e_bits_sink = coupler_from_tile_named_tile_auto_buffer_out_e_bits_sink; 
  assign master_splitter_auto_out_3_a_ready = system_bus_xbar_auto_in_3_a_ready; 
  assign master_splitter_auto_out_3_b_valid = system_bus_xbar_auto_in_3_b_valid; 
  assign master_splitter_auto_out_3_b_bits_opcode = system_bus_xbar_auto_in_3_b_bits_opcode; 
  assign master_splitter_auto_out_3_b_bits_param = system_bus_xbar_auto_in_3_b_bits_param; 
  assign master_splitter_auto_out_3_b_bits_size = system_bus_xbar_auto_in_3_b_bits_size; 
  assign master_splitter_auto_out_3_b_bits_source = system_bus_xbar_auto_in_3_b_bits_source; 
  assign master_splitter_auto_out_3_b_bits_address = system_bus_xbar_auto_in_3_b_bits_address; 
  assign master_splitter_auto_out_3_b_bits_mask = system_bus_xbar_auto_in_3_b_bits_mask; 
  assign master_splitter_auto_out_3_b_bits_corrupt = system_bus_xbar_auto_in_3_b_bits_corrupt; 
  assign master_splitter_auto_out_3_c_ready = system_bus_xbar_auto_in_3_c_ready; 
  assign master_splitter_auto_out_3_d_valid = system_bus_xbar_auto_in_3_d_valid; 
  assign master_splitter_auto_out_3_d_bits_opcode = system_bus_xbar_auto_in_3_d_bits_opcode; 
  assign master_splitter_auto_out_3_d_bits_param = system_bus_xbar_auto_in_3_d_bits_param; 
  assign master_splitter_auto_out_3_d_bits_size = system_bus_xbar_auto_in_3_d_bits_size; 
  assign master_splitter_auto_out_3_d_bits_source = system_bus_xbar_auto_in_3_d_bits_source; 
  assign master_splitter_auto_out_3_d_bits_sink = system_bus_xbar_auto_in_3_d_bits_sink; 
  assign master_splitter_auto_out_3_d_bits_denied = system_bus_xbar_auto_in_3_d_bits_denied; 
  assign master_splitter_auto_out_3_d_bits_data = system_bus_xbar_auto_in_3_d_bits_data; 
  assign master_splitter_auto_out_3_d_bits_corrupt = system_bus_xbar_auto_in_3_d_bits_corrupt; 
  assign master_splitter_auto_out_3_e_ready = system_bus_xbar_auto_in_3_e_ready; 
  assign master_splitter_auto_out_2_a_ready = system_bus_xbar_auto_in_2_a_ready; 
  assign master_splitter_auto_out_2_b_valid = system_bus_xbar_auto_in_2_b_valid; 
  assign master_splitter_auto_out_2_b_bits_opcode = system_bus_xbar_auto_in_2_b_bits_opcode; 
  assign master_splitter_auto_out_2_b_bits_param = system_bus_xbar_auto_in_2_b_bits_param; 
  assign master_splitter_auto_out_2_b_bits_size = system_bus_xbar_auto_in_2_b_bits_size; 
  assign master_splitter_auto_out_2_b_bits_source = system_bus_xbar_auto_in_2_b_bits_source; 
  assign master_splitter_auto_out_2_b_bits_address = system_bus_xbar_auto_in_2_b_bits_address; 
  assign master_splitter_auto_out_2_b_bits_mask = system_bus_xbar_auto_in_2_b_bits_mask; 
  assign master_splitter_auto_out_2_b_bits_corrupt = system_bus_xbar_auto_in_2_b_bits_corrupt; 
  assign master_splitter_auto_out_2_c_ready = system_bus_xbar_auto_in_2_c_ready; 
  assign master_splitter_auto_out_2_d_valid = system_bus_xbar_auto_in_2_d_valid; 
  assign master_splitter_auto_out_2_d_bits_opcode = system_bus_xbar_auto_in_2_d_bits_opcode; 
  assign master_splitter_auto_out_2_d_bits_param = system_bus_xbar_auto_in_2_d_bits_param; 
  assign master_splitter_auto_out_2_d_bits_size = system_bus_xbar_auto_in_2_d_bits_size; 
  assign master_splitter_auto_out_2_d_bits_source = system_bus_xbar_auto_in_2_d_bits_source; 
  assign master_splitter_auto_out_2_d_bits_sink = system_bus_xbar_auto_in_2_d_bits_sink; 
  assign master_splitter_auto_out_2_d_bits_denied = system_bus_xbar_auto_in_2_d_bits_denied; 
  assign master_splitter_auto_out_2_d_bits_data = system_bus_xbar_auto_in_2_d_bits_data; 
  assign master_splitter_auto_out_2_d_bits_corrupt = system_bus_xbar_auto_in_2_d_bits_corrupt; 
  assign master_splitter_auto_out_2_e_ready = system_bus_xbar_auto_in_2_e_ready; 
  assign master_splitter_auto_out_1_a_ready = system_bus_xbar_auto_in_1_a_ready; 
  assign master_splitter_auto_out_1_b_valid = system_bus_xbar_auto_in_1_b_valid; 
  assign master_splitter_auto_out_1_b_bits_opcode = system_bus_xbar_auto_in_1_b_bits_opcode; 
  assign master_splitter_auto_out_1_b_bits_param = system_bus_xbar_auto_in_1_b_bits_param; 
  assign master_splitter_auto_out_1_b_bits_size = system_bus_xbar_auto_in_1_b_bits_size; 
  assign master_splitter_auto_out_1_b_bits_source = system_bus_xbar_auto_in_1_b_bits_source; 
  assign master_splitter_auto_out_1_b_bits_address = system_bus_xbar_auto_in_1_b_bits_address; 
  assign master_splitter_auto_out_1_b_bits_mask = system_bus_xbar_auto_in_1_b_bits_mask; 
  assign master_splitter_auto_out_1_b_bits_corrupt = system_bus_xbar_auto_in_1_b_bits_corrupt; 
  assign master_splitter_auto_out_1_c_ready = system_bus_xbar_auto_in_1_c_ready; 
  assign master_splitter_auto_out_1_d_valid = system_bus_xbar_auto_in_1_d_valid; 
  assign master_splitter_auto_out_1_d_bits_opcode = system_bus_xbar_auto_in_1_d_bits_opcode; 
  assign master_splitter_auto_out_1_d_bits_param = system_bus_xbar_auto_in_1_d_bits_param; 
  assign master_splitter_auto_out_1_d_bits_size = system_bus_xbar_auto_in_1_d_bits_size; 
  assign master_splitter_auto_out_1_d_bits_source = system_bus_xbar_auto_in_1_d_bits_source; 
  assign master_splitter_auto_out_1_d_bits_sink = system_bus_xbar_auto_in_1_d_bits_sink; 
  assign master_splitter_auto_out_1_d_bits_denied = system_bus_xbar_auto_in_1_d_bits_denied; 
  assign master_splitter_auto_out_1_d_bits_data = system_bus_xbar_auto_in_1_d_bits_data; 
  assign master_splitter_auto_out_1_d_bits_corrupt = system_bus_xbar_auto_in_1_d_bits_corrupt; 
  assign master_splitter_auto_out_1_e_ready = system_bus_xbar_auto_in_1_e_ready; 
  assign master_splitter_auto_out_0_a_ready = system_bus_xbar_auto_in_0_a_ready; 
  assign master_splitter_auto_out_0_b_valid = system_bus_xbar_auto_in_0_b_valid; 
  assign master_splitter_auto_out_0_b_bits_opcode = system_bus_xbar_auto_in_0_b_bits_opcode; 
  assign master_splitter_auto_out_0_b_bits_param = system_bus_xbar_auto_in_0_b_bits_param; 
  assign master_splitter_auto_out_0_b_bits_size = system_bus_xbar_auto_in_0_b_bits_size; 
  assign master_splitter_auto_out_0_b_bits_source = system_bus_xbar_auto_in_0_b_bits_source; 
  assign master_splitter_auto_out_0_b_bits_address = system_bus_xbar_auto_in_0_b_bits_address; 
  assign master_splitter_auto_out_0_b_bits_mask = system_bus_xbar_auto_in_0_b_bits_mask; 
  assign master_splitter_auto_out_0_b_bits_corrupt = system_bus_xbar_auto_in_0_b_bits_corrupt; 
  assign master_splitter_auto_out_0_c_ready = system_bus_xbar_auto_in_0_c_ready; 
  assign master_splitter_auto_out_0_d_valid = system_bus_xbar_auto_in_0_d_valid; 
  assign master_splitter_auto_out_0_d_bits_opcode = system_bus_xbar_auto_in_0_d_bits_opcode; 
  assign master_splitter_auto_out_0_d_bits_param = system_bus_xbar_auto_in_0_d_bits_param; 
  assign master_splitter_auto_out_0_d_bits_size = system_bus_xbar_auto_in_0_d_bits_size; 
  assign master_splitter_auto_out_0_d_bits_source = system_bus_xbar_auto_in_0_d_bits_source; 
  assign master_splitter_auto_out_0_d_bits_sink = system_bus_xbar_auto_in_0_d_bits_sink; 
  assign master_splitter_auto_out_0_d_bits_denied = system_bus_xbar_auto_in_0_d_bits_denied; 
  assign master_splitter_auto_out_0_d_bits_data = system_bus_xbar_auto_in_0_d_bits_data; 
  assign master_splitter_auto_out_0_d_bits_corrupt = system_bus_xbar_auto_in_0_d_bits_corrupt; 
  assign master_splitter_auto_out_0_e_ready = system_bus_xbar_auto_in_0_e_ready; 
  assign wrapped_error_device_clock = clock; 
  assign wrapped_error_device_reset = reset; 
  assign wrapped_error_device_auto_buffer_in_a_valid = system_bus_xbar_auto_out_1_a_valid; 
  assign wrapped_error_device_auto_buffer_in_a_bits_opcode = system_bus_xbar_auto_out_1_a_bits_opcode; 
  assign wrapped_error_device_auto_buffer_in_a_bits_param = system_bus_xbar_auto_out_1_a_bits_param; 
  assign wrapped_error_device_auto_buffer_in_a_bits_size = system_bus_xbar_auto_out_1_a_bits_size; 
  assign wrapped_error_device_auto_buffer_in_a_bits_source = system_bus_xbar_auto_out_1_a_bits_source; 
  assign wrapped_error_device_auto_buffer_in_a_bits_address = system_bus_xbar_auto_out_1_a_bits_address; 
  assign wrapped_error_device_auto_buffer_in_a_bits_mask = system_bus_xbar_auto_out_1_a_bits_mask; 
  assign wrapped_error_device_auto_buffer_in_a_bits_corrupt = system_bus_xbar_auto_out_1_a_bits_corrupt; 
  assign wrapped_error_device_auto_buffer_in_b_ready = system_bus_xbar_auto_out_1_b_ready; 
  assign wrapped_error_device_auto_buffer_in_c_valid = system_bus_xbar_auto_out_1_c_valid; 
  assign wrapped_error_device_auto_buffer_in_c_bits_opcode = system_bus_xbar_auto_out_1_c_bits_opcode; 
  assign wrapped_error_device_auto_buffer_in_c_bits_param = system_bus_xbar_auto_out_1_c_bits_param; 
  assign wrapped_error_device_auto_buffer_in_c_bits_size = system_bus_xbar_auto_out_1_c_bits_size; 
  assign wrapped_error_device_auto_buffer_in_c_bits_source = system_bus_xbar_auto_out_1_c_bits_source; 
  assign wrapped_error_device_auto_buffer_in_c_bits_address = system_bus_xbar_auto_out_1_c_bits_address; 
  assign wrapped_error_device_auto_buffer_in_c_bits_corrupt = system_bus_xbar_auto_out_1_c_bits_corrupt; 
  assign wrapped_error_device_auto_buffer_in_d_ready = system_bus_xbar_auto_out_1_d_ready; 
  assign wrapped_error_device_auto_buffer_in_e_valid = system_bus_xbar_auto_out_1_e_valid; 
  assign coupler_from_tile_named_tile_clock = clock; 
  assign coupler_from_tile_named_tile_reset = reset; 
  assign coupler_from_tile_named_tile_auto_buffer_out_a_ready = master_splitter_auto_in_0_a_ready; 
  assign coupler_from_tile_named_tile_auto_buffer_out_b_valid = master_splitter_auto_in_0_b_valid; 
  assign coupler_from_tile_named_tile_auto_buffer_out_b_bits_opcode = master_splitter_auto_in_0_b_bits_opcode; 
  assign coupler_from_tile_named_tile_auto_buffer_out_b_bits_param = master_splitter_auto_in_0_b_bits_param; 
  assign coupler_from_tile_named_tile_auto_buffer_out_b_bits_size = master_splitter_auto_in_0_b_bits_size; 
  assign coupler_from_tile_named_tile_auto_buffer_out_b_bits_source = master_splitter_auto_in_0_b_bits_source; 
  assign coupler_from_tile_named_tile_auto_buffer_out_b_bits_address = master_splitter_auto_in_0_b_bits_address; 
  assign coupler_from_tile_named_tile_auto_buffer_out_b_bits_mask = master_splitter_auto_in_0_b_bits_mask; 
  assign coupler_from_tile_named_tile_auto_buffer_out_b_bits_corrupt = master_splitter_auto_in_0_b_bits_corrupt; 
  assign coupler_from_tile_named_tile_auto_buffer_out_c_ready = master_splitter_auto_in_0_c_ready; 
  assign coupler_from_tile_named_tile_auto_buffer_out_d_valid = master_splitter_auto_in_0_d_valid; 
  assign coupler_from_tile_named_tile_auto_buffer_out_d_bits_opcode = master_splitter_auto_in_0_d_bits_opcode; 
  assign coupler_from_tile_named_tile_auto_buffer_out_d_bits_param = master_splitter_auto_in_0_d_bits_param; 
  assign coupler_from_tile_named_tile_auto_buffer_out_d_bits_size = master_splitter_auto_in_0_d_bits_size; 
  assign coupler_from_tile_named_tile_auto_buffer_out_d_bits_source = master_splitter_auto_in_0_d_bits_source; 
  assign coupler_from_tile_named_tile_auto_buffer_out_d_bits_sink = master_splitter_auto_in_0_d_bits_sink; 
  assign coupler_from_tile_named_tile_auto_buffer_out_d_bits_denied = master_splitter_auto_in_0_d_bits_denied; 
  assign coupler_from_tile_named_tile_auto_buffer_out_d_bits_data = master_splitter_auto_in_0_d_bits_data; 
  assign coupler_from_tile_named_tile_auto_buffer_out_d_bits_corrupt = master_splitter_auto_in_0_d_bits_corrupt; 
  assign coupler_from_tile_named_tile_auto_buffer_out_e_ready = master_splitter_auto_in_0_e_ready; 
  assign coupler_from_tile_named_tile_auto_tl_master_xing_in_a_valid = auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_valid; 
  assign coupler_from_tile_named_tile_auto_tl_master_xing_in_a_bits_opcode = auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_bits_opcode; 
  assign coupler_from_tile_named_tile_auto_tl_master_xing_in_a_bits_param = auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_bits_param; 
  assign coupler_from_tile_named_tile_auto_tl_master_xing_in_a_bits_size = auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_bits_size; 
  assign coupler_from_tile_named_tile_auto_tl_master_xing_in_a_bits_source = auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_bits_source; 
  assign coupler_from_tile_named_tile_auto_tl_master_xing_in_a_bits_address = auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_bits_address; 
  assign coupler_from_tile_named_tile_auto_tl_master_xing_in_a_bits_mask = auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_bits_mask; 
  assign coupler_from_tile_named_tile_auto_tl_master_xing_in_a_bits_data = auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_bits_data; 
  assign coupler_from_tile_named_tile_auto_tl_master_xing_in_a_bits_corrupt = auto_coupler_from_tile_named_tile_tl_master_xing_in_0_a_bits_corrupt; 
  assign coupler_from_tile_named_tile_auto_tl_master_xing_in_b_ready = auto_coupler_from_tile_named_tile_tl_master_xing_in_0_b_ready; 
  assign coupler_from_tile_named_tile_auto_tl_master_xing_in_c_valid = auto_coupler_from_tile_named_tile_tl_master_xing_in_0_c_valid; 
  assign coupler_from_tile_named_tile_auto_tl_master_xing_in_c_bits_opcode = auto_coupler_from_tile_named_tile_tl_master_xing_in_0_c_bits_opcode; 
  assign coupler_from_tile_named_tile_auto_tl_master_xing_in_c_bits_param = auto_coupler_from_tile_named_tile_tl_master_xing_in_0_c_bits_param; 
  assign coupler_from_tile_named_tile_auto_tl_master_xing_in_c_bits_size = auto_coupler_from_tile_named_tile_tl_master_xing_in_0_c_bits_size; 
  assign coupler_from_tile_named_tile_auto_tl_master_xing_in_c_bits_source = auto_coupler_from_tile_named_tile_tl_master_xing_in_0_c_bits_source; 
  assign coupler_from_tile_named_tile_auto_tl_master_xing_in_c_bits_address = auto_coupler_from_tile_named_tile_tl_master_xing_in_0_c_bits_address; 
  assign coupler_from_tile_named_tile_auto_tl_master_xing_in_c_bits_data = auto_coupler_from_tile_named_tile_tl_master_xing_in_0_c_bits_data; 
  assign coupler_from_tile_named_tile_auto_tl_master_xing_in_c_bits_corrupt = auto_coupler_from_tile_named_tile_tl_master_xing_in_0_c_bits_corrupt; 
  assign coupler_from_tile_named_tile_auto_tl_master_xing_in_d_ready = auto_coupler_from_tile_named_tile_tl_master_xing_in_0_d_ready; 
  assign coupler_from_tile_named_tile_auto_tl_master_xing_in_e_valid = auto_coupler_from_tile_named_tile_tl_master_xing_in_0_e_valid; 
  assign coupler_from_tile_named_tile_auto_tl_master_xing_in_e_bits_sink = auto_coupler_from_tile_named_tile_tl_master_xing_in_0_e_bits_sink; 
  assign coupler_from_tile_named_tile_1_clock = clock; 
  assign coupler_from_tile_named_tile_1_reset = reset; 
  assign coupler_from_tile_named_tile_1_auto_buffer_out_a_ready = master_splitter_auto_in_1_a_ready; 
  assign coupler_from_tile_named_tile_1_auto_buffer_out_b_valid = master_splitter_auto_in_1_b_valid; 
  assign coupler_from_tile_named_tile_1_auto_buffer_out_b_bits_opcode = master_splitter_auto_in_1_b_bits_opcode; 
  assign coupler_from_tile_named_tile_1_auto_buffer_out_b_bits_param = master_splitter_auto_in_1_b_bits_param; 
  assign coupler_from_tile_named_tile_1_auto_buffer_out_b_bits_size = master_splitter_auto_in_1_b_bits_size; 
  assign coupler_from_tile_named_tile_1_auto_buffer_out_b_bits_source = master_splitter_auto_in_1_b_bits_source; 
  assign coupler_from_tile_named_tile_1_auto_buffer_out_b_bits_address = master_splitter_auto_in_1_b_bits_address; 
  assign coupler_from_tile_named_tile_1_auto_buffer_out_b_bits_mask = master_splitter_auto_in_1_b_bits_mask; 
  assign coupler_from_tile_named_tile_1_auto_buffer_out_b_bits_corrupt = master_splitter_auto_in_1_b_bits_corrupt; 
  assign coupler_from_tile_named_tile_1_auto_buffer_out_c_ready = master_splitter_auto_in_1_c_ready; 
  assign coupler_from_tile_named_tile_1_auto_buffer_out_d_valid = master_splitter_auto_in_1_d_valid; 
  assign coupler_from_tile_named_tile_1_auto_buffer_out_d_bits_opcode = master_splitter_auto_in_1_d_bits_opcode; 
  assign coupler_from_tile_named_tile_1_auto_buffer_out_d_bits_param = master_splitter_auto_in_1_d_bits_param; 
  assign coupler_from_tile_named_tile_1_auto_buffer_out_d_bits_size = master_splitter_auto_in_1_d_bits_size; 
  assign coupler_from_tile_named_tile_1_auto_buffer_out_d_bits_source = master_splitter_auto_in_1_d_bits_source; 
  assign coupler_from_tile_named_tile_1_auto_buffer_out_d_bits_sink = master_splitter_auto_in_1_d_bits_sink; 
  assign coupler_from_tile_named_tile_1_auto_buffer_out_d_bits_denied = master_splitter_auto_in_1_d_bits_denied; 
  assign coupler_from_tile_named_tile_1_auto_buffer_out_d_bits_data = master_splitter_auto_in_1_d_bits_data; 
  assign coupler_from_tile_named_tile_1_auto_buffer_out_d_bits_corrupt = master_splitter_auto_in_1_d_bits_corrupt; 
  assign coupler_from_tile_named_tile_1_auto_buffer_out_e_ready = master_splitter_auto_in_1_e_ready; 
  assign coupler_from_tile_named_tile_1_auto_tl_master_xing_in_a_valid = auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_valid; 
  assign coupler_from_tile_named_tile_1_auto_tl_master_xing_in_a_bits_opcode = auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_bits_opcode; 
  assign coupler_from_tile_named_tile_1_auto_tl_master_xing_in_a_bits_param = auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_bits_param; 
  assign coupler_from_tile_named_tile_1_auto_tl_master_xing_in_a_bits_size = auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_bits_size; 
  assign coupler_from_tile_named_tile_1_auto_tl_master_xing_in_a_bits_source = auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_bits_source; 
  assign coupler_from_tile_named_tile_1_auto_tl_master_xing_in_a_bits_address = auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_bits_address; 
  assign coupler_from_tile_named_tile_1_auto_tl_master_xing_in_a_bits_mask = auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_bits_mask; 
  assign coupler_from_tile_named_tile_1_auto_tl_master_xing_in_a_bits_data = auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_bits_data; 
  assign coupler_from_tile_named_tile_1_auto_tl_master_xing_in_a_bits_corrupt = auto_coupler_from_tile_named_tile_tl_master_xing_in_1_a_bits_corrupt; 
  assign coupler_from_tile_named_tile_1_auto_tl_master_xing_in_b_ready = auto_coupler_from_tile_named_tile_tl_master_xing_in_1_b_ready; 
  assign coupler_from_tile_named_tile_1_auto_tl_master_xing_in_c_valid = auto_coupler_from_tile_named_tile_tl_master_xing_in_1_c_valid; 
  assign coupler_from_tile_named_tile_1_auto_tl_master_xing_in_c_bits_opcode = auto_coupler_from_tile_named_tile_tl_master_xing_in_1_c_bits_opcode; 
  assign coupler_from_tile_named_tile_1_auto_tl_master_xing_in_c_bits_param = auto_coupler_from_tile_named_tile_tl_master_xing_in_1_c_bits_param; 
  assign coupler_from_tile_named_tile_1_auto_tl_master_xing_in_c_bits_size = auto_coupler_from_tile_named_tile_tl_master_xing_in_1_c_bits_size; 
  assign coupler_from_tile_named_tile_1_auto_tl_master_xing_in_c_bits_source = auto_coupler_from_tile_named_tile_tl_master_xing_in_1_c_bits_source; 
  assign coupler_from_tile_named_tile_1_auto_tl_master_xing_in_c_bits_address = auto_coupler_from_tile_named_tile_tl_master_xing_in_1_c_bits_address; 
  assign coupler_from_tile_named_tile_1_auto_tl_master_xing_in_c_bits_data = auto_coupler_from_tile_named_tile_tl_master_xing_in_1_c_bits_data; 
  assign coupler_from_tile_named_tile_1_auto_tl_master_xing_in_c_bits_corrupt = auto_coupler_from_tile_named_tile_tl_master_xing_in_1_c_bits_corrupt; 
  assign coupler_from_tile_named_tile_1_auto_tl_master_xing_in_d_ready = auto_coupler_from_tile_named_tile_tl_master_xing_in_1_d_ready; 
  assign coupler_from_tile_named_tile_1_auto_tl_master_xing_in_e_valid = auto_coupler_from_tile_named_tile_tl_master_xing_in_1_e_valid; 
  assign coupler_from_tile_named_tile_1_auto_tl_master_xing_in_e_bits_sink = auto_coupler_from_tile_named_tile_tl_master_xing_in_1_e_bits_sink; 
  assign coupler_from_tile_named_tile_2_clock = clock; 
  assign coupler_from_tile_named_tile_2_reset = reset; 
  assign coupler_from_tile_named_tile_2_auto_buffer_out_a_ready = master_splitter_auto_in_2_a_ready; 
  assign coupler_from_tile_named_tile_2_auto_buffer_out_b_valid = master_splitter_auto_in_2_b_valid; 
  assign coupler_from_tile_named_tile_2_auto_buffer_out_b_bits_opcode = master_splitter_auto_in_2_b_bits_opcode; 
  assign coupler_from_tile_named_tile_2_auto_buffer_out_b_bits_param = master_splitter_auto_in_2_b_bits_param; 
  assign coupler_from_tile_named_tile_2_auto_buffer_out_b_bits_size = master_splitter_auto_in_2_b_bits_size; 
  assign coupler_from_tile_named_tile_2_auto_buffer_out_b_bits_source = master_splitter_auto_in_2_b_bits_source; 
  assign coupler_from_tile_named_tile_2_auto_buffer_out_b_bits_address = master_splitter_auto_in_2_b_bits_address; 
  assign coupler_from_tile_named_tile_2_auto_buffer_out_b_bits_mask = master_splitter_auto_in_2_b_bits_mask; 
  assign coupler_from_tile_named_tile_2_auto_buffer_out_b_bits_corrupt = master_splitter_auto_in_2_b_bits_corrupt; 
  assign coupler_from_tile_named_tile_2_auto_buffer_out_c_ready = master_splitter_auto_in_2_c_ready; 
  assign coupler_from_tile_named_tile_2_auto_buffer_out_d_valid = master_splitter_auto_in_2_d_valid; 
  assign coupler_from_tile_named_tile_2_auto_buffer_out_d_bits_opcode = master_splitter_auto_in_2_d_bits_opcode; 
  assign coupler_from_tile_named_tile_2_auto_buffer_out_d_bits_param = master_splitter_auto_in_2_d_bits_param; 
  assign coupler_from_tile_named_tile_2_auto_buffer_out_d_bits_size = master_splitter_auto_in_2_d_bits_size; 
  assign coupler_from_tile_named_tile_2_auto_buffer_out_d_bits_source = master_splitter_auto_in_2_d_bits_source; 
  assign coupler_from_tile_named_tile_2_auto_buffer_out_d_bits_sink = master_splitter_auto_in_2_d_bits_sink; 
  assign coupler_from_tile_named_tile_2_auto_buffer_out_d_bits_denied = master_splitter_auto_in_2_d_bits_denied; 
  assign coupler_from_tile_named_tile_2_auto_buffer_out_d_bits_data = master_splitter_auto_in_2_d_bits_data; 
  assign coupler_from_tile_named_tile_2_auto_buffer_out_d_bits_corrupt = master_splitter_auto_in_2_d_bits_corrupt; 
  assign coupler_from_tile_named_tile_2_auto_buffer_out_e_ready = master_splitter_auto_in_2_e_ready; 
  assign coupler_from_tile_named_tile_2_auto_tl_master_xing_in_a_valid = auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_valid; 
  assign coupler_from_tile_named_tile_2_auto_tl_master_xing_in_a_bits_opcode = auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_bits_opcode; 
  assign coupler_from_tile_named_tile_2_auto_tl_master_xing_in_a_bits_param = auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_bits_param; 
  assign coupler_from_tile_named_tile_2_auto_tl_master_xing_in_a_bits_size = auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_bits_size; 
  assign coupler_from_tile_named_tile_2_auto_tl_master_xing_in_a_bits_source = auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_bits_source; 
  assign coupler_from_tile_named_tile_2_auto_tl_master_xing_in_a_bits_address = auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_bits_address; 
  assign coupler_from_tile_named_tile_2_auto_tl_master_xing_in_a_bits_mask = auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_bits_mask; 
  assign coupler_from_tile_named_tile_2_auto_tl_master_xing_in_a_bits_data = auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_bits_data; 
  assign coupler_from_tile_named_tile_2_auto_tl_master_xing_in_a_bits_corrupt = auto_coupler_from_tile_named_tile_tl_master_xing_in_2_a_bits_corrupt; 
  assign coupler_from_tile_named_tile_2_auto_tl_master_xing_in_b_ready = auto_coupler_from_tile_named_tile_tl_master_xing_in_2_b_ready; 
  assign coupler_from_tile_named_tile_2_auto_tl_master_xing_in_c_valid = auto_coupler_from_tile_named_tile_tl_master_xing_in_2_c_valid; 
  assign coupler_from_tile_named_tile_2_auto_tl_master_xing_in_c_bits_opcode = auto_coupler_from_tile_named_tile_tl_master_xing_in_2_c_bits_opcode; 
  assign coupler_from_tile_named_tile_2_auto_tl_master_xing_in_c_bits_param = auto_coupler_from_tile_named_tile_tl_master_xing_in_2_c_bits_param; 
  assign coupler_from_tile_named_tile_2_auto_tl_master_xing_in_c_bits_size = auto_coupler_from_tile_named_tile_tl_master_xing_in_2_c_bits_size; 
  assign coupler_from_tile_named_tile_2_auto_tl_master_xing_in_c_bits_source = auto_coupler_from_tile_named_tile_tl_master_xing_in_2_c_bits_source; 
  assign coupler_from_tile_named_tile_2_auto_tl_master_xing_in_c_bits_address = auto_coupler_from_tile_named_tile_tl_master_xing_in_2_c_bits_address; 
  assign coupler_from_tile_named_tile_2_auto_tl_master_xing_in_c_bits_data = auto_coupler_from_tile_named_tile_tl_master_xing_in_2_c_bits_data; 
  assign coupler_from_tile_named_tile_2_auto_tl_master_xing_in_c_bits_corrupt = auto_coupler_from_tile_named_tile_tl_master_xing_in_2_c_bits_corrupt; 
  assign coupler_from_tile_named_tile_2_auto_tl_master_xing_in_d_ready = auto_coupler_from_tile_named_tile_tl_master_xing_in_2_d_ready; 
  assign coupler_from_tile_named_tile_2_auto_tl_master_xing_in_e_valid = auto_coupler_from_tile_named_tile_tl_master_xing_in_2_e_valid; 
  assign coupler_from_tile_named_tile_2_auto_tl_master_xing_in_e_bits_sink = auto_coupler_from_tile_named_tile_tl_master_xing_in_2_e_bits_sink; 
  assign coupler_from_tile_named_tile_3_clock = clock; 
  assign coupler_from_tile_named_tile_3_reset = reset; 
  assign coupler_from_tile_named_tile_3_auto_buffer_out_a_ready = master_splitter_auto_in_3_a_ready; 
  assign coupler_from_tile_named_tile_3_auto_buffer_out_b_valid = master_splitter_auto_in_3_b_valid; 
  assign coupler_from_tile_named_tile_3_auto_buffer_out_b_bits_opcode = master_splitter_auto_in_3_b_bits_opcode; 
  assign coupler_from_tile_named_tile_3_auto_buffer_out_b_bits_param = master_splitter_auto_in_3_b_bits_param; 
  assign coupler_from_tile_named_tile_3_auto_buffer_out_b_bits_size = master_splitter_auto_in_3_b_bits_size; 
  assign coupler_from_tile_named_tile_3_auto_buffer_out_b_bits_source = master_splitter_auto_in_3_b_bits_source; 
  assign coupler_from_tile_named_tile_3_auto_buffer_out_b_bits_address = master_splitter_auto_in_3_b_bits_address; 
  assign coupler_from_tile_named_tile_3_auto_buffer_out_b_bits_mask = master_splitter_auto_in_3_b_bits_mask; 
  assign coupler_from_tile_named_tile_3_auto_buffer_out_b_bits_corrupt = master_splitter_auto_in_3_b_bits_corrupt; 
  assign coupler_from_tile_named_tile_3_auto_buffer_out_c_ready = master_splitter_auto_in_3_c_ready; 
  assign coupler_from_tile_named_tile_3_auto_buffer_out_d_valid = master_splitter_auto_in_3_d_valid; 
  assign coupler_from_tile_named_tile_3_auto_buffer_out_d_bits_opcode = master_splitter_auto_in_3_d_bits_opcode; 
  assign coupler_from_tile_named_tile_3_auto_buffer_out_d_bits_param = master_splitter_auto_in_3_d_bits_param; 
  assign coupler_from_tile_named_tile_3_auto_buffer_out_d_bits_size = master_splitter_auto_in_3_d_bits_size; 
  assign coupler_from_tile_named_tile_3_auto_buffer_out_d_bits_source = master_splitter_auto_in_3_d_bits_source; 
  assign coupler_from_tile_named_tile_3_auto_buffer_out_d_bits_sink = master_splitter_auto_in_3_d_bits_sink; 
  assign coupler_from_tile_named_tile_3_auto_buffer_out_d_bits_denied = master_splitter_auto_in_3_d_bits_denied; 
  assign coupler_from_tile_named_tile_3_auto_buffer_out_d_bits_data = master_splitter_auto_in_3_d_bits_data; 
  assign coupler_from_tile_named_tile_3_auto_buffer_out_d_bits_corrupt = master_splitter_auto_in_3_d_bits_corrupt; 
  assign coupler_from_tile_named_tile_3_auto_buffer_out_e_ready = master_splitter_auto_in_3_e_ready; 
  assign coupler_from_tile_named_tile_3_auto_tl_master_xing_in_a_valid = auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_valid; 
  assign coupler_from_tile_named_tile_3_auto_tl_master_xing_in_a_bits_opcode = auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_bits_opcode; 
  assign coupler_from_tile_named_tile_3_auto_tl_master_xing_in_a_bits_param = auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_bits_param; 
  assign coupler_from_tile_named_tile_3_auto_tl_master_xing_in_a_bits_size = auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_bits_size; 
  assign coupler_from_tile_named_tile_3_auto_tl_master_xing_in_a_bits_source = auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_bits_source; 
  assign coupler_from_tile_named_tile_3_auto_tl_master_xing_in_a_bits_address = auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_bits_address; 
  assign coupler_from_tile_named_tile_3_auto_tl_master_xing_in_a_bits_mask = auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_bits_mask; 
  assign coupler_from_tile_named_tile_3_auto_tl_master_xing_in_a_bits_data = auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_bits_data; 
  assign coupler_from_tile_named_tile_3_auto_tl_master_xing_in_a_bits_corrupt = auto_coupler_from_tile_named_tile_tl_master_xing_in_3_a_bits_corrupt; 
  assign coupler_from_tile_named_tile_3_auto_tl_master_xing_in_b_ready = auto_coupler_from_tile_named_tile_tl_master_xing_in_3_b_ready; 
  assign coupler_from_tile_named_tile_3_auto_tl_master_xing_in_c_valid = auto_coupler_from_tile_named_tile_tl_master_xing_in_3_c_valid; 
  assign coupler_from_tile_named_tile_3_auto_tl_master_xing_in_c_bits_opcode = auto_coupler_from_tile_named_tile_tl_master_xing_in_3_c_bits_opcode; 
  assign coupler_from_tile_named_tile_3_auto_tl_master_xing_in_c_bits_param = auto_coupler_from_tile_named_tile_tl_master_xing_in_3_c_bits_param; 
  assign coupler_from_tile_named_tile_3_auto_tl_master_xing_in_c_bits_size = auto_coupler_from_tile_named_tile_tl_master_xing_in_3_c_bits_size; 
  assign coupler_from_tile_named_tile_3_auto_tl_master_xing_in_c_bits_source = auto_coupler_from_tile_named_tile_tl_master_xing_in_3_c_bits_source; 
  assign coupler_from_tile_named_tile_3_auto_tl_master_xing_in_c_bits_address = auto_coupler_from_tile_named_tile_tl_master_xing_in_3_c_bits_address; 
  assign coupler_from_tile_named_tile_3_auto_tl_master_xing_in_c_bits_data = auto_coupler_from_tile_named_tile_tl_master_xing_in_3_c_bits_data; 
  assign coupler_from_tile_named_tile_3_auto_tl_master_xing_in_c_bits_corrupt = auto_coupler_from_tile_named_tile_tl_master_xing_in_3_c_bits_corrupt; 
  assign coupler_from_tile_named_tile_3_auto_tl_master_xing_in_d_ready = auto_coupler_from_tile_named_tile_tl_master_xing_in_3_d_ready; 
  assign coupler_from_tile_named_tile_3_auto_tl_master_xing_in_e_valid = auto_coupler_from_tile_named_tile_tl_master_xing_in_3_e_valid; 
  assign coupler_from_tile_named_tile_3_auto_tl_master_xing_in_e_bits_sink = auto_coupler_from_tile_named_tile_tl_master_xing_in_3_e_bits_sink; 
  assign coupler_from_master_named_pcie_0_clock = clock; 
  assign coupler_from_master_named_pcie_0_reset = reset; 
  assign coupler_from_master_named_pcie_0_auto_fixer_in_a_valid = auto_coupler_from_master_named_pcie_0_fixer_in_a_valid; 
  assign coupler_from_master_named_pcie_0_auto_fixer_in_a_bits_opcode = auto_coupler_from_master_named_pcie_0_fixer_in_a_bits_opcode; 
  assign coupler_from_master_named_pcie_0_auto_fixer_in_a_bits_param = auto_coupler_from_master_named_pcie_0_fixer_in_a_bits_param; 
  assign coupler_from_master_named_pcie_0_auto_fixer_in_a_bits_size = auto_coupler_from_master_named_pcie_0_fixer_in_a_bits_size; 
  assign coupler_from_master_named_pcie_0_auto_fixer_in_a_bits_source = auto_coupler_from_master_named_pcie_0_fixer_in_a_bits_source; 
  assign coupler_from_master_named_pcie_0_auto_fixer_in_a_bits_address = auto_coupler_from_master_named_pcie_0_fixer_in_a_bits_address; 
  assign coupler_from_master_named_pcie_0_auto_fixer_in_a_bits_mask = auto_coupler_from_master_named_pcie_0_fixer_in_a_bits_mask; 
  assign coupler_from_master_named_pcie_0_auto_fixer_in_a_bits_data = auto_coupler_from_master_named_pcie_0_fixer_in_a_bits_data; 
  assign coupler_from_master_named_pcie_0_auto_fixer_in_a_bits_corrupt = auto_coupler_from_master_named_pcie_0_fixer_in_a_bits_corrupt; 
  assign coupler_from_master_named_pcie_0_auto_fixer_in_d_ready = auto_coupler_from_master_named_pcie_0_fixer_in_d_ready; 
  assign coupler_from_master_named_pcie_0_auto_buffer_out_a_ready = system_bus_xbar_auto_in_4_a_ready; 
  assign coupler_from_master_named_pcie_0_auto_buffer_out_d_valid = system_bus_xbar_auto_in_4_d_valid; 
  assign coupler_from_master_named_pcie_0_auto_buffer_out_d_bits_opcode = system_bus_xbar_auto_in_4_d_bits_opcode; 
  assign coupler_from_master_named_pcie_0_auto_buffer_out_d_bits_param = system_bus_xbar_auto_in_4_d_bits_param; 
  assign coupler_from_master_named_pcie_0_auto_buffer_out_d_bits_size = system_bus_xbar_auto_in_4_d_bits_size; 
  assign coupler_from_master_named_pcie_0_auto_buffer_out_d_bits_source = system_bus_xbar_auto_in_4_d_bits_source; 
  assign coupler_from_master_named_pcie_0_auto_buffer_out_d_bits_sink = system_bus_xbar_auto_in_4_d_bits_sink; 
  assign coupler_from_master_named_pcie_0_auto_buffer_out_d_bits_denied = system_bus_xbar_auto_in_4_d_bits_denied; 
  assign coupler_from_master_named_pcie_0_auto_buffer_out_d_bits_data = system_bus_xbar_auto_in_4_d_bits_data; 
  assign coupler_from_master_named_pcie_0_auto_buffer_out_d_bits_corrupt = system_bus_xbar_auto_in_4_d_bits_corrupt; 
  assign coupler_to_slave_named_pcie_0_clock = clock; 
  assign coupler_to_slave_named_pcie_0_reset = reset; 
  assign coupler_to_slave_named_pcie_0_auto_buffer_in_1_a_valid = system_bus_xbar_auto_out_4_a_valid; 
  assign coupler_to_slave_named_pcie_0_auto_buffer_in_1_a_bits_opcode = system_bus_xbar_auto_out_4_a_bits_opcode; 
  assign coupler_to_slave_named_pcie_0_auto_buffer_in_1_a_bits_param = system_bus_xbar_auto_out_4_a_bits_param; 
  assign coupler_to_slave_named_pcie_0_auto_buffer_in_1_a_bits_size = system_bus_xbar_auto_out_4_a_bits_size; 
  assign coupler_to_slave_named_pcie_0_auto_buffer_in_1_a_bits_source = system_bus_xbar_auto_out_4_a_bits_source; 
  assign coupler_to_slave_named_pcie_0_auto_buffer_in_1_a_bits_address = system_bus_xbar_auto_out_4_a_bits_address; 
  assign coupler_to_slave_named_pcie_0_auto_buffer_in_1_a_bits_mask = system_bus_xbar_auto_out_4_a_bits_mask; 
  assign coupler_to_slave_named_pcie_0_auto_buffer_in_1_a_bits_data = system_bus_xbar_auto_out_4_a_bits_data; 
  assign coupler_to_slave_named_pcie_0_auto_buffer_in_1_a_bits_corrupt = system_bus_xbar_auto_out_4_a_bits_corrupt; 
  assign coupler_to_slave_named_pcie_0_auto_buffer_in_1_d_ready = system_bus_xbar_auto_out_4_d_ready; 
  assign coupler_to_slave_named_pcie_0_auto_buffer_in_0_a_valid = system_bus_xbar_auto_out_3_a_valid; 
  assign coupler_to_slave_named_pcie_0_auto_buffer_in_0_a_bits_opcode = system_bus_xbar_auto_out_3_a_bits_opcode; 
  assign coupler_to_slave_named_pcie_0_auto_buffer_in_0_a_bits_param = system_bus_xbar_auto_out_3_a_bits_param; 
  assign coupler_to_slave_named_pcie_0_auto_buffer_in_0_a_bits_size = system_bus_xbar_auto_out_3_a_bits_size; 
  assign coupler_to_slave_named_pcie_0_auto_buffer_in_0_a_bits_source = system_bus_xbar_auto_out_3_a_bits_source; 
  assign coupler_to_slave_named_pcie_0_auto_buffer_in_0_a_bits_address = system_bus_xbar_auto_out_3_a_bits_address; 
  assign coupler_to_slave_named_pcie_0_auto_buffer_in_0_a_bits_mask = system_bus_xbar_auto_out_3_a_bits_mask; 
  assign coupler_to_slave_named_pcie_0_auto_buffer_in_0_a_bits_data = system_bus_xbar_auto_out_3_a_bits_data; 
  assign coupler_to_slave_named_pcie_0_auto_buffer_in_0_a_bits_corrupt = system_bus_xbar_auto_out_3_a_bits_corrupt; 
  assign coupler_to_slave_named_pcie_0_auto_buffer_in_0_d_ready = system_bus_xbar_auto_out_3_d_ready; 
  assign coupler_to_slave_named_pcie_0_auto_widget_out_1_a_ready = auto_coupler_to_slave_named_pcie_0_widget_out_1_a_ready; 
  assign coupler_to_slave_named_pcie_0_auto_widget_out_1_d_valid = auto_coupler_to_slave_named_pcie_0_widget_out_1_d_valid; 
  assign coupler_to_slave_named_pcie_0_auto_widget_out_1_d_bits_opcode = auto_coupler_to_slave_named_pcie_0_widget_out_1_d_bits_opcode; 
  assign coupler_to_slave_named_pcie_0_auto_widget_out_1_d_bits_param = auto_coupler_to_slave_named_pcie_0_widget_out_1_d_bits_param; 
  assign coupler_to_slave_named_pcie_0_auto_widget_out_1_d_bits_size = auto_coupler_to_slave_named_pcie_0_widget_out_1_d_bits_size; 
  assign coupler_to_slave_named_pcie_0_auto_widget_out_1_d_bits_source = auto_coupler_to_slave_named_pcie_0_widget_out_1_d_bits_source; 
  assign coupler_to_slave_named_pcie_0_auto_widget_out_1_d_bits_sink = auto_coupler_to_slave_named_pcie_0_widget_out_1_d_bits_sink; 
  assign coupler_to_slave_named_pcie_0_auto_widget_out_1_d_bits_denied = auto_coupler_to_slave_named_pcie_0_widget_out_1_d_bits_denied; 
  assign coupler_to_slave_named_pcie_0_auto_widget_out_1_d_bits_data = auto_coupler_to_slave_named_pcie_0_widget_out_1_d_bits_data; 
  assign coupler_to_slave_named_pcie_0_auto_widget_out_1_d_bits_corrupt = auto_coupler_to_slave_named_pcie_0_widget_out_1_d_bits_corrupt; 
  assign coupler_to_slave_named_pcie_0_auto_widget_out_0_a_ready = auto_coupler_to_slave_named_pcie_0_widget_out_0_a_ready; 
  assign coupler_to_slave_named_pcie_0_auto_widget_out_0_d_valid = auto_coupler_to_slave_named_pcie_0_widget_out_0_d_valid; 
  assign coupler_to_slave_named_pcie_0_auto_widget_out_0_d_bits_opcode = auto_coupler_to_slave_named_pcie_0_widget_out_0_d_bits_opcode; 
  assign coupler_to_slave_named_pcie_0_auto_widget_out_0_d_bits_param = auto_coupler_to_slave_named_pcie_0_widget_out_0_d_bits_param; 
  assign coupler_to_slave_named_pcie_0_auto_widget_out_0_d_bits_size = auto_coupler_to_slave_named_pcie_0_widget_out_0_d_bits_size; 
  assign coupler_to_slave_named_pcie_0_auto_widget_out_0_d_bits_source = auto_coupler_to_slave_named_pcie_0_widget_out_0_d_bits_source; 
  assign coupler_to_slave_named_pcie_0_auto_widget_out_0_d_bits_sink = auto_coupler_to_slave_named_pcie_0_widget_out_0_d_bits_sink; 
  assign coupler_to_slave_named_pcie_0_auto_widget_out_0_d_bits_denied = auto_coupler_to_slave_named_pcie_0_widget_out_0_d_bits_denied; 
  assign coupler_to_slave_named_pcie_0_auto_widget_out_0_d_bits_data = auto_coupler_to_slave_named_pcie_0_widget_out_0_d_bits_data; 
  assign coupler_to_slave_named_pcie_0_auto_widget_out_0_d_bits_corrupt = auto_coupler_to_slave_named_pcie_0_widget_out_0_d_bits_corrupt; 
endmodule
