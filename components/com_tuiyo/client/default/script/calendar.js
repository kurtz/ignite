/**
 * @author Livingstone
 */
 (function($) {
    $(document).ready(function() {
        $("ul#pageNavigation li").each(function(k) {
            $(this).click(function(f) {
                f.preventDefault();
                $("ul#pageNavigation li.current").removeClass('current');
                $(this).addClass('current');
                exeCalFunc($(this));
            });
        });
        $("a#createNewEventAction").bind('click',
        function(e) {
            e.preventDefault();
            $.facebox($("div#createDivEvent").clone().show());
            $("#facebox .ftitle").html($.gt.gettext("Create a new Event"));
            $("input[name=startdate] , input[name=enddate]").datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'yy-mm-dd',
                //minDate: '-70Y',
                numberOfMonths: 2,
                showButtonPanel: true

            });
        });
        // initialize dateinput
        $("input[type=date]").dateinput({
            // when date changes update the day display
            change: function(e, date) {}
            // set initial value and show dateinput when page loads	
        }).data("dateinput").setValue(0).show();
    });

    function exeCalFunc(E
    /*, hash */
    ) {
        if (typeof hash == 'undefined') {
            hashF = (E.find("a")[0].hash).substring(1);
            hashFF = hashF.split('-');
            hashFFF = eval(hashFF[0]);

            if ($.isFunction(hashFFF)) {
                eval(hashFF[0])($.grep(hashFF,
                function(a) {
                    return a = hashFF[0];
                }));
            }
        }
    };
})(jQuery);
