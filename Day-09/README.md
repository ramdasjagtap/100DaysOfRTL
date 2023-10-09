# Day - 09
Design and verify the parameterized Binary to Gray code converter.

## Interface Definition- 
The module should have the following interface:
```verilog
module Bin_to_Gray
#(parameter len = 4)(
input [len-1:0]BIN,
output [len-1:0]GRAY);
```
