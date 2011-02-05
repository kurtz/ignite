<?php
/**
 * ******************************************************************
 * Profile View                                                     *
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
 * TuiyoViewProfile
 * @package Tuiyo For Joomla
 * @author Livingstone Fultang
 * @copyright 2009
 * @version $Id$
 * @access public
 */
class TuiyoViewProfile extends JView
{
	
	public function uploader(){
		
		$document 	= $GLOBALS['API']->get("document");
		
		$tmplPath 		= TUIYO_VIEWS.DS."profile".DS."tmpl" ;
		$tmplVars 		= array(
			"styleDir"	=>	$livestyle,
			"livePath"	=>	TUIYO_LIVE_PATH,
			"users"		=>  $this->user
		);
		$uploadForm =  $document->parseTmpl("uploader" , $tmplPath , $tmplVars);
		
		echo $uploadForm;
		
	}
	/**
	 * TuiyoViewProfile::display()
	 * @param mixed $tpl
	 * @return void
	 */
	public function homepage($tpl = null )
	{
		$model 		= TuiyoLoader::model("applications", true );
		$nModel		= TuiyoLoader::model("notifications", true );
		$pModel		= TuiyoLoader::model("profile", true );
		
		$document 	= $GLOBALS['API']->get("document");
		$user		= $GLOBALS['API']->get('user', empty($profileID) ? null : (int)$profileID  );
		
		//$document->enqueMessage( "This is a sample Message" , "notice" );		
		$livestyle 	= TUIYO_LIVE_PATH.'/client/default/';
		$document->addCSS( TUIYO_LIVE_PATH.'/client/default/css/homepage.css' );

		$document->addJS( TUIYO_LIVE_PATH.'/client/default/script/homepage.js' );
		
		$document->addJS( TUIYO_STREAM );
		$document->addJS( TUIYO_OEMBED );
		
		//If guest profile?
		if($user->joomla->get('guest')){	
			$redirect = JRoute::_(TUIYO_INDEX."&amp;view=welcome");
			$GLOBALS['mainframe']->redirect( $redirect );
		}	
		//Who has viewed my Profile
		$uPlugins		= $model->getAllUserPlugins($user->id , "services", false );
		
		//Get the HTML
		$tmplPath 		= TUIYO_VIEWS.DS."profile".DS."tmpl" ;
		$tmplVars 		= array(
			"user"		=>  $user,
			"styleDir"	=>	$livestyle,
			"livePath"	=>	TUIYO_LIVE_PATH,
			"lastVisted"=>	TuiyoTimer::diff( strtotime($user->joomla->lastvisitDate) ),
			"countViews"=> 	NULL,
			"lastUsed"	=>  (array)$model->getRecentlyUsed( $user->id , 8 ),
			"notices"	=>  $nModel->getAllNotifications( $user->id ),
			"pages"		=>  $nModel->getState( 'pagination' ),
			"plugins"	=>	$uPlugins,
			"visitors"	=>  $pModel->getProfileRecentVisitors( $user->id )
		);
		//Get Timeline 2.0
		
		$plugins		= $model->getAllSystemPlugins("services", false); 
		

		$tplVars2 		= array(
			"styleDir"	=>TUIYO_STYLEDIR,
			"user"		=>$user,
			"sharewith" =>array("p00"=>"@everyone"),
			"plugins" 	=>$plugins,
			"canPost"	=>(!$user->joomla->get('guest') ) ? 1 : 0 			
		);
		$activity 		= $document->parseTmpl("activity" , $tmplPath , $tplVars2);
		
		$content 	    = $document->parseTmpl("dashboard" , $tmplPath , $tmplVars);
		
		$this->assignRef('activity', $activity );
		$this->assignRef('livestyle', $livestyle );
		$this->assignRef("content" , $content);
		
		parent::setLayoutExt('tpl');
		parent::display($tpl);
	}
	
	/**
	 * TuiyoViewProfile::displayMembersList()
	 * Displays community Member lists;
	 * @param mixed $members
	 * @return void
	 */
	public function displayMembersList( $members ){
		
		$docu 		= TuiyoAPI::get('document');
		$livestyle 	= TUIYO_LIVE_PATH.'/client/default/';
		
		$docu->addCSS( TUIYO_LIVE_PATH.'/client/default/css/profilepage.css' );
		
		$this->assignRef( "members", $members );
		$this->assignRef( "livestyle", $livestyle );
		$this->setLayout( "memberslist" );
		$this->setLayoutExt( "tpl" );
		
		parent::display($tpl);
	}
	
	/**
	 * TuiyoViewProfile::display()
	 * Displays the default profile page
	 * @param mixed $tpl
	 * @param mixed $profileID
	 * @param mixed $privacy
	 * @return void
	 */
	public function display($tpl=null, $profileID = NULL , $privacy = NULL ){
	
		$tdoc 		= TuiyoAPI::get("document");
		$params 	= TuiyoApi::get("params");
		
		$model 		= TuiyoLoader::model("applications", true );
		$gModel 	= TuiyoLoader::model("groups" , true );
		$pModel 	= TuiyoLoader::model("photos", true );
		$sModel 	= TuiyoLoader::model("statistics", true );
		$tModel	 	= TuiyoLoader::model("timeline" , true );		
		
		$bc   		= $GLOBALS['mainframe']->getPathway();
		$tdoc->setPageTitle( sprintf(  _("%s | Profile"), $this->thatuser->name ) );
		
		$bc->addItem( $this->thatuser->name );
		
		$livestyle 	= TUIYO_LIVE_PATH.'/client/default/';
		
		$tPath 		= TUIYO_VIEWS.DS."profile".DS."tmpl".DS; 
		$tFile 		= "information";
		
		$socialApps = $model->getAllUserApplications( (int)$this->thatuser->id );
		$tInfoVars 		= array(
			"user"		=> $this->thatuser,
			"contact"	=> $this->thatuser->getUserContact(),
			"social"	=> $this->thatuser->getUserSocialBook(),
			"privacy"	=> $this->privacy,
			"rating" 	=> $this->thatuser->getUserRating(),
			"styleDir"	=> $livestyle,
		 );
		
		$information= $tdoc->parseTmpl( $tFile , $tPath , $tInfoVars );
		$groups		= $gModel->getUserGroups( $this->thatuser->id );
		$albums		= $pModel->getAlbums( $this->thatuser->id, "profile", NULL, TRUE, TRUE );
		$statistics = $sModel->getUserStatistics( $this->thatuser->id );
		$laststatus = $tModel->getLastestUserStatus( $this->thatuser->id , $this->thisuser->id );
		
		//Get the HTML
		$sharingWith 	= array("p00"=>"@everyone" );
		
		if($this->thatuser->id <> $this->thisuser->id){
			$sharingWith= array( 
				"p".$this->thatuser->id => $this->thatuser->name." (".$this->thatuser->username.")" 
			);
		}
		
		$plugins	= $model->getAllUserPlugins( $this->thatuser->id, "services", false); 
		
		//print_R($plugins);
		
		$tmplPath 		= TUIYO_VIEWS.DS."profile".DS."tmpl" ;
		$tmplVars 		= array(
			"styleDir"	=>TUIYO_STYLEDIR,
			"user"		=>$this->thisuser,
			"sharewith" =>$sharingWith,
		    "plugins"   => $plugins,
			"canPost"	=>(!$this->thisuser->joomla->get('guest') ) ? 1: 0 
		);
		$activity 		= $tdoc->parseTmpl("activity" , $tmplPath , $tmplVars);
		
		
		$tdoc->addCSS( TUIYO_LIVE_PATH.'/client/default/css/profilepage.css' );
		$tdoc->addJS( TUIYO_JS.'/includes/jqueryui/effects.core.js' );
		$tdoc->addJS( TUIYO_JS.'/includes/jqueryui/effects.slide.js' );
		$tdoc->addJS( TUIYO_JS.'/includes/jqueryui/ui.core.js' );
		$tdoc->addJS( TUIYO_JS.'/includes/jqueryui/ui.stars.min.js' );
		$tdoc->addJS( TUIYO_LIVE_PATH.'/client/default/script/profile.js' );
		$tdoc->addJS( TUIYO_OEMBED );
		$tdoc->addJS( TUIYO_STREAM );
		
		$this->assignRef( "rating" , $tInfoVars["rating"] );
		$this->assignRef('information', $information );
		$this->assignRef('rawinformation' , $tInfoVars );
		$this->assignRef('laststatus' , $laststatus );
		$this->assignRef('externalapps' , $socialApps );
		$this->assignRef('livestyle', $livestyle );
		$this->assignRef("activity" , $activity  );
		$this->assignRef("groups" , $groups );
		$this->assignRef("photoalbums", $albums );
		$this->assignRef("statistics", $statistics );
		
		$this->setLayoutExt('tpl');

		parent::display( $tpl );
		
		$rssLink = JRoute::_(TUIYO_INDEX.'&amp;view=profile&amp;do=getFeed&amp;format=feed&amp;pid='.$this->thatuser->id );
		$attribs = JArrayHelper::toString(array( 
			"type"	=>"application/rss+xml",
			"rel"	=>"alternate",
			"title" =>"RSS 2.0 {$this->thatuser->name} updates",
			"href"	=>$rssLink 
		));
		$generatedTag = '<link '.$attribs.' />';
		//Trigger after profileDraw Events
	
		$tdoc->addCustomHeadTag( $generatedTag );
		$GLOBALS["events"]->trigger( "onAfterProfileDraw" );
	}
	
	/**
	 * 
	 * Settings View ...
	 * @param $tpl
	 */
	public function settings( $tpl=null ){
		
		/**
		 * joomla File management libraries
		 */
		jimport('joomla.filesystem.file');
		jimport('joomla.filesystem.folder');
		jimport('joomla.filesystem.path');
		
		$document = $GLOBALS['API']->get('document', null);
		
		$GLOBALS['mainframe']->getPathway()->addItem( $this->user->name . ' - Settings' );
		$document->setPageTitle( sprintf(  _("%s | Configuration Page"), $this->user->name ) );
		
		$document->addJS( TUIYO_LIVE_PATH.'/client/default/script/settings.js' );
		
		$document->addCSS( TUIYO_JS.'/includes/jqueryui/smoothness/ui.smoothness.css'  );
		$document->addJS( TUIYO_JS.'/includes/jqueryui/ui.core.js' );
		//$document->addJS( TUIYO_JS.'/includes/jqueryui/ui.stars.min.js' );
		
		$this->setLayoutExt('tpl');
		$this->setLayout('settings');
		$this->assignRef("settingsVars" , $settings  );
		
		parent::display($tpl);
	}
	
	public function filemanager( $tpl ){
		
                    $document = $GLOBALS['API']->get('document', null);
              
		$GLOBALS['mainframe']->getPathway()->addItem( $this->user->name . ' - File Manager' );
		$document->setPageTitle( sprintf(  _("%s | File Manager"), $this->user->name ) );
		
		$this->setLayoutExt('tpl');
		$this->setLayout('filemanager');
		
		parent::display($tpl);
		
	}
	
}