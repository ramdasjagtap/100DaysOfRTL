`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SGGS
// Engineer: Ramdas Jagtap
// 
// Create Date: 02.10.2023 11:21:22
// Design Name: Degital Design
// Module Name: Rising_Falling_edge_detector
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


module Rising_Falling_edge_detector(
input clk,
input reset,
input Signal,
output rising_edge_o,
output falling_edge_o
    );
    
   reg SignalPrev;
   always @(posedge clk)
    begin
     if(reset == 1'b1)
       SignalPrev <= 1'b0;
     else
       SignalPrev <= Signal;
    end 
    
    //Rising Edge -> 0 to 1
    assign rising_edge_o = (Signal)&&(~SignalPrev);
    
    //Falling Edge -> 1 to 0
    assign falling_edge_o = (~Signal)&&(SignalPrev);
    
endmodule
