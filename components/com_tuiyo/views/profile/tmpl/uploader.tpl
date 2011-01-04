<!-- Uploader Tmpl-->
	
    <form name="TuiyoUploaderForm" id="TuiyoUploaderForm" action="<?php echo JRoute::_(TUIYO_INDEX.'&format=json'); ?>" method="post">
        <div class="homepagePublisherContainer">
            <div class="tuiyoTable" style="border: 1px solid #ccc; background #eee ">
        
                <div class="tuiyoTableRow" >            	
	                
                        <textarea name="ptext" id="ptext" style="margin: 6px; width: 97%"></textarea>
                        <div class="tuiyoStreamUpdateOverlay" id="TuiyoStreamAjaxActivity" align="center">
                            <img src="components/com_tuiyo/client/default/images/loadingLarge.gif" style="margin-top: 8px;"  />
                        </div>
                                   
                    <div class="tuiyoClearFloat" ></div>
                    <?php echo JHTML::_('form.token'); ?>
                    <input type="hidden" name="application" value="web" />
                    <input type="hidden" name="option" value="com_tuiyo" />
                    <input type="hidden" name="controller" value="timeline" />
                    <input type="hidden" name="do" value="setStatus" />
                    <input type="hidden" name="userID" value="<?php echo (int)$user->id ?>" />
                    <input type="hidden" name="format" value="json" />
                    <input type="hidden" name="embedable[title]" value="" />
                    <input type="hidden" name="embedable[thumb]" value="" />                    
                    <input type="hidden" name="embedable[description]" value="" />
                    <input type="hidden" name="plugin-do" id="plugin-do" value="do.js"  />
                    <input type="hidden" name="plugin-dm" id="plugin-dm" value="dm.js"  />
                    <input type="hidden" name="plugin-attach" id="plugin-attach" value="attach.js"  />
                </div>               
            </div>
        </div>
        <div class="tuiyoTableRow" id="uploaderTools" style="border-bottom: 1px solid #eee">
        	<div class="tuiyoTableCell" style="width: 84%;">
        		<div class="tuiyoTableRow sharePrivacy" style="margin: 5px 0" title="<?php echo _('Select Files to upload') ?>">
		        	<div class="tuiyoClearFloat"></div>
		            	<input type="hidden" name="uploadedURLsURLs[]" value="" />		            
		            	<a href="#" class="addFile" rel="addFile" id="aBtnPlaceHolder">Add File</a>
		            
		            <div class="tuiyoClearFloat"></div>
		        </div>
			</div>
            <div class="tuiyoTableCell" style="width: 16%; margin: 3px 0" align="right">
            	<button type="submit">Save upload</button>
            </div>
            <div class="tuiyoClearFloat" ></div>
        </div>         
        <div id="uploadable" style="display: none">&nbsp;</div> 
 
    </form>  
 
<!-- End Uploader Tmpl -->