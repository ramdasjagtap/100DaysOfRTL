`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.10.2023 14:45:24
// Design Name: 
// Module Name: ALU_8Bit
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


module ALU_8Bit(
input [7:0]a,b,
input [2:0]opcode,
output reg[7:0]out
    );
    
    
    always @(*)
    begin
    case(opcode)
    3'b000://Adder
         begin
          out = a+b;
         end
    3'b001://subtractor
        begin
        out = a-b;
        end
    3'b010://SLL-> left shift using b[2:0] vector.
         begin
          out = a[7:0] << b[2:0];
         end
    3'b011://LSR -> right shift using b[2:0] vector
        begin
        out = a[7:0] >> b[2:0];
        end   
    3'b100://AND
         begin
          out = a[7:0] & b[7:0];
         end
    3'b101://OR
        begin
        out = a[7:0] | b[7:0];
        end 
    3'b110://XOR
         begin
          out = a[7:0] ^ b[7:0];
         end
    3'b111://EQL
        begin
        if(a == b)
          begin
           out = 8'b00000001; 
          end
        else
          begin
           out = 8'b00000000;
          end
       end
    default:out = 8'b00000000;
    endcase    
  end
endmodule
