module Simple_Tile_X2X( 
  input         s_clock, 
  input         s_reset, 
  input         m_clock, 
  input         m_reset,
  input         auto_buffer_out_a_ready, 
  output        auto_buffer_out_a_valid, 
  output [2:0]  auto_buffer_out_a_bits_opcode, 
  output [2:0]  auto_buffer_out_a_bits_param, 
  output [2:0]  auto_buffer_out_a_bits_size, 
  output [1:0]  auto_buffer_out_a_bits_source, 
  output [37:0] auto_buffer_out_a_bits_address, 
  output [7:0]  auto_buffer_out_a_bits_mask, 
  output [63:0] auto_buffer_out_a_bits_data, 
  output        auto_buffer_out_a_bits_corrupt, 
  output        auto_buffer_out_b_ready, 
  input         auto_buffer_out_b_valid, 
  input  [2:0]  auto_buffer_out_b_bits_opcode, 
  input  [1:0]  auto_buffer_out_b_bits_param, 
  input  [2:0]  auto_buffer_out_b_bits_size, 
  input  [1:0]  auto_buffer_out_b_bits_source, 
  input  [37:0] auto_buffer_out_b_bits_address, 
  input  [7:0]  auto_buffer_out_b_bits_mask, 
  input         auto_buffer_out_b_bits_corrupt, 
  input         auto_buffer_out_c_ready, 
  output        auto_buffer_out_c_valid, 
  output [2:0]  auto_buffer_out_c_bits_opcode, 
  output [2:0]  auto_buffer_out_c_bits_param, 
  output [2:0]  auto_buffer_out_c_bits_size, 
  output [1:0]  auto_buffer_out_c_bits_source, 
  output [37:0] auto_buffer_out_c_bits_address, 
  output [63:0] auto_buffer_out_c_bits_data, 
  output        auto_buffer_out_c_bits_corrupt, 
  output        auto_buffer_out_d_ready, 
  input         auto_buffer_out_d_valid, 
  input  [2:0]  auto_buffer_out_d_bits_opcode, 
  input  [1:0]  auto_buffer_out_d_bits_param, 
  input  [2:0]  auto_buffer_out_d_bits_size, 
  input  [1:0]  auto_buffer_out_d_bits_source, 
  input  [2:0]  auto_buffer_out_d_bits_sink, 
  input         auto_buffer_out_d_bits_denied, 
  input  [63:0] auto_buffer_out_d_bits_data, 
  input         auto_buffer_out_d_bits_corrupt, 
  input         auto_buffer_out_e_ready, 
  output        auto_buffer_out_e_valid, 
  output [2:0]  auto_buffer_out_e_bits_sink, 
  output        auto_tl_master_xing_in_a_ready, 
  input         auto_tl_master_xing_in_a_valid, 
  input  [2:0]  auto_tl_master_xing_in_a_bits_opcode, 
  input  [2:0]  auto_tl_master_xing_in_a_bits_param, 
  input  [2:0]  auto_tl_master_xing_in_a_bits_size, 
  input  [1:0]  auto_tl_master_xing_in_a_bits_source, 
  input  [37:0] auto_tl_master_xing_in_a_bits_address, 
  input  [7:0]  auto_tl_master_xing_in_a_bits_mask, 
  input  [63:0] auto_tl_master_xing_in_a_bits_data, 
  input         auto_tl_master_xing_in_a_bits_corrupt, 
  input         auto_tl_master_xing_in_b_ready, 
  output        auto_tl_master_xing_in_b_valid, 
  output [2:0]  auto_tl_master_xing_in_b_bits_opcode, 
  output [1:0]  auto_tl_master_xing_in_b_bits_param, 
  output [2:0]  auto_tl_master_xing_in_b_bits_size, 
  output [1:0]  auto_tl_master_xing_in_b_bits_source, 
  output [37:0] auto_tl_master_xing_in_b_bits_address, 
  output [7:0]  auto_tl_master_xing_in_b_bits_mask, 
  output        auto_tl_master_xing_in_b_bits_corrupt, 
  output        auto_tl_master_xing_in_c_ready, 
  input         auto_tl_master_xing_in_c_valid, 
  input  [2:0]  auto_tl_master_xing_in_c_bits_opcode, 
  input  [2:0]  auto_tl_master_xing_in_c_bits_param, 
  input  [2:0]  auto_tl_master_xing_in_c_bits_size, 
  input  [1:0]  auto_tl_master_xing_in_c_bits_source, 
  input  [37:0] auto_tl_master_xing_in_c_bits_address, 
  input  [63:0] auto_tl_master_xing_in_c_bits_data, 
  input         auto_tl_master_xing_in_c_bits_corrupt, 
  input         auto_tl_master_xing_in_d_ready, 
  output        auto_tl_master_xing_in_d_valid, 
  output [2:0]  auto_tl_master_xing_in_d_bits_opcode, 
  output [1:0]  auto_tl_master_xing_in_d_bits_param, 
  output [2:0]  auto_tl_master_xing_in_d_bits_size, 
  output [1:0]  auto_tl_master_xing_in_d_bits_source, 
  output [2:0]  auto_tl_master_xing_in_d_bits_sink, 
  output        auto_tl_master_xing_in_d_bits_denied, 
  output [63:0] auto_tl_master_xing_in_d_bits_data, 
  output        auto_tl_master_xing_in_d_bits_corrupt, 
  output        auto_tl_master_xing_in_e_ready, 
  input         auto_tl_master_xing_in_e_valid, 
  input  [2:0]  auto_tl_master_xing_in_e_bits_sink 
);


	tl_async_bridge #(
       .A_LGFIFO(3)
      ,.B_LGFIFO(2)
      ,.C_LGFIFO(3)
      ,.D_LGFIFO(2)
      ,.E_LGFIFO(3)
	) u_tl_async_bridge (

         .s_clk(s_clock) 
        ,.s_reset_n(~s_reset)
        ,.m_clk(m_clock) 
        ,.m_reset_n(~m_reset)

        ,.s_a_ready(auto_tl_master_xing_in_a_ready)
        ,.s_a_valid(auto_tl_master_xing_in_a_valid)
        ,.s_a_bits_opcode(auto_tl_master_xing_in_a_bits_opcode)
        ,.s_a_bits_param(auto_tl_master_xing_in_a_bits_param)
        ,.s_a_bits_size(auto_tl_master_xing_in_a_bits_size)
        ,.s_a_bits_source(auto_tl_master_xing_in_a_bits_source)
        ,.s_a_bits_address(auto_tl_master_xing_in_a_bits_address)
        ,.s_a_bits_mask(auto_tl_master_xing_in_a_bits_mask)
        ,.s_a_bits_data(auto_tl_master_xing_in_a_bits_data)
        ,.s_a_bits_corrupt(auto_tl_master_xing_in_a_bits_corrupt)
        ,.s_b_ready(auto_tl_master_xing_in_b_ready)
        ,.s_b_valid(auto_tl_master_xing_in_b_valid)
        ,.s_b_bits_opcode(auto_tl_master_xing_in_b_bits_opcode)
        ,.s_b_bits_param(auto_tl_master_xing_in_b_bits_param)
        ,.s_b_bits_size(auto_tl_master_xing_in_b_bits_size)
        ,.s_b_bits_source(auto_tl_master_xing_in_b_bits_source)
        ,.s_b_bits_address(auto_tl_master_xing_in_b_bits_address)
        ,.s_b_bits_mask(auto_tl_master_xing_in_b_bits_mask)
        ,.s_b_bits_corrupt(auto_tl_master_xing_in_b_bits_corrupt)
        ,.s_c_ready(auto_tl_master_xing_in_c_ready)
        ,.s_c_valid(auto_tl_master_xing_in_c_valid)
        ,.s_c_bits_opcode(auto_tl_master_xing_in_c_bits_opcode)
        ,.s_c_bits_param(auto_tl_master_xing_in_c_bits_param)
        ,.s_c_bits_size(auto_tl_master_xing_in_c_bits_size)
        ,.s_c_bits_source(auto_tl_master_xing_in_c_bits_source)
        ,.s_c_bits_address(auto_tl_master_xing_in_c_bits_address)
        ,.s_c_bits_data(auto_tl_master_xing_in_c_bits_data)
        ,.s_c_bits_corrupt(auto_tl_master_xing_in_c_bits_corrupt)
        ,.s_d_ready(auto_tl_master_xing_in_d_ready)
        ,.s_d_valid(auto_tl_master_xing_in_d_valid)
        ,.s_d_bits_opcode(auto_tl_master_xing_in_d_bits_opcode)
        ,.s_d_bits_param(auto_tl_master_xing_in_d_bits_param)
        ,.s_d_bits_size(auto_tl_master_xing_in_d_bits_size)
        ,.s_d_bits_source(auto_tl_master_xing_in_d_bits_source)
        ,.s_d_bits_sink(auto_tl_master_xing_in_d_bits_sink)
        ,.s_d_bits_denied(auto_tl_master_xing_in_d_bits_denied)
        ,.s_d_bits_data(auto_tl_master_xing_in_d_bits_data)
        ,.s_d_bits_corrupt(auto_tl_master_xing_in_d_bits_corrupt)
        ,.s_e_ready(auto_tl_master_xing_in_e_ready)
        ,.s_e_valid(auto_tl_master_xing_in_e_valid)
        ,.s_e_bits_sink(auto_tl_master_xing_in_e_bits_sink)

        ,.m_a_ready(auto_buffer_out_a_ready)
        ,.m_a_valid(auto_buffer_out_a_valid)
        ,.m_a_bits_opcode(auto_buffer_out_a_bits_opcode)
        ,.m_a_bits_param(auto_buffer_out_a_bits_param)
        ,.m_a_bits_size(auto_buffer_out_a_bits_size)
        ,.m_a_bits_source(auto_buffer_out_a_bits_source)
        ,.m_a_bits_address(auto_buffer_out_a_bits_address)
        ,.m_a_bits_mask(auto_buffer_out_a_bits_mask)
        ,.m_a_bits_data(auto_buffer_out_a_bits_data)
        ,.m_a_bits_corrupt(auto_buffer_out_a_bits_corrupt)
        ,.m_b_ready(auto_buffer_out_b_ready)
        ,.m_b_valid(auto_buffer_out_b_valid)
        ,.m_b_bits_opcode(auto_buffer_out_b_bits_opcode)
        ,.m_b_bits_param(auto_buffer_out_b_bits_param)
        ,.m_b_bits_size(auto_buffer_out_b_bits_size)
        ,.m_b_bits_source(auto_buffer_out_b_bits_source)
        ,.m_b_bits_address(auto_buffer_out_b_bits_address)
        ,.m_b_bits_mask(auto_buffer_out_b_bits_mask)
        ,.m_b_bits_corrupt(auto_buffer_out_b_bits_corrupt)
        ,.m_c_ready(auto_buffer_out_c_ready)
        ,.m_c_valid(auto_buffer_out_c_valid)
        ,.m_c_bits_opcode(auto_buffer_out_c_bits_opcode)
        ,.m_c_bits_param(auto_buffer_out_c_bits_param)
        ,.m_c_bits_size(auto_buffer_out_c_bits_size)
        ,.m_c_bits_source(auto_buffer_out_c_bits_source)
        ,.m_c_bits_address(auto_buffer_out_c_bits_address)
        ,.m_c_bits_data(auto_buffer_out_c_bits_data)
        ,.m_c_bits_corrupt(auto_buffer_out_c_bits_corrupt)
        ,.m_d_ready(auto_buffer_out_d_ready)
        ,.m_d_valid(auto_buffer_out_d_valid)
        ,.m_d_bits_opcode(auto_buffer_out_d_bits_opcode)
        ,.m_d_bits_param(auto_buffer_out_d_bits_param)
        ,.m_d_bits_size(auto_buffer_out_d_bits_size)
        ,.m_d_bits_source(auto_buffer_out_d_bits_source)
        ,.m_d_bits_sink(auto_buffer_out_d_bits_sink)
        ,.m_d_bits_denied(auto_buffer_out_d_bits_denied)
        ,.m_d_bits_data(auto_buffer_out_d_bits_data)
        ,.m_d_bits_corrupt(auto_buffer_out_d_bits_corrupt)
        ,.m_e_ready(auto_buffer_out_e_ready)
        ,.m_e_valid(auto_buffer_out_e_valid)
        ,.m_e_bits_sink(auto_buffer_out_e_bits_sink)	
    
	);


endmodule
