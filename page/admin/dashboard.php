<?php

class page_admin_dashboard extends page_admin {
	function init(){
		parent::init();

		$cols = $this->add('Columns');
		$left = $cols->addColumn(8);
		$right = $cols->addColumn(4);

		$dene_wale = $left->add('Grid');
		$lene_wale = $right->add('Grid');

		$dene_wale_model = $this->add('Model_Member');
		// 
		$dene_wale_model->addExpression('distributed_fund')->set(function($m,$q){
			$req=$m->add('Model_FundRequest')->addCondition('from_id',$m->getField('id'));
			$dist = $req->join('request_distribution.fund_request_id');
			$dist->addField('fund');

			return $req->sum('fund');

		});

		$dene_wale_model->addExpression('joining_amount')->set(function($m,$q){
			return $m->refSQL('kit_id')->fieldQuery('joining_amount');
		});

		$dene_wale_model->addCondition('distributed_fund','<=' , $this->api->db->dsql()->expr('joining_amount') );

		$dene_wale->setModel($dene_wale_model,array('name','joined_on','activated_on','joining_amount','distributed_fund','fund_to_distribute_more'));
		
		// LENE WALE KA MATTER -------------------
		$lene_wale_model = $this->add('Model_Member');
		// Jo 24 ghante pehle activate ho gaya hai
		// aur jisko joining_amount ka 50% ki request nahi aayi hai admin se distribute hoke to_id main.

		$lene_wale->setModel($lene_wale_model);

	}
}