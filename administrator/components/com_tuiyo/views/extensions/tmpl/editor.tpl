<?php  defined('TUIYO_EXECUTE' ) || die; ?>
<div id="w1" class="windowWrapperShadow">
    <div class="windowWrapper">
        <div class="window" style="background: #fff">
            <div class="windowTitleBar">
                <img src="<?php echo $iconPath ?>/icons/plugins_16.png" alt="hpact16" style="cursor: pointer" />
                <strong>Extension Editor</strong>
            </div>
            <div class="windowBody" style="padding: 18px; margin-top: 5px;">
				<div class="tuiyoTable">
					<form method="post" action="index.php" class="TuiyoForm">
						<div class="tuiyoTableRow">
							<div class="tuiyoTableCelle" style="float:left; width: 70%">
								<textarea style="width:90%!important" class="TuiyoFormTextArea" rows="25" placeholder="select an extension from the drop downlist, then chose a file to edit"></textarea>
							</div>
							<div class="tuiyoTableCelle" style="float:left;width: 30%">
								<select class="TuiyoFormDropDown" name="plugintoedit" id="plugintoedit">
									<option><?php echo _('Select plugin to edit...') ?></option>
									<?php foreach($plugins as $plugin ): ?>
									<option value="<?php echo $plugin['serviceID'] ?>">
										Plugins/<?php echo $plugin['serviceID'] ?>/
									</option>
									<?php endforeach; ?>
								</select>
							</div>
							<div class="tuiyoClearFloat"></div>
						</div>
					</form>
				</div>
            </div>            
       </div>
    </div>
</div>