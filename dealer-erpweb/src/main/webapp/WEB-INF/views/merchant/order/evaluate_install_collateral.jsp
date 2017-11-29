<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <title>工作平台</title>
  <link href="${basePath}/css/bootstrap/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="${basePath}/css/bootstrap/bootstrap-table.css">
  <link rel="stylesheet" type="text/css" href="${basePath}/css/font-awesome.min93e3.css"/>
  <link rel="stylesheet" type="text/css" href="${basePath}/css/common.css"/>
  <link rel="stylesheet" href="${basePath}/css/bootstrap-datetimepicker.min.css">
 <%-- <link rel="stylesheet" href="${basePath}/css/lightbox/lightbox.css">--%>
  <link rel="stylesheet" href="${basePath}/css/viewer/viewer.min.css">
</head>

<body>
<div class="layui-layer-title" style="cursor: move;" move="ok"  id="title"><h4>订单信息 <small style="padding-left:20px; font-size:14px;" class="text-muted"></small></h4></div>
<div class="modal-body" >
  <ol class="ui-step ui-step-red ui-step-6">
    <li class="step-start step-done">
      <div class="ui-step-line"></div>
      <div class="ui-step-cont"> <span class="ui-step-cont-number">√</span> <span class="ui-step-cont-text">申请贷款</span> </div>
    </li>
    <li class="step-done">
      <div class="ui-step-line"></div>
      <div class="ui-step-cont"> <span class="ui-step-cont-number">√</span> <span class="ui-step-cont-text">评估</span> </div>
    </li>
    <li class="step-done">
      <div class="ui-step-line"></div>
      <div class="ui-step-cont"> <span class="ui-step-cont-number">√</span> <span class="ui-step-cont-text">初审</span> </div>
    </li>
    <li class="">
      <div class="ui-step-line"></div>
      <div class="ui-step-cont" > <span class="ui-step-cont-number" id="span_datareview">4</span> <span class="ui-step-cont-text">复核</span> </div>
    </li>
    <li class="">
      <div class="ui-step-line"></div>
      <div class="ui-step-cont" > <span class="ui-step-cont-number" id="span_judgment">5</span> <span class="ui-step-cont-text">终审</span> </div>
    </li>
    <li class="step-end">
      <div class="ui-step-line"></div>
      <div class="ui-step-cont" > <span class="ui-step-cont-number" id="span_lended">6</span> <span class="ui-step-cont-text">放款</span> </div>
    </li>
  </ol>
  <div style="height:30px;"></div>
  <div class="tab_box clearfix">

    <!-- Nav tabs -->
    <ul class="nav nav-tabs" role="tablist">
      <li role="presentation" class="active"><a href="#tab1" aria-controls="tab1" role="tab" data-toggle="tab">经销商资料</a></li>
      <li role="presentation"><a href="#tab2" aria-controls="tab2" role="tab" data-toggle="tab">车辆信息</a></li>
      <li role="presentation"><a href="#tab3" aria-controls="tab3" role="tab" data-toggle="tab">借款需求</a></li>
      <li role="presentation" id="file_tab"><a href="#tab7" aria-controls="tab7" role="tab" data-toggle="tab">附件资料</a></li>
      <li role="presentation"><a href="#tab6" aria-controls="tab6" role="tab" data-toggle="tab">审批历史</a></li>
    </ul>
    <!-- Tab panes -->
    <div class="tab-content clearfix">
      <div role="tabpanel" class="tab-pane active" id="tab1">
        <%--<div class="clearfix">
          <div class="from_box col-sm-4" id="total_count">
            <div class="from_tit clearfix">
              <h3 class="pull-left">申请总订单数</h3>
            </div>
            <h1 class="text-danger text-center" style="margin-top:10px;"></h1>
          </div>
          <div class="col-sm-4">
            <div class="from_box " id="loan_count">
              <div class="from_tit clearfix">
                <h3 class="pull-left">已放款订单/金额</h3>
              </div>
              <h1 class="text-danger text-center" style="margin-top:10px;"></h1>
            </div></div>
          <div class="col-sm-4">
            <div class="from_box" id="noloan_count">
              <div class="from_tit clearfix">
                <h3 class="pull-left">未放款订单数</h3>
              </div>
              <h1 class="text-danger text-center" style="margin-top:10px;"></h1>
            </div>
          </div>
        </div>--%>
        <div class="from_box" >
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
          <div id="bankcard">
          </div>
        </div>
      </div>
      <div role="tabpanel" class="tab-pane" id="tab2">
        <div class="from_box ">
          <div class="from_tit clearfix">
            <h3 class="pull-left">车辆信息</h3>
          </div>
          <div  id="carInfo" >
          </div>
        </div>
        <div class="from_box">
          <div class="from_tit clearfix">
            <h3 class="pull-left">车辆评估信息</h3>
          </div>
          <div class="row" id="carAssessInfo">

          </div>
        </div>
      </div>
      <div role="tabpanel" class="tab-pane" id="tab3">
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
      </div>
      <div role="tabpanel" class="tab-pane" id="tab7">
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
              <div class="img_list" id="carPic">
                <ul class="list-inline" ></ul>
              </div>
            </div>
          </div>
          <div class="col-sm-12">
            <div class="from_box">
              <div class="from_tit clearfix">
                <h3 class="pull-left">合同类信息</h3>
              </div>
              <div class="img_list" id="contract">
                <ul class="list-inline" ></ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!--   <div class="alert alert-danger " role="alert" style=" margin-top:20px;"><i class="fa fa-exclamation-triangle" style="margin-right:10px;"></i> 此订单还未进行车辆评估，<a href="../product/add.html" class="btn btn-sm btn-danger" onclick = "colsediv(0)" >现在去评估</a></div> -->
  <div class="op_box_first_trial" id="op_box">
    <h4>初审</h4>
    <div class="op_box_con clearfix">
      <form class="form-horizontal" id="form_first_trial">
        <div>
          <div class="form-group">
            <div class="col-sm-8  col-sm-offset-2"> <a href="#tab2" aria-controls="tab2" role="tab" data-toggle="tab"  id="file_more">查看全部附件</a> </div>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 审评结论</label>
          <div class="col-sm-8">
            <label class="radio-inline">
              <input type="radio" name="approvalStatus" id="inlineRadio1" value="pass" checked="checked">
              <span>通过</span> </label>
            <label class="radio-inline">
              <input type="radio" name="approvalStatus" id="inlineRadio2" value="nopass">
              <span>不通过</span> </label>
          </div>
        </div>
        <div class="form-group">
          <label  class="col-sm-2 control-label"><i class="text-danger">*</i> 意见</label>
          <div class="col-sm-8">
            <textarea cols="168" rows="2" class="form-control" id="approval_first_trial"
                      name="approvalConclusion"></textarea>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
<div class="modal-footer">
  <p class="col-sm-2"> <a  href = "javascript:void(0)" onclick = "colse(0)" class="btn btn-default btn-block">关闭</a> </p>
  <p class="col-sm-2"> <a  href = "javascript:void(0)" onclick="submitReview()" class="btn btn-danger btn-block"  id="commit">提交处理</a> </p>
</div>
</body>
<script src="${basePath}/js/jquery.min.js" ></script>
<script src="${basePath}/js/bootstrap.min.js"></script>
<script src="${basePath}/js/layer/layer.js"></script>
<script src="${basePath}/js/common.js"></script>
<script src="${basePath}/js/bootstrap-datetimepicker.min.js"></script>
<script src="${basePath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="${basePath}/js/datetimepicker.js"></script>
<script src="${basePath}/js/lrz.bundle.js"></script>
<script src="${basePath}/js/viewer/viewer.min.js"></script>
<script src="${basePath}/js/distpicker/distpicker.data.js"></script>
<script src="${basePath}/js/distpicker/distpicker.js"></script>
<%--<script src="${basePath}/js/lightbox/lightbox.js"></script>--%>
<script>
    $(function(){
        init();
    })
    function init(){
        //初始化出账时间
        var currentTime = new Date().Format("yyyy-MM-dd");
        $("#lended_time").val(currentTime);
        getInitData();
        //获取页面初始数据
    }

    function getInitData(){
        debugger;
        $.ajax({
            type: 'post',
            url: "${basePath}/admin/order/orderInfo",
            data: {"indent_uuid":$("#indent_uuid").val()},
            dataType: "json",
            success: function(data){
                orderinfo(data);
            },error:function(){
                layer.msg(" 系统错误！");
            }
        });
    }
    //绑定页面数据开始
    function orderinfo(data){
        //绑定最上边的标题
       	$("#title").find("small").html(
       			
				"订单号：" + data.customerInfo==null?"":data.customerInfo[0].indentNumber);
       	CarDealerLoan.bindCarContracatFile($("#carEvContract"),data.contractAndPic,data.vehicleTradingContractPic);
      /*  //绑定总订单数、已放款订单/金额、未放款订单数
        $("#total_count").children("h1").html(data.indentCount.totalIndent+"单");
        //绑定已放款订单/金额
        $("#loan_count").children("h1").html(data.indentCount.loanCount+"单/"+data.indentCount.loanMoney+"万元");
        //绑定未放款订单数
        $("#noloan_count").children("h1").html(data.indentCount.unLoan+"单");*/
        //绑定车商位置信息
        $("#assign").html("车商位置信息："+data.customerInfo[0].merchantAddress);
        //经销商基本信息
        var merchantHtml="";
        //联系人信息
        var contactHtml="";
        //附件信息
        var attachmentHtml="";
        //合同信息
        var contractHtml="";
        //银行卡信息
        var bankcardHtml="";
        //车辆信息
        var carHtml="";
        //车辆评估信息
        var carAssessHtml="";
        //借款基本信息
        var baseInfoHtml="";
        //利率
        var rateInfoHtml = "";
        // 车辆附件
        var carPicHtml = "";
        //合同信息
        var contractHtml="";

        for(var obj in merchantList){
            merchantHtml += merchant(obj,data.customerInfo[0][obj]);
        }


        for(var obj in contactList){
            contactHtml += contact(obj,data.customerInfo[0].roleInfo);
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

        for(var obj in baseInfoList){
            baseInfoHtml +=baseInfo(obj,data.loanInfo[obj]);
        }

        for (var obj in rateList){
            rateInfoHtml += rateInfo(obj,data.percentInterest[obj]);
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
        //经销商银行卡信息
        $("#bankcard").html(bankcardHtml);
        //车辆信息
        $("#carInfo").html(carHtml);
        //评估信息
        $("#carAssessInfo").html(carAssessHtml);
        //借款需求-基本信息
        $("#baseInfo").html(baseInfoHtml);
        //利率,期限
        $("#rateInfo").html(rateInfoHtml);
        //附件信息
        $("#attachment").children("ul").html(attachmentHtml);
        //合同信息
        $("#contract").children("ul").html(contractHtml);
        //车辆附件
        $("#carPic").children("ul").html(carPicHtml);

        debugger;
        for(var i = 0; i < data.reviewInfo.length; i++){
            var reviewInfo = "";
            reviewInfo += "<tr><td align='center'>" + data.reviewInfo[i].merchantName + "</td>"
                + "<td>" + data.reviewInfo[i].approveMoney + "</td>"
                + "<td>" + data.reviewInfo[i].applyMoney + "</td>"
                + "<td>" + data.reviewInfo[i].applyTime + "</td>"
                + "<td>" + data.reviewInfo[i].loanStatus + "</td></tr>"
            $("#reviewInfo").append(reviewInfo);
        }
    }
    var merchantList={"merchantName":" 经销商名称","licenseNumber":"营业执照号","organizationCode":"组织机构代码", "address":"公司地址","introduce":"车行介绍","carport":"车位个数","repertory":"库存量","scale":"车商规模"};

    var contactList={"1":"法人代表","2":"实际控股人","3":"业务联络人","4":"金融保险经理","5":"财务经理"};

    var bankcardList={"1":"放款银行卡卡号-开户行-开户名","2":"还款银行卡卡号-开户行-开户名"};

    var carInfoList={"cBrand":"车辆品牌","cModel":"车辆型号","carPlate":"车牌号码","miles":"已行驶里程","firstUpTime":"购置日期","ariableBox":"变速箱","engine":"发动机号","indoorType":"室内装置","bodyStructure":"车身结构","carColour":"颜色","drivingWheel":"驱动轮","displacement":"排量","invoice":"发票价"};

    var carAssessInfoList={"saledType":"全款/按揭","appraisersPrice":"评估价格","realName":"评估师","remark":"评估结论"};

    var baseInfoList={"approvalAmount":"审批金额","applyMoney":"申请金额","indentState":"借款状态","indentNumber":"订单号","merchantName":"经销商","createdTime":"审批时间"};

    var rateList={"limitpercentage":"额度比例","monthlyinterest":"月利率","deadlineTime":"最大借款期限"};

    var loanStatusEnum={"assess":"待评估","trial":"待初审","datareview":"待复核","judgment":"待终审","lended":"待放款","repayment":"还款中","ended":"完结"};

    function merchant(param1,param2){
        var html = "<div class='col-sm-4'>"
            + "<dl class='dl-horizontal'>"
            + "<dt>" + merchantList[param1] + "</dt>"
            + "<dd><p>" + param2 + "</p></dd>"
            + "</dl></div>";
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
    //借款需求基本信息
    function baseInfo(param1,param2){
        if(param1=="approvalAmount" || param1=="applyMoney"){
            if(param1=="applyMoney" && param2 == 0.00){
                param2 = "<b class='text-danger'>最大贷款额</b>";
            }else {
                param2 = "<b class='text-danger'>"+param2+"</b> 万元";
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

    // 利率信息
    function rateInfo(param1,param2) {
        var html = "<div class='col-sm-4'>"
            + "<dl class='dl-horizontal'>"
            + "<dt>" + rateList[param1] + "</dt>"
            + "<dd>" + param2 + "</dd>"
            + "</dl></div>"
        return html;
    }

    //附件信息和合同信息页面属性一致，统一定义到一个function里边
   /* function attchmentAndcontract(param){
        var html="";
        html+="<li>"
            + "<div class='file_img'>"
            + "<p class='tools'><a href='javascript:void(0);' onclick='pictureDownload(7701)' title='保存'><i class='fa  fa-save'></i></a><a href="+ param.fileName+" data-lightbox='example-set' data-title="+param.fileName+" title='放大'><i class='fa  fa-search-plus'></i></a></p>"
            + "<a href="+param.fileUrl+" data-lightbox='set_img' data-title="+param.fileName+" title='放大'><img class='example-image' src="+param.fileUrl+"></a> </div>"
            + "<h4>"+param.fileName+"</h4>"
            + "</li>"
        return html;
    }*/
    function attchmentAndcontract(param){
        var html="";
        html+="<li>"
            + "<div class='file_img'>"
            + "<p class='tools'><a href='javascript:void(0);' onclick='pictureDownload(7701)' title='保存'><i class='fa  fa-save'></i></a></p>"
            + "<img data-original="+param.fileUrl+" src="+param.fileUrl+" alt="+param.fileName+" ></div>"
            + "<h4>"+param.fileName+"</h4>"
            + "</li>"
        return html;
    }
    /*  //使用相册
     parent.layer.photos({
     photos: '#ht_list'
     }); */

    $("#add_img").click(function(){

        var	n = $(".fj_list>li").length;
        $("#li_add").before(' <li><p>其他</p><div> <a href="javascript:;" class="file">选择文件<input type="file" name="" id="up_img_WU_FILE_'+n+'"></a><p class="file_img"><img id="imgShow_WU_FILE_'+n+'" ></p></div></li>');
        new uploadPreview({ UpBtn: "up_img_WU_FILE_"+n, ImgShow: "imgShow_WU_FILE_"+n});
        n = n+1;

    });
    $("#file_more").click(function () {
        $(".nav-tabs").find("li").removeClass('active');
        $("#file_tab").addClass('active');
        $("#file_tab a").attr("aria-expanded","true");
        location.hash = 'header';
    });
    //提交处理
    function submitReview(){
        // 审批意见
        var approvalConclusion = $("#approval_first_trial" ).val();    

        if(approvalConclusion=="" || approvalConclusion==null){
            layer.msg("审批意见不能为空！");
            return false;
        }
        var param  ="&taskId="+$("#task_id").val()+"&orderId="+$("#indent_uuid").val()+"&approvalLevel="+$("#flowStatus_select").val();
        var prompt = $("input[name='approvalStatus']:checked").next("span").html();
        //获取选中的评审结论
        var dialogMsg = "确认<font color='red'>"+prompt+"</font>吗？";
        alertMessage(dialogMsg,'submit("'+param+'")','qs_box1');
    }
    function submit(param){
        $.ajax({
            type:"post",
            url:"/admin/order/review",
            data:$("#form_first_trial").serialize()+param,
            dataType:"json",
            success:function(data){
                debugger;
                if(data.success){
                    layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
                        $("#order_modal").css("display","none");
                        //close(div)
                        $("#order_modal").css("display","none");
                        $("#qs_box1").hide();
                        //刷新当前页面
                        refreshpage();
                        window.history.go(0);
                        return true;
                    });
                }else{
                    layer.msg("操作失败!", {icon: 1, time: 1000}, function () {
                    window.history.go(0);
                    return false;
                    });
                }
            },error:function(){
                window.history.go(0);
                layer.msg("系统错误!");
            }
        });
    }
   /* //上传附件的处理
    $("#up_img_WU_FILE_"+processDefinitionId).change(function(){
        lrz(this.files[0],{width:1024,quality:0.7}).then(function(rst){
            $.ajax({
                type:"post",
                url:"/admin/upload/fileUpload",
                dataType:"json",
                data:{"base64":rst.base64},
                success:function(data){
                    debugger;
                    if(data.success){
                        $("#imgShow_WU_FILE_"+processDefinitionId).attr("src",data.imgurl);
                        $("#link_"+processDefinitionId).attr("href",data.imgurl);
                    }else{
                        layer.msg("上传失败 !");
                        return false;
                    }
                },error:function(){
                    layer.msg("系统错误 !");
                }
            });

        });
    });*/
    //关闭模态框
    function colse(oid){
        if("0" != oid){
            $("#"+oid).css("display","none");
        }else{
            $(".modal").css("display","none");
            $("#fade2").css("display","none");
            $("#fade1").hide();
            $("#layui-layer1").remove();
            $("#layui-layer-shade1").remove();
        }
    }
    //选择线下分配人员选择框的处理
    $("select[name='district']").change(function () {
      //获取省
      var province = $("select[name='province']").val();
      //获取市
      var city =  $("select[name='city']").val();
      //获取区
      var district =  $("select[name='district']").val();
      $.ajax({
        type:"POST",
        url:"${basePath}/admin/merchant/offlineStaff",
        data:{"accountId":$("#accountId").val(),"province":province,"city":city,"district":district},
        dataType:"json",
        success:function (data) {
          var staffHtml="<option value='' selected>---- 请选择 ---- </option>";
          for(var i=0;i<data.staffList.length;i++){
            staffHtml += "<option value="+data.staffList[i].uuid+">"+data.staffList[i].realname+"</option>";
          }
          $("select[name='userid']").html(staffHtml);
        },error:function () {
          layer.msg("未知错误！");
        }
      })
    })
</script>
</html>
