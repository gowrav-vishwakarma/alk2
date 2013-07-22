<?php

class page_user extends Page {
	public $menu;
	function init(){
		parent::init();

		$this->menu=$this->add('Menu');
		$menu = $this->menu;
		$menu->addMenuItem('user_dashboard','Dashboard');
		$menu->addMenuItem('user_newregistration','New Registration');
		$menu->addMenuItem('logout','Logout');

		$wallet_btn_show = $this->add('Button');
		$wallet_btn_hide = $this->add('Button');

		// $wallet_btn_show->addStyle('margin','auto');
		// $wallet_btn_hide->addStyle('margin','auto');
		
		$v=$this->add('View_Wallet');
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

	}

	function render(){
		parent::render();
	}

}