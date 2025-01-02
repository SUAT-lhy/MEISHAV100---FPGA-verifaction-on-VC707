module QSPI_SPI_WRAPPER
#(
    parameter SPI_MASTER_AXI4_ADDRESS_WIDTH = 32,
    parameter SPI_MASTER_AXI4_RDATA_WIDTH   = 32,
    parameter SPI_MASTER_AXI4_WDATA_WIDTH   = 32,
    parameter SPI_MASTER_AXI4_USER_WIDTH    = 4,
    parameter SPI_MASTER_AXI4_ID_WIDTH      = 16,
    parameter SPI_MASTER_BUFFER_DEPTH       = 8
) ( 
  `ifdef USE_C2C_FOR_PCIE
    output        io_c2b_clk,
    output        io_c2b_rst,
    output        io_c2b_send,
    output [7:0]  io_c2b_data,
    input         io_b2c_clk,
    input         io_b2c_rst,
    input         io_b2c_send,
    input  [7:0]  io_b2c_data,
  `else
    input  wire                        spi_sclk,
    input  wire                        spi_cs,
    input  wire                        axi_spi_slave_test_mode,
    output wire  [1:0]                 spi_mode,
    input  wire                        spi_sdi0,
    input  wire                        spi_sdi1,
    input  wire                        spi_sdi2,
    input  wire                        spi_sdi3,
    output wire                        spi_sdo0,
    output wire                        spi_sdo1,
    output wire                        spi_sdo2,
    output wire                        spi_sdo3,
    output wire   [3:0]                spi_sdo_oen,
  `endif 

  output wire spi_master_clk,
  output wire [3:0] spi_master_csn,
  output wire [1:0] spi_master_mode,
  output wire [3:0] spi_master_sdo,
  output wire [3:0] spi_master_sdo_oen,
  input  wire [3:0] spi_master_sdi,
  output wire [1:0] spi_master_events_o,

  input         axi_aclk,
  input         axi_aresetn,
  input         axi_master_aresetn,
  input         auto_master_out_aw_ready, 
  output        auto_master_out_aw_valid, 
  output [31:0] auto_master_out_aw_addr, 
  output [7:0]  auto_master_out_aw_len, 
  output [2:0]  auto_master_out_aw_size, 
  output [1:0]  auto_master_out_aw_burst,

  output [3:0] auto_master_out_aw_id,


  output [2:0] auto_master_out_aw_prot,
  output [3:0] auto_master_out_aw_region,
  output [3:0] auto_master_out_aw_cache,
  output [3:0] auto_master_out_aw_qos,


  input         auto_master_out_w_ready, 
  output        auto_master_out_w_valid, 
  output [63:0] auto_master_out_w_data, 
  output [7:0]  auto_master_out_w_strb, 
  output        auto_master_out_w_last, 
  output        auto_master_out_b_ready, 
  input         auto_master_out_b_valid, 
  input  [1:0]  auto_master_out_b_resp, 
  input [3:0] auto_master_out_b_id,

  input         auto_master_out_ar_ready, 
  output        auto_master_out_ar_valid, 
  output [31:0] auto_master_out_ar_addr, 
  output [7:0]  auto_master_out_ar_len, 
  output [2:0]  auto_master_out_ar_size, 
  output [1:0]  auto_master_out_ar_burst, 

  output [3:0] auto_master_out_ar_id,

  output [2:0] auto_master_out_ar_prot,
  output [3:0] auto_master_out_ar_region,
  output [3:0] auto_master_out_ar_cache,
  output [3:0] auto_master_out_ar_qos,
  
  output        auto_master_out_r_ready, 
  input         auto_master_out_r_valid, 
  input  [63:0] auto_master_out_r_data, 
  input  [1:0]  auto_master_out_r_resp, 
  input         auto_master_out_r_last,
  input [3:0] auto_master_out_r_id,


  `ifdef USE_PCIE_CONTROLLER_SLAVE
  output        auto_control_in_awready, 
  input         auto_control_in_awvalid, 
  input  [37:0] auto_control_in_awaddr, 
  output        auto_control_in_wready, 
  input         auto_control_in_wvalid, 
  input  [31:0] auto_control_in_wdata, 
  input  [3:0]  auto_control_in_wstrb, 
  input         auto_control_in_bready, 
  output        auto_control_in_bvalid, 
  output [1:0]  auto_control_in_bresp, 
  output        auto_control_in_arready, 
  input         auto_control_in_arvalid, 
  input  [37:0] auto_control_in_araddr, 
  input         auto_control_in_rready, 
  output        auto_control_in_rvalid, 
  output [31:0] auto_control_in_rdata, 
  output [1:0]  auto_control_in_rresp,
  `endif

    input  logic                          s_axi_awvalid,
    input  logic      [SPI_MASTER_AXI4_ID_WIDTH-1:0] s_axi_awid,
    input  logic                    [7:0] s_axi_awlen,
    input  logic [SPI_MASTER_AXI4_ADDRESS_WIDTH-1:0] s_axi_awaddr,
    input  logic    [SPI_MASTER_AXI4_USER_WIDTH-1:0] s_axi_awuser,
    output logic                          s_axi_awready,

    input  logic                          s_axi_wvalid,
    input  logic   [SPI_MASTER_AXI4_WDATA_WIDTH-1:0] s_axi_wdata,
    input  logic [SPI_MASTER_AXI4_WDATA_WIDTH/8-1:0] s_axi_wstrb,
    input  logic                          s_axi_wlast,
    input  logic    [SPI_MASTER_AXI4_USER_WIDTH-1:0] s_axi_wuser,
    output logic                          s_axi_wready,

    output logic                          s_axi_bvalid,
    output logic      [SPI_MASTER_AXI4_ID_WIDTH-1:0] s_axi_bid,
    output logic                    [1:0] s_axi_bresp,
    output logic    [SPI_MASTER_AXI4_USER_WIDTH-1:0] s_axi_buser,
    input  logic                          s_axi_bready,

    input  logic                          s_axi_arvalid,
    input  logic      [SPI_MASTER_AXI4_ID_WIDTH-1:0] s_axi_arid,
    input  logic                    [7:0] s_axi_arlen,
    input  logic [SPI_MASTER_AXI4_ADDRESS_WIDTH-1:0] s_axi_araddr,
    input  logic    [SPI_MASTER_AXI4_USER_WIDTH-1:0] s_axi_aruser,
    output logic                          s_axi_arready,

    output logic                          s_axi_rvalid,
    output logic      [SPI_MASTER_AXI4_ID_WIDTH-1:0] s_axi_rid,
    output logic   [SPI_MASTER_AXI4_RDATA_WIDTH-1:0] s_axi_rdata,
    output logic                    [1:0] s_axi_rresp,
    output logic                          s_axi_rlast,
    output logic    [SPI_MASTER_AXI4_USER_WIDTH-1:0] s_axi_ruser,
    input  logic                          s_axi_rready


);

  

  wire auto_master_out_aw_lock;
  wire auto_master_out_aw_user;
  wire auto_master_out_ar_lock;
  wire auto_master_out_ar_user;
  wire auto_master_out_w_user; 


`ifdef USE_C2C_FOR_PCIE

 CHIPLINK_PREFIX_ChipLinkMaster chipLinkConverter ( 
    .clock(axi_aclk),
    .reset(~axi_aresetn),
    .slave_0_awready(s_axi_awready),
    .slave_0_awvalid(s_axi_awvalid),
    .slave_0_awid(s_axi_awid),
    .slave_0_awaddr(s_axi_awaddr),
    .slave_0_awlen(s_axi_awlen),
    .slave_0_awsize(s_axi_awsize),
    .slave_0_awburst(s_axi_awburst),
    .slave_0_wready(s_axi_wready),
    .slave_0_wvalid(s_axi_wvalid),
    .slave_0_wdata(s_axi_wdata),
    .slave_0_wstrb(s_axi_wstrb),
    .slave_0_wlast(s_axi_wlast),
    .slave_0_bready(s_axi_bready),
    .slave_0_bvalid(s_axi_bvalid),
    .slave_0_bid(s_axi_bid),
    .slave_0_bresp(s_axi_bresp),
    .slave_0_arready(s_axi_arready),
    .slave_0_arvalid(s_axi_arvalid),
    .slave_0_arid(s_axi_arid),
    .slave_0_araddr(s_axi_araddr),
    .slave_0_arlen(s_axi_arlen),
    .slave_0_arsize(s_axi_arsize),
    .slave_0_arburst(s_axi_arburst),
    .slave_0_rready(s_axi_rready),
    .slave_0_rvalid(s_axi_rvalid),
    .slave_0_rid(s_axi_rid),
    .slave_0_rdata(s_axi_rdata),
    .slave_0_rresp(s_axi_rresp),
    .slave_0_rlast(s_axi_rlast),
    .master_mem_0_awready(auto_master_out_aw_ready),
    .master_mem_0_awvalid(auto_master_out_aw_valid),
    .master_mem_0_awid(auto_master_out_aw_id),
    .master_mem_0_awaddr(chiplink_master_awaddr),
    .master_mem_0_awlen(auto_master_out_aw_len),
    .master_mem_0_awsize(auto_master_out_aw_size),
    .master_mem_0_awburst(auto_master_out_aw_burst),
    .master_mem_0_wready(auto_master_out_w_ready),
    .master_mem_0_wvalid(auto_master_out_w_valid),
    .master_mem_0_wdata(auto_master_out_w_data),
    .master_mem_0_wstrb(auto_master_out_w_strb),
    .master_mem_0_wlast(auto_master_out_w_last),
    .master_mem_0_bready(auto_master_out_bready),
    .master_mem_0_bvalid(auto_master_out_bvalid),
    .master_mem_0_bid(auto_master_out_bid),
    .master_mem_0_bresp(auto_master_out_bresp),
    .master_mem_0_arready(auto_master_out_ar_ready),
    .master_mem_0_arvalid(auto_master_out_ar_valid),
    .master_mem_0_arid(auto_master_out_ar_id),
    .master_mem_0_araddr(chiplink_master_araddr),
    .master_mem_0_arlen(auto_master_out_ar_len),
    .master_mem_0_arsize(auto_master_out_ar_size),
    .master_mem_0_arburst(auto_master_out_ar_burst),
    .master_mem_0_rready(auto_master_out_r_ready),
    .master_mem_0_rvalid(auto_master_out_r_valid),
    .master_mem_0_rid(auto_master_out_r_id),
    .master_mem_0_rdata(auto_master_out_r_data),
    .master_mem_0_rresp(auto_master_out_r_resp),
    .master_mem_0_rlast(auto_master_out_r_last),
    .fpga_io_c2b_clk(io_c2b_clk),
    .fpga_io_c2b_rst(io_c2b_rst),
    .fpga_io_c2b_send(io_c2b_send),
    .fpga_io_c2b_data(io_c2b_data),
    .fpga_io_b2c_clk(io_b2c_clk),
    .fpga_io_b2c_rst(io_b2c_rst),
    .fpga_io_b2c_send(io_b2c_send),
    .fpga_io_b2c_data(io_b2c_data)
  );

`else

axi_spi_slave #(
    .AXI_ADDR_WIDTH(32),
    .AXI_DATA_WIDTH(64),
    .AXI_USER_WIDTH(1),
    .AXI_ID_WIDTH(4),
    .DUMMY_CYCLES(32)
  ) u_axi_spi_slave (
    .test_mode(axi_spi_slave_test_mode),
    .spi_sclk(spi_sclk),
    .spi_cs(spi_cs),
    .spi_mode(spi_mode),
    .spi_sdi0(spi_sdi0),
    .spi_sdi1(spi_sdi1),
    .spi_sdi2(spi_sdi2),
    .spi_sdi3(spi_sdi3),
    .spi_sdo0(spi_sdo0),
    .spi_sdo1(spi_sdo1),
    .spi_sdo2(spi_sdo2),
    .spi_sdo3(spi_sdo3),
    .sdo_oen(spi_sdo_oen),

    // AXI4 MASTER
    //***************************************
    .axi_aclk(axi_aclk),
    .axi_aresetn(axi_aresetn),
    // WRITE ADDRESS CHANNEL
    .axi_master_aw_valid(auto_master_out_aw_valid),
    .axi_master_aw_addr(auto_master_out_aw_addr),
    .axi_master_aw_prot(auto_master_out_aw_prot),
    .axi_master_aw_region(auto_master_out_aw_region),
    .axi_master_aw_len(auto_master_out_aw_len),
    .axi_master_aw_size(auto_master_out_aw_size),
    .axi_master_aw_burst(auto_master_out_aw_burst),
    .axi_master_aw_lock(auto_master_out_aw_lock),
    .axi_master_aw_cache(auto_master_out_aw_cache),
    .axi_master_aw_qos(auto_master_out_aw_qos),
    .axi_master_aw_id(auto_master_out_aw_id),
    .axi_master_aw_user(auto_master_out_aw_user),
    .axi_master_aw_ready(auto_master_out_aw_ready),

    // READ ADDRESS CHANNEL
    .axi_master_ar_valid(auto_master_out_ar_valid),
    .axi_master_ar_addr(auto_master_out_ar_addr),
    .axi_master_ar_prot(auto_master_out_ar_prot),
    .axi_master_ar_region(auto_master_out_ar_region),
    .axi_master_ar_len(auto_master_out_ar_len),
    .axi_master_ar_size(auto_master_out_ar_size),
    .axi_master_ar_burst(auto_master_out_ar_burst),
    .axi_master_ar_lock(auto_master_out_ar_lock),
    .axi_master_ar_cache(auto_master_out_ar_cache),
    .axi_master_ar_qos(auto_master_out_ar_qos),
    .axi_master_ar_id(auto_master_out_ar_id),
    .axi_master_ar_user(auto_master_out_ar_user),
    .axi_master_ar_ready(auto_master_out_ar_ready),

    // WRITE DATA CHANNEL
    .axi_master_w_valid(auto_master_out_w_valid),
    .axi_master_w_data(auto_master_out_w_data),
    .axi_master_w_strb(auto_master_out_w_strb),
    .axi_master_w_user(auto_master_out_w_user),
    .axi_master_w_last(auto_master_out_w_last),
    .axi_master_w_ready(auto_master_out_w_ready),

    // READ DATA CHANNEL
    .axi_master_r_valid(auto_master_out_r_valid),
    .axi_master_r_data(auto_master_out_r_data),
    .axi_master_r_resp(auto_master_out_r_resp),
    .axi_master_r_last(auto_master_out_r_last),
    .axi_master_r_id(auto_master_out_r_id),
    .axi_master_r_user(1'b0),
    .axi_master_r_ready(auto_master_out_r_ready),

    // WRITE RESPONSE CHANNEL
    .axi_master_b_valid(auto_master_out_b_valid),
    .axi_master_b_resp(auto_master_out_b_resp),
    .axi_master_b_id(auto_master_out_b_id),
    .axi_master_b_user(1'b0),
    .axi_master_b_ready(auto_master_out_b_ready)
);
`endif

axi_spi_master #(
    .AXI4_ADDRESS_WIDTH(SPI_MASTER_AXI4_ADDRESS_WIDTH),
    .AXI4_RDATA_WIDTH(SPI_MASTER_AXI4_RDATA_WIDTH),
    .AXI4_WDATA_WIDTH(SPI_MASTER_AXI4_WDATA_WIDTH),
    .AXI4_USER_WIDTH(SPI_MASTER_AXI4_USER_WIDTH),
    .AXI4_ID_WIDTH(SPI_MASTER_AXI4_ID_WIDTH),
    .BUFFER_DEPTH(SPI_MASTER_BUFFER_DEPTH)
  ) u_axi_spi_master (
    .events_o(spi_master_events_o),
    .spi_clk(spi_master_clk),
    .spi_csn0(spi_master_csn[0]),
    .spi_csn1(spi_master_csn[1]),
    .spi_csn2(spi_master_csn[2]),
    .spi_csn3(spi_master_csn[3]),
    .spi_mode(spi_master_mode),
    .spi_sdi0(spi_master_sdi[0]),
    .spi_sdi1(spi_master_sdi[1]),
    .spi_sdi2(spi_master_sdi[2]),
    .spi_sdi3(spi_master_sdi[3]),
    .spi_sdo0(spi_master_sdo[0]),
    .spi_sdo1(spi_master_sdo[1]),
    .spi_sdo2(spi_master_sdo[2]),
    .spi_sdo3(spi_master_sdo[3]),
    .sdo_oen(spi_master_sdo_oen),

    // AXI4 MASTER
    //***************************************
    .s_axi_aclk(axi_aclk),
    .s_axi_aresetn(axi_master_aresetn),

  `ifndef USE_PCIE_CONTROLLER_SLAVE

    .s_axi_awvalid(s_axi_awvalid),
    .s_axi_awid(s_axi_awid),
    .s_axi_awlen(s_axi_awlen),
    .s_axi_awaddr(s_axi_awaddr),
    .s_axi_awuser(s_axi_awuser),
    .s_axi_awready(s_axi_awready),

    .s_axi_wvalid(s_axi_wvalid),
    .s_axi_wdata(s_axi_wdata),
    .s_axi_wstrb(s_axi_wstrb),
    .s_axi_wlast(s_axi_wlast),
    .s_axi_wuser(s_axi_wuser),
    .s_axi_wready(s_axi_wready),

    .s_axi_bvalid(s_axi_bvalid),
    .s_axi_bid(s_axi_bid),
    .s_axi_bresp(s_axi_bresp),
    .s_axi_buser(s_axi_buser),
    .s_axi_bready(s_axi_bready),

    .s_axi_arvalid(s_axi_arvalid),
    .s_axi_arid(s_axi_arid),
    .s_axi_arlen(s_axi_arlen),
    .s_axi_araddr(s_axi_araddr),
    .s_axi_aruser(s_axi_aruser),
    .s_axi_arready(s_axi_arready),

    .s_axi_rvalid(s_axi_rvalid),
    .s_axi_rid(s_axi_rid),
    .s_axi_rdata(s_axi_rdata),
    .s_axi_rresp(s_axi_rresp),
    .s_axi_rlast(s_axi_rlast),
    .s_axi_ruser(s_axi_ruser),
    .s_axi_rready(s_axi_rready)


  `else

    .s_axi_awvalid(auto_control_in_awvalid),
    .s_axi_awid(1'b0),
    .s_axi_awlen(8'h0),
    .s_axi_awaddr(auto_control_in_awaddr),
    .s_axi_awuser(1'b0),
    .s_axi_awready(auto_control_in_awready),

    .s_axi_wvalid(auto_control_in_wvalid),
    .s_axi_wdata(auto_control_in_wdata),
    .s_axi_wstrb(auto_control_in_wstrb),
    .s_axi_wlast(1'b1),
    .s_axi_wuser(1'b1),
    .s_axi_wready(auto_control_in_wready),

    .s_axi_bvalid(auto_control_in_bvalid),
    .s_axi_bid(),
    .s_axi_bresp(auto_control_in_bresp),
    .s_axi_buser(),
    .s_axi_bready(auto_control_in_bready),

    .s_axi_arvalid(auto_control_in_arvalid),
    .s_axi_arid(1'h0),
    .s_axi_arlen(8'h0),
    .s_axi_araddr(auto_control_in_araddr),
    .s_axi_aruser(1'b1),
    .s_axi_arready(auto_control_in_arready),

    .s_axi_rvalid(auto_control_in_rvalid),
    .s_axi_rid(),
    .s_axi_rdata(auto_control_in_rdata),
    .s_axi_rresp(auto_control_in_rresp),
    .s_axi_rlast(),
    .s_axi_ruser(),
    .s_axi_rready(auto_control_in_rready)
  `endif
);



endmodule
