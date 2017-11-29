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
<body>
<div class="col-sm-12">
  <div class=" col-sm-12">
    <div class="from_box">
      <div class="from_tit clearfix">
        <h3 class="pull-left">客户月统计</h3>
      </div>
      <div class="col-sm-11" >
         <div id="chart_mon" style=" height:600px;"></div>
      </div>
    </div>
  </div>
  <div class=" col-sm-4">
    <div class="from_box clearfix">
      <div class="from_tit clearfix">
        <h3 class="pull-left">客户行业统计</h3>
      </div>
      
     <div id="chart_industry" style=" height:350px;"></div>
    </div>
  </div>
  <div class="col-sm-4">
    <div class="from_box">
      <div class="from_tit clearfix">
        <h3 class="pull-left">客户年龄统计</h3>
      </div>
     <div id="chart_age" style=" height:350px;"></div>
    </div>
  </div>
  <div class="col-sm-4">
    <div class="from_box">
      <div class="from_tit clearfix">
        <h3 class="pull-left">客户产品类型统计</h3>
      </div>
      <div id="container" style=" height:350px;"></div>
    </div>
  </div>
</div>
<div id="fade2" class="black_overlayx"> </div>
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
  
  
<script>

       anychart.onDocumentReady(function() {
		   // create data set on our data

		   
		$.ajax({
			url:"${basePath}/admin/loan/queryenterpriseIndustrycount",
			type:"get",
			async:false,
			datatype:"json",
			success:function(data){
              debugger;
				var a=[0,0,0,0,0,0,0,0,0,0,0,0];
				var arrayLength = data.enterpriseIndustrycount.length;
              debugger;
				for (var i =0;i<arrayLength;i++){
						if(data.enterpriseIndustrycount != null){
								if(data.enterpriseIndustrycount[i].industry == "a"){
                                  a[9]=data.enterpriseIndustrycount[i].count;
                                }else if (data.enterpriseIndustrycount[i].industry == "b"){
                                  a[10]=data.enterpriseIndustrycount[i].count;
                                }else if (data.enterpriseIndustrycount[i].industry == "c"){
                                  a[11]=data.enterpriseIndustrycount[i].count;
                                }
					}
                  switch(data.enterpriseIndustrycount[i].industry){
                    case "1":
                      a[1] = parseInt(data.enterpriseIndustrycount[i].count);
                      break;
                    case "2":
                      a[2] = parseInt(data.enterpriseIndustrycount[i].count);
                      break;
                    case "3":
                      a[3] = parseInt(data.enterpriseIndustrycount[i].count);
                      break;
                    case "8":
                      a[8] = parseInt(data.enterpriseIndustrycount[i].count);
                      break;
                    default:
                      a[parseInt(data.enterpriseIndustrycount[i].industry)]=parseInt(data.enterpriseIndustrycount[i].count);
                      break;
                  }
				}

				chart_industry=anychart.pie3d([
			                                        ['计算机/互联网/通信/电子', a[0]],
											        ['会计/金融/银行/保险', a[1]],
											        ['贸易/消费/制造/营运', a[2]],
											        ['制药/医疗', a[3]],
											        ['广告/媒体', a[4]],
											    	['房地产/建筑', a[5]],
												    ['专业服务/教育/培训', a[6]],
											        ['服务业', a[7]],
											        ['物流/运输', a[8]],
											        ['能源/原材料', a[9]],
												    ['私营企业主', a[10]],
												    ['政府/非赢利机构/其他', a[11]]
			                              ]);
			                               chart_industry.title('客户行业统计');
			                             chart_industry.container('chart_industry');
			                              // initiate chart drawing
			                              chart_industry.draw();
			                              chart_industry.tooltip().textFormatter(function () {
			                                  return" 人数: "+this.value+"\n所占比例: "+(100*this.value/this.getStat("sum")).toFixed(1)+"%";
			                                });
			}
			
		})   
		   
		$.ajax({
			url:"${basePath}/admin/loan/queryagecount",
			type:"get",
			async:false,
			datatype:"json",
			success:function(data){
				var a=data.agecount;
				
				chart_age=anychart.pie3d([
				                          ['20-29', a[0]],
				                             ['30-39', a[1]],
				                             ['40-49', a[2]],
				                             ['50-59', a[3]],
				                             ['60以上', a[4]]
				                         ]);
				                          chart_age.title('客户年龄统计');
				                        chart_age.container('chart_age');
				                         // initiate chart drawing
				                         chart_age.draw();
				                         chart_age.tooltip().textFormatter(function () {
				                             return" 人数: "+this.value+"\n所占比例: "+(100*this.value/this.getStat("sum")).toFixed(1)+"%";
				                           });
			}
		})  
		$.ajax({
			url:"${basePath}/admin/loan/queryloanModecount",
			type:"get",
			async:false,
			datatype:"json",
			success:function(data){
				var a=data.agecount;
				
                chart = anychart.pie3d([
                        ['等本等息', a[0]],
					    ['先息后本', a[1]],
					    ['灵活还款', a[2]],
					    ['等本减息', a[3]],
					    ['等本零息', a[4]], 
					    ['先息后本(押证)',a[5]],
					    ['先息后本(押车)',a[6]]
                     
                  ]);
                  chart.tooltip().textFormatter(function () {
                      return" 订单数: "+this.value+"\n所占比例: "+(100*this.value/this.getStat("sum")).toFixed(1)+"%";
                    });
                  // set container id for the chart
                  chart.container('container');
                  // set chart title text settings
                  chart.title('客户产品类型统计');

                  // initiate chart drawing
                  chart.draw();
			}
		})
		   
		  $.ajax({
			url:"${basePath}/admin/loan/querycustomercount",
			type:"get",
			async:false,
			datatype:"json",
			success:function(data){
			var a=[0,0,0,0,0,0,0,0,0,0,0,0];
              for (var i =0;i<data.customercount.length;i++)
              {
                a[parseInt(data.customercount[i].month.substr(5,2))-1]=parseInt(data.customercount[i].count);
              }

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
  chart_mon = anychart.column3d();

  // set container id for the chart
  chart_mon.container('chart_mon');
	var myDate = new Date();
	var yeardate = myDate.getFullYear();
  // set chart title text settings
  chart_mon.title(yeardate+'年门店客户统计');
  chart_mon.title().padding([0,0,5,0]);
  chart_mon.interactivity().hoverMode('single');
  chart_mon.yScale().minimum(0);
  chart_mon.xAxis().stroke(null);
  chart_mon.xAxis(1).stroke(null).orientation('top');
  chart_mon.yAxis().title('客户数量');
  chart_mon.yAxis().labels().textFormatter(function(){
    if (this.value == 0) return this.value;
    return this.value;
  });

  var zeroMarker = chart_mon.lineMarker(0);
  zeroMarker.stroke("#ddd");
  zeroMarker.scale(chart_mon.yScale());
  zeroMarker.value(0);

  // helper function to setup label settings for all series
  var setupSeries = function(series, name) {
    series.name(name);
    series.labels().enabled(true);
    series.tooltip().titleFormatter(function(){return this.x});
    series.tooltip().textFormatter(function () {
return this.seriesName +'新增'+ ': ' + parseInt(this.value).toLocaleString() + '人';
    });
  };

  // temp variable to store series instance
  var series;

  // create first series with mapped data
  series = chart_mon.column(seriesData_1);
  setupSeries(series, '业务部');

  // create second series with mapped data
  //series = chart_mon.column(seriesData_2);
  //setupSeries(series, '门店二');

  // create third series with mapped data
 // series = chart_mon.column(seriesData_3);
 // setupSeries(series, '门店三');

  // create fourth series with mapped data
  //series = chart_mon.column(seriesData_4);
  //setupSeries(series, '门店四');


  // turn on legend
  chart_mon.legend().enabled(true).fontSize(13).padding([0,0,20,0]);

  chart_mon.grid();
  chart_mon.grid(1).layout('vertical');

  chart_mon.barsPadding(0.1);
  chart_mon.barGroupsPadding(0.9);
  // initiate chart drawing
  
  //添加点击事件
 chart_mon.listen("pointClick", function(e){
  var index = e.iterator.getIndex();
  var row = dataSet.row(index);
  var month = row[0];
  window.location = "/admin/loan/customerList.html?date="+month.substring(0, 2) ;
});
  

  chart_mon.draw();

			
			 }})

		   
		   
//   // create pie chart with passed data
//   chart = anychart.pie3d([
//         ['零首付购车', 235],
//       ['全款车抵押贷2分9', 552],
//       ['全款车抵押贷等本零息', 491],
//       ['按揭车押车贷', 619],
//       ['全款车押车贷', 388] 
     
//   ]);
//   chart.tooltip().textFormatter(function () {
//       return" 订单数: "+this.value+"\n所占比例: "+(100*this.value/this.getStat("sum")).toFixed(1)+"%";
//     });
//   // set container id for the chart
//   chart.container('container');
//   // set chart title text settings
//   chart.title('客户产品类型统计');

//   // initiate chart drawing
//   chart.draw();
  
  
//   chart_industry=anychart.pie3d([
//       ['计算机/互联网/通信/电子', 235],
//       ['会计/金融/银行/保险', 552],
//       ['贸易/消费/制造/营运', 491],
//       ['制药/医疗', 619],
//       ['广告/媒体', 388],
// 	  ['房地产/建筑', 235],
// 	  ['专业服务/教育/培训', 491],
//       ['服务业', 552],
//       ['物流/运输', 491],
//       ['能源/原材料', 619],
// 	  ['私营企业主', 619],
// 	  ['政府/非赢利机构/其他', 619]
//   ]);
//    chart_industry.title('客户行业统计');
//  chart_industry.container('chart_industry');
//   // initiate chart drawing
//   chart_industry.draw();
//   chart_industry.tooltip().textFormatter(function () {
//       return" 订单数: "+this.value+"\n所占比例: "+(100*this.value/this.getStat("sum")).toFixed(1)+"%";
//     });
	
// 	chart_age=anychart.pie3d([
//    ['20-29', 235],
//       ['30-39', 552],
//       ['40-49', 491],
//       ['50-59', 619],
//       ['60以上', 388]
//   ]);
//    chart_age.title('客户年龄统计');
//  chart_age.container('chart_age');
//   // initiate chart drawing
//   chart_age.draw();
//   chart_age.tooltip().textFormatter(function () {
//       return" 人数: "+this.value+"\n所占比例: "+(100*this.value/this.getStat("sum")).toFixed(1)+"%";
//     });
	
	
	
  
});
    </script>
</html>

