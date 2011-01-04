<?php
/**
 * ******************************************************************
 * Welcome view for Tuiyo application                               *
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
 * Set Doctyp
 */
 
$doc 	= JFactory::getDocument();
$doc->setMimeEncoding("application/json");
/**
 * Welcome Views
 *
 * @package		Tuiyo
 * @subpackage	Tuiyo.welcome
 */
class TuiyoViewWelcome extends JView
{
	/**
	 * TuiyoViewWelcome::display()
	 * 
	 * @param mixed $tpl
	 * @return void
	 */
	function returnJSON($data)
	{	
		$json = json_encode( $data );
		
		echo $json;
	}
}