(function($){
	var TuiyoStream = function(){
		var
			defaults = {
				enablePlugins : true,
				includefilters : false,
				paginateItems : true,
				clearPrevious: true,
				limitstart: 0 ,
				groupID : null,
				userID: null,
				//channel : null,
				loadInterval : 0,
				realTime : false,
				sinceID : 0,
				profileID : null,
				articleID : null,
				animateBackgroundColor: null, //'#FBF9EA'
				resourceID : null,
				postFormId: "TuiyoStreamUpdate",
				attachmentCnfg : {embedMethod: "fill", maxWidth: 400, maxHeight: 400, vimeo: {color: "000000", portrait: false}}
			},
			intervalCounter = null,
			loadedPlugins = [],
			findMentions = function( text ){
							
		        var regExp = /[\@]+([A-Za-z0-9-_]+)/gi;
		        var mention= text.replace(regExp,"<a class=\"activityProfile\" href=\""+$.TuiyoDefines.get("profilelink")+"&user=$1\">@$1</a>") ;
			
				return mention;
			},
			newActivityTmpl = function(activity){
                return $('<div class="tuiyoTable activityStreamItem activityItem" style="position:relative" ></div>').attr("id", "s"+activity.id).appendDom([
               {tagName: 'div', className: 'tuiyoTableRow',childNodes: [
                   {tagName: 'div',className: 'tuiyoTableCell col1img', style:'width:10%;',childNodes: [
                       {tagName: 'div',className: 'activityStreamItemUserImage48',childNodes: [ 
                           {tagName: 'img', src:activity.userpic, width: '48', height:'48'}
                       ]}
                   ]}, 
                   {tagName: 'div',className: 'tuiyoTableCell col2body',style: 'width: 90%',childNodes: [
                       {tagName: 'div',className: 'activityStreamItemActivityBody',childNodes: [
                           {tagName: 'div',className: 'activityStreamItemTools',align: 'center',childNodes: [
                               {tagName:'a', className:'voteLike', href:'#', style:'', innerHTML: $.gt.gettext(' like '), click:function(e){
                                   e.preventDefault();
                                   var self = $(this);
                                   var token = $("meta[name=_token]").attr("content") ;
                                   $.post('index.php?option=com_tuiyo&'+$("meta[name=_token]").attr("content")+'=1',
                                       {'do':'addVote', 'format':'json', 'controller':'timeline', 'sid': activity.id , 'svt':+1, token:'1' }, 
                                       function(inResponse){
                                    	   $("div#s"+activity.id ).find("a.votes").trigger( "click" );
                                           var divBox = $("div#s"+activity.id ).find("div.likes:eq(0)");
                                           
                                           $(divBox).appendDom( voterLinks([{"userID":inResponse.userID, "userPic":inResponse.userPic }] , activity.id) );
                                       },
                                   'json');
                               } },
                               {tagName:'a', className:'voteDisLike', href:'#', style:'', innerHTML:$.gt.gettext(' dislike '), click:function(e){
                                   e.preventDefault();
                                   var self = $(this);
                                   var token = $("meta[name=_token]").attr("content") ;
                                   $.post('index.php?option=com_tuiyo&'+$("meta[name=_token]").attr("content")+'=1',
                                       {'do':'addVote', 'format':'json', 'controller':'timeline', 'sid': activity.id , 'svt':-1 , token:'1' }, 
                                       function(inResponse){
                                    	   $("div#s"+activity.id ).find("a.votes").trigger( "click" );
                                           var divBox = $("div#s"+activity.id ).find("div.dlikes:eq(0)");
                                           $(divBox).appendDom( voterLinks([{"userID":inResponse.userID, "userPic":inResponse.userPic }] , activity.id ) );
                                       },
                                   'json');                                        
                               }},
                               {tagName: 'a',href: '#',className: 'comment',innerHTML: 'comment', rel:'ccomment', click:function(c){
                                   c.preventDefault();
                                   if(!activity.cancomment) return false;
                                   $("div.commenterDiv").remove();
                                   $( $('<div class="stupidInternetExplorer"></div>').appendDom([
                                       {tagName:'div', className:'commenterDiv', childNodes:[
                                           { tagName:'form', name:'commentForm'+activity.id, id:'commentForm'+activity.id, action:'index.php', 
                                             method:'post', className:'TuiyoForm commentForm', submit:function(s){
                                               s.preventDefault();
                                               var text = $('#commentTextArea'+activity.id).val();
                                               if(text.length < 1) return;
                                               $.post('index.php?option=com_tuiyo',
                                                   $('#commentForm'+activity.id).serialize(), 
                                                   function(inResponse){
                                                       var text= findLinks( inResponse.data.status );
                                                       text    = findMentions( text );
                                                       text    = findSearchLinks( text );
                                                       $("#ptext").val("");
                                                       $("#psubmit").attr('disabled' , false );
                                                       $("div.commenterDiv").remove();                         
                                                       $( newCommentTmpl({ 
                                                           bodyText: text , 
                                                           source:'via <a>'+inResponse.data.source+'</a>', 
                                                           statusTime: inResponse.data.time,
                                                           username: inResponse.data.username, 
                                                           statusID: inResponse.data.statusID, 
                                                           userPic : $('meta[name="thumb35"]').attr("content"),
                                                           canDelete : true,
                                                           canComment : true 
                                                       }) ).hide()
                                                       .appendTo( $( $("#s"+activity.id)
                                                       .find("div[class=activityStreamItemComments]") ) )
                                                       .fadeIn("fast");
														
                                                   }
                                               ,'json');
                                               
                                           },childNodes:[
                                               {tagName:'input', type:'hidden', name:'option', value:'com_tuiyo' },
                                               {tagName:'input', type:'hidden', value:'timeline', name:'controller' },
                                               {tagName:'input', type:'hidden', name:'do', value:'addComment' },
                                               {tagName:'input', type:'hidden', name:'format', value:'json' },
                                               {tagName:'input', type:'hidden', value:'1', name:$('meta[name=_token]').attr("content") },
                                               {tagName:'input', type:'hidden', value:$.TuiyoDefines.get('userid') , name:'userid' },
                                               {tagName:'input', type:'hidden', value:''+activity.id , name: 'inreplyto' },
                                               
                                               {tagName: 'div', className:'tuiyoTable', childNodes:[
                                                   {tagName: 'div', className:'tuiyoTableRow', style:'width: 86%', childNodes:[
                                                       {tagName:'div', className:'tuiyoTableCell', style:'width: 91%', childNodes:[
                                                           {tagName:'textarea', id:'commentTextArea'+activity.id, className:'TuiyoFormTexArea commentTextArea', name:'commentbody', style:'max-height: 40px !important', keyup:function(){
                                                               limitChars('commentTextArea'+activity.id, 185, 'commentCharsInfo'+activity.id );
                                                           }}
                                                       ]},
                                                       {tagName:'div', className:'tuiyoTableCell', style:'width: 9%', childNodes:[
                                                           {tagName:'input', value: $.gt.gettext('Post') ,className:'commentButton',  type:'submit'}
                                                           //{tagName:'input', value: '190', style:'border: none;text-align:center;width:40px;', readonly : 'readonly', id:'commentCharsInfo'+status.statusID}
                                                       ]},
                                                       {tagName:'div',className:'tuiyoClearFloat'}
                                                   ]}
                                               ]}
                                           ]}
                                       ]}
                                   ]))
                                   .hide().appendTo( $(this).parent().parent().parent().parent().find("div[class=activityStreamItemComments]")  ).slideDown("fast");
                                   $('input.commentButton').val($.gt.gettext('Post') );
                                   $("textarea.commentTextArea").focus();
                                   //$("div.activityStreamItemTools").hide();
                                   $("textarea.commentTextArea").bind("blur",function(e){
                                       e.preventDefault();
                                       if(!$.browser.msie && ( $(this).val() ).length < 1 ){ 
                                           $("form.commentForm").parent().remove(); 
                                       }
                                   })
                               }},
                               {tagName: 'a',href: '#',className: 'delete', rel:'cdelete', innerHTML: 'delete',click:function(p){
                                   if(!activity.candelete) return false;
                                   p.preventDefault();
                                   $.post('index.php?option=com_tuiyo&'+$("meta[name=_token]").attr("content")+'=1',
                                       {'do':'delActivity', 'format':'json', 'controller':'timeline', 'id': activity.id }, 
                                       function(inResponse){
                                           $("#s"+activity.id).fadeOut("slow");
                                       },
                                   'json');
                               }}
                           ]},                             
                           {tagName: 'div',className: 'activityBodyText',innerHTML: activity.bodytext },
                           {tagName: 'div', innerHTML: activity.body },
                           {tagName: 'div',className: 'bodyDescr' + ( (activity.isPublic > 0)?' public ': ' private ' ), title: ( (activity.isPublic > 0)? $.gt.gettext('This entry is Public'): $.gt.gettext('This entry is Private') ), childNodes:[
                               {tagName:'span', className:'descrInfo', innerHTML: ' By '},
                               {tagName:'a', href: $.TuiyoDefines.get("profilelink")+'&user='+activity.username, innerHTML:'<span>'+activity.username+' </span>'},
                               {tagName:'a', className:'statustime', href: $.TuiyoDefines.get("statuslink")+'&user='+activity.username+'&id='+activity.id, innerHTML: '<span>'+activity.datetime+' </span>'},
                               {tagName:'a', className:'votes', href:'#', innerHTML: ( (activity.likes.length>0)? '<span style="color: green" class="dolike">'+activity.likes.length +' </span>' : '' )+((activity.dislikes.length>0)? ' <span style="color:red;" class="dontlike">'+activity.dislikes.length+'</span>':''), click:function(e){
                                   e.preventDefault();
                           
                                   $( $('<div class="activityStreamItemVotes tuiyoTable"></div>').appendDom([
                                       {tagName:'div', className:'tuiyoTableRow', childNodes:[
                                           {tagName:'div',className:'tuiyoTableCell likes', title:$.gt.gettext('Likes this item'),style:'width: 49%; margin-right: 1px; padding: 1px; background: #E6F9E0 none no-repeat scroll 0 0', childNodes: voterLinks( activity.likes, activity.id )},
                                           {tagName:'div', className:'tuiyoTableCell dlikes', title:$.gt.gettext('Dislikes this item'), style:'width: 49%; background: #FFE8E8 none no-repeat scroll 0 0;  padding: 2px;', childNodes: voterLinks( activity.dislikes , activity.id )},
                                           {tagName:'div', className:'tuiyoClearFloat'}
                                       ]}
                                   ]) ).hide().insertAfter( $(this).parent("div").parent("div")  ).slideDown("fast");
                                   
                                   $(this).unbind( "click" );
                               }},         
                           ]}
                       ]},
                       {tagName:'div', className:'activityStreamItemComments', innerHTML:'' }
                   ]}, 
                   {tagName: 'div',className: 'tuiyoClearFloat'}
               ]}              
           ]);
       },
			commentFormTmpl = function( status ){
				var tmpl = 
				[{tagName:'div', className:'commenterDiv', childNodes:[
					{ tagName:'form', name:'commentForm'+status.statusID, id:'commentForm'+status.statusID, action:'index.php', 
					  method:'post', className:'TuiyoForm commentForm', submit:function(s){
						s.preventDefault();
						var text = $('#commentTextArea'+status.statusID).val();
						if(text.length < 1) return;
						$.post('index.php?option=com_tuiyo',
							$('#commentForm'+status.statusID).serialize(), 
							function(inResponse){
								var text= findLinks( inResponse.data.status );
								text  	= findMentions( text );
								text 	= findSearchLinks( text );
								$("#commentTextArea"+status.statusID).val("");
								$("#psubmit").attr('disabled' , false );
								$( newCommentTmpl({ 
									bodyText: text , 
									source:'via <a>'+inResponse.data.source+'</a>', 
									statusTime: inResponse.data.time,
									username: inResponse.data.username, 
									statusID: inResponse.data.statusID, 
									userPic : $('meta[name="thumb35"]').attr("content"),
									canDelete : true,
									canComment : true 
								}) ).hide()
								.appendTo( $( $("#s"+status.statusID)
								.find("div[class=activityStreamItemComments]") ) )
								.fadeIn("fast");
							}
						,'json');
						
					},childNodes:[
					    {tagName:'input', type:'hidden', name:'option', value:'com_tuiyo' },
						{tagName:'input', type:'hidden', value:'timeline', name:'controller' },
						{tagName:'input', type:'hidden', name:'do', value:'addComment' },
						{tagName:'input', type:'hidden', name:'format', value:'json' },
						{tagName:'input', type:'hidden', value:'1', name:$('meta[name=_token]').attr("content") },
						{tagName:'input', type:'hidden', value:$.TuiyoDefines.get('userid') , name:'userid' },
						{tagName:'input', type:'hidden', value:''+status.statusID , name: 'inreplyto' },
						
						{tagName: 'div', className:'tuiyoTable', childNodes:[
							{tagName: 'div', className:'tuiyoTableRow', childNodes:[
								{tagName:'div', className:'tuiyoTableCell', style:'width: 89%', childNodes:[
									{tagName:'textarea', id:'commentTextArea'+status.statusID, className:'TuiyoFormTexArea commentTextArea', name:'commentbody', style:'max-height: 40px !important', keyup:function(){
										limitChars('commentTextArea'+status.statusID, 185, 'commentCharsInfo'+status.statusID );
									}}
								]},
								{tagName:'div', className:'tuiyoTableCell', style:'width: 9%', childNodes:[
									{tagName:'input', value: $.gt.gettext('Post') ,className:'commentButton',  type:'submit'}
									//{tagName:'input', value: '190', style:'border: none;text-align:center;width:40px;', readonly : 'readonly', id:'commentCharsInfo'+status.statusID}
								]},
								{tagName:'div',className:'tuiyoClearFloat'}
							]}
						]}
					]}
				]}];
				return tmpl ;
			},
			newReportTmpl = function(){},
			newCommentTmpl = function( comment ){
				return $('<div class="acitivtyStreamItemComment" ></div>').attr("id", "c"+comment.statusID).appendDom([
					{tagName:'div', className:'tuiyoTableRow', childNodes:[{tagName:'div', className:'tuiyoTableCell'},
						{tagName:'div', className:'tuiyoTableCell', style:'width: 10%', childNodes:[
							{tagName:'div', className:'activityStreamItemUserImage36', childNodes:[
								{tagName:'img', width:'35', style:'width: 35px; height: 35px', src: comment.userPic }
							]}
						]},
						{tagName:'div', className:'tuiyoTableCell', style:'width: 85%', childNodes:[
							{tagName:'div', className:'commentBody', 
								innerHTML: '<strong><a href="'+$.TuiyoDefines.get("profilelink")+'&user='+comment.username+'">'
									+comment.username+'</a> '
										+comment.statusTime+'</strong> : '
											+comment.bodyText }
						]},
						{tagName:'div', className:'tuiyoTableCell', style:'width: 4%; padding-top: 8px;', align:'center', childNodes:[
							{tagName:'a', href:'#', rel:'ccommentdel', click:function(c){
								c.preventDefault();
								$("#c"+comment.statusID).css("opacity", "0.2");
								$.post('index.php?option=com_tuiyo&'+$("meta[name=_token]").attr("content")+'=1',
									{'do':'delComment', 'format':'json', 'controller':'timeline', 'id': comment.statusID }, 
									function(inResponse){
										$("#c"+comment.statusID).fadeOut("slow");
									},
								'json');
							},innerHTML:'dc', className:'deleteComment'}
						]},						
						{tagName:'div', className:'tuiyoClearFloat'}
					]}
				]);
			},
			newStatusTmpl = function( status ){
                
                return $('<div class="tuiyoTable activityStreamItem '+status.data.source+' '+status.data.itemType+'" style="position:relative">').attr("id", "s"+status.statusID ).appendDom([
                    {tagName: 'div', className: 'tuiyoTableRow',childNodes: [               
                        {tagName: 'div',className: 'tuiyoTableCell col1img', style:'width:10%;',childNodes: [
                            {tagName: 'div',className: 'activityStreamItemUserImage48',childNodes: [ 
                                {tagName: 'img',src: status.userPic ,width: '48', height:'48'}
                            ]}
                        ]}, 
                        {tagName: 'div',className: 'tuiyoTableCell col2body',style: 'width: 90%',childNodes: [
                            {tagName: 'div',className: 'activityStreamItemMainBody',childNodes: [
                                {tagName: 'div',className: 'activityStreamItemTools',align: 'center',childNodes: [
                                    {tagName:'a', className:'voteLike', href:'#', innerHTML:$.gt.gettext(' like '), click:function(e){
                                        e.preventDefault();
                                        var self = $(this);
                                        var token = $("meta[name=_token]").attr("content") ;
                                        $.post('index.php?option=com_tuiyo&'+$("meta[name=_token]").attr("content")+'=1',
                                            {'do':'addVote', 'format':'json', 'controller':'timeline', 'sid': status.statusID , 'svt':+1, token:'1' }, 
                                            function(inResponse){
                                            	$("div#s"+status.statusID ).find("a.votes").trigger( "click" );
                                                var divBox = $("div#s"+status.statusID ).find("div.likes:eq(0)");
                                                
                                                $(divBox).appendDom( voterLinks([{"userID":inResponse.userID, "userPic":inResponse.userPic }] , status.statusID ) );
                                            },
                                        'json');
                                    } },
                                    {tagName:'a', className:'voteDisLike', href:'#', style:'', innerHTML:$.gt.gettext(' dislike'), click:function(e){
                                        e.preventDefault();
                                        var self = $(this);
                                        var token = $("meta[name=_token]").attr("content") ;
                                        $.post('index.php?option=com_tuiyo&'+$("meta[name=_token]").attr("content")+'=1',
                                            {'do':'addVote', 'format':'json', 'controller':'timeline', 'sid': status.statusID , 'svt':-1 , token:'1' }, 
                                            function(inResponse){
                                            	$("div#s"+status.statusID ).find("a.votes").trigger( "click" );
                                                var divBox = $("div#s"+status.statusID ).find("div.dlikes:eq(0)");
                                                $(divBox).appendDom( voterLinks([{"userID":inResponse.userID, "userPic":inResponse.userPic }] , status.statusID ) );
                                            },
                                        'json');                                        
                                    }},
                                    {tagName: 'a',href: '#',className: 'comment',innerHTML: 'comment', rel:'ccomment', click:function(c){
                                        c.preventDefault();
                                        if(!status.canComment) return false;
                                        $("div.commenterDiv").remove();
                                        $( $('<div class="stupidInternetExplorer"></div>').appendDom([
                                            {tagName:'div', className:'commenterDiv', childNodes:[
                                                { tagName:'form', name:'commentForm'+status.statusID, id:'commentForm'+status.statusID, action:'index.php', 
                                                  method:'post', className:'TuiyoForm commentForm', submit:function(s){
                                                    s.preventDefault();
                                                    var text = $('#commentTextArea'+status.statusID).val();
                                                    if(text.length < 1) return;
                                                    $.post('index.php?option=com_tuiyo',
                                                        $('#commentForm'+status.statusID).serialize(), 
                                                        function(inResponse){
                                                            var text= findLinks( inResponse.data.status );
                                                            text    = findMentions( text );
                                                            text    = findSearchLinks( text );
                                                            $("#ptext").val("");
                                                            $("#psubmit").attr('disabled' , false );
                                                            $("div.commenterDiv").remove();                         
                                                            $( newCommentTmpl({ 
                                                                bodyText: text , 
                                                                source:'via <a>'+inResponse.data.source+'</a>', 
                                                                statusTime: inResponse.data.time,
                                                                username: inResponse.data.username, 
                                                                statusID: inResponse.data.statusID, 
                                                                userPic : $('meta[name="thumb35"]').attr("content"),
                                                                canDelete : true,
                                                                canComment : true 
                                                            }) ).hide()
                                                            .appendTo( $( $("#s"+status.statusID)
                                                            .find("div[class=activityStreamItemComments]") ) )
                                                            .fadeIn("fast");
                                                        }
                                                    ,'json');
                                                    
                                                },childNodes:[
                                                    {tagName:'input', type:'hidden', name:'option', value:'com_tuiyo' },
                                                    {tagName:'input', type:'hidden', value:'timeline', name:'controller' },
                                                    {tagName:'input', type:'hidden', name:'do', value:'addComment' },
                                                    {tagName:'input', type:'hidden', name:'format', value:'json' },
                                                    {tagName:'input', type:'hidden', value:'1', name:$('meta[name=_token]').attr("content") },
                                                    {tagName:'input', type:'hidden', value:$.TuiyoDefines.get('userid') , name:'userid' },
                                                    {tagName:'input', type:'hidden', value:''+status.statusID , name: 'inreplyto' },
                                                    
                                                    {tagName: 'div', className:'tuiyoTable', childNodes:[
                                                        {tagName: 'div', className:'tuiyoTableRow', style:'width: 86%', childNodes:[
                                                            {tagName:'div', className:'tuiyoTableCell', style:'width: 91%', childNodes:[
                                                                {tagName:'textarea', id:'commentTextArea'+status.statusID, className:'TuiyoFormTexArea commentTextArea', name:'commentbody', style:'max-height: 40px !important', keyup:function(){
                                                                    limitChars('commentTextArea'+status.statusID, 185, 'commentCharsInfo'+status.statusID );
                                                                }}
                                                            ]},
                                                            {tagName:'div', className:'tuiyoTableCell', style:'width: 9%', childNodes:[
                                                                {tagName:'input', value: $.gt.gettext('Post') ,className:'commentButton',  type:'submit'}
                                                                //{tagName:'input', value: '190', style:'border: none;text-align:center;width:40px;', readonly : 'readonly', id:'commentCharsInfo'+status.statusID}
                                                            ]},
                                                            {tagName:'div',className:'tuiyoClearFloat'}
                                                        ]}
                                                    ]}
                                                ]}
                                            ]}
                                        ]))
                                        .hide().appendTo( $(this).parent().parent().parent().parent().find("div[class=activityStreamItemComments]")  ).slideDown("fast");
                                        $('input.commentButton').val($.gt.gettext('Post') );
                                        $("textarea.commentTextArea").focus();
                                        //$("div.activityStreamItemTools").hide();
                                        $("textarea.commentTextArea").bind("blur",function(e){
                                            e.preventDefault();
                                            if(!$.browser.msie && ( $(this).val() ).length < 1 ){ 
                                                $("form.commentForm").parent().remove(); 
                                            }
                                        })
                                    }}, 
                                    {tagName: 'a',href: '#',className: 'repost',innerHTML: 'repost',click:function(a){
                                        a.preventDefault();
                                        $("#ptext").val( '[via  @'+status.username+'] '+( status.bodyText ).replace(/<\/?[^>]+>/gi, '') );
                                        $("#ptext").trigger("focus");
                                       //$("div.activityStreamItemTools").hide();
                                    }}, 
                                    {tagName: 'a',href: '#',className: 'delete', rel:'cdelete', innerHTML: 'delete',click:function(p){
                                        if(!status.canComment) return false;
                                        p.preventDefault();
                                        $("#s"+status.statusID).css("opacity", "0.2");
                                        $.post('index.php?option=com_tuiyo&'+$("meta[name=_token]").attr("content")+'=1',
                                            {'do':'delActivity', 'format':'json', 'controller':'timeline', 'id': status.statusID }, 
                                            function(inResponse){
                                                $("#s"+status.statusID).fadeOut("slow");
                                            },
                                        'json');
                                    }}
                                ]},                         
                                {tagName: 'div', className: 'bodyText', innerHTML: status.bodyText },
                                {tagName: 'div',className: 'bodyAttachmentPlaceHolder', style:"display: none; cursor: pointer", innerHTML: $.gt.gettext('view attachement')}, 
                                {tagName: 'div',className: 'bodyDescr' + ( (status.data.isPublic > 0)?' public ': ' private ' ), title: ( (status.data.isPublic > 0)? $.gt.gettext('This entry is Public'): $.gt.gettext('This entry is Private') ), childNodes:[
                                    {tagName:'span', className:'descrInfo', innerHTML: ' By '},
                                    {tagName:'a', href: $.TuiyoDefines.get("profilelink")+'&user='+status.username, innerHTML:'<span>'+status.username+' </span>'},
                                    {tagName:'a', className:'statustime', href: $.TuiyoDefines.get("statuslink")+'&user='+status.username+'&id='+status.statusID, innerHTML: '<span>'+status.statusTime+' </span>'},
                                    {tagName:'a', className:'votes', href:'#', innerHTML: ( (status.likes.length>0)? '<span style="color: green" class="dolike"> '+ status.likes.length +'</span>' : ' ' )+((status.dislikes.length>0)? ' <span style="color:red;" class="dontlike">'+status.dislikes.length+'</span>':''), click:function(e){
                                        e.preventDefault();
                                
                                        $( $('<div class="activityStreamItemVotes tuiyoTable"></div>').appendDom([
                                            {tagName:'div', className:'tuiyoTableRow', childNodes:[
                                                {tagName:'div',className:'tuiyoTableCell likes', title:$.gt.gettext('Likes this item'),style:'width: 49%; margin-right: 1px; padding: 1px; background: #E6F9E0 none no-repeat scroll 0 0', childNodes: voterLinks( status.likes, status.statusID )},
                                                {tagName:'div', className:'tuiyoTableCell dlikes', title:$.gt.gettext('Dislikes this item'), style:'width: 49%; background: #FFE8E8 none no-repeat scroll 0 0;  padding: 2px;', childNodes: voterLinks( status.dislikes , status.statusID )},
                                                {tagName:'div', className:'tuiyoClearFloat'}
                                            ]}
                                        ]) ).hide().insertAfter( $(this).parent("div").parent("div")  ).slideDown("fast");
                                        
                                        $(this).unbind( "click" );
                                    }}
                                ]}
                            ]},
                            {tagName:'div', className:'activityStreamItemComments', innerHTML:'' }
                        ]},
                        {tagName: 'div',className: 'tuiyoClearFloat'}
                    ]}
                ]);
            },
			voterLinks = function( users , statusID ){
				var voterImgs = [];
				
				for(i=0; i<users.length; i++){
					voterImgs[i] = {tagName:'div', style:'; float:left;width: 38px; height: 38px', childNodes:[
						{tagName:'a', href: $.TuiyoDefines.get('profilelink')+'&pid='+users[i].userID, childNodes:[
							{tagName:'img', style:'padding: 2px', src: users[i].userPic }
						]}
					]} ;
					if(parseInt(users[i].userID) === parseInt( $.TuiyoDefines.get("userid") )  ){
						voterImgs[i].childNodes[ voterImgs[i].childNodes.length] = 
						{tagName:'a', href:'#', className:'deleteVoteIcon', innerHTML:'del', title:$.gt.gettext('delete your vote'), click:function(e){
							var self = $(this);
							var token = $("meta[name=_token]").attr("content") ;
							e.preventDefault();
							$.post('index.php?option=com_tuiyo&'+$("meta[name=_token]").attr("content")+'=1',
								{'do':'removeVote', 'format':'json', 'controller':'timeline', 'sid': statusID , 'svt':0 , token:'1' }, 
								function(inResponse){
									$(self).parent().remove();
								},
							'json');							
						}} ;
					}
				}
				
				return voterImgs;
			},
			findLinks  = function( text ){
				
				if(text.search(new RegExp(/<\/a>/i)) > -1){
					return text;
				}
		        var regExp = /((ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?)/gi;
		        var linked = text.replace(regExp, "<a class=\"linker\" href=\"$1\">$1</a>");
				return linked;
			},
			findSearchLinks = function( text ){
				//var hasTag = $(text).find("a.activityTag");
				//if( hasTag ){ return text };				
		        var regExp = / [\??]+([A-Za-z0-9-_]+)/gi;
		        var searchLInked =  text.replace(regExp, ' <a class="activitySearchTag" href="'+$('meta[name="_searchurl"]').attr("content")+'&searchword=$1">$1</a>');
				
				return findChatLinks( searchLInked ) ;
			},
			
			findChatLinks = function( text ){
				//var hasTag = $(text).find("a.activityTag");
				//if( hasTag ){ return text };				
		        var regExp = / [\#]+([A-Za-z0-9-_]+)/gi;
		        var chatLInked =  text.replace(regExp, ' <a class="activityChatTag" target="blank" href="'+$('meta[name="_chaturl"]').attr("content")+'&room=$1">$1</a>');
				
				return chatLInked ;
			},
			
			
			findEmoticons = function(statusText){
				return statusText;
			},
			findCommand = function(text ){
				var regExp = /[\$]+([A-Za-z0-9-_]+)/ ;
				var command = text.match( regExp );
				
				if(command !== null){
					if (typeof $("#plugin-"+[command[1] ]).val() !== 'undefined') {
						if(typeof loadedPlugins[command[1]] === 'undefined'){
							$.getScript($("#plugin-"+[command[1] ]).val(),function(){
								runPlugin(command[1])
							}) ;
							loadedPlugins[command[1]] = $("#plugin-"+[command[1] ]).val();
						}else{ runPlugin( command[1]); } return true;
					} else { return false }
				}
			},
			runPlugin = function( plugin ){
				$("#psubmit").attr('disabled' , true );
				$("#TuiyoStreamUpdate").trigger( plugin ); return false;
			},
			showReport 	= function(report, reportType){
				if(typeof reportType ==='undefined') reportType = 'message';
				$("div.reporter").empty();
				$('div.reporter').appendDom([
					{tagName:'dl',id:'system-message',childNodes:[
						{tagName:'dt',className:reportType,innerHTML:reportType},
						{tagName:'dd',className:reportType,childNodes:[
							{tagName:'ul', style:'width: 95%; margin-top: 6px', childNodes:[
								{tagName:'li',innerHTML:report}
							]}
						]}
					]}
				]).bind("click", function(e){
					e.preventDefault();
					$(this).empty();
				})
			};
			getProviderLink = function(text){
				
				var regExp = /((ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?)/gi;
		        var linked = text.match( regExp );
				
				if (linked) {
					if (linked.length > 0) {
						if( $.fn.oembed.isAvailable( linked[0] ) ){return linked[0];}else{ return null; }
					} else {
						return null;
					}
				}
			},
			limitChars = function(textFieldId, limit, infoBox) {
 				var text = $('#'+textFieldId).val();
 				var textLength = text.length;
 				if (textLength > limit) {			
 					$('#'+ textFieldId).val(text.substr(0, limit)); return false;
 				}else { $('#'+ infoBox).val( (limit - textLength) ); return true; 
				}
 			};
		return {
			load: function( opt ){		
				settings = $.extend({}, defaults, opt||{});
		
				var addQuery 	= '&do=getPublicTimeline' ;
				var profile 	= $("meta[name=pid]").attr("content");	
				var group 	 	= $("meta[name=gid]").attr("content");
				var sid 		= $("meta[name=sid]").attr("content");
				var filter 		= "";
				var channel     = "";
				var source		= "";
				var realtime    = "";
							
				if(typeof profile !== 'undefined'){
					addQuery = "&do=getUserTimeline&ps=1&pid="+profile+( (typeof sid!== 'undefined')? "&sid="+sid:"" );
				}
				if(typeof group !== 'undefined'){
					addQuery = "&do=getGroupTimeline&ps=1&gid="+group;
				}
				
				if(typeof settings.filter !=='undefined'){
					filter = "&filtertype="+settings.filter ;
					//alert(settings.filter)
				}
				
				if(typeof settings.channel !=='undefined'){
					channel = "&channel="+settings.channel ;
					//alert(settings.filter)
				}
				
				if(typeof settings.source !=='undefined'){
					source = "&sourcetype="+settings.source ;
					//alert(settings.filter)
				}
				
				if(settings.realTime){
					if(settings.loadInterval < 1){
						//ClearIntervalFunction
						clearInterval(intervalCounter);
					}else{
						realtime = "&sinceid="+settings.sinceID;
						if(settings.sinceID>0){
							settings.clearPrevious = false;
						}else{
							intervalCounter=setInterval(function(){ TuiyoStream.load( settings ) }, settings.loadInterval*1000)
						}
					}
				}
				
				$.getJSON($.TuiyoDefines.get("siteIndex")+'?'+$('meta[name=_token]').attr("content")+'=1' + addQuery+filter+source+channel+realtime+"&controller=timeline&format=json" ,
					{"option":"com_tuiyo", "controller":"timeline", "paginate" : settings.paginateItems, "limitstart": settings.limitstart,
					 "userID": (!settings.userID)? $.TuiyoDefines.get('userid'):settings.userID, "format":"json"   },
					function(inResponse){						
						//$("#ptext").val("");
						$("#psubmit").attr('disabled' , true );
						
						if (settings.clearPrevious) {
							$("#userActivityStream").empty();
						}
						if(inResponse.data.length > 0){
							
							//Determine the last loaded item;
							var lastItem 	 = inResponse.data[inResponse.data.length-1]; //Sounds illogical but actually because the object is flipped on the server, the first item, is actually the last
							settings.sinceID = lastItem.id;
							
							//alert(settings.sinceID);
							
							$.each(inResponse.data, function(i, story){	
							    var provider = getProviderLink( story.bodytext ) ;
								var text	 = findLinks( story.bodytext );
									text  	 = findMentions( text );
									text 	 = findSearchLinks( text );
									//text 	 = findEmoticons( text );
							    
							    
								
								//if type is activity;
								if (story.itemType === "activity") {
									story.bodytext = text ;
									story.statusID = story.id;
									$(newActivityTmpl(story)).hide().prependTo("#userActivityStream").show();
									if(provider){                                       
                                        $('<div><img src="components/com_tuiyo/client/default/images/loading.gif"  /></div>').addClass("bodyAttachment").hide()
                                        .insertBefore( $("div#s"+story.id).find("a[rel=embedPlaceHolder]") );                                       
                                        $( $("div#s"+story.id).find("a[rel=embedPlaceHolder]") ).click(function(e){                                         
                                            e.preventDefault();
                                            $($("div#s"+story.id).find("div.bodyAttachment") ).oembed( provider , settings.attachmentCnfg ).show();
                                            $(this).hide();
                                            
                                        }).show();
                                    }
								}else {
									//Continue
									$(newStatusTmpl({
										bodyText: text,
										source: 'via <a>' + story.source + '</a>',
										statusTime: story.datetime,
										username: story.username,
										userid: story.userid,
										statusID: story.id,
										userPic: story.userpic,
										likes: story.likes,
										dislikes: story.dislikes,
										canDelete: story.candelete,
										canComment: story.cancomment,
										data: story
									})).hide().prependTo("#userActivityStream").show();
									
									if(provider){
                                        
                                        $('<div></div>').addClass("bodyAttachment").hide()
                                        .insertAfter( $("div#s"+story.id).find("div.bodyAttachmentPlaceHolder") );
                                        
                                        $( $("div#s"+story.id).find("div.bodyAttachmentPlaceHolder") ).click(function(){
                                            $($("div#s"+story.id).find("div.bodyAttachment") ).oembed( provider , settings.attachmentCnfg ).show();
                                            $(this).hide();
                                        }).show();
                                        
                                        //alert( provider );
                                        //$( $("div#s"+story.id).find("div.bodyAttachment") ).oembed( provider , settings.attachmentCnfg );
                                        //$( $("div#s"+story.id).find("div.bodyAttachment") ).show()
                                    }
								}
								
								if(!story.candelete) $( $("#s"+story.id).find("a[rel=cdelete]") ).remove();
								if(!story.cancomment) $( $("#s"+story.id).find("a.voteLike") ).remove();
								if(story.likes.length < 1 && story.dislikes.length < 1) $( $("#s"+story.id).find("a.votes") ).html( $.gt.gettext("no votes yet") );
								if(!story.cancomment) $( $("#s"+story.id).find("span.voteSep") ).remove();
								if(!story.cancomment) $( $("#s"+story.id).find("a.voteDisLike") ).remove();
								//if(!story.cancomment) $( $("#s"+story.id).find("div[class=activityStreamItemTools]") ).remove();
								
								if(story.comments.length >0){
									$.each(story.comments, function(i, comment){
										var ctext= findLinks( comment.bodytext );
										ctext  	= findMentions( ctext );
										ctext 	= findSearchLinks( ctext );					
										$( newCommentTmpl({ 
											bodyText: ctext , 
											source:'via <a>'+comment.source+'</a>', 
											statusTime: comment.datetime,
											username: comment.username,
											userid: comment.userid, 
											statusID: comment.id,
											userPic : comment.userpic,
											canDelete : comment.candelete,
											canComment : comment.cancomment 
										}) ).hide()
										.appendTo( $( $("#s"+comment.parentid)
										.find("div[class=activityStreamItemComments]") ) )
										.show();
										
										if(!comment.candelete) $( $("#c"+comment.id).find("a[rel=ccommentdel]") ).remove();										
									});
								}
								$("#psubmit").attr('disabled' , false );
							});
						}else{
							if(settings.clearPrevious){
								$("#userActivityStream").html('<div class="TuiyoNotification TuiyoInformation" style="margin-top: 8px">There is are no posts to display. Check back again shortly</div>');
								//TuiyoStream.alert( $.gt.gettext("There are no post to display. Check back again shortly", "message"));
							}
						}
						//LIMITS
						if (settings.paginateItems) {
							var 
								total = inResponse.page.total,
								offset = inResponse.page.offset,
								limit  = inResponse.page.limit
							;
							if(parseInt(offset+limit)>= total){
								$("div#streamPagination").hide();
							}else if (total > limit && parseInt(offset+limit-1)< total ) {	
								var self = $(this);								
								$("div#streamPagination").show();
								$("div#streamPagination").unbind("click").bind("click",function(){
									$(this).find("a:first").ajaxStart(function(){
										$(this).text("loading ...");
									}).ajaxStop(function(){
										$(this).text("load older items")
									});
									 $(self).TuiyoStreamLoad({
									 	clearPrevious: false,
										limitstart : parseInt(offset+limit)
									 });
									 
								})
							}
						}
						$('a[rel*=facebox]').facebox();
						//$("#psubmit").attr('disabled' , false );
					},
				'json')
			},
			alert : function(message, type){
				return showReport(message, type);
			},
			init : function( opt ){
				settings = $.extend({}, defaults, opt||{});
				$("a[rel=filterNewsFeed]").toggle(function(e){
					e.preventDefault();
					$('.statusToolEl').hide();
					$('.timelineFilters').show();
				},function(e){
					e.preventDefault();
					$('.timelineFilters').hide();
				});
				$("a[rel=updateStatus]").bind('click',function(e){
					e.preventDefault();
					$('.statusToolEl').hide();
					$('.publisher').show();
					$('#activityUpdateTools').show();
				});
				$("a[rel=shareLocation]").bind('click',function(e){
					e.preventDefault();
					//Google Maps
					var viewPoint = {
					    zoom:                   15,
					    scrollwheel:            false,
					    controls:               ["GSmallZoomControl3D", "GMapTypeControl"],
					    scrollwheel:            true
					};
					if(navigator.geolocation) { 
						  navigator.geolocation.getCurrentPosition(function(position) { 
							  
							  viewPoint.latitude  = position.coords.latitude;
							  viewPoint.longitude = position.coords.longitude;
							  	
						  	  viewPoint.markers   = [{latitude: position.coords.latitude, longitude: position.coords.longitude}]

						      $("#map_location_canvas").gMap( viewPoint )
								
								$('.statusToolEl').hide();
								$('.publisher').show();
								$('.shareCurrentLocation').show();
								$('#activityUpdateTools').show();
						  });
					}
					
					
					
				});
				$("a[rel=uploadFiles]").bind('click',function(e){
					e.preventDefault();
					//UploadFiles JS
					var
						$token 			= $.TuiyoDefines.get("token") ,
						$tuiyoAyncPath 	= $.TuiyoDefines.get("interfaceIncPath") + "/asyncupload/";
					
						$.getScript( $tuiyoAyncPath+'swfupload.js', function(){
							$.getScript( $tuiyoAyncPath+'asyncupload.js',function(){
								$.getJSON($.TuiyoDefines.get("siteIndex")+'?'+$token+"=1",{'option': 'com_tuiyo', 'do': 'getSessionId', 'controller': 'resources', 'format': 'json'},
				            		function(resource){
										var swfu = null,
											settings = {
												flash_url: $tuiyoAyncPath+'swfupload.swf',
									            button_image_url: $tuiyoAyncPath+'blankButton.png',
									            
												upload_url: $.TuiyoDefines.get("componentIndex")+"&controller=resources&do=uploadResources&format=json&jsid="+resource.sid+"&jsname="+resource.sname,
												post_params: resource.post, 
												file_types : "*.jpg;*.gif;*.png;*.jpeg;*.JPEG;*.PNG;*.GIF;*.mp3;*.MP3",
												file_size_limit : '15 MB',
												file_queue_limit : 5,
												custom_settings : {
													progressTarget : "fsUploadProgress",
													cancelButtonId : "btnCancel"
												},
												//debug: true,
												button_width: 120,
												button_text: "<font face='Arial' size='12pt'>" + $.gt.gettext('Choose file(s)') + "</span>",
												button_action : SWFUpload.BUTTON_ACTION.SELECT_FILES,
												button_height: 22,
												button_placeholder_id: "spanButtonPlaceHolder",
												button_text_left_padding: 15,
												button_text_top_padding: 2,
												file_dialog_start_handler : fileDialogStart,
												file_queued_handler : fileQueued,
												file_queue_error_handler : fileQueueError,
												file_dialog_complete_handler : fileDialogComplete,
												upload_start_handler : uploadStart,
												upload_progress_handler : uploadProgress,
												upload_error_handler : uploadError,
												upload_success_handler : uploadSuccess,
												upload_complete_handler : uploadComplete												
										};
										swfu = new SWFUpload( settings );
									}
								);  
							});
			            });
					if(!$.loaded){
						$.getScript( $tuiyoAyncPath+'swfuploadqueue.js');
						$.getScript( $tuiyoAyncPath+'swfuploadfileprogress.js');
						$.getScript( $tuiyoAyncPath+'swfuploaderrorhandlers.js');
						$.loaded = true;
					}
	
					
					$('.statusToolEl').hide();
					//$('.publisher').show();
					$('.uploadResourceFiles').show();
					//$('#activityUpdateTools').show();
				});
				
				$('div.timelineFilters').find('input[name=filterRadioGroup]').bind("change",function(){
					var $value = $(this).val();
					//alert( $value );
					$("#userActivityStream").html('<img src="components/com_tuiyo/client/default/images/loading2.gif" style="margin-top: 8px" />' );
                    $("#userActivityStream").TuiyoStreamLoad({source: $value });
				});
				
				$(".sharePrivacy a[rel=addParticipant]").bind("click", function(e){
					e.preventDefault();
					var selfB 		= $(this),
					 suggestBox 	= $("#shareWidthSuggestBox").clone();
					
					$.facebox( $(suggestBox).show().attr("id", "sharingWithActiveBox") );
					
					var form= $("#sharingWithActiveBox form:first"),
						rslt= $("#sharingWithActiveBox div#suggestResultBox")
					;

					$( $(form).find("button:first") ).bind("click", function(e){
						e.preventDefault();
						$.facebox.close();
					});
					
					$("#sharingWithActiveBox").find("input[name=suggestSalt]").bind("keyup", function(e){
						e.preventDefault();
	
						$.post($(form).attr("action"), $(form).serialize(), function(response){
							var data = response.data ;
							$(rslt).empty();
							$.each(data, function(i, suggested){
								$('<div class="listItem"></div>').appendDom([
									{tagName:'div', className:'tuiyoTableCell', style:'width: 5%', childNodes:[
										{tagName:'input', type:'checkbox',style:'margin: 4px 10px 4px 4px ', name:'sharing[]', value: ((suggested.rType=='friend')?"p":"g")+suggested.rID, click: function(){
											if (this.checked) {
												$('span[rel='+$(this).val()+']').remove();
												$('<span class="shareWith" rel="'+ $(this).val()+'" title="'+ suggested.rName+'"></span>').appendDom([{
													tagName: 'a',className: 'remove', rel: 'removeParticipant', innerHTML: suggested.rName , click:function(e){
														e.preventDefault();
														var self 	= $(this),
														    prompt  = confirm( $.sprintf( $.gt.gettext("Are you sure you don't want to share with %s?") , $(self).parent("span.shareWith").attr("title") ) ) ;
														if (prompt) {
															$(self).parent("span.shareWith").remove();
														}
													}
												}, {
													tagName: 'input',type: 'hidden',name: 'sharewith[]', value: $(this).val()
												}]).insertBefore( $(selfB) );
											}else{
												$('span[rel='+$(this).val()+']').remove();
											}
										}}
									]},
									{tagName:'div',className:'tuiyoTableCell', style:'width: 90%; padding-left: 5px', innerHTML: suggested.rName },
									{tagName:'div', className:'tuiyoClearFloat' }
								]).appendTo( $(rslt) );
								
							});
							
						},'json');
						
					});
				});
				$(".sharePrivacy a[rel=removeParticipant]").bind("click", function(e){
					e.preventDefault();
					var self 		= $(this),
					    prompt      = confirm( $.sprintf( $.gt.gettext("Are you sure you don't want to share with %s?") , $(self).parent("span.shareWith").attr("title") ) ) ;
					if (prompt) {
						$(self).parent("span.shareWith").remove();
					}
				});				
				if(settings.includefilters){
					//$("h3.streamTitle").remove();
					$("div#homepageActivityFeed").css({"width":"70%", "float":"left", "margin-right": "15px"}).addClass("tuiyoTableCell");
					$('<div id="homepageFilterTabs" class="tuiyoTableCell" style="width: 25%; padding: 0 0 0 0 15px; float: left;">').appendDom([
						{tagName:'ul',className:'filterTabItems', childNodes:[
							{tagName:'li',innerHTML:'<a>Posts mentioning me</a>'},
							{tagName:'li',innerHTML:'<a>Post by me</a>'},
							{tagName:'li',className:'current',innerHTML:'<a>Updates by Everyone</a>'},
						]},
						{tagName:'div', className:'tuiyoClearFloat'}
					]).insertAfter( $("div#homepageActivityFeed") );	
					$('<div class="tuiyioClearFloat" />').insertAfter("div#homepageFilterTabs")
				}
				
				if(settings.paginateItems){
					
					$('<div id="streamPagination">').appendDom([
						{tagName:'a', innerHTML: 'load older items'}
					]).attr("align","center").bind("click", function(){
						$(this).find('a').text("loading...");
					}).insertAfter( $(this) );
				}	
				
				$("#ptext").bind("keyup", function(){
					var text = $(this).val(),
					    provider = getProviderLink( text );
					if(provider){
						//alert( provider );
						$("div#embedable").oembed( provider , settings.attachmentCnfg );
						$("div#embedable").slideDown();								
					}else{
						$("div#embedable").hide();
					}
					limitChars('ptext', 140, 'pchars');
				});
				$("#"+settings.postFormId).submit(function(e){
					e.preventDefault();
					var text = $('#ptext').val();
					
					if(!limitChars('ptext', 140, 'pchars') ) return false;
					
					var statusHasProvider = getProviderLink( text );
					
					if(statusHasProvider && $.fn.oembed.storeData){
						
						//alert($.fn.oembed.storeData);
						
						$("input[name=embedable\[title\]]").val( $.fn.oembed.storeData.title );
						$("input[name=embedable\[thumb\]]").val( $.fn.oembed.storeData.thumb );
						$("input[name=embedable\[description\]]").val( $.fn.oembed.storeData.description );
					}
					
					//return false;
					if(settings.forceTag){
						var strSearch = eval('/'+settings.forceTag+'/'),
							text 	  = $("#ptext").val(),
							strTagged = text.search(strSearch);
							if(strTagged !=-1){
								text = text;
							}else{
								text = text + " #"+settings.forceTag;
								$("#ptext").val( text );
							}
					}
					
					if(text.length < 1) return;
					if(!findCommand(text)){
						$("#psubmit").attr('disabled' , true );	
						$.post( $("#"+settings.postFormId).attr('action'), 
							$("#"+settings.postFormId).serialize(), 
							function(inResponse){
								var provider = getProviderLink( inResponse.data.status );
								text   	= findLinks( inResponse.data.status );
								text  	= findMentions( text );
								text 	= findSearchLinks( text );
								
								$("#ptext").val("");
								$("#embedable").empty().hide();
								$("#psubmit").attr('disabled' , false );						
								$(newStatusTmpl({ 
									bodyText: text , 
									source:'via <a>'+inResponse.data.source+'</a>', 
									statusTime: inResponse.data.time,
									username: inResponse.data.username, 
									statusID: inResponse.data.statusID, 
									userPic : $('meta[name="thumb70"]').attr("content"),
									canDelete : true,
									likes : [],
									dislikes : [],
									canComment : true,
									data: inResponse.data 
								})).hide().prependTo("#userActivityStream").slideDown("fast"); 
								
								settings.sinceID = inResponse.data.statusID;
								
								$("#userActivityStream").find('div.TuiyoNotification').remove();
								
								$("input[name=embedable\[title\]]").val( "" );
								$("input[name=embedable\[thumb\]]").val( "" );
								$("input[name=embedable\[description\]]").val( "" );
								
								if(provider){
									$('<div></div>').addClass("bodyAttachment").hide()
									.insertAfter( $("div#s"+inResponse.data.statusID).find("div.bodyAttachmentPlaceHolder") );
									
									$( $("div#s"+inResponse.data.statusID).find("div.bodyAttachmentPlaceHolder") ).click(function(){
										$($("div#s"+inResponse.data.statusID).find("div.bodyAttachment") ).oembed( provider , settings.attachmentCnfg ).show();
										$(this).hide();
									}).show().trigger("click");
																	
									//$( $("div#s"+inResponse.data.statusID).find("div.bodyAttachment") ).oembed( provider , settings.attachmentCnfg );
									//$( $("div#s"+inResponse.data.statusID).find("div.bodyAttachment") ).show()
								}								
							}, 
							'json'
						);					
					}
				});				
			}
		};
	}();
	$.fn.extend({
		TuiyoStream : TuiyoStream.init,
		TuiyoStreamLoad : TuiyoStream.load
	});
	$(document).ready(function(){
		clearInterval(TuiyoStream.intervalCounter);
        $("div#TuiyoStreamAjaxActivity").ajaxStart(function() {
            $(this).show();
        }).ajaxStop(function() {
            $(this).hide();
        });
	});
})(jQuery);
