`timescale 1ns / 1ps

module APB_master_tb();
 reg clk;
 reg reset;
 reg [1:0]command;
 reg [31:0]R_DATA;
 reg READY;
 wire select;
 wire enable;
 wire [31:0]ADDR;
 wire WRITE;
 wire [31:0]W_DATA;
 
  APB_master APB(.clk(clk),.reset(reset),.command(command),.select(select),.enable(enable),.ADDR(ADDR),.WRITE(WRITE),.W_DATA(W_DATA),.R_DATA(R_DATA),.READY(READY));
  
  initial
    begin
     clk = 1'b0;
     forever #10 clk =~clk;
    end
    
    //Generating waiting cycles.
    integer wait_cycles;
    initial
      begin
       READY = 1'b0;
       wait_cycles = $urandom_range(1,10);
       
        while(wait_cycles)
          begin
            @(posedge clk);
            wait_cycles = wait_cycles - 1;
          end
         READY = 1'b1;
         @(posedge clk);
      end
      
      //Generating stimulus
      integer i;
      initial
        begin
         reset = 1'b1;
         command = 2'b00;
         R_DATA = 32'h0;
         @(posedge clk);
         
         reset = 1'b0;
         @(posedge clk);
         @(posedge clk);
         
          for(i =0; i<10 ;i=i+1)
            begin
             command = i%2?2'b10:2'b01;
             R_DATA = $urandom_range(0,4'hF);
             
             //waiting for READY flag.
             while(~READY | ~select)
               begin
                 @(posedge clk);
                 @(posedge clk);
               end
            end
            $stop();
        end
endmodule
