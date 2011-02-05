<?php
/**
 * Tuiyo Photos view.
 *
 * @copyright  2008 tuiyo Platform
 * @license    http://platform.tuiyo.com/license   BSD License
 * @version    Release: $Id$
 * @link       http://platform.tuiyo.com/
 * @author 	   livingstone[at]drstonyhills[dot]com 
 * @access 	   Public 
 * @since      1.0.0 alpha
 * @package    tuiyo
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
 * Photos view for the Tuiyo!
 *
 * @package		Tuiyo
 * @subpackage	Components
 */
class TuiyoViewPhotos extends JView
{
	/**
	 * TuiyoViewPhotos::display()
	 * Displays the photos page ;
	 * @param mixed $tpl
	 * @return void
	 */
	function display($tpl = null)
	{
		global $mainframe, $API;
		
		$doc  		= &$API->get("document");
		$bc   		= &$mainframe->getPathway();
		$user		= &$API->get("user", null);
 		$pt 		= &$doc->setPageTitle( _("Photos gallery") );
 		$plugModel 	= &TuiyoLoader::model('applications'  , true);
 					
		$bc->addItem( $user->name  );
		
		$doc->addCSS( TUIYO_LIVE_PATH.'/client/default/css/photospage.css' );
		$doc->addJS( TUIYO_LIVE_PATH.'/client/default/script/photospage.js' );
		$doc->addJS( TUIYO_JS.'/includes/jqueryui/effects.core.js' );
		
		$doc->addJS( TUIYO_JS.'/includes/jqueryui/ui.core.js' );
		$doc->addJS( TUIYO_JS.'/includes/jqueryui/ui.draggable.js' );
		$doc->addJS( TUIYO_JS.'/includes/jqueryui/ui.droppable.js' );	
							
		$doc->addJS( TUIYO_JS.'/includes/jqueryui/effects.slide.js' );
//		$doc->addJS( TUIYO_CAROUSEL );
		
		$livestyle = TUIYO_LIVE_PATH.'/client/default/';
		
		$doc->addJS( TUIYO_OEMBED );
		$doc->addJS( TUIYO_STREAM );
		
		$plugins	= $plugModel->getAllSystemPlugins("services", false);
		
		$tmplPath 		= TUIYO_VIEWS.DS."profile".DS."tmpl" ;
		$tmplPath2		= TUIYO_VIEWS.DS."photos".DS."tmpl";
		
		$tmplVars 		= array(
			"styleDir"	=>TUIYO_STYLEDIR,
			"user"		=>$user,
			"sharewith" =>array("p00"=>"@everyone"),
		    "plugins"   => $plugins,
			"canPost"	=>(!$user->joomla->get('guest') ) ? 1 : 0 			
		);
		
		$activity 		= $doc->parseTmpl("activity" , $tmplPath , $tmplVars);	
		$commenter		= $doc->parseTmpl("comments", $tmplPath2 , $tmplVars);	
		
		$this->assignRef("user" , $user );
		$this->assignRef('activity', $activity);
		$this->assignRef("commenter", $commenter);
		$this->assignRef('livestyle', $livestyle );

		parent::display($tpl);
	}
}