<div class="windowOverlay">&nbsp;</div>
<?php if((int)$canPost !== 0 ) : TuiyoEventLoader::preparePlugins("timeline" );  ?>
	<?php $document = TuiyoAPI::get("document",null); ?>
    <form name="TuiyoStreamUpdate" id="TuiyoStreamUpdate" action="<?php echo( JURI::root().TUIYO_INDEX.'&format=json'); ?>" class="TuiyoForm" method="post">
        <div class="homepagePublisherContainer">
            <div class="statusTools" style="">
            	<strong style="margin-left: 5px; width: 70px;"><?php echo _('Share :') ?></strong>
            	<a href="#" class="updatestatus" rel="updateStatus"><?php echo _('Status')?></a>
	        	<a href="#" class="filter" rel="filterNewsFeed"><?php echo _('Sort feeds')?></a>
	        	<a href="#" class="upload" rel="uploadFiles"><?php echo _('Files')?></a>
				<?php 
					$gLocationModel = TuiyoLoader::model("applications", true); 
					$googleService  = $gLocationModel->getSingleUserPlugin( $user->id, "google");
					if($googleService!==false) :
						
						$mapkey = $googleService->get("gMapAPIKey", null);
						$mapkey = !empty($mapkey)? "&amp;key=".$mapkey : null;
						$document->addJS('http://maps.google.com/maps?file=api&amp;v=2&amp;sensor=true'.$mapkey); 
						$document->addJS( JURI::root().'components/com_tuiyo/libraries/tuiyo/interface/javascript/includes/google/gmap.js')
					?>
						<a href="#" class="location" rel="shareLocation"><?php echo _('Location')?></a>
					<?php	
					endif;
				?>
	        </div>
            <div class="tuiyoTable publisher" >
                <div class="tuiyoTableRow" >            	
	                <div class="tuiyoTableCell" style="width: 11%" >
	            		<img alt="actTmpAt" width="50" height="50" src="<?php echo($user->getUserAvatar()->thumb70 ) ?>" class="TuiyoAvatar" />
	            	</div>    
                    <div class="tuiyoTableCell" style="width: 89%" >
                        <textarea name="ptext" id="ptext" class="ptextinput" style="margin-left: 4px"></textarea>
                        <div class="tuiyoStreamUpdateOverlay" id="TuiyoStreamAjaxActivity" align="center">
                            <img src="<?php echo JURI::root(); ?>components/com_tuiyo/client/default/images/loadingLarge.gif" style="margin-top: 8px;"  />
                        </div>
                    </div>               
                    <div class="tuiyoClearFloat" ></div>
                    <?php echo JHTML::_('form.token'); ?>
                    <input type="hidden" name="type" value="status" />
                    <input type="hidden" name="application" value="web" />
                    <input type="hidden" name="option" value="com_tuiyo" />
                    <input type="hidden" name="controller" value="timeline" />
                    <input type="hidden" name="do" value="setStatus" />
                    <input type="hidden" name="userID" value="<?php echo (int)$user->id ?>" />
                    <input type="hidden" name="format" value="json" />
                    <input type="hidden" name="embedable[title]" value="" />
                    <input type="hidden" name="embedable[thumb]" value="" />                    
                    <input type="hidden" name="embedable[description]" value="" />
					<?php $GLOBALS["events"]->trigger( "onAddToTimelineForm" , $this );?>
                </div>               
            </div>
	       	<div class="uploadResourceFiles statusToolEl" style="border-bottom: 1px dotted #eee; display:none; padding: 10px 0;">  
				<div class="tuiyoTableRow" id="tuiyoActivityUploader">
					<span id="spanButtonPlaceHolder"></span>
					<div class="tuiyoClearFloat"></div>
					<div class="fieldset flash" id="fsUploadProgress"></div>
					<div style="color: #ccc;"><span id="divStatus"></span><a id="btnCancel"><?php echo _('Cancel all uploads')?></a></div>
				</div> 
			</div>
			<div class="shareToOtherServices statusToolEl" style="border-bottom: 1px dotted #eee; display:none">  
		        <div class="dashboardWidgetBody">
		        	 <?php if(count($plugins) < 1): ?>
		        	 	<div class="TuiyoNotification TuiyoInformation"><?php echo _('There are no available services')?></div>
		        	 <?php endif; ?>
		             <?php foreach($plugins as $p) :?>
		             <div class="tuiyoTableCell" style="width: 32%; margin: 2px;">
		             	<div class="tuiyoTableCell" style="width: 20%" align="center"><input type="checkbox" /></div>
		             	<div class="tuiyoTableCell" style="width: 20%"><img src="<?php echo JURI::root(); ?>components/com_tuiyo/plugins/<?php echo $p.'/'.$p ?>-16x16.png" /></div>
		             	<div class="tuiyoTableCell" style="width: 60%"><?php echo ucfirst($p); ?></div>
		             </div>
		             <?php endforeach; ?>
		             <div class="tuiyoClearFloat"></div>
				</div>
			</div>
   			<div class="tuiyoTableRow statusToolEl" id="activityUpdateTools" style="border-bottom: 1px solid #eee ;">
	        	<div class="tuiyoTableCell" style="width: 67%;">
	        		<div class="tuiyoTableRow sharePrivacy" style="margin: 5px 0" title="<?php echo _('Sharing with..') ?>">
			        	<div class="tuiyoClearFloat"></div>
			            <input type="hidden" name="sharewith[]" value="" />
			        	<?php foreach((array)$sharewith as $rel=>$name ): ?>
			            	<span class="shareWith" rel="<?php echo $rel ?>" title="<?php echo $name ?>">
			                	<a href="#" class="remove" rel="removeParticipant"><?php echo $name ?></a>
			                	<input type="hidden" name="sharewith[]" value="<?php echo $rel ?>" />
			                </span>
			            <?php endforeach; ?>
			            
			            <a href="#" class="add" style="margin-left: 20px" rel="addParticipant"><?php echo _('Add')?></a>
			            
			            <div class="tuiyoClearFloat"></div>
			        </div>
				</div>
	            <div class="tuiyoTableCell" style="width: 18%" align="right">
	            	<input type="text" class="pchars" name="pchars" style="padding: 8px 0" id="pchars" disabled="disabled" readonly="readonly" value="140" /> 
	            </div>
	            <div class="tuiyoTableCell" style="width: 15%; margin: 3px 0" align="right">
	            	<button type="submit"><?php echo _('Update')?></button>
	            </div>
	            <div class="tuiyoClearFloat" ></div>          
	        </div>
			<div class="shareCurrentLocation statusToolEl" style="border-bottom: 1px dotted #eee; display:none; padding: 10px 0">
				<div id="map_location_canvas" style="width: 100%; height:300px; margin: 0 auto;">Map Here</div>
    		</div>   
	        <div class="publisherTabEl timelineFilters statusToolEl" style="display: none; border-bottom: 1px solid #eee; margin-bottom: 10px; padding: 10px 0">
				<div class="tuiyoTableRow">
					<?php if(count($plugins) < 1): ?>
		        	 	<div class="TuiyoNotification TuiyoInformation"><?php echo _('There are no available services')?></div>
		        	<?php endif; ?>
	             	<?php foreach($plugins as $p) :?>
	             	<div class="tuiyoTableCell" style="width: 24%; margin: 2px;">
	             		<div class="tuiyoTableCell" style="width: 20%" align="center"><input type="radio" name="filterRadioGroup" value="<?php echo $p?>" /></div>
	             		<div class="tuiyoTableCell" style="width: 20%"><img src="<?php echo JURI::root(); ?>components/com_tuiyo/plugins/<?php echo $p.'/'.$p ?>-16x16.png" /></div>
	             		<div class="tuiyoTableCell" style="width: 60%"><?php echo ucfirst($p); ?></div>
	             	</div>
	             	<?php endforeach; ?>
	             	<div class="tuiyoClearFloat"></div>
	             </div>
			</div>
        </div>
        <div id="embedable" style="display: none">&nbsp;</div>
    </form>  
<?php endif; ?>   
<div id="userActivityStream">
    <img src="<?php echo JURI::root(); ?>components/com_tuiyo/client/default/images/loading2.gif" style="margin: 10px 0" />
</div>    
<div class="tuiyoClearFloat"></div>      

<div id="shareWidthSuggestBox" class="tuiyoTable" style="display: none">
	<form name="userSuggest" id="userSuggest" class="TuiyoForm" action="<?php echo(TUIYO_INDEX.'&format=json'); ?>" method="post">
    	<div class="dashBoardWidgetBodySubHead"><?php echo _('Add Participants'); ?></div>
    	<div class="tuiyoTableRow">
        	<input type="text" class="TuiyoFormText" name="suggestSalt" style="width: 97%;" />
            <input type="hidden" name="format" value="json" />
            <input type="hidden" name="option" value="com_tuiyo" />
            <input type="hidden" name="controller" value="timeline" />
            <input type="hidden" name="do" value="suggestParticipant" />
            <input type="hidden" name="userID" value="<?php echo (int)$user->id ?>" />            
            <div class="tuiyoClearFloat"></div>
        </div>
        <div class="tuiyoTableRow" id="suggestResultBox">
        	<?php echo _('Start typing  a name in the text box above to select friends or groups to share with this post with') ;?>
        </div>
        <div class="tuiyoTable" style="margin: 5px 0 15px 0"><button type="submit"><?php echo _("I'm done adding participants" ); ?></button></div>
    </form>
</div>
