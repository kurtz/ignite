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
	public function onBeforeTimelineLoad( $args = null){
		//print_r($args);
		//$user = TuiyoAPI::getUser();
		
	}
	public function onAfterTimelineLoad(){}
	public function onAddTimelinePost(){}
	public function onAddTimelineComment(){}

}