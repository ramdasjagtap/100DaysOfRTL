# Day 19
Design and verify parameterized synchronous FIFO.

## Interface Definition -
The module should have following interfaces- 
```verilog
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
```
