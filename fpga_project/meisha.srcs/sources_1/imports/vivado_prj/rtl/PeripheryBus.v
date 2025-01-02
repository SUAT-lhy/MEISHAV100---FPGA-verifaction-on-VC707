module PeripheryBus( 
  input         clock, 
  input         reset, 
  input         auto_coupler_to_slave_named_MaskROM_fragmenter_out_a_ready, 
  output        auto_coupler_to_slave_named_MaskROM_fragmenter_out_a_valid, 
  output [2:0]  auto_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_opcode, 
  output [2:0]  auto_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_param, 
  output [1:0]  auto_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_size, 
  output [9:0]  auto_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_source, 
  output [16:0] auto_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_address, 
  output [3:0]  auto_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_mask, 
  output        auto_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_corrupt, 
  output        auto_coupler_to_slave_named_MaskROM_fragmenter_out_d_ready, 
  input         auto_coupler_to_slave_named_MaskROM_fragmenter_out_d_valid, 
  input  [1:0]  auto_coupler_to_slave_named_MaskROM_fragmenter_out_d_bits_size, 
  input  [9:0]  auto_coupler_to_slave_named_MaskROM_fragmenter_out_d_bits_source, 
  input  [31:0] auto_coupler_to_slave_named_MaskROM_fragmenter_out_d_bits_data, 
  input         auto_coupler_to_slave_named_debug_fragmenter_out_a_ready, 
  output        auto_coupler_to_slave_named_debug_fragmenter_out_a_valid, 
  output [2:0]  auto_coupler_to_slave_named_debug_fragmenter_out_a_bits_opcode, 
  output [2:0]  auto_coupler_to_slave_named_debug_fragmenter_out_a_bits_param, 
  output [1:0]  auto_coupler_to_slave_named_debug_fragmenter_out_a_bits_size, 
  output [8:0]  auto_coupler_to_slave_named_debug_fragmenter_out_a_bits_source, 
  output [11:0] auto_coupler_to_slave_named_debug_fragmenter_out_a_bits_address, 
  output [7:0]  auto_coupler_to_slave_named_debug_fragmenter_out_a_bits_mask, 
  output [63:0] auto_coupler_to_slave_named_debug_fragmenter_out_a_bits_data, 
  output        auto_coupler_to_slave_named_debug_fragmenter_out_a_bits_corrupt, 
  output        auto_coupler_to_slave_named_debug_fragmenter_out_d_ready, 
  input         auto_coupler_to_slave_named_debug_fragmenter_out_d_valid, 
  input  [2:0]  auto_coupler_to_slave_named_debug_fragmenter_out_d_bits_opcode, 
  input  [1:0]  auto_coupler_to_slave_named_debug_fragmenter_out_d_bits_size, 
  input  [8:0]  auto_coupler_to_slave_named_debug_fragmenter_out_d_bits_source, 
  input  [63:0] auto_coupler_to_slave_named_debug_fragmenter_out_d_bits_data, 
  input         auto_coupler_to_slave_named_clint_fragmenter_out_a_ready, 
  output        auto_coupler_to_slave_named_clint_fragmenter_out_a_valid, 
  output [2:0]  auto_coupler_to_slave_named_clint_fragmenter_out_a_bits_opcode, 
  output [2:0]  auto_coupler_to_slave_named_clint_fragmenter_out_a_bits_param, 
  output [1:0]  auto_coupler_to_slave_named_clint_fragmenter_out_a_bits_size, 
  output [8:0]  auto_coupler_to_slave_named_clint_fragmenter_out_a_bits_source, 
  output [25:0] auto_coupler_to_slave_named_clint_fragmenter_out_a_bits_address, 
  output [7:0]  auto_coupler_to_slave_named_clint_fragmenter_out_a_bits_mask, 
  output [63:0] auto_coupler_to_slave_named_clint_fragmenter_out_a_bits_data, 
  output        auto_coupler_to_slave_named_clint_fragmenter_out_a_bits_corrupt, 
  output        auto_coupler_to_slave_named_clint_fragmenter_out_d_ready, 
  input         auto_coupler_to_slave_named_clint_fragmenter_out_d_valid, 
  input  [2:0]  auto_coupler_to_slave_named_clint_fragmenter_out_d_bits_opcode, 
  input  [1:0]  auto_coupler_to_slave_named_clint_fragmenter_out_d_bits_size, 
  input  [8:0]  auto_coupler_to_slave_named_clint_fragmenter_out_d_bits_source, 
  input  [63:0] auto_coupler_to_slave_named_clint_fragmenter_out_d_bits_data, 
  input         auto_coupler_to_slave_named_plic_fragmenter_out_a_ready, 
  output        auto_coupler_to_slave_named_plic_fragmenter_out_a_valid, 
  output [2:0]  auto_coupler_to_slave_named_plic_fragmenter_out_a_bits_opcode, 
  output [2:0]  auto_coupler_to_slave_named_plic_fragmenter_out_a_bits_param, 
  output [1:0]  auto_coupler_to_slave_named_plic_fragmenter_out_a_bits_size, 
  output [8:0]  auto_coupler_to_slave_named_plic_fragmenter_out_a_bits_source, 
  output [27:0] auto_coupler_to_slave_named_plic_fragmenter_out_a_bits_address, 
  output [7:0]  auto_coupler_to_slave_named_plic_fragmenter_out_a_bits_mask, 
  output [63:0] auto_coupler_to_slave_named_plic_fragmenter_out_a_bits_data, 
  output        auto_coupler_to_slave_named_plic_fragmenter_out_a_bits_corrupt, 
  output        auto_coupler_to_slave_named_plic_fragmenter_out_d_ready, 
  input         auto_coupler_to_slave_named_plic_fragmenter_out_d_valid, 
  input  [2:0]  auto_coupler_to_slave_named_plic_fragmenter_out_d_bits_opcode, 
  input  [1:0]  auto_coupler_to_slave_named_plic_fragmenter_out_d_bits_size, 
  input  [8:0]  auto_coupler_to_slave_named_plic_fragmenter_out_d_bits_source, 
  input  [63:0] auto_coupler_to_slave_named_plic_fragmenter_out_d_bits_data, 
  input         auto_coupler_to_bus_named_pbus_from_cbus_out_a_ready, 
  output        auto_coupler_to_bus_named_pbus_from_cbus_out_a_valid, 
  output [2:0]  auto_coupler_to_bus_named_pbus_from_cbus_out_a_bits_opcode, 
  output [2:0]  auto_coupler_to_bus_named_pbus_from_cbus_out_a_bits_param, 
  output [2:0]  auto_coupler_to_bus_named_pbus_from_cbus_out_a_bits_size, 
  output [4:0]  auto_coupler_to_bus_named_pbus_from_cbus_out_a_bits_source, 
  output [30:0] auto_coupler_to_bus_named_pbus_from_cbus_out_a_bits_address, 
  output [7:0]  auto_coupler_to_bus_named_pbus_from_cbus_out_a_bits_mask, 
  output [63:0] auto_coupler_to_bus_named_pbus_from_cbus_out_a_bits_data, 
  output        auto_coupler_to_bus_named_pbus_from_cbus_out_a_bits_corrupt, 
  output        auto_coupler_to_bus_named_pbus_from_cbus_out_d_ready, 
  input         auto_coupler_to_bus_named_pbus_from_cbus_out_d_valid, 
  input  [2:0]  auto_coupler_to_bus_named_pbus_from_cbus_out_d_bits_opcode, 
  input  [1:0]  auto_coupler_to_bus_named_pbus_from_cbus_out_d_bits_param, 
  input  [2:0]  auto_coupler_to_bus_named_pbus_from_cbus_out_d_bits_size, 
  input  [4:0]  auto_coupler_to_bus_named_pbus_from_cbus_out_d_bits_source, 
  input         auto_coupler_to_bus_named_pbus_from_cbus_out_d_bits_sink, 
  input         auto_coupler_to_bus_named_pbus_from_cbus_out_d_bits_denied, 
  input  [63:0] auto_coupler_to_bus_named_pbus_from_cbus_out_d_bits_data, 
  input         auto_coupler_to_bus_named_pbus_from_cbus_out_d_bits_corrupt, 
  output        auto_from_sbus_in_a_ready, 
  input         auto_from_sbus_in_a_valid, 
  input  [2:0]  auto_from_sbus_in_a_bits_opcode, 
  input  [2:0]  auto_from_sbus_in_a_bits_param, 
  input  [2:0]  auto_from_sbus_in_a_bits_size, 
  input  [4:0]  auto_from_sbus_in_a_bits_source, 
  input  [30:0] auto_from_sbus_in_a_bits_address, 
  input  [7:0]  auto_from_sbus_in_a_bits_mask, 
  input  [63:0] auto_from_sbus_in_a_bits_data, 
  input         auto_from_sbus_in_a_bits_corrupt, 
  input         auto_from_sbus_in_d_ready, 
  output        auto_from_sbus_in_d_valid, 
  output [2:0]  auto_from_sbus_in_d_bits_opcode, 
  output [1:0]  auto_from_sbus_in_d_bits_param, 
  output [2:0]  auto_from_sbus_in_d_bits_size, 
  output [4:0]  auto_from_sbus_in_d_bits_source, 
  output        auto_from_sbus_in_d_bits_sink, 
  output        auto_from_sbus_in_d_bits_denied, 
  output [63:0] auto_from_sbus_in_d_bits_data, 
  output        auto_from_sbus_in_d_bits_corrupt 
);
  wire  in_xbar_clock; 
  wire  in_xbar_reset; 
  wire  in_xbar_auto_in_a_ready; 
  wire  in_xbar_auto_in_a_valid; 
  wire [2:0] in_xbar_auto_in_a_bits_opcode; 
  wire [2:0] in_xbar_auto_in_a_bits_param; 
  wire [2:0] in_xbar_auto_in_a_bits_size; 
  wire [4:0] in_xbar_auto_in_a_bits_source; 
  wire [30:0] in_xbar_auto_in_a_bits_address; 
  wire [7:0] in_xbar_auto_in_a_bits_mask; 
  wire [63:0] in_xbar_auto_in_a_bits_data; 
  wire  in_xbar_auto_in_a_bits_corrupt; 
  wire  in_xbar_auto_in_d_ready; 
  wire  in_xbar_auto_in_d_valid; 
  wire [2:0] in_xbar_auto_in_d_bits_opcode; 
  wire [1:0] in_xbar_auto_in_d_bits_param; 
  wire [2:0] in_xbar_auto_in_d_bits_size; 
  wire [4:0] in_xbar_auto_in_d_bits_source; 
  wire  in_xbar_auto_in_d_bits_sink; 
  wire  in_xbar_auto_in_d_bits_denied; 
  wire [63:0] in_xbar_auto_in_d_bits_data; 
  wire  in_xbar_auto_in_d_bits_corrupt; 
  wire  in_xbar_auto_out_a_ready; 
  wire  in_xbar_auto_out_a_valid; 
  wire [2:0] in_xbar_auto_out_a_bits_opcode; 
  wire [2:0] in_xbar_auto_out_a_bits_param; 
  wire [2:0] in_xbar_auto_out_a_bits_size; 
  wire [4:0] in_xbar_auto_out_a_bits_source; 
  wire [30:0] in_xbar_auto_out_a_bits_address; 
  wire [7:0] in_xbar_auto_out_a_bits_mask; 
  wire [63:0] in_xbar_auto_out_a_bits_data; 
  wire  in_xbar_auto_out_a_bits_corrupt; 
  wire  in_xbar_auto_out_d_ready; 
  wire  in_xbar_auto_out_d_valid; 
  wire [2:0] in_xbar_auto_out_d_bits_opcode; 
  wire [1:0] in_xbar_auto_out_d_bits_param; 
  wire [2:0] in_xbar_auto_out_d_bits_size; 
  wire [4:0] in_xbar_auto_out_d_bits_source; 
  wire  in_xbar_auto_out_d_bits_sink; 
  wire  in_xbar_auto_out_d_bits_denied; 
  wire [63:0] in_xbar_auto_out_d_bits_data; 
  wire  in_xbar_auto_out_d_bits_corrupt; 
  wire  out_xbar_clock; 
  wire  out_xbar_reset; 
  wire  out_xbar_auto_in_a_ready; 
  wire  out_xbar_auto_in_a_valid; 
  wire [2:0] out_xbar_auto_in_a_bits_opcode; 
  wire [2:0] out_xbar_auto_in_a_bits_param; 
  wire [2:0] out_xbar_auto_in_a_bits_size; 
  wire [4:0] out_xbar_auto_in_a_bits_source; 
  wire [30:0] out_xbar_auto_in_a_bits_address; 
  wire [7:0] out_xbar_auto_in_a_bits_mask; 
  wire [63:0] out_xbar_auto_in_a_bits_data; 
  wire  out_xbar_auto_in_a_bits_corrupt; 
  wire  out_xbar_auto_in_d_ready; 
  wire  out_xbar_auto_in_d_valid; 
  wire [2:0] out_xbar_auto_in_d_bits_opcode; 
  wire [1:0] out_xbar_auto_in_d_bits_param; 
  wire [2:0] out_xbar_auto_in_d_bits_size; 
  wire [4:0] out_xbar_auto_in_d_bits_source; 
  wire  out_xbar_auto_in_d_bits_sink; 
  wire  out_xbar_auto_in_d_bits_denied; 
  wire [63:0] out_xbar_auto_in_d_bits_data; 
  wire  out_xbar_auto_in_d_bits_corrupt; 
  wire  out_xbar_auto_out_4_a_ready; 
  wire  out_xbar_auto_out_4_a_valid; 
  wire [2:0] out_xbar_auto_out_4_a_bits_opcode; 
  wire [2:0] out_xbar_auto_out_4_a_bits_param; 
  wire [2:0] out_xbar_auto_out_4_a_bits_size; 
  wire [4:0] out_xbar_auto_out_4_a_bits_source; 
  wire [16:0] out_xbar_auto_out_4_a_bits_address; 
  wire [7:0] out_xbar_auto_out_4_a_bits_mask; 
  wire  out_xbar_auto_out_4_a_bits_corrupt; 
  wire  out_xbar_auto_out_4_d_ready; 
  wire  out_xbar_auto_out_4_d_valid; 
  wire [2:0] out_xbar_auto_out_4_d_bits_size; 
  wire [4:0] out_xbar_auto_out_4_d_bits_source; 
  wire [63:0] out_xbar_auto_out_4_d_bits_data; 
  wire  out_xbar_auto_out_4_d_bits_corrupt; 
  wire  out_xbar_auto_out_3_a_ready; 
  wire  out_xbar_auto_out_3_a_valid; 
  wire [2:0] out_xbar_auto_out_3_a_bits_opcode; 
  wire [2:0] out_xbar_auto_out_3_a_bits_param; 
  wire [2:0] out_xbar_auto_out_3_a_bits_size; 
  wire [4:0] out_xbar_auto_out_3_a_bits_source; 
  wire [11:0] out_xbar_auto_out_3_a_bits_address; 
  wire [7:0] out_xbar_auto_out_3_a_bits_mask; 
  wire [63:0] out_xbar_auto_out_3_a_bits_data; 
  wire  out_xbar_auto_out_3_a_bits_corrupt; 
  wire  out_xbar_auto_out_3_d_ready; 
  wire  out_xbar_auto_out_3_d_valid; 
  wire [2:0] out_xbar_auto_out_3_d_bits_opcode; 
  wire [2:0] out_xbar_auto_out_3_d_bits_size; 
  wire [4:0] out_xbar_auto_out_3_d_bits_source; 
  wire [63:0] out_xbar_auto_out_3_d_bits_data; 
  wire  out_xbar_auto_out_2_a_ready; 
  wire  out_xbar_auto_out_2_a_valid; 
  wire [2:0] out_xbar_auto_out_2_a_bits_opcode; 
  wire [2:0] out_xbar_auto_out_2_a_bits_param; 
  wire [2:0] out_xbar_auto_out_2_a_bits_size; 
  wire [4:0] out_xbar_auto_out_2_a_bits_source; 
  wire [25:0] out_xbar_auto_out_2_a_bits_address; 
  wire [7:0] out_xbar_auto_out_2_a_bits_mask; 
  wire [63:0] out_xbar_auto_out_2_a_bits_data; 
  wire  out_xbar_auto_out_2_a_bits_corrupt; 
  wire  out_xbar_auto_out_2_d_ready; 
  wire  out_xbar_auto_out_2_d_valid; 
  wire [2:0] out_xbar_auto_out_2_d_bits_opcode; 
  wire [2:0] out_xbar_auto_out_2_d_bits_size; 
  wire [4:0] out_xbar_auto_out_2_d_bits_source; 
  wire [63:0] out_xbar_auto_out_2_d_bits_data; 
  wire  out_xbar_auto_out_1_a_ready; 
  wire  out_xbar_auto_out_1_a_valid; 
  wire [2:0] out_xbar_auto_out_1_a_bits_opcode; 
  wire [2:0] out_xbar_auto_out_1_a_bits_param; 
  wire [2:0] out_xbar_auto_out_1_a_bits_size; 
  wire [4:0] out_xbar_auto_out_1_a_bits_source; 
  wire [27:0] out_xbar_auto_out_1_a_bits_address; 
  wire [7:0] out_xbar_auto_out_1_a_bits_mask; 
  wire [63:0] out_xbar_auto_out_1_a_bits_data; 
  wire  out_xbar_auto_out_1_a_bits_corrupt; 
  wire  out_xbar_auto_out_1_d_ready; 
  wire  out_xbar_auto_out_1_d_valid; 
  wire [2:0] out_xbar_auto_out_1_d_bits_opcode; 
  wire [2:0] out_xbar_auto_out_1_d_bits_size; 
  wire [4:0] out_xbar_auto_out_1_d_bits_source; 
  wire [63:0] out_xbar_auto_out_1_d_bits_data; 
  wire  out_xbar_auto_out_0_a_ready; 
  wire  out_xbar_auto_out_0_a_valid; 
  wire [2:0] out_xbar_auto_out_0_a_bits_opcode; 
  wire [2:0] out_xbar_auto_out_0_a_bits_param; 
  wire [2:0] out_xbar_auto_out_0_a_bits_size; 
  wire [4:0] out_xbar_auto_out_0_a_bits_source; 
  wire [30:0] out_xbar_auto_out_0_a_bits_address; 
  wire [7:0] out_xbar_auto_out_0_a_bits_mask; 
  wire [63:0] out_xbar_auto_out_0_a_bits_data; 
  wire  out_xbar_auto_out_0_a_bits_corrupt; 
  wire  out_xbar_auto_out_0_d_ready; 
  wire  out_xbar_auto_out_0_d_valid; 
  wire [2:0] out_xbar_auto_out_0_d_bits_opcode; 
  wire [1:0] out_xbar_auto_out_0_d_bits_param; 
  wire [2:0] out_xbar_auto_out_0_d_bits_size; 
  wire [4:0] out_xbar_auto_out_0_d_bits_source; 
  wire  out_xbar_auto_out_0_d_bits_sink; 
  wire  out_xbar_auto_out_0_d_bits_denied; 
  wire [63:0] out_xbar_auto_out_0_d_bits_data; 
  wire  out_xbar_auto_out_0_d_bits_corrupt; 
  wire  buffer_clock; 
  wire  buffer_reset; 
  wire  buffer_auto_in_a_ready; 
  wire  buffer_auto_in_a_valid; 
  wire [2:0] buffer_auto_in_a_bits_opcode; 
  wire [2:0] buffer_auto_in_a_bits_param; 
  wire [2:0] buffer_auto_in_a_bits_size; 
  wire [4:0] buffer_auto_in_a_bits_source; 
  wire [30:0] buffer_auto_in_a_bits_address; 
  wire [7:0] buffer_auto_in_a_bits_mask; 
  wire [63:0] buffer_auto_in_a_bits_data; 
  wire  buffer_auto_in_a_bits_corrupt; 
  wire  buffer_auto_in_d_ready; 
  wire  buffer_auto_in_d_valid; 
  wire [2:0] buffer_auto_in_d_bits_opcode; 
  wire [1:0] buffer_auto_in_d_bits_param; 
  wire [2:0] buffer_auto_in_d_bits_size; 
  wire [4:0] buffer_auto_in_d_bits_source; 
  wire  buffer_auto_in_d_bits_sink; 
  wire  buffer_auto_in_d_bits_denied; 
  wire [63:0] buffer_auto_in_d_bits_data; 
  wire  buffer_auto_in_d_bits_corrupt; 
  wire  buffer_auto_out_a_ready; 
  wire  buffer_auto_out_a_valid; 
  wire [2:0] buffer_auto_out_a_bits_opcode; 
  wire [2:0] buffer_auto_out_a_bits_param; 
  wire [2:0] buffer_auto_out_a_bits_size; 
  wire [4:0] buffer_auto_out_a_bits_source; 
  wire [30:0] buffer_auto_out_a_bits_address; 
  wire [7:0] buffer_auto_out_a_bits_mask; 
  wire [63:0] buffer_auto_out_a_bits_data; 
  wire  buffer_auto_out_a_bits_corrupt; 
  wire  buffer_auto_out_d_ready; 
  wire  buffer_auto_out_d_valid; 
  wire [2:0] buffer_auto_out_d_bits_opcode; 
  wire [1:0] buffer_auto_out_d_bits_param; 
  wire [2:0] buffer_auto_out_d_bits_size; 
  wire [4:0] buffer_auto_out_d_bits_source; 
  wire  buffer_auto_out_d_bits_sink; 
  wire  buffer_auto_out_d_bits_denied; 
  wire [63:0] buffer_auto_out_d_bits_data; 
  wire  buffer_auto_out_d_bits_corrupt; 
  wire  atomics_clock; 
  wire  atomics_reset; 
  wire  atomics_auto_in_a_ready; 
  wire  atomics_auto_in_a_valid; 
  wire [2:0] atomics_auto_in_a_bits_opcode; 
  wire [2:0] atomics_auto_in_a_bits_param; 
  wire [2:0] atomics_auto_in_a_bits_size; 
  wire [4:0] atomics_auto_in_a_bits_source; 
  wire [30:0] atomics_auto_in_a_bits_address; 
  wire [7:0] atomics_auto_in_a_bits_mask; 
  wire [63:0] atomics_auto_in_a_bits_data; 
  wire  atomics_auto_in_a_bits_corrupt; 
  wire  atomics_auto_in_d_ready; 
  wire  atomics_auto_in_d_valid; 
  wire [2:0] atomics_auto_in_d_bits_opcode; 
  wire [1:0] atomics_auto_in_d_bits_param; 
  wire [2:0] atomics_auto_in_d_bits_size; 
  wire [4:0] atomics_auto_in_d_bits_source; 
  wire  atomics_auto_in_d_bits_sink; 
  wire  atomics_auto_in_d_bits_denied; 
  wire [63:0] atomics_auto_in_d_bits_data; 
  wire  atomics_auto_in_d_bits_corrupt; 
  wire  atomics_auto_out_a_ready; 
  wire  atomics_auto_out_a_valid; 
  wire [2:0] atomics_auto_out_a_bits_opcode; 
  wire [2:0] atomics_auto_out_a_bits_param; 
  wire [2:0] atomics_auto_out_a_bits_size; 
  wire [4:0] atomics_auto_out_a_bits_source; 
  wire [30:0] atomics_auto_out_a_bits_address; 
  wire [7:0] atomics_auto_out_a_bits_mask; 
  wire [63:0] atomics_auto_out_a_bits_data; 
  wire  atomics_auto_out_a_bits_corrupt; 
  wire  atomics_auto_out_d_ready; 
  wire  atomics_auto_out_d_valid; 
  wire [2:0] atomics_auto_out_d_bits_opcode; 
  wire [1:0] atomics_auto_out_d_bits_param; 
  wire [2:0] atomics_auto_out_d_bits_size; 
  wire [4:0] atomics_auto_out_d_bits_source; 
  wire  atomics_auto_out_d_bits_sink; 
  wire  atomics_auto_out_d_bits_denied; 
  wire [63:0] atomics_auto_out_d_bits_data; 
  wire  atomics_auto_out_d_bits_corrupt; 
  wire  buffer_1_clock; 
  wire  buffer_1_reset; 
  wire  buffer_1_auto_in_a_ready; 
  wire  buffer_1_auto_in_a_valid; 
  wire [2:0] buffer_1_auto_in_a_bits_opcode; 
  wire [2:0] buffer_1_auto_in_a_bits_param; 
  wire [2:0] buffer_1_auto_in_a_bits_size; 
  wire [4:0] buffer_1_auto_in_a_bits_source; 
  wire [30:0] buffer_1_auto_in_a_bits_address; 
  wire [7:0] buffer_1_auto_in_a_bits_mask; 
  wire [63:0] buffer_1_auto_in_a_bits_data; 
  wire  buffer_1_auto_in_a_bits_corrupt; 
  wire  buffer_1_auto_in_d_ready; 
  wire  buffer_1_auto_in_d_valid; 
  wire [2:0] buffer_1_auto_in_d_bits_opcode; 
  wire [1:0] buffer_1_auto_in_d_bits_param; 
  wire [2:0] buffer_1_auto_in_d_bits_size; 
  wire [4:0] buffer_1_auto_in_d_bits_source; 
  wire  buffer_1_auto_in_d_bits_sink; 
  wire  buffer_1_auto_in_d_bits_denied; 
  wire [63:0] buffer_1_auto_in_d_bits_data; 
  wire  buffer_1_auto_in_d_bits_corrupt; 
  wire  buffer_1_auto_out_a_ready; 
  wire  buffer_1_auto_out_a_valid; 
  wire [2:0] buffer_1_auto_out_a_bits_opcode; 
  wire [2:0] buffer_1_auto_out_a_bits_param; 
  wire [2:0] buffer_1_auto_out_a_bits_size; 
  wire [4:0] buffer_1_auto_out_a_bits_source; 
  wire [30:0] buffer_1_auto_out_a_bits_address; 
  wire [7:0] buffer_1_auto_out_a_bits_mask; 
  wire [63:0] buffer_1_auto_out_a_bits_data; 
  wire  buffer_1_auto_out_a_bits_corrupt; 
  wire  buffer_1_auto_out_d_ready; 
  wire  buffer_1_auto_out_d_valid; 
  wire [2:0] buffer_1_auto_out_d_bits_opcode; 
  wire [1:0] buffer_1_auto_out_d_bits_param; 
  wire [2:0] buffer_1_auto_out_d_bits_size; 
  wire [4:0] buffer_1_auto_out_d_bits_source; 
  wire  buffer_1_auto_out_d_bits_sink; 
  wire  buffer_1_auto_out_d_bits_denied; 
  wire [63:0] buffer_1_auto_out_d_bits_data; 
  wire  buffer_1_auto_out_d_bits_corrupt; 
  wire  coupler_to_bus_named_pbus_clock; 
  wire  coupler_to_bus_named_pbus_reset; 
  wire  coupler_to_bus_named_pbus_auto_widget_in_a_ready; 
  wire  coupler_to_bus_named_pbus_auto_widget_in_a_valid; 
  wire [2:0] coupler_to_bus_named_pbus_auto_widget_in_a_bits_opcode; 
  wire [2:0] coupler_to_bus_named_pbus_auto_widget_in_a_bits_param; 
  wire [2:0] coupler_to_bus_named_pbus_auto_widget_in_a_bits_size; 
  wire [4:0] coupler_to_bus_named_pbus_auto_widget_in_a_bits_source; 
  wire [30:0] coupler_to_bus_named_pbus_auto_widget_in_a_bits_address; 
  wire [7:0] coupler_to_bus_named_pbus_auto_widget_in_a_bits_mask; 
  wire [63:0] coupler_to_bus_named_pbus_auto_widget_in_a_bits_data; 
  wire  coupler_to_bus_named_pbus_auto_widget_in_a_bits_corrupt; 
  wire  coupler_to_bus_named_pbus_auto_widget_in_d_ready; 
  wire  coupler_to_bus_named_pbus_auto_widget_in_d_valid; 
  wire [2:0] coupler_to_bus_named_pbus_auto_widget_in_d_bits_opcode; 
  wire [1:0] coupler_to_bus_named_pbus_auto_widget_in_d_bits_param; 
  wire [2:0] coupler_to_bus_named_pbus_auto_widget_in_d_bits_size; 
  wire [4:0] coupler_to_bus_named_pbus_auto_widget_in_d_bits_source; 
  wire  coupler_to_bus_named_pbus_auto_widget_in_d_bits_sink; 
  wire  coupler_to_bus_named_pbus_auto_widget_in_d_bits_denied; 
  wire [63:0] coupler_to_bus_named_pbus_auto_widget_in_d_bits_data; 
  wire  coupler_to_bus_named_pbus_auto_widget_in_d_bits_corrupt; 
  wire  coupler_to_bus_named_pbus_auto_from_cbus_out_a_ready; 
  wire  coupler_to_bus_named_pbus_auto_from_cbus_out_a_valid; 
  wire [2:0] coupler_to_bus_named_pbus_auto_from_cbus_out_a_bits_opcode; 
  wire [2:0] coupler_to_bus_named_pbus_auto_from_cbus_out_a_bits_param; 
  wire [2:0] coupler_to_bus_named_pbus_auto_from_cbus_out_a_bits_size; 
  wire [4:0] coupler_to_bus_named_pbus_auto_from_cbus_out_a_bits_source; 
  wire [30:0] coupler_to_bus_named_pbus_auto_from_cbus_out_a_bits_address; 
  wire [7:0] coupler_to_bus_named_pbus_auto_from_cbus_out_a_bits_mask; 
  wire [63:0] coupler_to_bus_named_pbus_auto_from_cbus_out_a_bits_data; 
  wire  coupler_to_bus_named_pbus_auto_from_cbus_out_a_bits_corrupt; 
  wire  coupler_to_bus_named_pbus_auto_from_cbus_out_d_ready; 
  wire  coupler_to_bus_named_pbus_auto_from_cbus_out_d_valid; 
  wire [2:0] coupler_to_bus_named_pbus_auto_from_cbus_out_d_bits_opcode; 
  wire [1:0] coupler_to_bus_named_pbus_auto_from_cbus_out_d_bits_param; 
  wire [2:0] coupler_to_bus_named_pbus_auto_from_cbus_out_d_bits_size; 
  wire [4:0] coupler_to_bus_named_pbus_auto_from_cbus_out_d_bits_source; 
  wire  coupler_to_bus_named_pbus_auto_from_cbus_out_d_bits_sink; 
  wire  coupler_to_bus_named_pbus_auto_from_cbus_out_d_bits_denied; 
  wire [63:0] coupler_to_bus_named_pbus_auto_from_cbus_out_d_bits_data; 
  wire  coupler_to_bus_named_pbus_auto_from_cbus_out_d_bits_corrupt; 
  wire  coupler_to_slave_named_plic_clock; 
  wire  coupler_to_slave_named_plic_reset; 
  wire  coupler_to_slave_named_plic_auto_buffer_in_a_ready; 
  wire  coupler_to_slave_named_plic_auto_buffer_in_a_valid; 
  wire [2:0] coupler_to_slave_named_plic_auto_buffer_in_a_bits_opcode; 
  wire [2:0] coupler_to_slave_named_plic_auto_buffer_in_a_bits_param; 
  wire [2:0] coupler_to_slave_named_plic_auto_buffer_in_a_bits_size; 
  wire [4:0] coupler_to_slave_named_plic_auto_buffer_in_a_bits_source; 
  wire [27:0] coupler_to_slave_named_plic_auto_buffer_in_a_bits_address; 
  wire [7:0] coupler_to_slave_named_plic_auto_buffer_in_a_bits_mask; 
  wire [63:0] coupler_to_slave_named_plic_auto_buffer_in_a_bits_data; 
  wire  coupler_to_slave_named_plic_auto_buffer_in_a_bits_corrupt; 
  wire  coupler_to_slave_named_plic_auto_buffer_in_d_ready; 
  wire  coupler_to_slave_named_plic_auto_buffer_in_d_valid; 
  wire [2:0] coupler_to_slave_named_plic_auto_buffer_in_d_bits_opcode; 
  wire [2:0] coupler_to_slave_named_plic_auto_buffer_in_d_bits_size; 
  wire [4:0] coupler_to_slave_named_plic_auto_buffer_in_d_bits_source; 
  wire [63:0] coupler_to_slave_named_plic_auto_buffer_in_d_bits_data; 
  wire  coupler_to_slave_named_plic_auto_fragmenter_out_a_ready; 
  wire  coupler_to_slave_named_plic_auto_fragmenter_out_a_valid; 
  wire [2:0] coupler_to_slave_named_plic_auto_fragmenter_out_a_bits_opcode; 
  wire [2:0] coupler_to_slave_named_plic_auto_fragmenter_out_a_bits_param; 
  wire [1:0] coupler_to_slave_named_plic_auto_fragmenter_out_a_bits_size; 
  wire [8:0] coupler_to_slave_named_plic_auto_fragmenter_out_a_bits_source; 
  wire [27:0] coupler_to_slave_named_plic_auto_fragmenter_out_a_bits_address; 
  wire [7:0] coupler_to_slave_named_plic_auto_fragmenter_out_a_bits_mask; 
  wire [63:0] coupler_to_slave_named_plic_auto_fragmenter_out_a_bits_data; 
  wire  coupler_to_slave_named_plic_auto_fragmenter_out_a_bits_corrupt; 
  wire  coupler_to_slave_named_plic_auto_fragmenter_out_d_ready; 
  wire  coupler_to_slave_named_plic_auto_fragmenter_out_d_valid; 
  wire [2:0] coupler_to_slave_named_plic_auto_fragmenter_out_d_bits_opcode; 
  wire [1:0] coupler_to_slave_named_plic_auto_fragmenter_out_d_bits_size; 
  wire [8:0] coupler_to_slave_named_plic_auto_fragmenter_out_d_bits_source; 
  wire [63:0] coupler_to_slave_named_plic_auto_fragmenter_out_d_bits_data; 
  wire  coupler_to_slave_named_clint_clock; 
  wire  coupler_to_slave_named_clint_reset; 
  wire  coupler_to_slave_named_clint_auto_buffer_in_a_ready; 
  wire  coupler_to_slave_named_clint_auto_buffer_in_a_valid; 
  wire [2:0] coupler_to_slave_named_clint_auto_buffer_in_a_bits_opcode; 
  wire [2:0] coupler_to_slave_named_clint_auto_buffer_in_a_bits_param; 
  wire [2:0] coupler_to_slave_named_clint_auto_buffer_in_a_bits_size; 
  wire [4:0] coupler_to_slave_named_clint_auto_buffer_in_a_bits_source; 
  wire [25:0] coupler_to_slave_named_clint_auto_buffer_in_a_bits_address; 
  wire [7:0] coupler_to_slave_named_clint_auto_buffer_in_a_bits_mask; 
  wire [63:0] coupler_to_slave_named_clint_auto_buffer_in_a_bits_data; 
  wire  coupler_to_slave_named_clint_auto_buffer_in_a_bits_corrupt; 
  wire  coupler_to_slave_named_clint_auto_buffer_in_d_ready; 
  wire  coupler_to_slave_named_clint_auto_buffer_in_d_valid; 
  wire [2:0] coupler_to_slave_named_clint_auto_buffer_in_d_bits_opcode; 
  wire [2:0] coupler_to_slave_named_clint_auto_buffer_in_d_bits_size; 
  wire [4:0] coupler_to_slave_named_clint_auto_buffer_in_d_bits_source; 
  wire [63:0] coupler_to_slave_named_clint_auto_buffer_in_d_bits_data; 
  wire  coupler_to_slave_named_clint_auto_fragmenter_out_a_ready; 
  wire  coupler_to_slave_named_clint_auto_fragmenter_out_a_valid; 
  wire [2:0] coupler_to_slave_named_clint_auto_fragmenter_out_a_bits_opcode; 
  wire [2:0] coupler_to_slave_named_clint_auto_fragmenter_out_a_bits_param; 
  wire [1:0] coupler_to_slave_named_clint_auto_fragmenter_out_a_bits_size; 
  wire [8:0] coupler_to_slave_named_clint_auto_fragmenter_out_a_bits_source; 
  wire [25:0] coupler_to_slave_named_clint_auto_fragmenter_out_a_bits_address; 
  wire [7:0] coupler_to_slave_named_clint_auto_fragmenter_out_a_bits_mask; 
  wire [63:0] coupler_to_slave_named_clint_auto_fragmenter_out_a_bits_data; 
  wire  coupler_to_slave_named_clint_auto_fragmenter_out_a_bits_corrupt; 
  wire  coupler_to_slave_named_clint_auto_fragmenter_out_d_ready; 
  wire  coupler_to_slave_named_clint_auto_fragmenter_out_d_valid; 
  wire [2:0] coupler_to_slave_named_clint_auto_fragmenter_out_d_bits_opcode; 
  wire [1:0] coupler_to_slave_named_clint_auto_fragmenter_out_d_bits_size; 
  wire [8:0] coupler_to_slave_named_clint_auto_fragmenter_out_d_bits_source; 
  wire [63:0] coupler_to_slave_named_clint_auto_fragmenter_out_d_bits_data; 
  wire  coupler_to_slave_named_debug_clock; 
  wire  coupler_to_slave_named_debug_reset; 
  wire  coupler_to_slave_named_debug_auto_buffer_in_a_ready; 
  wire  coupler_to_slave_named_debug_auto_buffer_in_a_valid; 
  wire [2:0] coupler_to_slave_named_debug_auto_buffer_in_a_bits_opcode; 
  wire [2:0] coupler_to_slave_named_debug_auto_buffer_in_a_bits_param; 
  wire [2:0] coupler_to_slave_named_debug_auto_buffer_in_a_bits_size; 
  wire [4:0] coupler_to_slave_named_debug_auto_buffer_in_a_bits_source; 
  wire [11:0] coupler_to_slave_named_debug_auto_buffer_in_a_bits_address; 
  wire [7:0] coupler_to_slave_named_debug_auto_buffer_in_a_bits_mask; 
  wire [63:0] coupler_to_slave_named_debug_auto_buffer_in_a_bits_data; 
  wire  coupler_to_slave_named_debug_auto_buffer_in_a_bits_corrupt; 
  wire  coupler_to_slave_named_debug_auto_buffer_in_d_ready; 
  wire  coupler_to_slave_named_debug_auto_buffer_in_d_valid; 
  wire [2:0] coupler_to_slave_named_debug_auto_buffer_in_d_bits_opcode; 
  wire [2:0] coupler_to_slave_named_debug_auto_buffer_in_d_bits_size; 
  wire [4:0] coupler_to_slave_named_debug_auto_buffer_in_d_bits_source; 
  wire [63:0] coupler_to_slave_named_debug_auto_buffer_in_d_bits_data; 
  wire  coupler_to_slave_named_debug_auto_fragmenter_out_a_ready; 
  wire  coupler_to_slave_named_debug_auto_fragmenter_out_a_valid; 
  wire [2:0] coupler_to_slave_named_debug_auto_fragmenter_out_a_bits_opcode; 
  wire [2:0] coupler_to_slave_named_debug_auto_fragmenter_out_a_bits_param; 
  wire [1:0] coupler_to_slave_named_debug_auto_fragmenter_out_a_bits_size; 
  wire [8:0] coupler_to_slave_named_debug_auto_fragmenter_out_a_bits_source; 
  wire [11:0] coupler_to_slave_named_debug_auto_fragmenter_out_a_bits_address; 
  wire [7:0] coupler_to_slave_named_debug_auto_fragmenter_out_a_bits_mask; 
  wire [63:0] coupler_to_slave_named_debug_auto_fragmenter_out_a_bits_data; 
  wire  coupler_to_slave_named_debug_auto_fragmenter_out_a_bits_corrupt; 
  wire  coupler_to_slave_named_debug_auto_fragmenter_out_d_ready; 
  wire  coupler_to_slave_named_debug_auto_fragmenter_out_d_valid; 
  wire [2:0] coupler_to_slave_named_debug_auto_fragmenter_out_d_bits_opcode; 
  wire [1:0] coupler_to_slave_named_debug_auto_fragmenter_out_d_bits_size; 
  wire [8:0] coupler_to_slave_named_debug_auto_fragmenter_out_d_bits_source; 
  wire [63:0] coupler_to_slave_named_debug_auto_fragmenter_out_d_bits_data; 
  wire  coupler_to_slave_named_MaskROM_clock; 
  wire  coupler_to_slave_named_MaskROM_reset; 
  wire  coupler_to_slave_named_MaskROM_auto_buffer_in_a_ready; 
  wire  coupler_to_slave_named_MaskROM_auto_buffer_in_a_valid; 
  wire [2:0] coupler_to_slave_named_MaskROM_auto_buffer_in_a_bits_opcode; 
  wire [2:0] coupler_to_slave_named_MaskROM_auto_buffer_in_a_bits_param; 
  wire [2:0] coupler_to_slave_named_MaskROM_auto_buffer_in_a_bits_size; 
  wire [4:0] coupler_to_slave_named_MaskROM_auto_buffer_in_a_bits_source; 
  wire [16:0] coupler_to_slave_named_MaskROM_auto_buffer_in_a_bits_address; 
  wire [7:0] coupler_to_slave_named_MaskROM_auto_buffer_in_a_bits_mask; 
  wire  coupler_to_slave_named_MaskROM_auto_buffer_in_a_bits_corrupt; 
  wire  coupler_to_slave_named_MaskROM_auto_buffer_in_d_ready; 
  wire  coupler_to_slave_named_MaskROM_auto_buffer_in_d_valid; 
  wire [2:0] coupler_to_slave_named_MaskROM_auto_buffer_in_d_bits_size; 
  wire [4:0] coupler_to_slave_named_MaskROM_auto_buffer_in_d_bits_source; 
  wire [63:0] coupler_to_slave_named_MaskROM_auto_buffer_in_d_bits_data; 
  wire  coupler_to_slave_named_MaskROM_auto_buffer_in_d_bits_corrupt; 
  wire  coupler_to_slave_named_MaskROM_auto_fragmenter_out_a_ready; 
  wire  coupler_to_slave_named_MaskROM_auto_fragmenter_out_a_valid; 
  wire [2:0] coupler_to_slave_named_MaskROM_auto_fragmenter_out_a_bits_opcode; 
  wire [2:0] coupler_to_slave_named_MaskROM_auto_fragmenter_out_a_bits_param; 
  wire [1:0] coupler_to_slave_named_MaskROM_auto_fragmenter_out_a_bits_size; 
  wire [9:0] coupler_to_slave_named_MaskROM_auto_fragmenter_out_a_bits_source; 
  wire [16:0] coupler_to_slave_named_MaskROM_auto_fragmenter_out_a_bits_address; 
  wire [3:0] coupler_to_slave_named_MaskROM_auto_fragmenter_out_a_bits_mask; 
  wire  coupler_to_slave_named_MaskROM_auto_fragmenter_out_a_bits_corrupt; 
  wire  coupler_to_slave_named_MaskROM_auto_fragmenter_out_d_ready; 
  wire  coupler_to_slave_named_MaskROM_auto_fragmenter_out_d_valid; 
  wire [1:0] coupler_to_slave_named_MaskROM_auto_fragmenter_out_d_bits_size; 
  wire [9:0] coupler_to_slave_named_MaskROM_auto_fragmenter_out_d_bits_source; 
  wire [31:0] coupler_to_slave_named_MaskROM_auto_fragmenter_out_d_bits_data; 
  TLXbar_1 in_xbar ( 
    .clock(in_xbar_clock),
    .reset(in_xbar_reset),
    .auto_in_a_ready(in_xbar_auto_in_a_ready),
    .auto_in_a_valid(in_xbar_auto_in_a_valid),
    .auto_in_a_bits_opcode(in_xbar_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(in_xbar_auto_in_a_bits_param),
    .auto_in_a_bits_size(in_xbar_auto_in_a_bits_size),
    .auto_in_a_bits_source(in_xbar_auto_in_a_bits_source),
    .auto_in_a_bits_address(in_xbar_auto_in_a_bits_address),
    .auto_in_a_bits_mask(in_xbar_auto_in_a_bits_mask),
    .auto_in_a_bits_data(in_xbar_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(in_xbar_auto_in_a_bits_corrupt),
    .auto_in_d_ready(in_xbar_auto_in_d_ready),
    .auto_in_d_valid(in_xbar_auto_in_d_valid),
    .auto_in_d_bits_opcode(in_xbar_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(in_xbar_auto_in_d_bits_param),
    .auto_in_d_bits_size(in_xbar_auto_in_d_bits_size),
    .auto_in_d_bits_source(in_xbar_auto_in_d_bits_source),
    .auto_in_d_bits_sink(in_xbar_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(in_xbar_auto_in_d_bits_denied),
    .auto_in_d_bits_data(in_xbar_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(in_xbar_auto_in_d_bits_corrupt),
    .auto_out_a_ready(in_xbar_auto_out_a_ready),
    .auto_out_a_valid(in_xbar_auto_out_a_valid),
    .auto_out_a_bits_opcode(in_xbar_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(in_xbar_auto_out_a_bits_param),
    .auto_out_a_bits_size(in_xbar_auto_out_a_bits_size),
    .auto_out_a_bits_source(in_xbar_auto_out_a_bits_source),
    .auto_out_a_bits_address(in_xbar_auto_out_a_bits_address),
    .auto_out_a_bits_mask(in_xbar_auto_out_a_bits_mask),
    .auto_out_a_bits_data(in_xbar_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt(in_xbar_auto_out_a_bits_corrupt),
    .auto_out_d_ready(in_xbar_auto_out_d_ready),
    .auto_out_d_valid(in_xbar_auto_out_d_valid),
    .auto_out_d_bits_opcode(in_xbar_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(in_xbar_auto_out_d_bits_param),
    .auto_out_d_bits_size(in_xbar_auto_out_d_bits_size),
    .auto_out_d_bits_source(in_xbar_auto_out_d_bits_source),
    .auto_out_d_bits_sink(in_xbar_auto_out_d_bits_sink),
    .auto_out_d_bits_denied(in_xbar_auto_out_d_bits_denied),
    .auto_out_d_bits_data(in_xbar_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(in_xbar_auto_out_d_bits_corrupt)
  );
  TLXbar_2 out_xbar ( 
    .clock(out_xbar_clock),
    .reset(out_xbar_reset),
    .auto_in_a_ready(out_xbar_auto_in_a_ready),
    .auto_in_a_valid(out_xbar_auto_in_a_valid),
    .auto_in_a_bits_opcode(out_xbar_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(out_xbar_auto_in_a_bits_param),
    .auto_in_a_bits_size(out_xbar_auto_in_a_bits_size),
    .auto_in_a_bits_source(out_xbar_auto_in_a_bits_source),
    .auto_in_a_bits_address(out_xbar_auto_in_a_bits_address),
    .auto_in_a_bits_mask(out_xbar_auto_in_a_bits_mask),
    .auto_in_a_bits_data(out_xbar_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(out_xbar_auto_in_a_bits_corrupt),
    .auto_in_d_ready(out_xbar_auto_in_d_ready),
    .auto_in_d_valid(out_xbar_auto_in_d_valid),
    .auto_in_d_bits_opcode(out_xbar_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(out_xbar_auto_in_d_bits_param),
    .auto_in_d_bits_size(out_xbar_auto_in_d_bits_size),
    .auto_in_d_bits_source(out_xbar_auto_in_d_bits_source),
    .auto_in_d_bits_sink(out_xbar_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(out_xbar_auto_in_d_bits_denied),
    .auto_in_d_bits_data(out_xbar_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(out_xbar_auto_in_d_bits_corrupt),
    .auto_out_4_a_ready(out_xbar_auto_out_4_a_ready),
    .auto_out_4_a_valid(out_xbar_auto_out_4_a_valid),
    .auto_out_4_a_bits_opcode(out_xbar_auto_out_4_a_bits_opcode),
    .auto_out_4_a_bits_param(out_xbar_auto_out_4_a_bits_param),
    .auto_out_4_a_bits_size(out_xbar_auto_out_4_a_bits_size),
    .auto_out_4_a_bits_source(out_xbar_auto_out_4_a_bits_source),
    .auto_out_4_a_bits_address(out_xbar_auto_out_4_a_bits_address),
    .auto_out_4_a_bits_mask(out_xbar_auto_out_4_a_bits_mask),
    .auto_out_4_a_bits_corrupt(out_xbar_auto_out_4_a_bits_corrupt),
    .auto_out_4_d_ready(out_xbar_auto_out_4_d_ready),
    .auto_out_4_d_valid(out_xbar_auto_out_4_d_valid),
    .auto_out_4_d_bits_size(out_xbar_auto_out_4_d_bits_size),
    .auto_out_4_d_bits_source(out_xbar_auto_out_4_d_bits_source),
    .auto_out_4_d_bits_data(out_xbar_auto_out_4_d_bits_data),
    .auto_out_4_d_bits_corrupt(out_xbar_auto_out_4_d_bits_corrupt),
    .auto_out_3_a_ready(out_xbar_auto_out_3_a_ready),
    .auto_out_3_a_valid(out_xbar_auto_out_3_a_valid),
    .auto_out_3_a_bits_opcode(out_xbar_auto_out_3_a_bits_opcode),
    .auto_out_3_a_bits_param(out_xbar_auto_out_3_a_bits_param),
    .auto_out_3_a_bits_size(out_xbar_auto_out_3_a_bits_size),
    .auto_out_3_a_bits_source(out_xbar_auto_out_3_a_bits_source),
    .auto_out_3_a_bits_address(out_xbar_auto_out_3_a_bits_address),
    .auto_out_3_a_bits_mask(out_xbar_auto_out_3_a_bits_mask),
    .auto_out_3_a_bits_data(out_xbar_auto_out_3_a_bits_data),
    .auto_out_3_a_bits_corrupt(out_xbar_auto_out_3_a_bits_corrupt),
    .auto_out_3_d_ready(out_xbar_auto_out_3_d_ready),
    .auto_out_3_d_valid(out_xbar_auto_out_3_d_valid),
    .auto_out_3_d_bits_opcode(out_xbar_auto_out_3_d_bits_opcode),
    .auto_out_3_d_bits_size(out_xbar_auto_out_3_d_bits_size),
    .auto_out_3_d_bits_source(out_xbar_auto_out_3_d_bits_source),
    .auto_out_3_d_bits_data(out_xbar_auto_out_3_d_bits_data),
    .auto_out_2_a_ready(out_xbar_auto_out_2_a_ready),
    .auto_out_2_a_valid(out_xbar_auto_out_2_a_valid),
    .auto_out_2_a_bits_opcode(out_xbar_auto_out_2_a_bits_opcode),
    .auto_out_2_a_bits_param(out_xbar_auto_out_2_a_bits_param),
    .auto_out_2_a_bits_size(out_xbar_auto_out_2_a_bits_size),
    .auto_out_2_a_bits_source(out_xbar_auto_out_2_a_bits_source),
    .auto_out_2_a_bits_address(out_xbar_auto_out_2_a_bits_address),
    .auto_out_2_a_bits_mask(out_xbar_auto_out_2_a_bits_mask),
    .auto_out_2_a_bits_data(out_xbar_auto_out_2_a_bits_data),
    .auto_out_2_a_bits_corrupt(out_xbar_auto_out_2_a_bits_corrupt),
    .auto_out_2_d_ready(out_xbar_auto_out_2_d_ready),
    .auto_out_2_d_valid(out_xbar_auto_out_2_d_valid),
    .auto_out_2_d_bits_opcode(out_xbar_auto_out_2_d_bits_opcode),
    .auto_out_2_d_bits_size(out_xbar_auto_out_2_d_bits_size),
    .auto_out_2_d_bits_source(out_xbar_auto_out_2_d_bits_source),
    .auto_out_2_d_bits_data(out_xbar_auto_out_2_d_bits_data),
    .auto_out_1_a_ready(out_xbar_auto_out_1_a_ready),
    .auto_out_1_a_valid(out_xbar_auto_out_1_a_valid),
    .auto_out_1_a_bits_opcode(out_xbar_auto_out_1_a_bits_opcode),
    .auto_out_1_a_bits_param(out_xbar_auto_out_1_a_bits_param),
    .auto_out_1_a_bits_size(out_xbar_auto_out_1_a_bits_size),
    .auto_out_1_a_bits_source(out_xbar_auto_out_1_a_bits_source),
    .auto_out_1_a_bits_address(out_xbar_auto_out_1_a_bits_address),
    .auto_out_1_a_bits_mask(out_xbar_auto_out_1_a_bits_mask),
    .auto_out_1_a_bits_data(out_xbar_auto_out_1_a_bits_data),
    .auto_out_1_a_bits_corrupt(out_xbar_auto_out_1_a_bits_corrupt),
    .auto_out_1_d_ready(out_xbar_auto_out_1_d_ready),
    .auto_out_1_d_valid(out_xbar_auto_out_1_d_valid),
    .auto_out_1_d_bits_opcode(out_xbar_auto_out_1_d_bits_opcode),
    .auto_out_1_d_bits_size(out_xbar_auto_out_1_d_bits_size),
    .auto_out_1_d_bits_source(out_xbar_auto_out_1_d_bits_source),
    .auto_out_1_d_bits_data(out_xbar_auto_out_1_d_bits_data),
    .auto_out_0_a_ready(out_xbar_auto_out_0_a_ready),
    .auto_out_0_a_valid(out_xbar_auto_out_0_a_valid),
    .auto_out_0_a_bits_opcode(out_xbar_auto_out_0_a_bits_opcode),
    .auto_out_0_a_bits_param(out_xbar_auto_out_0_a_bits_param),
    .auto_out_0_a_bits_size(out_xbar_auto_out_0_a_bits_size),
    .auto_out_0_a_bits_source(out_xbar_auto_out_0_a_bits_source),
    .auto_out_0_a_bits_address(out_xbar_auto_out_0_a_bits_address),
    .auto_out_0_a_bits_mask(out_xbar_auto_out_0_a_bits_mask),
    .auto_out_0_a_bits_data(out_xbar_auto_out_0_a_bits_data),
    .auto_out_0_a_bits_corrupt(out_xbar_auto_out_0_a_bits_corrupt),
    .auto_out_0_d_ready(out_xbar_auto_out_0_d_ready),
    .auto_out_0_d_valid(out_xbar_auto_out_0_d_valid),
    .auto_out_0_d_bits_opcode(out_xbar_auto_out_0_d_bits_opcode),
    .auto_out_0_d_bits_param(out_xbar_auto_out_0_d_bits_param),
    .auto_out_0_d_bits_size(out_xbar_auto_out_0_d_bits_size),
    .auto_out_0_d_bits_source(out_xbar_auto_out_0_d_bits_source),
    .auto_out_0_d_bits_sink(out_xbar_auto_out_0_d_bits_sink),
    .auto_out_0_d_bits_denied(out_xbar_auto_out_0_d_bits_denied),
    .auto_out_0_d_bits_data(out_xbar_auto_out_0_d_bits_data),
    .auto_out_0_d_bits_corrupt(out_xbar_auto_out_0_d_bits_corrupt)
  );
  TLBuffer buffer ( 
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
    .auto_out_d_bits_param(buffer_auto_out_d_bits_param),
    .auto_out_d_bits_size(buffer_auto_out_d_bits_size),
    .auto_out_d_bits_source(buffer_auto_out_d_bits_source),
    .auto_out_d_bits_sink(buffer_auto_out_d_bits_sink),
    .auto_out_d_bits_denied(buffer_auto_out_d_bits_denied),
    .auto_out_d_bits_data(buffer_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(buffer_auto_out_d_bits_corrupt)
  );
  TLAtomicAutomata atomics ( 
    .clock(atomics_clock),
    .reset(atomics_reset),
    .auto_in_a_ready(atomics_auto_in_a_ready),
    .auto_in_a_valid(atomics_auto_in_a_valid),
    .auto_in_a_bits_opcode(atomics_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(atomics_auto_in_a_bits_param),
    .auto_in_a_bits_size(atomics_auto_in_a_bits_size),
    .auto_in_a_bits_source(atomics_auto_in_a_bits_source),
    .auto_in_a_bits_address(atomics_auto_in_a_bits_address),
    .auto_in_a_bits_mask(atomics_auto_in_a_bits_mask),
    .auto_in_a_bits_data(atomics_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(atomics_auto_in_a_bits_corrupt),
    .auto_in_d_ready(atomics_auto_in_d_ready),
    .auto_in_d_valid(atomics_auto_in_d_valid),
    .auto_in_d_bits_opcode(atomics_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(atomics_auto_in_d_bits_param),
    .auto_in_d_bits_size(atomics_auto_in_d_bits_size),
    .auto_in_d_bits_source(atomics_auto_in_d_bits_source),
    .auto_in_d_bits_sink(atomics_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(atomics_auto_in_d_bits_denied),
    .auto_in_d_bits_data(atomics_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(atomics_auto_in_d_bits_corrupt),
    .auto_out_a_ready(atomics_auto_out_a_ready),
    .auto_out_a_valid(atomics_auto_out_a_valid),
    .auto_out_a_bits_opcode(atomics_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(atomics_auto_out_a_bits_param),
    .auto_out_a_bits_size(atomics_auto_out_a_bits_size),
    .auto_out_a_bits_source(atomics_auto_out_a_bits_source),
    .auto_out_a_bits_address(atomics_auto_out_a_bits_address),
    .auto_out_a_bits_mask(atomics_auto_out_a_bits_mask),
    .auto_out_a_bits_data(atomics_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt(atomics_auto_out_a_bits_corrupt),
    .auto_out_d_ready(atomics_auto_out_d_ready),
    .auto_out_d_valid(atomics_auto_out_d_valid),
    .auto_out_d_bits_opcode(atomics_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(atomics_auto_out_d_bits_param),
    .auto_out_d_bits_size(atomics_auto_out_d_bits_size),
    .auto_out_d_bits_source(atomics_auto_out_d_bits_source),
    .auto_out_d_bits_sink(atomics_auto_out_d_bits_sink),
    .auto_out_d_bits_denied(atomics_auto_out_d_bits_denied),
    .auto_out_d_bits_data(atomics_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(atomics_auto_out_d_bits_corrupt)
  );
  TLBuffer_1 buffer_1 ( 
    .clock(buffer_1_clock),
    .reset(buffer_1_reset),
    .auto_in_a_ready(buffer_1_auto_in_a_ready),
    .auto_in_a_valid(buffer_1_auto_in_a_valid),
    .auto_in_a_bits_opcode(buffer_1_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(buffer_1_auto_in_a_bits_param),
    .auto_in_a_bits_size(buffer_1_auto_in_a_bits_size),
    .auto_in_a_bits_source(buffer_1_auto_in_a_bits_source),
    .auto_in_a_bits_address(buffer_1_auto_in_a_bits_address),
    .auto_in_a_bits_mask(buffer_1_auto_in_a_bits_mask),
    .auto_in_a_bits_data(buffer_1_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(buffer_1_auto_in_a_bits_corrupt),
    .auto_in_d_ready(buffer_1_auto_in_d_ready),
    .auto_in_d_valid(buffer_1_auto_in_d_valid),
    .auto_in_d_bits_opcode(buffer_1_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(buffer_1_auto_in_d_bits_param),
    .auto_in_d_bits_size(buffer_1_auto_in_d_bits_size),
    .auto_in_d_bits_source(buffer_1_auto_in_d_bits_source),
    .auto_in_d_bits_sink(buffer_1_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(buffer_1_auto_in_d_bits_denied),
    .auto_in_d_bits_data(buffer_1_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(buffer_1_auto_in_d_bits_corrupt),
    .auto_out_a_ready(buffer_1_auto_out_a_ready),
    .auto_out_a_valid(buffer_1_auto_out_a_valid),
    .auto_out_a_bits_opcode(buffer_1_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(buffer_1_auto_out_a_bits_param),
    .auto_out_a_bits_size(buffer_1_auto_out_a_bits_size),
    .auto_out_a_bits_source(buffer_1_auto_out_a_bits_source),
    .auto_out_a_bits_address(buffer_1_auto_out_a_bits_address),
    .auto_out_a_bits_mask(buffer_1_auto_out_a_bits_mask),
    .auto_out_a_bits_data(buffer_1_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt(buffer_1_auto_out_a_bits_corrupt),
    .auto_out_d_ready(buffer_1_auto_out_d_ready),
    .auto_out_d_valid(buffer_1_auto_out_d_valid),
    .auto_out_d_bits_opcode(buffer_1_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(buffer_1_auto_out_d_bits_param),
    .auto_out_d_bits_size(buffer_1_auto_out_d_bits_size),
    .auto_out_d_bits_source(buffer_1_auto_out_d_bits_source),
    .auto_out_d_bits_sink(buffer_1_auto_out_d_bits_sink),
    .auto_out_d_bits_denied(buffer_1_auto_out_d_bits_denied),
    .auto_out_d_bits_data(buffer_1_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(buffer_1_auto_out_d_bits_corrupt)
  );
  SimpleLazyModule_1 coupler_to_bus_named_pbus ( 
    .clock(coupler_to_bus_named_pbus_clock),
    .reset(coupler_to_bus_named_pbus_reset),
    .auto_widget_in_a_ready(coupler_to_bus_named_pbus_auto_widget_in_a_ready),
    .auto_widget_in_a_valid(coupler_to_bus_named_pbus_auto_widget_in_a_valid),
    .auto_widget_in_a_bits_opcode(coupler_to_bus_named_pbus_auto_widget_in_a_bits_opcode),
    .auto_widget_in_a_bits_param(coupler_to_bus_named_pbus_auto_widget_in_a_bits_param),
    .auto_widget_in_a_bits_size(coupler_to_bus_named_pbus_auto_widget_in_a_bits_size),
    .auto_widget_in_a_bits_source(coupler_to_bus_named_pbus_auto_widget_in_a_bits_source),
    .auto_widget_in_a_bits_address(coupler_to_bus_named_pbus_auto_widget_in_a_bits_address),
    .auto_widget_in_a_bits_mask(coupler_to_bus_named_pbus_auto_widget_in_a_bits_mask),
    .auto_widget_in_a_bits_data(coupler_to_bus_named_pbus_auto_widget_in_a_bits_data),
    .auto_widget_in_a_bits_corrupt(coupler_to_bus_named_pbus_auto_widget_in_a_bits_corrupt),
    .auto_widget_in_d_ready(coupler_to_bus_named_pbus_auto_widget_in_d_ready),
    .auto_widget_in_d_valid(coupler_to_bus_named_pbus_auto_widget_in_d_valid),
    .auto_widget_in_d_bits_opcode(coupler_to_bus_named_pbus_auto_widget_in_d_bits_opcode),
    .auto_widget_in_d_bits_param(coupler_to_bus_named_pbus_auto_widget_in_d_bits_param),
    .auto_widget_in_d_bits_size(coupler_to_bus_named_pbus_auto_widget_in_d_bits_size),
    .auto_widget_in_d_bits_source(coupler_to_bus_named_pbus_auto_widget_in_d_bits_source),
    .auto_widget_in_d_bits_sink(coupler_to_bus_named_pbus_auto_widget_in_d_bits_sink),
    .auto_widget_in_d_bits_denied(coupler_to_bus_named_pbus_auto_widget_in_d_bits_denied),
    .auto_widget_in_d_bits_data(coupler_to_bus_named_pbus_auto_widget_in_d_bits_data),
    .auto_widget_in_d_bits_corrupt(coupler_to_bus_named_pbus_auto_widget_in_d_bits_corrupt),
    .auto_from_cbus_out_a_ready(coupler_to_bus_named_pbus_auto_from_cbus_out_a_ready),
    .auto_from_cbus_out_a_valid(coupler_to_bus_named_pbus_auto_from_cbus_out_a_valid),
    .auto_from_cbus_out_a_bits_opcode(coupler_to_bus_named_pbus_auto_from_cbus_out_a_bits_opcode),
    .auto_from_cbus_out_a_bits_param(coupler_to_bus_named_pbus_auto_from_cbus_out_a_bits_param),
    .auto_from_cbus_out_a_bits_size(coupler_to_bus_named_pbus_auto_from_cbus_out_a_bits_size),
    .auto_from_cbus_out_a_bits_source(coupler_to_bus_named_pbus_auto_from_cbus_out_a_bits_source),
    .auto_from_cbus_out_a_bits_address(coupler_to_bus_named_pbus_auto_from_cbus_out_a_bits_address),
    .auto_from_cbus_out_a_bits_mask(coupler_to_bus_named_pbus_auto_from_cbus_out_a_bits_mask),
    .auto_from_cbus_out_a_bits_data(coupler_to_bus_named_pbus_auto_from_cbus_out_a_bits_data),
    .auto_from_cbus_out_a_bits_corrupt(coupler_to_bus_named_pbus_auto_from_cbus_out_a_bits_corrupt),
    .auto_from_cbus_out_d_ready(coupler_to_bus_named_pbus_auto_from_cbus_out_d_ready),
    .auto_from_cbus_out_d_valid(coupler_to_bus_named_pbus_auto_from_cbus_out_d_valid),
    .auto_from_cbus_out_d_bits_opcode(coupler_to_bus_named_pbus_auto_from_cbus_out_d_bits_opcode),
    .auto_from_cbus_out_d_bits_param(coupler_to_bus_named_pbus_auto_from_cbus_out_d_bits_param),
    .auto_from_cbus_out_d_bits_size(coupler_to_bus_named_pbus_auto_from_cbus_out_d_bits_size),
    .auto_from_cbus_out_d_bits_source(coupler_to_bus_named_pbus_auto_from_cbus_out_d_bits_source),
    .auto_from_cbus_out_d_bits_sink(coupler_to_bus_named_pbus_auto_from_cbus_out_d_bits_sink),
    .auto_from_cbus_out_d_bits_denied(coupler_to_bus_named_pbus_auto_from_cbus_out_d_bits_denied),
    .auto_from_cbus_out_d_bits_data(coupler_to_bus_named_pbus_auto_from_cbus_out_d_bits_data),
    .auto_from_cbus_out_d_bits_corrupt(coupler_to_bus_named_pbus_auto_from_cbus_out_d_bits_corrupt)
  );
  SimpleLazyModule_2 coupler_to_slave_named_plic ( 
    .clock(coupler_to_slave_named_plic_clock),
    .reset(coupler_to_slave_named_plic_reset),
    .auto_buffer_in_a_ready(coupler_to_slave_named_plic_auto_buffer_in_a_ready),
    .auto_buffer_in_a_valid(coupler_to_slave_named_plic_auto_buffer_in_a_valid),
    .auto_buffer_in_a_bits_opcode(coupler_to_slave_named_plic_auto_buffer_in_a_bits_opcode),
    .auto_buffer_in_a_bits_param(coupler_to_slave_named_plic_auto_buffer_in_a_bits_param),
    .auto_buffer_in_a_bits_size(coupler_to_slave_named_plic_auto_buffer_in_a_bits_size),
    .auto_buffer_in_a_bits_source(coupler_to_slave_named_plic_auto_buffer_in_a_bits_source),
    .auto_buffer_in_a_bits_address(coupler_to_slave_named_plic_auto_buffer_in_a_bits_address),
    .auto_buffer_in_a_bits_mask(coupler_to_slave_named_plic_auto_buffer_in_a_bits_mask),
    .auto_buffer_in_a_bits_data(coupler_to_slave_named_plic_auto_buffer_in_a_bits_data),
    .auto_buffer_in_a_bits_corrupt(coupler_to_slave_named_plic_auto_buffer_in_a_bits_corrupt),
    .auto_buffer_in_d_ready(coupler_to_slave_named_plic_auto_buffer_in_d_ready),
    .auto_buffer_in_d_valid(coupler_to_slave_named_plic_auto_buffer_in_d_valid),
    .auto_buffer_in_d_bits_opcode(coupler_to_slave_named_plic_auto_buffer_in_d_bits_opcode),
    .auto_buffer_in_d_bits_size(coupler_to_slave_named_plic_auto_buffer_in_d_bits_size),
    .auto_buffer_in_d_bits_source(coupler_to_slave_named_plic_auto_buffer_in_d_bits_source),
    .auto_buffer_in_d_bits_data(coupler_to_slave_named_plic_auto_buffer_in_d_bits_data),
    .auto_fragmenter_out_a_ready(coupler_to_slave_named_plic_auto_fragmenter_out_a_ready),
    .auto_fragmenter_out_a_valid(coupler_to_slave_named_plic_auto_fragmenter_out_a_valid),
    .auto_fragmenter_out_a_bits_opcode(coupler_to_slave_named_plic_auto_fragmenter_out_a_bits_opcode),
    .auto_fragmenter_out_a_bits_param(coupler_to_slave_named_plic_auto_fragmenter_out_a_bits_param),
    .auto_fragmenter_out_a_bits_size(coupler_to_slave_named_plic_auto_fragmenter_out_a_bits_size),
    .auto_fragmenter_out_a_bits_source(coupler_to_slave_named_plic_auto_fragmenter_out_a_bits_source),
    .auto_fragmenter_out_a_bits_address(coupler_to_slave_named_plic_auto_fragmenter_out_a_bits_address),
    .auto_fragmenter_out_a_bits_mask(coupler_to_slave_named_plic_auto_fragmenter_out_a_bits_mask),
    .auto_fragmenter_out_a_bits_data(coupler_to_slave_named_plic_auto_fragmenter_out_a_bits_data),
    .auto_fragmenter_out_a_bits_corrupt(coupler_to_slave_named_plic_auto_fragmenter_out_a_bits_corrupt),
    .auto_fragmenter_out_d_ready(coupler_to_slave_named_plic_auto_fragmenter_out_d_ready),
    .auto_fragmenter_out_d_valid(coupler_to_slave_named_plic_auto_fragmenter_out_d_valid),
    .auto_fragmenter_out_d_bits_opcode(coupler_to_slave_named_plic_auto_fragmenter_out_d_bits_opcode),
    .auto_fragmenter_out_d_bits_size(coupler_to_slave_named_plic_auto_fragmenter_out_d_bits_size),
    .auto_fragmenter_out_d_bits_source(coupler_to_slave_named_plic_auto_fragmenter_out_d_bits_source),
    .auto_fragmenter_out_d_bits_data(coupler_to_slave_named_plic_auto_fragmenter_out_d_bits_data)
  );
  SimpleLazyModule_3 coupler_to_slave_named_clint ( 
    .clock(coupler_to_slave_named_clint_clock),
    .reset(coupler_to_slave_named_clint_reset),
    .auto_buffer_in_a_ready(coupler_to_slave_named_clint_auto_buffer_in_a_ready),
    .auto_buffer_in_a_valid(coupler_to_slave_named_clint_auto_buffer_in_a_valid),
    .auto_buffer_in_a_bits_opcode(coupler_to_slave_named_clint_auto_buffer_in_a_bits_opcode),
    .auto_buffer_in_a_bits_param(coupler_to_slave_named_clint_auto_buffer_in_a_bits_param),
    .auto_buffer_in_a_bits_size(coupler_to_slave_named_clint_auto_buffer_in_a_bits_size),
    .auto_buffer_in_a_bits_source(coupler_to_slave_named_clint_auto_buffer_in_a_bits_source),
    .auto_buffer_in_a_bits_address(coupler_to_slave_named_clint_auto_buffer_in_a_bits_address),
    .auto_buffer_in_a_bits_mask(coupler_to_slave_named_clint_auto_buffer_in_a_bits_mask),
    .auto_buffer_in_a_bits_data(coupler_to_slave_named_clint_auto_buffer_in_a_bits_data),
    .auto_buffer_in_a_bits_corrupt(coupler_to_slave_named_clint_auto_buffer_in_a_bits_corrupt),
    .auto_buffer_in_d_ready(coupler_to_slave_named_clint_auto_buffer_in_d_ready),
    .auto_buffer_in_d_valid(coupler_to_slave_named_clint_auto_buffer_in_d_valid),
    .auto_buffer_in_d_bits_opcode(coupler_to_slave_named_clint_auto_buffer_in_d_bits_opcode),
    .auto_buffer_in_d_bits_size(coupler_to_slave_named_clint_auto_buffer_in_d_bits_size),
    .auto_buffer_in_d_bits_source(coupler_to_slave_named_clint_auto_buffer_in_d_bits_source),
    .auto_buffer_in_d_bits_data(coupler_to_slave_named_clint_auto_buffer_in_d_bits_data),
    .auto_fragmenter_out_a_ready(coupler_to_slave_named_clint_auto_fragmenter_out_a_ready),
    .auto_fragmenter_out_a_valid(coupler_to_slave_named_clint_auto_fragmenter_out_a_valid),
    .auto_fragmenter_out_a_bits_opcode(coupler_to_slave_named_clint_auto_fragmenter_out_a_bits_opcode),
    .auto_fragmenter_out_a_bits_param(coupler_to_slave_named_clint_auto_fragmenter_out_a_bits_param),
    .auto_fragmenter_out_a_bits_size(coupler_to_slave_named_clint_auto_fragmenter_out_a_bits_size),
    .auto_fragmenter_out_a_bits_source(coupler_to_slave_named_clint_auto_fragmenter_out_a_bits_source),
    .auto_fragmenter_out_a_bits_address(coupler_to_slave_named_clint_auto_fragmenter_out_a_bits_address),
    .auto_fragmenter_out_a_bits_mask(coupler_to_slave_named_clint_auto_fragmenter_out_a_bits_mask),
    .auto_fragmenter_out_a_bits_data(coupler_to_slave_named_clint_auto_fragmenter_out_a_bits_data),
    .auto_fragmenter_out_a_bits_corrupt(coupler_to_slave_named_clint_auto_fragmenter_out_a_bits_corrupt),
    .auto_fragmenter_out_d_ready(coupler_to_slave_named_clint_auto_fragmenter_out_d_ready),
    .auto_fragmenter_out_d_valid(coupler_to_slave_named_clint_auto_fragmenter_out_d_valid),
    .auto_fragmenter_out_d_bits_opcode(coupler_to_slave_named_clint_auto_fragmenter_out_d_bits_opcode),
    .auto_fragmenter_out_d_bits_size(coupler_to_slave_named_clint_auto_fragmenter_out_d_bits_size),
    .auto_fragmenter_out_d_bits_source(coupler_to_slave_named_clint_auto_fragmenter_out_d_bits_source),
    .auto_fragmenter_out_d_bits_data(coupler_to_slave_named_clint_auto_fragmenter_out_d_bits_data)
  );
  SimpleLazyModule_4 coupler_to_slave_named_debug ( 
    .clock(coupler_to_slave_named_debug_clock),
    .reset(coupler_to_slave_named_debug_reset),
    .auto_buffer_in_a_ready(coupler_to_slave_named_debug_auto_buffer_in_a_ready),
    .auto_buffer_in_a_valid(coupler_to_slave_named_debug_auto_buffer_in_a_valid),
    .auto_buffer_in_a_bits_opcode(coupler_to_slave_named_debug_auto_buffer_in_a_bits_opcode),
    .auto_buffer_in_a_bits_param(coupler_to_slave_named_debug_auto_buffer_in_a_bits_param),
    .auto_buffer_in_a_bits_size(coupler_to_slave_named_debug_auto_buffer_in_a_bits_size),
    .auto_buffer_in_a_bits_source(coupler_to_slave_named_debug_auto_buffer_in_a_bits_source),
    .auto_buffer_in_a_bits_address(coupler_to_slave_named_debug_auto_buffer_in_a_bits_address),
    .auto_buffer_in_a_bits_mask(coupler_to_slave_named_debug_auto_buffer_in_a_bits_mask),
    .auto_buffer_in_a_bits_data(coupler_to_slave_named_debug_auto_buffer_in_a_bits_data),
    .auto_buffer_in_a_bits_corrupt(coupler_to_slave_named_debug_auto_buffer_in_a_bits_corrupt),
    .auto_buffer_in_d_ready(coupler_to_slave_named_debug_auto_buffer_in_d_ready),
    .auto_buffer_in_d_valid(coupler_to_slave_named_debug_auto_buffer_in_d_valid),
    .auto_buffer_in_d_bits_opcode(coupler_to_slave_named_debug_auto_buffer_in_d_bits_opcode),
    .auto_buffer_in_d_bits_size(coupler_to_slave_named_debug_auto_buffer_in_d_bits_size),
    .auto_buffer_in_d_bits_source(coupler_to_slave_named_debug_auto_buffer_in_d_bits_source),
    .auto_buffer_in_d_bits_data(coupler_to_slave_named_debug_auto_buffer_in_d_bits_data),
    .auto_fragmenter_out_a_ready(coupler_to_slave_named_debug_auto_fragmenter_out_a_ready),
    .auto_fragmenter_out_a_valid(coupler_to_slave_named_debug_auto_fragmenter_out_a_valid),
    .auto_fragmenter_out_a_bits_opcode(coupler_to_slave_named_debug_auto_fragmenter_out_a_bits_opcode),
    .auto_fragmenter_out_a_bits_param(coupler_to_slave_named_debug_auto_fragmenter_out_a_bits_param),
    .auto_fragmenter_out_a_bits_size(coupler_to_slave_named_debug_auto_fragmenter_out_a_bits_size),
    .auto_fragmenter_out_a_bits_source(coupler_to_slave_named_debug_auto_fragmenter_out_a_bits_source),
    .auto_fragmenter_out_a_bits_address(coupler_to_slave_named_debug_auto_fragmenter_out_a_bits_address),
    .auto_fragmenter_out_a_bits_mask(coupler_to_slave_named_debug_auto_fragmenter_out_a_bits_mask),
    .auto_fragmenter_out_a_bits_data(coupler_to_slave_named_debug_auto_fragmenter_out_a_bits_data),
    .auto_fragmenter_out_a_bits_corrupt(coupler_to_slave_named_debug_auto_fragmenter_out_a_bits_corrupt),
    .auto_fragmenter_out_d_ready(coupler_to_slave_named_debug_auto_fragmenter_out_d_ready),
    .auto_fragmenter_out_d_valid(coupler_to_slave_named_debug_auto_fragmenter_out_d_valid),
    .auto_fragmenter_out_d_bits_opcode(coupler_to_slave_named_debug_auto_fragmenter_out_d_bits_opcode),
    .auto_fragmenter_out_d_bits_size(coupler_to_slave_named_debug_auto_fragmenter_out_d_bits_size),
    .auto_fragmenter_out_d_bits_source(coupler_to_slave_named_debug_auto_fragmenter_out_d_bits_source),
    .auto_fragmenter_out_d_bits_data(coupler_to_slave_named_debug_auto_fragmenter_out_d_bits_data)
  );
  SimpleLazyModule_9 coupler_to_slave_named_MaskROM ( 
    .clock(coupler_to_slave_named_MaskROM_clock),
    .reset(coupler_to_slave_named_MaskROM_reset),
    .auto_buffer_in_a_ready(coupler_to_slave_named_MaskROM_auto_buffer_in_a_ready),
    .auto_buffer_in_a_valid(coupler_to_slave_named_MaskROM_auto_buffer_in_a_valid),
    .auto_buffer_in_a_bits_opcode(coupler_to_slave_named_MaskROM_auto_buffer_in_a_bits_opcode),
    .auto_buffer_in_a_bits_param(coupler_to_slave_named_MaskROM_auto_buffer_in_a_bits_param),
    .auto_buffer_in_a_bits_size(coupler_to_slave_named_MaskROM_auto_buffer_in_a_bits_size),
    .auto_buffer_in_a_bits_source(coupler_to_slave_named_MaskROM_auto_buffer_in_a_bits_source),
    .auto_buffer_in_a_bits_address(coupler_to_slave_named_MaskROM_auto_buffer_in_a_bits_address),
    .auto_buffer_in_a_bits_mask(coupler_to_slave_named_MaskROM_auto_buffer_in_a_bits_mask),
    .auto_buffer_in_a_bits_corrupt(coupler_to_slave_named_MaskROM_auto_buffer_in_a_bits_corrupt),
    .auto_buffer_in_d_ready(coupler_to_slave_named_MaskROM_auto_buffer_in_d_ready),
    .auto_buffer_in_d_valid(coupler_to_slave_named_MaskROM_auto_buffer_in_d_valid),
    .auto_buffer_in_d_bits_size(coupler_to_slave_named_MaskROM_auto_buffer_in_d_bits_size),
    .auto_buffer_in_d_bits_source(coupler_to_slave_named_MaskROM_auto_buffer_in_d_bits_source),
    .auto_buffer_in_d_bits_data(coupler_to_slave_named_MaskROM_auto_buffer_in_d_bits_data),
    .auto_buffer_in_d_bits_corrupt(coupler_to_slave_named_MaskROM_auto_buffer_in_d_bits_corrupt),
    .auto_fragmenter_out_a_ready(coupler_to_slave_named_MaskROM_auto_fragmenter_out_a_ready),
    .auto_fragmenter_out_a_valid(coupler_to_slave_named_MaskROM_auto_fragmenter_out_a_valid),
    .auto_fragmenter_out_a_bits_opcode(coupler_to_slave_named_MaskROM_auto_fragmenter_out_a_bits_opcode),
    .auto_fragmenter_out_a_bits_param(coupler_to_slave_named_MaskROM_auto_fragmenter_out_a_bits_param),
    .auto_fragmenter_out_a_bits_size(coupler_to_slave_named_MaskROM_auto_fragmenter_out_a_bits_size),
    .auto_fragmenter_out_a_bits_source(coupler_to_slave_named_MaskROM_auto_fragmenter_out_a_bits_source),
    .auto_fragmenter_out_a_bits_address(coupler_to_slave_named_MaskROM_auto_fragmenter_out_a_bits_address),
    .auto_fragmenter_out_a_bits_mask(coupler_to_slave_named_MaskROM_auto_fragmenter_out_a_bits_mask),
    .auto_fragmenter_out_a_bits_corrupt(coupler_to_slave_named_MaskROM_auto_fragmenter_out_a_bits_corrupt),
    .auto_fragmenter_out_d_ready(coupler_to_slave_named_MaskROM_auto_fragmenter_out_d_ready),
    .auto_fragmenter_out_d_valid(coupler_to_slave_named_MaskROM_auto_fragmenter_out_d_valid),
    .auto_fragmenter_out_d_bits_size(coupler_to_slave_named_MaskROM_auto_fragmenter_out_d_bits_size),
    .auto_fragmenter_out_d_bits_source(coupler_to_slave_named_MaskROM_auto_fragmenter_out_d_bits_source),
    .auto_fragmenter_out_d_bits_data(coupler_to_slave_named_MaskROM_auto_fragmenter_out_d_bits_data)
  );
  assign auto_coupler_to_slave_named_MaskROM_fragmenter_out_a_valid = coupler_to_slave_named_MaskROM_auto_fragmenter_out_a_valid; 
  assign auto_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_opcode = coupler_to_slave_named_MaskROM_auto_fragmenter_out_a_bits_opcode; 
  assign auto_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_param = coupler_to_slave_named_MaskROM_auto_fragmenter_out_a_bits_param; 
  assign auto_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_size = coupler_to_slave_named_MaskROM_auto_fragmenter_out_a_bits_size; 
  assign auto_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_source = coupler_to_slave_named_MaskROM_auto_fragmenter_out_a_bits_source; 
  assign auto_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_address = coupler_to_slave_named_MaskROM_auto_fragmenter_out_a_bits_address; 
  assign auto_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_mask = coupler_to_slave_named_MaskROM_auto_fragmenter_out_a_bits_mask; 
  assign auto_coupler_to_slave_named_MaskROM_fragmenter_out_a_bits_corrupt = coupler_to_slave_named_MaskROM_auto_fragmenter_out_a_bits_corrupt; 
  assign auto_coupler_to_slave_named_MaskROM_fragmenter_out_d_ready = coupler_to_slave_named_MaskROM_auto_fragmenter_out_d_ready; 
  assign auto_coupler_to_slave_named_debug_fragmenter_out_a_valid = coupler_to_slave_named_debug_auto_fragmenter_out_a_valid; 
  assign auto_coupler_to_slave_named_debug_fragmenter_out_a_bits_opcode = coupler_to_slave_named_debug_auto_fragmenter_out_a_bits_opcode; 
  assign auto_coupler_to_slave_named_debug_fragmenter_out_a_bits_param = coupler_to_slave_named_debug_auto_fragmenter_out_a_bits_param; 
  assign auto_coupler_to_slave_named_debug_fragmenter_out_a_bits_size = coupler_to_slave_named_debug_auto_fragmenter_out_a_bits_size; 
  assign auto_coupler_to_slave_named_debug_fragmenter_out_a_bits_source = coupler_to_slave_named_debug_auto_fragmenter_out_a_bits_source; 
  assign auto_coupler_to_slave_named_debug_fragmenter_out_a_bits_address = coupler_to_slave_named_debug_auto_fragmenter_out_a_bits_address; 
  assign auto_coupler_to_slave_named_debug_fragmenter_out_a_bits_mask = coupler_to_slave_named_debug_auto_fragmenter_out_a_bits_mask; 
  assign auto_coupler_to_slave_named_debug_fragmenter_out_a_bits_data = coupler_to_slave_named_debug_auto_fragmenter_out_a_bits_data; 
  assign auto_coupler_to_slave_named_debug_fragmenter_out_a_bits_corrupt = coupler_to_slave_named_debug_auto_fragmenter_out_a_bits_corrupt; 
  assign auto_coupler_to_slave_named_debug_fragmenter_out_d_ready = coupler_to_slave_named_debug_auto_fragmenter_out_d_ready; 
  assign auto_coupler_to_slave_named_clint_fragmenter_out_a_valid = coupler_to_slave_named_clint_auto_fragmenter_out_a_valid; 
  assign auto_coupler_to_slave_named_clint_fragmenter_out_a_bits_opcode = coupler_to_slave_named_clint_auto_fragmenter_out_a_bits_opcode; 
  assign auto_coupler_to_slave_named_clint_fragmenter_out_a_bits_param = coupler_to_slave_named_clint_auto_fragmenter_out_a_bits_param; 
  assign auto_coupler_to_slave_named_clint_fragmenter_out_a_bits_size = coupler_to_slave_named_clint_auto_fragmenter_out_a_bits_size; 
  assign auto_coupler_to_slave_named_clint_fragmenter_out_a_bits_source = coupler_to_slave_named_clint_auto_fragmenter_out_a_bits_source; 
  assign auto_coupler_to_slave_named_clint_fragmenter_out_a_bits_address = coupler_to_slave_named_clint_auto_fragmenter_out_a_bits_address; 
  assign auto_coupler_to_slave_named_clint_fragmenter_out_a_bits_mask = coupler_to_slave_named_clint_auto_fragmenter_out_a_bits_mask; 
  assign auto_coupler_to_slave_named_clint_fragmenter_out_a_bits_data = coupler_to_slave_named_clint_auto_fragmenter_out_a_bits_data; 
  assign auto_coupler_to_slave_named_clint_fragmenter_out_a_bits_corrupt = coupler_to_slave_named_clint_auto_fragmenter_out_a_bits_corrupt; 
  assign auto_coupler_to_slave_named_clint_fragmenter_out_d_ready = coupler_to_slave_named_clint_auto_fragmenter_out_d_ready; 
  assign auto_coupler_to_slave_named_plic_fragmenter_out_a_valid = coupler_to_slave_named_plic_auto_fragmenter_out_a_valid; 
  assign auto_coupler_to_slave_named_plic_fragmenter_out_a_bits_opcode = coupler_to_slave_named_plic_auto_fragmenter_out_a_bits_opcode; 
  assign auto_coupler_to_slave_named_plic_fragmenter_out_a_bits_param = coupler_to_slave_named_plic_auto_fragmenter_out_a_bits_param; 
  assign auto_coupler_to_slave_named_plic_fragmenter_out_a_bits_size = coupler_to_slave_named_plic_auto_fragmenter_out_a_bits_size; 
  assign auto_coupler_to_slave_named_plic_fragmenter_out_a_bits_source = coupler_to_slave_named_plic_auto_fragmenter_out_a_bits_source; 
  assign auto_coupler_to_slave_named_plic_fragmenter_out_a_bits_address = coupler_to_slave_named_plic_auto_fragmenter_out_a_bits_address; 
  assign auto_coupler_to_slave_named_plic_fragmenter_out_a_bits_mask = coupler_to_slave_named_plic_auto_fragmenter_out_a_bits_mask; 
  assign auto_coupler_to_slave_named_plic_fragmenter_out_a_bits_data = coupler_to_slave_named_plic_auto_fragmenter_out_a_bits_data; 
  assign auto_coupler_to_slave_named_plic_fragmenter_out_a_bits_corrupt = coupler_to_slave_named_plic_auto_fragmenter_out_a_bits_corrupt; 
  assign auto_coupler_to_slave_named_plic_fragmenter_out_d_ready = coupler_to_slave_named_plic_auto_fragmenter_out_d_ready; 
  assign auto_coupler_to_bus_named_pbus_from_cbus_out_a_valid = coupler_to_bus_named_pbus_auto_from_cbus_out_a_valid; 
  assign auto_coupler_to_bus_named_pbus_from_cbus_out_a_bits_opcode = coupler_to_bus_named_pbus_auto_from_cbus_out_a_bits_opcode; 
  assign auto_coupler_to_bus_named_pbus_from_cbus_out_a_bits_param = coupler_to_bus_named_pbus_auto_from_cbus_out_a_bits_param; 
  assign auto_coupler_to_bus_named_pbus_from_cbus_out_a_bits_size = coupler_to_bus_named_pbus_auto_from_cbus_out_a_bits_size; 
  assign auto_coupler_to_bus_named_pbus_from_cbus_out_a_bits_source = coupler_to_bus_named_pbus_auto_from_cbus_out_a_bits_source; 
  assign auto_coupler_to_bus_named_pbus_from_cbus_out_a_bits_address = coupler_to_bus_named_pbus_auto_from_cbus_out_a_bits_address; 
  assign auto_coupler_to_bus_named_pbus_from_cbus_out_a_bits_mask = coupler_to_bus_named_pbus_auto_from_cbus_out_a_bits_mask; 
  assign auto_coupler_to_bus_named_pbus_from_cbus_out_a_bits_data = coupler_to_bus_named_pbus_auto_from_cbus_out_a_bits_data; 
  assign auto_coupler_to_bus_named_pbus_from_cbus_out_a_bits_corrupt = coupler_to_bus_named_pbus_auto_from_cbus_out_a_bits_corrupt; 
  assign auto_coupler_to_bus_named_pbus_from_cbus_out_d_ready = coupler_to_bus_named_pbus_auto_from_cbus_out_d_ready; 
  assign auto_from_sbus_in_a_ready = buffer_1_auto_in_a_ready; 
  assign auto_from_sbus_in_d_valid = buffer_1_auto_in_d_valid; 
  assign auto_from_sbus_in_d_bits_opcode = buffer_1_auto_in_d_bits_opcode; 
  assign auto_from_sbus_in_d_bits_param = buffer_1_auto_in_d_bits_param; 
  assign auto_from_sbus_in_d_bits_size = buffer_1_auto_in_d_bits_size; 
  assign auto_from_sbus_in_d_bits_source = buffer_1_auto_in_d_bits_source; 
  assign auto_from_sbus_in_d_bits_sink = buffer_1_auto_in_d_bits_sink; 
  assign auto_from_sbus_in_d_bits_denied = buffer_1_auto_in_d_bits_denied; 
  assign auto_from_sbus_in_d_bits_data = buffer_1_auto_in_d_bits_data; 
  assign auto_from_sbus_in_d_bits_corrupt = buffer_1_auto_in_d_bits_corrupt; 
  assign in_xbar_clock = clock; 
  assign in_xbar_reset = reset; 
  assign in_xbar_auto_in_a_valid = buffer_1_auto_out_a_valid; 
  assign in_xbar_auto_in_a_bits_opcode = buffer_1_auto_out_a_bits_opcode; 
  assign in_xbar_auto_in_a_bits_param = buffer_1_auto_out_a_bits_param; 
  assign in_xbar_auto_in_a_bits_size = buffer_1_auto_out_a_bits_size; 
  assign in_xbar_auto_in_a_bits_source = buffer_1_auto_out_a_bits_source; 
  assign in_xbar_auto_in_a_bits_address = buffer_1_auto_out_a_bits_address; 
  assign in_xbar_auto_in_a_bits_mask = buffer_1_auto_out_a_bits_mask; 
  assign in_xbar_auto_in_a_bits_data = buffer_1_auto_out_a_bits_data; 
  assign in_xbar_auto_in_a_bits_corrupt = buffer_1_auto_out_a_bits_corrupt; 
  assign in_xbar_auto_in_d_ready = buffer_1_auto_out_d_ready; 
  assign in_xbar_auto_out_a_ready = atomics_auto_in_a_ready; 
  assign in_xbar_auto_out_d_valid = atomics_auto_in_d_valid; 
  assign in_xbar_auto_out_d_bits_opcode = atomics_auto_in_d_bits_opcode; 
  assign in_xbar_auto_out_d_bits_param = atomics_auto_in_d_bits_param; 
  assign in_xbar_auto_out_d_bits_size = atomics_auto_in_d_bits_size; 
  assign in_xbar_auto_out_d_bits_source = atomics_auto_in_d_bits_source; 
  assign in_xbar_auto_out_d_bits_sink = atomics_auto_in_d_bits_sink; 
  assign in_xbar_auto_out_d_bits_denied = atomics_auto_in_d_bits_denied; 
  assign in_xbar_auto_out_d_bits_data = atomics_auto_in_d_bits_data; 
  assign in_xbar_auto_out_d_bits_corrupt = atomics_auto_in_d_bits_corrupt; 
  assign out_xbar_clock = clock; 
  assign out_xbar_reset = reset; 
  assign out_xbar_auto_in_a_valid = buffer_auto_out_a_valid; 
  assign out_xbar_auto_in_a_bits_opcode = buffer_auto_out_a_bits_opcode; 
  assign out_xbar_auto_in_a_bits_param = buffer_auto_out_a_bits_param; 
  assign out_xbar_auto_in_a_bits_size = buffer_auto_out_a_bits_size; 
  assign out_xbar_auto_in_a_bits_source = buffer_auto_out_a_bits_source; 
  assign out_xbar_auto_in_a_bits_address = buffer_auto_out_a_bits_address; 
  assign out_xbar_auto_in_a_bits_mask = buffer_auto_out_a_bits_mask; 
  assign out_xbar_auto_in_a_bits_data = buffer_auto_out_a_bits_data; 
  assign out_xbar_auto_in_a_bits_corrupt = buffer_auto_out_a_bits_corrupt; 
  assign out_xbar_auto_in_d_ready = buffer_auto_out_d_ready; 
  assign out_xbar_auto_out_4_a_ready = coupler_to_slave_named_MaskROM_auto_buffer_in_a_ready; 
  assign out_xbar_auto_out_4_d_valid = coupler_to_slave_named_MaskROM_auto_buffer_in_d_valid; 
  assign out_xbar_auto_out_4_d_bits_size = coupler_to_slave_named_MaskROM_auto_buffer_in_d_bits_size; 
  assign out_xbar_auto_out_4_d_bits_source = coupler_to_slave_named_MaskROM_auto_buffer_in_d_bits_source; 
  assign out_xbar_auto_out_4_d_bits_data = coupler_to_slave_named_MaskROM_auto_buffer_in_d_bits_data; 
  assign out_xbar_auto_out_4_d_bits_corrupt = coupler_to_slave_named_MaskROM_auto_buffer_in_d_bits_corrupt; 
  assign out_xbar_auto_out_3_a_ready = coupler_to_slave_named_debug_auto_buffer_in_a_ready; 
  assign out_xbar_auto_out_3_d_valid = coupler_to_slave_named_debug_auto_buffer_in_d_valid; 
  assign out_xbar_auto_out_3_d_bits_opcode = coupler_to_slave_named_debug_auto_buffer_in_d_bits_opcode; 
  assign out_xbar_auto_out_3_d_bits_size = coupler_to_slave_named_debug_auto_buffer_in_d_bits_size; 
  assign out_xbar_auto_out_3_d_bits_source = coupler_to_slave_named_debug_auto_buffer_in_d_bits_source; 
  assign out_xbar_auto_out_3_d_bits_data = coupler_to_slave_named_debug_auto_buffer_in_d_bits_data; 
  assign out_xbar_auto_out_2_a_ready = coupler_to_slave_named_clint_auto_buffer_in_a_ready; 
  assign out_xbar_auto_out_2_d_valid = coupler_to_slave_named_clint_auto_buffer_in_d_valid; 
  assign out_xbar_auto_out_2_d_bits_opcode = coupler_to_slave_named_clint_auto_buffer_in_d_bits_opcode; 
  assign out_xbar_auto_out_2_d_bits_size = coupler_to_slave_named_clint_auto_buffer_in_d_bits_size; 
  assign out_xbar_auto_out_2_d_bits_source = coupler_to_slave_named_clint_auto_buffer_in_d_bits_source; 
  assign out_xbar_auto_out_2_d_bits_data = coupler_to_slave_named_clint_auto_buffer_in_d_bits_data; 
  assign out_xbar_auto_out_1_a_ready = coupler_to_slave_named_plic_auto_buffer_in_a_ready; 
  assign out_xbar_auto_out_1_d_valid = coupler_to_slave_named_plic_auto_buffer_in_d_valid; 
  assign out_xbar_auto_out_1_d_bits_opcode = coupler_to_slave_named_plic_auto_buffer_in_d_bits_opcode; 
  assign out_xbar_auto_out_1_d_bits_size = coupler_to_slave_named_plic_auto_buffer_in_d_bits_size; 
  assign out_xbar_auto_out_1_d_bits_source = coupler_to_slave_named_plic_auto_buffer_in_d_bits_source; 
  assign out_xbar_auto_out_1_d_bits_data = coupler_to_slave_named_plic_auto_buffer_in_d_bits_data; 
  assign out_xbar_auto_out_0_a_ready = coupler_to_bus_named_pbus_auto_widget_in_a_ready; 
  assign out_xbar_auto_out_0_d_valid = coupler_to_bus_named_pbus_auto_widget_in_d_valid; 
  assign out_xbar_auto_out_0_d_bits_opcode = coupler_to_bus_named_pbus_auto_widget_in_d_bits_opcode; 
  assign out_xbar_auto_out_0_d_bits_param = coupler_to_bus_named_pbus_auto_widget_in_d_bits_param; 
  assign out_xbar_auto_out_0_d_bits_size = coupler_to_bus_named_pbus_auto_widget_in_d_bits_size; 
  assign out_xbar_auto_out_0_d_bits_source = coupler_to_bus_named_pbus_auto_widget_in_d_bits_source; 
  assign out_xbar_auto_out_0_d_bits_sink = coupler_to_bus_named_pbus_auto_widget_in_d_bits_sink; 
  assign out_xbar_auto_out_0_d_bits_denied = coupler_to_bus_named_pbus_auto_widget_in_d_bits_denied; 
  assign out_xbar_auto_out_0_d_bits_data = coupler_to_bus_named_pbus_auto_widget_in_d_bits_data; 
  assign out_xbar_auto_out_0_d_bits_corrupt = coupler_to_bus_named_pbus_auto_widget_in_d_bits_corrupt; 
  assign buffer_clock = clock; 
  assign buffer_reset = reset; 
  assign buffer_auto_in_a_valid = atomics_auto_out_a_valid; 
  assign buffer_auto_in_a_bits_opcode = atomics_auto_out_a_bits_opcode; 
  assign buffer_auto_in_a_bits_param = atomics_auto_out_a_bits_param; 
  assign buffer_auto_in_a_bits_size = atomics_auto_out_a_bits_size; 
  assign buffer_auto_in_a_bits_source = atomics_auto_out_a_bits_source; 
  assign buffer_auto_in_a_bits_address = atomics_auto_out_a_bits_address; 
  assign buffer_auto_in_a_bits_mask = atomics_auto_out_a_bits_mask; 
  assign buffer_auto_in_a_bits_data = atomics_auto_out_a_bits_data; 
  assign buffer_auto_in_a_bits_corrupt = atomics_auto_out_a_bits_corrupt; 
  assign buffer_auto_in_d_ready = atomics_auto_out_d_ready; 
  assign buffer_auto_out_a_ready = out_xbar_auto_in_a_ready; 
  assign buffer_auto_out_d_valid = out_xbar_auto_in_d_valid; 
  assign buffer_auto_out_d_bits_opcode = out_xbar_auto_in_d_bits_opcode; 
  assign buffer_auto_out_d_bits_param = out_xbar_auto_in_d_bits_param; 
  assign buffer_auto_out_d_bits_size = out_xbar_auto_in_d_bits_size; 
  assign buffer_auto_out_d_bits_source = out_xbar_auto_in_d_bits_source; 
  assign buffer_auto_out_d_bits_sink = out_xbar_auto_in_d_bits_sink; 
  assign buffer_auto_out_d_bits_denied = out_xbar_auto_in_d_bits_denied; 
  assign buffer_auto_out_d_bits_data = out_xbar_auto_in_d_bits_data; 
  assign buffer_auto_out_d_bits_corrupt = out_xbar_auto_in_d_bits_corrupt; 
  assign atomics_clock = clock; 
  assign atomics_reset = reset; 
  assign atomics_auto_in_a_valid = in_xbar_auto_out_a_valid; 
  assign atomics_auto_in_a_bits_opcode = in_xbar_auto_out_a_bits_opcode; 
  assign atomics_auto_in_a_bits_param = in_xbar_auto_out_a_bits_param; 
  assign atomics_auto_in_a_bits_size = in_xbar_auto_out_a_bits_size; 
  assign atomics_auto_in_a_bits_source = in_xbar_auto_out_a_bits_source; 
  assign atomics_auto_in_a_bits_address = in_xbar_auto_out_a_bits_address; 
  assign atomics_auto_in_a_bits_mask = in_xbar_auto_out_a_bits_mask; 
  assign atomics_auto_in_a_bits_data = in_xbar_auto_out_a_bits_data; 
  assign atomics_auto_in_a_bits_corrupt = in_xbar_auto_out_a_bits_corrupt; 
  assign atomics_auto_in_d_ready = in_xbar_auto_out_d_ready; 
  assign atomics_auto_out_a_ready = buffer_auto_in_a_ready; 
  assign atomics_auto_out_d_valid = buffer_auto_in_d_valid; 
  assign atomics_auto_out_d_bits_opcode = buffer_auto_in_d_bits_opcode; 
  assign atomics_auto_out_d_bits_param = buffer_auto_in_d_bits_param; 
  assign atomics_auto_out_d_bits_size = buffer_auto_in_d_bits_size; 
  assign atomics_auto_out_d_bits_source = buffer_auto_in_d_bits_source; 
  assign atomics_auto_out_d_bits_sink = buffer_auto_in_d_bits_sink; 
  assign atomics_auto_out_d_bits_denied = buffer_auto_in_d_bits_denied; 
  assign atomics_auto_out_d_bits_data = buffer_auto_in_d_bits_data; 
  assign atomics_auto_out_d_bits_corrupt = buffer_auto_in_d_bits_corrupt; 
  assign buffer_1_clock = clock; 
  assign buffer_1_reset = reset; 
  assign buffer_1_auto_in_a_valid = auto_from_sbus_in_a_valid; 
  assign buffer_1_auto_in_a_bits_opcode = auto_from_sbus_in_a_bits_opcode; 
  assign buffer_1_auto_in_a_bits_param = auto_from_sbus_in_a_bits_param; 
  assign buffer_1_auto_in_a_bits_size = auto_from_sbus_in_a_bits_size; 
  assign buffer_1_auto_in_a_bits_source = auto_from_sbus_in_a_bits_source; 
  assign buffer_1_auto_in_a_bits_address = auto_from_sbus_in_a_bits_address; 
  assign buffer_1_auto_in_a_bits_mask = auto_from_sbus_in_a_bits_mask; 
  assign buffer_1_auto_in_a_bits_data = auto_from_sbus_in_a_bits_data; 
  assign buffer_1_auto_in_a_bits_corrupt = auto_from_sbus_in_a_bits_corrupt; 
  assign buffer_1_auto_in_d_ready = auto_from_sbus_in_d_ready; 
  assign buffer_1_auto_out_a_ready = in_xbar_auto_in_a_ready; 
  assign buffer_1_auto_out_d_valid = in_xbar_auto_in_d_valid; 
  assign buffer_1_auto_out_d_bits_opcode = in_xbar_auto_in_d_bits_opcode; 
  assign buffer_1_auto_out_d_bits_param = in_xbar_auto_in_d_bits_param; 
  assign buffer_1_auto_out_d_bits_size = in_xbar_auto_in_d_bits_size; 
  assign buffer_1_auto_out_d_bits_source = in_xbar_auto_in_d_bits_source; 
  assign buffer_1_auto_out_d_bits_sink = in_xbar_auto_in_d_bits_sink; 
  assign buffer_1_auto_out_d_bits_denied = in_xbar_auto_in_d_bits_denied; 
  assign buffer_1_auto_out_d_bits_data = in_xbar_auto_in_d_bits_data; 
  assign buffer_1_auto_out_d_bits_corrupt = in_xbar_auto_in_d_bits_corrupt; 
  assign coupler_to_bus_named_pbus_clock = clock; 
  assign coupler_to_bus_named_pbus_reset = reset; 
  assign coupler_to_bus_named_pbus_auto_widget_in_a_valid = out_xbar_auto_out_0_a_valid; 
  assign coupler_to_bus_named_pbus_auto_widget_in_a_bits_opcode = out_xbar_auto_out_0_a_bits_opcode; 
  assign coupler_to_bus_named_pbus_auto_widget_in_a_bits_param = out_xbar_auto_out_0_a_bits_param; 
  assign coupler_to_bus_named_pbus_auto_widget_in_a_bits_size = out_xbar_auto_out_0_a_bits_size; 
  assign coupler_to_bus_named_pbus_auto_widget_in_a_bits_source = out_xbar_auto_out_0_a_bits_source; 
  assign coupler_to_bus_named_pbus_auto_widget_in_a_bits_address = out_xbar_auto_out_0_a_bits_address; 
  assign coupler_to_bus_named_pbus_auto_widget_in_a_bits_mask = out_xbar_auto_out_0_a_bits_mask; 
  assign coupler_to_bus_named_pbus_auto_widget_in_a_bits_data = out_xbar_auto_out_0_a_bits_data; 
  assign coupler_to_bus_named_pbus_auto_widget_in_a_bits_corrupt = out_xbar_auto_out_0_a_bits_corrupt; 
  assign coupler_to_bus_named_pbus_auto_widget_in_d_ready = out_xbar_auto_out_0_d_ready; 
  assign coupler_to_bus_named_pbus_auto_from_cbus_out_a_ready = auto_coupler_to_bus_named_pbus_from_cbus_out_a_ready; 
  assign coupler_to_bus_named_pbus_auto_from_cbus_out_d_valid = auto_coupler_to_bus_named_pbus_from_cbus_out_d_valid; 
  assign coupler_to_bus_named_pbus_auto_from_cbus_out_d_bits_opcode = auto_coupler_to_bus_named_pbus_from_cbus_out_d_bits_opcode; 
  assign coupler_to_bus_named_pbus_auto_from_cbus_out_d_bits_param = auto_coupler_to_bus_named_pbus_from_cbus_out_d_bits_param; 
  assign coupler_to_bus_named_pbus_auto_from_cbus_out_d_bits_size = auto_coupler_to_bus_named_pbus_from_cbus_out_d_bits_size; 
  assign coupler_to_bus_named_pbus_auto_from_cbus_out_d_bits_source = auto_coupler_to_bus_named_pbus_from_cbus_out_d_bits_source; 
  assign coupler_to_bus_named_pbus_auto_from_cbus_out_d_bits_sink = auto_coupler_to_bus_named_pbus_from_cbus_out_d_bits_sink; 
  assign coupler_to_bus_named_pbus_auto_from_cbus_out_d_bits_denied = auto_coupler_to_bus_named_pbus_from_cbus_out_d_bits_denied; 
  assign coupler_to_bus_named_pbus_auto_from_cbus_out_d_bits_data = auto_coupler_to_bus_named_pbus_from_cbus_out_d_bits_data; 
  assign coupler_to_bus_named_pbus_auto_from_cbus_out_d_bits_corrupt = auto_coupler_to_bus_named_pbus_from_cbus_out_d_bits_corrupt; 
  assign coupler_to_slave_named_plic_clock = clock; 
  assign coupler_to_slave_named_plic_reset = reset; 
  assign coupler_to_slave_named_plic_auto_buffer_in_a_valid = out_xbar_auto_out_1_a_valid; 
  assign coupler_to_slave_named_plic_auto_buffer_in_a_bits_opcode = out_xbar_auto_out_1_a_bits_opcode; 
  assign coupler_to_slave_named_plic_auto_buffer_in_a_bits_param = out_xbar_auto_out_1_a_bits_param; 
  assign coupler_to_slave_named_plic_auto_buffer_in_a_bits_size = out_xbar_auto_out_1_a_bits_size; 
  assign coupler_to_slave_named_plic_auto_buffer_in_a_bits_source = out_xbar_auto_out_1_a_bits_source; 
  assign coupler_to_slave_named_plic_auto_buffer_in_a_bits_address = out_xbar_auto_out_1_a_bits_address; 
  assign coupler_to_slave_named_plic_auto_buffer_in_a_bits_mask = out_xbar_auto_out_1_a_bits_mask; 
  assign coupler_to_slave_named_plic_auto_buffer_in_a_bits_data = out_xbar_auto_out_1_a_bits_data; 
  assign coupler_to_slave_named_plic_auto_buffer_in_a_bits_corrupt = out_xbar_auto_out_1_a_bits_corrupt; 
  assign coupler_to_slave_named_plic_auto_buffer_in_d_ready = out_xbar_auto_out_1_d_ready; 
  assign coupler_to_slave_named_plic_auto_fragmenter_out_a_ready = auto_coupler_to_slave_named_plic_fragmenter_out_a_ready; 
  assign coupler_to_slave_named_plic_auto_fragmenter_out_d_valid = auto_coupler_to_slave_named_plic_fragmenter_out_d_valid; 
  assign coupler_to_slave_named_plic_auto_fragmenter_out_d_bits_opcode = auto_coupler_to_slave_named_plic_fragmenter_out_d_bits_opcode; 
  assign coupler_to_slave_named_plic_auto_fragmenter_out_d_bits_size = auto_coupler_to_slave_named_plic_fragmenter_out_d_bits_size; 
  assign coupler_to_slave_named_plic_auto_fragmenter_out_d_bits_source = auto_coupler_to_slave_named_plic_fragmenter_out_d_bits_source; 
  assign coupler_to_slave_named_plic_auto_fragmenter_out_d_bits_data = auto_coupler_to_slave_named_plic_fragmenter_out_d_bits_data; 
  assign coupler_to_slave_named_clint_clock = clock; 
  assign coupler_to_slave_named_clint_reset = reset; 
  assign coupler_to_slave_named_clint_auto_buffer_in_a_valid = out_xbar_auto_out_2_a_valid; 
  assign coupler_to_slave_named_clint_auto_buffer_in_a_bits_opcode = out_xbar_auto_out_2_a_bits_opcode; 
  assign coupler_to_slave_named_clint_auto_buffer_in_a_bits_param = out_xbar_auto_out_2_a_bits_param; 
  assign coupler_to_slave_named_clint_auto_buffer_in_a_bits_size = out_xbar_auto_out_2_a_bits_size; 
  assign coupler_to_slave_named_clint_auto_buffer_in_a_bits_source = out_xbar_auto_out_2_a_bits_source; 
  assign coupler_to_slave_named_clint_auto_buffer_in_a_bits_address = out_xbar_auto_out_2_a_bits_address; 
  assign coupler_to_slave_named_clint_auto_buffer_in_a_bits_mask = out_xbar_auto_out_2_a_bits_mask; 
  assign coupler_to_slave_named_clint_auto_buffer_in_a_bits_data = out_xbar_auto_out_2_a_bits_data; 
  assign coupler_to_slave_named_clint_auto_buffer_in_a_bits_corrupt = out_xbar_auto_out_2_a_bits_corrupt; 
  assign coupler_to_slave_named_clint_auto_buffer_in_d_ready = out_xbar_auto_out_2_d_ready; 
  assign coupler_to_slave_named_clint_auto_fragmenter_out_a_ready = auto_coupler_to_slave_named_clint_fragmenter_out_a_ready; 
  assign coupler_to_slave_named_clint_auto_fragmenter_out_d_valid = auto_coupler_to_slave_named_clint_fragmenter_out_d_valid; 
  assign coupler_to_slave_named_clint_auto_fragmenter_out_d_bits_opcode = auto_coupler_to_slave_named_clint_fragmenter_out_d_bits_opcode; 
  assign coupler_to_slave_named_clint_auto_fragmenter_out_d_bits_size = auto_coupler_to_slave_named_clint_fragmenter_out_d_bits_size; 
  assign coupler_to_slave_named_clint_auto_fragmenter_out_d_bits_source = auto_coupler_to_slave_named_clint_fragmenter_out_d_bits_source; 
  assign coupler_to_slave_named_clint_auto_fragmenter_out_d_bits_data = auto_coupler_to_slave_named_clint_fragmenter_out_d_bits_data; 
  assign coupler_to_slave_named_debug_clock = clock; 
  assign coupler_to_slave_named_debug_reset = reset; 
  assign coupler_to_slave_named_debug_auto_buffer_in_a_valid = out_xbar_auto_out_3_a_valid; 
  assign coupler_to_slave_named_debug_auto_buffer_in_a_bits_opcode = out_xbar_auto_out_3_a_bits_opcode; 
  assign coupler_to_slave_named_debug_auto_buffer_in_a_bits_param = out_xbar_auto_out_3_a_bits_param; 
  assign coupler_to_slave_named_debug_auto_buffer_in_a_bits_size = out_xbar_auto_out_3_a_bits_size; 
  assign coupler_to_slave_named_debug_auto_buffer_in_a_bits_source = out_xbar_auto_out_3_a_bits_source; 
  assign coupler_to_slave_named_debug_auto_buffer_in_a_bits_address = out_xbar_auto_out_3_a_bits_address; 
  assign coupler_to_slave_named_debug_auto_buffer_in_a_bits_mask = out_xbar_auto_out_3_a_bits_mask; 
  assign coupler_to_slave_named_debug_auto_buffer_in_a_bits_data = out_xbar_auto_out_3_a_bits_data; 
  assign coupler_to_slave_named_debug_auto_buffer_in_a_bits_corrupt = out_xbar_auto_out_3_a_bits_corrupt; 
  assign coupler_to_slave_named_debug_auto_buffer_in_d_ready = out_xbar_auto_out_3_d_ready; 
  assign coupler_to_slave_named_debug_auto_fragmenter_out_a_ready = auto_coupler_to_slave_named_debug_fragmenter_out_a_ready; 
  assign coupler_to_slave_named_debug_auto_fragmenter_out_d_valid = auto_coupler_to_slave_named_debug_fragmenter_out_d_valid; 
  assign coupler_to_slave_named_debug_auto_fragmenter_out_d_bits_opcode = auto_coupler_to_slave_named_debug_fragmenter_out_d_bits_opcode; 
  assign coupler_to_slave_named_debug_auto_fragmenter_out_d_bits_size = auto_coupler_to_slave_named_debug_fragmenter_out_d_bits_size; 
  assign coupler_to_slave_named_debug_auto_fragmenter_out_d_bits_source = auto_coupler_to_slave_named_debug_fragmenter_out_d_bits_source; 
  assign coupler_to_slave_named_debug_auto_fragmenter_out_d_bits_data = auto_coupler_to_slave_named_debug_fragmenter_out_d_bits_data; 
  assign coupler_to_slave_named_MaskROM_clock = clock; 
  assign coupler_to_slave_named_MaskROM_reset = reset; 
  assign coupler_to_slave_named_MaskROM_auto_buffer_in_a_valid = out_xbar_auto_out_4_a_valid; 
  assign coupler_to_slave_named_MaskROM_auto_buffer_in_a_bits_opcode = out_xbar_auto_out_4_a_bits_opcode; 
  assign coupler_to_slave_named_MaskROM_auto_buffer_in_a_bits_param = out_xbar_auto_out_4_a_bits_param; 
  assign coupler_to_slave_named_MaskROM_auto_buffer_in_a_bits_size = out_xbar_auto_out_4_a_bits_size; 
  assign coupler_to_slave_named_MaskROM_auto_buffer_in_a_bits_source = out_xbar_auto_out_4_a_bits_source; 
  assign coupler_to_slave_named_MaskROM_auto_buffer_in_a_bits_address = out_xbar_auto_out_4_a_bits_address; 
  assign coupler_to_slave_named_MaskROM_auto_buffer_in_a_bits_mask = out_xbar_auto_out_4_a_bits_mask; 
  assign coupler_to_slave_named_MaskROM_auto_buffer_in_a_bits_corrupt = out_xbar_auto_out_4_a_bits_corrupt; 
  assign coupler_to_slave_named_MaskROM_auto_buffer_in_d_ready = out_xbar_auto_out_4_d_ready; 
  assign coupler_to_slave_named_MaskROM_auto_fragmenter_out_a_ready = auto_coupler_to_slave_named_MaskROM_fragmenter_out_a_ready; 
  assign coupler_to_slave_named_MaskROM_auto_fragmenter_out_d_valid = auto_coupler_to_slave_named_MaskROM_fragmenter_out_d_valid; 
  assign coupler_to_slave_named_MaskROM_auto_fragmenter_out_d_bits_size = auto_coupler_to_slave_named_MaskROM_fragmenter_out_d_bits_size; 
  assign coupler_to_slave_named_MaskROM_auto_fragmenter_out_d_bits_source = auto_coupler_to_slave_named_MaskROM_fragmenter_out_d_bits_source; 
  assign coupler_to_slave_named_MaskROM_auto_fragmenter_out_d_bits_data = auto_coupler_to_slave_named_MaskROM_fragmenter_out_d_bits_data; 
endmodule
