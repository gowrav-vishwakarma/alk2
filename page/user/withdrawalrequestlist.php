<?php

class page_user_withdrawalrequestlist extends page_user {
	function page_index(){
		// parent::init();

		$this->add('H3')->set('Your Withdraw Requests');

		// $crud = $this->add('CRUD',array('allow_add'=>false,'allow_del'=>false,'allow_edit'=>false));
		$grid = $this->add('Grid');
		$grid->setModel($this->api->auth->model->ref('WithdrawRequest'));

		$grid->addColumn('Expander','details');
	}
}