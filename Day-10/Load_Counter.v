`timescale 1ns / 1ps

module Load_Counter(
input clk,
input reset,
input load_i,
input [3:0]load_val,
output reg[3:0]count
    );
    
    reg [3:0]load_ff;
    always @(posedge clk or posedge reset)
    begin
      if(reset)
        load_ff <= 4'h0;
      else if(load_i)
        load_ff <= load_val;
     end
         
     reg [3:0]count_ff;
     reg [3:0]nxt_count;    
     always @(posedge clk or posedge reset)
     begin
      if(reset)
      count_ff <= 4'h0;
      else
      count_ff <= nxt_count;
      assign nxt_count = load_i?load_val:(count_ff == 4'hF)?load_ff:(count_ff+4'h1);
      assign count = nxt_count;
     end
    
endmodule