 typedef enum bit{
  agt0,
  agt1
}which_agent;

 //`define num_req no_req

class pcie_config extends uvm_object;
  //which test are we executing
  string testname;
  
  bit rc_err_eij_en;
  bit ep_err_eij_en;
  int unsigned rc_err_pkt_eij;
  int unsigned ep_err_pkt_eij;
  
  
  int unsigned rc_which_pkt_nums[];
  int unsigned ep_which_pkt_nums[];
  
  //no. of req for pkt generation
  int rc_no_req;
  int ep_no_req;
  
    rand int m_err_eij_q[$];
    rand int s_err_eij_q[$];
  
  //Here we need to check that m_total_err_pkt_eij == m_actual_err_pkt_eij && s_total_err_pkt_eij == s_actual_err_pkt_eij
  	int rc_actual_err_pkt_eij;
  	int ep_actual_err_pkt_eij;
  

  `uvm_object_utils(pcie_config)
  
  function new(string name=""); 
		super.new(name); 
    $display("------------------------------------------this is UVM_CONFIGURATION FILE------------------------------------------------");
    `uvm_info(get_type_name(),$sformatf("------------------------------test_name=%s--------------------------------",testname),UVM_NONE)
    
    
    $value$plusargs("rc_no_req=%0d",rc_no_req);
    $value$plusargs("ep_no_req=%0d",ep_no_req);
// `define num_req no_req

    // All arguments for injection of error
    $value$plusargs("testname=%s",testname);
    //$value$plusargs("agt_name=%s",agt_name);

    $value$plusargs("rc_err_eij_en=%d",rc_err_eij_en);
    $value$plusargs("ep_err_eij_en=%d",ep_err_eij_en);
    $value$plusargs("rc_err_pkt_eij=%d",rc_err_pkt_eij);
    $value$plusargs("ep_err_pkt_eij=%d",ep_err_pkt_eij);
    $value$plusargs("rc_which_pkt_nums=%d",rc_which_pkt_nums);
    $value$plusargs("ep_which_pkt_nums=%d",ep_which_pkt_nums);
          //s_which_pkt_num=new[m_total_err_pkt_eij];

   
    
   
   
	endfunction
  
  uvm_active_passive_enum active = UVM_ACTIVE;
  
   
  
  
endclass
