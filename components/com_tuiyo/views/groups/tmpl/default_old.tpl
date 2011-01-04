<?php  defined('TUIYO_EXECUTE' ) || die; ?>
<div id="pageContainer">
	<div class="groupHomepage">
    	<div class="groupHomePageTitle pageHeaderTitle tuiyoTable">
        	<div class="tuiyoTableRow" style="padding: 5px">
            	<div class="tuiyoTableCell" style="width: 70%">	
                	<div class="tuiyoTableRow">
                    	<div class="tuiyoTableCell" style="width: 16%">
                        	<img alt="#"  src="<?php echo($this->user->getUserAvatar()->thumb70 ) ?>" class="TuiyoAvatar"  />
                        </div>
                    	<div class="tuiyoTableCell" style="width: 84%">
                        	<h3 style="font-size: 22px; font-weight: bold">
                            	<?php echo $this->user->name.'\''.($this->user->name[strlen($this->user->name) - 1] != 's' ? 's' : '')." groups"; ?> </h3>
                            <a id="createNewGroups" style="cursor: pointer"><?php echo _('Create new group');  ?></a>
                         </div>
                    	<div class="tuiyoClearFloat"></div>
                    </div>                    
                </div>
                <div class="tuiyoTableCell" style="width: 30%">
                    <div class="dropDownMenuList"> 
                      	<?php if(sizeof($this->data['categories'])<1 ) : ?>   
                            <div class="TuiyoNoticeMsg">There are no categories</div>
                        <?php else : ?>
                            <ul id="groupsPageNavigation">
                            	<li class="parent">Browse categories </li>
                                <?php foreach((array)$this->data['categories'] as $category) : ?>
                                
                                    <li class="parent" id="<?php echo $category['id'] ?>">
                                        <a href="#" rel=""><?php echo $category['name'] ?></a>
                                    </li>
                                    <?php if(isset($category["children"]) ) : ?>
                                        <ul class="childNavigation" id="c<?php echo $category['id'] ?>">
                                             <li class="child" id="0<?php echo $category['id'] ?>">
                                                    <a href="#" rel="<?php echo $category['name'] ?>"><?php echo _('All groups in category'); ?></a></li>
                                            <?php foreach( $category["children"] as $child) : ?>
                                                <li class="child" id="<?php echo $child['id'] ?>">
                                                    <a href="#" rel="<?php echo $child['name'] ?>"><?php echo $child["name"] ?></a>
                                                </li>
                                            <?php endforeach; ?>
                                        </ul>
                                    <?php endif; ?>
                                <?php endforeach; ?>
                            </ul>
                        <?php endif; ?>
                    </div>                     
                </div>
            	<div class="tuiyoClearFloat"></div>
            </div>
        </div>
        <div class="groupHomePageContent">
        	<div class="tuiyoTableRow">
            	<div class="tuiyoTableCell" style="width: 100%">
                    <div class="reporter"><jdoc:include type="message" /></div>
                    <div class="tuiyoClearFloat"></div>            	
                    <div id="groupsPageHome">
                    
                        <?php if(!$this->user->joomla->get('guest')): ?>                    
                            <!--MY GROUPS-->
                            <div class="tuiyoTableRow infoGroupTitle"><h3><a href="#"><?php echo _('My Groups' ) ;?></a></h3></div>
                            <?php if(sizeof($this->data['mygroups']) < 1 ) : ?>                     
                                <div class="TuiyoNoticeMsg">You have not yet been subsrcibed to any group</div> 
                            <?php else : ?>
                                <?php foreach($this->data['mygroups'] as $mGroup ) : ?>
                                    <div class="groupListItem" title="<?php printf(ngettext('%d member', '%d members', $mGroup->memberCount), $mGroup->memberCount); ?>" align="center">
                                        <a href="<?php echo JRoute::_(TUIYO_INDEX.'&amp;view=groups&amp;do=view&amp;gid='.$mGroup->groupID ); ?>">
                                            <img src="<?php echo $mGroup->logo ?>" class="groupLogo" />
                                        </a>
                                        <span><?php echo $mGroup->gName ?></span>
                                    </div>
                                <?php endforeach; ?>
                                <div class="tuiyoClearFloat"></div>
                            <?php endif; ?>        
                        <?php endif; ?>             	
                        
                        <!--RECENT GROUPS-->
                        <div class="tuiyoTableRow infoGroupTitle"><h3><a href="#"><?php echo _('Most recent group' ) ;?></a></h3></div>
                        <?php if(sizeof($this->data['recentgroups'])<1 ) : ?>                   
                            <div class="TuiyoNoticeMsg">There are no recently created groups</div>   
                        <?php else : ?>
                            <?php foreach($this->data['recentgroups'] as $rGroup ) : ?>
                                <div class="groupListItem" title="Created <?php  echo TuiyoTimer::diff( strtotime($rGroup->dateCreated) ) ; ?>" align="center">
                                    <a href="<?php echo JRoute::_(TUIYO_INDEX.'&amp;view=groups&amp;do=view&amp;gid='.$rGroup->groupID ); ?>">
                                        <img src="<?php echo $rGroup->logo ?>" class="groupLogo" />
                                    </a>
                                    <span><?php echo $rGroup->gName ?></span>
                                </div>
                            <?php endforeach; ?>
                            <div class="tuiyoClearFloat"></div>
                        <?php endif; ?>                
                                        
                        <!--POPULAR GROUPS-->
                        <div class="tuiyoTableRow infoGroupTitle"><h3><a href="#"><?php echo _('Most Popular groups' ) ;?></a></h3></div>
                        <?php if(sizeof($this->data['populargroups'])<1 ) : ?>   
                            <div class="TuiyoNoticeMsg">There are no popular groups as of yet. Please create one now!</div>
                        <?php else : ?>
                            <?php foreach($this->data['populargroups'] as $pGroup ) : ?>
                                <div class="groupListItem" title="<?php printf(ngettext('%d member', '%d members', $pGroup->memberCount), $pGroup->memberCount); ?>" align="center">
                                    <a href="<?php echo JRoute::_(TUIYO_INDEX.'&amp;view=groups&amp;do=view&amp;gid='.$pGroup->groupID ); ?>">
                                        <img src="<?php echo $pGroup->logo ?>" class="groupLogo" />
                                    </a>
                                    <span><?php echo $pGroup->gName ?></span>
                                </div>
                            <?php endforeach; ?>
                            <div class="tuiyoClearFloat"></div>
                        <?php endif; ?>
                    </div>                        
                </div>
            	<div class="tuiyoClearFloat"></div>	
            </div>
        </div>
    </div>
</div>

