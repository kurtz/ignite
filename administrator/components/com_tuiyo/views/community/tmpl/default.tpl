<?php  defined('TUIYO_EXECUTE' ) || die; ?>
<div id="w1" class="windowWrapperShadow">
    <div class="windowWrapper">
        <div class="window" style="background: #fff">
            <div class="windowTitleBar">
                <img src="<?php echo $iconPath ?>/icons/users_16.png" style="cursor: pointer" />
                <strong>Community Members</strong>
            </div>
            <div class="windowBody" style="padding: 18px; margin-top: 5px;">
               <?php echo $lists ?>     
            </div>
       </div>
    </div>
</div>