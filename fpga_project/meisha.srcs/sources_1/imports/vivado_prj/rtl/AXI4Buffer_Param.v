module AXI4Buffer_Param #(
		// {{{
		parameter	ADDR_WIDTH = 32,
    parameter	ID_WIDTH = 8,
		parameter	DATA_WIDTH = 64
		// }}}
	) ( 
  input         clock, 
  input         reset, 
  output        auto_in_awready, 
  input         auto_in_awvalid, 
  input  [ID_WIDTH-1:0]  auto_in_awid, 
  input  [ADDR_WIDTH-1:0] auto_in_awaddr, 
  input  [7:0]  auto_in_awlen, 
  input  [2:0]  auto_in_awsize, 
  input  [1:0]  auto_in_awburst, 
  output        auto_in_wready, 
  input         auto_in_wvalid, 
  input  [DATA_WIDTH-1:0] auto_in_wdata, 
  input  [DATA_WIDTH/8-1:0]  auto_in_wstrb, 
  input         auto_in_wlast, 
  input         auto_in_bready, 
  output        auto_in_bvalid, 
  output [ID_WIDTH-1:0]  auto_in_bid, 
  output [1:0]  auto_in_bresp, 
  output        auto_in_arready, 
  input         auto_in_arvalid, 
  input  [ID_WIDTH-1:0]  auto_in_arid, 
  input  [ADDR_WIDTH-1:0] auto_in_araddr, 
  input  [7:0]  auto_in_arlen, 
  input  [2:0]  auto_in_arsize, 
  input  [1:0]  auto_in_arburst, 
  input         auto_in_rready, 
  output        auto_in_rvalid, 
  output [ID_WIDTH-1:0]  auto_in_rid, 
  output [DATA_WIDTH-1:0] auto_in_rdata, 
  output [1:0]  auto_in_rresp, 
  output        auto_in_rlast, 
  input         auto_out_awready, 
  output        auto_out_awvalid, 
  output [ID_WIDTH-1:0]  auto_out_awid, 
  output [ADDR_WIDTH-1:0] auto_out_awaddr, 
  output [7:0]  auto_out_awlen, 
  output [2:0]  auto_out_awsize, 
  output [1:0]  auto_out_awburst, 
  input         auto_out_wready, 
  output        auto_out_wvalid, 
  output [DATA_WIDTH-1:0] auto_out_wdata, 
  output [DATA_WIDTH/8-1:0]  auto_out_wstrb, 
  output        auto_out_wlast, 
  output        auto_out_bready, 
  input         auto_out_bvalid, 
  input  [ID_WIDTH-1:0]  auto_out_bid, 
  input  [1:0]  auto_out_bresp, 
  input         auto_out_arready, 
  output        auto_out_arvalid, 
  output [ID_WIDTH-1:0]  auto_out_arid, 
  output [ADDR_WIDTH-1:0] auto_out_araddr, 
  output [7:0]  auto_out_arlen, 
  output [2:0]  auto_out_arsize, 
  output [1:0]  auto_out_arburst, 
  output        auto_out_rready, 
  input         auto_out_rvalid, 
  input  [ID_WIDTH-1:0]  auto_out_rid, 
  input  [DATA_WIDTH-1:0] auto_out_rdata, 
  input  [1:0]  auto_out_rresp, 
  input         auto_out_rlast 
);
  wire  Queue_clock; 
  wire  Queue_reset; 
  wire  Queue_io_enq_ready; 
  wire  Queue_io_enq_valid; 
  wire [ID_WIDTH-1:0] Queue_io_enq_bits_id; 
  wire [ADDR_WIDTH-1:0] Queue_io_enq_bits_addr; 
  wire [7:0] Queue_io_enq_bits_len; 
  wire [2:0] Queue_io_enq_bits_size; 
  wire [1:0] Queue_io_enq_bits_burst; 
  wire  Queue_io_deq_ready; 
  wire  Queue_io_deq_valid; 
  wire [ID_WIDTH-1:0] Queue_io_deq_bits_id; 
  wire [ADDR_WIDTH-1:0] Queue_io_deq_bits_addr; 
  wire [7:0] Queue_io_deq_bits_len; 
  wire [2:0] Queue_io_deq_bits_size; 
  wire [1:0] Queue_io_deq_bits_burst; 
  wire  Queue_1_clock; 
  wire  Queue_1_reset; 
  wire  Queue_1_io_enq_ready; 
  wire  Queue_1_io_enq_valid; 
  wire [DATA_WIDTH-1:0] Queue_1_io_enq_bits_data; 
  wire [DATA_WIDTH/8-1:0] Queue_1_io_enq_bits_strb; 
  wire  Queue_1_io_enq_bits_last; 
  wire  Queue_1_io_deq_ready; 
  wire  Queue_1_io_deq_valid; 
  wire [DATA_WIDTH-1:0] Queue_1_io_deq_bits_data; 
  wire [DATA_WIDTH/8-1:0] Queue_1_io_deq_bits_strb; 
  wire  Queue_1_io_deq_bits_last; 
  wire  Queue_2_clock; 
  wire  Queue_2_reset; 
  wire  Queue_2_io_enq_ready; 
  wire  Queue_2_io_enq_valid; 
  wire [ID_WIDTH-1:0] Queue_2_io_enq_bits_id; 
  wire [1:0] Queue_2_io_enq_bits_resp; 
  wire  Queue_2_io_deq_ready; 
  wire  Queue_2_io_deq_valid; 
  wire [ID_WIDTH-1:0] Queue_2_io_deq_bits_id; 
  wire [1:0] Queue_2_io_deq_bits_resp; 
  wire  Queue_3_clock; 
  wire  Queue_3_reset; 
  wire  Queue_3_io_enq_ready; 
  wire  Queue_3_io_enq_valid; 
  wire [ID_WIDTH-1:0] Queue_3_io_enq_bits_id; 
  wire [ADDR_WIDTH-1:0] Queue_3_io_enq_bits_addr; 
  wire [7:0] Queue_3_io_enq_bits_len; 
  wire [2:0] Queue_3_io_enq_bits_size; 
  wire [1:0] Queue_3_io_enq_bits_burst; 
  wire  Queue_3_io_deq_ready; 
  wire  Queue_3_io_deq_valid; 
  wire [ID_WIDTH-1:0] Queue_3_io_deq_bits_id; 
  wire [ADDR_WIDTH-1:0] Queue_3_io_deq_bits_addr; 
  wire [7:0] Queue_3_io_deq_bits_len; 
  wire [2:0] Queue_3_io_deq_bits_size; 
  wire [1:0] Queue_3_io_deq_bits_burst; 
  wire  Queue_4_clock; 
  wire  Queue_4_reset; 
  wire  Queue_4_io_enq_ready; 
  wire  Queue_4_io_enq_valid; 
  wire [ID_WIDTH-1:0] Queue_4_io_enq_bits_id; 
  wire [DATA_WIDTH-1:0] Queue_4_io_enq_bits_data; 
  wire [1:0] Queue_4_io_enq_bits_resp; 
  wire  Queue_4_io_enq_bits_last; 
  wire  Queue_4_io_deq_ready; 
  wire  Queue_4_io_deq_valid; 
  wire [ID_WIDTH-1:0] Queue_4_io_deq_bits_id; 
  wire [DATA_WIDTH-1:0] Queue_4_io_deq_bits_data; 
  wire [1:0] Queue_4_io_deq_bits_resp; 
  wire  Queue_4_io_deq_bits_last; 
  Queue_A_Channel #(
    .ADDR_WIDTH(ADDR_WIDTH),
    .DATA_WIDTH(DATA_WIDTH),
    .ID_WIDTH(ID_WIDTH)
  ) Queue ( 
    .clock(Queue_clock),
    .reset(Queue_reset),
    .io_enq_ready(Queue_io_enq_ready),
    .io_enq_valid(Queue_io_enq_valid),
    .io_enq_bits_id(Queue_io_enq_bits_id),
    .io_enq_bits_addr(Queue_io_enq_bits_addr),
    .io_enq_bits_len(Queue_io_enq_bits_len),
    .io_enq_bits_size(Queue_io_enq_bits_size),
    .io_enq_bits_burst(Queue_io_enq_bits_burst),
    .io_deq_ready(Queue_io_deq_ready),
    .io_deq_valid(Queue_io_deq_valid),
    .io_deq_bits_id(Queue_io_deq_bits_id),
    .io_deq_bits_addr(Queue_io_deq_bits_addr),
    .io_deq_bits_len(Queue_io_deq_bits_len),
    .io_deq_bits_size(Queue_io_deq_bits_size),
    .io_deq_bits_burst(Queue_io_deq_bits_burst)
  );
  Queue_W_Channel #(
    .ADDR_WIDTH(ADDR_WIDTH),
    .DATA_WIDTH(DATA_WIDTH),
    .ID_WIDTH(ID_WIDTH)
  ) Queue_1 ( 
    .clock(Queue_1_clock),
    .reset(Queue_1_reset),
    .io_enq_ready(Queue_1_io_enq_ready),
    .io_enq_valid(Queue_1_io_enq_valid),
    .io_enq_bits_data(Queue_1_io_enq_bits_data),
    .io_enq_bits_strb(Queue_1_io_enq_bits_strb),
    .io_enq_bits_last(Queue_1_io_enq_bits_last),
    .io_deq_ready(Queue_1_io_deq_ready),
    .io_deq_valid(Queue_1_io_deq_valid),
    .io_deq_bits_data(Queue_1_io_deq_bits_data),
    .io_deq_bits_strb(Queue_1_io_deq_bits_strb),
    .io_deq_bits_last(Queue_1_io_deq_bits_last)
  );
  Queue_B_Channel #(
    .ADDR_WIDTH(ADDR_WIDTH),
    .DATA_WIDTH(DATA_WIDTH),
    .ID_WIDTH(ID_WIDTH)
  ) Queue_2 ( 
    .clock(Queue_2_clock),
    .reset(Queue_2_reset),
    .io_enq_ready(Queue_2_io_enq_ready),
    .io_enq_valid(Queue_2_io_enq_valid),
    .io_enq_bits_id(Queue_2_io_enq_bits_id),
    .io_enq_bits_resp(Queue_2_io_enq_bits_resp),
    .io_deq_ready(Queue_2_io_deq_ready),
    .io_deq_valid(Queue_2_io_deq_valid),
    .io_deq_bits_id(Queue_2_io_deq_bits_id),
    .io_deq_bits_resp(Queue_2_io_deq_bits_resp)
  );
  Queue_A_Channel #(
    .ADDR_WIDTH(ADDR_WIDTH),
    .DATA_WIDTH(DATA_WIDTH),
    .ID_WIDTH(ID_WIDTH)
  ) Queue_3 ( 
    .clock(Queue_3_clock),
    .reset(Queue_3_reset),
    .io_enq_ready(Queue_3_io_enq_ready),
    .io_enq_valid(Queue_3_io_enq_valid),
    .io_enq_bits_id(Queue_3_io_enq_bits_id),
    .io_enq_bits_addr(Queue_3_io_enq_bits_addr),
    .io_enq_bits_len(Queue_3_io_enq_bits_len),
    .io_enq_bits_size(Queue_3_io_enq_bits_size),
    .io_enq_bits_burst(Queue_3_io_enq_bits_burst),
    .io_deq_ready(Queue_3_io_deq_ready),
    .io_deq_valid(Queue_3_io_deq_valid),
    .io_deq_bits_id(Queue_3_io_deq_bits_id),
    .io_deq_bits_addr(Queue_3_io_deq_bits_addr),
    .io_deq_bits_len(Queue_3_io_deq_bits_len),
    .io_deq_bits_size(Queue_3_io_deq_bits_size),
    .io_deq_bits_burst(Queue_3_io_deq_bits_burst)
  );
  Queue_R_Channel #(
    .ADDR_WIDTH(ADDR_WIDTH),
    .DATA_WIDTH(DATA_WIDTH),
    .ID_WIDTH(ID_WIDTH)
  ) Queue_4 ( 
    .clock(Queue_4_clock),
    .reset(Queue_4_reset),
    .io_enq_ready(Queue_4_io_enq_ready),
    .io_enq_valid(Queue_4_io_enq_valid),
    .io_enq_bits_id(Queue_4_io_enq_bits_id),
    .io_enq_bits_data(Queue_4_io_enq_bits_data),
    .io_enq_bits_resp(Queue_4_io_enq_bits_resp),
    .io_enq_bits_last(Queue_4_io_enq_bits_last),
    .io_deq_ready(Queue_4_io_deq_ready),
    .io_deq_valid(Queue_4_io_deq_valid),
    .io_deq_bits_id(Queue_4_io_deq_bits_id),
    .io_deq_bits_data(Queue_4_io_deq_bits_data),
    .io_deq_bits_resp(Queue_4_io_deq_bits_resp),
    .io_deq_bits_last(Queue_4_io_deq_bits_last)
  );
  assign auto_in_awready = Queue_io_enq_ready; 
  assign auto_in_wready = Queue_1_io_enq_ready; 
  assign auto_in_bvalid = Queue_2_io_deq_valid; 
  assign auto_in_bid = Queue_2_io_deq_bits_id; 
  assign auto_in_bresp = Queue_2_io_deq_bits_resp; 
  assign auto_in_arready = Queue_3_io_enq_ready; 
  assign auto_in_rvalid = Queue_4_io_deq_valid; 
  assign auto_in_rid = Queue_4_io_deq_bits_id; 
  assign auto_in_rdata = Queue_4_io_deq_bits_data; 
  assign auto_in_rresp = Queue_4_io_deq_bits_resp; 
  assign auto_in_rlast = Queue_4_io_deq_bits_last; 
  assign auto_out_awvalid = Queue_io_deq_valid; 
  assign auto_out_awid = Queue_io_deq_bits_id; 
  assign auto_out_awaddr = Queue_io_deq_bits_addr; 
  assign auto_out_awlen = Queue_io_deq_bits_len; 
  assign auto_out_awsize = Queue_io_deq_bits_size; 
  assign auto_out_awburst = Queue_io_deq_bits_burst; 
  assign auto_out_wvalid = Queue_1_io_deq_valid; 
  assign auto_out_wdata = Queue_1_io_deq_bits_data; 
  assign auto_out_wstrb = Queue_1_io_deq_bits_strb; 
  assign auto_out_wlast = Queue_1_io_deq_bits_last; 
  assign auto_out_bready = Queue_2_io_enq_ready; 
  assign auto_out_arvalid = Queue_3_io_deq_valid; 
  assign auto_out_arid = Queue_3_io_deq_bits_id; 
  assign auto_out_araddr = Queue_3_io_deq_bits_addr; 
  assign auto_out_arlen = Queue_3_io_deq_bits_len; 
  assign auto_out_arsize = Queue_3_io_deq_bits_size; 
  assign auto_out_arburst = Queue_3_io_deq_bits_burst; 
  assign auto_out_rready = Queue_4_io_enq_ready; 
  assign Queue_clock = clock; 
  assign Queue_reset = reset; 
  assign Queue_io_enq_valid = auto_in_awvalid; 
  assign Queue_io_enq_bits_id = auto_in_awid; 
  assign Queue_io_enq_bits_addr = auto_in_awaddr; 
  assign Queue_io_enq_bits_len = auto_in_awlen; 
  assign Queue_io_enq_bits_size = auto_in_awsize; 
  assign Queue_io_enq_bits_burst = auto_in_awburst; 
  assign Queue_io_deq_ready = auto_out_awready; 
  assign Queue_1_clock = clock; 
  assign Queue_1_reset = reset; 
  assign Queue_1_io_enq_valid = auto_in_wvalid; 
  assign Queue_1_io_enq_bits_data = auto_in_wdata; 
  assign Queue_1_io_enq_bits_strb = auto_in_wstrb; 
  assign Queue_1_io_enq_bits_last = auto_in_wlast; 
  assign Queue_1_io_deq_ready = auto_out_wready; 
  assign Queue_2_clock = clock; 
  assign Queue_2_reset = reset; 
  assign Queue_2_io_enq_valid = auto_out_bvalid; 
  assign Queue_2_io_enq_bits_id = auto_out_bid; 
  assign Queue_2_io_enq_bits_resp = auto_out_bresp; 
  assign Queue_2_io_deq_ready = auto_in_bready; 
  assign Queue_3_clock = clock; 
  assign Queue_3_reset = reset; 
  assign Queue_3_io_enq_valid = auto_in_arvalid; 
  assign Queue_3_io_enq_bits_id = auto_in_arid; 
  assign Queue_3_io_enq_bits_addr = auto_in_araddr; 
  assign Queue_3_io_enq_bits_len = auto_in_arlen; 
  assign Queue_3_io_enq_bits_size = auto_in_arsize; 
  assign Queue_3_io_enq_bits_burst = auto_in_arburst; 
  assign Queue_3_io_deq_ready = auto_out_arready; 
  assign Queue_4_clock = clock; 
  assign Queue_4_reset = reset; 
  assign Queue_4_io_enq_valid = auto_out_rvalid; 
  assign Queue_4_io_enq_bits_id = auto_out_rid; 
  assign Queue_4_io_enq_bits_data = auto_out_rdata; 
  assign Queue_4_io_enq_bits_resp = auto_out_rresp; 
  assign Queue_4_io_enq_bits_last = auto_out_rlast; 
  assign Queue_4_io_deq_ready = auto_in_rready; 
endmodule
