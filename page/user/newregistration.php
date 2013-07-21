<?php
class page_user_newregistration extends page_user {
	function init(){
		parent::init();

		$form=$this->add('Form');
		if($_GET['success']){
			$form->add('View_Info')->set('Member Added Successfully');
		}
		$form->setModel('Model_Member',array('kit_id','name','username','password','bank_name','IFSC','account_number'));
		$form->addField('line','sponsor');
		$form->add('Order')->move('sponsor','before','name')->now();
		$form->addSubmit('Register');


		if($form->isSubmitted()){

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

			$form->js()->reload(array('success'=>1))->execute();

		}
	}
}