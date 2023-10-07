`timescale 1ns / 1ps

module Bin_To_OneHot_tb();

 parameter IN = 4;
 parameter OUT = 16;
 reg [IN-1:0]BIN_IN;
 wire [OUT-1:0]ONE_HOT_OUT;
 
 Bin_To_OneHot BINHOT(.BIN_IN(BIN_IN),.ONE_HOT_OUT(ONE_HOT_OUT));

   initial
    begin
    BIN_IN = 4'b0010;
    #50;
    for(integer i=0;i<32;i=i+1)
     begin
     BIN_IN = $urandom_range(0,4'hF);
     #20;
     end
    
    end
endmodule
