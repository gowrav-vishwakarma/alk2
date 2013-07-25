<?php

class page_admin_fundforward extends Page {
	function init(){
		parent::init();

		$this->api->stickyGET('request_id');

		$request = $this->add('Model_FundRequest')->load($_GET['request_id']);
		
		$joining_amount = $request->ref('from_id')->ref('kit_id')->get('joining_amount');
		$pin_amount = $request->ref('from_id')->ref('kit_id')->get('pin_amount');
		$fund_to_send = $joining_amount - $pin_amount;
		$sent_fund_requests = $request['fund_distributed'];

		
		$this->add('View')->setHTML('<b>Joining Amount :: </b>'. $joining_amount);
		$this->add('View')->setHTML('<b>Fund to send :: </b>'. $fund_to_send);
		$this->add('View')->setHTML('<b>Already Sent Fund Request :: </b>'. $sent_fund_requests);
		$this->add('View')->setHTML('<b>Fund Remaining to send :: </b>'. ($fund_to_send - $sent_fund_requests));

		$this->add('H3')->set('Send Request To:');

		$form= $this->add('Form');
		$form->addField('line','username')->validateNotNull();
		$form->addField('number','for_fund')->validateNotNull();
		$form->addSubmit('Send Request');

		if($form->isSubmitted()){
			$receiver = $this->add('Model_Member');
			$receiver->addCondition('username',$form->get('username'));
			$receiver->tryLoadAny();

			if(!$receiver->loaded()) $form->displayError('username','No user Found with this user name');

			if(($form->get('for_fund') % 500) != 0) $form->displayError('for_fund','Must be in multiple of 500');

			// fund filled must be <= fund remaining to distribute from the request
			if($form->get('for_fund') > ($request['fund_requested'] - $request['fund_distributed']))
				$form->displayError('for_fund','You are trying to distribute more fund then sender has to give');
			
			// usernames' total withdrawal request must be >= the fund filled
			$wr = $this->add('Model_WithdrawRequest');
			$wr->addCondition('from_id',$receiver->id);
			$withdrawlable_fund = $wr->_dsql()->del('field')->field($wr->dsql()->expr('sum(fund-alloted_fund)'))->getOne();
			if($form->get('for_fund') > $withdrawlable_fund)
				$form->displayError('for_fund','User does not requested for this much fund, try giving only '. $withdrawlable_fund);

			// start creating fund_distributions with 
			$wr = $this->add('Model_WithdrawRequest');
			$wr->addCondition('from_id',$receiver->id);

			$fund_to_adjust = $form->get('for_fund');
			foreach($wr as $junk){
				if(($accepted_fund=($wr['fund'] - $wr['alloted_fund'])) > 0){
					$fd = $this->add('Model_RequestDistribution');
					$fd['fund_request_id'] = $_GET['request_id'];
					$fd['withdrawl_request_id'] = $wr->id;
					$fd['fund'] = ($fund_to_adjust > $accepted_fund) ? $accepted_fund : $fund_to_adjust;
					$fd->save();

					$fund_to_adjust = $fund_to_adjust - $accepted_fund;
					if($fund_to_adjust<=0) break;
				}
			}

			$form->js(null,array(
							$form->js()->_selector('.sendergrid')->trigger('reload_me'),
							$form->js()->_selector('.receivergrid')->trigger('reload_me'),
							)
					)->univ()->closeDialog()->execute();

		}


	}
}