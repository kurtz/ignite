<div class="tuiyoTable">
	<div class="tuiyoTableRow">
		<div class="tuiyoTableCell" style="width: 30%">
			<div class="tuiyoColumn" id="tuiyoColumn1Pad">
				<div class="pagePublisherTabs">
	                <ul class="publisherTabItems">
	                    <li style="padding: 0pt 20px;" id="viewCatNew"><a href="#"><span><?php echo _('Updates')?></span></a></li>
	                  	<li style="padding: 0pt 20px;" class="current" id="viewCatDirs"><a href="#"><span><?php echo _('My Files')?></span></a></li>
						<li style="padding: 0pt 20px;" id="viewCatAttr"><a href="#"><span><?php echo _('Tagged')?></span></a></li>  
	                </ul>
	             	<div class="tuiyoClearFloat"></div>
	             </div>
               	<!--Uploaded Images--> 
            	
				<?php foreach($this->myfiles as $file) : ?>
                <div class="tuiyoTableRow fileItem" style="position: relative">
                	<div class="tuiyoTableCell selecterBox" style="width: 6%" align="center"><input type="checkbox" /></div>
                   	<div class="tuiyoTableCell iconBox <?php echo $file['type'] ?>" style="width: 15%">&nbsp;</div>
                   	<div class="tuiyoTableCell fileBox" style="width: 79%;">
                 		<span class="fileName"><a href="#"><?php echo $file['title'] ?></a></span><br />
                 		<span class="fileCreateDate"><?php echo sprintf( _('Uploaded on %s') , date($file['date']) ) ?></span>
                 		<div class="deleteTool">&nbsp;</div>
                  	</div>
                   	<div class="tuiyoClearFloat"></div>
            	</div>
            	<?php endforeach;?>
					
                                                                                               
                <div class="tuiyoClearFloat"></div> 
			</div>
		</div>
		<div class="tuiyoTableCell" style="width: 70%">
			<div class="tuiyoColumn" id="tuiyoColumn2Pad">
				<div class="pagePublisherTabs">
	                <ul class="publisherTabItems">
	                    <li style="padding: 0pt 20px;" id="viewCatNew" class="current" ><a href="#"><span><?php echo _('Instructions.txt')?></span></a></li>
	                  	<li style="padding: 0pt 20px;" id="viewCatDirs"><a href="#"><span><?php echo _('0 Comments')?></span></a></li>
						<li style="padding: 0pt 20px;" id="viewCatAttr"><a href="#"><span><?php echo _('Downloads')?></span></a></li>  
	                </ul>
	             	<div class="tuiyoClearFloat"></div>
	            </div>
				<div class="TuiyoNotification TuiyoInformation">
					<?php echo _('Select a file in the left pane to view')?>
				</div> 
			</div>
		</div>
		<div style="clear:both"></div>
	</div>
</div>