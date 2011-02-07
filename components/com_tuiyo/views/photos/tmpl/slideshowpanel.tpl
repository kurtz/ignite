<?php defined('TUIYO_EXECUTE') || die; ?>
<div id="slideshowScreen" >
    <div class="slideshowScreenPad" style="position:relative">
        <div class="slideShowImage" align="center"><img align="middle" id="slideshowImageSrc" /></div>
        <div class="xhrOverlay"><?php echo _('Loading Images'); ?></div>
        <a href="#" id="closeSlideshow" style="position: absolute; top: 1%; right: 1%; font-size: 13px ; font-weight: bolder; color:#fff ">Close</a>
        <div class="slideShowTools">
            <div class="slideShowToolsControls tuiyoTableRow" align="center" style="width: 101%">
                <div class="tuiyoTableCell previousControl" style="width: 5%">&nbsp;</div>
                <div class="tuiyoTableCell titleControl" style="width: 85%"><span style="line-height: 30px; color: #fff; padding: 0 10px" id="titleSpan"><?php echo _('Image Title'); ?></span><span class="commentCount" id="slideShowCount" style="display:none">1 of 10</span></div>
                <div class="tuiyoTableCell thumbsToggleControl" style="width: 5%">&nbsp;</div>
                <div class="tuiyoTableCell nextControl" style="width: 5%">&nbsp;</div>
                <div style="clear: both"></div>
            </div>
            <div class="slideShowThumbs"><?php echo _('Thumbs'); ?></div>
        </div>
    </div>
</div>
