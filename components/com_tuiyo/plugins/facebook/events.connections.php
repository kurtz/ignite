<?php
/**
 * Tuiyo Friends Controller
 *
 * @copyright  2008 Tuiyo Platform
 * @license    http://platform.Tuiyo.com/license   BSD License
 * @version    Release: $Id$
 * @link       http://platform.Tuiyo.com/
 * @author 	   livingstone[at]drstonyhills[dot]com 
 * @access 	   Public 
 * @since      1.0.0 alpha
 * @package    TuiYo
 */
/**
 * no direct access
 */
defined('TUIYO_EXECUTE') || die('Restricted access');


class TuiyoPluginFacebookConnections extends TuiyoEventsListener{
	
	
	/**
	 * Adds an inviter form to the friends section
	 * Connect with your twitter followers.
	 */
	public function onConnectionsView(){
		
		$document 		= TuiyoAPI::get("document");
		$user			= TuiyoAPI::get("user");
		
		$tmplPath 		= TUIYO_PLUGINS.DS."facebook".DS."views".DS."facebook".DS."tmpl" ;
		$tmplVars 		= array(
			"styleDir"	=>TUIYO_LIVE_PATH,
			"user"		=>$user,	
		);
		$inviter 		= $document->parseTmpl("invite" , $tmplPath , $tmplVars, 'php');
		
		echo $inviter;
	}
	
}
