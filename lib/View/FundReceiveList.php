<?php

class View_FundReceiveList extends View{
	function setModel($model){
		foreach($model as $m){
			$v=$this->add('View_FundReceive');
			$v->setModel($model);
		}
		parent::setModel($model);
	}
}