`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.09.2023 23:03:49
// Design Name: 
// Module Name: Clock_Genator_tb
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


module Clock_Genator_tb();
    reg clock;
 Clock_generator clk(.clock(clock));
 
 initial 
 begin
 clock=0;
 end
 
 always 
 #10
 clock =~clock;
 initial
 #50
 $finish();
 endmodule
