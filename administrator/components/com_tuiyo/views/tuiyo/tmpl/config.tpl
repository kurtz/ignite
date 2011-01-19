<?php  defined('TUIYO_EXECUTE' ) || die; ?>

		<div id="w1" class="windowWrapperShadow">
			<div class="windowWrapper" id="systemConfig">
				<div class="window" style="background: #fff">
					<div class="windowTitleBar">
						<img src="<?php echo $iconPath ?>/icons/control_16.png" alt="hpact16" style="cursor: pointer"> <strong>Global Configuration</strong>
					</div>
					<div class="windowBody" style="padding: 18px; margin-top: 5px;">
						<div class="tuiyoTableCell" style="width: 100%">
							<form method="post" class="TuiyoForm" action="<?php echo JRoute::_(TUIYO_INDEX) ?>">
								<?php foreach ($elements as $element):?>
								<fieldset>
									<?php echo $element['params']->renderHTML("params") ?>
								</fieldset><?php endforeach; ?><?php foreach($plugins as $p): if(!empty($p['settings_administrator_html'])): ?>
								<h3>
									<img src="<?php echo $p['serviceLivePath'].'/'.$p['serviceID']  ?>-16x16.png"> <?php echo sprintf( _('%s settings'), ucfirst($p['serviceID']) ); ?>
								</h3>
								<fieldset>
									<?php echo $p['settings_administrator_html']?>
								</fieldset><?php endif; endforeach?>
								<div class="tuiyoTableRow" style="margin: 8px 0">
									<div class="tuiyoTableCell" style="width: 35%;">
										&nbsp;
									</div>
									<div class="tuiyoTableCell" style="width: 65%;">
										<button type="submit" class="button">Save Settings</button>
									</div>
									<div class="tuiyoClearFloat"></div>
								</div><?php echo JHTML::_('form.token') ?><input type="hidden" name="option" value="com_tuiyo"> <input type="hidden" name="context" value="systemTools"> <input type="hidden" name="do" value="saveConfig"> <input type="hidden" name="configType" value="system"> <input type="hidden" name="configKey" value="global">
							</form>
						</div>
						<div class="tuiyoClearFloat"></div>
					</div>
				</div>
			</div>
		</div>

