`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.10.2023 14:58:17
// Design Name: 
// Module Name: Odd_Counter_tb
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


module Odd_Counter_tb();
reg clk;
reg reset;
wire [7:0]count;

Odd_Counter OC(.clk(clk),.reset(reset),.count(count));

always 
begin
clk = 1'b1;
#10
clk = 1'b0;
#10;
end

initial 
begin
reset = 1'b0;
@(posedge clk);
#10
reset = 1'b1;
@(posedge clk);
reset = 1'b0;
 for(integer i=0;i<128;i=i+1)
  begin
  @(posedge clk);
  end
end
endmodule
