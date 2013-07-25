<?php

class page_user_manageslip_bysender extends Page {
	function init(){
		parent::init();
		$this->api->stickyGET('request_distribution_id');
		$this->api->stickyGET('view_id');
		
		$request_distribution = $this->add('Model_RequestDistribution');
		$request_distribution->addCondition('id',$_GET['request_distribution_id'])->load($_GET['request_distribution_id']);

		$to_member = $request_distribution->join('withdrawl_request','withdrawl_request_id')->join('members','from_id');
		$to_member->addField('name');
		$to_member->addField('bank_name');
		$to_member->addField('IFSC');
		$to_member->addField('account_number');
		$to_member->addField('mobile_number');

		$to_grid = $this->add('Grid');
		$to_grid->setModel($request_distribution,array('name','fund','on_date','status','bank_name','IFSC','account_number','mobile_number'));

		$cols=$this->add('Columns');
		$left=$cols->addColumn(6);
		$right=$cols->addColumn(6);

		if(!$request_distribution->is_approved()){
			$left->add('H3')->set('Upload bank Slip');
			$slip_form = $left->add('Form');
			$slip_form->setModel($request_distribution,array('image_id'));
			$slip_form->addSubmit('Submit Uploaded Image');
			if($slip_form->isSubmitted()){
				$slip_form->update();
				$slip_form->js(null,$slip_form->js()->_selector("#".$_GET['view_id'])->trigger('reload_me'))->univ()->closeDialog()->execute();
			}
		}

		$right->add('H3')->set('Your Bank Slip');
		$right->add('HtmlElement')->setElement('img')->setAttr('src',$request_distribution['image']);

	}
}