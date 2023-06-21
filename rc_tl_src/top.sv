// Code your testbench here
// or browse Examples
`timescale 1ns/1ps


`include "uvm_pkg.sv"

import uvm_pkg::*;

`include "uvm_macros.svh"
`include "pcie_config.sv"

`include "pcie_tl_rc_interface.sv"
`include "pcie_tl_rc_seq_item_pkg.sv"
`include "pcie_tl_rc_config_seq_item_pkg.sv"
`include "pcie_tl_rc_mem_seq_item_pkg.sv"
`include "pcie_tl_rc_tx_monitor.sv"
//`include "pcie_tl_rc_rx_monitor.sv"

//`include "drv_callback.sv"
//`include "eth_drv_cb.sv"
`include "pcie_tl_rc_driver.sv"

//`include "pcie_tl_rc_sequencer.sv"
`include "pcie_tl_rc_config_sequencer.sv"
`include "pcie_tl_rc_mem_sequencer.sv"
`include "pcie_tl_rc_virtual_sequencer.sv"
`include "pcie_tl_rc_config_seq.sv"
`include "pcie_tl_rc_mem_seq.sv"

`include "pcie_tl_rc_virtual_sequence.sv"

`include "pcie_tl_rc_agent.sv"
`include "pcie_tl_rc_env.sv"
`include "pcie_tl_rc_test.sv"
module top;
  bit clk,rst;
  //instantiate interface
  pcie_tl_rc_intf pif(clk,rst);
  initial begin
    //uvm_resource_db#(virtual eth_if)::set("ETH","VIF",pif,null);
    uvm_config_db#(virtual pcie_tl_rc_intf)::set(null,"*","PIF",pif);
  end
  
  initial begin
  	//clk gen
    clk=0;
    forever #5 clk=~clk;
  end  
  initial begin
  	//rst gen
    rst=1;
    #10 rst=0;
    

  end 
  initial begin
    #20;
    $display("TIME SCALE %t",$time);
  end
  
  initial begin
  	//run_test call
    //run_test("eth_10_tx_test");
    run_test("pcie_tl_rc_test");
  end  
  
  initial begin
  	#2000;
    $finish;
    
  end
  initial begin
    $dumpfile("test.vcd");
    $dumpvars();
  end
endmodule

