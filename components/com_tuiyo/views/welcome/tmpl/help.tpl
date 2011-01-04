<?php  defined('TUIYO_EXECUTE' ) || die; ?>

<div id="pageContainer">
	<div class="welcomePage">
		<div class="tuiyoTable pageHeaderTitle">
        	<div class="tuiyoTableRow" style="padding: 5px">
            	<div class="tuiyoTableCell" style="width: 70%">	
                	<div class="tuiyoTableRow">
                    	<div class="tuiyoTableCell" style="width: 16%">
                        	<img alt="#"  src="<?php echo($this->user->getUserAvatar()->thumb70 ) ?>" class="TuiyoAvatar" />
                        </div>
                    	<div class="tuiyoTableCell" style="width: 84%">
                        	<h3 style="font-size: 22px; font-weight: bold">Coffee Room</h3>
                            <i style="font-size: 11px; line-height: 18px"><?php echo _('Welcome to our community');  ?> </i>
                         </div>
                    	<div class="tuiyoClearFloat"></div>
                    </div>                    
                </div>
                <div class="tuiyoTableCell" style="width: 30%">
                    <div class="dropDownMenuList">
                        <ul class="helpElementsLinks">
                            <li class="current"  id="1_0"><a><?php echo _('Getting started');?></a></li>                          
                            <li id="1_1"><a><?php echo _('Creating a new account');?></a></li>
                            <li id="1_2"><?php echo _('Signing in to our site' ); ?></li>
                            <li id="1_3"><?php echo _('Creating your basic profile') ;?></li>            
                            <li id="1_4"><?php echo _('Things to consider'); ?></li>
                            <li id="1_5"><?php echo _('The goals of our site'); ?></li>
                            <li id="1_6"><?php echo _('Quick overview presentation'); ?></li>                                         
                            <li id="2_0"><a><?php echo _('Managing your Account'); ?></a></li>                            
                            <li id="2_1"><?php echo _('Global account configuration'); ?></li>
                            <li id="2_2"><?php echo _('Your uploads and resources'); ?></li>
                            <li id="2_3"><?php echo _('Help/Important tips'); ?></li>
                            <li id="2_4"><?php echo _('Activity and Timeline'); ?></li>                               
                            <li id="2_5"><?php echo _('Suspend/Delete your profile'); ?></li>
                            <li id="2_6"><?php echo _('Managing your friends'); ?></li>
                            <li id="2_7"><?php echo _('Importing/Inviting friends'); ?></li>            
                            <li id="2_8"><?php echo _('Messsages and notifications'); ?></li>                 
                            <li id="2_9"><?php echo _('Styling your profile'); ?></li>                                         
                            <li id="3_0" ><a><?php echo _('Application specific'); ?></a></li>
                            <li id="3_1"><?php echo _('How applications work'); ?></li>
                            <li id="3_2"><?php echo _('Add/Remove applications'); ?></li>
                            <li id="3_3"><?php echo _('Application  settings'); ?></li>
                            <li id="3_4"><?php echo _('External API'); ?></li>                    
                            <li id="4_0" ><a><?php echo _('Privacy and security'); ?></a></li>             
                            <li id="4_1"><?php echo _('Privacy settings'); ?></li>
                            <li id="4_2"><?php echo _('Hacked profile?'); ?></li>
                            <li id="4_3"><?php echo _('Remaining safe'); ?></li>                                     
                        </ul>                      
                    </div>                     
                </div>
            	<div class="tuiyoClearFloat"></div>
            </div>
        </div>     
        <div id="homepageContent">
            <div style="min-height: 400px" >            	
                <div class="reporter"><jdoc:include type="message" /></div>
                <div id="homepageBody" style=" padding-top: 10px">
                                     
                    <div class="helpElements 1_0" style="display: block" ><h3><?php echo _('Chapter 1.0: Gettings Started'); ?></h3></div>
                    <div class="helpElements 1_1" style="display: none" ><h3><?php echo _('Chapter 1.1: Creating a new account'); ?></h3></div>
                    <div class="helpElements 1_2" style="display: none" ><h3>
                    	<?php echo _('Chapter 1.2: Signing in to our sites'); ?></h3>
                        <p>First you must be a registered member to access the member area. Next, ensure your username and password are correct. If they are, you can log-in using any of the Joomla log-in forms enabled by your site administrator. Should you forget your log-in information, Follow the links below to reset where necessary.
                        </p>        
                        <ul style="margin: 20px; list-style: circle">
                            <li>Forgot your username? We could resend it to you <a href="#">here</a>.</li>
                            <li>Cannot Remember your password? Create a new one by <a href="#">clicking here</a></li>
                        </ul>
                        <p>However u need to know the email you registered with</p>
                    </div>
                    <div class="helpElements 1_3" style="display: none" ><h3><?php echo _('Chapter 1.3: Creating a basic profile'); ?></h3></div>
                    <div class="helpElements 1_4" style="display: none" ><h3><?php echo _('Chapter 1.4: Things to consider'); ?></h3></div>
                    <div class="helpElements 1_5" style="display: none" ><h3><?php echo _('Chapter 1.5: The goals of our site'); ?></h3></div>
                    <div class="helpElements 1_6" style="display: none" ><h3><?php echo _('Chapter 1.6: Guided tour'); ?></h3></div>
                    
                    <!--Chapter2-->
                    <div class="helpElements 2_0" style="display: none" ><h3><?php echo _('Chapter 2.0: Managing your account'); ?></h3></div>
                    <div class="helpElements 2_1" style="display: none" ><h3><?php echo _('Chapter 2.1: Global account configurations'); ?></h3></div>
                    <div class="helpElements 2_2" style="display: none" ><h3><?php echo _('Chapter 2.2: File uploads and resource management'); ?></h3></div>
                    <div class="helpElements 2_3" style="display: none" ><h3><?php echo _('Chapter 2.3: Useful tips for managing your profile'); ?></h3></div>
                    <div class="helpElements 2_4" style="display: none" ><h3><?php echo _('Chapter 2.4: Activity and Timeline'); ?></h3></div>
                    <div class="helpElements 2_5" style="display: none" ><h3><?php echo _('Chapter 2.5: Suspend or delete your profile'); ?></h3></div>
                    <div class="helpElements 2_6" style="display: none" ><h3><?php echo _('Chapter 2.6: Managing your friends'); ?></h3></div>
                    <div class="helpElements 2_7" style="display: none" ><h3><?php echo _('Chapter 2.7: Inviting more friends'); ?></h3></div>
                    <div class="helpElements 2_8" style="display: none" ><h3><?php echo _('Chapter 2.8: Messages and notifications'); ?></h3></div>
                    <div class="helpElements 2_9" style="display: none" ><h3><?php echo _('Chapter 2.9: Styling your profile'); ?></h3></div>  
                    
                    <!--Chapter3--->
                    <div class="helpElements 3_0" style="display: none" ><h3><?php echo _('Chapter 3.0: Application specific Help and Support'); ?></h3></div>
                    <div class="helpElements 3_1" style="display: none" ><h3><?php echo _('Chapter 3.1: How profile applications work'); ?></h3></div>
                    <div class="helpElements 3_2" style="display: none" ><h3><?php echo _('Chapter 3.2: Add or remove applications'); ?></h3></div>
                    <div class="helpElements 3_3" style="display: none" ><h3><?php echo _('Chapter 3.3: Applications settings'); ?></h3></div>
                    <div class="helpElements 3_4" style="display: none" ><h3><?php echo _('Chapter 3.4: External Applications'); ?></h3></div>
                    <div class="helpElements 3_5" style="display: none" ><h3><?php echo _('Chapter 3.5'); ?></h3></div>
                    <div class="helpElements 3_6" style="display: none" ><h3><?php echo _('Chapter 3.6'); ?></h3></div>
                                        
                    <!--Chapter4--->    
                    <div class="helpElements 4_0" style="display: none" ><h3><?php echo _('Chapter 4.0: Privacy and security'); ?></h3></div>
                    <div class="helpElements 4_1" style="display: none" ><h3><?php echo _('Chapter 4.1: Basic Privacy settings'); ?></h3></div>
                    <div class="helpElements 4_2" style="display: none" ><h3><?php echo _('Chapter 4.2: Think your profile has been Hacked?'); ?></h3></div>
                    <div class="helpElements 4_3" style="display: none" ><h3><?php echo _('Chapter 4.3: Keeping safe on the internet'); ?></h3></div>
                    <div class="helpElements 4_4" style="display: none" ><h3><?php echo _('Chapter 4.4'); ?></h3></div>
                    <div class="helpElements 4_5" style="display: none" ><h3><?php echo _('Chapter 4.5'); ?></h3></div>
                    <div class="helpElements 4_6" style="display: none" ><h3><?php echo _('Chapter 4.6'); ?></h3></div>                                  
                                        
                </div>            
            </div>
            <div class="tuiyoClearFloat"></div>
        </div>
     </div>
</div> 
