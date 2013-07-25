<?php

class page_admin_dashboard extends page_admin {
	function init(){
		parent::init();

		if($_GET['forward_request']){
			$this->js()->univ()->frameURL('Request Forward To',$this->api->url('admin_fundforward',array('request_id'=>$_GET['forward_request'])))->execute();
		}

		$cols = $this->add('Columns');
		$left = $cols->addColumn(7);
		$right = $cols->addColumn(5);

		$left->add('H3')->set('Fund Submit Request');
		$right->add('H3')->set('Withdrawal Requests');

		$dene_wale = $left->add('Grid');
		$lene_wale = $right->add('Grid');

		$dene_wale->addClass('sendergrid');
		$dene_wale->js('reload_me')->reload();
		$lene_wale->addClass('receivergrid');
		$lene_wale->js('reload_me')->reload();

		$dene_wale_model = $this->add('Model_FundRequest');
		// Jo activated nahi hai 
		// Aur jinke fund ki saari request distribute nahi hui hai abhi tak 

		$dene_wala_member = $dene_wale_model->join('members','from_id');
		$dene_wala_member->addField('is_activated');
		$dene_wala_member->addField('kit_id');
		$dene_wala_member->addField('name');
		$dene_wala_member->addField('username');
		$kit = $dene_wala_member->join('kit_master','kit_id');
		$kit->addField('joining_amount');

		

		$dene_wale_model->addCondition('is_activated',0);
		$dene_wale_model->addCondition('to_distribute','>', 0 );

		$dene_wale->setModel($dene_wale_model,array('name',"username",'joined_on','activated_on','joining_amount','to_distribute','fund_to_distribute_more'));
		
		// LENE WALE KA MATTER -------------------
		$lene_wale_model = $this->add('Model_WithdrawRequest');
		// Jo 24 ghante pehle activate ho gaya hai
		// aur jisko joining_amount ka 50% ki request nahi aayi hai admin se distribute hoke to_id main.

		// NEW WAY ===> Jinki Withdrawl ki request lagi hui hai

		$member_joined = $lene_wale_model->join('members','from_id');
		$member_joined->addField('name');
		$member_joined->addField('username');
		$member_joined->addField('activated_on');

		$lene_wale_model->addCondition('remaining_fund','>',0);
		// $lene_wale_model->addCondition('activated_on','<=',date('Y-m-d H:i:s',strtotime("-1 day")));
		// $lene_wale_model->addCondition('activated_on','is',$this->api->db->dsql()->expr('not null'));
		// $lene_wale_model->sum('remaining_fund');
		$lene_wale_model->setOrder('approved_on_date');

		$lene_wale->setModel($lene_wale_model,array('id','name','username','remaining_fund',"type","on_date",'activated_on'));

		$dene_wale->addColumn('Button','forward_request');

	}
}