`timescale 1ns / 1ps


module Bin_to_Gray#(parameter len = 4)(
input [len-1:0]BIN,
output [len-1:0]GRAY
    );
    
   /*
    assign GRAY[len-1] = BIN[len-1];
    assign GRAY[len-2] = BIN[len-1] ^ BIN[len-2];
    assign GRAY[len-3] = BIN[len-2] ^ BIN[len-3];
    assign GRAY[len-4] = BIN[len-3] ^ BIN[len-4];
  */
  assign GRAY[len-1] = BIN[len-1];
  for(genvar i=len-2; i>=0; i=i-1)
    begin
     assign GRAY[i] = BIN[i+1]^BIN[i];
    end
endmodule
