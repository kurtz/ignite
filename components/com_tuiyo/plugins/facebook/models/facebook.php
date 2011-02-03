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
 * joomla utitlies
 */
jimport( 'joomla.application.component.model');
/**
 * 
 * Facebook Controller.
 * @author livingstonefultang
 */
class FacebookServiceModelFacebook Extends JModel{
	
	
	public function removeService($service, $userid){
		
		$table 		=& TuiyoLoader::table("userplugins" , true );
		return $table->deleteService( $service , $userid );   //blank 
	}
	
	public function addService( $post, $userid){
		
		TuiyoLoader::helper("parameter");
		
		$table 		=& TuiyoLoader::table("userplugins" , true );
		$table->load( null );   //blank 
		
		$table->name 		= "facebook";
		$table->type 		= "service";
		$table->userid		= (int)$userid;
		$table->privacy               = '%p00%';
		
		//get parameters;
		$registry	= new JRegistry();
		$postParams	= JRequest::getVar('params', array(), 'post', 'array');
		
		if(count($postParams)){
			$registry->loadArray( $postParams );
			$table->params	= $registry->toString(); //store the username and password and anything else;
		}
		  
		if(!$table->store()){
			echo $table->getError();
			return false;  //get the eror;
		}
		
		return true;
	}
}