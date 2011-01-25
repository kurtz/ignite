(function($){
	
	$(document).ready(function(){
		var 	//--------------------------------------
		//  OPENTOK EVENT HANDLERS
		//--------------------------------------

		sessionConnectedHandler = function(event) {
			// Subscribe to all streams currently in the Session
			for (var i = 0; i < event.streams.length; i++) {
				console.log(event.streams[i].streamId);
				addStream(event.streams[i]);
			}
		},
		streamCreatedHandler  = function(event) {
			// Subscribe to these newly created streams
			for (var i = 0; i < event.streams.length; i++) {
					console.log(event.streams[i].streamId);
				addStream(event.streams[i]);
			}
		},
		streamDestroyedHandler = function(event) {
			// This signals that a stream was destroyed. Any Subscribers will automatically be removed. 
			// This default behaviour can be prevented using event.preventDefault()
		},
		sessionDisconnectedHandler = function(event) {
			// This signals that the user was disconnected from the Session. Any subscribers and publishers
			// will automatically be removed. This default behaviour can be prevented using event.preventDefault()
			publisher = null;
		},
		connectionDestroyedHandler = function(event) {
			// This signals that connections were destroyed
		},
		connectionCreatedHandler = function(event) {
			// This signals new connections have been created.
		},

		/* 
		If you un-comment the call to TB.setEventLister(), above, OpenTok 
		calls the exceptionHandler() method when exception events occur. 
		You can modify this method to further process exception events.
		If you un-comment the call to TB.setLogLevel(), above, OpenTok 
		automatically displays exception event messages. 
		*/
		exceptionHandler = function(event) {
			alert("Exception: " + event.code + "::" + event.message);
		},

		//--------------------------------------
		//  HELPER METHODS
		//--------------------------------------

		addStream = function(stream) {
			// Check if this is the stream that I am publishing. If not
			// we choose to subscribe to the stream.
			if (stream.connection.connectionId == session.connection.connectionId) {
				return;
			}
			var div = $('<div />');	// Create a replacement div for the subscriber
			var divId = stream.streamId;	// Give the replacement div the id of the stream as its id
			$(div).attr('id', divId).prependTo( $("#videoframe") );
			
			var divProps = {width: 154, height:150, audioEnabled:true};
			subscribers[stream.streamId] = session.subscribe(stream, divId, divProps);

		};

		$("ul#publisherHp1 li").each(function(i) {
            $(this).unbind('click').click(function(e) {
                //e.preventDefault();
                $("ul#publisherHp1 li.current").removeClass('current');
                $(this).addClass('current');
            });
        });
		
		$("ul#publisherHp1 li:last").click();
		
		//IF we are in a stream, check for video streams;
		var inChatRoom = $('meta[name="opentokapikey"]').attr("content");
		var chatRoomID = $('meta[name="chatroomid"]').attr("content");
		if(inChatRoom){
			
			$("#userActivityStream").TuiyoStream();
			$("#userActivityStream").TuiyoStreamLoad({realTime:true, loadInterval: $("input.range").val(),channel:chatRoomID, forceTag:chatRoomID});
			
			//Update the timer every
			$(":range").rangeinput();
			//$("input.range").tooltip();
			$("input.range").bind("change",function(e){
				//alert($(this).val());
				//$("#userActivityStream").TuiyoStream();
				$("#userActivityStream").TuiyoStreamLoad({realTime:true, loadInterval: $("input.range").val(),channel:chatRoomID,forceTag:chatRoomID});
			})
			
			var apiKey = inChatRoom; 
			var sessionId = $('meta[name="opentoksessionid"]').attr("content"); 
			var token = $('meta[name="opentoksessiontoken"]').attr("content");

			var session;
			var publisher = null;
			var subscribers = {};
	 
			// TB.setLogLevel(TB.DEBUG);
			if (TB.checkSystemRequirements() != TB.HAS_REQUIREMENTS) {
			    alert('Minimum System Requirements for video chat not met!');
			}else{ 
				//InitializeSession
				session = TB.initSession( sessionId );
				
				// Add event listeners to the session
				session.addEventListener('sessionConnected', sessionConnectedHandler);
				session.addEventListener('sessionDisconnected', sessionDisconnectedHandler);
				session.addEventListener('connectionCreated', connectionCreatedHandler);
				session.addEventListener('connectionDestroyed', connectionDestroyedHandler);
				session.addEventListener('streamCreated', streamCreatedHandler);
				session.addEventListener('streamDestroyed', streamDestroyedHandler);
			
				//Connecting to the Chat
				$(".connectToFeed").toggle( function(e) {
					e.preventDefault();
				    session.connect(apiKey, token);

					$('<div id="opentok_publisher" style="margin:4px"></div>').prependTo( $("#videoframe") );
					
					$(this).html( 'Disconnect' );
					$('.publishToFeed').show();
				},function(e){
					e.preventDefault();
					session.disconnect();
					$('#opentok_publisher').remove();
					$('.publishToFeed').hide();
					$(this).html( 'Connect' );
				});
					
				//Publishing to the Chat
				$(".publishToFeed").toggle( function(e) {
					e.preventDefault();
					if (!publisher) {
						var divProps = {width: 154, height:150, audioEnabled:true, name: $.TuiyoDefines.get('username')+" stream"}
						publisher = session.publish('opentok_publisher', divProps); 	
					}
				    //session.connect(apiKey, token);
					$(this).html( 'UnPublish' );
				},function(e){
					e.preventDefault();
					if (publisher) {
						session.unpublish( publisher );
					}
					publisher = null;
					$(this).html( 'Publish' );
				});
				$(".connectToFeed").trigger("click");
			}
		}else{
			$("#userActivityStream").TuiyoStream();
			$("#userActivityStream").TuiyoStreamLoad();
		}
	});
	
})(jQuery);

