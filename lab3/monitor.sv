
include "uvm_macros.svh"
include "lab1/sequence_item.sv"
include "lab2/alu_interface.sv"
import uvm_pkg::*;

class monitor extends uvm_monitor;
`uvm_component_utils(monitor)

virtual alu_interface vif;
uvm_analysis_port #(sequence_item) port;
sequence_item item;

function new (string name = "monitor",uvm_component parent);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
port=new("port ",this);
if(!uvm_config_db#(virtual alu_interface)::get(this,"","vif",vif))
`uvm_fatal(get_type_name(),"virtual interface must be set here");
endfunction


task run_phase(uvm_phase phase);
super.run_phase(phase);
forever begin
item = sequence_item::type-id::create("item");
wait(!vif.reset);

  @(posedge vif.clk);
  item.A = vif.A;
  item.B = vif.B;
  item.Opcode = vif.Opcode;
  

  @(posedge vif.clk);
  item.Result = vif.Result;
  item.Error = vif.Error;
  
 // write item to analysis port
  port.write(item);
end


end
endtask


endclass