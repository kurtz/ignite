(function($){
	$("#TuiyoStreamUpdate").unbind("do").bind("do" , function(){
		
		 var text = $("#ptext").val();
		 var cmdRegExp 		= /[\$]+([A-Za-z0-9-_]+) / ;
		 var searchMethod 	= 'methods';
		 var string   		= text.replace( cmdRegExp , '' );
		 var words 			= string.split(/[\s,-]+/);
		 var methods 		= {
			"alert":{
		 		"date": function(){
					 var mydate= new Date();
					 var theyear=mydate.getFullYear();
					 var themonth=mydate.getMonth()+1;
					 var thetoday=mydate.getDate();
			 		 alert('Date : '+theyear+"-"+themonth+"-"+thetoday); 
			 	},
		 	},
		 	"math":{}
		 }
		 for(i=0;i<words.length; i++){
			 searchMethod +='.'+words[i];
			 if(typeof eval(searchMethod) === 'function'){
				 eval(searchMethod+'()');
				 break; //pass the remainder of the words as params
			 }
		}
		//Always re-enable
		$("psubmit").disabled = false;
	});
})(jQuery)
