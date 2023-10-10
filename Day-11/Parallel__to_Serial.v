`timescale 1ns / 1ps

//parallel in serial out 
module Parallel__to_Serial(
input clk,
input reset,
input [3:0]parallel_in,
output reg serial_out,
output reg empty_out,
output reg valid_out
    );
    
    reg [3:0]nxt_shift;
    reg [3:0]shift_ff;
    always @(posedge clk or posedge reset)
      begin
        if(reset == 1'b1)
          begin
            shift_ff <= 4'h0;
          end
        else
         begin
           shift_ff <= nxt_shift;
         end 
     assign nxt_shift = empty_out? parallel_in:{1'b0,shift_ff[3:1]};
     assign serial_out = shift_ff[0];
    end
    
    
    reg [2:0]count_ff;
    reg [2:0]nxt_count;
    always @(posedge clk or posedge reset)
      begin
        if(reset == 1'b1)
          begin
            count_ff <= 3'h0;
          end
        else
           begin
             count_ff <= nxt_count;
           end
         assign nxt_count =(count_ff == 3'h4)?3'h0:(count_ff+3'h1);
         assign valid_out = |count_ff;
         assign empty_out = (count_ff == 3'h0);
      end
endmodule
