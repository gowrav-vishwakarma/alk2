<?php
class page_index extends Page {
    function init(){
        parent::init();
        // Start your code here

        $this->add('CRUD')->setModel('FundRequest');
    }
}
