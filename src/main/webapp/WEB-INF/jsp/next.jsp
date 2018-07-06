<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html lang="en">
<body>
<head>

<!--===============================================================================================-->

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://code.highcharts.com/stock/highstock.js"></script>
<script src="https://code.highcharts.com/stock/modules/exporting.js"></script>
<script src="https://code.highcharts.com/stock/modules/export-data.js"></script>
<script type="text/javascript" src="/js/custom_script.js"></script>
<link rel="stylesheet" type="text/css"
	href="./ContactFrom_v1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="../ContactFrom_v1/css/util.css">
<link rel="stylesheet" type="text/css"
	href="../ContactFrom_v1/css/main.css">

<!--===============================================================================================-->

<script>
	$(function() {

		/* default graph*/
		printDefaultGraphAndBaselines();

		/* attach a submit handler to the form */
		$("#my_form").submit(function(event) {
			event.preventDefault(); //prevent default action 
			printGraphAndBaselines()
		});

		/* attach hide/show behaviour to last year baseline */
		$('#myLastYearConsumptionCheckbox')
				.change(
						function() {
							if (!$(this).is(':checked'))
								$('#container').highcharts().yAxis[0].plotLinesAndBands[0].options.width = 0;
							else
								$('#container').highcharts().yAxis[0].plotLinesAndBands[0].options.width = 2;
							$('#container').highcharts().yAxis[0].update();
						});

		/* attach hide/show behaviour to last year baseline */
		$('#myNeighborhoodConsumptionCheckbox')
				.change(
						function() {
							if (!$(this).is(':checked'))
								$('#container').highcharts().yAxis[0].plotLinesAndBands[1].options.width = 0;
							else
								$('#container').highcharts().yAxis[0].plotLinesAndBands[1].options.width = 2;
							$('#container').highcharts().yAxis[0].update();
						});

	});
</script>
<title>SmartH2O App</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>

	<div class="contact1">

		<div class="container-contact1">

			<div class="contact1-pic">
				<div id="container" style="height: 400px"></div>
			</div>
			<form id="my_form" action="http://localhost:8082/register/list"
				title="" method="POST">
				<h2>SmartH2O</h2>

				<br>
				<div class="wrap-input1 ">
					<label>Smart meter&nbsp;</label><select id="smart_meter_name"
						name="smart_meter_name"></select> <span class="shadow-input1"></span>
				</div>

				<div class="wrap-input1">
					<label>Start Date </label> <input type="datetime-local"
						value="2016-01-01T00:00" id="startDate"> <span
						class="validity"></span> <span class="shadow-input1"></span>
				</div>

				<div class="wrap-input1">
					<label>End Date </label> <input type="datetime-local"
						value="2016-06-30T23:00" id="endDate"> <span
						class="validity"></span> <span class="shadow-input1"></span>
				</div>
				<div class="wrap-input1">

					<div id="baseline0">
						<input type="checkbox" id="myLastYearConsumptionCheckbox" checked />
						<img alt="dashed red line" src="/img/dash_red.png" width="11%">
						Last Year: <span id="myLastYearConsumption"></span> liters
					</div>

					<div id="baseline1">
						<input type="checkbox" id="myNeighborhoodConsumptionCheckbox"
							checked /> <img alt="dashed blue line" src="/img/dash_blue.png"
							width="11%"> Neighborhood: <span
							id="myNeighborhoodConsumption"></span> liters
					</div>


				</div>
				<div>
					<input type="submit" id="submitButton" name="submitButton"
						class="contact1-form-btn" value="Submit">
				</div>
			</form>

		</div>
	</div>
	<div>
		Click on this <strong><a href="/">link</a></strong> to visit previous
		page.
	</div>
</body>
</html>