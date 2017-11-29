<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%
	String addLoan = request.getParameter("addLoan");
%>
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
<link rel="stylesheet"
	href="${basePath}/css/bootstrap-datetimepicker.min.css">
<script src="${basePath}/js/bootstrap-datetimepicker.min.js"></script>
<script src="${basePath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="${basePath}/js/datetimepicker.js"></script>
<script src="${basePath}/js/jquery.validate.js"></script>
<script type="text/javascript" lang="javascript">
    $(function () {
    $(".error_box").hide();
        var buttonText = "";
        var buttons = document.getElementsByTagName("button");
        for(var i = 0; i< buttons.length; i++) {
            buttons[i].onclick = function() {
                buttonText = this.name;
            }
        }

        var sexObj = $('input[name="sex"]');
        sexObj.removeAttrs("checked");
        if ("${customerRegisterInfo.sex}" == "FM") {
            sexObj.eq(1).attr("checked", 'checked');
        } else {
            sexObj.eq(0).attr("checked", 'checked');
        }

        var hasObj = $('input[name="hasHouse"]');

        hasObj.removeAttrs("checked");
        if ("${customerAdditionalInfo.hasHouse}" == "false") {
            hasObj.eq(1).attr("checked", 'checked');
        } else {
            hasObj.eq(0).attr("checked", 'checked');
        }


        $("#house").live("change", function () {
            var supplementObj = $("#supplement");
            if (this.value == 'rent') {
                supplementObj.html("<label>月租金：</label><input type = 'text' class = 'form-control' name = 'rental' >");
            } else if (this.value == 'commodity_mortgage') {
                supplementObj.html("<label>月供：</label><input type = 'text' class = 'form-control' name = 'rental'>");
            } else {
                supplementObj.html("");
            }
        });

        /**编辑页面显示月供*/
        if(${customerRegisterInfo.house eq 'commodity_mortgage' }){
            var supplementObj = $("#supplement");
            supplementObj.html("<label>月供：</label><input type = 'text' class = 'form-control' name = 'rental' value='${customerRegisterInfo.rental}'>");
        }

        /**编辑页面显示月租金*/
        if (${customerRegisterInfo.house eq 'rent' }) {
            var supplementObj = $("#supplement");
            supplementObj.html("<label>月租金：</label><input type = 'text' class = 'form-control' name = 'rental' value='${customerRegisterInfo.rental}'>");
        }

        /**单位性质为私营时，填写占股比例*/
        $("#enterpriseType").live("change",function(){
            var supplementIncomeObj = $("#supplementIncome");
            if(this.value == 'private'){
                supplementIncomeObj.html("<strong class='cred'>*</strong><label>占股比例：</label><input type = 'text' class = 'form-control' name = 'ratio'>%");
            } else{
                supplementIncomeObj.html("");
            }
        });


        /**编辑页面显示占股比例*/
        if(${customerAdditionalInfo.enterpriseType=='private'}){
            var supplementIncomeObj = $("#supplementIncome");
            supplementIncomeObj.html("<strong class='cred'>*</strong><label>占股比例：</label><input type = 'text' class = 'form-control' name = 'ratio' value='${customerAdditionalInfo.ratio}'>%");
        }

        /*手机号码验证*/
        $.validator.addMethod("checkMobile", function (value, element, params) {
            var telephone = $("#mobile");
            var mobileValue = telephone.val();
            if (!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(mobileValue))) {
                telephone.focus();
                return false;
            } else {
                discriCard($(obj).val());
                return true;
            }
        }, "不是完整的11位手机号或者正确的手机号！");


        $.validator.addMethod("checkSelected", function (value, element, params) {
            return value != '0';
        }, '请选择！');

        $("#customerForm").validate({
            errorLaberContainer: "customerError",
            errorElement: "span",
            rules: {
                customerName: {
                    required: true
                },
                age: {
                    required: true,
                    digits: true
                },
                isImportant: {
                    required: true,
                },
                mobile: {
                    required: true,
                    digits: true
                },
                idCard: {
                    required: true
                },
                education: {
                    required: true
                },
                liveNumber: {
                    required: true
                },
                kosekiAddress: {
                    required: true
                },
                liveAddress: {
                    required: true
                },
                enterpriseName: {
                    required: true
                },
                enterpriseIndustry: {
                    required: true
                },
                enterpriseTel: {
                    required: true
                },
                enterpriseAddress: {
                    required: true
                },
                income: {
                    required: true
                },
                immediate_name1: {
                    required: true
                },
                immediate_relation1: {
                     required: true
                 },
                 immediate_Mobile1: {
                     required: true
                 },
                 other_name1: {
                     required: true
                 },
                other_relation1: {
                    required: true
                },
                other_mobile1: {
                    required: true
                },
//                creditCardQuota: {
//                    required: true
//                },
                companyId: {
                     checkSelected: true
                 },
                 deptId: {
                     checkSelected: true
                },
                 responsibleCmId: {
                     checkSelected: true
                 },
//                creditCardNum: {
//                    required: true
//                }
            },
            messages: {
                customerName: {
                    required: '姓名不能为空！'
                },
                age: {
                    required: '年龄不能为空！',
                    digits: '非法输入，只能输入数字！'
                },
                mobile: {
                    required: '手机号码不能为空!',
                    digits: '非法输入，只能输入数字！'
                },
                idCard: {
                    required: '身份证号码不能为空！'
                },
                education: {
                    required: '学历不能为空！'
                },
                liveNumber: {
                    required: '居住人数不能为空！'
                },
                kosekiAddress: {
                    required: '户籍地址不能为空！'
                },
                liveAddress: {
                    required: '现居住地址不能为空！'
                },
                enterpriseName: {
                    required: '单位全称不能为空！'
                },
                isImportant: {
                    required: '是否重点不能为空！'
                },
                enterpriseIndustry: {
                    required: '所属行业不能为空！'
                },
                enterpriseTel: {
                    required: '单位电话不能为空！'
                },
                enterpriseAddress: {
                    required: '单位地址不能为空！'
                },
                income: {
                    required: '月收入不能为空！'
                },
                immediate_name1: {
                    required: '不能为空！'
                },
                immediate_relation1: {
                   required: '不能为空！'
                },
                immediate_Mobile1: {
                    required: '不能为空！'
                },
                other_name1: {
                   required: '不能为空！'
                },
                other_relation1: {
                    required: '不能为空！'
                },
                other_mobile1: {
                   required: '不能为空！'
                },
//                creditCardQuota: {
//                    required: '信用卡额度不能为空，没有请填写0！'
//                },
//                creditCardNum: {
//                    required: '信用卡张数不能为空，没有请填写0！'
//                }
            },
            submitHandler: function (form, event) {
            var add=$("#add").val();
            var correct=$("#correct").val();
            	if(!saveOrUpdateCustomerContacts()||add=="no"||correct=="no"){
            	}
            	else{
            		 $.ajax({
                         type: 'POST',
                         url: '${basePath}/admin/customer/saveOrUpdateCustomer.html',
                         data: $("#customerForm").serializeArray(),
                         dataType: "text",
                         success: function (data) {
                             if (null != data) {
                                	$("#customerId").val(data);
									$.ajax({
								           type: 'GET',
								           url: '${basePath}/admin/customer/saveOrUpdateCustomerContacts.html',
								           data: param(),
								           dataType: "text",
								           success: function (data) {
								               if (data == '0000') {
								                   layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
								                   	   //editTitle(null,"潜在客户");
								                   	   if($("#mode").val()=="preservation"){
								                   	        var idCard=$("#idCard").val();
								                   	        $.ajax({
								                   	              type: 'GET',
								           						  url: '${basePath}/admin/customer/queryUUID.html?idCard='+idCard,
								           						  dataType : "json",
								         						  success: function (data) {
								         						  var uuid=data.uuid;
								                   	              window.location = "${basePath}/admin/loan/goLoanApplyPage.html?customerId="+ uuid + '&preservation=yes';
								                   	           	 }
								                   	        })
								                   	   }else{
								                   	   if($("#addLoan").val() == 1){ //返回新增贷款
								                   	   		document.location.href = '${basePath}/admin/loan/goLoanApplyPage.html?customerId=' + $("#customerId").val() + '&sign=yes';
								                   	   }else{
								                   	   		//document.location.href = '${basePath}/admin/loan/loanerList.html?latent=0';
								                   	   		window.location.href = document.referrer;
								                   	   }}
								                       return true;
								                   });
								               } else {
								                   layer.msg("操作失败!");
								                   return false;
								               }
								           }, error: function () {
								               layer.msg("网络错误!");
								               return false;
								           }
								    })
                             } else {
                                 layer.msg("操作失败!可能原因：" + data);
                                 return false;
                             }
                         }, error: function () {
                             layer.msg("网络错误!");
                             return false;
                         }
                     })
            	}
            }
        });
        
        $.get("${basePath}/admin/customer/queryContactsCusId.html?uuid=${customerRegisterInfo.uuid}", function (result) {
            $(result).each(function (i) {
                if (result[i].relation == "配偶") {
                    $("#spouse_id").val(result[i].id);
                    $("#spouse_name").val(result[i].contactsName);
                    $("#spouse_tel").val(result[i].contactsTel);
                    $("#spouse_mobile").val(result[i].contactsMobile)
                }
                if (result[i].contactsTel == "直系亲属1") {
                    $("#immediate_id1").val(result[i].id);
                    $("#immediate_name1").val(result[i].contactsName);
                    $("#immediate_relation1").val(result[i].relation);
                    $("#immediate_Mobile1").val(result[i].contactsMobile);
                }
                if (result[i].contactsTel == "直系亲属2") {
                    $("#immediate_id2").val(result[i].id);
                    $("#immediate_name2").val(result[i].contactsName);
                    $("#immediate_relation2").val(result[i].relation);
                    $("#immediate_Mobile2").val(result[i].contactsMobile);
                }
                if (result[i].contactsTel == "其他联系人1") {
                    $("#other_id1").val(result[i].id);
                    $("#other_name1").val(result[i].contactsName);
                    $("#other_relation1").val(result[i].relation);
                    $("#other_mobile1").val(result[i].contactsMobile);
                }
                if (result[i].contactsTel == "其他联系人2") {
                    $("#other_id2").val(result[i].id);
                    $("#other_name2").val(result[i].contactsName);
                    $("#other_relation2").val(result[i].relation);
                    $("#other_mobile2").val(result[i].contactsMobile);
                }
            });
        })
        
    });
	
    function saveOrUpdateCustomerContacts() {

        var spouse_name = $("#spouse_name").val();
        var spouse_tel = $("#spouse_tel").val();
        var spouse_mobile = $("#spouse_mobile").val();

        var immediate_name1 = $("#immediate_name1").val();
        var immediate_relation1 = $("#immediate_relation1").val();
        var immediate_Mobile1 = $("#immediate_Mobile1").val();


        var immediate_name2 = $("#immediate_name2").val();
        var immediate_relation2 = $("#immediate_relation2").val();
        var immediate_Mobile2 = $("#immediate_Mobile2").val();


        var other_name1 = $("#other_name1").val();
        var other_relation1 = $("#other_relation1").val();
        var other_mobile1 = $("#other_mobile1").val();

        var other_name2 = $("#other_name2").val();
        var other_relation2 = $("#other_relation2").val();
        var other_mobile2 = $("#other_mobile2").val();
        var currency="<font color='red'>不能为空"

        if ('${customerRegisterInfo.maritalStatus}' == 'YH' ||
                '${customerRegisterInfo.maritalStatus}' == 'ZH') {
//            if (spouse_name == null || spouse_name == "") {
//                layer.msg("配偶姓名不能为空");
//                $("#spouse_name").focus();
//                return false;
//            }
//            if (spouse_tel == null || spouse_tel == "") {
//                $("#spouse_tel").attr('value', '0');
//            }
//            if (spouse_mobile == null || spouse_mobile == "") {
//                layer.msg("手机号码不能为空");
//                $("#spouse_mobile").focus();
//                return false;
//            }
        }

        if (immediate_name1 == null || immediate_name1 == "") {
            return false;
        }
        if (immediate_relation1 == null || immediate_relation1 == "") {
            return false;
        }
        if (immediate_Mobile1 == null || immediate_Mobile1 == "") {
            return false;
        }
        if (other_name1 == null || other_name1 == "") {
            return false;
        }
        if (other_relation1 == null || other_relation1 == "") {
            return false;
        }
        if (other_mobile1 == null || other_mobile1 == "") {
            return false;
        }

        return true;
    }

    var param = function () {
        var spouse_id = $("#spouse_id").val();
        var spouse_name = $("#spouse_name").val();
        var spouse_tel = $("#spouse_tel").val();
        var spouse_mobile = $("#spouse_mobile").val();

        var immediate_id1 = $("#immediate_id1").val();
        var immediate_name1 = $("#immediate_name1").val();
        var immediate_relation1 = $("#immediate_relation1").val();
        var immediate_Mobile1 = $("#immediate_Mobile1").val();

        var immediate_id2 = $("#immediate_id2").val();
        var immediate_name2 = $("#immediate_name2").val();
        var immediate_relation2 = $("#immediate_relation2").val();
        var immediate_Mobile2 = $("#immediate_Mobile2").val();

        var other_id1 = $("#other_id1").val();
        var other_name1 = $("#other_name1").val();
        var other_relation1 = $("#other_relation1").val();
        var other_mobile1 = $("#other_mobile1").val();

        var other_id2 = $("#other_id2").val();
        var other_name2 = $("#other_name2").val();
        var other_relation2 = $("#other_relation2").val();
        var other_mobile2 = $("#other_mobile2").val();

        var customerId = $("#customerId").val();

        var json = "[{\"id\":\"" + spouse_id + "\",\"customerId\":\"" + customerId + "\",\"contactsName\":\"" + spouse_name + "\",\"contactsTel\":\"" + spouse_tel + "\",\"contactsMobile\":\"" + spouse_mobile + "\",\"relation\":\"配偶\"}," +
                "{\"id\":\"" + immediate_id1 + "\",\"customerId\":\"" + customerId + "\",\"contactsName\":\"" + immediate_name1 + "\",\"contactsTel\":\"直系亲属1\",\"contactsMobile\":\"" + immediate_Mobile1 + "\",\"relation\":\"" + immediate_relation1 + "\"}," +
                "{\"id\":\"" + immediate_id2 + "\",\"customerId\":\"" + customerId + "\",\"contactsName\":\"" + immediate_name2 + "\",\"contactsTel\":\"直系亲属2\",\"contactsMobile\":\"" + immediate_Mobile2 + "\",\"relation\":\"" + immediate_relation2 + "\"}," +
                "{\"id\":\"" + other_id1 + "\",\"customerId\":\"" + customerId + "\",\"contactsName\":\"" + other_name1 + "\",\"contactsTel\":\"其他联系人1\",\"contactsMobile\":\"" + other_mobile1 + "\",\"relation\":\"" + other_relation1 + "\"}," +
                "{\"id\":\"" + other_id2 + "\",\"customerId\":\"" + customerId + "\",\"contactsName\":\"" + other_name2 + "\",\"contactsTel\":\"其他联系人2\",\"contactsMobile\":\"" + other_mobile2 + "\",\"relation\":\"" + other_relation2 + "\"}]";
        return {
            "json": json
        };
    };
    function preservation(Obj){
    $("#mode").val(Obj);
    $("#customerForm").submit();
    }
</script>
</head>

<body>
<input type="hidden" value=""  id="add">
<input type="hidden" value=""  id="correct">
<input type="hidden" value="<%=addLoan %>" id="addLoan" />
<input type="hidden" value=""  id="mode">
<form class="form-inline clearfix" action="javascript:;"
		id="customerForm" method="POST">
  <div class="col-lg-12">
    <div class="tools_bar ">
      <div class="bar_tit clearfix">
        <c:if test="${status eq 'edit'}">
          <h2 class="pull-left">客户修改</h2>
        </c:if>
        <c:if test="${status != 'edit'}">
          <h2 class="pull-left">客户添加</h2>
        </c:if>
      </div>
    </div>
    <div class="from_box col-lg-12">
      <div class="from_tit clearfix">
        <input type="text" hidden="hidden" id="customerId">
        <input
						type="text" hidden="hidden" name="uuid" value="${uuid}" id="uuid">
        <input type="text" hidden="hidden" name="orderId"
						value="${orderId}" id="orderId">
        <input type="text"
						hidden="hidden" name="openId" value="${openId}" id="openId">
        <h3 class="pull-left">基本信息</h3>
        <a href="javascript:void(0);" onclick="javascript:history.go(-1);" class="pull-right btn btn-link"><i
						class="fa fa-mail-forward"></i> 返回</a> </div>
      <div class="from_con clearfix">
        <dl class="dl-horizontal col-sm-4">
          <dt><i class="text-danger">*</i> 姓名</dt>
          <dd>
            <c:if
								test="${customerRegisterInfo.customerName eq null or
                        customerRegisterInfo.customerName eq ''}">
								<input type="text" class="form-control" name="customerName" maxlength="6"
									value="${name}">
            </c:if>
            <c:if
								test="${customerRegisterInfo.customerName != null and
                        customerRegisterInfo.customerName != '' }">
								<input type="text" class="form-control" name="customerName"
									value="${customerRegisterInfo.customerName}">
            </c:if>
          </dd>
        </dl>
        <dl class="dl-horizontal col-sm-4">
          <dt><i class="text-danger">*</i> 是否重点</dt>
          <dd>
          <select class="form-control" name="isImportant" id="isImportant">
          <option value="0" <c:if test="${customerRegisterInfo.isImportant eq '0' }">selected</c:if>>否</option>
          <option value="1" <c:if test="${customerRegisterInfo.isImportant eq '1' }">selected</c:if>>是</option>
          </select>
          </dd>
        </dl>
        <dl class="dl-horizontal col-sm-4">
          <dt><i class="text-danger">*</i> 身份证号</dt>
          <dd>
          
            <c:if
								test="${customerRegisterInfo.idCard eq null or
                        customerRegisterInfo.idCard eq ''}">
              <input type="text" class="form-control" name="idCard" 
								 onkeyup="value=value.replace(/[^\w\.\/]/ig,'')"
									id="idCard" maxlength="18"/>
            </c:if>
            <c:if
								test="${customerRegisterInfo.idCard != null and
                        customerRegisterInfo.idCard != ''}">
              <input type="text" class="form-control" name="idCard" 
								   onkeyup="value=value.replace(/[^\w\.\/]/ig,'')"
									id="idCard" value="${customerRegisterInfo.idCard}" maxlength="18" readonly >
            </c:if>
            
            <div id="d2" class="error_box"></div>
          </dd>
        </dl>
      </div>
      <div class="from_con clearfix">
        <dl class="dl-horizontal col-sm-4">
          <dt>性别</dt>
          <dd>
            <label class="radio-inline">
              <input type="radio"
								name="sex" id="inlineRadio1" value="M"  >
              男 </label>
            <label class="radio-inline">
              <input type="radio"
								name="sex" id="inlineRadio2" value="FM" >
              女 </label>
          </dd>
        </dl>
        <dl class="dl-horizontal col-sm-4">
          <dt>年龄</dt>
          <dd>
            <input type="text" value="${customerRegisterInfo.age}" name="age" id="age" maxlength="3"
							class="form-control sml-control" readOnly="true"/>
          </dd>
        </dl>
        <dl class="dl-horizontal col-sm-4">
          <dt><i class="text-danger">*</i> 手机号码</dt>
          <dd>
            <c:if
								test="${customerRegisterInfo.mobile eq null or
                        customerRegisterInfo.mobile eq ''}">
              <input type="text" class="form-control" name="mobile" maxlength="11"
                                  onkeyup='this.value=this.value.replace(/\D/gi,"")'
									id="mobile" value="${tel}">
            </c:if>
            <c:if
								test="${customerRegisterInfo.mobile != null and
                        customerRegisterInfo.mobile != ''}">
              <input type="text" class="form-control" name="mobile"  maxlength="11"
                                 onkeyup='this.value=this.value.replace(/\D/gi,"")'
									id="mobile" value="${customerRegisterInfo.mobile}">
            </c:if>

            <div id="d1" class="error_box"></div>
          </dd>
        </dl>
      </div>
      <div class="from_con clearfix">
        <dl class="dl-horizontal col-sm-4">
          <dt>学历</dt>
          <dd>
            <select class="form-control" name="education">
              <option value="undergraduate"
									<c:if test="${customerRegisterInfo.education eq 'undergraduate' }">selected</c:if>> 本科</option>
              <option value="college"
									<c:if test="${customerRegisterInfo.education eq 'college' }">selected</c:if>> 大专</option>
              <option value="doctor"
									<c:if test="${customerRegisterInfo.education eq 'doctor' }">selected</c:if>> 博士及以上</option>
              <option value="master"
									<c:if test="${customerRegisterInfo.education eq 'master' }">selected</c:if>> 硕士</option>
              <option value="senior"
									<c:if test="${customerRegisterInfo.education eq 'senior' }">selected</c:if>> 高中及中专</option>
              <option value="junior"
									<c:if test="${customerRegisterInfo.education eq 'junior' }">selected</c:if>> 初中及以下</option>
            </select>
          </dd>
        </dl>
        <dl class="dl-horizontal col-sm-4">
          <dt>婚姻状况</dt>
          <dd>
            <select class="form-control"
							name="maritalStatus">
              <option value="WH"
									<c:if test="${customerRegisterInfo.maritalStatus eq 'WH' }">selected</c:if>> 未婚</option>
              <option value="YH"
									<c:if test="${customerRegisterInfo.maritalStatus eq 'YH' }">selected</c:if>> 已婚</option>
              <option value="LY"
									<c:if test="${customerRegisterInfo.maritalStatus eq 'LY' }">selected</c:if>> 离异</option>
              <option value="SR"
									<c:if test="${customerRegisterInfo.maritalStatus eq 'SR' }">selected</c:if>> 丧偶</option>
              <option value="ZH"
									<c:if test="${customerRegisterInfo.maritalStatus eq 'ZH' }">selected</c:if>> 再婚</option>
            </select>
          </dd>
        </dl>
        <dl class="dl-horizontal col-sm-4">
          <dt><i class="text-danger">*</i> 住房性质</dt>
          <dd>
            <select class="form-control" name="house" id="house">
              <option value="commodity"
									<c:if test="${customerRegisterInfo.house eq 'commodity' }">selected</c:if>> 商品房无按揭</option>
              <option value="commodity_mortgage"
									<c:if test="${customerRegisterInfo.house eq 'commodity_mortgage' }">selected</c:if>> 商品房有按揭</option>
              <option value="bought_public"
									<c:if test="${customerRegisterInfo.house eq 'bought_public' }">selected</c:if>> 已购公房</option>
              <option value="self_build"
									<c:if test="${customerRegisterInfo.house eq 'self_build' }">selected</c:if>> 自建房</option>
              <option value="rent"
									<c:if test="${customerRegisterInfo.house eq 'rent' }">selected</c:if>> 租用</option>
              <option value="kinsfolk"
									<c:if test="${customerRegisterInfo.house eq 'kinsfolk' }">selected</c:if>> 亲属住房</option>
              <option value="dormitory"
									<c:if test="${customerRegisterInfo.house eq 'dormitory' }">selected</c:if>> 单位宿舍</option>
            </select>
          </dd>
        </dl>
      </div>
      <div class="from_con clearfix">
        <dl class="dl-horizontal col-sm-4">
          <dt><i class="text-danger">*</i> 居住人数</dt>
          <dd>
            <input type="text" class="form-control" size="5" name="liveNumber" maxlength="2"
	                               value="${customerRegisterInfo.liveNumber}"
	                               onkeyup="this.value=this.value.replace(/[^\d]/g,'')"
	                               onpaste="return false">
            人 </dd>
        </dl>
        <dl class="dl-horizontal col-sm-4">
          <dt><i class="text-danger">*</i> 现居住地址</dt>
          <dd>
            <input type="text" class="form-control"  maxlength="45"
							size="40" name="liveAddress"
							value="${customerRegisterInfo.liveAddress}">
          </dd>
        </dl>
        <dl class="dl-horizontal col-sm-4">
          <dt><i class="text-danger">*</i> 户籍地址</dt>
          <dd>
            <input type="text" class="form-control" maxlength="45"
							size="40" name="kosekiAddress"
							value="${customerRegisterInfo.kosekiAddress}">
          </dd>
        </dl>
      </div>
    </div>
    <div class="from_box col-lg-12">
      <div class="from_tit clearfix">
        <h3 class="pull-left">工作信息</h3>
      </div>
      <div class="from_con clearfix">
        <dl class="dl-horizontal col-sm-4">
          <dt><i class="text-danger">*</i> 单位全称</dt>
          <dd>
            <input type="text" class="form-control"
							name="enterpriseName" maxlength="10"
							value="${customerAdditionalInfo.enterpriseName}">
          </dd>
        </dl>
        <dl class="dl-horizontal col-sm-4">
          <dt><i class="text-danger">*</i> 所属行业</dt>
          <dd>
            <select class="form-control" name="enterpriseIndustry" id="enterpriseIndustry">
              <option value="1">计算机/互联网/通信/电子</option>
              <option value="2">会计/金融/银行/保险</option>
              <option value="3">贸易/消费/制造/营运</option>
              <option value="4">制药/医疗</option>
              <option value="5">广告/媒体</option>
              <option value="6">房地产/建筑</option>
              <option value="7">专业服务/教育/培训</option>
              <option value="8">服务业</option>
              <option value="9">物流/运输</option>
              <option value="a">能源/原材料</option>
              <option value="b">私营企业主</option>
              <option value="c">政府/非赢利机构/其他</option>
            </select>
          </dd>
        </dl>
        <dl class="dl-horizontal col-sm-4">
          <dt><i class="text-danger">*</i> 单位电话</dt>
          <dd>
            <input type="text" class="form-control"
							name="enterpriseTel" maxlength="12"
							value="${customerAdditionalInfo.enterpriseTel}"
							onkeyup="this.value=this.value.replace(/[^\d]/g,'')"
							onpaste="return false" />
          </dd>
        </dl>
      </div>
      <div class="from_con clearfix">
        <dl class="dl-horizontal col-sm-4">
          <dt><i class="text-danger">*</i> 单位性质</dt>
          <dd>
            <select class="form-control" name="enterpriseType"
							id="enterpriseType">
              <option value="institutions"
									<c:if test="${customerAdditionalInfo.enterpriseType eq 'institutions'}">selected</c:if>> 机关事业单位</option>
              <option value="government"
									<c:if test="${customerAdditionalInfo.enterpriseType eq 'government'}">selected</c:if>> 国有企业</option>
              <option value="three_funded"
									<c:if test="${customerAdditionalInfo.enterpriseType eq 'three_funded'}">selected</c:if>> 三资企业</option>
              <option value="corporate"
									<c:if test="${customerAdditionalInfo.enterpriseType eq 'corporate'}">selected</c:if>> 股份制企业</option>
              <option value="private"
									<c:if test="${customerAdditionalInfo.enterpriseType eq 'private'}">selected</c:if>> 私营</option>
              <option value="professional"
									<c:if test="${customerAdditionalInfo.enterpriseType eq 'professional'}">selected</c:if>> 自由职业者</option>
              <option value="social_organization"
									<c:if test="${customerAdditionalInfo.enterpriseType eq 'social_organization'}">selected</c:if>> 社会团体</option>
              <option value="other"
									<c:if test="${customerAdditionalInfo.enterpriseType eq 'other'}">selected</c:if>> 其他</option>
            </select>
          </dd>
        </dl>
        <dl class="dl-horizontal col-sm-4">
          <dt><i class="text-danger">*</i> 职务</dt>
          <dd>
            <select class="form-control" name="position">
              <option value="chairman"
									<c:if test="${customerAdditionalInfo.position eq 'chairman'}">selected</c:if>> 董事长</option>
              <option value="director"
									<c:if test="${customerAdditionalInfo.position eq 'director'}">selected</c:if>> 董事</option>
              <option value="manager"
									<c:if test="${customerAdditionalInfo.position eq 'manager'}">selected</c:if>> 总经理</option>
              <option value="executives"
									<c:if test="${customerAdditionalInfo.position eq 'executives'}">selected</c:if>> 单位高管</option>
              <option value="department_manage"
									<c:if test="${customerAdditionalInfo.position eq 'department_manage'}">selected</c:if>> 部门主管</option>
              <option value="clerk"
									<c:if test="${customerAdditionalInfo.position eq 'clerk'}">selected</c:if>> 普通职员</option>
              <option value="other"
									<c:if test="${customerAdditionalInfo.position eq 'other'}">selected</c:if>> 其他</option>
            </select>
          </dd>
        </dl>
        <dl class="dl-horizontal col-sm-4">
          <dt>入职时间</dt>
          <dd>
            <div class="input-group date form_date" data-date=""
                                 data-date-format="yyyy-mm-dd"
                                 data-link-field="dateJoined"
                                 data-link-format="yyyy-mm-dd">
              <input class="form-control" type="text" value="<fmt:formatDate value="${customerAdditionalInfo.dateJoined}"
                                   pattern="yyyy-MM-dd"/>" readonly>
              <span class="input-group-addon"><span
                                        class="glyphicon glyphicon-calendar"></span></span> </div>
            <input type="text" hidden="hidden" id="dateJoined" name="dateJoined" />
          </dd>
        </dl>
      </div>
      <div class="from_con clearfix">
        <dl class="dl-horizontal col-sm-4">
          <dt><i class="text-danger">*</i> 单位地址</dt>
          <dd>
            <input type="text" class="form-control" maxlength="25"
							size="60" name="enterpriseAddress" 
							value="${customerAdditionalInfo.enterpriseAddress}">
          </dd>
        </dl>
      </div>
    </div>
    <div class="from_box col-lg-12">
      <div class="from_tit clearfix">
        <h3 class="pull-left">资产信息</h3>
      </div>
      <div class="from_con clearfix">
        <dl class="dl-horizontal col-sm-4">
          <dt><i class="text-danger">*</i> 房产</dt>
          <dd>
            <label class="radio-inline">
              <input type="radio" 
								name="hasHouse" id="inlineRadio1" value="yes">
              有 </label>
            <label class="radio-inline">
              <input type="radio"
								name="hasHouse" id="inlineRadio2" value="no" checked>
              无 </label>
          </dd>
        </dl>
        <dl class="dl-horizontal col-sm-4">
          <dt><i class="text-danger">*</i> 月收入水平(元)</dt>
          <dd>
            <input type="text" autocomplete="off" disableautocomplete class="form-control" name="income"
                               value="${customerAdditionalInfo.income}" maxlength="10"
                               onkeyup="this.value=this.value.replace(/[^\d]/g,'')"
                               onpaste="return false" size="10">
          </dd>
        </dl>
        <dl class="dl-horizontal col-sm-4">
          <dt>其他收入(元)</dt>
          <dd>
            <input type="text" class="form-control" name="otherIncome" id="otherIncome"
                                   value="${customerAdditionalInfo.otherIncome}"  maxlength="8"
                                   onkeyup="this.value=this.value.replace(/[^\d]/g,'')"
                                   onpaste="return false" size="10">
          </dd>
        </dl>
      </div>
      <div class="from_con clearfix">
        <dl class="dl-horizontal col-sm-4">
          <dt>收入说明</dt>
          <dd>
            <input type="text" class="form-control" name="incomeStatement" id="incomeStatement" maxlength="10"
                                   value="${customerAdditionalInfo.incomeStatement}" size="60" />
          </dd>
        </dl>
        <dl class="dl-horizontal col-sm-4">
          <dt>单位地址</dt>
          <dd>
            <input type="text" value="" maxlength="10"
							class="form-control" size="60"/>
          </dd>
        </dl>
      </div>
      <div class="from_con clearfix">
        <p class="text-danger"> <i>*</i> 如果您为私营企主且有营业执照，请补充以下资料 </p>
        <dl class="dl-horizontal col-sm-4">
          <dt>组织形式</dt>
          <dd>
            <select class="form-control" name="zzxs" id="zzxs">
              <option value="no"
									<c:if test="${customerAdditionalInfo.companyType eq 'no'}">selected </c:if>> 请选择</option>
              <option value="individual_businesses"
									<c:if test="${customerAdditionalInfo.companyType eq 'individual_businesses'}">selected</c:if>> 个体商户</option>
              <option value="ltd"
									<c:if test="${customerAdditionalInfo.companyType eq 'ltd'}">selected</c:if>> 有限公司</option>
            </select>
          </dd>
        </dl>
        <dl class="dl-horizontal col-sm-4">
          <dt>注册时间</dt>
          <dd>
            <div class="input-group date form_date" data-date=""
								data-date-format="yyyy-mm-dd" data-link-field="dateJoined"
								data-link-format="yyyy-mm-dd" style="width: 200px;">
              <input class="form-control" type="text"
									value="<fmt:formatDate
                               value="${customerAdditionalInfo.createdAt}" pattern="yyyy-MM-dd"/>"
									readonly="readonly">
              <span class="input-group-addon"><span
									class="glyphicon glyphicon-calendar"></span></span> </div>
            <input type="text" hidden="hidden"
							id="companyRegisterAt" name="companyRegisterAt" />
          </dd>
        </dl>
      </div>
    </div>
    <div class="from_box col-lg-12">
      <div class="from_tit clearfix">
        <h3 class="pull-left">其他信息</h3>
      </div>
      <div class="from_con clearfix">
        <dl class="dl-horizontal col-sm-4">
          <dt> 信用卡张数</dt>
          <dd>
            <input type="text" class="form-control" maxlength="3"
							id="creditCardNum" name="creditCardNum"
							onkeyup="this.value=this.value.replace(/[^\d]/g,'')"
							value="${customerRegisterInfo.creditCardNum}">
          </dd>
        </dl>
        <dl class="dl-horizontal col-sm-4">
          <dt>信用卡额度</dt>
          <dd>
            <input type="text" class="form-control" maxlength="7"
							id="creditCardQuota" name="creditCardQuota"
							onkeyup="this.value=this.value.replace(/[^\d]/g,'')"
							value="${customerRegisterInfo.creditCardQuota}">
          </dd>
        </dl>
      </div>
      <div class="from_con clearfix">
        <dl class="dl-horizontal col-sm-4">
          <dt>信用卡银行名</dt>
          <dd>
            <input type="text" class="form-control" maxlength="10"
							id="creditCardBankName" name="creditCardBankName"
							value="${customerRegisterInfo.creditCardBankName}">
          </dd>
        </dl>
        <dl class="dl-horizontal col-sm-4">
          <dt>信用卡卡号</dt>
          <dd>
            <input type="text" class="form-control" maxlength="25"
                            onkeyup="this.value=this.value.replace(/[^\d]/g,'')"
							id="creditCard" name="creditCard" size="20"
							value="${customerRegisterInfo.creditCard}">
          </dd>
        </dl>
      </div>
      <div class="from_con clearfix">
        <dl class="dl-horizontal col-sm-4">
          <dt><i class="text-danger">*</i> 所属分公司</dt>
          <dd>
            <select class="form-control" id="companyId"
							name="companyId">
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
          <dt><i class="text-danger">*</i> 客户经理</dt>
          <dd>
            <select class="form-control" name="responsibleCmId"
							id="responsibleCmId">
              <option value="0">请选择</option>
            </select>
          </dd>
        </dl>
      </div>
      <div class="from_con clearfix">
        <dl class="dl-horizontal col-sm-8">
          <dt>备注</dt>
          <dd>
            <textarea cols="168" rows="3" maxlength="50"
								class="form-control" id="remark" name="remark"
								placeholder="其他信息请写入到备注栏中">${customerRegisterInfo.remark}</textarea>
          </dd>
        </dl>
      </div>
    </div>
    <div class="from_box col-lg-12">
      <div class="from_tit clearfix">
        <h3>联系人</h3>
      </div>
      <input type="hidden" id="spouse_id" />
      <input type="hidden"
					id="immediate_id1" />
      <input type="hidden" id="immediate_id2" />
      <input type="hidden" id="other_id1" />
      <input type="hidden"
					id="other_id2" />
      <div class="from_con clearfix">
        <dl class="dl-horizontal col-sm-4">
          <dt>配偶姓名</dt>
          <dd>
            <input type="text" class="form-control" id="spouse_name" maxlength="8"/>
          </dd>
        </dl>
        <dl class="dl-horizontal col-sm-4">
          <dt>单位电话</dt>
          <dd>
            <input type="text" class="form-control" id="spouse_tel" maxlength="11" onkeyup="this.value=this.value.replace(/[^\d]/g,'')" />
          </dd>
        </dl>
        <dl class="dl-horizontal col-sm-4">
          <dt>手机号码</dt>
          <dd>
            <input type="text" class="form-control" id="spouse_mobile" maxlength="11" onkeyup="this.value=this.value.replace(/[^\d]/g,'')" />
          </dd>
        </dl>
      </div>
      <div class="from_con clearfix">
        <dl class="dl-horizontal col-sm-4">
          <dt><i class="text-danger">*</i> 直系亲属姓名</dt>
          <dd>
           <input type="text" class="form-control" name="immediate_name1" maxlength="8"
							id="immediate_name1">
          </dd>
        </dl>
        <dl class="dl-horizontal col-sm-4">
          <dt><i class="text-danger">*</i> 关系</dt>
          <dd>
            <input type="text" class="form-control" name="immediate_relation1" maxlength="8"
							id="immediate_relation1" />
          </dd>
        </dl>
        <dl class="dl-horizontal col-sm-4">
          <dt><i class="text-danger">*</i> 手机号码</dt>
          <dd>
            <input type="text" class="form-control" name="immediate_Mobile1" maxlength="11" onkeyup="this.value=this.value.replace(/[^\d]/g,'')"
							id="immediate_Mobile1" />
          </dd>
        </dl>
      </div>
      <div class="from_con clearfix">
        <dl class="dl-horizontal col-sm-4">
          <dt>直系亲属姓名</dt>
          <dd>
           <input type="text" class="form-control" maxlength="8"
							id="immediate_name2" />
          </dd>
        </dl>
        <dl class="dl-horizontal col-sm-4">
          <dt>关系</dt>
          <dd>
           <input type="text" class="form-control" maxlength="8"
							id="immediate_relation2" />
          </dd>
        </dl>
        <dl class="dl-horizontal col-sm-4">
          <dt>手机号码</dt>
          <dd>
           <input type="text" class="form-control" maxlength="11" onkeyup="this.value=this.value.replace(/[^\d]/g,'')"
							id="immediate_Mobile2" />
          </dd>
        </dl>
      </div>
         <div class="from_con clearfix">
        <dl class="dl-horizontal col-sm-4">
          <dt><i class="text-danger">*</i> 其他联系人姓名</dt>
          <dd>
          <input type="text" class="form-control" id="other_name1" name="other_name1" maxlength="8" />
          </dd>
        </dl>
        <dl class="dl-horizontal col-sm-4">
          <dt><i class="text-danger">*</i> 关系</dt>
          <dd>
           <input type="text" class="form-control" name="other_relation1"  maxlength="8"
							id="other_relation1" />
          </dd>
        </dl>
        <dl class="dl-horizontal col-sm-4">
          <dt><i class="text-danger">*</i> 手机号码</dt>
          <dd>
          <input type="text" class="form-control" name="other_mobile1" maxlength="11" onkeyup="this.value=this.value.replace(/[^\d]/g,'')"
							id="other_mobile1" />
          </dd>
        </dl>
      </div>
         <div class="from_con clearfix">
        <dl class="dl-horizontal col-sm-4">
          <dt>其他联系人姓名</dt>
          <dd>
         <input type="text" class="form-control" id="other_name2" maxlength="8" />
          </dd>
        </dl>
        <dl class="dl-horizontal col-sm-4">
          <dt>关系</dt>
          <dd>
           <input type="text" class="form-control" maxlength="8"
							id="other_relation2" />
          </dd>
        </dl>
        <dl class="dl-horizontal col-sm-4">
          <dt>手机号码</dt>
          <dd>
          <input type="text" class="form-control" maxlength="11" onkeyup="this.value=this.value.replace(/[^\d]/g,'')"
							id="other_mobile2" />
          </dd>
        </dl>
      </div>
    </div>
    <div class="row" style="padding-bottom: 20px;">
    <div class="row" style="padding-bottom: 20px;">
      <div class="col-sm-2 col-sm-offset-3"> <a class="btn btn-default btn-block" href="javascript:void(0);" onclick="self.location=document.referrer;">取消提交</a> </div>
      <div class="col-sm-2"><button type="submit" class="btn btn-danger btn-block">提交客户</button></div>
      <div class="col-sm-2"> <a class="btn btn-danger btn-block" href="javascript:void(0);" onclick="preservation('preservation')"   id="preservation">保存并申请贷款</a> </div>
    </div>
  </div>
</form>
<script>
    $(function () {
        if( window.location.href.indexOf("queryCustomer")>0){
        $("#preservation").hide();
        }
        /** 动态加载公司列表 */
        var companyIdObj = $("#companyId");
        $.get("${basePath}/admin/company/queryCompanyList.html", function (result) {
            var html = '';
            $(result).each(function (i) {
                html += '<option value="' + result[i].id + '">' + result[i].name + '</option>';
            });
            companyIdObj.append(html);

            // 查询更新时选中所属公司
            companyIdObj.find("option[value='" + ${customerRegisterInfo.companyId} +"']").attr("selected", true);
            // 查询更新时查询出该公司下的所有部门，为查询更新时选中所属部门准备数据
            if ("${customerRegisterInfo.companyId}" != "") {
                getDept("${customerRegisterInfo.companyId}");
            }
        });

        /* 下拉列表选中之后调用的事件，加载出该公司下所有的部门 */
        companyIdObj.live("change", function () {
            getDept(this.value);
        });

        /* 根据公司Id查询部门*/
        var deptIdObj = $("#deptId");
        var getDept = function (companyId) {
            $.get("${basePath}/admin/dept/queryDeptComById?companyId=" + companyId + "&type=yw",
                    function (result) {
                var html = '<option value="0">请选择</option>';
                $(result).each(function (i) {
                    html += '<option value="' + result[i].id + '">' + result[i].name + '</option>';
                });
                deptIdObj.html(html);// 此处不能使用append(html),原因：多次选择会出现叠加的情况

                // 查询更新时选中所属部门
                deptIdObj.find("option[value='${customerRegisterInfo.deptId}']").attr("selected", true);
                // 查询更新时查询出该部门下所有用户，为查询更新时选中所属用户准备数据
                if ('${customerRegisterInfo.deptId}' != "") {
                    getUsers($("#companyId").val(), '${customerRegisterInfo.deptId}');
                }
            });
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
                            html += "<option value='" + result[i].uuid + "'>" + result[i].realname + "</option>";
                        });
                        responsibleCmIdObj.html(html);
                        // 查询更新时选中所属用户
                        responsibleCmIdObj.find("option[value='${customerRegisterInfo.responsibleCmId}']").attr("selected", true);
                    });
        };


        function verifyUniqueness(obj, param, paramName) {
            $.ajax({
                type: 'GET',
                url: '${basePath}/admin/customer/verifyUniqueness.html',
                data: param,
                dataType: "text",
                success: function (data) {
                
                   if (data == '0000') {
                       $("#d2").hide();
                    } else {
                        $("#add").val("no");
                        var div="身份证号码不可以重复！";
                        $("#d2").html(div);
                        $("#d2").show();
                    }
                }, error: function () {
                    layer.msg("网络错误!");
                    return false;
                }
            })
        }

        var mobileObj = $("#mobile");
        var idCardObj = $("#idCard");
        mobileObj.blur(function () {
            var mobileVal = mobileObj.val();
            var digit=mobileVal.length;
            var div="电话号码不能少于11位！";
			
            if(digit>0&&digit<11){
            	$("#d1").html(div);
            	$("#correct").val("no");
            	$("#d1").show();
            	}else{
            	$("#d1").html(null);
            	$("#correct").val("yes");
            	$("#d1").hide();
            	}
        });

                idCardObj.blur(function () {
            var idCardVal = idCardObj.val();
            var param = {"idCard": idCardVal};
            var paramName = "d2";
            $("#add").val("yes");
            $("#d2").html(null);
            $("#d2").hide();
            if(idCardObj.attr("readonly") != "readonly"&&idCardVal.length>0){
            var accuracy=IdentityCodeValid(this);
            if(accuracy){
                $("#d2").hide();
                verifyUniqueness(idCardObj, param, paramName);           
             }
            
            }
        });

        mobileObj.focus(function () {
            var errorObj = $("#mobile_error_tips");
            errorObj.removeClass("display-inline-div");
            errorObj.addClass("display-none-div");
        });
        idCardObj.focus(function () {
            var errorObj = $("#idCard_error_tips");
            errorObj.removeClass("display-inline-div");
            errorObj.addClass("display-none-div");
        });
    });
    
    /*身份证号校验*/
    function IdentityCodeValid(obj) {
    		num = $(obj).val().toUpperCase();
    //身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X。
    if (!(/(^\d{15}$)|(^\d{17}([0-9]|X)$)/.test(num)))
    {
        var div="身份证号格式错误！";
                $("#add").val("no");
            	$("#d2").html(div);
            	$("#d2").show();
        return false;
    }
    //校验位按照ISO 7064:1983.MOD 11-2的规定生成，X可以认为是数字10。
    //下面分别分析出生日期和校验位
    var len, re;
    len = num.length;
    if (len == 15)
    {
        re = new RegExp(/^(\d{6})(\d{2})(\d{2})(\d{2})(\d{3})$/);
        var arrSplit = num.match(re);
 
        //检查生日日期是否正确
        var dtmBirth = new Date('19' + arrSplit[2] + '/' + arrSplit[3] + '/' + arrSplit[4]);
        var bGoodDay;
        bGoodDay = (dtmBirth.getYear() == Number(arrSplit[2])) && ((dtmBirth.getMonth() + 1) == Number(arrSplit[3])) && (dtmBirth.getDate() == Number(arrSplit[4]));
        if (!bGoodDay)
        {
            var div="出生日期错误！";
                $("#add").val("no");
            	$("#d2").html(div);
            	$("#d2").show();
            return false;
        }
        else
        {
                //将15位身份证转成18位
                //校验位按照ISO 7064:1983.MOD 11-2的规定生成，X可以认为是数字10。
                var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2);
                var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2');
                var nTemp = 0, i;
                num = num.substr(0, 6) + '19' + num.substr(6, num.length - 6);
                for(i = 0; i < 17; i ++)
                {
                    nTemp += num.substr(i, 1) * arrInt[i];
                }
                num += arrCh[nTemp % 11];
                discriCard($(obj).val());
                return true;
        }
    }
    if (len == 18)
    {
        re = new RegExp(/^(\d{6})(\d{4})(\d{2})(\d{2})(\d{3})([0-9]|X)$/);
        var arrSplit = num.match(re);
 
        //检查生日日期是否正确
        var dtmBirth = new Date(arrSplit[2] + "/" + arrSplit[3] + "/" + arrSplit[4]);
        var bGoodDay;
        bGoodDay = (dtmBirth.getFullYear() == Number(arrSplit[2])) && ((dtmBirth.getMonth() + 1) == Number(arrSplit[3])) && (dtmBirth.getDate() == Number(arrSplit[4]));
        if (!bGoodDay)
        {
            var div="出生日期错误！";
                $("#add").val("no");
            	$("#d2").html(div);
            	$("#d2").show();
            return false;
        }
    else
    {
        //检验18位身份证的校验码是否正确。
        //校验位按照ISO 7064:1983.MOD 11-2的规定生成，X可以认为是数字10。
        var valnum;
        var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2);
        var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2');
        var nTemp = 0, i;
        for(i = 0; i < 17; i ++)
        {
            nTemp += num.substr(i, 1) * arrInt[i];
        }
        valnum = arrCh[nTemp % 11];
        if (valnum != num.substr(17, 1))
        {
            var div="校验位错误！";
            $("#d2").html(div);
            $("#d2").show();
            $("#add").val("no");
            return false;
        }
        discriCard($(obj).val());
        return true;
    }
    return false;
        }
            function discriCard(obj){ 
                //获取输入身份证号码 
                 var UUserCard = obj; 
                //获取出生日期 
                 UUserCard.substring(6, 10) + "-" + UUserCard.substring(10, 12) + "-" + UUserCard.substring(12, 14); 
                //获取性别 
                 if (parseInt(UUserCard.substr(16, 1)) % 2 == 1) { 
                 $("input[name='sex']").eq(0).attr("checked","checked");
                //是男则执行代码 ... 
                   } else { 
                 $("input[name='sex']").eq(1).attr("checked","checked");
                //是女则执行代码 ... 
                 } 
              //获取年龄 
                 var myDate = new Date(); 
                 var month = myDate.getMonth() + 1; 
                 var day = myDate.getDate(); 
                 var age = myDate.getFullYear() - UUserCard.substring(6, 10) - 1; 
              if (UUserCard.substring(10, 12) < month || UUserCard.substring(10, 12) == month && UUserCard.substring(12, 14) <= day) { 
                           age++; 
                  } 
                  $("#age").val(age);
                //年龄 age 
                }
     } 
         
     
</script>
</body>
</html>

