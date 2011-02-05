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
defined('TUIYO_EXECUTE') || die('Restricted access');
/**
 * joomla utitlies
 */
jimport('joomla.application.component.view');

/**
 * Profile view for the admin component!
 *
 * @package		Joomla.Tutorials
 * @subpackage	Components
 */
class TuiyoViewFriends extends JView {

    /**
     * TuiyoViewFriends::display()
     * Display friends page
     * @param mixed $tpl
     * @return void
     */
    function display($tpl = null) {

        $document = TuiyoAPI::get("document");
        $user = TuiyoAPI::get("user");

        $style = TUIYO_LIVE_PATH . '/client/default/';
        $this->assignRef('livestyle', $style);
        //Default bread crumb and page title ;
        $bc = &$GLOBALS['mainframe']->getPathway();
        $pt = &$document->setPageTitle(_("Friends manager"));

        $bc->addItem(_("Friends manager"));

        $gModel = TuiyoLoader::model("groups", true);
        $myGroups = $gModel->getUserGroups($user->id);


        $this->assignRef("groups", $myGroups);

        //styles
        $document->addCSS(TUIYO_LIVE_PATH . '/client/default/css/friendspage.css');
        $document->addJS(TUIYO_LIVE_PATH . '/client/default/script/friendspage.js');

        parent::display($tpl);
    }

}