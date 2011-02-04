(function($){
	$.fn.FacebookService = function( method ){
		var methods = {
			"init":function(options){
				//alert('facebook Plugin Init');
				$('#fb-root').remove();
				$('<div id="fb-root" />').prependTo( $("body") );
				$.getScript('http://connect.facebook.net/en_US/all.js', function(){
					var $indexURL = $.TuiyoDefines.get('componentIndex'),
						$token	  = $.TuiyoDefines.get('token');
					$.post( $indexURL+'&'+$token+'=1',{'view':'services','service':'facebook','do':'getAppKey','format':'json'}, function(response){
						FB.init({ apiKey: response.data });
					},'json' );
				});
			},
			"install":function(){
				$("button[name=facebookFormSubmitButton]").html("<span>&nbsp;</span>").css({
					'background':'transparent url("components/com_tuiyo/plugins/facebook/fb-connect-large.png") scroll 0 0 no-repeat',
					'border':'medium none',
			    	'height':'40px',
			    	'cursor':'pointer',
			    	'width':'300px'
				});
				$("button[name=facebookFormSubmitButton]").bind('click',function(e){
					e.preventDefault();
					FB.login(function(response){
						if(response.session){
							var $form =  $("form[name=facebookInstallerForm]");
							//alert(FB.getSession().access_token);
							$('<input type="hidden" name="params[fbid]" value="'+FB.getSession().uid+'" />').appendTo( $("form[name=facebookInstallerForm]") );
							$('<input type="hidden" name="params[access_token]" value="'+response.session.access_token+'" />').appendTo( $("form[name=facebookInstallerForm]") );
							$.post($form.attr('action'), $form.serialize(),function(jsonResponse){
								if(jsonResponse.code !== 200){ alert('Could not add the Facebook Service') 
									}else{
										$.facebox.close();
										$("div.hldr_facebook").prependTo( $("#myServices") ).find("a.addService").text('Remove').removeClass('addService').addClass('removeService').unbind('click').bind('click', methods.uninstall );
									}
							},'json');
						}else{
							alert('could not add the Facebook Service');
						}
					},{perms:'read_stream,publish_stream,offline_access,user_photos,user_videos'});
				});
			},
			"uninstall":function(){
				var $indexURL = $.TuiyoDefines.get('componentIndex'),
					$token	  = $.TuiyoDefines.get('token');
				$.post($indexURL+'&'+$token+'=1',{'controller':'services','service':'facebook','do':'remove','format':'json'},
					function(response){
						if(response.code !== 200){ alert('Could not remove the Facebook Service') 
						}else{
							$("div.hldr_facebook").remove();
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