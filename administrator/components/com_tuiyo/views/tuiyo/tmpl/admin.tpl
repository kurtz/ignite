
<div id="nav">
    <?php echo $view->getmenu(); ?>
</div>
<div id="header" style="position: relative">
    <a href="index.php?option=com_tuiyo"><img style="margin: 10px 20px"src="<?php echo $iconPath ?>/images/logo2.png"  /></a>
    <div id="TuiyoAjaxLoading" style="float: left">
        <img src="components/com_tuiyo/style/images/ajaxactivity.gif" />
    </div>
    <div class="reporter" style="position:absolute; top: 10px; left: 130px"><jdoc:include type="message" /></div>
    <div>
        <ul id="tabs">
            <?php
            $i = 0;
            $active = false;
            $act = JRequest::getVar("action", null);
            $tablists = (isset($view->tabgroups[$view->tabgroup])) ? $view->tabgroups[$view->tabgroup] : $view->tabgroups['_default'];
            foreach ($tablists as $tab => $href) {
                parse_str($href);
                if (isset($action) && (string) $action === (string) $act) {
                    $active = true;
                } elseif (empty($act) && $i < 1) {
                    $active = true;
                }
                ?><li><a href="<?php echo $href ?>" <?php if ($active) : echo 'class="active"';
                endif; ?> ><?php echo $tab ?></a></li> <?php
                $i++;
                $active = false;
            }
            ?>
        </ul>
        <ul id="search">
            <li><form id="searchForm" class="TuiyoForm"><input type="text" name="search" style="padding: 7px;width: 230px;"placeholder="search" /></form></li>
        </ul>
    </div>
</div>
<div id="main">
    <div id="sidebar">
        <div class="section">
            <h3>Members Online</h3>
<?php if (count((array) $usersonline) < 1) : ?>
                <div class="TuiyoNotification TuiyoAttention"><?php echo _('A list of the recent people to visit your profile will be displayed here '); ?></div> 
<?php endif;
$loaded = array(); ?>
            <?php foreach ((array) $usersonline as $visitor) : $visitor->API = & TuiyoAPI::get("user", (int) $visitor->userid);
                if (in_array($visitor->userid, $loaded)) {
                    continue;
                } ?>
                <div align="center" title="<?php echo $visitor->API->name ?> visited <?php echo TuiyoTimer::diff(strtotime($visitor->date)) ?>" 
                     class="friendListItem" style="width:35px; float: left; padding: 1px; margin: 2px; height:35px">
                    <a href="<?php echo JRoute::_(JURI::root() . 'index.php?option=com_tuiyo&amp;view=profile&amp;do=view&user=' . $visitor->API->username) ?>">
                    <img class="TuiyoUserAvatar" src="<?php echo $visitor->API->getUserAvatar((int) $visitor->userid)->thumb35 ?>" 
                         style="border:1px solid #ccc; padding:2px;">
                    </a>
                </div>  
    <?php $loaded[] = $visitor->userid;
endforeach; ?>
            <div class="tuiyoClearFloat"></div>
        </div>                                             
    </div>
    <div id="page">
<?php echo $adminPage ?>
    </div>
</div>
<div id="footer">
    <p>&copy; 2006, 2007, 2008, 2009, 2010, 2011 <a href="http://www.drstonyhills.com/">dr.stonyhills</a> and Powered by Joomla</p>
    <p><?php echo $version ?> Licensed as GPLv2.1 </p>
</div>
