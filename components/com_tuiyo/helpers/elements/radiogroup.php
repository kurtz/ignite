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

class JElementRadiogroup extends JElement
{
	/**
	* Element name
	*
	* @access	protected
	* @var		string
	*/
	var	$_name = 'Radiogroup';

	function fetchElement($name, $value, &$node, $control_name)
	{	
		$class = ( $node->attributes('class') ? 'class="'.$node->attributes('class').'"' : 'class="TuiyoFormRadio"' );

		$options = array ();
		foreach ($node->children() as $option)
		{
			$val	= $option->attributes('value');
			$text	= $option->data();
			$options[] = "<div style=\"width: 25%; float:left\"><input type=\"radio\" name=\"" .$control_name.'['.$name.']' . "\" value=\"" . $val . "\" /><span>".$text."</span></div>";
		}
		
		return implode("", $options)."<div style=\"clear:both\"></div>";
	}
}
