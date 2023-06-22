class pcie_tl_rc_cfg_driver extends uvm_driver#(pcie_tl_rc_config_seq_item_pkg); 
    `uvm_component_utils(pcie_tl_rc_cfg_driver)
    bit[127:0]  frame;

    function new(string name="",uvm_component parent=null);
       super.new(name,parent);
    endfunction

    virtual pcie_tl_rc_intf vif;

    function void build_phase(uvm_phase phase);
       super.build_phase(phase);
       `uvm_info("Phase","build_phase",UVM_LOW)
       //if(!uvm_config_db#(virtual pcie_tl_rc_intf)::get(null,"*","PIF",vif))begin
         // `uvm_fatal("NO_VIF",{"VIRTUAL INTF MUST BE SET FOR:",get_full_name(),"vif"});
         uvm_resource_db#(virtual pcie_tl_rc_intf)::read_by_type("PCIE",vif,this);
      `uvm_info(get_type_name(),"PCIE_master_driver",UVM_NONE);
	  //req = pcie_tl_rc_config_seq_item_pkg::type_id::create("req");
       //end
    endfunction

    task run_phase(uvm_phase phase);
       forever begin
          seq_item_port.get_next_item(req);
          drive_tx(req);
          req.print();
          seq_item_port.item_done();
       	end
    endtask
     
    task drive_tx(pcie_tl_rc_config_seq_item_pkg tx);
       @(posedge vif.clk);
       	
	`uvm_info("Run_phase","drive_tx",UVM_LOW)
	  frame <= {tx.fmt
	  ,tx.typ
	  ,tx.reserve_bit1
	  ,tx.tc
	  ,tx.reserve_bit2
          ,tx.attr1
          ,tx.reserve_bit3
          ,tx.th
          ,tx.td
          ,tx.ep
          ,tx.attr0
          ,tx.at
          ,tx.length
          ,tx.requester_id
          ,tx.tag
          ,tx.last_dw_be
          ,tx.first_dw_be
          ,tx.completer_id
          ,tx.address
          ,tx.reserve_bit4
          ,tx.reserve_bit5
          ,tx.ext_register_number
          ,tx.register_number
          ,tx.payload             };
	  $display("-------------len of frame is = %0d , frame = %0b, first 32 bits = %0b-------",$bits(frame),frame,frame[31:0]);
	  //vif.data = frame[31:0]; 

       	    endtask

    endclass


