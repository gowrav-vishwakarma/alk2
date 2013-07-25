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

		$this->addHook('afterInsert',$this);

	}

	function afterInsert(){
		$req=$this->ref('fund_request_id');
		$req['fund_distributed'] = $req['fund_distributed'] + $this['fund'];
		$req->save();

		$wr = $this->ref('withdrawl_request_id');
		$wr['alloted_fund'] = $wr['alloted_fund'] + $this['fund'];
		$wr->save();
		
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

		$wr = $this->add('Model_WithdrawRequest');
		$wr->load($this['withdrawl_request_id']);

		$wr_dist = $wr->ref('RequestDistribution')->addCondition('status','not like','Approv%');
		$wr_dist->tryLoadAny();

		if(!$wr_dist->loaded()){
			$wr['status']='Approved';
			$wr['approved_on_date'] = date('Y-m-d H:i:s');
			$wr->save();
		}


	}

	function reject($status='Rejected'){
		$this['status']=$status;
		$this->save();
	}

	function adminApprove(){
		$this->approve('Approved By Admin');
	}

	function adminReject(){
		$this->reject('Rejected By Admin');
	}

}