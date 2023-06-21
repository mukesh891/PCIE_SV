class pcie_tl_rc_driver extends uvm_driver#(pcie_tl_rc_config_seq_item_pkg); 
    `uvm_component_utils(pcie_tl_rc_driver)
    bit[127:0]  frame;

    function new(string name="",uvm_component parent=null);
       super.new(name,parent);
    endfunction

    virtual pcie_tl_rc_intf vif;

    function void build_phase(uvm_phase phase);
       super.build_phase(phase);
       `uvm_info("Phase","build_phase",UVM_LOW)
       if(!uvm_config_db#(virtual pcie_tl_rc_intf)::get(null,"*","PIF",vif))begin
          `uvm_fatal("NO_VIF",{"VIRTUAL INTF MUST BE SET FOR:",get_full_name(),"vif"});
	  //req = pcie_tl_rc_config_seq_item_pkg::type_id::create("req");
       end
    endfunction

    task run_phase(uvm_phase phase);
       forever begin
       @(posedge vif.clk);
          seq_item_port.get_next_item(req);
          drive_tx(req);
          req.print();
          seq_item_port.item_done();
       	end
    endtask
     
    task drive_tx(pcie_tl_rc_config_seq_item_pkg req);
       	
	`uvm_info("Run_phase","drive_tx",UVM_LOW)
	  frame <= {req.fmt
	  ,req.typ
	  ,req.reserve_bit1
	  ,req.tc
	  ,req.reserve_bit2
          ,req.attr1
          ,req.reserve_bit3
          ,req.th
          ,req.td
          ,req.ep
          ,req.attr0
          ,req.at
          ,req.length
          ,req.requester_id
          ,req.tag
          ,req.last_dw_be
          ,req.first_dw_be
          ,req.completer_id
          ,req.address
          ,req.reserve_bit4
          ,req.reserve_bit5
          ,req.ext_register_number
          ,req.register_number
          ,req.payload             };
	  $display("-------------len of frame is = %0d , frame = %0b, first 32 bits = %0b-------",$bits(frame),frame,frame[31:0]);
	  //vif.data = frame[31:0]; 

       	    endtask

    endclass

