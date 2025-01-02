
// }}}
module axi_w_async_bridge #(
		// {{{
		 parameter LGFIFO 		= 	4	// Async FIFO size (log_2)
		,parameter WIDTH_USER   = 	0 // same with tlul_pkg
		,parameter WIDTH_ID = 	4
		
		,parameter WIDTH_DATA   = 	64
		,parameter WIDTH_MASK   = 	WIDTH_DATA/8
		,parameter WIDTH_PAYLOAD=	WIDTH_USER + 1 + WIDTH_MASK + WIDTH_DATA	// Bits per beat
		// }}}
	) (

		input	wire							S_CLK, S_ARESETN,
		//
		input	wire							S_VALID,
		output	wire							S_READY,
		input	wire							s_last,
		`ifdef AXI_HAVE_USER
		input	wire	[WIDTH_USER-1:0]		s_user,
		`endif
		input	wire	[WIDTH_MASK-1:0]		s_mask,
		input	wire	[WIDTH_DATA-1:0]		s_data,

		input	wire							M_CLK, M_ARESETN,
		//
		output	wire							M_VALID,
		input	wire							M_READY,
		output	wire							m_last,
		`ifdef AXI_HAVE_USER
		output	wire	[WIDTH_USER-1:0]		m_user,
		`endif
		output	wire	[WIDTH_MASK-1:0]		m_mask,
		output	wire	[WIDTH_DATA-1:0]		m_data
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
		.i_wr_data({
			`ifdef AXI_HAVE_USER
			s_user, 
			`endif
			s_last, s_mask, s_data }),
		.o_wr_full(w_full),
		//
		.i_rclk(M_CLK),		
		.i_rd_reset_n(M_ARESETN),
		.i_rd(M_READY),
		.o_rd_data({
			`ifdef AXI_HAVE_USER
			m_user, 
			`endif
			m_last, m_mask, m_data }),
		.o_rd_empty(w_empty)
		// }}}
	);

	assign	M_VALID = !w_empty;
	assign	S_READY = (!w_full);
endmodule
