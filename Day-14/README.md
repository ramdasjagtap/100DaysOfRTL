# Day - 14
Design and verify parameterized fixed priory arbiter.

## Interface Definitition - 
- Output should produced in single cycle.
- The module should have following interface:-
  ```verilog
module Priori_arbiter
#(parameter PORTS =4)(
 input [PORTS-1:0]request,
 output [PORTS-1:0]OUT 
    );
  ```
