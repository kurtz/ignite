<?php  defined('TUIYO_EXECUTE' ) || die; ?>
<div id="w1" class="windowWrapperShadow">
    <div class="windowWrapper" id="systemConfig">
        <div class="window" style="background: #fff">
            <div class="windowTitleBar">
                <img src="<?php echo $iconPath ?>/icons/userreports_16.png" alt="hpds16" style="cursor: pointer" />
                <strong>User Submitted Report Lists</strong>
            </div>
            <div class="windowBody" style="padding: 18px; margin-top: 5px;">
				<div class="tuiyoTable">
					<form class="TuiyoForm" action="index.php" method="post">
						
				        	<div class="tuiyoTableHeaderRow" style="padding: 0 4px; height: 34px; line-height: 34px">
					            <div class="tuiyoTableCell" style="width: 5%" align="center"><input type="checkbox" name="masterCheckBox" id="masterCheckBox" style="margin-top: 15px" /></div>
					            <div class="tuiyoTableCell" style="width: 7%;">&nbsp;</div>
					            <div class="tuiyoTableCell" style="width: 30%; text-align: left" align="left">Notes</div>
					            <div class="tuiyoTableCell" style="width: 15%; text-align: left" align="left">Reason</div>
					            <div class="tuiyoTableCell" style="width: 10%; text-align: left" align="left">Type</div>
					            <div class="tuiyoTableCell" style="width: 15%; text-align: left" align="left">Filed..</div>
					            <div class="tuiyoTableCell" style="width: 15%">
					                <select name="masterAction" class="TuiyoFormDropDown" style="margin-top: 8px;">
					                	<option value="">Mass action</option>
					                	<option value="unistall">Is Solved</option>
					                    <option value="unistall">Not Solved</option>
					                    <option value="unistall">Delete</option>

					                </select>
					            </div>
					            <div class="tuiyoClearFloat"></div>
					        </div>
					        <?php foreach($reports as $report) :?>
        
					        <div id="<?php echo $user['id'] ?>" class="tuiyoTableRow tuiyoListRow">
					            <div class="tuiyoTableCell" style="width: 6%" align="center">
					            	<input type="checkbox" name="reportID[]" value="<?php echo $report['reportID'] ?>" style="margin-top: 3px" class="childSelector"/></div>
					            <div class="tuiyoTableCell reportView" style="width: 6%;"><?php echo $report['reportID'] ?></div>
					            <div class="tuiyoTableCell reportView" style="width: 30%;"><?php echo $report['notes'] ?></div>
					            <div class="tuiyoTableCell reportView" style="width: 15%;"><a href="#"><?php echo $report['reason'] ?></a></div>
					            <div class="tuiyoTableCell reportView" style="width: 10%;"><?php echo $report['resourceType'] ?></div>
					            <div class="tuiyoTableCell reportView" style="width: 15%;"><?php echo TuiyoTimer::diff( strtotime(  $report['reportDate'] )  ) ?></div>
					            <div class="tuiyoTableCell reportView" style="width: 18%;">
					            	<a href="#" class="solved">solved</a>
					                <a href="#" class="notes">User notes</a> 
					                <a href="#" class="delete">Delete</a>
					                <a href="#" class="view">Suspend</a>  
					            </div>
					            <div class="tuiyoClearFloat"></div>
					        </div>
        
					        <?php endforeach; ?>
					        <input type="hidden" name="option" value="com_tuiyo" />
					    	<?php echo JHTML::_('form.token'); ?>
						
				    </form>
				</div>
			</div>
		</div>
	</div>
</div>