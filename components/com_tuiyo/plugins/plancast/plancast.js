(function($){
	$.fn.PlancastService = function( method ){
		var methods = {
			"init":function(options){
				
			},
			"install":function(){
				$("button[name=plancastFormSubmitButton]").html("Connect with Plancast");
				$("form[name=plancastInstallerForm]").unbind('submit').bind('submit', function(e){
					e.preventDefault();
					var $form = $(this);
					$.post($form.attr('action'), $form.serialize(),function(jsonResponse){
						if(jsonResponse.code !== 200){ alert('Could not add the plancast Service') 
							}else{
								$.facebox.close();
								$("div.hldr_plancast").prependTo( $("#myServices") ).find("a.addService").text('Remove').removeClass('addService').addClass('removeService').unbind('click').bind('click', methods.uninstall );
							}
					},'json');
					
					//alert('fultang');
				})
			},
			"uninstall":function(){
				var $indexURL = $.TuiyoDefines.get('componentIndex'),
					$token 	  = $.TuiyoDefines.get('token');
				$.post($indexURL+'&'+$token+'=1',{'controller':'services','service':'plancast','do':'remove','format':'json'},
					function(response){
						if(response.code !== 200){ 
							alert('Could not remove the Service') 
						}else{
							$("div.hldr_plancast").remove();
						}
					
				},'json');
			}
		};
		//Call Methods
		if ( methods[method] ) {
		   methods.init.apply(this, arguments);	
	       return methods[ method ].apply( this, Array.prototype.slice.call( arguments, 1 ));
	    } else if ( typeof method === 'object' || ! method ) {
	       return methods.init.apply( this, arguments );
	    } else {
	      $.error( 'Method ' +  method + ' does not exist on this service' );
	    }    
	}
})(jQuery);