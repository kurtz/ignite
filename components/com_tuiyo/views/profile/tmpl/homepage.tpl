<div class="tuiyoTable">
	<div class="tuiyoTableRow">
		<div class="tuiyoTableCell" style="width: 50%">
			<div class="tuiyoColumn" id="tuiyoColumn1Pad">
				<div class="pagePublisherTabs">
	                <ul class="publisherTabItems" id="publisherHp1">	                    
	                  	<li style="padding: 0pt 20px;" class="current" id="timelineReload"><a href="#"><span><?php echo _('Coffe Room')?></span></a></li>
	                  	<li style="padding: 0pt 20px;" id="timelineMentions"><a href="#"><span><?php echo sprintf('@%s' , $this->user->username)?></span></a></li>
	                  	<li style="padding: 0pt 20px;" id="timeline"><a href="#"><span><?php echo _('Timeline')?></span></a></li>
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
	                  		<form method="post" class="TuiyoForm"><input type="text" name="gSearchTuiyo" id="gSearchTuiyo" style="padding: 4px; width: 195px" value="<?php echo _('Looking for Something?') ?>" /></form>
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