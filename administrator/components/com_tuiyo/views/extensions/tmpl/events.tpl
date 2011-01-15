<?php  defined('TUIYO_EXECUTE' ) || die; ?>
<div id="w1" class="windowWrapperShadow">
    <div class="windowWrapper">
        <div class="window" style="background: #fff">
            <div class="windowTitleBar">
                <img src="<?php echo $iconPath ?>/icons/plugins_16.png" alt="hpact16" style="cursor: pointer" />
                <strong>System Events Profiler (Active)</strong>
            </div>
            <div class="windowBody" style="padding: 18px; margin-top: 5px;">
            	<div class="tuiyoTable">
					<form action="index.php" method="post">
						<fieldset style='border:none'>
				        <div class="tuiyoTableHeaderRow" style="padding: 0 4px; height: 38px;">
				            <div class="tuiyoTableCell" style="width: 5%" align="center">&nbsp;</div>
							<div class="tuiyoTableCell" style="width: 15%;padding-top: 10px">Event Type</div>
				            <div class="tuiyoTableCell" style="width: 15%;padding-top: 10px">Extension Name</div>
				            <div class="tuiyoTableCell" style="width: 50%;padding-top: 10px" align="center">Methods</div>
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
						<?php $currentType = ""; $currentPlug = "";
							foreach($events as $type=>$plugins):
								foreach($plugins as $plugin=>$classFile): 
								
								include_once($classFile);
								
								$className = "TuiyoPlugin".ucfirst($plugin).ucfirst($type);
								if(!class_exists($className) || !class_exists('ReflectionClass')){
									continue;
								}
								$reflection = new ReflectionClass($className);
								$methods 	= $reflection->getMethods();
								
								//An array of callable methods;
								
								foreach($methods as $key=>$method):
									
									$mReflection = new ReflectionMethod($className , $method->name);
									if($mReflection->isConstructor()||$mReflection->isPrivate) continue;
							
								?>
								<div class="tuiyoTableRow" style="line-height: 28px">
						            <div class="tuiyoTableCell" style="width: 5%" align="center">
						            <input type="checkbox" name="event[]" style="margin-top: 10px" /></div>
									<div class="tuiyoTableCell" style="width: 15%;"><strong><?php if($type<>$currentType): echo ucfirst( $type); $currentPlug =""; else: echo "&nbsp;"; endif; $currentType = $type;  ?></strong></div>
						            <div class="tuiyoTableCell" style="width: 15%;">
										<img alt="#phts"  src="<?php echo JURI::root() ?>components/com_tuiyo/plugins/<?php echo $plugin.'/'.$plugin ?>-16x16.png" style="margin:5px 5px -3px 0;"  />
										<span><?php echo ucfirst( $plugin); $currentPlug = $plugin;  ?></span>
									</div>
						            <div class="tuiyoTableCell" style="width: 65%;"><a href="#<?php echo  $plugin.$method->name ?>" rel="facebox"><?php echo ucfirst($className)."::".$method->name ?></a></div>
									<div id="<?php echo  $plugin.$method->name ?>" style="display:none">
									<?php 
										$sDocComment = $mReflection->getDocComment(); $sDocComment = preg_replace("/(^[\\s]*\\/\\*\\*)|(^[\\s]\\*\\/)|(^[\\s]*\\*?\\s)|(^[\\s]*)|(^[\\t]*)/ixm", "", $sDocComment);

									    $sDocComment = str_replace("\r", "", $sDocComment);
									    $sDocComment = preg_replace("/([\\t])+/", "\t", $sDocComment);
									    
										echo $sDocComment;
									
									?>
									</div>
						            <div class="tuiyoClearFloat"></div>
						        </div>
								<?php endforeach; endforeach;
							endforeach; 
						?>
						</fieldset>
					</form>
				</div>
            </div>
       </div>
    </div>
</div>