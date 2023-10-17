`timescale 1ns / 1ps

//APB- Advanced peripheral bus
//APB- master
// TB should drive a cmd_i input decoded as:
// 2'b00 - No-op(IDLE)
// 2'b01 - Read from address 0xDEADCAFE (SETUP)
// 2'b10 - Increment the previously read data and store it to 0xDEADCAFE(ACCESS).

module APB_master(
 input clk,
 input reset,
 input [1:0]command,
 input  [31:0]R_DATA,
 input READY,
 output select,
 output enable,
 output [31:0]ADDR,
 output WRITE,
 output [31:0]W_DATA
    );
    
    reg nxt_state;
    reg state_q;
    reg R_DATA_q;
    always @(posedge clk)
       begin
        if(reset)
          begin
            state_q <= 2'b00;
          end
       else
          begin
            state_q <= nxt_state;
          end
       end
       
       
     always @(posedge clk)
       begin
         //Cases (FSM)
         nxt_state <= state_q;
           case(state_q)
            2'b00:
               begin
                 if(|command)
                   begin
                     nxt_state <= 2'b01; //SETUP
                   end
                else
                   begin
                     nxt_state <= 2'b00;  //IDLE
                   end
               end
            2'b01: 
               begin
                 nxt_state <= 2'b10;  //ACCESS
               end
            2'b10:
                begin
                  if(READY)
                    begin
                      nxt_state <= 2'b00; //IDLE
                    end
                end
            default:nxt_state <= state_q;
           endcase
       end
       
       // Selecting Final output.
       assign select =(state_q == 2'b01)|(state_q == 2'b10);
       assign enable =(state_q == 2'b10);
       assign WRITE = command[1];
       assign ADDR = 32'hDEADCAFE;
       assign W_DATA = R_DATA_q + 32'h1;
       
       
       //Reading DATA.
       always @(posedge clk)
         begin
           if(reset)
             begin
               R_DATA_q <= 32'h0;
             end
           else 
              begin
               if(enable && READY)
                 begin
                   R_DATA_q <= R_DATA;
                 end
              end
         end
endmodule
