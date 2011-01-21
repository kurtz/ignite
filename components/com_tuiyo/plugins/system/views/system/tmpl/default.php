<div class="tuiyoTable">
	<div class="tuiyoTableRow">
		<div class="tuiyoTableCell" style="width: 50%">
			<div class="tuiyoColumn" id="tuiyoColumn1Pad">
				<div class="pagePublisherTabs">
	                <ul class="publisherTabItems" id="publisherHp1">	                    
	                  	<li style="padding: 0pt 20px;" class="current" id="timelineReload"><a href="#"><span><?php echo _('Public Room')?></span></a></li>
						<li style="padding: 0pt 20px;"><a href="#"><span><?php echo _('#joomla')?></span></a></li>
	                </ul>
	             	<div class="tuiyoClearFloat"></div>
	             </div>
				 <div id="TuiyoApiBarChatRoom" class="TuiyobarItemDiv">
					<div class="pageEl" id="chatRoomSettings" style="display: block; padding: 0 0 10px 0">RealTime Settings</div>
				    <div class="pageEl"><?php echo $this->activity ?></div>
				 </div>
				
				<form  action="<?php echo JRoute::_('index.php?format=json'); ?>" method="post" name="chatRoomFormUpdater" id="chatRoomFormUpdater" >
				   <?php echo JHTML::_('form.token') ; ?>
				    <input type="hidden" name="format" value="json" />
				    <input type="hidden" name="option" value="com_tuiyo" />
				    <input type="hidden" name="controller" value="chat" />
				    <input type="hidden" name="do" value="autoUpdateChatRoom" />
				    <input type="hidden" name="chatRoom" value="<?php echo $this->chatroom['roomID'] ?>" />
				    <input type="hidden" name="status" id="updaterStatus" value="0" />
				    <input type="hidden" name="nickname" value="@<?php echo $this->user->username ?>" />    
				    <input type="hidden" name="userID" value="<?php echo (int)$this->user->id ?>" />    
				</form>	             
	             
			</div>
		</div>
		<div class="tuiyoTableCell" style="width: 50%">
			<div class="tuiyoColumn" id="tuiyoColumn2Pad">
				<div class="pagePublisherTabs">
	                <ul class="publisherTabItems" id="publisherHp2">	                    
	                  	<li style="padding: 0pt 20px;" class="current"><a href="#"><span><?php echo _('Browse live chats')?></span></a></li>
						<li style="border: none; padding: 0pt 7px; background: none"><form method="post" class="TuiyoForm" action="<?php echo JRoute::_(TUIYO_INDEX."&view=services&do=startChatRoom&service=system") ?>"><input type="text" name="nTuiyoChat" id="nTuiyoChat" style="padding: 4px; width: 195px" placeholder="<?php echo _('Create a new #hashtag live chat') ?>" value="" /><button type="submit">Create</button><?php echo JHTML::_('form.token')?></form></li>
	                </ul>
	                <div class="tuiyoClearFloat"></div>
                </div>
				<div class="TuiyoApiChatRoomPanel">
					<div class="pageEl" id="chatRoomDirectory" style="display: block">Directory</div>
					<div class="pageEl" id="chatRoomCreator" style="display: block">Settings</div>

				</div>
			</div>
		</div>
		<div style="clear:both"></div>
	</div>
</div>
