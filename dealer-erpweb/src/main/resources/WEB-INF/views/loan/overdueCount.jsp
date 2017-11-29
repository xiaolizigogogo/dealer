
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible"
	content="IE=9; IE=8; IE=7; IE=edge; chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Cache-Control" content="no-transform">
<title>e车贷管理系统-借款人基本信息</title>
<%@include file="../common/taglibs.jsp"%>
<!-- <link rel="stylesheet" -->
<%-- 	href="${basePath}/css/bootstrap-datetimepicker.min.css"> --%>
<%-- <script src="${basePath}/js/bootstrap-datetimepicker.min.js"></script> --%>
<%-- <script src="${basePath}/js/bootstrap-datetimepicker.zh-CN.js"></script> --%>
<%-- <script src="${basePath}/js/datetimepicker.js"></script> --%>
<%-- <script src="${basePath}/js/jquery.validate.js"></script> --%>
<link rel="stylesheet" type="text/css" href="${basePath}/css/bootstrap/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="${basePath}/css/libs/font-awesome.css"/>
<link rel="stylesheet" type="text/css" href="${basePath}/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${basePath}/css/index.css"/>


<%-- <link href="${basePath}/css/bootstrap/bootstrap.min.css" rel="stylesheet"> --%>
<link rel="stylesheet" href="${basePath}/css/bootstrap/bootstrap-table.css">
<!-- <link rel="stylesheet" type="text/css" href="../css/libs/font-awesome.css"/> -->
<!-- <link rel="stylesheet" type="text/css" href="../css/common.css"/> -->
<link rel="stylesheet" type="text/css" href="${basePath}/css/anychart-ui.min.css"/>

</head>
<style>
html, body, #container {
	width: 100%;
	height: 600px;
	margin: 0;
	padding: 0;
}
</style>

<body>
<div class="clearfix" style="padding:15px; ">
<div class="from_box">
  <div class="from_tit clearfix">
    <h3 class="pull-left">逾期统计</h3>
  </div>
      <div class="col-sm-11" >
         <div id="container"></div></div>
      </div>
</div>
</body>
<%-- <script type="text/javascript" src="${basePath}/js/jquery.js"></script> --%>
<%-- <script type="text/javascript" src="${basePath}/js/bootstrap.js"></script> --%>
<%-- <script type="text/javascript" src="${basePath}/js/scripts.js"></script> --%>
<%-- <script type="text/javascript" src="${basePath}/js/pace.min.js"></script> --%>
<%-- <script type="text/javascript" src="${basePath}/js/tab-control.js"></script> --%>
<script src="${basePath}/js/jquery.js" ></script>
<script src="${basePath}/js/bootstrap.js"></script>
<script src="${basePath}/js/common.js"></script>
<script src="${basePath}/js/anychart-bundle.min.js"></script>
  
  <script src="${basePath}/js/anychart.min.js"></script>
<script src="${basePath}/js/anychart-ui.min.js"></script>
  
  
<script type="text/javascript">
         anychart.onDocumentReady(function() {
  // create data set on our data
   $.ajax({
			url:"${basePath}/admin/loan/queryoverduecount",
			type:"get",
			datatype:"json",
			success:function(data){
			var a=data.overduecount;
           var dataSet = anychart.data.set([
    ['1月', a[0], 16, 20, 33],
    ['2月', a[1], 20, 25, 30],
    ['3月', a[2], 21, 28, 31],
	 ['4月', a[3], 18, 27, 28],
	  ['5月', a[4], 19, 25, 39],
	   ['6月', a[5], 24, 25, 21],
	    ['7月', a[6], 20, 37, 30],
		 ['8月', a[7], 16, 35, 22],
		  ['9月', a[8], 17, 35, 35],
		   ['10月', a[9], 30, 33, 40],
		    ['11月', a[10], 15, 27, 33],
			 ['12月', a[11], 26, 28, 32]
  ]);

  // map data for the first series, take x from the zero column and value from the first column of data set
  var seriesData_1 = dataSet.mapAs({x: [0], value: [1]});

  // map data for the second series, take x from the zero column and value from the second column of data set
  var seriesData_2 = dataSet.mapAs({x: [0], value: [2]});

  // map data for the third series, take x from the zero column and value from the third column of data set
  var seriesData_3 = dataSet.mapAs({x: [0], value: [3]});

  // map data for the fourth series, take x from the zero column and value from the fourth column of data set
  var seriesData_4 = dataSet.mapAs({x: [0], value: [4]});

  // map data for the fourth series, take x from the zero column and value from the fourth column of data set
  var seriesData_5 = dataSet.mapAs({x: [0], value: [5]});
    // map data for the fourth series, take x from the zero column and value from the fourth column of data set
  var seriesData_6 = dataSet.mapAs({x: [0], value: [6]});
    // map data for the fourth series, take x from the zero column and value from the fourth column of data set
  var seriesData_7 = dataSet.mapAs({x: [0], value: [7]});
    // map data for the fourth series, take x from the zero column and value from the fourth column of data set
  var seriesData_8 = dataSet.mapAs({x: [0], value: [8]});
    var seriesData_9 = dataSet.mapAs({x: [0], value: [9]});
    // map data for the fourth series, take x from the zero column and value from the fourth column of data set
  var seriesData_10 = dataSet.mapAs({x: [0], value: [10]});
    // map data for the fourth series, take x from the zero column and value from the fourth column of data set
  var seriesData_11 = dataSet.mapAs({x: [0], value: [11]});
    // map data for the fourth series, take x from the zero column and value from the fourth column of data set
  var seriesData_12 = dataSet.mapAs({x: [0], value: [12]});
  // create column chart
  chart = anychart.column3d();

  // set container id for the chart
  chart.container('container');

  // set chart title text settings
  chart.title('2016年逾期统计');
  chart.title().padding([0,0,5,0]);
  chart.interactivity().hoverMode('single');

  chart.xAxis().stroke(null);
  chart.xAxis(1).stroke(null).orientation('top');
  chart.yAxis().title('逾期单数');
  chart.yAxis().labels().textFormatter(function(){
    if (this.value == 0) return this.value;
    return this.value;
  });

  var zeroMarker = chart.lineMarker(0);
  zeroMarker.stroke("#ddd");
  zeroMarker.scale(chart.yScale());
  zeroMarker.value(0);

  // helper function to setup label settings for all series
  var setupSeries = function(series, name) {
    series.name(name);
    series.labels().enabled(true);
    series.tooltip().titleFormatter(function(){return this.x});
    series.tooltip().textFormatter(function () {
return this.seriesName + '\n 逾期单数： ' + this.value +'单';
    });
  };

  // temp variable to store series instance
  var series;

  // create first series with mapped data
  series = chart.column(seriesData_1);
  setupSeries(series, '业务部');

  // create second series with mapped data
  //series = chart.column(seriesData_2);
  //setupSeries(series, '门店二');

  // create third series with mapped data
  //series = chart.column(seriesData_3);
  //setupSeries(series, '门店三');

  // create fourth series with mapped data
  //series = chart.column(seriesData_4);
  //setupSeries(series, '门店四');


  // turn on legend
  chart.legend().enabled(true).fontSize(13).padding([0,0,20,0]);

  chart.grid();
  chart.grid(1).layout('vertical');
  chart.yScale().minimum(0);

  chart.barsPadding(0.1);
  chart.barGroupsPadding(0.9);
  //添加点击事件
 chart.listen("pointClick", function(e){
  var index = e.iterator.getIndex();
  var row = dataSet.row(index);
  var month = row[0];
  window.location = "/admin/loan/overdueList.html?date="+month.substring(0, 1) ;
  });
  // initiate chart drawing
  chart.draw();
  }})
});




        </script>
</html>

