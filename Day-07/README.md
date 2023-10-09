# Day - 07
Design and verify Linear Feedback shift register.
The feedback bit[0] is the XOR of bit[1], bit[3].

## Interface Definition - 
```verilog
module LFSR(
input clk,
input reset,
output reg[3:0]LFSR_out
    );
```
