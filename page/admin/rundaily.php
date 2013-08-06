<?php

class page_admin_rundaily extends page_admin {
	function init(){
		parent::init();

		$last_member = $this->add('Model_Member');
		$last_member->setOrder('last_daily_run_at','desc');
		$last_member->tryLoadAny();

		$this->add('H2')->set('Last Daily Run on ' . $last_member['last_daily_run_at']);

		$btn = $this->add('Button')->set('Run Daily Now');

		if($btn->isClicked("Sure ...")){
			for($i=1;$i<=7;$i++){
				$members = $this->add('Model_Member');
				$d1_wr = $members->leftJoin('withdrawl_request.from_id');
				$d1_wr->addField('approved_on_date');
				$kit = $members->leftJoin('kit_master','kit_id');
				$kit->addField('joining_amount');

				$members->addCondition('approved_on_date','is',$this->api->db->dsql()->expr('not null'));
				$members->addCondition('approved_on_date','<=',date('Y-m-d H:i:s',strtotime("-1 day")));
				$members->addCondition('day_'.$i.'_growth',0);

				foreach($members as $m){
					$members['day_'.$i.'_growth'] = $members['joining_amount'] * 20 / 100;
					$members['last_daily_run_at']=date('Y-m-d H:i:s');
					
					$members->saveAndUnload();
				}
			}
			$this->js()->univ()->successMessage("Daily Code Run")->execute();
		}

		

	}
}