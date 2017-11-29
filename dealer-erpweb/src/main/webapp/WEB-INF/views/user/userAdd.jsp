<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=edge; chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Cache-Control" content="no-transform">
    <title>e车贷管理系统—添加用户</title>
    <link rel="stylesheet" href="${basePath}/css/bootstrap-datetimepicker.min.css">
    <%@include file="../common/taglibs.jsp" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    <script src="${basePath}/js/bootstrap-datetimepicker.min.js"></script>
    <script src="${basePath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="${basePath}/js/datetimepicker.js"></script>
    <script src="${basePath}/js/jquery.validate.js"></script>

    <link rel="stylesheet" href="${basePath}/js/completer/completer.min.css" />
    <script type="text/javascript" src="${basePath}/js/completer/completer.min.js"></script>
    <script type="text/javascript" src="${basePath}/js/distpicker/distpicker.data.js"></script>
    <script type="text/javascript" src="${basePath}/js/distpicker/distpicker.js"></script>

</head>
<script language="JavaScript">

    $(document).ready(function () {
        //判断是进行修改还是进行新增用户
        var isModify = -1;
        if($("#idCard").val() != ""){
            isModify = 1;
        }
        //身份证号不允许进行修改
        if(isModify == 1){
            $("#idCard").attr("readonly","true");
        }
        if(isModify == -1){
            $("#resetdiv").hide();
        }
        //取得数据权限
        $("#dataAccessLevel").val("${user.dataAccessLevel}");
        //获取登录昵称、设置数据访问权限
        queryDataAccessLevel();
        var companyIdObj = $("#companyId");
        $.get("${basePath}/admin/company/queryCompanyList.html", function (result) {

            var html = '';
            $(result).each(function (i) {
                html += '<option value="' + result[i].id + '">' + result[i].name + '</option>';
            });
            companyIdObj.append(html);
            /*修改时选中所属公司*/
            companyIdObj.find("option[value='" + "${user.companyId}" +"']").attr("selected", true);

            /*获取部门的方法*/
            getDept("${user.companyId}");
        });

        /*动态加载公司部门*/
        companyIdObj.live("change", function () {
            getDept(this.value);
        });

        /*异步加载公司下的部门*/
        var getDept = function (companyId) {
            var deptIdObj = $("#deptId");
            $.get("${basePath}/admin/dept/queryDeptComById?companyId=" + companyId, function (result) {
                var html = '<option value="0">请选择</option>';
                $(result).each(function (i) {
                    html += '<option value="' + result[i].id + '">' + result[i].name +
                            '</option>';
                });
                deptIdObj.html(html);

                deptIdObj.find('option[value="' + '${user.deptId}' + '"]').attr("selected", true);
            });
        };
        $("#userManageForm").validate({
            errorLaberContainer: "userError",
            errorElement: "span",
            rules: {
                mobile: {
                    required: true
                },
                companyId: {
                    required: true
                },
                deptId: {
                    required: true
                },
                realname: {
                    required: true
                },
                nickname: {
                    required: true
                },
                position: {
                    required: true
                },
                email: {
                    required: true,
                    email: true
                },
                accountName : {
                    required: true,
                }
            },
            messages: {
                mobile: {
                    required: '<font color="red">手机号码不能为空！</font>',
                },
                companyId: {
                    required: '<font color="red">归属公司不能为空！</font>'
                },
                deptId: {
                    required: '<font color="red">归属部门不能为空！</font>'
                },
                realname: {
                    required: '<font color="red">姓名不能为空！</font>'
                },
                nickname: {
                    required: '<font color="red">昵称不能为空！</font>'
                },
                position: {
                    required: '<font color="red">职位不能为空！</font>'
                },
                email: {
                    required: '<font color="red">邮箱不能为空！</font>',
                    email: '<font color="red">邮箱地址不正确！</font>'
                },
                accountName : {
                    required: '<font color="red">账户名不能为空！</font>'
                }
            },
            submitHandler: function (form) {
                if ($("#companyId").val() == '0') {
                    alertMessage("归属公司不能为空!",null);
                    return false;
                }
                if ($("#deptId").val() == '0') {
                    alertMessage("归属部门不能为空!",null);
                    return false;
                }
                $("#d2").show();
                var state=$("#mobile").val();
                $("#d1").removeClass("error");
                $("#d1").html(null);

                if($("#correct").val()=="no"){
                    $("#d1").addClass("error");
                    $("#d1").html("手机号已被使用！");
                    $("#d1").show();
                }else if($("#modify").val()=="no"){
                    $("#d3").addClass("error");
                    $("#d3").html("邮箱号已被使用！");
                    $("#d3").show();
                }else if($("#repeat").val()=="no"){

                }else if(state.length>0&&state.length<11){
                    $("#d1").addClass("error");
                    $("#d1").html("手机号不能少于11位");
                    $("#d1").show();
                }else {
                    /** 数据校验 */
                    var province = $("[name='province']").val();
                    var city = $("[name='city']").val();
                    var district = $("[name='district']").val();
                    if(province == undefined || city == undefined || district == undefined){
                        layer.msg("请添加服务位置");
                        return false;
                    }
                    $.ajax({
                        type: 'POST',
                        url: '${basePath}/admin/user/saveOrUpdateUserInfo.html',
                        data: $("#userManageForm").serializeArray(),
                        dataType: "text",
                        success: function (data) {
                            if (data == '0000') {
                                prompt();
                                alertMessage("操作成功!","saveOrUpdateUserInfoSuccess()");
                            } else {
                                alertMessage("操作失败!",null);
                                return false;
                            }
                        }, error: function () {
                            alertMessage("网络错误!",null);
                            return false;
                        }
                    });}
            }
        });

        /** 自动补全邮箱 */
        $("#email").completer({
            separator: "@",
            source: ["qq.com", "163.com", "126.com", "gmail.com", "yahoo.com", "hotmail.com", "outlook.com", "live.com", "aol.com", "mail.com"],
            position: "right"
        });

        function verifyUniqueness(promptId, param, paramName,div) {
            $.ajax({
                type: 'GET',
                url: '${basePath}/admin/user/verifyIdCard.html',
                data: param,
                dataType: "text",
                success: function (data) {
                    var id =$("#" + paramName);
                    promptId.val(null);
                    id.html(null);
                    id.removeClass("error");
                    if (data == '0000') {
                        id.hide();
                    } else {
                        promptId.val("no");
                        id.addClass("error");
                        id.html(div);
                        id.show();
                        return false ;
                    }
                }, error: function () {
                    alertMessage("网络错误!",null);
                    return false;
                }
            })
        }

        var idCardObj = $("#idCard");
        var mobileObj = $("#mobile");
        var emailObj = $("#email");
        mobileObj.change(function () {
            var mobileVal = mobileObj.val();
            var param = {"mobile": mobileVal};
            var paramName = "d1";
            var div= "手机号已被使用！";
            var promptId =  $("#correct");
            verifyUniqueness(promptId, param, paramName,div);
        });
        emailObj.change(function () {
            var emailVal = emailObj.val();
            var param = {"email": emailVal};
            var paramName = "d3";
            var div= "邮箱号已被使用！";
            var promptId =  $("#modify");
            verifyUniqueness(promptId, param, paramName,div);
        });
        idCardObj.change(function () {
            var idCardVal = idCardObj.val();
            var param = {"idCard": idCardVal};
            var paramName = "d2";
            var div = "身份证号已被使用！";
            var promptId =  $("#repeat");
            IdentityCodeValid(this);
            var state=$("#repeat").val();
            if((state=="yes")&&(isModify == -1)){
                verifyUniqueness(promptId, param, paramName,div);
            }
        });

        mobileObj.focus(function () {
            var errorObj = $("#d1");
            errorObj.removeClass("display-inline-div");
            errorObj.addClass("display-none-div");
        });

        idCardObj.focus(function () {
            var errorObj = $("#d2");
            errorObj.removeClass("display-inline-div");
            errorObj.addClass("display-none-div");
        });

        $("#accountName").blur(function(){
            var name = $(this).val();
            $.ajax({
                type : "post",
                url : "${basePath}/admin/company/queryAccountNameExist",
                dataType : "json",
                data : {"accountName" : name},
                success:function(data){
                    if(data == true){
                        layer.msg("账户名已存在");
                    }
                },error : function(){
                    layer.msg("系统错误！");
                    return  false;
                }
            });
        });
    });

    function back() {
        window.history.back();
    }

    function saveOrUpdateUserInfoSuccess(){
        window.location.href = '${basePath}/admin/user/userList.jsp';
    }

    function prompt(){
        //opendiv('qs_box');
        setTimeout(function() {
                    colsediv(0);
                    saveOrUpdateUserInfoSuccess();
                },
                1500);
    }
    /*身份证号校验*/
    function IdentityCodeValid(obj) {
        $("#repeat").val("yes");
        $("#d2").html(null);
        num = $(obj).val().toUpperCase();
        //身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X。
        if (!(/(^\d{15}$)|(^\d{17}([0-9]|X)$)/.test(num)))
        {
            var div="身份证号格式错误！";
            $("#repeat").val("no");
            $("#d2").addClass("error");
            $("#d2").html(div);
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
                $("#repeat").val("no");
                $("#d2").addClass("error");
                $("#d2").html(div);
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
                $("#repeat").val("no");
                $("#d2").addClass("error");
                $("#d2").html(div);
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
                    $("#repeat").val("no");
                    $("#d2").addClass("error");
                    $("#d2").html(div);
                    return false;
                }
                return true;
            }
            return false;
        }
    }
    function queryDataAccessLevel(){
        $.ajax({
            url:"/admin/loan/queryname",
            type:"get",
            datatype:"json",
            success:function(data){
                $.ajax({
                    type : "post",
                    url : "${basePath}/admin/company/queryCompanyDataAccessLevel.html",
                    dataType : "json",
                    data : {"uuid" : data.uuid},
                    success:function(data){
                        if(data[0].id !=null && data[0].parentId != 0){
                            $('#dataAccessLevel option[value="4"]').hide();
                        }else{
                            $('#dataAccessLevel option[value="4"]').show();
                        }
                    },error : function(){
                        layer.msg("系统错误！");
                        return  false;
                    }
                });
            }});
    };
</script>
<body>
<input type="hidden" value=""  id="repeat">
<input type="hidden" value=""  id="correct">
<input type="hidden" value=""  id="modify">
<div class="col-lg-12">
    <div class="tools_bar ">
        <div class="bar_tit clearfix">
            <h2 class="pull-left">
                <c:if test="${user == null}">
                    新增用户
                </c:if>
                <c:if test="${user != null}">
                    修改用户
                </c:if>
            </h2>
            <a href="javascript:history.back()" class="pull-right btn btn-link"><i class="fa fa-mail-forward"></i> 返回列表</a> </div>
    </div>
    <form action="javascript:;" id="userManageForm"  class="form-horizontal" method="post" style="margin-top:20px;">
        <input type="text" hidden="hidden" value="${user.id}" id="id" name="id">
        <input type="text" hidden="hidden" value="${user.uuid}" id="uuid" name="uuid">
        <div class="form-group">
            <label for="accountName" class="col-sm-2 control-label"><i class="text-danger">*</i> 账户</label>
            <div class="col-sm-5">
                <input type="text" class="form-control" id="accountName" name="accountName" value="${user.accountName}" onkeyup='this.value=this.value.replace(/\D/gi,"")'>
            </div>
        </div>
        <div class="form-group">
            <label for="mobile" class="col-sm-2 control-label"> <i class="text-danger">*</i> 手机号码</label>
            <div class="col-sm-5">

                <input type="text" class="form-control" id="mobile" name="mobile" maxlength="11"
                       onkeyup='this.value=this.value.replace(/\D/gi,"")'
                       value="${user.mobile}">
                <span id="d1"></span>
            </div>
        </div>
        <div class="form-group">
            <label for="companyId" class="col-sm-2 control-label"><i class="text-danger">*</i>&nbsp;归属公司</label>
            <div class="col-sm-10">
                <select class="form-control" id="companyId" name="companyId">
                    <option value="0">请选择</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="deptId" class="col-sm-2 control-label"><i class="text-danger">*</i>&nbsp;归属部门</label>
            <div class="col-sm-10">
                <select class="form-control" id="deptId" name="deptId">
                    <option value="0">请选择</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="dataAccessLevel" class="col-sm-2 control-label"><i class="text-danger">*</i>&nbsp;数据访问权限</label>
            <div class="col-sm-10">
                <select class="form-control" id="dataAccessLevel" name="dataAccessLevel">
                    <option value="0">无数据访问权限</option>
                    <option value="1">本人业务数据</option>
                    <option value="2">团队业务数据</option>
                    <option value="3">分公司业务数据</option>
                    <option value="4">集团公司业务数据</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="realname" class="col-sm-2 control-label"><i class="text-danger">*</i> 姓名</label>
            <div class="col-sm-5">
                <input type="text" class="form-control" id="realname" name="realname" maxlength="6"
                       value="${user.realname}">
            </div>
        </div>
        <div class="form-group">
            <label for="nickname" class="col-sm-2 control-label"><i class="text-danger">*</i> 昵称</label>
            <div class="col-sm-5">
                <input type="text" class="form-control" id="nickname" name="nickname" maxlength="6"
                       value="${user.nickname}">
            </div>
        </div>
        <div class="form-group">
            <label for="position" class="col-sm-2 control-label"><i class="text-danger">*</i> 职位</label>
            <div class="col-sm-5">
                <input type="text" class="form-control" id="position" name="position" maxlength="10"
                       value="${user.position}">
            </div>
        </div>
        <div class="form-group">
            <label for="idCard" class="col-sm-2 control-label"><i class="text-danger">*</i> 身份证号</label>
            <div class="col-sm-5">
                <input type="text" class="form-control" size="40" id="idCard"   maxlength="20"
                       name="idCard"
                       value="${user.idCard}">
                <span id="d2"></span>
            </div>
        </div>
        <div class="form-group">
            <label for="email" class="col-sm-2 control-label"><i class="text-danger">*</i> Email</label>
            <div class="col-sm-5">
                <input type="text" class="form-control" id="email" name="email"  maxlength="30"
                       value="${user.email}">
                <span id="d3"></span>
            </div>
        </div>
        <div class="form-group">
            <label for="dateJoined" class="col-sm-2 control-label"> 入职时间</label>
            <div class="col-sm-5">
                <div class="input-group date form_date" data-date=""
                     data-date-format="yyyy-mm-dd"
                     data-link-field="dateJoined"
                     data-link-format="yyyy-mm-dd" style="width:200px;">
                    <input class="form-control" type="text"
                           value="<fmt:formatDate value="${user.dateJoined}" pattern="yyyy-MM-dd"/>" >
                    <span class="input-group-addon"><span
                            class="glyphicon glyphicon-calendar"></span></span>
                </div>
                <input type="text" hidden="hidden" id="dateJoined" name="dateJoined"
                       value="<fmt:formatDate value="${user.dateJoined}" pattern="yyyy-MM-dd"/>"  />
                <span id="repay_end_date_div"
                      style="display:none">(提示:入职时间不能大于当前时间)</span>
            </div>
        </div>

        <div class="form-group" id="province_div">
            <label class="col-sm-2 control-label"><i class="text-danger">*</i> &nbsp;服务位置</label>
            <p class="col-sm-10"> <a class="btn btn-danger btn-xs" id="add_province" onclick="addProvince()" style="margin-top:5px;"><i class="glyphicon glyphicon-plus"></i></a></p>
            <c:forEach items="${userLocate}" var="item">
                <p class="col-sm-10 col-sm-offset-2 clearfix" data-toggle="distpicker">
                    <select class="form-control col-sm-3" data-province="${item.province}" name="province" style="width=240px; margin-right:10px;">
                    </select>
                    <select class="form-control col-sm-3" data-city="${item.city}" name="city" style="width=240px; margin-right:10px;">
                    </select>
                    <select class="form-control col-sm-3" data-district="${item.district}" name="district" style="width=240px; margin-right:10px;">
                    </select>

                </p>
            </c:forEach>
        </div>

        <div class="form-group" id="resetdiv">
            <label for="email" class="col-sm-2 control-label"> 密码</label>
            <div class="col-sm-5">
                <input type="text" class="form-control" id="password" name="password"  maxlength="30" placeholder="若不填则默认为当前密码"/><span class="input-group-btn">
            <input type="button" id="resetPassword" name="resetPassword" class="btn btn-default" value="随机生成6位密码" onclick="resetpw()"/>
            </div>
        </div>
        <div class="form-group">
            <label for="remark" class="col-sm-2 control-label"> 备注</label>
            <div class="col-sm-5">
         <textarea cols="60" rows="3" class="form-control" id="remark"  maxlength="50"
                   name="remark">${user.remark}</textarea>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit"   class="btn btn-danger" id="userAdd" style="width:100px;">提交</button>
            </div>
        </div>
    </form>
</div>
<div class="loading"></div>
<div id="qs_box" class="modal modal_sml fade in">
    <div class="modal-header">
        <a type="button" href="javascript:void(0)" onclick="colsediv(0)"
           class="close"><span aria-hidden="true">&times;</span></a>
        <h4 class="modal-title" id="myModalLabel" style="font-size: 16px;">提示</h4>
    </div>
    <div class="modal-body">
        <p class="p_tip">
            <i class="fa fa-check-circle"></i>
            <span id="alert_message">
                </span>
        </p>
    </div>
</div>
<div id="fade2" class="black_overlayx"></div>
</body>
<script>
    function resetpw(){
        var Num="";
        for(var i=0;i<6;i++) {
            Num+=Math.floor(Math.random()*10);
        }
        document.getElementById("password").value=Num;
    }

    function addProvince(){
        var newProvince = "";
        newProvince = "<div class='distpicker clearfix'><label class='col-sm-2 control-label'></label><div class='col-sm-10' data-toggle='distpicker'>"
                + "<select data-province='---- 选择省 ----' class='form-control col-sm-3' name='province' style='width=240px; margin-right:10px; margin-top:5px; '></select>"
                + "<select data-city='---- 选择市 ----' class='form-control col-sm-3' name='city' style='width=240px; margin-right:10px;margin-top:5px; '></select>"
                + "<select data-district='---- 选择区 ----' class='form-control col-sm-3' name='district' style='width=240px; margin-right:10px;margin-top:5px; '></select></div></div>";
        $("#province_div").append(newProvince);
        var $distpicker = $('.distpicker');
        $distpicker.distpicker();
    }
</script>
</html>
