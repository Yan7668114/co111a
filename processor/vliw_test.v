`include "vliw_processor.v"
module VLIW_test;
reg clk;
reg [31:0] instruction;
reg [7:0] operand1,operand2;
wire [7:0] result1, result2;
vliw_processor test(clk,instruction,operand1,operand2,result1,result2);
initial begin 
    clk = 0;
    instruction[31:24] = 8'h00;
    instruction[23:16] = 8'h01;
    operand1 = 5;
    operand2 = 7;
    $monitor("%4d result = %d , %d ", $stime,result1,result2);
    #30 $finish;
end
always #5 begin clk = ~clk;
end
endmodule