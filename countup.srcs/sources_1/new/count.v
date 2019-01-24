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


module count(
 input clk,
 input btnc,btnd,btnl,btnr,btnu,
 output [7:0] led
   );
reg [5:0] x; //LEDの点滅パターン選択
reg [20:0] counter; //カウント用変数
parameter count_clk_max = 'd1500000;//カウントの最大値
reg [7:0] led;//led用

always@(posedge clk)begin //クロックの立ち上がりの時
    if(btnc)begin      //ボタンｃが押されたら
            counter<=0;//カウンターを０
            x<=0;//選択値も０
    end else
    begin 
        if(btnd||btnl||btnr||btnu)//ボタンc以外が押されたら
        begin
            if(counter<=count_clk_max)//クロックのカウント開始
            begin
                    counter<=counter+1;
            if(counter==count_clk_max)//max値に達したら
                begin
                    x<=x+1;     //ボタンを押した回数をカウント
                end
            end
        end else
        begin
            counter<=0;//スイッチが押されていないときはカウンタ0
        end
    end 
end//always end
//////////////////////////////////////////
always@(x)begin
    case(x)
    0:led<=8'b00000000;
    1:led<=8'b00000001;
    2:led<=8'b00000011;
    3:led<=8'b00000111;
    4:led<=8'b00001111;
    5:led<=8'b00011111;
    6:led<=8'b00111111;
    7:led<=8'b01111111;
    8:led<=8'b11111111;
    default:led<=8'b11111111;
    endcase  
end

endmodule
