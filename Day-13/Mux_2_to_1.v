`timescale 1ns / 1ps

module Mux_2_to_1(
 input [3:0]IN,
 input [3:0]select,
 output  y_ter,
 output reg y_case,
 output reg y_ifelse,
 output reg y_loop,
 output  y_aor
    );
    
    //Ternary operation.
    assign y_ter = select[0]?IN[0]:select[1]?IN[1]:select[2]?IN[2]:IN[3];
    
    //Using case:
    always @(*)
      begin
        case(select)
         4'b0001: y_case = IN[0];
         4'b0010: y_case = IN[1];
         4'b0100: y_case = IN[2];
         4'b1000: y_case = IN[3];
         default: y_case = 1'bx;
        endcase
      end
    
    //Using ifelse
    always @(*)
      begin
       if(select[0])
          begin
            y_ifelse = IN[0];
          end
       else if(select[1])
          begin
           y_ifelse = IN[1];
          end
       else if(select[2])
          begin
             y_ifelse = IN[2];
          end
       else
          begin
            y_ifelse = IN[3];
          end
      end
      
      //Loop
      integer i;
      always @(*)
        begin
          y_loop = 1'b0;
          for(i=0; i<4;i=i+1)
            begin
               y_loop = (select[i] & IN[i]) | y_loop;
            end
        end
    
    
    //AND-OR tree
    assign y_aor = (select[0] & IN[0]) |(select[1] & IN[1])|(select[2] & IN[2])|(select[3] & IN[3]);
endmodule
