
module AsyncResetReg #(parameter RESET_VALUE = 0, parameter DELAY_CYCLE = 1)(d, q, en, clk, rst);

   input  wire d;
   output reg  q;
   input  wire en;
   input  wire clk;
   input  wire rst;


   `ifdef MSTD_CELL_EN

      wire q_delay[DELAY_CYCLE:0];
      reg q_delay_for_reset_value_1;
   `ifndef SYNTHESIS
      initial begin
         if (RESET_VALUE == 1) begin
            $warning("Warning: RESET_VALUE is illegal (instance %m)");
            //$finish;
         end
      end
   `endif
      assign q_delay[0] = d;
      generate
         for (genvar i = 0; i < DELAY_CYCLE; i = i+1) begin : DELAY_GEN
            if(RESET_VALUE == 1) begin
               // QBDFERBNLBRMX0P4
               `REG_ASYNC_RESET_ENABLE_DONT_TOUCH u_dont_touch_AsyncResetReg (
                  .Q      (q_delay[i+1]),
                  .D      (q_delay[i]),
                  .CK     (clk),
                  .RB     (~rst),
                  .EB     (~en)
               );
            end
            else begin
               // QBDFERBNLBRMX0P4   QBDFERBNLHHMX0P4
               `REG_ASYNC_RESET_ENABLE_DONT_TOUCH u_dont_touch_AsyncResetReg (
                  .Q      (q_delay[i+1]),
                  .D      (q_delay[i]),
                  .CK     (clk),
                  .RB     (~rst),
                  .EB     (~en)
               );
            end
         end
      endgenerate

      if(RESET_VALUE == 1) begin
         always_comb begin
            q = q_delay_for_reset_value_1;
         end
      end
      else begin
         always_comb begin
            q = q_delay[DELAY_CYCLE];;
         end
      end
         
      always @(posedge clk or posedge rst) begin
         if (rst) begin
            q_delay_for_reset_value_1 <= RESET_VALUE;
         end
         else if (en) begin
            q_delay_for_reset_value_1 <= q_delay[DELAY_CYCLE];
         end
      end


   `else
      always @(posedge clk or posedge rst) begin

         if (rst) begin
            q <= RESET_VALUE;
         end else if (en) begin
            q <= d;
         end
      end
   `endif 

endmodule // AsyncResetReg