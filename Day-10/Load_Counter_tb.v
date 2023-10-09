`timescale 1ns / 1ps

module Load_Counter_tb();

reg clk;
reg reset;
reg load_i;
reg [3:0]load_val;
wire [3:0]count;

Load_Counter LC(.clk(clk),.reset(reset),.load_i(load_i),.load_val(load_val),.count(count));

initial
begin
clk = 1'b0;
forever #10 clk=~clk;
end

 integer cycles;
  initial
   begin
    reset <= 1'b1;
    load_i <= 1'b0;
    load_val <= 4'h0;
    @(posedge clk);
    reset <= 1'b0;
    for (integer i=0; i<3; i=i+1) 
    begin
      load_i <= 1;
      load_val <= 4*i;
      cycles = 4'hF - load_val[3:0];
      @(posedge clk);
      load_i <= 0;
      while (cycles) begin
        cycles = cycles - 1;
        @(posedge clk);
      end
    end
    $stop();
  end
endmodule
