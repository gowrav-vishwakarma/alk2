<?php

class page_admin extends Page {
	function init(){
		parent::init();

		if($this->api->auth->model->id !=1) $this->api->redirect('index');

		$menu=$this->add('Menu');
		$menu->addMenuItem('admin_dashboard','Dashboard');
		$menu->addMenuItem('admin_membermanage','Members');
		$menu->addMenuItem('admin_withdrawdetails','Withdraw Details');
		$menu->addMenuItem('admin_rundaily','Run Daily');

	}

	function defaultTemplate(){
		return array('page/admin'); 
	}
}