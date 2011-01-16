<?php
defined('TUIYO_EXECUTE') || die('You are not authorised to view this resource');

TuiyoLoader::helper("parameter");
$globalCfg = TuiyoParameter::load("global");

$CONSUMER_KEY 		= $globalCfg->get("twitterConsumerKey", null);
$CONSUMER_SECRET 	= $globalCfg->get("twitterConsumerSecret", null);
$OAUTH_CALLBACK		= $globalCfg->get("twitterCallback", null);

define('CONSUMER_KEY', $CONSUMER_KEY);
define('CONSUMER_SECRET',$CONSUMER_SECRET);
define('OAUTH_CALLBACK', $OAUTH_CALLBACK);

