include "uvm_macros.svh"
import uvm_pkg::*;
include "./lab1/sequence_item.sv"
include "./lab3/monitor.sv"
include "./lab3/driver.sv"
include "./lab1/sequencer.sv"

class agent extends uvm_agent;
`uvm_component_utils(agent);

monitor mon;
sequencer seque;
driver dri;

function new(string name = "agent",uvm_component parent);
super.new(name ,parent);
endfunction



function void build_phase(uvm_phase phase);
super.build_phase(phase);
  if(get_is_active() == UVM_ACTIVE) begin
    seque = sequencer::type_id::create("sequencer",this);
    dri = driver::type_id::create("driver",this);
  end
  mon = monitor::type_id::create("monitor",this);



endfunction


function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
  if(get_is_active() == UVM_ACTIVE)begin
    dri.seq_item_port.connect(seque.seq_item_export);
  end


endfunction


endclass