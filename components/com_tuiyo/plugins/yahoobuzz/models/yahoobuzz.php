<?php
/**
 * ******************************************************************
 * Model                    *
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
 * joomla Controller
 */
jimport('joomla.application.component.model');

/**
 * @author Livingstone Fultang
 * @copyright 2009
 * @version $Id$
 * @access public
 */
class YahoobuzzServiceModelYahoobuzz extends JModel{
	
	/**
	 * 
	 * Enter description here ...
	 * @param unknown_type $service
	 * @param unknown_type $userid
	 */
	public function removeService($service, $userid){
		
		$table 		=& TuiyoLoader::table("userplugins" , true );
		return $table->deleteService( $service , $userid );   //blank 
	}
	
	/**
	 * Adds the yahoobuzz service to user tables;
	 * @param unknown_type $post
	 * @param unknown_type $userid
	 */
	public function addService( $post, $userid){
		
		TuiyoLoader::helper("parameter");
		
		$table 		=& TuiyoLoader::table("userplugins" , true );
		$table->load( null );   //blank 
		
		$table->name 	= "yahoobuzz";
		$table->type 	= "service";
		$table->userid	= (int)$userid;
		$table->privacy = '%p00%';
		
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
	