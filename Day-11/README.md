# Day - 11
Design and verify a 4-bit parallel to serial converter with valid and empty indication.(PISO)

## Interface Definition-
The module should have following interfaces-
```verilog
module Parallel__to_Serial(
input clk,
input reset,
input [3:0]parallel_in,
output reg serial_out,
output reg empty_out,
output reg valid_out
    );
```
