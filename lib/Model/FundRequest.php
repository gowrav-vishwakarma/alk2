<?php
class Model_FundRequest extends Model_Table {
	var $table= "fund_requests";
	function init(){
		parent::init();

		$this->hasOne('Member','from_id');
		$this->addField('on_date')->type('date')->defaultValue(date('Y-m-d H:i:s'));
		$this->addField('fund_requested');
		$this->addField('status')->enum(array('Pending','Distributed','Finalized'))->defaultValue('Pending');
		$this->addField('approved_rejected_date')->type('date');
		$this->hasMany('RequestDistribution','fund_request_id');

		$this->addExpression('distributed_fund')->set(function ($m,$q){
			return $m->refSQL('RequestDistribution')->sum('fund');
		});

		$this->addExpression('approved_fund')->set(function ($m,$q){
			return $q->dsql()->table('request_distribution')->field('sum(fund)')->where(array(array('status','Approved'),array('status','Approved By Admin')))->where('fund_request_id',$m->getField('id'));
		});

		// $this->debug();

	}

	function generateNewRequest($from, $fund){
		$this['from_id'] = $from;
		$this['fund_requested'] = $fund;
		$this->save();
	}

}