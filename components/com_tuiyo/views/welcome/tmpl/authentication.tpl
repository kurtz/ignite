<div class="loginPageLogo">
	<img src="<?php echo $this->style ?>/images/logo3.png" />
</div>
<div class="tuiyoTable" id="authPage">
	<div class="tuiyoTableRow">
    	<div class="tuiyoTableCell" style="width: 10%">
        	<ul id="pageNavigation">
            	<li id="tCreate" rel="loginPageCreate" class="current" title="<?php echo _('Create a new account'); ?>"><?php echo _('register'); ?></li> 
                <li id="tLogin" rel="loginPageSignIn" title="<?php echo _('Already have an account?' ); ?>"><?php echo _('login' ); ?></li>
                <li id="tReset" rel="loginPageResetDetails" title="<?php echo _('Forgot your login details?' ); ?>"><?php echo _('reset' ); ?></li>
            </ul>
        </div>
        <div class="tuiyoTableCell" style="width: 90%">
            <div id="loginPageCreate" class="TuiyoTable pageItem">
                <div class="reporter"><jdoc:include type="message" /></div>
                <?php if($this->allowRegistration) : ?>
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
                <?php endif; ?>
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
                <form action="<?php echo JRoute::_('index.php?option=com_user') ?>" method="post" name="resetAccountDetails"  
                          id="resetAccountDetails" class="TuiyoForm" >
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
            
        </div>
        <div class="tuiyoClearFloat"></div>
    </div>
    <div class="tuiyoTableRow">
   	<div class="actionLinks" align="center"><a href="index.php"><?php echo _('Back to Community Homepage' ); ?></a> </div>
    </div>
</div>