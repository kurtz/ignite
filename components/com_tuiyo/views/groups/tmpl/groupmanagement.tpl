<div class="tuiyoTableRow">
    <form name="editGroupForm" id="editGroupForm" class="TuiyoForm" method="post" action="<?php echo JRoute::_('index.php?&view=groups'); ?>">
        <fieldset>
            <div class="tuiyoTable">
                <div class="tuiyoTableRow" style="margin-top: 8px">
                    <div class="tuiyoTableCell" style="width: 30%; padding: 4px 0"><?php echo _('Group Name'); ?></div>
                    <div class="tuiyoTableCell" style="width: 70%">
                        <input type="text" name="gName" id="gName" class="TuiyoFormText" maxlength="50"  value="<?php echo $group->gName ?>" /><br />
                        <i style="font-size: 11px; margin-bottom: 4px;"><?php echo sprintf( _('The group category cannot be changed from %s') , $group->cName )?></i>
                    </div>
                    <div class="tuiyoClearFloat"></div>
                </div>
                <div class="tuiyoTableRow" style="margin-top: 8px">
                    <div class="tuiyoTableCell" style="width: 30%; padding: 4px 0"><?php echo _('Short description'); ?></div>
                    <div class="tuiyoTableCell" style="width: 70%">
                        <textarea name="shortDescription" id="shortDescription" class="TuiyoFormTextArea"  ><?php echo $group->shortDescription ?></textarea><br />
                        <i style="font-size: 11px; margin-bottom: 4px;"><?php echo _('Maximum  of 100 characters, required') ?></i>
                    </div>
                    <div class="tuiyoClearFloat"></div>
                </div>
                <div class="tuiyoTableRow" style="margin-top: 8px">
                    <div class="tuiyoTableCell" style="width: 30%; padding: 4px 0"><?php echo _('Long Description'); ?></div>
                    <div class="tuiyoTableCell" style="width: 70%">
                        <textarea name="longDescription" id="longDescription" class="TuiyoFormTextArea" style="min-height: 110px" ><?php echo $group->longDescription ?></textarea><br />
                        <i style="font-size: 11px; margin-bottom: 4px;"><?php echo _('Maximum  of 200 characters, optional') ?></i>
                    </div>
                    <div class="tuiyoClearFloat"></div>
                </div>
                <div class="tuiyoTableRow privacyFieldRow" style="margin-top: 8px">
                    <div class="tuiyoTableCell" style="width: 30%; padding: 4px 0"><?php echo _('Privacy'); ?></div>
                    <div class="tuiyoTableCell" style="width: 70%">
                        <div style="padding: 7px 0">
                            <input type="radio" value="public" id="type1" name="gType" <?php if($group->gType ==='public'){ ?> checked="checked" <?php } ?> /> 
                            	<?php echo _('Public group - anyone can participate'); ?>
                        </div>
                        <div><input type="radio" value="private" id="type2" name="gType" <?php if($group->gType ==='private'){ ?> checked="checked" <?php } ?> /> 
                        	<?php echo _('Private group - only you can post to this group'); ?></div>
                     </div>
                    <div class="tuiyoClearFloat"></div>
                </div>                        
                <div class="tuiyoTableRow" style="margin-top: 8px">
                    <div class="tuiyoTableCell" style="width: 30%; padding: 4px 0">&nbsp;</div>
                    <div class="tuiyoTableCell" style="width: 70%">
                        <button class="TuiyoFormButton1" id="submitStep1" type="submit"><?php echo _('Update group details' ); ?></button>
                    </div>
                    <div class="tuiyoClearFloat"></div>
                </div>                     
            </div>                
        </fieldset>
        <input type="hidden" name="groupID" value="<?php echo $group->groupID ?>" />
        <input type="hidden" name="user"	value="<?php echo $user->id  ?>"  />
        <input type="hidden" name="option" value="com_tuiyo" />
        <input type="hidden" name="format" value="html" />
        <input type="hidden" name="controller" value="groups" />
        <input type="hidden" name="do" value="saveGroup" />
        <?php echo JHTML::_('form.token') ; ?>
    </form>
</div>

<div class="tuiyoTableRow infoGroupTitle"><h3><?php echo _('Change group logo image' ) ;?></h3></div>
<div class="tuiyoTableRow">
    <form name="groupPicture" id="groupPicture" class="TuiyoForm" method="post" enctype="multipart/form-data" action="<?php echo JRoute::_(TUIYO_INDEX.'&view=profile&format=json' ) ?>">
        <fieldset style="margin-bottom: 8px">
            <div class="tuiyoTableCell" style="width: 15%;padding: 5px">
                <img src="<?php echo $group->logo ?>"  style="padding: 2px; border: 1px solid #ccc; margin: 4px" alt="gLogo" />
            </div>
            <div class="tuiyoTableCell" style="width: 70%; padding: 19px">
                <input type="file" name="groupAvatarUpload" id="groupAvatarUpload" class="TuiyoFormFile" width="210" />
                <div class="tuiyoTableRow" style="margin-top: 8px">
                     <button class="TuiyoFormButton1" id="uploadImage" type="submit"><?php echo _('Update group Avatar' ); ?></button>
                </div>                  
            </div>
            <div class="tuiyoClearFloat"></div>
        </fieldset>
        <input type="hidden" name="groupID" value="<?php echo $group->groupID ?>" />
        <input type="hidden" name="option" value="com_tuiyo" />
        <input type="hidden" name="user"	value="<?php echo $user->id  ?>"  />
        <input type="hidden" name="format" value="json" />
        <input type="hidden" name="resourceType" value="gavatar" />
        <input type="hidden" name="controller" value="resources" />
        <input type="hidden" name="do" value="uploadResources" />  
        <?php echo JHTML::_('form.token') ; ?>              
    </form>
</div>

<div class="tuiyoTableRow infoGroupTitle"><h3><?php echo _('Manage group members' ) ;?></h3></div>
<div class="tuiyoTableRow">
    <form name="groupMembers" id="groupMembers" class="TuiyoForm" method="post"  action="index.php" >
        <fieldset style="margin-bottom: 8px">
            <?php foreach($group->members as $member): if($member->data['userID'] === $user->id ){ continue ;} ?>
                <a href="<?php echo JRoute::_( TUIYO_INDEX.'&amp;view=profile&amp;do=view&user='.$member->data['username']  )  ?>" style="padding: 2px;"
                  class="removeMember" title="<?php echo sprintf( _('Joined %s'), TuiyoTimer::diff(strtotime($member->joinDate ) )  )?> " >
                  <img alt="#"  src="<?php echo $member->data['avatar']->thumb35 ?>" class="TuiyoAvatar" width="35" />
                </a>  
            <?php endforeach; ?>
        </fieldset>
        <input type="hidden" name="groupID" value="<?php echo $group->groupID ?>" />
        <input type="hidden" name="option" value="com_tuiyo" />
        <input type="hidden" name="user"	value="<?php echo $user->id  ?>"  />
        <input type="hidden" name="format" value="html" />
        <input type="hidden" name="controller" value="groups" />
        <?php echo JHTML::_('form.token') ; ?>        
    </form>
</div>

