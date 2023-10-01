`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.09.2023 21:32:28
// Design Name: 
// Module Name: Mux_2_to_1_tb
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


module Mux_2_to_1_tb();
reg [7:0]I0,I1;
reg select;
wire [7:0]Y;
Mux_2_to_1 mux(.I0(I0),.I1(I1),.select(select),.Y(Y));

initial
begin
select=1'b0;
I0=8'b000000000;
I1=8'b00000000;
#50
select=1'b0;
I0=8'b00000000;
I1=8'b11111111;
#50
select=1'b1;
I0=8'b00000000;
I1=8'b11111111;
#50
select=1'b1;
I0=8'b00000000;
I1=8'b11110000;
end

initial 
begin
$display("select= %b,I0=%b,I1=%b",select,I0,I1);
end

endmodule
