<?php
/**
 * ******************************************************************
 * View                                                    *
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
 * @package Tuiyo For Joomla
 * @author Livingstone Fultang
 * @copyright 2009
 * @version $Id$
 * @access public
 */
class FeedServiceViewFeed extends TuiyoViewServices
{
	public function __construct(){
		parent::__construct();
	}
	
    /**
     * @param mixed $data
     * @return
     */
    function display($tpl=null){
    	
    	//if layout not specified feed/views/feed/tmpl/default.php will be displayed
    	//parent::display( $tpl ); this will run the process twice
    	
    }
}