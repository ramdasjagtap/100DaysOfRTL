`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.10.2023 11:36:15
// Design Name: 
// Module Name: Rising_Falling_edge_detector_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Rising_Falling_edge_detector_tb();

reg clk;
reg reset;
reg Signal;
wire rising_edge_o;
wire falling_edge_o;

Rising_Falling_edge_detector detector(.clk(clk),.reset(reset),.Signal(Signal),.rising_edge_o(rising_edge_o),.falling_edge_o(falling_edge_o));

  initial 
   begin 
    clk = 1'b0;
    forever #10 clk = ~clk;
   end
   
   
  initial
   begin
    reset <= 1'b1;
    Signal <= 1'b1;
    @(posedge clk);
    
    reset <= 1'b0;
    @(posedge clk);
    
    for (integer i=0; i<64; i=i+1) 
    begin
      Signal <= $random%2;
      @(posedge clk);
    end
  end

endmodule
