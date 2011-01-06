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
				
	            	<div class="dashBoardWidgetBodySubHead">                    
	                   	<?php echo $monthNames[$this->cVars['dateInfo']['mon']-1].' '.$this->cVars['dateInfo']['year'];  ?>
	                </div>
	                
	            	<div class="tuiyoTableHeaderRow">
	                    <div class="tuiyoTableCell calendarDayTitle" align="center"><?php echo _('Monday'); ?></div>
	                    <div class="tuiyoTableCell calendarDayTitle" align="center"><?php echo _('Teusday'); ?></div>
	                    <div class="tuiyoTableCell calendarDayTitle" align="center"><?php echo _('Wednesday'); ?></div>
	                    <div class="tuiyoTableCell calendarDayTitle" align="center"><?php echo _('Thurdsay'); ?></div>
	                    <div class="tuiyoTableCell calendarDayTitle" align="center"><?php echo _('Firday'); ?></div>
	                    <div class="tuiyoTableCell calendarDayTitle" align="center"><?php echo _('Saturday'); ?></div>
	                    <div class="tuiyoTableCell calendarDayTitle" align="center"><?php echo _('Sunday'); ?></div>
	                	<div class="tuiyoClearFloat"></div>
	                </div>      
	                                     
	            	<div class="tuiyoTableRow" align="center" style="border-right: 1px dotted #ccc; border-bottom: 1px dotted #ccc; margin:  0 3px 8px 4px">
	                    <?php 
	                    	$boxes = 0;
	                        for ($i=0; $i< ((int)$this->cVars['numdays']+(int)$this->cVars['dateInfo']['wday'] ); $i++) {
	                            if($i < (int)$this->cVars['dateInfo']['wday']-1  ) :
	                            ?> 
	                            	<div class="tuiyoTableCell calendarDay inactiveDay" >&nbsp;</div> 
	                                
	                            <?php elseif ($i >= $this->cVars['dateInfo']['wday']   ): ?>                                                        
	                            
	                                <div class="tuiyoTableCell calendarDay" rel="<?php echo $this->cVars['dateInfo']['year'].'-'.$this->cVars['dateInfo']['mon'].'-'.($i - $this->cVars['dateInfo']['wday'] + 1) ?>" 
	                                     title="<?php echo  ($i - $this->cVars['dateInfo']['wday'] + 1).' '.$monthNames[$this->cVars['dateInfo']['mon']-1].' '.$this->cVars['dateInfo']['year'] ?>">
	                                    <div class="tuiyoTableCellRow" align="right" style="padding: 0pt 6px;">
	                                    	<h4><?php echo ($i - $this->cVars['dateInfo']['wday'] + 1);  ?></h4>
	                                    </div>
	                                    <div class="tuiyoTableCellRow calendarDayItems" align="right">
	                                    	<!--<a href="#" class="calendarDayItem" title="Go to get a new mobile phone">&nbsp;</a>-->
	                                        <?php if(array_key_exists( ($i - $this->cVars['dateInfo']['wday'] + 1) , $this->cVars['events'] ) ):  ?>
	                                        	<?php foreach( (array)$this->cVars['events'][($i - $this->cVars['dateInfo']['wday'] + 1)] as $e ): ?>
	                                        		<a class="calendarDayItem tpl<?php echo $e->privacy ?>" 
													   title="<?php echo $e->title.' ('.TuiyoTimer::diff(strtotime( $e->starttime )).')' ?>">&nbsp;</a>
	                                        	<?php endforeach; ?>
	                                        <?php endif; ?>
	                                        
	                                        <div class="tuiyoClearFloat"></div>
	                                    </div>
	                                </div>
	                                
	                            <?php  endif;
	                            $boxes ++;
	                        }  	
	                                                
	                        for($c=0 ; $c<( (((int)$this->cVars['dateInfo']['wday']>5)?42:35) - ((int)$this->cVars['dateInfo']['wday']+(int)$this->cVars['numdays'] ) ); $c++) : ?> 
	                            <div class="tuiyoTableCell calendarDay inactiveDay" >&nbsp;</div>                                 
	                        <?php endfor;?>
	                	<div class="tuiyoClearFloat"></div>
	                </div>
	                               
	                
	                                                                                  
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
                
                <!--Events and Tasks for This Month --->
                
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
                <!--Events and Tasks for This Month --->
                
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