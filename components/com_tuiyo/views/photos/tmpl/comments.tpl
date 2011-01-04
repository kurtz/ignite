<?php if((int)$canPost !== 0 ) : ?>
    <form name="TuiyoCommentForm" id="TuiyoCommentForm" action="<?php echo JRoute::_(TUIYO_INDEX.'&format=json'); ?>" class="TuiyoForm" method="post">
        <div class="homepagePublisherContainer">
            <div class="statusTools">
            	<strong style="margin-left: 5px; width: 70px;"><?php echo _('Respond:') ?></strong>
            	<a href="#" class="updatestatus" rel="addComment"><?php echo _('Comment')?></a>
            	<a href="#" class="voteItem" rel="addVote"><?php echo _('Like')?></a>
            	<a href="#" class="reportItem" rel="addReport"><?php echo _('Report')?></a>
            	<a href="#" class="downloadItem" rel="doDownload"><?php echo _('Download original')?></a>
	        </div>
            <div class="tuiyoTable publisher statusToolEl" style="display: none">
                <div class="tuiyoTableRow" >            	
	                <div class="tuiyoTableCell" style="width: 11%" >
	            		<img alt="actTmpAt" width="50" height="50" src="<?php echo($user->getUserAvatar()->thumb70 ) ?>" class="TuiyoAvatar" />
	            	</div>    
                    <div class="tuiyoTableCell" style="width: 89%" >
                        <textarea name="ptext" id="ptext" class="ptextinput" style="margin-left: 4px"></textarea>
                    </div>               
                    <div class="tuiyoClearFloat" ></div>
                    <?php echo JHTML::_('form.token'); ?>
                    <input type="hidden" name="application" value="web" />
                    <input type="hidden" name="option" value="com_tuiyo" />
                    <input type="hidden" name="type" value="comment" />
                    <input type="hidden" name="mapresourceid" value="" />
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
   			<div class="tuiyoTableRow statusToolEl" id="activityUpdateTools" style="border-bottom: 1px solid #eee ; display: none">
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
	            <div class="tuiyoTableCell" style="width: 20%" align="right">
	            	<input type="text" class="pchars" name="pchars" style="padding: 8px 0" id="pchars" disabled="disabled" readonly="readonly" value="140" /> 
	            </div>
	            <div class="tuiyoTableCell" style="width: 13%; margin: 3px 0" align="right">
	            	<button type="submit"><?php echo _('Comment')?></button>
	            </div>
	            <div class="tuiyoClearFloat" ></div>          
	        </div>   
        </div>
        <div id="embedable" style="display: none">&nbsp;</div>
    </form>  
<?php endif; ?>
<div id="userCommentsStream"></div>
