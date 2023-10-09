Design and verify the parameterized Binary to Gray code converter.

The module should have the following interface:
odule Bin_to_Gray
#(parameter len = 4)(
input [len-1:0]BIN,
output [len-1:0]GRAY);
