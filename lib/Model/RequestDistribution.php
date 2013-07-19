<?php
class Model_RequestDistribution extends Model_Table {
	var $table= "request_distribution";
	function init(){
		parent::init();

		$this->hasOne('FundRequest','fund_request_id');
		$this->hasOne('Member','to_id');
		$this->addField('status')->enum(array('Pending','Approved','Rejected','Approved By Admin','Rejected By Admin'));
		$this->addField('on_date')->type('date')->defaultValue(date('Y-m-d'));
		$this->addField('fund');
	}

	function approve($status='Approved'){
		// Mark this request distribution approved
		$this['status']=$status;
		$this->save();

		// If all distributions from this's fund_request_id are approved or approved by admin 
			// requester mark active and distribute amount of level in above.

		$FundRequest=$this->add('Model_FundRequest');
		$FundRequest->load($this['fund_request_id']);

		if($FundRequest['fund_requested'] == $FundRequest['approved_fund']){
			$FundRequest->ref('from_id')->approve();
		}

	}

	function reject(){

	}

	function adminApprove(){
		$this->approve('Approved By Admin');
	}

	function adminReject(){

	}

}