<?php  defined('TUIYO_EXECUTE' ) || die; ?>

<div id="w1" class="windowWrapperShadow">
    <div class="windowWrapper">
        <div class="window" style="background: #fff">
        
            <div class="windowTitleBar">
                <img src="<?php echo $iconPath ?>/icons/repost_16.png" alt="hpact16" style="cursor: pointer" />
                <strong>Package Installer</strong>
            </div>
            
            <div class="windowBody" style="padding: 18px; margin-top: 5px;">
            	
                <div class="tuiyoTableCell" style="width: 70%">
                	<div id="plugin_install_page" style="margin:10px 5px;">
				
						<form name="installer" id="installer" action="index2.php" method="post" class="TuiyoForm" enctype="multipart/form-data">
					<fieldset>
					<div style="margin-top: 10px;">
						<div class="tuiyoTable">
					    	<div class="tuiyoTableRow" style="padding: 4px 0">
					        	<div class="tuiyoTableCell" style="width: 35%;"><p>Install Extension</p></div>
					            <div class="tuiyoTableCell" style="width: 65%;">
					              <p><input type="file" name="pluginfile" id="pluginfile" class="TuiyoFormText" size="80" value=""></p>
					            </div>
					            <div class="tuiyoClearFloat"></div>
					        </div>
					         <div class="tuiyoTableRow" style="padding: 4px 0">
					        	<div class="tuiyoTableCell" style="width: 35%;"><p>Install from directory</p></div>
					            <div class="tuiyoTableCell" style="width: 65%;">
					            	<p><input type="text" name="pluginfiledir" id="pluginfiledir" class="TuiyoFormText" value=""></p>
					            </div>
					            <div class="tuiyoClearFloat"></div>
					        </div>
					         <div class="tuiyoTableRow" style="padding: 4px 0">
					        	<div class="tuiyoTableCell" style="width: 35%;"><p>Install from url</p></div>
					            <div class="tuiyoTableCell" style="width: 65%;">
					              <p><input type="text" name="pluginfiledirurl" id="pluginfiledirurl" class="TuiyoFormText" value=""></p>
					            </div>
					            <div class="tuiyoClearFloat"></div>

					        </div>        
					        <div class="tuiyoTableRow" style="padding: 4px 0">
					        	<div class="tuiyoTableCell" style="width: 35%;">&nbsp;</div>
					            <div class="tuiyoTableCell" style="width: 65%;">
					            	<button type="submit" class="button">Install Extension</button>
					            </div>
					            <div class="tuiyoClearFloat"></div>
					        </div>
					    </div>
					</div>
					<input type="hidden" name="option" value="com_tuiyo">
					<input type="hidden" name="context" value="extensions">
					<input type="hidden" name="do" value="doInstall">
					<input type="hidden" name="action" value="installer">
					<?php JHTML::_('form.token') ?>
					</fieldset>
					</form>

					</div>
                </div>  
				<div class="tuiyoClearFloat"></div>
           	</div>            
       	</div>
    </div>
</div>