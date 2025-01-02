module FPToFP( 
  input         clock, 
  input         reset, 
  input         io_in_valid, 
  input         io_in_bits_ren2, 
  input         io_in_bits_singleOut, 
  input         io_in_bits_wflags, 
  input  [2:0]  io_in_bits_rm, 
  input  [64:0] io_in_bits_in1, 
  input  [64:0] io_in_bits_in2, 
  output [64:0] io_out_bits_data, 
  output [4:0]  io_out_bits_exc, 
  input         io_lt 
);
  wire [64:0] RecFNToRecFN_io_in; 
  wire [2:0] RecFNToRecFN_io_roundingMode; 
  wire [32:0] RecFNToRecFN_io_out; 
  wire [4:0] RecFNToRecFN_io_exceptionFlags; 
  reg  in_valid; 
  reg [31:0] _RAND_0;
  reg  in_bits_ren2; 
  reg [31:0] _RAND_1;
  reg  in_bits_singleOut; 
  reg [31:0] _RAND_2;
  reg  in_bits_wflags; 
  reg [31:0] _RAND_3;
  reg [2:0] in_bits_rm; 
  reg [31:0] _RAND_4;
  reg [64:0] in_bits_in1; 
  reg [95:0] _RAND_5;
  reg [64:0] in_bits_in2; 
  reg [95:0] _RAND_6;
  wire  _T_19; 
  wire [64:0] _T_20; 
  wire  _T_21; 
  wire [64:0] _T_22; 
  wire [64:0] _T_23; 
  wire [64:0] signNum; 
  wire  _T_24; 
  wire [63:0] _T_25; 
  wire [64:0] fsgnj; 
  wire [2:0] _T_27; 
  wire [2:0] _T_28; 
  wire  _T_29; 
  wire [2:0] _T_30; 
  wire [2:0] _T_31; 
  wire  _T_32; 
  wire  _T_36; 
  wire  _T_37; 
  wire  _T_38; 
  wire  _T_42; 
  wire  _T_43; 
  wire  _T_44; 
  wire  _T_45; 
  wire  _T_46; 
  wire  _T_48; 
  wire  _T_49; 
  wire  _T_50; 
  wire  _T_51; 
  wire [4:0] _GEN_33; 
  wire [4:0] _T_52; 
  wire [64:0] _T_53; 
  wire [64:0] _T_54; 
  wire [64:0] _GEN_23; 
  wire  outTag; 
  wire  _T_56; 
  wire  _T_79; 
  wire  _T_80; 
  wire [64:0] _T_84; 
  wire [64:0] fsgnjMux_data; 
  wire [31:0] _T_57; 
  wire  _T_58; 
  wire [51:0] _T_59; 
  wire [11:0] _T_60; 
  wire [75:0] _GEN_34; 
  wire [75:0] _T_61; 
  wire [22:0] _T_62; 
  wire [2:0] _T_63; 
  wire [11:0] _T_65; 
  wire [12:0] _T_66; 
  wire [12:0] _T_67; 
  wire [11:0] _T_68; 
  wire  _T_69; 
  wire  _T_70; 
  wire  _T_71; 
  wire [5:0] _T_72; 
  wire [8:0] _T_73; 
  wire [8:0] _T_74; 
  wire [8:0] _T_75; 
  wire [9:0] _T_76; 
  wire [32:0] _T_77; 
  wire [64:0] _T_78; 
  wire [4:0] _GEN_35; 
  wire [4:0] _T_91; 
  wire [64:0] _T_97; 
  reg [64:0] _T_101_data; 
  reg [95:0] _RAND_7;
  reg [4:0] _T_101_exc; 
  reg [31:0] _RAND_8;
  RecFNToRecFN RecFNToRecFN ( 
    .io_in(RecFNToRecFN_io_in),
    .io_roundingMode(RecFNToRecFN_io_roundingMode),
    .io_out(RecFNToRecFN_io_out),
    .io_exceptionFlags(RecFNToRecFN_io_exceptionFlags)
  );
  assign _T_19 = in_bits_rm[1]; 
  assign _T_20 = in_bits_in1 ^ in_bits_in2; 
  assign _T_21 = in_bits_rm[0]; 
  assign _T_22 = ~ in_bits_in2; 
  assign _T_23 = _T_21 ? _T_22 : in_bits_in2; 
  assign signNum = _T_19 ? _T_20 : _T_23; 
  assign _T_24 = signNum[64]; 
  assign _T_25 = in_bits_in1[63:0]; 
  assign fsgnj = {_T_24,_T_25}; 
  assign _T_27 = in_bits_in1[63:61]; 
  assign _T_28 = ~ _T_27; 
  assign _T_29 = _T_28 == 3'h0; 
  assign _T_30 = in_bits_in2[63:61]; 
  assign _T_31 = ~ _T_30; 
  assign _T_32 = _T_31 == 3'h0; 
  assign _T_36 = in_bits_in1[51]; 
  assign _T_37 = _T_36 == 1'h0; 
  assign _T_38 = _T_29 & _T_37; 
  assign _T_42 = in_bits_in2[51]; 
  assign _T_43 = _T_42 == 1'h0; 
  assign _T_44 = _T_32 & _T_43; 
  assign _T_45 = _T_38 | _T_44; 
  assign _T_46 = _T_29 & _T_32; 
  assign _T_48 = _T_21 != io_lt; 
  assign _T_49 = _T_29 == 1'h0; 
  assign _T_50 = _T_48 & _T_49; 
  assign _T_51 = _T_32 | _T_50; 
  assign _GEN_33 = {{4'd0}, _T_45}; 
  assign _T_52 = _GEN_33 << 4; 
  assign _T_53 = _T_51 ? in_bits_in1 : in_bits_in2; 
  assign _T_54 = _T_46 ? 65'he008000000000000 : _T_53; 
  assign _GEN_23 = in_bits_wflags ? _T_54 : fsgnj; 
  assign outTag = in_bits_singleOut == 1'h0; 
  assign _T_56 = outTag == 1'h0; 
  assign _T_79 = in_bits_ren2 == 1'h0; 
  assign _T_80 = in_bits_wflags & _T_79; 
  assign _T_84 = _T_29 ? 65'he008000000000000 : in_bits_in1; 
  assign fsgnjMux_data = _T_80 ? _T_84 : _GEN_23; 
  assign _T_57 = fsgnjMux_data[64:33]; 
  assign _T_58 = fsgnjMux_data[64]; 
  assign _T_59 = fsgnjMux_data[51:0]; 
  assign _T_60 = fsgnjMux_data[63:52]; 
  assign _GEN_34 = {{24'd0}, _T_59}; 
  assign _T_61 = _GEN_34 << 24; 
  assign _T_62 = _T_61[75:53]; 
  assign _T_63 = _T_60[11:9]; 
  assign _T_65 = _T_60 + 12'h100; 
  assign _T_66 = _T_65 - 12'h800; 
  assign _T_67 = $unsigned(_T_66); 
  assign _T_68 = _T_67[11:0]; 
  assign _T_69 = _T_63 == 3'h0; 
  assign _T_70 = _T_63 >= 3'h6; 
  assign _T_71 = _T_69 | _T_70; 
  assign _T_72 = _T_68[5:0]; 
  assign _T_73 = {_T_63,_T_72}; 
  assign _T_74 = _T_68[8:0]; 
  assign _T_75 = _T_71 ? _T_73 : _T_74; 
  assign _T_76 = {_T_58,_T_75}; 
  assign _T_77 = {_T_76,_T_62}; 
  assign _T_78 = {_T_57,_T_77}; 
  assign _GEN_35 = {{4'd0}, _T_38}; 
  assign _T_91 = _GEN_35 << 4; 
  assign _T_97 = {_T_57,RecFNToRecFN_io_out}; 
  assign io_out_bits_data = _T_101_data; 
  assign io_out_bits_exc = _T_101_exc; 
  assign RecFNToRecFN_io_in = in_bits_in1; 
  assign RecFNToRecFN_io_roundingMode = in_bits_rm; 
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  in_valid = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  in_bits_ren2 = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  in_bits_singleOut = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  in_bits_wflags = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  in_bits_rm = _RAND_4[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {3{`RANDOM}};
  in_bits_in1 = _RAND_5[64:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {3{`RANDOM}};
  in_bits_in2 = _RAND_6[64:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {3{`RANDOM}};
  _T_101_data = _RAND_7[64:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  _T_101_exc = _RAND_8[4:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      in_valid <= 1'h0;
    end else begin
      in_valid <= io_in_valid;
    end
    if (io_in_valid) begin
      in_bits_ren2 <= io_in_bits_ren2;
    end
    if (io_in_valid) begin
      in_bits_singleOut <= io_in_bits_singleOut;
    end
    if (io_in_valid) begin
      in_bits_wflags <= io_in_bits_wflags;
    end
    if (io_in_valid) begin
      in_bits_rm <= io_in_bits_rm;
    end
    if (io_in_valid) begin
      in_bits_in1 <= io_in_bits_in1;
    end
    if (io_in_valid) begin
      in_bits_in2 <= io_in_bits_in2;
    end
    if (in_valid) begin
      if (_T_80) begin
        if (_T_56) begin
          _T_101_data <= _T_97;
        end else begin
          if (_T_56) begin
            _T_101_data <= _T_78;
          end else begin
            if (_T_80) begin
              if (_T_29) begin
                _T_101_data <= 65'he008000000000000;
              end else begin
                _T_101_data <= in_bits_in1;
              end
            end else begin
              if (in_bits_wflags) begin
                if (_T_46) begin
                  _T_101_data <= 65'he008000000000000;
                end else begin
                  if (_T_51) begin
                    _T_101_data <= in_bits_in1;
                  end else begin
                    _T_101_data <= in_bits_in2;
                  end
                end
              end else begin
                _T_101_data <= fsgnj;
              end
            end
          end
        end
      end else begin
        if (_T_56) begin
          _T_101_data <= _T_78;
        end else begin
          if (_T_80) begin
            if (_T_29) begin
              _T_101_data <= 65'he008000000000000;
            end else begin
              _T_101_data <= in_bits_in1;
            end
          end else begin
            if (in_bits_wflags) begin
              if (_T_46) begin
                _T_101_data <= 65'he008000000000000;
              end else begin
                if (_T_51) begin
                  _T_101_data <= in_bits_in1;
                end else begin
                  _T_101_data <= in_bits_in2;
                end
              end
            end else begin
              _T_101_data <= fsgnj;
            end
          end
        end
      end
    end
    if (in_valid) begin
      if (_T_80) begin
        if (_T_56) begin
          _T_101_exc <= RecFNToRecFN_io_exceptionFlags;
        end else begin
          if (_T_80) begin
            _T_101_exc <= _T_91;
          end else begin
            if (in_bits_wflags) begin
              _T_101_exc <= _T_52;
            end else begin
              _T_101_exc <= 5'h0;
            end
          end
        end
      end else begin
        if (_T_80) begin
          _T_101_exc <= _T_91;
        end else begin
          if (in_bits_wflags) begin
            _T_101_exc <= _T_52;
          end else begin
            _T_101_exc <= 5'h0;
          end
        end
      end
    end
  end
endmodule
