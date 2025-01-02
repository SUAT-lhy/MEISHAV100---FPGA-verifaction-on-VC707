module vc707mig1gb_chiplink ( 
  // inout  [63:0] ddr3_dq, 
  // inout  [7:0]  ddr3_dqs_n, 
  // inout  [7:0]  ddr3_dqs_p, 

  // tx dfx 
  output wire [31:0] transferDataReg,
  output wire        send_1p_valid,
  // rx dfx
  output wire [31:0] b2c_data_concat,
  output wire        b2c_data_valid,

  output [11:0]      device_temp, 

  input wire mig_input_takeover_en,

  input         chiplink_clock,
  input         chiplink_reset,

`ifdef CHIPLINK_CONNECT_DIRECT_TL
  output  widget_auto_in_a_ready,
  input  widget_auto_in_a_valid,
  input [2:0] widget_auto_in_a_bits_opcode,
  input [2:0] widget_auto_in_a_bits_size,
  input [3:0] widget_auto_in_a_bits_source,
  input [31:0] widget_auto_in_a_bits_address,
  input [7:0] widget_auto_in_a_bits_mask,
  input [63:0] widget_auto_in_a_bits_data,
  input  widget_auto_in_d_ready,
  output  widget_auto_in_d_valid,
  output [2:0] widget_auto_in_d_bits_opcode,
  output [2:0] widget_auto_in_d_bits_size,
  output [3:0] widget_auto_in_d_bits_source,
  output  widget_auto_in_d_bits_denied,
  output [63:0] widget_auto_in_d_bits_data,
  output  widget_auto_in_d_bits_corrupt,
`else
  output  s_axi_rvalid, 
  output  s_axi_rlast, 
  output [1:0] s_axi_rresp, 
  output [63:0] s_axi_rdata, 
  output [3:0] s_axi_rid, 
  input  s_axi_rready, 
  output  s_axi_arready, 
  input  s_axi_arvalid, 
  input [3:0] s_axi_arqos, 
  input [2:0] s_axi_arprot, 
  input [3:0] s_axi_arcache, 
  input  s_axi_arlock, 
  input [1:0] s_axi_arburst, 
  input [2:0] s_axi_arsize, 
  input [7:0] s_axi_arlen, 
  input [29:0] s_axi_araddr, 
  input [3:0] s_axi_arid, 
  output  s_axi_bvalid, 
  output [1:0] s_axi_bresp, 
  output [3:0] s_axi_bid, 
  input  s_axi_bready, 
  output  s_axi_wready, 
  input  s_axi_wvalid, 
  input  s_axi_wlast, 
  input [7:0] s_axi_wstrb, 
  input [63:0] s_axi_wdata, 
  output  s_axi_awready, 
  input  s_axi_awvalid, 
  input [3:0] s_axi_awqos, 
  input [2:0] s_axi_awprot, 
  input [3:0] s_axi_awcache, 
  input  s_axi_awlock, 
  input [1:0] s_axi_awburst, 
  input [2:0] s_axi_awsize, 
  input [7:0] s_axi_awlen, 
  input [29:0] s_axi_awaddr, 
  input [3:0] s_axi_awid, 
`endif
  output  app_zq_ack, 
  output  app_ref_ack, 
  output  app_sr_active, 
  // input  app_zq_req, 
  // input  app_ref_req, 
  // input  app_sr_req, 
  input  sys_rst, 
  output  init_calib_complete, 
  input  aresetn, 
  output  mmcm_locked, 
  output ui_clk_sync_rst, 
  output ui_clk, 
  input  sys_clk_i, 
  output  ddr3_odt, 
  output [7:0] ddr3_dm, 
  output  ddr3_cs_n, 
  output  ddr3_cke, 
  output  ddr3_ck_n, 
  output  ddr3_ck_p, 
  output  ddr3_reset_n, 
  output  ddr3_we_n, 
  output  ddr3_cas_n, 
  output  ddr3_ras_n, 
  output [2:0] ddr3_ba, 
  output [13:0] ddr3_addr 
  ,output  ddr_io_c2b_clk
  ,output  ddr_io_c2b_rst
  ,output  ddr_io_c2b_send
  ,output [7:0] ddr_io_c2b_data
  ,input  ddr_io_b2c_clk
  ,input  ddr_io_b2c_rst
  ,input  ddr_io_b2c_send
  ,input [7:0] ddr_io_b2c_data

  ,input  ddr_master_0_awready
  ,output  ddr_master_0_awvalid
  ,output [3:0] ddr_master_0_awid
  ,output [31:0] ddr_master_0_awaddr
  ,output [7:0] ddr_master_0_awlen
  ,output [2:0] ddr_master_0_awsize
  ,output [1:0] ddr_master_0_awburst
  ,input  ddr_master_0_wready
  ,output  ddr_master_0_wvalid
  ,output [63:0] ddr_master_0_wdata
  ,output [7:0] ddr_master_0_wstrb
  ,output  ddr_master_0_wlast
  ,output  ddr_master_0_bready
  ,input  ddr_master_0_bvalid
  ,input [3:0] ddr_master_0_bid
  ,input [1:0] ddr_master_0_bresp
  ,input  ddr_master_0_arready
  ,output  ddr_master_0_arvalid
  ,output [3:0] ddr_master_0_arid
  ,output [31:0] ddr_master_0_araddr
  ,output [7:0] ddr_master_0_arlen
  ,output [2:0] ddr_master_0_arsize
  ,output [1:0] ddr_master_0_arburst
  ,output  ddr_master_0_rready
  ,input  ddr_master_0_rvalid
  ,input [3:0] ddr_master_0_rid
  ,input [63:0] ddr_master_0_rdata
  ,input [1:0] ddr_master_0_rresp
  ,input  ddr_master_0_rlast 
  );


  wire  x2x_s_axi_rvalid; 
  wire  x2x_s_axi_rlast; 
  wire [1:0] x2x_s_axi_rresp; 
  wire [63:0] x2x_s_axi_rdata; 
  wire [3:0] x2x_s_axi_rid; 
  wire  x2x_s_axi_rready; 
  wire  x2x_s_axi_arready; 
  wire  x2x_s_axi_arvalid; 
  wire [3:0] x2x_s_axi_arqos; 
  wire [2:0] x2x_s_axi_arprot; 
  wire [3:0] x2x_s_axi_arcache; 
  wire  x2x_s_axi_arlock; 
  wire [1:0] x2x_s_axi_arburst; 
  wire [2:0] x2x_s_axi_arsize; 
  wire [7:0] x2x_s_axi_arlen; 
  wire [29:0] x2x_s_axi_araddr; 
  wire [3:0] x2x_s_axi_arid; 
  wire  x2x_s_axi_bvalid; 
  wire [1:0] x2x_s_axi_bresp; 
  wire [3:0] x2x_s_axi_bid; 
  wire  x2x_s_axi_bready; 
  wire  x2x_s_axi_wready; 
  wire  x2x_s_axi_wvalid; 
  wire  x2x_s_axi_wlast; 
  wire [7:0] x2x_s_axi_wstrb; 
  wire [63:0] x2x_s_axi_wdata; 
  wire  x2x_s_axi_awready; 
  wire  x2x_s_axi_awvalid; 
  wire [3:0] x2x_s_axi_awqos; 
  wire [2:0] x2x_s_axi_awprot; 
  wire [3:0] x2x_s_axi_awcache; 
  wire  x2x_s_axi_awlock; 
  wire [1:0] x2x_s_axi_awburst; 
  wire [2:0] x2x_s_axi_awsize; 
  wire [7:0] x2x_s_axi_awlen; 
  wire [29:0] x2x_s_axi_awaddr; 
  wire [3:0] x2x_s_axi_awid;


  wire  x2x_m_axi_awready;
  wire  x2x_m_axi_awvalid;
  wire  [3:0] x2x_m_axi_awid;
  wire  [31:0] x2x_m_axi_awaddr;
  wire  [7:0] x2x_m_axi_awlen;
  wire  [2:0] x2x_m_axi_awsize;
  wire  [1:0] x2x_m_axi_awburst;
  wire  x2x_m_axi_wready;
  wire  x2x_m_axi_wvalid;
  wire  [63:0] x2x_m_axi_wdata;
  wire  [7:0] x2x_m_axi_wstrb;
  wire  x2x_m_axi_wlast;
  wire  x2x_m_axi_bready;
  wire  x2x_m_axi_bvalid;
  wire [3:0] x2x_m_axi_bid;
  wire [1:0] x2x_m_axi_bresp;
  wire  x2x_m_axi_arready;
  wire  x2x_m_axi_arvalid;
  wire  [3:0] x2x_m_axi_arid;
  wire  [31:0] x2x_m_axi_araddr;
  wire  [7:0] x2x_m_axi_arlen;
  wire  [2:0] x2x_m_axi_arsize;
  wire  [1:0] x2x_m_axi_arburst;
  wire  x2x_m_axi_rready;
  wire  x2x_m_axi_rvalid;
  wire [3:0] x2x_m_axi_rid;
  wire [63:0] x2x_m_axi_rdata;
  wire [1:0] x2x_m_axi_rresp;
  wire  x2x_m_axi_rlast;


  assign ui_clk = sys_clk_i;
  assign ui_clk_sync_rst = sys_rst;


  assign device_temp = 0; 
 
  assign app_zq_ack = 0; 
  assign app_ref_ack = 0; 
  assign app_sr_active = 0; 
  assign init_calib_complete = 0; 
  assign mmcm_locked = 1;   // control soc rst , need be 1

  assign ddr3_odt = 0; 
  assign ddr3_dm = 0; 
  assign ddr3_cs_n = 0; 
  assign ddr3_cke = 0; 
  assign ddr3_ck_n = 0; 
  assign ddr3_ck_p = 0; 
  assign ddr3_reset_n = 1; 
  assign ddr3_we_n = 0; 
  assign ddr3_cas_n = 0; 
  assign ddr3_ras_n = 0; 
  assign ddr3_ba = 0; 
  assign ddr3_addr = 0; 

    // //   assign ui_clk_sync_rst = 0; 
    // //   assign ui_clk = 0; 
    // always #1ns ui_clk <= ~ui_clk;

    // initial begin
    //     ui_clk_sync_rst = 1;
    //     ui_clk = 0;
    //     #1000ns;
    //     ui_clk_sync_rst = 0;
    // end



  wire  chipLinkConverter_fpga_io_b2c_clk;
  wire  chipLinkConverter_fpga_io_b2c_rst;
  wire  chipLinkConverter_fpga_io_b2c_send;
  wire [7:0] chipLinkConverter_fpga_io_b2c_data;

  //wire [31:0]  chiplink_master_awaddr;
  //wire [31:0]  chiplink_slave_awaddr;

  //wire [31:0]  chiplink_master_araddr;
  //wire [31:0]  chiplink_slave_araddr;


  //assign ddr_master_0_awaddr = chiplink_master_awaddr;   // for master vip slave addr is legal, match memory backdorr load 
  //assign ddr_master_0_araddr =  chiplink_master_araddr;

  //assign chiplink_slave_awaddr = s_axi_awaddr;
  //assign chiplink_slave_araddr = s_axi_araddr;
`ifndef CHIPLINK_CONNECT_DIRECT_TL
  axi4_async_bridge #(
		// {{{
		 .AW_LGFIFO(3)	
		,.W_LGFIFO(2)
		,.AR_LGFIFO(2)
		,.B_LGFIFO(2)
		,.R_LGFIFO(2)

		,.WIDTH_SIZE(3)
		,.WIDTH_BURST_LEN(8)
		,.WIDTH_BURST(2)

		,.WIDTH_ID(4)
		,.WIDTH_RESP(2)
		
		,.WIDTH_ADDRESS(30)
		,.WIDTH_DATA(64)

  ) u_slave_axi4_async_bridge (

		.s_clk(sys_clk_i),
    .s_reset_n(~sys_rst),
		.m_clk(chiplink_clock),
    .m_reset_n(~chiplink_reset),
		//
		.s_awready(s_axi_awready),
		.s_awvalid(s_axi_awvalid),
		`ifdef AXI_HAVE_USER
		.s_awuser(s_axi_awuser),
    `endif
		.s_awsize(s_axi_awsize),
		.s_awlen(s_axi_awlen),
		.s_awburst(s_axi_awburst),
		.s_awaddr(s_axi_awaddr),
		.s_awid(s_axi_awid),

		.s_wdata(s_axi_wdata),
		.s_wstrb(s_axi_wstrb),
		.s_wlast(s_axi_wlast),
		.s_wready(s_axi_wready),
		.s_wvalid(s_axi_wvalid),
		`ifdef AXI_HAVE_USER
		.s_wuser(s_axi_wuser),
    `endif

		.s_arready(s_axi_arready),
		.s_arvalid(s_axi_arvalid),
		`ifdef AXI_HAVE_USER
		.s_aruser(s_axi_aruser),
    `endif
		.s_arsize(s_axi_arsize),
		.s_arlen(s_axi_arlen),
		.s_arburst(s_axi_arburst),
		.s_araddr(s_axi_araddr),
		.s_arid(s_axi_arid),

		.s_rdata(s_axi_rdata),
		.s_rresp(s_axi_rresp),
		.s_rid(s_axi_rid),
		.s_rlast(s_axi_rlast),
		.s_rready(s_axi_rready),
		.s_rvalid(s_axi_rvalid),

		.s_bid(s_axi_bid),
		.s_bresp(s_axi_bresp),
		.s_bready(s_axi_bready),
		.s_bvalid(s_axi_bvalid),
		
		// MASTER 
		.m_awready(x2x_s_axi_awready),
		.m_awvalid(x2x_s_axi_awvalid),
		`ifdef AXI_HAVE_USER
		.m_awuser(x2x_s_axi_awuser),
    `endif
		.m_awsize(x2x_s_axi_awsize),
		.m_awlen(x2x_s_axi_awlen),
		.m_awburst(x2x_s_axi_awburst),
		.m_awaddr(x2x_s_axi_awaddr),
		.m_awid(x2x_s_axi_awid),

		.m_wdata(x2x_s_axi_wdata),
		.m_wstrb(x2x_s_axi_wstrb),
		.m_wlast(x2x_s_axi_wlast),
		.m_wready(x2x_s_axi_wready),
		.m_wvalid(x2x_s_axi_wvalid),
		`ifdef AXI_HAVE_USER
		.m_wuser(x2x_s_axi_wuser),
    `endif

		.m_arready(x2x_s_axi_arready),
		.m_arvalid(x2x_s_axi_arvalid),
		`ifdef AXI_HAVE_USER
		.m_aruser(x2x_s_axi_aruser),
    `endif
		.m_arsize(x2x_s_axi_arsize),
		.m_arlen(x2x_s_axi_arlen),
		.m_arburst(x2x_s_axi_arburst),
		.m_araddr(x2x_s_axi_araddr),
		.m_arid(x2x_s_axi_arid),

		.m_rdata(x2x_s_axi_rdata),
		.m_rresp(x2x_s_axi_rresp),
		.m_rid(x2x_s_axi_rid),
		.m_rlast(x2x_s_axi_rlast),
		.m_rready(x2x_s_axi_rready),
		.m_rvalid(x2x_s_axi_rvalid),

		.m_bid(x2x_s_axi_bid),
		.m_bresp(x2x_s_axi_bresp),
		.m_bready(x2x_s_axi_bready),
		.m_bvalid(x2x_s_axi_bvalid)
	);
`else
  wire  widget_auto_in_x2x_a_ready;
  wire  widget_auto_in_x2x_a_valid;
  wire [2:0] widget_auto_in_x2x_a_bits_opcode;
  wire [2:0] widget_auto_in_x2x_a_bits_size;
  wire [3:0] widget_auto_in_x2x_a_bits_source;
  wire [31:0] widget_auto_in_x2x_a_bits_address;
  wire [7:0] widget_auto_in_x2x_a_bits_mask;
  wire [63:0] widget_auto_in_x2x_a_bits_data;
  wire  widget_auto_in_x2x_d_ready;
  wire  widget_auto_in_x2x_d_valid;
  wire [2:0] widget_auto_in_x2x_d_bits_opcode;
  wire [2:0] widget_auto_in_x2x_d_bits_size;
  wire [3:0] widget_auto_in_x2x_d_bits_source;
  wire  widget_auto_in_x2x_d_bits_denied;
  wire [63:0] widget_auto_in_x2x_d_bits_data;
  wire  widget_auto_in_x2x_d_bits_corrupt;

	tl_uh_async_bridge #(
       .A_LGFIFO(3)
      ,.D_LGFIFO(2)
      ,.WIDTH_SOURCE(4)
      ,.WIDTH_ADDRESS(32)
	) u_tl_uh_async_bridge (
         .s_clk(sys_clk_i) 
        ,.s_reset_n(~sys_rst)
        ,.m_clk(chiplink_clock) 
        ,.m_reset_n(~chiplink_reset)

        ,.s_a_ready(widget_auto_in_a_ready)
        ,.s_a_valid(widget_auto_in_a_valid)
        ,.s_a_bits_opcode(widget_auto_in_a_bits_opcode)
        ,.s_a_bits_param(3'b0)
        ,.s_a_bits_size(widget_auto_in_a_bits_size)
        ,.s_a_bits_source(widget_auto_in_a_bits_source)
        ,.s_a_bits_address(widget_auto_in_a_bits_address)
        ,.s_a_bits_mask(widget_auto_in_a_bits_mask)
        ,.s_a_bits_data(widget_auto_in_a_bits_data)
        ,.s_a_bits_corrupt(1'b0)
        ,.s_d_ready(widget_auto_in_d_ready)
        ,.s_d_valid(widget_auto_in_d_valid)
        ,.s_d_bits_opcode(widget_auto_in_d_bits_opcode)
        ,.s_d_bits_param()
        ,.s_d_bits_size(widget_auto_in_d_bits_size)
        ,.s_d_bits_source(widget_auto_in_d_bits_source)
        ,.s_d_bits_sink()
        ,.s_d_bits_denied(widget_auto_in_d_bits_denied)
        ,.s_d_bits_data(widget_auto_in_d_bits_data)
        ,.s_d_bits_corrupt(widget_auto_in_d_bits_corrupt)

        ,.m_a_ready(widget_auto_in_x2x_a_ready)
        ,.m_a_valid(widget_auto_in_x2x_a_valid)
        ,.m_a_bits_opcode(widget_auto_in_x2x_a_bits_opcode)
        ,.m_a_bits_param()
        ,.m_a_bits_size(widget_auto_in_x2x_a_bits_size)
        ,.m_a_bits_source(widget_auto_in_x2x_a_bits_source)
        ,.m_a_bits_address(widget_auto_in_x2x_a_bits_address)
        ,.m_a_bits_mask(widget_auto_in_x2x_a_bits_mask)
        ,.m_a_bits_data(widget_auto_in_x2x_a_bits_data)
        ,.m_a_bits_corrupt()
        ,.m_d_ready(widget_auto_in_x2x_d_ready)
        ,.m_d_valid(widget_auto_in_x2x_d_valid)
        ,.m_d_bits_opcode(widget_auto_in_x2x_d_bits_opcode)
        ,.m_d_bits_param(2'b0)
        ,.m_d_bits_size(widget_auto_in_x2x_d_bits_size)
        ,.m_d_bits_source(widget_auto_in_x2x_d_bits_source)
        ,.m_d_bits_sink(3'b0)
        ,.m_d_bits_denied(widget_auto_in_x2x_d_bits_denied)
        ,.m_d_bits_data(widget_auto_in_x2x_d_bits_data)
        ,.m_d_bits_corrupt(widget_auto_in_x2x_d_bits_corrupt)
    
	);

`endif

  axi4_async_bridge #(
		// {{{
		 .AW_LGFIFO(2)	
		,.W_LGFIFO(2)
		,.AR_LGFIFO(2)
		,.B_LGFIFO(3)
		,.R_LGFIFO(3)

		,.WIDTH_SIZE(3)
		,.WIDTH_BURST_LEN(8)
		,.WIDTH_BURST(2)

		,.WIDTH_ID(4)
		,.WIDTH_RESP(2)
		
		,.WIDTH_ADDRESS(32)
		,.WIDTH_DATA(64)

  ) u_master_axi4_async_bridge (

		.s_clk(chiplink_clock),
    .s_reset_n(~chiplink_reset),
		.m_clk(sys_clk_i),
    .m_reset_n(~sys_rst),
		//
		.s_awready(x2x_m_axi_awready),
		.s_awvalid(x2x_m_axi_awvalid),
		`ifdef AXI_HAVE_USER
		.s_awuser(x2x_m_axi_awuser),
    `endif
		.s_awsize(x2x_m_axi_awsize),
		.s_awlen(x2x_m_axi_awlen),
		.s_awburst(x2x_m_axi_awburst),
		.s_awaddr(x2x_m_axi_awaddr),
		.s_awid(x2x_m_axi_awid),

		.s_wdata(x2x_m_axi_wdata),
		.s_wstrb(x2x_m_axi_wstrb),
		.s_wlast(x2x_m_axi_wlast),
		.s_wready(x2x_m_axi_wready),
		.s_wvalid(x2x_m_axi_wvalid),
		`ifdef AXI_HAVE_USER
		.s_wuser(x2x_m_axi_wuser),
    `endif

		.s_arready(x2x_m_axi_arready),
		.s_arvalid(x2x_m_axi_arvalid),
		`ifdef AXI_HAVE_USER
		.s_aruser(x2x_m_axi_aruser),
    `endif
		.s_arsize(x2x_m_axi_arsize),
		.s_arlen(x2x_m_axi_arlen),
		.s_arburst(x2x_m_axi_arburst),
		.s_araddr(x2x_m_axi_araddr),
		.s_arid(x2x_m_axi_arid),

		.s_rdata(x2x_m_axi_rdata),
		.s_rresp(x2x_m_axi_rresp),
		.s_rid(x2x_m_axi_rid),
		.s_rlast(x2x_m_axi_rlast),
		.s_rready(x2x_m_axi_rready),
		.s_rvalid(x2x_m_axi_rvalid),

		.s_bid(x2x_m_axi_bid),
		.s_bresp(x2x_m_axi_bresp),
		.s_bready(x2x_m_axi_bready),
		.s_bvalid(x2x_m_axi_bvalid),
		
		// MASTER 
		.m_awready(ddr_master_0_awready),
		.m_awvalid(ddr_master_0_awvalid),
		`ifdef AXI_HAVE_USER
		.m_awuser(ddr_master_0_awuser),
    `endif
		.m_awsize(ddr_master_0_awsize),
		.m_awlen(ddr_master_0_awlen),
		.m_awburst(ddr_master_0_awburst),
		.m_awaddr(ddr_master_0_awaddr),
		.m_awid(ddr_master_0_awid),

		.m_wdata(ddr_master_0_wdata),
		.m_wstrb(ddr_master_0_wstrb),
		.m_wlast(ddr_master_0_wlast),
		.m_wready(ddr_master_0_wready),
		.m_wvalid(ddr_master_0_wvalid),
		`ifdef AXI_HAVE_USER
		.m_wuser(ddr_master_0_wuser),
    `endif

		.m_arready(ddr_master_0_arready),
		.m_arvalid(ddr_master_0_arvalid),
		`ifdef AXI_HAVE_USER
		.m_aruser(ddr_master_0_aruser),
    `endif
		.m_arsize(ddr_master_0_arsize),
		.m_arlen(ddr_master_0_arlen),
		.m_arburst(ddr_master_0_arburst),
		.m_araddr(ddr_master_0_araddr),
		.m_arid(ddr_master_0_arid),

		.m_rdata(ddr_master_0_rdata),
		.m_rresp(ddr_master_0_rresp),
		.m_rid(ddr_master_0_rid),
		.m_rlast(ddr_master_0_rlast),
		.m_rready(ddr_master_0_rready),
		.m_rvalid(ddr_master_0_rvalid),

		.m_bid(ddr_master_0_bid),
		.m_bresp(ddr_master_0_bresp),
		.m_bready(ddr_master_0_bready),
		.m_bvalid(ddr_master_0_bvalid)
	);


 CHIPLINK_PREFIX_ChipLinkMaster chipLinkConverter (
    .clock(chiplink_clock),
    .reset(chiplink_reset),
    .transferDataReg(transferDataReg),
    .send_1p_valid(send_1p_valid),
    .b2c_data_concat(b2c_data_concat),
    .b2c_data_valid(b2c_data_valid),

  `ifdef CHIPLINK_CONNECT_DIRECT_TL
    .mig_input_takeover_en(mig_input_takeover_en),
    .widget_auto_in_a_ready(widget_auto_in_x2x_a_ready),
    .widget_auto_in_a_valid(widget_auto_in_x2x_a_valid),
    .widget_auto_in_a_bits_opcode(widget_auto_in_x2x_a_bits_opcode),
    //.widget_auto_in_a_bits_param(widget_auto_in_x2x_a_bits_param),
    .widget_auto_in_a_bits_size(widget_auto_in_x2x_a_bits_size),
    .widget_auto_in_a_bits_source(widget_auto_in_x2x_a_bits_source),
    .widget_auto_in_a_bits_address(widget_auto_in_x2x_a_bits_address),
    .widget_auto_in_a_bits_mask(widget_auto_in_x2x_a_bits_mask),
    .widget_auto_in_a_bits_data(widget_auto_in_x2x_a_bits_data),
    //.widget_auto_in_a_bits_corrupt(widget_auto_in_x2x_a_bits_corrupt),
    .widget_auto_in_d_ready(widget_auto_in_x2x_d_ready),
    .widget_auto_in_d_valid(widget_auto_in_x2x_d_valid),
    .widget_auto_in_d_bits_opcode(widget_auto_in_x2x_d_bits_opcode),
    .widget_auto_in_d_bits_size(widget_auto_in_x2x_d_bits_size),
    .widget_auto_in_d_bits_source(widget_auto_in_x2x_d_bits_source),
    .widget_auto_in_d_bits_denied(widget_auto_in_x2x_d_bits_denied),
    .widget_auto_in_d_bits_data(widget_auto_in_x2x_d_bits_data),
    .widget_auto_in_d_bits_corrupt(widget_auto_in_x2x_d_bits_corrupt),
  `else
    .slave_0_awready(x2x_s_axi_awready),
    .slave_0_awvalid(x2x_s_axi_awvalid),
    .slave_0_awid(x2x_s_axi_awid),
    .slave_0_awaddr({2'b0, x2x_s_axi_awaddr}),
    .slave_0_awlen(x2x_s_axi_awlen),
    .slave_0_awsize(x2x_s_axi_awsize),
    .slave_0_awburst(x2x_s_axi_awburst),
    .slave_0_wready(x2x_s_axi_wready),
    .slave_0_wvalid(x2x_s_axi_wvalid),
    .slave_0_wdata(x2x_s_axi_wdata),
    .slave_0_wstrb(x2x_s_axi_wstrb),
    .slave_0_wlast(x2x_s_axi_wlast),
    .slave_0_bready(x2x_s_axi_bready),
    .slave_0_bvalid(x2x_s_axi_bvalid),
    .slave_0_bid(x2x_s_axi_bid),
    .slave_0_bresp(x2x_s_axi_bresp),
    .slave_0_arready(x2x_s_axi_arready),
    .slave_0_arvalid(x2x_s_axi_arvalid),
    .slave_0_arid(x2x_s_axi_arid),
    .slave_0_araddr({2'b0, x2x_s_axi_araddr}),
    .slave_0_arlen(x2x_s_axi_arlen),
    .slave_0_arsize(x2x_s_axi_arsize),
    .slave_0_arburst(x2x_s_axi_arburst),
    .slave_0_rready(x2x_s_axi_rready),
    .slave_0_rvalid(x2x_s_axi_rvalid),
    .slave_0_rid(x2x_s_axi_rid),
    .slave_0_rdata(x2x_s_axi_rdata),
    .slave_0_rresp(x2x_s_axi_rresp),
    .slave_0_rlast(x2x_s_axi_rlast),
  `endif
    .master_mem_0_awready(x2x_m_axi_awready),
    .master_mem_0_awvalid(x2x_m_axi_awvalid),
    .master_mem_0_awid(x2x_m_axi_awid),
    .master_mem_0_awaddr(x2x_m_axi_awaddr),
    .master_mem_0_awlen(x2x_m_axi_awlen),
    .master_mem_0_awsize(x2x_m_axi_awsize),
    .master_mem_0_awburst(x2x_m_axi_awburst),
    .master_mem_0_wready(x2x_m_axi_wready),
    .master_mem_0_wvalid(x2x_m_axi_wvalid),
    .master_mem_0_wdata(x2x_m_axi_wdata),
    .master_mem_0_wstrb(x2x_m_axi_wstrb),
    .master_mem_0_wlast(x2x_m_axi_wlast),
    .master_mem_0_bready(x2x_m_axi_bready),
    .master_mem_0_bvalid(x2x_m_axi_bvalid),
    .master_mem_0_bid(x2x_m_axi_bid),
    .master_mem_0_bresp(x2x_m_axi_bresp),
    .master_mem_0_arready(x2x_m_axi_arready),
    .master_mem_0_arvalid(x2x_m_axi_arvalid),
    .master_mem_0_arid(x2x_m_axi_arid),
    .master_mem_0_araddr(x2x_m_axi_araddr),
    .master_mem_0_arlen(x2x_m_axi_arlen),
    .master_mem_0_arsize(x2x_m_axi_arsize),
    .master_mem_0_arburst(x2x_m_axi_arburst),
    .master_mem_0_rready(x2x_m_axi_rready),
    .master_mem_0_rvalid(x2x_m_axi_rvalid),
    .master_mem_0_rid(x2x_m_axi_rid),
    .master_mem_0_rdata(x2x_m_axi_rdata),
    .master_mem_0_rresp(x2x_m_axi_rresp),
    .master_mem_0_rlast(x2x_m_axi_rlast),
    .fpga_io_c2b_clk(ddr_io_c2b_clk),
    .fpga_io_c2b_rst(ddr_io_c2b_rst),
    .fpga_io_c2b_send(ddr_io_c2b_send),
    .fpga_io_c2b_data(ddr_io_c2b_data),
    .fpga_io_b2c_clk(ddr_io_b2c_clk),   // b2c dependancy clk
    .fpga_io_b2c_rst(ddr_io_b2c_rst),
    .fpga_io_b2c_send(ddr_io_b2c_send),
    .fpga_io_b2c_data(ddr_io_b2c_data)
  );

endmodule
