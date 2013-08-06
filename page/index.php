<?php
class page_index extends Page {
    function init(){
        parent::init();
        $this->js(true)->univ()->frameURL('Message',$this->api->url('message'));
    }

    function defaultTemplate(){
	    return	array('page/index');
    }
}
