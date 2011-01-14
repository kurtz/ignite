<?php  defined('TUIYO_EXECUTE' ) || die; ?>
<div id="w1" class="windowWrapperShadow">
    <div class="windowWrapper">
        <div class="window" style="background: #fff">
            <div class="windowTitleBar">
                <img src="<?php echo $iconPath ?>/icons/users_16.png" style="cursor: pointer" />
                <strong>Installed Translations</strong>
            </div>
            <div class="windowBody" style="padding: 18px; margin-top: 5px;">
	<div align="center">
    	<?php if(sizeof($langs) > 0 ) : ?>
            <?php foreach($langs as $lang) : ?>
                <div style="float: left;">
                    <div class="icon">
                        <a href="<?php echo TUIYO_INDEX.'&context=systemtools&do=languagemgr&action=edit&amp;l='.$lang['name'] ?>">
                        	<img src="<?php echo JURI::root(true) ?>/components/com_tuiyo/locale/<?php echo $lang['name']?>/<?php echo $lang['name'] ?>.png" 
                            	 alt="<?php echo $lang['name'] ?>">
                        	<span><?php echo $lang['name'] ?></span>
                        </a>
                    </div>
                </div>
            <?php endforeach; ?>
         <?php endif; ?>
         <div class="clearfloat clearer" style="clear: both" ></div>        
     </div>
</div>
</div></div></div>