`timescale 1ns / 1ps

module Day18_tb();
 parameter DATA_W = 1;
 parameter DEPTH = 4;
 
 reg clk;
 reg reset;
 reg push_i;
 reg [DATA_W-1:0]push_data_i;
 reg pop_i;
 wire [DATA_W-1:0]pop_data_o;
 wire full_o;
 wire empty_o;
 
 
 Day18 day18(.clk(clk),.reset(reset),.push_i(push_i),.push_data_i(push_data_i),.pop_i(pop_i),.pop_data_o(pop_data_o),.full_o(full_o),.empty_o(empty_o));
 
 initial
   begin
     clk = 1'b0;
     forever #10 clk = ~clk;
   end
   
    integer i;
   initial
     begin
       reset = 1'b1;
       push_i = 1'b0;
       pop_i = 1'b0;
       @(posedge clk);
       
       reset = 1'b0;
       @(posedge clk);
       @(posedge clk);
       
       //State-1 
       //Pushing data in memory
       for( i=0; i< DEPTH; i=i+1)
         begin
           push_i = 1'b1;
           push_data_i =$urandom_range(0,2**(DATA_W-1));
           @(posedge clk);
         end
         
         push_i = 1'b0;
         @(posedge clk);
         @(posedge clk);
       
       //State-2
       //poping data from memory;
       for(i=0; i<DEPTH; i=i+1)
         begin
            pop_i = 1'b1;
            @(posedge clk);
         end
         pop_i = 1'b0;
         
         
        //State-3
        //push and poping data
        for(i=0 ;i<DEPTH; i=i+1)
          begin
           push_i = 1'b1;
           pop_i = 1'b1;
           push_data_i = $urandom_range(0,2**(DEPTH-1));
           @(posedge clk);
          end
          
          pop_i = 1'b0;
          push_i = 1'b0;
          @(posedge clk);
          @(posedge clk);
          $stop();
     end
endmodule
