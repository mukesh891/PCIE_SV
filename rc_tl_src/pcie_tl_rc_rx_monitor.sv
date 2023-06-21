class pcie_tl_rc_rx_monitor extends uvm_monitor;

    `uvm_component_utils(pcie_tl_rc_rx_monitor)

    function new(string name="",uvm_component parent=null);
       super.new(name,parent);
    endfunction

    //uvm_analysis_port#(pcie_tl_rc_config_seq_pkg) cfg_ap_port;
    //uvm_analysis_port#(pcie_tl_rc_mem_seq_pkg) mem_ap_port;
    virtual pcie_tl_rc_intf vif;
    pcie_tl_rc_config_seq_item_pkg cfg_tx;
    pcie_tl_rc_mem_seq_item_pkg mem_tx;

    function void build_phase(uvm_phase phase);
       super.build_phase(phase);
       `uvm_info("Phase","build_phase",UVM_LOW)
       uvm_config_db#(virtual pcie_tl_rc_intf)::get(this,"","PIF",vif);
    //   ap_port=new("ap_port",this);
    endfunction

    task run_phase(uvm_phase phase);
       forever begin
	  wait(vif.rst==0);
	  @(posedge clk);
          `uvm_info("Run_phase","Monitor",UVM_LOW)
    //     cfg_tx=pcie_tl_rc_config_seq_pkg::type_id::create("cfg_tx");
    //     mem_tx=pcie_tl_rc_mem_seq_pkg::type_id::create("mem_tx");
    //     cfg_ap_port.write(cfg_tx);
    //     mem_ap_port.write(mem_tx);
       end
    endtask

    endclass
