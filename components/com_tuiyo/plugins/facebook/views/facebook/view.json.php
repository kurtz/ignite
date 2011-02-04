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
jimport( 'joomla.application.component.view');

$doc = JFactory::getDocument();
$doc->setMimeEncoding("application/json");

/**
 * 
 * Facebook Controller.
 * @author livingstonefultang
 */
class FacebookServiceViewFacebook extends TuiyoViewServices{
    /**
     * @param mixed $data
     * @return
     */
    function encode($jdata)
    {
        echo json_encode($jdata);
        jexit(0);
    }
	
}