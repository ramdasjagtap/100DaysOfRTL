`timescale 1ns / 1ps

module Parallel_to_Serial_tb();

 reg clk;
 reg reset;
 reg [3:0]parallel_in;
 wire serial_out;
 wire empty_out;
 wire valid_out;
 
 Parallel__to_Serial P2S(.clk(clk),.reset(reset),.parallel_in(parallel_in),.serial_out(serial_out),.empty_out(empty_out),.valid_out(valid_out));
 
  initial
   begin
    clk = 1'b0;
    forever #10 clk = ~clk;
   end 
   
   integer i;
   initial
     begin
       reset = 1'b1;
       @(posedge clk);
       parallel_in = 4'h0;
       #10;
       
       reset = 1'b0;
       @(posedge clk);

       for(i=1; i<32; i=i+1)
         begin
           parallel_in <= $urandom_range(0,4'hF);
           @(posedge clk);
         end
       $stop();
     end
     
endmodule
