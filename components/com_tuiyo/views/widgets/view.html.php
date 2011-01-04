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
	function display($tpl = null)
	{

		$doc  		= TuiyoAPI::get( "document" );
		$livestyle 	= TUIYO_STYLEDIR;
		
		$doc->addCSS(TUIYO_LIVE_PATH.'/client/default/css/widgets.css' );
		$doc->addJS( TUIYO_LIVE_PATH.'/client/default/script/widgets.js' );
		
		$doc->addJS( TUIYO_JS.'/includes/jqueryui/ui.core.js' );
		$doc->addJS( TUIYO_JS.'/includes/jqueryui/ui.draggable.js' );
		$doc->addJS( TUIYO_JS.'/includes/jqueryui/ui.sortable.js' );
		$doc->addJS( TUIYO_WIDGET );		
		
		$this->assignRef('livestyle', $livestyle );

		parent::display($tpl);
	}
	
}