const M_CUBE_TO_LITER = 1000;

/* 
 * Default graph loaded
 */
function printDefaultGraphAndBaselines(){
	$.when( requestRESTSmartMeterList('http://localhost:8082/register/smartMeterList','GET') ).then(function(){
		$.when( requestRESTBaselineMyNeighborhood('http://localhost:8082/baseline/myNeighborhood','POST'),
				requestRESTBaselineLastYear('http://localhost:8082/baseline/lastYear','POST')).then(
				function (myNeighborhoodResponse, lastYearResponse) {
					$('#myNeighborhoodConsumption').html(myNeighborhoodResponse[0]);
					$('#myLastYearConsumption').html(lastYearResponse[0]);
					requestRESTRegisters('http://localhost:8082/register/list','POST');
				}).fail(
						function (error) {
							alert(error.responseText);
						}
						);
	});
} 
/* 
 * get first baselines before build graph
 */
function printGraphAndBaselines(){
		$.when( requestRESTBaselineMyNeighborhood('http://localhost:8082/baseline/myNeighborhood','POST'),
				requestRESTBaselineLastYear('http://localhost:8082/baseline/lastYear','POST')).then(
				function (myNeighborhoodResponse, lastYearResponse) {
					$('#myNeighborhoodConsumption').html(myNeighborhoodResponse[0]);
					$('#myLastYearConsumption').html(lastYearResponse[0]);
					requestRESTRegisters('http://localhost:8082/register/list','POST');
				}).fail(
						function (error) {
							alert(error.responseText);
						}
						);
} 

function buildGraph(data) {
	var processed_json = new Array();
	for (i = 0; i < data.length; i++)
		processed_json.push([ data[i].unixTimestamp,
				data[i].value * M_CUBE_TO_LITER ]);

	// create the chart
	Highcharts.stockChart('container', {
		chart : {
			alignTicks : false
		},

		rangeSelector : {
			selected : 1
		},

		title : {
			text : 'Water Consumption'
		},
		yAxis : {
			min : 0,
			allowDecimals : false,
			gridLineColor : '#bfbfbf',
			plotLines : [ {
				id : 'lastYear',
				value : $('#myLastYearConsumption').html(),
				width : 2,
				color : 'red',
				dashStyle : 'dash',
				label : {
					text : '',
					align : 'left',
					y : 12,
					x : 5
				}
			}, {
				id : 'myNeighborhood',
				value : $('#myNeighborhoodConsumption').html(),
				width : 2,
				color : 'blue',
				dashStyle : 'dash',
				label : {
					text : '',
					align : 'left',
					y : 12,
					x : 5
				}
			} ]

		},

		series : [ {
			type : 'column',
			data : processed_json,
			name : 'water',
			dataGrouping : {
				units : [ [ 'week', // unit name
				[ 1 ] // allowed multiples
				], [ 'month', [ 1, 2, 3, 4, 6 ] ] ]
			}
		} ],
		tooltip : {
			valueDecimals : 2,
			valueSuffix : ' liters'
		},
	});
}

/* ajax call for list of registers*/
function requestRESTRegisters(url, request_method) {

	$.ajax({
		url : url,
		type : request_method,
		data : JSON.stringify({
			meteringPointName : $('#smart_meter_name').val(),
			startDate : $('#startDate').val(),
			endDate : $('#endDate').val()
		}),
		contentType : "application/json",
		success : function(data) {
			buildGraph(data);
		},
		error : function(error){
			alert(error.responseText);
		}
	});
}

/* ajax call for last year */
function requestRESTBaselineLastYear(url, request_method) {

	return $.ajax({
		url : url,
		type : request_method,
		data : JSON.stringify({
			meteringPointName : $('#smart_meter_name').val(),
			startDate : $('#startDate').val(),
			endDate : $('#endDate').val()
		}),
		contentType : "application/json"
	});
}

/* ajax call for neighborhood */
function requestRESTBaselineMyNeighborhood(url, request_method) {

	return $.ajax({
		url : url,
		type : request_method,
		data : JSON.stringify({
			meteringPointName : $('#smart_meter_name').val(),
			startDate : $('#startDate').val(),
			endDate : $('#endDate').val()
		}),
		contentType : "application/json"
	});
}

/* ajax call for smart meter list */
function requestRESTSmartMeterList(url, request_method) {

	return $.ajax({
		url : url,
		type : request_method,
		cache:true,
		contentType : "application/json",
		success : function(data){
			// Populate dropdown
			/* attach smart meter list to dropdown menu */
		    let dropdown = $('#smart_meter_name');
		    dropdown.empty();
		    dropdown.append('<option value = "CH_AQU_50992045" selected="true">CH_AQU_50992045</option>');
		    dropdown.prop('selectedIndex', 0);
		      $.each(data, function (index,value) {
		    	dropdown.append('<option value=' + value + '>' + value + '</option>');
		      });
		}
	});
}
