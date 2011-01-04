<?php
/**
 * ******************************************************************
 * TUIYO SERVICES VIEW                                          *
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

/**
 * Joomla component view
 */
jimport( 'joomla.application.component.view');

$doc 	= JFactory::getDocument();
$doc->setMimeEncoding("application/json");

/**
 * 
 * @package tuiyo
 * @author Livingstone Fultang
 * @copyright 2009
 * @version $Id$
 * @access public
 */
class TuiyoViewServices extends JView
{	
	/**
	 * @param mixed $data
	 * @return void
	 */
	public function encode($data){
		echo json_encode( $data );
	}
}
