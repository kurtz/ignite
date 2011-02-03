<?php
/**
 * ******************************************************************
 * Tuiyo Application entry                                          *
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
defined('_JEXEC') || die('Restricted access');


jimport('joomla.application.component.controller');


/**
 * TuiyoController
 * @package tuiyo
 * @author Livingstone Fultang
 * @copyright 2009
 * @version $Id$
 * @access public
 */
class TuiyoControllerTuiyo extends JController
{

 	 public function __construct(){
		
		/** Do we need user to be logged in? **/		
		//TuiyoControllerCore::init( "Tuiyo", false );
		TuiyoEventLoader::preparePlugins( "administrator" );
		
		//Parent constructor or break
		parent::__construct();	
		
	 }
	 
	 public function addNewCategory(){
	 	
	 	// Check for request forgeries
		JRequest::checkToken() or jexit( 'Invalid Token' );
		
	 	$model 		= TuiyoLoader::model("categories", true);
	 	$data  		= JRequest::get( "post" );
    	$referer	= JRequest::getVar( "HTTP_REFERER" , null, "SERVER" );//Referer
    	
    	//Notice messages;	
		$msg 		= "Category data saved successfully";
		$mType		= "notice";
 
		if(empty($data['cattitle'])||empty($data['catslug'])){
			$this->setRedirect($referer, _("Title and slug cannot be empty"), "error" );
    		$this->redirect();
		}
		//Add the category
	 	if(!$model->addCategory( $data ) ){
			$msg 	= "Could not save category data";
			$mType	= "error";
		}
	 	
	 	$this->setRedirect($referer, $msg, $mType );
    	$this->redirect();	
	 }
	 
	 
	 public function removeCategory(){
	 	
	 	$model 		= TuiyoLoader::model("categories", true);
	 	$catID  	= JRequest::getInt( "catid", null, '', 'int' );
    	$referer	= JRequest::getVar( "HTTP_REFERER" , null, "SERVER" );//Referer
    	
    	//Notice messages;	
		$msg 		= "Category data successfully deleted";
		$mType		= "notice";
 
	 	if(!$model->removeCategory( (int)$catID ) ){
			$msg 	= "Could not remove category data";
			$mType	= "error";
		}
	 	
	 	$this->setRedirect($referer, $msg, $mType );
    	$this->redirect();	
	 }
	
	
	 
	/**
	 * TuiyoController::display()
	 * @return void
	 */
	public function display()
	{
		//onAdminStart
		$adminView 		= $this->getView("tuiyo", "html");
		$GLOBALS["events"]->trigger( "onAdminStart"  );
				
		$adminView->display( null, "_default" );
	}
}