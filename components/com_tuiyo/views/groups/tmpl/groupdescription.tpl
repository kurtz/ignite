<!--Group Description--> 
<div class="dashBoardWidget">
	<div class="dashBoardWidgetBodySubHead"><?php echo _('About this Group')?></div>
	<div class="dashBoardWidgetBody tuiyoTableRow">
		<div style="margin-bottom: 10px"><?php echo nl2br( $groupData->longDescription ); ?></div>
	<?php if($groupData->gType == 'private' ) : ?>
		<div class="TuiyoNotification TuiyoInformation">
	    	<?php echo sprintf( _( '%s is a private group. To participate you will need to be invited by the group owner'), ucfirst($groupData->gName) )?></div> 
	<?php else : ?>
		<div class="TuiyoNotification TuiyoInformation">
	    	<?php echo sprintf( _( '%s is a public group. Participation is open to everyone who subscribes. Content is public'), ucfirst($groupData->gName) )?></div> 
	<?php endif; ?> 
		
	                      
    	<div class="tuiyoClearFloat"></div>

	</div>
</div>