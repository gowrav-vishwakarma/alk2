<?php

class page_user extends Page {
	function init(){
		parent::init();

		$menu=$this->add('Menu');
		$menu->addMenuItem('user_dashboard','Dashboard');
		$menu->addMenuItem('user_newregistration','New Registration');

	}
}