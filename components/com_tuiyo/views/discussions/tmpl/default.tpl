<div class="tuiyoTable">
	<div class="tuiyoTableRow">
		<div class="tuiyoTableCell" style="width: 50%">
			<div class="tuiyoColumn" id="tuiyoColumn1Pad">
				<div class="pagePublisherTabs">
	                <ul class="publisherTabItems">
	                	<li style="padding: 0pt 20px; position:relative" class="publisherTabsItemsDropLiHover current" type="status"><a href="#">
	                		<span><?php echo _('All topics')?></span></a>
	                		<div class="pusblisherTabsItemDrop">
		                		<ul class="publisherTabItemsSub" style="position:relative">
		                			<li type="status"><a href="#"><span><?php echo _('All Topics')?></span></a></li>
		                  			<li type="business"><a href="#"><span><?php echo _('Business Ideas')?></span></a></li>
									<li type="entertainment"><a href="#" ><span><?php echo _('Entertainment')?></span></a></li>  
		                  			<li type="gaming"><a href="#"><span><?php echo _('Gaming')?></span></a></li>
		                			<li type="question"><a href="#"><span><?php echo _('Questions')?></span></a></li>
		                  			<li type="idea"><a href="#"><span><?php echo _('Ideas')?></span></a></li>
									<li type="opinion"><a href="#" ><span><?php echo _('Opinions')?></span></a></li>  
		                  			<li type="compliment"><a href="#"><span><?php echo _('Compliments')?></span></a></li>
		                  			<li type="lifestyle"><a href="#"><span><?php echo _('LifeStyle')?></span></a></li>
									<li type="offbeat"><a href="#" ><span><?php echo _('Offbeat')?></span></a></li>  
		                  			<li type="politics"><a href="#"><span><?php echo _('Political')?></span></a></li>
		                			<li type="science"><a href="#"><span><?php echo _('Scientific')?></span></a></li>
		                  			<li type="sports"><a href="#"><span><?php echo _('Sports')?></span></a></li>
									<li type="technology"><a href="#" ><span><?php echo _('Technology')?></span></a></li>  
		                		</ul>
	                		</div>
	                	</li>
	                	<li style="border: none; padding: 0pt 7px; background: none" id="searchMainPage">
	                  		<form method="post" class="TuiyoForm"><input type="text" name="gSearchTuiyo" id="gSearchTuiyo" style="padding: 4px; width: 195px" value="<?php echo _('Looking for Something?') ?>" /></form>
	                  	</li>
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