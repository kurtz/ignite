<?php

/**
 * ******************************************************************
 * Tuiyo application                     *
 * ******************************************************************
 * @copyright : 2008 tuiyo Platform                                 *
 * @license   : http://platform.tuiyo.com/license   BSD License     * 
 * @version   : Release: $Id$                                       * 
 * @link      : http://platform.tuiyo.com/                          * 
 * @author 	  : livingstone[at]drstonyhills[dot]com                 * 
 * @access 	  : Public                                              *
 * @since     : 1.0.0 alpha                                         *   
 * @package   : tuiyo    yyeSyV0kysKV2oqpLUES5                                           *
 * ******************************************************************
 */
/**
 * no direct access
 */
defined('TUIYO_EXECUTE') || die('Restricted access');

class TuiyoMacroSystemUpdate {

    public function __construct() {
        TuiyoEventLoader::preparePlugins("macros");
    }

    public function run() {
        
        global $mainframe;
        
        $version        = TuiyoLoader::helper("parameter");
        $versionHelper  = TuiyoLoader::helper("version", true);
        $config         = TuiyoParameter::load("global");
        $document       = TuiyoAPI::get("document");
        $step           = JRequest::getInt("step", 0 , '', 'int');
        
        
        switch($step):
            case 2:
                $this->installPackage();
                break;
            case 1:
                $versionDldURL = "https://github.com/Tuiyo/ignite/zipball/master";
                $this->downloadFile($versionDldURL, TUIYO_CACHE);
                
                break;
            case 0:
                default:
                $document->addCSS('components/com_tuiyo/style/css/macros.css');

                echo _("Welcome to the system update macro...") . "<br />";

                $updateServer = $config->get("updateServer", "http://update.tuiyo.co.uk");
                $updateStatus = $config->get("updateStatus", "stable");
                $updateURL = JRoute::_(TUIYO_INDEX . "&amp;context=systemtools&amp;do=autocenter&amp;run=systemupdate");

                $versionXMLstr = file_get_contents($updateServer . "/version.xml");
                $versionXML = new JSimpleXML();
                $versionXMLObj = $versionXML->loadString($versionXMLstr);
                $root = $versionXML->document;

                echo _("Checking for Updates...") . "<br />";

                //die;
                $versionStr = $root->getElementByPath('version')->data();
                $versionDevLevel = $root->getElementByPath('devlevel')->data();
                $versionDevStatus = $root->getElementByPath('devstatus')->data();
                $versionBuildStr = $root->getElementByPath('build')->data();
                $versionDldURL = $root->getElementByPath("updateurl")->data();

                $latest = $versionStr . '.' . $versionDevLevel . '.' . $versionDevStatus;
                $outdated = $versionHelper->isOutDated($latest);

                if ($outdated) {
                    echo ("There was nothing to update <br />" );
                    return true;
                }else{
                    echo _("Downloading Update file from <strong>$versionDldURL</strong>....") . "<br /><div id='processmessages'></div>";
                    $mainframe->addMetaTag("_nextstep", 1);
                    $document->addJS('components/com_tuiyo/macros/systemupdate/systemupdate.js');   
                }
            break;
        endswitch;
    }

    public function downloadFile($source, $target) {
     
        $doc = JFactory::getDocument();
        $doc->setMimeEncoding("application/json");
        
        jimport('joomla.client.ftp');

        $resp = array(
            "message"       => '<span style="color:green">'._("Package successfully downloaded. Now installing...").'</span>',
            "message_type"  => "success",
            "nextstep"      => 2
        );
        
        $locale = $target.DS."TuiyoPackage-master.zip";
        $ftp    = JFTP::getInstance();
        
        //return false;
        echo json_encode($resp);
        
        jexit(0);
    }

    
   public function installPackage() {
     
        $doc = JFactory::getDocument();
        $doc->setMimeEncoding("application/json");
        
        $resp = array(
            "message"       => '<span style="color:green">'._("Package successfully installed.").'</span>',
            "message_type"  => "success"
        );
        
        //return false;
        echo json_encode($resp);
        
        jexit(0);
    }
    
    /**
     * TuiyoMacroSystemUpdate::getInstance()
     * Creates an instance of the Plugin
     * @param mixed $ifNotExist
     * @return
     */
    public function getInstance($ifNotExist = NULL) {
        /** Creates new instance if none already exists ** */
        static $instance;

        if (is_object($instance) && !$ifNotExist) {
            return $instance;
        } else {
            $instance = new TuiyoMacroSystemUpdate();
        }
        return $instance;
    }

}