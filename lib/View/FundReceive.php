<?php

class View_FundReceive extends View{
	
	function setModel($model){
		// $fund_request->addField('from_id');
		// $model->join('fund_requests','fund_request_id')->addField('from_id');

		$this->template->trySet('from',$model->ref('fund_request_id')->ref('from_id')->get('name'));
		$this->template->trySet('on_date',$model['on_date']);
		$this->template->trySet('status',$model['status']);
		$this->template->trySet('fund',$model['fund']);

		$link = $this->add('HtmlElement',null,'manage_slip')->setElement('a')->setAttr('href','#')->set('Manage Slip');
		$link->js('click',$this->js()->univ()->frameURL("Receiver :: Manage Slip",$this->api->url("user/manageslip/byreceiver",array('request_distribution_id'=>$model->id))));

		parent::setModel($model);
	}

	function defaultTemplate(){
		return array('view/fundreceive');
	}
}