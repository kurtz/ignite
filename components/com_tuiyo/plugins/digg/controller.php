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
 * Digg Controller.
 * @author livingstonefultang
 */
class DiggServiceController Extends TuiyoControllerServices{
	
	public function __construct(){
		
		//SET MODEL/VIEW PATH
		$this->_setPath('view', TUIYO_PLUGINS.DS.'digg'.DS.'views');
		$this->addModelPath(TUIYO_PLUGINS.DS.'digg'.DS.'models');
		
	}
	
	public function remove(){
		
		// Check for request forgeries
		JRequest::checkToken( "request" ) or jexit( 'Invalid Token' );
		
		$auth 	 = TuiyoAPI::get( 'authentication' );		//Must be loggedIN
		$auth->requireAuthentication();
		
		$user 	 	= TuiyoAPI::get('user');
		
		$model		= &$this->getModel("digg" );
		$view		= &$this->getView("digg", "json");
		
		$resp = array(
			"code" 	=> 505, 
			"error" => _("could not remove service"), 
			"data" 	=> null, 
			"extra" => null
	 	);
	 	
		if($model->removeService( "digg", $user->id) ){
	 		$resp = array(
				"code" 	=> TUIYO_OK, 
				"error" => null, 
	 		);
	 	}

	 	return $view->encode($resp);
	 	
	}	
	
	public function display(){
		
		global $mainframe;
		
		$mainframe->redirect( TUIYO_INDEX , _("The Digg plugin does not have an applicaiton front-end"));
	}
	
	/**
	 * (non-PHPdoc)
	 * @see components/com_tuiyo/controllers/TuiyoControllerServices::add()
	 */
	public function add(){
	
		// Check for request forgeries
		JRequest::checkToken( "request" ) or jexit( 'Invalid Token' );
		
		$auth 	 = TuiyoAPI::get( 'authentication' );		//Must be loggedIN
		$auth->requireAuthentication( 'post' );
		
		$user 	 	= TuiyoAPI::get('user');
		$post 		= &Jrequest::get("post");
		
		$model		= &$this->getModel("digg" );
		$view		= &$this->getView("digg", "json");
		
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