<?php defined('TUIYO_EXECUTE') || die('Restricted access'); ?>

<div id="pageContainer" class="messagesBoxContainer">

	<div id="pageLeftNav">	
    	<div class="tuiyoTable userAvatarThumbDiv" style="width: 100%">
        	<div class="tuiyoTableRow">
            	<div class="tuiyoTableCell" style="width: 50px">
                	<img alt="#"  src="http://s3.amazonaws.com/twitter_production/profile_images/318612214/twitterProfilePhoto_bigger.jpg" width="50" />
                </div>
                <div class="tuiyoTableCell" style="width: 145px; padding-left: 5px; font-size: 15px;"><a href="#">Drstonyhills</a></div>
                <div class="tuiyoClearFloat"></div>
            </div>
        </div>
        
       	<div class="messagesBoxFolders">
			<ul id="pageNavigation">
            	<li class="current"><img alt="#"  src="<?php echo $this->livestyle ?>/icons/priority_16.png"  /><a href="#core">System events notifications</a></li>
                <li><img alt="#"  src="<?php echo $this->livestyle ?>/icons/sent_mail_16.png"  /><a href="#outgoing">Outgoing email notifications</a></li>
                <li><img alt="#"  src="<?php echo $this->livestyle ?>/icons/file_txt_16.png"  /><a href="#incoming">External incoming notifications</a></li>
                <li><img alt="#"  src="<?php echo $this->livestyle ?>/icons/clock_16.png"  /><a href="#reminders">Important reminders</a></li>
                <li><img alt="#"  src="<?php echo $this->livestyle ?>/icons/control_16.png"  /><a href="#settings">Notifications settings</a></li>
            </ul>
        </div>
	</div>
    
	<div id="messagesBoxContent">
    	<div class="messagesBoxMainPage" >
        	<div class="reporter"><jdoc:include type="message" /></div>
            <div id="messagesBoxTop">
                <div id="messagesBoxNavigationTabs">
                    <ul class="NavigationTabs">
                        <li><img alt="#"  src="<?php echo $this->livestyle ?>/icons/inbox_16.png"  />
                        	<a href="<?php echo JROUTE::_(TUIYO_INDEX.'&view=messages') ?>">Messages</a></li>
                        <li><img alt="#"  src="<?php echo $this->livestyle ?>/icons/address_book_16.png"  />
                        	<a href="<?php echo JROUTE::_(TUIYO_INDEX.'&view=messages&do=addressBook') ?>">Address book</a></li>
                        <li ><img alt="#"  src="<?php echo $this->livestyle ?>/icons/calendar_16.png"  />
                        	<a href="<?php echo JROUTE::_(TUIYO_INDEX.'&view=messages&do=calendar') ?>">Calendar </a></li>
                        <li class="current"><img alt="#"  src="<?php echo $this->livestyle ?>/icons/target_16.png"  />
                        	<a href="<?php echo JROUTE::_(TUIYO_INDEX.'&view=messages&do=notifications') ?>">Notifications</a></li>
                    </ul>
                    <div class="tuiyoClearFloat"></div>
                </div>
                <div class="messagesBoxSubNavigation">&nbsp;</div>
            </div>

        	<div id="messagesBoxCalendar">
                 <div style="padding: 10px">Notifications go here</div>        
            </div>
                        
        </div>
	</div>
     <div class="tuiyoClearFloat"></div>
</div>


