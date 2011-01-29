<?php
/**
 * ******************************************************************
 * Messages HTML view                                               *
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
 * TuiyoViewMessages
 * 
 * @package tuiyo
 * @author Livingstone Fultang
 * @copyright 2009
 * @version $Id$
 * @access public
 */
class TuiyoViewMessages extends JView
{
	/**
	 * TuiyoViewMessages::display()
	 * @param mixed $tpl
	 * @return
	 */
	public function display($tpl = null)
	{
		$user 	= &$GLOBALS['API']->get("user", null);
		$doc	= &$GLOBALS['API']->get("document", null);  		//$auth->requireAuthentication( "method" );
		$bc 	= &$GLOBALS['mainframe']->getPathway();
  		$pt 	= &$GLOBALS['mainframe']->setPageTitle( _("Messages and notifications") );
  		
		$bc->addItem( _("Message and Notifications") );
		
		//styles
		$doc->addCSS(TUIYO_STYLEDIR.'/css/messages.css');
		$doc->addJS(TUIYO_STYLEDIR.'/script/messages.js');
		$doc->addJS( TUIYO_STREAM );
		$doc->addJS( TUIYO_OEMBED );
		$doc->addJS( TUIYO_JS.'/includes/tools/rangeinput.min.js');	
		
		$livestyle = TUIYO_LIVE_PATH.'/client/default/';	

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
		
		
		$this->assignRef('livestyle', $livestyle );
		$this->assignRef('user', $user );

		parent::display($tpl);
	}
	
	/**
	 * TuiyoViewMessages::addressBook()
	 * @param mixed $tpl
	 * @return
	 */
	public function addressBook($tpl=null)
	{
		$doc   	= &$GLOBALS['API']->get("document", null);
		$user	= &$GLOBALS['API']->get("user", null);
		//Default bc;
  		$bc 	= &$GLOBALS['mainframe']->getPathway();
  		$pt 	= &$GLOBALS['mainframe']->setPageTitle( "Address book" );
		    		
        $bc->addItem( "Address Book" );
		//styles Sheets
		$doc->addCSS(TUIYO_LIVE_PATH.'/client/default/css/messages.css');
		$doc->addJS(TUIYO_LIVE_PATH.'/client/default/script/messages.js');	
		
		$livestyle = TUIYO_LIVE_PATH.'/client/default/';
		
		$this->setLayout( "addressBook" );
		$this->setLayoutExt('tpl');
		$this->assignRef('livestyle', $livestyle );
		$this->assignRef('user', $user );
		
		parent::display( $tpl );
	}
	
	/**
	 * TuiyoViewMessages::calendar()
	 * @param mixed $tpl
	 * @return
	 */
	public function calendar($tpl=null)
	{
		$eModel = TuiyoLoader::model('events', true );	
				
		$doc  	= $GLOBALS['API']->get("document", null);
		$user	= $GLOBALS['API']->get("user", null);
		
		//Default bc;
  		$bc 	= &$GLOBALS['mainframe']->getPathway();
  		$pt 	= &$GLOBALS['mainframe']->setPageTitle( _("Online Calendar") );
  		
  		//Build Calendar
  		$defaultM 	= date("n");
		$defaultY 	= date("Y");
		
		$cMonth		= JRequest::getVar("cMonth", $defaultM );
		$cYear		= JRequest::getVar("cYear", $defaultY );

		$timestamp  = mktime(0,0,0,$cMonth,1,$cYear);
		
	 	$prevMonth 	= $cMonth-1;
		$nextMonth 	= $cMonth+1;
		$prevYear 	= $nextYear  =  $cYear ;
		
		if($prevMonth == 0 ) {
			$prevMonth = 12;
			$prevYear = $cYear - 1;
		}
		if($nextMonth == 13){
			$nextMonth = 1;
			$nextYear = $cYear + 1;
		}		
		//Get Months Events
		$events 	= $eModel->getUserEvents( $user->id , $cMonth , $cYear );		
  		$cMonthVars = array(  			
			"numdays" 	=> date("t", $timestamp),
			"dateInfo" 	=> getdate ($timestamp ),
			"nextMonth"	=> $nextMonth,
			"nextYear"	=> $nextYear,
			"prevMonth"	=> $prevMonth,
			"prevYear"	=> $prevYear,
			"events"	=> $events
		);
				
  		$this->assignRef("cVars" , $cMonthVars );
  		
        $bc->addItem( _("Calendar") );
        
		#$doc->addStyleSheet(TUIYO_LIVE_PATH.'/client/default/css/messages.css');
		$doc->addJS(TUIYO_JS.'/includes/tools/dateinput.min.js');
		$doc->addCSS(TUIYO_LIVE_PATH.'/client/default/css/calendar.css');
		$doc->addJS(TUIYO_LIVE_PATH.'/client/default/script/calendar.js');	
			

		$livestyle = TUIYO_LIVE_PATH.'/client/default/';
		
		$this->setLayout( "calendar" );
		$this->setLayoutExt('tpl');
		$this->assignRef('livestyle', $livestyle );
		$this->assignRef('user', $user );

		parent::display( $tpl );
	}
	
	/**
	 * TuiyoViewMessages::calendar()
	 * @param mixed $tpl
	 * @return
	 */
	public function agenda($tpl=null)
	{
		$eModel = TuiyoLoader::model('events', true );
		
		$doc  	= $GLOBALS['API']->get("document", null);
		$user	= $GLOBALS['API']->get("user", null);
		
		//Default bc;
  		$bc 	= &$GLOBALS['mainframe']->getPathway();
  		$pt 	= &$GLOBALS['mainframe']->setPageTitle( _("Agenda of Events") );
  		
  		$defaultM 	= date("n");
		$defaultY 	= date("Y");
		
		$cMonth		= JRequest::getVar("cMonth", $defaultM );
		$cYear		= JRequest::getVar("cYear", $defaultY );

		$timestamp  = mktime(0,0,0,$cMonth,1,$cYear);
		
	 	$prevMonth 	= $cMonth-1;
		$nextMonth 	= $cMonth+1;
		$prevYear 	= $nextYear  =  $cYear ;
		
		if($prevMonth == 0 ) {
			$prevMonth = 12;
			$prevYear = $cYear - 1;
		}
		if($nextMonth == 13){
			$nextMonth = 1;
			$nextYear = $cYear + 1;
		}		
		//Get Months Events
		$events 	= $eModel->getUserEvents( $user->id , $cMonth , $cYear );
		
		//print_R($events );
				
  		$cMonthVars = array(  			
			"numdays" 	=> date("t", $timestamp),
			"dateInfo" 	=> getdate ($timestamp ),
			"nextMonth"	=> $nextMonth,
			"nextYear"	=> $nextYear,
			"prevMonth"	=> $prevMonth,
			"prevYear"	=> $prevYear,
			"events"	=> $events
		);
				
  		$this->assignRef("cVars" , $cMonthVars );  		
  		
        $bc->addItem( _("Agenda of Events") );
        
		//styles Sheets
		$doc->addCSS(TUIYO_LIVE_PATH.'/client/default/css/messages.css');
		$doc->addCSS(TUIYO_LIVE_PATH.'/client/default/css/calendar.css');
		$doc->addJS(TUIYO_LIVE_PATH.'/client/default/script/messages.js');		
			
		$livestyle = TUIYO_LIVE_PATH.'/client/default/';
		
		$this->setLayout( "agenda" );
		$this->setLayoutExt('tpl');
		$this->assignRef('livestyle', $livestyle );
		$this->assignRef('user', $user );

		parent::display( $tpl );
	}	
}