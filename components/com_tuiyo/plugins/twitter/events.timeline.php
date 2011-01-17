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


/**
 * Twitter oAuth;
 */
require_once(TUIYO_PLUGINS.DS.'twitter'.DS.'twitteroauth'.DS.'twitteroauth.php');
require_once(TUIYO_PLUGINS.DS.'twitter'.DS.'twitteroauth'.DS.'config.php');


/**
 * Twitter Timeline Plugin
 * Enter description here ...
 * @author livingstonefultang
 *
 */
class TuiyoPluginTwitterTimeline extends TuiyoEventsListener{

	/**
	 * TWITTER.onTimelineLoad
	 * 
	 * Enter description here ...
	 */
	public function onTimelineLoad(){}
	
	/**
	 * TWITTER.onAfterTimelineLoad()
	 * 
	 * Enter description here ...
	 * @param unknown_type $args
	 */
	public function onAfterTimelineLoad( $args = null){}
	
	/**
	 * TWITTER.onBeforeTimelineLoad()
	 * 
	 * Enter description here ...
	 */
	public function onBeforeTimelineLoad(){
		
		//Can We pull updates from Twitter now?
		$aModel 	= TuiyoLoader::model("applications" , true );
		$tModel 	= TuiyoLoader::model("timeline", true );
		$aUser		= TuiyoAPI::get("user", null);
		$aDocument  = TuiyoAPI::get("document", null);
		
		$aParams 	= $aModel->getSingleUserPlugin($aUser->id , "twitter" );
		
		if(!is_object($aParams)){
		   //User does not have the service Enabled
			return false;
		}
		
		$token 		= $aParams->get("oauth_token");
		$secret 	= $aParams->get("oauth_token_secret");
		$lastupdate = $aParams->get("lastupdated", null);
		
		$lastupdate = (empty($lastupdate)||(int)$lastupdate===0)? array() : array("since_id"=>$lastupdate);
		
		$connection = new TwitterOAuth(CONSUMER_KEY, CONSUMER_SECRET, $token, $secret);
		$content 	= $connection->get('statuses/user_timeline', $lastupdate );
		
		//Update the user field tell it what the last update we have pulled;
		$pulledIDs 	= array(); 
		$lastupdate = 0; 
		
		foreach($content as $i=>$tweet){
			$statusUpdateTime  = $tweet->created_at;
			$statusUpdate = array(
				"ptext"	=> $tweet->text,
				"source"=> "twitter",
				"sharewith"=>array("p00"),
				"embedable"=>"",
				"type"=>"tweet"
			);
			$tModel->setStatus( $aUser->id, $statusUpdate, "tweet", array(), $statusUpdateTime );
			$pulledIDs[]= $tweet->id_str;
		}
		//If we pulled any tweets
		if(isset($pulledIDs[0]) ){
			return $aModel->setUserPluginLastUpdateID($aUser->id, "twitter", $pulledIDs[0] );
		}
		
	}
	
	/**
	 * TWITTER.onAddToTimelineForm
	 * 
	 * Adds addition commandline JS plugins
	 * 
	 * @param unknown_type $object
	 */
	public function onAddToTimelineForm($object=null){}
	
	/**
	 * TWITTER.onAddTimelinePost
	 * 
	 * Called Should users wish to post their status updates to twitter
	 * Automatically, this updates will be sent directly to twitter
	 * This behavior can be modified from the user settings
	 */
	public function onAddTimelinePost(){}
	
	/**
	 * TWITTER.onAddTimelineComment
	 * 
	 * Triggered when a new update is posted in response to another i.e comment
	 * Could serve as direct replies to twitter updates;
	 * 
	 */
	public function onAddTimelineComment(){}

}