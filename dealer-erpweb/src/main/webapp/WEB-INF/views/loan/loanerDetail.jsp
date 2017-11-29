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
    <script src="${basePath}/js/bootstrap-datetimepicker.min.js"></script>
    <script src="${basePath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="${basePath}/js/datetimepicker.js"></script>
    <script src="${basePath}/js/jquery.validate.js"></script>
    <script>

        $(function () {
            /**编辑页面显示月供*/
            if (${customerRegisterInfo.house eq 'commodity_mortgage' }) {
                var supplementObj = $("#supplement");
                supplementObj.html("<label>月供：</label>${customerRegisterInfo.rental}");
            }

            /**编辑页面显示月租金*/
            if (${customerRegisterInfo.house eq 'rent' }) {
                var supplementObj = $("#supplement");
                supplementObj.html("<label>月租金：</label>${customerRegisterInfo.rental}");
            }

            /**编辑页面显示占股比例*/
            if (${customerAdditionalInfo.enterpriseType=='private'}) {
                var supplementIncomeObj = $("#supplementIncome");
                supplementIncomeObj.html("<strong class='cred'>*</strong><label>占股比例：</label>${customerAdditionalInfo.ratio}%");
            }
        })
        function back() {
            window.history.back();
        }
    </script>
</head>

<body>
<div class="loca-area clearfix">
    <ul class="breadcrumb">
        <li><a href="#">主页</a></li>
        <li><a href="${basePath}/admin/loan/loanerList.html">借款人管理</a></li>
        <li>借款人详情</li>
    </ul>
</div>
<div class="main-con">

    <div class="normal-title clearfix">
        <h1>借款人详情</h1>
    </div>
    <div class="normal-area">
        <form class="form-inline clearfix" action="javascript:;" id="customerForm" method="POST">
            <div class="title clearfix"><h2>基本信息 <input type="button" value="返回上一步" onclick="back()"
                                                        class="btn btn-link" /></h2></div>
            <div class="con clearfix">
                <input type="text" hidden="hidden" name="uuid" value="${uuid}" id="uuid">

                <div class="row">
                    <div class="form-group col-md-4">
                        <label>姓名：</label>${customerRegisterInfo.customerName}
                    </div>
                    <div class="form-group col-md-4">
                        <label>性别：</label>
                        <label><c:if test="${customerRegisterInfo.sex eq 'M'}">男</c:if>
                            <c:if test="${customerRegisterInfo.sex eq 'FM'}">女</c:if></label>
                    </div>
                    <div class="form-group col-md-4">
                        <label>年龄：</label>${customerRegisterInfo.age}
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-4">
                        <label>手机号码：</label>${customerRegisterInfo.mobile}
                    </div>
                    <div class="form-group col-md-4">
                        <label>身份证号码：</label>${customerRegisterInfo.idCard}
                    </div>
                    <div class="form-group col-md-4">
                        <label>学历:</label>
                        <c:if test="${customerRegisterInfo.education eq 'undergraduate' }">本科</c:if>
                        <c:if test="${customerRegisterInfo.education eq 'college' }"> 大专</c:if>
                        <c:if test="${customerRegisterInfo.education eq 'doctor' }">博士及以上</c:if>
                        <c:if test="${customerRegisterInfo.education eq 'master' }">硕士</c:if>
                        <c:if test="${customerRegisterInfo.education eq 'senior' }">高中及中专</c:if>
                        <c:if test="${customerRegisterInfo.education eq 'junior' }">初中及以下</c:if>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-4">
                        <label>婚姻状况：</label>
                        <c:if test="${customerRegisterInfo.maritalStatus eq 'WH' }">未婚</c:if>
                        <c:if test="${customerRegisterInfo.maritalStatus eq 'YH' }">已婚</c:if>
                        <c:if test="${customerRegisterInfo.maritalStatus eq 'LY' }">离异</c:if>
                        <c:if test="${customerRegisterInfo.maritalStatus eq 'SR' }">丧偶</c:if>
                        <c:if test="${customerRegisterInfo.maritalStatus eq 'ZH' }">再婚</c:if>
                    </div>
                    <div class="form-group col-md-4">
                        <label>住房性质：</label>
                        <c:if test="${customerRegisterInfo.house eq 'commodity' }">商品房无按揭</c:if>
                        <c:if test="${customerRegisterInfo.house eq 'commodity_mortgage' }">商品房有按揭</c:if>
                        <c:if test="${customerRegisterInfo.house eq 'bought_public' }">已购公房</c:if>
                        <c:if test="${customerRegisterInfo.house eq 'self_build' }">自建房</c:if>
                        <c:if test="${customerRegisterInfo.house eq 'rent' }">租用</c:if>
                        <c:if test="${customerRegisterInfo.house eq 'kinsfolk' }">亲属住房</c:if>
                    </div>
                    <div class="form-group col-md-4" id="supplement"></div>

                </div>
                <div class="row">
                    <div class="form-group col-md-4">
                        <label>居住人数：</label>${customerRegisterInfo.liveNumber}
                    </div>
                    <div class="form-group col-md-4">
                        <label>户籍地址：</label>${customerRegisterInfo.kosekiAddress}
                    </div>
                    <div class="form-group col-md-4">
                        <label>现居地址：</label>${customerRegisterInfo.liveAddress}
                    </div>
                </div>
            </div>

            <div class="title clearfix">
                <h2>工作信息</h2>
            </div>
            <div class="con clearfix">
                <div class="row">
                    <div class="form-group col-md-4">
                        <label>单位全称：</label>${customerAdditionalInfo.enterpriseName}
                    </div>
                    <div class="form-group col-md-4">
                        <label>所属行业：</label>${customerAdditionalInfo.enterpriseIndustry}
                    </div>
                    <div class="form-group col-md-4">
                        <label>单位电话：</label>${customerAdditionalInfo.enterpriseTel}
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-4">
                        <label>单位性质：</label>
                        <c:if test="${customerAdditionalInfo.enterpriseType eq 'institutions'}">机关事业单位</c:if>
                        <c:if test="${customerAdditionalInfo.enterpriseType eq 'government'}">国有企业</c:if>
                        <c:if test="${customerAdditionalInfo.enterpriseType eq 'three_funded'}">三资企业</c:if>
                        <c:if test="${customerAdditionalInfo.enterpriseType eq 'corporate'}">股份制企业</c:if>
                        <c:if test="${customerAdditionalInfo.enterpriseType eq 'private'}">私营</c:if>
                        <c:if test="${customerAdditionalInfo.enterpriseType eq 'professional'}">自由职业者</c:if>
                        <c:if test="${customerAdditionalInfo.enterpriseType eq 'social_organization'}">社会团体</c:if>
                        <c:if test="${customerAdditionalInfo.enterpriseType eq 'other'}">其他</c:if>
                    </div>
                    <div class="form-group col-md-4">
                        <label>职务：</label>
                        <c:if test="${customerAdditionalInfo.position eq 'chairman'}">董事长</c:if>
                        <c:if test="${customerAdditionalInfo.position eq 'director'}">董事</c:if>
                        <c:if test="${customerAdditionalInfo.position eq 'manager'}">总经理</c:if>
                        <c:if test="${customerAdditionalInfo.position eq 'executives'}">单位高管</c:if>
                        <c:if test="${customerAdditionalInfo.position eq 'department_manage'}">部门主管</c:if>
                        <c:if test="${customerAdditionalInfo.position eq 'clerk'}">普通职员</c:if>
                    </div>
                    <div class="form-group col-md-4">
                        <label>入职时间：</label><fmt:formatDate
                            value="${customerAdditionalInfo.dateJoined}"
                            pattern="yyyy-MM-dd" />
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-4">
                        <label>单位地址：</label>${customerAdditionalInfo.enterpriseAddress}
                    </div>
                    <div class="form-group col-md-4" id="supplementIncome">
                    </div>
                </div>

                <div class="title clearfix">
                    <h2>资产信息</h2>
                </div>
                <div class="con clearfix">
                    <div class="row">
                        <div class="form-group col-md-4">
                            <label>房产：</label>
                            <label><c:if test="${customerAdditionalInfo.hasHouse}">有</c:if>
                                <c:if test="${!customerAdditionalInfo.hasHouse}">无</c:if></label>
                        </div>
                        <div class="form-group col-md-4">
                            <label>月收入水平：</label>${customerAdditionalInfo.income}
                        </div>
                    </div>

                    <div class="row">

                        <div class="form-group col-md-4">
                            <label>其他收入：</label>${customerAdditionalInfo.otherIncome}
                        </div>
                        <div class="form-group col-md-4">
                            <label>收入说明：</label>${customerAdditionalInfo.incomeStatement}
                        </div>
                    </div>
                    <div class="tips-box"><strong class="cred">*</strong>如果申请人为私营业主且有营业执照，请补充一下资料：
                    </div>
                    <div class="form-group col-md-4">
                        <label>组织形式：</label>
                        <c:if test="${customerAdditionalInfo.companyType eq 'no'}">无</c:if>
                        <c:if test="${customerAdditionalInfo.companyType eq 'individual_businesses'}">个体商户</c:if>
                        <c:if test="${customerAdditionalInfo.companyType eq 'ltd'}"> 有限公司</c:if>
                    </div>
                    <div class="form-group col-md-6">
                        <label>注册时间：</label><fmt:formatDate
                            value="${customerAdditionalInfo.createdAt}"
                            pattern="yyyy-MM-dd" />
                    </div>
                </div>

                <div class="title clearfix">
                    <h2>其他信息</h2>
                </div>
                <div class="con clearfix">
                    <div class="row">
                        <div class="form-group col-md-5">
                            <label>信用卡张数：</label>
                            <label>${customerRegisterInfo.creditCardNum}</label>
                        </div>
                        <div class="form-group col-md-5">
                            <label>信用卡额度：</label>
                            <label>${customerRegisterInfo.creditCardQuota}</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-5">
                            <label>信用卡银行名称：</label>
                            <label>${customerRegisterInfo.creditCardBankName}</label>
                        </div>
                        <div class="form-group col-md-5">
                            <label>银行信用卡号：</label>
                            <label>${customerRegisterInfo.creditCard}</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-4">
                            <label>所属分公司：</label>
                            <label>${customerRegisterInfo.company.name}</label>
                        </div>
                        <div class="form-group col-md-4">
                            <label>所属部门：</label>
                            <label>${customerRegisterInfo.dept.name}</label>
                        </div>
                        <div class="form-group col-md-4">
                            <label>所属客户经理：</label>
                            <label>${customerRegisterInfo.user.realname}</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12">
                            <label>备注：</label>
                        <textarea cols="168" rows="3" class="form-control" id="remark"
                                  name="remark"
                                  readonly="readonly">${customerRegisterInfo.remark}</textarea>
                        </div>
                    </div>
                    <div class="tips-box">其他信息请写入到备注栏中！</div>
                </div>

                <div class="title clearfix">
                    <h2>联系人信息</h2>
                </div>
                <div class="con clearfix">
                    <input type="text" hidden="hidden" value="${map.uuid}" name="customerId"
                           id="customerId">

                    <div class="row">
                        <input type="hidden" id="spouse_id" />

                        <div class="form-group col-md-4">
                            <label>配偶姓名：</label>
                            <input type="text" class="form-control" readonly="readonly"
                                   id="spouse_name">
                        </div>
                        <div class="form-group col-md-4">
                            <label>单位电话：</label>
                            <input type="text" class="form-control" id="spouse_tel"
                                   readonly="readonly">
                        </div>
                        <div class="form-group col-md-4">
                            <label>手机号码：</label>
                            <input type="text" class="form-control" id="spouse_mobile"
                                   readonly="readonly">
                        </div>
                    </div>
                    <div class="row">
                        <input type="hidden" id="immediate_id1" />

                        <div class="form-group col-md-4">
                            <label>直系亲属姓名：</label>
                            <input type="text" class="form-control" id="immediate_name1"
                                   readonly="readonly">
                        </div>
                        <div class="form-group col-md-4">
                            <label>关系：</label>
                            <input type="text" class="form-control" id="immediate_relation1"
                                   readonly="readonly">
                        </div>
                        <div class="form-group col-md-4">
                            <label>手机号码：</label>
                            <input type="text" class="form-control" id="immediate_Mobile1"
                                   readonly="readonly">
                        </div>
                    </div>
                    <div class="row">
                        <input type="hidden" id="immediate_id2" />

                        <div class="form-group col-md-4">
                            <label>直系亲属姓名：</label>
                            <input type="text" class="form-control" id="immediate_name2"
                                   readonly="readonly">
                        </div>
                        <div class="form-group col-md-4">
                            <label>关系：</label>
                            <input type="text" class="form-control" id="immediate_relation2"
                                   readonly="readonly">
                        </div>
                        <div class="form-group col-md-4">
                            <label>手机号码：</label>
                            <input type="text" class="form-control" id="immediate_Mobile2"
                                   readonly="readonly">
                        </div>
                    </div>
                    <div class="row">
                        <input type="hidden" id="other_id1" />

                        <div class="form-group col-md-4">
                            <label>其他联系人姓名：</label>
                            <input type="text" class="form-control" id="other_name1"
                                   readonly="readonly">
                        </div>
                        <div class="form-group col-md-4">
                            <label>关系：</label>
                            <input type="text" class="form-control" id="other_relation1"
                                   readonly="readonly">
                        </div>
                        <div class="form-group col-md-4">
                            <label>手机号码：</label>
                            <input type="text" class="form-control" id="other_mobile1"
                                   readonly="readonly">
                        </div>
                    </div>
                    <div class="row">
                        <input type="hidden" id="other_id2" />

                        <div class="form-group col-md-4">
                            <label>其他联系人姓名：</label>
                            <input type="text" class="form-control" id="other_name2"
                                   readonly="readonly">
                        </div>
                        <div class="form-group col-md-4">
                            <label>关系：</label>
                            <input type="text" class="form-control" id="other_relation2"
                                   readonly="readonly">
                        </div>
                        <div class="form-group col-md-4">
                            <label>手机号码：</label>
                            <input type="text" class="form-control" id="other_mobile2"
                                   readonly="readonly">
                        </div>
                    </div>
                    <div class="tips-box"></div>
                </div>

                <div class="btn-area">
                    <a href="${basePath}/admin/loan/loanerList.html" class="btn btn-link">返回列表</a>
                </div>
        </form>
    </div>
</div>

<script>
    $(function () {
        $.get("${basePath}/admin/customer/queryContactsCusId.html?uuid=${uuid}", function (result) {
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

</script>
</body>
</html>

