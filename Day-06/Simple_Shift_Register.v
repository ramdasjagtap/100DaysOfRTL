`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.10.2023 13:32:05
// Design Name: 
// Module Name: Simple_Shift_Register
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Simple_Shift_Register(
input clk,
input reset,
input D,
output reg[3:0]Q
    );
    
  reg [3:0]nxt_Q;
  reg [3:0]SR_ff;
  always @(posedge clk or posedge reset)
  begin
   if(reset == 1'b1)
    SR_ff <= 4'h0;
   else
    SR_ff = nxt_Q;
    assign nxt_Q = {SR_ff[2:0],D};
    assign Q = SR_ff;  
  end  
  
endmodule
