<?php  defined('TUIYO_EXECUTE' ) || die; ?>
<form name="photoOrganizer" class="TuiyoForm" method="post" id="photoOrganizer">
    <div class="photosPageBigScreen tuiyoTable" style="min-height: 100px; width: 501px">
    	<div class="reporter"></div>
    	<div class="tuiyoTableHeaderRow">
        	<div class="tuiyoTableCell" style="padding: 4px; width: 50%" align="left">
            	<select class="TuiyoFormDropDown" id="selectAlbum" name="selectAlbum" style="width: 100%" >
                	<option value="0" selected="selected"><?php echo _('Select an Album...'); ?></option>
                    <!--Dump Albums here--->
                    <?php foreach($albums as $album) : ?>
                    	<option value="<?php echo $album->aid ?>"><?php echo $album->name ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="tuiyoTableCell" style="padding: 4px; width: 10%" align="left">
            	<button type="button" id="modifyAlbum"><?php echo _('Modify') ;?></button>
            </div>
            <div class="tuiyoTableCell" style="padding: 4px; width: 10%" align="left">
            	<button type="button" id="deleteAlbum"><?php echo _('Delete') ;?></button>
            </div>
            <div class="tuiyoTableCell" style="padding: 4px; width: 20%" align="left">
            	<button type="submit"><?php echo _('Save Album') ;?></button>
            </div>
            <div class="tuiyoClearFloat"></div>
        </div>
        <div class="tuiyoTableRow" style="background-color: #EDF1F8; margin: 8px 0">
            <div class="tuiyoTableCell" style="width: 100%;">
                <div class="photosPageBigScreenContent" id="photosAlbumDrop" style="padding: 7px; min-height:150px">
                    <span style="color: #666"><?php echo _('Drag Items here to add to album...'); ?></span>
                    <div class="tuiyoClearFloat"></div>
                </div>
            </div>
            <div class="tuiyoClearFloat"></div>
        </div>
        <div class="tuiyoTableRow photosPageBigScreenThumbs">
            <div class="tuiyoTable">
                <div class="tuiyoTableRow">
                    <div class="tuiyoTableCell scrollThumbs">
                        <ul id="thumbsList" style="width: 999em">&nbsp;</ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<?php echo JHTML::_('form.token'); ?>
    <input type="hidden" name="option" value="com_tuiyo"  />
    <input type="hidden" name="view" value="photos" />
    <input type="hidden" name="do" value="saveAlbumContents" />
    <input type="hidden" name="aid" id="aid" value="" />
    <input type="hidden" name="userid" value="<?php echo $user->id ?>" />   
</form>