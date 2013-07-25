<?php
class Model_Member extends Model_Table {
	var $table= "members";
	function init(){
		parent::init();


		$this->hasOne('Member','sponsor_id');
		$this->hasOne('Kit','kit_id')->caption('Commitement Amount');
		$this->addField('name');
		$this->addField('username');
		$this->addField('password')->type('password');
		$this->addField('mobile_number');
		$this->addField('email');
		$this->addField('city');
		$this->addField('state');
		$this->addField('bank_name');
		$this->addField('IFSC');
		$this->addField('account_number');
		$this->addField('bank_branch');
		$this->addField('fund_available');
		$this->addField('is_activated')->type('boolean')->defaultValue(false);
		$this->addField('join_on')->type('date')->defaultValue(date('Y-m-d H:i:s'));
		$this->addField('activated_on')->type('date');
		$this->addField('is_eligible_for_growth')->type('boolean')->defaultValue(false);
		$this->addField('status')->enum(array('Joined','Approved'))->defaultValue('Joined');;
		$this->addField('day_1_growth')->defaultValue(0);
		$this->addField('day_2_growth')->defaultValue(0);
		$this->addField('day_3_growth')->defaultValue(0);
		$this->addField('day_4_growth')->defaultValue(0);
		$this->addField('day_5_growth')->defaultValue(0);
		$this->addField('day_6_growth')->defaultValue(0);
		$this->addField('day_7_growth')->defaultValue(0);
		$this->addField('level_1_fund')->defaultValue(0);
		$this->addField('level_2_fund')->defaultValue(0);
		$this->addField('level_3_fund')->defaultValue(0);
		$this->addField('level_4_fund')->defaultValue(0);
		$this->addField('level_5_fund')->defaultValue(0);
		$this->addField('level_6_fund')->defaultValue(0);
		$this->addField('level_7_fund')->defaultValue(0);
		$this->addField('level_8_fund')->defaultValue(0);
		$this->addField('level_9_fund')->defaultValue(0);
		$this->addField('level_10_fund')->defaultValue(0);
		$this->addField('path');
		$this->addField('last_daily_run_at')->defaultValue(null);

		$this->hasMany('Member','sponsor_id');
		$this->hasMany('FundTransfer','from_id',null,'FundTransferFrom');
		$this->hasMany('FundTransfer','to_id',null,'FundTransferTo');
		$this->hasMany('WithdrawRequest','from_id');
		
		$this->hasMany('FundRequest','from_id'); // Dene wale
		// $this->hasMany('RequestDistribution','to_id'); //Lene Wale


		$this->addHook('beforeModify',$this);
		$this->addHook('beforeInsert',$this);
		$this->addHook('afterInsert',$this);

	}


	function beforeModify(){
		$check_username = $this->add('Model_Member');
		$check_username->addCondition('username',$this['username']);
		$check_username->addCondition('id','<>',$this->id);
		$check_username->tryLoadAny();

		if($check_username->loaded()) throw $this->exception("Username already exists");

	}

	function beforeInsert(){
		// GET NEW PATH FROM SPONSOR IF NEEDED.. CURRENTLY LEAVING

		$existing= $this->add('Model_Member');
		$existing->addCondition('username',$this['username']);
		$existing->tryLoadAny();

		if($existing->loaded()) 
			throw $this->exception('This username already exists, try different one')
					->addMoreInfo('username',$this['username']);

	}

	function afterInsert($obj,$new_id){
		$current_user = $this->add('Model_Member')->load($this->api->auth->model->id);
		$current_user['fund_available'] = $current_user['fund_available'] - $this->ref('kit_id')->get('pin_amount');
		$current_user->save();
		$this->sendRemaining75PercentRequests($new_id);
	}

	function sendRemaining75PercentRequests($new_id){
		$fund = $this->ref('kit_id')->get('joining_amount') - $this->ref('kit_id')->get('pin_amount');
		$this->add('Model_FundRequest')->generateNewRequest($new_id,$fund);
	}

	function transferFund($to,$fund){
		$this['fund_available'] = $this['fund_available'] - $fund;
		$this->save();

		$to=$this->add('Model_Member')->load($to);
		$to['fund_available'] = $to['fund_available'] + $fund;
		$to->save();

		$request_obj=$this->add('Model_FundTransfer');
		$request_obj['from_id'] =$this->id;
		$request_obj['to_id'] =$to->id;
		$request_obj['fund'] = $fund;
		$request_obj->save();

	}

	function approve(){
		$this['status'] = 'Approved';
		$this['is_activated'] = true;
		$this['activated_on'] = date('Y-m-d H:i:s');
		$this['fund_available'] = $this['fund_available'] + (($this->ref('kit_id')->get('joining_amount')) / 2);
		$this->save();

		$wr = $this->add('Model_WithdrawRequest');
		$wr['from_id']=$this->id;
		$wr['fund']=(($this->ref('kit_id')->get('joining_amount')) / 2);
		$wr['type'] = 'Joining';
		$wr->save();
		
		$this->distributeLevelAmountAbove();
	}

	function distributeLevelAmountAbove(){
		$member= $this->add('Model_Member')->load($this->id);
		$joining_amount= $member->ref('kit_id')->get('joining_amount');

		$per_array=array(0,0,8,7,6,5,4,3,2,1,5);
		for($i=1;$i<=10; $i++){
			if($i==1){
				$per = $member->ref('kit_id')->get('sponsor_percentage');
			}else{
				$per = $per_array[$i];
			}
			
			if(!$member['sponsor_id']) break;

			$fund_to_add = $joining_amount * $per / 100.00;

			$sponsor = $member->ref('sponsor_id');
			$sponsor['level_'.$i.'_fund'] = $sponsor['level_'.$i.'_fund'] + $fund_to_add;
			$sponsor['fund_available'] = $sponsor['fund_available'] + $fund_to_add;
			$sponsor->save();

			$member = $sponsor;

		}


	}



}