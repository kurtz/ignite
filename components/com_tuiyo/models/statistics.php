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
defined('TUIYO_EXECUTE') || die('Restricted access');

/**
 * joomla Model
 */
jimport('joomla.application.component.model');

class TuiyoModelStatistics extends JModel {

    public function getUserStatusCount($userID) {
        
        $tModel = TuiyoLoader::table('timeline');
        $tCount = $tModel->countUserActivities($userID);

        return (int) $tCount;
    }
    
    public function getNewMemberCountByDate(){
        //stats only for the last 6 months!
        $sixmonths  = strtotime("6 months ago");
        $after      = date("Y-m-d H:i:s", $sixmonths) ;
        
        $dbo        = $this->_db;
        $query      = "SELECT COUNT( * ) as y,  DATE(registerDate) as x FROM  `#__users`"
                    . "\nWHERE `registerDate` > ".$dbo->Quote($after)
                    . "\nGROUP BY x"
        ;
        
        $dbo->setQuery( $query );
        $rawdata    = $dbo->loadAssocList();
        $data       = array(
            array((int)$sixmonths * 1000 , 0 )
        );
        
        $points = array(
            
        );
        $now     = time();
     
        $n     = 183 ; //183 days = 6 months
        
        for($i=$n;$i>0;$i--){
            $seconds = $i*86400;
            $xpoint  =  date("Y-m-d", ($now-$seconds) ) ;
            $points[$xpoint] = 0;
        }
 
        $xy    = array();
        foreach($rawdata as $value){
            $xy [$value['x']] = (int)$value['y'];
        }
      
        $xplot = $xy+$points;
        $xplotk = ksort($xplot);
      
        foreach($xplot as $key=>$value){
            $x = strtotime( $key." UTC")*1000;
            $y = $value;
            $data[] = array(
              $x,$y  
            );
        }
        
        $date =  json_encode($data);
        
        unset($xplot);
        unset($rawdata);
        unset($xy);
        unset($data);
        
        return $date;
    }

    public function getUserFriendsCount() {
        
    }

    public function getUserViewCount() {
        
    }

    public function getUserComments($userID) {
        $tModel = TuiyoLoader::table('timeline');
        $tCount = $tModel->countUserActivities($userID, NULL, NULL, TRUE);

        return (int) $tCount;
    }

    public function getUserPhotoCount() {
        
    }

    public function getUserGroupCount() {
        
    }

    /**
     * TuiyoModelStatistics::getUserStatistics()
     * Returns an array with specific profile item counts
     * @param mixed $userID
     * @return void
     */
    public function getUserStatistics($userID) {
        $sCounts = array(
            "updates" => $this->getUserStatusCount((int) $userID),
            "replies" => $this->getUserComments((int) $userID),
        );

        return (array) $sCounts;
    }

}