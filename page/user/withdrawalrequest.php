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

			if(!$this->api->auth->model['is_activated']){
				$form->displayError('funds_to_withdraw','You have not completed your commitement, You cannot withdraw fund');
			}

			if(($form->get('funds_to_withdraw') % 500 ) != 0) 
				$form->displayError('funds_to_withdraw','You can request for funds only in multiple of 500');

			if($form->get('funds_to_withdraw') > $this->api->auth->model['fund_available'])
				$form->displayError('funds_to_withdraw','You do not have sufficient funds');

			$days_wr=$this->add('Model_WithdrawRequest');
			$days_wr->addCondition('from_id',$this->api->auth->model->id);
			$days_wr->addCondition('on_date','>',date('Y-m-d'));
			$days_wr->addCondition('on_date','<',date('Y-m-d',strtotime("+1 day")));
			$days_wr->addCondition('type','Extra');

			$todays_withdraw = $days_wr->sum('fund')->getOne();

			if($todays_withdraw >= 20000) $form->displayError('funds_to_withdraw','You cannot withdraw more then 20,000 in a day');
			if($todays_withdraw == 0 AND $form->get('funds_to_withdraw')<1000) $form->displayError('funds_to_withdraw','You have to withdraw minimum 1000 Rs');


			$wr = $this->add('Model_WithdrawRequest');
			$wr['from_id']=$this->api->auth->model->id;
			$wr['fund']=$form->get('funds_to_withdraw');
			$wr->save();

			$this->api->auth->model->reload();
			$form->js(null,$this->js()->_selector('.wallet')->trigger('reload_me'))->univ()->closeDialog()->execute();

		}

	}
}