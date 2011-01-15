<?php  defined('TUIYO_EXECUTE' ) || die; ?>
<div id="w1" class="windowWrapperShadow">
    <div class="windowWrapper">
        <div class="window" style="background: #fff">
            <div class="windowTitleBar">
                <img src="<?php echo $iconPath ?>/icons/category.png" alt="hpact16" style="cursor: pointer" />
                <strong><?php echo _('Global System Categories'); ?></strong>
            </div>
            <div class="windowBody" style="padding: 18px; margin-top: 5px;">
            	<div class="tuiyoTable">
                	<div class="tuiyoTableRow">
                    	<div class="tuiyoTableCell" style="width: 100%;">
                            <div class="viewCatDirs pageEl tuiyoTable">
                         		<div style="padding: 5px 0pt;" class="tuiyoTableHeaderRow">
                                 	<div style="width: 4%;" class="tuiyoTableCell">&nbsp;</div> <!---//user id -->
                                		<div style="width: 40%;" class="tuiyoTableCell">Name</div> <!---//user name -->
                               		<div style="width: 10%;" class="tuiyoTableCell">Slug</div> <!---//user email -->
                    					<div style="width: 25%;" class="tuiyoTableCell">Description</div> <!---//permission level -->
                                   	<div style="width: 5%;" class="tuiyoTableCell" align="center">Status</div> <!---//Edit -->
                                  	<div style="width: 5%;" class="tuiyoTableCell" align="center">ID</div> <!---//delete -->
                                 	<div style="width: 5%;" class="tuiyoTableCell" align="center">Creator</div> <!---//Active -->
                                 	<div style="width: 6%;" class="tuiyoTableCell">&nbsp;</div>
                                 	<div class="tuiyoClearFloat"></div>
                             	</div> 
                             	<!-- Lists Items -->
									<?php displayNodeRow( $nodes ) ?>
                             </div>
                        </div>
                        <div class="tuiyoClearFloat"></div>
                	</div>
                </div>
			</div>
        </div>
    </div>
</div>

<?php 

function displayNodeRow( $nodes, $index = 0 ){
	
	foreach($nodes as $node) :?>
													
       	<div style="padding: 5px 0pt;" class="tuiyoTableRow fieldListItem">
      		<div style="width: 4%;" class="tuiyoTableCell clickToMove iText">&nbsp;</div> <!---//user id -->
            <div style="width: 40%;" class="tuiyoTableCell">
            	<?php for($i=0; $i<$index+1; $i++) :?><a class="indenter">a</a><a href="#"><?php endfor; echo $node['title']; ?></a> 
            </div> <!---//user name -->
        	<div style="width: 10%;" class="tuiyoTableCell"><a href="#"><?php echo $node['slug']?></a></div> <!---//user email -->
          	<div style="width: 25%; overflow: hidden" class="tuiyoTableCell"><nobr><?php echo $node['description']?></nobr></div> <!---//permission level -->
      		<div style="width: 5%;" class="tuiyoTableCell iText <?php if((int)$node["status"] > 0):?> tick <?php else:?> notick <?php endif; ?>" align="center">&nbsp;</div> <!---//Edit -->
         	<div style="width: 5%;" class="tuiyoTableCell" align="center"><?php echo $node['id']?></div> <!---//delete -->
          	<div style="width: 5%;" class="tuiyoTableCell" align="center"><?php echo $node['creator']?></div> <!---//Active -->
         	<div style="width: 6%;" class="tuiyoTableCell clickToRemove iText">&nbsp;</div>
         	<div class="tuiyoClearFloat"></div>
        </div>
        
        <?php if(count((array)$node['children']) > 0) displayNodeRow($node['children'], $index+1)?>
         
	<?php endforeach;	
}
?>