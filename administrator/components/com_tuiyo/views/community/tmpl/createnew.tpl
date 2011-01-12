<?php  defined('TUIYO_EXECUTE' ) || die; ?>
<div id="w1" class="windowWrapperShadow">
    <div class="windowWrapper">
        <div class="window" style="background: #fff">
            <div class="windowTitleBar">
                <img src="<?php echo $iconPath ?>/icons/users_16.png" style="cursor: pointer" />
                <strong>Create New User</strong>
            </div>
            <div class="windowBody" style="padding: 18px; margin-top: 5px;">
				<div class="createForm" style="width: 75%">
					<form name="newUser" id="newUser" class="TuiyoForm" method="post" action="index.php">
                        <div class="tuiyoTableRow">
                        	<div class="tuiyoTableCell" style="width: 35%">Full Name</div>
                            <div class="tuiyoTableCell" style="width: 65%">
                            	<input type="text" name="name" id="name" class="TuiyoFormText" />
                            </div>
                            <div class="tuiyoClearFloat"></div>
                        </div> 
                        <div class="tuiyoTableRow">
                        	<div class="tuiyoTableCell" style="width: 35%">UserName</div>
                            <div class="tuiyoTableCell" style="width: 65%">
                            	<input type="text" name="username" id="username" class="TuiyoFormText" />
                            </div>
                            <div class="tuiyoClearFloat"></div>
                        </div>   
                        <div class="tuiyoTableRow">
                        	<div class="tuiyoTableCell" style="width: 35%">Password</div>
                            <div class="tuiyoTableCell" style="width: 65%">
                            	<input type="password" name="password" id="password" class="TuiyoFormText" />
                            </div>
                            <div class="tuiyoClearFloat"></div>
                        </div>  
                        <div class="tuiyoTableRow">
                        	<div class="tuiyoTableCell" style="width: 35%">Verify Password</div>
                            <div class="tuiyoTableCell" style="width: 65%">
                            	<input type="password" name="password2" id="password2" class="TuiyoFormText" />
                            </div>
                            <div class="tuiyoClearFloat"></div>
                        </div>
                        <div class="tuiyoTableRow">
                        	<div class="tuiyoTableCell" style="width: 35%">Password</div>
                            <div class="tuiyoTableCell" style="width: 65%">
                            	<input type="text" name="email" id="email" class="TuiyoFormText" />
                            </div>
                            <div class="tuiyoClearFloat"></div>
                        </div>
                        <div class="tuiyoTableRow">
                        	<div class="tuiyoTableCell" style="width: 35%">User Group</div>
                            <div class="tuiyoTableCell" style="width: 65%">
                            	<select  name="access" id="access" class="TuiyoFormDropDown" >
                               		<option value="0">Registered</option>
                                    <option value="0">System Administrator</option>
                                </select>
                            </div>
                            <div class="tuiyoClearFloat"></div>
                        </div> 
                        <div class="tuiyoTableRow">
                        	<div class="tuiyoTableCell" style="width: 35%">&nbsp;</div>
                            <div class="tuiyoTableCell" style="width: 65%">
                            	<button name="submitNewUser" type="submit">Create new user</button>
                            </div>
                            <div class="tuiyoClearFloat"></div>
                        </div>  
                        <?php echo JHTML::_('form.token'); ?>
                        <input type="hidden" name="format" value="json" />
                        <input type="hidden" name="context" value="communityManagement" />
                        <input type="hidden" name="option" value="com_tuiyo" />
                        <input type="hidden" name="do" value="createNewUser" />                                                                   
                    </form>
				</div>
            </div>
		</div>
	</div>
</div>
				