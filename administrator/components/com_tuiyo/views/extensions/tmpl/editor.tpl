<?php  defined('TUIYO_EXECUTE' ) || die; ?>
<div id="w1" class="windowWrapperShadow">
    <div class="windowWrapper">
        <div class="window" style="background: #fff">
            <div class="windowTitleBar">
                <img src="<?php echo $iconPath ?>/icons/plugins_16.png" alt="hpact16" style="cursor: pointer" />
                <strong>Extension Editor <?php if(isset($pluginID)){echo "/".$pluginID; } ?> <?php if(isset($pfile)){echo "/".$pfile; } ?></strong>
            </div>
            <div class="windowBody" style="padding: 18px; margin-top: 5px;">
				<div class="tuiyoTable">
					<form method="post" action="index.php" class="TuiyoForm">
						<div class="tuiyoTableRow">
							<div class="tuiyoTableCelle" style="float:left; width: 80%">
								<textarea style="width:90%!important; font-family: monospace" id="code	" class="TuiyoFormTextArea" rows="25" placeholder="select an extension from the drop downlist, then chose a file to edit"><?php if(isset($filecontent)){ echo $filecontent; } ?></textarea>
							</div>
							<div class="tuiyoTableCelle" style="float:left;width: 20%">
								<select class="TuiyoFormDropDown" name="plugintoedit" id="plugintoedit" style="margin: 0px 0px 10px 0px;" <?php if(isset($pluginID)){ echo 'selected="'.$pluginID.'"'; } ?> >
									<option value=".."><?php echo _('Select plugin to edit...') ?></option>
									<?php foreach($plugins as $plugin ): ?>
									<option value="<?php echo $plugin['serviceID'] ?>">
										Plugins/<?php echo $plugin['serviceID'] ?>/
									</option>
									<?php endforeach; ?>
								</select>
								<?php if(isset($filelist)) : ?>
									<ul>
										<?php foreach($filelist as $file): ?>
											<li><a href="<?php echo JRoute::_(TUIYO_INDEX."&amp;context=extensions&amp;do=extensionmgr&amp;action=editor&amp;plugin=".$pluginID."&amp;pfile=".$file); ?>"><?php echo $file ?></a></li>
										<?php endforeach; ?>
									</ul>
								<?php endif; ?>
							</div>
							<div class="tuiyoClearFloat"></div>
							
							<input type="hidden" value="com_tuiyo" name="option" />
							<input type="hidden" value="extensionmgreditsave" name="do" />
							<input type="hidden" value="extensions" name="context" />
							<input type="hidden" value="editor" name="action" />
							<input type="hidden" name="plugin" value="<?php echo $pluginID ?>" />
							<input type="hidden" name="pfile" value="<?php echo $pfile ?>" />
							<?php echo JHTML::_('form.token') ?>
							<button type="submit"><?php echo sprintf(_('Save %s file'), $pfile) ?></button>
						</div>
					</form>
				</div>
            </div>            
       </div>
    </div>
</div>