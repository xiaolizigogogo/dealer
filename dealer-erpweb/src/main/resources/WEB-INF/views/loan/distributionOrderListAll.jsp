<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=edge; chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Cache-Control" content="no-transform">
    <title>卖钱翁金融网站后台管理—分销订单列表</title>
    <%@include file="../common/taglibs.jsp" %>
    <link rel="stylesheet" href="${basePath}/css/bootstrap-datetimepicker.min.css">
    <script src="${basePath}/js/bootstrap-datetimepicker.min.js"></script>
    <script src="${basePath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="${basePath}/js/datetimepicker.js"></script>
    <script src="${basePath}/js/tableutils.js"></script>
</head>
<body>
<input type="hidden" id="status" name="status" value="0" />
<div class="tools_bar col-lg-12" style="margin-bottom:0px;">
  <div class="tj_box clearfix">
    <div class="col-sm-12 row">
      <div class="col-sm-4 " >
        <ul>
          <li class="active"><a href="javascript:void(0);" onclick="statusSearch(0,this)">未处理订单</a> <span class="badge red" id="noDoOrder">0</span></li>
        </ul>
      </div>
      <div class="col-sm-4">
        <ul>
          <li><a href="javascript:void(0);" onclick="statusSearch(1,this)">已处理订单</a> <span class="badge" id="doOrder">0</span></li>
        </ul>
      </div>
      <div class="col-sm-4">
        <ul>
          <li><a href="javascript:void(0);" onclick="statusSearch(null,this)">全部订单</a> <span class="badge" id="allOrder">0</span></li>
        </ul>
      </div>
    </div>
    <div class="col-sm-12 row">
      <div class="col-sm-4 " >
        <ul>
          <li><a href="javascript:void(0);" onclick="statusSearch(6,this)">二次对接中</a> <span class="badge red" id="secondingOrder">0</span></li>
        </ul>
      </div>
      <div class="col-sm-4">
        <ul>
          <li><a href="javascript:void(0);" onclick="statusSearch(8,this)">二次对接成功</a> <span class="badge" id="secondSuccessOrder">0</span></li>
        </ul>
      </div>
      <div class="col-sm-4">
        <ul>
          <li><a href="javascript:void(0);" onclick="statusSearch(7,this)">二次对接失败</a> <span class="badge" id="secondFiledOrder">0</span></li>
        </ul>
      </div>
    </div>
  </div>
</div>
<div class="list_box col-sm-12">
  <table  class="table table-bordered table-striped">
    <thead>
      <tr>
        <th>姓名 </th>
        <th>性别</th>
        <th>手机号码</th>
        <th>类型</th>
        <th>还款方式</th>
        <th>期数</th>
        <th>借款金额(元)</th>
        <th>地区</th>
        <th>产品</th>

        <th>备注</th>
        <th>状态</th>
        <th>申请时间</th>
        <th>操作</th>
      </tr>
    </thead>
    <tbody id="record"></tbody>
      
    </tbody>
  </table>
</div>
<div id="r-page"></div>
<div id="sta_modal" class="modal modal_sml fade in" style=" width:400px; height:350px;">
  <div class="modal-header" id="header"> <a  type="button" href = "javascript:void(0)" onclick = "colsediv(0)"  class="close" ><span aria-hidden="true">&times;</span></a>
        <h4 class="modal-title" id="myModalLabel" style="font-size:16px;">修改对接状态</h4>
  </div>
    <input type="text" hidden="hidden" name="id" value="" id="uuid">
    <input type="text" hidden="hidden" name="orderid" value="" id="orderid_distribution">
    <input type="text" hidden="hidden" name="type" value="" id="type">
  <div class="modal-body" >
    <div class="form-group">
            <div class="form-group">
      <label>对接状态</label>
            <select class="form-control" id="status_connect">

                <option value="8"> 二次对接成功 </option>
                <option value="7"> 二次对接失败 </option>
                    <option value="6">二次对接中</option>
      </select>
            </div>
            <div class="form-group" id="money_setting">
                <div class="form-group">
                    <label>对接后借款金额：</label>
                    <input type="number" class="form-control" id="loanMoney" name="loanMoney" min="0">
                </div>
                <div class="form-group">
                    <label>推送给分销佣金：</label>
                    <input type="number" class="form-control" id="charge" name="charge" min="0">
                </div>
                <div class="form-group">
                    <label>对接后借款期数：</label>
                    <input type="number" class="form-control" id="loanRate" name="loanRate" min="1" step="1">
                </div>
            </div>
    </div>
    <div class="form-group">
      <label>备注</label>
            <textarea class="form-control" id="remark"></textarea>
    </div>
        <button type="button" onclick="colsediv(0);" class="btn btn-default">取消</button>
        <button type="button" class="btn btn-danger" onclick="submitdata(0);">提交</button>
  </div>
</div>
<div id="fade2" class="black_overlayx"> </div>
</body>
<script type="text/javascript">
	
	//初始化加载未处理订单
	var initStatus = 0;
	
    $(function () {
        init();
        initCountStatus();
    });
    function submitdata(){
        $.ajax({
            type: 'POST',
            url: '${basePath}/admin/distributionOrderController/editajax',
            data: {
                "id": $("#uuid").val(),
                "status":$("#status_connect").val(),
                "remark":$("#remark").val(),
                "orderId":$("#orderid_distribution").val(),
                "charge":$("#charge").val(),
                "loanMoney":$("#loanMoney").val(),
                "loanRate":$("#loanRate").val()
            },
            dataType: "text",
            success: function (data) {
                if(data == "0000"){
                    layer.msg("修改对接状态成功！");
                    colsediv(0);
                    document.location.reload();
                }else {
                    layer.msg("修改对接状态失败！");
                    colsediv(0);
                    document.location.reload();
                }
    
            }, error: function () {
                layer.msg("系统错误!");
                return false;
            }
        })
    }
    function initCountStatus(){
    	$.ajax({
    		url:"${basePath}/admin/distributionOrderController/distributionOrderStatusCount",
    		type:"get",
    		async:false,
    		success:function(data){
    			$.each(data,function(key,value){
    				if(value.status == 0){ //未处理订单
    					$("#noDoOrder").html(value.statusCount);
    				}else if(value.status == 1){ //已处理订单
    					$("#doOrder").html(value.statusCount);
    				}else if(value.status == 6){ //二次对接中订单
    					$("#secondingOrder").html(value.statusCount);
    				}else if(value.status == 7){ //二次对接失败订单
    					$("#secondFiledOrder").html(value.statusCount);  
    				}else if(value.status == 8){  //二次对接成功订单
    					$("#secondSuccessOrder").html(value.statusCount);
    				}
    			});
        		$("#allOrder").html(parseInt($("#noDoOrder").html()) + parseInt($("#doOrder").html())+ parseInt($("#secondingOrder").html())+ parseInt($("#secondFiledOrder").html())+ parseInt($("#secondSuccessOrder").html())); //全部订单
    		} 
    	})
    }

    function init() {
        var status = $("#status").val();
        if ("" != status && null != status) {
            var param = {
                status: status
            };
            onLoadDate(param);
        } else {
            onLoadDate(null);
        }
    }
    function openLayer(id) {
        layer.open({
            type: 2,
            area: ['700px', '338px'],
            fix: true,
            title: '修改对接状态',
            maxmin: true,
            content: '${basePath}/admin/distributionOrderController/distributionOrderEditPage?id=' + id
        });
    }
    function openLayer_div(id,orderid,type){
        $("#uuid").val(id);
        $("#orderid_distribution").val(orderid);
        $("#type").val(type);
        //根据参数确定画面的可见状态
        if(type == "0"){
            $("#status_connect option[value='6']").remove();
            $("#status_connect option[value='8']").remove();
            $("#status_connect option[value='7']").remove();
            $("#status_connect").append("<option value=\"7\"> 二次对接失败 </option>");
            $("#status_connect").append("<option value=\"8\"> 二次对接成功 </option>");
        }else if(type == "1"){
            $("#status_connect option[value='8']").remove();
            $("#status_connect option[value='7']").remove();
            $("#status_connect option[value='6']").remove();
            $("#status_connect").append("<option value=\"6\"> 二次对接中 </option>");
        }
        if(type == "0"){
            $("#money_setting").css("display","block");
        }else {
            $("#money_setting").css("display","none");
        }
        opendiv("sta_modal");
    }
    function onLoadDate(param) {
        var writetablefn = function (data) {
            var context;

            var status = "----";
            var linkUrl = "----";
            if (data.status == "1") {
                status = "已处理";
            } else if (data.status == "0") {
                var url = "${basePath}/admin/customer/goAddLoanerInfo.html?name=" + data.customer +
                        "&tel=" + data.tel + "&idCard=" + data.identifyId + "&openId=" + data.openId +
                        "&orderId=" + data.orderId;
                status = "未处理";
                linkUrl1 = "<a href='javascript:void(0);' class='link-01' onclick='openLayer_div(" + data.id + "," + data.orderId + ", 1);'>修改对接状态</a>";
                linkUrl = "<a href='" + url + "' class='link-01'>完善资料</a>" + "|" + linkUrl1;
            } else if (data.status == "6") {
                var url2 = "${basePath}/admin/customer/goAddLoanerInfo.html?name=" + data.customer +
                        "&tel=" + data.tel + "&idCard=" + data.identifyId + "&openId=" + data.openId +
                        "&orderId=" + data.orderId;
                status = "二次对接中";
                linkUrl = "<a href='javascript:void(0);' class='link-01' onclick='openLayer_div(" + data.id + ","+data.orderId+", 0);'>修改对接状态</a>";
            } else if (data.status == "7") {
                status = "二次对接失败";
            } else if (data.status == "8") {
                status = "二次对接成功";
            }
            
            context = "<tr>" +
                    "<td title='orderId:["+ data.orderId+"]openId:["+data.openId+"]'>" +
                    data.customer + "</td>" +
                    "<td>" + data.sex + "</td>" +
                    "<td title='身份证：["+ data.identifyId+"]'>" + data.tel + "</td>" +
                    "<td>" + data.loanType + "</td>" +
                    "<td>" + data.repayType + "</td>" +
                    "<td>" + data.repayPeriods + "</td>" +
                    "<td>" + data.loanMoney + "</td>" +
                    "<td>" + data.province +" " + data.city + "</td>" +
                    "<td title='车系：" + data.carSeries + "]车型：["+ data.carModel+"]'>" + data.carBrand + "</td>" +
                    "<td>" + data.carMile + "</td>" +
                    "<td title='备注："+data.remark+"'>" + status + "</td>" +
                    "<td>" + data.createdAt + "</td>" +
                    "<td>"+linkUrl+"</td>" +
                    "</tr>";
            
            return context;
        };
		
        pageComm("${basePath}/admin/distributionOrderController/distributionOrderPageList", param == null ? {} :
                param, writetablefn, "record", 19);
    }

    var param = function () {
        return {
            "status": $("#status").val()
        };
    };

    function select() {
        onLoadDate(param());
    }
    
    function statusSearch(status,obj){
    	$(obj).parents($(".col-sm-12")).find('li').removeClass('active');
	    $(obj).parents("li").addClass('active');
    	$("#status").val(status);
    	select();
    }

</script>
</html>
