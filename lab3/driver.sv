import uvm_pkg::*;
include "uvm_macros.svh"
include "./lab1/sequence_item.sv"
include "./lab2/alu_interface.sv"



class driver extends uvm_driver #(sequence_item);
`uvm_component_utils(driver)

virtula alu_interface vif;

sequence_item item;


function new (string name = "driver", uvm_component parent):
super.new(name , parent);
endfunction

function void build_phase(uvm_phase phase);

super.build_phase(phase);
if(!uvm_config_db#(virtual ALU_Interface) :: get(this, "", "vif", vif))
`uvm_fatal(get_type_name(), "Not set at top level");

endfunction

task run_phase (uvm_phase phase);
forever begin
item = sequence_item::type::id::create("item");
`uvm_info(get_type_name, $sformatf("Driver: signals driven to the DUT        	   are: A = %0d, B = %0d, Opcode = %h", item.A, item.B,item.Opcode),   	 	  UVM_HIGH);
seq_item_port.item_done();
end
endtask

task drive(sequence_item req);
@(vif.driver);
vif.driver.A=req.A;
vif.driver.B=req.B;
vif.driver.opcode=req.opcode;
endtask
endclass