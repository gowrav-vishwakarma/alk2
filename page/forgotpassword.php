<?php

class page_forgotpassword extends Page {
	function init(){
		parent::init();

		$form = $this->add('Form');
		
		if($_GET['success']){
			$form->add('View_Info')->set('Password send to your email');
		}

		$form->addField('line','your_email');
		$form->addSubmit("Send My Password");

		if($form->isSubmitted()){
			$p = $this->add('Model_Member');
			$p->addCondition('email',$form->get('your_email'));
			$p->tryLoadAny();

			if(!$p->loaded()) $form->displayError('your_email',"This User not found");

			$tm=$this->add( 'TMail_Transport_PHPMailer' );
			$msg=$this->add( 'SMLite' );
			$msg->loadTemplate( 'mail/forgotpasswordemail' );
			$msg->trySet( 'password', $p['password'] );
			// $msg->trySet( 'custom_message', $form->get( 'custom_message' ) );
			// $msg->trySet( 'sponsor', $this->api->auth->model['username'] );
			// $msg->trySet( 'leg', 'A' );

			$email_body=$msg->render();
			$email_id = $form->get('your_email');

			$subject ="Password recovery email";
			try{
				$tm->send( $email_id, "info@fast-rich.org", $subject, $email_body ,null);
			}catch( phpmailerException $e ) {
				throw $this->exception( $e->errorMessage() );
			}catch( Exception $e ) {
				throw $e;
			}

			$form->js()->reload(array('success'=>1))->execute();
		}

	}
}