<?php
/**
 * ******************************************************************
 * TuiyoTableUsers  Class/Object for the Tuiyo platform                              *
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

/**
 * TuiyoThread
 * 
 * @package Tuiyo For Joomla
 * @author Livingstone Fultang
 * @copyright 2009
 * @version $Id$
 * @access public
 */
class TuiyoThread extends TuiyoAPI
{
	protected function __constructor(){}
	
	var $inQuery = array();
	
	public function _( $arguments = array() , $method="GET"){
		
		//Get An Instance of Self;
		$thread =&TuiyoThread::getInstance();
	
		$thread->generateHeader($arguments, $method);	
	
		//return $thread->getReturned();
		
	}
	
	private function generateHeader( $params , $method){
		
		$URI 		= JURI::getInstance();
	
		$host 		= $URI->getHost();
	    $path 		= $URI->getPath(); 
	
		$url 		= "http://$host/$path";
		$session 	= &JFactory::getSession();
		$token 		= JUtility::getToken();
		$sessionID 	= array( 
			"jsid"	=>	$session->getId(),
			"jsname"	=>	$session->getName(),
			"PHPSESSID"	=> 	session_id(),
			 $token		=> 1
		);
		
		$params  = array_merge($sessionID, (array)$params);
			
		foreach ($params as $key => &$val) {
	      if (is_array($val)) $val = implode(',', $val);
	        $post_params[] = $key.'='.urlencode($val);
	    }
	    $post_string = implode('&', $post_params);
	
		$execURL = $url."?".$post_string;
		
		TuiyoAPI::getURL($execURL, true);
	}
	
	
	/**
 	 * TuiyoThread::getInstance()
 	 * 
 	 * @param bool $ifNotExist
 	 * @return
 	 */
 	public function getInstance($ifNotExist = FALSE )
 	{ 
 		/** Creates new instance if none already exists ***/
		$instance = new TuiyoThread()	;	

		return $instance;	
  	}
	
}