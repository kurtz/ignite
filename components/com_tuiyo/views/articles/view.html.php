<?php
/**
 * ******************************************************************
 * Articles View                                                    *
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
 * TuiyoViewArticles
 * @package Tuiyo For Joomla
 * @author Livingstone Fultang
 * @copyright 2009
 * @version $Id$
 * @access public
 */
class TuiyoViewArticles extends JView
{
	/**
	 * Default Display method
	 * @see JView::display()
	 */
	public function display( $tpl=null){

		$document	= $GLOBALS['API']->get("document", null);
		$user	  = $GLOBALS['API']->get('user', null);
		$model 	= TuiyoLoader::model("articles", true);
		
		$GLOBALS['mainframe']->getPathway()->addItem( _("Articles") );
		$document->setPageTitle( _("Articles") );
  	
		//styles
		//$document->addCSS(TUIYO_STYLEDIR.'/css/articles.css');
		$document->addJS(TUIYO_STYLEDIR.'/script/articles.js');
		$document->addJS( TUIYO_STREAM );
		$document->addJS( TUIYO_OEMBED );
        
		
		$document->addJS( TUIYO_STREAM );
		$document->addJS( TUIYO_OEMBED );
		
		$pModel 		= TuiyoLoader::model("applications", true);
		$plugins		= $pModel->getAllSystemPlugins("services", false); 
		
		$tmplPath 		= TUIYO_VIEWS.DS."profile".DS."tmpl" ;
		$tmplVars 		= array(
			"styleDir"		=>TUIYO_STYLEDIR,
			"user"			=>$user,
			"sharewith" 	=>array("p00"=>"@everyone"),
		    "plugins"   	=> $plugins,
			"canPost"		=>(!$user->joomla->get('guest') ) ? 1 : 0 			
		);
		$activity 		= $document->parseTmpl("activity" , $tmplPath , $tmplVars);
		$myarticles		= $model->getArticlesStream($user->id);
		$allarticles	= $model->getArticlesStream();
		
		$this->assignRef("activity", $activity );
		
		$canpost		= (!$user->joomla->get('guest') ) ? 1 : 0 ;
		$categories 	= $model->getArticlesCategories();
		
		$this->assignRef("myarticles", $myarticles);
		$this->assignRef("allarticles", $allarticles);
		$this->assignRef("categories", $categories);
		$this->assignRef("user", $user);
		$this->assignRef("canpost", $canpost);
		
		parent::display( $tpl );
		
	}
	
	public function readArticle($articleID, $tpl = null){
		
		$document	= $GLOBALS['API']->get("document", null);
		$user	  = $GLOBALS['API']->get('user', null);
		$model 	= TuiyoLoader::model("articles", true);
  	
		//styles
		//$document->addCSS(TUIYO_STYLEDIR.'/css/articles.css');
		$document->addJS( TUIYO_STYLEDIR.'/script/articles.js');
		$document->addJS( TUIYO_STREAM );
		$document->addJS( TUIYO_OEMBED );
		
		$pModel 		= TuiyoLoader::model("applications", true);
		$plugins		= $pModel->getAllSystemPlugins("services", false); 
		$styleDir 		= TUIYO_LIVE_PATH.'/client/default/';
		$tmplPath 		= TUIYO_VIEWS.DS."profile".DS."tmpl" ;
		$tmplVars 		= array(
			"styleDir"		=>TUIYO_STYLEDIR,
			"user"			=>$user,
			"sharewith" 	=>array("p00"=>"@everyone"),
		    "plugins"   	=> $plugins,
			"canPost"		=>(!$user->joomla->get('guest') ) ? 1 : 0 			
		);
		$activity 		= $document->parseTmpl("activity" , $tmplPath , $tmplVars);
		$myarticles		= $model->getArticlesStream($user->id);
		$allarticles	= $model->getArticlesStream();
		$article 		= $model->getArticle( $articleID, $user->id );
		
		$this->assignRef("article", $article );
		
		$GLOBALS['mainframe']->getPathway()->addItem( _("Articles") );
		$document->setPageTitle( $article['story']->posttitle );
		
		$this->assignRef("activity", $activity );
		$this->setLayout("read");
		$this->setLayoutExt("tpl");
		
		$canpost		= (!$user->joomla->get('guest') ) ? 1 : 0 ;
		$categories 	= $model->getArticlesCategories();

		$this->assignRef('livestyle', $styleDir );
		$this->assignRef("categories", $categories);
		$this->assignRef("user", $user);
		$this->assignRef("canpost", $canpost);
		
		parent::display( $tpl );
		
	}
}