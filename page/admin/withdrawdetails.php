<?php

class page_admin_withdrawdetails extends page_admin {
	function init(){
		parent::init();

		$this->add('H3')->set('Withdraw Requests from members');

		$m = $this->add('Model_WithdrawRequest');
		// $m->join('members','from_id');
		// $m->addField('username');

		$grid = $this->add('Grid');
		$grid->setModel('WithdrawRequest');


		$m->getElement('from_id')->caption('Withdraw Request From');

		$grid->addColumn('Expander','details');

		$grid->addPaginator(50);

	}
}