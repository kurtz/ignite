<?php if((int)$canPost !== 0 ) : ?>
    <form name="TuiyoStreamUpdate" id="TuiyoStreamUpdate" action="<?php echo JRoute::_(TUIYO_INDEX.'&format=json'); ?>" method="post">
        <div class="homepagePublisherContainer">
            <div class="tuiyoTable publisher">
        
                <div class="tuiyoTableRow" >            	
	                <div class="tuiyoTableCell" style="width: 11%" >
	            		<img alt="actTmpAt" width="50" height="50" src="<?php echo($user->getUserAvatar()->thumb70 ) ?>" class="TuiyoAvatar" />
	            	</div>    
                    <div class="tuiyoTableCell" style="width: 89%" >
                        <textarea name="ptext" id="ptext" class="ptextinput" style="margin-left: 4px"></textarea>
                        <div class="tuiyoStreamUpdateOverlay" id="TuiyoStreamAjaxActivity" align="center">
                            <img src="components/com_tuiyo/client/default/images/loadingLarge.gif" style="margin-top: 8px;"  />
                        </div>
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
        <div class="tuiyoTableRow" id="activityUpdateTools" style="border-bottom: 1px solid #eee">
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
		            
		            <a href="#" class="add" rel="addParticipant">Add</a>
		            
		            <div class="tuiyoClearFloat"></div>
		        </div>
			</div>
            <div class="tuiyoTableCell" style="width: 20%" align="right">
            	<input type="text" class="pchars" name="pchars" style="margin: 8px 0" id="pchars" disabled="disabled" readonly="readonly" value="140" /> 
            </div>
            <div class="tuiyoTableCell" style="width: 13%; margin: 3px 0" align="right">
            	<button type="submit">Update</button>
            </div>
            <div class="tuiyoClearFloat" ></div>
        </div>         
        <div id="embedable" style="display: none">&nbsp;</div> 
 
    </form>  
<?php endif; ?>   
<div id="userActivityStream">
    <img src="components/com_tuiyo/client/default/images/loading2.gif" style="margin: 10px 0" />
</div>    
<div class="tuiyoClearFloat"></div>      

<div id="shareWidthSuggestBox" class="tuiyoTable" style="display: none">
	<form name="userSuggest" id="userSuggest" class="TuiyoForm" action="<?php echo JRoute::_(TUIYO_INDEX.'&format=json'); ?>" method="post">
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
        <div class="tuiyoTable" style="margin: 5px 0"><button type="submit"><?php echo _("I'm done adding participants" ); ?></button></div>
    </form>
</div>
