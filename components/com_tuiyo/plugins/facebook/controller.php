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
		$this->_setPath('view', TUIYO_PLUGINS.DS.'facebook'.DS.'views');
		$this->addModelPath(TUIYO_PLUGINS.DS.'facebook'.DS.'models');
		
		// Create our Application instance (replace this with your appId and secret).
		$this->fbConnect = new Facebook(array(
		  'appId'  => '137036213017875',
		  'secret' => 'ba046722e4d5c45032ec15779f53ad6d',
		  'cookie' => true,
		));
		//parent::__construct();
	}
	
	public function remove(){
		
		// Check for request forgeries
		JRequest::checkToken( "request" ) or jexit( 'Invalid Token' );
		
		$auth 	 = TuiyoAPI::get( 'authentication' );		//Must be loggedIN
		$auth->requireAuthentication();
		
		$user 	 	= TuiyoAPI::get('user');
		
		$model		= &$this->getModel("facebook" );
		$view		= &$this->getView("facebook", "json");
		
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
	
	public function getData(){
		
		//have to check for privacy;
		// Check for request forgeries
		//JRequest::checkToken( "request" ) or jexit( 'Invalid Token' );
		
		$auth 	 = TuiyoAPI::get( 'authentication' );		//Must be loggedIN
		$auth->requireAuthentication('request');
		
		$user 	 	= TuiyoAPI::get('user');
		$model		= &$this->getModel("facebook" );
		$view		= &$this->getView("facebook", "json");
		
		$session 	= $this->fbConnect->getSession();

		$fbUser 	= null;
		// Session based API call.
		if ($session) {
			  try {
			    $api_call = array(
			        'method' => 'users.getinfo',
			        'uids' => (int)$uid,
			        'fields' => 'uid, first_name, last_name, pic_square, pic_big, sex'
			    );
		  		$fbUserFeed = $this->fbConnect->api($api_call);
		  		
			  } catch (FacebookApiException $e) {
			    JError::raiseError(404, $e);
			  }
		}
		
		print_r( $fbUserFeed ) ;
		
		die;
		
	}
		
}