<?php defined('TUIYO_EXECUTE') || die; ?>
<div id="w1" class="windowWrapperShadow">
    <div class="windowWrapper">
        <div class="window" style="background: #fff">
            <div class="windowTitleBar" style="position:relative">
                <img src="<?php echo $iconPath ?>/icons/groups_16.png" alt="hpact16" style="cursor: pointer" />
                <strong><?php echo _('System Access Requesting Object Groups [ARO]'); ?></strong>
                <a href="#newGroup" style="position: absolute; right: 20px" rel="facebox">Add New Group</a>
            </div>
            <div class="windowBody" style="padding: 18px; margin-top: 5px;">
                <!--Permission Group Table -->
                <div class="tuiyoTable">
                    <div class="tuiyoTableRow">
                        <div class="tuiyoTableCell" style="width: 100%;">
                            <div class="viewCatDirs pageEl tuiyoTable">
                                <!-- Lists Items -->
                                <?php displayNodeRow($arogroups) ?>
                            </div>
                        </div>
                        <div class="tuiyoClearFloat"></div>
                    </div>
                </div>
                <!--Permission GroupTable Ends -->
            </div>            
        </div>
    </div>
</div>
<?php

function displayNodeSelectOptions($nodes, $index=0) {
    foreach ($nodes as $node) :
        ?>													
        <option value="<?php echo $node["id"] ?>" style="padding-left:<?php echo (($index) * 20) ?>px" <?php if ((int) $node["id"] == 18) { ?> selected="selected" <?php } ?>  ><?php echo $node['name']; ?> </option>        
        <?php
        if (count((array) $node['children']) > 0)
            displayNodeSelectOptions($node['children'], $index + 1);
    endforeach;
}

function displayNodeRow($nodes, $index = 0) {

    $protected = array();

    foreach ($nodes as $node) :
        ?>


        <div style="padding: 5px 0pt;" class="tuiyoTableRow fieldListItem <?php if ((int) $node['parent_id'] == 28) { ?>tuiyoTableHeaderRow<?php } ?>">
            <div style="width: 5%;" class="tuiyoTableCell" align="center"><input type="checkbox" value="<?php echo $node['id'] ?>" name="gid[]" <?php if ((int) $node['parent_id'] == 28) { ?>disabled="disabled"<?php } ?> /></div> <!---//user id -->
            <div style="width: 80%;" class="tuiyoTableCell">
                <?php if ((int) $node['parent_id'] == 28) { ?>
            <?php for ($i = 0; $i < $index + 1; $i++) : ?><a class="indenter">a</a><span><?php endfor;
            echo $node['name']; ?></span>
        <?php }else { ?>
            <?php for ($i = 0; $i < $index + 1; $i++) : ?><a class="indenter">a</a><a href="<?php echo JRoute::_(TUIYO_INDEX . '&context=communityManagement&do=editpermissions&action=roles&gid=' . $node['id']) ?>"><?php endfor;
            echo $node['name']; ?></a> 
        <?php } ?>
            </div>
            <div style="width: 10%;" class="tuiyoTableCell" align="center"><?php if ((int) $node['id'] > 30) { ?> <a href="<?php echo JRoute::_(TUIYO_INDEX . '&context=users&do=removePermissionGroup&gid=' . $node['id']); ?>">Remove</a> <?php } else { ?>&nbsp;<?php } ?></div> <!---//delete -->
            <div style="width: 5%;" class="tuiyoTableCell" align="center"><?php echo $node['id'] ?></div> <!---//Active -->
            <div class="tuiyoClearFloat"></div>
        </div>

        <?php if (count((array) $node['children']) > 0)
            displayNodeRow($node['children'], $index + 1) ?>

    <?php endforeach;
} ?>

<div id="newGroup" style="display: none">
    <form name="newUser" id="newUser" class="TuiyoForm" method="post" action="index.php">
        <fieldset>
            <div class="tuiyoTableRow" style="padding: 4px 0">
                <div class="tuiyoTableCell" style="width: 35%">Group Name</div>
                <div class="tuiyoTableCell" style="width: 65%">
                    <input type="text" name="name" id="name" class="TuiyoFormText" />
                </div>
                <div class="tuiyoClearFloat"></div>
            </div>

            <div class="tuiyoTableRow" style="padding: 4px 0">
                <div class="tuiyoTableCell" style="width: 35%">Parent Group</div>
                <div class="tuiyoTableCell" style="width: 65%">
                    <select class="TuiyoFormDropDown" name="parent_id">
                        <option value="28">Root Group</option>
<?php displayNodeSelectOptions($arogroups) ?>
                    </select>
                </div>
                <div class="tuiyoClearFloat"></div>
            </div>
            <div class="tuiyoTableRow" style="padding: 4px 0">
                <div class="tuiyoTableCell" style="width: 35%">&nbsp;</div>
                <div class="tuiyoTableCell" style="width: 65%">
                    <button name="submitNewUser" type="submit">Add New Group</button>
                </div>
                <div class="tuiyoClearFloat"></div>
            </div>

        </fieldset>
<?php echo JHTML::_('form.token'); ?>
        <input type="hidden" name="context" value="users" />
        <input type="hidden" name="option" value="com_tuiyo" />
        <input type="hidden" name="do" value="savePermissionGroup" /> 
        <input type="hidden" name="id" value="0" />
        <input type="hidden" name="xdo" value="save" />                                                                    
    </form>
</div>