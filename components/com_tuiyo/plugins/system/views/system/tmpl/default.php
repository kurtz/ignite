<div class="tuiyoTable">
	<div class="tuiyoTableRow">
		<div class="tuiyoTableCell" style="width: 50%">
			<div class="tuiyoColumn" id="tuiyoColumn1Pad">
				<div class="pagePublisherTabs">
	                <ul class="publisherTabItems" id="publisherHp1">	                    
	                  	<li style="padding: 0pt 20px;" id="timelineReload">
							<a href="<?php echo JRoute::_( TUIYO_INDEX."&view=services&service=system&do=chatbox");  ?>"><span><?php echo _('Public Room')?></span></a>
						</li>
						<?php if(isset($this->chatroom[0])): ?>
							<li style="padding: 0pt 20px;"><a href="#" rel="<?php echo "#".$this->chatroom[0]->name ?>"><span><?php echo "#".$this->chatroom[0]->name ?></span></a></li>
						<?php endif; ?>
	                </ul>
	             	<div class="tuiyoClearFloat"></div>
	             </div>
				 <div id="TuiyoApiBarChatRoom" class="TuiyobarItemDiv">
					<?php if(isset($this->chatroom[0])): ?>
						<div class="pageEl" style="display: block; margin-bottom: 10px">
							<input type="range" name="updateterval" min="0" step="5" max="100" value="0" />
							<div class="tooltip">Update every x seconds</div>
							<div class="tuiyoClearFloat" style="clear:both;"></div>
						</div>
					<?php endif; ?>
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
						<li style="border: none; padding: 0pt 7px; background: none"><form method="post" class="TuiyoForm" action="<?php echo JRoute::_(TUIYO_INDEX."&view=services&do=startChatRoom&service=system") ?>"><input type="text" name="nTuiyoChat" id="nTuiyoChat" style="padding: 4px; width: 100px" placeholder="<?php echo _('Enter #hashtag') ?>" value="" /><button type="submit">Start</button><?php echo JHTML::_('form.token')?></form></li>
	                </ul>
	                <div class="tuiyoClearFloat"></div>
                </div>
				<div class="TuiyoApiChatRoomPanel">
					<div class="pageEl" id="chatRoomDirectory" style="display: block">
						
						<?php if(isset($this->chatroom[0]) ): ?>
							<div class="aTAHead dashBoardWidgetBodySubHead"><?php echo sprintf(_('Video and audio feeds for #%s channel'), $this->chatroom[0]->name ) ?></div>
							<div id="videoframe">
								
								<div class="tuiyoClearFloat">&nbsp;</div>
							</div>
							<div id="tokbox_console"></div>
							<div class="tuiyoClearFloat" style="clear:both"></div>
						   	<div class="dashboardWidgetFooter tuiyoTable" style="margin-bottom: 10px">
		                    	<div class="tuiyoTableRow">
		                    		<div class="tuiyoTableCell" style="width: 50%"><a href="#" class="connectToFeed"><?php echo _('Connect')?></a></div>
		                    		<div class="tuiyoTableCell" style="width: 50%" align="right"><a href="#" style="display:none" class="publishToFeed"><?php echo _('Publish') ?></a></div>
		                    		<div style="clear: both"></div>
		                    	</div>
		                    </div>
						<?php endif;  ?>
						
						<div class="aTAHead dashBoardWidgetBodySubHead">All Rooms</div>
						<?php foreach((array)$this->rooms as $room) : ?>
							<a href="<?php echo JRoute::_( TUIYO_INDEX."&view=services&service=system&do=chatbox&room=".$room->name , false); ?>" class="chatRoomTag"><span ><?php echo $room->name ?></span></a>
						<?php endforeach;  ?>
					</div>
					<div class="pageEl" id="chatRoomCreator" style="display: none">Settings</div>

				</div>
			</div>
		</div>
		<div style="clear:both"></div>
	</div>
</div>
