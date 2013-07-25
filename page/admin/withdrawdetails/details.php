<?php

class page_admin_withdrawdetails_details extends Page {
	function init(){
		parent::init();

		$this->api->stickyGET('withdrawl_request_id');
		
		$wr = $this->add('Model_WithdrawRequest');
		$wr->load($_GET['withdrawl_request_id']);

		$req_dist = $wr->ref('RequestDistribution');
		$sender_member = $req_dist->join('fund_requests','fund_request_id')->join('members','from_id');
		$sender_member->addField('name')->caption('Request From');

		$grid= $this->add('Grid');
		$grid->setModel($req_dist,array('name','fund','on_date','status'));

	}
}