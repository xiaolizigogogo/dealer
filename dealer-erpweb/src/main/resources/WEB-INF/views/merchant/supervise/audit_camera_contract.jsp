<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>工作平台</title>
    <link href="${basePath}/css/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${basePath}/css/bootstrap-datetimepicker.min.css">
    <%--     <link rel="stylesheet" href="${ basePath }/css/bootstrap/bootstrap-table.css"> --%>
    <link rel="stylesheet" type="text/css" href="${basePath}/css/font-awesome.min93e3.css"/>
    <link rel="stylesheet" type="text/css" href="${basePath}/css/common.css"/>
    <link rel="stylesheet" href="${basePath}/js/layer/skin/layer.css" />
    <link rel="stylesheet" href="${basePath}/css/viewer/viewer.css">
    <link rel="stylesheet" type="text/css" href="${basePath}/css/pagination.css"/>
    <link rel="stylesheet" type="text/css" href="${basePath}/css/dateRange.css"/>
    <%--  <script src="${basePath}/js/jquery.min.js" ></script>--%>
    <style>
        dd p{ padding-top:7px;}
        .triangle_border_up{
            position:absolute;
            bottom:-4px;
            left:50%;
            width:0;
            height:0;
            border-width:0 10px 10px;
            border-style:solid red;
            border-color:transparent transparent;/*透明 透明  灰*/
        }
        .triangle_border_up span{
            display:block;
            width:0;
            height:0;
            border-width:0 8px 8px;
            border-style:solid;
            border-color:transparent transparent #fff;/*透明 透明  黄*/
            position:absolute;
            top:2px;
            left:-8px;
        }
        #nav-tabs>li{
            position:relative;
        }
        .display-none{
            display:none;
        }
        .tab_box .nav-tabs{
            background:none !important;
        }
        .tab_box .nav > li > a{
            color:#555;
        }
    </style>

</head>
<body>
<!--开始时间-->
<input type="hidden" value=""  id="startDate" />
<!--结束时间  -->
<input type="hidden" value=""  id="endDate"/>
<!--开始时间-->
<input type="hidden" value=""  id="Longitude" />
<!--结束时间  -->
<input type="hidden" value=""  id="Latitude"/>
<!--用于传递报警类型状态-->
<input type="hidden" value=""  id="tou"/>


<div class="layui-layer-title" style="cursor: move;" move="ok" id="title"><h4></h4></div>
<div style="background:#eee;" >
    <div class="from_box">
        <div class="from_tit clearfix">
            <h3 class="pull-left">监管车辆</h3>
        </div>
        <div id="carInfo"  class="from_con clearfix">

        </div>
    </div>


    <div class="modal-body" >
        <div class="tab_box clearfix">
            <div class="from_tit clearfix">
                <h3 class="pull-left">监管详情</h3>
            </div>
            <div class="clearfix">
                <div class="form-group pull-left">
                    <div class="ta_date" id="div_date1" style="width: 250px;"> <span class="date_title" id="date1"></span> <a class="opt_sel" id="input_trigger1" href="#"> <i class="i_orderd"></i> </a> </div>
                    <div id="datePicker1"></div>

                </div>
                <a class="btn btn-danger  pull-left " href="http://fengkong.chexiao.co/" target="_blank" style=" margin-left:15px;"  >查看OBD</a>
            </div>
            <!-- Nav tabs -->
            <ul class="nav nav-tabs" role="tablist" id="nav-tabs">
                <li role="presentation" >
                    <div class="triangle_border_up" style="display:none;">
                        <span></span>
                    </div>
                    <a href="#tab1" class="tab_first" aria-controls="tab1" role="tab" data-toggle="tab" onclick='getSupervisions(1,1)'>拆除报警</a></li>
                <li role="presentation">
                    <div class="triangle_border_up" style="display:none;">
                        <span></span>
                    </div>
                    <a href="#tab3" aria-controls="tab3" role="tab" data-toggle="tab" onclick='getSupervisions(2,1)' >原地设防报警</a></li>

                <li class="col-sm-2" style="float: right"><button type="submit"   onclick="finalPosition()" class="btn btn-danger btn-block"  >查看最后位置</button></li>
            </ul>
            <!-- Tab panes -->
            <div class="tab-content clearfix">
                <div role="tabpanel" class="tab-pane" id="tab1">
                    <div class="from_box" >
                        <table  class="table table-bordered table-striped">
                            <thead>
                            <tr>
                                <th>报警时间</th>
                                <th>解除报警时间</th>
                                <th>车主姓名</th>
                                <th>车牌号</th>
                                <th>设备编号</th>
                                <th>车主电话</th>
                                <th>行驶里程</th>
                                <th>报警地址</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody id="toby1">

                            </tbody>
                        </table>
                    </div>
                    <div class="clearfix col-sm-12">
                        <div id="total2" class="pull-left"></div>
                        <div id="Pagination2" class="pagination pull-right"><!-- 这里显示分页 --></div>
                    </div>

                </div>
                <div role="tabpanel" class="tab-pane" id="tab2">
                    <div class="from_box" >
                        <table  class="table table-bordered table-striped">
                            <thead>
                            <tr>
                                <th>报警时间</th>
                                <th>车主姓名</th>
                                <th>车牌号</th>
                                <th>设备编号</th>
                                <th>车主电话</th>
                                <th>偏移距离</th>
                                <th>行驶里程</th>
                                <th>报警地址</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody id="toby2">

                            </tbody>
                        </table>
                    </div>
                    <div class="clearfix col-sm-12">
                        <div id="total3" class="pull-left"></div>
                        <div id="Pagination3" class="pagination pull-right"><!-- 这里显示分页 --></div>
                    </div>

                </div>
    </form>
</div>
<!-- <div class="modal-footer">
  <p class="col-sm-2"> <a  href = "javascript:void(0)" onclick = "colsediv(0)" class="btn btn-default btn-block">关闭</a> </p>
  <p class="col-sm-2 "> <a  href="../order/add.html" onclick = "colsediv(0)" class="btn btn-danger btn-block">审核提交</a> </p>
  </div> -->
</body>
<script src="${basePath}/js/jquery.min.js" ></script>
<script src="${basePath}/js/common.js"></script>
<%--<script src="${basePath}/js/jquery.js"></script>--%>
<script src="${basePath}/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${basePath}/js/layer/layer.js"></script>
<script src="${basePath}/js/tableutils.js"></script>
<script src="${basePath}/js/jquery.validate.js"></script>
<script src="${basePath}/js/distpicker/distpicker.data.js"></script>
<script src="${basePath}/js/distpicker/distpicker.js"></script>
<script src="${basePath}/js/carDealerApply.js"></script>
<script src="${basePath}/js/viewer/viewer.js"></script>
<script src="${basePath}/js/lightbox-plus-jquery.min.js"></script>
<script src="${basePath}/js/uploadPreview.js" type="text/javascript"></script>
<script src="${basePath}/js/jquery.pagination.js" ></script>
<script src="${basePath}/js/datetimepicker.js"></script>
<script type="text/javascript" src="${basePath}/js/dateRange.js"></script>
<script src="${basePath}/js/bootstrap-datetimepicker.min.js"></script>
<script src="${basePath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="${basePath}/js/datetimepicker.js"></script>

<script>
    $(function(){
        init();
    })
    var parentInit = 0;
    var sonInit1 = 0;
    var sonInit2 = 0;
    var sonInit3 = 0;
    var pageSize = 15;
    function getSupervisions(obj,pageNum) {
        $("#tou").val(obj);
        var param =variable(pageNum,pageSize);
        param['alarmType'] = obj;
        console.log(param);
        $('li[role="presentation"]').find('.triangle_border_up').hide();
        $('li[role="presentation"]').eq(obj-1).find('.triangle_border_up').show();
        $('.tab-pane').hide();
        $('.tab-pane').eq(obj-1).show();
        $('.tab-pane').eq(obj-1).css('visibility','inherit');
//获取页面初始数据
        $.ajax({
            type: 'post',
            url: "/admin/supervise/getsuperviseInfo",
            timeout:15000,
            data: JSON.stringify(param),
            contentType:"application/json",
            dataType: "json",
            success: function(data){
                debugger;
                if (obj==1) {
                    $("#total2").html("每页显示"+pageSize+"条，共" + data.sum + "条记录");
                }else if (obj==2){
                    $("#total3").html("每页显示"+pageSize+"条，共" + data.sum + "条记录");
                }
                var list="";
                var caozuo;
                if(data.carAlarm!=null&&data.carAlarm.length>=0 && obj ==1){
                    for(var i = 0; i <data.carAlarm.length;i++){
                        var type="";
                        if( data.carAlarm[i].isDismantle==1) {
                            type="拆除报警";
                        }else if(data.carAlarm[i].isDismantle==2){
                            type="原地设防报警";
                        }

                        caozuo="<td><a href='#' onclick='baiduMap("+data.carAlarm[i].longitude+","+data.carAlarm[i].latitude+")'>查看地图</a></td>"
                        list+=  "<tr>"
                            +"<td>"+data.carAlarm[i].alarmTime+"</td>"
                            +"<td>"+data.carAlarm[i].relieve_time+"</td>"
                            +"<td>"+data.carAlarm[i].owner_name+"</td>"
                            +"<td>"+data.carAlarm[i].carNum+"</td>"
                            +"<td>"+data.carAlarm[i].deviceNum+"</td>"
                            +"<td>"+data.carAlarm[i].tel+"</td>"
                            +"<td>"+data.carAlarm[i].mileage+"</td>"
                            +"<td>"+data.carAlarm[i].alarm_address+"</td>"
                            +caozuo+"</tr>";
                    }
                }else if (data.carAlarm!=null&&data.carAlarm.length>=0 && obj ==2){
                    for(var i = 0; i <data.carAlarm.length;i++){
                        caozuo="<td><a href='#' onclick='baiduMap("+data.carAlarm[i].longitude+","+data.carAlarm[i].latitude+")'>查看地图</a></td>"
                        list+=  "<tr>"
                            +"<td>"+data.carAlarm[i].alarmTime+"</td>"
                            +"<td>"+data.carAlarm[i].owner_name+"</td>"
                            +"<td>"+data.carAlarm[i].carNum+"</td>"
                            +"<td>"+data.carAlarm[i].deviceNum+"</td>"
                            +"<td>"+data.carAlarm[i].tel+"</td>"
                            +"<td>"+(data.carAlarm[i].disOffset==null?"-":data.carAlarm[i].disOffset)+"</td>"
                            +"<td>"+data.carAlarm[i].mileage+"</td>"
                            +"<td>"+data.carAlarm[i].alarm_address+"</td>"
                            +caozuo+"</tr>";
                    }
                }
                debugger;
                if(sonInit1 == 0 && obj==1){
                    sonInit1 = 1;
                    initPagination = function() {
                        // 创建分页
                        $("#Pagination2").pagination(data.sum, {
                            num_edge_entries: 1, //边缘页数
                            num_display_entries: 6, //主体页数
                            callback: pageselectCallback,
                            items_per_page:pageSize //每页显示1项
                        });
                    }();
                }
                if(sonInit2 == 0 && obj==2){
                    sonInit2 = 1;
                    initPagination = function() {
                        // 创建分页
                        $("#Pagination3").pagination(data.sum, {
                            num_edge_entries: 1, //边缘页数
                            num_display_entries: 6, //主体页数
                            callback: pageselectCallback,
                            items_per_page:pageSize //每页显示1项
                        });
                    }();
                }
               /* if(sonInit3 == 0 && obj==3){
                    sonInit3 = 1;
                    initPagination = function() {
                        // 创建分页
                        $("#Pagination4").pagination(data.sum, {
                            num_edge_entries: 1, //边缘页数
                            num_display_entries: 6, //主体页数
                            callback: pageselectCallback,
                            items_per_page:pageSize //每页显示1项
                        });
                    }();
                }*/
                if (obj ==1) {
                    $("#toby1").html(list);
                }else if(obj ==2){
                    $("#toby2").html(list)
                }
            },error:function(){
                layer.msg("系统错误！");
            }
        });
    }

    //页面初始化
    function init(){
        var param =variable(1,pageSize);
        param['alarmType'] = 1;
        //获取经销商的所有信息
        $.ajax({
            type: 'post',
            url: "/admin/supervise/getsuperviseInfo",
            timeout:150000,
            data: JSON.stringify(param),
            contentType:"application/json",
            dataType: "json",
            success: function(data){
                console.log(data);
                merchantinfo(data);
                var list="";
                var caozuo;
                if(data.carAlarm!=null&&data.carAlarm.length>=0){
                    for(var i = 0; i <data.carAlarm.length;i++){
                        var type="";
                        if( data.carAlarm[i].isDismantle==1) {
                            type="拆除报警";
                        }else if(data.carAlarm[i].isDismantle==2){
                            type="原地设防报警";
                        }
                        caozuo="<td><a href='#' onclick='baiduMap("+data.carAlarm[i].longitude+","+data.carAlarm[i].latitude+")'>查看地图</a></td>"
                        list+=  "<tr>"
                            +"<td>"+data.carAlarm[i].alarmTime+"</td>"
                            +"<td>"+data.carAlarm[i].relieve_time+"</td>"
                            +"<td>"+data.carAlarm[i].owner_name+"</td>"
                            +"<td>"+data.carAlarm[i].carNum+"</td>"
                            +"<td>"+data.carAlarm[i].deviceNum+"</td>"
                            +"<td>"+data.carAlarm[i].tel+"</td>"
                            +"<td>"+data.carAlarm[i].mileage+"</td>"
                            +"<td>"+data.carAlarm[i].alarm_address+"</td>"
                            +"<td>" + type + "</td>"

                            +caozuo+"</tr>";
                    }
                }
                $("#total2").html("每页显示"+pageSize+"条，共"+data.sum+"条记录");
                if(parentInit == 0){
                    parentInit = 1;
                    initPagination = function() {
                        // 创建分页
                        $("#Pagination2").pagination(data.sum, {
                            num_edge_entries: 1, //边缘页数
                            num_display_entries: 6, //主体页数
                            /*   callback: pageselectCallback,*/
                            items_per_page:pageSize //每页显示1项
                        });
                    }();
                }
                $("#toby1").html(list);
                getSupervisions(1,1);
            },error:function(){
                layer.msg("系统错误！");
            }
        });

    }

    function variable(pageNum,pageSize){
        var datarequest={};
        datarequest['pageNum'] = pageNum;
        datarequest['pageSize'] = pageSize;
        datarequest['indentId'] = $("#indentId").val();
        datarequest['plateNumber'] = $("#plateNumber").val();
        if ($("#startDate").val() != "请选择开始日期") {
            datarequest['startTime'] = $("#startDate").val();
        }
        datarequest['endTime'] = $("#endDate").val();
        return datarequest;
    }

    function  merchantinfo(data) {
        //车辆信息
        var carHtml = "";
        for(var obj in carInfoList){
            carHtml += carInfo(obj,data.caInfo[obj]);
        }
        //车辆信息
        $("#carInfo").html(carHtml);
    }

    var carInfoList={"cBrand":"车辆品牌","cModel":"车辆型号","carPlate":"车牌号码","miles":"已行驶里程","firstUpTime":"购置日期","ariableBox":"变速箱","engine":"发动机号","indoorType":"室内装置","bodyStructure":"车身结构","carColour":"颜色","drivingWheel":"驱动轮","displacement":"排量","invoice":"发票价"};

    //车辆信息
    function carInfo(param1,param2){
        var html = "<div class='col-sm-3'>"
            +"<dl class='dl-horizontal'>"
            + "<dt>"+carInfoList[param1]+"</dt>"
            +" <dd><p>"+(param2==null?"无":param2)+"</p></dd>"
            +"</dl></div>";
        return html;
    }
    function baiduMap(longitude,latitude) {
        layer.open({
            type: 2,
            area: ['700px', '338px'],
            fix: true,
            title: '百度地图',
            maxmin: true,
            content: '/admin/page/merchant/supervise/baiduMap?longitude=' + longitude +'&latitude='+latitude
        });
    }

    var dateRange1 = new pickerDateRange('date1', {
        isTodayValid : true,
        startDate : '请选择开始日期',
        endDate : '',
        autoSubmit : false,
        inputTrigger : 'input_trigger1',
        theme : 'ta',
        success : function(obj) {
            $("#dCon2").html('开始时间 : ' + obj.startDate + '<br/>结束时间 : ' + obj.endDate);
            $("#startDate").val(obj.startDate);
            $("#endDate").val(obj.endDate);
            getSupervisions($("#tou").val(),1);
        },
        clear :function(){
            $("#date1").html("请选择开始日期");
            $("#startDate").val(null);
            $("#endDate").val(null);

        }
    });

    function pageselectCallback(page_index, jq){
        getSupervisions($("#tou").val(),page_index+1);
        return true;
    }

    function finalPosition() {
        debugger;
        var param = variable(1, pageSize);
        param['alarmType'] = 1;
        $.ajax({
            type: 'post',
            url: "/admin/supervise/getFinalPosition",
            timeout: 150000,
            data: JSON.stringify(param),
            contentType: "application/json",
            dataType: "json",
            beforeSend: function () {
                load = layer.load();
            },
            success: function (data) {
                layer.close(load);
                baiduMap(data.lastLocation.longitude,data.lastLocation.latitude);


            }
        });
    }
</script>
</html>
