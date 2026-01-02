


`include "base_sequence.sv"
`include "uvm_macros.svh"
`include "./lab1/sequence_item.sv"
class and_sequence extends base_sequence;
`uvm_object_utils(and_sequence)


function new (string name = "and_sequence");
super.new("and_sequence");
endfunction
 
 task body();
  sequence_item item;
  item = sequence_item :: type_id::create("item");
  start_item(item);
  item.randomize() withe {
    reset = 0;
    opcode = 3'b010;
  }
  finish_item(item);


 endtask 


endclass