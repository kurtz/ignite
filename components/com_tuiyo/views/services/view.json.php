<?php
/**
 * ******************************************************************
 * TUIYO SERVICES VIEW                                          *
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
defined('_JEXEC') || die('Restricted access');

/**
 * Joomla component view
 */
jimport( 'joomla.application.component.view');

$doc 	= JFactory::getDocument();
$doc->setMimeEncoding("application/json");

/**
 * 
 * @package tuiyo
 * @author Livingstone Fultang
 * @copyright 2009
 * @version $Id$
 * @access public
 */
class TuiyoViewServices extends JView
{	
	public function __construct(){
		
		parent::__construct();
		
		$service = JRequest::getString("service");
		
		if(!empty($service)){  //if we know what service add search paths
			
			$serviceDir 	= TUIYO_PLUGINS.DS.strtolower( $service ).DS ;
			$this->serviceViewDir = $serviceDir.'views'.DS ;
			$serviceTmplDir = $serviceDir.'views'.DS.$service.DS.'tmpl'.DS;
			
			$this->addTemplatePath( $serviceDir );
	    	$this->addTemplatePath( $serviceTmplDir );
		}
    	
	}
	
	/**
	 * @param mixed $data
	 * @return void
	 */
	public function encode($data){
		echo json_encode( $data );
	}
}
