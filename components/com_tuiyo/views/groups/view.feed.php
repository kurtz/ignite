<?php
/**
 * ******************************************************************
 * Profile JSON view for the tuiyo application                     *
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
 * Set ContentMimeType
 */
$doc 	= JFactory::getDocument();
$doc->setMimeEncoding("application/rss+xml");

/**
 * TuiyoViewGroups
 * @package Tuiyo For Joomla
 * @copyright 2009
 * @version $Id$
 * @access public
 */
class TuiyoViewGroups extends JView{
	
	/**
	 * TuiyoViewGroups::display()
	 * Displays a user Feed
	 * @return void
	 */
	public function showFeed(){
		
		global $mainframe, $API;
		
		static $rendered = false ;
		
		if($rendered){ return true; }
				
		$groupID= JRequest::getInt('gid');
		
		$auth	= $API->get("authentication");
		
		$auth->requireAuthentication();
		
		$tUser 	= TuiyoAPI::get('user', null );
		$gModel = TuiyoLoader::model("groups", true );
		$tModel = TuiyoLoader::model("timeline", true );
		
		$gData 	= $gModel->getGroup( $groupID );
		
		if(empty($groupID) || (!$gData) || $gData->isMember < 1 ){
			JError::raiseError(TUIYO_NOT_FOUND, _('The group feed either does not exists or you do not have the necessary permissions'));
			return false;
		}
		
		$tData 		= $tModel->getGroupTimeline( $gData->groupID , $tUser->id );
		
		$document	=& JFactory::getDocument();
		$params 	=& $mainframe->getParams();
		$feedEmail 	= (@$mainframe->getCfg('feed_email')) ? $mainframe->getCfg('feed_email') : 'author';
		$siteEmail 	= $mainframe->getCfg('mailfrom');
		
		$document->title =  $gData->gName ;
		$document->description = sprintf( _( "Updates from %s / group"), $gData->gName);
		$document->link  =  JRoute::_(TUIYO_INDEX.'&amp;view=groups&amp;do=getFeed&amp;format=feed&amp;gid='.$gData->$groupID );	
		
			
		foreach($tData as $stream):	// load individual item creator class
		
			$item = new JFeedItem();
			
			// strip html from feed item title
			$title = $this->escape( "@{$stream->username} {$stream->datetime}: {$stream->title} {$stream->bodytext} " );
			$title = html_entity_decode( $title );

			// url link to article
			$link = JRoute::_( TUIYO_INDEX.'&amp;view=profile&amp;do=viewStatus&user='.$stream->username."&amp;id=".$stream->id  );

			// strip html from feed item description text
			$description	= ( empty($stream->title)? null : $stream->title."<br />" )
							. ( empty($stream->body)? null : $stream->body."<br />" )
							. $stream->bodytext ;
							
			$author			= $stream->username;
			
			$item->title 		= $title;
			$item->link 		= $link;
			$item->description 	= $description;
			$item->date			= $stream->datetime;
			$item->pubDate      = $item->date ;
			$item->author		= $author;

			$item->authorEmail  = "{$item->author} @ {$gData->gName}";
		
			// loads item info into rss array
			$document->addItem( $item );
			
		endforeach; 
		
		//$this->setLayout('feed');
		//$this->setLayoutExt('tpl');
		
		$rendered = true ;
	}
	
	
}