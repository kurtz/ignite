<?php  defined('TUIYO_EXECUTE' ) || die; ?>
<div class="widgetWallContainer" id="pageContainer">
            <div class="widgetWallMenu">
                    <ul id="widgetWallMenuUL" class="widgetPageTopItems">
                        <li id="WidgetAddContent"><a href="#WidgetSettings" ><?php echo _('Add Content' ); ?></a></li>
                        <li id="WidgetPageExit" style="float: right;"><a href="index.php"><?php echo _('Back to homepage' ); ?></a></li>
                    </ul>
                    <div class="tuiyoClearFloat"></div>
                </div>
                <div class="widgetWallsettingsBox" id="widgetSettings">
                    <div id="widgetSettingsTabsDiv"></div>
                </div>
	<div id="widgetWallContentContainer">
    	<div class="widgetWallMainPage">
        	<div id="widgetWallMangPageTop">    
                <div class="widgetWallTitle" align="center">
                    <span style="font-size: 20px; font-weight: bold"><?php echo sprintf( _('%s | Widgets'), $this->user->name ) ?></span>
                </div>
                <div class="reporter"><jdoc:include type="message" /></div>
                <div class="tuiyoClearFloat"></div>
                <div class="widgetWallPublisherContainer">
                    <div id="widgetWallPublisherTabs">
                        <ul class="widgetPageTabItems" id="widgetPageTabBar">
                       		<li id="WidgetToggleAll"><a href="#WidgetToggleAll" title="Toggle all widgets"><?php echo _('Toggle All' ); ?></a></li>
                            <li id="WidgetAddTab" class="newTab" title="Add new tab"><a href="#myWidgets"><?php echo _('New Tab' ); ?></a></li>
                        </ul>
                        <div class="tuiyoClearFloat"></div>
                    </div>
                </div>
            </div>
            <div id="widgetWallContent" class="tuiyoTable">
            	<div class="tuiyoTableRow" id="widgetWallAColumns">
                	<div class="tuiyoClearFloat"></div>
                </div>     
            </div>
        </div>
        <div class="tuiyoClearFloat"></div> 
	</div>
</div>


<div id="newTabFormDiv" class="createNewTabDiv tuiyoTable" style="display: none; min-width: 480px;">
	<form name="newTabForm" id="newTabForm" action="<?php echo JRoute::_('index.php?format=json') ?>" method="post" class="TuiyoForm">
    	<div class="tuiyoTableRow">
        	<div class="tuiyoTableCell" style="width: 34%" align="right"><span style="padding: 3px; line-height: 27px"><?php echo _('Tab Title' ); ?></span></div>
            <div class="tuiyoTableCell" style="width: 66%"><input name="tTitle" type="text" id="tTitle" class="TuiyoFormText" /></div>
        	<div class="tuiyoClearFloat"></div>
        </div>
        <div class="tuiyoTableRow" style="margin: 5px 0">
            <div class="tuiyoTableCell" style="width: 33.3%; margin: 5px 0" align="center">
            	<img src="components/com_tuiyo/client/default/images/2ci.gif" style="margin: 0 0 5px" />
            	<input name="tColumns" type="radio" id="tColumns0" class="TuiyoFormRadio" value="1" /><br />
                <span><?php echo _('2 columns (50% each)' ); ?></span>
            </div>        
            <div class="tuiyoTableCell" style="width: 33.3%; margin: 5px 0" align="center">
            	<img src="components/com_tuiyo/client/default/images/2c.gif" style="margin: 0 0 5px" />
            	<input name="tColumns" type="radio" id="tColumns1" class="TuiyoFormRadio" value="2" /><br />
                <span><?php echo _('2 columns (35%,65%)' ); ?></span>
            </div>
            <div class="tuiyoTableCell" style="width: 33.3%; margin: 5px 0" align="center">
            	<img src="components/com_tuiyo/client/default/images/3c.gif" style="margin: 0 0 5px" />
            	<input name="tColumns" type="radio" id="tColumns2" class="TuiyoFormRadio" checked="checked" value="3" /><br />
                <span><?php echo _('3 columns (33% each)' ); ?></span>
            </div>            
            <div class="tuiyoTableCell" style="width: 33.3%; margin: 5px 0" align="center">
            	<img src="components/com_tuiyo/client/default/images/4c.gif" style="margin: 0 0 5px" />
            	<input name="tColumns" type="radio" id="tColumns3" class="TuiyoFormRadio" value="4" /><br />
                <span><?php echo _('4 columns (25% each)' ); ?></span>
            </div>
        	<div class="tuiyoClearFloat"></div>
        </div>
        <div class="tuiyoTableRow">
        	<div class="tuiyoTableCell" style="width: 34%">&nbsp;</div>
            <div class="tuiyoTableCell" style="width: 66%">
            	<button type="submit" class="TuiyoFormButton"><?php echo _('Add Tab' ); ?></button>
            </div>
        	<div class="tuiyoClearFloat"></div>
        </div>
        <?php echo JHTML::_('form.token'); ?>
        <input type="hidden" name="option" value="com_tuiyo" />
        <input type="hidden" name="tabID" value="" />
        <input type="hidden" name="format" value="json" />
        <input type="hidden" name="do" value="addTabToPage" />
        <input type="hidden" name="userID" value="<?php echo $this->user->id ?>"  /> 
        <input type="hidden" name="controller" value="widgets" />    
              
    </form>
</div>

