class pcie_tl_rc_mem_seq extends uvm_sequence#(pcie_tl_rc_mem_seq_item_pkg); 

    `uvm_object_utils(pcie_tl_rc_mem_seq)

    function new(string name="");
       super.new(name);
    endfunction

    task body();
       `uvm_do(req)
    endtask

    endclass
