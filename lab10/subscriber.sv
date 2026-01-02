



class subscriber extend uvm_subscriber #(sequence_item);

`uvm_component_utils(subscriber)

sequence_item item;
covergroup alucoverage;
   A : coverpoint item.A;
   B : coverpoint item.B;
   opcode : coverpoint item.opcode;
   result : coverpoint item.result;
   error : coverpoint item.error;

 endgroup  

function new (string name = "subscriber", uvm_component parent);
    super.new(name , parent );
    alucoverage = new();
    item = new();
    endfunction


function void write(sequence_item t);
  item.A      = t.A;
  item.B      = t.B;
  item.opcode = t.opcode;
  item.result = t.result;
  item.error  = t.error;
  alucoverage.sample();
endfunction

  
function void report_phase(uvm_phase phase);
  super.report_phase(phase);
  `uvm_info(
    get_type_name(),
    $sformatf("Coverage: %0.2f%%", aluCoverage.get_coverage()),
    UVM_HIGH
  );
endfunction




endclass



