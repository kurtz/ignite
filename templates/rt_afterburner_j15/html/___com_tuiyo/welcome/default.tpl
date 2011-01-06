<div class="tuiyoTable">
	<div class="tuiyoTableRow">
		<div class="tuiyoTableCell" style="width: 50%">
			<div class="tuiyoColumn" id="tuiyoColumn1Pad">
				<?php echo $this->activity ?> 
			</div>
		</div>
		<div class="tuiyoTableCell" style="width: 50%">
			<div class="tuiyoColumn" id="tuiyoColumn2Pad">
				<!--Newest Community Members--> 
            	<div class="dashBoardWidget">
                	<div class="dashBoardWidgetBodySubHead">Welcome our new members</div>
                    <div class="dashBoardWidgetBody">
                        <div class="TuiyoNotification TuiyoAttention"><?php echo _('There are no new new recomendations for you at this time '); ?></div>
					    <div class="dashboardWidgetFooter tuiyoTable" >
	                    	<div class="tuiyoTableRow">
	                    		<div class="tuiyoTableCell" style="width: 50%"><a>View all members</a></div>
	                    		<div class="tuiyoTableCell" style="width: 50%" align="right"><a>Search</a></div>
	                    		<div style="clear: both"></div>
	                    	</div>
	                    </div>	
                    </div>
                </div> 
                <!--Friends online--> 
            	<div class="dashBoardWidget">
                	<div class="dashBoardWidgetBodySubHead">Friends online now</div>
                    <div class="dashBoardWidgetBody">
                        <?php if(count($this->onlinefriends) < 1 ) : ?>	
                        	<div class="TuiyoNotification TuiyoInformation"><?php echo _('You do not have any friends online at this time. To ensure that we are not making a mistake, log-in again'); ?></div>
						<?php else : ?>   
							<?php foreach($this->onlinefriends as $member) : ?>                         
	                       <div align="center" title="<?php echo $member->name ?>" class="friendListItem" style="margin: 3px; float: left;">
	                            <a href="<?php echo JRoute::_( TUIYO_INDEX.'&amp;view=profile&amp;do=view&user='.$member->username )  ?>" 
								  title="<?php echo $member->name ?>" class="hasTip" >
	                              <img alt="#"  src="<?php echo $member->avatar->thumb35 ?>" class="TuiyoAvatar" width="35" />
	                            </a>  
	                        </div>
							<?php endforeach; ?> 
						<?php endif; ?> 
						<div class="dashboardWidgetFooter tuiyoTable" >
	                    	<div class="tuiyoTableRow">
	                    		<div class="tuiyoTableCell" style="width: 50%"><a>View all friends (128)</a></div>
	                    		<div class="tuiyoTableCell" style="width: 50%" align="right"><a>Search</a></div>
	                    		<div style="clear: both"></div>
	                    	</div>
	                    </div>							  
					</div>
                </div> 
                <!--Photos suggestion--> 
            	<div class="dashBoardWidget">
                	<div class="dashBoardWidgetBodySubHead">Recent community Photos</div>
                    <div class="dashBoardWidgetBody">
                        <div class="TuiyoNotification TuiyoAttention"><?php echo _('There are no new new recomendations for you at this time '); ?></div>
						<div class="dashboardWidgetFooter tuiyoTable" >
	                    	<div class="tuiyoTableRow">
	                    		<div class="tuiyoTableCell" style="width: 50%"><a>View more Photos</a></div>
	                    		<div class="tuiyoTableCell" style="width: 50%" align="right"><a>Upload</a></div>
	                    		<div style="clear: both"></div>
	                    	</div>
	                    </div>							
					</div>
                </div> 
                <!--Articles suggestion--> 
            	<div class="dashBoardWidget">
                	<div class="dashBoardWidgetBodySubHead">Recent Blog Posts</div>
                    <div class="dashBoardWidgetBody">
                        <div class="TuiyoNotification TuiyoAttention"><?php echo _('There are no new new recomendations for you at this time '); ?></div>
						<div class="dashboardWidgetFooter tuiyoTable" >
	                    	<div class="tuiyoTableRow">
	                    		<div class="tuiyoTableCell" style="width: 50%"><a>View more Articles</a></div>
	                    		<div class="tuiyoTableCell" style="width: 50%" align="right"><a>Submit an Article</a></div>
	                    		<div style="clear: both"></div>
	                    	</div>
	                    </div>						
					</div>
                </div> 				
			</div>
		</div>
		<div style="clear:both"></div>
	</div>
</div>