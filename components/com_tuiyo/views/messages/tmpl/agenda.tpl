<?php 
	defined('TUIYO_EXECUTE') || die('Restricted access'); 
	defined('TUIYO_EXECUTE') || die('Restricted access'); 
    $monthNames = Array(
    					 _("January"), _("February"), _("March"), _("April"), _("May"), _("June"), _("July"), 
    					 _("August"), _("September"), _("October"), _("November"), _("December")
                  );
?>

<div id="pageContainer">
	<div class="messagesHomegPage">
		<div class="messagesHomePageTitle tuiyoTable pageHeaderTitle">
        	<div class="tuiyoTableRow" style="padding: 5px">
            	<div class="tuiyoTableCell" style="width: 70%">	
                	<div class="tuiyoTableRow">
                    	<div class="tuiyoTableCell" style="width: 16%">
                        	<img alt="#"  src="<?php echo($this->user->getUserAvatar()->thumb70 ) ?>" class="TuiyoAvatar"  />
                        </div>
                    	<div class="tuiyoTableCell" style="width: 84%">
                        	<h3 style="font-size: 22px; font-weight: bold"><?php echo $this->user->name ?> &raquo; Agenda</h3>
                            <i style="font-size: 11px; line-height: 18px"><?php echo _('Summary of Upcoming events and more');  ?> </i>
                         </div>
                    	<div class="tuiyoClearFloat"></div>
                    </div>                    
                </div>
                <div class="tuiyoTableCell" style="width: 30%">
                    <div class="dropDownMenuList">
                    	<ul id="messagesMenu">                                                       
                            <li class="link"><img alt="#"  src="<?php echo $this->livestyle ?>/images/calendar32.png"  />
                                <a href="<?php echo JROUTE::_(TUIYO_INDEX.'&view=messages&do=calendar') ?>"><?php echo _('Calendar'); ?></a></li>
                            <li class="link"><img alt="#"  src="<?php echo $this->livestyle ?>/images/email_32.png"  />
                                <a href="<?php echo JROUTE::_(TUIYO_INDEX.'&amp;view=messages') ?>"><?php echo _('Messages'); ?></a></li>                            
                        </ul> 
                    </div>                     
                </div>
            	<div class="tuiyoClearFloat"></div>
            </div>
        </div>    
    	<div class="messagesHomePageContent">        
        	<div class="tuiyoTableRow" style="padding: 15px 0">
            	<div class="tuiyoTableCell" style="width: 100%">
                    <div class="reporter"><jdoc:include type="message" /></div>
                    <div class="tuiyoClearFloat"></div>
                    <div class="tuiyoTableHeaderRow" style="line-height: 275%;">
                        <div class="tuiyoTableCell" style="width: 13%; margin: 4px" align="center">
                            <a href="<?php echo JROUTE::_(TUIYO_INDEX.'&view=messages&do=agenda&cMonth='.$this->cVars['prevMonth'].'&cYear='.$this->cVars['prevYear']) ?>">Previous</a></div>
                        <div class="tuiyoTableCell" style="width: 68%; margin: 4px; font-size: 20px;" align="center">                    
                            <?php echo $monthNames[$this->cVars['dateInfo']['mon']-1].' '.$this->cVars['dateInfo']['year'];  ?></div>
                        <div class="tuiyoTableCell" style="width: 13%; margin: 4px" align="center">
                            <a href="<?php echo JROUTE::_(TUIYO_INDEX.'&view=messages&do=agenda&cMonth='.$this->cVars['nextMonth'].'&cYear='.$this->cVars['nextYear']) ?>">Next</a></div>
                       <div class="tuiyoClearFloat"></div>
                    </div>  
					<div class="tuiyoTableRow monthEventDetails" style="padding: 10px">
                    	<ol>
                        <?php if(count($this->cVars['events']) < 1 ) : ?>
                        	<div class="TuiyoNoticeMsg"><?php echo _('There are no events for the selected dates (Month)')?></div>
                        <?php endif; ?>
                        <?php  foreach($this->cVars['events'] as $eventItem) : ?>
                        	<li class="eventItem tpl<?php echo $eventItem[0]->privacy ?> ">
                            	<div class="tuiyoTableRow">
                                	<h3 style="margin: 10px 0; font-size: 150%">
                                    	<a><?php echo $eventItem[0]->title ?>  hosted by <?php echo $eventItem[0]->name ?> </a></h3>
                               	</div>

                                <div class="tuiyoTableRow infoElement">
                                    <div class="tuiyoTableCell infoLabel" style="width: 30%"><?php echo _('Start Date & Time'); ?></div>
                                    <div class="tuiyoTableCell infoValue" style="width: 70%">
                                    	<?php echo date('l jS \of F Y @ h:i:s A', strtotime($eventItem[0]->starttime) ); ?></div>
                                    <div class="tuiyoClearFloat"></div>
                                </div>                                  
                                <div class="tuiyoTableRow infoElement">
                                    <div class="tuiyoTableCell infoLabel" style="width: 30%"><?php echo _('Location'); ?></div>
                                    <div class="tuiyoTableCell infoValue" style="width: 70%">
                                    	<span><?php echo $eventItem[0]->location ?> </span> &bull;
                                        <span><?php echo $eventItem[0]->street ?> </span> &bull;
                                        <span><?php echo $eventItem[0]->city ?> </span>
                                    </div>
                                    <div class="tuiyoClearFloat"></div>
                                </div>     
                                <?php if($eventItem[0]->description) : ?>  
                                <div class="tuiyoTableRow infoElement">
                                    <div class="tuiyoTableCell infoLabel" style="width: 30%"><?php echo _('Additional Info'); ?></div>
                                    <div class="tuiyoTableCell infoValue" style="width: 70%"><?php echo $eventItem[0]->description ?> </div>
                                    <div class="tuiyoClearFloat"></div>
                                </div> 
                                <?php endif; ?>                                                                                     
                        	</li>
                        <?php endforeach; ?>
                     	</ol>
                     </div>                                                                     	                     
                </div>
               	<div class="tuiyoClearFloat"></div>
            </div>
        </div>
    </div>
     <div class="tuiyoClearFloat"></div>
</div>



















