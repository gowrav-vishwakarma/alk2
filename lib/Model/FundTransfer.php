<?php
class Model_FundTransfer extends Model_Table {
	var $table= "fund_transfer";
	function init(){
		parent::init();

		$this->hasOne('Member','from_id');
		$this->hasOne('Member','to_id');
		$this->addField('on_date')->type('date')->defaultValue(date('Y-m-d H:i:s'));
		$this->addField('fund');

	}
}