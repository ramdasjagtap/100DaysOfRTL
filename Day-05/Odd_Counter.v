`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.10.2023 14:57:51
// Design Name: 
// Module Name: Odd_Counter
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


module Odd_Counter(
input clk,
input reset,
output reg[7:0]count
    );
    
    reg [7:0]next_count;
    always @(posedge clk or posedge reset)
    begin
     if(reset == 1'b1)
       begin
       count <= 8'h1;
       end
     else
       begin
       count <= count +8'h2;
      // count <= next_count;
       end
    end
endmodule
