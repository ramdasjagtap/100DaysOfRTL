`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SGGSIE&T
// Engineer: Ramdas Arjun Jagtap
// 
// Create Date: 03.10.2023 14:45:53
// Design Name: 8 Bit ALU
// Module Name: ALU_8bit_tb
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


module ALU_8bit_tb();
  reg [7:0]a;
  reg [7:0]b;
  reg [2:0]opcode;
  wire [7:0]out;
   
  ALU_8Bit alu(.a(a),.b(b),.opcode(opcode),.out(out));
    initial
     begin
      a = 8'b0011010;
      b = 8'b0001010;
      opcode = 3'b000;
      #50
      a = 8'b0011010;
      b = 8'b0001010;
      opcode = 3'b001;
      #50
      a = 8'b0011010;
      b = 8'b0001010;
      opcode = 3'b010;
      #50
      a = 8'b0011010;
      b = 8'b0001010;
      opcode = 3'b011;
     #50
      a = 8'b0011010;
      b = 8'b0001010;
      opcode = 3'b100;
      #50
      a = 8'b0011010;
      b = 8'b0001010;
      opcode = 3'b101;
     #50
      a = 8'b0011010;
      b = 8'b0001010;
      opcode = 3'b110;
      #50
      a = 8'b0011010;
      b = 8'b0001010;
      opcode = 3'b110;
      
      $display("a = %b ,b =%b ,opcode = %b,out =%b",a,b,opcode,out);
    end
     
endmodule
