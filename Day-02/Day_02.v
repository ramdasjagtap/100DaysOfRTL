`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.10.2023 10:55:15
// Design Name: 
// Module Name: Day_02
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

//Flavours of D Flip Flop
module Day_02(
input clk,reset,
input D_i,
output reg Q_norst_o,
output reg Q_syncrst_o,
output reg Q_asyncrst_o
    );
    
    always @(posedge clk)
     begin
       Q_norst_o <= D_i;
     end
    
  always @(posedge clk)
   begin
    if(reset==1'b1)
    begin
    Q_syncrst_o<= 1'b0;
    end
    else
    begin
    Q_syncrst_o<=D_i;
    end
   end
    
    
  always @(posedge clk or posedge reset)
   begin
     if(reset==1'b1)
    begin
    Q_asyncrst_o<= 1'b0;
    end
    else
    begin
    Q_asyncrst_o<=D_i;
    end
   end
    
endmodule
