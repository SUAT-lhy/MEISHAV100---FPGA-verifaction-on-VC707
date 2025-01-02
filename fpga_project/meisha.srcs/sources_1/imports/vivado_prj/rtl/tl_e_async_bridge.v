
// }}}
module tl_e_async_bridge #(
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
		,parameter WIDTH_PAYLOAD=	WIDTH_SINK		// Bits per beat
		// }}}
	) (

		input	wire							S_CLK, S_ARESETN,
		//
		input	wire							S_VALID,
		output	wire							S_READY,
		input	wire	[WIDTH_SINK-1:0]		s_sink,

		input	wire							M_CLK, M_ARESETN,
		//
		output	wire							M_VALID,
		input	wire							M_READY,
		output	wire	[WIDTH_SINK-1:0]		m_sink
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
		.i_wr_data({ s_sink }),
		.o_wr_full(w_full),
		//
		.i_rclk(M_CLK),		
		.i_rd_reset_n(M_ARESETN),
		.i_rd(M_READY),
		.o_rd_data({ m_sink }),
		.o_rd_empty(w_empty)
		// }}}
	);

	assign	M_VALID = !w_empty;
	assign	S_READY = (!w_full);
endmodule
