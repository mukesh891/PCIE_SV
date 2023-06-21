class pcie_tl_rc_env extends uvm_env;

`uvm_component_utils(pcie_tl_rc_env)

function new(string name="", uvm_component parent=null);
   super.new(name, parent);
endfunction
//pcie_tl_rc_virtual_sequencer v_sqr;
pcie_tl_rc_agent agent;

function void build_phase(uvm_phase phase);
   super.build_phase(phase);
   `uvm_info("Phase", "build_phase", UVM_LOW)
  // v_sqr=pcie_tl_rc_virtual_sequencer::type_id::create("v_sqr",this);
   agent = pcie_tl_rc_agent::type_id::create("agent", this);

endfunction

function void connect_phase(uvm_phase phase);
   `uvm_info("Phase", "Connect_phase", UVM_LOW)
   //v_sqr.cfg_sqr = agent.cfg_sqr;
   //v_sqr.mem_sqr = agent.mem_sqr;
endfunction

 endclass
