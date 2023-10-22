`timescale 1ns / 1ps

//Day 19 module
//Synchronous parameterized FIFO.
module Day18
#(parameter DEPTH = 4,
  parameter DATA_W = 1
)(
 input clk,
 input reset,
 input push_i,
 input [DATA_W-1:0]push_data_i,
 input pop_i,
 output reg[DATA_W-1:0]pop_data_o,
 output full_o,
 output empty_o
    );
    
    //Pointer length
    parameter PTR = $clog2(DEPTH);
    
    reg [PTR-1:0]wr_ptr;
    reg [PTR-1:0]rd_ptr;
    reg [DATA_W-1:0]memory [DEPTH:0];
    always @(posedge clk)
      begin
        if(!reset)
          wr_ptr <= 0;
          rd_ptr <= 0;
          pop_data_o <= 0;
      end
      
      
      //Write data in FIFO
      always @(posedge clk)
        begin
         if(push_i & !full_o)
           begin
            memory[wr_ptr] <= push_data_i;
            wr_ptr <= wr_ptr + 1;
           end
        end
        
        
        //Reading data from fifo
        always @(posedge clk)
          begin
             if(pop_i & !empty_o)
               begin
                pop_data_o <= memory[rd_ptr];
                rd_ptr <= rd_ptr + 1;
               end
          end
          
       assign full_o = ((wr_ptr + 1'b1) == rd_ptr);
       assign empty_o = (wr_ptr == rd_ptr);
       
endmodule
