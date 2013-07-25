<?php
class Model_WithdrawRequest extends Model_Table {
	var $table= "withdrawl_request";
	function init(){
		parent::init();


		$this->hasOne('Member','from_id');
		$this->addField('on_date')->type('date')->defaultValue(date('Y-m-d H:i:s'));
		$this->addField('fund');
		$this->addField('alloted_fund')->defaultValue(0);
		$this->addField('status')->enum(array('Pending','Approved'))->defaultValue('Pending');
		$this->addField('type')->enum(array('Joining','Extra'))->defaultValue('Extra');
		$this->addField('approved_on_date')->type('date')->defaultValue(null);

		$this->hasMany('RequestDistribution','withdrawl_request_id');

		$this->addExpression('remaining_fund')->set('fund - alloted_fund');

		$this->addHook('afterInsert',$this);
	}

	function afterInsert(){

		$user = $this->add('Model_Member')->load($this['from_id']);
		$user['fund_available'] = $user['fund_available'] -$this['fund'];
		$user->save();
		$this->api->auth->model->reload();
		
	}
}