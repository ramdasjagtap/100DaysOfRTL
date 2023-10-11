`timescale 1ns / 1ps

module Sequence_Det_tb();
 reg clk;
 reg reset;
 reg IN;
 wire OUT;
 
 Sequence_Det SD(.clk(clk),.reset(reset),.IN(IN),.OUT(OUT));
 
 initial
   begin
     clk = 1'b0;
     forever #10 clk = ~clk;
   end
   
   integer i;
   reg [11:0]sequence = 12'b111011011011;

   initial
     begin
     
     reset = 1'b1;
     IN = 1'b1;
     @(posedge clk);
     
     reset <= 1'b0;
     @(posedge clk);
     
      for(i =0; i<12 ;i=i+1)
         begin
            IN = sequence[i];
         @(posedge clk);
         end 
         
     for(i=0;  i<12; i=i+1)
       begin
          IN = $random%2;
          @(posedge clk);
       end
       
       for(i =0; i<12 ;i=i+1)
         begin
            IN = sequence[i];
            @(posedge clk);
         end 
         
     $stop();
    
     end
endmodule
