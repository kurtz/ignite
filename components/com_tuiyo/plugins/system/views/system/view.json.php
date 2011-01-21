<?php
/**
 * ******************************************************************
 * System JSON view                                               *
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
$doc = JFactory::getDocument();
$doc->setMimeEncoding("application/json");
/**
 * TuiyoViewMessages
 * 
 * @package tuiyo
 * @author Livingstone Fultang
 * @copyright 2009
 * @version $Id$
 * @access public
 */
class SystemServiceViewSystem extends TuiyoViewServices
{
	/**
	 * TuiyoViewMessages::drawChatHtml()
	 * Draws the HTML structure for a chat room;
	 * @param mixed $tmpl
	 * @return void
	 */
	public function drawChatHtml( $tmpl = null ){
		
		$document 		= $GLOBALS['API']->get("document");
		$user 			= $GLOBALS['API']->get("user");
		$chatRoom		= $this->chatroom ;
		
		$tmplPath 		= TUIYO_VIEWS.DS."messages".DS."tmpl" ;
		
		$tmplVars 		= array(
			"styleDir"	=>	$livestyle,
			"livePath"	=>	TUIYO_LIVE_PATH,
			"chatroom"	=> 	$chatRoom,
			"user"		=>  $user 
		);
		$content 	    = $document->parseTmpl("chatroom" , $tmplPath , $tmplVars);
		
		return $content;				
	}
	
	/**
	 * TuiyoViewMessages::encode()
	 * Encodes and outputs JSON data
	 * @param mixed $data
	 * @return void
	 */
	public function encode( $data ){
		echo json_encode($data);
	}
}