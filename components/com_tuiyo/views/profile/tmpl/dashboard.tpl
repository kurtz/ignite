<div class="notificationMainPage pageElLeft" style="display: none">
	<!--Inbox-->
	<div class="dashBoardWidget" id="notificationsWidget">
	     <div class="dashBoardWidgetBodySubHead"><?php echo _('Lastest Notifications'); ?></div>
	         <div class="dashBoardWidgetBody">
	         <div class="tuiyoTable">
	             <?php if( count((array)$notices) < 1 ) :?>
	                 <div class="TuiyoNotification TuiyoAttention"><?php echo _('There are no new notices at this time'); ?></div> 
	                 <?php endif; ?>
	             <?php foreach((array)$notices as $notice) : ?>
             
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
             
	             <!--<div class="notificationsListPages" style="border-top: 2px solid #ddd;"><?php echo $pages ?></div>-->                                      
	         </div>
	     </div> 
</div>
<div class="searchMainPage pageElLeft" id="SearchPage" style="display: none">
	<div class="TuiyoNotification TuiyoInformation">Results will be displayed here</div>
</div>
<div class="homepageMainPage pageElLeft" id="dashboardContent">
    <div class="reporter"><jdoc:include type="message" /></div>
    <div id="homepageDashboard">
        <div class="tuiyoTable">
        	<div class="tuiyoTableRow">
        	     <!--Quick Links to groups widgets and inbox-->                 
            	<div class="dashBoardWidget">
					<div class="dashBoardWidgetBodySubHead">
						Welcome to your dashboard. (last visit ~ <span style="color: green"><?php echo $lastVisted ?></span>).
					</div>      
                    <div class="dashBoardWidgetBody">                        
                     <div style="float: left;">
                            <div class="icon" align="center" title="<?php echo _('Go to welcome lobby'); ?>">
                                 <a href="<?php echo JRoute::_( TUIYO_INDEX.'&amp;view=welcome&amp;do=view')  ?>">
                                    <img alt="#lobby"  src="<?php echo $styleDir ?>/images/explore.png" align="middle"  /> 
                                    <span><?php echo _('Explorer') ;?></span>
                                </a>
                            </div>
                        </div>                                              
                         <div style="float: left;">
                            <div class="icon" align="center" title="<?php echo _('View your profile'); ?>">
                                 <a href="<?php echo JRoute::_( TUIYO_INDEX.'&amp;view=profile&amp;do=view')  ?>">
                                    <img alt="#profile"  src="<?php echo $styleDir ?>/images/profile.png" align="middle"  /> 
                                    <span><?php echo _('Profile') ;?></span>
                                </a>
                            </div>
                        </div>
                         <div style="float: left;">
                            <div class="icon" align="center" title="<?php echo _('Advanced search') ?>">
                                 <a href="<?php echo JRoute::_( 'index.php?option=com_search&amp;view=serach')  ?>">
                                    <img alt="#searc"  src="<?php echo $styleDir ?>/images/search.png" align="middle"  /> 
                                    <span><?php echo _('Search'); ?></span>
                                </a>
                            </div>
                        </div>
                         <div style="float: left;">
                            <div class="icon" align="center" title="<?php echo _('View your inbox'); ?>">
                                 <a href="<?php echo JRoute::_( TUIYO_INDEX.'&amp;view=messages')  ?>">
                                    <img alt="#msgs"  src="<?php echo $styleDir ?>/images/email.png" align="middle"  /> 
                                    <span><?php echo _('Messages'); ?></span>
                                </a>
                            </div>
                        </div>
                         <div style="float: left;">
                            <div class="icon" align="center" title="<?php echo _('Instant messages with online friends' ) ;?>">
                                 <a href="<?php echo JRoute::_( TUIYO_INDEX.'&amp;view=services&service=system&do=chatBox')  ?>">
                                    <img alt="#phts"  src="<?php echo $styleDir ?>/images/forum.png" align="middle"  /> 
                                    <span><?php echo _('Live Chat'); ?></span>
                                </a>
                            </div>
                        </div> 
                         <div style="float: left;">
                            <div class="icon" align="center" title="<?php echo _('Personal calendar of events'); ?>">
                                 <a href="<?php echo JRoute::_( TUIYO_INDEX.'&amp;view=messages&amp;do=calendar')  ?>">
                                    <img alt="#cal"  src="<?php echo $styleDir ?>/images/calendar.png" align="middle"  /> 
                                    <span><?php echo _('Calendar' );?></span>
                                </a>
                            </div>
                        </div>
                                    
                         <div style="float: left;">
                            <div class="icon" align="center" title="<?php echo _('Manage your friends, and activity subscription' ); ?>">
                                 <a href="<?php echo JRoute::_( TUIYO_INDEX.'&amp;view=friends')  ?>">
                                    <img alt="#phts"  src="<?php echo $styleDir ?>/images/friends.png" align="middle"  /> 
                                    <span><?php echo _('Friends' ); ?></span>
                                </a>
                            </div>
                        </div>
                                                    
                         <div style="float: left;">
                            <div class="icon" align="center" title="<?php echo _('Your private widget page' ); ?>">
                                 <a href="<?php echo JRoute::_( TUIYO_INDEX.'&amp;view=widgets')  ?>">
                                    <img alt="#wdgts"  src="<?php echo $styleDir ?>/images/widgets.png" align="middle"  /> 
                                    <span><?php echo _('Widgets' ); ?></span>
                                </a>
                            </div>
                        </div>
                         <div style="float: left;">
                            <div class="icon" align="center" title="<?php echo _('Manage, explore and join groups') ?>">
                                 <a href="<?php echo JRoute::_( TUIYO_INDEX.'&amp;view=groups')  ?>">
                                    <img alt="#grps"  src="<?php echo $styleDir ?>/images/groups.png" align="middle"  /> 
                                    <span><?php echo _('Groups' ); ?></span>
                                </a>
                            </div>
                        </div>
                         <div style="float: left;">
                            <div class="icon" align="center" title="<?php echo _('Photo albums and galleries' ) ;?>">
                                 <a href="<?php echo JRoute::_( TUIYO_INDEX.'&amp;view=photos')  ?>">
                                    <img alt="#phts"  src="<?php echo $styleDir ?>/images/photos.png" align="middle"  /> 
                                    <span><?php echo _('Photos'); ?></span>
                                </a>
                            </div>
                        </div>
                         <div style="float: left;">
                            <div class="icon" align="center" title="<?php echo _('Configure your account' ) ;?>">
                                 <a href="<?php echo JRoute::_( TUIYO_INDEX.'&amp;view=profile&amp;do=settings')  ?>">
                                    <img alt="#phts"  src="<?php echo $styleDir ?>/images/settings.png" align="middle"  /> 
                                    <span><?php echo _('Settings'); ?></span>
                                </a>
                            </div>
                        </div>
                         <div style="float: left;">
                            <div class="icon" align="center" title="<?php echo _('Your Uploaded Resources' ) ;?>">
                                 <a href="<?php echo JRoute::_( TUIYO_INDEX.'&amp;view=profile&do=filemanager')  ?>">
                                    <img alt="#phts"  src="<?php echo $styleDir ?>/images/storage.png" align="middle"  /> 
                                    <span><?php echo _('Files'); ?></span>
                                </a>
                            </div>
                        </div>  
                         <div style="float: left;">
                            <div class="icon" align="center" title="<?php echo _('Your Blog' ) ;?>">
                                 <a href="<?php echo JRoute::_( TUIYO_INDEX.'&amp;view=articles')  ?>">
                                    <img alt="#phts"  src="<?php echo $styleDir ?>/images/pencil.png" align="middle"  /> 
                                    <span><?php echo _('Articles'); ?></span>
                                </a>
                            </div>
                        </div>
                         <div style="float: left;">
                            <div class="icon" align="center" title="<?php echo _('Your say' ) ;?>">
                                 <a href="<?php echo JRoute::_( TUIYO_INDEX.'&amp;view=discussions')  ?>">
                                    <img alt="#phts"  src="<?php echo $styleDir ?>/images/diary.png" align="middle"  /> 
                                    <span><?php echo _('Discussion'); ?></span>
                                </a>
                            </div>
                        </div> 
                       	<?php foreach($plugins as $p) :?>
	                       	<div style="float: left;">
	                            <div class="icon" align="center" title="<?php echo ucfirst($p); ?>">
	                                 <a href="<?php echo JRoute::_( TUIYO_INDEX.'&amp;view=services&do=display&service='.$p)  ?>">
	                                    <img alt="#phts"  src="components/com_tuiyo/plugins/<?php echo $p.'/'.$p ?>-32x32.png" align="middle"  /> 
	                                    <span><?php echo ucfirst($p); ?></span>
	                                </a>
	                            </div>
	                        </div>
		             	<?php endforeach; ?> 
		             	                                                                                               
                        <?php foreach($lastUsed as $userApp) : ?>
                            <div style="float: left;">
                                <div class="icon" align="center" title="<?php echo( $userApp->name ) ?>">
                                     <a href="<?php echo JRoute::_( TUIYO_INDEX.'&amp;view=apps&amp;app='.$userApp->identifier )  ?>">
                                    <img alt="#<?php echo( $userApp->name ) ?>"  
                                         src="components/com_tuiyo/applications/<?php echo $userApp->identifier ?>/icon.png" 
                                       align="middle"  /> 
                                    <span><?php echo ucfirst( $userApp->identifier ) ?></span>
                                    </a>
                                </div>
                            </div>
                        <?php endforeach; ?>  
                        
                        <div class="tuiyoClearFloat"></div>
                     </div>
                </div>  
              
                <!--Brief profile statics-->
            	<div class="dashBoardWidget">
                	<div class="dashBoardWidgetBodySubHead"> Profile viewed <span style="color: green"><?php echo $user->get('profileView' , 0 ); ?></span> time(s). Below are you're latest visitors</div>
                    <div class="dashBoardWidgetBody">                    
				        <?php if( count((array)$visitors) < 1 ) :?>
                            <div class="TuiyoNotification TuiyoAttention"><?php echo _('A list of the recent people to visit your profile will be displayed here '); ?></div> 
                        <?php endif; ?>
                        <?php foreach((array)$visitors as $visitor) : $visitor->API =& TuiyoAPI::get("user" , (int)$visitor->whoID ); ?>
                        	
                           <div align="center" title="<?php echo $visitor->API->name ?> visited <?php echo TuiyoTimer::diff( strtotime($visitor->date) ) ?>" 
                           		class="friendListItem" style="width:75px; float: left; padding: 4px; height:100px">
                                <a href="<?php echo JRoute::_( TUIYO_INDEX.'&amp;view=profile&amp;do=view&user='.$visitor->API->username )  ?>">
                                    <img class="TuiyoUserAvatar" src="<?php echo $visitor->API->getUserAvatar( (int)$visitor->whoID )->thumb70 ?>" 
                                         style="border:1px solid #ccc; padding:2px;">
                                </a>
                                <span><?php echo $visitor->API->username ?></span>
                            </div>  
                        <?php endforeach ; ?>
                        <div style="clear: both"></div>
                    </div>
                </div>                                                                    	
            </div>
        </div>
    </div>
</div>
<div style="clear: both"></div>
