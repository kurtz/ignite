(function($){
	$(document).ready(function(){

		//Plugin Editor;
		$("select[name=plugintoedit]").bind("change",function(e){
			e.preventDefault();
			var $value = $(this).val();
			window.location.href = window.location.href + "&plugin="+$value;
			return;
		});

		if(window.location.hash !== '' ){
			//alert( $("a[rel='"+(window.location.hash).substring(1)+"']").parent()  );
			$( $("a[rel='a"+(window.location.hash).substring(1)+"']").parent() ).trigger( "click" );
		}
		
	});
})(jQuery)
