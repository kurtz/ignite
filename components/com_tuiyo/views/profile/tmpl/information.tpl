<div id="profileInformationDiv" class="tuiyoTable" style="margin-left: 5px; margin-bottom: 20px">
	

	<!--GENERAL INFORMATION-->
	<div class="tuiyoTableRow infoGroupTitle"><h3><?php echo _('General Profile Information' ) ;?></h3></div>
    <?php $dob = $user->get('dob') ; if( isset( $dob  ) && !empty( $dob  ) && $dob  !== '0000-00-00' ): ?>
	<div class="tuiyoTableRow infoElement">
    	<div class="tuiyoTableCell infoLabel" style="width: 35%"><?php echo _('Date of Birth:' ); ?></div>
        <div class="tuiyoTableCell infoValue" style="width: 65%"><?php echo date("F j", strtotime( $user->get('dob') ) ) ; ?></div>
        <div class="tuiyoClearFloat"></div>
    </div>
    <?php endif; ?>
	<div class="tuiyoTableRow infoElement">
    	<div class="tuiyoTableCell infoLabel" style="width: 35%"><?php echo _('Member Since:' ); ?></div>
        <div class="tuiyoTableCell infoValue" style="width: 65%"><?php echo TuiyoTimer::diff(strtotime( $user->registerDate ) ) ; ?></div>
        <div class="tuiyoClearFloat"></div>
    </div>	
    <div class="tuiyoTableRow infoElement">
    	<div class="tuiyoTableCell infoLabel" style="width: 35%"><?php echo _('Last seen here:'); ?></div>
        <div class="tuiyoTableCell infoValue" style="width: 65%"><?php echo TuiyoTimer::diff(strtotime( $user->lastvisitDate ) ) ; ?></div>
        <div class="tuiyoClearFloat"></div>
    </div>  
    
    <!--BADGES AND AWARDS-->
	<div class="tuiyoTableRow infoGroupTitle" style="margin-top: 15px"><h3><?php echo _('Profile Badges and Awards' ); ?></h3></div>     
	<div class="tuiyoTableRow infoElement">
        <div class="tuiyoTableCell infoValue" style="width: 100%">
    		<div class="TuiyoNoticeMsg"><?php echo sprintf( _( '%s has not yet earned any badges or awards'), ucfirst($user->username) )?></div>
    	</div>
        <div class="tuiyoClearFloat"></div>
    </div>
    
    <!--CONTACT INFORMATION-->
	<div class="tuiyoTableRow infoGroupTitle" style="margin-top: 15px"><h3><?php echo _('Contact Information' ); ?></h3></div>
    <?php $i=0; foreach($contact as $cInfo=>$value) :  ?>
    	<?php if(!empty($value) ): ?>
        <div class="tuiyoTableRow infoElement">
            <div class="tuiyoTableCell infoLabel" style="width: 35%"><?php echo ucfirst( $cInfo ) ?></div>
            <div class="tuiyoTableCell infoValue" style="width: 65%"><?php echo $value ?></div>
            <div class="tuiyoClearFloat"></div>
        </div>
		<?php $i++; endif; ?>
    <?php endforeach; if( (int)$i < 1 ) : ?>
    	<div class="privacyLock"><?php echo sprintf( _( '%s has either not yet edited this section of his profile, or has set this section to private, Log-in, and or befriend this user to open a new line of contact'), ucfirst($user->username) )?></div>
    <?php endif; ?> 
    
         
	<!--CUSTOM SOCIAL INFORMATION-->
	<div class="tuiyoTableRow infoGroupTitle" style="margin-top: 15px"><h3><?php echo _('More info About Me'); ?></h3></div>
    
    <?php $i=0; foreach($social as $info) :  ?>
    	<?php if(!empty($info->fd) && isset($info->fl) ) : ?>
        <div class="tuiyoTableRow infoElement">
            <div class="tuiyoTableCell infoLabel" style="width: 35%"><?php echo $info->fl ?></div>
            <div class="tuiyoTableCell infoValue" style="width: 65%"><?php echo nl2br($info->fd) ?></div>
            <div class="tuiyoClearFloat"></div>
        </div>
        <?php $i++; endif; ?>
    <?php endforeach; if( (int)$i < 1 ) : ?>
    	<div class="privacyLock"><?php echo sprintf( _( '%s has either not yet edited this section of his profile, or has set this section to private, Log-in, and or befriend this user to open a new line of contact'), ucfirst($user->username) )?></div>
    <?php endif; ?>  
               
    <!--FEEDS-->
	<div class="tuiyoTableRow infoGroupTitle" style="margin-top: 15px"><h3><?php echo _('RSS syndication' ) ;?></h3></div>  
   	<div class="tuiyoTableRow infoElement">
    	<div class="tuiyoTableCell infoLabel" style="width: 35%"><?php echo _('Activity feed:'); ?></div>
        <div class="tuiyoTableCell infoValue" style="width: 65%">
        	<img alt="#feed"  src="<?php echo $styleDir ?>/icons/feeds_16.png" style="margin-bottom: -4px;"    />
            <a href="<?php echo JRoute::_(TUIYO_INDEX.'&amp;view=profile&amp;do=getFeed&amp;format=feed&amp;pid='.$user->id ); ?>">Status updates</a>
        </div>
        <div class="tuiyoClearFloat"></div>
    </div>
                     
</div>