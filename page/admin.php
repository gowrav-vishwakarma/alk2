<?php

class page_admin extends Page {
	function init(){
		parent::init();

		$menu=$this->add('Menu');
		$menu->addMenuItem('admin_dashboard','Dashboard');

	}
}