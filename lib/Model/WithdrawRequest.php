<?php
class Model_WithdrawRequest extends Model_Table {
	var $table= "withdrawl_request";
	function init(){
		parent::init();


		$this->hasOne('Member','from_id');
		$this->addField('on_date')->type('date')->defaultValue(date('Y-m-d H:i:s'));
		$this->addField('fund');
		$this->addField('alloted_fund')->defaultValue(0);
		$this->addField('status')->enum(array('Pending','Completed'))->defaultValue('Pending');
		$this->addField('type')->enum(array('Joining','Extra'))->defaultValue('Extra');

		$this->addExpression('remaining_fund')->set('fund - alloted_fund');
	}
}