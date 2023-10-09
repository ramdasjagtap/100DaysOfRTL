# Day - 08
Design and verify Parameterized Binary to One hot converter.

## Interface Definition - 
```verilog
module Bin_To_OneHot #(
parameter IN = 4,
parameter OUT = 16
)(
input [IN-1:0]BIN_IN,
output [OUT-1:0]ONE_HOT_OUT
);
```
