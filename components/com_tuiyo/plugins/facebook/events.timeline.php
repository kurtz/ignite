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
 *Import the api file 
 */
require_once TUIYO_PLUGINS.DS.'facebook'.DS.'connect'.DS.'facebook.php';


class TuiyoPluginFacebookTimeline extends TuiyoEventsListener{

	public function onTimelineLoad(){}
	public function onAfterTimelineLoad( $args = null){}
	public function onBeforeTimelineLoad(){}
	
	public function onGetTimelineData(){}
	public function onAddToTimelineForm($object=null){}
	
	public function onAddTimelinePost(){}
	public function onAddTimelineComment(){}

}