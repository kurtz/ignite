<div class="tuiyoTable">
	<div class="tuiyoTableRow">
		<div class="tuiyoTableCell" style="width: 50%">
			<div class="tuiyoColumn" id="tuiyoColumn1Pad">
				<div class="pageTitle tuiyoTable">			
                	<div class="tuiyoTableRow">
                    	<div class="tuiyoTableCell" style="width: 15%">
                        	<img  src="<?php echo $this->user->getUserAvatar()->thumb70; ?>" class="groupLogo TuiyoGroupAvatar" width="70" />
                        </div>                       
                    	<div class="tuiyoTableCell" style="width: 85%">
                            <div class="tuiyoTable" style="padding-left: 10px;">

                                <!--GENERAL INFORMATION-->
                                <div class="PageTitleName">
                                    <span><?php echo $this->article['story']->posttitle ?></span> 
                                    <a href="<?php echo JRoute::_(TUIYO_INDEX.'&amp;view=groups&amp;do=getFeed&amp;format=feed&amp;gid='.$this->group->groupID ); ?>">
			                           <img alt="#feed"  src="<?php echo $this->livestyle ?>/icons/feeds_16.png" style="margin-bottom: -3px;"    />
			                        </a> 
		                            <div class="tuiyoClearFloat"></div>                                                                                                      		                            
                                </div> 
                                
                                <div class="tuiyoTableRow infoElement">
			                        <div class="tuiyoTableCell infoLabel" style="width: 35%"><?php echo _('Published on:' ); ?></div>
			                        <div class="tuiyoTableCell infoValue" style="width: 65%"><?php echo sprintf( _('Created %s'), TuiyoTimer::diff(strtotime($this->article['story']->createdate) )  )?></div>
			                        <div class="tuiyoClearFloat"></div>
			                    </div> 
			                    
			                     <div class="tuiyoTableRow infoElement">
			                        <div class="tuiyoTableCell infoLabel" style="width: 35%"><?php echo _('Last modified:' ); ?></div>
			                        <div class="tuiyoTableCell infoValue" style="width: 65%">
										<?php if($this->article['story']->postmodified !== "0000-00-00 00:00:00"): 
										 	echo sprintf( _('Created %s'), TuiyoTimer::diff(strtotime($this->article['story']->createdate) )  );									else:
											echo _("Never modified");
										endif; ?>
									</div>
			                        <div class="tuiyoClearFloat"></div>
			                    </div>                       
                            </div>         
                        </div>                      
                    	<div class="tuiyoClearFloat"></div>
                    </div>                       
            	</div>
            	<div class="pageBody"><?php echo $this->article['story']->postcontent ?></div>
			</div>
		</div>
		<div class="tuiyoTableCell" style="width: 50%">
			<div class="tuiyoColumn" id="tuiyoColumn2Pad">
				<div class="pagePublisherTabs">
	                <ul class="publisherTabItems">
	                    <li style="padding: 0pt 18px;" type="community" class="current"><a href="#"><span><?php echo _('Article Discussion')?></span></a></li>
	                </ul>
	             	<div class="tuiyoClearFloat"></div>
	             </div>
	             <div class="reporter"><jdoc:include type="message" /></div>
				<?php echo $this->activity ?>
			</div>
		</div>
		<div class="tuiyoClearFloat"></div>
	</div>
</div>