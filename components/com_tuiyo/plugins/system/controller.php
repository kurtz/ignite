<?php
/**
 * ******************************************************************
 * Class/Object for the Tuiyo platform                           *
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
 * 
 * System Controller.
 * @author livingstonefultang
 */
class SystemServiceController Extends TuiyoControllerServices{
	
	/**
	 * System Service for Tuiyo 
	 * @var object
	 */
	public function __construct(){
		//parent::__construct();
		//SET MODEL/VIEW PATH
		$this->addViewPath(TUIYO_PLUGINS.DS.'system'.DS.'views');
		$this->addModelPath(TUIYO_PLUGINS.DS.'system'.DS.'models');
		
		TuiyoControllerCore::init("Chat", false);
		TuiyoEventLoader::preparePlugins("chat" );
	}
	

		public function startChatRoom(){

		//Check we have an authenticated user
		$auth 		= &$GLOBALS['API']->get("authentication" );
	 	$auth->requireAuthentication();

		//1. Get Pre-requisites;
		$server 	= JRequest::get("server");
		$post 		= JRequest::get("post");
		$method 	= strtolower( $server['REQUEST_METHOD'] );

		/** we are dealing with only post data***/
		if( $method !== 'post' ) JError::raiseError( TUIYO_BAD_REQUEST , _("Invalid request. Method accepts only post data"));
	
		$model		= &$this->getModel("systemchat" );
		$view 		= &$this->getView("system", "json");
		
		$document 	= &$GLOBALS['API']->get("document" );
		$user 		= &$GLOBALS['API']->get("user" );


		/** Check we have a valid token and Check we have a valid token***/
		if( empty($user->id) || $user->joomla->get('guest') ){
			JError::raiseError( TUIYO_BAD_REQUEST, _("Invalid user ID") );
		}
		
		print_R($post);
		die;
		

		$chatRoom  = $model->initiateChatRoom( $user->id  );			
		$view->assignRef( "chatroom" , $chatRoom);

		//2. prepare a standard response Array
  		$resp = array(
			"code" 	=> TUIYO_OK, 
			"error" => null, 
			"data" 	=> null, 
			"html"  => $view->drawChatHtml()
		);

		if($document->getDOCTYPE() !== "json"){
			$resp["code"] 	= TUIYO_BAD_REQUEST;
			$resp["error"]	= _("Invalid Request format. JSON only");
			//dump
			$view->encode( $resp );
			return false;	
		}		

		//3. Model and store status
		//4. Get all other updates since last time!	



		//5. Return results
		$view->encode( $resp );

	}


	/**
	 * TuiyoControllerChat::postMessage()
	 * Stores a chat Message to the server
	 * @return
	 */
	public function postMessage()
	{	
		//Check we have an authenticated user
		$auth 		= &$GLOBALS['API']->get("authentication" );
	 	$auth->requireAuthentication();

		//1. Get Pre-requisites;
		$postData  	= JRequest::get("post" );
		$server 	= JRequest::get("server");
		$method 	= strtolower( $server['REQUEST_METHOD'] );

		/** we are dealing with only post data***/
		if( $method !== 'post' ) JError::raiseError( TUIYO_BAD_REQUEST , _("Invalid request. Method accepts only post data"));

		$model		= &$this->getModel("messages" );
		$view 		= &$this->getView("messages", "json");
		$document 	= &$GLOBALS['API']->get("document" );
		$user 		= &$GLOBALS['API']->get("user" );


		/** Check we have a valid token and Check we have a valid token***/
		if( empty($user->id) || $user->joomla->get('guest') ){
			JError::raiseError( TUIYO_BAD_REQUEST, _("Invalid user ID") );
		}			

		//2. prepare a standard response Array
  		$resp = array(
			"code" 	=> TUIYO_OK, 
			"error" => null, 
			"data" 	=> null, 
			"extra" => null
		);

		if($document->getDOCTYPE() !== "json"){
			$resp["code"] 	= TUIYO_BAD_REQUEST;
			$resp["error"]	= _("Invalid Request format. JSON only");
			//dump
			$view->encode( $resp );
			return false;	
		}		

		//3. Model and store status
		if(!$model->storeChatMessage( $postData , $user )){
			JError::raiseError(TUIYO_SERVER_ERROR, _('Could not post message'));
			return false;
		}

		//5. Return results
		$view->encode( $resp );	
	}


	public function autoUpdateChatRoom()
	{	
		//Check we have an authenticated user
		$auth 		= &$GLOBALS['API']->get("authentication" );
	 	$auth->requireAuthentication();

		//1. Get Pre-requisites;
		$postData  	= JRequest::get("post" );
		$server 	= JRequest::get("server");
		$method 	= strtolower( $server['REQUEST_METHOD'] );

		/** we are dealing with only post data***/
		if( $method !== 'post' ) JError::raiseError( TUIYO_BAD_REQUEST , _("Invalid request. Method accepts only post data"));

		$model		= &$this->getModel("messages" );
		$view 		= &$this->getView("messages", "json");
		$document 	= &$GLOBALS['API']->get("document" );
		$user 		= &$GLOBALS['API']->get("user" );


		/** Check we have a valid token and Check we have a valid token***/
		if( empty($user->id) || $user->joomla->get('guest') ){
			JError::raiseError( TUIYO_BAD_REQUEST, _("Invalid user ID") );
		}			

		//2. prepare a standard response Array
  		$resp = array(
			"code" 	=> TUIYO_OK, 
			"error" => null, 
			"data" 	=> $model->getChatMessages( $postData , $user )
		);

		if($document->getDOCTYPE() !== "json"){
			$resp["code"] 	= TUIYO_BAD_REQUEST;
			$resp["error"]	= _("Invalid Request format. JSON only");
			//dump
			$view->encode( $resp );
			return false;	
		}				
		//3. Model and store status
		//4. Get all other updates since last time!	



		//5. Return results
		$view->encode( $resp );	
	}
	
	public function display(){
		//Just so we dont get silly view errors
		return $this->chatBox();
	}
	
	public function chatBox(){
		//0. Must be logged in
		$authenticate = TuiyoAPI::get("authentication");
		$authenticate->requireAuthentication();	
			
		//1. Get Pre-requisites;
		$participant= JRequest::getVar("participant" , null );
		$server 	= JRequest::get("server");
		$method 	= strtolower( $server['REQUEST_METHOD'] );

		$model		= &TuiyoLoader::model("messages", true);
		$view 		= $this->getView("system", "html");
		
		$document 	= &$GLOBALS['API']->get("document" );
		$user 		= &$GLOBALS['API']->get("user" , null );
		
		
		/** Check we have a valid token and Check we have a valid token***/
		if( empty($user->id) || $user->joomla->get('guest') ){
			JError::raiseError( TUIYO_BAD_REQUEST, _("Invalid user ID") );
		}
		
		$chatRoom  = array(); //$model->initiateChatRoom( $user->id, $participant );

		$view->assignRef("user", $user);
		$view->assignRef("chatroom" , $chatRoom);
		
		
		$view->showChatBox();
		
	}
}