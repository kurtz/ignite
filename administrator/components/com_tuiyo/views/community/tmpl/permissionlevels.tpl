<?php  defined('TUIYO_EXECUTE' ) || die; ?>
<div id="w1" class="windowWrapperShadow">
    <div class="windowWrapper">
        <div class="window" style="background: #fff">
            <div class="windowTitleBar">
                <img src="<?php echo $iconPath ?>/icons/applications_16.png" alt="hpact16" style="cursor: pointer" />
                <strong><?php echo _('System Access Control Object Actions'); ?></strong>
				<a href="#newSection" style="position: absolute; right: 20px" rel="facebox">Add New Action</a>
            </div>
            <div class="windowBody" style="padding: 18px; margin-top: 5px;">
				<div class="tuiyoTable">
					<div class="tuiyoTableRow">
                    	<div class="tuiyoTableCell" style="width: 100%;">
                            <div class="viewCatDirs pageEl tuiyoTable">
	
								<div style="padding: 5px 0pt;" class="tuiyoTableHeaderRow fieldListItem">
						      		<div style="width: 5%;" class="tuiyoTableCell" align="center"><input type="checkbox" value="" name="mastersid" /></div> <!---//user id -->
						            <div style="width: 80%;" class="tuiyoTableCell">Access Control Object Actions</div>
						         	<div style="width: 10%;" class="tuiyoTableCell" align="center">&nbsp;</div> <!---//delete -->
						          	<div style="width: 5%;" class="tuiyoTableCell" align="center">ID</div> <!---//Active -->
						         	<div class="tuiyoClearFloat"></div>
						        </div>
									
								<?php foreach($acosections as $node) :?>
						
							       	<div style="padding: 5px 0pt;" class="tuiyoTableRow fieldListItem">
							      		<div style="width: 5%;" class="tuiyoTableCell" align="center"><input type="checkbox" value="<?php echo $node['id']?>" name="gid[]" <?php if( (int)$node['parent_id'] == 28){ ?>disabled="disabled"<?php } ?> /></div> <!---//user id -->
							            <div style="width: 80%;" class="tuiyoTableCell"><?php echo $node['name']?></div>
							         	<div style="width: 10%;" class="tuiyoTableCell" align="center"><?php if( (int)$node['id'] > 7 ){ ?> <a href="<?php echo JRoute::_(TUIYO_INDEX.'&context=users&do=savePermissionObectSection&sid='.$node['id']); ?>">Remove</a> <?php }else{ ?>&nbsp;<?php } ?></div> <!---//delete -->
							          	<div style="width: 5%;" class="tuiyoTableCell" align="center"><?php echo $node['id']?></div> <!---//Active -->
							         	<div class="tuiyoClearFloat"></div>
							        </div>

								<?php endforeach; ?>
								
								<div style="padding: 5px 0pt;" class="tuiyoTableHeaderRow fieldListItem">
						      		<div style="width: 5%;" class="tuiyoTableCell" align="center"><input type="checkbox" value="" name="mastersid" /></div> <!---//user id -->
						            <div style="width: 80%;" class="tuiyoTableCell">Access Extension Object Sections</div>
						         	<div style="width: 10%;" class="tuiyoTableCell" align="center">&nbsp;</div> <!---//delete -->
						          	<div style="width: 5%;" class="tuiyoTableCell" align="center">ID</div> <!---//Active -->
						         	<div class="tuiyoClearFloat"></div>
						        </div>
						
							</div>
						</div>
						<div class="tuiyoClearFloat"></div>
					</div>
				</div>
            </div>            
       </div>
    </div>
</div>

<div id="newSection" style="display: none">
	<form name="newACOSection" id="newACOSection" class="TuiyoForm" method="post" action="index.php">
		<fieldset>
        <div class="tuiyoTableRow" style="padding: 4px 0">
        	<div class="tuiyoTableCell" style="width: 35%">Action Name</div>
            <div class="tuiyoTableCell" style="width: 65%">
            	<input type="text" name="name" id="name" class="TuiyoFormText" />
            </div>
            <div class="tuiyoClearFloat"></div>
        </div>
        <div class="tuiyoTableRow" style="padding: 4px 0">
        	<div class="tuiyoTableCell" style="width: 35%">Action Value</div>
            <div class="tuiyoTableCell" style="width: 65%">
            	<input type="text" name="value" id="value" class="TuiyoFormText" />
            </div>
            <div class="tuiyoClearFloat"></div>
        </div>
        <div class="tuiyoTableRow" style="padding: 4px 0">
        	<div class="tuiyoTableCell" style="width: 35%">&nbsp;</div>
            <div class="tuiyoTableCell" style="width: 65%">
            	<button name="submitNewUser" type="submit">Add New Action</button>
            </div>
            <div class="tuiyoClearFloat"></div>
        </div>

		</fieldset>
        <?php echo JHTML::_('form.token'); ?>
        <input type="hidden" name="context" value="users" />
        <input type="hidden" name="option" value="com_tuiyo" />
        <input type="hidden" name="do" value="savePermissionObectSection" /> 
		<input type="hidden" name="sid" value="0" />
		<input type="hidden" name="xdo" value="save" />                                                                    
    </form>
</div>