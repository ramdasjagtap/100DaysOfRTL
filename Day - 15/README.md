# Day - 15
Design and verify the 4-bit round robin arbiter.

## Interface Definition - 
-Output should be produced in single cycle.
-Output must be one-hot.
-The module should have following interface:-

```verilog
module Round_robin(
 input wire clk,
 input wire reset,
 input wire[3:0]Req,
 output wire[3:0]grant
    );
```
