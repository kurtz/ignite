<?php
/**
 * ******************************************************************
 * Tuiyo application                     *
 * ******************************************************************
 * @copyright : 2008 tuiyo Platform                                 *
 * @license   : http://platform.tuiyo.com/license   BSD License     * 
 * @version   : Release: $Id$                                       * 
 * @link      : http://platform.tuiyo.com/                          * 
 * @author 	  : livingstone[at]drstonyhills[dot]com                 * 
 * @access 	  : Public                                              *
 * @since     : 1.0.0 alpha                                         *   
 * @package   : tuiyo    yyeSyV0kysKV2oqpLUES5                                           *
 * ******************************************************************
 */
 
/**
 * no direct access
 */
defined('TUIYO_EXECUTE') || die('Restricted access');


/**
 * TuiyoParameter
 * 
 * @package Joomla
 * @author stoney
 * @copyright 2010
 * @version $Id$
 * @access public
 */
class TuiyoParameter extends JParameter{
	
    /**
	 * The raw params string
	 *
	 * @access	private
	 * @var		string
	 * @since	1.5
	 */
	var $_raw = null;

	/**
	 * The xml params element
	 *
	 * @access	private
	 * @var		object
	 * @since	1.5
	 */
	var $_xml = null;

	/**
	* loaded elements
	*
	* @access	private
	* @var		array
	* @since	1.5
	*/
	var $_elements = array();

	/**
	* directories, where element types can be stored
	*
	* @access	private
	* @var		array
	* @since	1.5
	*/
	var $_elementPath = array();

	/**
	 * Constructor
	 *
	 * @access	protected
	 * @param	string The raw parms text
	 * @param	string Path to the xml setup file
	 * @since	1.5
	 */
	function __construct($data, $path = '')
	{
                parent::__construct('_default');
                    
                $this->addElementPath( TUIYO_HELPERS.DS."elements".DS );

	}

	/**
	 * Set a value
	 *
	 * @access	public
	 * @param	string The name of the param
	 * @param	string The value of the parameter
	 * @return	string The set value
	 * @since	1.5
	 */
	function set($key, $value = '', $group = '_default')
	{
		return $this->setValue($group.'.'.$key, (string) $value);
	}

	/**
	 * Get a value
	 *
	 * @access	public
	 * @param	string The name of the param
	 * @param	mixed The default value if not found
	 * @return	string
	 * @since	1.5
	 */
	function get($key, $default = '', $group = '_default')
	{
		$value = $this->getValue($group.'.'.$key);
		$result = (empty($value) && ($value !== 0) && ($value !== '0')) ? $default : $value;
		return $result;
	}

	/**
	 * Sets a default value if not alreay assigned
	 *
	 * @access	public
	 * @param	string	The name of the param
	 * @param	string	The value of the parameter
	 * @param	string	The parameter group to modify
	 * @return	string	The set value
	 * @since	1.5
	 */
	function def($key, $default = '', $group = '_default') {
		$value = $this->get($key, (string) $default, $group);
		return $this->set($key, $value);
	}

	/**
	 * Sets the XML object from custom xml files
	 *
	 * @access	public
	 * @param	object	An XML object
	 * @since	1.5
	 */
	function setXML( &$xml )
	{
		if (is_object( $xml ))
		{
			if ($group = $xml->attributes( 'group' )) {
				$this->_xml[$group] = $xml;
			} else {
				$this->_xml['_default'] = $xml;
			}
			if ($dir = $xml->attributes( 'addpath' )) {
				$this->addElementPath( JPATH_ROOT . str_replace('/', DS, $dir) );
			}
		}
	}

	/**
	 * Bind data to the parameter
	 *
	 * @param	mixed	$data Array or Object
	 * @return	boolean	True if the data was successfully bound
	 * @access	public
	 * @since	1.5
	 */
	function bind($data, $group = '_default')
	{
		if ( is_array($data) ) {
			return $this->loadArray($data, $group);
		} elseif ( is_object($data) ) {
			return $this->loadObject($data, $group);
		} else {
			return $this->loadINI($data, $group);
		}
	}

	/**
	 * Render
	 *
	 * @access	public
	 * @param	string	The name of the control, or the default text area if a setup file is not found
	 * @return	string	HTML
	 * @since	1.5
	 */
	function render($name = 'params', $group = '_default')
	{
		if (!isset($this->_xml[$group])) {
			return false;
		}

		$params = $this->getParams($name, $group);
		$html = array ();
		$html[] = '<table width="100%" class="paramlist admintable" cellspacing="1">';

		if ($description = $this->_xml[$group]->attributes('description')) {
			// add the params description to the display
			$desc	= JText::_($description);
			$html[]	= '<tr><td class="paramlist_description" colspan="2">'.$desc.'</td></tr>';
		}

		foreach ($params as $param)
		{
			$html[] = '<tr>';

			if ($param[0]) {
				$html[] = '<td width="40%" class="paramlist_key"><span class="editlinktip">'.$param[0].'</span></td>';
				$html[] = '<td class="paramlist_value">'.$param[1].'</td>';
			} else {
				$html[] = '<td class="paramlist_value" colspan="2">'.$param[1].'</td>';
			}

			$html[] = '</tr>';
		}

		if (count($params) < 1) {
			$html[] = "<tr><td colspan=\"2\"><i>".JText::_('There are no Parameters for this item')."</i></td></tr>";
		}

		$html[] = '</table>';

		return implode("\n", $html);
	}

	/**
	 * Render all parameters to an array
	 *
	 * @access	public
	 * @param	string	The name of the control, or the default text area if a setup file is not found
	 * @return	array	Array of all parameters, each as array Any array of the label, the form element and the tooltip
	 * @since	1.5
	 */
	function renderToArray($name = 'params', $group = '_default')
	{
		if (!isset($this->_xml[$group])) {
			return false;
		}
		$results = array();
		foreach ($this->_xml[$group]->children() as $param)  {
			$result = $this->getParam($param, $name);
			$results[$result[5]] = $result;
		}
		return $results;
	}

	/**
	 * Return number of params to render
	 *
	 * @access	public
	 * @return	mixed	Boolean falst if no params exist or integer number of params that exist
	 * @since	1.5
	 */
	function getNumParams($group = '_default')
	{
		if (!isset($this->_xml[$group]) || !count($this->_xml[$group]->children())) {
			return false;
		} else {
			return count($this->_xml[$group]->children());
		}
	}

	/**
	 * Get the number of params in each group
	 *
	 * @access	public
	 * @return	array	Array of all group names as key and param count as value
	 * @since	1.5
	 */
	function getGroups()
	{
		if (!is_array($this->_xml)) {
			return false;
		}
		$results = array();
		foreach ($this->_xml as $name => $group)  {
			$results[$name] = $this->getNumParams($name);
		}
		return $results;
	}

	/**
	 * Render all parameters
	 *
	 * @access	public
	 * @param	string	The name of the control, or the default text area if a setup file is not found
	 * @return	array	Aarray of all parameters, each as array Any array of the label, the form element and the tooltip
	 * @since	1.5
	 */
	function getParams($name = 'params', $group = '_default')
	{
		if (!isset($this->_xml[$group])) {
			return false;
		}
		$results = array();
		foreach ($this->_xml[$group]->children() as $param)  {
			$results[] = $this->getParam($param, $name);
		}
		return $results;
	}

	/**
	 * Render a parameter type
	 *
	 * @param	object	A param tag node
	 * @param	string	The control name
	 * @return	array	Any array of the label, the form element and the tooltip
	 * @since	1.5
	 */
	function getParam(&$node, $control_name = 'params', $group = '_default')
	{
		//get the type of the parameter
		$type = $node->attributes('type');

		//remove any occurance of a mos_ prefix
		$type = str_replace('mos_', '', $type);

		$element =& $this->loadElement($type);

		// error happened
		if ($element === false)
		{
			$result = array();
			$result[0] = $node->attributes('name');
			$result[1] = JText::_('Element not defined for type').' = '.$type;
			$result[5] = $result[0];
			return $result;
		}

		//get value
		$value = $this->get($node->attributes('name'), $node->attributes('default'), $group);

		return $element->render($node, $value, $control_name);
	}

	/**
	 * Loads an xml setup file and parses it
	 *
	 * @access	public
	 * @param	string	path to xml setup file
	 * @return	object
	 * @since	1.5
	 */
	function loadSetupFile($path)
	{
		$result = false;

		if ($path)
		{
			$xml = & JFactory::getXMLParser('Simple');

			if ($xml->loadFile($path))
			{
				if ($params = & $xml->document->params) {
					foreach ($params as $param)
					{
						$this->setXML( $param );
						$result = true;
					}
				}
			}
		}
		else
		{
			$result = true;
		}

		return $result;
	}

	/**
	 * Loads a element type
	 *
	 * @access	public
	 * @param	string	elementType
	 * @return	object
	 * @since	1.5
	 */
	function &loadElement( $type, $new = false )
	{
		$false = false;
		$signature = md5( $type  );

		if( (isset( $this->_elements[$signature] ) && !is_a($this->_elements[$signature], '__PHP_Incomplete_Class'))  && $new === false ) {
			return	$this->_elements[$signature];
		}

		$elementClass	=	'JElement'.$type;
		if( !class_exists( $elementClass ) )
		{
			if( isset( $this->_elementPath ) ) {
				$dirs = $this->_elementPath;
			} else {
				$dirs = array();
			}

			$file = JFilterInput::clean(str_replace('_', DS, $type).'.php', 'path');

			jimport('joomla.filesystem.path');
			if ($elementFile = JPath::find($dirs, $file)) {
				include_once $elementFile;
			} else {
				return $false;
			}
		}

		if( !class_exists( $elementClass ) ) {
			return $false;
		}

		$this->_elements[$signature] = new $elementClass($this);

		return $this->_elements[$signature];
	}

	/**
	 * Add a directory where JParameter should search for element types
	 *
	 * You may either pass a string or an array of directories.
	 *
	 * JParameter will be searching for a element type in the same
	 * order you added them. If the parameter type cannot be found in
	 * the custom folders, it will look in
	 * JParameter/types.
	 *
	 * @access	public
	 * @param	string|array	directory or directories to search.
	 * @since	1.5
	 */
	function addElementPath( $path )
	{
		// just force path to array
		settype( $path, 'array' );

		// loop through the path directories
		foreach ( $path as $dir )
		{
			// no surrounding spaces allowed!
			$dir = trim( $dir );

			// add trailing separators as needed
			if ( substr( $dir, -1 ) != DIRECTORY_SEPARATOR ) {
				// directory
				$dir .= DIRECTORY_SEPARATOR;
			}

			// add to the top of the search dirs
			array_unshift( $this->_elementPath, $dir );
		}


          }
	/**
	 * TuiyoParameter::load()
	 * 
	 * @param mixed $data
	 * @param mixed $xmlFilePath
	 * @return
	 */
	public function load($key, $xmlFilePath = NULL)
	{
		$iniPath 	= TUIYO_CONFIG.DS.strtolower($key).".ini";
		$xmlFilePath= empty($xmlFilePath) ? TUIYO_CONFIG.DS.strtolower($key).".xml" : $xmlFilePath ;
		
		if (!file_exists($iniPath) || !is_file($xmlFilePath) ) {
			JError::raiserError(TUIYO_SERVER_ERROR, _('The required config element does not exists'));
			return false;
		}
		
		$content 	= file_get_contents( $iniPath );				 
		$params  	= new JParameter($content, $xmlFilePath);
		
		return $params;
	}
	
	/**
	 * TuiyoParameter::saveParams()
	 * 
	 * @param mixed $postParams
	 * @param mixed $key
	 * @param string $type
	 * @return
	 */
	public function saveParams( $postParams, $key, $type="system")
	{
		jimport('joomla.filesystem.file');
		jimport('joomla.client.helper');
		
		// Set FTP credentials, if given
		JClientHelper::setCredentialsFromRequest('ftp');
		
		$ftp 		= JClientHelper::getCredentials('ftp');	
		$file 		= TUIYO_CONFIG.DS.strtolower($key).".ini" ; 
	
		if(JFile::exists($file)){
			JFile::write($file);
		}
		
		if ( count( $postParams) )
		{
			$registry 	= new JRegistry();
			$registry->loadArray( $postParams );
			$iniTxt 	= $registry->toString();

			// Try to make the params file writeable
			if (!$ftp['enabled'] && JPath::isOwner($file) && !JPath::setPermissions($file, '0755')) {
				JError::raiseNotice('SOME_ERROR_CODE', _('Could not make the template parameter file writable'));
				return false;
			}
			
			//Write the file
			$return = JFile::write($file, $iniTxt );

			// Try to make the params file unwriteable
			if (!$ftp['enabled'] && JPath::isOwner($file) && !JPath::setPermissions($file, '0555')) {
				JError::raiseNotice('SOME_ERROR_CODE', _('Could not make the template parameter file unwritable'));
				return false;
			}

			if (!$return) {
				JError::raiseError(TUIYO_SERVER_ERROR, _("Could not save the template parameters"));
				return false;
			}
			
			return $return;
		}
		
	}
	
	public function saveUserParams()
	{}
	
	/**
	 * TuiyoParameter::renderHTML()
	 * 
	 * @param string $name
	 * @param string $group
	 * @return
	 */
	function renderHTML($name = 'params', $group = '_default')
	{
		if (!isset($this->_xml[$group])) {
			return false;
		}

		$params = $this->getParams($name, $group);
		$html = array ();
		$html[] = '<div class="paramlist admintable tuiyoTable">';

		if ($description = $this->_xml[$group]->attributes('description')) {
			// add the params description to the display
			$desc	= JText::_($description);
			$html[]	= '<div class="tuiyoTableRow"><div class="paramlist_description">'.$desc.'</div></div>';
		}

		foreach ($params as $param)
		{
			$html[] = '<div class="tuiyoTableRow" style="padding: 4px 0px">';

			if ($param[0]) {
				$html[] = '<div style="width: 35%" class="paramlist_key tuiyoTableCell">'.$param[0].'</div>';
				$html[] = '<div style="width: 65%" class="paramlist_value tuiyoTableCell">'.$param[1].'</div>';
			} else {
				$html[] = '<div class="paramlist_value tuiyoTableCell" style="width: 100%">'.$param[1].'</div>';
			}

			$html[] = '<div class="tuiyoClearFloat"></div>';
			$html[] = '</div>';
		}

		if (count($params) < 1) {
			$html[] = "<div class=\"TuiyoNoticeMsg\"><i>"._('There are no Parameters for this item')."</i></div>";
		}

		$html[] = '</div>';

		return implode("\n", $html);
	}
	
}