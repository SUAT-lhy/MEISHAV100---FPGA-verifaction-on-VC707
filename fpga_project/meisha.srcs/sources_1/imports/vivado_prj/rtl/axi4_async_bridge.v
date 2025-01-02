
// }}}
module axi4_async_bridge #(
		// {{{
		 parameter AW_LGFIFO 	= 	4	
		,parameter W_LGFIFO 	= 	2
		,parameter AR_LGFIFO 	= 	4
		,parameter B_LGFIFO 	= 	2
		,parameter R_LGFIFO 	= 	4

		,parameter WIDTH_SIZE   = 	3
		,parameter WIDTH_BURST_LEN  = 	8
		,parameter WIDTH_BURST 	= 	2

		,parameter WIDTH_ID 	= 	4
		,parameter WIDTH_RESP 	= 	2
		
		,parameter WIDTH_ADDRESS= 	32
		,parameter WIDTH_DATA   = 	64
		,parameter WIDTH_MASK   = 	WIDTH_DATA/8

	) (

		input	wire	  s_clk, 
		input	wire	  s_reset_n,
		input	wire	  m_clk, 
		input	wire	  m_reset_n,
		//
		output wire      					s_awready,
		input wire        					s_awvalid,
		`ifdef AXI_HAVE_USER
		input wire  	  					s_awuser,
		`endif
		input wire [WIDTH_SIZE-1:0]  		s_awsize,
		input wire [WIDTH_BURST_LEN-1:0]  	s_awlen,
		input wire [WIDTH_BURST-1:0]  		s_awburst,
		input wire [WIDTH_ADDRESS-1:0] 		s_awaddr,
		input wire [WIDTH_ID-1:0] 			s_awid,

		input wire [WIDTH_DATA-1:0]  s_wdata,
		input wire [WIDTH_MASK-1:0]  s_wstrb,
		input wire  	 			 s_wlast,
		output wire       			 s_wready,
		input wire        			 s_wvalid,
		`ifdef AXI_HAVE_USER
		input wire  	 		 	 s_wuser,
		`endif

		output wire       					s_arready,
		input wire        					s_arvalid,
		`ifdef AXI_HAVE_USER
		input wire  	 	 				s_aruser,
		`endif
		input wire [WIDTH_SIZE-1:0]  		s_arsize,
		input wire [WIDTH_BURST_LEN-1:0]  	s_arlen,
		input wire [WIDTH_BURST-1:0]  		s_arburst,
		input wire [WIDTH_ADDRESS-1:0] 		s_araddr,
		input wire [WIDTH_ID-1:0] 			s_arid,

		output wire [WIDTH_DATA-1:0] s_rdata,
		output wire [WIDTH_RESP-1:0] s_rresp,
		output wire [WIDTH_ID-1:0]   s_rid,
		output wire  	 			 s_rlast,
		input wire       			 s_rready,
		output wire        			 s_rvalid,
		`ifdef AXI_HAVE_USER
		output wire  	 	 	     s_ruser,
		`endif

		output wire [WIDTH_ID-1:0]   s_bid,
		output wire [WIDTH_RESP-1:0] s_bresp,
		input wire       			 s_bready,
		output wire        			 s_bvalid,
		`ifdef AXI_HAVE_USER
		output wire  	 	 	     s_buser,
		`endif
		
		// MASTER 
		input wire      					m_awready,
		output wire        					m_awvalid,
		`ifdef AXI_HAVE_USER
		output wire  	  					m_awuser,
		`endif
		output wire [WIDTH_SIZE-1:0]  		m_awsize,
		output wire [WIDTH_BURST_LEN-1:0]  	m_awlen,
		output wire [WIDTH_BURST-1:0]  		m_awburst,
		output wire [WIDTH_ADDRESS-1:0] 	m_awaddr,
		output wire [WIDTH_ID-1:0] 			m_awid,

		output wire [WIDTH_DATA-1:0]  m_wdata,
		output wire [WIDTH_MASK-1:0]  m_wstrb,
		output wire  	 			 m_wlast,
		input wire       			 m_wready,
		output wire        			 m_wvalid,
		`ifdef AXI_HAVE_USER
		output wire  	 		 	 m_wuser,
		`endif

		input wire       					m_arready,
		output wire        					m_arvalid,
		`ifdef AXI_HAVE_USER
		output wire  	 	 				m_aruser,
		`endif
		output wire [WIDTH_SIZE-1:0]  		m_arsize,
		output wire [WIDTH_BURST_LEN-1:0]  	m_arlen,
		output wire [WIDTH_BURST-1:0]  		m_arburst,
		output wire [WIDTH_ADDRESS-1:0] 	m_araddr,
		output wire [WIDTH_ID-1:0] 			m_arid,

		input wire [WIDTH_DATA-1:0] m_rdata,
		input wire [WIDTH_RESP-1:0] m_rresp,
		input wire [WIDTH_ID-1:0]   m_rid,
		
		`ifdef AXI_HAVE_USER
		input wire  	 	 	     m_ruser,
		`endif
		input wire  	 			 m_rlast,
		output wire       			 m_rready,
		input wire        			 m_rvalid,

		input wire [WIDTH_ID-1:0]    m_bid,
		input wire [WIDTH_RESP-1:0]  m_bresp,
		output wire       			 m_bready,
		`ifdef AXI_HAVE_USER
		input wire  	 	 	     m_buser,
		`endif
		input wire        			 m_bvalid
	);

	axi_a_async_bridge #(
		 .LGFIFO(AW_LGFIFO)	
		,.WIDTH_SIZE(WIDTH_SIZE)
		,.WIDTH_BURST_LEN(WIDTH_BURST_LEN)
		,.WIDTH_BURST(WIDTH_BURST)
		,.WIDTH_ID(WIDTH_ID)
		
		,.WIDTH_ADDRESS(WIDTH_ADDRESS)
		) u_axi4_aw_async(

			.S_CLK(s_clk), 
			.S_ARESETN(s_reset_n),
			//
			.S_VALID(s_awvalid),
			.S_READY(s_awready),
			`ifdef AXI_HAVE_USER
			.s_user(s_awuser),
			`endif
			.s_len(s_awlen),
			.s_size(s_awsize),
			.s_burst(s_awburst),
			.s_address(s_awaddr),
			.s_id(s_awid),

			.M_CLK(m_clk), 
			.M_ARESETN(m_reset_n),
			//
			.M_VALID(m_awvalid),
			.M_READY(m_awready),
			`ifdef AXI_HAVE_USER
			.m_user(m_awuser),
			`endif
			.m_len(m_awlen),
			.m_size(m_awsize),
			.m_burst(m_awburst),
			.m_address(m_awaddr),
			.m_id(m_awid)
		);

	axi_a_async_bridge #(
		 .LGFIFO(AR_LGFIFO)
		,.WIDTH_SIZE(WIDTH_SIZE)
		,.WIDTH_BURST_LEN(WIDTH_BURST_LEN)
		,.WIDTH_BURST(WIDTH_BURST)
		,.WIDTH_ID(WIDTH_ID)
		
		,.WIDTH_ADDRESS(WIDTH_ADDRESS)
		) u_axi4_ar_async(

			.S_CLK(s_clk), 
			.S_ARESETN(s_reset_n),
			//
			.S_VALID(s_arvalid),
			.S_READY(s_arready),
			`ifdef AXI_HAVE_USER
			.s_user(s_aruser),
			`endif
			.s_len(s_arlen),
			.s_size(s_arsize),
			.s_burst(s_arburst),
			.s_address(s_araddr),
			.s_id(s_arid),

			.M_CLK(m_clk), 
			.M_ARESETN(m_reset_n),
			//
			.M_VALID(m_arvalid),
			.M_READY(m_arready),
			`ifdef AXI_HAVE_USER
			.m_user(m_aruser),
			`endif
			.m_len(m_arlen),
			.m_size(m_arsize),
			.m_burst(m_arburst),
			.m_address(m_araddr),
			.m_id(m_arid)
		);

	axi_w_async_bridge #(
		 .LGFIFO(W_LGFIFO)
		,.WIDTH_DATA(WIDTH_DATA)
		) u_axi4_w_async(

			.S_CLK(s_clk), 
			.S_ARESETN(s_reset_n),
			//
			.S_VALID(s_wvalid),
			.S_READY(s_wready),
			`ifdef AXI_HAVE_USER
			.s_user(s_wuser),
			`endif
			.s_mask(s_wstrb),
			.s_last(s_wlast),
			.s_data(s_wdata),

			.M_CLK(m_clk), 
			.M_ARESETN(m_reset_n),
			//
			.M_VALID(m_wvalid),
			.M_READY(m_wready),
			`ifdef AXI_HAVE_USER
			.m_user(m_wuser),
			`endif
			.m_mask(m_wstrb),
			.m_last(m_wlast),
			.m_data(m_wdata)
		);

	axi_r_async_bridge #(
		 .LGFIFO(R_LGFIFO)
		,.WIDTH_RESP(WIDTH_RESP)
		,.WIDTH_DATA(WIDTH_DATA)
		) u_axi_r_async(

			.S_CLK(m_clk), 
			.S_ARESETN(m_reset_n),
			//
			.S_VALID(m_rvalid),
			.S_READY(m_rready),
			`ifdef AXI_HAVE_USER
			.s_user(m_ruser),
			`endif
			.s_id(m_rid),
			.s_resp(m_rresp),
			.s_last(m_rlast),
			.s_data(m_rdata),

			.M_CLK(s_clk), 
			.M_ARESETN(s_reset_n),
			//
			.M_VALID(s_rvalid),
			.M_READY(s_rready),
			`ifdef AXI_HAVE_USER
			.m_user(s_ruser),
			`endif
			.m_id(s_rid),
			.m_resp(s_rresp),
			.m_last(s_rlast),
			.m_data(s_rdata)
		);
	

	axi_b_async_bridge #(
		 .LGFIFO(B_LGFIFO)
		,.WIDTH_RESP(WIDTH_RESP)
		,.WIDTH_ID(WIDTH_ID)
		) u_axi_b_async(

			.S_CLK(m_clk), 
			.S_ARESETN(m_reset_n),
			//
			.S_VALID(m_bvalid),
			.S_READY(m_bready),
			`ifdef AXI_HAVE_USER
			.s_user(m_buser),
			`endif
			.s_id(m_bid),
			.s_resp(m_bresp),

			.M_CLK(s_clk), 
			.M_ARESETN(s_reset_n),
			//
			.M_VALID(s_bvalid),
			.M_READY(s_bready),
			`ifdef AXI_HAVE_USER
			.m_user(s_buser),
			`endif
			.m_id(s_bid),
			.m_resp(s_bresp)
		);

endmodule
