<?php  defined('TUIYO_EXECUTE' ) || die; ?>
<div id="w1" class="windowWrapperShadow">
    <div class="windowWrapper">
        <div class="window" style="background: #fff">
            <div class="windowTitleBar">
                <img src="<?php echo $iconPath ?>/icons/appengine_16.png" alt="hpemail16" style="cursor: pointer" />
                <strong>System Email Templates</strong>
            </div>
            <div class="windowBody" style="padding: 18px; margin-top: 5px;">
            	<div class="tuiyoTable">
                	<div class="tuiyoTableRow">
                    	<div class="tuiyoTableCell" style="width: 100%;">
                    		<form name="systemEmailTemplates" id="systemEmailTemplates" action="index.php" method="post" class="TuiyoForm">
								<fieldset>
						        	<h3>Welcome Email, sent to newly registered</h3>
						            <div class="dashBoardWidgetBody" style="padding: 8px 8px 8px 20px;">
						                <div style="margin-top: 10px;">
						                    <div class="tuiyoTable">
						                        <div class="tuiyoTableRow">
						                            <div class="tuiyoTableCell" style="width: 25%;">Message Title</div>
						                            <div class="tuiyoTableCell" style="width: 75%;">
						                                <input type="text" name="params[welcomeEmailTitle]"  id="paramswelcomeEmailTitle" style="width: 95%;" 
						                                      value="<?php echo $e->get('welcomeEmailTitle') ?>" class="TuiyoFormText" />

						                            </div>
						                            <div class="tuiyoClearFloat"></div>
						                        </div>
						                        <div class="tuiyoTableRow">
						                            <div class="tuiyoTableCell" style="width: 25%;">Message Body.</div>
						                            <div class="tuiyoTableCell" style="width: 75%;">
						                                <textarea name="params[welcomeEmailBody]"  id="paramswelcomeEmailBody" style="width: 95%" rows="5" class="TuiyoFormTextArea"><?php echo $e->get('welcomeEmailBody') ?></textarea>
						                            </div>
						                            <div class="tuiyoClearFloat"></div>
						                        </div>
						                    </div>
						                </div>
						            </div>
						        </fieldset>
								<fieldset>
						        	<h3>Invitation email</h3>
						            <div class="dashBoardWidgetBody" style="padding: 8px 8px 8px 20px;">
						                <div style="margin-top: 10px;">
						                    <div class="tuiyoTable">
						                        <div class="tuiyoTableRow">
						                            <div class="tuiyoTableCell" style="width: 25%;">Message Title</div>
						                            <div class="tuiyoTableCell" style="width: 75%;">
						                                <input type="text" name="params[inviteEmailTitle]"  id="paramsinviteEmailTitle" style="width: 95%;" 
						                                	   value="<?php echo $e->get('inviteEmailTitle') ?>" class="TuiyoFormText" />

						                            </div>
						                            <div class="tuiyoClearFloat"></div>
						                        </div>
						                        <div class="tuiyoTableRow">
						                            <div class="tuiyoTableCell" style="width: 25%;">Message Body.</div>
						                            <div class="tuiyoTableCell" style="width: 75%;">
						                                <textarea name="params[inviteEmailBody]"  id="paramsinviteEmailBody" style="width: 95%" rows="5" class="TuiyoFormTextArea"><?php echo $e->get('inviteEmailBody') ?></textarea>
						                            </div>
						                            <div class="tuiyoClearFloat"></div>
						                        </div>
						                    </div>
						                </div>
						            </div>
						        </fieldset>
								<fieldset>
						        	<h3>New user created group</h3>
						            <div class="dashBoardWidgetBody" style="padding: 8px 8px 8px 20px;">
						                <div style="margin-top: 10px;">
						                    <div class="tuiyoTable">
						                        <div class="tuiyoTableRow">
						                            <div class="tuiyoTableCell" style="width: 25%;">Message Title</div>
						                            <div class="tuiyoTableCell" style="width: 75%;">
						                                <input type="text" name="params[newUserGroupEmailTitle]"  id="paramsnewUserGroupEmailTitle" style="width: 95%;" 
						                                      value="<?php echo $e->get('newUserGroupEmailTitle') ?>" class="TuiyoFormText" />

						                            </div>
						                            <div class="tuiyoClearFloat"></div>
						                        </div>
						                        <div class="tuiyoTableRow">
						                            <div class="tuiyoTableCell" style="width: 25%;">Message Body.</div>
						                            <div class="tuiyoTableCell" style="width: 75%;">
						                                <textarea name="params[newUserGroupEmailBody]"  id="paramsnewUserGroupEmailBody" style="width: 95%" rows="5" class="TuiyoFormTextArea"><?php echo $e->get('newUserGroupEmailBody') ?></textarea>
						                            </div>
						                            <div class="tuiyoClearFloat"></div>
						                        </div>

						                    </div>
						                </div>
						            </div>
						        </fieldset>
								<fieldset>
						        	<h3>New Group member</h3>
						            <div class="dashBoardWidgetBody" style="padding: 8px 8px 8px 20px;">
						                <div style="margin-top: 10px;">
						                    <div class="tuiyoTable">
						                        <div class="tuiyoTableRow">
						                            <div class="tuiyoTableCell" style="width: 25%;">Message Title</div>
						                            <div class="tuiyoTableCell" style="width: 75%;">
						                                <input type="text" name="params[newGroupMemberEmailTitle]"  id="paramsnewGroupMemberEmailTitle" 
						                                      style="width: 95%;" value="<?php echo $e->get('newGroupMemberEmailTitle') ?>" class="TuiyoFormText" />

						                            </div>
						                            <div class="tuiyoClearFloat"></div>
						                        </div>
						                        <div class="tuiyoTableRow">
						                            <div class="tuiyoTableCell" style="width: 25%;">Message Body.</div>
						                            <div class="tuiyoTableCell" style="width: 75%;">
						                                <textarea name="params[newGroupMemberEmailBody]"  id="paramsnewGroupMemberEmailBody" style="width: 95%" rows="5" class="TuiyoFormTextArea"><?php echo $e->get('newGroupMemberEmailBody') ?></textarea>
						                            </div>
						                            <div class="tuiyoClearFloat"></div>
						                        </div>
						                    </div>
						                </div>
						            </div>
						        </fieldset>
								
								<fieldset>
						        	<h3>New user report to moderator</h3>
						            <div class="dashBoardWidgetBody" style="padding: 8px 8px 8px 20px;">
						                <div style="margin-top: 10px;">
						                    <div class="tuiyoTable">
						                        <div class="tuiyoTableRow">
						                            <div class="tuiyoTableCell" style="width: 25%;">Message Title</div>
						                            <div class="tuiyoTableCell" style="width: 75%;">
						                                <input type="text" name="params[newUserReportEmailTitle]"  id="paramsnewUserReportEmailTitle" style="width: 95%;" value="<?php echo $e->get('newUserReportEmailTitle') ?>" class="TuiyoFormText" />
													</div>
						                            <div class="tuiyoClearFloat"></div>
						                        </div>
						                        <div class="tuiyoTableRow">
						                            <div class="tuiyoTableCell" style="width: 25%;">Message Body.</div>
						                            <div class="tuiyoTableCell" style="width: 75%;">
						                                <textarea name="params[newUserReportEmailBody]"  id="paramsnewUserReportEmailBody" style="width: 95%" rows="5" class="TuiyoFormTextArea"><?php echo $e->get('newUserReportBody') ?></textarea>
						                            </div>
						                            <div class="tuiyoClearFloat"></div>
						                        </div>
						                    </div>
						                </div>
						            </div>
						        </fieldset>
								<fieldset>
						        	<h3>Friendship request email </h3>
						            <div class="dashBoardWidgetBody" style="padding: 8px 8px 8px 20px;">
						                <div style="margin-top: 10px;">
						                    <div class="tuiyoTable">
						                        <div class="tuiyoTableRow">
						                            <div class="tuiyoTableCell" style="width: 25%;">Message Title</div>
						                            <div class="tuiyoTableCell" style="width: 75%;">
						                                <input type="text" name="params[connectionRequestEmailTitle]"  id="paramsconnectionRequestEmailTitle" 
						                                style="width: 95%;" value="<?php echo $e->get('connectionRequestEmailTitle') ?>" class="TuiyoFormText" />

						                            </div>
						                            <div class="tuiyoClearFloat"></div>
						                        </div>
						                        <div class="tuiyoTableRow">
						                            <div class="tuiyoTableCell" style="width: 25%;">Message Body.</div>
						                            <div class="tuiyoTableCell" style="width: 75%;">
						                                <textarea name="params[connectionRequestEmailBody]"  id="paramsconnectionRequestEmailBody" style="width: 95%" rows="5" class="TuiyoFormTextArea"><?php echo $e->get('connectionRequestEmailBody') ?></textarea>
						                            </div>
						                            <div class="tuiyoClearFloat"></div>
						                        </div>
						                    </div>
						                </div>
						            </div>
						        </fieldset>

								<fieldset>
						        	<h3> New profile ("wall") comment</h3>
						            <div class="dashBoardWidgetBody" style="padding: 8px 8px 8px 20px;">
						                <div style="margin-top: 10px;">
						                    <div class="tuiyoTable">
						                        <div class="tuiyoTableRow">
						                            <div class="tuiyoTableCell" style="width: 25%;">Message Title</div>
						                            <div class="tuiyoTableCell" style="width: 75%;">
						                                <input type="text" name="params[wallCommentEmailTitle]"  id="paramswallCommentEmailTitle" style="width: 95%;" value="<?php echo $e->get('wallCommentEmailTitle') ?>" class="TuiyoFormText" />

						                            </div>
						                            <div class="tuiyoClearFloat"></div>
						                        </div>
						                        <div class="tuiyoTableRow">
						                            <div class="tuiyoTableCell" style="width: 25%;">Message Body.</div>
						                            <div class="tuiyoTableCell" style="width: 75%;">
						                                <textarea name="params[wallCommentEmailBody]"  id="paramswallCommentEmailBody" style="width: 95%" rows="5" class="TuiyoFormTextArea"><?php echo $e->get('wallCommentEmailBody') ?></textarea>
						                            </div>
						                            <div class="tuiyoClearFloat"></div>
						                        </div>
						                    </div>
						                </div>
						            </div>
						        </fieldset>

								<fieldset>
						        	<h3>Miscellaneous Email</h3>
						            <div class="dashBoardWidgetBody" style="padding: 8px 8px 8px 20px;">
						                <div style="margin-top: 10px;">
						                    <div class="tuiyoTable">
						                        <div class="tuiyoTableRow">
						                            <div class="tuiyoTableCell" style="width: 25%;">Message Title</div>
						                            <div class="tuiyoTableCell" style="width: 75%;">
						                                <input type="text" name="params[newActionEmailTitle]"  id="paramsnewActionEmailTitle" style="width: 95%;" 
						                                      value="<?php echo $e->get('newActionEmailTitle') ?>" class="TuiyoFormText" />
						                            </div>
						                            <div class="tuiyoClearFloat"></div>
						                        </div>
						                        <div class="tuiyoTableRow">
						                            <div class="tuiyoTableCell" style="width: 25%;">Message Body.</div>
						                            <div class="tuiyoTableCell" style="width: 75%;">
						                                <textarea name="params[newActionEmailBody]"  id="paramsnewActionEmailBody" style="width: 95%" rows="5" class="TuiyoFormTextArea"><?php echo $e->get('newActionEmailBody') ?></textarea>
						                            </div>
						                            <div class="tuiyoClearFloat"></div>
						                        </div>
						                    </div>
						                </div>
						            </div>
						        </fieldset>

								<fieldset>
						        	<h3>New Notification Received</h3>
						            <div class="dashBoardWidgetBody" style="padding: 8px 8px 8px 20px;">
						                <div style="margin-top: 10px;">
						                    <div class="tuiyoTable">
						                        <div class="tuiyoTableRow">
						                            <div class="tuiyoTableCell" style="width: 25%;">Message Title</div>
						                            <div class="tuiyoTableCell" style="width: 75%;">
						                                <input type="text" name="params[newNotificationEmailTitle]"  id="paramsnewNotificationEmailTitle" 
						                                      style="width: 95%;" value="<?php echo $e->get('newNotificationEmailTitle') ?>" class="TuiyoFormText" />
						                            </div>
						                            <div class="tuiyoClearFloat"></div>
						                        </div>
						                        <div class="tuiyoTableRow">
						                            <div class="tuiyoTableCell" style="width: 25%;">Message Body.</div>
						                            <div class="tuiyoTableCell" style="width: 75%;">
						                                <textarea name="params[newNotificationEmailBody]"  id="paramsnewNotificationEmailBody" style="width: 95%" rows="5" class="TuiyoFormTextArea"><?php echo $e->get('newNotificationEmailBody') ?></textarea>
						                            </div>
						                            <div class="tuiyoClearFloat"></div>
						                        </div>
						                        <div class="tuiyoTableRow">
						                            <div class="tuiyoTableCell" style="width: 25%;">&nbsp;</div>
						                            <div class="tuiyoTableCell" style="width: 75%;">
						                                <button type="submit" class="button">Submit</button>
						                            </div>
						                            <div class="tuiyoClearFloat"></div>
						                        </div>
						                    </div>
						                </div>
						            </div>
						        </fieldset>
						        <?php echo JHTML::_('form.token') ?>
						        <input type="hidden" name="option" value="com_tuiyo" />
						        <input type="hidden" name="context" value="systemTools" />
								<input type="hidden" name="do" value="saveConfig" />
						        <input type="hidden" name="configType" value="system" />
						        <input type="hidden" name="configKey" value="emails" />
							</form>
                    	</div>
                    	<div class="tuiyoClearFloat"></div>
                    </div>
                </div>
            </div>
       </div>
    </div>
</div>
<div class="clear:both"></div>