`timescale 1ns / 1ps
/*                       
ARB -> FIFO -> APBM <-> APBS ->rd_data_o, rd_valid_o
*/
module Day20(
 input clk,
 input reset,
 input READ_i,
 input WRITE_i,
 output rd_valid_o,
 output [31:0]rd_data_o
    );
   //Day -14 -> priority arbiter (parameterized).
   //Day -18->FIFO (parameterized).
   //Day -16 ->APB master
   //Day -19->Slave interface.
   
   reg rd_req_gnt;
   reg wr_req_gnt;
   //wire rd_req_gnt;
   //wire wr_req_gnt;
   
   //Read and write requests.(ARB)
   Priori_arbiter #(.PORTS(2)) arbiter(
   .request({READ_i,WRITE_i}),
   .OUT({rd_req_gnt,wr_req_gnt})
   );
   
   //non-net is not permitted
   reg push;
   reg pop;
   reg [1:0]push_data;
   reg [1:0]pop_data;
   reg full;
   reg empty;
   
   reg select;
   reg enable;
   reg WRITE;
   reg [31:0]ADDR;
   reg [31:0]WDATA;
   reg [31:0]RDATA;
   reg ready;
   /*
   wire pop;
   wire [1:0]push_data;
   wire [1:0]pop_data;
   wire full;
   wire empty;
   wire select;
   wire enable;
   wire WRITE;
   wire [31:0]ADDR;
   wire [31:0]WDATA;
   wire [31:0]RDATA;
   wire ready;
   */
   always @(*)
   begin
    push = |{rd_req_gnt, wr_req_gnt};
    push_data = {wr_req_gnt, rd_req_gnt};
    pop = ~(empty) & ~(select & enable);
   end
   
   //Sending request to FIFO; (FIFO)
   Day18 #(.DEPTH(16),.DATA_W(2))day18(
   .clk(clk),
   .reset(reset),
   .push_i(push),
   .push_data_i(push_data),
   .pop_i(pop),
   .pop_data_o(pop_data),
   .full_o(full),
   .empty_o(empty)
   );
   
   //APB Master(APBM)
   APB_master APBM(
   .clk(clk),
   .reset(reset),
   .command(pop_data),  //output of memory
   .select(select),
   .enable(enable),
   .ADDR(ADDR),
   .WRITE(WRITE),
   .W_DATA(WDATA),
   .R_DATA(RDATA),
   .READY(ready)
   );
   
   //APB Slave (APBS)
  Slave_interface APBS(
  .clk(clk),
  .reset(reset),
  .select(select),
  .enable(enable),
  .ADDR(ADDR),
  .WRITE(WRITE),
  .WDATA(WDATA),
  .RDATA(RDATA),
  .ready_o(ready)
  );
  
  assign rd_valid_o = ready & (~WRITE);
  assign rd_data_o = {32{rd_valid_o}} & RDATA;
endmodule
