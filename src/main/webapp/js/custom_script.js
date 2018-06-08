const M_CUBE_TO_LITER = 1000;

function buildGraph(data) {
	var processed_json = new Array();
	for (i = 0; i < data.length; i++)
		processed_json.push([ data[i].unixTimestamp, data[i].value * M_CUBE_TO_LITER ]);
	
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
        yAxis: {
            min: 0,
            allowDecimals: false,
            gridLineColor: '#bfbfbf',
            plotLines: [{ 
                id: 'lastYear',
            	value: $('#myLastYearConsumption').html(),
                width: 2,
                color: 'red',
                dashStyle: 'dash',
                label: {
                    text: 'Last year',
                    align: 'left',
                    y: 12,
                    x: 5
                }
              }]
              
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
		tooltip: {
  	        valueDecimals: 2,
  	      	valueSuffix: ' liters'
  	    },
	});
}

/* ajax call */
function requestRESTRegisters(url,request_method){
	
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
		}
	});
}

/* ajax call */
function requestRESTBaselines(url,request_method){
	
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
			
			$('#myLastYearConsumption').html(data);
		}
	});
}