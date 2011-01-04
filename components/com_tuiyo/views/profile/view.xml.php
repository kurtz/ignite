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
jimport('joomla.application.component.view');
				
/**
 * Set ContentMimeType
 */
$doc = JFactory::getDocument();
$doc->setMimeEncoding("application/xhtml+xml");

/**
 * TuiyoViewProfile
 * @package Tuiyo For Joomla
 * @author Livingstone Fultang
 * @copyright 2009
 * @version $Id$
 * @access public
 */
class TuiyoViewProfile extends JView
{
	/**
	 * TuiyoViewProfile::returnI()
	 * @param mixed $imageData
	 * @return void
	 */
	public function returnX( $xmlData ){
		header('Content-Type: text/xml');
		echo $xmlData;
		exit(0);
	}
	
	
}