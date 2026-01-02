
`include "./lab4/agent.sv"
`include "uvm_macros.svh"
`include "./lab6/scoreboard.sv"
`include "./lab10/subscriber.sv"
class env extends uvm_env;

`uvm_component_utils(env)
agent agt;
scoreboard sb;
subscriber sub;



function new (string name , uvm_component parent);
super.new(name , parent);
endfunction


function void build_phase(uvm_phase phase);
super.build_phase(phase);
agt = agent::type_id::create("agt",this);
sb = scoreboard::type_id::create("sb",this);
sub = subscriber::type_id::create("sub",this);
endfunction


function void connect_phase(uvm_phase phase);
agt.monitor.port.connect(sb.expected);
agt.monitor.port.connect(sub.analysis_export);


endfunction

endclass