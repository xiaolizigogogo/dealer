<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <title>工作平台</title>
  <link href="${basePath}/css/bootstrap/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="${basePath}/css/font-awesome.min93e3.css"/>
  <link rel="stylesheet" type="text/css" href="${basePath}/css/common.css"/>
  <link rel="stylesheet" type="text/css" href="${basePath}/js/layer/skin/layer.css" />
  <link rel="stylesheet" href="${basePath}/css/viewer/viewer.css">
  <link rel="stylesheet" type="text/css" href="${basePath}/css/pagination.css"/>
  <script src="${basePath}/js/jquery.min.js" ></script>
  <style>
    dd p{ padding-top:7px;}
    .nav_left_list{
      padding: 6px 12px;
      font-size: 14px;
      margin-right: 5%;
      float: left;
      display: block;
    }
    .nav_left_list>img{
      height:20px;
      vertical-align: text-bottom;
    }
    thead>tr>th{
      text-align:center !important;
    }
  </style>
</head>
<body>
<div class="layui-layer-title" style="cursor: move;" move="ok" id="title"><h4></h4></div>
<div style="background:#eee;" >
  <div class="from_box">
    <div class="from_tit clearfix">
      <h3 class="pull-left">车商信息</h3>
    </div>
    <div id="basic"  class="from_con clearfix">

    </div>
  </div>
  <div class="from_box" >
    <div class="from_tit clearfix">
      <h3 class="pull-left"> 查看车商TPS数据报告 </h3>
    </div>
    <div class="img_list" style="overflow: hidden;">
      <div class="nav_left_list">收车管理<img src="http://z.k1982.com/png/up/200711/20071127105945389.png" alt=""></div>
      <div class="nav_left_list">整备管理<img src="http://z.k1982.com/png/up/200711/20071127105945389.png" alt=""></div>
      <div class="nav_left_list">销售管理<img src="http://z.k1982.com/png/up/200711/20071127105945389.png" alt=""></div>
      <div class="nav_left_list">保有客户管理<img src="http://z.k1982.com/png/up/200711/20071127105945389.png" alt=""></div>
      <a style="float: right" class="btn btn-danger" href="#" onclick="jumpToTpsData()">点击查看</a>
    </div>
  </div>
  <div class="from_box" >
    <table  class="table table-bordered table-striped">
      <thead>
      <tr>
        <th>车辆编号</th>
        <th>品牌</th>
        <th>车系</th>
        <th>放款时间</th>
        <th>原车牌号</th>
        <th>过户后车牌号码</th>
        <th>放款金额(元)</th>
        <th>周期(天)</th>
        <th>利率</th>
        <th>还款日期</th>
        <th>还款金额(元)</th>
        <th>操作</th>
      </tr>
      </thead>
      <tbody id="recordList">

      </tbody>
    </table>
  </div>
  <div id="order_modal" class="modal fade in"></div>
  <div class="clearfix col-sm-12">
    <div id="total1" class="pull-left"></div>
    <div id="Pagination1" class="pagination pull-right"><!-- 这里显示分页 --></div>
  </div>
  <!--分页及总条数内容-->
  </form>
</div>
<!-- <div class="modal-footer">
  <p class="col-sm-2"> <a  href = "javascript:void(0)" onclick = "colsediv(0)" class="btn btn-default btn-block">关闭</a> </p>
  <p class="col-sm-2 "> <a  href="../order/add.html" onclick = "colsediv(0)" class="btn btn-danger btn-block">审核提交</a> </p>
  </div> -->
</body>
<script src="${basePath}/js/common.js"></script>
<script src="${basePath}/js/jquery.js"></script>
<script src="${basePath}/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${basePath}/js/layer/layer.js"></script>
<script src="${basePath}/js/tableutils.js"></script>
<script src="${basePath}/js/jquery.validate.js"></script>
<script src="${basePath}/js/distpicker/distpicker.data.js"></script>
<script src="${basePath}/js/distpicker/distpicker.js"></script>
<script src="${basePath}/js/carDealerApply.js"></script>
<script src="${basePath}/js/viewer/viewer.js"></script>
<script src="${basePath}/js/jquery.pagination.js" ></script>
<script>
    $(function(){
        initObd();
    })
    var isInit = 0;
    var pageSize =15;
    function initObd(){
        var param =variable(1,pageSize);
        onObdDate(param);
    }
    //页面初始化
    function onObdDate(param){
        //隐藏域赋值
        $("[name='id']").val($("#applyId").val());
        //获取经销商的所有信息
        $.ajax({
            type: 'post',
            url: "/admin/supervise/merchantInfo",
            data: JSON.stringify(param),
            contentType:"application/json",
            dataType: "json",
            success: function(data) {
                merchantinfo(data);
                var list = "";
                var caozuo;
                var value;
                if (data.supervisions != null && data.supervisions.length >= 0) {
                    for (var i = 0; i < data.supervisions.length; i++) {
                        debugger;
                        caozuo = "<td><a href='#' onclick='supervisionsDetails(this)' id=" + data.supervisions[i].id + " value="+data.supervisions[i].plateNumber+" >查看监管</a></td>"
                        list += "<tr>"
                            + "<td>" + data.supervisions[i].productNo + "</td>"
                            + "<td>" + data.supervisions[i].cBrand + "</td>"
                            + "<td>" + data.supervisions[i].cType + "</td>"
                            + "<td>" + data.supervisions[i].outAccountTime + "</td>"
                            + "<td>" + data.supervisions[i].plateNumber + "</td>"
                            + "<td>" + (data.supervisions[i].afterPlateNumber==null?"-":data.supervisions[i].afterPlateNumber) + "</td>"
                            + "<td>" + data.supervisions[i].judgeMoney + "</td>"
                            + "<td>" + data.supervisions[i].deadlineTime+ "</td>"
                            + "<td>" + data.supervisions[i].interestRate+"%" + "</td>"
                            + "<td>" + data.supervisions[i].repaymenTime + "</td>"
                            + "<td>" + data.supervisions[i].repayment + "</td>"
                            + caozuo + "</tr>";
                    }

                }
              $("#total1").html("每页显示"+pageSize+"条，共"+data.sum+"条记录");
              if(isInit == 0) {
                isInit = 1;
                initPagination1 = function () {
                  // 创建分页
                  $("#Pagination1").pagination(data.sum, {
                    num_edge_entries: 1, //边缘页数
                    num_display_entries: 6, //主体页数
                    callback: pageselectCallback,
                    items_per_page: pageSize //每页显示1项
                  });
                }();
              }
                $("#recordList").html(list);

            },error:function(){
                layer.msg("系统错误！");
            }
        });
    }
    function  merchantinfo(data){
        //经销商基本信息
        var merchantHtml="";
        //联系人信息
        var contactHtml="";

        for(var obj in merchantList){
            merchantHtml += merchant(obj,data.customerInfo[0][obj]);
        }
        for(var obj in contactList){
            contactHtml+=contact(obj,data.customerInfo[0].roleInfo);
        }
        CarDealerLoan.convertPdfUrl();
        //基本信息
        $("#basic").html(merchantHtml+contactHtml);

    }
    //经销商信息
    var merchantList={"merchantName":" 经销商名称","licenseNumber":"营业执照号","organizationCode":"组织机构代码",
        "address":"公司地址","introduce":"车行介绍","carport":"车位个数","repertory":"库存量","scale":"车商规模"};
    //联系人信息(1.法人代表 2：实际控股人 3：业务联络人 4：金融保险经理 5：财务经理)
    var contactList={"1":"法人代表","2":"实际控股人","3":"业务联络人","4":"金融保险经理","5":"财务经理"};
    function merchant(param1,param2){
        var html = "<div class='col-sm-4'>"
            +"<dl class='dl-horizontal'>"
            + "<dt>"+merchantList[param1]+"</dt>"
            +" <dd><p>"+param2+"</p></dd>"
            +"</dl></div>";
        return html;
    }
    function contact(param1,param2){
        var html="";
        for(var i=0;i<param2.length;i++){
            if(param1==param2[i].roleName){
                html += "<div class='col-sm-4'>"
                    +"<dl class='dl-horizontal'>"
                    + "<dt>"+contactList[param1]+"</dt>"
                    +" <dd><p>"+param2[i].personName+"<i class='fa fa-phone-square text-danger' style='padding-left:10px;' >&nbsp;&nbsp;"+param2[i].phoneNumber+"</i>"
                    +"</p></dd>"
                    +"</dl></div>";
                break;
            }
        }
        return html;
    }
    function supervisionsDetails(obj){
        $("#indentId").val($(obj).attr("id"));
        $("#plateNumber").val($(obj).attr("value"));
        $("#merchant_modal").load("/admin/page/merchant/supervise/audit_camera_contract.html");
        opendiv("merchant_modal");
    }


    function variable(pageNum,pageSize){
        var datarequest={};
        datarequest['pageNum'] = pageNum;
        datarequest['pageSize'] = pageSize;
        datarequest['accountId'] = $("#applyId").val();
        return datarequest;
    }

    function pageselectCallback(page_index, jq){
        var param = variable(page_index+1,pageSize);
        onObdDate(param);
        return true;
    }

    function jumpToTpsData(){
        var timestamp = $.now();
        var accountId = $("#applyId").val();
        var newTab=window.open('about:blank');
        $.ajax({
            type:'get',
            url:"${basePath}/admin/merchant/jumpToTpsData",
            data: {
                "accountId":accountId,
                "timestamp":timestamp
            },
            dataType:"json",
            beforeSend: function () {
                load = layer.load()
            },
            success:function(data){
                debugger;
                if(data.success){
                    layer.close(load);
                    //var url = "http://192.168.1.171:4445/thirdIndex?accountId="+accountId+"&timestamp="+timestamp+"&token="+data.token;
                    newTab.location.href=data.url;
                }else{
                    layer.close(load);
                    layer.msg(data.msg);
                }
            },error:function(){
                layer.close(load);
                layer.msg(data.msg);
            }
        });
    };
</script>
</html>