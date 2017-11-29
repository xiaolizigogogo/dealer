<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>已完结订单</title>
    <link href="${basePath}/css/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${basePath}/css/bootstrap/bootstrap-table.css">
    <link rel="stylesheet" type="text/css" href="${basePath}/css/font-awesome.min93e3.css"/>
    <link rel="stylesheet" type="text/css" href="${basePath}/css/common.css"/>
    <link rel="stylesheet" href="${basePath}/css/bootstrap-datetimepicker.min.css">
</head>

<body>
<div class="modal-body" >
    <div class="tab_box clearfix">

        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist" id="nav-tabs">
            <li role="presentation"><a href="#tab6" aria-controls="tab6" role="tab" data-toggle="tab">经销商资料</a></li>
            <li role="presentation" id="car_tab"><a href="#tab7" aria-controls="tab7" role="tab" data-toggle="tab" >车辆信息</a></li>
            <li role="presentation"><a href="#tab2" aria-controls="tab2" role="tab2" data-toggle="tab">附件资料</a></li>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content clearfix">
            <div role="tabpanel" class="tab-pane active" id="tab1">
                <div class="from_box">
                    <div class="from_tit clearfix">
                        <h3 class="pull-left">基本信息</h3>
                    </div>
                    <div class="row"  id="baseInfo"></div>
                </div>
                <div class="from_box">
                    <div class="from_tit clearfix">
                        <h3 class="pull-left">利率、期限</h3>
                    </div>
                    <div class="row" id="rateInfo"></div>
                </div>
                <div class="from_box">
                    <div class="from_tit clearfix">
                        <h3 class="pull-left">其他费用</h3>
                    </div>
                    <div class="row">
                        <div class="col-sm-4">
                            <dl class="dl-horizontal">
                                <dt>管理费</dt>
                                <dd>1%</dd>
                            </dl>
                        </div>
                        <div class="col-sm-4">
                            <dl class="dl-horizontal">
                                <dt>摄像头</dt>
                                <dd>按月支付租金</dd>
                            </dl>
                        </div>
                    </div>
                </div>

            </div>

            <div role="tabpanel" class="tab-pane" id="tab4">
                <div class="row">
                    <div class="col-sm-12 list_box">
                        <table class="table table-bordered table-striped">
                            <thead>
                            <tr>

                                <th>还款状态</th>
                                <th>催收方式</th>
                                <th>催收人</th>
                                <th>催收时间</th>
                                <th>备注</th>
                            </tr>
                            </thead>
                            <tbody >

                            <td>还款处理</td>
                            <td>短信</td>
                            <td>某某</td>
                            <td>201521021520</td>
                            <td>短信备注</td>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane" id="tab2">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="from_box">
                            <div class="from_tit clearfix">
                                <h3 class="pull-left">经销商信息</h3>
                            </div>
                            <div class="img_list" id="attachment">
                                <ul class="list-inline" ></ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="from_box">
                            <div class="from_tit clearfix">
                                <h3 class="pull-left">车辆类信息</h3>
                            </div>
                            <div class="img_list"  id="carPic">
                                <ul class="list-inline"></ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="from_box">
                            <div class="from_tit clearfix">
                                <h3 class="pull-left">合同类信息</h3>
                            </div>
                            <div class="img_list" >
                                <div class="img_list" id="contract">
                                    <ul class="list-inline" ></ul>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
            <div role="tabpanel" class="tab-pane" id="tab6">
                <div class="clearfix">
                    <div class="from_box col-sm-3" id="total_count">
                        <div class="from_tit clearfix">
                            <h3 class="pull-left">申请总订单数</h3>
                        </div>
                        <h1 class="text-danger text-center" style="margin-top:10px;"></h1>
                    </div>
                    <div class="col-sm-3">
                        <div class="from_box " id="loan_count">
                            <div class="from_tit clearfix">
                                <h3 class="pull-left">已放款订单/金额</h3>
                            </div>
                            <h1 class="text-danger text-center" style="margin-top:10px;"></h1>
                        </div></div>
                    <div class="col-sm-3">
                        <div class="from_box" id="noloan_count">
                            <div class="from_tit clearfix">
                                <h3 class="pull-left">未放款订单数</h3>
                            </div>
                            <h1 class="text-danger text-center" style="margin-top:10px;"></h1>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="from_box">
                            <div class="from_tit clearfix">
                                <h3 class="pull-left">逾期订单/金额</h3>
                            </div>
                            <h1 class="text-danger text-center" style="margin-top:10px;">1单 / 10.0万元</h1>
                        </div>
                    </div>
                </div>
                <div class="from_box">
                    <div class="from_tit clearfix">
                        <h3 class="pull-left">基本信息</h3>
                    </div>
                    <div id="basic" >
                    </div>
                </div>
                <div class="from_box">
                    <div class="from_tit clearfix">
                        <h3>银行卡信息</h3>
                    </div>
                    <div class="row">
                        <div id="bankcard">
                        </div>
                    </div>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane" id="tab7">
                <div class="from_box">
                    <div class="from_tit clearfix">
                        <h3 class="pull-left">车辆信息</h3>
                    </div>
                    <div class="row">
                        <div  id="carInfo" >
                        </div>
                    </div>
                </div>
                <div class="from_box">
                    <div class="from_tit clearfix">
                        <h3 class="pull-left">车辆评估信息</h3>
                    </div>
                    <div class="row">
                        <div class="row" id="carAssessInfo">

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="${basePath}/js/jquery.min.js" ></script>
<script src="${basePath}/js/bootstrap.min.js"></script>
<script src="${basePath}/js/lightbox-plus-jquery.min.js"></script>
<script src="${basePath}/js/common.js"></script>
<script src="${basePath}/js/uploadPreview.js" type="text/javascript"></script>
<script>
    $("#car_more").click(function () {
        $(".nav-tabs").find("li").removeClass('active');
        $("#car_tab").addClass('active');
        location.hash = 'header';
    });


    /*$(document).ready(function(e) {

     (".bs-docs-popover").popover();
     });*/
    $(function(){
        init();
    })
    var processDefinitionId = parent.$("#flowStatus_select").val();
    function init(){
        //根据流程状态显示特定div
        $("#op_box_" + processDefinitionId).css("display","block");
        //初始化出账时间
        // var currentTime = new Date().Format("yyyy-MM-dd");
        //$("#lended_time").val(currentTime);
        getInitData();
        //获取页面初始数据
    }

    function getInitData(){
        debugger;
        $.ajax({
            type: 'post',
            url: "${basePath}/admin/order/orderInfo",
            data: {"indent_uuid":parent.$("#indent_uuid").val()},
            dataType: "json",
            success: function(data){
                debugger;
                orderinfo(data);
            },error:function(){
                layer.msg(" 系统错误！");
            }
        });
    }
    function orderinfo(data) {
        debugger;
        //绑定总订单数、已放款订单/金额、未放款订单数
        $("#total_count").children("h1").html(data.indentCount.totalIndent+"单");
        //绑定已放款订单/金额
        $("#loan_count").children("h1").html(data.indentCount.loanCount+"单/"+data.indentCount.loanMoney+"万元");
        //绑定未放款订单数
        $("#noloan_count").children("h1").html(data.indentCount.unLoan+"单");
        //经销商基本信息
        var merchantHtml="";
        //联系人信息
        var contactHtml="";
        //借款基本信息
        var baseInfoHtml="";
        //利率
        var rateInfoHtml = "";
        //银行卡信息
        var bankcardHtml="";
        //车辆信息
        var carHtml="";
        //车辆评估信息
        var carAssessHtml="";
        //附件信息
        var attachmentHtml="";
        //合同信息
        var contractHtml="";
        // 车辆附件
        var carPicHtml = "";

        for(var obj in merchantList){
            merchantHtml += merchant(obj,data.customerInfo[0][obj]);
        }
        for(var obj in contactList){
            contactHtml += contact(obj,data.customerInfo[0].roleInfo);
        }
        for(var obj in baseInfoList){
            baseInfoHtml +=baseInfo(obj,data.loanInfo[obj]);
        }
        for (var obj in rateList){
            rateInfoHtml += rateInfo(obj,data.percentInterest[obj]);
        }
        for(var obj in bankcardList){
            bankcardHtml += bankcard(obj,data.customerBankInfo);
        }
        for(var obj in carInfoList){
            carHtml += carInfo(obj,data.carInfo[obj]);
        }
        for(var obj in carAssessInfoList){
            carAssessHtml +=carAssessInfo(obj,data.appraisalInfo[obj]);
        }

        for(var obj in data.customerMerPic){
            attachmentHtml+=attchmentAndcontract(data.customerMerPic[obj]);
        }

        for(var obj in data.carPic){
            carPicHtml+=attchmentAndcontract(data.carPic[obj]);
        }

        for(var obj in data.customerContract){
            contractHtml+=attchmentAndcontract(data.customerContract[obj]);
        }

        //经销商基本信息
        $("#basic").html(merchantHtml+contactHtml);
        //还款情况基本信息
        $("#baseInfo").html(baseInfoHtml);
        //利率,期限
        $("#rateInfo").html(rateInfoHtml);
        //经销商银行卡信息
        $("#bankcard").html(bankcardHtml);
        //车辆信息
        $("#carInfo").html(carHtml);
        //评估信息
        $("#carAssessInfo").html(carAssessHtml);
        //附件信息
        $("#attachment").children("ul").html(attachmentHtml);
        //合同信息
        $("#contract").children("ul").html(contractHtml);
        //车辆附件
        $("#carPic").children("ul").html(carPicHtml);
    }
    var baseInfoList={"indentNumber":"订单号","merchantName":"经销商","createdTime":"申请时间","repaymentState":"还款状态","approvalAmount":"审批金额","applyMoney":"申请金额","loanDays":"借款天数","overdueDays":"逾期天数","repayment":"实际还款金额","overdueeRpayment":"逾期还款金额","repaymentDate":"还款日期"};
    var rateList={"limitpercentage":"额度比例","monthlyinterest":"月利率","overdueInterest":"逾期利率","":"计息日","deadlineTime":"最大借款期限"};
    var loanStatusEnum={"assess":"待评估","trial":"待初审","datareview":"待复核","judgment":"待终审","lended":"待放款","repayment":"还款中","ended":"完结"};
    var merchantList={"merchantName":" 经销商名称","licenseNumber":"营业执照号","organizationCode":"组织机构代码", "address":"公司地址","introduce":"车行介绍","carport":"车位个数","repertory":"库存量","scale":"车商规模"};
    var contactList={"1":"法人代表","2":"实际控股人","3":"业务联络人","4":"金融保险经理","5":"财务经理"};
    var bankcardList={"1":"放款银行卡卡号-开户行-开户名","2":"还款银行卡卡号-开户行-开户名"};
    var carInfoList={"cBrand":"车辆品牌","cModel":"车辆型号","carPlate":"车牌号码","miles":"已行驶里程","firstUpTime":"购置日期","ariableBox":"变速箱","engine":"发动机号","indoorType":"室内装置","bodyStructure":"车身结构","carColour":"颜色","drivingWheel":"驱动轮","displacement":"排量","invoice":"发票价"};
    var carAssessInfoList={"saledType":"全款/按揭","appraisersPrice":"评估价格","realName":"评估师","remark":"评估结论"};
    function merchant(param1,param2){
        var html = "<div class='col-sm-4'>"
            + "<dl class='dl-horizontal'>"
            + "<dt>" + merchantList[param1] + "</dt>"
            + "<dd><p>" + param2 + "</p></dd>"
            + "</dl></div>";
        return html;
    }
    // 利率信息
    function rateInfo(param1,param2) {
        var html = "<div class='col-sm-4'>"
            + "<dl class='dl-horizontal'>"
            + "<dt>" + rateList[param1] + "</dt>"
            + "<dd>" + param2 + "</dd>"
            + "</dl></div>"
        return html;
    }
    //借款需求基本信息
    function baseInfo(param1,param2) {
        if (param1 == "approvalAmount" || param1 == "applyMoney") {
            if (param1 == "applyMoney" && param2 == 0.00) {
                param2 = "<b class='text-danger'>最大贷款额</b>";
            } else {
                param2 = "<b class='text-danger'>" + param2 + "</b> 万元";
            }
        }
        if(param1=="indentState"){
            param2 = "<b>"+loanStatusEnum[param2]+"</b>";
        }
        var html = "<div class='col-sm-4'>"
            + "<dl class='dl-horizontal'>"
            + "<dt>" + baseInfoList[param1] + "</dt>"
            + "<dd>"+ param2 + "</dd>"
            + "</dl></div>"
        return html;
    }
    //相关联系人信息
    function contact(param1,param2){
        var html = "";
        for(var i = 0; i < param2.length; i++){
            html += "<div class='col-sm-4'>"
                + "<dl class='dl-horizontal'>"
                + "<dt>" + contactList[param1] + "</dt>"
                + "<dd><p>" + param2[i].personName
                + "<i class='fa fa-phone-square text-danger' style='padding-left:10px;' >&nbsp;&nbsp;"
                + param2[i].phoneNumber
                + "</i></p></dd></dl></div>";
            break;
        }
        return html;
    }
    //银行卡信息
    function bankcard(param1,param2){
        var html="";
        var array = bankcardList[param1].split("-");
        for(var i = 0; i < param2.length; i++){
            if(param1==param2[i].cardstate){
                html += "<div class='col-sm-4'>"
                    +"<dl class='dl-horizontal'>"
                    + "<dt>" + array[0] + "</dt>"
                    + "<dd><p>" + param2[i].banknumber + "</p>"
                    + "</dl></div>"
                    + "<div class='col-sm-4'>"
                    + "<dl class='dl-horizontal'>"
                    + "<dt>" + array[1] + "</dt>"
                    + "<dd><p>" + param2[1].bankname + "</p></dd>"
                    + "</dl></div>"
                    + "<div class='col-sm-4'>"
                    + "<dl class='dl-horizontal'>"
                    + "<dt>" + array[2] + "</dt>"
                    + "<dd><p>" + param2[i].cardholder + "</p></dd>"
                    + "</dl></div>";
            }
        }
        return html;
    }
    //车辆信息
    function carInfo(param1,param2){
        var html = "<div class='col-sm-3'>"
            +"<dl class='dl-horizontal'>"
            + "<dt>"+carInfoList[param1]+"</dt>"
            +" <dd><p>"+(param2==null?"无":param2)+"</p></dd>"
            +"</dl></div>";
        return html;
    }
    //车辆评估信息
    function carAssessInfo(param1,param2){
        if(param1=="approvalAmount"){
            param2= "<b class='text-danger'>"+param2+"</b> 万元";
        }
        if(param1=="loanLimit"){
            param2= "<span class='text-danger'>"+param2+"</span>";
        }
        var html = "<div class='col-sm-3'>"
            +"<dl class='dl-horizontal'>"
            + "<dt>"+carAssessInfoList[param1]+"</dt>"
            +" <dd><p>"+(param2==null?"无":param2)+"</p></dd>"
            +"</dl></div>";
        return html;
    }
    //附件信息和合同信息页面属性一致，统一定义到一个function里边
    function attchmentAndcontract(param){
        var html="";
        html+="<li>"
            + "<div class='file_img'>"
            + "<p class='tools'><a href='javascript:void(0);' onclick='pictureDownload(7701)' title='保存'><i class='fa  fa-save'></i></a><a href="+ param.fileName+" data-lightbox='example-set' data-title="+param.fileName+" title='放大'><i class='fa  fa-search-plus'></i></a></p>"
            + "<a href="+param.fileUrl+" data-lightbox='set_img' data-title="+param.fileName+" title='放大'><img class='example-image' src="+param.fileUrl+"></a> </div>"
            + "<h4>"+param.fileName+"</h4>"
            + "</li>"
        return html;
    }
</script>
</body>
</html>
</html>


