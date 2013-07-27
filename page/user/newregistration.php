<?php
class page_user_newregistration extends page_user {
	function init(){
		parent::init();

		$cols = $this->add('Columns');
		$left = $cols->addColumn(7);

		$form=$left->add('Form');
		if($_GET['success']){
			$form->add('View_Info')->set('Member Added Successfully');
		}

		$form->add('View_Error')->setHTML('<b>NOTE: Kindly Fill all Fields as they are not editable after joining</b>');

		$form->setModel('Model_Member',array('kit_id','name','username','password',"mobile_number",'email',"city","state",'bank_name','IFSC','account_number','bank_branch'));
		$form->addField('line','sponsor');
		$form->addField('password','re_password');
		
		$form->add('Order')->move('sponsor','before','name')->move('re_password','after','password')->now();

		$form->addSubmit('Register');


		if($form->isSubmitted()){

			$this->api->auth->model->reload();

			// if(!$this->api->auth->model['is_activated']){
			// 	$form->displayError('name','You have not completed your commitment, You cannot use your fund');
			// }

			if($form->get('password') != $form->get('re_password'))
				$form->displayError('re_password','Password must match');

			//check user name length

			// if(strlen($form->get('username'))>6) $form->displayError('username','Username can nott be greater then 6 character');

			//check sposor 
			$sponsor=$this->add('Model_Member');
			$sponsor->addCondition('username',$form->get('sponsor'));
			$sponsor->tryLoadAny();

			if(!$sponsor->loaded()) $form->displayError('sponsor','This is not a valid sponsor, Try Another');


			// CHECK username
			$existing= $this->add('Model_Member');
			$existing->addCondition('username',$form->get('username'));
			$existing->tryLoadAny();

			if($existing->loaded()) $form->displayError("username",'This username already exists, try different one');

			//check fund available
			if($form->model->ref('kit_id')->get('pin_amount') > $this->api->auth->model->get('fund_available'))
				$form->displayError('kit_id', 'You do not have sufficeint funds');

			//put sponsor id in form model
			$form->model->set('sponsor_id',$sponsor->id);
			$form->update();

			//update wallet
			$this->add('MyHelper')->updateWallet();

			$form->js(null,$form->js()->_selector('.wallet')->trigger('reload_me'))->reload(array('success'=>1))->execute();

		}
	}
}