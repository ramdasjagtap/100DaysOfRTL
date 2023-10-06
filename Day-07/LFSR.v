`timescale 1ns / 1ps


module LFSR(
input clk,
input reset,
output reg[3:0]LFSR_out
    );
    
    reg [3:0]nxt_LFSR_out;
    always @(posedge clk)
    begin
    if(reset == 1'b1)
     begin
     LFSR_out <= 4'hF;
     end
    else
     begin
     LFSR_out[0] <= LFSR_out[1]^LFSR_out[3];
     LFSR_out <= nxt_LFSR_out;
     assign nxt_LFSR_out = {LFSR_out[2:0],LFSR_out[0]};
     end
    end
endmodule
