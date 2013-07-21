<?php
class Model_RequestDistribution extends Model_Table {
	var $table= "request_distribution";
	function init(){
		parent::init();

		$this->hasOne('FundRequest','fund_request_id');
		$this->hasOne('WithdrawRequest','withdrawl_request_id');
		$this->addField('status')->enum(array('Pending','Approved','Rejected','Approved By Admin','Rejected By Admin'))->defaultValue('Pending');
		$this->addField('on_date')->type('date')->defaultValue(date('Y-m-d'));
		$this->addField('fund');
		$this->add("filestore/Field_Image","image_id")->type('image');
	}

	function is_approved(){
		if($this['status'] == 'Approved' || $this['status'] == 'Approved By Admin') return true;

		return false;
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
			$FundRequest['status']= $status;
			$FundRequest['approved_rejected_date'] = date('Y-m-d H:i:s');
			$FundRequest->save();
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