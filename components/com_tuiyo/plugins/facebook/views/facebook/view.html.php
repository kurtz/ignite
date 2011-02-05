<?php
/**
 * ******************************************************************
 * Class/Object for the Tuiyo platform                           *
 * ******************************************************************
 * @copyright : 2008 tuiyo Platform                                 *
 * @license   : http://platform.tuiyo.com/license   BSD License     * 
 * @version   : Release: $Id$                                       * 
 * @link      : http://platform.tuiyo.com/                          * 
 * @author 	  : livingstone[at]drstonyhills[dot]com                 * 
 * @access 	  : Public                                              *
 * @since     : 1.0.0 alpha                                         *   
 * @package   : tuiyo                                               *
 * ******************************************************************
 */
 /**
 * no direct access
 */
defined('TUIYO_EXECUTE') || die('Restricted access');

/**
 * joomla utitlies
 */
jimport( 'joomla.application.component.view');
/**
 * 
 * Facebook Controller.
 * @author livingstonefultang
 */
class FacebookServiceViewFacebook extends TuiyoViewServices{

	public function display( $tpl = null){
		
		$document  		= TuiyoAPI::get('document' , null);
    	$user			= TuiyoAPI::get('user', null);
    	$plugModel 		= TuiyoLoader::model("applications", true);
		//$this->setLayout("chatroom");
    	//echo "show chat box"; die;
        //parent::display($tpl);
        $document->addJS( TUIYO_OEMBED );
		$document->addJS( TUIYO_STREAM );
        
    	$plugins	= $plugModel->getAllSystemPlugins("services", false); 
		
		$tmplPath 		= TUIYO_VIEWS.DS."profile".DS."tmpl" ;
		$tmplVars 		= array(
			"styleDir"	=>TUIYO_STYLEDIR,
			"user"		=>$user,
			"sharewith" =>array("p00"=>"@everyone"),
		    "plugins"   => $plugins,
			"canPost"	=>(!$user->joomla->get('guest') ) ? 1 : 0 			
		);
		$activity 		= $document->parseTmpl("activity" , $tmplPath , $tmplVars);
		
		$document->addJS(TUIYO_JS.'/includes/tools/rangeinput.min.js');
		$document->addCSS(TUIYO_LIVE_PATH.'/plugins/facebook/facebook.css');
		$document->addJS(TUIYO_LIVE_PATH.'/plugins/facebook/facebook-view.js');

		
		$document->setPageTitle( _("Facebook | Connect with Tuiyo&trade;") );
		
		$this->assignRef("user", $user);
		$this->assignRef("activity", $activity );
		
		parent::display( $tpl );
	}
	
}