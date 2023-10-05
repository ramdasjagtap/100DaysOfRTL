`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.10.2023 13:15:28
// Design Name: 
// Module Name: Shift_regsiter_tb
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


module Shift_regsiter_tb();
reg clk;
reg reset;
reg D;
wire [3:0]Q;
    Simple_Shift_Register sr(.clk(clk),.reset(reset),.D(D),.Q(Q));
    
    initial
    begin
    clk = 1'b0;
    forever #10 clk = ~clk;
    end
    
    initial
    begin
    reset = 1'b1;
    D = 1'b0;
    @(posedge clk);
    reset = 1'b0; 
    //  reset = 1'b1;
    D = 1'b1;
    @(posedge clk);
    reset = 1'b0; 
    end
    
endmodule
