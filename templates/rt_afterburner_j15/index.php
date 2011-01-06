<?php
/**
 * @copyright	Copyright (C) 2005 - 2009 RocketTheme, LLC - All Rights Reserved.
 * @license		GNU/GPL, see LICENSE.php
**/
defined( '_JEXEC' ) or die( 'Restricted access' );
define('YOURBASEPATH', dirname(__FILE__));

$color_style			= $this->params->get("colorStyle", "light4");
$template_width 		= $this->params->get("ptemplateWidth", "962");
$leftcolumn_width		= $this->params->get("pleftcolumnWidth", "210");
$rightcolumn_width		= $this->params->get("prightcolumnWidth", "210");
$leftcolumn_color		= $this->params->get("leftcolumnColor", "color2");
$rightcolumn_color		= $this->params->get("rightcolumnColor", "color1");
$mootools_enabled       = ($this->params->get("mootools_enabled", 1)  == 0)?"false":"true";
$caption_enabled        = ($this->params->get("caption_enabled", 1)  == 0)?"false":"true";
$rockettheme_logo       = ($this->params->get("rocketthemeLogo", 1)  == 0)?"false":"true";

/** Getting tuiyo user style settings **/
$session 	= JSession::getInstance('none',array());
//$uparams  	= $session->get("TUIYO_STYLE") ;

$bgImage 	= '';//$uparams->get("bgImgURL");

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  xmlns:fb="http://www.facebook.com/2008/fbml" xml:lang="<?php echo $this->language; ?>" lang="<?php echo $this->language; ?>" >
<head>
<jdoc:include type="head" />
<?php
require(YOURBASEPATH . DS . "rt_utils.php");
?>
<link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/rt_afterburner_j15/css/style.css" type="text/css" />
<link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/rt_afterburner_j15/css/<?php echo $color_style ?>.css" type="text/css" />
<!--[if lte IE 6]>
<script type="text/javascript" src="<?php echo $this->baseurl ?>/templates/rt_afterburner_j15/js/ie_suckerfish.js"></script>
<link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/rt_afterburner_j15/css/styles.ie.css" type="text/css" />
<![endif]-->
<!--[if lte IE 7]>
<link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/rt_afterburner_j15/css/styles.ie7.css" type="text/css" />
<![endif]-->
</head>
<body <?php echo !empty($bgImage)? 'style="background-image:url(\''.$bgImage.'\')"' : null ?>>		
<div id="nav">
	<div class="nav_width" style="width: 1038px; margin: 0 auto;">
    	<jdoc:include type="modules" name="nav" style="none" />
    </div>
</div>
<div id="message">
    <jdoc:include type="message" />
</div>
<div id="main" style="margin: 50px 0 ">
	<div id="wrapper" class="foreground">
		<?php if ($this->countModules('showcase')) : ?>
		<div id="showcase" class="dp100">
			<div class="background"></div>
			<div class="foreground">
		    	<jdoc:include type="modules" name="showcase" style="none" />
		    </div>
		</div>
		<?php endif; ?>
		<jdoc:include type="modules" name="advertisement" style="afterburner" />
        <div id="main-content" class="<?php echo $col_mode; ?>">
            <div id="colmask" class="ckl-<?php echo $leftcolumn_color; ?>">
                <div id="colmid" class="cdr-<?php echo $rightcolumn_color; ?>">
                    <div id="colright" class="ctr-<?php echo $rightcolumn_color; ?>">
                        <div id="col1wrap">
							<div id="col1pad">
                            	<div id="col1" style="background: #fff">
									<?php if ($this->countModules('user1 or user2 or user3')) : ?>
									<div id="mainmods" class="spacer<?php echo $mainmod_width; ?>">
										<jdoc:include type="modules" name="user1" style="afterburner" />
										<jdoc:include type="modules" name="user2" style="afterburner" />
										<jdoc:include type="modules" name="user3" style="afterburner" />
									</div>
									<?php endif; ?>
                                    <div class="component-pad">
                                        <jdoc:include type="component" />
                                    </div>
									<?php if ($this->countModules('user4 or user5 or user6')) : ?>
									<div id="mainmods2" class="spacer<?php echo $mainmod2_width; ?>">
										<jdoc:include type="modules" name="user4" style="afterburner" />
										<jdoc:include type="modules" name="user5" style="afterburner" />
										<jdoc:include type="modules" name="user6" style="afterburner" />
									</div>
									<?php endif; ?>
									
	                            </div>
							</div>
                        </div>
						<?php if ($leftcolumn_width != 0) : ?>
                        <div id="col2" class="<?php echo $leftcolumn_color; ?>">
                        	<jdoc:include type="modules" name="left" style="afterburner" />
                        </div>
						<?php endif; ?>
						<?php if ($rightcolumn_width != 0) : ?>
                        <div id="col3" class="<?php echo $rightcolumn_color; ?>">
                        	<jdoc:include type="modules" name="right" style="afterburner" />
                        </div>
						<?php endif; ?>
                    </div>
                </div>
            </div>
        </div>
		<?php if ($this->countModules('user7 or user8 or user9')) : ?>
		<div id="mainmods3" class="spacer<?php echo $mainmod3_width; ?>">
			<jdoc:include type="modules" name="user7" style="afterburner" />
			<jdoc:include type="modules" name="user8" style="afterburner" />
			<jdoc:include type="modules" name="user9" style="afterburner" />
		</div>
		<?php endif; ?>
	</div>
	<div id="footer-wrapper" style="width: 1038px; margin: 10px auto;">
		<?php if ($this->countModules('breadcrumb')) : ?>
		<div class="breadcrumbs-pad">
			<div class="breadcrumps_width">
		   		<jdoc:include type="modules" name="breadcrumb" />
		   	</div>
		</div>
		<?php endif; ?>
		<?php if ($this->countModules('bottom')) : ?>
		<div id="footer">
			<div class="footer-pad">
                <jdoc:include type="modules" name="bottom" style="none" />
            </div>
		</div>
		<?php endif; ?>
		<?php if ($rockettheme_logo=="true") : ?>
		<a href="http://www.rockettheme.com"><span id="logo2"></span></a>
		<?php endif; ?>
		<jdoc:include type="modules" name="footer" style="afterburner" />
		<jdoc:include type="modules" name="debug" style="none" />
	</div>
</div>
</body>
</html>