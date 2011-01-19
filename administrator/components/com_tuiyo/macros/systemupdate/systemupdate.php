<?php
/**
 * ******************************************************************
 * Tuiyo application                     *
 * ******************************************************************
 * @copyright : 2008 tuiyo Platform                                 *
 * @license   : http://platform.tuiyo.com/license   BSD License     * 
 * @version   : Release: $Id$                                       * 
 * @link      : http://platform.tuiyo.com/                          * 
 * @author 	  : livingstone[at]drstonyhills[dot]com                 * 
 * @access 	  : Public                                              *
 * @since     : 1.0.0 alpha                                         *   
 * @package   : tuiyo    yyeSyV0kysKV2oqpLUES5                                           *
 * ******************************************************************
 */
 
/**
 * no direct access
 */
defined('TUIYO_EXECUTE') || die('Restricted access');


class TuiyoMacroSystemUpdate{
	
	public function __construct(){
		TuiyoEventLoader::preparePlugins( "macros" );
	}
	
	public function run(){
		
		$version 		= TuiyoLoader::helper("parameter");
		$versionHelper 	= TuiyoLoader::helper("version" , true);	
		$config			= TuiyoParameter::load("global");
		
		echo _("Welcome to the system update macro...")."<br />";
		 
		ob_flush();
		flush();
		
		$updateServer	= $config->get("updateServer", "http://update.tuiyo.co.uk");
		$updateStatus	= $config->get("updateStatus", "stable");
		$updateURL 		= JRoute::_(TUIYO_INDEX."&amp;context=systemtools&amp;do=autocenter&amp;run=systemupdate");
		
		$versionXMLstr 	= file_get_contents($updateServer."/version.xml");
		$versionXML 	= new JSimpleXML();	
		$versionXMLObj 	= $versionXML->loadString($versionXMLstr);
		$root			= $versionXML->document;
		
		echo _("Checking for Updates...")."<br />";
		 
		ob_flush();
		flush();
		
		//die;
		$versionStr 	= $root->getElementByPath('version')->data();
		$versionDevLevel= $root->getElementByPath('devlevel')->data();
		$versionDevStatus= $root->getElementByPath('devstatus')->data();
		$versionBuildStr = $root->getElementByPath('build')->data();
		$versionDldURL 	= $root->getElementByPath("updateurl")->data();
		
		$latest 		= $versionStr.'.'.$versionDevLevel.'.'.$versionDevStatus ;
		$outdated   	= $versionHelper->isOutDated( $latest ) ;
		
		if(!$outdated){
			echo "There was nothing to update <br />";
			return true;
		}
		
		echo _("Downloading Update file from <strong>$versionDldURL</strong>....")."<br />";
		ob_flush();
		flush();
		
		$this->downloadFile( $versionDldURL, TUIYO_CACHE );

	}
	
	public function downloadFile($source, $target) {
		
	       	//$file = system('wget '.$source);
			//file_put_contents($file, $target.DS."updater.zip");
	        //return false;
	   }
	
	/**
	 * TuiyoMacroSystemUpdate::getInstance()
	 * Creates an instance of the Plugin
	 * @param mixed $ifNotExist
	 * @return
	 */
	public function getInstance($ifNotExist = NULL )
	{
 		/** Creates new instance if none already exists ***/
        static $instance;

        if (is_object($instance) && !$ifNotExist) {
            return $instance;
        } else {
            $instance = new TuiyoMacroSystemUpdate();
        }
        return $instance;
	}
	
}