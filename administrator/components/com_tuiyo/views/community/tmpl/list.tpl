<?php defined('TUIYO_EXECUTE') || die; ?>

<div class="tuiyoTable">
    <form action="index.php" method="post">
        <fieldset style='border:none'>
            <div class="tuiyoTableHeaderRow" style="padding: 0 4px; height: 31px;">
                <div class="tuiyoTableCell" style="width: 5%" align="center">
                    <input type="checkbox" name="masterCheckBox" id="masterCheckBox" style="margin-top: 10px" /></div>
                <div class="tuiyoTableCell" style="width: 7%;padding-top: 10px">&nbsp;</div>
                <div class="tuiyoTableCell" style="width: 48%;padding-top: 10px"><?php echo _('Full Name') ;?></div>
                <div class="tuiyoTableCell" style="width: 15%;padding-top: 10px"><?php echo _('Nick name') ;?></div>
                <div class="tuiyoTableCell" style="width: 15%;padding-top: 10px"><?php echo _('Last seen') ;?></div>
                <div class="tuiyoTableCell" style="width: 10%">
                    <select name="masterAction" class="TuiyoFormDropDown" style="margin-top: 10px " >
                        <option value="">...<?php echo _('Mass action') ;?></option>
                        <option value="unistall"><?php echo _('Suspend User') ;?></option>
                        <option value="unistall"><?php echo _('Delete Profile') ;?></option>
                        <option value="unistall"><?php echo _('Delete User') ;?></option>
                    </select>
                </div>
                <div class="tuiyoClearFloat"></div>
            </div>
            <?php foreach ($users as $user) : ?>
                <div id="<?php echo $user['id'] ?>" class="tuiyoTableRow tuiyoListRow" style="line-height: 28px">
                    <div class="tuiyoTableCell" style="width: 6%" align="center">
                        <input type="checkbox" name="userID[]" value="<?php echo $user['id'] ?>" style="margin-top: 10px" class="childSelector"/></div>
                    <div class="tuiyoTableCell profileView" style="width: 6%;"><?php echo $user["id"] ?></div>
                    <div class="tuiyoTableCell profileView" style="width: 48%;"><a href="<?php echo JRoute::_(JURI::root().TUIYO_INDEX.'&view=profile&do=view&pid='.$user['id']) ?>" targe="_blank"><?php echo $user["name"] ?></a></div>
                    <div class="tuiyoTableCell profileView" style="width: 15%;"><a href="#"><?php echo $user["username"] ?></a></div>
                    <div class="tuiyoTableCell profileView" style="width: 15%;"><?php echo TuiyoTimer::diff(strtotime($user["lastVisitDate"])) ?></div>
                    <div class="tuiyoTableCell profileView" style="width: 10%;">
                        <a href="#profileNotes<?php echo $user["id"] ?>" class="notes" rel="facebox">User notes</a> 
                        <a href="#" class="suspend">Suspend</a> 
                        <a href="#" class="delete">Delete</a> 
                    </div>
                    <div class="tuiyoClearFloat"></div>
                </div>
                <div class="permissionDiv" id="profileNotes<?php echo $user["id"] ?>" style="display:none">
                    <div class="tuiyoTableHeaderRow" style="padding: 5px"><?php echo sprintf(_('@%s profile notes') , $user['username'] ) ?></div>
                    <p class="tuiyoTable">
                        <div class="tuiyoTableRow">
                            <div class="tuiyoTableCell" style="width:20%"><img src="<?php echo TuiyoUser::getUserAvatar( (int)$user["id"], "thumb35") ?>" /></div>
                            <div class="tuiyoTableCell" style="width:80%"></div>
                            <div class="tuiyoClearFloat"></div>
                        </div>
                    </p>
                    <?php displayNodeRow( $arogroups ) ?>
                </div>
            <?php endforeach; ?>
            <input type="hidden" name="option" value="com_tuiyo" />
            <?php echo JHTML::_('form.token'); ?>
        </fieldset>
    </form>
</div>
<?php 
function displayNodeRow( $nodes, $index = 0 ){

	$protected = array();
	
	foreach($nodes as $node) :?>
	
													
       	<div style="padding: 5px 0pt;" class="tuiyoTableRow fieldListItem <?php if( (int)$node['parent_id'] == 28){ ?>tuiyoTableHeaderRow<?php } ?>">
      		<div style="width: 5%;" class="tuiyoTableCell" align="center"><input type="checkbox" value="<?php echo $node['id']?>" name="gid[]" <?php if( (int)$node['parent_id'] == 28){ ?>disabled="disabled"<?php }elseif((int)$node['id'] == 18){ ?>checked="checked" disabled="disabled"<?php } ?> /></div> <!---//user id -->
            <div style="width: 80%;" class="tuiyoTableCell">
				<?php if((int)$node['parent_id'] == 28){ ?>
					<?php for($i=0; $i<$index+1; $i++) :?><a class="indenter">a</a><span><?php endfor; echo $node['name']; ?></span>
				<?php }else{ ?>
            		<?php for($i=0; $i<$index+1; $i++) :?><a class="indenter">a</a><a href="<?php echo JRoute::_(TUIYO_INDEX.'&context=communityManagement&do=editpermissions&action=roles&gid='.$node['id']) ?>"><?php endfor; echo $node['name']; ?></a> 
            	<?php } ?>
				</div>
         	<div style="width: 10%;" class="tuiyoTableCell" align="center">&nbsp;</div> <!---//delete -->
          	<div style="width: 5%;" class="tuiyoTableCell" align="center">&nbsp;</div> <!---//Active -->
         	<div class="tuiyoClearFloat"></div>
        </div>
        
        <?php if(count((array)$node['children']) > 0) displayNodeRow($node['children'], $index+1)?>
         
	<?php endforeach;	
} ?>