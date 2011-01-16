(function($){
	$.fn.TwitterService = function( method ){
		var methods = {
			"init":function(options){
				
			},
			"install":function(){
				$("button[name=twitterFormSubmitButton]").html("Connect with Twitter");
				
				
				
				$("form[name=twitterInstallerForm]").unbind('submit').bind('submit', function(e){
					e.preventDefault();
					var $form 	 = $(this),
						$authURL = "";
					
					$.getJSON('index.php', {'option':'com_tuiyo','view':'services','service':'twitter','do':'getAuthToken','format':'json'}, function(response){
						
						$authURL 		= response.data;
						$authInterval 	= 0;
						
						//alert($authURL);
						
						var $twitterAuthWindow = window.open($authURL, "TwitterAuth", "menubar=0,resizable=1,width=550,height=450,location=0");
						
						wleft = ($(window).width()-550) / 2;
						wtop = ($(window).height()-450) / 2;
						  
						$twitterAuthWindow.moveTo(wleft, wtop);
						$authInterval = window.setInterval(function(){
							var $location   = $twitterAuthWindow.location.href+"";
							var $isInternal = $location.search( $.TuiyoDefines.get("siteDomain") );
							var $hasVerifier = $.getUrlParam('oauth_verifier', $location);
				            if ( $hasVerifier !== 0) {
				            
				                $twitterAuthWindow.close();
				                window.clearInterval( $authInterval );
				                
				                var $oauth_token = $.getUrlParam('oauth_token',$location),
			                		$oauth_verifier =  $.getUrlParam('oauth_verifier',$location),
			                		$oauth_username ="";
				                $('<input type="hidden" name="temporary[oauth_token]" value="'+response.token+'" />').appendTo( $form );
				                $('<input type="hidden" name="temporary[oauth_token_secret]" value="'+response.secret+'" />').appendTo( $form );
				                $('<input type="hidden" name="params[oauth_token]" value="'+$oauth_token+'" />').appendTo( $form );
				                $('<input type="hidden" name="params[oauth_verifier]" value="'+$oauth_verifier+'" />').appendTo( $form );
			                
				                $.post( $form.attr('action'), 
				                		$form.serialize(),
				                		function(jsonResponse){
				                	if(jsonResponse.code !== 200){ 
				                		alert('Could not add the twitter Service') 
									}else{
										$.facebox.close();
										$("div.hldr_twitter").prependTo( $("#myServices") ).find("a.addService").text('Remove').removeClass('addService').addClass('removeService').unbind('click').bind('click', methods.uninstall );
									}
								},'json');
				            }
				        }, 500);
						
					});
					
					
					//$.post($form.attr('action'), $form.serialize(),function(jsonResponse){
						//if(jsonResponse.code !== 200){ alert('Could not add the twitter Service') 
							//}else{
								//$.facebox.close();
								//$("div.hldr_twitter").prependTo( $("#myServices") ).find("a.addService").text('Remove').removeClass('addService').addClass('removeService').unbind('click').bind('click', methods.uninstall );
							//}
					//},'json');
					
					//alert('fultang');
				})
			},
			"uninstall":function(){
				var $indexURL = $.TuiyoDefines.get('componentIndex'),
					$token 	  = $.TuiyoDefines.get('token');
				$.post($indexURL+'&'+$token+'=1',{'controller':'services','service':'twitter','do':'remove','format':'json'},
					function(response){
						if(response.code !== 200){ 
							alert('Could not remove the Service') 
						}else{
							$("div.hldr_twitter").remove();
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