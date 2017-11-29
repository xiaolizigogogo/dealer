<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="basePath" value="<%= request.getContextPath() %>" />
<!DOCTYPE html>
<html lang="zh-cn">
    <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=edge; chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Cache-Control" content="no-transform">
    <title>e车贷管理系统--填写借款申请</title>
    <%--<%@include file="../common/taglibs.jsp" %>--%>
    <link type="text/css" rel="stylesheet" href="${basePath}/css/bootstrap.min.css" />
    <link type="text/css" rel="stylesheet" href="${basePath}/css/dropZone.css" />
    <link type="text/css" rel="stylesheet" href="${basePath}/js/layer/skin/layer.css" />
    <link type="text/css" rel="stylesheet" href="${basePath}/css/jquery.fileupload-ui.css" />
    <link type="text/css" rel="stylesheet" href="${basePath}/css/jquery.fileupload.css" />
    <link type="text/css" rel="stylesheet" href="${basePath}/js/completer/completer.min.css" />
    <link type="text/css" rel="stylesheet" href="${basePath}/css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" href="${basePath}/css/bootstrap/bootstrap-table.css">
    <link rel="stylesheet" type="text/css" href="${basePath}/css/libs/font-awesome.css"/>
    <link rel="stylesheet" type="text/css" href="${basePath}/css/common.css"/>
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
    <script src="${basePath}/js/common.js"></script>
    <script src="${basePath}/js/jquery.validate.js"></script>
    <script>
        var getContactsInfo = function (customerId) {
            $.get("${basePath}/admin/customer/queryContactsCusId.html?uuid=" + customerId,
                    function (result) {
                        $(result).each(function (i) {
                            if (result[i].relation == "配偶") {
                                $("#spouse_id").val(result[i].id);
                                $("#spouse_name").val(result[i].contactsName);
                                $("#spouse_tel").val(result[i].contactsTel);
                                $("#spouse_mobile").val(result[i].contactsMobile);
                                if (result[i].know) {
                                    $("#spouse_ck").attr("checked", "checked");
                                }
                            }
                            if (result[i].contactsTel == "直系亲属1") {
                                $("#immediate_id1").val(result[i].id);
                                $("#immediate_name1").val(result[i].contactsName);
                                $("#immediate_relation1").val(result[i].relation);
                                $("#immediate_Mobile1").val(result[i].contactsMobile);
                                if (result[i].know) {
                                    $("#immediate_ck1").attr("checked", "checked");
                                }
                            }
                            if (result[i].contactsTel == "直系亲属2") {
                                $("#immediate_id2").val(result[i].id);
                                $("#immediate_name2").val(result[i].contactsName);
                                $("#immediate_relation2").val(result[i].relation);
                                $("#immediate_Mobile2").val(result[i].contactsMobile);
                                if (result[i].know) {
                                    $("#immediate_ck2").attr("checked", "checked");
                                }
                            }
                            if (result[i].contactsTel == "其他联系人1") {
                                $("#other_id1").val(result[i].id);
                                $("#other_name1").val(result[i].contactsName);
                                $("#other_relation1").val(result[i].relation);
                                $("#other_mobile1").val(result[i].contactsMobile);
                                if (result[i].know) {
                                    $("#other_ck2").attr("checked", "checked");
                                }
                            }
                            if (result[i].contactsTel == "其他联系人2") {
                                $("#other_id2").val(result[i].id);
                                $("#other_name2").val(result[i].contactsName);
                                $("#other_relation2").val(result[i].relation);
                                $("#other_mobile2").val(result[i].contactsMobile);
                                if (result[i].know) {
                                    $("#other_ck").attr("checked", "checked");
                                }
                            }
                        });
                    })
        };

        var isKnowLoan = function (pid, ckId) {
            var id = $(pid).val();
            var isKnow = 0;
            if ($(ckId).attr("checked") == "checked") {
                isKnow = 1;
            }
            if (id == "" || id == null || isKnow === "" || isKnow == null) {
                layer.msg("请先输入客户姓名！");
                return;
            }
            $.get("${basePath}/admin/loan/contacts.html?id=" + id + "&isKnow=" + isKnow,
                    function (result) {
                        if (result == '0000') {
                            layer.msg("操作成功！");
                        } else {
                            layer.msg("操作失败！");
                        }
                    });
        };

        $(function () {
            /** 编辑页面的借款人姓名不可以修改 */
            var cusName = "${loanInfo.customerRegisterInfo.customerName}";
            if (cusName != null && cusName != "") {
                var loaObj = $('input[name="loaner"]');
                loaObj.attr("disabled", 'disabled');

                $("#accountName").attr("value", cusName);
                $("#phone").html("${loanInfo.customerRegisterInfo.mobile}");
                $("#idCard").attr("readonly", 'true');
                $("#idCard").attr("value", "${loanInfo.customerRegisterInfo.idCard}");
                $("#customerId").attr("value", "${loanInfo.customerRegisterInfo.uuid}");
                $("#mobile").attr("value", "${loanInfo.customerRegisterInfo.mobile}");
                getContactsInfo("${loanInfo.customerRegisterInfo.uuid}");
            }

            var loanerObj = $("#loaner");
            loanerObj.completer({
                complete: function () {
                    var loaner = loanerObj.val();
                    var loaners = loaner.split("-");
                    loanerObj.attr("value", loaners[0]);
                    $("#accountName").attr("value", loaners[0]);
                    $("#phone").html(loaners[1]);
                    $("#idCard").attr("value", loaners[2]);
                    $("#customerId").attr("value", loaners[3]);
                    $("#mobile").attr("value", loaners[1]);
                    getContactsInfo(loaners[3]);
                    var customerId = $("#customerId").val();
                    $.get("${basePath}/admin/company/queryCompanyByCustomerId.html?customerId="+customerId, function (result) {
                        if(lastCustomerId!=customerId){
                            var html = '<option value="0">请选择</option>';
                            $(result).each(function (i) {
                                html += '<option value="' + result[i].id + '">' + result[i].name + '</option>';
                            });
                            $('#companyId').html(html);
                            //更新默认选择项，强制select进行更新
                            $('#companyId').val(0);
                            lastCustomerId = customerId;

                        }
                    });
                },
                source: ${customers},
                position: "right",
                suggest: true,
                zIndex:900
            });

            loanerObj.blur(function () {
                if (loanerObj.val() == null || loanerObj.val() == "") {
                    $("#phone").html("");
                    $("#idCard").attr("value", "");
                    $("#customerId").attr("value", "");
                    $("#mobile").attr("value", "");
                }
            });

            /** 年利率转月利率 */
            $("#year_rate").change(function () {
                var year_rate = $("#year_rate").val();
                var monthly_rate = changeFourDecimal(accDiv(year_rate, 12));
                $("#monthly_rate").val(monthly_rate);
            });

            /*编辑页面计算月利率*/
            var loanRateVal = "${loanInfo.loanRate}";
            if (loanRateVal != null) {
                var year_rate = $("#year_rate").val();
                var monthly_rate = changeFourDecimal(accDiv(year_rate, 12));
                $("#monthly_rate").val(monthly_rate);
            }

            /** 月利率转年利率 */
            $("#monthly_rate").change(function () {
                var monthly_rate = $("#monthly_rate").val();
                var year_rate = changeFourDecimal(accMul(monthly_rate, 12));
                $("#year_rate").val(money(year_rate));
            });

            var repayWayObj = $("#repayWay");
            repayWayObj.change(function () {
                var managerFeeObj = $("#managerFee");
                if (this.value == "AverageCapitalPlusInterest") {
                    managerFeeObj.attr("value", "1.0");
                } else if (this.value == "InterestRatesBefore") {
                    managerFeeObj.attr("value", "2.0");
                }
            });


            /**借款用途为其他弹出文本框输入*/

            $("#loanPurpose").live("change",function(){
                var supplementObj = $("#supplement");
                if(this.value=='other'){
                    supplementObj.html("<laber>其它：</laber><input type='text' class='form-control' name='purpose' id='purpose'>");

                }else{
                    supplementObj.html("");
                }

            });




            $.validator.addMethod("checkSelected", function (value, element, params) {
                return value != '0';
            }, '<font color="red">请选择！</font>');

            $("#loanForm").validate({
             errorLaberContainer: "loanError",
             errorElement: "span",
                rules: {
                    loaner: {
                        required: true
                    }, applyMoney: {
                        required: true,
                    }, loanPurpose: {
                        required: true
                    }, repaySource: {
                        required: true
                    }, loanRate: {
                        required: true,
                        number: true
                    }, monthlyRate: {
                        required: true
                    }, loanLimitTime: {
                        required: true,
                        digits: true
                    }, vehicleBrand: {
                        required: true
                    }, vehicleNo: {
                        required: true
                    }, mileaged: {
                        required: true
                    }, purchaseDate: {
                        required: true
                    }, vehicleIdentification: {
                        required: true
                    }, engineNo: {
                        required: true
                    }, evaluateby: {
                        required: true
                    }, bankName: {
                        required: true
                    },accountNum: {
                        required: true
                    }, evaluatePrice: {
                        required: true,
                        digits: true
                    }, evaluateConclusion: {
                        required: true
                    }, hostOpinion: {
                        required: true
                    }, remark: {
                        required: true
                    }, companyId: {
                        checkSelected: true
                    }, deptId: {
                        checkSelected: true
                    }, responsibleCmId: {
                        checkSelected: true
                    },manageFee:{
                        required: true,
                        number:true
                    },cashdepositFee:{
                        required:true,
                        number:true
                    },depreciationFee:{
                        required:true,
                        number:true
                    },parkCost:{
                        required:true,
                        number:true
                    }
                },
                messages: {
                    loaner: {
                        required: '<font color="red">不能为空！</font>'
                    }, applyMoney: {
                        required: '<font color="red">不能为空！</font>',
                    }, loanPurpose: {
                        required: '<font color="red">不能为空！</font>'
                    }, repaySource: {
                        required: '<font color="red">不能为空！</font>'
                    }, loanRate: {
                        required: '<font color="red">不能为空！</font>',
                        number: "<font color='red'>不合法!</font>"
                    }, monthlyRate: {
                        required: '<font color="red">不能为空！</font>'
                    }, loanLimitTime: {
                        required: '<font color="red">不能为空！</font>',
                        digits: "<font color='red'>不合法!</font>"
                    }, vehicleBrand: {
                        required: '<font color="red">不能为空！</font>'
                    }, vehicleNo: {
                        required: '<font color="red">不能为空！</font>'
                    }, mileaged: {
                        required: '<font color="red">不能为空！</font>'
                    }, purchaseDate: {
                        required: '<font color="red">不能为空！</font>'
                    }, vehicleIdentification: {
                        required: '<font color="red">不能为空！</font>'
                    }, engineNo: {
                        required: '<font color="red">不能为空！</font>'
                    }, evaluateby: {
                        required: '<font color="red">不能为空！</font>'
                    },bankName: {
                        required: '<font color="red">不能为空！</font>'
                    },accountNum: {
                        required: '<font color="red">不能为空！</font>'
                    },evaluatePrice: {
                        required: '<font color="red">不能为空！</font>',
                        digits: "<font color='red'>不合法!</font>"
                    }, evaluateConclusion: {
                        required: '<font color="red">不能为空！</font>'
                    }, hostOpinion: {
                        required: '<font color="red">不能为空！</font>'
                    }, remark: {
                        required: '<font color="red">不能为空！</font>'
                    },manageFee:{
                        required: '<font color="red">不能为空！</font>',
                        number: "<font color='red'>不合法!</font>"
                    },cashdepositFee:{
                        required: '<font color="red">不能为空！</font>',
                        number:"<font color='red'>不合法!</font>"
                    },depreciationFee:{
                        required: '<font color="red">不能为空！</font>',
                        number:"<font color='red'>不合法!</font>"
                    },parkCost:{
                        required: '<font color="red">不能为空！</font>',
                        number:"<font color='red'>不合法!</font>"
                    }
                }, 
               
                submitHandler: function (form) {
               
                    /** 判断借款期限是否大于0 */
                	var  a=$("#judge").val();
                	if(a=="no"){
                		return false;
                	}
                	//$("#applyMoney").val($("#applyMoney").val() * 10000);
                	
                	$("#idCard").blur();
                	
                	//黑名单不进行后续操作
                	if($("#qs_box").css("display") == "block"){
                		return false;
                	}
                	
                	//判断客户是否存在
                	if($("#not_found_div").css("display") == "block"){
                		layer.msg("客户不存在!请先添加客户！");
                		return false;
                	}
                    /** 判断附件是否上传完毕 */
                    var idCard = $("#idCardType").val();// 身份证
                    var vehicleLicense = $("#vehicleLicense").val();//车辆行驶证
                    var registrationCertificate = $("#registrationCertificate").val();//机动车登记证书
                    var businessInsurancePolicy = $("#businessInsurancePolicy").val();//机动车商业保险单
                    var loanPurValObj = $("#loanPurpose");
                    if (loanPurValObj.val() == 'other') {
                        loanPurValObj.get(0).options[5].value = $("#purpose").val();
                    }
                     if (idCard == null || idCard == "") {
                         layer.msg("身份证必须上传！");
                         return false;
                     }
                     if (vehicleLicense == null || vehicleLicense == "") {
                         layer.msg("车辆行驶证必须上传！");
                         return false;
                     }
                     if (registrationCertificate == null || registrationCertificate == "") {
                         layer.msg("机动车登记证书上传！");
                         return false;
                     }
                     if (businessInsurancePolicy == null || businessInsurancePolicy == "") {
                         layer.msg("机动车商业保险单必须上传！");
                         return false;
                     }
                     var  div= "";
                     var  idCardObj=$("#idCard").val();
                     if(!idCardObj.length>0){
                 		 div='不能为空！';
                 		 $("#d1").show();
                	     $("#d1").html(div);
                	     $("#d1").addClass("error");
                
               		 }else{
                    $.ajax({
                        type: 'POST',
                        url: '${basePath}/admin/loan/saveOrUpdate.html',
                        data: $("#loanForm").serializeArray(),
                        dataType: "text",
                        success: function (data) {
                            if (data == '0000') {
                            generate();
                                layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
                                   if(window.location.href.indexOf("sign")>0){
                                   if(window.location.href.indexOf("preservation")>0){
                                   window.location.href = '${basePath}/admin/loan/loanerList.html?latent=1';
                                   }else{
                                   window.location.href ="/admin/loan/loanInfoList.html";
                                   }}else{
                                    window.location.href = document.referrer;
                                    }
                                    return true;
                                });
                            } else {
                                layer.msg("操作失败!可能原因：" + data);
                                return false;
                            }
                        }, error: function () {
                            layer.msg("未知错误!");
                            return false;
                        }
                    })}
                }
            });
            
            //输入身份证号自动检索客户信息
            $("#idCard").blur(function(){
            	 var idCard = $.trim($(this).val());
            	 if(null != idCard && "" != idCard){
            	 	 $.ajax({
            	 	 	url:"${basePath}/admin/loan/getCustomerInfoByIdCard?idCard=" + idCard,
            	 	 	type:"get",
            	 	 	async:false,
            	 	 	success:function(result){
            	 	 	 if(null != result.cri){
            	 	 	 		<!-- BUG 270 begin -->
            	 	 	 		//判断是否是黑名单客户,如果是黑名单客户 则给出提示不允许提交
            	 	 	 		if(result.cri.isBlacklist == 1){
            	 	 	 			alertMessage("请先将该客户移除黑名单,在进行申请贷款!",null);
            	 	 	 			return;
            	 	 	 		}
            	 	 	 		<!-- BUG 270 end -->
                                	 $("#loaner").val(result.cri.customerName);
                                	 $("#customerId").val(result.cri.uuid);
                                	 $(result.cciList).each(function (i) {
                                         if (result.cciList[i].relation == "配偶") {
                                             $("#spouse_id").val(result.cciList[i].id);
                                             $("#spouse_name").val(result.cciList[i].contactsName);
                                             $("#spouse_tel").val(result.cciList[i].contactsTel);
                                             $("#spouse_mobile").val(result.cciList[i].contactsMobile);
                                             if (result.cciList[i].know) {
                                                 $("#spouse_ck").attr("checked", "checked");
                                             }
                                         }
                                         if (result.cciList[i].contactsTel == "直系亲属1") {
                                             $("#immediate_id1").val(result.cciList[i].id);
                                             $("#immediate_name1").val(result.cciList[i].contactsName);
                                             $("#immediate_relation1").val(result.cciList[i].relation);
                                             $("#immediate_Mobile1").val(result.cciList[i].contactsMobile);
                                             if (result.cciList[i].know) {
                                                 $("#immediate_ck1").attr("checked", "checked");
                                             }
                                         }
                                         if (result.cciList[i].contactsTel == "直系亲属2") {
                                             $("#immediate_id2").val(result.cciList[i].id);
                                             $("#immediate_name2").val(result.cciList[i].contactsName);
                                             $("#immediate_relation2").val(result.cciList[i].relation);
                                             $("#immediate_Mobile2").val(result.cciList[i].contactsMobile);
                                             if (result.cciList[i].know) {
                                                 $("#immediate_ck2").attr("checked", "checked");
                                             }
                                         }
                                         if (result.cciList[i].contactsTel == "其他联系人1") {
                                             $("#other_id1").val(result.cciList[i].id);
                                             $("#other_name1").val(result.cciList[i].contactsName);
                                             $("#other_relation1").val(result.cciList[i].relation);
                                             $("#other_mobile1").val(result.cciList[i].contactsMobile);
                                             if (result.cciList[i].know) {
                                                 $("#other_ck2").attr("checked", "checked");
                                             }
                                         }
                                         if (result.cciList[i].contactsTel == "其他联系人2") {
                                             $("#other_id2").val(result.cciList[i].id);
                                             $("#other_name2").val(result.cciList[i].contactsName);
                                             $("#other_relation2").val(result.cciList[i].relation);
                                             $("#other_mobile2").val(result.cciList[i].contactsMobile);
                                             if (result.cciList[i].know) {
                                                 $("#other_ck").attr("checked", "checked");
                                             }
                                         }
                                     });
                                 }else{
                                	 $("#not_found_div").css("display","block");
                                 }
            	 	 	}
            	 	 })
//            		 $.get("${basePath}/admin/loan/getCustomerInfoByIdCard?idCard=" + idCard,
//                             function (result) {                             
//                        });
            	 }
            });
            $(".close").click(function(){
            	$("#not_found_div").css("display","none");
            })
        });
    </script>
    </head>
    
    <body>
    <form class="form-inline clearfix" action="javascript:;" id="loanForm" method="POST">
      <div class="col-lg-12">
      <div class="tools_bar ">
        <div class="bar_tit clearfix">
          <h2 class="pull-left">贷款申请</h2>
          <a href="javascript:void(0);" onclick="javascript:history.go(-1);" class="pull-right btn btn-link"><i class="fa fa-mail-forward"></i> 返回</a></div>
        <div id="not_found_div" class="alert alert-danger alert-dismissible" role="alert" style="display:none;"> 
          <!--<button type="button" class="close"><span aria-hidden="true">&times;</span></button>--> 
          <strong><i class="fa fa-exclamation-triangle" style="font-size:18px;"></i></strong> 您所要录入的订单客户信息还没有在客户列表中， <a href="javascript:void(0);" onclick="addCustomerNow();" class="btn btn-sm btn-danger">现在去添加</a> </div>
        <div class="from_box">
          <div class="from_tit clearfix">
            <h3 class="pull-left">基本信息</h3>
          </div>
          <input type="text" hidden id="uuid" name="uuid" value="${loanInfo.uuid}">
          <input type="text" hidden id="loanId" name="loanId" value="${loanInfo.uuid}">
          <input type="text" hidden id="customerId" name="customerId">
          <input type="text" hidden id="mobile" name="mobile" >
          <input type="hidden"  id="judge" name="judge" >
          <div class="from_con clearfix">
            <dl class="dl-horizontal col-sm-4">
              <dt><i class="text-danger">*</i> 借款人</dt>
              <dd>
                <input type="text" id="loaner" name="loaner" value="${loanInfo.customerRegisterInfo.customerName}" class="form-control" placeholder="根据姓名/身份证号自动搜索"/>
              </dd>
            </dl>
            <dl class="dl-horizontal col-sm-4">
              <dt><i class="text-danger">*</i> 身份证号</dt>
              <dd>
                <input type="text" id="idCard" name="idCard"  maxlength="18"
        	                   onkeyup="value=value.replace(/[^\w\.\/]/ig,'')"
                               value="${loanInfo.idCard}" class="form-control"/>
                               <span id="d1"></span>
              </dd>
            </dl>
            <dl class="dl-horizontal col-sm-4">
              <dt><i class="text-danger">*</i> 借款金额</dt>
              <dd>
                <div class="input_group" style="max-width:120px">
                  <input type="text" class="form-control" name="applyMoney" id="applyMoney"
                               onkeyup="this.value= this.value.match(/\d+(\.\d{0,2})?/) ? this.value.match(/\d+(\.\d{0,2})?/)[0] : ''"
                               onpaste="return false"  maxlength="5"
                               value='<fmt:formatNumber value="${loanInfo.applyMoney}"
                               type="number" pattern="#"/>' style="width:100%;">
                  <span class="danwei">万元</span> </div>
              </dd>
            </dl>
          </div>
          <div class="from_con clearfix">
            <dl class="dl-horizontal col-sm-4">
              <dt><i class="text-danger">*</i> 借款用途</dt>
              <dd>
                <select class="form-control" name="loanPurpose" id="loanPurpose">
                  <option value="生意周转">生意周转</option>
                  <option value="采购原材料">采购原材料</option>
                  <option value="房屋装修">房屋装修</option>
                  <option value="发工资">发工资</option>
                  <option value="支付货款">支付货款</option>
                  <option value="other">其他</option>
                </select>
              </dd>
            </dl>
            <dl class="dl-horizontal col-sm-6">
              <dt><i class="text-danger">*</i> 还款来源</dt>
              <dd>
                <textarea name="repaySource" cols="100" rows="3" class="form-control" maxlength="150">${loanInfo.repaySource}</textarea>
              </dd>
            </dl>
          </div>
        </div>
        <div class="from_box">
          <div class="from_tit clearfix">
            <h3 class="pull-left">利率、期限</h3>
          </div>
          <div class="from_con clearfix">
            <dl class="dl-horizontal col-sm-4">
              <dt><i class="text-danger">*</i> 年利率</dt>
              <dd>
                <input type="text" name="loanRate" maxlength="6"
                               id="year_rate" 
                               value="<fmt:formatNumber  value="${loanInfo.loanRate}" pattern="#.##"/>" class="form-control"/>
              </dd>
            </dl>
            <dl class="dl-horizontal col-sm-4">
              <dt><i class="text-danger">*</i> 月利率</dt>
              <dd>
                <input type="text" id="monthly_rate" maxlength="10"
                               name="monthlyRate" class="form-control" readonly/>
              </dd>
            </dl>
            <dl class="dl-horizontal col-sm-4">
              <dt><i class="text-danger">*</i> 借款期限</dt>
              <dd>
                <div class="input_group" style="width:120px">
                  <input type="text" name="loanLimitTime" maxlength="5" style="width:120px;"
                               onkeyup="contrast();"
                               id="loanLimitTime" value="${loanInfo.loanLimitTime}" class="form-control"/>
                  <input type="text" hidden="hidden" name="loanLimitTimeUnit" value="month">
                  <span class="danwei">月</span>
                  <div id="d11"></div>
                </div>
              </dd>
            </dl>
          </div>
        </div>
        <div class="from_box">
          <div class="from_tit clearfix">
            <h3 class="pull-left">其他费用</h3>
          </div>
          <div class="from_con clearfix">
                    <dl class="dl-horizontal col-sm-3">
                        <dt>管理费</dt>
                        <dd>
                            <div class="input_group" style="max-width:120px">
                                <input type="text" class="form-control" style="width:100%;" id="managerFee"  name="manageCost" value="1" >
                                <span class="danwei">%</span> </div>
                        </dd>
                    </dl>
                    <dl class="dl-horizontal col-sm-3">
              <dt>酒毒驾</dt>
              <dd>
                <select class="form-control valid" id="drunkDrive" name="drunkDrive">
                  <option value="1000">1000</option>
                  <option value="2000">2000</option>
                </select>
              </dd>
            </dl>
                    <dl class="dl-horizontal col-sm-3">
              <dt>保证金</dt>
              <dd>
                 <div class="input_group" style="max-width:120px">
                  <input type="text" class="form-control" id="cashdepositFee" name="cashdepositFee" style="width:100%;" value="5" >
                  <span class="danwei">%</span> </div>
              </dd>
            </dl>
                    <dl class="dl-horizontal col-sm-3">
              <dt>平台折旧费</dt>
              <dd>
               <div class="input_group" style="max-width:120px">
                   <%--<input type="text" class="form-control" id="depreciationFee" name="depreciationFee" style="width:100%;" value="21.84" readonly onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')" >--%>
                   <input type="text" class="form-control" id="depreciationFee" name="depreciationFee" style="width:100%;" value="21.84"  >
              <span class="danwei">%</span> </div>
              </dd>
            </dl>
                </div>
                <div class="from_con clearfix">
                    <%--<dl class="dl-horizontal col-sm-3" id="certificate_fee">--%>
                        <%--<dt>认证费</dt>--%>
                        <%--<dd>--%>
                            <%--<div class="input-group input-append bootstrap-timepicker" style="width:120px;">--%>
                                <%--<input type="number" class="form-control" id="certificatefee" name="certificatefee" style="width:100%;" value="400" >--%>
                            <%--</div>--%>
                        <%--</dd>--%>
                    <%--</dl>--%>
                    <dl class="dl-horizontal col-sm-3">
              <dt>抵押方式</dt>
              <dd>
                <select class="form-control" id="pledgeType" name="pledgeType">
                  <option value="drivePledge">押证</option>
                  <option value="vehiclePledge">押车</option>
                </select>
              </dd>
            </dl>
                    <dl class="dl-horizontal col-sm-3" id="gps">
              <dt>GPS</dt>
              <dd>
                <select class="form-control" id="gpsWay" name="gpsWay">
                  <option value="">请选择</option>
                  <option value="gps_month_cost">按月支付租金</option>
                  <option value="gps_once_cost">一次买断</option>
                </select>
                        </dd>
                    </dl>
                    <dl class="dl-horizontal col-sm-3" id="park">
                        <dt>停车费</dt>
                        <dd>
                            <div class="input-group input-append bootstrap-timepicker" style="width:120px;">
                                <input type="text" class="form-control" id="parkCost" name="parkCost" style="width:100%;" value="300" maxlength="4" >
                            </div>
              </dd>
            </dl>
          </div>
        </div>
        <div class="from_box">
          <div class="from_tit clearfix">
            <h3>还款信息</h3>
          </div>
          <div class="from_con clearfix">
            <dl class="dl-horizontal col-sm-12">
              <dt style="text-align:left;"><i class="text-danger">*</i>&nbsp;请选择还款方式</dt>
              <dd>
                <select class="form-control pull-left" id="repayWay" name="repayWay">
                  <option value="AverageCapitalPlusInterest"
                                    <c:if test="${loanInfo.repayWay eq 'AverageCapitalPlusInterest'}">selected</c:if>> 等本等息 </option>
                  <option value="InterestRatesBefore"
                                    <c:if test="${loanInfo.repayWay eq 'InterestRatesBefore'}">selected</c:if>> 先息后本 </option>
                  <option value="flexiblerepaymentv2"
                                    <c:if test="${loanInfo.repayWay eq 'flexiblerepaymentv2'}">selected</c:if>> 灵活还款 </option>
                  <option value="averagePrincipalreduceinterest"
                                    <c:if test="${loanInfo.repayWay eq 'averagePrincipalreduceinterest'}">selected</c:if>> 等本减息 </option>
                  <option value="averagePrincipalzerointerestrent"
                                    <c:if test="${loanInfo.repayWay eq 'averagePrincipalzerointerestrent'}">selected</c:if>> 等本零息(押证) </option>
                  <option value="intrestbeforePrincipalrent"
                                    <c:if test="${loanInfo.repayWay eq 'intrestbeforePrincipalrent'}">selected</c:if>> 先息后本(押证) </option>
                  <option value="intrestbeforePrincipaltransfer"
                                    <c:if test="${loanInfo.repayWay eq 'intrestbeforePrincipaltransfer'}">selected</c:if>> 先息后本(押车) </option>
                </select>
                <a href="#plan-list" class="btn btn-success btn-search plan-show" style="margin-left:10px;">生成还款计划</a> </dd>
            </dl>
          </div>
          <a name="plan-list"></a>
          <table class="table table-bordered">
            <thead>
              <tr>
                <th>期数</th>
                <th>还款本金</th>
                <th>还款利息</th>
                <th>管理费</th>
                <th>GPS费用</th>
                <th>查档费</th>
                <th>停车费</th>
                <th>折旧费</th>
                <th>毒酒驾</th>
                <th>保证金</th>
                <th>认证费</th>
                <th>本期还款总额</th>
                <th>剩余本金</th>
                <%--<th>提前还款</th>--%>
                <th>还款日期</th>
              </tr>
            </thead>
            <tbody id="repayPlayDetail">
            
            </tbody>
            <c:forEach items="${repayPlan.planList}" var="plan">
                                <tr>
                                    <td align='center'>${plan.repayPeriod}</td>
                                    <td align='center'>${plan.repayCapital}</td>
                                    <td align='center'>${plan.repayInterest}</td>
                                    <td align='center'>${plan.manageFee}</td>
                                    <td align='center'>${plan.gpsCost}</td>
                                    <td align='center'>${plan.checkCost}</td>
                                    <td align='center'>${plan.parkCost}</td>
                                    <td align='center'>${plan.depreciationFee}</td>
                                    <td align='center'>${plan.drunkDrive}</td>
                                    <td align='center'>${plan.cashdepositFee}</td>
                                    <td align='center'>${plan.certificateFee}</td>
                                    <td align='center'>${plan.repayTotal}</td>
                                    <td align='center'>${plan.surplusCapital}</td>
                                    <%--<td align='center'>${plan.advancerepay}</td>--%>
                                    <td align='center'><fmt:formatDate value="${plan.repayDate}"
                                                                       pattern="yyyy-MM-dd" /></td>
                                </tr>
                            </c:forEach>
                            <c:if test="${repayPlan != null}">
                                <tr>
                                    <td align='center'>总额：</td>
                                    <td align='center'>${repayPlan.sumCaptial}</td>
                                    <td align='center'>${repayPlan.sumInvest}</td>
                                    <td align='center'>----</td>
                                    <td align='center'>----</td>
                                    <td align='center'>----</td>
                                    <td align='center'>----</td>
                                    <td align='center'>----</td>
                                    <td align='center'>----</td>
                                    <td align='center'>----</td>
                                    <td align='center'>----</td>
                                    <td align='center'>${repayPlan.sumInvest + repayPlan.sumCaptial}</td>
                                    <td align='center'>----</td>
                                    <%--<td align='center'>----</td>--%>
                                    <td align='center'>----</td>
                                </tr>
                            </c:if>
          </table></td>
      </tr>
    </table>
  </div>
  <div class="from_box">
    <div class="from_tit clearfix">
      <h3>账号信息</h3>
    </div>
<div class="from_con clearfix">
            <dl class="dl-horizontal col-sm-4">
              <dt><i class="text-danger">*</i> 开户名</dt>
              <dd>
                <input type="text" class="form-control" size="10"name="accountName"  maxlength="10"
                               id="accountName" value="${accountInfo.accountName}">
              </dd>
            </dl>
            <dl class="dl-horizontal col-sm-4">
              <dt><i class="text-danger">*</i> 开户行</dt>
              <dd>
                <input type="text" class="form-control" id="bankName"  maxlength="10"
                               name="bankName" value="${accountInfo.bankName}">
              </dd>
            </dl>
            <dl class="dl-horizontal col-sm-4">
              <dt><i class="text-danger">*</i> 银行账号</dt>
              <dd>
                <input type="text" class="form-control" id="accountNum" name="accountNum"  maxlength="25"
                               onkeyup="this.value=this.value.replace(/[^\d]/g,'')"
                               onpaste="return false"
                               value="${accountInfo.accountNum}">
              </dd>
            </dl>
          </div>

  </div>
  <div class="from_box">
    <div class="from_tit clearfix">
      <h3>附件上传</h3>
    </div>
    <table  class="table table-striped"  id="warp">
      <thead>
        <tr>
          <th><i class="text-danger">*</i> 身份证</th>
          <th><i class="text-danger">*</i> 身份证背面</th>
          <th><i class="text-danger">*</i> 车辆行驶证</th>
          <th><i class="text-danger">*</i> 机动车登记证书</th>
          <th><i class="text-danger">*</i> 机动车商业保险单</th>
          <th> 诉讼截图</th>
          <th> 违法信息截图</th>
          <th> 其他</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td><a href="javascript:;" class="file">选择文件
            <input id="up_img_WU_FILE_0" type="file"
                               class="form-control"
                               name="files[]"
                               data-url="${basePath}/admin/file/upload/${loanInfo.uuid}/idCardType.html">
            </a>
            <p class="file_img"><img id="imgShow_WU_FILE_0" ></p></td>
            <td><a href="javascript:;" class="file">选择文件
            <input id="up_img_WU_FILE_7" type="file" class="form-control" name="files[]"
                               data-url="${basePath}/admin/file/upload/${loanInfo.uuid}/idCardBack.html">
            </a>
            <p class="file_img"><img id="imgShow_WU_FILE_7"  /></p></td>
          <td><a href="javascript:;" class="file">选择文件
            <input id="up_img_WU_FILE_1" type="file"
                               class="form-control"
                               name="files[]"
                               data-url="${basePath}/admin/file/upload/${loanInfo.uuid}/vehicleLicense.html" >
            </a>
            <p class="file_img"><img id="imgShow_WU_FILE_1"/></p></td>
          <td><a href="javascript:;" class="file">选择文件
            <input id="up_img_WU_FILE_2" type="file"
                               class="form-control" name="files[]"
                               data-url="${basePath}/admin/file/upload/${loanInfo.uuid}/registrationCertificate.html">
            </a>
            <p class="file_img"><img id="imgShow_WU_FILE_2"/></p></td>
          <td><a href="javascript:;" class="file">选择文件
            <input id="up_img_WU_FILE_3" type="file"
                               class="form-control" name="files[]"
                               data-url="${basePath}/admin/file/upload/${loanInfo.uuid}/businessInsurancePolicy.html">
            </a>
            <p class="file_img"><img id="imgShow_WU_FILE_3"/></p></td>
          
            <td><a href="javascript:;" class="file">选择文件
            <input id="up_img_WU_FILE_5" type="file" class="form-control" name="files[]"
                               data-url="${basePath}/admin/file/upload/${loanInfo.uuid}/litigation.html">
            </a>
            <p class="file_img"><img id="imgShow_WU_FILE_5"  /></p></td>
            <td><a href="javascript:;" class="file">选择文件
            <input id="up_img_WU_FILE_6" type="file" class="form-control" name="files[]"
                               data-url="${basePath}/admin/file/upload/${loanInfo.uuid}/Illegal.html">
            </a>
            <p class="file_img"><img id="imgShow_WU_FILE_6"  /></p></td>
            <td><a href="javascript:;" class="file">选择文件
            <input id="up_img_WU_FILE_4" type="file" class="form-control" name="files[]"
                               data-url="${basePath}/admin/file/upload/${loanInfo.uuid}/other.html">
            </a>
            <p class="file_img"><img id="imgShow_WU_FILE_4"  /></p></td>
        </tr>
      </tbody>
    </table>
  </div>
  <div class="from_box">
    <div class="from_tit clearfix">
      <h3>主办方</h3>
    </div>
<div class="from_con clearfix">
            <dl class="dl-horizontal col-sm-4">
              <dt><i class="text-danger">*</i> 所属分公司</dt>
              <dd>
                <select class="form-control" id="companyId" name="companyId">
                  <option value="0">请选择</option>
                </select>
              </dd>
            </dl>
            <dl class="dl-horizontal col-sm-4">
              <dt><i class="text-danger">*</i> 所属部门</dt>
              <dd>
                <select class="form-control" id="deptId" name="deptId">
                  <option value="0">请选择</option>
                </select>
              </dd>
            </dl>
            <dl class="dl-horizontal col-sm-4">
              <dt><i class="text-danger">*</i> 所属客户经理</dt>
              <dd>
                <select class="form-control" name="responsibleCmId" id="responsibleCmId">
                  <option value="0">请选择</option>
                </select>
              </dd>
            </dl>
          </div>
          <div class="from_con clearfix">
            <dl class="dl-horizontal col-sm-6">
              <dt><i class="text-danger">*</i> 主办意见</dt>
              <dd>
                <textarea  rows="2" class="form-control" id="hostOpinion"  maxlength="50"
                                  name="hostOpinion" style="width:100%;">${loanInfo.hostOpinion}</textarea>
              </dd>
            </dl>
            <dl class="dl-horizontal col-sm-6">
              <dt><i class="text-danger">*</i> 备注</dt>
              <dd>
                <textarea style="width:100%;"  rows="2" class="form-control" id="remark" maxlength="50"
                                  name="remark">${loanInfo.remark}</textarea>
              </dd>
            </dl>
          </div>
        </div>
        <div class="from_box">
          <div class="from_tit clearfix">
            <h3>联系人</h3>
          </div>
          <input type="hidden" id="spouse_id" />
          <input type="hidden" id="immediate_id1" />
          <input type="hidden" id="immediate_id2" />
          <input type="hidden" id="other_id1" />
          <input type="hidden" id="other_id2" />
          <div class="from_con clearfix">
            <dl class="dl-horizontal col-sm-3">
              <dt>配偶姓名</dt>
              <dd>
                <input type="text" class="form-control" readonly
                               id="spouse_name"  size="10">
              </dd>
            </dl>
            <dl class="dl-horizontal col-sm-3">
              <dt>单位电话</dt>
              <dd>
               <input type="text" class="form-control" id="spouse_tel"
                               readonly="readonly"  size="10">
              </dd>
            </dl>
             <dl class="dl-horizontal col-sm-3">
              <dt>手机号码</dt>
              <dd>
              <input type="text" class="form-control" id="spouse_mobile"
                               readonly="readonly"  size="12">
              </dd>
            </dl>
             <dl class="dl-horizontal col-sm-3">
              <dt>知晓本次借款</dt>
              <dd>
             <input type="checkbox" id="spouse_ck" 
                            onclick="isKnowLoan('#spouse_id', '#spouse_ck')"  >
              </dd>
            </dl>
            </div>
            <div class="from_con clearfix">
            <dl class="dl-horizontal col-sm-3">
              <dt>直系亲属姓名</dt>
              <dd>
               <input type="text" class="form-control" id="immediate_name1"
                               readonly="readonly" size="10">
              </dd>
            </dl>
            <dl class="dl-horizontal col-sm-3">
              <dt>关系</dt>
              <dd>
               <input type="text" class="form-control" id="immediate_relation1" size="10"
                               readonly="readonly">
              </dd>
            </dl>
             <dl class="dl-horizontal col-sm-3">
              <dt>手机号码</dt>
              <dd>
             <input type="text" class="form-control" id="immediate_Mobile1" size="12"
                               readonly="readonly" />
              </dd>
            </dl>
             <dl class="dl-horizontal col-sm-3">
              <dt>知晓本次借款</dt>
              <dd>
            <input type="checkbox" id="immediate_ck1"
                              onclick="isKnowLoan('#immediate_id1', '#immediate_ck1')" >
                           
              </dd>
            </dl>
            </div>
            <div class="from_con clearfix">
            <dl class="dl-horizontal col-sm-3">
              <dt>直系亲属姓名</dt>
              <dd>
              <input type="text" class="form-control" id="immediate_name2"
                               readonly="readonly"  size="10"/>
              </dd>
            </dl>
            <dl class="dl-horizontal col-sm-3">
              <dt>关系</dt>
              <dd>
              <input type="text" class="form-control" id="immediate_relation2"
                               readonly="readonly"  size="10"/>
              </dd>
            </dl>
             <dl class="dl-horizontal col-sm-3">
              <dt>手机号码</dt>
              <dd>
             <input type="text" class="form-control" id="immediate_Mobile2"
                               readonly="readonly"  size="12"/>
              </dd>
            </dl>
             <dl class="dl-horizontal col-sm-3">
              <dt>知晓本次借款</dt>
              <dd>
           <input type="checkbox" id="immediate_ck2"
                               onclick="isKnowLoan('#immediate_id2', '#immediate_ck2')" />
              </dd>
            </dl>
            </div>
            <div class="from_con clearfix">
            <dl class="dl-horizontal col-sm-3">
              <dt>其他联系人姓名</dt>
              <dd>
            <input type="text" class="form-control" id="other_name1"
                               readonly="readonly"  size="10"/>
              </dd>
            </dl>
            <dl class="dl-horizontal col-sm-3">
              <dt>关系</dt>
              <dd>
              <input type="text" class="form-control" id="other_relation1"
                               readonly="readonly"  size="10"/>
              </dd>
            </dl>
             <dl class="dl-horizontal col-sm-3">
              <dt>手机号码</dt>
              <dd>
            <input type="text" class="form-control" id="other_mobile1"
                               readonly="readonly"  size="12"/>
              </dd>
            </dl>
             <dl class="dl-horizontal col-sm-3">
              <dt>知晓本次借款</dt>
              <dd>
          <input type="checkbox" id="other_ck2" onclick="isKnowLoan('#other_id1',
                        '#other_ck2')" />
              </dd>
            </dl>
            </div>
              <div class="from_con clearfix">
            <dl class="dl-horizontal col-sm-3">
              <dt>其他联系人姓名</dt>
              <dd>
           <input type="text" class="form-control" id="other_name2"
                               readonly="readonly"  size="10"/>
              </dd>
            </dl>
            <dl class="dl-horizontal col-sm-3">
              <dt>关系</dt>
              <dd>
              <input type="text" class="form-control" id="other_relation2"
                               readonly="readonly"  size="10"/>
              </dd>
            </dl>
             <dl class="dl-horizontal col-sm-3">
              <dt>手机号码</dt>
              <dd>
            <input type="text" class="form-control" id="other_mobile2"
                               readonly="readonly"  size="12"/>
              </dd>
            </dl>
             <dl class="dl-horizontal col-sm-3">
              <dt>知晓本次借款</dt>
              <dd>
          <input type="checkbox" id="other_ck" onclick="isKnowLoan('#other_id2',
                        '#other_ck')" />
              </dd>
            </dl>
            </div>
        
        </div>
        <div class="row" style="padding-bottom:20px;">
          <div class="col-md-2 col-sm-offset-4"> <a class="btn btn-default btn-block" href="javascript:void(0);" onclick="cancel()">取消申请</a> </div>
          <div class="col-md-2">
            <button type="submit" class="btn btn-danger btn-block">提交申请</button>
          </div>
        </div>
      </div>
      <div id="loan_attachment_div" style="display:none;"> </div>
      <div id="fade2" class="black_overlayx"> </div>
      <div id="qs_box" class="modal modal_sml fade in">
        <div class="modal-header"> <a type="button" href="javascript:void(0)" onclick="colsediv(0)"
				class="close"><span aria-hidden="true">&times;</span></a>
			<h4 class="modal-title" id="myModalLabel" style="font-size: 16px;">提示</h4>
		</div>
		<div class="modal-body">
			<p class="p_tip">
				<i class="fa fa-check-circle"></i> 
				<span id="alert_message">
				
				</span>
			</p>
			<div class="btn_list clearfix">
				<a class="btn btn-danger btn-sm" href="javascript:void(0)"
					onclick="colsediv(0)">取消</a>
				<a class="btn btn-default btn-sm"
					href="javascript:void(0)" onclick="colsediv(0)" id="ok_button">确定</a>
			</div>
		</div>
</div>
<div id="progress">
    <div class="bar" style="width: 0%;"></div>
</div>
</form>
</body>
<style>
.bar {
    height: 18px;
    background: green;
}
</style>

<script type="text/javascript">
    var lastCustomerId = 0;
    $(function () {
        init();
        
        /** 身份证 */
        $('#up_img_WU_FILE_0').fileupload({
            dataType: 'json',
            done: function (e, data) {
                doneProcess(data, $('#imgShow_WU_FILE_0'));
            }
        });
		
		
        /** 车辆行驶证 */
        $("#up_img_WU_FILE_1").fileupload({
            dataType: 'json',
            done: function (e, data) {
                doneProcess(data, $('#imgShow_WU_FILE_1'));
            }
        });
        
        /** 机动车登记证书 */
        $("#up_img_WU_FILE_2").fileupload({
            dataType: 'json',
            done: function (e, data) {
                doneProcess(data, $('#imgShow_WU_FILE_2'));
            }
        });
		
		
        /** 机动车商业保险单 */
        $("#up_img_WU_FILE_3").fileupload({
            dataType: 'json',
            done: function (e, data) {
                doneProcess(data, $('#imgShow_WU_FILE_3'));
            }
        });
		
		
        /** 其他附件 */
        $("#up_img_WU_FILE_4").fileupload({
            dataType: 'json',
            done: function (e, data) {
                doneProcess(data, $('#imgShow_WU_FILE_4'));
            }
        });
        /** 诉讼截图 */
        $("#up_img_WU_FILE_5").fileupload({
            dataType: 'json',
            done: function (e, data) {
                doneProcess(data, $('#imgShow_WU_FILE_5'));
            }
        });
        /** 违法信息截图 */
        $("#up_img_WU_FILE_6").fileupload({
            dataType: 'json',
            done: function (e, data) {
                doneProcess(data, $('#imgShow_WU_FILE_6'));
            }
        });
        /** 身份证背面 */
        $("#up_img_WU_FILE_7").fileupload({
            dataType: 'json',
            done: function (e, data) {
                doneProcess(data, $('#imgShow_WU_FILE_7'));
            }
        });

        var doneProcess = function (data, obj) {
            $.each(data.result, function (index, file) {
                if (file.code == "0000") {
                    layer.msg("上传成功！");
                    $(obj).attr("src",file.showFilePath);
                    /** 查询出借款附件 */
                    $("#loan_attachment_div").load("${basePath}/admin/loan/getUploadLoanAttachment.html?loanId=${loanInfo.uuid}")
                } else {
                	if(file.code == "9999"){
                		layer.msg("不支持此类型的文件！");
                	}
                }
            });
        };

        /** 动态加载公司列表 */
        var companyIdObj = $("#companyId");
        companyIdObj.click(function(){

            //取得用户的Id信息，根据用户所属的分公司进行权限的控制
            var customerId = $("#customerId").val();
            $.get("${basePath}/admin/company/queryCompanyByCustomerId.html?customerId="+customerId, function (result) {
                if(lastCustomerId!=customerId){
                    var html = '<option value="0">请选择</option>';
                    $(result).each(function (i) {
                        html += '<option value="' + result[i].id + '">' + result[i].name + '</option>';
                    });
                    companyIdObj.html(html);
                    lastCustomerId = customerId;
                }

                /*修改时选中所属公司*/
                companyIdObj.find("option[value='" + ${loanInfo.companyId} +"']").attr("selected", true);

                /*获取部门的方法*/
                getDept('${loanInfo.companyId}');
            });

        })

        /*动态加载公司部门*/
        companyIdObj.live("change", function () {
            getDept(this.value);
        });

        /* 根据公司Id查询部门*/
        var deptIdObj = $("#deptId");
        var getDept = function (companyId) {
            if (companyId != null && companyId != "") {
                $.get("${basePath}/admin/dept/queryDeptComById?companyId=" + companyId + "&type=yw", function (result) {
                    var html = '';
                    $(result).each(function (i) {
                        html += '<option value="' + result[i].id + '">' + result[i].name +
                                '</option>';
                    });
                    deptIdObj.html(html);
                    if (result[0] != null) {
                        getUsers($("#companyId").val(), result[0].id);
                    }

                    deptIdObj.find('option[value="' + '${loanInfo.deptId}' + '"]').attr("selected", true);

                    getUsers('${loanInfo.companyId}', '${loanInfo.deptId}');
                });
            }
        };

        /*动态加载公司部门名下所有员工*/
        deptIdObj.live("change", function () {
            getUsers($("#companyId").val(), this.value);
        });

        var getUsers = function (companyId, deptId) {
            var responsibleCmIdObj = $("#responsibleCmId");
            $.get("${basePath}/admin/user/queryComIdDeptId.html?companyId=" + companyId + "&deptId=" + deptId,
                    function (result) {
                        var html = '<option value="0">请选择</option>';
                        $(result).each(function (i) {
                            html += '<option value="' + result[i].uuid + '">' + result[i].realname +
                                    '</option>';
                        });
                        responsibleCmIdObj.html(html);

                        /* 选中部门负责人 */
                        responsibleCmIdObj.find('option[value="'+'${loanInfo.responsibleCmId}'+'"]').attr("selected", true);
                    });
        };

        $("#gpsWay").live("change", function () {
            $.get("${basePath}/admin/getSysParameter.html?sysKey=" + $("#gpsWay").val(),
                    function (result) {
                        $("#gpsLabel").text(result);
                    });
        });

        $("#pledgeType").live("change", function () {
            var pledgeType = $("#pledgeType").val();
            if (pledgeType === 'vehiclePledge') {
                $("#gps").addClass("hidden");
                //醉毒驾
                $("#drunkdrive_fee").addClass("hidden");
                $("#park").removeClass("hidden");
            } else {
                $("#gps").removeClass("hidden");
                $("#drunkdrive_fee").removeClass("hidden");
                $("#park").addClass("hidden");
            }
        });

        //设置初始状态
        //管理费
        $("#manage_fee").removeClass("hidden");
        //保证金
        $("#cashdeposit_fee").removeClass("hidden");
        //醉毒驾
        $("#drunkdrive_fee").removeClass("hidden");
        //折旧费
        $("#depreciation_fee").addClass("hidden");
        //认证费
        $("#certificate_fee").addClass("hidden");
        $("#gps").removeClass("hidden");
        $("#park").addClass("hidden");
        //根据还款方式确定各个费用的表示方式
        $("#repayWay").live("change", function () {
            var repayWay = $("#repayWay").val();
            if ((repayWay === 'AverageCapitalPlusInterest')||
                (repayWay === 'InterestRatesBefore')) {
                //管理费
                $("#manage_fee").removeClass("hidden");
                //保证金
                $("#cashdeposit_fee").removeClass("hidden");
                //折旧费
                $("#depreciation_fee").addClass("hidden");
                //认证费
                $("#certificate_fee").addClass("hidden");
                //提前还款
                $("#table1 tr td::nth-child(14)").hide();
                $("#pledgeType").removeAttrs("onmousedown")
                $("#pledgeType").removeAttrs("readonly");
                $("#gps").removeClass("hidden");
                if($("#pledgeType").val()=="vehiclePledge"){
                    $("#park").removeClass("hidden");
                }else
                {
                    $("#park").addClass("hidden");
                }

            } else if (repayWay === 'flexiblerepaymentv2'){
                //灵活还款
                $("#manage_fee").addClass("hidden");
                //保证金
                $("#cashdeposit_fee").removeClass("hidden");
                //醉毒驾
                $("#drunkdrive_fee").removeClass("hidden");
                //折旧费
                $("#depreciation_fee").removeClass("hidden");
                //认证费
                $("#certificate_fee").addClass("hidden");
                //设置押车模式
                $("#pledgeType").attr("value","drivePledge");
                //设置为只读模式
                $("#pledgeType").removeAttrs("readonly");
                //提前还款
                $("#table1 tr td::nth-child(14)").hide();
                $("#percentage").show();
                $("#pledgeType").removeAttrs("onmousedown");
                $("#gps").removeClass("hidden");
                if($("#pledgeType").val()=="vehiclePledge"){
                    $("#park").removeClass("hidden");
                }else
                {
                    $("#park").addClass("hidden");
                }

            } else if (repayWay === 'averagePrincipalreduceinterest'){
                //等本减息
                //管理费
                $("#manage_fee").addClass("hidden");
                //保证金
                $("#cashdeposit_fee").removeClass("hidden");
                //醉毒驾
                $("#drunkdrive_fee").removeClass("hidden");
                //折旧费
                $("#depreciation_fee").addClass("hidden");
                //认证费
                $("#certificate_fee").addClass("hidden");
                //设置月利率为不可调整
                $("#monthly_rate").attr("disabled","disabled");
                //设置押车模式
                $("#pledgeType").attr("value","drivePledge");
                //设置为只读模式
                $("#pledgeType").removeAttrs("readonly");
                //提前还款
                $("#table1 tr td::nth-child(14)").show();
                $("#percentage").show();
                $("#pledgeType").removeAttrs("onmousedown");
                $("#gps").removeClass("hidden");
                if($("#pledgeType").val()=="vehiclePledge"){
                    $("#park").removeClass("hidden");
                }else
                {
                    $("#park").addClass("hidden");
                }
            } else if (repayWay === 'averagePrincipalzerointerestrent'){
                //等本零息(押证)
                $("#manage_fee").addClass("hidden");
                 //保证金
                $("#cashdeposit_fee").removeClass("hidden");
                //醉毒驾
                $("#drunkdrive_fee").removeClass("hidden");
                //折旧费
                $("#depreciation_fee").removeClass("hidden");  
                //认证费
                $("#certificate_fee").addClass("hidden");  
                //设置押车模式
                $("#pledgeType").attr("value","drivePledge");
                //设置为只读模式
                $("#pledgeType").attr("readonly","readonly");
                //提前还款
                $("#table1 tr td::nth-child(14)").hide();      
                $("#percentage").show();
                //通过onmousedown处理
                $("#pledgeType").attr("onmousedown","javascript:return false;");
                $("#gps").removeClass("hidden");
                if($("#pledgeType").val()=="vehiclePledge"){
                    $("#park").removeClass("hidden");
                }else
                {
                    $("#park").addClass("hidden");
                }
            }else if (repayWay === 'intrestbeforePrincipalrent') {
                //先息后本(押证)
                $("#manage_fee").addClass("hidden");
                 //保证金
                $("#cashdeposit_fee").removeClass("hidden");
                //醉毒驾
                $("#drunkdrive_fee").removeClass("hidden");
                //折旧费
                $("#depreciation_fee").removeClass("hidden"); 
                //认证费
                $("#certificate_fee").addClass("hidden"); 
                //设置押车模式
                $("#pledgeType").attr("value","drivePledge");
                //设置为只读模式
                $("#pledgeType").attr("readonly","readonly");
                //通过onmousedown处理
                $("#pledgeType").attr("onmousedown","javascript:return false;");
                 //设置月利率为不可调整
                $("#monthly_rate").removeAttr("disabled");
                //提前还款
                $("#table1 tr td::nth-child(14)").hide(); 
                $("#percentage").hide();
                $("#gps").removeClass("hidden");
                $("#park").addClass("hidden");
            }else if (repayWay === 'intrestbeforePrincipaltransfer') {
                //先息后本(押车)
                 $("#manage_fee").addClass("hidden");
                 //保证金
                $("#cashdeposit_fee").removeClass("hidden");
                //醉毒驾
                $("#drunkdrive_fee").addClass("hidden");
                //折旧费
                $("#depreciation_fee").addClass("hidden"); 
                //认证费
                $("#certificate_fee").removeClass("hidden"); 
                //设置押车模式
                $("#pledgeType").attr("value","vehiclePledge");
                //设置为只读模式
                $("#pledgeType").attr("readonly","readonly");
                //通过onmousedown处理
                $("#pledgeType").attr("onmousedown","javascript:return false;");
                //提前还款
                $("#table1 tr td::nth-child(14)").hide(); 
                $("#percentage").show();
                $("#gps").addClass("hidden");
                $("#park").removeClass("hidden");
            }
        });
        /** 生成还款计划 */
        var getGenerateLoanReplayPlan = function () {
            var applyMoney = $("#applyMoney").val() * 10000;// 借款金额
            var loanLimitTimeUnit = $("#loanLimitTime").val();// 期限
            var loanRate = $("#year_rate").val();// 借款年利率
            var repaymentPattern = $('#repayWay').val();// 还款方式
            var uuid = $("#uuid").val();
            var gpsWay = $("#gpsWay").val();

            var pledgeType = $("#pledgeType").val();// 抵押方式：押证/押车
            if (pledgeType === 'vehiclePledge') {//押车
                gpsWay = "";
            }
            var depreciationFee = $("#depreciationFee").val();//折旧费
            var drunkDrive = $("#drunkDrive").find("option:selected").text();//毒酒驾
            var cashdepositFee = $("#cashdepositFee").val(); //保证金
            var certificatefee = $("#certificatefee").val(); //认证费
            var parkCost = $("#parkCost").val();//停车费

            //如果是等额本金和先息后本
            if ((repaymentPattern === 'AverageCapitalPlusInterest')||
                (repaymentPattern === 'InterestRatesBefore')) {
                //对条件进行判断
            if (applyMoney == "" || loanLimitTimeUnit == "" || loanRate == "" || repaymentPattern
                    == "") {
                layer.msg("请先填写借款金额、年利率、借款期限等信息!");
                return false;
                }       
            }else if (repaymentPattern === 'flexiblerepaymentv2') {
                //灵活还款
                 if (applyMoney == "" || loanLimitTimeUnit == "" || depreciationFee == "" || repaymentPattern == "") {
                    layer.msg("请先填写借款金额、折旧费、借款期限等信息!");
                    return false;
                } 
                loanRate = depreciationFee;
            }else if (repaymentPattern === 'averagePrincipalreduceinterest') {
                //等本减息
                 if (applyMoney == "" || loanLimitTimeUnit == "" || repaymentPattern == "") {
                    layer.msg("请先填写借款金额、借款期限等信息!");
                    return false;
                } 
            }else if (repaymentPattern === 'AveragePrincipalzerointerestrent') {
                //等本零息
                 if (applyMoney == "" || loanLimitTimeUnit == "" || depreciationFee == "" || repaymentPattern == "") {
                    layer.msg("请先填写借款金额、折旧费、借款期限等信息!");
                    return false;
                } 
                loanRate = depreciationFee;
            }else if (repaymentPattern === 'intrestbeforePrincipalrent') {
                //等本零息(押证)
                 if (applyMoney == "" || loanLimitTimeUnit == "" || depreciationFee == "" || repaymentPattern == "") {
                    layer.msg("请先填写借款金额、折旧费、借款期限等信息!");
                    return false;
                } 
               //loanRate = depreciation_fee;
            }else if (repaymentPattern === 'intrestbeforePrincipaltransfer') {
                //等本零息(押车)
                 if (applyMoney == "" || loanLimitTimeUnit == "" || loanRate == "" || repaymentPattern == "") {
                    layer.msg("请先填写借款金额、折旧费、借款期限等信息!");
                    return false;
                } 
            }


            if (depreciationFee == null) {
                depreciationFee = 0;
            }
            
            if(drunkDrive == null){
                drunkDrive = 0;
            }
            
            if(cashdepositFee == null){
                cashdepositFee = 0;
            }
            
            if(certificatefee == null){
                certificatefee = 0;
            }

            $.ajax({
                type: 'GET',
                url: '${basePath}/admin/loan/getGenerateLoanReplayPlan.html',
                data: {
                    "uuid": uuid,
                    "applyMoney": applyMoney,
                    "loanLimitTimeUnit": loanLimitTimeUnit,
                    "loanRate": loanRate,
                    "repaymentPattern": repaymentPattern,
                    "manageFee": $("#managerFee").val(),
                    "gpsWay" : gpsWay,
                    "pledgeType": pledgeType,
                    "depreciationFee":depreciationFee,     //折旧费
                    "drunkDrive":drunkDrive,             //毒酒驾
                    "cashdepositFee":cashdepositFee,     //保证金
                    "certificatefee":certificatefee,      //认证费
                    "parkCost":parkCost  //停车费
                },
                dataType: "json",
                success: function (data) {
                    var html = "'";
                    if (data == "9999") {
                        layer.msg("操作失败!");
                        return false;
                    } else {
                        for (var i = 0; i < data.planList.length; i++) {

                            var date = new Date(data.planList[i].repayDate.replace(/-/g, "/")).Format("yyyy-MM-dd");
                            html += "<tr>";
                            html += "<td align='center'>" + data.planList[i].repayPeriod + "</td>";
                            html += "<td align='center'>" + data.planList[i].repayCapital + "</td>";
                            html += "<td align='center'>" + data.planList[i].repayInterest + "</td>";
                            html += "<td align='center'>" + data.planList[i].manageFee + "</td>";
                            html += "<td align='center'>" + data.planList[i].gpsCost + "</td>";
                            html += "<td align='center'>" + data.planList[i].checkCost + "</td>";
                            html += "<td align='center'>" + data.planList[i].parkCost + "</td>";
                            html += "<td align='center'>" + data.planList[i].depreciationFee + "</td>";
                            html += "<td align='center'>" + data.planList[i].drunkDrive + "</td>";
                            html += "<td align='center'>" + data.planList[i].cashdepositFee + "</td>";
                            html += "<td align='center'>" + data.planList[i].certificateFee + "</td>";
                            html += "<td align='center'>" + data.planList[i].repayTotal + "</td>";
                            html += "<td align='center'>" + data.planList[i].surplusCapital + "</td>";
//                            html += "<td align='center'>" + data.planList[i].advancerepay + "</td>";
                            html += "<td align='center'>" + date + "</td>";
                            html += "</tr>";
                        }
                        //计算合计金额
                        var sum = accAdd(data.sumInvest, data.sumCaptial);
                        sum = accAdd(sum,data.sumManageFee);
                        sum = accAdd(sum,data.sumGpsFee);
                        sum = accAdd(sum,data.sumCheckFee);
                        sum = accAdd(sum,data.sumParkFee);
                        sum = accAdd(sum,data.sumDepreciationFee);
                        sum = accAdd(sum,data.sumdrunkDrugDrive);
                        sum = accAdd(sum,data.sumcashdepositFee);
                        sum = accAdd(sum,data.sumCertificateFee);

                        html += "<tr>";
                        html += "<td align='center'>合计：</td>";
                        html += "<td align='center'>" + data.sumCaptial + "</td>";
                        html += "<td align='center'>" + data.sumInvest + "</td>";
                        html += "<td align='center'>" + data.sumManageFee + "</td>";
                        html += "<td align='center'>" + data.sumGpsFee + "</td>";
                        html += "<td align='center'>" + data.sumCheckFee + "</td>";
                        html += "<td align='center'>" + data.sumParkFee + "</td>";
                        html += "<td align='center'>" + data.sumDepreciationFee + "</td>";
                        html += "<td align='center'>" + data.sumdrunkDrugDrive + "</td>";
                        html += "<td align='center'>" + data.sumcashdepositFee + "</td>";
                        html += "<td align='center'>" + data.sumCertificateFee + "</td>";
                        html += "<td align='center'>" + sum.toFixed(2) + "</td>";
                        html += "<td align='center'>----</td>";
//                        html += "<td align='center'>----</td>";
                        html += "<td align='center'>----</td>";
                        html += "</tr>";
                        $("#repayPlayDetail").html(html);
                        //修改双滚动条问题
                        var main = $(window.parent.document).find("#main_ifream贷前订单");
                        main.height($(window.document).height());
                    }
                }, error: function (e) {
                    layer.msg("操作失败!可能原因：" + e);
                    return false;
                }
            });
        };

        $(".plan-show").click(function () {
            getGenerateLoanReplayPlan();
        });
        //修改双滚动条问题
        var main = $(window.parent.document).find("#main_ifream贷前订单");
        main.height($(window.document).height());
    });

    init = function () {
        $("#loan_attachment_div").load("${basePath}/admin/loan/getUploadLoanAttachment.html?loanId=${loanInfo.uuid}",function(){
            checkAttachmentUploaded();
        });
    };


    /** 判断附件是否已经上传 */
    var checkAttachmentUploaded = function () {
        /**调整借款合同，改变已上传附件的样式*/
        var idCardFileupload1 = $("#idCardType").val();//身份证
        if (idCardFileupload1 !== undefined && idCardFileupload1 != null && idCardFileupload1 != "") {
            var idCardFileuploadSpanObj = $("#idCardFileuploadSpan");
            idCardFileuploadSpanObj.removeClass("cblue");
            idCardFileuploadSpanObj.addClass("cgreen");
            idCardFileuploadSpanObj.text("已上传");
        }
        var vehicleLicenseFileupload1 = $("#vehicleLicense").val();//车辆行驶证
        if (vehicleLicenseFileupload1 !== undefined && vehicleLicenseFileupload1 != null && vehicleLicenseFileupload1 != "") {
            var vehicleLicenseFileuploadSpanObj = $("#vehicleLicenseFileuploadSpan");
            vehicleLicenseFileuploadSpanObj.removeClass("cblue");
            vehicleLicenseFileuploadSpanObj.addClass("cgreen");
            vehicleLicenseFileuploadSpanObj.text("已上传");
        }
        var registrationCertificateFileupload1 = $("#registrationCertificate").val();//机动车登记证书
        if (registrationCertificateFileupload1 !== undefined && registrationCertificateFileupload1 != null && registrationCertificateFileupload1 != "") {
            var registrationCertificateFileuploadSpanObj = $("#registrationCertificateFileuploadSpan");
            registrationCertificateFileuploadSpanObj.removeClass("cblue");
            registrationCertificateFileuploadSpanObj.addClass("cgreen");
            registrationCertificateFileuploadSpanObj.text("已上传");
        }
        var businessInsurancePolicyFileupload1 = $("#businessInsurancePolicy").val();//机动车商业保险单
        if (businessInsurancePolicyFileupload1 !== undefined && businessInsurancePolicyFileupload1 != null && businessInsurancePolicyFileupload1 != "") {
            var businessInsurancePolicyFileuploadSpanObj = $("#businessInsurancePolicyFileuploadSpan");
            businessInsurancePolicyFileuploadSpanObj.removeClass("cblue");
            businessInsurancePolicyFileuploadSpanObj.addClass("cgreen");
            businessInsurancePolicyFileuploadSpanObj.text("已上传");
        }
        var otherFileupload1 = $("#other").val();//其他附件
        if (otherFileupload1 !== undefined && otherFileupload1 != null && otherFileupload1 != "") {
            var otherFileuploadSpanObj = $("#otherFileuploadSpan");
            otherFileuploadSpanObj.removeClass("cblue");
            otherFileuploadSpanObj.addClass("cgreen");
            otherFileuploadSpanObj.text("已上传");
        }

    };


    /** 删除附件 */
    function deleteLoanAttachment() {
        var loanAttIds = [];//定义一个数组
        $('input[name="attachmentId"]:checked').each(function () {
            loanAttIds.push($(this).val());
        });

        $.ajax({
            type: 'POST',
            url: '${basePath}/admin/loan/deleteLoanAttachment.html',
            data: {
                "loanAttIds": loanAttIds
            },
            dataType: "text",
            success: function (data) {
                if (data == "0000") {
                    layer.msg("删除成功!");
                    init();
                    return true;
                } else {
                    layer.msg("操作失败!");
                    return false;
                }
            }, error: function (e) {
                layer.msg("操作失败!可能原因：" + e);
                return false;
            }
        });
    }
    
    function contrast(){
    var  a=$("#loanLimitTime").val();
    if(a>0){
    $("#judge").val(null);
    $("#d11").html(null);
    }else{
    $("#judge").val("no");
    $("#d11").html("<font color='red'>借款期限不能为0！</font>");
    }
    }
    
    function addCustomerNow(){
    	//editTitle("/admin/customer/goAddLoanerInfo.html","新增客户");
    	window.location = "/admin/customer/goAddLoanerInfo.html?addLoan=1";
    }
    function cancel(){
    if(document.referrer.indexOf("loaninfoList")>0){
    javascript:history.go(-1);
    }else if(window.location.href.indexOf("preservation")>0){
    window.location.href = '${basePath}/admin/loan/loanerList.html?latent=1';
    }else{
    window.location = "/admin/loan/loanInfoList.html";
	}
    }
	function generate(){
	$(".plan-show").click();
	}
</script>
<!--<script src="${basePath}/js/uploadPreview.js" type="text/javascript"></script>-->
</html>
