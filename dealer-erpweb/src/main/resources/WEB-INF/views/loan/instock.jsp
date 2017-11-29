<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible"
          content="IE=9; IE=8; IE=7; IE=edge; chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Cache-Control" content="no-transform">
    <title>e车贷管理系统—押品评估</title>
    <%@include file="../common/taglibs.jsp"%>
    <link rel="stylesheet" href="${basePath}/css/lightbox.min.css">
    <script type="text/javascript" src="${basePath}/js/jquery/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="${ basePath}/js/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="${basePath}/js/jquery/jquery.ui.widget.js"></script>
    <script type="text/javascript" src="${basePath}/js/jquery/jquery.iframe-transport.js"></script>
    <script type="text/javascript" src="${basePath}/js/jquery/jquery.fileupload.js"></script>

    <script type="text/javascript" src="${basePath}/js/other.js"></script>
    <script type="text/javascript" src="${basePath}/js/my.js"></script>
    <script type="text/javascript" src="${basePath}/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${basePath}/js/layer/layer.js"></script>
    <script type="text/javascript" src="${basePath}/js/completer/completer.min.js"></script>

    <script src="${basePath}/js/bootstrap-datetimepicker.min.js"></script>
    <script src="${basePath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="${basePath}/js/datetimepicker.js"></script>

    <script src="${basePath}/js/jquery.validate.js"></script>
    <script src="${basePath}/js/loan/imageUpLoadTile.js"></script>

    <style>
        .table > tbody > tr > td.tr_back,.table-striped > tbody > tr:nth-child(odd) > td.tr_back, .table-striped > tbody > tr:nth-child(odd) > th.tr_back{background-color:#FCF8E3; !important;}
    </style>
</head>
<body>
<input type="hidden" value=""  id="customer_id_hidden">
<input type="hidden" value="${processDefinitionId}" id="processDefinitionId">
<input type="hidden" value="${taskId}" id="taskId">
<input type="hidden" value="${loanInfo.uuid}" id="loanId">
<input type="hidden" value="${loanInfo.uuid}" id="uuid">
<div id="custom_modal" class="modal fade in "> </div>
<div id="order_modal" class="modal fade in"> </div>

<div id="in_product_modal" >
    <div class="tools_bar ">
        <div class="bar_tit clearfix">
            <h2 class="pull-left">押品入库</h2>
        </div>
    </div>
    <div class="modal-body" style="background:#eee;">
        <div class="from_box">

        </div>
        <div class="from_box">
            <div class="from_tit clearfix">
                <h3 class="pull-left">车辆信息</h3>
            </div>
            <table class="table table-striped">
                <tr>
                    <th> 车牌号码</th>
                    <td><input id="vehicle_no" type="text" class="form-control " size="50" readonly value="${carInfo.vehicleNo}"  /></td>
                    <th>车辆型号</th>
                    <td><input id="vehicleModels" type="text" class="form-control" size="50" readonly value="${carInfo.vehicleBrand}" /></td>
                    <th>颜色</th>
                    <td><input id="color" type="text" class="form-control" size="50" readonly value="${carInfo.color}" /></td>
                </tr>
                <tr>
                    <th>万公里数</th>
                    <td><input id="mileaged" type="text" class="form-control sml-control" size="50" readonly value="${carInfo.mileaged}"   /></td>
                    <th><i class="text-danger">*</i> 方向盘锁号</th>
                    <td><input id="steeringlocknumber" type="text" class="form-control" size="50" /></td>
                    <th><i class="text-danger">*</i> 车轮锁号</th>
                    <td><input id="wheellocknumber" type="text" class="form-control" size="50" /></td>
                </tr>
                <tr>
                    <th><i class="text-danger">*</i> 停车位号</th>
                    <td><input id="parkspace" type="text" class="form-control" size="50"   /></td>
                    <th><i class="text-danger">*</i> 停车场</th>
                    <td><input id="parklot" type="text" class="form-control" /></td>
                    <th colspan="2">&nbsp;</th>
                </tr>
            </table>
        </div>
        <div class="from_box">
            <div class="from_tit clearfix">
                <h3 class="pull-left">入库记录</h3>
            </div>
            <table class="table table-striped">
                <tr>
                    <th><i class="text-danger">*</i> 入库时间</th>
                    <td><div class="input-group date form_date" data-date=""
                             data-date-format="yyyy-mm-dd"
                             data-link-field="dateJoined"
                             data-link-format="yyyy-mm-dd" style="width:200px;">
                        <input id="instocktime" class="form-control" type="text" value="" readonly style="width:100%;" >
              <span class="input-group-addon"><span
                      class="glyphicon glyphicon-calendar"></span></span> </div>
                        <input type="text" hidden="hidden" id="dateJoined" name="dateJoined" /></td>
                    <th><i class="text-danger">*</i> 入库人</th>
                    <td><input id="instockstuff" type="text" class="form-control" size="50" /></td>
                    <th><i class="text-danger">*</i> 停车场接收人</th>
                    <td><input id="instockparkerstuff" type="text" class="form-control" size="50" /></td>
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
                    <td><select id="reviewconclusion_instock" class="form-control" >
                        <option>入库</option>
                    </select></td>
                </tr>
                <tr>
                    <th style="vertical-align:top;"><i class="text-danger">*</i> 备注</th>
                    <td><textarea cols="168" rows="3" class="form-control" id="remark"
                                  name="remark" placeholder="其他信息请写入到备注栏中" style="width:60%;"></textarea></td>
                </tr>
            </table>
        </div>
        <div class="from_con clearfix" id="img_div"></div>
    </div>
    <div class="row" style="padding-bottom:20px;">
        <div class="col-sm-2 col-sm-offset-4"> <a class="btn btn-default btn-block" href="javascript:history.go(-1);">取消入库</a> </div>
        <div class="col-sm-2">
            <button type="submit" onclick="submitinstock()" class="btn btn-danger btn-block">入库</button>
        </div>
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
</body>

<script type="text/javascript">

    function carinstock(obj){
        $("#customer_id_hidden").val($(obj).attr("id"));
        opendiv('in_product_modal');
        getdata();
    }
    function carinstockfulldata(obj){
        $("#customer_id_hidden").val($(obj).attr("id"));
        opendiv('in_product_modal2');
        getcompletedata();
    }
    var param = function() {
        return {
            "orderid" : $("#txt_orderid").val(),
        };
    };

    function select() {
        onLoadDate(param());
    }


    function setCustomerIdHidden(obj){
        $("#customer_id_hidden").val($(obj).attr("id"));
        $("#order_modal").load("/admin/loan/vieworderdetails.html");
        opendiv("order_modal");
    }

    //评估押品
    function productEdit(obj){
        window.location = "/admin/customer/vehicleAssess.html?uuid=" + $("#edit_customer_id").val();
    }

    function getdata(){
        var customer_id_hiddenstr = $("#customer_id_hidden").val();
        var strarray = customer_id_hiddenstr.split(":");
        var uuid = strarray[0];
        var orderid = strarray[1];
        $.ajax({
            url : "/admin/loan/queryStockInfoById?loanId=" + uuid +"&direction=in",
            type : "get",
            dataType : "json",
            success : function(data) {
                $("#customer_name").val(data.carstockinfo.customer_name);
                $("#orderid").val(data.carstockinfo.orderid);
                $("#vehicle_no").val(data.carstockinfo.vehicle_no);
                $("#vehicleModels").val(data.carstockinfo.vehicleModels);
                $("#color").val(data.carstockinfo.color);
                $("#mileaged").val(data.carstockinfo.mileaged);
                $("#stockobjectnumber").val(data.stockid);
            }})
    }
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
                $("#remark_v").html(data.carstockinfo.remark_instoke);
                $("#reviewconclusion_instock_v").html(data.carstockinfo.reviewconclusion_instock);
            }})
    }
    //提交入库信息
    function submitinstock(){
        //对用户的必填信息进行检查
        var steerlocknumber = $("#steeringlocknumber").val();
        if((steerlocknumber == "")|| (steerlocknumber == null)){
            layer.msg("方向盘锁号没有填写，请确认！");
            return false;
        }
        var wheellocknumber = $("#wheellocknumber").val();
        if((wheellocknumber == "")||(wheellocknumber == null)){
            layer.msg("车轮锁号没有填写，请确认！");
            return false;
        }
        var parkspace = $("#parkspace").val();
        if((parkspace == "")||(parkspace == null)){
            layer.msg("停车位编号没有填写，请确认！");
            return false;
        }
        var parklot = $("#parklot").val();
        if ((parklot == "")||(parklot == null)){
            layer.msg("停车场编号没有填写，请确认！");
            return false;
        }
        var instocktime = $("#instocktime").val();
        if ((instocktime == "")||(instocktime == null)){
            layer.msg("入库时间没有填写，请确认！");
            return false;
        }
        var instockstuff = $("#instockstuff").val();
        if((instockstuff == "")||(instockstuff == null)){
            layer.msg("入库人没有填写，请确认！");
            return false;
        }
        var instockparkerstuff = $("#instockparkerstuff").val();
        if ((instockparkerstuff == "")||(instockparkerstuff == null)){
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
            url: '${basePath}/admin/loan/saveinstockinfo.html',
            data: {
                "orderid":"${loanInfo.orderid}",			//订单编号
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
                "instocktime":$("#instocktime").val(),				//入库时间
                "instockstuff":$("#instockstuff").val(),			//入库人
                "instockparkerstuff":$("#instockparkerstuff").val(),		//停车场接收人
                "remark":$("#remark").val(),							//备注信息
                "reviewconclusion_instock":$("#reviewconclusion_instock").find("option:selected").text(),		//评审意见
                "stockstatus":"1",										//入库状态
                "stockobjectkind":$("#stockobjectkind").find("option:selected").text(),
                "processDefinitionId":$("#processDefinitionId").val(),
                "taskId":$("#taskId").val(),
                "loanId":$("#loanId").val(),
                "instockPic":$("#instockPic").val(),
                "parkingPic":$("#parkingPic").val(),
                "storekeeperWithVehicle":$("#storekeeperWithVehicle").val(),
                "imageUpLoad":"yes",
            },
            dataType: "text",
            success: function (data) {
                if (data == "0000") {
                    layer.msg("入库数据保存成功!");
                    history.go(-1);
                    return true;
                } else {
                    layer.msg("入库数据保存失败!");
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
        $("#instocktime").val("");
        $("#instockstuff").val("");
        $("#instockparkerstuff").val("");
        $("#remark").val("");
    }
</script>
</html>
