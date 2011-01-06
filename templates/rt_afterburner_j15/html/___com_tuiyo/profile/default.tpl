<div class="tuiyoTable">
	<div class="tuiyoTableRow">
		<div class="tuiyoTableCell" style="width: 50%">
			<div class="tuiyoColumn" id="tuiyoColumn1Pad">
			
				<div class="peoplePageHomePageTitle tuiyoTable">			
                	<div class="tuiyoTableRow">
                    	<div class="tuiyoTableCell" style="width: 11%">
                        	<img alt="profileAvatar"  src="<?php echo( TuiyoUser::getUserAvatar($this->thatuser->id, 'thumb70') ) ?>" width="50"  />
                        </div>                       
                    	<div class="tuiyoTableCell" style="width: 89%">
                            <div class="tuiyoTable" style="padding-left: 10px;">

                                <!--GENERAL INFORMATION-->
                                <div class="profilePageTitleName">
                                    <span><?php echo $this->thatuser->name ; ?></span> 
                                    <a href="<?php echo JRoute::_(TUIYO_INDEX.'&amp;view=profile&amp;do=getFeed&amp;format=feed&amp;pid='.$this->thatuser->id ); ?>">
			                           <img alt="#feed"  src="<?php echo $this->livestyle ?>/icons/feeds_16.png" style="margin-bottom: -3px;"    />
			                        </a>
									<!--Rating--> 
                                    <?php $diabled = (!$this->privacy["canRateProfile"])? 'disabled="disabled"' : NULL ; $checked = 'checked="checked"'; ?>
		                            <form style="float: right" id="profileRatingEl" action="<?php echo JRoute::_('index.php?format=json'); ?>" method="post" class="TuiyoForm"> 
		                                <input type="radio" name="rating" value="1" title="<?php echo _('Not so great' ); ?>"   
		                                    <?php echo $diabled; if($this->rating===1){ echo $checked; } ?> /> 
		                                <input type="radio" name="rating" value="2" title="<?php echo _('Quite good' ); ?>" 
		                                    <?php if($this->rating===2){ echo $checked; } ?>  /> 
		                                <input type="radio" name="rating" value="3" title="<?php echo _('Great' ); ?>"  
		                                    <?php if($this->rating===3){ echo $checked; } ?> /> 
		                                <input type="radio" name="rating" value="4" title="<?php echo _('Very good!' ); ?>"   
		                                    <?php if($this->rating===4){ echo $checked; } ?>/>
		                                <input type="radio" name="rating" value="5" title="<?php echo _('Great!' ); ?>"  
		                                    <?php if($this->rating===5){ echo $checked; } ?> /> 
		                                <input type="radio" name="rating" value="6" title="<?php echo _('Excellent!' ); ?>"  
		                                    <?php if($this->rating===6){ echo $checked; } ?> /> 
		                                <input type="radio" name="rating" value="7" title="<?php echo _('Extraordinary!' ); ?>"  
		                                    <?php if($this->rating===7){ echo $checked; } ?> />                                     
		                                <input type="submit" value="<?php echo _('Rate Profile' ); ?>" /> 
		                                <input type="hidden" name="pid" value="<?php echo $this->thatuser->id ?>" />
		                                <input type="hidden" name="option" value="com_tuiyo" />
		                                <input type="hidden" name="format" value="json" />
		                                <input type="hidden" name="controller" value="profile" />
		                                <input type="hidden" name="do" value="rateProfile" />
		                                <?php echo JHTML::_('form.token') ; ?>
		                            </form> 
		                            <div class="tuiyoClearFloat"></div>                                                                                                      		                            
                                </div> 
                                
                                <div class="tuiyoTableRow infoElement">
			                        <div class="tuiyoTableCell infoLabel" style="width: 35%"><?php echo _('Member since:' ); ?></div>
			                        <div class="tuiyoTableCell infoValue" style="width: 65%"><?php echo TuiyoTimer::diff(strtotime( $this->thatuser->registerDate ) ) ; ?></div>
			                        <div class="tuiyoClearFloat"></div>
			                    </div> 
			                   <?php $dob = $this->thatuser->get('dob') ; if( isset( $dob  ) && !empty( $dob  ) && $dob  !== '0000-00-00' ): ?>
			                    <div class="tuiyoTableRow infoElement">
			                        <div class="tuiyoTableCell infoLabel" style="width: 35%"><?php echo _('Birthday:' ); ?></div>
			                        <div class="tuiyoTableCell infoValue" style="width: 65%"><?php echo date("F j", strtotime( $this->thatuser->get('dob') ) ) ; ?></div>
			                        <div class="tuiyoClearFloat"></div>
			                    </div>
			                    <?php endif; ?>
							    <div class="tuiyoTableRow infoElement">
							    	<div class="tuiyoTableCell infoLabel" style="width: 35%"><?php echo _('Last logged in:'); ?></div>
							        <div class="tuiyoTableCell infoValue" style="width: 65%"><?php echo TuiyoTimer::diff(strtotime( $this->thatuser->lastvisitDate ) ) ; ?></div>
							        <div class="tuiyoClearFloat"></div>
							    </div>
							    <?php if($this->privacy['canAddAsFriend']  ) :  ?>   
							    <div class="tuiyoTableRow infoElement">
							    	<div class="tuiyoTableCell infoLabel" style="width: 35%"><?php echo sprintf( _('Connect with %s'), $this->thatuser->username )?></div>
							    	<div class="tuiyoTableCell infoValue" style="width: 65%">
							    		<a href="<?php echo JRoute::_(TUIYO_INDEX.'&amp;view=friends&amp;do=add&amp;pid='.$this->thatuser->id, true ) ?>" id="addFriend"><?php echo sprintf( _( 'Add to friends')  ) ?></a>
							    	</div>
							    	<div class="tuiyoClearFloat"></div>
							    </div>                   
                                <?php endif; ?>                        
							    <!--CONTACT INFORMATION-->
							    <?php $i=0; foreach($this->rawinformation['contact'] as $cInfo=>$value) :  ?>
							    	<?php if(!empty($value) ): ?>
							        <div class="tuiyoTableRow infoElement">
							            <div class="tuiyoTableCell infoLabel" style="width: 35%"><?php echo ucfirst( $cInfo ) ?></div>
							            <div class="tuiyoTableCell infoValue" style="width: 65%"><?php echo $value ?></div>
							            <div class="tuiyoClearFloat"></div>
							        </div>
									<?php $i++; endif; ?>
							    <?php endforeach; if( (int)$i < 1 ) : ?>
							    	<div class="privacyLock"><?php echo sprintf( _( '%s has either not yet edited this section of his profile, or has set this section to private, Log-in, and or befriend this user to open a new line of contact'), ucfirst($this->thatuser->username) )?></div>
							    <?php endif; ?> 
							    
							         
								<!--CUSTOM SOCIAL INFORMATION-->														    
							    <?php $i=0; foreach($this->rawinformation['social'] as $info) :  ?>
							    	<?php if(!empty($info->fd) && isset($info->fl) ) : ?>
							        <div class="tuiyoTableRow infoElement">
							            <div class="tuiyoTableCell infoLabel" style="width: 35%"><?php echo $info->fl ?></div>
							            <div class="tuiyoTableCell infoValue" style="width: 65%"><?php echo nl2br($info->fd) ?></div>
							            <div class="tuiyoClearFloat"></div>
							        </div>
							        <?php $i++; endif; ?>
							    <?php endforeach; ?>                                 	
                                                       
                            </div>         
                        </div>                      
                    	<div class="tuiyoClearFloat"></div>
                    </div>                       
            	</div>
      
        						
			
				<?php echo $this->activity ?> 
			</div>
		</div>
		<div class="tuiyoTableCell" style="width: 50%">
			<div class="tuiyoColumn" id="tuiyoColumn2Pad">
				<!--My Photos--> 
            	<div class="dashBoardWidget">
                	<div class="dashBoardWidgetBodySubHead"><?php echo $this->thatuser->name ; ?> Photos</div>
                    <div class="dashBoardWidgetBody">
            			<?php if(sizeof($this->photoalbums) < 1 ) : ?>
                            <div class="TuiyoNotification TuiyoInformation"><?php echo sprintf( _( '%s does not have any public photo albums'), ucfirst($this->thatuser->username) )?></div>
                        <?php else : ?>
                            <?php foreach($this->photoalbums as $album) : ?>
                            <div class="tuiyoTableRow infoGroupTitle slideshowLink" aid="<?php echo $album->aid ?>"><a href="#"><h3><?php echo $album->name ;?></h3></a></div>
                            <div class="tuiyoTableRow slideshowItems">
                                 <?php foreach($album->photos as $photo) : ?>
                                    <div class="photosPageBigScreenItem">
                                        <a href="<?php echo $photo->src_original ?>" class="imageItemWithDescr" rel="facebox" title="<?php echo $photo->caption ?>">
                                            <img alt="#"  src="<?php echo $photo->src_thumb ?>" width="100" />
                                            <span class="desc"><?php echo $photo->caption ?></span></a>
                                    </div>  
                                <?php endforeach; ?>
                                <div class="tuiyoClearFloat"></div> 
                            </div>
                            <div class="slideshowBox" id="<?php echo $album->aid ?>SB"></div>
                            <?php endforeach; ?>
                        <?php endif; ?>
					    <div class="dashboardWidgetFooter tuiyoTable" >
	                    	<div class="tuiyoTableRow">
	                    		<div class="tuiyoTableCell" style="width: 50%"><a>View more Photos</a></div>
	                    		<div class="tuiyoTableCell" style="width: 50%" align="right"><a>Tag Photos</a></div>
	                    		<div style="clear: both"></div>
	                    	</div>
	                    </div>	
                    </div>
                </div> 
				<!--My Groups--> 
            	<div class="dashBoardWidget">
                	<div class="dashBoardWidgetBodySubHead"><?php echo $this->thatuser->name ; ?> Groups</div>
                    <div class="dashBoardWidgetBody">
                        <?php if(sizeof($this->groups )<1 ) : ?>                   
                            <div class="TuiyoNotification TuiyoInformation"><?php echo sprintf( _( '%s is still not a member of any group'), ucfirst($this->thatuser->username) )?></div>   
                        <?php else : ?>
                            <?php foreach($this->groups as $rGroup ) : ?>
                                <div class="groupListItem" title="Created <?php  echo TuiyoTimer::diff( strtotime($rGroup->dateCreated) ) ; ?>" align="center">
                                    <a href="<?php echo JRoute::_(TUIYO_INDEX.'&amp;view=groups&amp;do=view&amp;gid='.$rGroup->groupID ); ?>">
                                        <img src="<?php echo $rGroup->logo ?>" class="groupLogo" />
                                    </a>
                                    <span><?php echo $rGroup->gName ?></span>
                                </div>
                            <?php endforeach; ?>
                            <div class="tuiyoClearFloat"></div>
                        <?php endif; ?>                         
					    <div class="dashboardWidgetFooter tuiyoTable" >
	                    	<div class="tuiyoTableRow">
	                    		<div class="tuiyoTableCell" style="width: 50%"><a>View all user's groups</a></div>
	                    		<div class="tuiyoTableCell" style="width: 50%" align="right"><a>Suggest Group</a></div>
	                    		<div style="clear: both"></div>
	                    	</div>
	                    </div>	
                    </div>
                </div> 
				<!--My Events--> 
            	<div class="dashBoardWidget">
                	<div class="dashBoardWidgetBodySubHead"><?php echo $this->thatuser->name ; ?> Events</div>
                    <div class="dashBoardWidgetBody">
                        <div class="TuiyoNotification TuiyoInformation"><?php echo _('There are no new new recomendations for you at this time '); ?></div>
					    <div class="dashboardWidgetFooter tuiyoTable" >
	                    	<div class="tuiyoTableRow">
	                    		<div class="tuiyoTableCell" style="width: 50%"><a>View more Events</a></div>
	                    		<div class="tuiyoTableCell" style="width: 50%" align="right"><a>Invite to Event</a></div>
	                    		<div style="clear: both"></div>
	                    	</div>
	                    </div>	
                    </div>
                </div>                                 			
				<!--My Friends--> 
            	<div class="dashBoardWidget">
                	<div class="dashBoardWidgetBodySubHead"><?php echo $this->thatuser->name ; ?> Friends</div>
                    <div class="dashBoardWidgetBody">
                        <div class="TuiyoNotification TuiyoInformation"><?php echo _('There are no new new recomendations for you at this time '); ?></div>
					    <div class="dashboardWidgetFooter tuiyoTable" >
	                    	<div class="tuiyoTableRow">
	                    		<div class="tuiyoTableCell" style="width: 50%"><a>View more friends</a></div>
	                    		<div class="tuiyoTableCell" style="width: 50%" align="right"><a>Add as Friend</a></div>
	                    		<div style="clear: both"></div>
	                    	</div>
	                    </div>	
                    </div>
                </div> 
				<!--Send a Private Message--> 
            	<div class="dashBoardWidget">
                	<div class="dashBoardWidgetBodySubHead">Leave a private message for <?php echo $this->thatuser->name ; ?></div>
                    <div class="dashBoardWidgetBody">
                        <?php if($this->thisuser->joomla->get('guest') ) : ;?>
					        <div class="TuiyoNotification TuiyoError"><?php echo _('You need to be logged in to send a private message' ); ?></div>
					    <?php else : ?>
					    <form class="TuiyoForm" name="TuiyoMessageSend" id="TuiyoMessageSend" action="<?php echo JRoute::_('index.php?option=com_tuiyo'); ?>" method="post">
					        <div id="composeArea" class="tuiyoTable">             
					            <div class="tuiyoTableRow" style="margin: 1px; font-weight: 500; margin-bottom: 5px">
					               <input name="messageSubject" id="messageSubject" value="Subject" style="border: 1px solid #ccc; padding: 5px; width: 98%;" />
					            </div> 
					            <div class="tuiyoTableRow" style="margin: 1px; font-weight: 500; margin-bottom: 5px">
					                    <textarea id="newMessageText" class="TuiyoFormTextArea wysiwyg" name="newMessageText" style="padding: 5px; width: 98%">Message</textarea>                     
					            </div>                                                     
					        </div>
					        <input type="hidden" name="sendTo[]" id="sendToUsers" value="<?php echo $this->thatuser->id ?>"   />
					        <input type="hidden" name="do" value="sendMessage" />
					        <input type="hidden" name="view" value="messages" />
					        <input type="hidden" name="user_id_from" value="<?php echo $this->thisuser->id ?>" />
					        <?php echo JHTML::_('form.token') ;?>
	    					<div class="dashboardWidgetFooter tuiyoTable" >
		                    	<div class="tuiyoTableRow">
		                    		<div class="tuiyoTableCell" style="width: 50%"><a>Go to Messages</a></div>
		                    		<div class="tuiyoTableCell" style="width: 50%" align="right">
		                    			<button type="submit" style="margin: 5px 0"><?php echo _('Send Message' ); ?></button>
									</div>
		                    		<div style="clear: both"></div>
		                    	</div>
		                    </div>					        
					    </form>
					    <?php endif; ?>
                    </div>
                </div>                 
			</div>
		</div>
		<div style="clear:both"></div>
	</div>
</div>