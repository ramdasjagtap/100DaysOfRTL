# Day 20
Design and verify a read/write system described below:
- Writes should have higher priority than reads
- Sytem should be able to buffer 16 read or write requests to avoid any loss
- System must use APB master/slave protocol to communicate to memory interface

```
                                   rd_valid_o
                                       ^
                                       |
|-----|    |------|    |------|     |------|
| ARB | -> | FIFO | -> | APBM | <-> | APBS | => rd_data_o
|-----|    |------|    |------|     |------|
```

## Interface Definition - 
Module should have following interface- 
```verilog
module Day20(
 input clk,
 input reset,
 input READ_i,
 input WRITE_i,
 output rd_valid_o,
 output [31:0]rd_data_o
    );
```
