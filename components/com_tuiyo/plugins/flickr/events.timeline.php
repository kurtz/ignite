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

class TuiyoPluginFlickrTimeline extends TuiyoEventsListener {

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

        //Get the parameters of a single user application/service
        $aParams = $aModel->getSingleUserPlugin($aUser->id, "flickr");
       
        if (!is_object($aParams)) {
            return true; //So it does not fail everyone
        }
       
        //get the feedURl
        $flickrUserID = $aParams->get("flickruserid", null);

        if (empty($flickrUserID)) {
            return true; //
        }
        $feedURL = "http://api.flickr.com/services/feeds/photos_public.gne?format=rss2&id=" . $flickrUserID;

        
        $lastupdate = $aParams->get("lastupdated", 0);
        $feedData = JFactory::getXMLParser("rss", array("rssUrl" => $feedURL));

        if (empty($feedData)) {
            return true; //We could not pull the feeds;
        }

        $newupdate          = $lastupdate;
        //$lastupdate = !empty($lastupdate) ? $lastupdate : 0 ;
        $feedItems          = $feedData->get_items();
        $feedDate           = null;
        $i = 0;

        
        foreach ($feedItems as $feedItem) {
            
            $feedItemsThumbs    = array();
            
            //Date
            $date = $feedItem->get_date('Y-m-d H:i:s');

            if ((int) strtotime($date) <= (int) $lastupdate) {
                //echo (int)$lastupdate." vs ".(int)strtotime($date)."<br />";
                continue;
            }
            if ((int) strtotime($date) > (int) $newupdate) {
                //$lastupdate = strtotime($date);
                $newupdate = strtotime($date);
            }
            
            $feedItemEnclosure = $feedItem->get_enclosure();
            
            foreach( $feedItemEnclosure->get_thumbnails() as $thumbnail ){
                $feedItemsThumbs[] = '<a href="'.$feedItemEnclosure->get_link().'" rel="facebox" ><img src="'.$thumbnail.'"/></a>';
            }
            
            $text = ( '@'.$aUser->username.' uploaded photos to flickr <div class="itemResources">'.implode('',$feedItemsThumbs).'</div>' );
               
            echo $text;
            
            if (empty($text)) continue;

            $statusUpdate = array(
                "ptext" => $text,
                "source" => "flickr",
                "sharewith" => array("p00"),
                "embedable" => "",
                "type" => "flickrrss"
            );
            $i++;
            
            //echo (int)strtotime($date)."<br />" ;
            $tModel->setStatus( $aUser->id, $statusUpdate, "flickrrss", array(), $date );
        }
        if ($i > 0) {
            //echo $newupdate;
            $aModel->setUserPluginLastUpdateID($aUser->id, "flickr", $newupdate);
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