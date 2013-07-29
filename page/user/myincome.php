<?php

class page_user_myincome extends page_user {
	function init(){
		parent::init();

		$current_user = $this->add('Model_Member')->load($this->api->auth->model->id);

		$this->add('H3')->set('My Details');
		$this->add('Grid')->setModel($current_user->addCondition('id',$this->api->auth->model->id),array('name','username','mobile_number','bank_name','account_number','IFSC','bank_branch'));


		$this->add('H3')->set('My Income');
		$tabs = $this->add('Tabs');
		
		$withdraw_tab = $tabs->addTab("WithDraw Request");
		$direct_tab = $tabs->addTab("Direct Sponsored Amount");
		$level_tab = $tabs->addTab("Level Income");
		$daily_tab = $tabs->addTab("Daily Growth");

		// ========= WITHDRAW TAB 
		$fund_distribution = $this->add('Model_RequestDistribution');
		$wr_requester = $fund_distribution->join('withdrawl_request','withdrawl_request_id')->join('members','from_id');
		$wr_requester->addField('member_id','id');

		$wr_sender = $fund_distribution->join('fund_requests','fund_request_id')->join('members','from_id');
		$wr_sender->addField('name')->caption('Sender');

		$fund_distribution->addCondition('status','like','Approv%');
		$fund_distribution->addCondition('member_id',$this->api->auth->model->id);

		$withdraw_grid = $withdraw_tab->add('Grid');
		$withdraw_grid->setModel($fund_distribution,array('name','fund','on_date'));	


		// ========== DIRECT SPONSORED AMOUNT

		$direct_grid = $direct_tab->add('Grid');
		$direct_member = $this->add('Model_Member');
		$direct_kit = $direct_member->join('kit_master','kit_id');
		$direct_kit->addField('joining_amount')->caption('Commitement Amount');
		$direct_kit->addField('sponsor_percentage')->caption('Percentage');

		$direct_member->addExpression('amount')->set('ROUND(joining_amount * sponsor_percentage / 100)');

		$direct_member->addCondition('sponsor_id',$this->api->auth->model->id);
		$direct_member->addCondition('is_activated',true);

		$direct_grid->setModel($direct_member,array('name','username','joining_amount','sponsor_percentage','amount', 'join_on','activated_on'));


		// ========== LEVEL INCOME
		$level_grid = $level_tab->add('Grid');
		$current_member = $this->add('Model_Member')
							->addCondition("id",$this->api->auth->model->id)
							->load($this->api->auth->model->id);

		$level_grid->setModel($current_member,array('level_2_fund','level_3_fund','level_4_fund','level_5_fund','level_6_fund','level_7_fund','level_8_fund','level_9_fund','level_10_fund'));
		

		// =========== Daily Growth Income
		$daily_grid = $daily_tab->add('Grid');
		$daily_grid->setModel($current_member,array('day_1_growth','day_2_growth','day_3_growth','day_4_growth','day_5_growth','day_6_growth','day_7_growth'));

		// $grid = $this->add('Grid');
		// $grid->setModel($current_user);

	}
}