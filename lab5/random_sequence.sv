`include "base_sequence.sv"
`include "uvm_macros.svh"
`include "./lab1/sequence_item.sv"
import uvm_pkg::*;

class random_sequence extends base_sequence;
`uvm_object_utils(random_sequence)


function new (string name = "random_sequence");
super.new(name);
endfunction


task body();
sequence_item item;
item = sequence_item::type_id::create("item");

start_item(item);
// randomize the item with constraints
item.randomize() with {
reset = 0;
opcode == 3'b001;
};
finish_item(item);
//#10;
endtask



endclass