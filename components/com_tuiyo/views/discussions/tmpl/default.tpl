<div class="tuiyoTable">
	<div class="tuiyoTableRow">
		<div class="tuiyoTableCell" style="width: 50%">
			<div class="tuiyoColumn" id="tuiyoColumn1Pad">
				<div class="pagePublisherTabs">
	                <ul class="publisherTabItems">
	                	<li style="padding: 0pt 20px;" class="current" type="status"><a href="#"><span><?php echo _('Lounge')?></span></a></li>
	                    <li style="padding: 0pt 20px;" type="question"><a href="#"><span><?php echo _('Questions')?></span></a></li>
	                  	<li style="padding: 0pt 17px;" type="idea"><a href="#"><span><?php echo _('Ideas')?></span></a></li>
						<li style="padding: 0pt 20px;" type="opinion"><a href="#" ><span><?php echo _('Opinions')?></span></a></li>  
	                  	<li style="padding: 0pt 20px;" type="compliment"><a href="#"><span><?php echo _('Compliments')?></span></a></li>
	                </ul>
	             	<div class="tuiyoClearFloat"></div>
	             </div>
			     <?php echo $this->activity ?>          
			</div>
		</div>
		<div class="tuiyoTableCell" style="width: 50%">
			<div class="tuiyoColumn" id="tuiyoColumn2Pad">
				<!--Popular suggestion--> 
            	<div class="dashBoardWidget">
                	<div class="dashBoardWidgetBodySubHead">Popular Ideas</div>
                    <div class="dashBoardWidgetBody">
                        <div class="TuiyoNotification TuiyoInformation"><?php echo _('Popular ideas'); ?></div>					
					</div>
                </div>
				<!--Completed Ideas--> 
            	<div class="dashBoardWidget">
                	<div class="dashBoardWidgetBodySubHead">Completed and closed topics</div>
                    <div class="dashBoardWidgetBody">
                        <div class="TuiyoNotification TuiyoInformation"><?php echo _('Completed topics'); ?></div>					
					</div>
                </div>
                <!--Categories--> 
            	<div class="dashBoardWidget">
                	<div class="dashBoardWidgetBodySubHead">Categories</div>
                    <div class="dashBoardWidgetBody">
                        <div class="TuiyoNotification TuiyoInformation"><?php echo _('Completed topics'); ?></div>					
					</div>
                </div>                
			</div>
		</div>
		<div style="clear:both"></div>
	</div>
</div>