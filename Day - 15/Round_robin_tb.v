`timescale 1ns / 1ps

module Round_robin_tb();
 reg clk;
 reg reset;
 reg [3:0]Req;
 wire [3:0]grant;
    
    
    Round_robin RR(.clk(clk),.reset(reset),.Req(Req),.grant(grant));
    
    
    initial
      begin
      clk =1'b0;
      forever #10 clk = ~clk;
      end
      
      
    integer i;
    initial
      begin
         reset = 1'b1;
         @(posedge clk);
         Req = 4'b1100;
         
         reset = 1'b0;
         @(posedge clk);
         
         for(i=1; i<32; i=i+1)
           begin
             Req = $urandom_range(0,4'hF);
             @(posedge clk);
           end
           $stop();
      end
      
endmodule
