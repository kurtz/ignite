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
TuiyoLoader::helper("parameter");

/**
 * TuiyoControllerUsers
 * 
 * @package tuiyo
 * @author Livingstone Fultang
 * @copyright 2009
 * @version $Id$
 * @access public
 */
class TuiyoControllerUsers extends JController
{
	/**
	 * constructor (registers additional tasks to methods)
	 * @return void
	 */
	function __construct()
	{
		parent::__construct();

		// Register Extra tasks
		$this->registerTask( 'add'  , 	'edit' );
	}

	/**
	 * display the edit form
	 * @return void
	 */
	function edit()
	{
		JRequest::setVar( 'view', 'hello' );
		JRequest::setVar( 'layout', 'form'  );
		JRequest::setVar('hidemainmenu', 1);

		parent::display();
	}

	/**
	 * save a record (and redirect to main page)
	 * @return void
	 */
	/**
	 * Saves the record
	 */
	function save()
	{
		global $mainframe;

		// Check for request forgeries
		JRequest::checkToken() or jexit( 'Invalid Token' );

		$option = JRequest::getCmd( 'option');

		// Initialize some variables
		$db			= & JFactory::getDBO();
		$me			= & JFactory::getUser();
		$acl		=& JFactory::getACL();
		$MailFrom	= $mainframe->getCfg('mailfrom');
		$FromName	= $mainframe->getCfg('fromname');
		$SiteName	= $mainframe->getCfg('sitename');

		// Create a new JUser object
		$user = new JUser(JRequest::getVar( 'id', 0, 'post', 'int'));
		$original_gid = $user->get('gid');

		$post = JRequest::get('post');
		$post['username']	= JRequest::getVar('username', '', 'post', 'username');
		$post['password']	= JRequest::getVar('password', '', 'post', 'string', JREQUEST_ALLOWRAW);
		$post['password2']	= JRequest::getVar('password2', '', 'post', 'string', JREQUEST_ALLOWRAW);

		if (!$user->bind($post))
		{
			$mainframe->enqueueMessage(JText::_('CANNOT SAVE THE USER INFORMATION'), 'message');
			$mainframe->enqueueMessage($user->getError(), 'error');
			//$mainframe->redirect( 'index.php?option=com_users', $user->getError() );
			//return false;
			return $this->redirect('edit');
		}

		$objectID 	= $acl->get_object_id( 'users', $user->get('id'), 'ARO' );
		$groups 	= $acl->get_object_groups( $objectID, 'ARO' );
		$this_group = strtolower( $acl->get_group_name( $groups[0], 'ARO' ) );


		if ( $user->get('id') == $me->get( 'id' ) && $user->get('block') == 1 )
		{
			$msg = JText::_( 'You cannot block Yourself!' );
			$mainframe->enqueueMessage($msg, 'message');
			$this->setRedirect( TUIYO_INDEX.'&context=communityManagement&do=display&action=create' );
			return $this->redirect();
		}
		else if ( ( $this_group == 'super administrator' ) && $user->get('block') == 1 ) {
			$msg = JText::_( 'You cannot block a Super Administrator' );
			$mainframe->enqueueMessage($msg, 'message');
			$this->setRedirect( TUIYO_INDEX.'&context=communityManagement&do=display&action=create' );
			return $this->redirect();
		}
		else if ( ( $this_group == 'administrator' ) && ( $me->get( 'gid' ) == 24 ) && $user->get('block') == 1 )
		{
			$msg = JText::_( 'WARNBLOCK' );
			$mainframe->enqueueMessage($msg, 'message');
			$this->setRedirect( TUIYO_INDEX.'&context=communityManagement&do=display&action=create' );
			return $this->redirect();
		}
		else if ( ( $this_group == 'super administrator' ) && ( $me->get( 'gid' ) != 25 ) )
		{
			$msg = JText::_( 'You cannot edit a super administrator account' );
			$mainframe->enqueueMessage($msg, 'message');
			$this->setRedirect( TUIYO_INDEX.'&context=communityManagement&do=display&action=create' );
			return $this->redirect();
		}
		// Are we dealing with a new user which we need to create?
		$isNew 	= ($user->get('id') < 1);
		if (!$isNew)
		{
			// if group has been changed and where original group was a Super Admin
			if ( $user->get('gid') != $original_gid && $original_gid == 25 )
			{
				// count number of active super admins
				$query = 'SELECT COUNT( id )'
					. ' FROM #__users'
					. ' WHERE gid = 25'
					. ' AND block = 0'
				;
				$db->setQuery( $query );
				$count = $db->loadResult();

				if ( $count <= 1 )
				{
					// disallow change if only one Super Admin exists
					$this->setRedirect( TUIYO_INDEX.'&context=communityManagement&do=display&action=create' ,JText::_('WARN_ONLY_SUPER') );
					return $this->redirect(); 
				}
			}
		}

		/*
	 	 * Lets save the JUser object
	 	 */
		if (!$user->save())
		{

			$mainframe->enqueueMessage(JText::_('CANNOT SAVE THE USER INFORMATION'), 'message');
			$mainframe->enqueueMessage($user->getError(), 'error');
			$this->setRedirect( TUIYO_INDEX.'&context=communityManagement&do=display&action=create' );
			return $this->redirect();
		}

		/*
	 	 * Time for the email magic so get ready to sprinkle the magic dust...
	 	 */
		if ($isNew)
		{
			$adminEmail = $me->get('email');
			$adminName	= $me->get('name');

			$subject = JText::_('NEW_USER_MESSAGE_SUBJECT');
			$message = sprintf ( JText::_('NEW_USER_MESSAGE'), $user->get('name'), $SiteName, JURI::root(), $user->get('username'), $user->password_clear );

			if ($MailFrom != '' && $FromName != '')
			{
				$adminName 	= $FromName;
				$adminEmail = $MailFrom;
			}
			JUtility::sendMail( $adminEmail, $adminName, $user->get('email'), $subject, $message );
		}

		// If updating self, load the new user object into the session
		if ($user->get('id') == $me->get('id'))
		{
			// Get an ACL object
			$acl = &JFactory::getACL();

			// Get the user group from the ACL
			$grp = $acl->getAroGroup($user->get('id'));

			// Mark the user as logged in
			$user->set('guest', 0);
			$user->set('aid', 1);

			// Fudge Authors, Editors, Publishers and Super Administrators into the special access group
			if ($acl->is_group_child_of($grp->name, 'Registered')      ||
			    $acl->is_group_child_of($grp->name, 'Public Backend'))    {
				$user->set('aid', 2);
			}

			// Set the usertype based on the ACL group name
			$user->set('usertype', $grp->name);

			$session = &JFactory::getSession();
			$session->set('user', $user);
		}

		switch ( $post['xdo'] )
		{
			case 'apply':
				$msg = JText::sprintf( 'Successfully Saved changes to User', $user->get('name') );
				$this->setRedirect( TUIYO_INDEX.'&context=communityManagement&do=display&action=create&userid='. $user->get('id'), $msg );
				break;

			case 'save':
			default:
				$msg = JText::sprintf( 'Successfully Saved User', $user->get('name') );
				$this->setRedirect( TUIYO_INDEX.'&context=communityManagement&do=display&action=list', $msg );
				break;
		}
	}
	
	public function savePermissionObectSection(){
		
		global $mainframe;

		JRequest::checkToken() or jexit( 'Invalid Token' );
		
		$sid 			= JRequest::getInt('sid', 0, '', 'int' );
		$sName 			= JRequest::getVar('name', null , '');
		$sValue 		= JRequest::getVar('value', $sName , '');
		$dValue 		= JRequest::getVar('delete', null );
		
		$redirect 		= TUIYO_INDEX.'&context=communityManagement&do=editpermissions&action=levels';
		$pModel 		= $this->getModel("permissions");
		
		$sectionID 		= intval( $sid );
		$sectionName 	= trim( $sName );
		$sectionValue 	= strtolower( str_replace( array(" ","(",")","-","&","%",",","#" ), "", $sValue ) );
		
		$msg			= "";
		$msgType		= "";
		
		if( !empty($sectionValue) && !empty($sectionName) ){				
			if( $pModel->editObjectSections( (string)$sectionName, (string)$sectionValue,  (int)$sectionID ) ){
				$msg = _("Successfully modified the ACO sections map");
			}								
		}else{
			$msg = _("Section Values and Section Names are required for this task");
			$msgType = "error";
		}

		$this->setRedirect( $redirect, $msg , $msgType);
		$this->redirect();
	}
	
	public function removePermissionGroup(){
		
		$gid 			= JRequest::getInt('gid', null, '', 'int' );
		
		$redirect 		= TUIYO_INDEX.'&context=communityManagement&do=editpermissions';
		$pModel 		= $this->getModel("permissions");
		
		$groupID = intval( $gid );
		$msg			= "";
		if( $groupID > 30 ){				
			if( $pModel->deleteThenRestructureGroups( (int)$groupID ) ){
				$msg = _("Successfully removed the group");
			}
			else{
				$msg = _("Could not remove the group");
			}								
		}

		$this->setRedirect( $redirect, $msg);
		$this->redirect();
	}
	
	public function savePermissionGroup(){
		
		global $mainframe;

		JRequest::checkToken() or jexit( 'Invalid Token' );

		$USER		=& JFactory::getUser();
		$ACL        =& JFactory::getACL();
		
		$post 		= JRequest::get('post');
		$groupID 	= JRequest::getInt( 'id', 0, 'post', 'int');
		$parentID 	= JRequest::getInt( 'parent_id', 28, 'post', 'int');
		$groupName 	= JRequest::getVar('name', null);
		
		$redirect 	= TUIYO_INDEX.'&context=communityManagement&do=editpermissions';
		
		if(empty($groupName)){
			$msg = _( 'You must specify a group name' );
			$this->setRedirect( $redirect, $msg );	
		}
		
		if( $groupID == 0 ){
			
			$ACL->add_group($groupName, $groupName, $parentID);
			
			$msg = _( 'Successfully added the group' );
			$this->setRedirect( $redirect, $msg );

		}else {
			
			$ACL->edit_group( $groupID, $groupName, $groupName, $parentID);
			
			$msg = _( 'Successfully edited the group' );
			$this->setRedirect( $redirect, $msg );
			
		}
		//Redirect the user
		$this->redirect();
		
	}

	/**
	 * remove record(s)
	 * @return void
	 */
	function remove()
	{
		$model = $this->getModel('hello');
		if(!$model->delete()) {
			$msg = JText::_( 'Error: One or More Greetings Could not be Deleted' );
		} else {
			$msg = JText::_( 'Greeting(s) Deleted' );
		}

		$this->setRedirect( 'index.php?option=com_hello', $msg );
	}

	/**
	 * cancel editing a record
	 * @return void
	 */
	function cancel()
	{
		$msg = JText::_( 'Operation Cancelled' );
		$this->setRedirect( 'index.php?option=com_hello', $msg );
	}
}