`timescale 1ns / 1ps

module Slave_mem_tb();
 reg clk;
 reg reset;
 reg request;
 reg [31:0]WDATA;
 reg READ;
 reg [3:0]ADDR;
 wire ready;
 wire [31:0]RDATA;
 
 Slave_mem DUT(.clk(clk),.reset(reset),.request(request),.WDATA(WDATA),.READ(READ),.ADDR(ADDR),.RDATA(RDATA));
 
 
 //address list.
 reg [9:0]ADDR_LIST[9:0];
 
 //generating clock.
 initial
  begin
   clk = 1'b0;
   forever #10 clk = ~clk;
  end
  
  
  //Generating stimulus.
  integer i;
  initial
    begin
     reset = 1'b1;
     request = 1'b0;
     @(posedge clk);
     reset = 1'b0;
     @(posedge clk);
     
     for(i=0; i<10; i=i+1)
      begin
        request = 1'b1;
        READ = 1'b0;
        ADDR = $urandom_range(0,1023);
        ADDR_LIST[i] = ADDR;
        WDATA = $urandom_range(0,32'hFFFF);
        
        //waiting for ready signal,
        while(~ready)
         begin
          @(posedge clk);
         end
         
         request = 1'b0;
         @(posedge clk);
      end
     
     for(i=0; i<10; i=i+1)
       begin
         request = 1'b1;
         READ = 1'b1;
         //ADDR = $urandom_range(0,1023);
         ADDR = ADDR_LIST[i];
         WDATA = $urandom_range(0,32'hFFFF);
         
         //waiting for ready signal.
         while(~ready)
         begin
          @(posedge clk);
         end
         
         request = 1'b0;
         @(posedge clk);
        end
        $stop();
    end

endmodule