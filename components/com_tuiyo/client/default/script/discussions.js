(function($){
	$(document).ready(function(){
		$("ul.publisherTabItemsSub li").each(function(i) {
            $(this).unbind('click').click(function(e) {
                e.preventDefault();
                var updateType  = $(this).attr('type') ;
                var updateTitle = $(this).find("span:first").text();
                $("ul.publisherTabItems li.current").find("span:first").text(updateTitle);
                
                $("ul.publisherTabItemsSub li.currentsub").removeClass("currentsub");
                $(this).addClass('currentsub');
                $(this).prependTo( $("ul.publisherTabItemsSub") );
                $("#TuiyoStreamUpdate").find("input[name=type]").val( updateType );
                $("#userActivityStream").html('<img src="components/com_tuiyo/client/default/images/loading2.gif" style="margin-top: 8px" />' );
                $("#userActivityStream").TuiyoStreamLoad({'filter': updateType });
                $("#streamPagination").remove();
            });
        });
		$("#userActivityStream").TuiyoStream();
		$("#userActivityStream").TuiyoStreamLoad();	
	});
})(jQuery);