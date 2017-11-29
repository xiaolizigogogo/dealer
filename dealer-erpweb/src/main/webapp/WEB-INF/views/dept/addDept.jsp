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
    <script src="${basePath}/js/bootstrap-datetimepicker.min.js"></script>
    <script src="${basePath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="${basePath}/js/datetimepicker.js"></script>
    <script src="${basePath}/js/jquery.validate.js"></script>

</head>
<script language="JavaScript">

    $(document).ready(function () {
        var companyObj = $("#companyId");
        /*动态加载所有公司*/
        $.get("${basePath}/admin/company/queryCompanyList", function (result) {
        	debugger;
            var html = '<option value="0">请选择</option>';
            $(result).each(function (i) {
                html += '<option value="' + result[i].id + '">' + result[i].name + '</option>';
            });
            companyObj.html(html);
 
            // 修改时选中所属公司
            companyObj.find("option[value='" + ${dept.companyId} + "']").attr("selected", true);
            /* 调用获取用户的方法 */
            getUsers(${dept.companyId});
        });

        /*动态加载公司名下所有员工*/
        companyObj.live("change", function () {
            getUsers(this.value);
        });

        var getUsers = function (companyId) {
           if(companyId != null && companyId != ""){
               var principalIdObj = $("#principalId");
               $.get("${basePath}/admin/user/getUserListByCompanyId.html?companyId=" + companyId,
                       function (result) {
                           var html = '<option value="0">请选择</option>';
                           $(result).each(function (i) {
                               html += '<option value="' + result[i].uuid + '">' + result[i].realname +
                                       '</option>';
                           });
                           principalIdObj.html(html);
                           /* 选中部门负责人 */
                           principalIdObj.find('option[value="' + '${dept.principalId}' + '"]').attr("selected", true);
                       });

               /*选中部门负责人后，自动补全电话号码*/
               principalIdObj.live("change", function () {
                   $.get("${basePath}/admin/user/getUserById.html?uuid=" + this.value,function(result){
                       $("#telephone").attr("value", result.mobile);
                   })
               });
           }
        };

        /*手机号码验证*/
        $.validator.addMethod("checkMobile", function (value, element, params) {
            var telephone = $("#telephone");
            var mobileValue = telephone.val();
            if (!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(mobileValue))) {
                telephone.focus();
                return false;
            } else {
                return true;
            }
        }, "<font color='red'>不是完整的11位手机号或者正确的手机号！</font>");
        $("#deptForm").validate({
            errorLaberContainer: "deptError",
            errorElement: "span",
            rules: {
                companyId: {
                    required: true
                },
                name: {
                    required: true
                },
//                principalId: {
//                    required: true
//                },
//                telephone: {
//                    required: true,
//                    digits: true,
//                    checkMobile: true
//                },
                createdAt: {
                    required: true
                }
            },
            messages: {
                companyId: {
                    required: '<font color="red">归属公司不能为空！</font>'
                },
                name: {
                    required: '<font color="red">名称不能为空！</font>'
                },
//                principalId: {
//                    required: '<font color="red">负责人名称不能为空！</font>'
//                },
//                telephone: {
//                    required: '<font color="red">电话号码不能为空！</font>',
//                    digits: '<font color="red">非法输入</font>'
//                },
                createdAt: {
                    required: '<font color="red">创建时间不能为空！</font>'
                }
            },
            submitHandler: function (form) {
           var companyIdObj=$("#companyId").val();
           var principalIdObj=$("#principalId").val();
           
           $("#s1").remove("error");
           $("#s2").remove("error");
               $("#s1").html(null);
               $("#s2").html(null);
               if(companyIdObj=="0"){
               $("#s1").show();
                   $("#s1").addClass("error");
                   var text="分公司不能为空";
                   $("#s1").html(text);
                   //新建部门的过程中，没有必要进行部门负责人选择，因此删除判断
//               }else if(principalIdObj=="0"){
//                   $("#s2").show();
//                   $("#s2").addClass("error");
//                   var text="部门负责人不能为空";
//                   $("#s2").html(text);
               }else{
                //TODO 前端添加数据校验
                /** 数据校验 */
                $.ajax({
                    type: 'POST',
                    url: '${basePath}/admin/dept/saveOrUpdateDept.html',
                    data: $("#deptForm").serializeArray(),
                    dataType: "text",
                    success: function (data) {
                        if (data == '0000') {
                        	alertMessage("操作成功!","submitSuccess()");
                        } else {
                        	alertMessage("操作失败！",null);
                            return false;
                        }
                    }, error: function () {
                    	alertMessage("网络错误！",null);
                        return false;
                    }
                });}
            }
        });
    });
    
    function submitSuccess(){
		setTimeout(function() {
            colsediv(0);
            window.location.href = '${basePath}/admin/dept/toDeptPage.html';
        },
        1500);
    }
</script>
<body>
<div class="col-lg-12">
  <div class="tools_bar ">
    <div class="bar_tit clearfix">
      <h2 class="pull-left">
      		<c:if test="${str=='edit'}">
                	编辑公司部门
            </c:if>
            <c:if test="${str=='add'}">
                	添加公司部门
            </c:if>
      </h2>
      <a href="/admin/dept/deptList.html" class="pull-right btn btn-link"><i class="fa fa-mail-forward"></i> 返回列表</a> </div>
  </div>
  <form action="javascript:;" id="deptForm" method="post" class="form-horizontal">
  	 <input type="text" hidden="hidden" value="${dept.id}" id="id" name="id">
  	 
  	 
  	 
  	 <div class="form-group">
    <label  class="col-sm-2 control-label"><i class="text-danger">*</i>&nbsp;归属公司</label>
    <div class="col-sm-10">
     <select class="form-control" id="companyId" name="companyId">
                                <option value="0">请选择</option>
                            </select>
                            <span id="s1"></span>
    </div>
  </div>
  
  <div class="form-group">
    <label  class="col-sm-2 control-label"><i class="text-danger">*</i>&nbsp;部门名称</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" style=" width:30%;" id="name" name="name"
                                   value="${dept.name}">
    </div>
  </div>
  
   <div class="form-group">
    <label  class="col-sm-2 control-label">部门负责人</label>
    <div class="col-sm-10">
     <select class="form-control" id="principalId" name="principalId">
                                <option value="0">请选择</option>
                            </select><span id="s2"></span>
    </div>
  </div>
  
  <div class="form-group">
    <label  class="col-sm-2 control-label">电话</label>
    <div class="col-sm-10">
     <input type="text" class="form-control" style=" width:30%;" id="telephone" name="telephone"
                                   value="${dept.telephone}" readonly="readonly">
    </div>
  </div>
    <div class="form-group">
    <label  class="col-sm-2 control-label">备注</label>
    <div class="col-sm-10">
      <textarea cols="60" rows="3" class="form-control" id="remark" style=" width:30%;" 
                              name="remark">${dept.remark}</textarea>
    </div>
  </div>
   <div class="form-group">
	    <div class="col-sm-offset-2 col-sm-10">
	   <button type="submit" id="deptAdd" class="btn btn-danger" style="width:100px;">提交</button>
	    </div>
	</div>
   
    
  </form>
</div>
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
			<div class="btn_list clearfix">
				<a class="btn btn-danger btn-sm" href="javascript:void(0)"
					onclick="colsediv(0)">取消</a>
				<a class="btn btn-default btn-sm"
					href="javascript:void(0)" onclick="colsediv(0)" id="ok_button">确定</a>
			</div>
		</div>
	</div>
<div id="fade2" class="black_overlayx"></div>
</body>
</html>
