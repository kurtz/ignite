<?php
/**
 * ******************************************************************
 * Profile JSON view for the tuiyo application                     *
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
jimport( 'joomla.application.component.view');
/**
 * Set ContentMimeType
 */
$doc 	= JFactory::getDocument();
$doc->setMimeEncoding("application/json");

/**
 * TuiyoViewGroups
 * @package Tuiyo For Joomla
 * @copyright 2009
 * @version $Id$
 * @access public
 */
class TuiyoViewGroups extends JView{
	
	/**
	 * TuiyoViewGroups::showNewGroupForm()
	 * @param mixed $respData
	 * @param mixed $categories
	 * @return
	 */
	public function showNewGroupForm($respData, $categories = NULL){
		
		$categories = empty($categories)? $this->getModel("groups")->getCategories() : $categories;
		
		$document 	= $GLOBALS['API']->get("document");
		$user		= $GLOBALS['API']->get("user");
		$tmplPath 	= TUIYO_VIEWS.DS."groups".DS."tmpl" ;
		$tmplVars 	= array(
			"styleDir"	=>TUIYO_STYLEDIR,
			"livePath"	=>TUIYO_LIVE_PATH,
			"categories"=>$categories,
			"user"		=>$user
		);
		$resp['html'] = $document->parseTmpl("newgroup" , $tmplPath , $tmplVars);		
		
		return $this->encode($resp );		
	}
	
	/**
	 * TuiyoViewGroups::encode()
	 * @param mixed $jdata
	 * @return void
	 */
	public function encode( $jdata ){
		echo json_encode( $jdata );
	}
}