module cisc_processor (
  input clk,
  input [7:0] opcode,
  input [7:0] operand1,
  input [7:0] operand2,
  input [7:0] operand3,
  output [7:0] result
);


reg [7:0] regfile[15:0];
reg [7:0] alu_result;
reg [7:0] result;

always @(posedge clk) begin
  case (opcode)
    8'h00: alu_result <= operand1 + operand2;
    8'h01: alu_result <= operand1 - operand2;
    8'h02: alu_result <= operand1 & operand2;
    8'h03: alu_result <= operand1 | operand2;
    8'h04: alu_result <= operand1 ^ operand2;
    8'h05: alu_result <= ~operand1;
    default: alu_result <= 8'h00;
  endcase
  
  regfile[operand3] <= alu_result;
  
  result <= alu_result;
  
end
endmodule
