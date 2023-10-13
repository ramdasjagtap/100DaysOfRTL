`timescale 1ns / 1ps

module Priori_arbiter
#(parameter PORTS =4)(
 input [PORTS-1:0]request,
 output [PORTS-1:0]OUT 
    );
    
    assign OUT[0] = request[0];
    
    genvar i;
    for(i=1; i<PORTS; i=i+1)
      begin
        assign OUT[i] = request[i] & ~(|OUT[i-1]);
      end   
      
endmodule
