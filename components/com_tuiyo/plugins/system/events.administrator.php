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
	
		return false;
		
		$version 		= TuiyoLoader::helper("parameter");
		$versionHelper 	= TuiyoLoader::helper("version" , true);
		$versionXML 	= new JSimpleXML();		
		$document 		= $GLOBALS['API']->get("document");
		
		$config			= TuiyoParameter::load("global");
		
		$updateServer	= $config->get("updateServer", "http://update.tuiyo.co.uk");
		$updateStatus	= $config->get("updateStatus", "stable");
		$updateURL 		= JRoute::_(TUIYO_INDEX."&amp;context=systemtools&amp;do=autocenter&amp;run=systemupdate");
		
		$versionXMLstr 	= file_get_contents($updateServer."/version.xml");
		
		if($versionXMLstr === false) return false; //We could not get the version update file 
		
		$versionXMLObj 	= $versionXML->loadString( $versionXMLstr );
		
		$root			= $versionXML->document;
		
		//die;
		$versionStr 		= $root->getElementByPath('version')->data();
		$versionDevLevel	= $root->getElementByPath('devlevel')->data();
		$versionDevStatus	= $root->getElementByPath('devstatus')->data();
		$versionBuildStr	= $root->getElementByPath('build')->data();
		
		$latest 		= $versionStr.'.'.$versionDevLevel.'.'.$versionDevStatus ;
		$outdate 		= true; 
		
		switch($updateStatus):
			case "nightly":
				$outdated   = $versionHelper->isOutDated( $latest ) ;
			break;
			default:
			case "stable":
				$outdated   = $versionHelper->isOutDated( $latest ) ;
			break;
		endswitch;
		
		$vData		= new TuiyoParameter();
		$version 	=& new TuiyoVersion() ;
		
		if( $outdated ) :
			$document->enqueMessage( sprintf(  _('Your version of Tuiyo is outdated.<a href="%s" style="background: none;color: red;">Please click here to automatically update to Tuiyo %2s</a>')  , $updateURL, $latest ) , "notice" );
		endif ;
		
	}
	
}