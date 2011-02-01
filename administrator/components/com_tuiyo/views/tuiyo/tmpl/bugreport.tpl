<?php  defined('TUIYO_EXECUTE' ) || die; ?>

<div id="w1" class="windowWrapperShadow">
	<div class="windowWrapper">
		<div class="window" style="background: #fff">
			<div class="windowTitleBar">
				<img src="<?php echo $iconPath ?>/icons/bug_16.png" alt="hpact16" style="cursor: pointer"> <strong>Report Bugs</strong>
			</div>
			<div class="windowBody" style="padding: 18px; margin-top: 5px;">
				<form name="bugReporting" id="bugReporting" action="index.php" method="post" class="TuiyoForm">
					<fieldset>
						<div class="tuiyoTable">
							<div class="tuiyoTableRow">
								<div class="tuiyoTableCell" style="width: 35%;">
									Your Name
								</div>
								<div class="tuiyoTableCell" style="width: 65%;">
									<input type="text" name="username" id="username" value="<?php echo $user->get('name')?>" class="TuiyoFormText">
								</div>
								<div class="tuiyoClearFloat"></div>
							</div>
							<div class="tuiyoTableRow">
								<div class="tuiyoTableCell" style="width: 35%;">
									Your company name
								</div>
								<div class="tuiyoTableCell" style="width: 65%;">
									<input type="text" name="companyName" id="companyName" value="<?php echo $system['comunity_name']?>" class="TuiyoFormText">
								</div>
								<div class="tuiyoClearFloat"></div>
							</div>
							<div class="tuiyoTableRow">
								<div class="tuiyoTableCell" style="width: 35%;">
									Your contact number
								</div>
								<div class="tuiyoTableCell" style="width: 65%;">
									<input type="text" name="phoneNumber" id="phoneNumber" value="" class="TuiyoFormText">
								</div>
								<div class="tuiyoClearFloat"></div>
							</div>
							<div class="tuiyoTableRow">
								<div class="tuiyoTableCell" style="width: 35%;">
									Your contact email
								</div>
								<div class="tuiyoTableCell" style="width: 65%;">
									<input type="text" name="emailAddress" id="emailAddress" value="<?php echo $user->get('email') ;?>" class="TuiyoFormText">
								</div>
								<div class="tuiyoClearFloat"></div>
							</div>
							<div class="tuiyoTableRow">
								<div class="tuiyoTableCell" style="width: 35%;">
									<b>Report title</b>
								</div>
								<div class="tuiyoTableCell" style="width: 65%;">
									<input type="text" name="subject" id="subject" value="" class="TuiyoFormText">
								</div>
								<div class="tuiyoClearFloat"></div>
							</div>
							<div class="tuiyoTableRow">
								<div class="tuiyoTableCell" style="width: 35%;">
									Report summary
								</div>
								<div class="tuiyoTableCell" style="width: 65%;">
									<textarea name="bugSummary" id="bugSummary" style="width: 95%" rows="5" class="TuiyoFormTextArea">
	</textarea>
								</div>
								<div class="tuiyoClearFloat"></div>
							</div>
							<div class="tuiyoTableRow">
								<div class="tuiyoTableCell" style="width: 35%;">
									Reproducibility
								</div>
								<div class="tuiyoTableCell" style="width: 65%;">
									<textarea name="bugRepoducibility" id="bugReproducibility" style="width: 95%" rows="5" class="TuiyoFormTextArea">
	</textarea>
								</div>
								<div class="tuiyoClearFloat"></div>
							</div>
							<div class="tuiyoTableRow">
								<div class="tuiyoTableCell" style="width: 35%;">
									Outcome
								</div>
								<div class="tuiyoTableCell" style="width: 65%;">
									<textarea name="bugOutcome" id="bugOutcome" style="width: 95%" rows="5" class="TuiyoFormTextArea">
	</textarea>
								</div>
								<div class="tuiyoClearFloat"></div>
							</div>
							<div class="tuiyoTableRow">
								<div class="tuiyoTableCell" style="width: 35%;">
									Suggestions
								</div>
								<div class="tuiyoTableCell" style="width: 65%;">
									<textarea name="bugSolutionSuggest" id="bugSolutionSuggest" style="width: 95%" rows="5" class="TuiyoFormTextArea">
	</textarea>
								</div>
								<div class="tuiyoClearFloat"></div>
							</div>
							<div class="tuiyoTableRow" style="margin-top: 5px">
								<div class="tuiyoTableCell" style="width: 35%;">
									Set a priority
								</div>
								<div class="tuiyoTableCell" style="width: 65%;">
									<select name="bug_priority" class="TuiyoFormDropDown">
										<option value="Crucial">
											Very Crucial
										</option>
										<option value="Important">
											This is important
										</option>
										<option value="Annoying">
											Just an annoying issue
										</option>
										<option value="Unimportant">
											Not urgent
										</option>
									</select>
								</div>
								<div class="tuiyoClearFloat"></div>
							</div>
							<div class="tuiyoTableRow">
								<div class="tuiyoTableCell" style="width: 35%;">
									Category
								</div>s
								<div class="tuiyoTableCell" style="width: 65%;">
									<select name="bug_type" class="TuiyoFormDropDown">
										<option selected="selected" value="(1) Security">
											Security
										</option>
										<option value="(2) Crash/Hang/Data Loss">
											Crash/Hang/Data Loss
										</option>
										<option value="(3) Performance">
											Performance
										</option>
										<option value="(4) UI/Usability">
											UI/Usability
										</option>
										<option value="(5) Serious Bug">
											Serious Bug
										</option>
										<option value="(6) Other Bug/Has Workaround">
											Other Bug/Has Workaround
										</option>
										<option value="(7) Feature (New)">
											Feature (New)
										</option>
										<option value="(8) Enhancement">
											Enhancement
										</option>
									</select>
								</div>
								<div class="tuiyoClearFloat"></div>
							</div>
							<div class="tuiyoTableRow">
								<div class="tuiyoTableCell" style="width: 35%;">&nbsp;</div>
								<div class="tuiyoTableCell" style="width: 65%;">
									<button type="submit">Report Bug</button>
								</div>
								<div class="tuiyoClearFloat"></div>
							</div>
						</div>
					</fieldset>
					<?php echo JHTML::_('form.token') ?>
					<input type="hidden" name="option" value="com_tuiyo" /> 
					<input type="hidden" name="cmd" value="submitbug" />
				</form>
			</div>
		</div>
	</div>
</div>

