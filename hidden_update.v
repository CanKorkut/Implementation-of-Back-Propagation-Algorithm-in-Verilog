module hidden_update (out,Error,W,Clock,f,reset);

input [31:0] f ;
input reset;

input signed [31:0] out;
input signed [31:0] Error;
output reg signed [31:0] W ;

input Clock ;
reg signed [31:0] xx ;

wire signed  [31:0] Fd; 
Sigmoid_Derivative(.Out(out),.F_d(Fd));

always @ (negedge Clock or posedge reset)
begin
	if (reset)
		W= f;
	else
	begin
		xx = (Fd* Error );
		xx = xx * W  / 10000000;
		W	= W + xx;
	end
end

endmodule
