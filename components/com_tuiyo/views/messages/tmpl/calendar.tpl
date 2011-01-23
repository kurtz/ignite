<?php 
	defined('TUIYO_EXECUTE') || die('Restricted access'); 
    $monthNames = Array( _("January"), _("February"), _("March"), _("April"), _("May"), _("June"), _("July"), 
    					 _("August"), _("September"), _("October"), _("November"), _("December"));
?>
<div class="tuiyoTable">
	<div class="tuiyoTableRow">
		<div class="tuiyoTableCell" style="width: 50%">
			<div class="tuiyoColumn" id="tuiyoColumn1Pad">
				<div class="tuiyoTable" id="calendarBoxPage">
	                 <input type="date" id="selectCalendarDate" />
					 
	            </div>
	          	<div class="dashboardWidgetFooter tuiyoTable" >
                	<div class="tuiyoTableRow">
                		<div class="tuiyoTableCell" style="width: 50%">
                			<a href="<?php echo JROUTE::_(TUIYO_INDEX.'&view=messages&do=calendar&cMonth='.$this->cVars['prevMonth'].'&cYear='.$this->cVars['prevYear']) ?>">Previous</a>
						</div>
                		<div class="tuiyoTableCell" style="width: 50%" align="right">
                			<a href="<?php echo JROUTE::_(TUIYO_INDEX.'&view=messages&do=calendar&cMonth='.$this->cVars['nextMonth'].'&cYear='.$this->cVars['nextYear']) ?>">Next</a>
						</div>
                		<div style="clear: both"></div>
                	</div>
                </div>	
                
                <!--Events and Tasks for This Month -->
                
            	<div class="dashBoardWidget" style="margin-top: 25px">
                	<div class="dashBoardWidgetBodySubHead">Events and Tasks for this month</div>
                    <div class="dashBoardWidgetBody">
                        <div class="TuiyoNotification TuiyoInformation"><?php echo _('Upcoming Events will be displayed here'); ?></div>
					    <div class="dashboardWidgetFooter tuiyoTable" >
	                    	<div class="tuiyoTableRow">
	                    		<div class="tuiyoTableCell" style="width: 50%"><a>Go to Calendar</a></div>
	                    		<div class="tuiyoTableCell" style="width: 50%" align="right"><a>View more Events</a></div>
	                    		<div style="clear: both"></div>
	                    	</div>
	                    </div>					
					</div>
                </div>	                
	            
	            
			</div>
		</div>
		<div class="tuiyoTableCell" style="width: 50%">
			<div class="tuiyoColumn" id="tuiyoColumn2Pad">
                <!--Events and Tasks for This Month -->
                
            	<div class="dashBoardWidget">
                	<div class="dashBoardWidgetBodySubHead">Today</div>
                    <div class="dashBoardWidgetBody">
                        <div class="TuiyoNotification TuiyoInformation"><?php echo _('Select a day from the calendar to view Events'); ?></div>
					    <div class="dashboardWidgetFooter tuiyoTable" >
	                    	<div class="tuiyoTableRow">
	                    		<div class="tuiyoTableCell" style="width: 50%"><a>Go to Calendar</a></div>
	                    		<div class="tuiyoTableCell" style="width: 50%" align="right"><a>View more Events</a></div>
	                    		<div style="clear: both"></div>
	                    	</div>
	                    </div>					
					</div>
                </div>
               
               
            	<div class="dashBoardWidget">
                	<div class="dashBoardWidgetBodySubHead">Add Events</div>
                    <div class="dashBoardWidgetBody">
                        <div class="TuiyoNotification TuiyoInformation"><?php echo _('Select a day from the calendar to view Events'); ?></div>
					    <div class="dashboardWidgetFooter tuiyoTable" >
	                    	<div class="tuiyoTableRow">
	                    		<div class="tuiyoTableCell" style="width: 50%"><a>Go to Calendar</a></div>
	                    		<div class="tuiyoTableCell" style="width: 50%" align="right"><a>View more Events</a></div>
	                    		<div style="clear: both"></div>
	                    	</div>
	                    </div>					
					</div>
                </div>                
                	
			</div>
		</div>
		<div style="clear:both"></div>
	</div>
</div>