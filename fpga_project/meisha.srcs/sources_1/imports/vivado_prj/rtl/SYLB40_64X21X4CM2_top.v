module SYLB40_64X21X4CM2_top // single port 64x84
(
    input   reg              CK,        // Clock signal for addresses, CSB, WEB, and DI
    input   reg     [5:0]    Addr,      // Address inputs
    input   reg     [83:0]   Data_in,   // Data inputs
    input   reg     [3:0]    WEB,       // Write enable, Active low
    input   reg              CSB,       // Chip selection, Active low, 1: Disable RAM, 0: Normal operation
    input   reg              DVSE,      // Enable the delay option, Active high
    input   reg     [3:0]    DVS,       // Delay option
    input   reg              NAP,       // Enable the NAP mode, Asynchronous, Active high
    output  wire    [83:0]   Data_out   // Data outputs
);
    // 实例化 SYLB40_64X21X4CM2 模块
    SYLB40_64X21X4CM2 u_SYLB40_64X21X4CM2 (

        .CK(CK),
        .CSB(~CSB),
        .NAP(NAP),
        .WEB0(~WEB[0]), .WEB1(~WEB[1]), .WEB2(~WEB[2]), .WEB3(~WEB[3]),

        .DVSE(DVSE),
        .DVS0(DVS[0]), .DVS1(DVS[1]), .DVS2(DVS[2]), .DVS3(DVS[3]),

        .A0(Addr[0]), .A1(Addr[1]), .A2(Addr[2]), .A3(Addr[3]), .A4(Addr[4]),
        .A5(Addr[5]),

        .DI0(Data_in[0]), .DI1(Data_in[1]), .DI2(Data_in[2]), .DI3(Data_in[3]),
        .DI4(Data_in[4]), .DI5(Data_in[5]), .DI6(Data_in[6]), .DI7(Data_in[7]),
        .DI8(Data_in[8]), .DI9(Data_in[9]), .DI10(Data_in[10]), .DI11(Data_in[11]),
        .DI12(Data_in[12]), .DI13(Data_in[13]), .DI14(Data_in[14]), .DI15(Data_in[15]),
        .DI16(Data_in[16]), .DI17(Data_in[17]), .DI18(Data_in[18]), .DI19(Data_in[19]),
        .DI20(Data_in[20]), .DI21(Data_in[21]), .DI22(Data_in[22]), .DI23(Data_in[23]),
        .DI24(Data_in[24]), .DI25(Data_in[25]), .DI26(Data_in[26]), .DI27(Data_in[27]),
        .DI28(Data_in[28]), .DI29(Data_in[29]), .DI30(Data_in[30]), .DI31(Data_in[31]),
        .DI32(Data_in[32]), .DI33(Data_in[33]), .DI34(Data_in[34]), .DI35(Data_in[35]),
        .DI36(Data_in[36]), .DI37(Data_in[37]), .DI38(Data_in[38]), .DI39(Data_in[39]),
        .DI40(Data_in[40]), .DI41(Data_in[41]), .DI42(Data_in[42]), .DI43(Data_in[43]),
        .DI44(Data_in[44]), .DI45(Data_in[45]), .DI46(Data_in[46]), .DI47(Data_in[47]),
        .DI48(Data_in[48]), .DI49(Data_in[49]), .DI50(Data_in[50]), .DI51(Data_in[51]),
        .DI52(Data_in[52]), .DI53(Data_in[53]), .DI54(Data_in[54]), .DI55(Data_in[55]),
        .DI56(Data_in[56]), .DI57(Data_in[57]), .DI58(Data_in[58]), .DI59(Data_in[59]),
        .DI60(Data_in[60]), .DI61(Data_in[61]), .DI62(Data_in[62]), .DI63(Data_in[63]),
        .DI64(Data_in[64]), .DI65(Data_in[65]), .DI66(Data_in[66]), .DI67(Data_in[67]),
        .DI68(Data_in[68]), .DI69(Data_in[69]), .DI70(Data_in[70]), .DI71(Data_in[71]),
        .DI72(Data_in[72]), .DI73(Data_in[73]), .DI74(Data_in[74]), .DI75(Data_in[75]),
        .DI76(Data_in[76]), .DI77(Data_in[77]), .DI78(Data_in[78]), .DI79(Data_in[79]),
        .DI80(Data_in[80]), .DI81(Data_in[81]), .DI82(Data_in[82]), .DI83(Data_in[83]),

        .DO0(Data_out[0]), .DO1(Data_out[1]), .DO2(Data_out[2]), .DO3(Data_out[3]),
        .DO4(Data_out[4]), .DO5(Data_out[5]), .DO6(Data_out[6]), .DO7(Data_out[7]),
        .DO8(Data_out[8]), .DO9(Data_out[9]), .DO10(Data_out[10]), .DO11(Data_out[11]),
        .DO12(Data_out[12]), .DO13(Data_out[13]), .DO14(Data_out[14]), .DO15(Data_out[15]),
        .DO16(Data_out[16]), .DO17(Data_out[17]), .DO18(Data_out[18]), .DO19(Data_out[19]),
        .DO20(Data_out[20]), .DO21(Data_out[21]), .DO22(Data_out[22]), .DO23(Data_out[23]),
        .DO24(Data_out[24]), .DO25(Data_out[25]), .DO26(Data_out[26]), .DO27(Data_out[27]),
        .DO28(Data_out[28]), .DO29(Data_out[29]), .DO30(Data_out[30]), .DO31(Data_out[31]),
        .DO32(Data_out[32]), .DO33(Data_out[33]), .DO34(Data_out[34]), .DO35(Data_out[35]),
        .DO36(Data_out[36]), .DO37(Data_out[37]), .DO38(Data_out[38]), .DO39(Data_out[39]),
        .DO40(Data_out[40]), .DO41(Data_out[41]), .DO42(Data_out[42]), .DO43(Data_out[43]),
        .DO44(Data_out[44]), .DO45(Data_out[45]), .DO46(Data_out[46]), .DO47(Data_out[47]),
        .DO48(Data_out[48]), .DO49(Data_out[49]), .DO50(Data_out[50]), .DO51(Data_out[51]),
        .DO52(Data_out[52]), .DO53(Data_out[53]), .DO54(Data_out[54]), .DO55(Data_out[55]),
        .DO56(Data_out[56]), .DO57(Data_out[57]), .DO58(Data_out[58]), .DO59(Data_out[59]),
        .DO60(Data_out[60]), .DO61(Data_out[61]), .DO62(Data_out[62]), .DO63(Data_out[63]),
        .DO64(Data_out[64]), .DO65(Data_out[65]), .DO66(Data_out[66]), .DO67(Data_out[67]),
        .DO68(Data_out[68]), .DO69(Data_out[69]), .DO70(Data_out[70]), .DO71(Data_out[71]),
        .DO72(Data_out[72]), .DO73(Data_out[73]), .DO74(Data_out[74]), .DO75(Data_out[75]),
        .DO76(Data_out[76]), .DO77(Data_out[77]), .DO78(Data_out[78]), .DO79(Data_out[79]),
        .DO80(Data_out[80]), .DO81(Data_out[81]), .DO82(Data_out[82]), .DO83(Data_out[83])

    );

endmodule
