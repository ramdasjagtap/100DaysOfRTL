# Day 17
Design and verify slave memory interface. The interface should generate ready output after random delay.
Memory should be `16x32` bits wide.

## Interface Definition - 
- The module should have the following interface:

```verilog
module Slave_mem(
 input clk,
 input reset,
 input request,
 input READ,
 input [3:0]ADDR,
 input [31:0]WDATA,
 output reg ready,
 output reg[31:0]RDATA
 );
```
