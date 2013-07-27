 <?php

class page_user_profile extends page_user {
	function init(){
		parent::init();

		$this->add('H3')->set('Change your password');

		$col=$this->add('Columns');
		$col1=$col->addColumn(6);
		$col2=$col->addColumn(6);

		$form = $col1->add('Form');
		if($_GET['success']){
			$form->add('View_Info')->set('Password sucessfully changed');
		}
		$form->addField('password','old_password');
		$form->addField('password','new_password');
		$form->addField('password','re_new_password');
		$form->addSubmit('Update Password');

		if($form->isSubmitted()){
			$cu = $this->add('Model_Member')->load($this->api->auth->model->id);
			if($form->get('old_password') != $cu['password'])
				$form->displayError('old_password','Password is not correct');

			if($form->get('new_password') != $form->get('re_new_password'))
				$form->displayError('re_new_password','Password must match');

			$cu['password'] = $form->get('new_password');
			$cu->save();

			$form->js()->reload(array('success'=>1))->execute();
			
		}

	}
}