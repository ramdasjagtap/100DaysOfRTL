`timescale 1ns / 1ps

module Priori_arbiter_tb();
 parameter PORTS = 4;
 reg [PORTS-1:0]request;
 wire [PORTS-1:0]OUT;
 
 Priori_arbiter PA(.request(request),.OUT(OUT));
 
  integer i;
  initial
    begin
     // request = 4'b0000;
      #10;
      
      for(i=0; i<32; i=i+1)
        begin
          request = $urandom_range(0,2**PORTS-1);
          #10;
        end
      $stop();
    end
 
endmodule
