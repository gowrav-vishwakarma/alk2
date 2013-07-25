<?php

class View_Wallet extends View{
	function init(){
		parent::init();
		
		$mem=$this->add('Model_Member');
		$mem->load($this->api->auth->model->id);

		$wallet_btn_show = $this->add('Button');
		$wallet_btn_hide = $this->add('Button');

		// $wallet_btn_show->addStyle('margin','auto');
		// $wallet_btn_hide->addStyle('margin','auto');
		
		$v=$this->add('View');

		$v->js(true)->slideUp();

		$wallet_btn_show->set('Show Wallet');
		$wallet_btn_hide->set('Hide Wallet')->js(true)->hide();

		$wallet_btn_show->js('click',
			array(
					$v->js()->slideDown(),
					$wallet_btn_hide->js()->show(),
					$wallet_btn_show->js()->hide()
				)
			);

		$wallet_btn_hide->js('click',
			array(
				$v->js()->slideUp(),
				$wallet_btn_hide->js()->hide(),
				$wallet_btn_show->js()->show()
			));

		$this->addClass('wallet');
		$this->js('reload_me')->reload();

		$v->add('View_Info')->set($mem['fund_available']);
		$v->add('Button')->set('withdrawal')->js('click',$this->js()->univ()->frameURL('Withdrawal Request',$this->api->url('user/withdrawalrequest')));
	}
}