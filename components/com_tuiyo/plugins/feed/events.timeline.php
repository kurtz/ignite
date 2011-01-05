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
 
defined('TUIYO_EXECUTE') || die('You are not authorised to view this resource');
 

class TuiyoPluginFeed extends TuiyoEventsListener{

	public function onTimelineLoad(){}
	public function onAfterTimelineLoad( $args = null){
		
		$aModel 	= TuiyoLoader::model("applications" , true );
		$aUser		= TuiyoAPI::get("user", null);
		$aDocument  = TuiyoAPI::get("document", null);
		$aXMLParser = new JSimpleXML();
		
		//Get the parameters of a single user application/service
		$aParams 	= $aModel->getSingleUserPlugin($aUser->id , "feed" );
		
		//get the feedURl
		$feedURL 	= $aParams->get("feedURL", null);
		//$feedData   = TuiyoAPI::getURL( $feedURL );
		
		//$tempfilename = TUIYO_CACHE.DS.date("YmdHis")."feed.xml";
		//$tempFeed 	  = fopen($tempfilename, 'w') ;
		
		//fwrite($tempFeed , trim($feedData));
		//fclose($tempFeed);
		
	
		
		//echo $tempfilename;

		//$feedXML 	= @$aXMLParser->loadFile($tempfilename);
		
		//unlink($tempfilename);
		//print_R($aXMLParser);
		
		
		
	}
	public function onBeforeTimelineLoad(){}
	public function onAddToTimelineForm(){}
	public function onAddTimelinePost(){}
	public function onAddTimelineComment(){}

}