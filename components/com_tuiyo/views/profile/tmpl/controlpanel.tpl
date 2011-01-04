<?php  defined('TUIYO_EXECUTE' ) || die; ?>

<div class="homepagePublisherContainer">
    <div id="homepagePublisherTabs">
        <ul class="publisherTabItems">
        	<li id="appBrowse" class="current"><a href="#Information"><?php echo _('Add Applications') ;?></a></li>
            <li id="urApplications" ><a href="#Profile"><?php echo _('My Applications' ); ?></a></li>
            <li id="profileApps"><a href="#Profile-Applications"><?php echo _('Application settings') ;?></a></li>
        </ul>
        <div class="tuiyoClearFloat"></div>
    </div>
    <div id="homepagePublisherDiv" class="tuiyoTable">
    
         <!--APPLICATION DIRECTORY-->
        <div class="cfgElements appBrowse">
        	<div class="tuiyoTable">
            	<div class="tuiyoTableRow">
                    <?php foreach($appdirectory as $application): ?>
                        <form method="post" action="index.php" 
						       class="<?php echo ( !(bool)$application->userHasApp )? 'addApplication' : 'removeApplication' ?>" 
                        	      id="aid.<?php echo $application->id ?>">
                            <div class="appListItem">
                                <div class="tuiyoTableCell" style="width: 8%">
                                    <img alt="#"  src="<?php echo $application->icon32 ?>" align="middle" class="appIcon"/> </div>
                                <div class="tuiyoTableCell appItemDescription">
                                    <h5 style="font-size: 12px">
                                        <a target="_blank" href="<?php echo ( (bool)$application->userHasApp )
                                            ? JRoute::_( TUIYO_INDEX.'&amp;view=apps&amp;app='.$application->name ) 
                                            : $application->website ?>" 
                                        >
                                        <?php echo sprintf( _( '%1s (in use by %2s user/s )' ),$application->title,((int)$application->usersCount + 0 ) ) ?> 
                                    </a></h5>
                                    <span><?php echo $application->description ?></span>
                                </div>
                                <?php if( !(bool)$application->userHasApp ) : ?>
                                    <div class="tuiyoTableCell" style="width: 14%" align="right">
                                        <button id="add.<?php echo $application->name ?>" type="submit"><?php echo _('Install'); ?></button>
                                    </div>
                                <?php else : ?>                             
                                    <div class="tuiyoTableCell" style="width: 14%" align="right">
                                        <button id="remove.<?php echo $application->name ?>" type="submit"><?php echo _('Un-install');?></button>
                                    </div>
                                <?php endif; ?>
                                
                                <div class="tuiyoClearFloat"></div>
                            </div>
                            <?php echo JHTML::_('form.token'); ?>
                            <input type="hidden" name="option" value="com_tuiyo" />
                            <input type="hidden" name="view" value="apps" />
                            <input type="hidden" name="do" value="<?php echo ( !(bool)$application->userHasApp )? 'add' : 'remove' ?>" />
                            <input type="hidden" name="uid" value="<?php echo $user->id ?>" />
                            <input type="hidden" name="aid" value="<?php echo $application->id ?>" />
                            <input type="hidden" name="app" value="<?php echo $application->name ?>" />
                            <input type="hidden" name="hasTimeline" value="<?php echo $application->hasTimeline ?>" title="<?php echo _('Allow access to Timeline?') ;?>" />
                            <input type="hidden" name="hasNotifications" value="<?php echo $application->hasNotifications ?>" title="<?php echo _('Enable notifications?' ); ?>" />
                            <input type="hidden" name="hasProfile" value="<?php echo $application->hasProfile ?>" title="<?php echo _('Add application to extended profile');?>"/>
                        </form>
                    <?php endforeach; ?>               
                	<div class="tuiyoClearFloat"></div>
                </div>
            </div>
        </div>
            
    	<div class="cfgElements urApplications">
   			<!--USER APPLICATIONS LIST -->
            <?php if(count($userApps) < 1 ) : ?>
                	<div class="TuiyoNoticeMsg"><?php echo _( 'We did not find any installed applications. Apps you install will be displayed here') ?></div>
            <?php endif; ?>
            <?php foreach($userApps as $userApp) : ?>
            	<div class="fieldset">
                    <div style="float: left;">
                        <div class="icon" align="center" title="<?php echo( $userApp->title ) ?>">
                             <a href="<?php echo JRoute::_( TUIYO_INDEX.'&amp;view=apps&amp;app='.$userApp->name )  ?>">
                            <img alt="#<?php echo( $userApp->name ) ?>"  src="<?php echo $userApp->icon32 ?>" align="middle"  /> 
                            <span><?php echo ucfirst( $userApp->name ) ?></span>
                            </a>
                        </div>
                    </div>                                                                             
                    <div style="clear: left;"></div>                
                </div>
            <?php endforeach; ?>  
        </div>
        
        <!--APPLICATION SETTINGS-->
        <div class="cfgElements profileApps"> 
            <?php if(count($userApps) < 1 ) : ?>
                <div class="TuiyoNoticeMsg"><?php echo _( 'There are no applications installed to your profile.') ?></div>
            <?php endif; ?>                   
            <?php foreach($userApps as $userApp) : ?>
            	<form method="post" action="index.php" class="TuiyoForm" id="aid.<?php echo $userApp->id ?>.s">
                    <div class="aTAHead appSettings">
                        <img alt="#a<?php echo( $userApp->id ) ?>"  src="<?php echo( $userApp->icon16 ) ?>" style="float: left" />
                        <a href="#" style="float: left; margin-top:-2px;"><?php echo( $userApp->title ) ?></a>
                        <div class="tuiyoClearFloat"></div>
                    </div>
                    <div class="dTABody">
                    	<fieldset>
                        	<div style="margin: 4px 0pt;" class="tuiyoTableRow">
                            	<div style="width: 35%;" class="tuiyoTableCell"><?php echo _('Add to extended profile'); ?></div>
                                <div style="width: 65%;" class="tuiyoTableCell">
                                	<input style="margin: 0pt 6px;" class="TuiyoFormRadio" name="nhasProfile" type="radio"><span><?php echo _('Yes') ;?></span>
                                    <input checked="checked" style="margin: 0pt 6px;" class="TuiyoFormRadio" name="nhasProfile" type="radio"><span><?php echo _('No'); ?></span>
                               </div>
                               <div class="tuiyoClearFloat"></div>
                            </div>
                        	<div style="margin: 4px 0pt;" class="tuiyoTableRow">
                            	<div style="width: 35%;" class="tuiyoTableCell"><?php echo _('Show link to external profile' ) ?></div>
                                <div style="width: 65%;" class="tuiyoTableCell">
                                	<input checked="checked" style="margin: 0pt 6px;" class="TuiyoFormRadio" name="nhasExternalProfile" type="radio"><span><?php echo _('Yes'); ?></span>
                                    <input  style="margin: 0pt 6px;" class="TuiyoFormRadio" name="nhasExternalProfile" type="radio"><span><?php echo _('No'); ?></span>
                               </div>
                               <div class="tuiyoClearFloat"></div>
                            </div>                            
                            <div style="margin: 4px 0pt;" class="tuiyoTableRow">
                            	<div style="width: 35%;" class="tuiyoTableCell"><?php echo _('Allow access to Timeline?'); ?></div>
                                <div style="width: 65%;" class="tuiyoTableCell">
                                	<input style="margin: 0pt 6px;" class="TuiyoFormRadio" name="nhasTimeline" type="radio"><span><?php echo _('Yes') ;?></span>
                                    <input checked="checked" style="margin: 0pt 6px;" class="TuiyoFormRadio" name="nhasTimeline" type="radio"><span><?php echo _('No'); ?></span>
                               </div>
                               <div class="tuiyoClearFloat"></div>
                           	</div>
                            <div style="margin: 4px 0pt;" class="tuiyoTableRow">
                            	<div style="width: 35%;" class="tuiyoTableCell"><?php echo _('Enable notifications?' );?></div>
                                <div style="width: 65%;" class="tuiyoTableCell">
                                	<input style="margin: 0pt 6px;" class="TuiyoFormRadio" name="nhasNotifications" type="radio"><span><?php echo _('Yes'); ?></span>
                                    <input checked="checked" style="margin: 0pt 6px;" class="TuiyoFormRadio" name="nhasNotifications" type="radio"><span><?php echo _('No') ;?></span>
                                </div>
                               	<div class="tuiyoClearFloat"></div>
                            </div>
                        </fieldset>
                    </div>   
                    <input type="hidden" name="option" value="com_tuiyo" />
                    <input type="hidden" name="view" value="apps" />
                    <input type="hidden" name="uid" value="<?php echo $user->id ?>" />
                    <input type="hidden" name="aid" value="<?php echo $userApp->id ?>" />
                    <input type="hidden" name="app" value="<?php echo $userApp->name ?>" />
                </form>                     
        	<?php endforeach; ?>  
        </div>        
    </div>
</div>