interface alu_interface (logic clk);

 logic [31:0] A , B;
 logic [31:0] result;
 logic [2:0] opcode;
 logic reset;
 logic error;

// clocking block for inputs

clocking  driver @(negedge clk);
output A;
output B;
output opcode;
endclocking

clocking monitor @(posedge clk);
input A;
input B;
input opcode;
input result;
input error;

endclocking
 

 modport drv(clocking driver , input clk);
 modport mon (clocking monitor , input clk);
 endinterface
