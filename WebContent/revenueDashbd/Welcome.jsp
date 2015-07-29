<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Revenue Dashboard</title>
</head>
<script type="text/javascript" src="scripts/jquery.min.js"></script>
<script type="text/javascript" src="scripts/jquery.jqplot.min.js"></script>
<script type="text/javascript" src="scripts/plugins/jqplot.barRenderer.min.js"></script>
<script type="text/javascript" src="scripts/plugins/jqplot.categoryAxisRenderer.min.js"></script>
<script type="text/javascript" src="scripts/plugins/jqplot.pointLabels.min.js"></script>
<script type="text/javascript" src="scripts/plugins/jqplot.canvasAxisLabelRenderer.min.js"></script>
<script type="text/javascript" src="scripts/plugins/jqplot.canvasAxisTickRenderer.min.js"></script>
<script type="text/javascript" src="scripts/plugins/jqplot.canvasTextRenderer.min.js"></script>

<link type="text/css" rel="stylesheet" href="css/jquery.jqplot.min.css"></link>

<script type="text/javascript">
$(document).ready(function(){
 //alert("In Document Ready")
  var s1 = [75.4, 81,87.6];
  var s2 = [39.8,38.6,38.4];
  var yearTicks = [2012,2013,2014];
  //alert(yearTicks);
  plot1 = $.jqplot('chart1', [s1, s2], {
    // Tell the plot to stack the bars.
    animate : true,
    animateReplot: true,
    stackSeries: true,
    captureRightClick: true,
    seriesDefaults:{
      renderer:$.jqplot.BarRenderer,
      rendererOptions: {
          // Put a 30 pixel margin between bars.
          barMargin: 30,
          // Highlight bars when mouse button pressed.
          // Disables default highlighting on mouse over.
          highlightMouseDown: true,
          fillToZero: true,
          animation: {
              speed: 2500
          }
      },
      pointLabels: {show: true}
    },
    axes: {
      xaxis: {
          renderer: $.jqplot.CategoryAxisRenderer,
          ticks : yearTicks
      },
      yaxis: {
        // Don't pad out the bottom of the data range.  By default,
        // axes scaled as if data extended 10% above and below the
        // actual range to prevent data points right on grid boundaries.
        // Don't want to do that here.
        padMin: 0,
        min: 0,
        label: 'Revenue in Billions($)',
        labelRenderer: $.jqplot.CanvasAxisLabelRenderer
      }
    },
    series:[
    {
    	label: 'Wireless'
    },
    {
    	label: 'Wireline'
    }
    ],
    legend: {
      show: true,
      location: 'e',
      placement: 'outside'
    }      
  });
  
  $('#chart1').bind('jqplotDataClick',function (ev, seriesIndex, pointIndex, data) {
		      //$('#info3').html('series: '+seriesIndex+', point: '+pointIndex+', data: '+data);
		      alert("Clicked");
		      //alert(seriesIndex);
		      alert(pointIndex);
		      //alert(data);
		      alert(yearTicks[pointIndex]);
		      var s1 = [18.1,18.5,18.9,19.8];
			  var s2 = [9.9,9.9,9.9,10.0];
			  var data = [s1,s2];
			  $("chart2").empty();
			  createPlot2(data);
		    }
		  ); 

 function createPlot2(data) {
	  var yearTicks = ['Q1','Q2','Q3','Q4'];
	  //alert(yearTicks);
	  plot1 = $.jqplot('chart2', data, {
	    // Tell the plot to stack the bars.
	    animate : true,
	    animateReplot: true,
	    stackSeries: true,
	    captureRightClick: true,
	    seriesDefaults:{
	      renderer:$.jqplot.BarRenderer,
	      rendererOptions: {
	          // Put a 30 pixel margin between bars.
	          barMargin: 30,
	          // Highlight bars when mouse button pressed.
	          // Disables default highlighting on mouse over.
	          highlightMouseDown: true,
	          fillToZero: true,
	          animation: {
	              speed: 2500
	          }
	      },
	      pointLabels: {show: true}
	    },
	    axes: {
	      xaxis: {
	          renderer: $.jqplot.CategoryAxisRenderer,
	          ticks : yearTicks
	      },
	      yaxis: {
	        // Don't pad out the bottom of the data range.  By default,
	        // axes scaled as if data extended 10% above and below the
	        // actual range to prevent data points right on grid boundaries.
	        // Don't want to do that here.
	        padMin: 0,
	        min: 0
	      }
	    },
	    series:[
	    {
	    	label: 'Wireless'
	    },
	    {
	    	label: 'Wireline'
	    }
	    ],
	    legend: {
	      show: true,
	      location: 'e',
	      placement: 'outside'
	    }      
	  });
 } 
  
});
 
</script>
<body>
<p>
Revenue Dashboard
</p>
<div id="chart1" style="width:600px; height:300px;"></div>
<br/><br/>
<div id="chart2" style="width:500px; height:300px;"></div>
</body>
</html>