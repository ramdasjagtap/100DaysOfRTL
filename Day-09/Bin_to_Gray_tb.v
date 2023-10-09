`timescale 1ns / 1ps


module Bin_to_Gray_tb();
 parameter len = 4;
 reg [len-1:0]BIN;
 wire [len-1:0]GRAY;
 Bin_to_Gray btg(.BIN(BIN),.GRAY(GRAY));

   initial
     begin
     BIN = 4'b1010;
     #20;
     for(integer i=0;i<16;i=i+1)
      begin
      BIN = $urandom_range(0,4'hF);
      #20;
      end
     end
endmodule
