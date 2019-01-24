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
reg [5:0] x; //LED�̓_�Ńp�^�[���I��
reg [20:0] counter; //�J�E���g�p�ϐ�
parameter count_clk_max = 'd1500000;//�J�E���g�̍ő�l
reg [7:0] led;//led�p

always@(posedge clk)begin //�N���b�N�̗����オ��̎�
    if(btnc)begin      //�{�^�����������ꂽ��
            counter<=0;//�J�E���^�[���O
            x<=0;//�I��l���O
    end else
    begin 
        if(btnd||btnl||btnr||btnu)//�{�^��c�ȊO�������ꂽ��
        begin
            if(counter<=count_clk_max)//�N���b�N�̃J�E���g�J�n
            begin
                    counter<=counter+1;
            if(counter==count_clk_max)//max�l�ɒB������
                begin
                    x<=x+1;     //�{�^�����������񐔂��J�E���g
                end
            end
        end else
        begin
            counter<=0;//�X�C�b�`��������Ă��Ȃ��Ƃ��̓J�E���^0
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
