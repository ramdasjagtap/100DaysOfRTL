# Day-16
Design and verify an APB master interface that generates an APB transfer using a command input:
| command | Comment |
|-------|---------|
| 2'b00 | No-operation |
| 2'b01 | APB Read from address 0xDEADCAFE |
| 2'b10 | Increment the previously read data and write to 0xDEADCAFE |
| 2'b11 | Not possible |

## Interface Definition-
- The `command` input remains stable until the APB transfer is complete
- The module should have the following interface:
- 
```verilog
module APB_master(
 input clk,
 input reset,
 input [1:0]command,
 input  [31:0]R_DATA,
 input READY,
 output select,
 output enable,
 output [31:0]ADDR,
 output WRITE,
 output [31:0]W_DATA
    );
```
