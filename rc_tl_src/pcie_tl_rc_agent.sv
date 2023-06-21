class pcie_tl_rc_agent extends uvm_agent; 
    `uvm_component_utils(pcie_tl_rc_agent)

    function new(string name="", uvm_component parent=null);
       super.new(name, parent);
    endfunction

    pcie_tl_rc_driver drv;
    //pcie_tl_rc_sequencer sqr;
    pcie_tl_rc_virtual_sequence v_seq;
    pcie_tl_rc_config_sequencer cfg_sqr;
    //pcie_tl_rc_mem_sequencer mem_sqr;
    pcie_tl_rc_tx_monitor tx_mon;
    //pcie_tl_rc_rx_monitor mon;
//pcie_tl_rc_coverage cov;

    function void build_phase(uvm_phase phase);
       super.build_phase(phase);
       	`uvm_info("Phase", "build_phase", UVM_LOW)
       	drv = pcie_tl_rc_driver::type_id::create("drv",this);
   	cfg_sqr = pcie_tl_rc_config_sequencer::type_id::create("cfg_sqr",this);
   	//mem_sqr = pcie_tl_rc_mem_sequencer::type_id::create("mem_sqr",this);
   	tx_mon = pcie_tl_rc_tx_monitor::type_id::create("tx_mon", this);
   	v_seq = pcie_tl_rc_virtual_sequence::type_id::create("v_seq");
   //cov = pcie_tl_rc_coverage::type_id::create($sformatf("cov%d", ), this);

    endfunction

    function void connect_phase(uvm_phase phase);
       	`uvm_info("Phase", "Connect_phase", UVM_LOW)
       	drv.seq_item_port.connect(cfg_sqr.seq_item_export);
       	//drv.seq_item_port.connect(mem_sqr.seq_item_export);
   	//tx_mon.ap_port.connect(cov.analysis_export);
endfunction

endclass
