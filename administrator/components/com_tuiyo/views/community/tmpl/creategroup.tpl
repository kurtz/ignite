<?php  defined('TUIYO_EXECUTE' ) || die; ?>
<div id="w1" class="windowWrapperShadow">
    <div class="windowWrapper" id="systemConfig">
        <div class="window" style="background: #fff">
            <div class="windowTitleBar">
                <img src="<?php echo $iconPath ?>/icons/groups_16.png" alt="hpds16" style="cursor: pointer" />
                <strong>Create New Group</strong>
            </div>
            <div class="windowBody" style="padding: 18px; margin-top: 5px;">
            	<div class="tuiyoTable" style="width: 70%">
					<form name="newGroup" id="newGroup" method="post" class="TuiyoForm" action="index2.php" >
						<fieldset>
					  	<div class="tuiyoTableRow" style="padding: 4px 0">
                      	<div class="tuiyoTableCell" style="width: 35%">Group name</div>
                          <div class="tuiyoTableCell" style="width: 65%">
                          	<input type="text" name="groupName" id="groupName" placeholder="Short Descriptive Name" class="TuiyoFormText" />
                          </div><div class="tuiyoClearFloat"></div>
                      </div>
              		<div class="tuiyoTableRow" style="padding: 4px 0">
                      	<div class="tuiyoTableCell" style="width: 35%">Description (short)</div>
                          <div class="tuiyoTableCell" style="width: 65%">
                          	<textarea name="groupShortDescription" id="groupShortDescription" placeholder="Briefly describe your group" class="TuiyoFormTextArea"></textarea>
                          </div><div class="tuiyoClearFloat"></div>
                      </div> 
              		<div class="tuiyoTableRow" style="padding: 4px 0">
                      	<div class="tuiyoTableCell" style="width: 35%">Description (long)</div>
                          <div class="tuiyoTableCell" style="width: 65%">
                          	<textarea name="groupLongDescription" id="groupLongDescription" placeholder="Add an about us section for your group" class="TuiyoFormTextArea" rows="5"></textarea>
                          </div><div class="tuiyoClearFloat"></div>
                      </div>                                        
              		<div class="tuiyoTableRow" style="padding: 4px 0">
                      	<div class="tuiyoTableCell" style="width: 35%;">Group Category</div>
                          <div class="tuiyoTableCell" style="width: 65%">
                          	<select id="parentCat" class="TuiyoFormDropDown">
                              	<option value="0">--Chose group category--</option>
                              </select>
                          </div><div class="tuiyoClearFloat"></div>
                      </div>   
              		<div class="tuiyoTableRow" style="padding: 4px 0">
                      	<div class="tuiyoTableCell" style="width: 35%">Enable Group?</div>
                          <div class="tuiyoTableCell" style="width: 65%">
                          	  	<select id="status" class="TuiyoFormDropDown">
	                              	<option value="1">Yes</option>
									<option value="0">No</option>
	                            </select>
                          </div><div class="tuiyoClearFloat"></div>
                      </div> 
              		<div class="tuiyoTableRow" style="padding: 4px 0" >
                      	<div class="tuiyoTableCell" style="width: 35%">Is group Public?</div>
                          <div class="tuiyoTableCell" style="width: 65%">
                          	  	<select id="publish" class="TuiyoFormDropDown">
	                              	<option value="1">Yes</option>
									<option value="0">No</option>
	                            </select>
                          </div><div class="tuiyoClearFloat"></div>
                      </div>                                           
                      <div class="tuiyoTableRow" style="padding: 4px 0">
                      	<div class="tuiyoTableCell" style="width: 35%">&nbsp;</div>
                          <div class="tuiyoTableCell" style="width: 65%">
                              <button type="submit" id="createCat">Create new Group</button>
                          </div><div class="tuiyoClearFloat"></div>
                      </div>                                                                                                                  
                		<?php echo JHTML::_('form.token') ?>
                      <input type="hidden" name="option" value="com_tuiyo" />
                      <input type="hidden" name="context" value="communityManagement" />
                      <input type="hidden" name="do" value="newGroup" />
                      <input type="hidden" name="a" value="" />
					 </fieldset>
                  </form>
				</div>
			</div>
		</div>
	</div>
</div>