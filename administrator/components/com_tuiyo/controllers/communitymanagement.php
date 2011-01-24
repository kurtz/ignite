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


class TuiyoControllerCommunityManagement extends JController{

	var $docu 	= null;

	public function __construct(){
		//Set the View Intricately
		if (!JRequest::getCmd( 'view') ) {
         	JRequest::setVar('view', 'tuiyo' );
      	}
      	$this->docu	=& JFactory::getDocument();
      	//Construct parent;
		parent::__construct();
	}
	
	public function editpermissions(){
		
		$view 	= $this->getView("tuiyo", "html");
		$cView 	= $this->getView("community", "html");
		
		$tabgroup  = array( 
			"_roles" => array(
				_("Permission Groups") 		=> "&action=groups", //Determine which tab is active by comparing referers
				_("Predefined Actions")		=> "&action=levels",
				_("Permission Roles")		=> "&action=roles",
			 )
		);
		$view->addTabGroup( $tabgroup  );
		$page 	= $cView->permissionrolesmanager( $this->getModel("permissions"));

        $view->display($page, '_roles');
	}
	
	public function filemanager(){
		
		$view = $this->getView("tuiyo", "html");

		$tabgroup  = array( 
			"_autocenter" => array(
				_("User uploaded files") 		=> "&action=lists", //Determine which tab is active by comparing referers
				_("Pending Approval")		=> "&action=pending",
				_("Warnings")			=> "&action=warning"
			 )
		);
		$view->addTabGroup( $tabgroup  );

        $view->display("File Manager", '_autocenter');
	}

	
	public function moderator(){
		
		$view = $this->getView("tuiyo", "html");
		$communityView 	= $this->getView("community" , "html");
		
		$tabgroup  = array( 
			"_autocenter" => array(
				_("User Reports") 		=> "&action=reports", //Determine which tab is active by comparing referers
				_("Moderation Logs")	=> "&action=logs",
				_("Announcements")		=> "&action=announcements"
			 )
		);
		$view->addTabGroup( $tabgroup  );

		$page = $communityView->moderatorPanel();
        $view->display( $page, '_autocenter');
	}
	
	/**
	 * Default community managment action
	 * TuiyoControllerCommunityManagement::display()
	 * @return void
	 */
	public function display(){
		
		$adminView 		= $this->getView("tuiyo", "html");
		$communityView 	= $this->getView("community" , "html");
		$cmtyModel		= $this->getModel("communityManagement" );
		
		$userMgmnt 		= $communityView->display( );
		
		$tabgroup  = array( 
			"_users" => array(
				_("Active Members") 	=> "", //Determine which tab is active by comparing referers
				_("All Members") 	=> "&action=systemusers", //Determine which tab is active by comparing referers
				_("Member Delete Request")		=> "&action=bucketlist",
				_("Create New Users")	=> "&action=create",
				_("Reports")			=> "&action=reports"
			 )
		);
		$adminView->addTabGroup( $tabgroup );
		
		$adminView->display( $userMgmnt  , "_users");
		$this->docu->addScript( "components/com_tuiyo/style/script/community.js" ); 
	}
	
	public function getUserList(){
		
		$adminView 	= $this->getView("tuiyo" , "json");
		$cmtyView 	= $this->getView("community" , "html" );
		$cmtyModel	= $this->getModel("communityManagement" );
		
		$resp = array(
			"code" 	=> TUIYO_OK, 
			"error" => false, 
			"data" 	=> false,
			"extra"	=> false 
		);	
		/*Do Some Plugin Majical Stuff Here */
		$fields 		= array( 
			"u"=>array( "id", "name", "email", "username",  "gid",  "lastVisitDate"),
		   	"p"=>array("profileId", "dateCreated", "sex",  "suspended")
		);
		$userList		= $cmtyModel->getUsers( $fields , true );
		$resp["data"]	= $userList;
		$resp["extra"] 	= $cmtyView->buildUserList( $userList  );
		
		$adminView->encode( $resp );
	}
	
	public function getCategories(){
		
		$adminView 	= $this->getView("tuiyo" , "html");
		$adminWindow= $adminView->categoryManager();
		$tabgroup  = array( 
			"_categories" => array(
				_("Categories") => "&action=lists", //Determine which tab is active by comparing referers
				_("Add New Category")=> "&action=create"
			 )
		);
		$adminView->addTabGroup( $tabgroup );
		
		return $adminView->display( $adminWindow , "_categories");
	}
	
	
	public function getProfile(){
		
		$adminView 	= $this->getView("tuiyo" , "json");
		$cmtyView 	= $this->getView("community" , "html" );
		$cmtyModel	= $this->getModel("communityManagement" );
		$userID		= JRequest::getVar("userid");
		
		$resp = array(
			"code" 	=> TUIYO_OK, 
			"error" => false, 
			"data" 	=> false,
			"extra"	=> false 
		);
		
		//$userNotes 	= $this->getUserReports();
		//$userDetails= $this->getUserProfile();
		
		$userProfile 	= array();
		$resp["extra"] 	= $cmtyView->buildUserMiniProfile( $userProfile );
		
		return $adminView->encode( $resp );
	}
	
	public function getGroups(){
		
		$adminView 	= $this->getView("tuiyo" , "html");
		$cmtyView 	= $this->getView("community" , "html" );
        /** Do nothing majical **/

        $groups = $cmtyView->showGroupWindow( );
		$tabgroup  = array( 
			"_groups" => array(
				_("Member Groups") 		=> "&action=lists", //Determine which tab is active by comparing referers
				_("Create New Group")	=> "&action=new",
				_("Groups By Category")	=> "&action=categories"
			 )
		);
		$adminView->addTabGroup( $tabgroup );

        $adminView->display( $groups , "_groups");
        //Add JS
		$this->docu->addScript( "components/com_tuiyo/style/script/community.js" ); 
	}
	
	
	public function getSuspendedProfile(){
		
		$adminView 	= $this->getView("tuiyo" , "json");
		$cmtyView 	= $this->getView("community" , "html" );
		$cmtyModel	= $this->getModel("communityManagement" );
		
		$resp = array(
			"code" 	=> TUIYO_OK, 
			"error" => false, 
			"data" 	=> false,
			"extra"	=> false 
		);	
		/*Do Some Plugin Majical Stuff Here */
		$fields 		= array( 
			"u"=>array( "id", "name", "email", "username",  "gid",  "lastVisitDate"),
		   	"p"=>array("profileId", "dateCreated", "sex",  "suspended")
		);
		$userList		= $cmtyModel->getUsers( $fields , true );
		$resp["data"]	= $userList;
		$resp["extra"] 	= $cmtyView->buildUserList( $userList  );
		
		$adminView->encode( $resp );

	}
	
	public function moderationPanel(){
		
		$adminView 	= $this->getView("tuiyo" , "json");
		$cmtyView 	= $this->getView("community" , "html" );
		$cmtyModel	= $this->getModel( "communityManagement" );
		
		$resp = array(
			"code" 	=> TUIYO_OK, 
			"error" => false, 
			"data" 	=> false,
			"extra"	=> false 
		);	
		/*Do Some Plugin Majical Stuff Here */
		
		$userReportList	= $cmtyModel->getUsersReports();
		$resp["extra"] 	= $cmtyView->buildUserReportList( $userReportList );
		
		$adminView->encode( $resp );
				
	}
	
}