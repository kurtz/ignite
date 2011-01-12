<ul id="menu">
    <li><a href="<?php echo TUIYO_INDEX ?>">Home</a></li>
    <li class="parent"><a href="#">Manage</a>
		<ul class="child1">
			<li><a href="<?php echo JRoute::_( TUIYO_INDEX.'&amp;context=communityManagement&amp;do=display' );?>">Members</a></li>
			<li><a href="<?php echo JRoute::_( TUIYO_INDEX.'&amp;context=communityManagement&amp;do=editpermissions' );?>">Permission Levels</a></li>
			<li><a href="<?php echo JRoute::_( TUIYO_INDEX.'&amp;context=communityManagement&amp;do=getGroups' );?>">Member Groups</a></li>
			<li><a href="<?php echo JRoute::_( TUIYO_INDEX.'&amp;context=communityManagement&do=moderator' );?>">Moderation Queue</a></li>
			<li><a href="<?php echo JRoute::_( TUIYO_INDEX.'&amp;context=SystemTools&amp;do=languagemgr' ); ?>">Language Manager</a></li>						
		</ul>
	</li>
    <li class="parent"><a href="#">Resources</a>
		<ul class="child1">
			<li><a href="<?php echo JRoute::_( TUIYO_INDEX.'&amp;context=communityManagement&do=moderator&action=announcements' );?>">Announcements</a></li>
			<li><a href="<?php echo JRoute::_( TUIYO_INDEX.'&amp;context=SystemTools&amp;do=statistics' ); ?>">Community Statistics</a></li>
			<li><a href="<?php echo JRoute::_( TUIYO_INDEX.'&amp;context=communityManagement&do=filemanager' );?>">File Manager</a></li>
			<li><a href="<?php echo JRoute::_( TUIYO_INDEX.'&amp;context=SystemTools&amp;do=reportBug' ); ?>">Bug Reports</a></li>
		</ul>
	</li>
    <li class="parent"><a href="#">Layout</a>
		<ul class="child1">
			<li><a href="<?php echo JRoute::_( TUIYO_INDEX.'&amp;context=SystemTools&amp;do=layoutmgr&action=modules' ); ?>">Layout Modules</a></li>
			<li><a href="<?php echo JRoute::_( TUIYO_INDEX.'&amp;context=SystemTools&amp;do=layoutmgr&action=edit' ); ?>">Layout Editor</a></li>
		</ul>
	</li>
    <li class="parent"><a href="#">Settings</a>
		<ul class="child1">
			<li><a href="<?php echo JRoute::_( TUIYO_INDEX.'&amp;context=SystemTools&amp;do=globalConfig' ); ?>">General Settings</a></li>
			<li><a href="<?php echo JRoute::_( TUIYO_INDEX.'&amp;context=systemTools&do=userFields' ); ?>">Custom Profile fields</a></li>
			<li><a href="<?php echo JRoute::_( TUIYO_INDEX.'&amp;context=communityManagement&amp;do=getCategories' );?>">Global Categories</a></li>
			<li><a href="<?php echo JRoute::_( TUIYO_INDEX.'&amp;context=systemTools&amp;do=editEmails' ); ?>">Email settings</a></li>
		</ul>
	</li>
    <li class="parent"><a href="#">Extensions</a>
		<ul class="child1">
			<li><a href="<?php echo JRoute::_( TUIYO_INDEX.'&amp;context=extensions&amp;do=extensionmgr&action=lists' ); ?>">Installed Plugins</a></li>
			<li><a href="<?php echo JRoute::_( TUIYO_INDEX.'&amp;context=SystemTools&amp;do=autoCenter' ); ?>">Package Installer</a></li>
		</ul>
	</li>
	<li><a href="<?php echo JURI::root().TUIYO_INDEX."&amp;view=welcome" ?>" target="_blank">Preview site</a></li>
</ul>
<ul id="session">
    <li>Logged in as <span><?php echo $user->username ?></span></li>
    <li><a href="#">My Account</a></li>
    <li><a href="<?php echo JRoute::_( 'index.php' ) ?>">Return to Joomla</a></li>
</ul>