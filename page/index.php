<?php
class page_index extends page_user {
    function init(){
        parent::init();
        // Start your code here

        $this->add('CRUD')->setModel('FundRequest');
    }
}
