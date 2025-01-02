/*

Copyright (c) 2018 Alex Forencich

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

*/

// Language: Verilog 2001
// define log2 option
/*
`define     log2(VALUE)		\
			((VALUE) < ( 1 ) ? 0 : \
			(VALUE) < ( 2 ) ? 1 : \
			(VALUE) < ( 4 ) ? 2 : \
			(VALUE) < ( 8 ) ? 3 : \
			(VALUE) < ( 16 )  ? 4 : \
			(VALUE) < ( 32 )  ? 5 : \
			(VALUE) < ( 64 )  ? 6 : \
			(VALUE) < ( 128 ) ? 7 : \
			(VALUE) < ( 256 ) ? 8 : \
			(VALUE) < ( 512 ) ? 9 : \
			(VALUE) < ( 1024 ) ? 10 : \
			(VALUE) < ( 2048 ) ? 11 : \
			(VALUE) < ( 4096 ) ? 12 : \
			(VALUE) < ( 8192 ) ? 13 : \
			(VALUE) < ( 16384 ) ? 14 : \
			(VALUE) < ( 32768 ) ? 15 : \
			(VALUE) < ( 65536 ) ? 16 : \
			(VALUE) < ( 131072 ) ? 17 : \
			(VALUE) < ( 262144 ) ? 18 : \
			(VALUE) < ( 524288 ) ? 19 : \
			(VALUE) < ( 1048576 ) ? 20 : \
			(VALUE) < ( 1048576 * 2 ) ? 21 : \
			(VALUE) < ( 1048576 * 4 ) ? 22 : \
			(VALUE) < ( 1048576 * 8 ) ? 23 : \
			(VALUE) < ( 1048576 * 16 ) ? 24 : \
			(VALUE) < ( 1048576 * 32 ) ? 25 : \
			(VALUE) < ( 1048576 * 64 ) ? 26 : \
			(VALUE) < ( 1048576 * 128 ) ? 27 : \
			(VALUE) < ( 1048576 * 256 ) ? 28 : \
			(VALUE) < ( 1048576 * 512 ) ? 29 : \
			(VALUE) < ( 1048576 * 1024 ) ? 30 : \
			(VALUE) < ( 1048576 * 2048 ) ? 31 : -1)

*/
/*
 * AXI4 RAM
 */
module SOC_IRAM #
(
    // Width of data bus in bits
    parameter DATA_WIDTH = 64,
    // Width of address bus in bits
    parameter ADDR_WIDTH = 32,
    // Width of wstrb (width of data bus in words)
    parameter STRB_WIDTH = (DATA_WIDTH/8),
    // Width of ID signal
    parameter ID_WIDTH = 8,
    // Extra pipeline register on output
    parameter PIPELINE_OUTPUT = 0
)
(
    input  wire                   clk,
    input  wire                   rst,

    input  wire [ID_WIDTH-1:0]    s_axi_awid,
    input  wire [ADDR_WIDTH-1:0]  s_axi_awaddr,
    input  wire [7:0]             s_axi_awlen,
    input  wire [2:0]             s_axi_awsize,
    input  wire [1:0]             s_axi_awburst,
    input  wire                   s_axi_awlock,
    input  wire [3:0]             s_axi_awcache,
    input  wire [2:0]             s_axi_awprot,
    input  wire                   s_axi_awvalid,
    output wire                   s_axi_awready,
    input  wire [DATA_WIDTH-1:0]  s_axi_wdata,
    input  wire [STRB_WIDTH-1:0]  s_axi_wstrb,
    input  wire                   s_axi_wlast,
    input  wire                   s_axi_wvalid,
    output wire                   s_axi_wready,
    output wire [ID_WIDTH-1:0]    s_axi_bid,
    output wire [1:0]             s_axi_bresp,
    output wire                   s_axi_bvalid,
    input  wire                   s_axi_bready,
    input  wire [ID_WIDTH-1:0]    s_axi_arid,
    input  wire [ADDR_WIDTH-1:0]  s_axi_araddr,
    input  wire [7:0]             s_axi_arlen,
    input  wire [2:0]             s_axi_arsize,
    input  wire [1:0]             s_axi_arburst,
    input  wire                   s_axi_arlock,
    input  wire [3:0]             s_axi_arcache,
    input  wire [2:0]             s_axi_arprot,
    input  wire                   s_axi_arvalid,
    output wire                   s_axi_arready,
    output wire [ID_WIDTH-1:0]    s_axi_rid,
    output wire [DATA_WIDTH-1:0]  s_axi_rdata,
    output wire [1:0]             s_axi_rresp,
    output wire                   s_axi_rlast,
    output wire                   s_axi_rvalid,
    input  wire                   s_axi_rready
);

`ifndef VENDOR_RAM_EN
    localparam VALID_ADDR_WIDTH = ADDR_WIDTH - $clog2(STRB_WIDTH);
`else
    localparam VALID_ADDR_WIDTH = ADDR_WIDTH;
`endif 

localparam WORD_WIDTH = STRB_WIDTH;
localparam WORD_SIZE = DATA_WIDTH/WORD_WIDTH;

wire [VALID_ADDR_WIDTH-1:0] s_axi_awaddr_valid;
wire [VALID_ADDR_WIDTH-1:0] s_axi_araddr_valid;
wire [VALID_ADDR_WIDTH-1:0] read_addr_valid;

reg [VALID_ADDR_WIDTH-1:0] read_addr_valid_p1;

wire [VALID_ADDR_WIDTH-1:0] write_addr_valid;

// 对 UMC40lvt Dual Port SRAM 的例化(begin)
// reg		[DATA_WIDTH-1:0]		mdata_i_reg, mdata_o_reg;	// for SRAM I/O reg
// reg		[VALID_ADDR_WIDTH-1:0]	maddr_reg;					// for SRAM Row Decoder reg

// wire	[DATA_WIDTH-1:0]		mdata_i, mdata_o;			// for SRAM I/O
// wire	[VALID_ADDR_WIDTH-1:0]	maddr;						// for SRAM Row Decoder
reg		[DATA_WIDTH-1:0]	bl_sel_reg;						// for SRAM Column Decoder reg
// wire	[DATA_WIDTH-1:0]	bl_sel;							// for SRAM Column Decoder
// wire					  	r_w_ctrl;	    				// read and write control
// 由于目前只用一个通道，所以 sleep chip-select 和 shut-down 均由 ssc_en 控制。
wire						ssc_wr_en;
wire						ssc_rd_en;

wire memory_bank_write_sel;
wire lsys_write_sel;
wire memory_bank_read_sel;
wire lsys_read_sel;
wire [7:0] master_signal_valid_trigger_int;

`ifndef SYNTHESIS
// bus width assertions
initial begin
    if (WORD_SIZE * STRB_WIDTH != DATA_WIDTH) begin
        $error("Error: AXI data width not evenly divisble (instance %m)");
        $finish;
    end

    if (2**$clog2(WORD_WIDTH) != WORD_WIDTH) begin
        $error("Error: AXI word width must be even power of two (instance %m)");
        $finish;
    end
end
`endif
localparam [0:0]
    READ_STATE_IDLE = 1'd0,
    READ_STATE_BURST = 1'd1;

reg [0:0] read_state_reg, read_state_next;

localparam [1:0]
    WRITE_STATE_IDLE = 2'd0,
    WRITE_STATE_BURST = 2'd1,
    WRITE_STATE_RESP = 2'd2;

reg [1:0] write_state_reg, write_state_next;

// `mem_rd_en` and `mem_wr_en` can only use one signal.
// 所以可以利用这两个信号控制sleep和chip-select
reg mem_wr_en;
reg mem_rd_en;

reg [ID_WIDTH-1:0] read_id_reg, read_id_next;
reg [ADDR_WIDTH-1:0] read_addr_reg, read_addr_next;
reg [7:0] read_count_reg, read_count_next;
reg [2:0] read_size_reg, read_size_next;
reg [1:0] read_burst_reg, read_burst_next;
reg [ID_WIDTH-1:0] write_id_reg, write_id_next;
reg [ADDR_WIDTH-1:0] write_addr_reg, write_addr_next;
reg [7:0] write_count_reg, write_count_next;
reg [2:0] write_size_reg, write_size_next;
reg [1:0] write_burst_reg, write_burst_next;

reg s_axi_awready_reg, s_axi_awready_next;
reg s_axi_wready_reg, s_axi_wready_next;
reg [ID_WIDTH-1:0] s_axi_bid_reg, s_axi_bid_next;
reg s_axi_bvalid_reg, s_axi_bvalid_next;
reg s_axi_arready_reg, s_axi_arready_next;
reg [ID_WIDTH-1:0] s_axi_rid_reg, s_axi_rid_next;
reg [DATA_WIDTH-1:0] s_axi_rdata_reg, s_axi_rdata_next;
reg s_axi_rlast_reg, s_axi_rlast_next;
reg s_axi_rvalid_reg, s_axi_rvalid_next;
reg [ID_WIDTH-1:0] s_axi_rid_pipe_reg;
reg [DATA_WIDTH-1:0] s_axi_rdata_pipe_reg;
reg s_axi_rlast_pipe_reg;
reg s_axi_rvalid_pipe_reg;


`ifndef VENDOR_RAM_EN

// (* RAM_STYLE="BLOCK" *)
reg [DATA_WIDTH-1:0] mem[32-1:0];  // 8byte

`endif // VENDOR_RAM_EN

assign s_axi_awaddr_valid = s_axi_awaddr >> (ADDR_WIDTH - VALID_ADDR_WIDTH);
assign s_axi_araddr_valid = s_axi_araddr >> (ADDR_WIDTH - VALID_ADDR_WIDTH);
assign read_addr_valid = read_addr_reg >> (ADDR_WIDTH - VALID_ADDR_WIDTH);

assign write_addr_valid = write_addr_reg >> (ADDR_WIDTH - VALID_ADDR_WIDTH);

// assign memory_bank_write_sel = ((write_addr_reg >= 32'h0) && (write_addr_reg < 32'h100_0000)) ? 1'b1 : 1'b0;
// assign memory_bank_read_sel = ((read_addr_reg >= 32'h0) && (read_addr_reg < 32'h100_0000)) ? 1'b1 : 1'b0;

assign memory_bank_write_sel = 1'b1;
assign memory_bank_read_sel = 1'b1;

assign s_axi_awready = s_axi_awready_reg;
assign s_axi_wready = s_axi_wready_reg;
assign s_axi_bid = s_axi_bid_reg;
assign s_axi_bresp = 2'b00;
assign s_axi_bvalid = s_axi_bvalid_reg;
assign s_axi_arready = s_axi_arready_reg;
assign s_axi_rid = PIPELINE_OUTPUT ? s_axi_rid_pipe_reg : s_axi_rid_reg;
assign s_axi_rdata = PIPELINE_OUTPUT ? s_axi_rdata_pipe_reg : s_axi_rdata_reg;
assign s_axi_rresp = 2'b00;
assign s_axi_rlast = PIPELINE_OUTPUT ? s_axi_rlast_pipe_reg : s_axi_rlast_reg;
assign s_axi_rvalid = PIPELINE_OUTPUT ? s_axi_rvalid_pipe_reg : s_axi_rvalid_reg;


// assign	mdata_i = s_axi_wdata[DATA_WIDTH-1:0];
// assign	mdata_o = mdata_o_reg;
assign	ssc_rd_en = mem_rd_en & memory_bank_read_sel;
assign	ssc_wr_en = mem_wr_en & memory_bank_write_sel;
// assign	r_w_ctrl = ssc_en & mem_rd_en;


`ifdef VENDOR_RAM_EN_512

    localparam MAX_RAM_ARRAY_NUM = 64;

    wire revert_clk_for_ram;
    wire [5:0] bank_sel_waddr;
    wire [5:0] bank_sel_raddr;
    wire [5:0] bank_sel_raddr_p1;
    wire bank_wsel[MAX_RAM_ARRAY_NUM];
    wire bank_rsel[MAX_RAM_ARRAY_NUM];
    wire [63:0] bank_rdata[MAX_RAM_ARRAY_NUM];
    wire [63:0] bank_wdata[MAX_RAM_ARRAY_NUM];
    wire [9-1:0] bank_addr[MAX_RAM_ARRAY_NUM];
    wire [9-1:0] bank_waddr[MAX_RAM_ARRAY_NUM];
    wire [9-1:0] bank_raddr[MAX_RAM_ARRAY_NUM];

  // wire revert_clk_for_ram;

  //   tc_clk_inverter u_tc_clk_inverter(
  //       .clk_i(data_arrays_0_0_ext_RW0_clk)
  //       ,.clk_o(revert_clk_for_ram)
  //   );


  genvar i, j, k;

  assign bank_sel_waddr[5:0] = write_addr_valid[17:12];
  assign bank_sel_raddr[5:0] = read_addr_valid[17:12];
  assign bank_sel_raddr_p1[5:0] = read_addr_valid_p1[17:12];

  assign s_axi_rdata_reg[63:0] = bank_rdata[bank_sel_raddr_p1[5:0]];

  generate

    for(i = 0; i < MAX_RAM_ARRAY_NUM; i++) begin:ram_array_inst
        
        assign bank_rsel[i] = (bank_sel_raddr[5:0] == i) ? 1'b1 : 1'b0;
        assign bank_raddr[i] = (bank_sel_raddr[5:0] == i) ? read_addr_valid[11:3] : 9'h0;
        assign bank_wsel[i] = (bank_sel_waddr[5:0] == i) ? 1'b1 : 1'b0;
        assign bank_waddr[i] = (bank_sel_waddr[5:0] == i) ? write_addr_valid[11:3] : 9'h0;
        assign bank_wdata[i] = s_axi_wdata[63:0]; 
        assign bank_addr[i] = (ssc_wr_en == 1'b1) ? bank_waddr[i] : bank_raddr[i];


//      bank_raddr[l] = read_addr_valid[11:3]; 
        // UMC40lvt Dual Port SRAM, A port write, B port read
        SYLB40_512X8X8CM4_top	u0_block_dp_sram(
            .Data_out	(bank_rdata[i]),	   
            .Data_in	(bank_wdata[i]),	 
            .Addr		({bank_addr[i]}),
            .WEB		({8{(bank_wsel[i] & ssc_wr_en)}} & s_axi_wstrb),	
            .CK		    (clk),		    
            .CSB		((bank_wsel[i] & ssc_wr_en) | (bank_rsel[i] & ssc_rd_en)),	   	/*Chip Select*/
            .DVSE		(1'b0),		           
            .DVS		(4'd15),	/*Delay Option Control - Sensing Margine*/
            .NAP		(1'b0)		/*休眠模式*/
        );
    end

  endgenerate

`elsif VENDOR_RAM_EN

    localparam MAX_RAM_ARRAY_NUM = 4;

    wire revert_clk_for_ram;
    wire [2-1:0] bank_sel_waddr;
    wire [2-1:0] bank_sel_raddr;
    wire [2-1:0] bank_sel_raddr_p1;
    wire bank_wsel[MAX_RAM_ARRAY_NUM];
    wire bank_rsel[MAX_RAM_ARRAY_NUM];
    wire [63:0] bank_rdata[MAX_RAM_ARRAY_NUM];
    wire [63:0] bank_wdata[MAX_RAM_ARRAY_NUM];
    wire [7:0]  bank_wmask[MAX_RAM_ARRAY_NUM];
    wire [13-1:0] bank_addr[MAX_RAM_ARRAY_NUM];
    wire [13-1:0] bank_waddr[MAX_RAM_ARRAY_NUM];
    wire [13-1:0] bank_raddr[MAX_RAM_ARRAY_NUM];


  assign bank_sel_waddr[2-1:0] = write_addr_valid[16+:2];
  assign bank_sel_raddr[2-1:0] = read_addr_valid[16+:2];
  assign bank_sel_raddr_p1[2-1:0] = read_addr_valid_p1[16+:2];
  

  assign s_axi_rdata_reg[63:0] = (
    bank_sel_raddr_p1[2-1:0] == 2'h0) ? bank_rdata[0] 
    : ((bank_sel_raddr_p1[2-1:0] == 2'h1) ? bank_rdata[1] 
    : ((bank_sel_raddr_p1[2-1:0] == 2'h2) ? bank_rdata[2] 
    : ((bank_sel_raddr_p1[2-1:0] == 2'h3) ? bank_rdata[3] 
    : 64'h0)) 
    );

  genvar i, j, k;

  generate

    for(i = 0; i < MAX_RAM_ARRAY_NUM; i++) begin:ram_array_inst

        assign bank_rsel[i] = (bank_sel_raddr[2-1:0] == i) ? 1'b1 : 1'b0;
        assign bank_raddr[i] = (bank_sel_raddr[2-1:0] == i) ? read_addr_valid[15:3] : 12'h0;
        assign bank_wsel[i] = (bank_sel_waddr[2-1:0] == i) ? 1'b1 : 1'b0;
        assign bank_waddr[i] = (bank_sel_waddr[2-1:0] == i) ? write_addr_valid[15:3] : 12'h0;
        assign bank_wdata[i] = s_axi_wdata[63:0];
        assign bank_wmask[i] = (bank_wsel[i] & ssc_wr_en) ? s_axi_wstrb : 8'h00; 
        assign bank_addr[i] = (ssc_wr_en == 1'b1) ? bank_waddr[i] : bank_raddr[i];

    // UMC40lvt Dual Port SRAM, A port write, B port read
    SHLVTLB40_8192X8X8CM8b1 u_block_sp_sram(
        .DO	    (bank_rdata[i]),
        .DI	    (bank_wdata[i]),
        .A		(bank_addr[i]),
        .WEB	(~bank_wmask[i]),                                        		/*低电平有效*/
        .CK  	(clk),
        .CSB	(~((bank_wsel[i] & ssc_wr_en) | (bank_rsel[i] & ssc_rd_en))),		/*Chip Select*/
        .DVSE	(1'b0),		           
        .DVS	(4'd15),	                                                    /*Delay Option Control - Sensing Margine*/
        .NAP	(1'b0)		                                                    /*休眠模式*/
    );


    end

  endgenerate

`elsif VENDOR_RAM_EN_SHL

  localparam MAX_RAM_ARRAY_NUM = 4;

    wire revert_clk_for_ram;
    wire [2-1:0] bank_sel_waddr;
    wire [2-1:0] bank_sel_raddr;
    wire [2-1:0] bank_sel_raddr_p1;
    wire bank_wsel[MAX_RAM_ARRAY_NUM];
    wire bank_rsel[MAX_RAM_ARRAY_NUM];
    wire [63:0] bank_rdata[MAX_RAM_ARRAY_NUM];
    wire [63:0] bank_wdata[MAX_RAM_ARRAY_NUM];
    wire [7:0]  bank_wmask[MAX_RAM_ARRAY_NUM];
    wire [13-1:0] bank_addr[MAX_RAM_ARRAY_NUM];
    wire [13-1:0] bank_waddr[MAX_RAM_ARRAY_NUM];
    wire [13-1:0] bank_raddr[MAX_RAM_ARRAY_NUM];


  assign bank_sel_waddr[2-1:0] = write_addr_valid[16+:2];
  assign bank_sel_raddr[2-1:0] = read_addr_valid[16+:2];
  assign bank_sel_raddr_p1[2-1:0] = read_addr_valid_p1[16+:2];
  

  assign s_axi_rdata_reg[63:0] = (
    bank_sel_raddr_p1[2-1:0] == 2'h0) ? bank_rdata[0] 
    : ((bank_sel_raddr_p1[2-1:0] == 2'h1) ? bank_rdata[1] 
    : ((bank_sel_raddr_p1[2-1:0] == 2'h2) ? bank_rdata[2] 
    : ((bank_sel_raddr_p1[2-1:0] == 2'h3) ? bank_rdata[3] 
    : 64'h0)) 
    );

  genvar i, j, k;

  generate

    for(i = 0; i < MAX_RAM_ARRAY_NUM; i++) begin:ram_array_inst

        assign bank_rsel[i] = (bank_sel_raddr[2-1:0] == i) ? 1'b1 : 1'b0;
        assign bank_raddr[i] = (bank_sel_raddr[2-1:0] == i) ? read_addr_valid[15:3] : 12'h0;
        assign bank_wsel[i] = (bank_sel_waddr[2-1:0] == i) ? 1'b1 : 1'b0;
        assign bank_waddr[i] = (bank_sel_waddr[2-1:0] == i) ? write_addr_valid[15:3] : 12'h0;
        assign bank_wdata[i] = s_axi_wdata[63:0];
        assign bank_wmask[i] = (bank_wsel[i] & ssc_wr_en) ? s_axi_wstrb : 8'h00; 
        assign bank_addr[i] = (ssc_wr_en == 1'b1) ? bank_waddr[i] : bank_raddr[i];


    // UMC40lvt Dual Port SRAM, A port write, B port read
    SHLB40_8192X8X8CM8_top u_block_dp_sram(
        .Data_out	(bank_rdata[i]),
        .Data_in	(bank_wdata[i]),
        .Addr		(bank_addr[i]),
        .WEB		(bank_wmask[i]),                                        		/*低电平有效*/
        .CK  		(clk),
        .CSB		((bank_wsel[i] & ssc_wr_en) | (bank_rsel[i] & ssc_rd_en)),		/*Chip Select*/
        .DVSE		(1'b0),		           
        .DVS		(4'd15),	                                                    /*Delay Option Control - Sensing Margine*/
        .NAP		(1'b0)		                                                    /*休眠模式*/
    );


    end

  endgenerate

`elsif VENDOR_RAM_EN_DUAL_PORT

  localparam MAX_RAM_ARRAY_NUM = 2;

    wire revert_clk_for_ram;
    wire [2:0] bank_sel_waddr;
    wire [2:0] bank_sel_raddr;
    wire [2:0] bank_sel_raddr_p1;
    wire bank_wsel[MAX_RAM_ARRAY_NUM];
    wire bank_rsel[MAX_RAM_ARRAY_NUM];
    wire [63:0] bank_rdata[MAX_RAM_ARRAY_NUM];
    wire [63:0] bank_wdata[MAX_RAM_ARRAY_NUM];
    wire [13-1:0] bank_addr[MAX_RAM_ARRAY_NUM];
    wire [13-1:0] bank_waddr[MAX_RAM_ARRAY_NUM];
    wire [13-1:0] bank_raddr[MAX_RAM_ARRAY_NUM];


  assign bank_sel_waddr[2:0] = write_addr_valid[18:16];
  assign bank_sel_raddr[2:0] = read_addr_valid[18:16];
  assign bank_sel_raddr_p1[2:0] = read_addr_valid_p1[18:16];
  

  assign s_axi_rdata_reg[63:0] = bank_rdata[bank_sel_raddr_p1[0]];

  genvar i, j, k;

  generate

    for(i = 0; i < MAX_RAM_ARRAY_NUM; i++) begin:ram_array_inst
        
        assign bank_rsel[i] = (bank_sel_raddr[2:0] == i) ? 1'b1 : 1'b0;
        assign bank_raddr[i] = (bank_sel_raddr[2:0] == i) ? read_addr_valid[15:3] : 12'h0;
        assign bank_wsel[i] = (bank_sel_waddr[2:0] == i) ? 1'b1 : 1'b0;
        assign bank_waddr[i] = (bank_sel_waddr[2:0] == i) ? write_addr_valid[15:3] : 12'h0;
        assign bank_wdata[i] = s_axi_wdata[63:0]; 
        assign bank_addr[i] = (ssc_wr_en == 1'b1) ? bank_waddr[i] : bank_raddr[i];

    // UMC40lvt Dual Port SRAM, A port write, B port read
    SJLA40_8192X8X8CM8_top u_block_dp_sram(
        .Data_outB	(),	                            .Data_outA	(bank_rdata[i]),
        .Data_inB	(bank_wdata[i]),	            .Data_inA	(64'h0),
        .Addr_B		(bank_waddr[i]),                .Addr_A	    (bank_raddr[i]),
        .WEBN		(~({8{ssc_wr_en}} & s_axi_wstrb)),.WEAN		({8{1'b1}}),		/*低电平有效*/
        .CKB		(clk),		                    .CKA(clk),
        .CSBN		(~({8{(bank_wsel[i] & ssc_wr_en)}})),.CSAN		(~ssc_rd_en),		/*Chip Select*/
        .DVSE		(1'b0),		           
        .DVS		(4'd15),	/*Delay Option Control - Sensing Margine*/
        .NAP		(1'b0)		/*休眠模式*/
    );


    end

  endgenerate

`endif

`ifndef VENDOR_RAM_EN

//initial begin
    // two nested loops for smaller number of iterations per loop
    // workaround for synthesizer complaints about large loop counts
    // for (int i = 0; i < 2**VALID_ADDR_WIDTH; i = i + 2**(VALID_ADDR_WIDTH/2)) begin
    //     for (int j = i; j < i + 2**(VALID_ADDR_WIDTH/2); j = j + 1) begin
    //         mem[j] = 0;s
    //     end
    // end
//end
`endif

always @* begin
    write_state_next = WRITE_STATE_IDLE;

    mem_wr_en = 1'b0;

    write_id_next = write_id_reg;
    write_addr_next = write_addr_reg;
    write_count_next = write_count_reg;
    write_size_next = write_size_reg;
    write_burst_next = write_burst_reg;

    s_axi_awready_next = 1'b0;
    s_axi_wready_next = 1'b0;
    s_axi_bid_next = s_axi_bid_reg;
    s_axi_bvalid_next = s_axi_bvalid_reg && !s_axi_bready;

    case (write_state_reg)
        WRITE_STATE_IDLE: begin
            s_axi_awready_next = 1'b1;

            if (s_axi_awready && s_axi_awvalid) begin
                write_id_next = s_axi_awid;
                write_addr_next = s_axi_awaddr;
                write_count_next = s_axi_awlen;
                write_size_next = s_axi_awsize < $clog2(STRB_WIDTH) ? s_axi_awsize : $clog2(STRB_WIDTH);
                write_burst_next = s_axi_awburst;

                s_axi_awready_next = 1'b0;
                s_axi_wready_next = 1'b1;
                write_state_next = WRITE_STATE_BURST;
            end else begin
                write_state_next = WRITE_STATE_IDLE;
            end
        end
        WRITE_STATE_BURST: begin
            s_axi_wready_next = 1'b1;

            if (s_axi_wready && s_axi_wvalid) begin
                mem_wr_en = 1'b1;
                if (write_burst_reg != 2'b00) begin
                    write_addr_next = write_addr_reg + (1 << write_size_reg);
                end
                write_count_next = write_count_reg - 1;
                if (write_count_reg > 0) begin
                    write_state_next = WRITE_STATE_BURST;
                end else begin
                    s_axi_wready_next = 1'b0;
                    if (s_axi_bready || !s_axi_bvalid) begin
                        s_axi_bid_next = write_id_reg;
                        s_axi_bvalid_next = 1'b1;
                        s_axi_awready_next = 1'b1;
                        write_state_next = WRITE_STATE_IDLE;
                    end else begin
                        write_state_next = WRITE_STATE_RESP;
                    end
                end
            end else begin
                write_state_next = WRITE_STATE_BURST;
            end
        end
        WRITE_STATE_RESP: begin
            if (s_axi_bready || !s_axi_bvalid) begin
                s_axi_bid_next = write_id_reg;
                s_axi_bvalid_next = 1'b1;
                s_axi_awready_next = 1'b1;
                write_state_next = WRITE_STATE_IDLE;
            end else begin
                write_state_next = WRITE_STATE_RESP;
            end
        end
    endcase
end

always @(posedge clk) begin
    if (rst) begin
        write_state_reg <= WRITE_STATE_IDLE;

        write_id_reg <= {ID_WIDTH{1'b0}};
        write_addr_reg <= {ADDR_WIDTH{1'b0}};
        write_count_reg <= 8'h0;
        write_size_reg <= 3'b0;
        write_burst_reg <= 2'b0;

        s_axi_awready_reg <= 1'b0;
        s_axi_wready_reg <= 1'b0;
        s_axi_bvalid_reg <= 1'b0;

    end
    else begin
        write_state_reg <= write_state_next;

        write_id_reg <= write_id_next;
        write_addr_reg <= write_addr_next;
        write_count_reg <= write_count_next;
        write_size_reg <= write_size_next;
        write_burst_reg <= write_burst_next;

        s_axi_awready_reg <= s_axi_awready_next;
        s_axi_wready_reg <= s_axi_wready_next;
        s_axi_bid_reg <= s_axi_bid_next;
        s_axi_bvalid_reg <= s_axi_bvalid_next;

    end


`ifndef VENDOR_RAM_EN

    for (int ll = 0; ll < WORD_WIDTH; ll = ll + 1) begin
        if (ssc_wr_en & s_axi_wstrb[ll]) begin
            mem[write_addr_valid][WORD_SIZE*ll +: WORD_SIZE] <= s_axi_wdata[WORD_SIZE*ll +: WORD_SIZE];
        end
    end

`else


	// // always块的写入过程分三步走(begin)
    // for (genvar int i = 0; i < WORD_WIDTH; i = i + 1) begin
    //     if (ssc_wr_en & s_axi_wstrb[i]) begin
    //         // mem[write_addr_valid][WORD_SIZE*i +: WORD_SIZE] <= s_axi_wdata[WORD_SIZE*i +: WORD_SIZE];
	// 		maddr_reg <= write_addr_valid;
	// 		bl_sel_reg[WORD_SIZE*i +: WORD_SIZE] <= {WORD_SIZE{1'b1}};
	// 		mdata_i_reg[WORD_SIZE*i +: WORD_SIZE] <= s_axi_wdata[WORD_SIZE*i +: WORD_SIZE];
	// 	end
    // end
	// always块的写入过程分三步走(end)

`endif 

end

always @* begin
    read_state_next = READ_STATE_IDLE;

    mem_rd_en = 1'b0;

    s_axi_rid_next = s_axi_rid_reg;
    s_axi_rlast_next = s_axi_rlast_reg;
    s_axi_rvalid_next = s_axi_rvalid_reg && !(s_axi_rready || (PIPELINE_OUTPUT && !s_axi_rvalid_pipe_reg));

    read_id_next = read_id_reg;
    read_addr_next = read_addr_reg;
    read_count_next = read_count_reg;
    read_size_next = read_size_reg;
    read_burst_next = read_burst_reg;

    s_axi_arready_next = 1'b0;

    case (read_state_reg)
        READ_STATE_IDLE: begin
            s_axi_arready_next = 1'b1;

            if (s_axi_arready && s_axi_arvalid) begin
                read_id_next = s_axi_arid;
                read_addr_next = s_axi_araddr;
                read_count_next = s_axi_arlen;
                read_size_next = s_axi_arsize < $clog2(STRB_WIDTH) ? s_axi_arsize : $clog2(STRB_WIDTH);
                read_burst_next = s_axi_arburst;

                s_axi_arready_next = 1'b0;
                read_state_next = READ_STATE_BURST;
            end else begin
                read_state_next = READ_STATE_IDLE;
            end
        end
        READ_STATE_BURST: begin
            if (s_axi_rready || (PIPELINE_OUTPUT && !s_axi_rvalid_pipe_reg) || !s_axi_rvalid_reg) begin
                mem_rd_en = 1'b1;
                s_axi_rvalid_next = 1'b1;
                s_axi_rid_next = read_id_reg;
                s_axi_rlast_next = read_count_reg == 0;
                if (read_burst_reg != 2'b00) begin
                    read_addr_next = read_addr_reg + (1 << read_size_reg);
                end
                read_count_next = read_count_reg - 1;
                if (read_count_reg > 0) begin
                    read_state_next = READ_STATE_BURST;
                end else begin
                    s_axi_arready_next = 1'b1;
                    read_state_next = READ_STATE_IDLE;
                end
            end else begin
                read_state_next = READ_STATE_BURST;
            end
        end
    endcase
end    


always @(posedge clk or posedge rst) begin
    if (rst) begin
        s_axi_rdata_pipe_reg <= {DATA_WIDTH{1'b0}};
    end
    else if (!s_axi_rvalid_pipe_reg || s_axi_rready) begin
        s_axi_rdata_pipe_reg <= s_axi_rdata_reg;
    end
end

always @(posedge clk or posedge rst) begin
    if (rst) begin
        s_axi_rid_pipe_reg <= {ID_WIDTH{1'b0}};
        s_axi_rlast_pipe_reg <= 1'b0;
        s_axi_rvalid_pipe_reg <= 1'b0;
    end    
    else if (!s_axi_rvalid_pipe_reg || s_axi_rready) begin
        s_axi_rid_pipe_reg <= s_axi_rid_reg;
        s_axi_rlast_pipe_reg <= s_axi_rlast_reg;
        s_axi_rvalid_pipe_reg <= s_axi_rvalid_reg;
    end
end


always @(posedge clk or posedge rst) begin

    
    if (rst) begin
        read_state_reg <= READ_STATE_IDLE;

        s_axi_arready_reg <= 1'b0;
        s_axi_rvalid_reg <= 1'b0;
        s_axi_rlast_reg <= 1'b0;

        read_count_reg <= 8'd0;
        read_size_reg <= 3'd0;
        read_burst_reg <= 2'd0;
    end
    else begin
    
        read_state_reg <= read_state_next;

        s_axi_arready_reg <= s_axi_arready_next;
        s_axi_rlast_reg <= s_axi_rlast_next;
        s_axi_rvalid_reg <= s_axi_rvalid_next;

        read_count_reg <= read_count_next;
        read_size_reg <= read_size_next;
        read_burst_reg <= read_burst_next;

    end

end

always @(posedge clk or posedge rst) begin

    if (rst) begin
        read_id_reg <= {ID_WIDTH{1'b0}};
        read_addr_reg <= {ADDR_WIDTH{1'b0}};
        read_addr_valid_p1 <= {ADDR_WIDTH{1'b0}};

        s_axi_rid_reg <= {ID_WIDTH{1'b0}};
    end
    else begin
        read_id_reg <= read_id_next;
        read_addr_reg <= read_addr_next;
        read_addr_valid_p1 <= read_addr_valid;

        s_axi_rid_reg <= s_axi_rid_next;

        `ifndef VENDOR_RAM_EN

            if (mem_rd_en & memory_bank_read_sel) begin
                s_axi_rdata_reg <= mem[read_addr_valid];
            end

        `endif
    end
end

endmodule

// `resetall
// `undef log2