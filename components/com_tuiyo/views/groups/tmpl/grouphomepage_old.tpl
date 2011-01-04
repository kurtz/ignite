<div id="pageContainer">
	<div class="groupHomepage">
    	<div class="groupHomePageTitle tuiyoTable pageHeaderTitle" >
        	<div class="tuiyoTableRow" style="padding: 5px">
            	<div class="tuiyoTableCell" style="width: 70%">	
                	<div class="tuiyoTableRow">
                    	<div class="tuiyoTableCell" style="width: 16%">
                        	<img  src="<?php echo $this->group->logo ?>" class="groupLogo TuiyoGroupAvatar" width="70" />
                        </div>
                    	<div class="tuiyoTableCell" style="width: 84%">
                        	<h3 style="font-size: 22px; font-weight: bold"><?php echo $this->group->gName ?> </h3>
                            <i style="font-size: 11px; line-height: 18px"><?php echo $this->group->shortDescription ?> </i><br/>
                            <span style="font-size: 9px;margin-top: 4px;"><?php echo sprintf( _('created %s'), TuiyoTimer::diff(strtotime($this->group->dateCreated) )  )?></span>
                         </div>
                    	<div class="tuiyoClearFloat"></div>
                    </div>                    
                </div>
                <div class="tuiyoTableCell" style="width: 30%">
                	<div class="dropDownMenuList"> 
    					<ul id="groupMenu" class="groupHomepageNavigation">
                            <?php if((int)$this->group->isMember < 1 && $this->group->gType === 'public' ): ?>
                                <li><img alt="#"  src="<?php echo $this->livestyle ?>/images/user_add_32.png"    />
                                    <a href="<?php echo JRoute::_(TUIYO_INDEX.'&amp;view=groups&amp;do=join&amp;gid='.$this->group->groupID ); ?>">Join group</a></li>
                            <?php endif; ?>
                            <?php if((int)$this->group->isMember > 0): ?>
                                <li rel="recentActivity" class="doFunction">
                                    <img alt="#act"  src="<?php echo $this->livestyle ?>/images/comment_32.png"    />
                                    <a>Activity</a></li> 
                                <li rel="groupDescription" class="doFunction">
                                    <img alt="#descrip"  src="<?php echo $this->livestyle ?>/images/info_button_32.png"    />
                                    <a>Information</a></li>                                                                     
                                <li><img alt="#feed"  src="<?php echo $this->livestyle ?>/images/comment_user_rss_32.png"    />
                                    <a href="<?php echo JRoute::_(TUIYO_INDEX.'&amp;view=groups&amp;do=getFeed&amp;format=feed&amp;gid='.$this->group->groupID ); ?>">Activity RSS</a></li>
                                <?php if((int)$this->group->isAdmin > 0 ) : ?>
                                    <li rel="editGroupPage" class="doFunction">
                                        <img alt="#editg"  src="<?php echo $this->livestyle ?>/images/tools_32.png"  />
                                        <a>Manage Group</a></li>
                                    <li><img alt="#leave"  src="<?php echo $this->livestyle ?>/images/close_32.png"    />
                                        <a href="<?php echo JRoute::_(TUIYO_INDEX.'&amp;view=groups&amp;do=leave&amp;gid='.$this->group->groupID ); ?>" >Delete  Group</a></li>                           <?php else : ?>
                                    <li><img alt="#leave"  src="<?php echo $this->livestyle ?>/images/user_close_32.png"    />
                                        <a href="<?php echo JRoute::_(TUIYO_INDEX.'&amp;view=groups&amp;do=leave&amp;gid='.$this->group->groupID ); ?>" >Leave Group</a></li>                                
                                <?php endif; ?>
                            <?php endif;?>
                            
                            <li style="border-top: 1px dashed #ccc; margin-top: 4px;">
                                <img alt="#explorg"  src="<?php echo $this->livestyle ?>/images/folder_32.png"    />
                                <a href="<?php echo JRoute::_(TUIYO_INDEX.'&amp;view=groups&amp;do=explore'); ?>">Explore Groups</a></li>
                        </ul>                        
                    </div>
                </div>
            	<div class="tuiyoClearFloat"></div>
            </div>
        </div>
        <div class="groupHomePageContent">
        	<div class="tuiyoTableRow">            	
            	<div class="tuiyoTableCell" style="width: 70%; margin-top: 29px;">
                    <div class="reporter"><jdoc:include type="message" /></div>
                    <div class="groupHomePagePages">
                        <div class="pageItem" id="editGroupPage" style="display: none"><?php echo $this->editPage; ?></div>
                        <div class="pageItem" id="recentActivity"><?php echo $this->activity; ?></div>
                        <div class="pageItem" id="groupDescription" style="display: none"><?php echo $this->descriptionPage; ?></div>
                 	</div>
                    <a href="<?php echo JRoute::_( TUIYO_INDEX.'&amp;view=profile&amp;do=view&user='.$this->group->creator['username']  )  ?>" class="creatorLink">
                            	<?php echo sprintf( _( 'This group was created by @%s' ) , $this->group->creator['username'] ); ?></a>                    
                </div>
                <div class="tuiyoTableCell" style="width: 25%; padding: 0 0 0 15px;">
                    <?php if( count($this->group->members) > 0 ): ?>
                        <div class="tuiyoTableRow infoGroupTitle">
                            <h3><a rel="profileFriendsPage" class="pageHook"><?php echo _('View group members' ) ;?></a></h3></div>
                        <div class="tuiyoTableRow">
                            <?php foreach($this->group->members as $member): ?>
                               <div align="center" title="<?php echo $friend->name ?>" class="friendListItem" style="margin: 3px; float: left;">
                                    <a href="<?php echo JRoute::_( TUIYO_INDEX.'&amp;view=profile&amp;do=view&user='.$member->data['username']  )  ?>" 
                                       title="<?php echo sprintf( _('Joined %s'), TuiyoTimer::diff(strtotime($member->joinDate ) )  )?> " >
                                      <img alt="#"  src="<?php echo $member->data['avatar']->thumb35 ?>" class="TuiyoAvatar" width="35" />
                                    </a>  
                                </div>                                                                  
                            <?php endforeach; ?>                        
                        </div>
                    <?php endif; ?>
                </div>
            	<div class="tuiyoClearFloat"></div>	
            </div>
        </div>
    </div>
</div>