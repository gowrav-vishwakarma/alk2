<?php

class page_user_directsponsors extends page_user {
	function init(){
		parent::init();

		$m = $this->add('Model_Member');
		$m->addCondition('sponsor_id',$this->api->auth->model->id);

		$grid= $this->add('Grid');
		$grid->setModel($m, array('name','username','join_on','is_activated','status'));

	}
}