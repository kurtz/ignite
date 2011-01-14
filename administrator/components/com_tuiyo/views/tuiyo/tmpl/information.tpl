<?php  defined('TUIYO_EXECUTE' ) || die; ?>
<div id="w1" class="windowWrapperShadow">
    <div class="windowWrapper" id="systemConfig">
        <div class="window" style="background: #fff">
            <div class="windowTitleBar">
                <img src="<?php echo $iconPath ?>/icons/chart_16.png" alt="hpact16" style="cursor: pointer" />
                <strong>System Configuration (Joomla)</strong>
            </div>
            <div class="windowBody" style="padding: 18px; margin-top: 5px;">
            	<div class="tuiyoTable" style="width: 70%">
					<form class="TuiyoForm" method="post" action="index.php">
						<fieldset>
							<?php
							$cf = file( JPATH_CONFIGURATION . '/configuration.php' );
							$config_output = array();
							foreach ($cf as $k => $v) {
								if (preg_match( '#var \$host#i', $v)) {
									$cf[$k] = 'var $host = \'xxxxxx\'';
								} else if (preg_match( '#var \$user#i', $v)) {
									$cf[$k] = 'var $user = \'xxxxxx\'';
								} else if (preg_match( '#var \$password#i', $v)) {
									$cf[$k] = 'var $password = \'xxxxxx\'';
								} else if (preg_match( '#var \$db#i', $v)) {
									$cf[$k] = 'var $db = \'xxxxxx\'';
								} else if (preg_match( '#var \$ftp_user#i', $v)) {
									$cf[$k] = 'var $ftp_user = \'xxxxxx\'';
								} else if (preg_match( '#var \$ftp_pass#i', $v)) {
									$cf[$k] = 'var $ftp_pass = \'xxxxxx\'';
								} else if (preg_match( '#var \$smtpuser#i', $v)) {
									$cf[$k] = 'var $smtpuser = \'xxxxxx\'';
								} else if (preg_match( '#var \$smtppass#i', $v)) {
									$cf[$k] = 'var $smtppass = \'xxxxxx\'';
								} else if (preg_match( '#<\?php#i', $v)) {
									continue;
								} else if (preg_match( '#\?>#i', $v)) {
									continue;
								} else if (preg_match( '#\}#i', $v)) {
									continue;
								} else if (preg_match( '#class JConfig \{#i', $v)) {
									continue;
								}
								$cf[$k]		= str_replace('var ','',$cf[$k]);
								$cf[$k]		= str_replace(';','',$cf[$k]);
								$cf[$k]		= str_replace(' = ','</div><div class="tuiyoTableCell" style="width: 65%"><input type="text" class="TuiyoFormText" readonly="readonly" value="',$cf[$k]);
								$cf[$k]		= '<div class="tuiyoTableRow" style="padding: 4px 0"><div class="tuiyoTableCell" style="width: 35%">'. $cf[$k] .'" /></div><div class="tuiyoClearFloat"></div></div>';
	
								$config_output[] = $cf[$k];
							}
							echo implode( '', $config_output );
							?>
							<h3><?php echo _('System configuration (PHP)') ?></h3>

						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
