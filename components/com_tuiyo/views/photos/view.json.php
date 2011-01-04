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
jimport( 'joomla.application.component.view');
/**
 * Set ContentMimeType
 */
$doc =	&JFactory::getDocument();
$doc->setMimeEncoding("application/json");

/**
 * @package Tuiyo For Joomla
 * @author Livingstone Fultang
 * @copyright 2009
 * @version $Id$
 * @access public
 */
class TuiyoViewPhotos extends JView
{
	/**
	 * TuiyoViewPhotos::display()
	 * @param mixed $tpl
	 * @return
	 */
	public function display($tpl=null)
	{ 
		return true;
	}
	
	/**
	 * TuiyoViewPhotos::showOrganizePanel()
	 * @param mixed $resp
	 * @return void
	 */
	public function showOrganizePanel( $resp ){
		
		$document 	= $GLOBALS['API']->get("document");
		$tmplPath 	= TUIYO_VIEWS.DS."photos".DS."tmpl" ;
		
		$tmplVars 	= array(
			"styleDir"	=>TUIYO_STYLEDIR,
			"livePath"	=>TUIYO_LIVE_PATH,
			"albums"  	=>$resp['albums'],
			"user"		=>$GLOBALS['API']->get("user")
		);
		
		$resp['html'] = $document->parseTmpl("organizepanel" , $tmplPath , $tmplVars);		
		
		return $this->encode($resp );
	}
	
	public function showslideShowPanel( $resp ){

		$document 	= $GLOBALS['API']->get("document");
			
		
		return $this->encode($resp );
	}		
	
	/**
	 * TuiyoViewPhotos::encode()
	 * @param mixed $data
	 * @return
	 */
	public function encode( $jdata ){
		echo json_encode( $jdata );
	}
}