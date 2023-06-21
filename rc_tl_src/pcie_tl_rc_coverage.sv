class pcie_tl_rc_coverage extends uvm_subscriber#(pcie_tl_rc_tx); 

    `uvm_component_utils(pcie_tl_rc_coverage)

    pcie_tl_rc_tx tx;

    covergroup pcie_tl_rc_cg;
    endgroup

    function new(string name="",uvm_component parent=null);
       super.new(name,parent);
       pcie_tl_rc_cg=new();
    endfunction

    function void write(T t);
       $cast(tx,t);
       pcie_tl_rc_cg.sample();
    endfunction

    endclass