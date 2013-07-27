<?php

class page_user_leveldetails extends page_user {
	function init(){
		parent::init();
		
		$form = $this->add('Form');
		$form->addField('dropdown','level')->setEmptyText("Select Level")->setValueList(array(1=>1,2=>2,3=>3,4=>4,5=>5,6=>6,7=>7,8=>8,9=>9,10=>10));
		$form->addSubmit('Filter');

		$grid= $this->add('Grid');

		$m= $this->add('Model_Member');

		if($_GET['level']){
			
			$temp = $m;
			for($i=1; $i <= $_GET['level']; $i++){
				$temp = $temp->join('members','sponsor_id');
			}

			$temp->addField('member_id','id');

			$m->addCondition('member_id',$this->api->auth->model->id);

		}else{
			$m->addCondition('id',-1);
		}

		$grid->setModel($m,array('name','username','join_on','is_activated','status'));
		
		$grid->addMethod('format_kits',function ($obj,$field){
			$obj->current_row[$field]=$obj->model->ref('kit_id')->get('joining_amount');
		});

		$grid->addColumn('kits','commitement_amount');

		$grid->addOrder()->move('commitement_amount','after','username')->now();

		if($form->isSubmitted()){
			$grid->js()->reload(array('level'=>$form->get('level')))->execute();
		}

	}

}