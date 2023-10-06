`timescale 1ns / 1ps

module LFSR_tb();
reg clk;
reg reset;
wire [3:0]LFSR_out;

LFSR lfsr(.clk(clk),.reset(reset),.LFSR_out(LFSR_out));

initial
begin
clk = 1'b0;
forever #10 clk = ~clk;
end

initial
begin
reset = 1'b0;
@(posedge clk);

reset = 1'b0;
@(posedge clk);

reset = 1'b1;
@(posedge clk);

reset = 1'b0;
@(posedge clk);

reset = 1'b0;
@(posedge clk);

end
endmodule
