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
	             <div style="background: #f5f5f5; padding: 4px"><input type="text" placeholder="Can't find Something? Try searching" style="border:1px solid #ccc; padding: 8px; width: 96%" /></div>
	             <!-- FRIENDS -->
				<div class="pageEl friendLists">
					<?php if( count($this->friends) < 1 ) :?>
                    	<div class="TuiyoNotification TuiyoAttention"><?php echo _('This user does not have any friends'); ?></div> 
                    <?php endif;?>
                        
                    <?php foreach((array)$this->friends as $friend) : ?>     
                         <div class="memberListItem" style="margin: 0; padding: 10px 0; border-bottom: 1px solid #eee">
                        	<div class="tuiyoTableCell" style="width: 18%">
                        		<a  href="<?php echo JRoute::_( TUIYO_INDEX.'&amp;view=profile&amp;do=view&user='.$friend->username )  ?>" class="miniprofile" rel="<?php echo $friend->username ?>">
                                    <img class="TuiyoUserAvatar" src="<?php echo $friend->avatar->thumb70 ?>" style="border:1px solid #ccc; padding:2px;">
                                </a>
                        	</div>
                        	<div class="tuiyoTableCell" style="width: 82%; position:relative">
                        		<a  href="<?php echo JRoute::_( TUIYO_INDEX.'&amp;view=profile&amp;do=view&user='.$friend->username )  ?>"><strong><?php echo $friend->name ?></strong></a> <span style="font-style:italics"><?php echo $friend->username ?></span>
                        		<a style="position: absolute; top: 10px; right: 5px" href="<?php echo JRoute::_(TUIYO_INDEX.'&amp;view=friends&amp;do=remove&amp;pid='.$friend->userID, true ) ?>" class="button" title="<?php echo _('Remote Friend') ?>" style="position: absolute; top: 0; right: -6px;"><?php echo _('Unfollow') ?></a>
                        	</div>
                        	<div class="tuiyoClearFloat"></div>
                        </div>  
                	<?php endforeach ; ?>

                        
                    <div class="bigPagination" align="center" style="display: block; "><a>Load More People</a></div>
                    <div style="clear: both"></div>	
				</div>
				
				<!-- MEMBERS -->
				<div class="pageEl peopleLists tuiyoTable"  style="display: none">
				<?php if( count($this->members) < 1 ) :?>
                    	<div class="TuiyoNotification TuiyoAttention"><?php echo _('There are no members for this community'); ?></div> 
                    <?php endif;?>
                        
                   <?php foreach($this->members as $member): ?>
                        
                    
                         <div class="memberListItem" style="margin: 0; padding: 10px 0; border-bottom: 1px solid #eee">
                        	<div class="tuiyoTableCell" style="width: 18%">
                        		<a href="<?php echo JRoute::_( TUIYO_INDEX.'&amp;view=profile&amp;do=view&user='.$member->username )  ?>" class="miniprofile" rel="<?php echo $member->username ?>">
                                    <img class="TuiyoUserAvatar" src="<?php echo $member->avatar->thumb70 ?>" style="border:1px solid #ccc; padding:2px;">
                                </a>
                        	</div>
                        	<div class="tuiyoTableCell" style="width: 82%; position:relative">
                        		<a href="<?php echo JRoute::_( TUIYO_INDEX.'&amp;view=profile&amp;do=view&user='.$member->username )  ?>"> <strong><?php echo $member->name ?></strong></a> <span style="font-style:italics"><?php echo $member->username ?></span>
                        		<?php if(!$member->isUserFriend ) : ?>
                                      <a style="position: absolute; top: 10px; right: 5px" href="<?php echo JRoute::_(TUIYO_INDEX.'&amp;view=friends&amp;do=add&amp;pid='.$member->id, true ) ?>" class="button" title="<?php echo _('Add as Friend') ?>" style="position: absolute; top: 0; right: -6px;"><?php echo _('Follow') ?></a>
                                <?php endif; ?>
                        	</div>
                        	<div class="tuiyoClearFloat"></div>
                        </div>
                        
                        <?php endforeach ; ?>
                        
                        <div class="memberListItem">
                        	<div class="tuiyoTableCell" style="width: 20%"></div>
                        	<div class="tuiyoTableCell" style="width: 80%"></div>
                        	<div class="tuiyoClearFloat"></div>
                        </div>
                        
                        <div class="bigPagination" align="center" style="display: block; "><a>Load More People</a></div>
                        
                	<div class="tuiyoClearFloat"></div>
				</div>
				
				
				<div class="pageEl groupLists"  style="display: none">
						<?php if(sizeof($this->groups )<1 ) : ?>                   
                            <div class="TuiyoNotification TuiyoInformation"><?php echo sprintf( _( '%s is still not a member of any group'), ucfirst($this->user->username) )?></div>   
                        <?php else : ?>
                            <?php foreach($this->groups as $rGroup ) : ?>                     
		                         <div class="memberListItem" style="margin: 0; padding: 10px 0; border-bottom: 1px solid #eee">
		                        	<div class="tuiyoTableCell" style="width: 18%">
		                        		<a  href="<?php echo JRoute::_(TUIYO_INDEX.'&amp;view=groups&amp;do=view&amp;gid='.$rGroup->groupID ); ?>" title="Created <?php  echo TuiyoTimer::diff( strtotime($rGroup->dateCreated) ) ; ?>">
		                                    <img class="TuiyoUserAvatar" src="<?php echo $rGroup->logo ?>" style="border:1px solid #ccc; padding:2px;">
		                                </a>
		                        	</div>
		                        	<div class="tuiyoTableCell" style="width: 82%; position:relative">
		                        		<a  href="<?php echo JRoute::_(TUIYO_INDEX.'&amp;view=groups&amp;do=view&amp;gid='.$rGroup->groupID ); ?>" title="Created <?php  echo TuiyoTimer::diff( strtotime($rGroup->dateCreated) ) ; ?>"><strong><?php echo $rGroup->gName ?></strong></a> 
		                        		<a style="position: absolute; top: 10px; right: 5px" href="#" class="button" title="<?php echo _('Remote Friend') ?>" style="position: absolute; top: 0; right: -6px;"><?php echo _('Leave Group') ?></a>
		                        		<div style="width: 60%"><?php echo($rGroup->shortDescription); ?></div>
		                        	</div>
		                        	<div class="tuiyoClearFloat"></div>
		                        </div>  
                            <?php endforeach; ?>
                            <div class="tuiyoClearFloat"></div>
                        <?php endif; ?> 
				</div>
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
                        <div class="tuiyoTable">
                        	<div class="tuiyoTable">
                        		<form method="post" action="index" class="TuiyoForm">
                        			<fieldset>
                        				<div class="TuiyoNotification TuiyoInformation"><?php echo _('Invite people from your mail contact list.'); ?></div>
	                        			<div class="tuiyoTableRow" style="padding: 5px 0">
	                        				<div class="tuiyoTableCell" style="width:35%"><?php echo _('Email address')?></div>
	                        				<div class="tuiyoTableCell" style="width:65%"><input type="text" name="e_invite_email_address" class="TuiyoFormText" /></div>
	                        				<div class="tuiyoClearFloat"></div>
	                        			</div>
	                        			<div class="tuiyoTableRow" style="padding: 5px 0">
	                        				<div class="tuiyoTableCell" style="width:35%"><?php echo _('Email address password')?></div>
	                        				<div class="tuiyoTableCell" style="width:65%"><input type="password" name="e_invite_email_password" class="TuiyoFormText" /></div>
	                        				<div class="tuiyoClearFloat"></div>
	                        			</div>
	                        			<div class="tuiyoTableRow" style="padding: 5px 0">
	                        				<div class="tuiyoTableCell" style="width:35%">&nbsp;</div>
	                        				<div class="tuiyoTableCell" style="width:65%"><a href="#">Upload a CSV file of contacs</a></div>
	                        				<div class="tuiyoClearFloat"></div>
	                        			</div> 
	                        			<div class="tuiyoTableRow" style="padding: 5px 0">
	                        				<div class="tuiyoTableCell" style="width:35%">&nbsp;</div>
	                        				<div class="tuiyoTableCell" style="width:65%"><button type="submit"><?php echo _('Fetch contacts and Invite') ?></button></div>
	                        				<div class="tuiyoClearFloat"></div>
	                        			</div> 	                        				                        			 
                        			</fieldset>                       			
                        			<?php JHTML::_('form.token'); ?>
                        		</form>
                        	</div>
                        </div>					
					</div>
                </div>
                
               	<!--3rd Party Invitation Plugins--> 
            	<div class="dashBoardWidget">
                	<div class="dashBoardWidgetBodySubHead"><?php echo _('Invite friends from other services')?></div>
                    <div class="dashBoardWidgetBody">
						<?php $GLOBALS["events"]->trigger( "onConnectionsView" , $this ); ?>
					</div>
                </div>
                
			</div>
		</div>
		<div style="clear:both"></div>
	</div>
</div>