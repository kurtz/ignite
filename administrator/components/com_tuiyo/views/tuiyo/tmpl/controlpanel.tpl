<?php defined('TUIYO_EXECUTE') || die; ?>
<div id="w1" class="windowWrapperShadow">
    <div class="windowWrapper">
        <div class="windowTitleBar">
            <img src="<?php echo $iconPath ?>/icons/chart_16.png" alt="hpact16" style="cursor: pointer" />
            <strong><?php echo _('Welcome to the Tuiyo Administrator Panel'); ?></strong>
        </div>
        <div class="windowBody" style="padding: 18px; margin-top: 5px;">
            <?php echo $charts; ?>
        </div>
        <div class="window" style="background: #fff">
            <div class="windowTitleBar">
                <img src="<?php echo $iconPath ?>/icons/dashboard_16.png" alt="hpact16" style="cursor: pointer" />
                <strong><?php echo _('QuickTools and Utilities'); ?></strong>
            </div>
            <div class="windowBody" style="padding: 18px; margin-top: 5px;">
                <div style="float: left;">
                    <div class="icon" align="center" title="<?php echo _('Create a new user'); ?>">
                        <a href="<?php echo JRoute::_(TUIYO_INDEX . '&amp;context=communityManagement&amp;do=display&amp;action=create') ?>">
                        <img alt="#phts"  src="<?php echo $styleDir ?>/images/profile.png" align="middle"  /> 
                        <span><?php echo _('New User'); ?></span>
                        </a>
                    </div>
                </div>
                <div style="float: left;">
                    <div class="icon" align="center" title="<?php echo _('Send out global messages to all site members'); ?>">
                        <a href="<?php echo JRoute::_(TUIYO_INDEX . '&amp;context=systemTools&amp;do=editEmails&amp;action=create') ?>">
                        <img alt="#phts"  src="<?php echo $styleDir ?>/images/diary.png" align="middle"  /> 
                        <span><?php echo _('Mass mail'); ?></span>
                        </a>
                    </div>
                </div>

                <div style="float: left;">
                    <div class="icon" align="center" title="<?php echo _('View reports pending moderation and more'); ?>">
                        <a href="<?php echo JRoute::_(TUIYO_INDEX . '&amp;context=communityManagement&amp;do=moderator') ?>">
                        <img alt="#phts"  src="<?php echo $styleDir ?>/images/pencil.png" align="middle"  /> 
                        <span><?php echo _('View Reports'); ?></span>
                        </a>
                    </div>
                </div>
                <div style="float: left;">
                    <div class="icon" align="center" title="<?php echo _('Edit the layout of your site'); ?>">
                        <a href="<?php echo JRoute::_(TUIYO_INDEX . '&amp;context=SystemTools&amp;do=layoutmgr&amp;action=lists') ?>">
                        <img alt="#phts"  src="<?php echo $styleDir ?>/images/applications.png" align="middle"  /> 
                        <span><?php echo _('Edit Layout'); ?></span>
                        </a>
                    </div>
                </div>

                <div style="float: left;">
                    <div class="icon" align="center" title="<?php echo _('Manage plugins'); ?>">
                        <a href="<?php echo JRoute::_(TUIYO_INDEX . '&amp;context=extensions&amp;do=extensionmgr&amp;action=lists') ?>">
                        <img alt="#phts"  src="<?php echo $styleDir ?>/images/plugin.png" align="middle"  /> 
                        <span><?php echo _('Extensions'); ?></span>
                        </a>
                    </div>
                </div>
                <div style="float: left;">
                    <div class="icon" align="center" title="<?php echo _('Post a site announcement'); ?>">
                        <a href="<?php echo JRoute::_(TUIYO_INDEX . '&amp;context=communityManagement&amp;do=moderator&amp;action=announcements') ?>">
                        <img alt="#phts"  src="<?php echo $styleDir ?>/images/forum.png" align="middle"  /> 
                        <span><?php echo _('Announce'); ?></span>
                        </a>
                    </div>
                </div>

                <div style="float: left;">
                    <div class="icon" align="center" title="<?php echo _('Change the global settings of your site'); ?>">
                        <a href="<?php echo JRoute::_(TUIYO_INDEX . '&amp;context=SystemTools&amp;do=globalConfig') ?>">
                        <img alt="#phts"  src="<?php echo $styleDir ?>/images/settings.png" align="middle"  /> 
                        <span><?php echo _('Settings'); ?></span>
                        </a>
                    </div>
                </div>

                <div class="tuiyoClearFloat"></div>
            </div>
        </div>
        <div class="windowTitleBar">
            <img src="<?php echo $iconPath ?>/icons/appengine_16.png" alt="hpact16" style="cursor: pointer" />
            <strong><?php echo _('Macros and Scripts'); ?></strong>
        </div>
        <div class="windowBody" style="padding: 18px; margin-top: 5px;">
            <?php foreach ($macros as $i => $macro): ?>
                <div style="float: left;">
                    <div class="icon" align="center" title="<?php echo _('Run Macro'); ?>">
                        <a href="<?php echo JRoute::_(TUIYO_INDEX . '&amp;context=SystemTools&amp;do=autocenter&amp;run=' . $macro) ?>">
                        <img alt="#phts"  src="<?php echo $styleDir ?>/images/macros.png" align="middle"  /> 
                        <span><?php echo ucfirst($macro); ?></span>
                        </a>
                    </div>
                </div>
            <?php endforeach; ?>
            <div class="tuiyoClearFloat"></div>
        </div>
    </div>
</div>