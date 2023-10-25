`timescale 1ns / 1ps

module Slave_interface_tb();
 reg clk;
 reg reset;
 reg select;
 reg enable;
 reg [9:0]ADDR;
 reg WRITE;
 reg [31:0]WDATA;
 wire [31:0]RDATA;
 wire ready_o;
 
 Slave_interface SINTERFACE(
   .clk(clk),
   .reset(reset),
   .select(select),
   .enable(enable),
   .ADDR(ADDR),
   .WRITE(WRITE),
   .WDATA(WDATA),
   .RDATA(RDATA),
   .ready_o(ready_o)
 );
 
 //memory
 
 reg [9:0]ADDR_LIST[9:0];
 initial 
  begin
    clk =1'b0;
    forever #10 clk = ~clk;
  end
  
  initial
    begin
     reset <= 1'b1;
     select <= 1'b0;
     enable <= 1'b0;
     @(posedge clk);
     
     reset <= 1'b0;
     @(posedge clk);
     
     for( integer i =0; i<10;i=i+1)
       begin
         select <= 1'b1;  //SETUP
         @(posedge clk);
         enable <= 1'b1;  //ACCESS
         ADDR <= $urandom_range(0,10'h3FF);
         WRITE <= 1'b1;  
         WDATA <= $urandom_range(0,16'hFFFF);
         
         //waiting for ready.
         while(~(select & enable & ready_o))
           @(posedge clk);
           select <= 1'b0;
           enable <= 1'b0;
           ADDR_LIST[i] <= ADDR;
           @(posedge clk);
       end
       
       for(integer i =0; i<10;i=i+1)
         begin
          select <= 1'b1;
          @(posedge clk);
          enable <= 1'b1;
          ADDR <= ADDR_LIST[i];
          WRITE <= 1'b0;
          WDATA <= $urandom_range(0,16'hFFFF);
          
           while(~(select & enable & ready_o))
             @(posedge clk);
             select <= 1'b0;
             enable <= 1'b0;
             @(posedge clk);
         end
         
    end
endmodule
