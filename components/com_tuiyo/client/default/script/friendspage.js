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
                var pageEl = $(this).attr('id') ;
                $("div.pageEl").hide();
                $("div."+pageEl).show();
            });
        });
		$("ul#publisherHp2 li").each(function(i) {
            $(this).unbind('click').click(function(e) {
                e.preventDefault();
                $("ul#publisherHp2 li.current").removeClass('current');
                $(this).addClass('current');
                var pageEl = $(this).attr('id') ;
                $("div.pageElLeft").hide();
                $("div."+pageEl).show();
                
            });
        });
	});
})(jQuery);
