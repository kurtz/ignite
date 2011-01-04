<div class="tuiyoTable">
	<div class="tuiyoTableRow">
		<div class="tuiyoTableCell" style="width: 50%">
			<div class="tuiyoColumn" id="tuiyoColumn1Pad">
				<div class="groupPageHomePageTitle tuiyoTable">			
                	<div class="tuiyoTableRow">
                    	<div class="tuiyoTableCell" style="width: 15%">
                        	<img  src="<?php echo $this->group->logo ?>" class="groupLogo TuiyoGroupAvatar" width="70" />
                        </div>                       
                    	<div class="tuiyoTableCell" style="width: 85%">
                            <div class="tuiyoTable" style="padding-left: 10px;">

                                <!--GENERAL INFORMATION-->
                                <div class="groupPageTitleName">
                                    <span><?php echo $this->group->gName ?></span> 
                                    <a href="<?php echo JRoute::_(TUIYO_INDEX.'&amp;view=groups&amp;do=getFeed&amp;format=feed&amp;gid='.$this->group->groupID ); ?>">
			                           <img alt="#feed"  src="<?php echo $this->livestyle ?>/icons/feeds_16.png" style="margin-bottom: -3px;"    />
			                        </a> 
		                            <div class="tuiyoClearFloat"></div>                                                                                                      		                            
                                </div> 
                                
                                <div class="tuiyoTableRow infoElement">
			                        <div class="tuiyoTableCell infoLabel" style="width: 35%"><?php echo _('Inauguration:' ); ?></div>
			                        <div class="tuiyoTableCell infoValue" style="width: 65%"><?php echo sprintf( _('Created %s'), TuiyoTimer::diff(strtotime($this->group->dateCreated) )  )?></div>
			                        <div class="tuiyoClearFloat"></div>
			                    </div> 
			                    
			                     <div class="tuiyoTableRow infoElement">
			                        <div class="tuiyoTableCell infoLabel" style="width: 35%"><?php echo _('Short Description:' ); ?></div>
			                        <div class="tuiyoTableCell infoValue" style="width: 65%"><?php echo $this->group->shortDescription ?></div>
			                        <div class="tuiyoClearFloat"></div>
			                    </div> 
			                    
			                    <!--Join Group-->														    
							   
						    	<?php if((int)$this->group->isMember < 1 && $this->group->gType === 'public' ): ?>
						        <div class="tuiyoTableRow infoElement">
						            <div class="tuiyoTableCell infoLabel" style="width: 35%"><?php echo _('Join Group') ?></div>
						            <div class="tuiyoTableCell infoValue" style="width: 65%"><a href="<?php echo JRoute::_(TUIYO_INDEX.'&amp;view=groups&amp;do=join&amp;gid='.$this->group->groupID ); ?>"><?php echo _('Subscribe to group') ?></a></div>
						            <div class="tuiyoClearFloat"></div>
						        </div>
						        <?php endif; ?>
						        
						        <?php if((int)$this->group->isMember > 0): ?>
                                <div class="tuiyoTableRow infoElement">
						            <div class="tuiyoTableCell infoLabel" style="width: 35%"><?php echo _('Leave Group') ?></div>
						            <div class="tuiyoTableCell infoValue" style="width: 65%"><a href="<?php echo JRoute::_(TUIYO_INDEX.'&amp;view=groups&amp;do=leave&amp;gid='.$this->group->groupID ); ?>"><?php echo _('Un-subscribe from group') ?></a></div>
						            <div class="tuiyoClearFloat"></div>
						        </div>
                                <?php if((int)$this->group->isAdmin > 0 ) : ?>
                                <div class="tuiyoTableRow infoElement">
						            <div class="tuiyoTableCell infoLabel" style="width: 35%"><?php echo _('Manage Group') ?></div>
						            <div class="tuiyoTableCell infoValue" style="width: 65%"><a href="#" id="editGroup"><?php echo _('Edit group settings'); ?></a></div>
						            <div class="tuiyoClearFloat"></div>
						        </div>
						        <div class="pageItem" id="editGroupPage" style="display: none"><?php echo $this->editPage; ?></div>                                
                                <?php endif; ?>
                            	<?php endif;?>                             	
                                                       
                            </div>         
                        </div>                      
                    	<div class="tuiyoClearFloat"></div>
                    </div>                       
            	</div>
      
        		<div class="pagePublisherTabs">
	                <ul class="publisherTabItems">
	                    <li style="padding: 0pt 20px;" id="viewCatNew"><a href="#"><span><?php echo _('Questions')?></span></a></li>
	                  	<li style="padding: 0pt 20px;" id="viewCatDirs"><a href="#"><span><?php echo _('Ideas')?></span></a></li>
						<li style="padding: 0pt 20px;" id="viewCatAttr"><a href="#"><span><?php echo _('Opinions')?></span></a></li>  
	                  	<li style="padding: 0pt 20px;" id="viewCatExplorer"><a href="#"><span><?php echo _('Compliments')?></span></a></li>
	                  	<li style="padding: 0pt 20px;" class="current" id="viewCatExplorer"><a href="#"><span><?php echo _('Wall')?></span></a></li>
	                </ul>
	             	<div class="tuiyoClearFloat"></div>
	             </div>				
	             
				<?php echo $this->activity ?> 
			</div>
		</div>
		<div class="tuiyoTableCell" style="width: 50%">
			<div class="tuiyoColumn" id="tuiyoColumn2Pad">
				<div class="reporter"><jdoc:include type="message" /></div>
				
				<?php echo $this->descriptionPage; ?>
				
				<!--Popular Groups--> 
            	<div class="dashBoardWidget">
                	<div class="dashBoardWidgetBodySubHead"><?php echo _('Group members')?></div>
                    <div class="dashBoardWidgetBody tuiyoTableRow">
                    	<?php if( count($this->group->members) > 0 ): ?>
                        <?php endif; ?>
                        
                            <?php foreach($this->group->members as $member): ?>
                               <div align="center" title="<?php echo $friend->name ?>" class="friendListItem" style="margin: 3px; float: left; border: 1px solid #ccc; padding:1px;">
                                    <a href="<?php echo JRoute::_( TUIYO_INDEX.'&amp;view=profile&amp;do=view&user='.$member->data['username']  )  ?>" 
                                       title="<?php echo sprintf( _('Joined %s'), TuiyoTimer::diff(strtotime( date($member->joinDate) ) )  )?> " >
                                      <img alt="#"  src="<?php echo $member->data['avatar']->thumb70 ?>" class="TuiyoAvatar" width="70" />
                                    </a>  
                                </div>                                                                  
                            <?php endforeach; ?>                        
                        <div class="tuiyoClearFloat"></div>
	
					</div>
                </div>
                
			</div>
		</div>
		<div style="clear:both"></div>
	</div>
</div>
