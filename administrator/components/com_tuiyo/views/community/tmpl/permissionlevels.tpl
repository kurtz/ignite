<?php  defined('TUIYO_EXECUTE' ) || die; ?>
<div id="w1" class="windowWrapperShadow">
    <div class="windowWrapper">
        <div class="window" style="background: #fff">
            <div class="windowTitleBar">
                <img src="<?php echo $iconPath ?>/icons/applications_16.png" alt="hpact16" style="cursor: pointer" />
                <strong><?php echo _('System Access Control Object Sections [ACO_SECTIONS]'); ?></strong>
				<a href="#newSection" style="position: absolute; right: 20px" rel="facebox">Add New Section</a>
            </div>
            <div class="windowBody" style="padding: 18px; margin-top: 5px;">
				<div class="tuiyoTable">
					Access<br />
					Edit</br />
					View<br />
					Manage<br />
					Edit<br />
					Delete<br />
					Create<br />
					are the usual ones

				</div>
            </div>            
       </div>
    </div>
</div>

<div id="newSection" style="display: none">
	<form name="newACOSection" id="newACOSection" class="TuiyoForm" method="post" action="index.php">
		<fieldset>
        <div class="tuiyoTableRow" style="padding: 4px 0">
        	<div class="tuiyoTableCell" style="width: 35%">Section Name</div>
            <div class="tuiyoTableCell" style="width: 65%">
            	<input type="text" name="name" id="name" class="TuiyoFormText" />
            </div>
            <div class="tuiyoClearFloat"></div>
        </div>
        <div class="tuiyoTableRow" style="padding: 4px 0">
        	<div class="tuiyoTableCell" style="width: 35%">Section Value</div>
            <div class="tuiyoTableCell" style="width: 65%">
            	<input type="text" name="value" id="value" class="TuiyoFormText" />
            </div>
            <div class="tuiyoClearFloat"></div>
        </div>
        <div class="tuiyoTableRow" style="padding: 4px 0">
        	<div class="tuiyoTableCell" style="width: 35%">&nbsp;</div>
            <div class="tuiyoTableCell" style="width: 65%">
            	<button name="submitNewUser" type="submit">Add New Section</button>
            </div>
            <div class="tuiyoClearFloat"></div>
        </div>

		</fieldset>
        <?php echo JHTML::_('form.token'); ?>
        <input type="hidden" name="context" value="users" />
        <input type="hidden" name="option" value="com_tuiyo" />
        <input type="hidden" name="do" value="savePermissionObectSection" /> 
		<input type="hidden" name="id" value="0" />
		<input type="hidden" name="xdo" value="save" />                                                                    
    </form>
</div>