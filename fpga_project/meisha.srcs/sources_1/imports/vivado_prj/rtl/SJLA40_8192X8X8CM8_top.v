module SJLA40_8192X8X8CM8_top
(
    input   wire            CKA,        // 时钟信号A
    input   wire            CKB,        // 时钟信号B
    input   wire            CSAN,       // 片选信号A (低电平有效)
    input   wire            CSBN,       // 片选信号B (低电平有效)
    input   wire    [7:0]   WEAN,       // 写使能信号A (64位)
    input   wire    [7:0]   WEBN,       // 写使能信号B (64位)
    input   wire            NAP,        // 低功耗模式信号
    input   wire            DVSE,       // 动态电压调节使能
    input   wire    [3:0]   DVS,        // 动态电压调节选择
    input   wire    [12:0]  Addr_A,     // 地址信号A
    input   wire    [12:0]  Addr_B,     // 地址信号B
    input   wire    [63:0]  Data_inA,   // 输入数据A (64位)
    input   wire    [63:0]  Data_inB,   // 输入数据B (64位)
    output  wire    [63:0]  Data_outA,  // 输出数据A (64位)
    output  wire    [63:0]  Data_outB   // 输出数据B (64位)
);

// 实例化64位双端口SRAM
SJLA40_8192X8X8CM8 u_SJLA40_8192X8X8CM8
(
    .CKA(CKA),              // 时钟A
    .CKB(CKB),              // 时钟B
    .CSAN(CSAN),            // 片选信号A
    .CSBN(CSBN),            // 片选信号B
    .NAP(NAP),              // 低功耗模式
    .DVSE(DVSE),            // 动态电压调节使能
    .DVS0(DVS[0]),          // 动态电压调节选择0
    .DVS1(DVS[1]),          // 动态电压调节选择1
    .DVS2(DVS[2]),          // 动态电压调节选择2
    .DVS3(DVS[3]),          // 动态电压调节选择3
    
    .A0(Addr_A[0]), .A1(Addr_A[1]), .A2(Addr_A[2]), .A3(Addr_A[3]),
    .A4(Addr_A[4]), .A5(Addr_A[5]), .A6(Addr_A[6]), .A7(Addr_A[7]),
    .A8(Addr_A[8]), .A9(Addr_A[9]), .A10(Addr_A[10]), .A11(Addr_A[11]), .A12(Addr_A[12]),

    .B0(Addr_B[0]), .B1(Addr_B[1]), .B2(Addr_B[2]), .B3(Addr_B[3]),
    .B4(Addr_B[4]), .B5(Addr_B[5]), .B6(Addr_B[6]), .B7(Addr_B[7]),
    .B8(Addr_B[8]), .B9(Addr_B[9]), .B10(Addr_B[10]), .B11(Addr_B[11]), .B12(Addr_B[12]),

   
    .WEAN0(WEAN[0]), .WEAN1(WEAN[1]), .WEAN2(WEAN[2]), .WEAN3(WEAN[3]),
    .WEAN4(WEAN[4]), .WEAN5(WEAN[5]), .WEAN6(WEAN[6]), .WEAN7(WEAN[7]),
    

    .WEBN0(WEBN[0]), .WEBN1(WEBN[1]), .WEBN2(WEBN[2]), .WEBN3(WEBN[3]),
    .WEBN4(WEBN[4]), .WEBN5(WEBN[5]), .WEBN6(WEBN[6]), .WEBN7(WEBN[7]),
    

    // 64位数据输入输出映射
    .DIA0(Data_inA[0]), .DIA1(Data_inA[1]), .DIA2(Data_inA[2]), .DIA3(Data_inA[3]),
    .DIA4(Data_inA[4]), .DIA5(Data_inA[5]), .DIA6(Data_inA[6]), .DIA7(Data_inA[7]),
    .DIA8(Data_inA[8]), .DIA9(Data_inA[9]), .DIA10(Data_inA[10]), .DIA11(Data_inA[11]),
    .DIA12(Data_inA[12]), .DIA13(Data_inA[13]), .DIA14(Data_inA[14]), .DIA15(Data_inA[15]),
    .DIA16(Data_inA[16]), .DIA17(Data_inA[17]), .DIA18(Data_inA[18]), .DIA19(Data_inA[19]),
    .DIA20(Data_inA[20]), .DIA21(Data_inA[21]), .DIA22(Data_inA[22]), .DIA23(Data_inA[23]),
    .DIA24(Data_inA[24]), .DIA25(Data_inA[25]), .DIA26(Data_inA[26]), .DIA27(Data_inA[27]),
    .DIA28(Data_inA[28]), .DIA29(Data_inA[29]), .DIA30(Data_inA[30]), .DIA31(Data_inA[31]),
    .DIA32(Data_inA[32]), .DIA33(Data_inA[33]), .DIA34(Data_inA[34]), .DIA35(Data_inA[35]),
    .DIA36(Data_inA[36]), .DIA37(Data_inA[37]), .DIA38(Data_inA[38]), .DIA39(Data_inA[39]),
    .DIA40(Data_inA[40]), .DIA41(Data_inA[41]), .DIA42(Data_inA[42]), .DIA43(Data_inA[43]),
    .DIA44(Data_inA[44]), .DIA45(Data_inA[45]), .DIA46(Data_inA[46]), .DIA47(Data_inA[47]),
    .DIA48(Data_inA[48]), .DIA49(Data_inA[49]), .DIA50(Data_inA[50]), .DIA51(Data_inA[51]),
    .DIA52(Data_inA[52]), .DIA53(Data_inA[53]), .DIA54(Data_inA[54]), .DIA55(Data_inA[55]),
    .DIA56(Data_inA[56]), .DIA57(Data_inA[57]), .DIA58(Data_inA[58]), .DIA59(Data_inA[59]),
    .DIA60(Data_inA[60]), .DIA61(Data_inA[61]), .DIA62(Data_inA[62]), .DIA63(Data_inA[63]),
    
    .DIB0(Data_inB[0]), .DIB1(Data_inB[1]), .DIB2(Data_inB[2]), .DIB3(Data_inB[3]),
    .DIB4(Data_inB[4]), .DIB5(Data_inB[5]), .DIB6(Data_inB[6]), .DIB7(Data_inB[7]),
    .DIB8(Data_inB[8]), .DIB9(Data_inB[9]), .DIB10(Data_inB[10]), .DIB11(Data_inB[11]),
    .DIB12(Data_inB[12]), .DIB13(Data_inB[13]), .DIB14(Data_inB[14]), .DIB15(Data_inB[15]),
    .DIB16(Data_inB[16]), .DIB17(Data_inB[17]), .DIB18(Data_inB[18]), .DIB19(Data_inB[19]),
    .DIB20(Data_inB[20]), .DIB21(Data_inB[21]), .DIB22(Data_inB[22]), .DIB23(Data_inB[23]),
    .DIB24(Data_inB[24]), .DIB25(Data_inB[25]), .DIB26(Data_inB[26]), .DIB27(Data_inB[27]),
    .DIB28(Data_inB[28]), .DIB29(Data_inB[29]), .DIB30(Data_inB[30]), .DIB31(Data_inB[31]),
    .DIB32(Data_inB[32]), .DIB33(Data_inB[33]), .DIB34(Data_inB[34]), .DIB35(Data_inB[35]),
    .DIB36(Data_inB[36]), .DIB37(Data_inB[37]), .DIB38(Data_inB[38]), .DIB39(Data_inB[39]),
    .DIB40(Data_inB[40]), .DIB41(Data_inB[41]), .DIB42(Data_inB[42]), .DIB43(Data_inB[43]),
    .DIB44(Data_inB[44]), .DIB45(Data_inB[45]), .DIB46(Data_inB[46]), .DIB47(Data_inB[47]),
    .DIB48(Data_inB[48]), .DIB49(Data_inB[49]), .DIB50(Data_inB[50]), .DIB51(Data_inB[51]),
    .DIB52(Data_inB[52]), .DIB53(Data_inB[53]), .DIB54(Data_inB[54]), .DIB55(Data_inB[55]),
    .DIB56(Data_inB[56]), .DIB57(Data_inB[57]), .DIB58(Data_inB[58]), .DIB59(Data_inB[59]),
    .DIB60(Data_inB[60]), .DIB61(Data_inB[61]), .DIB62(Data_inB[62]), .DIB63(Data_inB[63]),

    .DOA0(Data_outA[0]), .DOA1(Data_outA[1]), .DOA2(Data_outA[2]), .DOA3(Data_outA[3]),
    .DOA4(Data_outA[4]), .DOA5(Data_outA[5]), .DOA6(Data_outA[6]), .DOA7(Data_outA[7]),
    .DOA8(Data_outA[8]), .DOA9(Data_outA[9]), .DOA10(Data_outA[10]), .DOA11(Data_outA[11]),
    .DOA12(Data_outA[12]), .DOA13(Data_outA[13]), .DOA14(Data_outA[14]), .DOA15(Data_outA[15]),
    .DOA16(Data_outA[16]), .DOA17(Data_outA[17]), .DOA18(Data_outA[18]), .DOA19(Data_outA[19]),
    .DOA20(Data_outA[20]), .DOA21(Data_outA[21]), .DOA22(Data_outA[22]), .DOA23(Data_outA[23]),
    .DOA24(Data_outA[24]), .DOA25(Data_outA[25]), .DOA26(Data_outA[26]), .DOA27(Data_outA[27]),
    .DOA28(Data_outA[28]), .DOA29(Data_outA[29]), .DOA30(Data_outA[30]), .DOA31(Data_outA[31]),
    .DOA32(Data_outA[32]), .DOA33(Data_outA[33]), .DOA34(Data_outA[34]), .DOA35(Data_outA[35]),
    .DOA36(Data_outA[36]), .DOA37(Data_outA[37]), .DOA38(Data_outA[38]), .DOA39(Data_outA[39]),
    .DOA40(Data_outA[40]), .DOA41(Data_outA[41]), .DOA42(Data_outA[42]), .DOA43(Data_outA[43]),
    .DOA44(Data_outA[44]), .DOA45(Data_outA[45]), .DOA46(Data_outA[46]), .DOA47(Data_outA[47]),
    .DOA48(Data_outA[48]), .DOA49(Data_outA[49]), .DOA50(Data_outA[50]), .DOA51(Data_outA[51]),
    .DOA52(Data_outA[52]), .DOA53(Data_outA[53]), .DOA54(Data_outA[54]), .DOA55(Data_outA[55]),
    .DOA56(Data_outA[56]), .DOA57(Data_outA[57]), .DOA58(Data_outA[58]), .DOA59(Data_outA[59]),
    .DOA60(Data_outA[60]), .DOA61(Data_outA[61]), .DOA62(Data_outA[62]), .DOA63(Data_outA[63]),

    .DOB0(Data_outB[0]), .DOB1(Data_outB[1]), .DOB2(Data_outB[2]), .DOB3(Data_outB[3]),
    .DOB4(Data_outB[4]), .DOB5(Data_outB[5]), .DOB6(Data_outB[6]), .DOB7(Data_outB[7]),
    .DOB8(Data_outB[8]), .DOB9(Data_outB[9]), .DOB10(Data_outB[10]), .DOB11(Data_outB[11]),
    .DOB12(Data_outB[12]), .DOB13(Data_outB[13]), .DOB14(Data_outB[14]), .DOB15(Data_outB[15]),
    .DOB16(Data_outB[16]), .DOB17(Data_outB[17]), .DOB18(Data_outB[18]), .DOB19(Data_outB[19]),
    .DOB20(Data_outB[20]), .DOB21(Data_outB[21]), .DOB22(Data_outB[22]), .DOB23(Data_outB[23]),
    .DOB24(Data_outB[24]), .DOB25(Data_outB[25]), .DOB26(Data_outB[26]), .DOB27(Data_outB[27]),
    .DOB28(Data_outB[28]), .DOB29(Data_outB[29]), .DOB30(Data_outB[30]), .DOB31(Data_outB[31]),
    .DOB32(Data_outB[32]), .DOB33(Data_outB[33]), .DOB34(Data_outB[34]), .DOB35(Data_outB[35]),
    .DOB36(Data_outB[36]), .DOB37(Data_outB[37]), .DOB38(Data_outB[38]), .DOB39(Data_outB[39]),
    .DOB40(Data_outB[40]), .DOB41(Data_outB[41]), .DOB42(Data_outB[42]), .DOB43(Data_outB[43]),
    .DOB44(Data_outB[44]), .DOB45(Data_outB[45]), .DOB46(Data_outB[46]), .DOB47(Data_outB[47]),
    .DOB48(Data_outB[48]), .DOB49(Data_outB[49]), .DOB50(Data_outB[50]), .DOB51(Data_outB[51]),
    .DOB52(Data_outB[52]), .DOB53(Data_outB[53]), .DOB54(Data_outB[54]), .DOB55(Data_outB[55]),
    .DOB56(Data_outB[56]), .DOB57(Data_outB[57]), .DOB58(Data_outB[58]), .DOB59(Data_outB[59]),
    .DOB60(Data_outB[60]), .DOB61(Data_outB[61]), .DOB62(Data_outB[62]), .DOB63(Data_outB[63])
);


endmodule
