<?php

class page_user_manageslip_byreceiver extends Page {
	function init(){
		parent::init();
		$this->api->stickyGET('request_distribution_id');
		
		$request_distribution = $this->add('Model_RequestDistribution');
		$request_distribution->addCondition('id',$_GET['request_distribution_id'])->load($_GET['request_distribution_id']);

		$from_member = $request_distribution->join('fund_requests','fund_request_id')->join('members','from_id');
		$from_member->addField('name');
		$from_member->addField('mobile_number');

		$this->add('H4')->set('Receive Fund From');
		$to_grid = $this->add('Grid');
		$to_grid->setModel($request_distribution,array('name','fund','on_date','status','mobile_number'));

		$cols=$this->add('Columns');
		$left=$cols->addColumn(6);
		$right=$cols->addColumn(6);

		if($request_distribution['status'] == 'Pending'){
			$approve_form = $left->add('Form');
			$approve_form->addSubmit('Approve');

			$reject_form = $right->add('Form');
			$reject_form->addSubmit('Reject');

			if($approve_form->isSubmitted()){
				$request_distribution->approve();
				$approve_form->js()->univ()->closeDialog()->execute();
			}

			if($reject_form->isSubmitted()){

			}

		}

		$this->add('H3')->set('Bank Slip by Sender');
		$this->add('HtmlElement')->setElement('img')->setAttr('src',$request_distribution['image']);

	}
}