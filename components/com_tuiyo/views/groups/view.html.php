<?php
/**
 * ******************************************************************
 * Class/Object for the Tuiyo platform                           *
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
 * TuiyoViewGroups
 * @copyright 2009
 * @version $Id$
 * @access public
 */
class TuiyoViewGroups extends JView
{
	/**
	 * TuiyoViewGroups::display()
	 * @param mixed $tmplData
	 * @return void
	 */
	public function display( $tmplData )
	{
		//Intro
		$doc		= $GLOBALS['API']->get("document" );
		$user		= $GLOBALS['API']->get("user", null);
 		$bc 		= $GLOBALS['mainframe']->getPathway();
 		$pt 		= $GLOBALS['mainframe']->setPageTitle( _("Community groups") );
 		$styleDir 	= TUIYO_LIVE_PATH.'/client/default/';
 		
		$bc->addItem( $user->name );
		
        $doc->addCSS(TUIYO_LIVE_PATH . '/client/default/css/groupspage.css');
        $doc->addJS( TUIYO_LIVE_PATH.'/client/default/script/groupspage.js' );
        $doc->addJS( TUIYO_STREAM );
		$doc->addJS( TUIYO_OEMBED );
		
        
        $pModel 		= TuiyoLoader::model("applications", true);
		$plugins		= $pModel->getAllSystemPlugins("services", false); 
		
		$tmplPath 		= TUIYO_VIEWS.DS."profile".DS."tmpl" ;
		$tmplVars 		= array(
			"styleDir"	=>TUIYO_STYLEDIR,
			"user"		=>$user,
			"sharewith" =>array("p00"=>"@everyone"),
		    "plugins"   => $plugins,
			"canPost"	=>(!$user->joomla->get('guest') ) ? 1 : 0 			
		);
		$activity 		= $doc->parseTmpl("activity" , $tmplPath , $tmplVars);
		
		$this->assignRef("activity", $activity );

		$this->assignRef('livestyle', $styleDir );
		$this->assignRef('user', $user );
		$this->assignRef('data' , $tmplData );
		
		$this->setLayoutExt('tpl');
		
		//Output
		parent::display($tpl);
	}
	
	/**
	 * TuiyoViewGroups::groupHomepage()
	 * Gets a group Homepage
	 * @param mixed $tmplData
	 * @return void
	 */
	public function groupHomepage( $tmplData = array() )
	{	
		$styleDir 	= TUIYO_LIVE_PATH.'/client/default/';
				
		$doc		= $GLOBALS['API']->get("document", null);
		$pt 		= $GLOBALS['mainframe']->setPageTitle( _("Community groups")." | ".$this->group->gName );
		
		$tmplPath 	= TUIYO_VIEWS.DS."groups".DS."tmpl" ;
		$tmplVars 		= array(
			"styleDir"	=>$styleDir,
			"user"		=>$this->user,
			"groupData" =>$this->group
		);
		
		$description= $doc->parseTmpl("groupdescription", $tmplPath, $tmplVars );
		
		if($this->group->gType == "public" || $this->group->isMember ){
			
			$GLOBALS['mainframe']->addMetaTag( "gid" , $this->group->groupID );
			
			$doc->addJS( TUIYO_OEMBED );
			$doc->addJS( TUIYO_STREAM );		
			$tmplPath 	= TUIYO_VIEWS.DS."profile".DS."tmpl" ;
			$tmplVars 		= array(
				"styleDir"	=>$styleDir,
				"user"		=>$this->user,
				"canPost"	=>$this->group->isMember , 
				"sharewith" =>array("g{$this->group->groupID}"=>$this->group->gName )
			);
			$activity 		= $doc->parseTmpl("activity" , $tmplPath , $tmplVars);
		}else{
			$activity 		= $description;
		}
		
		$managementPage = _( "login-in as the group administrator to edit this page" );
		
		if( $this->group->isAdmin > 0 ){
			
			$tmplPath 	= TUIYO_VIEWS.DS."groups".DS."tmpl" ;
			
			$tmplVars 		= array(
				"styleDir"	=>$styleDir,
				"user"		=>$this->user,
				"group"		=>$this->group,
			);
			$managementPage = $doc->parseTmpl("groupmanagement" , $tmplPath , $tmplVars);
				
		}	
		
        $doc->addCSS(TUIYO_LIVE_PATH . '/client/default/css/groupspage.css');
        $doc->addJS(TUIYO_LIVE_PATH.'/client/default/script/groupspage.js' );					
		
		$this->assignRef("activity", $activity );
		$this->assignRef("descriptionPage", $description );
		$this->assignRef("editPage", $managementPage );
		$this->setLayout('grouphomepage' );
		$this->assignRef('livestyle', $styleDir );
		//output
		parent::display();

		$rssLink = JRoute::_(TUIYO_INDEX.'&amp;view=groups&amp;do=getFeed&amp;format=feed&amp;gid='.$this->group->groupID );
		$attribs = JArrayHelper::toString(array( 
			"type"	=>"application/rss+xml",
			"rel"	=>"alternate",
			"title" =>"RSS 2.0 {$this->group->gName} updates",
			"href"	=>$rssLink 
		));
		$generatedTag = '<link '.$attribs.' />';
		//Trigger after profileDraw Events
	
		$GLOBALS["mainframe"]->addCustomHeadTag( $generatedTag );		
	}
}