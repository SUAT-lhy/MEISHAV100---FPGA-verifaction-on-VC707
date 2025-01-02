module data_arrays_0(
  input  [8:0] RW0_addr,
  input        RW0_en,
  input        RW0_clk,
  input        RW0_wmode,
  input  [7:0] RW0_wdata_0,
  input  [7:0] RW0_wdata_1,
  input  [7:0] RW0_wdata_2,
  input  [7:0] RW0_wdata_3,
  input  [7:0] RW0_wdata_4,
  input  [7:0] RW0_wdata_5,
  input  [7:0] RW0_wdata_6,
  input  [7:0] RW0_wdata_7,
  input  [7:0] RW0_wdata_8,
  input  [7:0] RW0_wdata_9,
  input  [7:0] RW0_wdata_10,
  input  [7:0] RW0_wdata_11,
  input  [7:0] RW0_wdata_12,
  input  [7:0] RW0_wdata_13,
  input  [7:0] RW0_wdata_14,
  input  [7:0] RW0_wdata_15,
  input  [7:0] RW0_wdata_16,
  input  [7:0] RW0_wdata_17,
  input  [7:0] RW0_wdata_18,
  input  [7:0] RW0_wdata_19,
  input  [7:0] RW0_wdata_20,
  input  [7:0] RW0_wdata_21,
  input  [7:0] RW0_wdata_22,
  input  [7:0] RW0_wdata_23,
  input  [7:0] RW0_wdata_24,
  input  [7:0] RW0_wdata_25,
  input  [7:0] RW0_wdata_26,
  input  [7:0] RW0_wdata_27,
  input  [7:0] RW0_wdata_28,
  input  [7:0] RW0_wdata_29,
  input  [7:0] RW0_wdata_30,
  input  [7:0] RW0_wdata_31,
  output [7:0] RW0_rdata_0,
  output [7:0] RW0_rdata_1,
  output [7:0] RW0_rdata_2,
  output [7:0] RW0_rdata_3,
  output [7:0] RW0_rdata_4,
  output [7:0] RW0_rdata_5,
  output [7:0] RW0_rdata_6,
  output [7:0] RW0_rdata_7,
  output [7:0] RW0_rdata_8,
  output [7:0] RW0_rdata_9,
  output [7:0] RW0_rdata_10,
  output [7:0] RW0_rdata_11,
  output [7:0] RW0_rdata_12,
  output [7:0] RW0_rdata_13,
  output [7:0] RW0_rdata_14,
  output [7:0] RW0_rdata_15,
  output [7:0] RW0_rdata_16,
  output [7:0] RW0_rdata_17,
  output [7:0] RW0_rdata_18,
  output [7:0] RW0_rdata_19,
  output [7:0] RW0_rdata_20,
  output [7:0] RW0_rdata_21,
  output [7:0] RW0_rdata_22,
  output [7:0] RW0_rdata_23,
  output [7:0] RW0_rdata_24,
  output [7:0] RW0_rdata_25,
  output [7:0] RW0_rdata_26,
  output [7:0] RW0_rdata_27,
  output [7:0] RW0_rdata_28,
  output [7:0] RW0_rdata_29,
  output [7:0] RW0_rdata_30,
  output [7:0] RW0_rdata_31,
  input        RW0_wmask_0,
  input        RW0_wmask_1,
  input        RW0_wmask_2,
  input        RW0_wmask_3,
  input        RW0_wmask_4,
  input        RW0_wmask_5,
  input        RW0_wmask_6,
  input        RW0_wmask_7,
  input        RW0_wmask_8,
  input        RW0_wmask_9,
  input        RW0_wmask_10,
  input        RW0_wmask_11,
  input        RW0_wmask_12,
  input        RW0_wmask_13,
  input        RW0_wmask_14,
  input        RW0_wmask_15,
  input        RW0_wmask_16,
  input        RW0_wmask_17,
  input        RW0_wmask_18,
  input        RW0_wmask_19,
  input        RW0_wmask_20,
  input        RW0_wmask_21,
  input        RW0_wmask_22,
  input        RW0_wmask_23,
  input        RW0_wmask_24,
  input        RW0_wmask_25,
  input        RW0_wmask_26,
  input        RW0_wmask_27,
  input        RW0_wmask_28,
  input        RW0_wmask_29,
  input        RW0_wmask_30,
  input        RW0_wmask_31
);
  wire [8:0] data_arrays_0_ext_RW0_addr;
  wire  data_arrays_0_ext_RW0_en;
  wire  data_arrays_0_ext_RW0_clk;
  wire  data_arrays_0_ext_RW0_wmode;
  wire [255:0] data_arrays_0_ext_RW0_wdata;
  wire [255:0] data_arrays_0_ext_RW0_rdata;
  wire [31:0] data_arrays_0_ext_RW0_wmask;
  wire [63:0] _GEN_13 = {RW0_wdata_23,RW0_wdata_22,RW0_wdata_21,RW0_wdata_20,RW0_wdata_19,RW0_wdata_18,RW0_wdata_17,
    RW0_wdata_16};
  wire [63:0] _GEN_27 = {RW0_wdata_7,RW0_wdata_6,RW0_wdata_5,RW0_wdata_4,RW0_wdata_3,RW0_wdata_2,RW0_wdata_1,RW0_wdata_0
    };
  wire [127:0] _GEN_28 = {RW0_wdata_31,RW0_wdata_30,RW0_wdata_29,RW0_wdata_28,RW0_wdata_27,RW0_wdata_26,RW0_wdata_25,
    RW0_wdata_24,_GEN_13};
  wire [127:0] _GEN_29 = {RW0_wdata_15,RW0_wdata_14,RW0_wdata_13,RW0_wdata_12,RW0_wdata_11,RW0_wdata_10,RW0_wdata_9,
    RW0_wdata_8,_GEN_27};
  wire [7:0] _GEN_43 = {RW0_wmask_23,RW0_wmask_22,RW0_wmask_21,RW0_wmask_20,RW0_wmask_19,RW0_wmask_18,RW0_wmask_17,
    RW0_wmask_16};
  wire [7:0] _GEN_57 = {RW0_wmask_7,RW0_wmask_6,RW0_wmask_5,RW0_wmask_4,RW0_wmask_3,RW0_wmask_2,RW0_wmask_1,RW0_wmask_0}
    ;
  wire [15:0] _GEN_58 = {RW0_wmask_31,RW0_wmask_30,RW0_wmask_29,RW0_wmask_28,RW0_wmask_27,RW0_wmask_26,RW0_wmask_25,
    RW0_wmask_24,_GEN_43};
  wire [15:0] _GEN_59 = {RW0_wmask_15,RW0_wmask_14,RW0_wmask_13,RW0_wmask_12,RW0_wmask_11,RW0_wmask_10,RW0_wmask_9,
    RW0_wmask_8,_GEN_57};

`ifdef VENDOR_RAM_EN_SYL

  parameter MAX_RAM_ARRAY_NUM = 4;

  // wire revert_clk_for_ram;

  //   tc_clk_inverter u_tc_clk_inverter(
  //       .clk_i(data_arrays_0_ext_RW0_clk)
  //       ,.clk_o(revert_clk_for_ram)
  //   );
    
  genvar i, j, k;

  generate

    for(i = 0; i < MAX_RAM_ARRAY_NUM; i++) begin:ram_array_inst
        
        // UMC40lvt Dual Port SRAM, A port write, B port read
        SYLB40_512X8X8CM4_top	u0_block_dp_sram(
            .Data_out	(data_arrays_0_ext_RW0_rdata[64*i+:64]),	   
            .Data_in	(data_arrays_0_ext_RW0_wdata[64*i+:64]),	 
            .Addr		  ({data_arrays_0_ext_RW0_addr[8:0]}),
            .WEB		  ({8{data_arrays_0_ext_RW0_wmode}} & data_arrays_0_ext_RW0_wmask[8*i+:8]),	
            .CK		    (data_arrays_0_ext_RW0_clk),		    
            .CSB		  (data_arrays_0_ext_RW0_en),	   	/*Chip Select*/
            .DVSE		  (1'b0),		           
            .DVS		  (4'd15),	/*Delay Option Control - Sensing Margine*/
            .NAP		  (1'b0)							/*休眠模式*/
        );
    end

  endgenerate

`elsif VENDOR_RAM_EN

  parameter MAX_RAM_ARRAY_NUM = 4;

  // wire revert_clk_for_ram;

  //   tc_clk_inverter u_tc_clk_inverter(
  //       .clk_i(data_arrays_0_ext_RW0_clk)
  //       ,.clk_o(revert_clk_for_ram)
  //   );
    
  genvar i, j, k;

  generate

    for(i = 0; i < MAX_RAM_ARRAY_NUM; i++) begin:ram_array_inst
        
        // UMC40lvt Dual Port SRAM, A port write, B port read
        SQLVTLG40_512X8X8CM4b1	u_block_dp_sram(
            .DO	      (data_arrays_0_ext_RW0_rdata[64*i+:64]),	   
            .DI	      (data_arrays_0_ext_RW0_wdata[64*i+:64]),	 
            .A  		  ({data_arrays_0_ext_RW0_addr[8:0]}),
            .WEB		  (~({8{data_arrays_0_ext_RW0_wmode}} & data_arrays_0_ext_RW0_wmask[8*i+:8])),	
            .CK		    (data_arrays_0_ext_RW0_clk),		    
            .CSB		  (~data_arrays_0_ext_RW0_en),	   	/*Chip Select*/
            .DVSE		  (1'b0),		           
            .DVS		  (4'd15)     	/*Delay Option Control - Sensing Margine*/
        );
    end

  endgenerate

`else

  data_arrays_0_ext data_arrays_0_ext (
    .RW0_addr(data_arrays_0_ext_RW0_addr),
    .RW0_en(data_arrays_0_ext_RW0_en),
    .RW0_clk(data_arrays_0_ext_RW0_clk),
    .RW0_wmode(data_arrays_0_ext_RW0_wmode),
    .RW0_wdata(data_arrays_0_ext_RW0_wdata),
    .RW0_rdata(data_arrays_0_ext_RW0_rdata),
    .RW0_wmask(data_arrays_0_ext_RW0_wmask)
  );

`endif

  assign data_arrays_0_ext_RW0_clk = RW0_clk;
  assign data_arrays_0_ext_RW0_en = RW0_en;
  assign data_arrays_0_ext_RW0_addr = RW0_addr;
  assign RW0_rdata_0 = data_arrays_0_ext_RW0_rdata[7:0];
  assign RW0_rdata_1 = data_arrays_0_ext_RW0_rdata[15:8];
  assign RW0_rdata_2 = data_arrays_0_ext_RW0_rdata[23:16];
  assign RW0_rdata_3 = data_arrays_0_ext_RW0_rdata[31:24];
  assign RW0_rdata_4 = data_arrays_0_ext_RW0_rdata[39:32];
  assign RW0_rdata_5 = data_arrays_0_ext_RW0_rdata[47:40];
  assign RW0_rdata_6 = data_arrays_0_ext_RW0_rdata[55:48];
  assign RW0_rdata_7 = data_arrays_0_ext_RW0_rdata[63:56];
  assign RW0_rdata_8 = data_arrays_0_ext_RW0_rdata[71:64];
  assign RW0_rdata_9 = data_arrays_0_ext_RW0_rdata[79:72];
  assign RW0_rdata_10 = data_arrays_0_ext_RW0_rdata[87:80];
  assign RW0_rdata_11 = data_arrays_0_ext_RW0_rdata[95:88];
  assign RW0_rdata_12 = data_arrays_0_ext_RW0_rdata[103:96];
  assign RW0_rdata_13 = data_arrays_0_ext_RW0_rdata[111:104];
  assign RW0_rdata_14 = data_arrays_0_ext_RW0_rdata[119:112];
  assign RW0_rdata_15 = data_arrays_0_ext_RW0_rdata[127:120];
  assign RW0_rdata_16 = data_arrays_0_ext_RW0_rdata[135:128];
  assign RW0_rdata_17 = data_arrays_0_ext_RW0_rdata[143:136];
  assign RW0_rdata_18 = data_arrays_0_ext_RW0_rdata[151:144];
  assign RW0_rdata_19 = data_arrays_0_ext_RW0_rdata[159:152];
  assign RW0_rdata_20 = data_arrays_0_ext_RW0_rdata[167:160];
  assign RW0_rdata_21 = data_arrays_0_ext_RW0_rdata[175:168];
  assign RW0_rdata_22 = data_arrays_0_ext_RW0_rdata[183:176];
  assign RW0_rdata_23 = data_arrays_0_ext_RW0_rdata[191:184];
  assign RW0_rdata_24 = data_arrays_0_ext_RW0_rdata[199:192];
  assign RW0_rdata_25 = data_arrays_0_ext_RW0_rdata[207:200];
  assign RW0_rdata_26 = data_arrays_0_ext_RW0_rdata[215:208];
  assign RW0_rdata_27 = data_arrays_0_ext_RW0_rdata[223:216];
  assign RW0_rdata_28 = data_arrays_0_ext_RW0_rdata[231:224];
  assign RW0_rdata_29 = data_arrays_0_ext_RW0_rdata[239:232];
  assign RW0_rdata_30 = data_arrays_0_ext_RW0_rdata[247:240];
  assign RW0_rdata_31 = data_arrays_0_ext_RW0_rdata[255:248];
  assign data_arrays_0_ext_RW0_wmode = RW0_wmode;
  assign data_arrays_0_ext_RW0_wdata = {_GEN_28,_GEN_29};
  assign data_arrays_0_ext_RW0_wmask = {_GEN_58,_GEN_59};
endmodule