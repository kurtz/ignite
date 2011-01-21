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


jimport('joomla.application.component.controller');

/**
 * TuiyoControllerExtensions
 * 
 * @copyright 2009
 * @version $Id$
 * @access public
 */
class TuiyoControllerExtensions extends JController{
	
	var $docu 	= null;

	/**
	 * TuiyoControllerExtensions::__construct()
	 * Constructor
	 * @return
	 */
	public function __construct(){
		
		//Set the View Intricately
		if (!JRequest::getCmd( 'view') ) {
         	JRequest::setVar('view', 'extensions' );
      	}
      	$this->docu	=& JFactory::getDocument();
      	
      	//Construct parent;
		parent::__construct();
		
	}	

	/**
	 * TuiyoControllerExtensions::display()
	 * Default extension context display
	 * @return
	 */
	public function display(){
		
		$adminView 	= $this->getView("tuiyo" , "html");
		$extView 	= $this->getView("extensions" , "html" );
	
		/*Do Some Plugin Majical Stuff Here */	
		$plugins 	= $extView->showExtensions( );
		
		$adminView->display( $plugins );
		$this->docu->addScript( "components/com_tuiyo/style/script/extensions.js" ); 
		
		//Events?
	}
	

	/**
	 * TuiyoControllerExtensions::getWidgets()
	 * Ajax display all widgetes installed
	 * @return
	 */
	public function getWidgets(){
		
		$adminView 	= $this->getView("tuiyo" , "json");
		$extView 	= $this->getView("extensions" , "html" );

		/*Do Some Plugin Majical Stuff Here */
		$resp = array(
			"code" 	=> TUIYO_OK, 
			"error" => false, 
			"data" 	=> false,
			"extra"	=> false 
		);	
				
		$adminView->encode( $resp );
	}
	

	/**
	 * TuiyoControllerExtensions::getDesigns()
	 * Get all system designs via AJAX
	 * @return json
	 */
	public function getDesigns(){
		
		$adminView 	= $this->getView("tuiyo" , "json");
		$extView 	= $this->getView("extensions" , "html" );

		/*Do Some Plugin Majical Stuff Here */
		$resp = array(
			"code" 	=> TUIYO_OK, 
			"error" => false, 
			"data" 	=> false,
			"extra"	=> false 
		);	
				
		$adminView->encode( $resp );
	}
	
	public function extensionmgreditsave(){
		
		global $mainframe;
		
		$file 		= JRequest::getString("pfile" );
		$plugin 	= JRequest::getString("plugin");
		
		
		
		$redirect 	= JRoute::_(TUIYO_INDEX."&context=extensions&do=extensionmgr&action=editor",false);
		
		$mainframe->redirect($redirect);
	}
	
	public function runMacroScript(){
			
		$document 	= TuiyoAPI::get("document");							//Must be logged IN
		$raw   		= JRequest::setVar("tmpl", "component"); //Must be raw/
		$macro 		= JRequest::getString("i", null);
		ob_start();
		ob_flush();
		flush();
		
		if(!empty($macro)):			
			$macroObj 	= TuiyoLoader::macro( (string)$macro , true );
			if(is_object($macroObj)):	
				ob_flush();
				flush();
				$macroObj->run();
				ob_flush();
				flush();
			endif; 			
		endif ;
		ob_end_flush();
		jexit(0);
		
	}

	/**
	 * TuiyoControllerExtensions::getPlugins()
	 * Gets a list of all system plug-ins via AJAX
	 * @return json
	 */
	public function getPlugins(){
		
		$adminView 	= $this->getView("tuiyo" , "json");
		$extView 	= $this->getView("extensions" , "html" );

		/*Do Some Plugin Majical Stuff Here */
		$resp = array(
			"code" 	=> TUIYO_OK, 
			"error" => false, 
			"data" 	=> false,
			"extra"	=> false 
		);	
				
		$adminView->encode( $resp );
	}

	/**
	 * TuiyoControllerExtensions::getLanguages()
	 * Gets all installed Languages via ajax
	 * @return json
	 */
	public function getLanguages(){
		
		$adminView 	= $this->getView("tuiyo" , "json");
		$extView 	= $this->getView("extensions" , "html" );
		$resp = array(
			"code" 	=> TUIYO_OK, 
			"error" => false, 
			"data" 	=> false,
			"extra"	=> false 
		);	
				
		$adminView->encode( $resp );	
	}	
	

	/**
	 * TuiyoControllerExtensions::getApplications()
	 * Gets all installed applications via AJAX
	 * @return json
	 */
	public function getApplications(){
		
		$adminView 	= $this->getView("tuiyo" , "json");
		$extView 	= $this->getView("extensions" , "html" );
		$extModel	= $this->getModel("tuiyo" );
		
		$resp = array(
			"code" 	=> TUIYO_OK, 
			"error" => false, 
			"data" 	=> false,
			"extra"	=> false 
		);	
		
		/*Do Some Plugin Majical Stuff Here */
		$applications	= $extModel->getApplications();
		$resp["data"]	= $applications ;
		$resp["extra"] 	= $extView->getApplicationList( $applications );
		
		$adminView->encode( $resp );	
	}
	

	/**
	 * TuiyoControllerExtensions::doInstall()
	 * Installs an extension
	 * @return
	 */
	public function doInstall(){

		global $mainframe;
		
		$adminView 	= $this->getView("tuiyo" , "html");
		$extView 	= $this->getView("extensions" , "html" );
		$extPost 	= JRequest::get("post");
		$extFile 	= JRequest::get("files");
		$document   = TuiyoAPI::get("document");
		
		jimport('joomla.filesystem.file');
		jimport('joomla.filesystem.folder');
		jimport('joomla.filesystem.path');
		jimport('joomla.filesystem.archive');
		
		/*Do Some Plugin Majical Stuff Here and redirect back to install page */
		$redirect 	= JRoute::_(TUIYO_INDEX."&context=systemtools&do=autocenter", false);
		
		$this->setRedirect( $redirect );
		
		//STEP1: Upload the file
		$uploadedZIP = JPATH_CACHE.DS."upload".time().$extFile["pluginfile"]["name"];
		
		JFile::upload($extFile["pluginfile"]["tmp_name"], $uploadedZIP );
		
		//STEP2: Extract the archive
		$uploadedFolder = JPATH_CACHE.DS.JFile::stripExt( JFile::getName( $uploadedZIP ) );
	    
		if(!JArchive::extract($uploadedZIP, $uploadedFolder )){
			$document->enqueMessage( _("Failed to extract the extension archive"), "error");
			JFile::delete( $uploadedZIP );
			return $this->redirect();;
		}
		JFile::delete( $uploadedZIP );
		
		//STEP3: Find the PluginXML file and define the root!
		$pluginXML = JFolder::files($uploadedFolder, "plugin.xml", true , true );
		$pluginXMLFile = null;
		
		foreach($pluginXML as $tempXMLfile){
			if(file_exists($tempXMLfile) && JFile::getName($tempXMLfile)==="plugin.xml"){
				$pluginXMLFile = $tempXMLfile;
				break;
			}
		}
		
		if(empty($pluginXML)||empty($pluginXMLFile)){
			$document->enqueMessage( _("Could not find a valid plugin.xml definition in the uploaded package"), "error");
			JFile::delete( $uploadedFolder );
			return $this->redirect();;	
		}
		
		$pluginDir = str_replace("plugin.xml", "", $pluginXMLFile);
	    $xmlParser = &JFactory::getXMLParser('Simple');
		
	    if (!$xmlParser->loadFile($pluginXMLFile)) {
			$document->enqueMessage( _("Could not load the plugin.xml definition file in the uploaded package"), "error");
			JFile::delete( $uploadedFolder );
			return $this->redirect();
	    }
	    $root 		= &$xmlParser->document;
		$validTypes = array("plugin");
		$extType 	= $root->attributes('type');
		$extName	= $root->attributes("key");
		
	    if (!is_object($root) || !in_array($extType, $validTypes) || empty($extName)) {
			$document->enqueMessage( _("The uploaded package is not a valid extensionfile"), "error");
			JFile::delete( $uploadedFolder );
			unset($xmlParser);
			return $this->redirect();
	    }

		//STEP4: Move the files to the requested director;
		$moved 		= array();
		chmod(JPATH_CACHE, 0777);
		chmod(TUIYO_PLUGINS.DS, 0777);
		switch($extType):
			case "plugin":
				$destination = TUIYO_PLUGINS.DS.strtolower($extName);
			break;
		endswitch;
		
		$pluginFiles = JFolder::files( $pluginDir , "", true, true, array('.DS_Store','.svn', 'CVS'));

		foreach($pluginFiles as $k=>$pluginFile):
			$destFileName = $destination.str_replace( $pluginDir, "", $pluginFile);
			echo $destFileName."<br />";
			if(!JFile::copy($pluginFile, $destFileName) ):
				foreach($moved as $key=>$reverse):
					JFile::delete($reverse);
				endforeach;
				echo $pluginFile; die;
				$document->enqueMessage( _("Could not upload files"), "error");
				JFile::delete( $uploadedFolder );
				unset($xmlParser);
				return $this->redirect();
			endif;

			$moved[] = $destFileName;
		endforeach;
		
		//SETP5: CleanUP
		JFile::delete( $uploadedFolder );
		unset($xmlParser);
		chmod(TUIYO_PLUGINS.DS, 0755);
		
		$this->redirect();
	}
	
	public function extensionmgr(){
		
		$view 	= $this->getView("tuiyo", "html");
		$eView  = $this->getView("extensions", 'html');
		
		
		$tabgroup  = array( 
			"_ext" => array(
				_("Extensions") 			=> "&action=lists", //Determine which tab is active by comparing referers
				_("Events Profiler")		=> "&action=events",
				_("Extension Editor")			=> "&action=editor",
				_("Installer")			=> "&action=installer",
			 )
		);
		$view->addTabGroup( $tabgroup  );
		$page 	= $eView->display();
        $view->display($page, '_ext');
	}	
	
	/**
	 * TuiyoControllerExtensions::editApplication()
	 * Edits an application
	 * @return void
	 */
	public function editApplication(){
		
		$adminView 	= &$this->getView("tuiyo" , "html");
		$extView 	= &$this->getView("extensions" , "html" );
		$extModel 	= &$this->getModel("extensions");
		$appModel 	= &TuiyoLoader::model("applications" , true );
		$aName 		= JRequest::getVar('a', null );
		$childDo 	= Jrequest::getVar('childDo', null );
		
		
		$aName 		= (!empty($aName)) ? strval(strtolower($aName)) 
					: JError::raiseError(TUIYO_SERVER_ERROR, 'unspecified application');
		
		$pData 		= array(
			"params"=>	"",
			"data"	=> 	$appModel->getSingleApplication( $aName )
		); 					
		
  		$pageView	= $extView->appEditpage(  $pData );

        $adminView->display( $pageView );
        $this->docu->addScript("components/com_tuiyo/style/script/applications.js");
		
	}	

}