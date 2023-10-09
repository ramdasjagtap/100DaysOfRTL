# Day - 06
Design and verify Simple shift register (serial input and parallel out).

## Interface Definition -
```verilog
module Simple_Shift_Register(
input clk,
input reset,
input D,
output reg[3:0]Q
    );
```
