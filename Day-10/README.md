# DAY-10
Design and verify a counter which supports loading value.

## Interfaces Definition:
-The counter should reset to 0.
-The module should have the following interface:

```verilog
module Load_Counter(
input clk,
input reset,
input load_i,
input [3:0]load_val,
output reg[3:0]count
    );
``` 
