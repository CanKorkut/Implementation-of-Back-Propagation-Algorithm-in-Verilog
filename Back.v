module Back (Clock,reset,a,b,egit,led);

input Clock;
input reset;
input a,b ;
input egit;
wire signed [31:0] Out1;
output reg led = 1'b1;

always @ (Out1,a,b,egit)
begin
	if(egit)
	begin
		case ({counter})
		2'b00:
			if(Out1>949 && Out1<1001)
			 led =1'b1;
			else
			 led = 1'b0;
		2'b01:
			if(Out1>-1 && Out1<51)
			 led =1'b1;
			else
			 led = 1'b0;
		2'b10:
			if(Out1>-1 && Out1<51)
			 led =1'b1;
			else
			 led = 1'b0;
		2'b11:
			if(Out1>949 && Out1<1001)
			 led =1'b1;
			else 
			 led = 1'b0;
		endcase
	end
end



parameter  [31:0] a0 = 1;
parameter  [31:0] a1 = 2;
parameter  [31:0] a2 = 3;
parameter  [31:0] a3 = 4;
parameter  [31:0] a4 = 5;
parameter  [31:0] a5 = 6;
parameter  [31:0] a6 = 7;
parameter  [31:0] a7 = 8;
parameter  [31:0] a8 = 9;

reg [1:0] counter=0;

wire signed [31:0] Neuron0_out;
wire signed [31:0] Neuron1_out;

always @ (posedge Clock)
	counter=counter + 1'b1;

wire signed [31:0] Error0;
wire signed [31:0] Error1,Error2;
wire signed [31:0] Delta0;
wire signed [31:0] Delta1,Delta2;
wire signed [31:0] Fd;
wire signed [31:0] Sb;
wire signed [31:0] sx;
wire 	signed [31:0] W1;
wire 	signed [31:0] W2;
wire 	signed [31:0] W3;
wire 	signed [31:0] W4;
wire signed [31:0] W5;
wire signed [31:0] W6;
wire signed  [31:0] B0;
wire signed  [31:0] B1;
wire signed  [31:0] B2;
wire signed [31:0] xx ;
wire signed [31:0] i0,i1;
assign i0 = egit ? {31'd0,counter[0]} : {31'd0,a};
assign i1 = egit ? {31'd0,counter[1]} : {31'd0,b};

wire x,y;
assign x = i0[0];
assign y = i1[0];

Error_calculator E0((counter[0]^counter[1])*1000,Out1,Error0,Fd,Sb,sx);

Neuron Hidden0((i0*W1*1000),(i1*W2*1000),B0,Neuron0_out);
Neuron Hidden1((i0*W3*1000),(i1*W4*1000),B1,Neuron1_out);
Neuron Out	  (Neuron0_out*W5,Neuron1_out*W6,B2,Out1);

hidden_update h1(Neuron0_out,Error0,W1,Clock,a0,reset);
hidden_update h2(Neuron0_out,Error0,W2,Clock,a1,reset);
hidden_update h3(Neuron1_out,Error0,W3,Clock,a2,reset);
hidden_update h4(Neuron1_out,Error0,W4,Clock,a3,reset);

update u5(Error0,Neuron0_out,W5,Clock,a4,reset);
update u6(Error0,Neuron1_out,W6,Clock,a5,reset);


hidden_update u7(Neuron0_out,Error0,B0,Clock,a6,reset);
hidden_update u8(Neuron1_out,Error0,B1,Clock,a7,reset);
update u9(Error0,1,B2,Clock,a8,reset);



endmodule

