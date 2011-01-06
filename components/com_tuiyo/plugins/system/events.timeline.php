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
 

class TuiyoPluginSystemTimeline extends TuiyoEventsListener{

	public function onTimelineLoad(){}
	public function onAfterTimelineLoad( $args = null){}
	public function onBeforeTimelineLoad(){}
	
	public function onAddToTimelineForm($object=null){
		
		$doJSPath = TUIYO_LIVE_PATH."/plugins/system/timeline/" ;
		
	 	echo '<input type="hidden" name="plugin-do" id="plugin-do" value="'.$doJSPath.'do.js"  />
              <input type="hidden" name="plugin-dm" id="plugin-dm" value="'.$doJSPath.'dm.js"  />
              <input type="hidden" name="plugin-attach" id="plugin-attach" value="'.$doJSPath.'attach.js"  />'
        ;
	}
	
	public function onAddTimelinePost(){}
	public function onAddTimelineComment(){}

}