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
 * Twitter oAuth;
 */
require_once(TUIYO_PLUGINS . DS . 'twitter' . DS . 'twitteroauth' . DS . 'twitteroauth.php');
require_once(TUIYO_PLUGINS . DS . 'twitter' . DS . 'twitteroauth' . DS . 'config.php');

/**
 * 
 * Tumblr Controller.
 * @author livingstonefultang
 */
class TwitterServiceController Extends TuiyoControllerServices {

    public function __construct() {

        //SET MODEL/VIEW PATH
        $this->_setPath('view', TUIYO_PLUGINS . DS . 'twitter' . DS . 'views');
        $this->addModelPath(TUIYO_PLUGINS . DS . 'twitter' . DS . 'models');
    }

    public function display() {

        $view = $this->getView("twitter", "html");
        return $view->showTwitter();
    }

    public function test() {

        $aModel = TuiyoLoader::model("applications", true);
        $aUser = TuiyoAPI::get("user", null);
        $aDocument = TuiyoAPI::get("document", null);

        $aParams = $aModel->getSingleUserPlugin($aUser->id, "twitter");

        if (!is_object($aParams)) {
            //User does not have the service Enabled
            return false;
        }

        echo $aParams->get("oauth_verifier");

        /* Build TwitterOAuth object with client credentials. */
        $connection = new TwitterOAuth(CONSUMER_KEY, CONSUMER_SECRET);
        $view = &$this->getView("twitter", "html");

        /* Get temporary credentials. */
        $access_token = $connection->getAccessToken($aParams->get('oauth_verifier', false));

        /* Create a TwitterOauth object with consumer/user tokens. */
        $connection = new TwitterOAuth(CONSUMER_KEY, CONSUMER_SECRET, $access_token['oauth_token'], $access_token['oauth_token_secret']);

        /* If method is set change API call made. Test is called by default. */
        $content = $connection->get('account/verify_credentials');

        //print_R($content);

        $user = $connection->get('account/verify_credentials');
        $userPublicFeeds = $connection->get('statuses/public_timeline');

        print_R($userPublicFeeds);
    }

    public function remove() {

        // Check for request forgeries
        JRequest::checkToken("request") or jexit('Invalid Token');

        $auth = TuiyoAPI::get('authentication');  //Must be loggedIN
        $auth->requireAuthentication();

        $user = TuiyoAPI::get('user');

        $model = &$this->getModel("twitter");
        $view = &$this->getView("twitter", "json");

        $resp = array(
            "code" => 505,
            "error" => _("could not remove service"),
            "data" => null,
            "extra" => null
        );

        if ($model->removeService("twitter", $user->id)) {
            $resp = array(
                "code" => TUIYO_OK,
                "error" => null,
            );
        }

        return $view->encode($resp);
    }

    public function getAuthToken() {

        /* Build TwitterOAuth object with client credentials. */
        $connection = new TwitterOAuth(CONSUMER_KEY, CONSUMER_SECRET);
        $view = &$this->getView("twitter", "json");

        /* Get temporary credentials. */
        $request_token = $connection->getRequestToken(OAUTH_CALLBACK);

        /* Save temporary credentials to session. */
        $_SESSION['oauth_token'] = $token = $request_token['oauth_token'];
        $_SESSION['oauth_token_secret'] = $secret = $request_token['oauth_token_secret'];

        /* Get the AuthorizeURL */
        $authUrl = $connection->getAuthorizeURL($request_token);

        $resp = array(
            "code" => TUIYO_OK,
            "error" => null,
            "data" => $authUrl,
            "token" => $token,
            "secret" => $secret
        );

        echo $view->encode($resp);

        jexit(0);
    }

    /**
     * (non-PHPdoc)
     * @see components/com_tuiyo/controllers/TuiyoControllerServices::add()
     */
    public function add() {

        // Check for request forgeries
        JRequest::checkToken("request") or jexit('Invalid Token');

        $auth = TuiyoAPI::get('authentication');  //Must be loggedIN
        $auth->requireAuthentication('post');

        $user = TuiyoAPI::get('user');
        $tempPost = &JRequest::get("post");
        $post = &JRequest::getVar('params', array(), 'post', 'array');

        $model = &$this->getModel("twitter");
        $view = &$this->getView("twitter", "json");

        $resp = array(
            "code" => 505,
            "error" => _("could not add service"),
            "data" => null,
            "extra" => null
        );

        $tempCredentials = $tempPost["temporary"];

        $connection = new TwitterOAuth(CONSUMER_KEY, CONSUMER_SECRET, $tempCredentials['oauth_token'], $tempCredentials['oauth_token_secret']);
        $token_credentials = $connection->getAccessToken($post["oauth_verfier"]);

        foreach ($token_credentials as $key => $value) {
            $post[$key] = $value;
        }

        if ($model->addService($post, $user->id)) {
            $resp = array(
                "code" => TUIYO_OK,
                "error" => null,
            );
        }

        return $view->encode($resp);
    }

}