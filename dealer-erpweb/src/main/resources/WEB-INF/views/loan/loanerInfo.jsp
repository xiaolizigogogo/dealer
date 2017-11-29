<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=edge; chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Cache-Control" content="no-transform">
    <title>e车贷管理系统-借款人基本信息</title>
    <%@include file="../common/taglibs.jsp" %>
    <link rel="stylesheet" href="${basePath}/css/bootstrap-datetimepicker.min.css">
    <script src="${basePath}/js/bootstrap-datetimepicker.min.js"></script>
    <script src="${basePath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="${basePath}/js/datetimepicker.js"></script>
    <script src="${basePath}/js/jquery.validate.js"></script>

</head>
<script type="text/javascript" lang="javascript">
    $(function () {
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
                return true;
            }
        }, "<font color='red'>不是完整的11位手机号或者正确的手机号！</font>");


        $.validator.addMethod("checkSelected", function (value, element, params) {
            return value != '0';
        }, '<font color="red">请选择！</font>');

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
                mobile: {
                    required: true,
                    digits: true,
                    checkMobile: true
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
//                otherIncome: {
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
                remark: {
                    required: true
                },
                creditCardQuota: {
                    required: true
                },
                creditCardNum: {
                    required: true
                }
            },
            messages: {
                customerName: {
                    required: '<font color="red">姓名不能为空！</font>'
                },
                age: {
                    required: '<font color="red">年龄不能为空！</font>',
                    digits: '<font color="red">非法输入，只能输入数字！</font>'
                },
                mobile: {
                    required: '<font color="red">手机号码不能为空!</font>',
                    digits: '<font color="red">非法输入，只能输入数字！</font>'
                },
                idCard: {
                    required: '<font color="red">身份证号码不能为空！</font>'
                },
                education: {
                    required: '<font color="red">学历不能为空！</font>'
                },
                liveNumber: {
                    required: '<font color="red">居住人数不能为空！</font>'
                },
                kosekiAddress: {
                    required: '<font color="red">户籍地址不能为空！</font>'
                },
                liveAddress: {
                    required: '<font color="red">现居住地址不能为空！</font>'
                },
                enterpriseName: {
                    required: '<font color="red">单位全称不能为空！</font>'
                },
                enterpriseIndustry: {
                    required: '<font color="red">所属行业不能为空！</font>'
                },
                enterpriseTel: {
                    required: '<font color="red">单位电话不能为空！</font>'
                },
                enterpriseAddress: {
                    required: '<font color="red">单位地址不能为空！</font>'
                },
                income: {
                    required: '<font color="red">月收入不能为空！</font>'
                },
//                otherIncome: {
//                    required: '<font color="red">其他收入不能为空！</font>'
//                },
                remark: {
                    required: '<font color="red">备注不能为空！</font>'
                },
                creditCardQuota: {
                    required: '<font color="red">信用卡额度不能为空，没有请填写0！</font>'
                },
                creditCardNum: {
                    required: '<font color="red">信用卡张数不能为空，没有请填写0！</font>'
                }
            },
            submitHandler: function (form, event) {
                $.ajax({
                    type: 'POST',
                    url: '${basePath}/admin/customer/saveOrUpdateCustomer.html',
                    data: $("#customerForm").serializeArray(),
                    dataType: "text",
                    success: function (data) {
                        if (data == '0000') {
                            layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
                                if (buttonText == "save") {
                                    return true;
                                } else if (buttonText == "saveAndNext"){
                                    var uuid = $("#uuid").val();
                                    document.location.href = '${basePath}/admin/loan/loaner/next/' +
                                            uuid + ".html";
                                    return true;
                                }
                            });
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
        })
    });

</script>
<body>
<div class="loca-area clearfix">
    <ul class="breadcrumb">
        <li><a class="link-01" href="${basePath}/admin/layout/main.html">主页</a></li>
        <li><a class="link-01" href="${basePath}/admin/loan/loanerList.html">借款人管理</a></li>
        <c:if test="${status eq 'edit'}">
            <li>借款人修改</li>
        </c:if>
        <c:if test="${status != 'edit'}">
            <li>借款人新增</li>
        </c:if>

    </ul>
</div>
<div class="main-con">

    <div class="normal-title clearfix">
        <c:if test="${status eq 'edit'}">
            <h1>借款人修改</h1>
        </c:if>

        <c:if test="${status != 'edit'}">
            <h1>借款人新增</h1>
        </c:if>

    </div>
    <div class="normal-area">
        <form class="form-inline clearfix" action="javascript:;" id="customerForm" method="POST">
            <div class="step">
                <div class="step-item step-active">
                    <div class="step-num">1</div>
                    填写个人资料
                    <div class="step-right"></div>
                </div>
                <div class="step-item">
                    <div class="step-left"></div>
                    <div class="step-num">2</div>
                    添加社会关系
                    <div class="step-right"></div>
                </div>
            </div>
            <div class="title clearfix"><h2>基本信息</h2></div>
            <div class="con clearfix">
                <input type="text" hidden="hidden" name="uuid" value="${uuid}" id="uuid">
                <input type="text" hidden="hidden" name="orderId" value="${orderId}" id="orderId">
                <input type="text" hidden="hidden" name="openId" value="${openId}" id="openId">

                <div class="row">
                    <div class="form-group col-md-3"><strong class="cred">*</strong>
                        <label>姓名：</label>
                        <c:if test="${customerRegisterInfo.customerName eq null or
                        customerRegisterInfo.customerName eq ''}">
                            <input type="text" class="form-control" name="customerName"
                                   value="${name}" size="12">
                        </c:if>
                        <c:if test="${customerRegisterInfo.customerName != null and
                        customerRegisterInfo.customerName != '' }">
                            <input type="text" class="form-control" name="customerName"
                                   value="${customerRegisterInfo.customerName}" size="12">
                        </c:if>
                    </div>
                    <div class="form-group col-md-5"><strong class="cred">*</strong>
                        <label>性别：</label>

                        <div class="radio">
                            <label>
                                <input type="radio" name="sex" value="M" checked>
                                男</label>
                        </div>
                        <div class="radio">
                            <label>
                                <input type="radio" name="sex" value="FM">
                                女</label>
                        </div>
                    </div>
                    <div class="form-group col-md-3"><strong class="cred">*</strong>
                        <label>年龄：</label>
                        <input type="text" class="form-control" name="age"
                               value="${customerRegisterInfo.age}" size="5">
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-3"><strong class="cred">*</strong>
                        <label>手机号码：</label>
                        <c:if test="${customerRegisterInfo.mobile eq null or
                        customerRegisterInfo.mobile eq ''}">
                            <input type="text" class="form-control" name="mobile" id="mobile"
                                   value="${tel}" size="12">
                        </c:if>
                        <c:if test="${customerRegisterInfo.mobile != null and
                        customerRegisterInfo.mobile != ''}">
                            <input type="text" class="form-control" name="mobile" id="mobile"
                                   value="${customerRegisterInfo.mobile}" size="12">
                        </c:if>

                        <span id="mobile_error_tips"
                              class="cred display-none-div">(手机号码已存在)</span><br />
                    </div>
                    <div class="form-group col-md-5"><strong class="cred">*</strong>
                        <label>身份证号码：</label>
                        <c:if test="${customerRegisterInfo.idCard eq null or
                        customerRegisterInfo.idCard eq ''}">
                            <input type="text" class="form-control" size="20" name="idCard"
                                   id="idCard" value="${idCard}">
                        </c:if>
                        <c:if test="${customerRegisterInfo.idCard != null and
                        customerRegisterInfo.idCard != ''}">
                            <input type="text" class="form-control" size="20" name="idCard"
                                   id="idCard" value="${customerRegisterInfo.idCard}">
                        </c:if>

                        <span id="idCard_error_tips" class="cred display-none-div">(身份证号码已存在)</span><br />
                    </div>
                    <div class="form-group col-md-3"><strong class="cred">*</strong>
                        <label>学历:</label>
                        <select class="form-control" name="education">
                            <option value="undergraduate"
                                    <c:if test="${customerRegisterInfo.education eq 'undergraduate' }">selected</c:if>>
                                本科
                            </option>
                            <option value="college"
                                    <c:if test="${customerRegisterInfo.education eq 'college' }">selected</c:if>>
                                大专
                            </option>
                            <option value="doctor"
                                    <c:if test="${customerRegisterInfo.education eq 'doctor' }">selected</c:if>>
                                博士及以上
                            </option>
                            <option value="master"
                                    <c:if test="${customerRegisterInfo.education eq 'master' }">selected</c:if>>
                                硕士
                            </option>
                            <option value="senior"
                                    <c:if test="${customerRegisterInfo.education eq 'senior' }">selected</c:if>>
                                高中及中专
                            </option>
                            <option value="junior"
                                    <c:if test="${customerRegisterInfo.education eq 'junior' }">selected</c:if>>
                                初中及以下
                            </option>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-3"><strong class="cred">*</strong>
                        <label>婚姻状况：</label>
                        <select class="form-control" name="maritalStatus">
                            <option value="WH"
                                    <c:if test="${customerRegisterInfo.maritalStatus eq 'WH' }">selected</c:if>>
                                未婚
                            </option>
                            <option value="YH"
                                    <c:if test="${customerRegisterInfo.maritalStatus eq 'YH' }">selected</c:if>>
                                已婚
                            </option>
                            <option value="LY"
                                    <c:if test="${customerRegisterInfo.maritalStatus eq 'LY' }">selected</c:if>>
                                离异
                            </option>
                            <option value="SR"
                                    <c:if test="${customerRegisterInfo.maritalStatus eq 'SR' }">selected</c:if>>
                                丧偶
                            </option>
                            <option value="ZH"
                                    <c:if test="${customerRegisterInfo.maritalStatus eq 'ZH' }">selected</c:if>>
                                再婚
                            </option>
                        </select>
                    </div>
                    <div class="form-group col-md-5"><strong class="cred">*</strong>
                        <label>住房性质：</label>
                        <select class="form-control" name="house" id="house">
                            <option value="commodity"
                                    <c:if test="${customerRegisterInfo.house eq 'commodity' }">selected</c:if>>
                                商品房无按揭
                            </option>
                            <option value="commodity_mortgage"
                                    <c:if test="${customerRegisterInfo.house eq 'commodity_mortgage' }">selected</c:if>>
                                商品房有按揭
                            </option>
                            <option value="bought_public"
                                    <c:if test="${customerRegisterInfo.house eq 'bought_public' }">selected</c:if>>
                                已购公房
                            </option>
                            <option value="self_build"
                                    <c:if test="${customerRegisterInfo.house eq 'self_build' }">selected</c:if>>
                                自建房
                            </option>
                            <option value="rent"
                                    <c:if test="${customerRegisterInfo.house eq 'rent' }">selected</c:if>>
                                租用
                            </option>
                            <option value="kinsfolk"
                                    <c:if test="${customerRegisterInfo.house eq 'kinsfolk' }">selected</c:if>>
                                亲属住房
                            </option>
	                        <option value="dormitory"
	                                <c:if test="${customerRegisterInfo.house eq 'dormitory' }">selected</c:if>>
		                        单位宿舍
	                        </option>
                        </select>
                    </div>
                    <div class="form-group col-md-4" id="supplement"></div>
                </div>
                <div class="row">
                    <div class="form-group col-md-3"><strong class="cred">*</strong>
                        <label>居住人数：</label>
                        <input type="text" class="form-control" size="5" name="liveNumber"
                               value="${customerRegisterInfo.liveNumber}"
                               onkeyup="this.value=this.value.replace(/[^\d]/g,'')"
                               onpaste="return false">人
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-6"><strong class="cred">*</strong>
                        <label>户籍地址：</label>
                        <input type="text" class="form-control" size="40" name="kosekiAddress"
                               value="${customerRegisterInfo.kosekiAddress}">
                    </div>
                    <div class="form-group col-md-6"><strong class="cred">*</strong>
                        <label>现居地址：</label>
                        <input type="text" class="form-control" size="40" name="liveAddress"
                               value="${customerRegisterInfo.liveAddress}">
                    </div>
                </div>
            </div>

            <div class="title clearfix">
                <h2>工作信息</h2>
            </div>
            <div class="con clearfix">
                <div class="row">
                    <div class="form-group col-md-4"><strong class="cred">*</strong>
                        <label>单位全称：</label>
                        <input type="text" class="form-control" name="enterpriseName"
                               value="${customerAdditionalInfo.enterpriseName}">
                    </div>
                    <div class="form-group col-md-4"><strong class="cred">*</strong>
                        <label>所属行业：</label>
                        <input type="text" class="form-control" name="enterpriseIndustry"
                               value="${customerAdditionalInfo.enterpriseIndustry}">
                    </div>
                    <div class="form-group col-md-4"><strong class="cred">*</strong>
                        <label>单位电话：</label>
                        <input type="text" class="form-control" name="enterpriseTel"
                               value="${customerAdditionalInfo.enterpriseTel}"
                               onkeyup="this.value=this.value.replace(/[^\d]/g,'')"
                               onpaste="return false">
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-4"><strong class="cred">*</strong>
                        <label>单位性质：</label>
                        <select class="form-control" name="enterpriseType" id="enterpriseType">

                            <option value="institutions"
                                    <c:if test="${customerAdditionalInfo.enterpriseType eq 'institutions'}">selected</c:if>>
                                机关事业单位
                            </option>
                            <option value="government"
                                    <c:if test="${customerAdditionalInfo.enterpriseType eq 'government'}">selected</c:if>>
                                国有企业
                            </option>
                            <option value="three_funded"
                                    <c:if test="${customerAdditionalInfo.enterpriseType eq 'three_funded'}">selected</c:if>>
                                三资企业
                            </option>
                            <option value="corporate"
                                    <c:if test="${customerAdditionalInfo.enterpriseType eq 'corporate'}">selected</c:if>>
                                股份制企业
                            </option>
                            <option value="private"
                                    <c:if test="${customerAdditionalInfo.enterpriseType eq 'private'}">selected</c:if>>
                                私营
                            </option>
                            <option value="professional"
                                    <c:if test="${customerAdditionalInfo.enterpriseType eq 'professional'}">selected</c:if>>
                                自由职业者
                            </option>
                            <option value="social_organization"
                                    <c:if test="${customerAdditionalInfo.enterpriseType eq 'social_organization'}">selected</c:if>>
                                社会团体
                            </option>
                            <option value="other"
                                    <c:if test="${customerAdditionalInfo.enterpriseType eq 'other'}">selected</c:if>>
                                其他
                            </option>
                        </select>
                    </div>
                    <%--<div class="form-group col-md-4" id="supplementIncome">--%>

                    <div class="form-group col-md-4"><strong class="cred">*</strong>
                        <label>职务：</label>
                        <select class="form-control" name="position">
                            <option value="chairman"
                                    <c:if test="${customerAdditionalInfo.position eq 'chairman'}">selected</c:if>>
                                董事长
                            </option>
                            <option value="director"
                                    <c:if test="${customerAdditionalInfo.position eq 'director'}">selected</c:if>>
                                董事
                            </option>
                            <option value="manager"
                                    <c:if test="${customerAdditionalInfo.position eq 'manager'}">selected</c:if>>
                                总经理
                            </option>
                            <option value="executives"
                                    <c:if test="${customerAdditionalInfo.position eq 'executives'}">selected</c:if>>
                                单位高管
                            </option>
                            <option value="department_manage"
                                    <c:if test="${customerAdditionalInfo.position eq 'department_manage'}">selected</c:if>>
                                部门主管
                            </option>
                            <option value="clerk"
                                    <c:if test="${customerAdditionalInfo.position eq 'clerk'}">selected</c:if>>
                                普通职员
                            </option>
                            <option value="other"
                                    <c:if test="${customerAdditionalInfo.position eq 'other'}">selected</c:if>>
                                其他
                            </option>
                        </select>
                    </div>
                    <div class="form-group col-md-4">
                        <label>入职时间：</label>

                        <div class="form-group">
                            <div class="input-group date form_date" data-date=""
                                 data-date-format="yyyy-mm-dd"
                                 data-link-field="dateJoined"
                                 data-link-format="yyyy-mm-dd">
                                <input class="form-control" type="text" value="<fmt:formatDate value="${customerAdditionalInfo.dateJoined}"
                                   pattern="yyyy-MM-dd"/>" readonly="readonly">
                                <span class="input-group-addon"><span
                                        class="glyphicon glyphicon-calendar"></span></span>
                            </div>
                            <input type="text" hidden="hidden" id="dateJoined" name="dateJoined" />
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-md-6"><strong class="cred">*</strong>
                        <label>单位地址：</label>
                        <input type="text" class="form-control" size="60"
                               name="enterpriseAddress"
                               value="${customerAdditionalInfo.enterpriseAddress}">
                    </div>
                    <div class="form-group col-md-6" id="supplementIncome">
                </div>
            </div>

            <div class="title clearfix">
                <h2>资产信息</h2>
            </div>
            <div class="con clearfix">
                <div class="row">
                    <div class="form-group col-md-5"><strong class="cred">*</strong>
                        <label>房产：</label>

                        <div class="radio">
                            <label>
                                <input type="radio" name="hasHouse" value="yes" checked>
                                有</label>
                        </div>
                        <div class="radio">
                            <label>
                                <input type="radio" name="hasHouse" value="no">
                                无</label>
                        </div>
                    </div>
                    <div class="form-group col-md-3"><strong class="cred">*</strong>
                        <label>月收入水平：</label>
                        <input type="text" class="form-control" name="income"
                               value="${customerAdditionalInfo.income}"
                               onkeyup="this.value=this.value.replace(/[^\d]/g,'')"
                               onpaste="return false" size="10">元
                    </div>

                    </div>
                <div class="row">
                    <div class="form-group col-md-5">
                        <label>其他收入：</label>
                        <input type="text" class="form-control" name="otherIncome" id="otherIncome"
                               value="${customerAdditionalInfo.otherIncome}"
                               onkeyup="this.value=this.value.replace(/[^\d]/g,'')"
                               onpaste="return false" size="10">元
                    </div>

                    <div class="form-group col-md-5">
                        <label>收入说明：</label>
                        <input type="text" class="form-control" name="incomeStatement" id="incomeStatement"
                               value="${customerAdditionalInfo.incomeStatement}" />
                    </div>

                </div>
                </div>

                <div class="tips-box">如果申请人为私营业主且有营业执照，请补充一下资料：</div>
                <div class="form-group col-md-4">
                    <label>组织形式：</label>
                    <select class="form-control" name="companyType">
                        <option value="no"
                                <c:if test="${customerAdditionalInfo.companyType eq 'no'}">selected </c:if>>
                            请选择
                        </option>
                        <option value="individual_businesses"
                                <c:if test="${customerAdditionalInfo.companyType eq 'individual_businesses'}">selected</c:if>>
                            个体商户
                        </option>
                        <option value="ltd"
                                <c:if test="${customerAdditionalInfo.companyType eq 'ltd'}">selected</c:if>>
                            有限公司
                        </option>
                    </select>
                </div>
                <div class="form-group col-md-6">
                    <label>注册时间：</label>

                    <div class="form-group">
                        <div class="input-group date form_date" data-date=""
                             data-date-format="yyyy-mm-dd"
                             data-link-field="dateJoined"
                             data-link-format="yyyy-mm-dd">
                            <input class="form-control" type="text" value="<fmt:formatDate
                               value="${customerAdditionalInfo.createdAt}" pattern="yyyy-MM-dd"/>"
                                   readonly="readonly">
                                <span class="input-group-addon"><span
                                        class="glyphicon glyphicon-calendar"></span></span>
                        </div>
                        <input type="text" hidden="hidden" id="companyRegisterAt"
                               name="companyRegisterAt" />
                    </div>
                </div>
            </div>

            <div class="title clearfix">
                <h2>其他信息</h2>
            </div>
            <div class="con clearfix">
                <div class="row">
                    <div class="form-group col-md-5">
                        <label><strong class="cred">*</strong>信用卡张数：</label>
                        <input type="text" class="form-control" id="creditCardNum"
                               name="creditCardNum" value="${customerRegisterInfo.creditCardNum}">
                    </div>
                    <div class="form-group col-md-5">
                        <label><strong class="cred">*</strong>信用卡额度：</label>
                        <input type="text" class="form-control" id="creditCardQuota"
                               name="creditCardQuota" value="${customerRegisterInfo.creditCardQuota}">
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-5">
                        <label>信用卡银行名称：</label>
                        <input type="text" class="form-control" id="creditCardBankName"
                               name="creditCardBankName"
                               value="${customerRegisterInfo.creditCardBankName}">
                    </div>
                    <div class="form-group col-md-5">
                        <label>银行信用卡号：</label>
                        <input type="text" class="form-control" id="creditCard" name="creditCard"
                               size="20" value="${customerRegisterInfo.creditCard}">
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-4"><strong class="cred">*</strong>
                        <label>所属分公司：</label>
                        <select class="form-control" id="companyId" name="companyId">
                            <option value="0">请选择</option>
                        </select>
                    </div>
                    <div class="form-group col-md-4"><strong class="cred">*</strong>
                        <label>所属部门：</label>
                        <select class="form-control" id="deptId" name="deptId">
                            <option value="0">请选择</option>
                        </select>
                    </div>
                    <div class="form-group col-md-4"><strong class="cred">*</strong>
                        <label>所属客户经理：</label>
                        <select class="form-control" name="responsibleCmId" id="responsibleCmId">
                            <option value="0">请选择</option>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-12"><strong class="cred">*</strong>
                        <label>备注：</label>
                        <textarea cols="168" rows="3" class="form-control" id="remark"
                                  name="remark">${customerRegisterInfo.remark}</textarea>
                    </div>
                </div>
                <div class="tips-box">其他信息请写入到备注栏中！</div>
            </div>
            <div class="btn-area">
                <c:if test="${status eq 'edit'}">
                    <button type="submit" class="btn btn-01" name="save">保存</button>
                </c:if>
                <button type="submit" class="btn btn-01" name="saveAndNext">保存下一步</button><a
                    href="${basePath}/admin/loan/loanerList.html" class="btn btn-link">返回列表</a>
            </div>
        </form>
    </div>
</div>

<script>
    $(function () {

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
                    } else {
                        var errorObj = $("#" + paramName + "_error_tips");
                        errorObj.removeClass("display-none-div");
                        errorObj.addClass("display-inline-div");
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
            var param = {"mobile": mobileVal};
            var paramName = "mobile";
            verifyUniqueness(mobileObj, param, paramName);
        });

        idCardObj.blur(function () {
            var idCardVal = idCardObj.val();
            var param = {"idCard": idCardVal};
            var paramName = "idCard";
            verifyUniqueness(idCardObj, param, paramName);
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
</script>
</body>
</html>

