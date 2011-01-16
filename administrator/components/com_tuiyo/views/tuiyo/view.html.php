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
 * @copyright 2009
 * @version $Id$
 * @access public
 */
class TuiyoViewTuiyo extends JView
{
	var $menu 		= array();
	var $tabgroup	= "_default";
	var $tabgroups  = array();
	var $tabactive  = null;

	/**
	 * TuiyoViewTuiyo::categoryManager
	 * Default function to display the category manager
	 * @param mixed $tpl
	 * @return html
	 */
	public function categoryManager($tpl=null){
		
		$TMPL 	= 	$GLOBALS["API"]->get("document");
		$MODEL 	=	TuiyoLoader::model("categories", true);	
		$USER	= 	TuiyoAPI::get("user");
		$ACTION = 	JRequest::getVar("action",null);
		$ACL 	=   JFactory::getACL();
	
		//Get the Categories		
		$gtree 	= $ACL->get_group_children_tree( null, 'USERS', false );
		$aroGrps= JHTML::_('select.genericlist',   $gtree, 'gid', 'class="TuiyoFormDropDown"', 'value', 'text' );
			
		$tmplVars 		= array(
			"styleDir"	=>$livestyle,
			"livePath"	=>TUIYO_LIVE_PATH,
			"iconPath" 	=>TUIYO_LIVE_PATH.'/client/default/',
			"user"		=>JFactory::getUser(),
			"nodes"		=>$MODEL->getCategories(),
			"arogrps"	=>$aroGrps
		);
		
		switch($ACTION){
			case "create":
				$tmplfile = "createcategory";
			break;
			case "attributes":
				return "attributes";
			break;
			case "statistics";
				return "Statistics";
			break;
			case "list":
			default:
				$tmplfile = "categories";
			break;
		}
	
		$tmplPath 		= JPATH_COMPONENT_ADMINISTRATOR.DS."views".DS."tuiyo".DS."tmpl" ;
		$tmplData 	    = $TMPL->parseTmpl($tmplfile, $tmplPath , $tmplVars);
		
		
		return $tmplData;		
		
	}
	
	public function generatePageTabs(){
		
		$tablists = (isset($this->tabgroups[$this->tabgroup])) ?$this->tabgroups[$this->tabgroup]:$this->tabgroups['_default'];
		
		foreach($tablists as $tab=>$href){
			echo('<li><a href="'.$href.'">'.$tab.'</a></li>');
		}
	}
	
	public function addTabGroup( $group ){
		//get the refferer
		$ref = JRequest::getURI();
		$act = JRequest::getVar("action", null);
		$ctx = JRequest::getVar("context", null);
		$do  = JRequest::getVar("do", null);

		foreach($group as $groupi=>$groupj){
			foreach($groupj as $title=>$href){
				$url = TUIYO_INDEX ;
				$url.= !empty($ctx)?"&context=".$ctx : null ;
				$url.= !empty($do)?"&do=".$do : null ;
				$group[$groupi][$title] = $url.$href;
			}
		}
		$this->tabgroups = array_merge( (array)$group , $this->tabgroups);
	}
	
	public function getMenu(){
		
		$TMPL = $GLOBALS["API"]->get("document");
		$TMPL->IconPath = $iconPath;
		
		$tmplVars 		= array(
			"styleDir"	=>$livestyle,
			"livePath"	=>TUIYO_LIVE_PATH,
			"iconPath" 	=>TUIYO_LIVE_PATH.'/client/default/',
			"user"		=>JFactory::getUser()
		);
		$tmplPath 		= JPATH_COMPONENT_ADMINISTRATOR.DS."views".DS."tuiyo".DS."tmpl" ;
		$tmplData 	    = $TMPL->parseTmpl("menu" , $tmplPath , $tmplVars);
		
		return $tmplData;
	}
	
	
	/**
	 * TuiyoViewTuiyo::display()
	 * Default welcome page for admin view
	 * @param mixed $tpl
	 * @return
	 */
	public function display( $tpl = null , $tabgroup = "", $tabactive="")
	{

		$TMPL 		=   $GLOBALS['API']->get( 'document' );
		$USER		= 	$GLOBALS['API']->get('user', null);
		$DOCU 		=   JFactory::getDocument();
		$MODEL 		= 	TuiyoLoader::model('applications', true );
		$APPS		=   $MODEL->getApplicationExtendedList();
		
		$defaultTabGroup  = array( 
			"_default" => array(
				_("Welcome") => "&action=welcome", //Determine which tab is active by comparing referers
				_("QuickTools")=> "&action=controlpanel",
				_("News & Updates")=> "&action=rss",
				_("Statistics & Logs")=> "&action=logs",
			 )
		);
		
		$this->addTabGroup( $defaultTabGroup );
		$this->tabgroup  = $tabgroup;
		$this->tabactive = $tabactive;
		
		
		$DOCU->addStyleSheet('components/com_tuiyo/style/css/common.css' );
		$DOCU->addScript( 'components/com_tuiyo/style/script/global.js' );
		$DOCU->addScript( TUIYO_OEMBED );
		$DOCU->addScript( TUIYO_STREAM );
		
		$version 		= TuiyoLoader::helper("version");		
		$document 		= $GLOBALS['API']->get("document");
		
		if(!is_a($version, 'TuiyoVersion')){
			$version 	=& new TuiyoVersion() ;
		}
		$longVersion	= $version->getLongVersion();
		
		$plugins		= $MODEL->getAllSystemPlugins("services", false); 
		
		$tmplPath2 		= TUIYO_VIEWS.DS."profile".DS."tmpl" ;
		$tmplVars2 		= array(
			"styleDir"	=>TUIYO_STYLEDIR,
			"user"		=>$USER,
			"sharewith" =>array("p00"=>"@everyone"),
		    "plugins"   => $plugins,
			"canPost"	=> 0 			
		);
		$activity 		= $TMPL->parseTmpl("activity" , $tmplPath2 , $tmplVars2);
		

		$tmplVars 		= array(
			"apps"		=>$APPS,
			"activity"	=>$activity,
			"styleDir"	=>$livestyle,
			"user"		=>$USER,
			"livePath"	=>TUIYO_LIVE_PATH,
			"iconPath" 	=>TUIYO_LIVE_PATH.'/client/default/',
			"view"		=> $this
		);		
		
		$tmplVars["version"]	=	$longVersion;
		
		$tmplPath 		= JPATH_COMPONENT_ADMINISTRATOR.DS."views".DS."tuiyo".DS."tmpl" ;
		$tplData		= (!is_null($tpl)) ? $tpl : $TMPL->parseTmpl( "default", $tmplPath, $tmplVars );
		
		$tmplVars["adminPage"]	=	$tplData;
		
		$content 	    = $TMPL->parseTmpl("admin" , $tmplPath , $tmplVars);
		
		$header = $DOCU->getHeadData();
		
		reset($header['styleSheets']);
		
		foreach ($header['styleSheets'] as $css=>$attr) {
		    if (strpos($css,'general.css') ) {
		        unset($header['styleSheets'][$css]);
		    }
		}

		$DOCU->setHeadData($header);
		
		echo $content;
		
		
	}
	
	/**
	 * TuiyoViewTuiyo::showStatsWindow()
	 * Gets google analytics statistics + tuiyo stats
	 * @param mixed $data
	 * @return
	 */
	public function showStatsWindow( $data ){
		
		$TMPL = $GLOBALS["API"]->get("document");
		$TMPL->IconPath = $iconPath;
		
		//Google Analytics stats
		$GAPI = TuiyoLoader::loadAPI( );
		
		
		
		$tmplVars 		= array(
			"styleDir"	=>$livestyle,
			"livePath"	=>TUIYO_LIVE_PATH,
			"iconPath" 	=>TUIYO_LIVE_PATH.'/client/default/',
			"user"		=>JFactory::getUser()
		);
		$tmplPath 		= JPATH_COMPONENT_ADMINISTRATOR.DS."views".DS."tuiyo".DS."tmpl" ;
		$tmplData 	    = $TMPL->parseTmpl("statistics" , $tmplPath , $tmplVars);
		
		return $tmplData;
	}
	
	/**
	 * TuiyoViewTuiyo::showFieldsManager()
	 * Shows a custom fields manager
	 * @param mixed $data
	 * @return
	 */
	public function showFieldsManager( $data = null ){
			
		$TMPL = $GLOBALS["API"]->get("document");
		$TMPL->IconPath = $iconPath;
		$action = JRequest::getVar("action", null);
		
		
		switch($action):
			case "view":
				return "preview the fields output";
			break;
			case "create":
				return "create a new profile fields";
			break;
		endswitch;
		
		//Google Analytics stats
		$GAPI = TuiyoLoader::loadAPI( );
		
		$tmplVars 		= array(
			"styleDir"	=>$livestyle,
			"livePath"	=>TUIYO_LIVE_PATH,
			"iconPath" 	=>TUIYO_LIVE_PATH.'/client/default/',
			"user"		=>JFactory::getUser()
		);
		$tmplPath 		= JPATH_COMPONENT_ADMINISTRATOR.DS."views".DS."tuiyo".DS."tmpl" ;
		$tmplData 	    = $TMPL->parseTmpl("customfields" , $tmplPath , $tmplVars);
		
		return $tmplData;
		
	}

	/**
	 * TuiyoViewTuiyo::showBugReportForm()
	 * Bug reporting form
	 * @param mixed $data
	 * @return html
	 */
	public function showBugReportForm( $data  = null){
		
		$TMPL = $GLOBALS["API"]->get("document");
		$TMPL->IconPath = $iconPath;
		
		
		$tmplVars 		= array(
			"styleDir"	=>$livestyle,
			"livePath"	=>TUIYO_LIVE_PATH,
			"iconPath" 	=>TUIYO_LIVE_PATH.'/client/default/',
			"user"		=>JFactory::getUser()
		);
		$tmplPath 		= JPATH_COMPONENT_ADMINISTRATOR.DS."views".DS."tuiyo".DS."tmpl" ;
		$tmplData 	    = $TMPL->parseTmpl("bugreport" , $tmplPath , $tmplVars);
		
		return $tmplData;
	}
	
	/**
	 * TuiyoViewTuiyo::showAutoCenter()
	 * Automation center view
	 * @param mixed $data
	 * @return
	 */
	public function showAutoCenter( $macro = null){
		
		$TMPL = $GLOBALS["API"]->get("document");
		$TMPL->IconPath = $iconPath;	
		$action = JRequest::getVar("action", null);
        /** Do something majical **/
		switch($action){
			case "discover":
				return "discover plugins";
			break;
			case "updater":
				return "update plugins";
			break;
			case "updater":
				return "Updater Page";
			break;
		}		
		
		$tmplVars 		= array(
			"styleDir"	=>$livestyle,
			"livePath"	=>TUIYO_LIVE_PATH,
			"iconPath" 	=>TUIYO_LIVE_PATH.'/client/default/',
			"user"		=>JFactory::getUser()
		);		
		
		if(!empty($macro)):			
			$macroObj 	= TuiyoLoader::macro( (string)$macro , true );
			if(is_object($macroObj)):	
				$tmplVars["macro"] = $macroObj;
			endif; 			
		endif ;
		
		$tmplPath 		= JPATH_COMPONENT_ADMINISTRATOR.DS."views".DS."tuiyo".DS."tmpl" ;
		$tmplData 	    = $TMPL->parseTmpl("automation" , $tmplPath , $tmplVars);
		
		return $tmplData;
	}
	
	
	/**
	 * TuiyoViewTuiyo::showConfigWindow()
	 * Global Configuration elements view
	 * @param mixed $data
	 * @return html
	 */
	public function showConfigWindow( $data = null ){
		
		$TMPL = $GLOBALS["API"]->get("document");
		$TMPL->IconPath = $iconPath;
		
		$action = JRequest::getVar("action" , null);
		
		$tmplVars 		= array(
			"styleDir"	=>$livestyle,
			"livePath"	=>TUIYO_LIVE_PATH,
			"iconPath" 	=>TUIYO_LIVE_PATH.'/client/default/',
			"user"		=>JFactory::getUser(),
			"apps"		=>$data["APPS"],
			"e"			=>$data["params"]
		);
		$tmplPath 		= JPATH_COMPONENT_ADMINISTRATOR.DS."views".DS."tuiyo".DS."tmpl" ;
		$tmplFile    	= "config";	 
		//Switch;
		switch($action){
			case "utilities":
				return "utitilities page";
			break;
			case "info":
				return $this->showSystemParams();
			break;
			case "global":
			default:
				//Import the Joomla Folder Library
				jimport('joomla.filesystem.folders');
				jimport('joomla.filesystem.file');

				//Import the Tuiyo Alias of JParameter
				TuiyoLoader::helper("parameter");
				$tmplFile = "config";
				
				$configsXML = array("global.xml");
				$sections   = array();
				$appModel   = TuiyoLoader::model("applications", true);
				
				foreach($configsXML as $element){
					$section 	= array();
					$iniFile 	= JFile::stripExt($element);
					$iniParams 	= JFile::read( TUIYO_CONFIG.DS.$iniFile.".ini" );
					if(!$iniParams){
						$iniParams = "";
					}
					$section["title"] = ucfirst($iniFile);
					$section["params"] = new TuiyoParameter($iniParams, TUIYO_CONFIG.DS.$element);
					$sections[] = $section;
				}
				$tmplVars["elements"] = $sections;
				$tmplVars["plugins"]  = $appModel->getAllSystemPlugins(services , true );
			break;
		}
		
		$tmplData 	    = $TMPL->parseTmpl($tmplFile , $tmplPath , $tmplVars);
		
		return $tmplData;
		
	}
	
	public function showSystemParams(){
		
		$TMPL = $GLOBALS["API"]->get("document");
		$TMPL->IconPath = $iconPath;
		
		$tmplVars 		= array(
			"styleDir"	=>$livestyle,
			"livePath"	=>TUIYO_LIVE_PATH,
			"iconPath" 	=>TUIYO_LIVE_PATH.'/client/default/',
			"user"		=>JFactory::getUser(),
			"apps"		=>$data["APPS"] ,
			"e"			=>$this->e 
		);
		$tmplPath 		= JPATH_COMPONENT_ADMINISTRATOR.DS."views".DS."tuiyo".DS."tmpl" ;
		$tmplData 	    = $TMPL->parseTmpl("information" , $tmplPath , $tmplVars);
		
		return $tmplData;
	}
	
	/**
	 * TuiyoViewTuiyo::showSystemEmailForm()
	 * Shows a form to edit system emails
	 * @param mixed $data
	 * @return html
	 */
	public function showSystemEmailForm($data = null){

		$TMPL = $GLOBALS["API"]->get("document");
		$TMPL->IconPath = $iconPath;
		$action  = JRequest::getVar("action", null);
		
		switch($action){
			case "template":
			break;
			case "create":
				return "create mass emailer";
			break;
			case "reports":
				return "mass email report";
			break;
		}
		
		$tmplVars 		= array(
			"styleDir"	=>$livestyle,
			"livePath"	=>TUIYO_LIVE_PATH,
			"iconPath" 	=>TUIYO_LIVE_PATH.'/client/default/',
			"user"		=>JFactory::getUser(),
			"apps"		=>$data["APPS"] ,
			"e"			=>$this->e 
		);
		$tmplPath 		= JPATH_COMPONENT_ADMINISTRATOR.DS."views".DS."tuiyo".DS."tmpl" ;
		$tmplData 	    = $TMPL->parseTmpl("emails" , $tmplPath , $tmplVars);
		
		return $tmplData;		
		
	}	
}