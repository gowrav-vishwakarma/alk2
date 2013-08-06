<?php

class page_test extends Page {
	function init(){
		parent::init();

		$cols=$this->add('Columns');
		$left=$cols->addColumn(6);
		$right=$cols->addColumn(6);


		$v=$right->add('View_Info');
		$v->set('Hello '. rand(1000,9999));

		// $v->js('click')->reload();

		$form=$left->add('Form');
		$form->addField('line','num1');
		$form->addField('line','num2');

		$btn=$form->addSubmit('Check');

		$btn->js('click',$v->js()->hide());

		if($form->isSubmitted()){
			if($form->get('num1') != $form->get('num2'))
				$form->displayError('num2','Must be same');
		}

		$this->add('CRUD')->setModel('Kit');
		
	}
}