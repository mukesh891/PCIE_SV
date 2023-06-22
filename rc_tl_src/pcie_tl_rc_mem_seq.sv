class pcie_tl_rc_mem_seq extends uvm_sequence#(pcie_tl_rc_mem_seq_item_pkg); 

    `uvm_object_utils(pcie_tl_rc_mem_seq)

    function new(string name="");
       super.new(name);
    endfunction
  task pre_body();
    
	if(starting_phase != null)begin
      		starting_phase.raise_objection(this);
    		starting_phase.phase_done.set_drain_time(this,100);
    	end
  endtask
  
  task post_body();
	  if (starting_phase != null)
		  starting_phase.drop_objection(this); 

  endtask

  task body();
     req = pcie_tl_rc_mem_seq_item_pkg::type_id::create("req"); 
  	`uvm_do(req)
  endtask

    endclass
