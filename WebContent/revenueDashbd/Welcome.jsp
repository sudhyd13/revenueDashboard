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
	var plot1 = null;
	var plot3 = null;
	$("#byPortfolioCheck").change(function(){
	//alert("Checkbox Clicked");
	    $("#vzCumRev").hide();
	    $("#byVzCheck").prop('checked',false);
		$("#vzCumRevByPort").show();
		plot3.replot();
	});
	$("#byVzCheck").change(function(){
		$("#vzCumRevByPort").hide();
		$("#chart2").hide();
		$("#byPortfolioCheck").prop('checked',false);
		$("#vzCumRev").show();
		plot1.replot();
	});
	
	$("#chart2").hide();
	$("#vzCumRevByPort").hide();
	createPlot1();
	createPlot3();
 
 function createPlot1(){
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
		      //alert("Clicked");
		      //alert(seriesIndex);
		      //alert(pointIndex);
		      //alert(data);
		      //alert(yearTicks[pointIndex]);
		      var s1 = [18.1,18.5,18.9,19.8];
			  var s2 = [9.9,9.9,9.9,10.0];
			  var data = [s1,s2];
			  $("#chart2").empty();
			  $("#chart2").show();
			  createPlot2(data);
		    }
		  ); 
 }
 
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
 }
 
 function createPlot3(){
	 //alert("In Document Ready")
	  var s1 = [75.4, 81,87.6];
	  var s2 = [39.8,38.6,38.4];
	  var s3 = [39.8,38.6,38.4];
	  var s4 = [39.8,38.6,38.4];
	  var yearTicks = [2012,2013,2014];
	  //alert(yearTicks);
	  plot3 = $.jqplot('chart3', [s1, s2, s3, s4], {
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
	    	label: 'N&T IT'
	    },
	    {
	    	label: 'CMB'
	    },
	    {
	    	label: 'VES'
	    }
	    ],
	    legend: {
	      show: true,
	      location: 'e',
	      placement: 'outside'
	    }      
	  });
	  
	  /* $('#chart1').bind('jqplotDataClick',function (ev, seriesIndex, pointIndex, data) {
			      //$('#info3').html('series: '+seriesIndex+', point: '+pointIndex+', data: '+data);
			      //alert("Clicked");
			      //alert(seriesIndex);
			      //alert(pointIndex);
			      //alert(data);
			      //alert(yearTicks[pointIndex]);
			      var s1 = [18.1,18.5,18.9,19.8];
				  var s2 = [9.9,9.9,9.9,10.0];
				  var data = [s1,s2];
				  $("#chart2").empty();
				  $("#chart2").show();
				  createPlot2(data);
			    }
			  );  */
}
 
});


 
</script>

<style type="text/css">

	/* jQplot Core css */
	.jqplot-target {
		margin-bottom: 2em;
        padding:0.5em;
        font-size: 16px; 
    }
    .note {
    	font-size: 0.8em;
   	}
   	
   	/* Container in the content render
   	*  Not rendering propery -- Need to fix(p3)
   	*/
   	.container_12 {
   		width: 100%;
		background:#2E5E79;
   	}
   	
   	/* Grid in the container */
   	.grid_10 {
		display: inline;
		float: left;
		margin-left: 1%;
		margin-right: 1%;
		background:#2E5E79;
		border: 1px solid;
	}
	/* Adjust width??? */
	.container_12 .grid_10 {
		width: 98%;
	}
	
	/* Block in the grid 
	*  Need to be replaced with grid???
	*/
	.block {
		display: inline;
		float: left;
		margin-left: 1%;
		margin-right: 1%;
		background:#fff;
		border: 1px solid;
		/* padding: 2px; */
		/* padding:10px 12px; */
	}
	.container_12 .grid_10 .block {
		width: 90%;
	}
	/* Title for the block*/
	.block h3 { 
		font-size:1.2em;
		font-weight:bold;
		color:#1B548D;
		background:#E6F0F3;
		text-align: left; margin: 0; margin-bottom: 10px;
		margin:-10px 0 -10px;
		padding:10px 12px; 
		border-bottom:1px solid #B3CBD6;
		border-radius: 5px 0px 0px;
	}
	/* .block p { 
		font-size:1.2em;
		font-weight:bold;
		color:#1B548D;
		background:#E6F0F3;
		text-align: left; margin: 0; margin-bottom: 10px;
		margin:-10px 0 -10px;
		padding:10px 12px; 
		border-bottom:1px solid #B3CBD6;
		border-radius: 5px 0px 0px;
	} */
	/* Export and Product dropdown */
	.block h2 { 
		font-size:1.0em;
		font-weight:normal;
		color:#1B548D;
		background:white;
		text-align: left;
		border: none;padding: 2px;
	}
	/* Region checkbox */
	.block h1 { 
		font-size:1.0em;
		font-weight:normal;
		color:#1B548D;
		background:white;
		text-align: left;
		border: none;padding: 2px;
	}
	
	/* Space between blocks in the grid
	*  Visibility -- hidden 
	*/
	.clearBlock {
		display: inline;
		float: left;
		margin-left: 1%;
		margin-right: 1%;
		background:#2E5E79;
		border: 1px solid;
	}	
	.container_12 .grid_10 .clear {
		width: 90%;
	}
	
	/* Space between blocks in the grid
	*  Visibility -- hidden 
	*/
	.clear {
		display: inline;
		float: left;
		margin-left: 1%;
		margin-right: 1%;
		background:#fff;
		border: 1px solid;
		visibility: hidden;
	}	
	.container_12 .grid_10 .clear {
		width: 80%;
	}
	.clear h3 { 
		font-size:1.2em;
		font-weight:bold;
		color:#1B548D;
		background:#E6F0F3;
		text-align: left; margin: 0; margin-bottom: 10px;
		margin:-10px 0 -10px;
		padding:10px 12px; 
		border-bottom:1px solid #B3CBD6;
		border-radius: 5px 0px 0px;
		visibility: hidden;
	}
    
    /* Title for jQueryUI Dialog Window */
    .myTitleClass .ui-dialog-titlebar {
    	background:#E6F0F3;
    	font-size:1.0em;
		font-weight:bold;
		color:#1B548D;
		padding:10px 12px;
	}
    
    /* Ignore the below styles */
   	#container { width: 700px; height: 400px; }
	#container h3 { text-align: center; margin: 0; margin-bottom: 10px; }
	#container { padding:0.5em; }
	.box {
		background:#fff;
		margin-bottom:20px;
		padding:10px 10px 10px; margin-left:-8px;
	}
	.box.round{
	 	-moz-border-radius: 5px 5px 0px 0px; /* Firefox */
	  	-webkit-border-radius: 5px 5px 0px 0px; /* Safari, Chrome */
	  	border-radius:5px 0px 0px; /* CSS3 */
	}
	.box h2 {
		font-size:1.2em;
		font-weight:bold;
		color:#1B548D;
		background:#E6F0F3;
		margin:-10px -10px 0 -10px;
		padding:10px 12px;
		border-bottom:1px solid #B3CBD6;
		
		-moz-border-radius: 5px 5px 0px 0px; /* Firefox */
		-webkit-border-radius: 5px 5px 0px 0px; /* Safari, Chrome */
		 border-radius: 5px 0px 0px; /* CSS3 */
	}
	.box.first{margin-top:20px;}
	/* .block {
		padding-top:20px;
	} */
 	table .myTable{
  border-collapse: separate;
  border-spacing: 0;
  text-align:center;
    margin-left:auto; 
    margin-right:auto; 
    /* padding-left:40px; */
    /* width:100px; */
    table-layout: fixed; 
 word-wrap:break-word; 
    
} 
   .myTable td  {
   padding: 10px 15px; 
}  
   .myTable thead {
   background:#E6F0F3;  
   /* background:#fff; */
  color:#1B548D;
}

.myTable tfoot {
   background:#E6F0F3;  
   /* background:#fff; */
  color:#1B548D;
}
 .myTable th {
  font-weight: bold;
  width: 10px
}
 .myTable tbody tr:nth-child(even) {
  background: #f0f0f2;
}
 .myTable td {
 border-bottom: 1px solid #cecfd5;
  border-right: 1px solid #cecfd5; 
  border: 1px solid #cecfd5;
}
 .myTable td:first-child .myTable{
  border-left: 1px solid #cecfd5; 
  }
 /*  #dTable1 {
        font-size: 12px;
        border: 1px solid #cdcdcd;
        border-collapse: collapse;
    }
    #dTable1 td, #dTable1 th {
        border: 1px solid #cdcdcd;
        padding: 1px 4px;
    } */
}
</style>

<body>
<p>
Revenue Dashboard
</p>

<div class="container_12" >

  <div class="grid_10">
  	<br/><br/>
   	<div class="block" id="vzCumRev">
   	    <h3 class="ui-widget-header">Verizon Cumulative Revenue</h3>
   	    <br/>
   	    <h2 class="ui-widget-header">
   	    <span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
	  	<span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span> 
	  	<span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
	  	<span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
	  	<!-- Checkbox For Drilldown to Portfolio Level -->
	  	<span><input type="checkbox" id="byPortfolioCheck" />By Portfolio</span>
   	    </h2>
   		<div id="chart1" style="width:600px; height:300px;"></div>
		<br/><br/>
		<div id="chart2" style="width:600px; height:300px;"></div>
  	</div> <!-- End Of block-vzCumRev -->
  	
  	<div class="block" id="vzCumRevByPort">
   	    <h3 class="ui-widget-header">Verizon Cumulative Revenue BY Portfolio</h3>
   	    <br/>
   	    <h2 class="ui-widget-header">
   	    <span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
	  	<span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span> 
	  	<span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
	  	<span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
	  	<!-- Checkbox For Drilldown to Portfolio Level -->
	  	<span><input type="checkbox" id="byVzCheck" />By Verizon</span>
   	    </h2>
   	    <h1 class="ui-widget-header">
		<span>&nbsp</span><span>Period:
	    <span><input type="checkbox" class="periodCheck" id="periodCheck1" value='1'/>Yearly</span>
	    <span><input type="checkbox" class="periodCheck" id="periodCheck2" value='2'/>Quarterly</span>
	    </span>
	    </h1>
   		<div id="chart3" style="width:600px; height:300px;"></div>
   		<div id="chart4" style="width:600px; height:300px;"></div>
		<br/><br/>
  	</div> <!-- End Of block-vzCumRev -->
  	
   </div> <!-- End of grid_10 -->
</div> <!-- End of container_12 -->
</body>
</html>