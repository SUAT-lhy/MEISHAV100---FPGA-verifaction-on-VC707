
module plusarg_reader #(parameter FORMAT="borked=%d", parameter DEFAULT=0, parameter WIDTH=32) (
   output [31:0] out
);

`ifdef SYNTHESIS
assign out = DEFAULT;
`else
reg [31:0] myplus;
assign out = myplus;

initial begin
   if (!$value$plusargs(FORMAT, myplus)) myplus = DEFAULT;
end
`endif

endmodule
