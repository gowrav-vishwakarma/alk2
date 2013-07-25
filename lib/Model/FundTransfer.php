<?php
class Model_FundTransfer extends Model_Table {
	var $table= "fund_transfer";
	function init(){
		parent::init();

		$this->hasOne('Member','from_id');
		$this->hasOne('Member','to_id');
		$this->addField('on_date')->type('date')->defaultValue(date('Y-m-d H:i:s'));
		$this->addField('fund');

		$this->addHook('afterInsert',$this);
	}

	function afterInsert(){
		$from_member = $this->add('Model_Member')->load($this['from_id']);
		$to_member = $this->add('Model_Member')->load($this['to_id']);

		$from_member['fund_available'] = $from_member['fund_available'] - $this['fund'];
		$to_member['fund_available'] = $to_member['fund_available'] + $this['fund'];

		$from_member->save();
		$to_member->save(); 

	}

}