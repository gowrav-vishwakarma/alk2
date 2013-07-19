<?php
class Model_Kit extends Model_Table {
	var $table= "kit_master";
	function init(){
		parent::init();

		$this->addField('name');
		$this->addField('joining_amount');
		$this->addField('pin_amount');
		$this->addField('is_active')->type('boolean')->defaultvalue(true);
		$this->addField('sponsor_percentage');

		$this->hasMany('Member','kit_id');

	}
}