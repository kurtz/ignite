/**
 * @author Livingstone
 */
(function($){
	$(document).ready(function(){

		
		$("#userActivityStream").TuiyoStream();
		$("#userActivityStream").TuiyoStreamLoad();
		
		$("ul.publisherTabItems li").click(function(a){
			a.preventDefault();
            $("ul.publisherTabItems li").removeClass('current');
            $(this).addClass('current');
            $("div.pageEl").hide();
            $("div."+$(this).attr("id") ).show();
		});

        //AJAX Events
        $("#TuiyoAjaxLoading").ajaxStart(function() {
            $(this).show();
        });		
        $("#TuiyoAjaxLoading").unbind('ajaxStop').ajaxStop(function() {
            $(this).hide();
		 	$('a[rel*=facebox]').unbind('facebox').facebox();
			$('input.childSelector').change(function(){
				if(this.checked)
					$( $(this).parent()).parent().addClass( "selectedRow");
				else	
					$( $(this).parent() ).parent().removeClass("selectedRow");
			});
			$("input#masterCheckBox").click(function(){
				var checked_status = this.checked;
				$('input.childSelector').each(function(){
					this.checked = checked_status;
					if(this.checked)
						$( $(this).parent()).parent().addClass( "selectedRow");
					else	
						$( $(this).parent() ).parent().removeClass("selectedRow");
				});
			});	
        });		
		//Trigger Hash Events;
		if(window.location.hash !== '' ){
			//alert( $("a[rel='"+(window.location.hash).substring(1)+"']").parent()  );
			$( $("a[rel='a"+(window.location.hash).substring(1)+"']").parent() ).trigger( "click" );
		}
	});
})(jQuery);