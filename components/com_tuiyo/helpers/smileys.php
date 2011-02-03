<?php

/**
 * ******************************************************************
 * Tuiyo Smileys                                        *
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
defined('TUIYO_EXECUTE') or die('NotAuthorised');

/**
 * TuiyoTimer
 * @package Tuiyo For Joomla
 * @author Livingstone Fultang
 * @copyright 2009
 * @version $Id$
 * @access public
 */
class TuiyoSmileys {

    static $smileys = array(
//	smiley			image name						width	height	alt

        ':-)' => array('grin.gif', '16', '16', 'grin'),
        ':lol:' => array('lol.gif', '16', '16', 'LOL'),
        //@TODO add image;
        ':cheese:' => array('cheese.gif', '16', '16', 'cheese'),
        ':)' => array('grin.gif', '16', '16', 'smile'),
        ';-)' => array('wink.gif', '16', '16', 'wink'),
        ';)' => array('wink.gif', '16', '16', 'wink'),
        ':smirk:' => array('smirk.gif', '16', '16', 'smirk'),
        ':roll:' => array('rolleyes.gif', '16', '16', 'rolleyes'),
        ':-S' => array('confused.gif', '16', '16', 'confused'),
        ':wow:' => array('surprise.gif', '16', '16', 'surprised'),
        ':bug:' => array('bigsurprise.gif', '16', '16', 'big surprise'),
        ':-P' => array('tongue_laugh.gif', '16', '16', 'tongue laugh'),
        '%-P' => array('tongue_rolleye.gif', '16', '16', 'tongue rolleye'),
        ';-P' => array('tongue_wink.gif', '16', '16', 'tongue wink'),
        ':P' => array('tongue_laugh.gif', '16', '16', 'raspberry'),
        ':blank:' => array('blank.gif', '16', '16', 'blank stare'),
        ':long:' => array('longface.gif', '16', '16', 'long face'),
        ':ohh:' => array('ohh.gif', '16', '16', 'ohh'),
        ':grrr:' => array('grrr.gif', '16', '16', 'grrr'),
        ':gulp:' => array('gulp.gif', '16', '16', 'gulp'),
        '8-/' => array('ohoh.gif', '16', '16', 'oh oh'),
        ':down:' => array('downer.gif', '16', '16', 'downer'),
        ':red:' => array('embarrassed.gif', '16', '16', 'red face'),
        ':sick:' => array('sick.gif', '16', '16', 'sick'),
        ':shut:' => array('shuteye.gif', '16', '16', 'shut eye'),
        ':-/' => array('hmm.gif', '16', '16', 'hmmm'),
        '>:(' => array('mad.gif', '16', '16', 'mad'),
        ':mad:' => array('mad.gif', '16', '16', 'mad'),
        '>:-(' => array('angry.gif', '16', '16', 'angry'),
        ':angry:' => array('angry.gif', '16', '16', 'angry'),
        ':zip:' => array('zip.gif', '16', '16', 'zipper'),
        ':kiss:' => array('kiss.gif', '16', '16', 'kiss'),
        ':ahhh:' => array('shock.gif', '16', '16', 'shock'),
        ':coolsmile:' => array('cool.gif', '16', '16', 'cool smile'),
        ':coolsmirk:' => array('shade_smirk.gif', '16', '16', 'cool smirk'),
        ':coolgrin:' => array('shade_grin.gif', '16', '16', 'cool grin'),
        ':coolhmm:' => array('shade_hmm.gif', '16', '16', 'cool hmm'),
        ':coolmad:' => array('shade_mad.gif', '16', '16', 'cool mad'),
        ':coolcheese:' => array('shade_cheese.gif', '16', '16', 'cool cheese'),
        ':vampire:' => array('vampire.gif', '16', '16', 'vampire'),
        ':snake:' => array('snake.gif', '16', '16', 'snake'),
        ':exclaim:' => array('exclaim.gif', '16', '16', 'excaim'),
        ':question:' => array('question.gif', '16', '16', 'question') // no comma after last item
    );

    public function parse($text, $smileys = array(), $sourcePath = "") {

        //Configuration to enable smileys?
        //Check that we have a valid smiley array;
        $smileys = (!empty($smileys)) ? $smileys : self::$smileys;
        $sourcePath = (!empty($sourcePath)) ? preg_replace("/(.+?)\/*$/", "\\1/", $sourcePath) : TUIYO_STYLEDIR . "/smileys/";

        //Replace
        foreach ($smileys as $key => $val) {
            $text = str_replace($key, "<img src=\"" . $sourcePath . $smileys[$key][0] . "\" width=\"" . $smileys[$key][1] . "\" height=\"" . $smileys[$key][2] . "\" alt=\"" . $smileys[$key][3] . "\" style=\"border:0;\" />", $text);
        }


        return $text;
    }

}