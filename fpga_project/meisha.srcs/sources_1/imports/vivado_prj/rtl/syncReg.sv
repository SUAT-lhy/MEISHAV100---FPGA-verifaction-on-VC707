
module syncReg #(
    parameter int unsigned STAGES = 2
) (
    input  logic clk_i,
    input  logic serial_i,
    output logic serial_o
);

   (* dont_touch = "true" *)
   (* async_reg = "true" *)
   logic [STAGES-1:0] reg_q;

    always_ff @(posedge clk_i) begin
        reg_q <= {reg_q[STAGES-2:0], serial_i};
    end

    assign serial_o = reg_q[STAGES-1];

endmodule

