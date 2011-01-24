<?php  defined('TUIYO_EXECUTE' ) || die; ?>
<div id="w1" class="windowWrapperShadow">
    <div class="windowWrapper">
        <div class="window" style="background: #fff">
            <div class="windowTitleBar">
                <img src="<?php echo $iconPath ?>/icons/appengine_16.png" alt="hpact16" style="cursor: pointer" />
                <strong><?php echo _('System Section Permissions [ACO]'); ?></strong>
            </div>
            <div class="windowBody" style="padding: 18px; margin-top: 5px;">
				<div class="tuiyoTable">
					<form name="rolesEditor" id="rolesEditor" class="TuiyoForm" method="post" action="<?php echo JRoute::_('index.php'); ?>">
						<fieldset>
				        <div class="tuiyoTableRow" style="padding: 4px 0">
				        	<div class="tuiyoTableCell" style="width: 35%">Select Group to Edit Role</div>
				            <div class="tuiyoTableCell" style="width: 65%">
				            	<select class="TuiyoFormDropDown" name="gid" style="margin-bottom: 30px">
									<option value="28">Root User Group</option>
									<?php displayNodeSelectOptions( $arogroups , $arogroupid )?>
								</select>
								<button type="submit" id="getpermission" title="Clicking this will submit any modifications you made below">View Roles</button>
				            </div>
				            <div class="tuiyoClearFloat"></div>
				        </div>
				
				
						<h3 style="margin-bottom: 15px"><?php echo _('Edit Permission and Roles') ?></h3>
							
							
				        <div class="tuiyoTableRow" style="padding: 4px 0">
				        	<div class="tuiyoTableCell" style="width: 35%">&nbsp;</div>
				            <div class="tuiyoTableCell" style="width: 65%">
				            	<button name="submitNewUser" type="submit">Submit Modified Roles</button>
				            </div>
				            <div class="tuiyoClearFloat"></div>
				        </div>

						</fieldset>
				        <?php echo JHTML::_('form.token'); ?>
				        <input type="hidden" name="context" value="communityManagement" />
				        <input type="hidden" name="option" value="com_tuiyo" />
				        <input type="hidden" name="do" value="editpermissions" /> 
						<input type="hidden" name="action" value="roles" />  
						<input type="hidden" name="group" value="" >                                                                  
				    </form>
				</div>
            </div>            
       </div>
    </div>
</div>
<?php

function displayNodeSelectOptions( $nodes , $selected = 18, $index=0){
	
		foreach($nodes as $node) :?>													
       	<option value="<?php echo $node["id"] ?>" style="padding-left:<?php echo (($index)*20) ?>px" <?php if((int)$node["id"]==(int)$selected ){ ?> selected="selected" <?php }?>  ><?php echo $node['name']; ?> </option>        
        <?php if(count((array)$node['children']) > 0) displayNodeSelectOptions($node['children'], $selected, $index+1);
        endforeach;
}
?>