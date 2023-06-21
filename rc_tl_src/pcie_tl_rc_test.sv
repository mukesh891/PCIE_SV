class pcie_tl_rc_test extends uvm_test;

`uvm_component_utils(pcie_tl_rc_test)

function new(string name="",uvm_component parent=null);
   super.new(name,parent);
endfunction

pcie_tl_rc_env e_env;
pcie_tl_rc_virtual_sequencer v_sqr;
pcie_tl_rc_virtual_sequence v_seq;

function void build_phase(uvm_phase phase);
   super.build_phase(phase);
   `uvm_info("Phase","build_phase",UVM_LOW)
   e_env=pcie_tl_rc_env::type_id::create("e_env",this);
   v_sqr=pcie_tl_rc_virtual_sequencer::type_id::create("v_sqr",this);
   
   v_seq=pcie_tl_rc_virtual_sequence::type_id::create("v_seq");
endfunction
function void connect_phase(uvm_phase phase);
   v_sqr.cfg_sqr = e_env.agent.cfg_sqr;
   //v_sqr.mem_sqr = e_env.agent.mem_sqr;
    
  endfunction

function void end_of_elaboration_phase(uvm_phase phase);
   uvm_factory factory=uvm_factory::get();
   factory.print();
   uvm_top.print_topology();
endfunction

task run_phase(uvm_phase phase);

   phase.raise_objection(this);

   // Call the subphases
    reset_phase(phase);
    config_phase(phase);
    main_phase(phase);
    shutdown_phase(phase);

   phase.drop_objection(this);
endtask

   task reset_phase(uvm_phase phase);
      `uvm_info("Run_phase","Reset_phase",UVM_LOW)
  endtask

  task config_phase(uvm_phase phase);
      `uvm_info("Run_phase","config_phase",UVM_LOW)
  endtask

  task main_phase(uvm_phase phase);
      `uvm_info("Run_phase","main_phase",UVM_LOW)
      //v_seq.start(env.v_sqr);
      v_seq.start(v_sqr);
  endtask

  task shutdown_phase(uvm_phase phase);
      `uvm_info("Run_phase","shutdown_phase",UVM_LOW)
  endtask

endclass
