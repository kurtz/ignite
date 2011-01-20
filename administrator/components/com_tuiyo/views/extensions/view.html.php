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
defined('_JEXEC') || die('Restricted access');

jimport( 'joomla.application.component.view' );


/**
 * TuiyoViewTuiyo
 * 
 * @package Livingstone Workspace
 * @author Livingstone Fultang
 * @copyright 2009
 * @version $Id$
 * @access public
 */
class TuiyoViewExtensions extends JView
{
	

	/**
	 * TuiyoViewExtensions::showExtensions()
	 * Default Extension view page
	 * @return
	 */
	public function showExtensions(){
		
		$TMPL = $GLOBALS["API"]->get("document");
		$TMPL->IconPath = $iconPath;
		
		
		$tmplVars 		= array(
			"styleDir"	=>$livestyle,
			"livePath"	=>TUIYO_LIVE_PATH,
			"iconPath" 	=>TUIYO_LIVE_PATH.'/client/default/'
		);
		
		$tmplPath 		= JPATH_COMPONENT_ADMINISTRATOR.DS."views".DS."extensions".DS."tmpl" ;
		$tmplData 	    = $TMPL->parseTmpl("default" , $tmplPath , $tmplVars);
		
		return $tmplData;
	}	
	
	/**
	 * TuiyoViewExtensions::getApplicationList()
	 * Gets a list of all installed applications
	 * @param mixed $data
	 * @return
	 */
	public function getApplicationList( $data= array() ){
		
		global $API;
		
		$APP  			= TuiyoLoader::model("applications", true );	
		$TMPL 			= $API->get("document");
		$TMPL->IconPath = $iconPath;

		$tmplVars 		= array(
			"apps"		=>$APP->getAllSystemPlugins("services",true), 
			"styleDir"	=>$livestyle,
			"livePath"	=>TUIYO_LIVE_PATH,
			"iconPath" 	=>TUIYO_LIVE_PATH.'/client/default/'
		);
		
		$tmplPath 		= JPATH_COMPONENT_ADMINISTRATOR.DS."views".DS."extensions".DS."tmpl" ;
		$tmplData 	    = $TMPL->parseTmpl("list" , $tmplPath , $tmplVars);
		
		return $tmplData;	
		
	}
	
	public function display(){
		global $mainframe, $API;
		$action 	= JRequest::getVar("action",null);
		$document	= $API->get("document");
		$document->addJS( 'components/com_tuiyo/style/script/extensions.js' );
		switch(strtolower($action) ){
			case "lists":
				return $this->getApplicationList() ;
			break;
			case "events":
				return $this->eventsProfiler();
			break;
			case "editor":
				return $this->plugineditor();
			break;
			case "installer":
				$installer = JRoute::_(TUIYO_INDEX."&context=systemtools&do=autocenter", false);
				$mainframe->redirect( $installer );
			break;
			
		} 
		
	}
	
	public function eventsProfiler(){
		
		global $PLUGIN_GROUPS;
		
		$TMPL = $GLOBALS["API"]->get("document");
		$TMPL->IconPath = $iconPath;
		
		$tmplVars 		= array(
			"events"	=>$PLUGIN_GROUPS,
			"styleDir"	=>$livestyle,
			"livePath"	=>TUIYO_LIVE_PATH,
			"iconPath" 	=>TUIYO_LIVE_PATH.'/client/default/'
		);
		
		
		$tmplPath 		= JPATH_COMPONENT_ADMINISTRATOR.DS."views".DS."extensions".DS."tmpl" ;
		$tmplData 	    = $TMPL->parseTmpl("events" , $tmplPath , $tmplVars);
		
		return $tmplData;
	}
	
	
	/**
	 * TuiyoViewExtensions::appEditPage()
	 * Application editing page
	 * @param mixed $data
	 * @return void
	 */
	public function plugineditor( $data = null )
	{
		$TMPL = $GLOBALS["API"]->get("document");
		$APP  			= TuiyoLoader::model("applications", true );	
		$TMPL->IconPath = $iconPath;
		$plugin 		= JRequest::getString("plugin", "noplugin" );
		$file 			= JRequest::getString("file", null);
				
		$tmplVars 		= array(
			"plugins"	=>$APP->getAllSystemPlugins("services", true),  
			"styleDir"	=>$livestyle,
			"livePath"	=>TUIYO_LIVE_PATH,
			"iconPath" 	=>TUIYO_LIVE_PATH.'/client/default/'
		);
		
		//Import the Joomla Folder Library
		jimport('joomla.filesystem.folders');
		
		if(isset($plugin)){
			$dir = TUIYO_PLUGINS.DS.$plugin;
			if(is_dir( TUIYO_PLUGINS.DS.$plugin )){
				$tmplVars["pluginID"]	  = $plugin;
				$tmplVars["filelist"] = JFolder::files( $dir, ".", true , false , array(".gitinore",".cvs",".svn",".DS_Store"));
			}
			//Read the file
			if(!empty($file) && file_exists( $dir.DS.$file )){
				$tmplVars["filecontent"] = file_get_contents($dir.DS.$file);
			}
		}
		
		
		$tmplPath 		= JPATH_COMPONENT_ADMINISTRATOR.DS."views".DS."extensions".DS."tmpl" ;
		$tmplData 	    = $TMPL->parseTmpl("editor" , $tmplPath , $tmplVars);
		
		return $tmplData;	
	}
}