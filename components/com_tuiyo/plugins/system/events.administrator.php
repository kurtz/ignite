<?php
/**
 * ******************************************************************
 * Sample Profile Plugin                                            *
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
 
defined('TUIYO_EXECUTE') || die;


/**
 * TuiyoPluginCheckUpdate
 * 
 * @package Tuiyo For Joomla
 * @author Livingstone Fultang
 * @copyright 2009
 * @version $Id$
 * @access public
 */
class TuiyoPluginSystemAdministrator extends TuiyoEventsListener{
		
	/**
	 * TuiyoPluginCheckUpdate::onAdminStart()
	 * 
	 * @param mixed $args
	 * @return void
	 */
	public function onAdminStart( $args = null ){
		
		//die;
		
		$version 	= TuiyoLoader::helper("parameter");
		$version 	= TuiyoLoader::helper("version");
		$versionXML = new JSimpleXML();		
		$document 	= $GLOBALS['API']->get("document");
		
		$url 		= "https://github.com/Tuiyo/ignite/raw/master/VERSION.XML";
		$updateUrl  = 'index.php?option=com_tuiyo&context=SystemTools&do=autoCenter&run=systemupdate' ; 
		//$vParams	= TuiyoAPI::getURL( $url );
		
		//print_r($vParams);
		
		$vData		= new TuiyoParameter();
		$version 	=& new TuiyoVersion() ;
		
		$latest		 = $vData->get("release").'.'.$vData->get("devlevel").'.'.$vData->get("devstatus") ;
		
		if( $version->isOutDated( $latest ) ) :
			$document->enqueMessage( sprintf(  _('Your version of Tuiyo is outdated. <a href="%s">Please click here to automatically upgrated to Tuiyo %2s</a>')  , $updateUrl, $latest ) , "notice" );
			
		endif ;
		
	}
	
}