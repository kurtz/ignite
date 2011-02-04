<?php defined('TUIYO_EXECUTE') || die;
JHTML:: _('behavior.calendar'); ?>

<form class="TuiyoForm" name="createBasicProfile" id="createBasicProfile" method="post" enctype="multipart/form-data">
    <div class="tuiyoTable">
        <div class="tuiyoTableRow">
            <div class="tuiyoTableCell" style="width: 50%">
                <div class="tuiyoColumn" id="tuiyoColumn1Pad">

                    <div id="homepagePublisherTabs" class="pagePublisherTabs">
                        <ul class="publisherTabItems">
                            <li id="tbprofile" class="current"><a><?php echo _('Setup Your Account'); ?></a></li>
                        </ul>
                        <div class="tuiyoClearFloat"></div>
                    </div>
                    <p class="TuiyoNotification TuiyoInformation"><?php echo _('Hey there... It looks like this is your first time here!. Check out this important information, complete the forms and click the button below when completed. We will then help u set up your basic profile.'); ?></p>    	
                    <div class="tbprofile cfgElements" style="display: display">
                        <fieldset id="basicprofile">
                            <div class="tuiyoTableRow" style="margin-top: 8px">
                                <div class="tuiyoTableCell" style="width: 35%; padding: 4px 0"><?php echo _('Your full name'); ?></div>
                                <div class="tuiyoTableCell" style="width: 65%">
                                    <input type="text" name="profileName" id="profileName" class="TuiyoFormText" value="<?php echo $this->user->name ?>" />
                                </div>
                                <div class="tuiyoClearFloat"></div>
                            </div>
                            <div class="tuiyoTableRow" style="margin-top: 8px">
                                <div class="tuiyoTableCell" style="width: 35%; padding: 4px 0"><?php echo _('Gender'); ?></div>
                                <div class="tuiyoTableCell" style="width: 65%">
                                    <select type="text" name="sex" id="sex" class="TuiyoFormDropDown">
                                        <option value="1"><?php echo _('Male'); ?></option>
                                        <option  value="0"><?php echo _('Female'); ?></option>
                                    </select>
                                </div>
                                <div class="tuiyoClearFloat"></div>
                            </div>
                            <div class="tuiyoTableRow" style="margin-top: 8px">
                                <div class="tuiyoTableCell" style="width: 35%; padding: 4px 0"><?php echo _('Your date of birth'); ?></div>
                                <div class="tuiyoTableCell" style="width: 65%">
                                    <input type="text" style="cursor: pointer" 
                                           name="dob" id="dob" class="TuiyoFormText" onfocus="return showCalendar('dob','%Y-%m-%d');" readonly="readonly" />
                                </div>
                                <div class="tuiyoClearFloat"></div>
                            </div>                                                
                            <div class="tuiyoTableRow" style="margin-top: 8px">
                                <div class="tuiyoTableCell" style="width: 35%; padding: 4px 0"><?php echo _('E-mail address'); ?></div>
                                <div class="tuiyoTableCell" style="width: 65%">
                                    <input type="text" name="email" id="email" class="TuiyoFormText" value="<?php echo $this->user->email ?>" />
                                </div>
                                <div class="tuiyoClearFloat"></div>
                            </div>                             
                        </fieldset>                  
                    </div>
                    <div class="tsocialfields cfgElements" style="display: block; margin: 10px 0">
                        <div style="border-bottom: 1px solid #eee; padding: 4px 0; font-weight: bold"><?php echo _('Additional Profile Fields'); ?></div>
                        <fieldset style="margin-bottom: 8px">&nbsp;</fieldset>           
                    </div>  
                    <div class="tuploadavatar cfgElements" style="display: block">
                        <fieldset style="margin-bottom: 8px">
                            <div class="uploadBG tuiyoTable">
                                <div class="tuiyoTableRow" style="padding: 5px">
                                    <div style="border-bottom: 1px solid #eee; padding: 4px 0; font-weight: bold"><?php echo _('Change your avatar'); ?></div>
                                    <div class="tuiyoTableCell" style="width: 85%; padding: 19px">
                                        <input type="file" name="userAvatarUpload" id="userAvatarUpload" class="TuiyoFormFile" width="210" />
                                    </div>
                                    <div class="tuiyoClearFloat"></div>
                                </div>                                   
                                <div class="tuiyoTableRow" style="padding: 5px">
                                    <img src="<?php echo $this->user->getUserAvatar()->thumb200 ?>" style="padding: 2px; border: 1px solid #ccc; margin: 4px" alt="#" />
                                    <img src="<?php echo $this->user->getUserAvatar()->thumb70 ?>"  style="padding: 2px; border: 1px solid #ccc; margin: 4px" alt="#" />
                                    <img src="<?php echo $this->user->getUserAvatar()->thumb35 ?>"  style="padding: 2px; border: 1px solid #ccc; margin: 4px" alt="#" />
                                    <div class="tuiyoClearFloat"></div>
                                </div>
                            </div>
                        </fieldset>         
                    </div>
                    <div class="tacceptterms cfgElements" style="display: block">
                        <div class="tuiyoTableRow" style="margin-top: 10px">
                            <div class="tuiyoTableCell" style="width: 15%;" align="center">
                                <input type="checkbox" name="tuiyoTermsRead" id="tuiyoTermsRead" class="TuiyoFormCheckBox" />
                            </div>
                            <div class="tuiyoTableCell" style="width: 85%">
                                <?php echo _('I have read and understand these terms and conditions'); ?>
                            </div>
                            <div class="tuiyoClearFloat"></div>
                        </div>
                        <div class="tuiyoTableRow" style="margin-top: 10px">
                            <div class="tuiyoTableCell" style="width: 15%">&nbsp;</div>
                            <div class="tuiyoTableCell" style="width: 85%">
                                 <button class="TuiyoFormButton1" id="submitSetup" type="submit"><?php echo _('Setup You account!'); ?></button>
                            </div>
                            <div class="tuiyoClearFloat"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tuiyoTableCell" style="width: 50%">
                <div class="tuiyoColumn" id="tuiyoColumn2Pad">
                    <div id="homepagePublisherTabs" class="pagePublisherTabs">
                        <ul class="publisherTabItems">
                            <li id="tbprofile" class="current"><a><?php echo _('Terms and conditions'); ?></a></li>
                        </ul>
                        <div class="tuiyoClearFloat"></div>
                    </div>
                    <div class="terms" style="border: 3px solid #eee; max-height:  600px; padding: 10px; overflow-x: hidden; overflow-y:scroll">
                        <code><?php echo html_entity_decode($this->terms) ?></code>
                    </div>
                </div>
            </div>
            <div style="clear:both"></div>
        </div>
    </div>                   
    <?php echo JHTML::_('form.token'); ?>                            
    <input type="hidden" name="option" value="com_tuiyo" />
    <input type="hidden" name="do" value="setup" />
    <input type="hidden" name="userID" value="<?php echo $this->user->id ?>"  /> 
    <input type="hidden" name="view" value="core" />  
</form>  

