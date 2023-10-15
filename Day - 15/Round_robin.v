`timescale 1ns / 1ps

//Round robin scheduling.
//Equal share of CPU among processes.
module Round_robin(
 input wire clk,
 input wire reset,
 input wire[3:0]Req,
 output wire[3:0]grant
    );
    
    //Identify the last grant.
    reg [3:0]mask_Q;
    reg [3:0]nxt_mask;
    
    always @(posedge clk or posedge reset)
      begin
        if(reset == 1'b1)
          begin
            mask_Q <= 4'hF;
            //mask_Q <= 4'h0;
          end
        else
         begin
            mask_Q <= nxt_mask;
         end
      end
      
      always @(posedge clk or posedge reset)
        begin
          //next mask is based on current granted request.
          if(grant[0])
             begin
               nxt_mask <= 4'b1110;
               //nxt_mask <= 4'b0001;
             end
          else if(grant[1])
             begin
               nxt_mask <= 4'b1100;
               //nxt_mask <= 4'b0011;
             end
          else if(grant[2])
             begin
               nxt_mask <= 4'b1000;
               //nxt_mask <= 4'b0111;
             end
          else if(grant[3])
             begin
               nxt_mask <= 4'b0000;
               //nxt_mask <= 4'b1111;
             end
        end
        
        //Generating masked requeset.
        reg [3:0]mask_req;
        always @(*)
         begin 
            assign mask_req = Req & mask_Q;
         end
         
         //Generate the masked and unmasked request.
        reg [3:0]mask_grant;
        reg [3:0]unmask_grant;
        
           //Generate grants for masked request.
           Priori_arbiter #(4) PAS1(.request(mask_req),.OUT(mask_grant));
           //Generate grants for unmasked request.
           Priori_arbiter #(4) PAS2(.request(Req),.OUT(unmask_grant));
       
       
        //Final output of masking and unmasking of process
        assign grant = |mask_req? mask_grant: unmask_grant;
endmodule
