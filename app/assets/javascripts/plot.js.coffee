$ ->
  $(document).ready ->
	  chart = new Highcharts.Chart
	    chart:
	      renderTo: 'container-plot'
	      type: 'line'
	      width: '650'
	      shadow: 'true'
	      marginRight: 100
	      marginBottom: 60
	    title: 
	      text: 'tffr与负载均衡对比'
	      x: -20
	    subtitle: 
	      text: '半径与中断率关系'
	      x: -20
	    xAxis: 
	      title: 
	        text: '半径 (米)'
	      categories:['467', '500', '533', '550', '567', '600']

	    yAxis: 
	      title: 
	        text: '中断率 (%)'
	      plotLines: 
	        [value: 0,
	        width: 1,
	        color: '#808080']

	    tooltip: 
	      formatter: ->
	        "<b>#{this.series.name}</b><br/>#{this.x}:#{this.y}%"
	    legend: 
	      layout: 'vertical'
	      align: 'right'
	      verticalAlign: 'top'
	      x: -10
	      y: 100
	      borderWidth: 0

	    series: [
	        name: 'normal-uplink'
	        data: [0.72,1.91,3.10,3.50,4.30,5.62]
	      , 
	        name: 'normal-downlink'
	        data: [2.57,3.30,5.02,5.55,8.06,10.78]
	      , 
	        name: 'tffr-uplink'
	        data: [0.39,1.58,2.97,3.17,3.83,5.48]
	      , 
	        name: 'tffr-downlink'
	        data: [2.18,3.76,6.87,7.73,9.45,11.11]
	      ]