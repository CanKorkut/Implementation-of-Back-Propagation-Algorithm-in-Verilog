module Error_calculator (Target,Out,Error,F_d,Target_sub,sx);

input signed [31:0] Target ;
input signed [31:0] Out;

output signed [31:0] Error;
output signed [31:0] F_d;
output signed [31:0] Target_sub;
output signed [31:0] sx;

Sub s0(Target,Out,Target_sub);
Sigmoid_Derivative s1(Out,F_d,sx);
assign Error = F_d * Target_sub;

endmodule

