<?php  defined('TUIYO_EXECUTE' ) || die; ?>
<div id="w1" class="windowWrapperShadow">
    <div class="windowWrapper">
        <div class="window" style="background: #fff">
            <div class="windowTitleBar">
                <img src="<?php echo $iconPath ?>/icons/applications_16.png" alt="hpact16" style="cursor: pointer" />
                <strong><?php echo _('Email all site Members'); ?></strong>
            </div>
            <div class="windowBody" style="padding: 18px; margin-top: 5px;">
				<div class="tuiyoTable" style="width: 100%">
            		<form name="configureStatistics" id="configureStatistics" method="post" class="TuiyoForm" action="index2.php" >
            			<fieldset>
							<div class="tuiyoTableRow" style="padding: 4px 0">
		                    	<div class="tuiyoTableCell" style="width: 35%">Email From</div>
		                        <div class="tuiyoTableCell" style="width: 65%">
		                        	<input type="text" name="emailFrom" id="emailFrom" class="TuiyoFormText"  placeholder="e.g john.doe@mysite.org"/>
		                        </div><div class="tuiyoClearFloat"></div>
		                    </div>
		            		<div class="tuiyoTableRow" style="padding: 4px 0">
		                    	<div class="tuiyoTableCell" style="width: 35%">Email From Name</div>
		                        <div class="tuiyoTableCell" style="width: 65%">
		                        	<input type="text" name="emailFromName" id="emailFromName" class="TuiyoFormText" placeholder="e.g John Doe" />
		                        </div><div class="tuiyoClearFloat"></div>
		                    </div>
		                    <div class="tuiyoTableRow" style="padding: 4px 0">
		                    	<div class="tuiyoTableCell" style="width: 35%">Member groups to contact</div>
		                        <div class="tuiyoTableCell" style="width: 65%">
		                        	<?php echo $arogrp ?>
		                        </div><div class="tuiyoClearFloat"></div>
		                    </div>
		            		<div class="tuiyoTableRow" style="padding: 4px 0">
		                    	<div class="tuiyoTableCell" style="width: 35%">Message Subject</div>
		                        <div class="tuiyoTableCell" style="width: 65%">
		                        	<input type="text" name="emailSubject" id="emailSubject" class="TuiyoFormText" placeholder="Your Subject" />
		                        </div><div class="tuiyoClearFloat"></div>
		                    </div>
		                    <div class="tuiyoTableRow" style="padding: 4px 0">
		                    	<div class="tuiyoTableCell" style="width: 35%">Message Body</div>
		                        <div class="tuiyoTableCell" style="width: 65%">
		                        	<textarea  name="emailMessage" id="emailMessage" class="TuiyoFormTextArea wysiwyg" placeholder="Your Message" rows="10"></textarea>
		                        </div><div class="tuiyoClearFloat"></div>
		                    </div>

                                                            
		            		<div class="tuiyoTableRow" style="padding: 4px 0">
		                    	<div class="tuiyoTableCell" style="width: 35%">&nbsp;</div>
		                        <div class="tuiyoTableCell" style="width: 65%">
		                        	<button type="submit" id="gasubmit" value="gasubmit">Send Message</button>
		                        </div><div class="tuiyoClearFloat"></div>
		                    </div>
		              		<?php echo JHTML::_('form.token') ?>
		                    <input type="hidden" name="option" value="com_tuiyo" />
		                    <input type="hidden" name="context" value="tuiyo" />
		                    <input type="hidden" name="do" value="sendMassMail" />
		                    <input type="hidden" name="a" value="" />
						<fieldset>
                	</form>
				</div>
			</div>
		</div>
	</div>
</div>