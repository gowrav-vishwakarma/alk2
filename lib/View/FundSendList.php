<?php

class View_FundSendList extends View{
	function setModel($model){

		$req_dist= $model->ref('RequestDistribution'); 
		foreach($req_dist as $m){

			$v=$this->add('View_FundSend');
			$v->setModel($req_dist);
		}

		parent::setModel($model);
	}
}