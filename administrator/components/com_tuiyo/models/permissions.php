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
 * joomla MOdel
 */
jimport( 'joomla.application.component.model' );

/**
 * TuiyoModelCommunityManagement
 * 
 * @package Livingstone Workspace
 * @author Livingstone Fultang
 * @copyright 2009
 * @version $Id$
 * @access public
 */
class TuiyoModelPermissions extends JModel{
	
	/**
     * Total number of items
     * @var integer
     */
    public $_total = null;

    /**
     * The Pagination object
     * @var object
     */
    public $_pagination = null;
    
	
	//Level 28 because 28 is the minimal root in USERS! thats all we need
	public function getPermissionGroupTree( $level = 28){
    	
		$dbo 		=& $this->_db;
		$level		= ( !is_null( $level ) && (int)$level > 0 )? $level : 0;
		
		//If no root node, select all root nodes
		$sql1		= "SELECT node.*, '' as children, '' as indent FROM #__core_acl_aro_groups node WHERE parent_id=".$dbo->Quote( (int)$level );
    	
    	//Get the first node;
    	$dbo->setQuery( $sql1 );    	
    	$nodes		= $dbo->loadAssocList();
    	
    	//Check if each of the parent nodes have children
    	//if rgt-lft is greater than 1 then we have children
    	//set this node as parent node and call this function recursively
    	foreach($nodes as $key=>$node){ 
    		$node['indent']			= 0;   	
    		$node_count = 0;
   			$sql2   	= "SELECT count(*) as children FROM #__core_acl_aro_groups node WHERE parent_id=".$dbo->Quote( (int)$node['id'] ); 
   				
   			$dbo->setQuery( $sql2 );
   			$node_count = (int)$dbo->loadResult();
   				
    		if( $node_count > 0 ) :
    			//if we have kids, 
    			//select all of them and add to the children array!
    			$level 			   = $node['id'];
    			$nodes[$key]['children'] = $this->getPermissionGroupTree( (int)$level );     		
    		else:
    			$node['children']  = array();
    			$node['indent']	   = 0;
    			continue;
    		endif;    	
    	}    	
  		return $nodes;
    }

	public function getObjectSections($type="aco"){
		
		$dbo = $this->_db;
		$ACL = JFactory::getACL();
		
		switch( strtolower(trim($type))){
			case 'aco':
		        $objectType = 'aco';
				$objectSectionsTable = $ACL->_db_table_prefix . 'aco_sections';
		        break;
		    case 'aro':
		        $objectType = 'aro';
				$objectSectionsTable = $ACL->_db_table_prefix . 'aro_sections';
		        break;
		    case 'axo':
		        $objectType = 'axo';
				$objectSectionsTable = $ACL->_db_table_prefix . 'axo_sections';
		        break;
		    case 'acl':
		        $objectType = 'acl';
				$objectSectionsTable = $ACL->_db_table_prefix . 'acl_sections';
		        break;
		    default:
		        JError::raiserError( "ERROR: Must select an object type<br>\n");
		        jexit();
		        break;
		}
		$query = "SELECT id , name, value FROM $objectSectionsTable";
		$dbo->setQuery( $query );
		
		$sections = $dbo->loadAssocList();
		
		return $sections;
		
	}

	function editObjectSections( $sectionName, $sectionValue, $sectionID = 0, $sectionType = "ACO" , $delete = false  ){
		//TODO Only by superadministrator
		$ACL = JFactory::getACL();
		//Switch the section Type;
		switch( strtolower(trim($sectionType))){
			case 'aco':
		        $objectType = 'aco';
				$objectSectionsTable = $ACL->_db_table_prefix . 'aco_sections';
		        break;
		    case 'aro':
		        $objectType = 'aro';
				$objectSectionsTable = $ACL->_db_table_prefix . 'aro_sections';
		        break;
		    case 'axo':
		        $objectType = 'axo';
				$objectSectionsTable = $ACL->_db_table_prefix . 'axo_sections';
		        break;
		    case 'acl':
		        $objectType = 'acl';
				$objectSectionsTable = $ACL->_db_table_prefix . 'acl_sections';
		        break;
		    default:
		        JError::raiserError( "ERROR: Must select an object type<br>\n");
		        jexit();
		        break;
		}
		if( !is_int($sectionID) || is_null($sectionID) ){
			$ACL->debug_text("del_object_section(), edit_object_section(): Section ID ($sectionID) is empty, this is required");
			return false;
		}
		
		if($delete && $sectionID > 0){
			$ACL->del_object_section($sectionID, $objectType, TRUE);
			return true;
		}
		//Just modify or insert new sections
		$ACL->debug_text("Submit!!");

        //Update section?
		if($sectionID>0){
            $ACL->edit_object_section($sectionID, $sectionName, $sectionValue, 10 ,0,$objecType );
			return true;
		}else{
			//We are inserting a new obect Section;
			if (!empty($sectionName) AND !empty($sectionValue) ) {
                $objectSectionId = $ACL->add_object_section($sectionName, $sectionValue, 10, 0, $objectType);
                $ACL->debug_text("Section ID: $objectSectionId");
				return true;
           }else{
				return false;
			}
		}
		return true;
	}

	function deleteThenRestructureGroups($groupID, $reparentChildren=TRUE, $groupType='ARO') {
		//Only by superadministrator
		$ACL = JFactory::getACL();
	
		switch( strtolower( trim($groupType) ) ) {
			case 'axo':
				$groupType = 'axo';
				$table 		= 	$ACL->_db_table_prefix .'axo_groups';
				$groupsMapTable = 	$ACL->_db_table_prefix .'axo_groups_map';
				$groupsObjectMapTable = $ACL->_db_table_prefix .'groups_axo_map';
				break;
			
			default:
				$groupType = 'aro';
				$table = 	$ACL->_db_table_prefix .'aro_groups';
				$groupsMapTable = 	$ACL->_db_table_prefix .'aro_groups_map';
				$groupsObjectMapTable = 	$ACL->_db_table_prefix .'groups_aro_map';
				break;
		}
	
		$ACL->debug_text("del_group(): ID: $groupID Reparent Children: $reparentChildren Group Type: $groupType");
	
		if( empty($groupID) ){
			$ACL->debug_text("del_group(): Group ID ($groupID) is empty, this is required");
			return false;
		}
	
		$query = 'SELECT id, parent_id, name, lft, rgt FROM '. $table .' WHERE id='. (int) $groupID;
		$groupDetails = $ACL->db->GetRow($query);
	
		if( !is_array($groupDetails) ){
			$ACL->debug_db('del_group');
			return false;
		}
	
		$parentID 	= $groupDetails[1];
		$left 		= $groupDetails[3];
		$right 		= $groupDetails[4];
	
		$ACL->db->BeginTrans();

		$childrenIDs = 	$ACL->get_group_children($groupID, $groupType, 'RECURSE');
	
  
		if( $parentID == 0 ){
			$query = 'SELECT count(*) FROM '. $table .' WHERE parent_id='. (int) $groupID;
			$childCount = $acl->db->GetOne($query);
	
			if ( ($childCount > 1) AND $reparentChildren ) {
					$ACL->debug_text ('del_group (): You cannot delete the root group and reparent children, this would create multiple root groups.');
					$ACL->db->RollbackTrans();
				return FALSE;
			}
		}
	
		$success = FALSE;
	
		switch (TRUE) {
 
			case !is_array($childrenIDs):
			case count($childrenIDs) == 0:

				$query = 'DELETE FROM '. $groupsObjectMapTable .' WHERE group_id='. (int) $groupID;
				$rs = 	$ACL->db->Execute($query);
	
				if (!is_object($rs)) {
					break;
				}
				
				$query = 'DELETE FROM '. $table .' WHERE id='. (int) $groupID;
				$rs = 	$ACL->db->Execute($query);
	
				if (!is_object($rs)) {
					break;
				}

				$query = 'UPDATE '. $table .' SET lft=lft-'. (int)($right-$left+1) .' WHERE lft>'. (int) $right;
				$rs = 	$ACL->db->Execute($query);
	
				if (!is_object($rs)) {
					break;
				}
	
				$query = 'UPDATE '. $table .' SET rgt=rgt-'. (int)($right-$left+1) .' WHERE rgt>'. (int) $right;
				$rs = $ACL->db->Execute($query);
	
				if (!is_object($rs)) {
					break;
				}
	
				$success = TRUE;
				break;
  			case $reparentChildren == TRUE:
				$query = 'DELETE FROM '. $groupsObjectMapTable .' WHERE group_id='. (int) $groupID;
				$rs = $ACL->db->Execute($query);
	
				if (!is_object($rs)) {
					break;
				}

				$query = 'DELETE FROM '. $table .' WHERE id='. (int) $groupID;
				$rs = 	$ACL->db->Execute($query);
	
				if (!is_object($rs)) {
					break;
				}
				
				$query = 'UPDATE '. $table .' SET parent_id='. (int) $parentID .' WHERE parent_id='. (int) $groupID;
				$rs = 	$ACL->db->Execute($query);
	
				if (!is_object($rs)) {
					break;
				}

				$query = 'UPDATE '. $table .' SET lft=lft-1, rgt=rgt-1 WHERE lft>'. (int) $left .' AND rgt<'. (int) $right;
				$rs = 	$ACL->db->Execute($query);
	
				if (!is_object($rs)) {
					break;
				}
	
				$query = 'UPDATE '. $table .' SET lft=lft-2 WHERE lft>'. (int) $right;
				$rs = 	$ACL->db->Execute($query);
	
				if (!is_object($rs)) {
					break;
				}
	
				$query = 'UPDATE '. $table .' SET rgt=rgt-2 WHERE rgt>'. (int) $right;
				$rs = 	$ACL->db->Execute($query);
	
				if (!is_object($rs)) {
					break;
				}
	
				$success = TRUE;
				break;
			default:

				$groupIDs = $childrenIDs;
				$groupIDs[] = (int) $groupID;
   
				$query = 'DELETE FROM '. $groupsObjectMapTable .' WHERE group_id IN ('. implode (',', $groupIDs) .')';
				$rs = 	$ACL->db->Execute($query);
	
				if (!is_object($rs)) {
					break;
				}
	
				$query = 'DELETE FROM '. $table .' WHERE id IN ('. implode (',', $groupIDs) .')';
				$rs = 	$ACL->db->Execute($query);
	
				if (!is_object($rs)) {
					break;
				}

				$query = 'UPDATE '. $table .' SET lft=lft-'. ($right - $left + 1) .' WHERE lft>'. (int) $right;
				$rs = 	$ACL->db->Execute($query);
	
				if (!is_object($rs)) {
					break;
				}
	
				$query = 'UPDATE '. $table .' SET rgt=rgt-'. ($right - $left + 1) .' WHERE rgt>'. (int) $right;
				$rs = 	$ACL->db->Execute($query);
	
				if (!is_object($rs)) {
					break;
				}
	
				$success = TRUE;
				
		}
	
		if (!$success) {
			$ACL->debug_db('del_group');
			$ACL->db->RollBackTrans();
			return false;
		}
	
		$ACL->debug_text("del_group(): deleted group ID: $groupID");
		$ACL->db->CommitTrans();
	
		if ($ACL->_caching == TRUE AND $ACL->_force_cache_expire == TRUE) {
			$ACL->Cache_Lite->clean('default');
		}
		return true;
	
	}
	


	public function __construct()
	{
	    parent::__construct();
	
	    global $mainframe, $option;
	
	    // Get pagination request variables
	    $limit 		= $mainframe->getUserStateFromRequest('global.list.limit', 'limit', $mainframe->getCfg('list_limit'), 'int');
	    $limitstart = JRequest::getVar('limitstart', 0, '', 'int');
	
	    // In case limit has been changed, adjust it
	    $limitstart = ($limit != 0 ? (floor($limitstart / $limit) * $limit) : 0);
	
	    $this->setState('limit', $limit ); //$limit
	    $this->setState('limitstart', $limitstart);
	    
	    $this->pageNav  = NULL ;
	}
	
	
}