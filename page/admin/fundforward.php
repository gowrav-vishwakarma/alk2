<?php

class page_admin_fundforward extends Page {
	function init(){
		parent::init();

		$this->api->stickyGET('member_id');
		$member = $this->add('Model_Member')->load($_GET['member_id']);

		$joining_amount = $member->ref('kit_id')->get('joining_amount');
		$pin_amount = $member->ref('kit_id')->get('pin_amount');
		$fund_to_send = $joining_amount - $pin_amount;
		$sent_fund_requests = $member->ref('FundRequest')->tryLoadAny()->ref('RequestDistribution')->sum('fund')->getOne();

		
		$this->add('View')->setHTML('<b>Joining Amount :: </b>'. $joining_amount);
		$this->add('View')->setHTML('<b>Fund to send :: </b>'. $fund_to_send);
		$this->add('View')->setHTML('<b>Already Sent Fund Request :: </b>'. $sent_fund_requests);
		$this->add('View')->setHTML('<b>Fund Remaining to send :: </b>'. ($fund_to_send - $sent_fund_requests));

		$this->add('H3')->set('Send Request To:');

		$form= $this->add('Form');
		$form->addField('line','username')->validateNotNull();
		$form->addField('number','for_fund')->validateNotNull();
		$form->addSubmit('Send Request');

		if($form->isSubmitted()){
			$receiver = $this->add('Model_Member');
			$receiver->addCondition('username',$form->get('username'));
			$receiver->tryLoadAny();

			if(!$receiver->loaded()) $form->displayError('username','No user Found with this user name');

			if(($form->get('for_fund') % 500) != 0) $form->displayError('for_fund','Must be in multiple of 500');

			
			$form->js(null,array(
							$form->js()->_selector('.sendergrid')->trigger('reload'),
							$form->js()->_selector('.receivergrid')->trigger('reload'),
							)
					)->univ()->closeDialog()->execute();

		}


	}
}