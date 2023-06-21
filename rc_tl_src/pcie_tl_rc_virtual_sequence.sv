class pcie_tl_rc_virtual_sequence extends uvm_sequence;
	pcie_tl_rc_config_seq cfg_seq; 

	//pcie_tl_rc_mem_seq mem_seq;
pcie_tl_rc_virtual_sequencer my_sequencer;
`uvm_object_utils(pcie_tl_rc_virtual_sequence)
`uvm_declare_p_sequencer(pcie_tl_rc_virtual_sequencer)

function new(string name="");
   super.new(name);
endfunction

task pre_body();
 cfg_seq=pcie_tl_rc_config_seq::type_id::create("cfg_seq");
 //mem_seq=pcie_tl_rc_mem_seq::type_id::create("mem_seq");
endtask
task body();
    `uvm_info(get_type_name(), "virtual_seq: Inside Body", UVM_LOW);
	if (!p_sequencer) begin
      	`uvm_fatal("NO_SEQUENCER", "No sequencer connected to virtual sequence")
      return;
    end
	
    fork
      cfg_seq.start(p_sequencer.cfg_sqr);
      //mem_seq.start(p_sequencer.mem_sqr);
      #100;
    join

endtask
endclass


