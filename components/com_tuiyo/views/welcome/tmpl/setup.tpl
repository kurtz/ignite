<?php  defined('TUIYO_EXECUTE' ) || die;  JHTML:: _('behavior.calendar'); ?>

<form class="TuiyoForm" name="createBasicProfile" id="createBasicProfile" method="post" enctype="multipart/form-data">
<div id="pageContainer">    
	<div id="setupPageContent">
		<div class="tuiyoTable pageHeaderTitle">
        	<div class="tuiyoTableRow" style="padding: 5px">
            	<div class="tuiyoTableCell" style="width: 70%">	
                	<div class="tuiyoTableRow">
                    	<div class="tuiyoTableCell" style="width: 16%">
                        	<img alt="#"  src="<?php echo($this->user->getUserAvatar()->thumb70 ) ?>" class="TuiyoAvatar" />
                        </div>
                    	<div class="tuiyoTableCell" style="width: 84%">
                        	<h3 style="font-size: 22px; font-weight: bold">Your Dashboard</h3>
                            <i style="font-size: 11px; line-height: 18px"><?php echo _('Welcome to your dashboard');  ?> </i>
                         </div>
                    	<div class="tuiyoClearFloat"></div>
                    </div>                    
                </div>
                <div class="tuiyoTableCell" style="width: 30%">
                    <div class="dropDownMenuList">
                      	 <ul><li>Update Account</li></ul>
                    </div>                     
                </div>
            	<div class="tuiyoClearFloat"></div>
            </div>
        </div>    	
    	<div class="homepagePublisherContainer">
			<p><?php echo _('Hey there... It looks like this is your first time here!. Check out this important information, complete the forms and click the button below when completed. We will then help u set up your basic profile.'); ?></p>    	
        	<div id="homepagePublisherTabs">
                <ul class="publisherTabItems">
                    <li id="tterms" class="current"><a><?php echo _('Rules & Regulations'); ?></a></li>
                    <li id="tbprofile"><a><?php echo _('Account Information'); ?></a></li>
                    <li id="tsocialfields"><a><?php echo _('Additional Information');?></a></li>
                    <li id="tuploadavatar"><a><?php echo _('Profile picture'); ?></a></li>
                </ul>
           		<div class="tuiyoClearFloat"></div>
       		</div>
            <div class="reporter"><jdoc:include type="message" /></div>
            <div id="homepageBody">
                <div class="tterms cfgElements">
                    <div style="width: 97.5%; padding: 8px; border: 1px solid #ccc; font-size: 10px" class="code">
                        <code><?php echo $this->terms ?></code>
                    </div>
                    <div class="tuiyoTable" style="margin-top: 10px">
                        <div class="tuiyoTableCell" style="width: 20px; padding: 2px" align="center">
                            <input type="checkbox" name="tuiyoTermsRead" id="tuiyoTermsRead" class="TuiyoFormCheckBox" />
                        </div>
                        <div class="tuiyoTableCell">
                            <?php echo _('I have read and understand these terms and conditions' ); ?>
                          	<p class="homepageDescription">
	            				<button class="TuiyoFormButton1" id="submitSetup" type="submit" disabled="disabled"><?php echo _('Setup You account!'); ?></button>
	        				</p>
                        </div>
                        <div class="tuiyoClearFloat"></div>
                    </div>
                </div> 
                <div class="tbprofile cfgElements" style="display: none">
                    <fieldset id="basicprofile">
                        <div class="tuiyoTableRow" style="margin-top: 8px">
                            <div class="tuiyoTableCell" style="width: 35%; padding: 4px 0"><?php echo _('Your full name' ); ?></div>
                            <div class="tuiyoTableCell" style="width: 65%">
                                <input type="text" name="profileName" id="profileName" class="TuiyoFormText" value="<?php echo $this->user->name ?>" />
                            </div>
                            <div class="tuiyoClearFloat"></div>
                        </div>
                        <div class="tuiyoTableRow" style="margin-top: 8px">
                            <div class="tuiyoTableCell" style="width: 35%; padding: 4px 0"><?php echo _('Gender' ); ?></div>
                            <div class="tuiyoTableCell" style="width: 65%">
                                <select type="text" name="sex" id="sex" class="TuiyoFormDropDown">
                                    <option value="1"><?php echo _('Male' ); ?></option>
                                    <option  value="0"><?php echo _('Female' ); ?></option>
                                </select>
                            </div>
                            <div class="tuiyoClearFloat"></div>
                        </div>
                        <div class="tuiyoTableRow" style="margin-top: 8px">
                            <div class="tuiyoTableCell" style="width: 35%; padding: 4px 0"><?php echo _('Your date of birth' ); ?></div>
                            <div class="tuiyoTableCell" style="width: 65%">
                                <input type="text" style="cursor: pointer" 
                                       name="dob" id="dob" class="TuiyoFormText" onfocus="return showCalendar('dob','%Y-%m-%d');" readonly="readonly" />
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
                    </fieldset>                  
                </div>
               <div class="tsocialfields cfgElements" style="display: none">
                    <fieldset style="margin-bottom: 8px">&nbsp;</fieldset>           
                </div>  
                <div class="tuploadavatar cfgElements" style="display: none">
                    <fieldset style="margin-bottom: 8px">
                        <div class="uploadBG tuiyoTable">
                            <div class="tuiyoTableRow" style="padding: 5px">
                                <h3><?php echo _('Upload a smart, unique, and appealing photo of yourself.' ); ?></h3>
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
                    
                <?php echo JHTML::_('form.token'); ?>                            
                <input type="hidden" name="option" value="com_tuiyo" />
                <input type="hidden" name="do" value="setup" />
                <input type="hidden" name="userID" value="<?php echo $this->user->id ?>"  /> 
                <input type="hidden" name="view" value="core" />  
            </div>
        </div>               
    </div>
    <div class="tuiyoClearFloat"></div>
</div>
</form>  

