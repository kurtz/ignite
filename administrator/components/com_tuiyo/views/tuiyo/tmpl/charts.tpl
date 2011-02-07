<?php  defined('TUIYO_EXECUTE' ) || die; ?>
<div id="placeholder" style="width:100%;height:300px;"></div>
<div id="overview" style="margin-left:25px;margin-top:20px;width:97.5%;height:50px"></div>

<script id="source">
$(function () {
    var a = [],
        b = <?php echo $b ?>,
        c = [],
        d = <?php echo $d ?>;
    // first correct the timestamps - they are recorded as the daily
    // midnights in UTC+0100, but Flot always displays dates in UTC
    // so we have to add one hour to hit the midnights in the plot
    for (var i = 0; i < d.length; ++i)
      d[i][0] += 60 * 60 * 1000;
    
    for (var i = 0; i < a.length; ++i)
      a[i][0] += 60 * 60 * 1000;
  

    // helper for returning the weekends in a period
    function weekendAreas(axes) {
        var markings = [];
        var d = new Date(axes.xaxis.min);
        // go to the first Saturday
        d.setUTCDate(d.getUTCDate() - ((d.getUTCDay() + 1) % 7))
        d.setUTCSeconds(0);
        d.setUTCMinutes(0);
        d.setUTCHours(0);
        var i = d.getTime();
        do {
            // when we don't set yaxis, the rectangle automatically
            // extends to infinity upwards and downwards
            markings.push({ xaxis: { from: i, to: i + 2 * 24 * 60 * 60 * 1000 } });
            i += 7 * 24 * 60 * 60 * 1000;
        } while (i < axes.xaxis.max);

        return markings;
    }
    
    var options = {
        xaxis: { mode: "time" },
        selection: { mode: "x" },
        lines: {steps: false},
        legend: {position: "nw" },
        grid: { markings: weekendAreas , hoverable: true, clickable: true },
        series:{ lines: { show: true, lineWidth: 3 },points: { show: true , radius:2, symbol:"circle" } },
        colors: [ "rgb(255, 100, 123)", "rgb(94, 134, 231)", "rgb(175,89,390)", "rgb(225,107,3)" ]
    };
    
    var plot = $.plot($("#placeholder"), [{data:a,label: "page views",color:0},{data:b,label: "new members", color:1},{data:c,label: "time on site",color:2},{data:d,label: "status updates",color:3}], options);
    
    var overview = $.plot($("#overview"), [{data:a,color:0},{data:b, color:1},{data:c,color:2},{data:d, color:3}], {
        series: {
            lines: { show: true, lineWidth: 2 },
            shadowSize: 0
            
        },
        colors: [ "rgb(255, 100, 123)", "rgb(94, 134, 231)", "rgb(175,89,390)", "rgb(225,107,3)" ],
        xaxis: { ticks: [], mode: "time" },
        yaxis: { ticks: [], min: 0, autoscaleMargin: 0.1 },
        selection: { mode: "x" }
    });
    
    function showTooltip(x, y, contents) {
        $('<div id="tooltip">' + contents + '</div>').css( {
            position: 'absolute',
            display: 'none',
            top: y + 5,
            left: x + 5,
            border: '1px solid #fdd',
            padding: '2px',
            'background-color': '#fee',
            opacity: 0.80
        }).appendTo("body").fadeIn(200);
    }

    var previousPoint = null;
    $("#placeholder").bind("plothover", function (event, pos, item) {
        $("#x").text(pos.x.toFixed(2));
        $("#y").text(pos.y.toFixed(2));

            if (item) {
                if (previousPoint != item.datapoint) {
                    previousPoint = item.datapoint;
                    
                    $("#tooltip").remove();
                    var x = item.datapoint[0].toFixed(0),
                        y = item.datapoint[1].toFixed(0),
                     date = new Date(x/1000),
                     day  = date.getDay(),
                    month = date.getMonth(),
                    year  = date.getYear(),
                    hours = date.getHours(),
                  minutes = date.getMinutes(),
                  seconds = date.getSeconds(),
            formattedTime = day+'/'+month+'/'+year+' at '+hours + ' hours : ' + minutes + ' mins : ' + seconds+' sec';
                    
                    showTooltip(item.pageX, item.pageY,
                                y + " "+ item.series.label );
                }
            }
            else {
                $("#tooltip").remove();
                previousPoint = null;            
            }
        
    });

    $("#placeholder").bind("plotclick", function (event, pos, item) {
        if (item) {
            alert("You clicked point " + item.dataIndex + " in " + item.series.label + ".");
            plot.highlight(item.series, item.datapoint);
        }
    });

    // now connect the two
    
    $("#placeholder").bind("plotselected", function (event, ranges) {
        // do the zooming
        plot = $.plot($("#placeholder"), [{data:a,label: "page views",color:0},{data:b,label: "new members", color:1},{data:c,label: "time on site",color:2},{data:d,label: "status updates",color:3}],
                      $.extend(true, {}, options, {
                          xaxis: { min: ranges.xaxis.from, max: ranges.xaxis.to }
                      }));

        // don't fire event on the overview to prevent eternal loop
        overview.setSelection(ranges, true);
    });
    
    $("#overview").bind("plotselected", function (event, ranges) {
        plot.setSelection(ranges);
    });
});
</script>
