<?php defined('TUIYO_EXECUTE') || die; ?>
<div id="slideshowScreenPanel" style="display: none; max-width: 100%">
    <?php echo $this->slideshowpanel; ?>
    <div id="commenterBox"><?php echo $this->commenter ?></div>
</div>
<div class="tuiyoTable">
    <div class="tuiyoTableRow">
        <div class="tuiyoTableCell" style="width: 50%">
            <div class="tuiyoColumn" id="tuiyoColumn1Pad">
                <div class="pagePublisherTabs">
                    <ul class="publisherTabItems">	                    
                        <li style="padding: 0pt 20px;" class="current" id="communityTimeLine"><a href="#"><span><?php echo _('Timeline') ?></span></a></li>
                        <li style="padding: 0pt 20px;" id="slideShow"><a href="#"><span><?php echo _('Slideshow') ?></span></a></li>
                    </ul>
                    <div class="tuiyoClearFloat"></div>
                </div>
                <div class="communityTimeLine pageEl"><?php echo $this->activity ?></div>
                <div class="slideShow pageEl" style="display: none">
                    <div id="slideshowScreen">
                        <div class="slideshowScreenPad" style="position:relative">
                            <div class="slideShowImage" ><img align="middle" id="slideshowImageSrc" /></div>
                            <div class="xhrOverlay"><?php echo _('Loading Images'); ?></div>
                            <div class="slideShowTools">
                                <div class="slideShowToolsControls tuiyoTableRow" align="center" style="width: 101%">
                                    <div class="tuiyoTableCell previousControl" style="width: 10%">&nbsp;</div>
                                    <div class="tuiyoTableCell titleControl" style="width: 70%"><span style="line-height: 30px; color: #fff; padding: 0 10px">Item Title</span></div>
                                    <div class="tuiyoTableCell thumbsToggleControl" style="width: 10%">&nbsp;</div>
                                    <div class="tuiyoTableCell nextControl" style="width: 10%">&nbsp;</div>
                                    <div style="clear: both"></div>
                                </div>
                                <div class="slideShowThumbs">Thumbs</div>
                            </div>
                        </div>
                    </div>
                    <div id="commenterBox"><?php echo $this->commenter ?></div>
                </div>
            </div>
        </div>
        <div class="tuiyoTableCell" style="width: 50%">
            <div class="tuiyoColumn" id="tuiyoColumn2Pad">
                <div class="reporter"><jdoc:include type="message" /></div>
                <!--Recently Uploaded--> 
                <div class="dashBoardWidget">
                    <div class="dashBoardWidgetBodySubHead"><?php echo _('Recently Uploaded Photos'); ?></div>
                    <div class="dashBoardWidgetBody">
                        <div class="photosBigBlueScreen">
                            <?php if (count($this->photos) < 1) : ?>
                                <div class="TuiyoNotification TuiyoInformation"><?php echo _('You have not yet uploaded any pictures. Add some unique and appealing photos of yourself now, to make the most of our community'); ?></div>
                            <?php endif; ?>                                  
                            <?php foreach ($this->photos as $photo) : ?>
                                <div class="photosPageBigScreenItem">
                                    <a href="<?php echo $photo->src_original ?>" class="imageItemWithDescr" rel="facebox" title="<?php echo $photo->caption ?>">
                                    <img alt="#"  src="<?php echo $photo->src_thumb ?>" width="70" height="70" />
                                    <span class="desc"><?php echo $photo->caption ?></span>
                                    </a>
                                </div>  
                            <?php endforeach; ?>
                            <div class="tuiyoClearFloat"></div>                                    
                        </div>              
                        <!-- <div class="dashboardWidgetFooter tuiyoTable" >
	                    	<div class="tuiyoTableRow">
	                    		<div class="tuiyoTableCell" style="width: 50%"><a>Go to Calendar</a></div>
	                    		<div class="tuiyoTableCell" style="width: 50%" align="right"><a>View more Events</a></div>
	                    		<div style="clear: both"></div>
	                    	</div>
	                    </div>-->					
                    </div>
                </div>

                <!--All Albums--> 
                <div class="dashBoardWidget">
                    <div class="dashBoardWidgetBodySubHead"><?php echo _('My Albums'); ?></div>
                    <div class="dashBoardWidgetBody">
                        <div class="photoAlbumsHolder" style="margin-bottom: 10px">
                            <?php if (count($this->albums) < 1) : ?>
                                <div class="TuiyoNotification TuiyoInformation"><?php echo _('You have not created any albums(collection)'); ?></div>
                            <?php endif; ?>                                  
                            <?php foreach ($this->albums as $album) : ?>
                                <div align="center" title="<?php echo $album->name ?>" class="albumListItem" style="max-width:70px; float: left;margin:5px; height:120px; position:relative">
                                    <a href="#" rel="<?php echo $album->aid ?>">
                                    <img  src="<?php echo $photo->src_thumb ?>" style="border:1px solid #ccc; padding:1px;" width="70" height="70">
                                    </a>
                                    <span style="white-space: nowrap; over-flow:hidden"><?php echo $album->name ?></span>
                                    <span class="commentCount" style="position:absolute; top:9px; left:1px;"><?php echo $album->photocount ?></span>
                                </div>  
                            <?php endforeach; ?>
                            <div class="tuiyoClearFloat"></div> 
                        </div> 
                        <div class="tuiyoClearFloat" style="clear:both"></div>
                        <div class="dashboardWidgetFooter tuiyoTable">
                            <div class="tuiyoTableRow">
                                <div class="tuiyoTableCell" style="width: 50%"><a href="#" class="createAlbum"><?php echo _('Create New Album') ?></a></div>
                                <div class="tuiyoTableCell" style="width: 50%" align="right"><a href="#" class="organizeAlbums"><?php echo _('Organize Albums') ?></a></div>
                                <div style="clear: both"></div>
                            </div>
                        </div>					
                    </div>
                </div> 

                <!--Incoming Comments--> 
                <div class="dashBoardWidget">
                    <div class="dashBoardWidgetBodySubHead"><?php echo _('Incoming photo comments'); ?></div>
                    <div class="dashBoardWidgetBody">
                        <div class="TuiyoNotification TuiyoInformation"><?php echo _('There are no comments to your photos at the momment'); ?></div>
                        <!-- <div class="dashboardWidgetFooter tuiyoTable" >
	                    	<div class="tuiyoTableRow">
	                    		<div class="tuiyoTableCell" style="width: 50%"><a>Go to Calendar</a></div>
	                    		<div class="tuiyoTableCell" style="width: 50%" align="right"><a>View more Events</a></div>
	                    		<div style="clear: both"></div>
	                    	</div>
	                    </div>-->					
                    </div>
                </div> 


            </div>
        </div>
        <div style="clear:both"></div>
    </div>
</div>


<div class="newPhotoAblbum tuiyoTable" style="display: none;">
    <form name="newPhotoAlbumCreate" id="newPhotoAlbumCreate" class="TuiyoForm" method="post" >
        <fieldset>
            <div class="tuiyoTableRow">
                <div class="tuiyoTableCell" style="width: 35%"><?php echo _('Album name'); ?></div>
                <div class="tuiyoTableCell" style="width: 65%">
                    <input type="text" name="name" id="name" class="TuiyoFormText"/>
                </div>
                <div class="tuiyoClearFloat"></div>
            </div>
            <div class="tuiyoTableRow">
                <div class="tuiyoTableCell" style="width: 35%"><?php echo _('Location'); ?></div>
                <div class="tuiyoTableCell" style="width: 65%">
                    <input type="text" name="location" id="location" class="TuiyoFormText"/>
                </div>
                <div class="tuiyoClearFloat"></div>
            </div>
            <div class="tuiyoTableRow">
                <div class="tuiyoTableCell" style="width: 35%"><?php echo _('Description'); ?></div>
                <div class="tuiyoTableCell" style="width: 65%">
                    <textarea name="description" id="description" class="TuiyoFormTextArea"></textarea>
                </div>
                <div class="tuiyoClearFloat"></div>
            </div>
            <div class="tuiyoTableRow">
                <div class="tuiyoTableCell" style="width: 35%"><?php echo _('Who can view this album?'); ?></div>
                <div class="tuiyoTableCell" style="width: 65%">
                    <select name="privacy" id="privacy" class="TuiyoFormDropDown" >
                        <option value="640"><?php echo _('Only Me'); ?></option>
                        <option value="630"><?php echo _('Only My Friends and Me'); ?></option>
                        <option value="620" selected="selected"><?php echo _('Any registered member'); ?></option>
                        <option value="610"><?php echo _('Make publicly available'); ?></option>
                    </select>
                </div>
                <div class="tuiyoClearFloat"></div>
            </div>        
            <div class="tuiyoTableRow" style="margin: 10px 0;">
                <div class="tuiyoTableCell" style="width: 35%"><?php echo _('Publish this Album'); ?></div>
                <div class="tuiyoTableCell" style="width: 65%">
                    <input type="radio" name="published" id="publish1" class="TuiyoFormRadio" value="1" checked="checked" /><?php echo _('Yes'); ?>
                    <input type="radio" name="published" id="publish2" class="TuiyoFormRadio" value="0" /> <?php echo _('No'); ?>
                </div>
                <div class="tuiyoClearFloat"></div>
            </div>
            <div class="tuiyoTableRow">
                <div class="tuiyoTableCell" style="width: 35%">&nbsp;</div>
                <div class="tuiyoTableCell" style="width: 65%">
                    <button type="submit" id="submitAlbumButton" ><?php echo _('Create Album'); ?></button>
                </div>
                <div class="tuiyoClearFloat"></div>
            </div> 
        </fieldset>                               
        <input type="hidden" name="option" value="com_tuiyo"  />
        <input type="hidden" name="view" value="photos" />
        <input type="hidden" name="do" value="editAlbum" />
        <input type="hidden" name="aid" id="aid" value="" />
        <input type="hidden" name="ownerid" id="ownerid" value="<?php echo $this->user->id ?>" />
        <?php echo JHTML::_('form.token'); ?>
    </form>
</div>