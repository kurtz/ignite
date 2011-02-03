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
 * Import the api file 
 */
require_once TUIYO_PLUGINS . DS . 'facebook' . DS . 'connect' . DS . 'facebook.php';

/**
 * Evenst for the Tuiyo Facebook Service
 */
class TuiyoPluginFacebookTimeline extends TuiyoEventsListener {

    public function onTimelineLoad() {
        
    }

    public function onAfterTimelineLoad($args = null) {
        
    }

    public function onBeforeTimelineLoad() {
        
    }

    public function onGetTimelineData() {
        
        static $passed = false;
        
        $aModel     = TuiyoLoader::model("applications", true);
        $tModel     = TuiyoLoader::model("timeline", true);
        $aUser      = TuiyoAPI::get("user", null);

        //Get the parameters of a single user application/service

        $aParams    = $aModel->getSingleUserPlugin($aUser->id, "facebook");
        $fbid       = $aParams->get('fbid');
        $lastupdate = $newupdate = $aParams->get("lastupdated", 0 );

        if (!is_object($aParams) || empty($fbid)) {
            $this->setRedirect(TUIYO_INDEX);
            $this->redirect(); //
            return true; //So it does not fail everyone
        }

        $facebook = new Facebook(array(
                    'appId' => $aParams->get('siteFBAppId'),
                    'secret' => $aParams->get('siteFBSecret'),
                    'cookie' => true,
                    'domain' => 'localhost.dev'
                ));

        Facebook::$CURL_OPTS[CURLOPT_CAINFO] = TUIYO_PLUGINS . DS . 'facebook' . DS . 'connect' . DS . "cacert.pem";

        $accessToken = $aParams->get('access_token');
        
        try {
            $data   = $facebook->api("/" . $fbid . "/posts", 'get', array("access_token" => $accessToken));

             $i = 0;
            foreach ($data['data'] as $item) {
                
                //Date
                $date = date('Y-m-d H:i:s' , strtotime($item['created_time']) );

                //just store the feed in an object here;
                if ((int) strtotime($date) <= (int) $lastupdate) {
                    //echo (int)$lastupdate." vs ".(int)strtotime($date)."<br />";
                    continue;
                }

                if ((int) strtotime($date) > (int) $newupdate) {
                    //$lastupdate = strtotime($date);
                    $newupdate = strtotime($date);
                }
                //Data
                $text  = $item['message'] ;
                $text .= (isset($item['picture'])) ? '<img src="'.$item['picture'].'" width="120" align="left" style="padding: 3px 10px 10px 0;" />' : null;
                $text .= (isset($item['link']))    ? '<a href="'.$item['link'].'">'.$item['name'].'</a><span style="color:#777; font-style: italic; font-size: 11px">'.$item['caption'].'</span>' : null;
                $text .= (isset($item['description']))? '<span style="color:#777; font-style: italic; font-size: 11px">'.$item['description'] .'</span>' : null ;
            
                
                $statusUpdate = array(
                    "ptext" => $text,
                    "source" => "facebook",
                    "sharewith" => array("p00"),
                    "embedable" => "",
                    "type" => "facebook"
                );
                
                $i++;
                //echo (int)strtotime($date)."<br />" ;
                $tModel->setStatus($aUser->id, $statusUpdate, "facebook", array(), $date);
            }
            if ($i > 0) {
                //echo $newupdate;
                $aModel->setUserPluginLastUpdateID($aUser->id, "facebook", $newupdate);
            }
            
            $passed = true;
            
        } catch (FacebookApiException $e) {
           // JError::raiseError($e);
            //No need to stop other plugins from running
        }
    }

    public function onAddToTimelineForm($object=null) {
        
    }

    public function onAddTimelinePost() {
        
    }

    public function onAddTimelineComment() {
        
    }

}