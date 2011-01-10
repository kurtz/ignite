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

$methods = dirname(__FILE__).DS."tuiyo".DS."methods.php";
$modules = dirname(__FILE__).DS."tuiyo".DS."modules".DS;

jimport('joomla.plugin.plugin');

class plgXMLRPCTuiyo extends JPlugin
{

	/**
	 * Constructor
	 *
	 * For php4 compatability we must not use the __constructor as a constructor for plugins
	 * because func_get_args ( void ) returns a copy of all passed arguments NOT references.
	 * This causes problems with cross-referencing necessary for the observer design pattern.
	 *
	 * @param object $subject The object to observe
	 * @param object $params  The object that holds the plugin parameters
	 * @since 1.5
	 */
	Public function plgXMLRPCTuiyo(& $subject, $config)
	{
		parent::__construct($subject, $config);
	}

	/**
	 * Get available web services for this plugin
	 *
	 * @access	public
	 * @return	array	Array of web service descriptors
	 * @since	1.5
	 */
	public function onGetWebServices()
	{   
		
		include_once $methods;

		return $services;
	}
}