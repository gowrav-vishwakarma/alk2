<?php

class page_user_fundtransfer extends page_user {
	function init(){
		parent::init();

		$this->add('H3')->set('Transfer fund to another user');

		$col=$this->add('Columns');
		$col1=$col->addColumn(6);
		$col2=$col->addColumn(6);

		$form = $col1->add('Form');
		$form->addField('line','to_username')->validateNotNull();
		$form->addField('password','you_password')->validateNotNull();
		$form->addField('number','fund')->validateNotNull();
		$form->addSubmit('Transfer');


		$this->add('H3')->set('Fund Trasnfer Report');

		$tabs = $this->add('Tabs');
		$from_me_tab = $tabs->addTab('Fund transfered by me');
		$to_me_tab = $tabs->addTab('Fund transfered to me');

		$from_me_grid = $from_me_tab->add('Grid');
		$from_me_grid->setModel($this->api->auth->model->ref('FundTransferFrom'));

		$to_me_grid = $to_me_tab->add('Grid');
		$to_me_grid->setModel($this->api->auth->model->ref('FundTransferTo'));

		if($form->isSubmitted()){

			// if(!$this->add('Model_Member')->load($this->api->auth->model->id)->get('is_activated'))
			// 	$form->displayError('fund','You have not completed your commitement and you are not activated, you cannot transfer fund');

			if(($form->get('fund') % 500) != 0 )
				$form->displayError('fund','You can only trasnfer fund in multiple of 500');

			$member = $this->add('Model_Member')->load($this->api->auth->model->id);

			if($member['fund_available'] < $form->get('fund') ) $form->displayError('fund','Funds Not Available');

			if($member['password'] != $form->get('you_password'))
				$form->displayError('you_password','Password is wrong');

			$to_user = $this->add('Model_Member')->addCondition('username',$form->get('to_username'))->tryLoadAny();
				
			if(!$to_user->loaded())
				$form->displayError('to_username','No User Found for this username');

			$ft = $this->add('Model_FundTransfer');
			$ft['from_id'] = $this->api->auth->model->id;
			$ft['to_id'] = $to_user->id;
			$ft['fund'] = $form->get('fund');

			$ft->save();

			$form->js(null,array(
					$form->js()->_selector('.wallet')->trigger('reload_me'),
					$from_me_grid->js()->reload(),
					$to_me_grid->js()->reload()
				))->reload()->execute();
		}

	}
}