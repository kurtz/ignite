<form action="<?php echo JRoute::_('index.php?format=json'); ?>" method="post" name="chatRoomForm" id="chatRoomForm" enctype="multipart/form-data">
    <div id="TuiyoApiBarChatRoom" class="TuiyobarItemDiv">
        <div class="boxTitle">
        	<?php if($user->id <> (int)$chatroom['member']  ) : ?>
        		<span>@<?php echo $GLOBALS['API']->get('user', (int)$chatroom['member']  )->username ?></span>
            <?php else :?>
            	<span>@<?php echo $GLOBALS['API']->get('user', (int)$chatroom['initiator']  )->username ?></span>
            <?php endif; ?>
            <a href="#">Close</a>
        </div>
        <div class="boxChatContent">
            <div class="tuiyoTable" style="width: 100%">
                <div class="tuiyoTableRow">
                    <div class="tuiyoTableCell chatWindow">
                        <div class="tuiyoTable">
                            <div class="tuiyoTableRow chatStream" id="chatArea"></div>
                            <div class="tuiyoTableRow" style="position: absolute; bottom: 1%; width: 100%">
                                <div class="tuiyoTableCell" style="width: 100%">
                                    <textarea class="chatInputArea" name="chatPostMessage" id="chatPostMessage" 
                                              style="width: 100%;" maxlength="100"></textarea>
                                </div>
                                <div class="tuiyoTableCell" style="width: 100%">
                                    <input type="submit" class="chatInputSend" style="width: 100%;" value="Send">
                                </div>
                                <div class="tuiyoClearFloat"></div>
                            </div>
                        </div>
                    </div>
                    <div class="tuiyoClearFloat"></div>
                </div>
            </div>
        </div>
    </div>
    <?php echo JHTML::_('form.token') ; ?>
    <input type="hidden" name="format" value="json" />
    <input type="hidden" name="option" value="com_tuiyo" />
    <input type="hidden" name="controller" value="chat" />
    <input type="hidden" name="do" value="postMessage" />
    <input type="hidden" name="chatRoom" value="<?php echo $chatroom['roomID'] ?>" />
    <input type="hidden" name="status" value="0<?php //echo $chatroom['status'] ?>" />
    <input type="hidden" name="nickname" value="@<?php echo $user->username ?>" />    
    <input type="hidden" name="userID" value="<?php echo (int)$user->id ?>" />     
</form>

<form  action="<?php echo JRoute::_('index.php?format=json'); ?>" method="post" name="chatRoomFormUpdater" id="chatRoomFormUpdater" >
   <?php echo JHTML::_('form.token') ; ?>
    <input type="hidden" name="format" value="json" />
    <input type="hidden" name="option" value="com_tuiyo" />
    <input type="hidden" name="controller" value="chat" />
    <input type="hidden" name="do" value="autoUpdateChatRoom" />
    <input type="hidden" name="chatRoom" value="<?php echo $chatroom['roomID'] ?>" />
    <input type="hidden" name="status" id="updaterStatus" value="0" />
    <input type="hidden" name="nickname" value="@<?php echo $user->username ?>" />    
    <input type="hidden" name="userID" value="<?php echo (int)$user->id ?>" />    
</form>