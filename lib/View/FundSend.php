<?php

class View_FundSend extends View{
	
	function init(){
		parent::init();
		$this->js('reload_me')->reload();
	}
	

	function setModel($model){

		// $fund_request = $model->join('fund_requests','fund_request_id');
		// $fund_request->addField('from_id');
		// $fund_request->hasOne('Member','from_id');

		$this->template->trySet('to',$model->ref('withdrawl_request_id')->ref('from_id')->get('username'));
		$this->template->trySet('on_date',$model['on_date']);
		$this->template->trySet('status',$model['status']);
		$this->template->trySet('fund',$model['fund']);

		// $link = $this->add('HtmlElement',null,'manage_slip')->setElement('a')->setAttr('href','#')->set('Manage Slip');
		$link = $this->add('Button',null,'manage_slip')->set('Manage Slip');
		$link->js('click',$this->js()->univ()->frameURL("Manage Slip",$this->api->url("user/manageslip/bysender",array('request_distribution_id'=>$model->id,'view_id'=>$this->name))));

		parent::setModel($model);
	}

	function defaultTemplate(){
		return array('view/fundsend');
	}

}