<div class="tuiyoTable">
	<div class="tuiyoTableRow">
		<div class="tuiyoTableCell" style="width: 50%">
			<div class="tuiyoColumn" id="tuiyoColumn1Pad">
	
			    <div class="pagePublisherTabs">
	                <ul class="publisherTabItems">
	                    <li style="padding: 0pt 20px;" type="personal" class="current"><a href="#"><span><?php echo _('Timeline')?></span></a></li>
						<li style="padding: 0pt 20px;" type="personalArticles"><a href="#" ><span><?php echo _('My Articles')?></span></a></li> 
	                </ul>
	             	<div class="tuiyoClearFloat"></div>
	             </div>
	             <div class="reporter"><jdoc:include type="message" /></div>
				<?php echo $this->activity ?>
				
			</div>
		</div>
		<div class="tuiyoTableCell" style="width: 50%">
			<div class="tuiyoColumn" id="tuiyoColumn2Pad">
				<div class="pagePublisherTabs">
	                <ul class="publisherTabItems" id="tabs1publisher">
	                    <li style="padding: 0pt 20px; position:relative" type="BrowseCategories"><a href="#"><span><?php echo _('Categories')?></span></a><div class="articleCatFilter"><?php displayAttributeNodeRow( $this->categories, 0 ) ?></div></li> 
	                  	<li style="padding: 0pt 20px;" type="composeNewArticle"><a href="#"><span><?php echo _('Write New')?></span></a></li>
	                </ul>
	             	<div class="tuiyoClearFloat"></div>
	             </div>
	             
	             
	             <div class="pageEl" id="BrowseCategories" style="display:none"></div>
	             
	             <!-- Community Articles -->
	             <div class="pageEl" id="communityArticles">
	             	<?php if(sizeof($this->allarticles)<1) :?>
	             		<div class="TuiyoNotification TuiyoInformation"><?php echo _('There are no articles to show. Check back again shortly')?></div>
	             	<?php endif ?>
	             	<?php foreach($this->allarticles as $article): ?>
	             	<div class="tuiyoTable activityStreamItem status" id="aid<?php echo $article->id ?>" style="">
	             		<div class="tuiyoTableRow">
	             			<div class="tuiyoTableCell col1img" style="width:10%;">
	             				<div class="activityStreamItemUserImage48">
	             					<img src="<?php echo $article->userpic ?>" width="48" height="48">
	             				</div>
	             			</div>
	             			<?php // print_R($this->allarticles)?>
	             			<div class="tuiyoTableCell col2body" style="width: 90%">
		             			<div class="activityStreamItemMainBody">
		             				<?php echo $article->title ?>
		             				<div class="bodyAttachmentPlaceHolder" style="display: none; cursor: pointer">view attachement</div>
		             				
		             				<div class="bodyDescr public " title="This entry is Public">
		             					<span class="descrInfo"> By </span>
		             					<a href="<?php echo JRoute::_(TUIYO_INDEX.'&view=profile&do=view&user='.$article->username ) ?>"><span><?php echo $article->username ?></span></a>
		             					<a class="statustime" href="#"><span><?php echo $article->datetime ?></span></a>  
		             					<span class="commentCount" style="float:right; margin-right: 10px"><?php echo sizeof($article->comments) ?> comments</span>
		             				</div>
		             			</div>
	             			</div>
	             			<div class="tuiyoClearFloat"></div>
	             		</div>
	             	</div>
	             	<?php endforeach; ?>
				 </div>
				 
				 <!-- Personal Articles -->
	             <div class="pageEl" id="personalArticles" style="display:none">
	             	<?php if($this->user->joomla->get('guest')) : ?>
	             		<div class="TuiyoNotification TuiyoError"><?php echo _('You need to be signed-in')?></div>
	             	<?php else :?>
	             		
	             	<?php if(sizeof($this->myarticles)<1) :?>
	             		<div class="TuiyoNotification TuiyoInformation"><?php echo _('There are no articles to show. Check back again shortly')?></div>
	             	<?php endif ?>
	             	<?php foreach($this->myarticles as $article): ?>
	             	<div class="tuiyoTable activityStreamItem status" id="aid<?php echo $article->id ?>" style="">
	             		<div class="tuiyoTableRow">
	             			<div class="tuiyoTableCell col1img" style="width:10%;">
	             				<div class="activityStreamItemUserImage48">
	             					<img src="<?php echo $article->userpic ?>" width="48" height="48">
	             				</div>
	             			</div>
	             			<?php // print_R($this->allarticles)?>
	             			<div class="tuiyoTableCell col2body" style="width: 90%">
		             			<div class="activityStreamItemMainBody">
		             				<?php echo $article->title ?>
		             				<div class="bodyAttachmentPlaceHolder" style="display: none; cursor: pointer">view attachement</div>
		             				
		             				<div class="bodyDescr public " title="This entry is Public">
		             					<span class="descrInfo"> By </span>
		             					<a href="<?php echo JRoute::_(TUIYO_INDEX.'&view=profile&do=view&user='.$article->username ) ?>"><span><?php echo $article->username ?></span></a>
		             					<a class="statustime" href="#"><span><?php echo $article->datetime ?></span></a>  
		             					<span class="commentCount" style="float:right; margin-right: 10px"><?php echo sizeof($article->comments) ?> comments</span>
		             				</div>
		             			</div>
	             			</div>
	             			<div class="tuiyoClearFloat"></div>
	             		</div>
	             	</div>
	             	<?php endforeach; ?>
	             	
	             	<?php endif ?>
				 </div>
	             
	             <div class="pageEl" id="composeNewArticle" style="display: none">
	             	<?php if($this->user->joomla->get('guest')) : ?>
	             		<div class="TuiyoNotification TuiyoError"><?php echo _('You need to be signed in to write to your blog')?></div>
	             	<?php else :?>
					<form name="TuiyoArticleUpdate" id="TuiyoArticleUpdate" class="TuiyoForm" action="<?php echo TUIYO_INDEX ?>" method="post">
				        <div class="homepagePublisherContainer">
				            <div class="tuiyoTable" style="background:none repeat scroll 0 0 #F5F5F5; border:1px solid #D8DFEA; padding:3px 6px 3px 3px;">		        		
				                <div class="tuiyoTableRow">
				                	<input type="text" class="TuiyoFormText" style="padding: 7px; width: 97%" value="" name="posttitle" />
				                </div>
				                <div class="tuiyoTableRow" >            	   
				                    <div class="tuiyoTableCell" style="width: 100%" >
				                        <textarea name="postcontent" id="postcontent" class="newarticle wysiwyg" style="margin-left: 4px" rows="20"></textarea>
				                    </div>               
				                    <div class="tuiyoClearFloat" ></div>
				                    <?php echo JHTML::_('form.token'); ?>
				                    <input type="hidden" name="option" value="com_tuiyo" />
				                    <input type="hidden" name="view" value="articles" />
				                    <input type="hidden" name="do" value="saveArticle" />
				                    <input type="hidden" name="ID" value="" />
				                    <input type="hidden" name="posttype" value="article" />
				                    <input type="hidden" name="author" value="<?php echo (int)$this->user->id ?>" />
				                </div>               
				            </div>
				        </div>
				        <!--Articles Tools--> 
				        <div class="dashBoardWidget" style="margin-top:10px">
		                	<div class="dashBoardWidgetBodySubHead"><?php echo _('Article Excerpt (required)') ?></div>
		                    <div class="dashBoardWidgetBody">
		                    	<textarea name="postexcerpt" id="postexcerpt" class="TuiyoFormTextArea"></textarea>
		                    </div>
		                </div>
		            	<div class="dashBoardWidget" style="margin-top:10px">
		                	<div class="dashBoardWidgetBodySubHead"><?php echo _('Meta-description') ?></div>
		                    <div class="dashBoardWidgetBody">
		    					<textarea name="meta-data" id="meta-data" rows="2" class="TuiyoFormTextArea"></textarea>
							</div>
		                </div>
		                <div class="dashBoardWidget" style="margin-top:10px">
		                	<div class="dashBoardWidgetBodySubHead"><?php echo _('Meta-Keywords') ?></div>
		                    <div class="dashBoardWidgetBody">
		    					<textarea name="meta-data" id="meta-data" rows="1" class="TuiyoFormTextArea"></textarea>
							</div>
		                </div>
		                <!--Articles Tools--> 
		            	<div class="dashBoardWidget" style="margin:10px 0">
		                	<div class="dashBoardWidgetBodySubHead"><?php echo _('Publish in Category') ?></div>
		                    <div class="dashBoardWidgetBody">
		                        <?php displayAttributeNodeRow( $this->categories, 0 ) ?>
							</div>
		                </div>
		                <div class="dashBoardWidget" style="margin:10px 0">
		                	<div class="dashBoardWidgetBodySubHead"><?php echo _('Robots') ?></div>
		                    <div class="dashBoardWidgetBody">
		                        <div class="tuiyoTableRow">
		                        	<input type="checkbox" name="robots[]" value="noindex"><span style="margin-right: 20px">noindex</span>
		                        	<input type="checkbox" name="robots[]" value="nofollow"><span style="margin-right: 20px">nofollow</span>
		                        	<input type="checkbox" name="robots[]" value="noarchive"><span style="margin-right: 20px">noarchive</span>
		                        </div>
							</div>
		                </div>
		                <div class="TuiyoNotification TuiyoInformation"><?php echo _('Article will be published after review by a moderator')?></div>
				        <div class="tuiyoTableRow" style="border-top: 1px solid #eee">
				        	<div class="tuiyoTableCell" style="width: 79%;">
				        		<div>&nbsp;</div>
							</div>
				            <div class="tuiyoTableCell" style="width: 21%; margin: 3px 0" align="right">
				            	<button type="submit"><?php echo _('Submit Article')?></button>
				            </div>
				            <div class="tuiyoClearFloat" ></div>
				        </div>         
				        <div id="attachable" style="display: none">&nbsp;</div> 
				    </form> 
				    <?php endif; ?>
			    </div>
			</div>
		</div>
		<div style="clear:both"></div>
	</div>
</div>


<?php 
function displayAttributeNodeRow( $nodes, $index = 0 ){
	
	foreach($nodes as $node) :?>
													
       	<div style="padding: 5px 0pt;" class="tuiyoTableRow fieldListItem">
      		<div style="width: 5%;" class="tuiyoTableCell clickToMove iText"><input type="checkbox" name="categories[]" value="<?php echo $node['id']?>" /></div> <!---//user id -->
            <div style="width: 95%; white-space: nowrap; overflow:hidden" class="tuiyoTableCell">
            	<?php for($i=0; $i<$index+1; $i++) :?><a class="indenter">&nbsp;</a><?php endfor;?><a href="#"><?php echo $node['title']; ?></a> - <span style="white-space: nowrap; overflow: hidden"><?php echo $node['description'] ?></span>
            </div> <!---//user name -->
         	<div class="tuiyoClearFloat"></div>
        </div>
        
        <?php if(count((array)$node['children']) > 0) displayAttributeNodeRow($node['children'], $index+1)?>
         
	<?php endforeach;	
}
?>
