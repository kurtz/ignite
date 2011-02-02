<div class="tuiyoTable">
	<div class="tuiyoTableRow">
		<div class="tuiyoTableCell" style="width: 50%">
			
			<div class="tuiyoColumn" id="tuiyoColumn1Pad">

				<div class="pagePublisherTabsFB" align="right">
	                <ul class="publisherTabItemsFB">
	                	<li style="padding: 0pt 18px;" type="community" class="current"><a href="#"><span><?php echo _('...')?></span></a></li>
	                    <li style="padding: 0pt 18px;" type="community" ><a href="#"><span><?php echo _('Photos')?></span></a></li>
	                    <li style="padding: 0pt 18px;" type="community" ><a href="#"><span><?php echo _('Notes')?></span></a></li>
	                    <li style="padding: 0pt 18px;" type="community" ><a href="#"><span><?php echo _('Pages')?></span></a></li>
	                    <li style="padding: 0pt 18px;" type="community" ><a href="#"><span><?php echo _('Inbox')?></span></a></li>
	                </ul>
	             	<div class="tuiyoClearFloat"></div>
	             </div>
	             <div class="reporter"><jdoc:include type="message" /></div>
            	<div class="pageBody"><?php print_R($this->data) ?></div>
			</div>
		</div>
		<div class="tuiyoTableCell" style="width: 50%">
			<div class="tuiyoColumn" id="tuiyoColumn2Pad">
				<div class="pagePublisherTabs">
	                <ul class="publisherTabItems">
	                	<li style="padding: 0pt 18px;" type="community"><a href="#"><span><?php echo _('Invite friends')?></span></a></li>
	                    <li style="padding: 0pt 18px;" type="community" class="current"><a href="#"><span><?php echo _('Our Community')?></span></a></li>
	                </ul>
	             	<div class="tuiyoClearFloat"></div>
	             </div>
				<?php echo $this->activity ?>
			</div>
		</div>
		<div class="tuiyoClearFloat"></div>
	</div>
</div>