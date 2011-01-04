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
$doc->setMimeEncoding("application/json");

/**
 * @author livingstonefultang
 *
 */
class TuiyoViewProfile extends JView
{
    /**
     * TuiyoViewProfile::settings()
     * 
     * @param mixed $data
     * @return void
     */
    function settings($data)
    {
        echo $this->encode($data);
    }

	/**
	 * TuiyoViewProfile::onlineMembers()
	 * Return an HTML styled List of online Members
	 * @return
	 */
	function onlineMembersHTML( ){
		
		$document 	= $GLOBALS['API']->get("document");
		
		$tmplPath 		= TUIYO_VIEWS.DS."profile".DS."tmpl" ;
		$tmplVars 		= array(
			"styleDir"	=>	$livestyle,
			"livePath"	=>	TUIYO_LIVE_PATH,
			"users"		=>  $this->onlineusers
		);
		$content 	    = $document->parseTmpl("onlinemembers" , $tmplPath , $tmplVars);
		
		return $content;
	}
	
    /**
     * TuiyoViewProfile::encode()
     * 
     * @param mixed $data
     * @return
     */
    function encode($jdata)
    {
        echo json_encode($jdata);
    }
}
