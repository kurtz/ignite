<div class="tuiyoTable">
	<div class="tuiyoTableRow">
		<div class="tuiyoTableCell" style="width: 50%">
			<div class="tuiyoColumn" id="tuiyoColumn1Pad">
				<div class="reporter"><jdoc:include type="message" /></div>
				<div class="splash-box">
					<div class="splash-box-title" style="font-weight: bold; font-size: 26px; line-height: 230%;"><?php echo $this->settings->get('siteName')?></div>
					<div class="splash-box-body">
						<p><?php echo $this->settings->get('siteDescription')?></p>
					</div>
					<?php if($this->user->joomla->get("guest")) : ?>
					<div class="splash-box-footer tuiyoTable">
						<div class="tuiyoTableRow">
							<div class="tuiyoTableCell" style="width: 100%"><button id="signInBtn">Sign-In</button><button id="signUpBtn">Create Account</button></div>
							<div class="tuiyoTableClearFloat" style="clear:both"></div>
						</div>
					</div>
					<?php else: ?>
						<div class="splash-box-footer tuiyoTable">
							<div class="tuiyoTableRow">
								<div class="tuiyoTableCell" style="width: 100%"><button id="signOutBtn">Log-Out</button></div>
								<div class="tuiyoTableClearFloat" style="clear:both"></div>
							</div>
						</div>
					<?php endif; ?>
				</div>
				<?php echo $this->activity ?> 
			</div>
		</div>
		<div class="tuiyoTableCell" style="width: 50%">
			<div class="tuiyoColumn" id="tuiyoColumn2Pad">
				<!--Newest Community Members--> 
            	<div class="dashBoardWidget">
                	<div class="dashBoardWidgetBodySubHead"><?php echo _('Welcome our new members')?></div>
                    <div class="dashBoardWidgetBody">
                        <?php if(count($this->newestmembers) < 1 ) : ?>	
                        	<div class="TuiyoNotification TuiyoInformation"><?php echo _('There are no featured users to display at this time.'); ?></div>
						<?php else : ?>   
							<?php foreach($this->newestmembers as $member) : ?>                         
	                       <div align="center" title="<?php echo $member->name ?>" class="friendListItem" style="margin: 1px; float: left;">
	                            <a href="<?php echo JRoute::_( TUIYO_INDEX.'&amp;view=profile&amp;do=view&user='.$member->username )  ?>" 
								  title="<?php echo $member->name ?>" class="hasTip" >
	                              <img alt="#"  src="<?php echo $member->avatar->thumb70 ?>" class="TuiyoAvatar" width="70" />
	                            </a>  
	                        </div>
							<?php endforeach; ?> 
							<div class="tuiyoClearFloat"></div>
						<?php endif; ?> 
                    </div>
                </div> 
                
				<!--Group suggestion--> 
            	<div class="dashBoardWidget">
                	<div class="dashBoardWidgetBodySubHead"><?php echo _('Interesting community groups')?></div>
                    <div class="dashBoardWidgetBody">
                        <?php if(sizeof($this->populargroups)<1 ) : ?>   
                            <div class="TuiyoNotification TuiyoInformation">There are no popular groups as of yet. Please create one now!</div>
                        <?php else : ?>
                            <?php foreach($this->populargroups as $pGroup ) : ?>
                                <div class="groupListItem" title="" style="position:relative" align="center">
                                    <a href="<?php echo JRoute::_(TUIYO_INDEX.'&amp;view=groups&amp;do=view&amp;gid='.$pGroup->groupID ); ?>">
                                        <img src="<?php echo $pGroup->logo ?>" class="groupLogo" />
                                    </a>
                                    <span class="commentCount" style="position: absolute; top: 9px; left: 1px; max-width: 70px; padding: 2px;"><?php printf(ngettext('%d member', '%d members', $pGroup->memberCount), $pGroup->memberCount); ?></span>
                                    <span><?php echo $pGroup->gName ?></span>
                                </div>
                            <?php endforeach; ?>
                            <div class="tuiyoClearFloat"></div>
                        <?php endif; ?>	
					</div>
                </div> 
                
                <!--Articles suggestion--> 
            	<div class="dashBoardWidget">
                	<div class="dashBoardWidgetBodySubHead"><?php echo _('Recent Articles')?></div>
                    <div class="dashBoardWidgetBody">
                        <?php if(sizeof($this->allarticles)<1) :?>
		             		<div class="TuiyoNotification TuiyoInformation"><?php echo _('There are no articles to show. Check back again shortly')?></div>
		             	<?php endif ?>
		             	<?php $i = 0; foreach($this->allarticles as $article): if($i+1>10):break;endif; ?>
		             	<div class="tuiyoTable activityStreamItem status" id="aid<?php echo $article->id ?>" style="">
		             		<div class="tuiyoTableRow">
		             			
		             			<?php // print_R($this->allarticles)?>
		             			
		             			<div class="activityStreamItemMainBody">
		             				<?php echo $article->title ?>
		             				<div class="bodyAttachmentPlaceHolder" style="display: none; cursor: pointer">view attachement</div>
		             				
		             				<div class="bodyDescr public " title="This entry is Public" style="margin: 5px 0">
		             					<span class="descrInfo2"> By </span>
		             					<a href="<?php echo JRoute::_(TUIYO_INDEX.'&view=profile&do=view&user='.$article->username ) ?>"><span><?php echo $article->username ?></span></a>
		             					<a class="statustime" href="#"><span><?php echo $article->datetime ?></span></a>  
		             					<span class="commentCount" style="float:right; margin-right: 10px"><?php echo sizeof($article->comments) ?> comments</span>
		             				</div>
		             			</div>

		             			<div class="tuiyoClearFloat"></div>
		             		</div>
		             	</div>
		             	<?php $i++; endforeach; ?>
					</div>
                </div> 
                
                <!--Friends online--> 
            	<div class="dashBoardWidget">
                	<div class="dashBoardWidgetBodySubHead"><?php echo _('Friends currently online')?></div>
                    <div class="dashBoardWidgetBody">
                        <?php if(count($this->onlinefriends) < 1 ) : ?>	
                        	<div class="TuiyoNotification TuiyoInformation"><?php echo _('You do not have any friends online at this time.'); ?></div>
						<?php else : ?>   
							<?php foreach($this->onlinefriends as $member) : ?>                         
	                       <div align="center" title="<?php echo $member->name ?>" class="friendListItem" style="margin: 1px; float: left;">
	                            <a href="<?php echo JRoute::_( TUIYO_INDEX.'&amp;view=profile&amp;do=view&user='.$member->username )  ?>" 
								  title="<?php echo $member->name ?>" class="hasTip" >
	                              <img alt="#"  src="<?php echo $member->avatar->thumb70 ?>" class="TuiyoAvatar" width="70" />
	                            </a>  
	                        </div>
							<?php endforeach; ?> 
						<?php endif; ?> 
						<div class="tuiyoClearFloat"></div>
						<!--<div class="dashboardWidgetFooter tuiyoTable" >
	                    	<div class="tuiyoTableRow">
	                    		<div class="tuiyoTableCell" style="width: 50%"><a>View all friends (128)</a></div>
	                    		<div class="tuiyoTableCell" style="width: 50%" align="right"><a>Search</a></div>
	                    		<div style="clear: both"></div>
	                    	</div>
	                    </div>-->							  
					</div>
                </div> 
                <!--Photos suggestion--> 
            	<div class="dashBoardWidget">
                	<div class="dashBoardWidgetBodySubHead"><?php echo _('Recently uploaded photos')?></div>
                    <div class="dashBoardWidgetBody">
                        <div class="TuiyoNotification TuiyoAttention"><?php echo _('There are no new new recomendations for you at this time '); ?></div>
						
					</div>
                </div> 
                				
			</div>
		</div>
		<div style="clear:both"></div>
	</div>
</div>


<?php if($this->user->joomla->get("guest")): ?>
<!-- -AUTH.tpl -->

<!-- @TODO check if registration is allowed -->
<div id="loginPageCreate" class="TuiyoTable pageItem" style="display: none">

   
    <form action="index.php" method="post" name="createAccountPageForm"  id="createAccountPageForm" class="TuiyoForm" >
        <div class="tuiyoTableRow">
            <div class="tuiyoTableCell" style="width: 100%; font-weight: bold"><?php echo _('Full Name' ); ?></div>
            <div class="tuiyoTableCell" style="width: 100%">
            	<input type="text" name="name" id="name" class="TuiyoFormText" value="<?php echo $this->inviteeName ?>" />
           	</div>
            <div class="tuiyoClearFloat"></div>
        </div>
        <div class="tuiyoTableRow">
            <div class="tuiyoTableCell" style="width: 100%; font-weight: bold"><?php echo _('Valid e-mail' ); ?></div>
            <div class="tuiyoTableCell" style="width: 100%">
            	<input type="text" name="email" id="email" class="TuiyoFormText" value="<?php echo $this->inviteeEmail ?>" />
            </div>
            <div class="tuiyoClearFloat"></div>
        </div>
        <div class="tuiyoTableRow">
            <div class="tuiyoTableCell" style="width: 100%; font-weight: bold"><?php echo _('Username (mininum of 6 chars, aA-zZ,0-9 only)') ;?></div>
            <div class="tuiyoTableCell" style="width: 100%"><input type="text" name="username" id="username" class="TuiyoFormText" /></div>
            <div class="tuiyoClearFloat"></div>
        </div>
        <div class="tuiyoTableRow">
            <div class="tuiyoTableCell" style="width: 100%; font-weight: bold"><?php echo _('Password (minimun of 8 chars)' ); ?></div>
            <div class="tuiyoTableCell" style="width: 100%"><input type="password" name="password" id="password" class="TuiyoFormText" /></div>
            <div class="tuiyoClearFloat"></div>
        </div>
        <div class="tuiyoTableRow">
            <div class="tuiyoTableCell" style="width: 100%; font-weight: bold"><?php echo _('Verify Password' ); ?></div>
            <div class="tuiyoTableCell" style="width: 100%"><input type="password" name="password2" id="password2" class="TuiyoFormText" /></div>
            <div class="tuiyoClearFloat"></div>
        </div>
        
        <?php if($this->requireInvite) : ?>
            <div class="tuiyoTableRow">
                <div class="tuiyoTableCell" style="width: 100%;"><?php echo _('Invitation code'); ?></div>
                <div class="tuiyoTableCell" style="width: 100%">
                	<input type="text" name="inviteCode" id="inviteCode" class="TuiyoFormText" value="<?php echo $this->inviteCode ?>" />
                </div>
                <div class="tuiyoClearFloat"></div> 
            </div>
        <?php endif; ?>
        
         <div class="tuiyoTableRow">
            <div class="tuiyoTableCell" style="width: 10%;" align="right">
                <input type="checkbox" name="acceptTerms" id="acceptTerms" class="TuiyoFormCheckBox" value="1" style="margin: 3px 10px" />
            </div>
            <div class="tuiyoTableCell" style="width: 80%"><?php echo _('I agree to the terms of use of this service' ); ?></div>
            <div class="tuiyoClearFloat"></div>
        </div>
        <div class="tuiyoTableRow" style="margin-top: 15px">
            <div class="tuiyoTableCell" style="width: 100%" align="center">
                <button class="TuiyoFormButton" type="submit" ><?php echo _('Create account' ); ?></button>
            </div>
            <div class="tuiyoClearFloat"></div>
        </div>
        <input type="hidden" name="option" value="com_tuiyo" />
        <input type="hidden" name="view" value="core" />
        <input type="hidden" name="do" value="signup" />
        <input type="hidden" name="id" value="0" />
        <input type="hidden" name="gid" value="0" />
        <?php echo JHTML::_('form.token'); ?>
    </form>
</div>

<!--RESET PASSWORD OR USERNAME-->
<div id="loginPageResetDetails" class="TuiyoTable  pageItem" style="display: none">
    <form action="<?php echo JRoute::_('index.php?option=com_user') ?>" method="post" name="resetAccountDetails"  
              id="resetAccountDetails" class="TuiyoForm" >
        <div class="tuiyoTableRow">
            <div class="tuiyoTableCell" style="width: 100%; font-weight: bold"><?php echo _('What is your e-mail address' ); ?></div>
            <div class="tuiyoTableCell" style="width: 100%"><input type="text" name="email" id="email" class="TuiyoFormText" /></div>
            <div class="tuiyoClearFloat"></div>
        </div>
        <div class="tuiyoTableRow" style="margin-top: 15px">
            <div class="tuiyoTableCell" style="width: 100%" align="center">
                <button class="TuiyoFormButton" type="submit" ><?php echo _('Resend my login details' ); ?></button>
            </div>
            <div class="tuiyoClearFloat"></div>
        </div>
        <input type="hidden" name="option" value="com_user" />
        <input type="hidden" name="task" value="requestreset" />
        <?php echo JHTML::_('form.token'); ?>
    </form>
</div>


<!--LOGIN IF ALREADY HAVE ACCOUNT-->
<div id="loginPageSignIn" class="TuiyoTable  pageItem" style="display: none">
    <form action="<?php echo JRoute::_('index.php?option=com_user') ?>" method="post" name="loginAccountDetails"  
              id="loginAccountDetails" class="TuiyoForm" >
        <div class="tuiyoTableRow">
            <div class="tuiyoTableCell" style="width: 100%; font-weight: bold"><?php echo _('Username' ); ?></div>
            <div class="tuiyoTableCell" style="width: 100%"><input type="text" name="username" id="username" class="TuiyoFormText" /></div>
            <div class="tuiyoClearFloat"></div>
        </div>
        <div class="tuiyoTableRow">
            <div class="tuiyoTableCell" style="width: 100%; font-weight: bold"><?php echo _('Password' ); ?></div>
            <div class="tuiyoTableCell" style="width: 100%"><input type="password" name="passwd" id="passwd" class="TuiyoFormText" /></div>
            <div class="tuiyoClearFloat"></div>
        </div>        
       <div class="tuiyoTableRow">
            <div class="tuiyoTableCell" style="width: 10%;" align="right">
                <input type="checkbox" name="remember" id="remember" class="TuiyoFormCheckBox" style="margin: 3px 10px" />
            </div>
            <div class="tuiyoTableCell" style="width: 80%">Save login details. See our <a href="#"><?php echo _('Privacy Policy' );?></a></div>
            <div class="tuiyoClearFloat"></div>
        </div>
        <div class="tuiyoTableRow" style="margin-top: 15px">
            <div class="tuiyoTableCell" style="width: 100%" align="center">
                <button class="TuiyoFormButton" type="submit" ><?php echo _('Log-in to my profile' ); ?></button>
            </div>
            <div class="tuiyoClearFloat"></div>
        </div>
        <input type="hidden" name="option" value="com_user" />
        <input type="hidden" name="return" value="<?php echo base64_encode( JRoute::_( TUIYO_INDEX.'&amp;view=welcome' , FALSE ) ); ?>" />
        <input type="hidden" name="task" value="login" />
        <?php echo JHTML::_('form.token'); ?>
    </form>
</div>

<?php endif; ?>