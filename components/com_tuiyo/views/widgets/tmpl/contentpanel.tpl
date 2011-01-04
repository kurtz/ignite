<div class="tuiyoTable" id="contentPanel" style="width: 70%; padding: 0;">
    <div class="tuiyoTableRow" style="width: 80%; margin: 0 auto; padding: 20px;">
    	<?php if(sizeof($widgets)<1):?>
    		<div class="TuiyoNotification TuiyoInformation"><?php echo _('There are no widgets to display')?></div>
    	<?php endif; ?>
		<?php foreach($widgets as $widget) : ?>
    	<div class="tuiyoTableCell tuiyoWidgetListItem" style="width: 25%;">
        	<div class="tuiyoTable" style="padding: 4px">
            	<div class="tuiyoTableRow">
                	<div class="tuiyoTableCell" style="width: 25%">
                    	<a href="#" class="addWidget" rel="<?php echo $widget['file'] ?>" title="<?php echo $widget['title'] ?>">
                        	<img src="<?php echo $widget['screenshot'] ?>" /></a>
                    </div>
                	<div class="tuiyoTableCell" style="width: 75%""><span style="color: #ccc"><?php echo $widget['description'] ?></span></div>
                    <div class="tuiyoClearFLoat"></div>
                </div>
            </div>
        </div>
        <?php endforeach; ?>
      	<div class="tuiyoClearFloat">&nbsp;</div>
      	<button id="closeContentPanel"><?php echo _("I'm done adding widgets"); ?></button>
    	<div class="tuiyoClearFloat"></div>
    </div>         
</div>