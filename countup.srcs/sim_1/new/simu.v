`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/20 15:08:13
// Design Name: 
// Module Name: count
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


module simu();
/*
reg x;
reg [7:0] led;

always@(posedge ck)begin
    if(btnc)begin
        x=0;
    end
    else if(btnd||btnl||btnr||btnu)begin
        x=x+1;
    end 
end

always@(x)begin
    case(x)
    3'b000:led<=7'b0000000;
    3'b001:led<=7'b0000001;
    3'b010:led<=7'b0000011;
    3'b011:led<=7'b0000111;
    3'b100:led<=7'b0001111;
    3'b101:led<=7'b0011111;
    3'b110:led<=7'b0111111;
    3'b111:led<=7'b1111111;
    endcase
end
*/

reg clk;
reg btnc;
reg btnr;
reg btnl;
reg btnu;
reg btnd;
wire [7:0] led;

initial begin //ck
    forever begin
        #10 clk = 1'b0;
        #10 clk = 1'b1;
    end
end

initial begin //c
    btnc = 1'b0;
   #105 btnc = 1'b1;
   #20  btnc = 1'b0;
  //  #600 btnc = 1'b1;
    //#20  btnc = 1'b0;
end

initial begin//r
    btnr = 1'b0;
    #160 btnr =1'b1;
    #1050  btnr =1'b0;
end 

initial begin//l
 //   btnl = 1'b0;
  //  #200 btnl =1'b1;
 //   #20  btnl =1'b0;
end 

initial begin//u
   // btnu = 1'b0;
    //#300 btnu =1'b1;
    //#20  btnu =1'b0;
end 

initial begin//d
   btnd = 1'b0;
   #400 btnd =1'b1;
   #100000000  btnd =1'b0;
   
   
end 


//-- DUT
count count (
   .clk( clk ),
   .btnc(btnc ), 
   .btnd(btnd ), 
   .btnl(btnl),
   .btnr(btnr),
   .btnu(btnu),
  // .sw(sw),
   .led(led)
);

endmodule
