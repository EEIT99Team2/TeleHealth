<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <script src="https://code.highcharts.com/highcharts.js"></script>
  <script src="https://code.highcharts.com/modules/data.js"></script>
  <script src="https://code.highcharts.com/modules/drilldown.js"></script>
          <!-- Bar Chart Card-->
          <div class="card mb-3">
            <div class="card-header navFontSize">
              <i class="fa fa-chart-bar"></i> 每月收入概況圖</div>
            <div class="card-body">
              <div id="container" style="min-width: 310px; height: 700px; margin: 0 auto">
              </div>
            </div>
          </div>
    
<script>
var chart = null; // 定义全局变量
$(document).ready(function() {
    chart = new Highcharts.Chart({
        chart: {
            renderTo: 'container',
            defaultSeriesType: 'column',
            events: {
                load: requestData
            }
        },

	    title: {
	        text: '每月收入概況圖',
	    },
	
	    subtitle: {
	        text: '2018'
	    },
	
	    xAxis: {
	        categories: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'],
		    labels: {
	            style: {
	                fontSize:'16px'
	            }
	        }
	    },
	
	    yAxis: {
	        title: {
	            text: '金額',
	            style: {
		            fontSize:'14px'
		        }
	        },
		    labels: {
	            style: {
	                fontSize:'14px'
	            }
	        }
	    },
	
	    series: [{
	        type: 'column',
	        colorByPoint: true,
	        name: 'price',
	        data: [],
	        showInLegend: false
	    }]
	});
});

function requestData() {
    $.ajax({
        url: '/TeleHealth/chart.do',
        type: 'GET',
        async: true,
        dataType: "json",
        success: function(point) {
            var series = chart.series[0].setData(point);

            // call it again after one second
//             setTimeout(requestData, 1000);    
        },
        cache: false
    });
}
</script>
