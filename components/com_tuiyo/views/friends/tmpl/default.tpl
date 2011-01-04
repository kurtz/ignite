<div class="tuiyoTable">
	<div class="tuiyoTableRow">
		<div class="tuiyoTableCell" style="width: 50%">
			<div class="tuiyoColumn" id="tuiyoColumn1Pad">
				<div class="pagePublisherTabs">
	                <ul class="publisherTabItems" id="publisherHp1">
	                	<li style="padding: 0pt 20px;" class="current" id="friendLists"><a href="#"><span><?php echo _('My Friends')?></span></a></li>
	                    <li style="padding: 0pt 20px;" id="groupLists"><a style="cursor: pointer"><span><?php echo _('My Groups');  ?></span></a></li>
	                    <li style="padding: 0pt 20px;" id="peopleLists"><a style="cursor: pointer"><span><?php echo _('People');  ?></span></a></li>
	                    <li style="padding: 0pt 20px;" id="inviteLists"><a style="cursor: pointer"><span><?php echo _('Request');  ?></span></a></li>
	                    <li style="padding: 0pt 20px;" id="explorerDiv"><a style="cursor: pointer"><span><?php echo _('Explore');  ?></span></a></li>
	                </ul>
	             	<div class="tuiyoClearFloat"></div>
	             </div>
	             
	             <!-- FRIENDS -->
				<div class="pageEl friendLists">
					<?php if( count($this->friends) < 1 ) :?>
                    	<div class="TuiyoNotification TuiyoAttention"><?php echo _('This user does not have any friends'); ?></div> 
                    <?php endif;?>
                        
                    <?php foreach((array)$this->friends as $friend) :  ?>
                        
                        	<div align="center" title="<?php echo $friend->name ?>" class="friendListItem" style="width:75px; float: left; padding: 4px; height:100px">
                                <a href="<?php echo JRoute::_( TUIYO_INDEX.'&amp;view=profile&amp;do=view&user='.$friend->username )  ?>" class="miniprofile" rel="<?php echo $friend->username ?>">
                                    <img class="TuiyoUserAvatar" src="<?php echo $friend->avatar->thumb70 ?>" style="border:1px solid #ccc; padding:2px;">
                                </a>
                                <span><?php echo $friend->username ?></span>
                            </div>  
                        <?php endforeach ; ?>
                        <div style="clear: both"></div>	
				</div>
				
				<!-- MEMBERS -->
				<div class="pageEl peopleLists tuiyoTable"  style="display: none">
				<?php if( count($this->members) < 1 ) :?>
                    	<div class="TuiyoNotification TuiyoAttention"><?php echo _('There are no members for this community'); ?></div> 
                    <?php endif;?>
                        
                   <?php foreach($this->members as $member): ?>
                        
                        <div align="center" title="<?php echo $member->name ?>" class="friendListItem" style="width:75px; float: left; padding: 4px; height:100px; position:relative">
                                <a href="<?php echo JRoute::_( TUIYO_INDEX.'&amp;view=profile&amp;do=view&user='.$member->username )  ?>" class="miniprofile" rel="<?php echo $member->username ?>">
                                    <img class="TuiyoUserAvatar" src="<?php echo $member->avatar->thumb70 ?>" style="border:1px solid #ccc; padding:2px;">
                                </a>
                                <span><?php echo $member->username ?></span>
                                <?php if(!$member->isUserFriend ) : ?>
                                        <a href="<?php echo JRoute::_(TUIYO_INDEX.'&amp;view=friends&amp;do=add&amp;pid='.$member->id, true ) ?>" 
                                          class="addIcon" title="<?php echo _('Add as Friend') ?>" style="position: absolute; top: 0; right: -6px;">&nbsp;</a>
                                    <?php endif; ?>
                            </div>  
                        <?php endforeach ; ?>
                        
                	<div class="tuiyoClearFloat"></div>
				</div>
				
				
				<div class="pageEl groupLists"  style="display: none">Group Directory</div>
				<div class="pageEl inviteLists" style="display: none">Invite Lists</div>
				<div class="pageEl explorerDiv" style="display: none">Explorer</div>
			</div>
		</div>
		<div class="tuiyoTableCell" style="width: 50%">
			<div class="tuiyoColumn" id="tuiyoColumn2Pad">
				
				<!--Agenda suggestion--> 
            	<div class="dashBoardWidget">
                	<div class="dashBoardWidgetBodySubHead"><?php echo _('Invite Friends')?></div>
                    <div class="dashBoardWidgetBody">
                        <div class="TuiyoNotification TuiyoInformation"><?php echo _('Upcoming Events will be displayed here'); ?></div>					
					</div>
                </div>
                
               	<!--Agenda suggestion--> 
            	<div class="dashBoardWidget">
                	<div class="dashBoardWidgetBodySubHead"><?php echo _('People you might know')?></div>
                    <div class="dashBoardWidgetBody">
                        <div class="TuiyoNotification TuiyoInformation"><?php echo _('Upcoming Events will be displayed here'); ?></div>					
					</div>
                </div>
                
			</div>
		</div>
		<div style="clear:both"></div>
	</div>
</div>