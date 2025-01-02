
// }}}
module tl_d_async_bridge #(
		// {{{
		 parameter LGFIFO 		= 	4	// Async FIFO size (log_2)
		,parameter WIDTH_USER   = 	1 // same with tlul_pkg
		,parameter WIDTH_SIZE   = 	3
		,parameter WIDTH_PARAM  = 	3
		,parameter WIDTH_SOURCE = 	2
		
		,parameter WIDTH_ADDRESS= 	38
		,parameter WIDTH_SINK   = 	3
		,parameter WIDTH_DATA   = 	64
		,parameter WIDTH_MASK   = 	WIDTH_DATA/8
		,parameter WIDTH_PAYLOAD=	3 + WIDTH_PARAM+ WIDTH_SIZE + WIDTH_SOURCE + WIDTH_SINK + 1 + WIDTH_DATA + 1		// Bits per beat
		// }}}
	) (

		input	wire							S_CLK, S_ARESETN,
		//
		input	wire							S_VALID,
		output	wire							S_READY,
		input	wire	[3-1:0]					s_opcode,
		input	wire	[WIDTH_PARAM-1:0]		s_param,
		input	wire	[WIDTH_SIZE-1:0]		s_size,
		input	wire	[WIDTH_SOURCE-1:0]		s_source,
		input	wire	[WIDTH_SINK-1:0]		s_sink,
		input	wire				     		s_denied,
		input	wire	[WIDTH_DATA-1:0]		s_data,
		input	wire							s_corrupt,

		input	wire							M_CLK, M_ARESETN,
		//
		output	wire							M_VALID,
		input	wire							M_READY,
		output	wire	[3-1:0]					m_opcode,
		output	wire	[WIDTH_PARAM-1:0]		m_param,
		output	wire	[WIDTH_SIZE-1:0]		m_size,
		output	wire	[WIDTH_SOURCE-1:0]		m_source,
		output	wire	[WIDTH_SINK-1:0]		m_sink,
		output	wire				     		m_denied,
		output	wire	[WIDTH_DATA-1:0]		m_data,
		output	wire							m_corrupt
	);

	wire	w_full, w_empty;

	async_fifo #(
		.LGFIFO(LGFIFO),
		.WIDTH(WIDTH_PAYLOAD)
	) u_async_fifo (
		// {{{
		.i_wclk(S_CLK),		
		.i_wr_reset_n(S_ARESETN),
		.i_wr((S_VALID)),
		.i_wr_data({ s_opcode, s_param, s_size, s_source, s_sink, s_denied, s_data, s_corrupt }),
		.o_wr_full(w_full),
		//
		.i_rclk(M_CLK),		
		.i_rd_reset_n(M_ARESETN),
		.i_rd(M_READY),
		.o_rd_data({ m_opcode, m_param, m_size, m_source, m_sink, m_denied, m_data, m_corrupt }),
		.o_rd_empty(w_empty)
		// }}}
	);

	assign	M_VALID = !w_empty;
	assign	S_READY = (!w_full);
endmodule
