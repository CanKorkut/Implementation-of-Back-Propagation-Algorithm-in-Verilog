module Delta_calculator(Error,Out,Delta,X,W,Clock);
input Clock;

input signed [31:0] Error ;
input signed [31:0] Out;

output signed [31:0] Delta;
output reg  signed  [31:0]W; 


output signed [31:0] X;
wire signed [31:0] Y;

assign X= Error*Out;
assign Delta = X/1000;
always @ (negedge Clock)
	W=Delta+W;

endmodule


