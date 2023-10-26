`timescale 1ns / 1ps

//Class based test bench.

//printing "HELLO WORLD"  in system verilog by using class.
module Day22_tb();
  
  Day22 day22;
  
  initial
    begin
     day22 = new();
     day22.print_hello();
     $finish();
    end
endmodule
