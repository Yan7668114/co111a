`include "cisc_processor.v"
module cisc_test;
reg clk;
reg [7:0] opcode,operand1,operand2,operand3;
wire [7:0] result;
cisc_processor test(clk,opcode,operand1,operand2,operand3, result);

initial begin
    clk = 0;
    opcode = 8'h01;
    operand1 = 5;
    operand2 = 7;
    $monitor("%4d result = %d", $stime,result);
    #30 $finish;
end
always #5 begin clk = ~clk;
end
endmodule