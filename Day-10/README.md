## Design and verify counter which suppourts loading value.

## Counter should reset to 0.
## The module should have the following interface:

module Load_Counter(
input clk,
input reset,
input load_i,
input [3:0]load_val,
output reg[3:0]count
    );
    
