<div class="tuiyoTable">
	<div class="tuiyoTableRow">
		<div class="tuiyoTableCell" style="width: 50%">
			
			<div class="tuiyoColumn" id="tuiyoColumn1Pad">

				<div class="pagePublisherTabsFB" align="right">
	                <ul class="publisherTabItemsFB">
	                	<li style="padding: 0pt 18px;" type="community" class="current"><a href="#"><span><?php echo _('...')?></span></a></li>
	                    <li style="padding: 0pt 18px;" type="community" ><a href="#"><span><?php echo _('Photos')?></span></a></li>
	                    <li style="padding: 0pt 18px;" type="community" ><a href="#"><span><?php echo _('Notes')?></span></a></li>
	                    <li style="padding: 0pt 18px;" type="community" ><a href="#"><span><?php echo _('Pages')?></span></a></li>
	                    <li style="padding: 0pt 18px;" type="community" ><a href="#"><span><?php echo _('Inbox')?></span></a></li>
	                </ul>
	             	<div class="tuiyoClearFloat"></div>
	             </div>
	             <div class="reporter"><jdoc:include type="message" /></div>
            	<div class="pageBody" style="margin-top: 10px">
            	
            		<img src="<?php echo($this->fbuser)?> ?>" />
            	
					<?php foreach($this->data['data'] as $item ) : ?>
					
					<div class="tuiyoTable activityStreamItem activityItem" style="position: relative; " id="s4656">
						<div class="tuiyoTableRow">
							<div class="tuiyoTableCell col1img" style="width:10%;">
								<div class="activityStreamItemUserImage48">
									<img src="http://localhost/joomla/components/com_tuiyo/files/avatars/62/thumb70/62_Photoon20101215at12.49.jpg" width="48" height="48">
								</div>
							</div>
							<div class="tuiyoTableCell col2body" style="width: 90%">
								<div class="activityStreamItemActivityBody">
									<div class="activityStreamItemTools" align="center">
										<a class="voteLike" href="#" style=""> like </a><a class="voteDisLike" href="#" style=""> dislike </a><a href="#" class="comment" rel="ccomment">comment</a><a href="#" class="delete" rel="cdelete">delete</a>
									</div>
									<div class="activityBodyText">
										<?php echo $item['message'] ?>
									</div>
									<div>
									</div>
									<div class="bodyDescr public " title="This entry is Public">
										<span class="descrInfo"> By </span><a href="/joomla/index.php?option=com_tuiyo&amp;amp;view=profile&amp;amp;do=view&amp;amp;Itemid=53&amp;user=drstonyhills"><span>drstonyhills </span></a><a class="statustime" href="index.php?option=com_tuiyo&amp;amp;view=profile&amp;amp;do=viewStatus&amp;user=drstonyhills&amp;id=4656"><span>20 hours ago </span></a><a class="votes" href="#">no votes yet</a>
									</div>
								</div>
								<div class="activityStreamItemComments">
								</div>
							</div>
							<div class="tuiyoClearFloat">
							</div>
						</div>
					</div>
					<?php endforeach; ?>
            	
            	</div>
			</div>
		</div>
		<div class="tuiyoTableCell" style="width: 50%">
			<div class="tuiyoColumn" id="tuiyoColumn2Pad">
				<div class="pagePublisherTabs">
	                <ul class="publisherTabItems">
	                	<li style="padding: 0pt 18px;" type="community"><a href="#"><span><?php echo _('Invite friends')?></span></a></li>
	                    <li style="padding: 0pt 18px;" type="community" class="current"><a href="#"><span><?php echo _('Our Community')?></span></a></li>
	                </ul>
	             	<div class="tuiyoClearFloat"></div>
	             </div>
				<?php echo $this->activity ?>
			</div>
		</div>
		<div class="tuiyoClearFloat"></div>
	</div>
</div>