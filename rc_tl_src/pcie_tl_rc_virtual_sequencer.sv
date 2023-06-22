class pcie_tl_rc_virtual_sequencer extends uvm_sequencer;

pcie_tl_rc_config_sequencer cfg_sqr;
pcie_tl_rc_mem_sequencer mem_sqr;
`uvm_component_utils(pcie_tl_rc_virtual_sequencer)

function new(string name="", uvm_component parent=null); 
		super.new(name,parent); 

	endfunction
endclass
