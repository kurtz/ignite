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
 
/**
 * no direct access
 */
defined('TUIYO_EXECUTE') || die('Restricted access');


class TuiyoTableChatRooms extends JTable{
	
	//`id` tinyint(4) NOT NULL AUTO_INCREMENT,
	var $id			= null;
	//`name` varchar(20) NOT NULL,
	var $name		= null;
	//`usercount` int(10) NOT NULL,
	var $usercount 	= null;
	//`datafile` varchar(30) NOT NULL,
	var $datafile	= null;
	//status 
	var $status 	= null;
	
    /**
     * TuiyoTableChatUsers::__construct()
     * 
     * @param mixed $db
     * @return
     */
    public function __construct($db = null)
    {
        return parent::__construct("#__tuiyo_chat_rooms", "id", $db );
    }
	
	/**
	 * TuiyoTableChatRooms::loadIfExistsBetweenMembers()
	 * Loads a chat room if any exists between participants
	 * @param mixed $initiator
	 * @param mixed $member
	 * @return void
	 */
	public function checkIfRoomExists($roomName, $initiator=null)
	{
		$dbo 	= $this->_db;
		$user	= TuiyoAPI::get("user", null);
		
		if(empty($roomName)){
			return false;
		}
		
		$initiator 	=  !empty($initiator) ? $dbo->quote( (int)$initiator ) : $user->id;
		$roomName	=   (string)$roomName;
		
		$query 		= "SELECT r.id FROM #__tuiyo_chat_rooms as r WHERE r.name =".$dbo->quote($roomName);
		
		$dbo->setQuery( $query );	
		
		echo $dbo->getQuery();
			
		$roomID 	= $dbo->loadResult();
		
		echo $roomID;
		
		if(!empty($roomID)){
			return $this->load( (int)$roomID ) ;
		}
		//Create the room;
		$this->load( null );
		$this->name 	= str_replace( array(" ","(",")","-","&","%",",","#" ), "", $roomName );
		$this->datafile	= $this->name.date('YmdHis').'.txt';
		$this->status	= 0 ;
		$this->usercount= 1;
		
		if(!$this->store()){
			JError::raiseError(TUIYO_SERVER_ERROR , $this->getError() );
			return false;
		}	
		//Save Author
		$curTable 	= TuiyoLoader::table('chatusersrooms', true );
		$curTable->load( null );
		
		$roomID 	   		= $this->id; 
		$userA 				= clone $curTable ;
		
		$userA->username 	= $user->username ;
		$userA->userid		= $user->id ;
		$userA->room		= $roomID ;
		
		if(!$userA->store()){
			$this->delete();
			JError::raiseError( TUIYO_SERVER_ERROR , $userA->getError() );
			return false;
		}
		
		return $this;
	}	
	
	public function getChatRoomCurator()
	{}

    /**
     * TuiyoTableChatUsers::getInstance()
     * 
     * @param mixed $db
     * @param bool $ifNotExist
     * @return
     */
    public function getInstance($db = null, $ifNotExist = true)
    {
        /** Creates new instance if none already exists ***/
        static $instance = array();

        if (isset($instance) && !empty($instance) && $ifNotExist) {
            if (is_object($instance)) {
                return $instance;
            } else {
                unset($instance);
                TuiyoTableChatRooms::getInstance($db, $ifNotExist);
            }
        } else {
            $instance = new TuiyoTableChatRooms($db);
        }
        return $instance;
    }	
}