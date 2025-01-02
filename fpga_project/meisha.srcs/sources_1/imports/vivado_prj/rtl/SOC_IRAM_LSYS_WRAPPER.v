module SOC_IRAM_LSYS_WRAPPER
#(
    parameter AXI4_ADDRESS_WIDTH = 28,
    parameter AXI4_RDATA_WIDTH   = 64,
    parameter AXI4_WDATA_WIDTH   = 64,
    parameter AXI4_USER_WIDTH    = 1,
    parameter AXI4_ID_WIDTH      = 5
) ( 

  output wire [3:0] reset_vector_msb_4,
  output wire [3:0] mig_slave_base_addr_msb_4,

  output wire [15:0] qspi_axi_master_addr_msb_16,
  output wire [15:0] chiplink_master_addr_msb_16,
  
  output wire [9:0] axi42tl_auto_in_tl_addr_msb_10,
  output wire [5:0] axi42tl_auto_in_aw_addr_msb_6,
  output wire [5:0] axi42tl_auto_in_ar_addr_msb_6,

  output wire [15:0] tl_master_xing_in_d_bits_resp_control,

   input wire tile_auto_tl_master_xing_in_d_bits_denied,
   input wire tile_auto_tl_master_xing_in_d_bits_corrupt,
  
   input wire tile_1_auto_tl_master_xing_in_d_bits_denied,
   input wire tile_1_auto_tl_master_xing_in_d_bits_corrupt,
  
   input wire tile_2_auto_tl_master_xing_in_d_bits_denied,
   input wire tile_2_auto_tl_master_xing_in_d_bits_corrupt,
  
   input wire tile_3_auto_tl_master_xing_in_d_bits_denied,
   input wire tile_3_auto_tl_master_xing_in_d_bits_corrupt,

  input         axi_aclk,
  input         axi_aresetn,


  output        auto_slave_in_aw_ready, 
  input         auto_slave_in_aw_valid, 
  input  [AXI4_ID_WIDTH-1:0]  auto_slave_in_aw_bits_id, 
  input  [AXI4_ADDRESS_WIDTH-1:0] auto_slave_in_aw_bits_addr, 
  input  [7:0]  auto_slave_in_aw_bits_len, 
  input  [2:0]  auto_slave_in_aw_bits_size, 
  input  [1:0]  auto_slave_in_aw_bits_burst, 
  output        auto_slave_in_w_ready, 
  input         auto_slave_in_w_valid, 
  input  [AXI4_WDATA_WIDTH-1:0] auto_slave_in_w_bits_data, 
  input  [AXI4_WDATA_WIDTH/8-1:0]  auto_slave_in_w_bits_strb, 
  input         auto_slave_in_w_bits_last, 
  input         auto_slave_in_b_ready, 
  output        auto_slave_in_b_valid, 
  output [AXI4_ID_WIDTH-1:0]  auto_slave_in_b_bits_id, 
  output [1:0]  auto_slave_in_b_bits_resp, 
  output        auto_slave_in_ar_ready, 
  input         auto_slave_in_ar_valid, 
  input  [AXI4_ID_WIDTH-1:0]  auto_slave_in_ar_bits_id, 
  input  [AXI4_ADDRESS_WIDTH-1:0] auto_slave_in_ar_bits_addr, 
  input  [7:0]  auto_slave_in_ar_bits_len, 
  input  [2:0]  auto_slave_in_ar_bits_size, 
  input  [1:0]  auto_slave_in_ar_bits_burst, 
  input         auto_slave_in_r_ready, 
  output        auto_slave_in_r_valid, 
  output [AXI4_ID_WIDTH-1:0]  auto_slave_in_r_bits_id, 
  output [AXI4_RDATA_WIDTH-1:0] auto_slave_in_r_bits_data, 
  output [1:0]  auto_slave_in_r_bits_resp, 
  output        auto_slave_in_r_bits_last
);


  assign axi42tl_auto_in_aw_addr_msb_6 = 6'b0;
  assign axi42tl_auto_in_ar_addr_msb_6 = 6'b0;

soc_iram_lsys #(
    .DATA_WIDTH(AXI4_WDATA_WIDTH),
    .ADDR_WIDTH(AXI4_ADDRESS_WIDTH), // 256byte
    .STRB_WIDTH(AXI4_WDATA_WIDTH/8),
    .ID_WIDTH(AXI4_ID_WIDTH),
    .PIPELINE_OUTPUT(0)
)
 u_soc_iram_lsys (
    .clk(axi_aclk),
    .rst(~axi_aresetn),

    .tl_master_xing_in_d_bits_resp_control(tl_master_xing_in_d_bits_resp_control),

    .tile_auto_tl_master_xing_in_d_bits_denied(tile_auto_tl_master_xing_in_d_bits_denied),
    .tile_auto_tl_master_xing_in_d_bits_corrupt(tile_auto_tl_master_xing_in_d_bits_corrupt),
  
    .tile_1_auto_tl_master_xing_in_d_bits_denied(tile_1_auto_tl_master_xing_in_d_bits_denied),
    .tile_1_auto_tl_master_xing_in_d_bits_corrupt(tile_1_auto_tl_master_xing_in_d_bits_corrupt),
  
    .tile_2_auto_tl_master_xing_in_d_bits_denied(tile_2_auto_tl_master_xing_in_d_bits_denied),
    .tile_2_auto_tl_master_xing_in_d_bits_corrupt(tile_2_auto_tl_master_xing_in_d_bits_corrupt),
  
    .tile_3_auto_tl_master_xing_in_d_bits_denied(tile_3_auto_tl_master_xing_in_d_bits_denied),
    .tile_3_auto_tl_master_xing_in_d_bits_corrupt(tile_3_auto_tl_master_xing_in_d_bits_corrupt),

    .reset_vector_msb_4(reset_vector_msb_4),
    .mig_slave_base_addr_msb_4(mig_slave_base_addr_msb_4),
    .axi42tl_auto_in_tl_addr_msb_10(axi42tl_auto_in_tl_addr_msb_10),
    .chiplink_master_addr_msb_16(chiplink_master_addr_msb_16),
    .qspi_axi_master_addr_msb_16(qspi_axi_master_addr_msb_16),
    
    .s_axi_awid(auto_slave_in_aw_bits_id),
    .s_axi_awaddr(auto_slave_in_aw_bits_addr),
    .s_axi_awlen(auto_slave_in_aw_bits_len),
    .s_axi_awsize(auto_slave_in_aw_bits_size),
    .s_axi_awburst(auto_slave_in_aw_bits_burst),
    .s_axi_awlock(1'h0),
    .s_axi_awcache(4'h0),
    .s_axi_awprot(3'h0),
    .s_axi_awvalid(auto_slave_in_aw_valid),
    .s_axi_awready(auto_slave_in_aw_ready),
    .s_axi_wdata(auto_slave_in_w_bits_data),
    .s_axi_wstrb(auto_slave_in_w_bits_strb),
    .s_axi_wlast(auto_slave_in_w_bits_last),
    .s_axi_wvalid(auto_slave_in_w_valid),
    .s_axi_wready(auto_slave_in_w_ready),
    .s_axi_bid(auto_slave_in_b_bits_id),
    .s_axi_bresp(auto_slave_in_b_bits_resp),
    .s_axi_bvalid(auto_slave_in_b_valid),
    .s_axi_bready(auto_slave_in_b_ready),
    .s_axi_arid(auto_slave_in_ar_bits_id),
    .s_axi_araddr(auto_slave_in_ar_bits_addr),
    .s_axi_arlen(auto_slave_in_ar_bits_len),
    .s_axi_arsize(auto_slave_in_ar_bits_size),
    .s_axi_arburst(auto_slave_in_ar_bits_burst),
    .s_axi_arlock(1'h0),
    .s_axi_arcache(4'h0),
    .s_axi_arprot(3'h0),
    .s_axi_arvalid(auto_slave_in_ar_valid),
    .s_axi_arready(auto_slave_in_ar_ready),
    .s_axi_rid(auto_slave_in_r_bits_id),
    .s_axi_rdata(auto_slave_in_r_bits_data),
    .s_axi_rresp(auto_slave_in_r_bits_resp),
    .s_axi_rlast(auto_slave_in_r_bits_last),
    .s_axi_rvalid(auto_slave_in_r_valid),
    .s_axi_rready(auto_slave_in_r_ready)
);
  

endmodule
