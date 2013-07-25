<?php

class page_admin_membermanage extends page_admin {
	function init(){
		parent::init();

		$crud= $this->add('CRUD',array('allow_add'=>false,'allow_del'=>false));
		$model=$this->add('Model_Member');
		$model->getElement('password')->type('text');

		$crud->setModel($model,array('name','username','password','mobile_number','bank_name','IFSC',"bank_branch",'account_number','fund_available'),array('name','username','password','mobile_number','bank_name','IFSC',"bank_branch",'account_number','fund_available','is_activated','joined_on','status'));	

	}
}