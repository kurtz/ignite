<?php
/**
 * ******************************************************************
 * Messages model Class/Object for the Tuiyo platform               *
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
 
 /**
 * no direct access
 */
defined('TUIYO_EXECUTE') || die('Restricted access');

jimport('joomla.application.component.model');

/**
 * TuiyoModelMessages
 * @package tuiyo
 * @copyright 2009
 * @version $Id$
 * @access public
 */
class SystemServiceModelSystemChat extends JModel{
	
	/**
	 * TuiyoModelMessages::getMessages()
	 * Gets User Messages,
	 * @param mixed $userID
	 * @param mixed $states
	 * @return array
	 */
	public function getMessages($userID, $states = null)
	{	
		//1. Pre-requisites
		$mTable 	= TuiyoLoader::table('messages', true );
		$mStates	= array("unread", "read");
		
		//2. Get the message List
		$mList 		= $mTable->getMessageList( (int)$userID , $mStates);
		
		//3. Trigger Message event, get message from other sources

		
		//4. Return messages
		return (array)$mList;
	}
	
	/**
	 * TuiyoModelMessages::initiateChatRoom()
	 * Initiates a chatRoom. creating a new one if non existent
	 * @param mixed $initiateor
	 * @param mixed $participant
	 * @return void
	 */
	public function initiateChatRoom( $chatName )
	{
		$crTable 	= TuiyoLoader::table('chatrooms', true );
		
		$existing 	= $crTable->checkIfRoomExists( $chatName );
		
		if( empty($crTable->id) ){
			JError::raiseError( TUIYO_SERVER_ERROR, _('Could not initiate chat room') ) ;
			return false;
		}

		return $crTable;	
	}
	
	/**
	 * TuiyoModelMessages::storeChatMessage()
	 * Adds the userPostMessage
	 * @param mixed $data
	 * @param mixed $user
	 * @return
	 */
	public function storeChatMessage( $data , $user)
	{
		$crTable 	= TuiyoLoader::table('chatrooms', true );
		$curTable 	= TuiyoLoader::table('chatusersrooms', true );
		$document 	= TuiyoAPI::get("document");	
		
		if(!$crTable->load( $data['chatRoom']) || !$curTable->hasMember( $user->id , $crTable->id ) ){
			JError::raiseError(TUIYO_SERVER_ERROR , _('Could not Load the chat Room. Message cannot be posted'));
			return false;			
		}
		
		$message 		= htmlentities(strip_tags( trim( $data['chatPostMessage'] ) ) );
		
		$tmplPath 		= TUIYO_VIEWS.DS."messages".DS."tmpl" ;
		
		$tmplVars 		= array(
			"postAuthor"=>	$user->username,
			"postBody"	=>	$message,
			"postTime"	=> 	date( 'Y-m-d H:i:s')
		);
		
		$content 	    = $document->parseTmpl("chatroompost" , $tmplPath , $tmplVars);	
		
		$datafile 		= TUIYO_FILES.DS.'chat'.DS.$crTable->datafile;
	 	$regxUrl 		= "/(http|https|ftp|ftps)\:\/\/[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,3}(\/\S*)?/";
	  
	 	
	 	
		 if(($message)  != "\n"): 
				//Parse URLS and usernames
			 	if(preg_match($regxUrl, $message, $url)):
	       			$message = preg_replace($regxUrl, '<a href="'.$url[0].'" target="_blank">'.$url[0].'</a>', $message);
				endif; 		
				//Write the file
				 $chatLog 		= fopen( $datafile, 'a');
				 $chatPostEnc	= base64_encode( $content );//$this->encryptToggleDecrypt( $content );
				 				         	
	 	 		 fwrite( $chatLog , "\n".$chatPostEnc); 
 	 		 //echo $chatPostEnc;
 	 		 
		 endif;		
		 
		 $crTable->status++; 
		 
		 if(!$crTable->store()){
		 	JError::raiseError(TUIYO_SERVER_ERROR, $crTable->getError());
		 	return false;
		 }	
		
		return true;
	} 
	
	/**
	 * TuiyoModelMessages::getChatMessages()
	 * Gets the last updated chat message from the room
	 * @param mixed $data
	 * @param mixed $user
	 * @return
	 */
	public function getChatMessages( $data , $user )
	{
		$crTable 	= TuiyoLoader::table('chatrooms', true );
		$curTable 	= TuiyoLoader::table('chatusersrooms', true );
		$document 	= TuiyoAPI::get("document");
		
		if(!$crTable->load( $data['chatRoom']) || !$curTable->hasMember( $user->id , $crTable->id ) ){
			JError::raiseError(TUIYO_SERVER_ERROR , _('Could not Load the chat Room. Message cannot be posted'));
			return false;			
		}
		
		$datafile 		= TUIYO_FILES.DS.'chat'.DS.$crTable->datafile;
		$lines			= null;
		$message		= null; 
		
		if(file_exists( $datafile) ):
		
			$lines 		= file( $datafile );
			$count		= count( $lines );
			$state		= (int)$data['status'];
			
			//If we have no updated message
  			 $text		= null;
  			 if($state+1  >= $count){
  			 	$message= $text;
  			 }else{
				 foreach ($lines as $n => $line)
	               {
					   if($n > (int)$state ){
	                 		$text .= str_replace("\n", "", base64_decode( $line ) );
					   } 
	 				}
				 $message 	= $text; 								
			}
		endif; 		
		
		return array( 
			"html" 		=> $message,
			"status"	=> $crTable->status
		);
					
	}
	
	/**
	 * TuiyoModelMessages::encryptToggleDecrypt()
	 * Encrypts or decrypts a string accordingly
	 * @param mixed $string
	 * @return
	 */
	private function encryptToggleDecrypt($string) 
	{ 
	    $stringLen		=	strlen($string); 
	    $stringEncrypted=	""; 
	    
	    for($p = 0; $p<$stringLen; $p++){ 
	        
			$salt 		= (($stringLen+$p)+1); 
	        $salt 		= (255+$salt) % 255; 
	        
	        $byteToEncrypt 		= substr($string, $p, 1); 
	        $asciiByteToEncrypt = ord($byteToEncrypt); 
	        $xoredByte 			= $asciiByteToEncrypt ^ $salt;  //xor operation 
	        $encryptedByte 		= chr($xoredByte );
			 
	        $stringEncrypted 	.= $encryptedByte; 
	         
	    } 
	    return $stringEncrypted; 
	}
}