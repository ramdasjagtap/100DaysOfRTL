`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.09.2023 20:26:51
// Design Name: 
// Module Name: Mux_2_to_1
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


//Behavouiral Modelling
module Mux_2_to_1(
input [7:0]I0,I1,
input select,
output reg [7:0]Y
    );
  always@(select,I0, I1)
  begin
  Y<=8'bxxxxxxxx;
  if(select==1'b1)
  begin
  Y<=I1;
  end
  else
  begin
  Y<=I0;
  end
  end  
    
endmodule
/*
dataflow modelling-
assign Y=select ? I0:I1;


Gate level modelling-
using logical gates

 
*/