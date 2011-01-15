<?php  defined('TUIYO_EXECUTE' ) || die; ?>
<div id="w1" class="windowWrapperShadow">
    <div class="windowWrapper" id="systemConfig">
        <div class="window" style="background: #fff;">
            <div class="windowTitleBar">
                <img src="<?php echo $iconPath ?>/icons/plugins_16.png" alt="hpds16" style="cursor: pointer" />
                <strong>Installed Extensions</strong>
            </div>
            <div class="windowBody" style="padding: 18px; margin-top: 5px;">
				
				<div class="tuiyoTable">
					<form action="index.php" method="post">
						<fieldset style='border:none'>
				        <div class="tuiyoTableHeaderRow" style="padding: 0 4px; height: 38px;">
				            <div class="tuiyoTableCell" style="width: 6%" align="center">
				            <input type="checkbox" name="masterCheckBox" id="masterCheckBox" style="margin-top: 15px" /></div>
				            <div class="tuiyoTableCell" style="width: 7%;padding-top: 10px">&nbsp;</div>
				            <div class="tuiyoTableCell" style="width: 55%;padding-top: 10px">Extension Name</div>
				            <div class="tuiyoTableCell" style="width: 15%;padding-top: 10px" align="center">About</div>
				            <div class="tuiyoTableCell" style="width: 15%">
				                <select name="masterAction" class="TuiyoFormDropDown" style="margin-top: 10px">
				                	<option value="">Select an Action</option>
				                	<option value="unistall">Uninstall</option>
				                    <option value="reset">Reset Users</option>
				                    <option value="update">Check &amp; Update</option>
									<option value="refresh">Refresh data events</option>
				                </select>
				            </div>
				            <div class="tuiyoClearFloat"></div>
				        </div>
				        <?php foreach($apps as $app) :?>

				        <div id="<?php echo $user['id'] ?>" class="tuiyoTableRow tuiyoListRow" style="margin: 10px 0">
				            <div class="tuiyoTableCell" style="width: 6%" align="center">
				            	<input type="checkbox" name="userID[]" value="<?php echo $app['serviceID'] ?>" style="margin-top: 3px" class="childSelector"/></div>
				            <div class="tuiyoTableCell profileView" style="width: 7%;"><img alt="#phts"  src="<?php echo JURI::root() ?>components/com_tuiyo/plugins/<?php echo $app['serviceID'].'/'.$app['serviceID'] ?>-32x32.png" align="middle"  /> </div>
				            <div class="tuiyoTableCell profileView" style="width: 55%;"><strong><?php echo ucfirst( $app["serviceID"] ) ?></strong> <span class="description"><?php echo $app["serviceDescription"]  ?></span></div>
				            <div class="tuiyoTableCell profileView" style="width: 15%;" align="center"><a href="#" rel="facebox">About</a></div>
				            <div class="tuiyoTableCell profileView" style="width: 15%;"><?php echo $app['serviceXML']->file->document->getElementByPath("version")->data() ?></div>
				            <div class="tuiyoClearFloat"></div>
				        </div>

				        <?php endforeach; ?>
				        <input type="hidden" name="option" value="com_tuiyo" />
				    	<?php echo JHTML::_('form.token'); ?>
						</fieldset>
				    </form>
				</div>
			</div>
		</div>
	</div>
</div>