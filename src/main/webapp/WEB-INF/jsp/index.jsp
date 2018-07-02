<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html lang="en">
<head>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://code.highcharts.com/stock/highstock.js"></script>
<script src="https://code.highcharts.com/stock/modules/exporting.js"></script>
<script src="https://code.highcharts.com/stock/modules/export-data.js"></script>
<script type="text/javascript" src="/js/custom_script.js"></script>



<script>

	$(function() {

		/* default graph*/
		printGraphAndBaselines();
		 
	    /* attach a submit handler to the form */
	    $("#my_form").submit(function(event) {
	    	event.preventDefault(); //prevent default action 
	    	printGraphAndBaselines()
	    });
	    
	    /* attach hide/show behaviour to last year baseline */
	    $('#myLastYearConsumptionCheckbox').change(function() {
		    if (!$(this).is(':checked')) 
		    		$('#container').highcharts().yAxis[0].plotLinesAndBands[0].options.width=0;
		    else
		    	$('#container').highcharts().yAxis[0].plotLinesAndBands[0].options.width=2;
		    $('#container').highcharts().yAxis[0].update();
		});
	    
	    /* attach hide/show behaviour to last year baseline */
	    $('#myNeighborhoodConsumptionCheckbox').change(function() {
		    if (!$(this).is(':checked')) 
		    		$('#container').highcharts().yAxis[0].plotLinesAndBands[1].options.width=0;
		    else
		    	$('#container').highcharts().yAxis[0].plotLinesAndBands[1].options.width=2;
		    $('#container').highcharts().yAxis[0].update();
		});
});
</script>
</head>

<body>
	<div>
		<div>
			<h1>SmartH2O</h1>
			<h2>${message}</h2>
			<form id="my_form" action="http://localhost:8082/register/list"
				title="" method="POST">
				<table>
					<tr>
						<td><label class="title">Smart meter name</label> <input
							type="text" id="smart_meter_name" name="smart_meter_name"
							value="CH_AQU_50992045"></td>
						<td><label>Data inizio</label> <input type="datetime-local"
							value="2016-01-01T00:00" id="startDate"> <span
							class="validity"></span></td>
						<td><label>Data fine</label> <input type="datetime-local"
							value="2016-06-30T23:00" id="endDate"> <span
							class="validity"></span></td>
					</tr>
					<tr>
						<td><div id="baseline0">
								Last Year: <span id="myLastYearConsumption"></span> liters
								<input type="checkbox" id="myLastYearConsumptionCheckbox" checked/> <img alt="dashed red line" src="/img/dash_red.png" width="11%">
							</div>
						</td>
					</tr>
					<tr>
						<td><div id="baseline1">
								Neighborhood: <span id="myNeighborhoodConsumption"></span> liters
								<input type="checkbox" id="myNeighborhoodConsumptionCheckbox" checked /> <img alt="dashed blue line" src="/img/dash_blue.png" width="11%">
							</div>
						</td>
					</tr>

				</table>
				<div>
					<input type="submit" id="submitButton" name="submitButton"
						value="Submit">
				</div>

			</form>
			<div id="container" style="height: 400px"></div>
			Click on this <strong><a href="next">link</a></strong> to visit
			another page.
		</div>
	</div>
</body>
</html>