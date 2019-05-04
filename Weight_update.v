module Weight_update (W_old,Delta,W_new,Clock);

input signed[31:0] W_old,Delta;
input Clock;

output reg signed [31:0]W_new;
wire signed [31:0] X;

Add (W_old,Delta,X);

always @ (negedge Clock)
	W_new = X;


endmodule
