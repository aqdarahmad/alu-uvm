`include "./lab1/sequence_item.sv"
import uvm_pkg::*;
`include "uvm_macros.svh"
class base_sequence extends uvm_sequence #(sequence_item);

`uvm_object_utils(base_sequence)


function new (string name = "base_sequence");
super.new(name);
endfunction



endclass
