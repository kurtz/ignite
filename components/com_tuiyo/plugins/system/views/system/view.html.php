<?php
/**
 * ******************************************************************
 * View                                                    *
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


/**
 * @package Tuiyo For Joomla
 * @author Livingstone Fultang
 * @copyright 2009
 * @version $Id$
 * @access public
 */
class SystemServiceViewSystem extends TuiyoViewServices
{
	public function __construct(){
		parent::__construct();
		
		//Add the Tmpl directory for this 
		$chatTmpl = $this->serviceViewDir."chat".DS."tmpl";
		$this->addTemplatePath( $chatTmpl );
		
	}
    /**
     * @param mixed $data
     * @return
     */
    function showChatBox( $tpl = null )
    {
    	$document  		= TuiyoAPI::get('document' , null);
    	$user			= TuiyoAPI::get('user', null);
    	$plugModel 		= TuiyoLoader::model("applications", true);
		//$this->setLayout("chatroom");
    	//echo "show chat box"; die;
        //parent::display($tpl);
        $document->addJS( TUIYO_OEMBED );
		$document->addJS( TUIYO_STREAM );
		$document->addJS( TUIYO_CHAT );
        
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
		
		$document->addCSS( TUIYO_JS.'/includes/jqueryui/smoothness/ui.smoothness.css'  );
		$document->addJS( TUIYO_JS.'/includes/jqueryui/ui.all.js' );

		
		$GLOBALS['mainframe']->setPageTitle( _("Live Chat") );
		$this->assignRef("activity", $activity );
		
		parent::display( $tpl );
    }
}