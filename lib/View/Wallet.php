<?php

class View_Wallet extends View{
	function init(){
		parent::init();

		$this->addClass('wallet');
		$this->add('View_Info')->set($this->api->auth->model['fund_available']);
		$this->add('Button')->set('withdrawal')->js('click',$this->js()->univ()->frameURL('Withdrawal Request',$this->api->url('user/withdrawalrequest')));
	}
}