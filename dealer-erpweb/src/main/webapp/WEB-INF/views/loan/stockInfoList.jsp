<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=edge; chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Cache-Control" content="no-transform">
    <title>e车贷管理系统—车贷存量管理</title>
    <%@include file="../common/taglibs.jsp" %>
    <link rel="stylesheet" href="${basePath}/css/bootstrap-datetimepicker.min.css">
<%--     <link rel="stylesheet" href="${ basePath }/css/bootstrap/bootstrap-table.css"> --%>
    <script src="${basePath}/js/bootstrap-datetimepicker.min.js"></script>
    <script src="${basePath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="${basePath}/js/datetimepicker.js"></script>
    <script src="${basePath}/js/uploadPreview.js" type="text/javascript"></script>
    <script type="text/javascript" src="${basePath}/js/dateRange.js"></script>
    <script src="${basePath}/js/tableutils.js"></script>
    <link rel="stylesheet" type="text/css" href="${basePath}/css/dateRange.css"/>
    <style type="text/css">
    .table > tbody > tr > td.tr_back,.table-striped > tbody > tr:nth-child(odd) > td.tr_back, .table-striped > tbody > tr:nth-child(odd) > th.tr_back{background-color:#FCF8E3; !important;}
</style>
</head>
<body>
<input type="hidden" id="startDate" />
<input type="hidden" id="endDate" />
<div class="tools_bar col-lg-12">
  <div class="clearfix">
    <form class="form-inline pull-left" role="form">
    
     <div class="form-group">
    <!--    <div class="ta_date" id="div_date1"> <span class="date_title" id="date1"></span> <a class="opt_sel" id="input_trigger1" href="#"> <i class="i_orderd"></i> </a> </div>
        <div id="datePicker1"></div>
		-->
		<div class="col-sm-8">
				<select class="form-control error" id="year" name="year">
					<option>请选择</option>
				</select>
			</div>
      </div>
      <button type="button" onclick="select()" class="btn btn-primary btn-search"><i class="fa fa-search"></i> 搜索</button>
    </form>
  </div>
  <div class="list_btn">
    <ul class="list-inline">
      <!--<li><a class="btn btn-danger"   href = "javascript:void(0)" id="dc_btn"> <i class="fa fa-download"></i>导出</a></li>-->
      <li><p class="text-danger" id="dc_tip" style="display:none;">车贷收入列表.xls已导出</p></li>
    </ul>
  </div>
</div>
<div class="list_box col-sm-12">
  <table  class="table table-bordered table-striped" >
    <thead>
      <tr>
        <th>日期</th>
        <th>车贷上月存量(万)</th>
        <th>车贷本月新增存量(万)</th>
        <th>车贷本月归还本金(万)</th>
        <th>车贷本月结余存量(万)</th>
      </tr>
    </thead>
    <tbody id="record">
      
    </tbody>
  </table>
</div>
<div id="r-page"></div>
</body>
<script type="text/javascript">
    $(function () {
		init();
		
	});
	
		
	
	function init() {
		debugger;
		var year = $("select[name='year']").val();
        var endDate = $("#endDate").val();
		
		var date = "";
		for (var i=2000; i<3000; i++){
			date+= "<option value='"+i+"'>"+i+"</option>";
		}
		$("#year").append(date);
		
        //if (("" !== startDate && null !== startDate) ||  ("" !== endDate && null !== endDate)) {
		if("请选择" !== year){
			var param = {
                "year" : year
			};
			onLoadDate(param);
		} else {
			onLoadDate({
			});
		}
	}

	function onLoadDate(param) {
		
        var writetablefn = function (data)
		{ 	
			debugger;
			var context;
			context = "<tr>" 
					+ "<td>" + data.month + "</td>"
					+ "<td>" + data.lastMonthStock + "</td>"
					+ "<td>" + data.thisMonthStock + "</td>" 
					+ "<td>" + data.thisMonthCapital + "</td>" 
					+ "<td>" + data.thisMonthSurplus + "</td>" 
					+ "</tr>"; 
			return context;
			
		};
        pageComm("${basePath}/admin/loan/queryStockInfoList", param == null ? {} : param, writetablefn, "record", 17);
        $("#date1").html("请选择开始日期");
		$("#year").val(null);
		$("#record tr:eq(0)").hide();
		// $("#startDate").val(null);
		// $("#endDate").val(null);
	}

    var param = function () {
		return {
            "year" : $("select[name='year']").val()
		};
	};
	
	function select() {
		if($("select[name='year']").val()=="请选择"){
			onLoadDate(param);
		}else{
			onLoadDate(param());
			$("#record tr:eq(0)").show();
		}
		
	}
	
	var dateRange1 = new pickerDateRange('date1', {
		isTodayValid : true,
		startDate : '请选择日期',
		endDate : '',
		autoSubmit : false,
		inputTrigger : 'input_trigger1',
		theme : 'ta',
		success : function(obj) {
			$("#dCon2").html('开始时间 : ' + obj.startDate + '<br/>结束时间 : ' + obj.endDate);
			$("#startDate").val(obj.startDate);
			$("#endDate").val(obj.endDate);
		},
		clear :function(){
		
			$("#date1").html("请选择开始日期");
			$("#startDate").val(null);
			$("#endDate").val(null);
						
					}
	});
	
	
	
</script>
</html>
