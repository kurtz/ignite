<?php  defined('TUIYO_EXECUTE' ) || die; ?>
<div id="w1" class="windowWrapperShadow">
    <div class="windowWrapper">
        <div class="window" style="background: #fff">
            <div class="windowTitleBar">
                <img src="<?php echo $iconPath ?>/icons/appengine_16.png" alt="hpact16" style="cursor: pointer" />
                <strong><?php echo _('Recent activity'); ?></strong>
            </div>
            <div class="windowBody" style="padding: 18px; margin-top: 5px;">
        		<div class="tuiyoTable">
                    <div class="tuiyoTableRow">
                        <div class="tuiyoTableCell" style="width: 55%;">
                        
                        	<?php echo $activity; ?>
                                                                 
                        </div>
                        <div class="tuiyoTableCell" style="width: 45%;">
                        	                                     
                        </div>
                        <div class="tuiyoClearFloat"></div>
                    </div>
                </div>            
            </div>
        </div>   
    </div>
</div>