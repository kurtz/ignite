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


jimport('joomla.application.component.view');

class TuiyoViewCommunity extends JView {

    public function display($data = null) {

        global $API, $mainframe;

        $TMPL = $GLOBALS["API"]->get("document");
        $USER = TuiyoAPI::get("user");
        $tmplVars = array(
            "styleDir" => $livestyle,
            "livePath" => TUIYO_LIVE_PATH,
            "iconPath" => TUIYO_LIVE_PATH . '/client/default/',
            "user" => JFactory::getUser(),
            "data" => (!is_null($data)) ? $data : ""
        );
        $tmplPath = JPATH_COMPONENT_ADMINISTRATOR . DS . "views" . DS . "community" . DS . "tmpl";
        $action = JRequest::getVar("action", null);
        $tmplFile = "default";

        switch ($action) {
            case "create":
                $ACL = JFactory::getACL();
                $gtree = $ACL->get_group_children_tree(null, 'USERS', false);
                $aroGrps = JHTML::_('select.genericlist', $gtree, 'gid', 'class="TuiyoFormDropDown"', 'value', 'text');
                // build the html select list
                $blockList = JHTML::_('select.booleanlist', 'block', 'class="TuiyoFormRadio" size="1"');

                // build the html select list
                $sendMailList = JHTML::_('select.booleanlist', 'sendEmail', 'class="inputbox" size="1"');

                $tmplVars["blocklist"] = $blockList;
                $tmplVars["sendmaillist"] = $sendMailList;
                $tmplVars["arogrp"] = $aroGrps;
                $tmplFile = "createnew";
                break;
            case "reports":
                $refer = JRoute::_(TUIYO_INDEX . "&amp;context=communityManagement&amp;do=moderator", false);
                $mainframe->redirect($refer);
                break;
            case "bucketlist":
                $cModel             = new TuiyoModelCommunityManagement();
                $bucketlist         = $cModel->getUserBucketList();
                $tmplVars["lists"]  = $this->buildUserList(false, $bucketlist , true );
                $tmplFile = "deleterequest";
                break;
            case "systemusers":
                $tmplVars["lists"] = $this->buildUserList();
                $tmplFile = "default";
                break;
            default:
                $tmplVars["lists"] = $this->buildUserList(true);
                $tmplFile = "default";
                break;
        }

        $tmplData = $TMPL->parseTmpl($tmplFile, $tmplPath, $tmplVars);

        return $tmplData;
    }

    public function buildUserList($activeOnly = false, $userListData = null, $allowEmpty = false) {

        $cmtyModel = new TuiyoModelCommunityManagement();

        /* Do Some Plugin Majical Stuff Here */
        if (empty($userListData)&&!$allowEmpty) {
            $fields = array(
                "u" => array("id", "name", "email", "username", "gid", "lastVisitDate")
                    //"p"=>array("profileId", "dateCreated", "sex",  "suspended")
            );
            if ($activeOnly) {
                $fields["p"] = array("profileId", "dateCreated", "sex", "suspended");
            }

            $userListData = $cmtyModel->getUsers($fields, $activeOnly);
        }

        $TMPL = $GLOBALS["API"]->get("document");

        $tmplVars = array(
            "styleDir" => $livestyle,
            "livePath" => TUIYO_LIVE_PATH,
            "iconPath" => TUIYO_LIVE_PATH . '/client/default/',
            "users" => $userListData
        );

        $tmplPath = JPATH_COMPONENT_ADMINISTRATOR . DS . "views" . DS . "community" . DS . "tmpl";
        $tmplData = $TMPL->parseTmpl("list", $tmplPath, $tmplVars);

        return $tmplData;
    }

    public function getFileManagerPage() {

        $action = JRequest::getVar("action", null);
        $TMPL = $GLOBALS["API"]->get("document");

        $tmplVars = array(
            "styleDir" => $livestyle,
            "livePath" => TUIYO_LIVE_PATH,
            "iconPath" => TUIYO_LIVE_PATH . '/client/default/',
            "users" => $userListData
        );

        switch ($action):
            case "lists":
                $tmplFile = "filemanager";
                break;
            case "pending":
                $tmplFile = "filemanager";
                break;
            case "warning":
            default:
                $tmplVars["reports"] = array();
                $tmplFile = "filemanager";
                break;
        endswitch;

        $tmplPath = JPATH_COMPONENT_ADMINISTRATOR . DS . "views" . DS . "community" . DS . "tmpl";
        $tmplData = $TMPL->parseTmpl($tmplFile, $tmplPath, $tmplVars);

        return $tmplData;
    }

    public function moderatorPanel($userReports) {

        $action = JRequest::getVar("action", null);
        $TMPL = $GLOBALS["API"]->get("document");

        $tmplVars = array(
            "styleDir" => $livestyle,
            "livePath" => TUIYO_LIVE_PATH,
            "iconPath" => TUIYO_LIVE_PATH . '/client/default/',
            "users" => $userListData
        );

        switch ($action):
            case "logs":
                $tmplFile = "moderatorlogs";
                break;
            case "announcements":
                $tmplFile = "announcements";
                break;
            case "reports":
            default:
                $tmplVars["reports"] = array();
                $tmplFile = "reportlist";
                break;
        endswitch;

        $tmplPath = JPATH_COMPONENT_ADMINISTRATOR . DS . "views" . DS . "community" . DS . "tmpl";
        $tmplData = $TMPL->parseTmpl($tmplFile, $tmplPath, $tmplVars);

        return $tmplData;
    }

    public function permissionrolesmanager($pModel) {

        $action = JRequest::getVar("action", null);
        $plugins = TuiyoLoader::model("applications", true);

        $TMPL = $GLOBALS["API"]->get("document");
        $tmplVars = array(
            "styleDir" => $livestyle,
            "livePath" => TUIYO_LIVE_PATH,
            "iconPath" => TUIYO_LIVE_PATH . '/client/default/'
        );

        switch ($action):
            case "levels":
                $tmplVars["acosections"] = $pModel->getObjectSections();
                $tmplFile = "permissionlevels";
                break;
            case "roles":
                TuiyoLoader::helper("parameter");
                $groupID = JRequest::getInt("gid", 18, '', 'int');

                $tmplVars['services'] = $plugins->getAllSystemPlugins('services', true, true);
                $tmplVars["acosections"] = $pModel->getObjectSections();
                $tmplVars["arogroupid"] = (int) $groupID;
                $tmplVars["arogroups"] = $pModel->getPermissionGroupTree();

                $tmplFile = "permissionroles";
                break;
            case "groups":
            default:
                $groupTree = $pModel->getPermissionGroupTree();
                $tmplVars["arogroups"] = $groupTree;
                $tmplFile = "permissiongroups";
                break;
        endswitch;

        $tmplPath = JPATH_COMPONENT_ADMINISTRATOR . DS . "views" . DS . "community" . DS . "tmpl";
        $tmplData = $TMPL->parseTmpl($tmplFile, $tmplPath, $tmplVars);

        return $tmplData;
    }

    public function buildUserMiniProfile($userData) {

        $TMPL = $GLOBALS["API"]->get("document");

        $tmplVars = array(
            "styleDir" => $livestyle,
            "livePath" => TUIYO_LIVE_PATH,
            "iconPath" => TUIYO_LIVE_PATH . '/client/default/',
            "users" => $userData
        );

        $tmplPath = JPATH_COMPONENT_ADMINISTRATOR . DS . "views" . DS . "community" . DS . "tmpl";
        $tmplData = $TMPL->parseTmpl("miniprofile", $tmplPath, $tmplVars);

        return $tmplData;
    }

    public function buildCategoryDirectory($categories) {

        $TMPL = $GLOBALS["API"]->get("document");

        $tmplVars = array(
            "styleDir" => $livestyle,
            "livePath" => TUIYO_LIVE_PATH,
            "iconPath" => TUIYO_LIVE_PATH . '/client/default/',
            "categories" => $categories
        );

        $tmplPath = JPATH_COMPONENT_ADMINISTRATOR . DS . "views" . DS . "community" . DS . "tmpl";
        $tmplData = $TMPL->parseTmpl("groupscats", $tmplPath, $tmplVars);

        return $tmplData;
    }

    public function showGroupWindow($data = NULL) {

        $TMPL = $GLOBALS["API"]->get("document");
        $action = JRequest::getVar("action", null);

        $tmplVars = array(
            "styleDir" => $livestyle,
            "livePath" => TUIYO_LIVE_PATH,
            "iconPath" => TUIYO_LIVE_PATH . '/client/default/',
            "user" => JFactory::getUser()
        );
        switch ($action) {
            case "new":
                $tmplfile = "creategroup";
                break;
            case "categories":
                $tmplVars["pagetitle"] = _("Groups By Category");
                $tmplfile = "groups";
                break;
            case "list":
            default:
                $tmplVars["pagetitle"] = _("All Member Groups");
                $tmplfile = "groups";
                break;
        }
        $tmplPath = JPATH_COMPONENT_ADMINISTRATOR . DS . "views" . DS . "community" . DS . "tmpl";
        $tmplData = $TMPL->parseTmpl($tmplfile, $tmplPath, $tmplVars);

        return $tmplData;
    }

}