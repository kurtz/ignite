(function($){
	
	$(document).ready(function(){
		
		$("ul#publisherHp1 li").each(function(i) {
            $(this).unbind('click').click(function(e) {
                e.preventDefault();
                $("ul#publisherHp1 li.current").removeClass('current');
                $(this).addClass('current');
            });
        });
		
		$("ul#publisherHp1 li:last").click();
		
		$("#userActivityStream").TuiyoStream();
		$("#userActivityStream").TuiyoStreamLoad();
		
	
	});
	
})(jQuery);