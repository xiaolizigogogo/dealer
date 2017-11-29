<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible"
        content="IE=9; IE=8; IE=7; IE=edge; chrome=1" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="Cache-Control" content="no-transform">
  <title>e车贷管理系统—押品出库</title>
  <%@include file="../common/taglibs.jsp"%>
  <link rel="stylesheet" href="${basePath}/css/lightbox.min.css">
  <script src="${basePath}/js/lightbox-plus-jquery.min.js"></script>
  <script src="${basePath}/js/jquery.js" ></script>
    <script src="${basePath}/js/bootstrap-datetimepicker.min.js"></script>
    <script src="${basePath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="${basePath}/js/datetimepicker.js"></script>
    <script src="${basePath}/js/tableutils.js"></script>
    <script src="${basePath}/js/Map.js"></script>
  <style>
    .table > tbody > tr > td.tr_back,.table-striped > tbody > tr:nth-child(odd) > td.tr_back, .table-striped > tbody > tr:nth-child(odd) > th.tr_back{background-color:#FCF8E3; !important;}
  </style>
</head>
<body>
<input type="hidden" value=""  id="customer_id_hidden">
<div class="tools_bar col-lg-12">
  <div class="clearfix">
    <form class="form-inline pull-left" role="form">
      <div class="form-group">
        <label class="sr-only" for="txt_name">订单号</label>
        <input type="text" class="form-control" id="txt_orderid" placeholder="请输入订单号">
      </div>
      <button type="button" class="btn btn-primary btn-search" onclick="select()"><i class="fa fa-search"></i> 搜索</button>
    </form>
  </div>
  
</div>
<div class="list_box col-sm-12">
  <table  class="table table-bordered table-striped">
    <thead>
      <tr>
        <th>订单号</th>
        <th>客户姓名</th>
        <th>押品编号</th>
        <th>任务处理人</th>
        <th>停车场</th>
        <th>是否出库</th>
        <th>出库时间</th>
        <th>操作</th>
      </tr>
    </thead>
    <tbody id="outstocklist">
    </tbody>
  </table>
</div>
<div id="r-page"></div>
<div id="custom_modal" class="modal fade in "> </div>
<div id="order_modal" class="modal fade in"> </div>

<div id="in_product_modal" class="modal fade in">
    <div class="modal-header" id="header"> <a  type="button" href = "javascript:void(0)" onclick = "colsediv(0)"  class="close" ><span aria-hidden="true">&times;</span></a>
        <h4 class="modal-title" id="myModalLabel" style="font-size:16px;">押品出库</h4>
    </div>
    <div class="modal-body" style="background:#eee;">
        <div class="from_box">
            <div class="from_tit clearfix">
                <h3 class="pull-left">基本信息</h3>
            </div>
            <table class="table table-striped">
                <tr>
                    <th>押品编号</th>
                    <td><input id="stockobjectnumber" type="text" class="form-control" size="50" readonly value="" /></td>
                    <th>客户姓名</th>
                    <td><input id="customer_name" type="text" class="form-control" size="50" readonly value="" /></td>
                </tr>
                <tr>
                    <th>订单编号</th>
                    <td><input id="orderid" type="text" class="form-control" size="50" readonly value="" /></td>
                    <th><i class="text-danger">*</i> 押品类型</th>
                    <td><select id="stockobjectkind"  class="form-control"readonly >
                        <option>车</option>
                    </select></td>
                    <th>抵押类型</th>
                    <td><select  class="form-control" readonly>
                        <option>押车</option>
                    </select></td>
                </tr>
            </table>
        </div>
        <div class="from_box">
            <div class="from_tit clearfix">
                <h3 class="pull-left">车辆信息</h3>
            </div>
            <table class="table table-striped">
                <tr>
                    <th> 车牌号码</th>
                    <td><input id="vehicle_no" type="text" class="form-control " size="50" readonly value=""  /></td>
                    <th>车辆型号</th>
                    <td><input id="vehicleModels" type="text" class="form-control" size="50" readonly value="" /></td>
                    <th>颜色</th>
                    <td><input id="color" type="text" class="form-control" size="50" readonly value="" /></td>
                </tr>
                <tr>
                    <th>万公里数</th>
                    <td><input id="mileaged" type="text" class="form-control sml-control" size="50" readonly value=""   /></td>
                    <th><i class="text-danger">*</i> 方向盘锁号</th>
                    <td><input id="steeringlocknumber" type="text" class="form-control" size="50" readonly /></td>
                    <th><i class="text-danger">*</i> 车轮锁号</th>
                    <td><input id="wheellocknumber" type="text" class="form-control" size="50" readonly /></td>
                </tr>
                <tr>
                    <th><i class="text-danger">*</i> 停车位号</th>
                    <td><input id="parkspace" type="text" class="form-control" size="50" readonly  /></td>
                    <th><i class="text-danger">*</i> 停车场</th>
                    <td><input id="parklot" type="text" class="form-control" readonly /></td>
                    <th colspan="2">&nbsp;</th>
                </tr>
            </table>
        </div>
        <div class="from_box">
            <div class="from_tit clearfix">
                <h3 class="pull-left">出库记录</h3>
            </div>
            <table class="table table-striped">
                <tr>
                    <th><i class="text-danger">*</i> 出库时间</th>
                    <td><div class="input-group date form_date" data-date=""
                             data-date-format="yyyy-mm-dd"
                             data-link-field="dateJoined"
                             data-link-format="yyyy-mm-dd" style="width:200px;">
                        <input id="outstocktime" class="form-control" type="text" value="" readonly style="width:100%;" >
              <span class="input-group-addon"><span
                      class="glyphicon glyphicon-calendar"></span></span> </div>
                        <input type="text" hidden="hidden" id="dateJoined" name="dateJoined" /></td>
                    <th><i class="text-danger">*</i> 出库人</th>
                    <td><input id="outstockstuff" type="text" class="form-control" size="50" /></td>
                    <th><i class="text-danger">*</i> 停车场接收人</th>
                    <td><input id="outstockparkerstuff" type="text" class="form-control" size="50" /></td>
                </tr>
            </table>
        </div>
        <div class="from_box">
            <div class="from_tit clearfix">
                <h3 class="pull-left">处理意见</h3>
            </div>
            <table class="table table-striped">
                <tr>
                    <th><i class="text-danger">*</i> 处理意见</th>
                    <td><select id="reviewconclusion_outstock" class="form-control" >
                        <option>出库</option>
                    </select></td>
                </tr>
                <tr>
                    <th style="vertical-align:top;"><i class="text-danger">*</i> 备注</th>
                    <td><textarea cols="168" rows="3" class="form-control" id="remark"
                                  name="remark" placeholder="其他信息请写入到备注栏中" style="width:60%;"></textarea></td>
                </tr>
            </table>
        </div>
    </div>
    <div class="modal-footer">
        <p class="col-sm-2"> <a  href = "javascript:void(0)" onclick = "colsediv(0)" class="btn btn-default btn-block">关闭</a> </p>
        <p class="col-sm-2"> <a  href = "javascript:void(0)" onclick = "submitinstock()" class="btn btn-danger btn-block">提交入库</a> </p>
    </div>
</div>
<div id="in_product_modal2" class="modal fade in">
    <div class="modal-header" id="header1"> <a  type="button" href = "javascript:void(0)" onclick = "colsediv(0)"  class="close" ><span aria-hidden="true">&times;</span></a>
        <h4 class="modal-title" id="myModalLabel5" style="font-size:16px;">押品入库</h4>
    </div>
    <div class="modal-body" style="background:#eee;">
        <div class="from_box">
            <div class="from_tit clearfix">
                <h3 class="pull-left">基本信息</h3>
            </div>
            <div class="row">
                <div class="col-sm-4">
                    <dl class="dl-horizontal">
                        <dt>押品编号</dt>
                        <dd id="stockobjectnumber_v"></dd>
                    </dl>
                </div>
                <div class="col-sm-4">
                    <dl class="dl-horizontal">
                        <dt>客户姓名</dt>
                        <dd id="customer_name_v"></dd>
                    </dl>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4">
                    <dl class="dl-horizontal">
                        <dt>订单编号</dt>
                        <dd id="orderid_v"></dd>
                    </dl>
                </div>
                <div class="col-sm-4">
                    <dl class="dl-horizontal">
                        <dt>押品类型</dt>
                        <dd id="stockobjectkind_v"></dd>
                    </dl>
                </div>
            </div>
        </div>
        <div class="from_box">
            <div class="from_tit clearfix">
                <h3 class="pull-left">车辆信息</h3>
            </div>
            <div class="row">
                <div class="col-sm-4">
                    <dl class="dl-horizontal">
                        <dt>车牌号码</dt>
                        <dd id="vehicle_no_v"></dd>
                    </dl>
                </div>
                <div class="col-sm-4">
                    <dl class="dl-horizontal">
                        <dt>车辆型号</dt>
                        <dd id="vehicleModels_v"></dd>
                    </dl>
                </div>
                <div class="col-sm-4">
                    <dl class="dl-horizontal">
                        <dt>颜色</dt>
                        <dd id="color_v"></dd>
                    </dl>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4">
                    <dl class="dl-horizontal">
                        <dt>万公里数</dt>
                        <dd id="mileaged_v"></dd>
                    </dl>
                </div>
                <div class="col-sm-4">
                    <dl class="dl-horizontal">
                        <dt>方向盘锁号</dt>
                        <dd id="steeringlocknumber_v"></dd>
                    </dl>
                </div>
                <div class="col-sm-4">
                    <dl class="dl-horizontal">
                        <dt>车轮锁号</dt>
                        <dd id="wheellocknumber_v"></dd>
                    </dl>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4">
                    <dl class="dl-horizontal">
                        <dt>停车位号</dt>
                        <dd id="parkspace_v" ></dd>
                    </dl>
                </div>
                <div class="col-sm-4">
                    <dl class="dl-horizontal">
                        <dt>停车场</dt>
                        <dd id="parklot_v"></dd>
                    </dl>
                </div>
            </div>
        </div>
        <div class="from_box">
            <div class="from_tit clearfix">
                <h3 class="pull-left">入库记录</h3>
            </div>
            <div class="row">
                <div class="col-sm-4">
                    <dl class="dl-horizontal">
                        <dt>入库时间</dt>
                        <dd id="instocktime_v"></dd>
                    </dl>
                </div>
                <div class="col-sm-4">
                    <dl class="dl-horizontal">
                        <dt>入库人</dt>
                        <dd id="instockstuff_v"></dd>
                    </dl>
                </div>
                <div class="col-sm-4">
                    <dl class="dl-horizontal">
                        <dt>停车场接收人</dt>
                        <dd id="instockparkerstuff_v"></dd>
                    </dl>
                </div>
            </div>
        </div>
        <div class="from_box">
            <div class="from_tit clearfix">
                <h3 class="pull-left">出库记录</h3>
            </div>
            <div class="row">
                <div class="col-sm-4">
                    <dl class="dl-horizontal">
                        <dt>入库时间</dt>
                        <dd id="outstocktime_v"></dd>
                    </dl>
                </div>
                <div class="col-sm-4">
                    <dl class="dl-horizontal">
                        <dt>出库人</dt>
                        <dd id="outstockstuff_v"></dd>
                    </dl>
                </div>
                <div class="col-sm-4">
                    <dl class="dl-horizontal">
                        <dt>停车场出库人</dt>
                        <dd id="outstockparkerstuff_v"></dd>
                    </dl>
                </div>
            </div>
        </div>
        <div class="from_box">
            <div class="from_tit clearfix">
                <h3 class="pull-left">处理意见</h3>
            </div>
            <div class="row">
                <div class="col-sm-4">
                    <dl class="dl-horizontal">
                        <dt>处理意见</dt>
                        <dd id="remark_v"></dd>
                    </dl>
                </div>
                <div class="col-sm-4">
                    <dl class="dl-horizontal">
                        <dt>备注</dt>
                        <dd id="reviewconclusion_instock_v"></dd>
                    </dl>
                </div>

            </div>
        </div>
    </div>
    <div class="modal-footer">
        <p class="col-sm-2" style="padding-left:0px;"> <a  href = "javascript:void(0)" onclick = "colsediv(0)" class="btn btn-default btn-block">关闭</a> </p>
    </div>
</div>
<div id="qs_box" class="modal modal_sml fade in">
  <div class="modal-header"> <a  type="button" href = "javascript:void(0)" onclick = "colsediv(0)"  class="close" ><span aria-hidden="true">&times;</span></a>
    <h4 class="modal-title" id="myModalLabel1" style="font-size:16px;">提示</h4>
  </div>
  <div class="modal-body" >
    <p class="p_tip"><i class="fa fa-check-circle"></i> 此订单已被签收！</p>
    <div class="btn_list clearfix"><a class="btn btn-danger btn-sm" href="add.html" onclick = "colsediv(0)" >现在去评估</a><a class="btn btn-default btn-sm" href = "javascript:void(0)" onclick = "colsediv(0)" >暂不评估</a></div>
  </div>
</div>
<div id="hmd_box" class="modal modal_sml fade in">
  <div class="modal-header"> <a  type="button" href = "javascript:void(0)" onclick = "colsediv(0)"  class="close" ><span aria-hidden="true">&times;</span></a>
    <h4 class="modal-title" id="myModalLabel2" style="font-size:16px;">提示</h4>
  </div>
  <div class="modal-body" >
    <p class="p_tip"><i class="fa fa-question-circle"></i> 确认将此押品拉入黑名单么！</p>
    <div class="btn_list clearfix"><a class="btn btn-danger btn-sm" href="index.html" onclick = "colsediv(0)" >确认</a><a class="btn btn-default btn-sm" href = "javascript:void(0)" onclick = "colsediv(0)" >取消</a></div>
  </div>
</div>
<div id="fade2" class="black_overlayx"> </div>
<script>
</script>
<script type="text/javascript">
    var map = new Map();
    $(function() {
        init();
    });

    function init() {
        onLoadDate(null);
    }

    function onLoadDate(param) {
        var writetablefn = function(data) {
            var context;
            //出入库状态
            var opstr;
            //操作状态
            var stockstr;
            if(data.stockstatus == 1){
                opstr ="<a class='link-01' onclick=\"caroutstock(this)\""+ "<a id="+data.uuid+":"+data.orderid+">出库</a>";
                stockstr = "未出库";
            }else if(data.stockstatus == 2){
                opstr ="<a class='link-01' onclick=\"caroutstockfulldata(this)\""+ "<a id="+data.uuid+":"+data.orderid+">查看</a>";
                stockstr = "已出库";
            }

            var substr_time;
            if(data.outstocktime!=""){
                substr_time = data.outstocktime.substring(0,10);
            }

            var loanDetails = {};
            loanDetails.uuid = data.uuid;
            loanDetails.orderId = data.orderid;
            loanDetails.taskId = data.taskId;
            loanDetails.activityId = data.activityId;
            loanDetails.assignee = data.assignee;
            loanDetails.loan_status = data.loan_status;
            loanDetails.customerId = data.customerId;

            context = "<tr id="+data.orderid+" onclick='#'>"
                    + "<td>" + "<a id="+data.uuid+" onclick='setCustomerIdHidden(this)'  href='javascript:void(0);'>" + data.orderid + "</a>" + "</td>"
                    + "<td>" + data.customer_name + "</td>"
                    + "<td>" + (data.stockobjectnumber=="" ? "--":data.stockobjectnumber) + "</td>"
                    + "<td>" + (data.outstockstuff=="" ? "--":data.outstockstuff) + "</td>"
                    + "<td>" + (data.parklot=="" ? "--":data.parklot) + "</td>"
                    + "<td>" + stockstr + "</td>"
                    + "<td>" + (data.outstocktime=="" ? "--":substr_time) + "</td>"
                    + "<td>" + opstr + "</td>"
                    + "</tr>";
            map.put(data.uuid.toString(),loanDetails);
            return context;
        };
        pageComm("${basePath}/admin/loan/queryNeedOutstockList", param == null ? {} : param, writetablefn, "outstocklist", 17);
        $("#txt_orderid").val(null);
    }
    function caroutstock(obj){
        $("#customer_id_hidden").val($(obj).attr("id"));
        opendiv('in_product_modal');
        getdata();
    }
    function caroutstockfulldata(obj){
        $("#customer_id_hidden").val($(obj).attr("id"));
        opendiv('in_product_modal2');
        getcompletedata();
    }
    var param = function() {
        return {
            "orderid" : $("#txt_orderid").val()
        };
    };

    function select() {
        onLoadDate(param());
    }


    function setCustomerIdHidden(obj){
        $("#customer_id_hidden").val($(obj).attr("id"));
        var id = $(obj).attr("id");
        $("#customer_id_hidden").val(id);
        var loanDetailsTemp = map.get(id);
        loanDetailsTemp.channel = "no";
        map.put(id,loanDetailsTemp);
        $("#order_modal").load("/admin/loan/vieworderdetails.html");
        opendiv("order_modal");
    }

    //评估押品
    function productEdit(obj){
        window.location = "/admin/customer/vehicleAssess.html?uuid=" + $("#edit_customer_id").val();
    }
</script>
<script type="text/javascript">
    function getdata(){
        var customer_id_hiddenstr = $("#customer_id_hidden").val();
        var strarray = customer_id_hiddenstr.split(":");
        var uuid = strarray[0];
        var orderid = strarray[1];
        $.ajax({
            url : "/admin/loan/queryStockInfoById?loanId=" + uuid +"&direction=out",
            type : "get",
            dataType : "json",
            success : function(data) {
                $("#customer_name").val(data.carstockinfo.customer_name);
                $("#orderid").val(data.carstockinfo.orderid);
                $("#vehicle_no").val(data.carstockinfo.vehicle_no);
                $("#vehicleModels").val(data.carstockinfo.vehicleModels);
                $("#color").val(data.carstockinfo.color);
                $("#mileaged").val(data.carstockinfo.mileaged);
                $("#stockobjectnumber").val(data.carstockinfo.stockobjectnumber);
                $("#steeringlocknumber").val(data.carstockinfo.steeringlocknumber);
                $("#wheellocknumber").val(data.carstockinfo.wheellocknumber);
                $("#parkspace").val(data.carstockinfo.parkspace);
                $("#parklot").val(data.carstockinfo.parklot);
            }})
    }
</script>
<script type="text/javascript">
    function getcompletedata(){
        var customer_id_hiddenstr = $("#customer_id_hidden").val();
        var strarray = customer_id_hiddenstr.split(":");
        var uuid = strarray[0];
        var orderid = strarray[1];
        $.ajax({
            url : "/admin/loan/queryStockInfoByIdComplete?loanId=" + uuid,
            type : "get",
            dataType : "json",
            success : function(data) {
                $("#stockobjectnumber_v").html(data.carstockinfo.stockobjectnumber);
                $("#customer_name_v").html(data.carstockinfo.customer_name);
                $("#orderid_v").html(data.carstockinfo.orderid);
                $("#stockobjectkind_v").html(data.carstockinfo.stockobjectkind);
                $("#vehicle_no_v").html(data.carstockinfo.vehicle_no);
                $("#vehicleModels_v").html(data.carstockinfo.vehicleModels);
                $("#color_v").html(data.carstockinfo.color);
                $("#mileaged_v").html(data.carstockinfo.mileaged);
                $("#steeringlocknumber_v").html(data.carstockinfo.steeringlocknumber);
                $("#wheellocknumber_v").html(data.carstockinfo.wheellocknumber);
                $("#parkspace_v").html(data.carstockinfo.parkspace);
                $("#parklot_v").html(data.carstockinfo.parklot);
                $("#instocktime_v").html(data.carstockinfo.instocktime);
                $("#instockstuff_v").html(data.carstockinfo.instockstuff);
                $("#instockparkerstuff_v").html(data.carstockinfo.instockparkerstuff);
                $("#outstocktime_v").html(data.carstockinfo.outstocktime);
                $("#outstockstuff_v").html(data.carstockinfo.outstockstuff);
                $("#outstockparkerstuff_v").html(data.carstockinfo.outstockparkerstuff);
                $("#remark_v").html(data.carstockinfo.remark);
                $("#reviewconclusion_outstock_v").html(data.carstockinfo.reviewconclusion_outstock);
            }})
    }
</script>
<script type="text/javascript" >
    //提交入库信息
    function submitinstock(){
        //对用户的必填信息进行检查
        var outstocktime = $("#outstocktime").val();
        if ((outstocktime == "")||(outstocktime == null)){
            layer.msg("出库时间没有填写，请确认！");
            return false;
        }
        var outstockstuff = $("#outstockstuff").val();
        if((outstockstuff == "")||(outstockstuff == null)){
            layer.msg("出库人没有填写，请确认！");
            return false;
        }
        var outstockparkerstuff = $("#outstockparkerstuff").val();
        if ((outstockparkerstuff == "")||(outstockparkerstuff == null)){
            layer.msg("停车场接收人没有填写，请确认！");
            return false;
        }
        var remark = $("#remark").val();
        if((remark == "")||(remark == null)){
            layer.msg("备注信息请填写！");
            return false;
        }
        //做成参数，更新数据库内容。
        $.ajax({
            type: 'POST',
            url: '${basePath}/admin/loan/saveoutstockinfo.html',
            data: {
                "orderid":$("#orderid").val(),			//订单编号
                "stockobjectnumber": $("#stockobjectnumber").val(),   //押品编号
                "customer_name":$("#customer_name").val(),			//客户姓名
                "vehicle_no":$("#vehicle_no").val(),					//车牌号码
                "vehicleModels":$("#vehicleModels").val(),			//车辆型号
                "color":$("#color").val(),							//车辆颜色
                "mileaged":$("#mileaged").val(),						//行驶里程
                "steeringlocknumber":$("#steeringlocknumber").val(),		//方向盘锁号
                "wheellocknumber":$("#wheellocknumber").val(),		//车轮锁锁号
                "parkspace":$("#parkspace").val(),					//停车位号
                "parklot":$("#parklot").val(),						//停车场编号
                "outstocktime":$("#outstocktime").val(),				//入库时间
                "outstockstuff":$("#outstockstuff").val(),			//入库人
                "outstockparkerstuff":$("#outstockparkerstuff").val(),		//停车场接收人
                "remark":$("#remark").val(),							//备注信息
                "reviewconclusion_outstock":$("#reviewconclusion_outstock").find("option:selected").text(),		//评审意见
                "stockstatus":"2",										//入库状态
                "stockobjectkind":$("#stockobjectkind").find("option:selected").text()
            },
            dataType: "text",
            success: function (data) {
                if (data == "0000") {
                    layer.msg("出库数据保存成功!");
                    init();
                    colsediv(0);
                    clearFormData();
                    return true;
                } else {
                    layer.msg("出库数据保存失败!");
                    return false;
                }
            },
            error: function (e) {
                layer.msg("操作失败!可能原因：" + e);
                return false;
            }
        });

    }
    function clearFormData(){
        $("#steeringlocknumber").val("");
        $("#wheellocknumber").val("");
        $("#parkspace").val("");
        $("#parklot").val("");
        $("#outstocklist").val("");
        $("#outstockstuff").val("");
        $("#outstockparkerstuff").val("");
        $("#remark").val("");
    }
</script>
</body>
</html>