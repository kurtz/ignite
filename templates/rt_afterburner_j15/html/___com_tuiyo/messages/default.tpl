<div class="tuiyoTable">
	<div class="tuiyoTableRow">
		<div class="tuiyoTableCell" style="width: 50%">
			<div class="tuiyoColumn" id="tuiyoColumn1Pad">
			
				<!--Inbox-->
           		<div class="dashBoardWidget" id="inboxWidget">
                	<div class="dashBoardWidgetBodySubHead"><?php echo _('Lastest Messages'); ?></div>
                    <div class="dashBoardWidgetBody">
						<!--message Lists-->
                        <div class="messageBoxListItems">
                            <!--Message Item-->
                            <?php if(sizeof($this->messages['inbox'])< 1 ) : ?>
                                <div class="TuiyoNotification TuiyoInformation"><?php echo _('Messages you recieve will be displayed here'); ?></div>
                            <?php endif; ?>
                            <?php foreach($this->messages['inbox'] as $m ) : ?>
                                <div class="tuiyoTableRow messagesBoxMessageListItem <?php if((int)$m->state === 0){ echo 'unread'; }?>" 
                                        id="<?php echo $m->message_id; ?>">
                                    <div class="tuiyoTableCell" style="width: 4%; padding-top: 10px;" align="center">
                                        <input type="checkbox" class="childSelect" />
                                    </div>
                                    <div class="tuiyoTableCell" style="width: 7%">
                                        <a href="#" class="ppsender"><img src="<?php echo $m->user_from_avatar ?>" /></a>
                                    </div>                     
                                    <div class="tuiyoTableCell" style="width: 30%">
                                        <nobr><a href="#"><?php echo $m->user_from_name; ?></a></nobr><br />
                                        <i style="font-size: 10px"><?php echo $m->date_time; ?></i>
                                    </div>
                                    <div class="tuiyoTableCell" style="width: 50%">
                                        <nobr><a href="#"><?php echo $m->subject ; ?></a></nobr><br />
                                        <i style="font-size: 10px"><?php echo $m->word_count.' words; '.mb_strlen($m->message, 'latin1').' bytes'; ?></i>
                                    </div>
                                    <div class="tuiyoTableCell" style="width: 3%; padding-top: 7px;" align="right">
                                        <a href="<?php echo JRoute::_(TUIYO_INDEX.'&view=messages&do=deleteMessage&mid='.$m->message_id ) ?>" 
                                          class="delete.msg"><img src="<?php echo $this->livestyle ?>/icons/delete_16.png" /></a>
                                    </div>
                                    <div class="tuiyoClearFloat"></div>
                                </div>
                                <div class="tuiyoTableRow messageBoxMessageListItemRead" style="display:none">
                                    <div class="tuiyoTable messageIntro">
                                        <div class="tuiyoTableRow">
                                            <div class="tuiyoTableCell" style="width: 9%"><a href="#">
                                                <img src="<?php echo $m->user_from_avatar ?>" /></a></div>
                                            <div class="tuiyoTableCell" style="width: 80%">
                                                <div style="line-height: 15px;"><?php echo $m->date_time ?> : <?php echo $m->subject ?></div>
                                                <a href="<?php echo JRoute::_(TUIYO_INDEX.'&view=messages&do=deleteMessage&mid='.$m->message_id)?>"><?php echo _('delete') ;?></a> | 
                                                <a href="#rel" rel="reply"
                                                  uname="<?php echo $m->user_from_username; ?>" subject="<?php echo $m->subject ; ?>"
                                                  class="<?php echo $m->user_from_username; ?> <?php echo $m->subject ; ?>"><?php echo _('reply'); ?></a>
                                            </div>
                                            <div class="tuiyoClearFloat"></div>
                                        </div>
                                    </div>
                                    <div class="messageBody"><?php echo nl2br( $m->message ); ?></div>
                                </div>
                            <?php endforeach; ?>
                        </div>
					    <div class="dashboardWidgetFooter tuiyoTable" >
	                    	<div class="tuiyoTableRow">
	                    		<div class="tuiyoTableCell" style="width: 50%"><a>View More</a></div>
	                    		<div class="tuiyoTableCell" style="width: 50%" align="right"><a>Update</a></div>
	                    		<div style="clear: both"></div>
	                    	</div>
	                    </div>                        
                    </div>
                </div>
                <!--end of recieved messages lists-->  
                
				<!--Sent Messages--> 
            	<div class="dashBoardWidget">
                	<div class="dashBoardWidgetBodySubHead">Sent Messages</div>
                    <div class="dashBoardWidgetBody">
                        <!--message Lists-->
                        <div class="messageBoxListItems">
                            <!--Message Item-->
                            <?php if(sizeof($this->messages['sent'])< 1 ) : ?>
                                <div class="TuiyoNotification TuiyoInformation"><?php echo _('Messages you send to other users, or to yourself, will be displayed here'); ?></div>
                            <?php endif; ?>
                            <?php foreach($this->messages['sent'] as $m ) : ?>
                                <div class="tuiyoTableRow messagesBoxMessageListItem" id="<?php echo $m->message_id; ?>">
                                    <div class="tuiyoTableCell" style="width: 4%; padding-top: 10px;" align="center">
                                        <input type="checkbox" class="childSelect" />
                                    </div>
                                    <div class="tuiyoTableCell" style="width: 7%">
                                        <a href="#" class="ppsender" title="message to"><img src="<?php echo $m->user_to_avatar ?>" /></a>
                                    </div>                     
                                    <div class="tuiyoTableCell" style="width: 30%">
                                        <nobr><a href="#"><?php echo $m->user_to_name; ?></a></nobr><br />
                                        <i style="font-size: 10px"><?php echo $m->date_time; ?></i>
                                    </div>
                                    <div class="tuiyoTableCell" style="width: 50%">
                                        <nobr><a href="#"><?php echo $m->subject ; ?></a></nobr><br />
                                        <i style="font-size: 10px"><?php echo $m->word_count.' words; '.mb_strlen($m->message, 'latin1').' bytes'; ?></i>
                                    </div>
                                    <div class="tuiyoTableCell" style="width: 3%; padding-top: 7px;" align="right">
                                        <a href="<?php echo JRoute::_('index.php?option=com_tuiyo&view=messages&do=deleteMessage&mid='.$m->message_id ) ?>" 
                                          class="delete.msg"><img src="<?php echo $this->livestyle ?>/icons/delete_16.png" /></a>
                                    </div>
                                    <div class="tuiyoClearFloat"></div>
                                </div>
                                <div class="tuiyoTableRow messageBoxMessageListItemRead" style="display:none">
                                    <div class="tuiyoTable messageIntro">
                                        <div class="tuiyoTableRow">
                                            <div class="tuiyoTableCell" style="width: 9%"><a href="#"><img src="<?php echo $m->user_from_avatar ?>" /></a></div>
                                            <div class="tuiyoTableCell" style="width: 80%">
                                                <div style="line-height: 15px;"><?php echo $m->date_time ?> : <?php echo $m->subject ?></div>
                                                <a href="<?php echo JRoute::_(TUIYO_INDEX.'&view=messages&do=deleteMessage&mid='.$m->message_id)?>"><?php echo _('delete'); ?></a> | 
                                                <a href="#rel" rel="reply"
                                                  uname="<?php echo $m->user_from_username; ?>" subject="<?php echo $m->subject ; ?>"
                                                  class="<?php echo $m->user_from_username; ?> <?php echo $m->subject ; ?>"><?php echo _('reply'); ?></a>
                                            </div>
                                            <div class="tuiyoClearFloat"></div>
                                        </div>
                                    </div>
                                    <div class="messageBody"><?php echo nl2br( $m->message ); ?></div>
                                </div>
                            <?php endforeach; ?>
                        </div>
					    <div class="dashboardWidgetFooter tuiyoTable" >
	                    	<div class="tuiyoTableRow">
	                    		<div class="tuiyoTableCell" style="width: 50%"><a>View more sent Messages</a></div>
	                    		<div class="tuiyoTableCell" style="width: 50%" align="right"><a>Send New Message</a></div>
	                    		<div style="clear: both"></div>
	                    	</div>
	                    </div>	
                    </div>
                </div>                
                
                <!--Agenda suggestion--> 
            	<div class="dashBoardWidget">
                	<div class="dashBoardWidgetBodySubHead">Events and Tasks</div>
                    <div class="dashBoardWidgetBody">
                        <div class="TuiyoNotification TuiyoInformation"><?php echo _('Upcoming Events will be displayed here'); ?></div>
					    <div class="dashboardWidgetFooter tuiyoTable" >
	                    	<div class="tuiyoTableRow">
	                    		<div class="tuiyoTableCell" style="width: 50%"><a>Go to Calendar</a></div>
	                    		<div class="tuiyoTableCell" style="width: 50%" align="right"><a>View more Events</a></div>
	                    		<div style="clear: both"></div>
	                    	</div>
	                    </div>					
					</div>
                </div> 
                 
			</div>
		</div>
		<div class="tuiyoTableCell" style="width: 50%">
			<div class="tuiyoColumn" id="tuiyoColumn2Pad">
			
				<!--Inbox-->
           		<div class="dashBoardWidget" id="inboxWidget">
                	<div class="dashBoardWidgetBodySubHead"><?php echo _('Compose new message'); ?></div>
                    <div class="dashBoardWidgetBody">
						<div id="messagesBoxNewMessage" class="navItemTemplate"> 
                            <form class="TuiyoForm" name="TuiyoMessageSend" id="TuiyoMessageSend" 
                                 action="<?php echo JRoute::_('index.php?option=com_tuiyo'); ?>" method="post">
                                <!--compose Area -->
                                <div id="composeArea" class="tuiyoTable">
                                    <!--TO-->                    
                                    <div class="tuiyoTableRow" style="margin-bottom: 5px">
                                        	<div id="tuiyoSuggestBoxInc" style="border: 1px solid #ccc; width: 99%; padding: 0 6px 0 0; cursor: pointer" ><a class="addRecipient">click</a>
                                            	<div class="tuiyoClearFloat"></div>
                                            </div>
                                            <input type="hidden" name="sendToUsers" id="sendToUsers"  />                                            
                                    </div>
                                    <!--Subject-->
                                    <div class="tuiyoTableRow" style="margin-bottom: 5px">
                                        <input name="messageSubject" id="messageSubject" type="text" value="{Subject}" style="border: 1px solid #ccc; padding: 5px; width: 98.1%;" />
                                    </div>  
 									<div class="tuiyoTableRow" style="margin-bottom: 5px">
                                         <textarea id="newMessageText" class="TuiyoFormTextArea wysiwyg" name="newMessageText"></textarea>
                                    </div> 
								    <div class="dashboardWidgetFooter tuiyoTable" style="padding-top: 5px" >
				                    	<div class="tuiyoTableRow">
				                    		<div class="tuiyoTableCell" style="width: 50%"><button>Save As Draft</button></div>
				                    		<div class="tuiyoTableCell" style="width: 50%" align="right"><button>Send Message</button></div>
				                    		<div style="clear: both"></div>
				                    	</div>
				                    </div>	                                   
                                </div>                                
                                 <input type="hidden" name="do" value="sendMessage" />
                                 <input type="hidden" name="view" value="messages" />
                                 <input type="hidden" name="user_id_from" value="<?php echo $this->user->id ?>" />
                                 <?php echo JHTML::_('form.token') ;?>
                            </form>
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