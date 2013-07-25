<?php

class page_contact extends Page {
	function init(){
		parent::init();

		$this->add('H1')->set('Contact Us');

		$cols = $this->add('Columns');
		$left = $cols->addColumn(6);
		$right = $cols->addColumn(6);

		$left->add('H3')->set('For any kind of query contact us at : ');

		$right->add('H1')->set('info@fast-rich.org');

	}
}