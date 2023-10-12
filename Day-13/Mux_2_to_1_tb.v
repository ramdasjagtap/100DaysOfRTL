`timescale 1ns / 1ps

module Mux_2_to_1_tb();

 reg [3:0]IN;
 reg [3:0]select;
 wire y_ter;
 wire y_case;
 wire y_ifelse;
 wire y_loop;
 wire y_aor;

 Mux_2_to_1 MUX(.IN(IN),.select(select),.y_ter(y_ter),.y_case(y_case),.y_ifelse(y_ifelse),.y_loop(y_loop),.y_aor(y_aor));
 
 integer i;
 initial
   begin
    for(i=0; i<32; i=i+1)
      begin
        IN = $urandom_range(0,4'hF);
        select = 1'b1 << $urandom_range(0,2'h3);
        #10;
      end
      $stop();
   end
endmodule
