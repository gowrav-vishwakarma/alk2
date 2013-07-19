<?php
class Model_WithdrawalRequest extends Model_Table {
	var $table= "withdrawal_request";
	function init(){
		parent::init();


		$this->hasOne('Member','from_id');
		$this->addField('on_date')->type('date');
		$this->addField('amount');
		$this->addField('status');

	}
}