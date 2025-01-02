
// }}}
module tl_uh_async_bridge #(
		// {{{
		 parameter A_LGFIFO 	= 	4
		,parameter D_LGFIFO 	= 	2
		,parameter WIDTH_SOURCE = 	4
		,parameter WIDTH_ADDRESS = 	32
		,parameter WIDTH_DATA    = 	64
		,parameter WIDTH_MASK   = 	WIDTH_DATA/8
		,parameter WIDTH_SIZE   = 	3
	) (

		input	wire							s_clk, s_reset_n,
		input	wire							m_clk, m_reset_n,
		//
		output wire       s_a_ready,
		input wire        s_a_valid,
		input wire [2:0]  s_a_bits_opcode,
		input wire [2:0]  s_a_bits_param,
		input wire [WIDTH_SIZE-1:0]  s_a_bits_size,
		input wire [WIDTH_SOURCE-1:0]  s_a_bits_source,
		input wire [WIDTH_ADDRESS-1:0] s_a_bits_address,
		input wire [WIDTH_MASK-1:0]  s_a_bits_mask,
		input wire [WIDTH_DATA-1:0] s_a_bits_data,
		input wire        s_a_bits_corrupt,
		input wire        s_d_ready,
		output wire         s_d_valid,
		output wire  [2:0]  s_d_bits_opcode,
		output wire  [1:0]  s_d_bits_param,
		output wire  [WIDTH_SIZE-1:0]  s_d_bits_size,
		output wire  [WIDTH_SOURCE-1:0]  s_d_bits_source,
		output wire  [2:0]  s_d_bits_sink,
		output wire         s_d_bits_denied,
		output wire  [WIDTH_DATA-1:0] s_d_bits_data,
		output wire         s_d_bits_corrupt,

		input wire         m_a_ready,
		output wire        m_a_valid,
		output wire [2:0]  m_a_bits_opcode,
		output wire [2:0]  m_a_bits_param,
		output wire [WIDTH_SIZE-1:0]  m_a_bits_size,
		output wire [WIDTH_SOURCE-1:0]  m_a_bits_source,
		output wire [WIDTH_ADDRESS-1:0] m_a_bits_address,
		output wire [WIDTH_MASK-1:0]  m_a_bits_mask,
		output wire [WIDTH_DATA-1:0] m_a_bits_data,
		output wire        m_a_bits_corrupt,
		output wire        m_d_ready,
		input wire         m_d_valid,
		input wire  [2:0]  m_d_bits_opcode,
		input wire  [1:0]  m_d_bits_param,
		input wire  [WIDTH_SIZE-1:0]  m_d_bits_size,
		input wire  [WIDTH_SOURCE-1:0]  m_d_bits_source,
		input wire  [2:0]  m_d_bits_sink,
		input wire         m_d_bits_denied,
		input wire  [WIDTH_DATA-1:0] m_d_bits_data,
		input wire         m_d_bits_corrupt	
	);

	tl_a_async_bridge #(
		 .LGFIFO(A_LGFIFO)	
		,.WIDTH_USER(1)
		,.WIDTH_SIZE(WIDTH_SIZE)
		,.WIDTH_PARAM(3)
		,.WIDTH_SOURCE(WIDTH_SOURCE)
		
		,.WIDTH_ADDRESS(WIDTH_ADDRESS)
		,.WIDTH_DATA(WIDTH_DATA)
		) u_tl_a_async(

			.S_CLK(s_clk), 
			.S_ARESETN(s_reset_n),
			//
			.S_VALID(s_a_valid),
			.S_READY(s_a_ready),
			.s_opcode(s_a_bits_opcode),
			.s_param(s_a_bits_param),
			.s_size(s_a_bits_size),
			.s_source(s_a_bits_source),
			.s_address(s_a_bits_address),
			.s_mask(s_a_bits_mask),
			.s_data(s_a_bits_data),
			.s_corrupt(s_a_bits_corrupt),

			.M_CLK(m_clk), 
			.M_ARESETN(m_reset_n),
			//
			.M_VALID(m_a_valid),
			.M_READY(m_a_ready),
			.m_opcode(m_a_bits_opcode),
			.m_param(m_a_bits_param),
			.m_size(m_a_bits_size),
			.m_source(m_a_bits_source),
			.m_address(m_a_bits_address),
			.m_mask(m_a_bits_mask),
			.m_data(m_a_bits_data),
			.m_corrupt(m_a_bits_corrupt)
		);

	tl_d_async_bridge #(
		 .LGFIFO(D_LGFIFO)	
		,.WIDTH_USER(1)
		,.WIDTH_SIZE(WIDTH_SIZE)
		,.WIDTH_PARAM(2)
		,.WIDTH_SOURCE(WIDTH_SOURCE)
		
		,.WIDTH_SINK(3)
		,.WIDTH_DATA(WIDTH_DATA)
		) u_tl_d_async(

			.S_CLK(m_clk), 
			.S_ARESETN(m_reset_n),
			//
			.S_VALID(m_d_valid),
			.S_READY(m_d_ready),
			.s_opcode(m_d_bits_opcode),
			.s_param(m_d_bits_param),
			.s_size(m_d_bits_size),
			.s_source(m_d_bits_source),
			.s_sink(m_d_bits_sink),
			.s_denied(m_d_bits_denied),
			.s_data(m_d_bits_data),
			.s_corrupt(m_d_bits_corrupt),

			.M_CLK(s_clk), 
			.M_ARESETN(s_reset_n),
			//
			.M_VALID(s_d_valid),
			.M_READY(s_d_ready),
			.m_opcode(s_d_bits_opcode),
			.m_param(s_d_bits_param),
			.m_size(s_d_bits_size),
			.m_source(s_d_bits_source),
			.m_sink(s_d_bits_sink),
			.m_denied(s_d_bits_denied),
			.m_data(s_d_bits_data),
			.m_corrupt(s_d_bits_corrupt)
		);

endmodule
