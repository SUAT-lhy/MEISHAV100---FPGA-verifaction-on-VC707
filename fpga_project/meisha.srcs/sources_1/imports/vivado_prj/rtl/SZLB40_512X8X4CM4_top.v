module SZLB40_512X8X4CM4_top   // two port 512x32
(
    input   reg          CKA,          // Clock signal of the read addresses and CSAN, latched at the rising edge
    input   reg          CKB,          // Clock signal of the write addresses, CSBN, WEB, and DI, latched at the rising edge
    input   reg  [8:0]   Addr_A,       // Read port address signals
    input   reg  [8:0]   Addr_B,       // Write port address signals
    input   reg  [31:0]  Data_in,           // Data inputs
    input   reg  [3:0]   WEB,          // Write enable signals of b bytes, Active low
    input   reg          CSAN,         // Chip selection of the read port, Active low
    input   reg          CSBN,         // Chip selection of the write port, Active low
    input   reg          DVSE,         // Enable the delay option, Active high
    input   reg  [3:0]   DVS,          // Delay option control words
    input   reg          NAP,          // NAP mode enable, Asynchronous, Active high
    output  wire [31:0]  Data_out      // Data outputs
);
    // 实例化 SZLB40_512X8X4CM4 模块
    SZLB40_512X8X4CM4 u_SZLB40_512X8X4CM4 (

        .CKA(CKA), .CKB(CKB), .CSAN(CSAN), .CSBN(CSBN), .NAP(NAP),

        .WEB0(~WEB[0]), .WEB1(~WEB[1]), .WEB2(~WEB[2]), .WEB3(~WEB[3]),

        .DVSE(DVSE), .DVS0(DVS[0]), .DVS1(DVS[1]), .DVS2(DVS[2]), .DVS3(DVS[3]),

        .A0(Addr_A[0]), .A1(Addr_A[1]), .A2(Addr_A[2]), .A3(Addr_A[3]), .A4(Addr_A[4]),
        .A5(Addr_A[5]), .A6(Addr_A[6]), .A7(Addr_A[7]), .A8(Addr_A[8]),
        .B0(Addr_B[0]), .B1(Addr_B[1]), .B2(Addr_B[2]), .B3(Addr_B[3]), .B4(Addr_B[4]),
        .B5(Addr_B[5]), .B6(Addr_B[6]), .B7(Addr_B[7]), .B8(Addr_B[8]),

        .DO0(Data_out[0]), .DO1(Data_out[1]), .DO2(Data_out[2]), .DO3(Data_out[3]), 
        .DO4(Data_out[4]), .DO5(Data_out[5]), .DO6(Data_out[6]), .DO7(Data_out[7]), 
        .DO8(Data_out[8]), .DO9(Data_out[9]), .DO10(Data_out[10]), .DO11(Data_out[11]), 
        .DO12(Data_out[12]), .DO13(Data_out[13]), .DO14(Data_out[14]), .DO15(Data_out[15]), 
        .DO16(Data_out[16]), .DO17(Data_out[17]), .DO18(Data_out[18]), .DO19(Data_out[19]), 
        .DO20(Data_out[20]), .DO21(Data_out[21]), .DO22(Data_out[22]), .DO23(Data_out[23]), 
        .DO24(Data_out[24]), .DO25(Data_out[25]), .DO26(Data_out[26]), .DO27(Data_out[27]), 
        .DO28(Data_out[28]), .DO29(Data_out[29]), .DO30(Data_out[30]), .DO31(Data_out[31]),

        .DI0(Data_in[0]), .DI1(Data_in[1]), .DI2(Data_in[2]), .DI3(Data_in[3]),
        .DI4(Data_in[4]), .DI5(Data_in[5]), .DI6(Data_in[6]), .DI7(Data_in[7]),
        .DI8(Data_in[8]), .DI9(Data_in[9]), .DI10(Data_in[10]), .DI11(Data_in[11]),
        .DI12(Data_in[12]), .DI13(Data_in[13]), .DI14(Data_in[14]), .DI15(Data_in[15]),
        .DI16(Data_in[16]), .DI17(Data_in[17]), .DI18(Data_in[18]), .DI19(Data_in[19]),
        .DI20(Data_in[20]), .DI21(Data_in[21]), .DI22(Data_in[22]), .DI23(Data_in[23]),
        .DI24(Data_in[24]), .DI25(Data_in[25]), .DI26(Data_in[26]), .DI27(Data_in[27]),
        .DI28(Data_in[28]), .DI29(Data_in[29]), .DI30(Data_in[30]), .DI31(Data_in[31])


    );

    // 在此处添加顶层逻辑或测试逻辑


endmodule
