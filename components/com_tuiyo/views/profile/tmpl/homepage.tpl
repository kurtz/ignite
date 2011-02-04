<?php defined('TUIYO_EXECUTE') || die; ?>
<div class="tuiyoTable">
	<div class="tuiyoTableRow">
		<div class="tuiyoTableCell" style="width: 50%">
			<div class="tuiyoColumn" id="tuiyoColumn1Pad">
				<div class="pagePublisherTabs">
	                <ul class="publisherTabItems" id="publisherHp1">	                    
	                  	<li style="padding: 0pt 20px;" class="current" id="timelineReload" option="" optionvalue=""><a href="#"><span><?php echo _('@everyone')?></span></a></li>
	                  	<li style="padding: 0pt 20px;" id="timelineMentions" option="mention" optionvalue="<?php echo $this->user->username ?>"><a href="#"><span><?php echo sprintf('@%s (mentioned)' , $this->user->username)?></span></a></li>
	                  	<li style="padding: 0pt 20px;" id="timeline" option="usertimeline" optionvalue="<?php echo $this->user->id ?>"><a href="#"><span><?php echo _('Profile')?></span></a></li>
	                </ul>
	             	<div class="tuiyoClearFloat"></div>
	             </div>
				<?php echo $this->activity ?> 
			</div>
		</div>
		<div class="tuiyoTableCell" style="width: 50%">
			<div class="tuiyoColumn" id="tuiyoColumn2Pad">
				<div class="pagePublisherTabs">
	                <ul class="publisherTabItems" id="publisherHp2">	                    
	                  	<li style="padding: 0pt 20px;" class="current" id="homepageMainPage"><a href="#"><span><?php echo _('Dashboard')?></span></a></li>
	                  	<li style="padding: 0pt 20px;"  id="notificationMainPage"><a href="#"><span><?php echo _('Notifications')?></span></a><span class="commentCount" style="display:none">11</span></li>
	                  	<li style="border: none; padding: 0pt 7px; background: none" id="searchMainPage">
	                  		<form method="post" class="TuiyoForm"><input type="text" name="gSearchTuiyo" id="gSearchTuiyo" style="padding: 4px; width: 195px" placeholder="<?php echo _('Looking for Something?') ?>" value="" /></form>
	                  	</li>
	                </ul>
	             	<div class="tuiyoClearFloat"></div>
	         	</div>
				<?php echo $this->content ?> 
			</div>
		</div>
		<div style="clear:both"></div>
	</div>
</div>