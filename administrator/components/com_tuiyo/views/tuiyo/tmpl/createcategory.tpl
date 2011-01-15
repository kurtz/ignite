<?php  defined('TUIYO_EXECUTE' ) || die; ?>
<div id="w1" class="windowWrapperShadow">
    <div class="windowWrapper">
        <div class="window" style="background: #fff">
            <div class="windowTitleBar">
                <img src="<?php echo $iconPath ?>/icons/category.png" alt="hpact16" style="cursor: pointer" />
                <strong><?php echo _('Create a new category'); ?></strong>
            </div>
            <div class="windowBody" style="padding: 18px; margin-top: 5px;">
				<div class="tuiyoTable" style="width: 70%">
					<!-- Create a new  form-->
            		<form name="configureStatistics" id="configureStatistics" method="post" class="TuiyoForm" action="index2.php" >
            		<fieldset>
					<div class="tuiyoTableRow" style="padding: 4px 0">
                    	<div class="tuiyoTableCell" style="width: 35%">Name</div>
                        <div class="tuiyoTableCell" style="width: 65%">
                        	<input type="text" name="cattitle" id="cattitle" class="TuiyoFormText"  placehoder="Short descriptive name for your category"/>
                        </div><div class="tuiyoClearFloat"></div>
                    </div>
            		<div class="tuiyoTableRow" style="padding: 4px 0">
                    	<div class="tuiyoTableCell" style="width: 35%">Slug</div>
                        <div class="tuiyoTableCell" style="width: 65%">
                        	<input type="text" name="catslug" id="catslug" class="TuiyoFormText" placeholder="Short alias for your category, used in url and search" />
                        </div><div class="tuiyoClearFloat"></div>
                    </div>
                    <div class="tuiyoTableRow" style="padding: 4px 0">
                    	<div class="tuiyoTableCell" style="width: 35%">Status</div>
                        <div class="tuiyoTableCell" style="width: 65%">
                        	<select name="catstatus" id="catstatus" class="TuiyoFormDropDown" >
                        		<option value="0">Not-publish  </option>
                        		<option value="1">Publish </option>
                        	</select><br />
                        </div><div class="tuiyoClearFloat"></div>
                    </div>
            		<div class="tuiyoTableRow" style="padding: 4px 0">
                    	<div class="tuiyoTableCell" style="width: 35%">Parent</div>
                        <div class="tuiyoTableCell" style="width: 65%">
                        	<select name="catpid" id="catpid" class="TuiyoFormDropDown" >
                        		<option value="0">No parent</option>
                        		<?php displayNodeSelectOptions( $nodes )?>
                        	</select><br />
                        </div><div class="tuiyoClearFloat"></div>
                    </div>
                    <div class="tuiyoTableRow" style="padding: 4px 0">
                    	<div class="tuiyoTableCell" style="width: 35%">Description</div>
                        <div class="tuiyoTableCell" style="width: 65%">
                        	<textarea  name="catdescription" id="catdescription" class="TuiyoFormTextArea" placeholder="Describe your category in one line"></textarea>
                        </div><div class="tuiyoClearFloat"></div>
                    </div>
                    <div class="tuiyoTableRow" style="padding: 4px 0">
                    	<div class="tuiyoTableCell" style="width: 35%">Permission</div>
                        <div class="tuiyoTableCell" style="width: 65%">
                        	<?php echo $arogrps ; ?><br />
                        </div><div class="tuiyoClearFloat"></div>
                    </div>
                                                            
            		<div class="tuiyoTableRow" style="padding: 4px 0">
                    	<div class="tuiyoTableCell" style="width: 35%">&nbsp;</div>
                        <div class="tuiyoTableCell" style="width: 65%">
                        	<button type="submit" id="gasubmit" value="gasubmit">Save categories</button>
                        </div><div class="tuiyoClearFloat"></div>
                    </div>
              		<?php echo JHTML::_('form.token') ?>
                    <input type="hidden" name="option" value="com_tuiyo" />
                    <input type="hidden" name="context" value="tuiyo" />
                    <input type="hidden" name="do" value="addNewCategory" />
                    <input type="hidden" name="a" value="" />
					<fieldset>
                </form>
				</div>
			</div>
		</div>
	</div>
</div>
<?php

function displayNodeSelectOptions( $nodes , $index=0){
		foreach($nodes as $node) :?>													
       	<option value="<?php echo $node["id"] ?>" style="padding-left:<?php echo (($index)*20) ?>px"><?php echo $node['title']; ?> </option>        
        <?php if(count((array)$node['children']) > 0) displayNodeSelectOptions($node['children'], $index+1);
        endforeach;
}

?>