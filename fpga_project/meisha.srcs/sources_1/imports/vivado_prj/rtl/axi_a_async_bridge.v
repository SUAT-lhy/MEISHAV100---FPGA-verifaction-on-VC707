
// }}}
module axi_a_async_bridge #(
		// {{{
		 parameter LGFIFO 		= 	4	// Async FIFO size (log_2)
		,parameter WIDTH_USER   = 	0 // same with tlul_pkg
		,parameter WIDTH_SIZE   = 	3
		,parameter WIDTH_BURST_LEN  = 	8
		,parameter WIDTH_BURST = 	2
		,parameter WIDTH_ID = 	4
		
		,parameter WIDTH_ADDRESS= 	32
		,parameter WIDTH_PAYLOAD=	WIDTH_USER + WIDTH_SIZE + WIDTH_BURST_LEN + WIDTH_BURST + WIDTH_ID + WIDTH_ADDRESS	// Bits per beat
		// }}}
	) (

		input	wire							S_CLK, S_ARESETN,
		//
		input	wire							S_VALID,
		output	wire							S_READY,
		`ifdef AXI_HAVE_USER
		input	wire	[WIDTH_USER-1:0]		s_user,
		`endif
		input	wire	[WIDTH_BURST_LEN-1:0]	s_len,
		input	wire	[WIDTH_SIZE-1:0]		s_size,
		input	wire	[WIDTH_BURST-1:0]		s_burst,
		input	wire	[WIDTH_ID-1:0]			s_id,
		input	wire	[WIDTH_ADDRESS-1:0]		s_address,

		input	wire							M_CLK, M_ARESETN,
		//
		output	wire							M_VALID,
		input	wire							M_READY,
		`ifdef AXI_HAVE_USER
		output	wire	[WIDTH_USER-1:0]		m_user,
		`endif
		output	wire	[WIDTH_BURST_LEN-1:0]	m_len,
		output	wire	[WIDTH_SIZE-1:0]		m_size,
		output	wire	[WIDTH_BURST-1:0]		m_burst,
		output	wire	[WIDTH_ID-1:0]			m_id,
		output	wire	[WIDTH_ADDRESS-1:0]		m_address
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
			s_len, s_size, s_burst, s_id, s_address}),
		.o_wr_full(w_full),
		//
		.i_rclk(M_CLK),		
		.i_rd_reset_n(M_ARESETN),
		.i_rd(M_READY),
		.o_rd_data({
			`ifdef AXI_HAVE_USER
			m_user, 
			`endif
			m_len, m_size, m_burst, m_id, m_address}),
		.o_rd_empty(w_empty)
		// }}}
	);

	assign	M_VALID = !w_empty;
	assign	S_READY = (!w_full);
endmodule
