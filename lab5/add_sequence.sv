`include "base_sequence.sv"
`include "uvm_macros.svh"
`include "./lab1/sequence_item.sv"
import uvm_pkg::*;
class add_sequence extends base_sequence;

  `uvm_object_utils(add_sequence)

  function new(string name="add_sequence");
    super.new(name);
  endfunction

  task body();
    sequence_item item;
    item = sequence_item::type_id::create("item");

    start_item(item);
    item.randomize() with {
      reset    == 0;
      opcode == 3'b000;
    };
    finish_item(item);
    //#10;
  endtask

endclass
