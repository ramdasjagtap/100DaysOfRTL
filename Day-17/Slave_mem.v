`timescale 1ns / 1ps

//Slave memory  interface.
module Slave_mem(
 input clk,
 input reset,
 input request,
 input READ,
 input [3:0]ADDR,
 input [31:0]WDATA,
 output reg ready,
 output reg[31:0]RDATA
 );
 
 //memory array.
 reg [31:0]memory[15:0];
 reg mem_rd;
 reg mem_wr;
 
 always @(*)
  begin
    assign mem_rd = request & READ;
    assign mem_wr = request & (~READ);
  end

 reg [3:0]count;
 reg [3:0]count_ff;
 reg [3:0]nxt_count;
 
 always @(posedge clk or posedge reset)
    begin
      if(reset)
        begin
          count_ff <= 4'h0;
        end
      else
        begin
          count_ff <= count_ff;
        end
        assign nxt_count = count_ff + 4'h1;
        assign count = count_ff;
    end
    
   always @(posedge clk)
     begin
     //writing the data into memory when counter is zero.
       if(mem_wr & (~(|count)))
         begin
           memory[ADDR] <= WDATA;
         end
         //reading the data from memory.
      assign RDATA = memory[ADDR] & {32{mem_rd}};
      assign ready = ~(|count);
     end
 
endmodule