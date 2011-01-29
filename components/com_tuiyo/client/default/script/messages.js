/**
 * @author Livingstone
 */
(function($) {
	$(document).ready(function(){
		$("ul#publisherHp1 li").each(function(i) {
            $(this).unbind('click').click(function(e) {
                e.preventDefault();
                $("ul#publisherHp1 li.current").removeClass('current');
                $(this).addClass('current');
				var options = {};
				var option 	= $(this).attr("option"),
					value 	= $(this).attr("optionvalue")
				;
				switch(option){
					case "filterType":
						options = { filter : value , usertimeline : $.TuiyoDefines.get("userid") };
						$("#privateMessageTools").show();
					break;
					default:
						$("#privateMessageTools").hide();
					break;
				}
				$("input.range").val(0);
				$("#userActivityStream").TuiyoStreamClear();
                $("#userActivityStream").html('<img src="components/com_tuiyo/client/default/images/loading2.gif" style="margin-top: 8px" />' );
                $("#userActivityStream").TuiyoStreamLoad(options);
            });
        });
		$("#userActivityStream").TuiyoStream();
		$("#TuiyoStreamUpdate").find("input[name=type]").val( "private" );
		$("span.shareWith").remove();
		$("#userActivityStream").TuiyoStreamLoad();
		$(":range").rangeinput();
		//$("input.range").tooltip();
		$("input.range").bind("change",function(e){
			//alert($(this).val());
			//$("#userActivityStream").TuiyoStream();
			$("#userActivityStream").TuiyoStreamLoad({realTime:true, loadInterval: $("input.range").val()});
		});
	})
})(jQuery);
