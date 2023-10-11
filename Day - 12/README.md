# Day - 12
Design and verify sequence detector which detect the sequence: `1110_1101_1011`

## Interface Definition - 
-Overlapping Sequences should be detected.
-The module should have following constraint.

```verilog
module Sequence_Det(
 input clk,
 input reset,
 input IN,
 output reg OUT
);
```
