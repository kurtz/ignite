/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

(function($){
    $(document).ready(function(){
       var $nextStep    =  $("meta[name=_nextstep]").attr("content"),
           $nextStepURL =  "index.php?option=com_tuiyo&context=extensions&do=runmacroscript&i=systemupdate&format=json&step="
           $doNextStep  =  function( $nextStep ){
               $iNextStepURL = $nextStepURL+$nextStep;
               //alert( $iNextStepURL );
               $.getJSON($iNextStepURL, function(inresponse){
                   //alert(inresponse.message);
                   $( $("<div>").html(inresponse.message) ).appendTo( $("#processmessages") );
                   if(inresponse.nextstep){
                       //Call the next step, should we have downloaded;
                       $doNextStep(inresponse.nextstep);
                   }
               });
           };
       if($nextStep){
          $doNextStep($nextStep);
       }
    });
})(jQuery);
