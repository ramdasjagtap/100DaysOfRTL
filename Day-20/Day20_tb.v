`timescale 1ns / 1ps

module Day20_tb();
 reg clk;
 reg reset;
 reg READ_i;
 reg WRITE_i;
 wire rd_valid_o;
 wire [31:0]rd_data_o;
 
 Day20 day20(
 .clk(clk),
 .reset(reset),
 .READ_i(READ_i),
 .WRITE_i(WRITE_i),
 .rd_valid_o(rd_valid_o),
 .rd_data_o(rd_data_o)
 );
 
 initial
   begin
     clk = 1'b0;
     forever #10 clk = ~clk;
   end
   
   initial
     begin
       reset <= 1'b1;
       READ_i <= 1'b0;
       WRITE_i <= 1'b0;
       @(posedge clk);
       
       reset <= 1'b0;
       @(posedge clk);
       @(posedge clk);
       
       //Generating read and write signals.
       for(integer i=0; i<512; i=i+1)
         begin
          READ_i <= $urandom_range(25,50)%2;
          WRITE_i <= $urandom_range(0,25)%2;
          @(posedge clk);
         end
       $finish();
     end
endmodule
