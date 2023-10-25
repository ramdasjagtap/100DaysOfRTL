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
 
 wire rising_edge;
 
 always @(*)
  begin
    assign mem_rd = request & READ;
    assign mem_wr = request & (~READ);
  end

//Day -03 module
Edge_Detector ED(.clk(clk),.reset(reset),.Signal(request),.rising_edge_o(rising_edge),.falling_edge_o());
 reg [3:0]count;
 reg [3:0]count_ff;
 reg [3:0]nxt_count;
 wire [3:0]LFSR_out;
 
 always @(posedge clk or posedge reset)
    begin
      if(reset)
        begin
          count_ff <= 4'h0;
        end
      else
        begin
          count_ff <= nxt_count;
        end
        assign nxt_count = rising_edge?LFSR_out:count_ff + 4'h1;
        assign count = count_ff;
    end
    
    //Generate a random value.
    //Day-07 module
    day7 D7(.clk(clk),.reset(reset),.LFSR_out(LFSR_out));
    
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