`timescale 1ns / 1ps
//Day-12
//Sequence Detector 12'b111011011011

module Sequence_Det(
 input clk,
 input reset,
 input IN,
 output reg OUT
    );
    
    reg [11:0]data;
    reg [11:0]nxt_data;
    
    always @(posedge clk or posedge reset)
    
       begin
         if(reset == 1'b1)
           begin
             data <= 12'b0;
           end
         else
           begin
             data <= nxt_data;
           end 
           
           assign nxt_data = {data[10:0],IN};
           assign OUT = (data[11:0] == 12'b111011011011);    
       end
    
endmodule
