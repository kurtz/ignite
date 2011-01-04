<?php
/**
 * ******************************************************************
 * Widgets view for Tuiyo application                               *
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

/** Doctype to JSON **/
$doc = JFactory::getDocument();
$doc->setMimeEncoding("application/json");

/**
 * Widget Views
 * @package		Widget View for Joomla
 * @subpackage	Joomla.Tuiyo.widgets
 */
class TuiyoViewWidgets extends JView
{
	/**
	 * TuiyoViewWidgets::display()
	 * @param mixed $tpl
	 * @return void
	 */
	public function display($tpl = null)
	{
		$livestyle 	= TUIYO_STYLEDIR;
		$this->assignRef('livestyle', $livestyle );

		parent::display($tpl);
	}
	
	/**
	 * TuiyoViewWidgets::contentPanel()
	 * @param mixed $resp
	 * @param mixed $tpl
	 * @return
	 */
	public function contentPanel($resp , $tpl = null){
		
		$document 	= $GLOBALS['API']->get("document");
		$tmplPath 	= TUIYO_VIEWS.DS."widgets".DS."tmpl" ;
		$tmplVars 	= array(
			"styleDir"=>TUIYO_STYLEDIR,
			"livePath"=>TUIYO_LIVE_PATH,
			"widgets" => $resp["data"]
		);
		
		$resp['html'] = $document->parseTmpl("contentpanel" , $tmplPath , $tmplVars);
		
		unset($resp["data"]); //We don't need to send all this info again';
		
		return $this->encode( $resp );
	}
	
	public function encode($jdata)
    {
        echo json_encode($jdata);
    }
}