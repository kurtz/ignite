<?php
/**
 * ******************************************************************
 * Discussion View                                                    *
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
 * TuiyoViewDiscussions
 * @package Tuiyo For Joomla
 * @author Livingstone Fultang
 * @copyright 2009
 * @version $Id$
 * @access public
 */
class TuiyoViewDiscussions extends JView
{
	/**
	 * Overits the parent function
	 * Default display for views control
	 * @see JView::display()
	 */
	public function display($tpl=null){
		
		$document = $GLOBALS['API']->get('document', null );
		$user	  = $GLOBALS['API']->get('user', null);
		
		$GLOBALS['mainframe']->getPathway()->addItem( _("Discussions Boards") );
		$GLOBALS['mainframe']->setPageTitle( _("Discussion Boards") );
  	
		
		
		//styles
		$document->addCSS(TUIYO_STYLEDIR.'/css/discussions.css');
		$document->addJS(TUIYO_STYLEDIR.'/script/discussions.js');
		$document->addJS( TUIYO_STREAM );
		$document->addJS( TUIYO_OEMBED );
		
		$pModel 		= TuiyoLoader::model("applications", true);
		$plugins		= $pModel->getAllSystemPlugins("services", false); 
		
		$tmplPath 		= TUIYO_VIEWS.DS."profile".DS."tmpl" ;
		$tmplVars 		= array(
			"styleDir"	=>TUIYO_STYLEDIR,
			"user"		=>$user,
			"sharewith" =>array("p00"=>"@everyone"),
		    "plugins"   => $plugins,
			"canPost"	=>(!$user->joomla->get('guest') ) ? 1 : 0 			
		);
		$activity 		= $document->parseTmpl("activity" , $tmplPath , $tmplVars);
		
		$this->assignRef("activity", $activity );

		parent::display( $tpl );
	}
}