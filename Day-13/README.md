# Day - 13
Design and verify the 2:1 mux which has following constraints-
| constraints |
|----------|
|Ternary Operator|
|Case statement|
|If else block|
|Combinatorial For loop|
|And-or tree|

## Interface Definition -
The module should have following interface -

```verilog
module Mux_2_to_1(
 input [3:0]IN,
 input [3:0]select,
 output  y_ter,
 output reg y_case,
 output reg y_ifelse,
 output reg y_loop,
 output  y_aor
    );
```
