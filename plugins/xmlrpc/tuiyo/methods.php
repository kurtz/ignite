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
defined( '_JEXEC' ) or die( 'Restricted access' );

global $xmlrpcString;

//Import the Joomla Folder Library
jimport('joomla.filesystem.folders');

// Initialize variables
$services = array();

//Scan the modules folder
$mFiles = JFolder::files( $modules );

foreach($mFiles as $mFile){
	if(file_exists($mFile)){
		include_once $mFile;
	}
}