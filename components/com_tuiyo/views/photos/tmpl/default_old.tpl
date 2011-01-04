<?php  defined('TUIYO_EXECUTE' ) || die; ?>
<div id="pageContainer">
	<div class="photosPageContainer" >
    	
        <div class="photosPageContent">
        	<div class="tuiyoTableRow">
            	<div class="tuiyoTableCell" style="width: 100%">
                    <div class="reporter" style="margin-top: 8px;"><jdoc:include type="message" /></div>
                    <div class="tuiyoClearFloat"></div>
                    <div id="photosPageContainerBody">
                        <div id="photosPagePublisher" class="tuiyoTable">       
                            <div class="photosPageBigScreen tuiyoTable">
                                <div class="tuiyoTableRow recent">
                                    <div class="tuiyoTableCell">
                                        <div class="photosBigBlueScreen">
                                            <?php if(count($this->photos) < 1 ) : ?>
                                                <div class="TuiyoNoticeMsg">
                                                    <?php echo _('You have not yet uploaded any pictures. Add some unique and appealing photos of yourself now, to make the most of our community' );?></div>
                                            <?php endif; ?>                                  
                                            <?php foreach($this->photos as $photo) : ?>
                                                <div class="photosPageBigScreenItem">
                                                    <a href="<?php echo $photo->src_original ?>" class="imageItemWithDescr" rel="facebox" title="<?php echo $photo->caption ?>">
                                                        <img alt="#"  src="<?php echo $photo->src_thumb ?>" width="100" />
                                                        <span class="desc"><?php echo $photo->caption ?></span>
                                                    </a>
                                                </div>  
                                            <?php endforeach; ?>
                                            <div class="tuiyoClearFloat"></div>                                    
                                        </div>
                                    </div>
                                    <div class="tuiyoClearFloat"></div>
                                </div>
                            </div>
                        </div>
                        <?php echo $this->pagelist ?>           
                    </div>                       
                </div>
            	<div class="tuiyoClearFloat"></div>	
            </div>
        </div>
    </div>
</div>







<div class="newPhotoAblbum tuiyoTable" style="display: none;">
	<form name="newPhotoAlbumCreate" id="newPhotoAlbumCreate" class="TuiyoForm" method="post" >
    	<fieldset>
            <div class="tuiyoTableRow">
                <div class="tuiyoTableCell" style="width: 35%"><?php echo _('Album name') ;?></div>
                <div class="tuiyoTableCell" style="width: 65%">
                    <input type="text" name="name" id="name" class="TuiyoFormText"/>
                </div>
                <div class="tuiyoClearFloat"></div>
            </div>
            <div class="tuiyoTableRow">
                <div class="tuiyoTableCell" style="width: 35%"><?php echo _('Location' ) ;?></div>
                <div class="tuiyoTableCell" style="width: 65%">
                    <input type="text" name="location" id="location" class="TuiyoFormText"/>
                </div>
                <div class="tuiyoClearFloat"></div>
            </div>
            <div class="tuiyoTableRow">
                <div class="tuiyoTableCell" style="width: 35%"><?php echo _('Description' ); ?></div>
                <div class="tuiyoTableCell" style="width: 65%">
                    <textarea name="description" id="description" class="TuiyoFormTextArea"></textarea>
                </div>
                <div class="tuiyoClearFloat"></div>
            </div>
            <div class="tuiyoTableRow">
                <div class="tuiyoTableCell" style="width: 35%"><?php echo _('Who can view this album?') ;?></div>
                <div class="tuiyoTableCell" style="width: 65%">
                    <select name="privacy" id="privacy" class="TuiyoFormDropDown" >
                        <option value="640"><?php echo _('Only Me'); ?></option>
                        <option value="630"><?php echo _('Only My Friends and Me'); ?></option>
                        <option value="620" selected="selected"><?php echo _('Any registered member'); ?></option>
                        <option value="610"><?php echo _('Make publicly available') ;?></option>
                    </select>
                </div>
                <div class="tuiyoClearFloat"></div>
            </div>        
            <div class="tuiyoTableRow" style="margin: 10px 0;">
                <div class="tuiyoTableCell" style="width: 35%"><?php echo _('Publish this Album'); ?></div>
                <div class="tuiyoTableCell" style="width: 65%">
                    <input type="radio" name="published" id="publish1" class="TuiyoFormRadio" value="1" checked="checked" /><?php echo _('Yes');?>
                    <input type="radio" name="published" id="publish2" class="TuiyoFormRadio" value="0" /> <?php echo _('No' ) ;?>
                </div>
                <div class="tuiyoClearFloat"></div>
            </div>
            <div class="tuiyoTableRow">
                <div class="tuiyoTableCell" style="width: 35%">&nbsp;</div>
                <div class="tuiyoTableCell" style="width: 65%">
                    <button type="submit" id="submitAlbumButton" ><?php echo _('Create Album') ;?></button>
                </div>
                <div class="tuiyoClearFloat"></div>
            </div> 
        </fieldset>                               
        <input type="hidden" name="option" value="com_tuiyo"  />
        <input type="hidden" name="view" value="photos" />
        <input type="hidden" name="do" value="editAlbum" />
        <input type="hidden" name="aid" id="aid" value="" />
        <input type="hidden" name="ownerid" id="ownerid" value="<?php echo $user->id ?>" />
        <?php echo JHTML::_('form.token'); ?>
    </form>
</div>

<div id="thickBoxSlideShow" style="display: none"></div>