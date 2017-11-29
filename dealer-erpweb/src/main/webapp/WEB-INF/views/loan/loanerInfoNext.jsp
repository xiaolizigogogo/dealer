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
</head>
<script>

    $(document).ready(function () {
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

        if ('${customerRegisterInfo.maritalStatus}' == 'YH' ||
                '${customerRegisterInfo.maritalStatus}' == 'ZH') {
            if (spouse_name == null || spouse_name == "") {
                layer.msg("配偶姓名不能为空");
                $("#spouse_name").focus();
                return false;
            }
            if (spouse_tel == null || spouse_tel == "") {
                $("#spouse_tel").attr('value', '0');
            }
            if (spouse_mobile == null || spouse_mobile == "") {
                layer.msg("手机号码不能为空");
                $("#spouse_mobile").focus();
                return false;
            }
        }

        if (immediate_name1 == null || immediate_name1 == "") {
            layer.msg("直系亲属姓名不能为空");
            $("#immediate_name1").focus();
            return false;
        }
        if (immediate_relation1 == null || immediate_relation1 == "") {
            layer.msg("关系不能为空");
            $("#immediate_relation1").focus();
            return false;
        }
        if (immediate_Mobile1 == null || immediate_Mobile1 == "") {
            layer.msg("手机号码不能为空");
            $("#immediate_Mobile1").focus();
            return false;
        }
        if (immediate_name2 == null || immediate_name2 == "") {
            layer.msg("直系亲属姓名不能为空");
            $("#immediate_name2").focus();
            return false;
        }
        if (immediate_relation2 == null || immediate_relation2 == "") {
            layer.msg("关系不能为空");
            $("#immediate_relation2").focus();
            return false;
        }
        if (immediate_Mobile2 == null || immediate_Mobile2 == "") {
            layer.msg("手机号码不能为空");
            $("#immediate_Mobile2").focus();
            return false;
        }
        if (other_name1 == null || other_name1 == "") {
            layer.msg("其他联系人姓名不能为空");
            $("#other_name1").focus();
            return false;
        }
        if (other_relation1 == null || other_relation1 == "") {
            layer.msg("关系不能为空");
            $("#other_relation1").focus();
            return false;
        }
        if (other_mobile1 == null || other_mobile1 == "") {
            layer.msg("手机号码不能为空");
            $("#other_mobile1").focus();
            return false;
        }
        if (other_name2 == null || other_name2 == "") {
            layer.msg("其他联系人姓名不能为空");
            $("#other_name2").focus();
            return false;
        }
        if (other_relation2 == null || other_relation2 == "") {
            layer.msg("关系不能为空");
            $("#other_relation2").focus();
            return false;
        }
        if (other_mobile2 == null || other_mobile2 == "") {
            layer.msg("手机号码不能为空");
            $("#other_mobile2").focus();
            return false;
        }

        $.ajax({
            type: 'GET',
            url: '${basePath}/admin/customer/saveOrUpdateCustomerContacts.html',
            data: param(),
            dataType: "text",
            success: function (data) {
                if (data == '0000') {
                    layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
                        document.location.href = '${basePath}/admin/loan/loanerList.html';
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


    function back() {
        window.history.back();
    }


</script>
<body>
<div class="loca-area clearfix">
    <ul class="breadcrumb">
        <li><a href="###">主页</a></li>
        <li><a href="${basePath}/admin/loan/loanerList.html">借款人管理</a></li>
        <li>借款人添加</li>
    </ul>
</div>
<div class="main-con">

    <div class="normal-title clearfix">
        <h1>借款人添加</h1>
    </div>
    <div class="normal-area">
        <form class="form-inline clearfix" action="javascript:;" id="customerForm" method="POST">
            <div class="step">
                <div class="step-item">
                    <div class="step-num">1</div>
                    填写个人资料
                    <div class="step-right"></div>
                </div>
                <div class="step-item step-active">
                    <div class="step-left"></div>
                    <div class="step-num">2</div>
                    添加社会关系
                    <div class="step-right"></div>
                </div>
            </div>
            <div class="title clearfix">
                <h2>联系人信息</h2>
            </div>
            <div class="con clearfix">
                <input type="text" hidden="hidden" value="${customerRegisterInfo.uuid}" name="customerId"
                       id="customerId">

                <div class="row">
                    <input type="hidden" id="spouse_id" />

                    <div class="form-group col-md-4">
                        <label>配偶姓名：</label>
                        <input type="text" class="form-control" id="spouse_name">
                    </div>
                    <div class="form-group col-md-4">
                        <label>单位电话：</label>
                        <input type="text" class="form-control" id="spouse_tel">
                    </div>
                    <div class="form-group col-md-4">
                        <label>手机号码：</label>
                        <input type="text" class="form-control" id="spouse_mobile">
                    </div>
                </div>
                <div class="row">
                    <input type="hidden" id="immediate_id1" />

                    <div class="form-group col-md-4"><strong class="cred">*</strong>
                        <label>直系亲属姓名：</label>
                        <input type="text" class="form-control" id="immediate_name1">
                    </div>
                    <div class="form-group col-md-4"><strong class="cred">*</strong>
                        <label>关系：</label>
                        <input type="text" class="form-control" id="immediate_relation1">
                    </div>
                    <div class="form-group col-md-4"><strong class="cred">*</strong>
                        <label>手机号码：</label>
                        <input type="text" class="form-control" id="immediate_Mobile1">
                    </div>
                </div>
                <div class="row">
                    <input type="hidden" id="immediate_id2" />

                    <div class="form-group col-md-4"><strong class="cred">*</strong>
                        <label>直系亲属姓名：</label>
                        <input type="text" class="form-control" id="immediate_name2">
                    </div>
                    <div class="form-group col-md-4"><strong class="cred">*</strong>
                        <label>关系：</label>
                        <input type="text" class="form-control" id="immediate_relation2">
                    </div>
                    <div class="form-group col-md-4"><strong class="cred">*</strong>
                        <label>手机号码：</label>
                        <input type="text" class="form-control" id="immediate_Mobile2">
                    </div>
                </div>
                <div class="row">
                    <input type="hidden" id="other_id1" />

                    <div class="form-group col-md-4"><strong class="cred">*</strong>
                        <label>其他联系人姓名：</label>
                        <input type="text" class="form-control" id="other_name1">
                    </div>
                    <div class="form-group col-md-4"><strong class="cred">*</strong>
                        <label>关系：</label>
                        <input type="text" class="form-control" id="other_relation1">
                    </div>
                    <div class="form-group col-md-4"><strong class="cred">*</strong>
                        <label>手机号码：</label>
                        <input type="text" class="form-control" id="other_mobile1">
                    </div>
                </div>
                <div class="row">
                    <input type="hidden" id="other_id2" />

                    <div class="form-group col-md-4"><strong class="cred">*</strong>
                        <label>其他联系人姓名：</label>
                        <input type="text" class="form-control" id="other_name2">
                    </div>
                    <div class="form-group col-md-4"><strong class="cred">*</strong>
                        <label>关系：</label>
                        <input type="text" class="form-control" id="other_relation2">
                    </div>
                    <div class="form-group col-md-4"><strong class="cred">*</strong>
                        <label>手机号码：</label>
                        <input type="text" class="form-control" id="other_mobile2">
                    </div>
                </div>
                <div class="tips-box"></div>
            </div>
            <div class="btn-area">
                <input type="button" value="返回上一步" onclick="back()" class="btn btn-01" />
                <input type="submit" class="btn btn-01" onclick="saveOrUpdateCustomerContacts();"
                       value="提 交"><a href="${basePath}/admin/loan/loanerList.html"
                                      class="btn btn-link">返回列表</a>
            </div>
        </form>
    </div>
</div>
</body>
</html>

