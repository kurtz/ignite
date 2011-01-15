<?php  defined('TUIYO_EXECUTE' ) || die; ?>
<div id="w1" class="windowWrapperShadow">
    <div class="windowWrapper" id="systemConfig">
        <div class="window" style="background: #fff">
            <div class="windowTitleBar">
                <img src="<?php echo $iconPath ?>/icons/fields.png" alt="hpact16" style="cursor: pointer" />
                <strong>Custom profile fields</strong>
            </div>
            <div class="windowBody" style="padding: 18px; margin-top: 5px;">
            	<div class="tuiyoTable">
                	<div class="tuiyoTableRow">
						<div class="cf childTab">
                            <!--Existing columns-->
                            <div class="userFields tuiyoTable">
                                <div style="padding: 5px 0pt; height: 28px; line-height: 28px;" class="tuiyoTableHeaderRow">
                                    <div style="width: 6%;" class="tuiyoTableCell">&nbsp;</div> <!---//user id -->
                                    <div style="width: 23%;" class="tuiyoTableCell">Unique Name</div> <!---//user name -->
                                    <div style="width: 25%;" class="tuiyoTableCell">Title</div> <!---//user email -->
                                    <div style="width: 16%;" class="tuiyoTableCell">Type</div> <!---//permission level -->
                                    <div style="width: 8%;" class="tuiyoTableCell" align="center">Indexed</div> <!---//main user group -->
                                    <div style="width: 8%;" class="tuiyoTableCell" align="center">Required</div> <!---//user id -->
                                    <div style="width: 8%;" class="tuiyoTableCell" align="center">Visible</div> <!---//published -->
                                    <div style="width: 6%;" class="tuiyoTableCell">&nbsp;</div>
                                    <div class="tuiyoClearFloat"></div>
                                </div> 
                                
                                <div style="padding: 7px 0pt 0px;  display:none" class="tuiyoTableRow" id="newFieldForm">
                                    <form name="tuiyoNewFieldForm" class="TuiyoForm" method="post" action="index.php">
                                        <div style="width: 6%;" class="tuiyoTableCell">&nbsp;</div> <!---//user id -->
                                        <div style="width: 41%;" class="tuiyoTableCell">
                                            <input type="text" class="TuiyoFormText" name="fl" id="fl" />
                                        </div> <!---//user email -->
                                        <div style="width: 23%;" class="tuiyoTableCell">
                                            <select  class="TuiyoFormDropDown" name="ft" id="ft" style="margin: 0pt; padding: 2px;" >
                                                <option value="text">Single line text</option>
                                                <option value="textarea">Multi line text</option>
                                                <option value="checkbox">Single Checkbox</option>
                                                <option value="checkbox">Yes/No Radio box</option>
                                                <option value="date">Date selector</option>
                                            </select>
                                        </div> <!---//permission level -->
                                        <div style="width: 8%; padding-top: 5px" align="center" class="tuiyoTableCell">
                                            <input type="checkbox" name="fs" id="fs" value="1" title="field is searchable" class="hasTip"  />
                                        </div> <!---//main user group -->
                                        <div style="width: 8%; padding-top: 5px" align="center" class="tuiyoTableCell">
                                            <input type="checkbox" name="fr" id="fr" value="1" title="field is required" class="hasTip"  />
                                        </div> <!---//user id -->
                                        <div style="width: 8%; padding-top: 5px" align="center" class="tuiyoTableCell">
                                            <input type="checkbox" name="fv" id="fv" value="1" title="field is visible" class="hasTip" />
                                        </div> <!---//published -->
                                        <div style="width: 6%;" class="tuiyoTableCell clickToRemove">&nbsp;</div>
                                        <?php echo JHTML::_('form.token'); ?>
                                    </form>
                                    <div class="tuiyoClearFloat"></div>
                                </div>                                         
                                
                                <div class="tuiyoTableRow" id="clickToAdd" align="center">
                                    Add a new field
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
       </div>
    </div>
</div>