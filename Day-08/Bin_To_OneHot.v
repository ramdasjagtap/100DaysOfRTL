`timescale 1ns / 1ps

//Paratermized Binary to one hot coverter.
// For N input, 2^N output;

module Bin_To_OneHot #(
parameter IN = 4,
parameter OUT = 16
)(
input [IN-1:0]BIN_IN,
output [OUT-1:0]ONE_HOT_OUT
);

 assign ONE_HOT_OUT = 1'b1 << BIN_IN;
 
endmodule
