<?php

class page_user_withdrawalrequest extends Page {
	function init(){
		parent::init();

		$this->add('H3')->set('Send Withdrawal request to system');
		$form= $this->add('Form');
		$form->addField('number','funds_to_withdraw');
		$form->addSubmit('Request');

		if($form->isSubmitted()){
			$this->api->auth->model->reload();
			if(($form->get('funds_to_withdraw') % 500 ) != 0) 
				$form->displayError('funds_to_withdraw','You can request for funds only in multiple of 500');

			if($form->get('funds_to_withdraw') > $this->api->auth->model['fund_available'])
				$form->displayError('funds_to_withdraw','You do not have sufficient funds');

			$wr = $this->add('Model_WithdrawRequest');
			$wr['from_id']=$this->api->auth->model->id;
			$wr['fund']=$form->get('funds_to_withdraw');
			$wr->save();

			$current_user = $this->api->auth->model;
			$current_user['fund_available'] = $current_user['fund_available'] -$form->get('funds_to_withdraw');
			$current_user->save();

			$this->api->auth->model->reload();
			$form->js()->univ()->closeDialog()->execute();

		}

	}
}