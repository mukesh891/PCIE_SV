class pcie_tl_rc_mem_seq_item_pkg extends pcie_tl_rc_seq_item_pkg; 

    //`uvm_object_utils_begin(pcie_tl_rc_tx)
    //`uvm_object_utils_end()

   // Properties
   //logic [2:0] fmt;
   //logic [4:0] typ;
   //logic reserve_bit1;
   //logic [2:0] tc;
   //logic reserve_bit2;
   //logic  attr1;
   //logic reserve_bit3;
   //logic th;
   //logic [2:0] td;
   //logic [1:0] ep;
   //logic [1:0] attr0;
   //logic [1:0] at;
   //logic [9:0] length;
   //logic [15:0] requester_id;
   //logic [7:0] tag;
   //logic [3:0] last_dw_be;
   //logic [3:0] first_dw_be;
      
   //logic [15:0] completer_id;
   ////logic reserve_bit4;
      
   //logic[29:0] address;
   //logic[3:0] reserve_bit4;
   //logic[1:0] reserve_bit5;
      
   //logic [3:0] ext_register_number;
   //logic [5:0] register_number;
   //logic [31:0] payload;
   rand logic[1:0] reserve_r;
   
   // Constructor
   function new(string name = "");
      super.new(name);
   endfunction
   
   // UVM Object Macros
   `uvm_object_utils_begin(pcie_tl_rc_mem_seq_item_pkg)
   
   // Declare Fields
   `uvm_field_int(fmt, UVM_ALL_ON)
   `uvm_field_int(requester_id, UVM_ALL_ON)
   `uvm_field_int(typ, UVM_ALL_ON)
   `uvm_field_int(first_dw_be, UVM_ALL_ON)
   `uvm_field_int(ep, UVM_ALL_ON)
   `uvm_field_int(td, UVM_ALL_ON)
   `uvm_field_int(tc, UVM_ALL_ON)
   `uvm_field_int(attr0, UVM_ALL_ON)
   `uvm_field_int(attr1, UVM_ALL_ON)
   `uvm_field_int(at, UVM_ALL_ON)
   `uvm_field_int(length, UVM_ALL_ON)
   `uvm_field_int(tag, UVM_ALL_ON)
   `uvm_field_int(last_dw_be, UVM_ALL_ON)
   `uvm_field_int(address, UVM_ALL_ON)
   `uvm_field_int(payload, UVM_ALL_ON)
   `uvm_field_int(reserve_bit1, UVM_ALL_ON)
   `uvm_field_int(reserve_bit2, UVM_ALL_ON)
   `uvm_field_int(reserve_bit3, UVM_ALL_ON)
   `uvm_field_int(reserve_r, UVM_ALL_ON)
   `uvm_field_int(th, UVM_ALL_ON)
   `uvm_object_utils_end
endclass
