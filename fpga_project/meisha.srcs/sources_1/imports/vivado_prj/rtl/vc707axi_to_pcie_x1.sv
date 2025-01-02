module vc707axi_to_pcie_x1( 
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
    input  logic                        spi_sclk,
    input  logic                        spi_cs,
    output logic  [1:0]                 spi_mode,
    input  logic                        spi_sdi0,
    input  logic                        spi_sdi1,
    input  logic                        spi_sdi2,
    input  logic                        spi_sdi3,
    output logic                        spi_sdo0,
    output logic                        spi_sdo1,
    output logic                        spi_sdo2,
    output logic                        spi_sdo3,
  `endif
      input s_axi_ctl_rready
    , output s_axi_ctl_rvalid
    , output [1:0] s_axi_ctl_rresp
    , output [31:0] s_axi_ctl_rdata
    , output s_axi_ctl_arready
    , input s_axi_ctl_arvalid
    , input [31:0] s_axi_ctl_araddr
    , input s_axi_ctl_bready
    , output s_axi_ctl_bvalid
    , output [1:0] s_axi_ctl_bresp
    , output s_axi_ctl_wready
    , input s_axi_ctl_wvalid
    , input [3:0] s_axi_ctl_wstrb
    , input [31:0] s_axi_ctl_wdata
    , output s_axi_ctl_awready
    , input s_axi_ctl_awvalid
    , input [31:0] s_axi_ctl_awaddr
    , input m_axi_rvalid
    , input m_axi_rlast
    , input [1:0] m_axi_rresp
    , input [63:0] m_axi_rdata
    , output m_axi_rready
    , input m_axi_arready
    , output m_axi_arvalid
    , output [2:0] m_axi_arprot
    , output [3:0] m_axi_arcache
    , output m_axi_arlock
    , output [1:0] m_axi_arburst
    , output [2:0] m_axi_arsize
    , output [7:0] m_axi_arlen
    , output [31:0] m_axi_araddr
    , input m_axi_bvalid
    , input [1:0] m_axi_bresp
    , output m_axi_bready
    , input m_axi_wready
    , output m_axi_wvalid
    , output m_axi_wlast
    , output [7:0] m_axi_wstrb
    , output [63:0] m_axi_wdata
    , input m_axi_awready
    , output m_axi_awvalid
    , output [2:0] m_axi_awprot
    , output [3:0] m_axi_awcache
    , output m_axi_awlock
    , output [1:0] m_axi_awburst
    , output [2:0] m_axi_awsize
    , output [7:0] m_axi_awlen
    , output [31:0] m_axi_awaddr
    , output s_axi_rvalid
    , output s_axi_rlast
    , output [1:0] s_axi_rresp
    , output [63:0] s_axi_rdata
    , output [3:0] s_axi_rid
    , input s_axi_rready
    , output s_axi_arready
    , input s_axi_arvalid
    , input [1:0] s_axi_arburst
    , input [2:0] s_axi_arsize
    , input [7:0] s_axi_arlen
    , input [3:0] s_axi_arregion
    , input [31:0] s_axi_araddr
    , input [3:0] s_axi_arid
    , output s_axi_bvalid
    , output [1:0] s_axi_bresp
    , output [3:0] s_axi_bid
    , input s_axi_bready
    , output s_axi_wready
    , input s_axi_wvalid
    , input s_axi_wlast
    , input [7:0] s_axi_wstrb
    , input [63:0] s_axi_wdata
    , output s_axi_awready
    , input s_axi_awvalid
    , input [1:0] s_axi_awburst
    , input [2:0] s_axi_awsize
    , input [7:0] s_axi_awlen
    , input [3:0] s_axi_awregion
    , input [31:0] s_axi_awaddr
    , input [3:0] s_axi_awid
    , output interrupt_out
    , output [2:0] MSI_Vector_Width
    , input [4:0] MSI_Vector_Num
    , input MSI_enable
    , output INTX_MSI_Grant
    , input INTX_MSI_Request
    , input REFCLK
    , output mmcm_lock
    , output axi_ctl_aclk_out
    , output axi_aclk_out
    , input axi_aresetn
    , input pci_exp_rxn
    , input pci_exp_rxp
    , output pci_exp_txn
    , output pci_exp_txp
  );


    assign interrupt_out = 'h0;
    assign MSI_Vector_Width = 'h0;
    assign INTX_MSI_Grant = 'h0;
    assign pci_exp_txn = 'h0;
    assign pci_exp_txp = 'h0;

    // other signal along with pcie - > bus
    assign axi_ctl_aclk_out = REFCLK;
    assign axi_aclk_out = REFCLK;
    assign mmcm_lock = 1;

  wire [31:0]  pcie_master_base_awaddr;
  wire [31:0]  chiplink_master_awaddr;

  wire [31:0]  pcie_master_base_araddr;
  wire [31:0]  chiplink_master_araddr;

  assign m_axi_awaddr = pcie_master_base_awaddr + chiplink_master_awaddr;
  assign m_axi_araddr = pcie_master_base_araddr + chiplink_master_araddr;


pcie_lsys #(
    .DATA_WIDTH(32),
    .ADDR_WIDTH(10), // 256byte
    .STRB_WIDTH(4),
    .ID_WIDTH(1),
    .PIPELINE_OUTPUT(0)
)
 u_lsys (
    .clk(REFCLK),
    .rst(~axi_aresetn),

    .pcie_master_base_awaddr(pcie_master_base_awaddr),
    .pcie_master_base_araddr(pcie_master_base_araddr),

    .s_axi_awid(1'h0),
    .s_axi_awaddr(s_axi_ctl_awaddr[9:0]),
    .s_axi_awlen(8'h0),
    .s_axi_awsize(3'h2),
    .s_axi_awburst(2'h1),
    .s_axi_awlock(1'h0),
    .s_axi_awcache(4'h0),
    .s_axi_awprot(3'h0),
    .s_axi_awvalid(s_axi_ctl_awvalid),
    .s_axi_awready(s_axi_ctl_awready),
    .s_axi_wdata(s_axi_ctl_wdata),
    .s_axi_wstrb(s_axi_ctl_wstrb),
    .s_axi_wlast(1'h1),
    .s_axi_wvalid(s_axi_ctl_wvalid),
    .s_axi_wready(s_axi_ctl_wready),
    .s_axi_bid(),
    .s_axi_bresp(s_axi_ctl_bresp),
    .s_axi_bvalid(s_axi_ctl_bvalid),
    .s_axi_bready(s_axi_ctl_bready),
    .s_axi_arid(1'h0),
    .s_axi_araddr(s_axi_ctl_araddr[9:0]),
    .s_axi_arlen(8'h0),
    .s_axi_arsize(3'h2),
    .s_axi_arburst(2'h1),
    .s_axi_arlock(1'h0),
    .s_axi_arcache(4'h0),
    .s_axi_arprot(3'h0),
    .s_axi_arvalid(s_axi_ctl_arvalid),
    .s_axi_arready(s_axi_ctl_arready),
    .s_axi_rid(),
    .s_axi_rdata(s_axi_ctl_rdata),
    .s_axi_rresp(s_axi_ctl_rresp),
    .s_axi_rlast(),
    .s_axi_rvalid(s_axi_ctl_rvalid),
    .s_axi_rready(s_axi_ctl_rready)
);
  
  wire [3:0] m_axi_awid;
  wire [3:0] m_axi_arid;
  wire [3:0] m_axi_wid;
  wire [3:0] m_axi_rid;
  wire [3:0] m_axi_bid;
  wire [3:0] m_axi_awregion;
  wire [3:0] m_axi_arregion;
  wire [3:0] m_axi_awqos;
  wire [3:0] m_axi_arqos;
  wire  m_axi_awuser;
  wire  m_axi_aruser;
  wire  m_axi_wuser;
  wire  m_axi_buser;
  wire  m_axi_ruser;

  assign m_axi_rid = 0;
  assign m_axi_bid = 0;
  assign m_axi_buser = 0;
  assign m_axi_ruser = 0;



`ifdef USE_C2C_FOR_PCIE

 CHIPLINK_PREFIX_ChipLinkMaster chipLinkConverter ( 
    .clock(axi_aclk_out),
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
    .master_mem_0_awready(m_axi_awready),
    .master_mem_0_awvalid(m_axi_awvalid),
    .master_mem_0_awid(m_axi_awid),
    .master_mem_0_awaddr(chiplink_master_awaddr),
    .master_mem_0_awlen(m_axi_awlen),
    .master_mem_0_awsize(m_axi_awsize),
    .master_mem_0_awburst(m_axi_awburst),
    .master_mem_0_wready(m_axi_wready),
    .master_mem_0_wvalid(m_axi_wvalid),
    .master_mem_0_wdata(m_axi_wdata),
    .master_mem_0_wstrb(m_axi_wstrb),
    .master_mem_0_wlast(m_axi_wlast),
    .master_mem_0_bready(m_axi_bready),
    .master_mem_0_bvalid(m_axi_bvalid),
    .master_mem_0_bid(m_axi_bid),
    .master_mem_0_bresp(m_axi_bresp),
    .master_mem_0_arready(m_axi_arready),
    .master_mem_0_arvalid(m_axi_arvalid),
    .master_mem_0_arid(m_axi_arid),
    .master_mem_0_araddr(chiplink_master_araddr),
    .master_mem_0_arlen(m_axi_arlen),
    .master_mem_0_arsize(m_axi_arsize),
    .master_mem_0_arburst(m_axi_arburst),
    .master_mem_0_rready(m_axi_rready),
    .master_mem_0_rvalid(m_axi_rvalid),
    .master_mem_0_rid(m_axi_rid),
    .master_mem_0_rdata(m_axi_rdata),
    .master_mem_0_rresp(m_axi_rresp),
    .master_mem_0_rlast(m_axi_rlast),
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
  ) u_axi_spl_slave (
    .test_mode(1'b0),
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

    // AXI4 MASTER
    //***************************************
    .axi_aclk(axi_aclk_out),
    .axi_aresetn(axi_aresetn),
    // WRITE ADDRESS CHANNEL
    .axi_master_aw_valid(m_axi_awvalid),
    .axi_master_aw_addr(chiplink_master_awaddr),
    .axi_master_aw_prot(m_axi_awprot),
    .axi_master_aw_region(m_axi_awregion),
    .axi_master_aw_len(m_axi_awlen),
    .axi_master_aw_size(m_axi_awsize),
    .axi_master_aw_burst(m_axi_awburst),
    .axi_master_aw_lock(m_axi_awlock),
    .axi_master_aw_cache(m_axi_awcache),
    .axi_master_aw_qos(m_axi_awqos),
    .axi_master_aw_id(m_axi_awid),
    .axi_master_aw_user(m_axi_awuser),
    .axi_master_aw_ready(m_axi_awready),

    // READ ADDRESS CHANNEL
    .axi_master_ar_valid(m_axi_arvalid),
    .axi_master_ar_addr(chiplink_master_araddr),
    .axi_master_ar_prot(m_axi_arprot),
    .axi_master_ar_region(m_axi_arregion),
    .axi_master_ar_len(m_axi_arlen),
    .axi_master_ar_size(m_axi_arsize),
    .axi_master_ar_burst(m_axi_arburst),
    .axi_master_ar_lock(m_axi_arlock),
    .axi_master_ar_cache(m_axi_arcache),
    .axi_master_ar_qos(m_axi_arqos),
    .axi_master_ar_id(m_axi_arid),
    .axi_master_ar_user(m_axi_aruser),
    .axi_master_ar_ready(m_axi_arready),

    // WRITE DATA CHANNEL
    .axi_master_w_valid(m_axi_wvalid),
    .axi_master_w_data(m_axi_wdata),
    .axi_master_w_strb(m_axi_wstrb),
    .axi_master_w_user(m_axi_wuser),
    .axi_master_w_last(m_axi_wlast),
    .axi_master_w_ready(m_axi_wready),

    // READ DATA CHANNEL
    .axi_master_r_valid(m_axi_rvalid),
    .axi_master_r_data(m_axi_rdata),
    .axi_master_r_resp(m_axi_rresp),
    .axi_master_r_last(m_axi_rlast),
    .axi_master_r_id(m_axi_rid),
    .axi_master_r_user(m_axi_ruser),
    .axi_master_r_ready(m_axi_rready),

    // WRITE RESPONSE CHANNEL
    .axi_master_b_valid(m_axi_bvalid),
    .axi_master_b_resp(m_axi_bresp),
    .axi_master_b_id(m_axi_bid),
    .axi_master_b_user(m_axi_buser),
    .axi_master_b_ready(m_axi_bready)
);
`endif

endmodule
