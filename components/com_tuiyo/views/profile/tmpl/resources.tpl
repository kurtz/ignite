<?php  defined('TUIYO_EXECUTE' ) || die; ?>
<div class="homepagePublisherContainer">
	<div id="homepagePublisherTabs">
        <ul id="resourcesMenu" class="publisherTabItems">
        	<li style="padding-left: 0px">
                <span style="padding-left: 6px"><a><?php echo _('Filter File Types' );?></a></span>
                <ul class="tuiyoFileTree">
                    <li id="AUDIO" class="directory collapsed"><a href="#" rel="/music/<?php echo $userid ?>/"><?php echo _('audio'); ?></a></li>
                    <li id="AVATAR" class="directory collapsed"><a href="#" rel="/designs/<?php echo $userid ?>/"><?php echo _('avatars');?></a></li>
                    <li id="ARCHIVE" class="directory collapsed"><a href="#" rel="/archive/<?php echo $userid ?>/"><?php echo _('archives');?></a></li>                       
                    <li id="DOCUMENT" class="directory collapsed"><a href="#" rel="/docs/<?php echo $userid ?>/"><?php echo _('documents');?></a></li>                        
                    <li id="LINKS" class="directory collapsed"><a href="#" rel="/designs/<?php echo $userid ?>/"><?php echo _('web links'); ?></a></li>   
                    <li id="PHOTOS" class="directory collapsed"><a href="#" rel="/photos/<?php echo $userid ?>/"><?php echo _('photos'); ?></a></li>
                    <li id="VIDEO" class="directory collapsed"><a href="#" rel="/videos/<?php echo $userid ?>/"><?php echo _('videos') ;?></a></li>
                    <li id="FEED" class="directory collapsed"><a href="#" rel="/designs/<?php echo $userid ?>/"><?php echo _('web feeds');?></a></li>                                      
                    <li class="directory collapsed"><a href="#" rel="/readme.txt"><?php echo _('view all' );?></a></li>
                </ul>            
            </li>
            <li id="allFiles" class="current"><a><?php echo _('Uploaded New'); ?></a></li>
            <li id="downloadSelected"><a><?php echo _('Download'); ?></a></li>
            <li id="deleteSelected"><a><?php echo _('Delete'); ?></a></li>
        </ul>
        <div class="tuiyoClearFloat"></div>
    </div>
    <div id="resourceTable" class="tuiyoTable" style="border: 3px solid #ccc; min-height: 800px;">
        <div class="tuiyoTableRow">
            <div class="tuiyoTableCell" style="width: 100%; border-left: 1px solid #ccc; height:885px;overflow-x:hidden; overflow-y:scroll;">
            	<form name="tuiyoResourceTableForm" id="tuiyoResourceTableForm" method="post" >
                    <div id="resourceTableList" class="tuiyoTable">
                        <div class="tuiyoTableHeaderRow" style="line-height:25px;"><!--Header-->
                            <div class="tuiyoTableCell" style="padding: 6px 5px; width: 3%;" align="center">
                                <input type="checkbox" id="selectAllResources" name="selectAllResources"  />
                            </div>  
                            <div class="tuiyoTableCell" style="width: 5%">&nbsp;</div>               
                            <div class="tuiyoTableCell" style="width: 50%"><?php echo _('Resource name' ); ?></div>
                            <div class="tuiyoTableCell" style="width: 18%"><?php echo _('Date added' ); ?></div>
                            <div class="tuiyoTableCell" style="width: 12%"><?php echo _('Type' ); ?></div>
                            <div class="tuiyoTableCell" style="width: 9%"><?php echo _('Size' ); ?></div>
                            <div class="tuiyoClearFloat"></div>
                        </div>
                       <div class="tuiyoTableRow tuiyoResourcesListDiv"></div>
                    </div>
                   	<?php echo JHTML::_('form.token'); ?>
                    <input type="hidden" name="format"  value="json"  />
                    <input type="hidden" name="ResourceUserID" id="ResourceUserID" value="<?php echo $user->id ?>"  />
                </form>
            </div>
            <div class="tuiyoClearFloat"></div>
        </div>
    </div>
</div>