<?php  defined('TUIYO_EXECUTE' ) || die; ?>

<div id="pageContainer">
	<div class="peoplePageHomegPage">
		<div class="tuiyoTable pageHeaderTitle">
        	<div class="tuiyoTableRow" style="padding: 5px">
            	<div class="tuiyoTableCell" style="width: 70%">	
                	<div class="tuiyoTableRow">
                    	<div class="tuiyoTableCell" style="width: 16%">
                        	<img alt="#"  src="<?php echo($this->user->getUserAvatar()->thumb70 ) ?>" class="TuiyoAvatar" />
                        </div>
                    	<div class="tuiyoTableCell" style="width: 84%">
                        	<h3 style="font-size: 22px; font-weight: bold"><?php echo _('Community members list' ); ?></h3>
                            <i style="font-size: 11px; line-height: 18px"><?php echo _('Registered public profiles');  ?> </i>
                         </div>
                    	<div class="tuiyoClearFloat"></div>
                    </div>                    
                </div>
                <div class="tuiyoTableCell" style="width: 30%">
                    <div class="dropDownMenuList">
                        <form class="TuiyoForm">
                            <ul id="membersPageNavigation">
                                <li><?php echo _('Filter List') ;?></li> 
                                            
                            </ul>
                        </form> 
                   	</div>                     
                </div>
            	<div class="tuiyoClearFloat"></div>
            </div>
        </div>    
    	<div class="peoplePageHomePageContent">
        	<div class="tuiyoTableRow">
            	<div class="tuiyoTableCell" style="width: 100%">
                    <div class="reporter" style="margin-top: 8px;"><jdoc:include type="message" /></div>
                    <div class="tuiyoClearFloat"></div>            	
                    <div class="peoplePageBoxMainPage" >
                    	<div class="membersLists tuiyoTable" style="margin-bottom: 10px">
                            <?php foreach($this->members as $member): ?>
                            <div class="tuiyoTableRow memberListsItem">
                                <div class="tuiyoTableCell" style="width: 8%">
                                    <img src="<?php echo $member->avatar->thumb35 ?>" />
                                </div>
                                <div class="tuiyoTableCell" style="width: 82%">
                                    <h3 style="font-size: 12px">
                                        <a href="<?php echo JRoute::_( TUIYO_INDEX.'&amp;view=profile&amp;do=view&user='.$member->username )  ?>">
                                            <?php echo $member->name ?> ( <?php echo $member->username ?> )
                                        </a>
                                    </h3>
                                    <i style="font-size: 11px; line-height: 12px;"><?php echo sprintf(_('Member since %s'), TuiyoTimer::diff(strtotime($member->registerDate)) ); ?>. 
                                      <?php echo sprintf( _(' Last visited about %s'),TuiyoTimer::diff(strtotime($member->lastvisitDate)) ) ?>
                                    </i>
                                                               
                                </div>
                                <div class="tuiyoTableCell" style="width: 10%" align="right">
                                    <?php if(!$member->isUserFriend ) : ?>
                                        <a href="<?php echo JRoute::_(TUIYO_INDEX.'&amp;view=friends&amp;do=add&amp;pid='.$member->id, true ) ?>" 
                                          class="addIcon" title="<?php echo _('Add as Friend') ?>">&nbsp;</a>
                                    <?php endif; ?>
                                </div>
                                <div class="tuiyoClearFloat"></div>
                            </div>
                            <?php endforeach; ?>
                        </div>
                        <div class="memberListPages"><?php echo $this->pagination ?></div>
                    </div>                       
                </div>                
               	<div class="tuiyoClearFloat"></div>
            </div>
        </div>
    </div>
     <div class="tuiyoClearFloat"></div>
</div>