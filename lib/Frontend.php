<?php
/**
 * Consult documentation on http://agiletoolkit.org/learn 
 */
class Frontend extends ApiFrontend {
    public $menu;
    function init(){
        parent::init();
        // Keep this if you are going to use database on all pages
        $this->dbConnect();
        $this->requires('atk','4.2.0');

        // This will add some resources from atk4-addons, which would be located
        // in atk4-addons subdirectory.
        $this->addLocation('atk4-addons',array(
                    'php'=>array(
                        'mvc',
                        'misc/lib',
                        )
                    ))
            ->setParent($this->pathfinder->base_location);

        $this->addLocation('.',array( "addons"=>'xavoc-addons' ));

        // A lot of the functionality in Agile Toolkit requires jUI
        $this->add('jUI');

        // Initialize any system-wide javascript libraries here
        // If you are willing to write custom JavaScript code,
        // place it into templates/js/atk4_univ_ext.js and
        // include it here
        $this->js()
            ->_load('atk4_univ')
            ->_load('ui.atk4_notify')
            ;

        // If you wish to restrict access to your pages, use BasicAuth class
        $auth = $this->add('BasicAuth');
            // ->allow('demo','demo')
            // use check() and allowPage for white-list based auth checking
            //->check()
            ;
        $auth->setModel('Member','username','password');
        $auth->allowPage(array('index','oppertunity','forgotpassword','contact','message'));

        // This method is executed for ALL the pages you are going to add,
        // before the page class is loaded. You can put additional checks
        // or initialize additional elements in here which are common to all
        // the pages.

        // Menu:

        // If you are using a complex menu, you can re-define
        // it and place in a separate class
        if(!$this->api->isAjaxOutput()){
            $this->menu = $this->add('boot/Menu',array('fixed_top'=>false),'Menu');
            $this->menu->addMenuItem('index','Welcome')
            ->addMenuItem('oppertunity','Oppertunity')
            ->addMenuItem('user_dashboard','Member Area')
            ->addMenuItem('index','Franchisee')
            ->addMenuItem('contact','Contact Us')
            ;

            // $this->menu->setBrand('FAST RICH');
            // $this->api->template->tryDel('header');
        }
        $auth->check();

    }
}
