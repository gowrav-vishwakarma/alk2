<?php

class page_user extends Page {
	public $menu;
	function init(){
		parent::init();

		$member = $this->add('Model_Member')->load($this->api->auth->model->id);
		$member_request = $this->add('Model_FundRequest')->addCondition('from_id',$member->id)->tryLoadAny()->debug();

		$pending_amount = $member_request['fund_requested'] - $member_request['fund_distributed'];
		if($pending_amount > 0 OR $member_request['status'] == 'Pending') 
			$msg= "Your activation is pending";
		else
			$msg= "You are Activated";

		$this->add('H2')->set('Welcome '. $this->api->auth->model['name'] . " (".$this->api->auth->model['username'].") " . " [Commitement fund: ".$member->ref('kit_id')->get('joining_amount')."]" )->sub($msg);

		$this->menu=$this->add('Menu');
		$menu = $this->menu;
		$menu->addMenuItem('user_dashboard','Dashboard');
		$menu->addMenuItem('user_newregistration','New Registration');
		// $menu->addMenuItem('user_leveldetails','Level Details');
		$menu->addMenuItem('user_withdrawalrequestlist','Withdrawal Requests');
		$menu->addMenuItem('user_myincome','My Income');
		$menu->addMenuItem('user_fundtransfer','Fund Transfer');
		$menu->addMenuItem('user_profile','Change Password');
		$menu->addMenuItem('user_directsponsors','Direct Sponsors');
		$menu->addMenuItem('user_leveldetails','Level Details');
		$menu->addMenuItem('logout','Logout');

		$v=$this->add('View_Wallet');

	}

	function render(){
		parent::render();
	}

}