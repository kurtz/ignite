<?php
/**
 * ******************************************************************
 * Tuiyo Application entry                                          *
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
defined('_JEXEC') || die('Restricted access');

jimport( 'joomla.application.component.view' );


/**
 * TuiyoViewTuiyo
 * 
 * @package Livingstone Workspace
 * @author Livingstone Fultang
 * @copyright 2009
 * @version $Id$
 * @access public
 */
class TuiyoViewLocaleManager extends JView
{
	public function display(){
		
		$action = JRequest::getVar( "action", null);
		switch($action){
			case "edit":
			case  "create":
				return $this->getEditLocale();
			break;
			case "list":
			default:
				return $this->getLocaleList();
			break;
		}
	}
	
	/**
	 * TuiyoViewExtensions::appEditPage()
	 * Application editing page
	 * @param mixed $data
	 * @return void
	 */
	public function getEditLocale( $data = null )
	{
		$TMPL = $GLOBALS["API"]->get("document");
		$TMPL->IconPath = $iconPath;
		
		global $tpl;
		$vars 			= array();
		$vars['langs'] 	= JFolder::listFolderTree( TUIYO_LOCALE , '.', 1 );

		$tmplVars 		= array(
			"langs"		=>$vars['langs'],
			"styleDir"	=>$livestyle,
			"livePath"	=>TUIYO_LIVE_PATH,
			"iconPath" 	=>TUIYO_LIVE_PATH.'/client/default/'
		);
		
		$tmplPath 		= JPATH_COMPONENT_ADMINISTRATOR.DS."views".DS."localemanager".DS."tmpl" ;
		$tmplData 	    = $TMPL->parseTmpl("editlocale" , $tmplPath , $tmplVars);
		
		return $tmplData;	
	}
	
	/**
	 * TuiyoViewExtensions::appEditPage()
	 * Application editing page
	 * @param mixed $data
	 * @return void
	 */
	public function getLocaleList( $data = null )
	{
		$TMPL = $GLOBALS["API"]->get("document");
		$TMPL->IconPath = $iconPath;
		
		global $tpl;
		$vars 			= array();
		$vars['langs'] 	= JFolder::listFolderTree( TUIYO_LOCALE , '.', 1 );

		$tmplVars 		= array(
			"langs"		=>$vars['langs'],
			"styleDir"	=>$livestyle,
			"livePath"	=>TUIYO_LIVE_PATH,
			"iconPath" 	=>TUIYO_LIVE_PATH.'/client/default/'
		);
		
		$tmplPath 		= JPATH_COMPONENT_ADMINISTRATOR.DS."views".DS."localemanager".DS."tmpl" ;
		$tmplData 	    = $TMPL->parseTmpl("locales" , $tmplPath , $tmplVars);
		
		return $tmplData;	
	}
}