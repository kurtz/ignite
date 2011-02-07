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

class TuiyoPluginFeedTimeline extends TuiyoEventsListener {

    /**
     * Feed Plugin onTimelineLoad Event
     *  
     */
    public function onTimelineLoad() {
        
    }

    public function onAfterTimelineLoad($args = null) {
        
    }

    public function onGetTimelineData() {

        $aModel = TuiyoLoader::model("applications", true);
        $tModel = TuiyoLoader::model("timeline", true);
        $aUser = TuiyoAPI::get("user", null);
        $aDocument = TuiyoAPI::get("document", null);

        //Get the parameters of a single user application/service
        $aParams = $aModel->getSingleUserPlugin($aUser->id, "feed");

        if (!is_object($aParams)) {
            return true; //So it does not fail everyone
        }


        //get the feedURl
        $feedURL = $aParams->get("feedURL", null);
        $lastupdate = $aParams->get("lastupdated");
        $feedData = JFactory::getXMLParser("rss", array("rssUrl" => $feedURL));

        if (empty($feedData)) {
            return true; //We could not pull the feeds;
        }
        $newupdate = $lastupdate;
        //$lastupdate = !empty($lastupdate) ? $lastupdate : 0 ;
        $feedItems = $feedData->get_items();
        $i = 0;

        //print_R($feedItems);


        foreach ($feedItems as $feedItem) {

            //Date
            $date = $feedItem->get_date('Y-m-d H:i:s');

            //just store the feed in an object here;

            if ((int) strtotime($date) <= (int) $lastupdate) {
                //echo (int)$lastupdate." vs ".(int)strtotime($date)."<br />";
                continue;
            }


            if ((int) strtotime($date) > (int) $newupdate) {
                //$lastupdate = strtotime($date);
                $newupdate = strtotime($date);
            }
            $feed = $feedItem->get_feed();

            //Data
            $text = '';
            $text .= '<a href="' . $feedItem->get_link() . '">' . $feedItem->get_title() . "</a>";
            $text .= ( strlen($feedItem->get_description()) ? ' ' . substr($feedItem->get_description(), 0, 190) . "..." : '');
            $link = $feedItem->get_link();
            if (empty($text) || empty($link))
                continue;

            $statusUpdate = array(
                "ptext" => $text,
                "source" => "feed",
                "sharewith" => array("p00"),
                "embedable" => "",
                "type" => "rss"
            );
            $i++;
            //echo (int)strtotime($date)."<br />" ;
            $tModel->setStatus($aUser->id, $statusUpdate, "rss", array(), $date);
        }
        if ($i > 0) {
            //echo $newupdate;
            $aModel->setUserPluginLastUpdateID($aUser->id, "feed", $newupdate);
        }
        unset($aParams);
        unset($aModel);
        unset($aUser);
        unset($tModel);
        return true;
    }

    public function onBeforeTimelineLoad() {
        
    }

    public function onAddToTimelineForm() {
        
    }

    public function onAddTimelinePost() {
        
    }

    public function onAddTimelineComment() {
        
    }

}