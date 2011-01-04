<?php  defined('TUIYO_EXECUTE' ) || die; ?>
<div id="NewGroupBox">
    <form name="newGroupForm" id="newGroupForm" class="TuiyoForm" method="post" action="<?php echo JRoute::_('index.php?&view=groups'); ?>">
        <fieldset>
            <div class="tuiyoTable">
                <div class="tuiyoTableRow" style="margin-top: 8px">
                    <div class="tuiyoTableCell" style="width: 30%; padding: 4px 0"><?php echo _('Group Name'); ?></div>
                    <div class="tuiyoTableCell" style="width: 70%">
                        <input type="text" name="gName" id="gName" class="TuiyoFormText" maxlength="50"  />
                    </div>
                    <div class="tuiyoClearFloat"></div>
                </div>
                <div class="tuiyoTableRow" style="margin-top: 8px">
                    <div class="tuiyoTableCell" style="width: 30%; padding: 4px 0"><?php echo _('Short description'); ?></div>
                    <div class="tuiyoTableCell" style="width: 70%">
                        <textarea name="shortDescription" id="shortDescription" class="TuiyoFormTextArea"  ></textarea><br />
                        <i style="font-size: 11px; margin-bottom: 4px;"><?php echo _('Maximum  of 100 characters, required') ?></i>
                    </div>
                    <div class="tuiyoClearFloat"></div>
                </div>
                <div class="tuiyoTableRow" style="margin-top: 8px">
                    <div class="tuiyoTableCell" style="width: 30%; padding: 4px 0"><?php echo _('Long Description'); ?></div>
                    <div class="tuiyoTableCell" style="width: 70%">
                        <textarea name="longDescription" id="longDescription" class="TuiyoFormTextArea" style="min-height: 110px" ></textarea><br />
                        <i style="font-size: 11px; margin-bottom: 4px;"><?php echo _('Maximum  of 200 characters, optional') ?></i>
                    </div>
                    <div class="tuiyoClearFloat"></div>
                </div>
                <div class="tuiyoTableRow privacyFieldRow" style="margin-top: 8px">
                    <div class="tuiyoTableCell" style="width: 30%; padding: 4px 0"><?php echo _('Privacy'); ?></div>
                    <div class="tuiyoTableCell" style="width: 70%">
                        <div style="padding: 7px 0">
                            <input type="radio" value="public" id="type1" name="gType" checked="checked" /> <?php echo _('Public group - anyone can participate'); ?>
                        </div>
                        <div><input type="radio" value="private" id="type2" name="gType"/> <?php echo _('Private group - invite only'); ?></div>
                     </div>
                    <div class="tuiyoClearFloat"></div>
                </div>                        
                <div class="tuiyoTableRow" style="margin-top: 8px">
                    <div class="tuiyoTableCell" style="width: 30%; padding: 4px 0"><?php echo _('Category') ;?></div>
                    <div class="tuiyoTableCell" style="width: 70%">
                        <select name="catID" id="catID" class="TuiyoFormDropDown" >
                            <?php displayNodeSelectOptions($categories) ?>
                            
                        </select>
                    </div>
                    <div class="tuiyoClearFloat"></div>
                </div> 
                <div class="tuiyoTableRow" style="margin-top: 8px">
                    <div class="tuiyoTableCell" style="width: 30%; padding: 4px 0">&nbsp;</div>
                    <div class="tuiyoTableCell" style="width: 70%">
                        <button class="TuiyoFormButton1" id="submitStep1" type="submit"><?php echo _('Create group' ); ?></button>
                    </div>
                    <div class="tuiyoClearFloat"></div>
                </div>                     
            </div>                
        </fieldset>
        <input type="hidden" name="groupID" value="" />
        <input type="hidden" name="option" value="com_tuiyo" />
        <input type="hidden" name="format" value="html" />
        <input type="hidden" name="controller" value="groups" />
        <input type="hidden" name="do" value="saveGroup" />
        <?php echo JHTML::_('form.token') ; ?>
    </form>
</div>

<?php 
/**
 * Displays the category select Options
 * Enter description here ...
 * @param $nodes
 * @param $index
 */
function displayNodeSelectOptions( $nodes , $index=0){
		foreach($nodes as $node) :?>													
       	<option value="<?php echo $node["id"] ?>" style="padding-left:<?php echo (($index)*20) ?>px"><?php echo $node['title']; ?> </option>        
        <?php if(count((array)$node['children']) > 0) displayNodeSelectOptions($node['children'], $index+1);
        endforeach;
}

?>