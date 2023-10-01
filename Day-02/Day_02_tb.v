`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.10.2023 11:16:55
// Design Name: 
// Module Name: Day_02_tb
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


module Day_02_tb();
 reg clk,reset;
 reg D_i;
 wire Q_norst_o;
 wire Q_syncrst_o;
 wire Q_asyncrst_o;

 Day_02 d_FF(.clk(clk),.reset(reset),.D_i(D_i),.Q_norst_o(Q_norst_o),.Q_syncrst_o(Q_syncrst_o),.Q_asyncrst_o(Q_asyncrst_o));

 initial
   begin
    #10 clk=0;
    forever #10 clk=~clk;
   end
   
initial
 begin
    reset = 1'b1;
    D_i = 1'b0;
    @(posedge clk);
    reset = 1'b0;
    @(posedge clk);
    D_i = 1'b1;
    @(posedge clk);
    @(negedge clk);
    reset = 1'b1;
    @(posedge clk);
    reset = 1'b0;
    @(posedge clk);
    $finish();
  end
endmodule
