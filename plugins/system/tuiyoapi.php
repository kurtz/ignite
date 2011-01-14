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

class plgSystemTuiyoAPI extends JPlugin
{
    /**
     * System Event: onAfterInitialise
     *
     * @return	string
     */
    public function __construct(& $subject, $config = array())
    {
        define('TUIYO_OVERRIDES', true);
        define('TUIYO_API_PLUGIN', dirname(__FILE__) );
        parent::__construct($subject, $config);
    }
    /**
     * System Event: onAfterInitialise
     *
     * @return	string
     */
    function onAfterInitialise()
    {}
}