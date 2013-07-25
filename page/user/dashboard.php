<?php

class page_user_dashboard extends page_user {
	function init(){
		parent::init();

		$cols = $this->add('Columns');
		
		$left=$cols->addColumn(6);
		$right=$cols->addColumn(6);

		$left->add('H4')->set('Send Funds To')->addClass('sentclass');
		$fsl=$left->add('View_FundSendList');
		$fsl->setModel($this->api->auth->model->ref('FundRequest')->tryLoadAny());

		$right->add('H4')->set('Receive Funds From')->addClass('reciveclass');
		$fsl=$right->add('View_FundReceiveList');

		$req_dist = $this->add('Model_RequestDistribution');
		$wr=$req_dist->join('withdrawl_request.id','withdrawl_request_id');
		$wr->addField('from_id');
		$req_dist->addCondition('from_id',$this->api->auth->model->id);

		$fsl->setModel($req_dist);


	}
}