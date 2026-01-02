class sequence_item extends uvm_sequence_item;

rand logic reset;
rand logic [31:0] A , B;
logic [31:0] result;
rand logic [2:0] opcode;
logic error;



`uvm_object_utils_begin(sequence_item);
`uvm_field_int(reset, UVM_ALL_ON);
`uvm_field_int(A, UVM_ALL_ON);
`uvm_field_int(B, UVM_ALL_ON);
`uvm_field_int(opcode, UVM_ALL_ON);
`uvm_field_int(result, UVM_ALL_ON);
`uvm_field_int(error, UVM_ALL_ON);
`uvm_object_utils_end




function new (string name = "sequence_item");
super.new(name);
endfunction

endclass: sequence_item