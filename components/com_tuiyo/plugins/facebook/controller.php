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
 *Import the api file 
 */
require_once TUIYO_PLUGINS.DS.'facebook'.DS.'connect'.DS.'facebook.php';

/**
 * 
 * Facebook Controller.
 * @author livingstonefultang
 *
 */
class FacebookServiceController Extends TuiyoControllerServices{
	
	/**
	 * The Facebook Connect API ...
	 * @var object
	 */
	var $fbConnect = null;

	public function __construct(){
		
		//SET MODEL/VIEW PATH
		$this->addViewPath(TUIYO_PLUGINS.DS.'facebook'.DS.'views');
		$this->addModelPath(TUIYO_PLUGINS.DS.'facebook'.DS.'models');
		
		// Create our Application instance (replace this with your appId and secret).
		TuiyoLoader::helper("parameter");
		$globalCfg = TuiyoParameter::load("global");
		
		$this->fbConnect = new Facebook(array(
		  'appId'  => $globalCfg->get("siteFBAppId"),
		  'secret' => $globalCfg->get("siteFBAppSecret"),
		  'cookie' => true,
		));
		//parent::__construct();
		
		$this->globalCfg = $globalCfg;
	}
	
	public function display(){
		
		$aModel 	= TuiyoLoader::model("applications" , true );
		$tModel 	= TuiyoLoader::model("timeline", true );
		$aUser		= TuiyoAPI::get("user", null);
		$aDocument  = TuiyoAPI::get("document", null);
		$view 		= $this->getView("facebook", "html");
		
		//Get the parameters of a single user application/service
		$aParams 	= $aModel->getSingleUserPlugin($aUser->id , "facebook" );
		$fbid 		= $aParams->get('fbid');
		
		if(!is_object($aParams) || empty($fbid)){
			$this->setRedirect( TUIYO_INDEX );
			$this->redirect(); //
			return true; //So it does not fail everyone
		}
		
		$facebook = new Facebook(array(
			'appId'  => $aParams->get('siteFBAppId'),
			'secret' => $aParams->get('siteFBSecret'),
			'cookie' => true,
			'domain' => 'localhost.dev'
		));
		
		Facebook::$CURL_OPTS[CURLOPT_CAINFO] = TUIYO_PLUGINS.DS.'facebook'.DS.'connect'.DS."cacert.pem" ;
		
		$accessToken = $aParams->get('access_token');
		 
		try {
			$fbuser = $facebook->api("/".$fbid, 'get', array("access_token"=>$accessToken) );
		    $data 	= $facebook->api("/".$fbid."/feed", 'get', array("access_token"=>$accessToken) );
		    
		    $view->assignRef("fbuser", $fbuser);
		    $view->assignRef("data", $data);
		    
		    
		    return $view->display();
		    
		} catch (FacebookApiException $e) {
		    JError::raiseError($e);
		}
	}
	
	public function getAppKey(){
		$auth 	= TuiyoAPI::get( 'authentication' );		//Must be loggedIN
		$auth->requireAuthentication();
		
		$view	=  $this->getView("facebook", "json");
		$resp 	= array(
			"code" 	=> 200, 
			"data" 	=> $this->globalCfg->get("siteFBKey"), 
	 	);
	 	return $view->encode($resp);
	}
	
	public function remove(){
		
		// Check for request forgeries
		JRequest::checkToken( "request" ) or jexit( 'Invalid Token' );
		
		$auth 	 = TuiyoAPI::get( 'authentication' );		//Must be loggedIN
		$auth->requireAuthentication();
		
		$user 	 	= TuiyoAPI::get('user');
		
		$model		= &$this->getModel("facebook" );
		$view		= $this->getView("facebook", "json");
		
		$resp = array(
			"code" 	=> 505, 
			"error" => _("could not remove service"), 
			"data" 	=> null, 
			"extra" => null
	 	);
	 	
		if($model->removeService( "facebook", $user->id) ){
	 		$resp = array(
				"code" 	=> TUIYO_OK, 
				"error" => null, 
	 		);
	 	}

	 	return $view->encode($resp);
	 	
	}
	
	public function add(){
	
		// Check for request forgeries
		JRequest::checkToken( "request" ) or jexit( 'Invalid Token' );
		
		$auth 	 = TuiyoAPI::get( 'authentication' );		//Must be loggedIN
		$auth->requireAuthentication( 'post' );
		
		$user 	 	= TuiyoAPI::get('user');
		$post 		= &Jrequest::get("post");
		
		$model		= &$this->getModel("facebook" );
		$view		= &$this->getView("facebook", "json");
		
		//wee need to capture the authorization code?
		
		$resp = array(
			"code" 	=> 505, 
			"error" => _("could not add service"), 
			"data" 	=> null, 
			"extra" => null
	 	);
	 	
	 	if($model->addService( $post, $user->id) ){
	 		$resp = array(
				"code" 	=> TUIYO_OK, 
				"error" => null, 
	 		);
	 	}
	 	return $view->encode($resp);
	}	
}