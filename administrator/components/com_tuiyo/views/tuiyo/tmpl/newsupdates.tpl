<?php  defined('TUIYO_EXECUTE' ) || die; 


$tweets 	= JFactory::getXMLParser("rss", array("rssUrl"=>$twitterURL) );
$tweetFeed   = $tweets->get_items(); 

//$commits 	=  JFactory::getXMLParser("rss", array("rssUrl"=>$twitterURL) );
$commitsFeed = array(); 




?>
<div id="w1" class="windowWrapperShadow">
    <div class="windowWrapper">
        <div class="window" style="background: #fff">
            <div class="windowTitleBar">
                <img src="<?php echo $iconPath ?>/icons/feeds_16.png" alt="hpact16" style="cursor: pointer" />
                <strong><?php echo _('News and Updates'); ?></strong>
            </div>
            <div class="windowBody" style="padding: 18px; margin-top: 5px;">
				<div class="tuiyoTable">
					<div class="tuiyoTableRow">
						<div class="tuiyoTableCell" style="width: 50%">
							<div class="rssWindow" style="border: 1px solid #ccc">
								<div class="rssWindowContainer" style="border: 5px solid #eee;">
									<div class="tuiyoTableHeaderRow" style="padding: 10px;"><a href="http://twitter.com/com_tuiyo">Follow @com_tuiyo on twitter</a> </div>
									<div class="feeds" style="padding: 4px; overflow-y: scroll; min-height: 600px; max-height: 700px">
										<ul style="display: block;">
										<?php $i=0; foreach($tweetFeed as $tweet): if($i>=21){break;} ?>
											<li class="tweet" style="list-style: circle; display: block; margin: 5px 0; padding: 10px 8px; border-bottom: 1px solid #eee"><span style="font-weight: bold">(<?php echo TuiyoTimer::diff( strtotime($tweet->get_date('Y-M-d H:i:s')  ) ) ?>) </span><a href="<?php echo $tweet->get_link() ?>"><?php echo $tweet->get_title()  ?></a></li>
										<?php $i++; endforeach ?>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="tuiyoTableCell" style="width: 50%">
							<div class="rssWindow" style="border: 1px solid #ccc; margin-left: 15px">
								<div class="rssWindowContainer" style="border: 5px solid #eee;">
									<div class="tuiyoTableHeaderRow" style="padding: 10px;"><a href="http://twitter.com/drstonyhills">Follow @drstonyhills on twitter</div>
									<div class="tweets" style="padding: 4px; min-height: 600px; overflow-y: scroll; max-height: 700px">
										<?php $i=0; foreach($commitsFeed as $tweet): if($i>=21){break;} ?>
											<li class="tweet" style="list-style: circle; display: block; margin: 5px 0; padding: 10px 8px; border-bottom: 1px solid #eee"><span style="font-weight: bold">(<?php echo TuiyoTimer::diff( strtotime($tweet->get_date('Y-M-d H:i:s')  ) ) ?>) </span><a href="<?php echo $tweet->get_link() ?>"><?php echo $tweet->get_title()  ?></a></li>
										<?php $i++; endforeach ?>
									</div>
								</div>
							</div>							
						</div>
						<div class="tuiyoClearFloat"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>