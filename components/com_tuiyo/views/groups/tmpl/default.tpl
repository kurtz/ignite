<div class="tuiyoTable">
	<div class="tuiyoTableRow">
		<div class="tuiyoTableCell" style="width: 50%">
			<div class="tuiyoColumn" id="tuiyoColumn1Pad">
				<div class="pagePublisherTabs">
	                <ul class="publisherTabItems">
	                	<li style="padding: 0pt 20px;" class="current" type="status"><a href="#"><span><?php echo _('Lounge')?></span></a></li>
	                    <li style="padding: 0pt 20px;" type="newGroup"><a id="createNewGroups" style="cursor: pointer"><span><?php echo _('Create new group');  ?></span></a></li>
	                  	
	                </ul>
	             	<div class="tuiyoClearFloat"></div>
	             </div>
				<?php echo $this->activity ?> 
			</div>
		</div>
		<div class="tuiyoTableCell" style="width: 50%">
			<div class="tuiyoColumn" id="tuiyoColumn2Pad">
				<div class="reporter"><jdoc:include type="message" /></div>
				<!--My Groups-->
				<?php if(!$this->user->joomla->get('guest')): ?> 
            	<div class="dashBoardWidget">
                	<div class="dashBoardWidgetBodySubHead"><?php echo _('My Groups') ?></div>
                    <div class="dashBoardWidgetBody">
							<?php if(sizeof($this->data['mygroups']) < 1 ) : ?>                     
                                <div class="TuiyoNotification TuiyoInformation">You have not yet been subsrcibed to any group</div> 
                            <?php else : ?>
                                <?php foreach($this->data['mygroups'] as $mGroup ) : ?>
                                    <div class="groupListItem" title="<?php printf(ngettext('%d member', '%d members', $mGroup->memberCount), $mGroup->memberCount); ?>" align="center">
                                        <a href="<?php echo JRoute::_(TUIYO_INDEX.'&amp;view=groups&amp;do=view&amp;gid='.$mGroup->groupID ); ?>">
                                            <img src="<?php echo $mGroup->logo ?>" class="groupLogo" />
                                        </a>
                                        <span><?php echo $mGroup->gName ?></span>
                                    </div>
                                <?php endforeach; ?>
                                <div class="tuiyoClearFloat"></div>
                            <?php endif; ?>					
					</div>
                </div>
                <?php endif; ?>
				<!--Popular Groups--> 
            	<div class="dashBoardWidget">
                	<div class="dashBoardWidgetBodySubHead"><?php echo _('Popular Groups')?></div>
                    <div class="dashBoardWidgetBody">
                        <?php if(sizeof($this->data['populargroups'])<1 ) : ?>   
                            <div class="TuiyoNotification TuiyoInformation">There are no popular groups as of yet. Please create one now!</div>
                        <?php else : ?>
                            <?php foreach($this->data['populargroups'] as $pGroup ) : ?>
                                <div class="groupListItem" title="<?php printf(ngettext('%d member', '%d members', $pGroup->memberCount), $pGroup->memberCount); ?>" align="center">
                                    <a href="<?php echo JRoute::_(TUIYO_INDEX.'&amp;view=groups&amp;do=view&amp;gid='.$pGroup->groupID ); ?>">
                                        <img src="<?php echo $pGroup->logo ?>" class="groupLogo" />
                                    </a>
                                    <span><?php echo $pGroup->gName ?></span>
                                </div>
                            <?php endforeach; ?>
                            <div class="tuiyoClearFloat"></div>
                        <?php endif; ?>				
					</div>
                </div>
                <!--Recent Groups--> 
            	<div class="dashBoardWidget">
                	<div class="dashBoardWidgetBodySubHead">Categories</div>
                    <div class="dashBoardWidgetBody">
                        <?php if(sizeof($this->data['recentgroups'])<1 ) : ?>                   
                            <div class="TuiyoNotification TuiyoInformation">There are no recently created groups</div>   
                        <?php else : ?>
                            <?php foreach($this->data['recentgroups'] as $rGroup ) : ?>
                                <div class="groupListItem" title="Created <?php  echo TuiyoTimer::diff( strtotime($rGroup->dateCreated) ) ; ?>" align="center">
                                    <a href="<?php echo JRoute::_(TUIYO_INDEX.'&amp;view=groups&amp;do=view&amp;gid='.$rGroup->groupID ); ?>">
                                        <img src="<?php echo $rGroup->logo ?>" class="groupLogo" />
                                    </a>
                                    <span><?php echo $rGroup->gName ?></span>
                                </div>
                            <?php endforeach; ?>
                            <div class="tuiyoClearFloat"></div>
                        <?php endif; ?> 					
					</div>
                </div> 
			</div>
		</div>
		<div style="clear:both"></div>
	</div>
</div>