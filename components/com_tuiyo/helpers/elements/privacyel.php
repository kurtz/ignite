<?php
/**
* @version		$Id: radio.php 14401 2010-01-26 14:10:00Z louis $
* @package		Joomla.Framework
* @subpackage	Parameter
* @copyright	Copyright (C) 2005 - 2010 Open Source Matters. All rights reserved.
* @license		GNU/GPL, see LICENSE.php
* Joomla! is free software. This version may have been modified pursuant
* to the GNU General Public License, and as distributed it includes or
* is derivative of works licensed under the GNU General Public License or
* other free or open source software licenses.
* See COPYRIGHT.php for copyright notices and details.
*/

// Check to ensure this file is within the rest of the framework
defined('JPATH_BASE') or die();

/**
 * Renders a radio element
 *
 * @package 	Joomla.Framework
 * @subpackage		Parameter
 * @since		1.5
 */

class JElementPrivacyel extends JElement
{
	/**
	* Element name
	*
	* @access	protected
	* @var		string
	*/
	var	$_name = 'Privacyel';

	function fetchElement($name, $value, &$node, $control_name)
	{	
		return '<div class="tuiyoTableRow privacyFieldRow" style="padding-left: 25px; margin-bottom: 0px">
                   <div class="tuiyoTableCell privacyField" align="center" style="width:20%"><input type="radio" name="'.$control_name.'['.$name.']" id="'.$control_name.$name.'640" value="640"/></div>
                   <div class="tuiyoTableCell privacyField" align="center" style="width:20%"><input type="radio" name="'.$control_name.'['.$name.']" id="'.$control_name.$name.'630" value="630"/></div>
                   <div class="tuiyoTableCell privacyField" align="center" style="width:20%"><input type="radio" name="'.$control_name.'['.$name.']" id="'.$control_name.$name.'620" value="620"/></div>
                   <div class="tuiyoTableCell privacyField" align="center" style="width:20%"><input type="radio" name="'.$control_name.'['.$name.']" id="'.$control_name.$name.'610" value="610"/></div>
                   <div class="tuiyoClearFloat"></div>
                </div>';
	}
}
