`timescale 1ns / 1ps

//Day -18 
module Slave_interface(
 input clk,
 input reset,
 input select,
 input enable,
 input [9:0]ADDR,
 input WRITE,
 input [31:0]WDATA,
 output [31:0]RDATA,
 output ready_o
    );
    
    //APB request
    reg apb_request;
    always @(*)
        apb_request <= select & enable;
   
   Slave_mem SMemory(
    .clk(clk),
    .reset(reset),
    .request(apb_request),
    .READ(~WRITE),
    .ADDR(ADDR),
    .WDATA(WDATA),
    .RDATA(RDATA),
    .ready(ready_o)
   );
   
endmodule
