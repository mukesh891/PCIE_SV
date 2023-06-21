class pcie_tl_rc_seq_item_pkg extends uvm_sequence_item; 

    //`uvm_object_utils_end()

   // Properties
   rand logic [2:0] fmt;
   rand logic [4:0] typ;
   rand logic reserve_bit1;
   rand logic [2:0] tc;
   rand logic reserve_bit2;
   rand logic  attr1;
   rand logic reserve_bit3;
   rand logic th;
   rand logic [2:0] td;
   rand logic [1:0] ep;
   rand logic [1:0] attr0;
   rand logic [1:0] at;
   rand logic [9:0] length;
   rand logic [15:0] requester_id;
   rand logic [7:0] tag;
   rand logic [3:0] last_dw_be;
   rand logic [3:0] first_dw_be;
         
   rand logic [15:0] completer_id;
   //rand logic reserve_bit4;
         
   rand logic[29:0] address;
   logic[3:0] reserve_bit4 = 0;
   logic[1:0] reserve_bit5 = 0;
         
   rand logic [3:0] ext_register_number;
   rand logic [5:0] register_number;
   rand logic [31:0] payload;            
   
   // Constructor
   function new(string name = "");
      super.new(name);
   endfunction
   
   
   // Declare Fields
    `uvm_object_utils_begin(pcie_tl_rc_seq_item_pkg)
   `uvm_field_int(fmt, UVM_ALL_ON)
   `uvm_field_int(requester_id, UVM_ALL_ON)
   `uvm_field_int(completer_id, UVM_ALL_ON)
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
   `uvm_field_int(payload, UVM_ALL_ON)
   `uvm_field_int(reserve_bit1, UVM_ALL_ON)
   `uvm_field_int(reserve_bit2, UVM_ALL_ON)
   `uvm_field_int(reserve_bit3, UVM_ALL_ON)
   `uvm_field_int(reserve_bit4, UVM_ALL_ON)
   `uvm_field_int(reserve_bit5, UVM_ALL_ON)
   `uvm_field_int(th, UVM_ALL_ON)
   `uvm_field_int(ext_register_number, UVM_ALL_ON)
   `uvm_field_int(register_number, UVM_ALL_ON)
    `uvm_object_utils_end
endclass
