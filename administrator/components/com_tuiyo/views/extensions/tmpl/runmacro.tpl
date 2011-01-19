<?php  defined('TUIYO_EXECUTE' ) || die; ?>
<div id="w1" class="windowWrapperShadow">
    <div class="windowWrapper">
        <div class="window" style="background: #fff">
            <div class="windowTitleBar">
                <img src="<?php echo $iconPath ?>/icons/file_config_16.png" style="cursor: pointer" />
                <strong>Macros and Scripts</strong>
            </div>
            <div class="windowBody" style="padding: 18px; margin-top: 5px;">
				<iframe src="<?php echo JRoute::_(TUIYO_INDEX."&amp;context=extensions&amp;do=runmacroscript&amp;i=".$macro) ?>" style="width: 100%; height: 100%; min-height: 450px;" frameborder="0"></iframe>
			</div>
		</div>
	</div>
</div>