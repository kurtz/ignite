<div class="tuiyoTable">
	<div class="tuiyoTableRow">
		<div class="tuiyoTableCell" style="width: 50%">
			<div class="tuiyoColumn" id="tuiyoColumn1Pad">
				<div class="pagePublisherTabs">
	                <ul class="publisherTabItems" id="publisherHp1">	                    
	                  	<li style="padding: 0pt 20px;" class="current" id="timelineReload"><a href="#"><span><?php echo _('Public Messages')?></span></a></li>
	                  	<li style="padding: 0pt 20px;" id="timeline" option="filterType" optionvalue="private"><a href="#"><span><?php echo _('Private Messages')?></span></a></li>
	                </ul>
	             	<div class="tuiyoClearFloat"></div>
	             </div>
             	<div class="pageEl" id="privateMessageTools" style="display:none;margin-bottom: 10px">
					<input type="range" name="updateterval" min="0" step="5" max="100" value="0" />
					<div class="tooltip">Update every x seconds</div>
					<div class="tuiyoClearFloat" style="clear:both;"></div>
					<div class="TuiyoNotification TuiyoInformation" style="margin-top: 15px"><?php echo _('All post made here will not show on your profile'); ?></div> 
				</div>
				<?php echo $this->activity ?>
			</div>
		</div>
		<div class="tuiyoTableCell" style="width: 50%">
			<div class="tuiyoColumn" id="tuiyoColumn2Pad">
				<!--Inbox-->
           		<div class="dashBoardWidget" id="inboxWidget">
                	<div class="dashBoardWidgetBodySubHead"><?php echo _('Latest Notifications'); ?></div>
                    <div class="dashBoardWidgetBody">
						<!--message Lists-->
                      	<div class="Notifications">
                      		<?php if( count((array)$this->notices) < 1 ) :?>
	                            <div class="TuiyoNotification TuiyoAttention"><?php echo _('There are no new notices at this time'); ?></div> 
	                            <?php endif; ?>
	                        <?php foreach((array)$this->notices as $notice) : ?>
		                        <div class="tuiyoTableRow <?php echo(($notice->status < 1)? 'unread' : null ); ?> profileNoticeItem">
		                            <div class="tuiyoTableCell" style="width: 95%">
		                            	<a href="<?php echo JRoute::_(TUIYO_INDEX.'&controller=notifications&do=view&id='.$notice->id ); ?>">
		                                	<span><?php echo TuiyoTimer::diff( strtotime($notice->noticetime) ) ?></span>
		                               	</a>
		                               	<span><?php echo preg_replace('/(^|[^a-z0-9_])@([a-z0-9_]+)/i', '$1<a href="'.JRoute::_(TUIYO_INDEX.'&view=profile&do=view').'&user=$2">@$2</a>', $notice->title ); ?></span>
		                            </div>
		                           	<div class="tuiyoTableCell" style="width: 5%">
		                           		<a href="<?php echo JRoute::_(TUIYO_INDEX.'&controller=notifications&do=remove&id='.$notice->id ); ?>" class="removelink" style="float: right">&nbsp;</a>
		                           	</div>
		                            <div class="tuiyoClearFloat"></div>
		                        </div>
	                        <?php endforeach; ?>
                      	</div>
                    </div>
                </div>
			</div>
		</div>
		<div style="clear:both"></div>
	</div>
</div>

<!--Messages select send to Box-->
<div id="sendToSuggestBox" class="tuiyoTable" style="display: none">
	<form name="userSuggest" id="userSuggest" class="TuiyoForm" action="<?php echo JRoute::_(TUIYO_INDEX.'&format=json'); ?>" method="post">
    	<div class="tuiyoTableRow">
        	<input type="text" class="TuiyoFormText" name="suggestSalt" id="suggestSalt" style="width: 97%;" value="" />
            <input type="hidden" name="format" value="json" />
            <input type="hidden" name="option" value="com_tuiyo" />
            <input type="hidden" name="controller" value="resources" />
            <input type="hidden" name="do" value="getUserNamesLike" />
            <input type="hidden" name="userID" value="<?php echo (int)$this->user->id ?>" />            
            <div class="tuiyoClearFloat"></div>
        </div>
        <?php echo JHTML::_('form.token'); ?>
        <div class="tuiyoTableRow" id="suggestResultBox">
        	<?php echo _('Start typing  a name in the text box above to select friends to send message to') ;?>
        </div>
		<div class="tuiyoTable" style="margin: 5px 0; display: none"><button type="submit"><?php echo _("I'm done searching" ); ?></button></div>        
    </form>
</div>