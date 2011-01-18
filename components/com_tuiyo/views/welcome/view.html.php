<?php
/**
 * ******************************************************************
 * Welcome view for Tuiyo application                               *
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
 * TuiyoViewWelcome
 * 
 * @package   
 * @author tuiyo
 * @copyright Livingstone Fultang
 * @version 2009
 * @access public
 */
class TuiyoViewWelcome extends JView
{
	/**
	 * TuiyoViewWelcome::display()
	 * 
	 * @param mixed $tpl
	 * @return void
	 */
	public function display($tpl = null)
	{
		global $mainframe;
		
		$docu  		= $GLOBALS['API']->get('document' , null);
		$bc   		= &$mainframe->getPathway();
		$rModel 	= TuiyoLoader::model("resources" , true );
		$plugModel  = TuiyoLoader::model("applications", true );
		$gModel		= TuiyoLoader::model("groups", true);
		$aModel 	= TuiyoLoader::model("articles", true);
		
		$docu->addCSS(TUIYO_LIVE_PATH.'/client/default/css/welcomepage.css');
		$docu->addJS(TUIYO_LIVE_PATH.'/client/default/script/welcomepage.js' );
		$docu->addJS( TUIYO_OEMBED );
		$docu->addJS( TUIYO_STREAM );
		
		$bc->addItem( _('Welcome Lobby') , TUIYO_INDEX.'&view=welcome' );
		
		$tdoc 			= $docu ;
		$user			= TuiyoAPI::get("user");
		$onlineMembers 	= $rModel->getOnlineUsers( );
		$newestMembers  = $rModel->getNewestUsers();
		$popularGroups  = $gModel->getPopularGroups();
		$allarticles	= $aModel->getArticlesStream();
		
		//@TODO replace with getAllSystemPlugins
		$plugins	= $plugModel->getAllSystemPlugins("services", false); 
		
		$tmplPath 		= TUIYO_VIEWS.DS."profile".DS."tmpl" ;
		$tmplVars 		= array(
			"styleDir"	=>TUIYO_STYLEDIR,
			"user"		=>$user,
			"sharewith" =>array("p00"=>"@everyone"),
		    "plugins"   => $plugins,
			"canPost"	=>(!$user->joomla->get('guest') ) ? 1 : 0 			
		);
		$activity 		= $tdoc->parseTmpl("activity" , $tmplPath , $tmplVars);
		
		//Check for the existence of a gravatar		
		TuiyoLoader::helper("parameter");
		
		$sysCfg			= TuiyoParameter::load("global");
	
		$this->assignRef("user", $user);
		$this->assignRef("settings" , $sysCfg );	
		$this->assignRef("allarticles", $allarticles);	
		$this->assignRef("activity", $activity );
		$this->assignRef("onlinefriends" , $onlineMembers );
		$this->assignRef("newestmembers", $newestMembers);
		$this->assignRef("populargroups", $popularGroups);
		
		parent::display($tpl);
	}
	
	/**
	 * TuiyoViewWelcome::showAuthPage()
	 * Shows the Welcome authentication page
	 * @param mixed $inviteeName
	 * @param mixed $inviteCode
	 * @return void
	 */
	public function showAuthPage()
	{
		$tmpl 	= $GLOBALS['API']->get( "document" );
		$params	= $GLOBALS['API']->get("params" );
		$user 	= $GLOBALS['API']->get('user'); 
		$joomla = $GLOBALS['mainframe'] ;
		
		$stylePt= TUIYO_LIVE_PATH.'/client/default/' ;
		$tmplPt = TUIYO_VIEWS.DS.'welcome'.DS.'tmpl'.DS ;
		
		$uConfig= &JComponentHelper::getParams( 'com_users' );
		
		//Load Tuiyo System Params
		$params->loadParams("system.global");
		
		//Allow registration or invite?
		$enableReg = (bool)$params->get("siteAllowRegistration", FALSE );
		
		if (!$uConfig->get( 'allowUserRegistration' )) {
			if($enableReg){
				$reqInvite = TRUE ; 
				$tmpl->enqueMessage( _("Registration is by invite ONLY", "notice" ) );
				$this->assignRef( "requireInvite" , $reqInvite );
			}else{
				$tmpl->enqueMessage( _("New registrations are currently disabled"), "error");
			}
		}
		
		$this->assignRef( 	"allowRegistration", $enableReg );
		$this->assignRef(	"user"	,  $user);
		$this->assignRef(	"style"	,  $stylePt );
		
		$joomla->setPageTitle(  _("Welcome | Authentication" ) );
		
		$tmpl->addCSS(TUIYO_LIVE_PATH.'/client/default/css/loginpage.css');
		$tmpl->addJS(TUIYO_LIVE_PATH.'/client/default/script/loginpage.js' );
		
		parent::setLayout('authentication');
		parent::setLayoutExt('tpl');
		parent::display( $authP );
	}
	
	
	/**
	 * TuiyoViewWelcome::showSetup()
	 * 
	 * @param mixed $user
	 * @return void
	 */
	public function showSetup( $user = null )
	{	
		$tmpl		= $GLOBALS['API']->get( "document" ) ;
		$livestyle 	= TUIYO_LIVE_PATH.'/client/default/' ;
		
		//Assign References
		$this->assignRef('livestyle', $livestyle );
		$this->assignRef('user' , $user );
		
		//Terms 
		$terms 		= $tmpl->parseTmpl( "terms" , TUIYO_FILES  , array() , "html" );
		$this->assignRef('terms' , $terms );
		
		//Style
		$tmpl->addCSS( TUIYO_LIVE_PATH.'/client/default/css/homepage.css' );
		$tmpl->addJS( TUIYO_LIVE_PATH.'/client/default/script/setup.js' );
	
		//Display the view 
		parent::setLayout('setup');
		parent::setLayoutExt('tpl');
		parent::display();
	}
	
	public function help($tpl=null){
		
		$doc	= $GLOBALS['API']->get( "document" );
		$user 	= $GLOBALS['API']->get('user'); 
		$joomla = $GLOBALS['mainframe'] ;
				
		
		//Default bc;
  		$bc = &$GLOBALS['mainframe']->getPathway();
  		$pt = &$GLOBALS['mainframe']->setPageTitle( _("Help and Support") ); 
		   		
        $bc->addItem( _("Help and support") );
        
		$doc->addCSS( TUIYO_LIVE_PATH.'/client/default/css/homepage.css');		
		
		$livestyle = TUIYO_LIVE_PATH.'/client/default/';
		
		$this->assignRef('user' , $user );
		$this->setLayout( "help" );
		$this->setLayoutExt('tpl');
		$this->assignRef('livestyle', $livestyle );

		parent::display( $tpl );
	}
	
}