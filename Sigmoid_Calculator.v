module Sigmoid_Calculator(Net,F_net,X,Y,Z);

input signed [15:0] Net;

wire signed [31:0]abs_Net;
output signed [31:0] X;
output signed [31:0] Y;
output signed [31:0] Z;

output signed [31:0] F_net;

assign abs_Net = Net[15] ? -Net : Net;

Mult M0(Net,16'd1000,X); // X->90.000
Div  d0(.denom(abs_Net+32'd1000),.numer(X),.quotient(Y));//Y->9 
Add  A0(Y,32'd1000,Z);//-> Z 109
Div  d1(.denom(32'd2),.numer(Z),.quotient(F_net));

endmodule

