<div class="tuiyoTable">
	<div class="tuiyoTableRow">
		<div class="tuiyoTableCell" style="width: 50%">
			<div class="tuiyoColumn" id="tuiyoColumn1Pad">				
				<div class="cfgElements basicProfile">
		            <div class="aTAHead dashBoardWidgetBodySubHead"><?php echo _('Account Information' ); ?></div>
		            <div class="dTABody">
		            	<form class="TuiyoForm" name="userAccountInfo" id="userAccountInfo" method="post" action="index.php">
		                    <fieldset id="accountInformation">
		                        <div class="tuiyoTableRow" style="margin-top: 8px">
		                            <div class="tuiyoTableCell" style="width: 35%; padding: 4px 0"><?php echo _('Your full name'); ?></div>
		                            <div class="tuiyoTableCell" style="width: 65%">
		                                <input type="text" name="name" id="name" class="TuiyoFormText" value="<?php echo $this->user->name ?>" />
		                            </div>
		                            <div class="tuiyoClearFloat"></div>
		                        </div>
		                                              
		                        <div class="tuiyoTableRow" style="margin-top: 8px">
		                            <div class="tuiyoTableCell" style="width: 35%; padding: 4px 0"><?php echo _('E-mail address' ); ?></div>
		                            <div class="tuiyoTableCell" style="width: 65%">
		                                <input type="text" name="email" id="email" class="TuiyoFormText" value="<?php echo $this->user->email ?>" />
		                            </div>
		                            <div class="tuiyoClearFloat"></div>
		                        </div>
		                        <div class="tuiyoTableRow" style="margin-top: 8px">
		                            <div class="tuiyoTableCell" style="width: 35%; padding: 4px 0"><?php echo _('Username (aA-zZ,0-9)' ); ?></div>
		                            <div class="tuiyoTableCell" style="width: 65%">
		                                <input type="text" name="username_" id="username_" class="TuiyoFormText" disabled="disabled" value="<?php echo $this->user->username ?>" />
		                            </div>
		                            <div class="tuiyoClearFloat"></div>
		                        </div>
		                        <div class="tuiyoTableRow" style="margin-top: 8px">
		                            <div class="tuiyoTableCell" style="width: 35%; padding: 4px 0"><?php echo _('Password (at least 9 chars)' ); ?></div>
		                            <div class="tuiyoTableCell" style="width: 65%">
		                                <input type="password" name="password" id="password" class="TuiyoFormText" value="" />
		                            </div>
		                            <div class="tuiyoClearFloat"></div>
		                        </div>  
		                        <div class="tuiyoTableRow" style="margin-top: 8px">
		                            <div class="tuiyoTableCell" style="width: 35%; padding: 4px 0"><?php echo _('Verify password' ); ?></div>
		                            <div class="tuiyoTableCell" style="width: 65%">
		                                <input type="password" name="password2" id="password2" class="TuiyoFormText" value="" />
		                            </div>
		                            <div class="tuiyoClearFloat"></div>
		                        </div>                        
		                       <div class="tuiyoTableRow" style="margin-top: 8px">
		                            <div class="tuiyoTableCell" style="width: 35%; padding: 4px 0"><?php echo _('Your date of birth' ); ?></div>
		                            <div class="tuiyoTableCell" style="width: 65%">
		                                <input type="text" style="cursor: pointer" 
		                                       name="dob" id="dob" class="TuiyoFormText TuiyoDatePicker" onfocus="return" readonly="readonly" value="<?php echo $this->user->get( 'dob' ) ?>" />       
			   						</div>
		                            <div class="tuiyoClearFloat"></div>
		                        </div> 
		                        <div class="tuiyoTableRow" style="margin-top: 8px">
		                            <div class="tuiyoTableCell" style="width: 35%; padding: 4px 0"><?php echo _('Gender') ;?></div>
		                            <div class="tuiyoTableCell" style="width: 65%">
		                                <select type="text" name="sex" id="sex" class="TuiyoFormDropDown">
		                                	<option value="1" <?php if((int)$this->user->sex === 1){echo "selected=\"selected\""; } ?>><?php echo _('Male'); ?></option>
		                                    <option value="0"><?php echo _('Female'); ?></option>
		                                </select>
		                            </div>
		                            <div class="tuiyoClearFloat"></div>
		                        </div>
		                     
		                        <div class="tuiyoTableRow" style="margin-top: 8px">
		                            <div class="tuiyoTableCell" style="width: 35%; padding: 4px 0">&nbsp;</div>
		                            <div class="tuiyoTableCell" style="width: 65%">
		                                <input type="checkbox" name="suspendUser" id="suspendUser" class="TuiyoFormCheckBox" />
		                                <i><a  href="#" style="font-weight: normal"><?php echo _('Suspend my account' ); ?></a></i>
		                            </div>
		                            <div class="tuiyoClearFloat"></div>
		                        </div>
		                        <div class="tuiyoTableRow" style="margin-top: 8px">
		                            <div class="tuiyoTableCell" style="width: 35%; padding: 4px 0">&nbsp;</div>
		                            <div class="tuiyoTableCell" style="width: 65%">
		                                <input type="checkbox" name="deleteUser" id="deleteUser" class="TuiyoFormCheckBox" />
		                                <i><a href="#" style="font-weight: normal"><?php echo _('Delete my account' ); ?></a></i>
		                            </div>
		                            <div class="tuiyoClearFloat"></div>
		                        </div>                         
		                        <div class="tuiyoTableRow" style="margin-top: 8px">
		                            <div class="tuiyoTableCell" style="width: 35%; padding: 4px 0"></div>
		                            <div class="tuiyoTableCell" style="width: 65%">
		                                <button class="TuiyoFormButton1" id="submitUserData" name="submitUserData" type="submit" ><?php echo _('Update Account' ) ;?></button>
		                            </div>
		                            <div class="tuiyoClearFloat"></div>
		                        </div>         
		                    </fieldset>
		                    <input type="hidden" name="option" value="com_tuiyo" />
		                    <input type="hidden" name="do" value="saveEdit" />
		                    <input type="hidden" name="format" value="json" />  
		                    <input type="hidden" name="view" value="profile" />
		                    <input type="hidden" name="jid" value="<?php echo $this->user->id ?>"  /> 
		                    <?php echo JHTML::_('form.token'); ?>
		                </form>
		            </div>
		        </div>
				<div class="cfgElements profilePicture" style="margin-top: 20px">
		            <div class="aTAHead dashBoardWidgetBodySubHead"><?php echo _('Chose Profile Picture' );?></div>
		            <div class="dTABody">
		            	<form name="profilePicture" id="profilePicture" class="TuiyoForm" method="post" >
		                    <fieldset style="margin-bottom: 10px">
		                    	<div class="uploadBG tuiyoTable">
		                            <div class="tuiyoTableRow" style="margin-top: 8px" >		                            
		                            	<div class="tuiyoTableCell" style="width: 35%; padding: 4px 0">Profile Picture</div>
		                                <div class="tuiyoTableCell" style="width: 65%">
		                                    <input type="file" name="userAvatarUpload" id="userAvatarUpload" class="TuiyoFormFile" width="210" />
		                                </div>
		                                <div class="tuiyoClearFloat"></div>
		                            </div>                                   
		                            <div class="tuiyoTableRow" style="margin-top: 8px">
		                            	<div class="tuiyoTableCell" style="width: 35%; padding: 4px 0">Current Profile Pic</div>
		                                <div class="tuiyoTableCell" style="width: 65%">
			                            	<img src="<?php echo $this->user->getUserAvatar()->thumb200 ?>" 
							                   style="padding: 2px; border: 1px solid #ccc;" alt="#" />
			                            </div>
		                                <div class="tuiyoClearFloat"></div>
		                            </div>
		                        </div>
		                    </fieldset>
		                </form>
		            </div>				
				</div>	
				<div class="cfgElements profileStyle" style="margin-top: 25px">
					<div class="aTAHead dashBoardWidgetBodySubHead"><?php echo _('Style information'); ?></div>
		        	<?php if(empty($this->style) ) : ?> 
		                <div class="TuiyoNotification TuiyoInformation"><?php echo _('There are no customizable parameters for the current template') ?></div>
		            <?php else: ?>
		                <form id="profileStyleForm" name="profileStyleForm" method="post" enctype="multipart/form-data" class="TuiyoForm" action="index.php?format=json">
		                    <div class="profileStyler">
		                        <fieldset style="margin-bottom: 8px" >
		                            <div class="createDesigns">
		                                <div style="padding: 3px">
		                                    <?php echo( $this->style->renderHTML() ) ; ?>
		                                </div>
		                                <div class="tuiyoClearFlat"></div>
		                            </div>
		                        </fieldset>
		                    </div> <!--Close profile styler-->
		                    <div class="tuiyoTableRow" style="margin-top: 10px">
		                        <div class="tuiyoTableCell" style="width: 41%; padding: 4px 0"></div>
		                        <div class="tuiyoTableCell" style="width: 38%">
		                            <button calss="TuiyoFormButton1" type="submit"><?php echo _('Update style settings'); ?></button>
		                        </div>
		                        <div class="tuiyoClearFloat"></div>
		                    </div>               
		                    <input type="hidden" name="option" value="com_tuiyo" />
		                    <input type="hidden" name="do" value="saveTemplateParams" />
		                    <input type="hidden" name="format" value="json" />  
		                    <input type="hidden" name="userid" value="<?php echo $this->user->id ?> " />
		                    <input type="hidden" name="view" value="profile" /> 
		                    <?php echo JHTML::_('form.token'); ?>
		                </form>   
		            <?php endif; ?>             
		        </div>					        
		        <div class="cfgElements contactInformation" style="margin-top: 20px">
					<div class="aTAHead dashBoardWidgetBodySubHead"><?php echo _('Contact information'); ?></div>
			            <div class="dTABody">
							<form class="TuiyoForm" name="contactInfo" id="contactInfo" action="index.php" method="post">
			                    <fieldset id="contactInformation">
			                        <div class="tuiyoTableRow" style="margin-top: 8px">
			                            <div class="tuiyoTableCell" style="width: 35%; padding: 4px 0">
											<?php echo _('Organisation name'); ?></div>
			                            <div class="tuiyoTableCell" style="width: 65%">
			                                <input type="text" name="company" id="company" class="TuiyoFormText" value="<?php echo $this->contact->company ?>" />
			                            </div>
			                            <div class="tuiyoClearFloat"></div>
			                        </div>
			                        <div class="tuiyoTableRow" style="margin-top: 8px">
			                            <div class="tuiyoTableCell" style="width: 35%; padding: 4px 0"><?php echo _('Website' ); ?></div>
			                            <div class="tuiyoTableCell" style="width: 65%">
			                                <input type="text" name="website" id="website" class="TuiyoFormText"  value="<?php echo $this->contact->website; ?>"/>
			                            </div>
			                            <div class="tuiyoClearFloat"></div>
			                        </div>                        
			                        <div class="tuiyoTableRow" style="margin-top: 8px">
			                            <div class="tuiyoTableCell" style="width: 35%; padding: 4px 0"><?php echo _('Street adress'); ?></div>
			                            <div class="tuiyoTableCell" style="width: 65%">
			                                <input type="text" name="street" id="street" class="TuiyoFormText" value="<?php echo $this->contact->street; ?>" />
			                            </div>
			                            <div class="tuiyoClearFloat"></div>
			                        </div>
			                        <div class="tuiyoTableRow" style="margin-top: 8px">
			                            <div class="tuiyoTableCell" style="width: 35%; padding: 4px 0"><?php echo _('Region/County/Province'); ?></div>
			                            <div class="tuiyoTableCell" style="width: 65%">
			                                <input type="text" name="region" id="region" class="TuiyoFormText" value="<?php echo $this->contact->region; ?>"/>
			                            </div>
			                            <div class="tuiyoClearFloat"></div>
			                        </div>
			                        <div class="tuiyoTableRow" style="margin-top: 8px">
			                            <div class="tuiyoTableCell" style="width: 35%; padding: 4px 0"><?php echo _('Town/City'); ?></div>
			                            <div class="tuiyoTableCell" style="width: 65%">
			                                <input type="text" name="town" id="town" class="TuiyoFormText" value="<?php echo $this->contact->town; ?>" />
			                            </div>
			                            <div class="tuiyoClearFloat"></div>
			                        </div>  
			                        <div class="tuiyoTableRow" style="margin-top: 8px">
			                            <div class="tuiyoTableCell" style="width: 35%; padding: 4px 0"><?php echo _('Postal code / Zip code' ); ?></div>
			                            <div class="tuiyoTableCell" style="width: 65%">
			                                <input type="text" name="postcode" id="postcode" class="TuiyoFormText" value="<?php echo $this->contact->postcode; ?>" />
			                            </div>
			                            <div class="tuiyoClearFloat"></div>
			                        </div>
			                        <div class="tuiyoTableRow" style="margin-top: 8px">
			                            <div class="tuiyoTableCell" style="width: 35%; padding: 4px 0"><?php echo _('Main phone') ;?></div>
			                            <div class="tuiyoTableCell" style="width: 65%">
			                                <input type="text" name="phone" id="phone" class="TuiyoFormText" value="<?php echo $this->contact->phone; ?>" />
			                            </div>
			                            <div class="tuiyoClearFloat"></div>
			                        </div>
			                        <div class="tuiyoTableRow" style="margin-top: 8px">
			                            <div class="tuiyoTableCell" style="width: 35%; padding: 4px 0"><?php echo _('Contact email' ); ?></div>
			                            <div class="tuiyoTableCell" style="width: 65%">
			                                <input type="text" name="email" id="email" class="TuiyoFormText"  value="<?php echo $this->contact->email; ?>"/>
			                            </div>
			                            <div class="tuiyoClearFloat"></div>
			                        </div> 
			                        <div class="tuiyoTableRow" style="margin-top: 8px">
			                            <div class="tuiyoTableCell" style="width: 35%; padding: 4px 0"><?php echo _('Description' ); ?></div>
			                            <div class="tuiyoTableCell" style="width: 65%">
			                                <textarea name="description" id="description" class="TuiyoFormTextArea"><?php echo $this->contact->description; ?></textarea>
			                            </div>
			                            <div class="tuiyoClearFloat"></div>
			                        </div> 
			                        <div class="tuiyoTableRow" style="margin-top: 8px">
			                            <div class="tuiyoTableCell" style="width: 35%; padding: 4px 0"><?php echo _('Skype ID' ); ?></div>
			                            <div class="tuiyoTableCell" style="width: 65%">
			                                <input type="text" name="skypeID" id="skypeID" class="TuiyoFormText"  value="<?php echo $this->contact->skypeID; ?>"/>
			                            </div>
			                            <div class="tuiyoClearFloat"></div>
			                        </div>
			                        <div class="tuiyoTableRow" style="margin-top: 8px">
			                            <div class="tuiyoTableCell" style="width: 35%; padding: 4px 0"><?php echo _('Windows Live ID' ); ?></div>
			                            <div class="tuiyoTableCell" style="width: 65%">
			                                <input type="text" name="msnID" id="msnID" class="TuiyoFormText"  value="<?php echo $this->contact->msnID; ?>"/>
			                            </div>
			                            <div class="tuiyoClearFloat"></div>
			                        </div>
			                        <div class="tuiyoTableRow" style="margin-top: 8px">
			                            <div class="tuiyoTableCell" style="width: 35%; padding: 4px 0"><?php echo _('Yahoo ID' ); ?></div>
			                            <div class="tuiyoTableCell" style="width: 65%">
			                                <input type="text" name="yahooID" id="yahooID" class="TuiyoFormText"  value="<?php echo $this->contact->yahooID; ?>"/>
			                            </div>
			                            <div class="tuiyoClearFloat"></div>
			                        </div>
			                        <div class="tuiyoTableRow" style="margin-top: 8px">
			                            <div class="tuiyoTableCell" style="width: 35%; padding: 4px 0"><?php echo _('Google Talk' );?></div>
			                            <div class="tuiyoTableCell" style="width: 65%">
			                                <input type="text" name="gTalkID" id="gTalkID" class="TuiyoFormText"  value="<?php echo $this->contact->gTalkID; ?>"/>
			                            </div>
			                            <div class="tuiyoClearFloat"></div>
			                        </div>                        
									<div class="tuiyoTableRow" style="margin-top: 8px">
			                            <div class="tuiyoTableCell" style="width: 35%; padding: 4px 0"><?php echo _('AOL messenger' ); ?></div>
			                            <div class="tuiyoTableCell" style="width: 65%">
			                                <input type="text" name="aolID" id="aolID" class="TuiyoFormText"  value="<?php echo $this->contact->aolID; ?>"/>
			                            </div>
			                            <div class="tuiyoClearFloat"></div>
			                        </div>                                                                                                                                            
			                        <div class="tuiyoTableRow" style="margin-top: 8px">
			                            <div class="tuiyoTableCell" style="width: 35%; padding: 4px 0"></div>
			                            <div class="tuiyoTableCell" style="width: 65%">
			                                <button class="TuiyoFormButton1" id="submitStep1" type="submit"><?php echo _('Update contact information' ); ?></button>
			                            </div>
			                            <div class="tuiyoClearFloat"></div>
			                        </div>         
			                    </fieldset>
			                    <input type="hidden" name="option" value="com_tuiyo" />
			                    <input type="hidden" name="do" value="saveParams" />
			                    <input type="hidden" name="format" value="json" />  
			                    <input type="hidden" name="userid" value="<?php echo $this->user->id ?> " />
			                    <input type="hidden" name="pkey" value="user.contact" />
			                    <input type="hidden" name="view" value="profile" /> 
			                    <?php echo JHTML::_('form.token'); ?>
			                </form>
			            </div>		        
		        </div>
			</div>
		</div>
		<div class="tuiyoTableCell" style="width: 50%">
			<div class="tuiyoColumn" id="tuiyoColumn2Pad">			
				<div class="cfgElements privacySettings">
					<div class="aTAHead dashBoardWidgetBodySubHead"><?php echo _('Privacy Settings' );?></div>
					<form class="TuiyoForm" name="userAccountPrivacySettings" id="userAccountPrivacySettings" action="index.php" method="post">
		                <div id="profilePrivacySettignsDiv"><!--Profile settings-->
		                    <fieldset>
		                    <?php 
		                    	$privacyParams = TuiyoAPI::get("params", "user.privacy" , $user->id); $privacyParams->loadParams( "user.privacy", $user->id); ?>
		                    
		                        <div class="tuiyoTableRow" style="border-bottom: 2px solid #ccc; margin-bottom: 7px; margin-top: 7px">                      	
		                            <div class="tuiyoTableCell privacyFieldTask">&nbsp;</div>
		                            <div class="tuiyoTableCell privacyField" align="center"><?php echo _('Only me' ); ?></div>
		                            <div class="tuiyoTableCell privacyField" align="center"><?php echo _('Friends' ); ?></div>
		                            <div class="tuiyoTableCell privacyField" align="center"><?php echo _('Registered' ); ?></div>
		                            <div class="tuiyoTableCell privacyField" align="center"><?php echo _('Anybody' ); ?></div>
		                            <div class="tuiyoClearFloat"></div>
		                        </div>
		                        <!--View Profile-->
		                        <div class="tuiyoTableRow privacyFieldRow">
		                            <div class="tuiyoTableCell privacyFieldTask  "> <?php echo _('Who can view your profile?' ); ?> </div>
		                            <div class="tuiyoTableCell privacyField" align="center">
		                                <input type="radio" name="viewProfile" id="viewProfile640" value="640" 
		                                	<?php if((int)$privacyParams->get("viewProfile")===640): echo('checked="checked"');  endif; ?> /></div>
		                            <div class="tuiyoTableCell privacyField" align="center">
		                                <input type="radio" name="viewProfile" id="viewProfile630" value="630"
											<?php if((int)$privacyParams->get("viewProfile")===630): echo('checked="checked"');  endif; ?> /></div>
		                            <div class="tuiyoTableCell privacyField" align="center">
		                                <input type="radio" name="viewProfile" id="viewProfile620" value="620"
											<?php if((int)$privacyParams->get("viewProfile")===620): echo('checked="checked"');  endif; ?> /></div>
		                            <div class="tuiyoTableCell privacyField" align="center">
		                                <input type="radio" name="viewProfile" id="viewProfile610" value="610" 
											<?php if((int)$privacyParams->get("viewProfile")===610): echo('checked="checked"');  endif; ?>/></div>
		                            <div class="tuiyoClearFloat"></div>
		                          </div>                         
		                        <!--View Social Information-->
		                        <div class="tuiyoTableRow privacyFieldRow">
		                            <div class="tuiyoTableCell privacyFieldTask  "><?php echo _('Who can view your social book?');?> </div>
		                            <div class="tuiyoTableCell privacyField" align="center">
		                                <input type="radio" name="viewSocialBook" id="viewSocialBook640" value="640"
											<?php if((int)$privacyParams->get("viewSocialBook")===640): echo('checked="checked"');  endif; ?> /></div>
		                            <div class="tuiyoTableCell privacyField" align="center">
		                                <input type="radio" name="viewSocialBook" id="viewSocialBook630" value="630"
											<?php if((int)$privacyParams->get("viewSocialBook")===630): echo('checked="checked"');  endif; ?> /></div>
		                            <div class="tuiyoTableCell privacyField" align="center">
		                                <input type="radio" name="viewSocialBook" id="viewSocialBook620" value="620"
											<?php if((int)$privacyParams->get("viewSocialBook")===620): echo('checked="checked"');  endif; ?> /></div>
		                            <div class="tuiyoTableCell privacyField" align="center">
		                                <input type="radio" name="viewSocialBook" id="viewSocialBook610" value="610"
											<?php if((int)$privacyParams->get("viewSocialBook")===610): echo('checked="checked"');  endif; ?> /></div>
		                            <div class="tuiyoClearFloat"></div>
		                        </div>
		                        <!--View in Results-->
		                        <div class="tuiyoTableRow privacyFieldRow">
		                            <div class="tuiyoTableCell privacyFieldTask  "><?php echo _('List profile in search result to'); ?> </div>
		                            <div class="tuiyoTableCell privacyField" align="center">	
		                                <input type="radio" name="viewInSearch" id="viewInSearch640" value="640" 
											<?php if((int)$privacyParams->get("viewInSearch")===640): echo('checked="checked"');  endif; ?>/></div>
		                            <div class="tuiyoTableCell privacyField" align="center">
		                                <input type="radio" name="viewInSearch" id="viewInSearch630" value="630"
											<?php if((int)$privacyParams->get("viewInSearch")===630): echo('checked="checked"');  endif; ?> /></div>
		                            <div class="tuiyoTableCell privacyField" align="center">
		                                <input type="radio" name="viewInSearch" id="viewSocialBook620" value="620" 
											<?php if((int)$privacyParams->get("viewInSearch")===620): echo('checked="checked"');  endif; ?>/></div>
		                            <div class="tuiyoTableCell privacyField" align="center">
		                                <input type="radio" name="viewInSearch" id="viewInSearch610" value="610"
											<?php if((int)$privacyParams->get("viewInSearch")===610): echo('checked="checked"');  endif; ?> /></div>
		                            <div class="tuiyoClearFloat"></div>
		                        </div> 
		                        
		                        <!--View Profile Picture-->
		                        <div class="tuiyoTableRow privacyFieldRow">
		                            <div class="tuiyoTableCell privacyFieldTask  "><?php echo _('View my profile picture' ); ?></div>
		                            <div class="tuiyoTableCell privacyField" align="center">
		                                <input type="radio" name="viewProfilePicture" id="viewProfilePicture640" value="640"
											<?php if((int)$privacyParams->get("viewProfilePicture")===640): echo('checked="checked"');  endif; ?> /></div>
		                            <div class="tuiyoTableCell privacyField" align="center">
		                                <input type="radio" name="viewProfilePicture" id="viewProfilePicture630" value="630"
											<?php if((int)$privacyParams->get("viewProfilePicture")===630): echo('checked="checked"');  endif; ?> /></div>
		                            <div class="tuiyoTableCell privacyField" align="center">
		                                <input type="radio" name="viewProfilePicture" id="viewProfilePicture620" value="620"
											<?php if((int)$privacyParams->get("viewProfilePicture")===620): echo('checked="checked"');  endif; ?>/></div>
		                            <div class="tuiyoTableCell privacyField" align="center">
		                                <input type="radio" name="viewProfilePicture" id="viewProfilePicture610" value="610"
											<?php if((int)$privacyParams->get("viewProfilePicture")===610): echo('checked="checked"');  endif; ?> /></div>
		                            <div class="tuiyoClearFloat"></div>
		                        </div>     
		                        
		                        <!--View Profile Picture-->
		                        <div class="tuiyoTableRow privacyFieldRow">
		                            <div class="tuiyoTableCell privacyFieldTask  "><?php echo _('View my profile acitivity' ); ?></div>
		                            <div class="tuiyoTableCell privacyField" align="center">
		                                <input type="radio" name="viewActivityStream" id="viewActivityStream640" value="640" 
											<?php if((int)$privacyParams->get("viewActivityStream")===640): echo('checked="checked"');  endif; ?>/></div>
		                            <div class="tuiyoTableCell privacyField" align="center">
		                                <input type="radio" name="viewActivityStream" id="viewActivityStream630" value="630" 
											<?php if((int)$privacyParams->get("viewActivityStream")===630): echo('checked="checked"');  endif; ?>/></div>
		                            <div class="tuiyoTableCell privacyField" align="center">
		                                <input type="radio" name="viewActivityStream" id="viewActivityStream620" value="620"
											<?php if((int)$privacyParams->get("viewActivityStream")===620): echo('checked="checked"');  endif; ?> /></div>
		                            <div class="tuiyoTableCell privacyField" align="center">
		                                <input type="radio" name="viewActivityStream" id="viewActivityStream610" value="610" 
											<?php if((int)$privacyParams->get("viewActivityStream")===610): echo('checked="checked"');  endif; ?>/></div>
		                            <div class="tuiyoClearFloat"></div>
		                        </div> 
		                        <!--Share stuff with my profile-->
		                        <div class="tuiyoTableRow privacyFieldRow">
		                            <div class="tuiyoTableCell privacyFieldTask  "><?php echo _('Who can post to your Profile?');?> </div>
		                            <div class="tuiyoTableCell privacyField" align="center">
		                                <input type="radio" name="postToProfile" id="postToProfile640" value="640"
											<?php if((int)$privacyParams->get("postToProfile")===640): echo('checked="checked"');  endif; ?> /></div>
		                            <div class="tuiyoTableCell privacyField" align="center">
		                                <input type="radio" name="postToProfile" id="postToProfile630" value="630"
											<?php if((int)$privacyParams->get("postToProfile")===630): echo('checked="checked"');  endif; ?> /></div>
		                            <div class="tuiyoTableCell privacyField" align="center">
		                                <input type="radio" name="postToProfile" id="postToProfile620" value="620" disabled="disabled"/></div>
		                            <div class="tuiyoTableCell privacyField" align="center">
		                                <input type="radio" name="postToProfile" id="postToProfile610" value="610" disabled="disabled"/></div>
		                            <div class="tuiyoClearFloat"></div>
		                        </div>	
		                        <!--View groups i am a member of-->
		                        <div class="tuiyoTableRow privacyFieldRow">
		                            <div class="tuiyoTableCell privacyFieldTask  "><?php echo _('Who can view my groups?');?> </div>
		                            <div class="tuiyoTableCell privacyField" align="center">
		                                <input type="radio" name="viewMyGroups" id="viewMyGroups640" value="640"
											<?php if((int)$privacyParams->get("viewMyGroups")===640): echo('checked="checked"');  endif; ?> /></div>
		                            <div class="tuiyoTableCell privacyField" align="center">
		                                <input type="radio" name="viewMyGroups" id="viewMyGroups630" value="630"
											<?php if((int)$privacyParams->get("viewMyGroups")===630): echo('checked="checked"');  endif; ?> /></div>
		                            <div class="tuiyoTableCell privacyField" align="center">
		                                <input type="radio" name="viewMyGroups" id="viewMyGroups620" value="620"
											<?php if((int)$privacyParams->get("viewMyGroups")===620): echo('checked="checked"');  endif; ?> /></div>
		                            <div class="tuiyoTableCell privacyField" align="center">
		                                <input type="radio" name="viewMyGroups" id="viewMyGroups610" value="610" 
											<?php if((int)$privacyParams->get("viewMyGroups")===610): echo('checked="checked"');  endif; ?> /></div>
		                            <div class="tuiyoClearFloat"></div>
		                        </div>	
		                        <!--View and Subscribe to my events-->
		                        <div class="tuiyoTableRow privacyFieldRow">
		                            <div class="tuiyoTableCell privacyFieldTask  "><?php echo _('Who can view my events?');?> </div>
		                            <div class="tuiyoTableCell privacyField" align="center">
		                                <input type="radio" name="viewMyEvents" id="viewMyEvents640" value="640"
											<?php if((int)$privacyParams->get("viewMyEvents")===640): echo('checked="checked"');  endif; ?> /></div>
		                            <div class="tuiyoTableCell privacyField" align="center">
		                                <input type="radio" name="viewMyEvents" id="viewMyEvents630" value="630"
											<?php if((int)$privacyParams->get("viewMyEvents")===630): echo('checked="checked"');  endif; ?> /></div>
		                            <div class="tuiyoTableCell privacyField" align="center">
		                                <input type="radio" name="viewMyEvents" id="viewMyEvents620" value="620"
											<?php if((int)$privacyParams->get("viewMyEvents")===620): echo('checked="checked"');  endif; ?> /></div>
		                            <div class="tuiyoTableCell privacyField" align="center">
		                                <input type="radio" name="viewMyEvents" id="viewMyEvents610" value="610" disabled="disabled"/></div>
		                            <div class="tuiyoClearFloat"></div>
		                        </div>
		                        <!--View my friends lists-->
		                        <div class="tuiyoTableRow privacyFieldRow">
		                            <div class="tuiyoTableCell privacyFieldTask  "><?php echo _('Who can view my friends lists?');?> </div>
		                            <div class="tuiyoTableCell privacyField" align="center">
		                                <input type="radio" name="viewMyFriendsLists" id="viewMyFriendsLists640" value="640"
											<?php if((int)$privacyParams->get("viewMyFriendsLists")===640): echo('checked="checked"');  endif; ?> /></div>
		                            <div class="tuiyoTableCell privacyField" align="center">
		                                <input type="radio" name="viewMyFriendsLists" id="viewMyFriendsLists630" value="630"
											<?php if((int)$privacyParams->get("viewMyFriendsLists")===630): echo('checked="checked"');  endif; ?> /></div>
		                            <div class="tuiyoTableCell privacyField" align="center">
		                                <input type="radio" name="viewMyFriendsLists" id="viewMyFriendsLists620" value="620" 
											<?php if((int)$privacyParams->get("viewMyFriendsLists")===620): echo('checked="checked"');  endif; ?>/></div>
		                            <div class="tuiyoTableCell privacyField" align="center">
		                                <input type="radio" name="viewMyFriendsLists" id="viewMyFriendsLists610" value="610"
											<?php if((int)$privacyParams->get("viewMyFriendsLists")===610): echo('checked="checked"');  endif; ?>/></div>
		                            <div class="tuiyoClearFloat"></div>
		                        </div>	
		                        <!--View my extended profile-->
		                        <div class="tuiyoTableRow privacyFieldRow">
		                            <div class="tuiyoTableCell privacyFieldTask  "><?php echo _('Who vieiw my extended Profile?');?> </div>
		                            <div class="tuiyoTableCell privacyField" align="center">
		                                <input type="radio" name="viewMyExtendedProfile" id="viewMyExtendedProfile640" value="640"
											<?php if((int)$privacyParams->get("viewMyExtendedProfile")===640): echo('checked="checked"');  endif; ?> /></div>
		                            <div class="tuiyoTableCell privacyField" align="center">
		                                <input type="radio" name="viewMyExtendedProfile" id="viewMyExtendedProfile630" value="630"
											<?php if((int)$privacyParams->get("viewMyExtendedProfile")===630): echo('checked="checked"');  endif; ?> /></div>
		                            <div class="tuiyoTableCell privacyField" align="center">
		                                <input type="radio" name="viewMyExtendedProfile" id="viewMyExtendedProfile620" value="620"
											<?php if((int)$privacyParams->get("viewMyExtendedProfile")===620): echo('checked="checked"');  endif; ?>/></div>
		                            <div class="tuiyoTableCell privacyField" align="center">
		                                <input type="radio" name="viewMyExtendedProfile" id="viewMyExtendedProfile610" value="610"
											<?php if((int)$privacyParams->get("viewMyExtendedProfile")===610): echo('checked="checked"');  endif; ?>/></div>
		                            <div class="tuiyoClearFloat"></div>
		                        </div>																													                                                      
		                       
		                    </fieldset>
		                </div><!--End profile privacy-->
		            	<!--Photos privacry-->
		                <div id="photosPrivacySettignsDiv">
		                    <fieldset>
		                        <div class="tuiyoTableRow" style="border-bottom: 2px solid #ccc; margin-bottom: 7px; margin-top: 7px">                      	
		                            <div class="tuiyoTableCell privacyFieldTask">&nbsp;</div>
		                            <div class="tuiyoTableCell privacyField" align="center"><?php echo _('Only me' ); ?></div>
		                            <div class="tuiyoTableCell privacyField" align="center"><?php echo _('Friends' ); ?></div>
		                            <div class="tuiyoTableCell privacyField" align="center"><?php echo _('Registered' ); ?></div>
		                            <div class="tuiyoTableCell privacyField" align="center"><?php echo _('Anybody' ); ?></div>
		                            <div class="tuiyoClearFloat"></div>
		                        </div>
		                        <!--View Photos-->
		                        <div class="tuiyoTableRow privacyFieldRow">
		                            <div class="tuiyoTableCell privacyFieldTask  "><?php echo _('Can view your photos'); ?> </div>
		                            <div class="tuiyoTableCell privacyField" align="center">
		                            	<input type="radio" name="viewPhotos" id="viewPhotos640" value="640" 
											<?php if((int)$privacyParams->get("viewPhotos")===640): echo('checked="checked"');  endif; ?>/></div>
		                            <div class="tuiyoTableCell privacyField" align="center">
		                            	<input type="radio" name="viewPhotos" id="viewPhotos630" value="630" 
											<?php if((int)$privacyParams->get("viewPhotos")===630): echo('checked="checked"');  endif; ?>/></div>
		                            <div class="tuiyoTableCell privacyField" align="center">
		                                <input type="radio" name="viewPhotos" id="viewPhotos620" value="620" 
											<?php if((int)$privacyParams->get("viewPhotos")===620): echo('checked="checked"');  endif; ?>/></div>
		                            <div class="tuiyoTableCell privacyField" align="center">
		                            	<input type="radio" name="viewPhotos" id="viewPhotos610" value="610" 
											<?php if((int)$privacyParams->get("viewPhotos")===610): echo('checked="checked"');  endif; ?>/></div>
		                            <div class="tuiyoClearFloat"></div>
		                         </div>
		                        <!--Comment on Photos-->
		                        <div class="tuiyoTableRow privacyFieldRow">
		                            <div class="tuiyoTableCell privacyFieldTask  "><?php echo _('Can comment on your photos' ); ?></div>
		                            <div class="tuiyoTableCell privacyField" align="center">
		                            	<input type="radio" name="commentOnPhotos" id="commentOnPhotos640" value="640" 
											<?php if((int)$privacyParams->get("commentOnPhotos")===640): echo('checked="checked"');  endif; ?>/></div>
		                            <div class="tuiyoTableCell privacyField" align="center">
		                            	<input type="radio" name="commentOnPhotos" id="commentOnPhotos630" value="630" 
											<?php if((int)$privacyParams->get("commentOnPhotos")===630): echo('checked="checked"');  endif; ?>/></div>
		                            <div class="tuiyoTableCell privacyField" align="center">
		                                <input type="radio" name="commentOnPhotos" id="commentOnPhotos620" value="620" 
											<?php if((int)$privacyParams->get("commentOnPhotos")===620): echo('checked="checked"');  endif; ?>/></div>
		                            <div class="tuiyoTableCell privacyField" align="center">
		                            	<input type="radio" name="commentOnPhotos" id="commentOnPhotos610" value="610" 
											<?php if((int)$privacyParams->get("commentOnPhotos")===610): echo('checked="checked"');  endif; ?>/></div>
		                            <div class="tuiyoClearFloat"></div>
		                         </div>                                                             
		                    </fieldset>
		                </div>                
		      
		            	<!--Contacts, updates, etc -->
		                <div id="contactsprivacySettignsDiv">
		                    <fieldset>
		                        <div class="tuiyoTableRow" style="border-bottom: 2px solid #ccc; margin-bottom: 7px; margin-top: 7px;">                      	
		                            <div class="tuiyoTableCell privacyFieldTask">&nbsp;</div>
		                            <div class="tuiyoTableCell privacyField" align="center"><?php echo _('Only me' ); ?></div>
		                            <div class="tuiyoTableCell privacyField" align="center"><?php echo _('Friends' ); ?></div>
		                            <div class="tuiyoTableCell privacyField" align="center"><?php echo _('Registered' ); ?></div>
		                            <div class="tuiyoTableCell privacyField" align="center"><?php echo _('Anybody' ); ?></div>
		                            <div class="tuiyoClearFloat"></div>
		                        </div>
		                        <!--View Profile-->
		                        <div class="tuiyoTableRow privacyFieldRow">
		                            <div class="tuiyoTableCell privacyFieldTask  "><?php echo _('Who can view your contact info?' ); ?></div>
		                            <div class="tuiyoTableCell privacyField" align="center">
		                            	<input type="radio" name="viewContactInfo" id="viewContactInfo640" value="640" 
											<?php if((int)$privacyParams->get("viewContactInfo")===640): echo('checked="checked"');  endif; ?>/></div>
		                            <div class="tuiyoTableCell privacyField" align="center">
		                            	<input type="radio" name="viewContactInfo" id="viewContactInfo630" value="630" 
											<?php if((int)$privacyParams->get("viewContactInfo")===630): echo('checked="checked"');  endif; ?>/></div>
		                            <div class="tuiyoTableCell privacyField" align="center">
		                                <input type="radio" name="viewContactInfo" id="viewContactInfo620" value="620" 
											<?php if((int)$privacyParams->get("viewContactInfo")===620): echo('checked="checked"');  endif; ?>/></div>
		                            <div class="tuiyoTableCell privacyField" align="center">
		                            	<input type="radio" name="viewContactInfo" id="viewContactInfo610" value="610" 
											<?php if((int)$privacyParams->get("viewContactInfo")===610): echo('checked="checked"');  endif; ?>/></div>
		                            <div class="tuiyoClearFloat"></div>
		                         </div>  
		                    </fieldset>
		    			</div>                         	 
		    			<div class="tuiyoTableRow" style="margin-top: 10px">
		                    <div class="tuiyoTableCell" style="width: 40%; padding: 4px 0"></div>
		                    <div class="tuiyoTableCell" style="width: 60%">
		                        <button calss="TuiyoFormButton1" type="submit"><?php echo _('Update privacy settings' ); ?></button>
		                    </div>
		                    <div class="tuiyoClearFloat"></div>
		                </div>       
		                                         
		                <input type="hidden" name="option" value="com_tuiyo" />
		                <input type="hidden" name="do" value="saveParams" />
		                <input type="hidden" name="format" value="json" />  
		                <input type="hidden" name="userid" value="<?php echo $user->id ?> " />
		                <input type="hidden" name="pkey" value="user.privacy" />
		                <input type="hidden" name="view" value="profile" /> 
		                <?php echo JHTML::_('form.token'); ?>
		            </form>
		        </div>
				
			</div>
		</div>
		<div style="clear:both"></div>
	</div>
</div>