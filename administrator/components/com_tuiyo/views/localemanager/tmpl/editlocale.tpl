<?php  defined('TUIYO_EXECUTE' ) || die; ?>
<div id="w1" class="windowWrapperShadow">
    <div class="windowWrapper">
        <div class="window" style="background: #fff">
            <div class="windowTitleBar">
                <img src="<?php echo $iconPath ?>/icons/users_16.png" style="cursor: pointer" />
                <strong>Create new translation</strong>
            </div>
            <div class="windowBody" style="padding: 18px; margin-top: 5px;">
				<div style="width: 100%">
				<form action="index.php" method="post" class="TuiyoForm">
					<fieldset style="margin-bottom: 15px">
						<div class="tuiyoTableRow" style="padding: 4px 0">
                        	<div class="tuiyoTableCell" style="width: 35%">Locale Name</div>
                            <div class="tuiyoTableCell" style="width: 65%">
                            	<input type="text" name="name" id="name" class="TuiyoFormText" placeholder="xx_XX" />
                            </div>
                            <div class="tuiyoClearFloat"></div>
                        </div>
						<div class="tuiyoTableRow" style="padding: 4px 0">
                        	<div class="tuiyoTableCell" style="width: 35%">Author</div>
                            <div class="tuiyoTableCell" style="width: 65%">
                            	<input type="text" name="name" id="name" class="TuiyoFormText" placeholder="Your Name or Company Name" />
                            </div>
                            <div class="tuiyoClearFloat"></div>
                        </div>
						<div class="tuiyoTableRow" style="padding: 4px 0">
                        	<div class="tuiyoTableCell" style="width: 35%">Version</div>
                            <div class="tuiyoTableCell" style="width: 65%">
                            	<input type="text" name="name" id="name" class="TuiyoFormText" placeholder="1.0" />
                            </div>
                            <div class="tuiyoClearFloat"></div>
                        </div>
                        <div class="tuiyoTableRow" style="padding: 4px 0">
                        	<div class="tuiyoTableCell" style="width: 35%">Import Parameters from</div>
                            <div class="tuiyoTableCell" style="width: 65%">
                            	<select class="TuiyoFormDropDown">
						            <?php foreach($langs as $lang) : ?>
										<option><?php echo $lang['name'] ?></option>
						            <?php endforeach; ?>
								</select>
                            </div>
                            <div class="tuiyoClearFloat"></div>
                        </div>
                        <div class="tuiyoTableRow" style="padding: 4px 0">
                        	<div class="tuiyoTableCell" style="width: 35%">&nbsp;</div>
                            <div class="tuiyoTableCell" style="width: 65%">
                            	<button name="submitNewUser" type="submit">Save Locale</button>
                            </div>
                            <div class="tuiyoClearFloat"></div>
                        </div>
					</fieldset>
					<fieldset>
						<h3>Local Parameters</h3>
					</fieldset>
				</form>
				</div>
			</div>
		</div>
	</div>
</div>