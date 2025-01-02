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

/*
 * AXI4 RAM
 */
module SOC_LSYS #
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

    output wire [31:0] reset_vector_msb_32,
    output wire [3:0] mig_slave_base_addr_msb_4,
    output wire mig_input_takeover_en,

    output wire [9:0]   axi42tl_auto_in_tl_addr_msb_10,
    output wire [15:0]  chiplink_master_addr_msb_16,
    output wire [15:0]  qspi_axi_master_addr_msb_16,
    
    output wire [15:0] tl_master_xing_in_d_bits_resp_control,

    input wire [31:0] transferDataReg,
    input wire        send_1p_valid,
    // rx dfx
    input wire [31:0] b2c_data_concat,
    input wire        b2c_data_valid,

   input wire tile_auto_tl_master_xing_in_d_bits_denied,
   input wire tile_auto_tl_master_xing_in_d_bits_corrupt,
  
   input wire tile_1_auto_tl_master_xing_in_d_bits_denied,
   input wire tile_1_auto_tl_master_xing_in_d_bits_corrupt,
  
   input wire tile_2_auto_tl_master_xing_in_d_bits_denied,
   input wire tile_2_auto_tl_master_xing_in_d_bits_corrupt,
  
   input wire tile_3_auto_tl_master_xing_in_d_bits_denied,
   input wire tile_3_auto_tl_master_xing_in_d_bits_corrupt,


   input wire  [1:0]  spi_mode,
   input wire  [1:0]  spi_master_mode,

   input  wire  [31:0] pll_state,
   output wire  [31:0] use_which_clk,
   output wire  [63:0] pll_cfg,
   input  wire  debug_mode_sel_latch,
   output wire  spi_gpio_mux_sel,
   
   output wire  all_tile_sft_rst,
//    output wire  tile_0_sft_rst,
//    output wire  tile_1_sft_rst,
//    output wire  tile_2_sft_rst,
//    output wire  tile_3_sft_rst,
   output wire  chiplink_sft_rst,
   output wire  spi_0_sft_rst,
   output wire  spi_1_sft_rst,
   output wire  spi_slave_sft_rst,
   output wire  gpio_sft_rst,
   output wire  uart_sft_rst,
   output wire  soc_iram_sft_rst,
   output wire  soc_lsys_sft_rst,
   output wire  soc_sft_rst,
   output wire global_soft_reset_req,

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

    localparam VALID_ADDR_WIDTH = ADDR_WIDTH; // use full addr width

    localparam WORD_WIDTH = STRB_WIDTH;
    localparam WORD_SIZE = DATA_WIDTH/WORD_WIDTH;

    wire [VALID_ADDR_WIDTH-1:0] s_axi_awaddr_valid;
    wire [VALID_ADDR_WIDTH-1:0] s_axi_araddr_valid;
    wire [VALID_ADDR_WIDTH-1:0] read_addr_valid;
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
    // wire						ssc_wr_en;
    // wire						ssc_rd_en;
    reg unlock_reg;
    wire memory_bank_write_sel;
    wire lsys_write_unlock;
    wire memory_bank_read_sel;
    wire lsys_read_sel;
    wire [7:0] master_signal_valid_trigger_int;

    // bus width assertions
    `ifndef SYNTHESIS
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

    localparam [0:0] READ_STATE_IDLE = 1'd0,
                     READ_STATE_BURST = 1'd1;

    reg [0:0] read_state_reg, read_state_next;

    localparam [1:0]    WRITE_STATE_IDLE = 2'd0,    
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


    reg [31:0] reset_vector_msb_32_reg;
    reg [3:0] mig_slave_base_addr_msb_4_reg;  // min 4K 
    reg  mig_input_takeover_en_reg;
    reg [9:0] axi42tl_auto_in_tl_addr_msb_10_reg;

    reg [15:0] tl_master_xing_in_d_bits_resp_control_reg;

    reg [15:0] chiplink_master_addr_msb_16_reg;
    reg [15:0] qspi_axi_master_addr_msb_16_reg;

    wire mig_slave_base_addr_msb_4_write_sel;
    wire reset_vector_msb_32_write_sel;
    wire axi42tl_auto_in_tl_addr_msb_10_write_sel;
    wire chiplink_master_addr_msb_16_write_sel;
    wire qspi_axi_master_addr_msb_16_write_sel;
    wire tl_master_xing_in_d_bits_resp_control_write_sel;
    wire unlock_reg_write_sel;

    // LSYS config

    assign reset_vector_msb_32 = reset_vector_msb_32_reg;
    assign mig_slave_base_addr_msb_4 = mig_slave_base_addr_msb_4_reg;
    assign mig_input_takeover_en = mig_input_takeover_en_reg;
    assign axi42tl_auto_in_tl_addr_msb_10 = axi42tl_auto_in_tl_addr_msb_10_reg;

    assign tl_master_xing_in_d_bits_resp_control = tl_master_xing_in_d_bits_resp_control_reg;

    assign chiplink_master_addr_msb_16 = chiplink_master_addr_msb_16_reg ;
    assign qspi_axi_master_addr_msb_16 = qspi_axi_master_addr_msb_16_reg ;

    assign s_axi_awaddr_valid = s_axi_awaddr >> (ADDR_WIDTH - VALID_ADDR_WIDTH);
    assign s_axi_araddr_valid = s_axi_araddr >> (ADDR_WIDTH - VALID_ADDR_WIDTH);
    assign read_addr_valid = read_addr_reg >> (ADDR_WIDTH - VALID_ADDR_WIDTH);
    assign write_addr_valid = write_addr_reg >> (ADDR_WIDTH - VALID_ADDR_WIDTH);

    assign memory_bank_write_sel = 1'b0;
    assign memory_bank_read_sel = 1'b0;

    assign lsys_write_unlock = unlock_reg;
    assign lsys_read_sel = 1'b1;


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
    // assign	ssc_rd_en = mem_rd_en & memory_bank_read_sel;
    // assign	ssc_wr_en = mem_wr_en & memory_bank_write_sel;
    // assign	r_w_ctrl = ssc_en & mem_rd_en;

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

    always @(posedge clk or posedge rst) begin
        
        if (rst) begin
            write_state_reg <= WRITE_STATE_IDLE;

            s_axi_awready_reg <= 1'b0;
            s_axi_wready_reg <= 1'b0;
            s_axi_bvalid_reg <= 1'b0;
        end
        else begin
            write_state_reg <= write_state_next;

            s_axi_awready_reg <= s_axi_awready_next;
            s_axi_wready_reg <= s_axi_wready_next;
            s_axi_bvalid_reg <= s_axi_bvalid_next;
        end
        
    end

    always @(posedge clk or posedge rst) begin

        if(rst) begin
            write_id_reg <= {ID_WIDTH{1'b0}};
            write_addr_reg <= {ADDR_WIDTH{1'b0}};
            write_count_reg <= {8{1'b0}};
            write_size_reg <= {3{1'b0}};
            write_burst_reg <= {2{1'b0}};

            s_axi_bid_reg <= {ID_WIDTH{1'b0}};
        end
        else begin
            write_id_reg <= write_id_next;
            write_addr_reg <= write_addr_next;
            write_count_reg <= write_count_next;
            write_size_reg <= write_size_next;
            write_burst_reg <= write_burst_next;

            s_axi_bid_reg <= s_axi_bid_next;
        end

    end



    //assign mig_slave_base_addr_msb_4_read_sel = (mem_rd_en & lsys_read_sel & );
    //assign axi42tl_auto_in_tl_addr_msb_10_read_sel;
 

    assign unlock_reg_write_sel = (mem_wr_en & (write_addr_reg[11:0] == 12'h00));

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            unlock_reg <= 1'h1;  //  default unlock
        end
        else if (unlock_reg_write_sel) begin
            unlock_reg <= s_axi_wdata[32-1:0] == 32'h6868_6868 ? 1'b1 : 1'b0;
        end
    end

    wire      pll_cfg_msb32_sel;
    wire      pll_cfg_lsb32_sel;
    reg [63:0] pll_cfg_reg;

    assign pll_cfg_lsb32_sel = (mem_wr_en & lsys_write_unlock & (write_addr_reg[11:0] == 12'h08));

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            pll_cfg_reg[31:0] <= 32'b000; 
        end
        else if (pll_cfg_lsb32_sel) begin
            pll_cfg_reg[31:0] <= s_axi_wdata[32-1:0];
        end
    end

    
    assign pll_cfg_msb32_sel = (mem_wr_en & lsys_write_unlock & (write_addr_reg[11:0] == 12'h10));

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            pll_cfg_reg[63:32] <= 32'b000; 
        end
        else if (pll_cfg_msb32_sel) begin
            pll_cfg_reg[63:32] <= s_axi_wdata[32-1:0];
        end
    end

    assign pll_cfg = pll_cfg_reg;

    wire       use_which_clk_sel;
    reg [31:0] use_which_clk_reg;

    assign use_which_clk_sel = (mem_wr_en & lsys_write_unlock & (write_addr_reg[11:0] == 12'h18));

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            use_which_clk_reg <= 32'b0; 
        end
        else if (use_which_clk_sel) begin
            use_which_clk_reg <= s_axi_wdata[32-1:0];
        end
    end

    assign use_which_clk = use_which_clk_reg;

    wire      pll_state_sel;
    reg [31:0] pll_state_reg;

    assign pll_state_sel = (mem_wr_en & lsys_write_unlock & (write_addr_reg[11:0] == 12'h20));

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            pll_state_reg <= 32'h0; 
        end
        else begin
            pll_state_reg <= {debug_mode_sel_latch, pll_state[30:0]};
        end
    end


    wire      sft_rst_sel;
    reg [31:0] sft_rst_reg;

    assign sft_rst_sel = (mem_wr_en & lsys_write_unlock & (write_addr_reg[11:0] == 12'h28));

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            sft_rst_reg[31:4] <= {31{1'b0}}; 
//            sft_rst_reg[0] <= 1'b0 | debug_mode_sel_latch;  // for tile reset, debug mode donnot deassert reset
            sft_rst_reg[0] <= 1'b0;
        end
        else if (sft_rst_sel) begin
            sft_rst_reg <= s_axi_wdata[32-1:0];
        end
    end

    // assign tile_0_sft_rst = sft_rst_reg[0];
    // assign tile_1_sft_rst = sft_rst_reg[1];
    // assign tile_2_sft_rst = sft_rst_reg[2];
    // assign tile_3_sft_rst = sft_rst_reg[3];
    assign all_tile_sft_rst = sft_rst_reg[0]; // all tile use common rst, for backend implement
    assign chiplink_sft_rst = sft_rst_reg[4];
    assign spi_0_sft_rst = sft_rst_reg[5];
    assign spi_1_sft_rst = sft_rst_reg[6];
    assign spi_slave_sft_rst = sft_rst_reg[7];
    assign gpio_sft_rst = sft_rst_reg[8];
    assign uart_sft_rst = sft_rst_reg[9];
    assign soc_iram_sft_rst = sft_rst_reg[10];
    assign soc_lsys_sft_rst = sft_rst_reg[11];
    assign soc_sft_rst = sft_rst_reg[12];

    assign mig_slave_base_addr_msb_4_write_sel = (mem_wr_en & lsys_write_unlock & (write_addr_reg[11:0] == 12'h40));

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            mig_slave_base_addr_msb_4_reg <= 4'h7;  //  for ddr default base access addr is 32'h8000_0000 - 32'h1000_0000
            mig_input_takeover_en_reg <= 1'b1;
        end
        else if (mig_slave_base_addr_msb_4_write_sel) begin
            mig_slave_base_addr_msb_4_reg <= s_axi_wdata[4-1:0];
            mig_input_takeover_en_reg <= s_axi_wdata[31];
        end
    end

    assign axi42tl_auto_in_tl_addr_msb_10_write_sel = (mem_wr_en & lsys_write_unlock & (write_addr_reg[11:0] == 12'h48));
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            axi42tl_auto_in_tl_addr_msb_10_reg <= {6'h0, 4'h0};
        end
        else if (axi42tl_auto_in_tl_addr_msb_10_write_sel) begin
            axi42tl_auto_in_tl_addr_msb_10_reg <=  s_axi_wdata[32-1:0];
        end
    end

    assign reset_vector_msb_32_write_sel = (mem_wr_en & lsys_write_unlock & (write_addr_reg[11:0] == 12'h60));
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            reset_vector_msb_32_reg <= 32'h5000_0000;  // on chip ram
        end
        else if (reset_vector_msb_32_write_sel) begin
            reset_vector_msb_32_reg <= s_axi_wdata[32-1:0];
        end
    end

    assign chiplink_master_addr_msb_16_write_sel = (mem_wr_en & lsys_write_unlock & (write_addr_reg[11:0] == 12'h80));
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            chiplink_master_addr_msb_16_reg <= {1'b0, 11'b0, 4'h0};  // default do not override addr
        end
        else if (chiplink_master_addr_msb_16_write_sel) begin
            chiplink_master_addr_msb_16_reg <= s_axi_wdata[32-1:0];
        end
    end

    assign qspi_axi_master_addr_msb_16_write_sel = (mem_wr_en & lsys_write_unlock & (write_addr_reg[11:0] == 12'h88));
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            qspi_axi_master_addr_msb_16_reg <= {1'b0, 11'b0, 4'h0};  // default do not override addr
        end
        else if (qspi_axi_master_addr_msb_16_write_sel) begin
            qspi_axi_master_addr_msb_16_reg <= s_axi_wdata[32-1:0];
        end
    end
    
    assign tl_master_xing_in_d_bits_resp_control_write_sel = (mem_wr_en & lsys_write_unlock & (write_addr_reg[11:0] == 12'hC0));
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            tl_master_xing_in_d_bits_resp_control_reg[7:0] <= {8'hff};  // default override resp
        end
        else if (tl_master_xing_in_d_bits_resp_control_write_sel) begin
            tl_master_xing_in_d_bits_resp_control_reg[7:0] <= s_axi_wdata[7:0];
        end
    end

    wire global_soft_reset_write_sel;
    
    reg [31:0] global_soft_reset_reg;
    reg [31:0] global_soft_reset_reg_1d;

    assign global_soft_reset_write_sel = (mem_wr_en & lsys_write_unlock & (write_addr_reg[11:0] == 12'hD0));

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            global_soft_reset_reg[31:0] <= {32'h0};  // default override resp
        end
        else if (global_soft_reset_write_sel) begin
            global_soft_reset_reg[31:0] <= s_axi_wdata[31:0];
        end
    end
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            global_soft_reset_reg_1d[31:0] <= {32'h0};
        end
        else begin
            global_soft_reset_reg_1d[31:0] <= global_soft_reset_reg[31:0];
        end
    end

    assign global_soft_reset_req = (global_soft_reset_reg_1d[31:0] == 32'h7a7a_6f7f) & (global_soft_reset_reg[31:0] == 32'h6868_a7a8);


    wire spi_gpio_mux_sel_write_sel;
    
    reg [31:0] spi_gpio_mux_sel_reg;

    assign spi_gpio_mux_sel_write_sel = (mem_wr_en & lsys_write_unlock & (write_addr_reg[11:0] == 12'hE0));
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            spi_gpio_mux_sel_reg[31:0] <= {32'h0};
        end
        else if (spi_gpio_mux_sel_write_sel) begin
            spi_gpio_mux_sel_reg[31:0] <= s_axi_wdata[31:0];
        end
    end
    assign spi_gpio_mux_sel = spi_gpio_mux_sel_reg[0];

    // wire rst_length_write_sel;
    // reg [8:0] rst_length_reg;
    // reg [8:0] global_soft_reset_cnt;

    // assign rst_length_write_sel = (mem_wr_en & lsys_write_unlock & (write_addr_reg[11:0] == 12'hD8));
    // always @(posedge clk or posedge rst) begin
    //     if (rst) begin
    //         rst_length_reg[8:0] <= {8'h0};  // default override resp
    //     end
    //     else if (rst_length_write_sel) begin
    //         rst_length_reg[7:0] <= s_axi_wdata[7:0];
    //     end
    // end



    assign master_signal_valid_trigger_int = {tile_3_auto_tl_master_xing_in_d_bits_corrupt, tile_3_auto_tl_master_xing_in_d_bits_denied, tile_2_auto_tl_master_xing_in_d_bits_corrupt, tile_2_auto_tl_master_xing_in_d_bits_denied, tile_1_auto_tl_master_xing_in_d_bits_corrupt, tile_1_auto_tl_master_xing_in_d_bits_denied, tile_auto_tl_master_xing_in_d_bits_corrupt, tile_auto_tl_master_xing_in_d_bits_denied};

// generate tile_resp_record
  for (genvar k = 0; k < 8; k++) begin : gen_tile_resp_record
    signal_valid_record master_tile_resp_record (
        .clk(clk)
        ,.rst_n(~rst)
        ,.signal_valid(master_signal_valid_trigger_int[k])
        ,.signal_int_clear(tl_master_xing_in_d_bits_resp_control_write_sel&s_axi_wdata[8+k])
        ,.signal_valid_record_int_reg(tl_master_xing_in_d_bits_resp_control_reg[8+k])
    );

  end

    wire      spi_state_sel;
    reg [3:0] spi_state_reg;

    assign spi_state_sel = (mem_wr_en & lsys_write_unlock & (write_addr_reg[11:0] == 12'hA0));

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            spi_state_reg <= 4'h0; 
        end
        else begin
            spi_state_reg <= {spi_master_mode[1:0], spi_mode[1:0]};
        end
    end

    reg [31:0] chiplink_tx_data_reg;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            chiplink_tx_data_reg <= 32'h0; 
        end
        else if(send_1p_valid) begin
            chiplink_tx_data_reg <= transferDataReg;
        end
    end

    reg [31:0] chiplink_rx_data_reg;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            chiplink_rx_data_reg <= 32'h0; 
        end
        else if(b2c_data_valid) begin
            chiplink_rx_data_reg <= b2c_data_concat;
        end
    end
       
    always @(posedge clk or posedge rst) begin
        
        if (rst) begin
            s_axi_rdata_reg <= 64'h0;
        end
        // get rdata from reg
        else if (mem_rd_en & lsys_read_sel) begin
            case(read_addr_valid[11:0])
                12'h0: begin
                    s_axi_rdata_reg <= {32'b0, 31'b0, unlock_reg};
                end
                12'h08: begin
                    s_axi_rdata_reg <= {32'b0, pll_cfg_reg[31:0]};
                end
                12'h10: begin
                    s_axi_rdata_reg <= {32'b0, pll_cfg_reg[63:32]};
                end
                12'h18: begin
                    s_axi_rdata_reg <= {32'b0, 29'b0, use_which_clk_reg[2:0]};
                end
                12'h20: begin
                    s_axi_rdata_reg <= {32'b0, pll_state_reg[31:0]};
                end
                12'h28: begin
                    s_axi_rdata_reg <= {32'b0, sft_rst_reg[31:0]};
                end
                12'h40: begin
                    s_axi_rdata_reg <= {32'b0, 28'b0, mig_slave_base_addr_msb_4_reg[3:0]};
                end
                12'h48: begin
                    s_axi_rdata_reg <= {32'b0, 28'b0, axi42tl_auto_in_tl_addr_msb_10_reg[9:0]};
                end
                12'h60: begin
                    s_axi_rdata_reg <= {32'b0, 28'b0, reset_vector_msb_32_reg[31:0]};
                end
                12'h80: begin
                    s_axi_rdata_reg <= {32'b0, 16'b0, chiplink_master_addr_msb_16_reg[15:0]};
                end
                12'h88: begin
                    s_axi_rdata_reg <= {32'b0, 16'b0, qspi_axi_master_addr_msb_16_reg[15:0]};
                end
                12'hA0: begin
                    s_axi_rdata_reg <= {32'b0, 28'b0, spi_state_reg[3:0]};
                end
                12'hB0: begin
                    s_axi_rdata_reg <= {32'b0, 28'b0, chiplink_tx_data_reg[31:0]};
                end
                12'hB8: begin
                    s_axi_rdata_reg <= {32'b0, 28'b0, chiplink_rx_data_reg[31:0]};
                end
                12'hC0: begin
                    s_axi_rdata_reg <= {32'b0, 16'b0, tl_master_xing_in_d_bits_resp_control_reg[15:0]};
                end
                12'hD0: begin
                    s_axi_rdata_reg <= {32'b0, 16'b0, global_soft_reset_reg[31:0]};
                end
                12'hE0: begin
                    s_axi_rdata_reg <= {32'b0, 16'b0, 31'b0, spi_gpio_mux_sel_reg[0]};
                end
                
                default: s_axi_rdata_reg <= {DATA_WIDTH{1'b0}};
            endcase
        end

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
        s_axi_rvalid_pipe_reg <= 1'b0;
        s_axi_rlast_pipe_reg <= 1'b0;
        s_axi_rid_pipe_reg <= {ID_WIDTH{1'b0}};
    end
    else if (!s_axi_rvalid_pipe_reg || s_axi_rready) begin
        s_axi_rid_pipe_reg <= s_axi_rid_reg;
        s_axi_rlast_pipe_reg <= s_axi_rlast_reg;
        s_axi_rvalid_pipe_reg <= s_axi_rvalid_reg;
    end

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
        read_state_reg <= READ_STATE_IDLE;

        s_axi_arready_reg <= 1'b0;
        s_axi_rvalid_reg <= 1'b0;
        s_axi_rlast_reg <= 1'b0;
        s_axi_rid_reg <= {ID_WIDTH{1'b0}};
    end
    else begin 
        read_state_reg <= read_state_next;

        s_axi_arready_reg <= s_axi_arready_next;
        s_axi_rid_reg <= s_axi_rid_next;
        s_axi_rlast_reg <= s_axi_rlast_next;
        s_axi_rvalid_reg <= s_axi_rvalid_next;
    end

end

always @(posedge clk or posedge rst) begin
    
    if (rst) begin
        read_id_reg <= {ID_WIDTH{1'b0}};
        read_addr_reg <= {ADDR_WIDTH{1'b0}};
        read_count_reg <= {8{1'b0}};
        read_size_reg <= {3{1'b0}};
        read_burst_reg <= {2{1'b0}};
    end
    else begin 
        read_id_reg <= read_id_next;
        read_addr_reg <= read_addr_next;
        read_count_reg <= read_count_next;
        read_size_reg <= read_size_next;
        read_burst_reg <= read_burst_next;
    end

end


endmodule

// `resetall

// `undef log2
