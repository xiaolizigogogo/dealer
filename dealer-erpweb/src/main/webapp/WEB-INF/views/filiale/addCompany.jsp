<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=edge; chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Cache-Control" content="no-transform">
    <title>e车贷管理系统—添加分公司</title>
    <%@include file="../common/taglibs.jsp" %>
    <link rel="stylesheet" href="${basePath}/css/bootstrap-datetimepicker.min.css">
    <%@include file="../common/taglibs.jsp" %>
    <script src="${basePath}/js/bootstrap-datetimepicker.min.js"></script>
    <script src="${basePath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="${basePath}/js/jquery.validate.js"></script>
    <script src="${basePath}/js/datetimepicker.js"></script>
</head>
<script language="JavaScript">
  //  function saveOrUpdate() {
  //分公司编辑还是分公司追加。0：追加，1：编辑
     var editoradd = 0;
     $(document).ready(function(){
    	 //去掉逾期比率小数点后边的0
    	 if(("${companyWithBLOBs.overdueRate}") != "" || ("${companyWithBLOBs.repaymentRemindDays}") != "" || ("${companyWithBLOBs.managementCostRate}") != ""){
    		 $("#overdueRate").val(parseFloat("${companyWithBLOBs.overdueRate}"));  
    		 $("#repaymentRemindDays").val(parseInt("${companyWithBLOBs.repaymentRemindDays}"));
    		 $("#managementCostRate").val(parseFloat("${companyWithBLOBs.managementCostRate}"));
    	 }else{
    		 $("#overdueRate").val("");
    		 $("#repaymentRemindDays").val("7");
    		 $("#managementCostRate").val("0");
    	 }  
         //如果是编辑的情况下，公司名不可变
         if($("#name").val()!=""){
             $("#name").attr("readonly",true);
             editoradd = 1;
         }

        $("#companyform").validate({
            errorLabelContainer:"#companyError",
            errorElement:"span",
            rules:{
                name:{
                    required:true
                },
                dialect: {
                    required: true
                },
                principal: {
                    required: true
                },
                overdueRate: {
                    required: true
                },
//                 telephone: {
//                     required: true,
//                     digits:true,
//                     maxlength:11,
//                     minlength:11
//                 },
//                 manageLocation: {
//                     required: true
//                 },
//                 organizationCode: {
//                     required: true
//                 },
//                 pledgeAmount: {
//                     required: true
//                 },
//                 commissionIndex: {
//                     required: true
//                 },
                 managementCostRate: {
                     required: true
                 },
                 repaymentRemindDays: {
                     required: true
                 },
//                 registerAt: {
//                     required: true
//                 },
//                 startServiceDate: {
//                     required: true
//                 },
//                 stopServiceDate: {
//                     required: true
//                 }
                 creditLimit: {
                     required: true
                 },
                 limitPercentage:{
                      required: true
                 },

            },
            messages:{
                name:{
                    required:'<font color="red">分公司名称不能为空！</font>'
                },
                dialect: {
                    required: '<font color="red">公司别名不能为空！</font>'
                },
                principal: {
                    required: '<font color="red">机构负责人不能为空！</font>'
                },
//                 telephone: {
//                     required: '<font color="red">机构联系电话不能为空！</font>',
//                     digits: '<font color="red">非法输入！</font>',
//                     maxlength: '<font color="red">电话号码输入有误！</font>',
//                     minlength: '<font color="red">电话号码输入有误！</font>'
//                 },
//                 manageLocation: {
//                     required: '<font color="red">地址不能为空！</font>'
//                 },
//                 organizationCode: {
//                     required: '<font color="red">机构代码不能为空！</font>'
//                 },
//                 pledgeAccount: {
//                     required: '<font color="red">账户不能为空！</font>'
//                 },
//                 pledgeAmount: {
//                     required: '<font color="red">保证金不能为空！</font>'
//                 },
                 overdueRate: {
                     required: '<font color="red">逾期比率不能为空！</font>'
                 },
//                 commissionIndex: {
//                     required: '<font color="red">指标不能为空！</font>'
//                 },
                 managementCostRate: {
                     required: '<font color="red">管理费费率不能为空！</font>'
                 },
                 repaymentRemindDays: {
                     required: '<font color="red">提前还款时间提醒不能为空！</font>'
                 },
//                 registerAt: {
//                     required: '<font color="red">注册时间不能为空！</font>'
//                 },
//                 startServiceDate: {
//                     required: '<font color="red">开始服务时候不能为空！</font>'
//                 },
//                 stopServiceDate: {
//                     required: '<font color="red">结束服务时间不能为空！</font>'
//                 }
                 creditLimit: {
                    required: '<font color="red">授信额度不能为空！</font>'
                 },
                 limitPercentage: {
                    required: '<font color="red">提醒额度不能为空！</font>'
                 },

            },

            submitHandler:function(form){
//             var  start=$("#startServiceDate").val();
//             var  stop=$("#stopServiceDate").val();
//             var  registerAt=$("#registerAt").val();
//             var  div="<font color='red'>日期不能为空！</fron>";
//             $("#d1").html(null);
//             $("#d2").html(null);
//             $("#d3").html(null);
//             if(start==null||start==""){
//             $("#d1").html(div);
//             }else if(stop==null||stop==""){
//             $("#d2").html(div);
//             }else if(registerAt==null||registerAt==""){
//             $("#d3").html(div);
//             }else{
                /** 查询公司名称是否唯一 */
                var name = $("#name").val();
                if(editoradd == 0){
                    $.ajax({
                        type: 'POST',
                        url: '${basePath}/admin/company/queryCompayIfExist.html?name='+name,
                        dataType: "text",
                        success: function (data) {
                            if (data == '0000') {
                                $.ajax({
                                    type: 'POST',
                                    url: '${basePath}/admin/company/saveOrUpdateCompany.html',
                                    data: $("#companyform").serializeArray(),
                                    dataType: "text",
                                    success: function (data) {
                                        if (data == '0000') {
                                            alertMessage("操作成功！","submitSuccess()");
                                        } else {
                                            alertMessage("操作失败！",null);
                                            return false;
                                        }
                                    }, error: function () {
                                        alertMessage("网络错误2！",null);
                                        return false;
                                    }
                                });
                            } else {
                                layer.msg("公司名称重复，请修正！！")
                                return false;
                            }
                        }, error: function () {
                            alertMessage("网络错误1！",null);
                            return false;
                        }
                    });
                }else {
                    $.ajax({
                        type: 'POST',
                        url: '${basePath}/admin/company/saveOrUpdateCompany.html',
                        data: $("#companyform").serializeArray(),
                        dataType: "text",
                        success: function (data) {
                            if (data == '0000') {
                                alertMessage("操作成功！","submitSuccess()");
                            } else {
                                alertMessage("操作失败！",null);
                                return false;
                            }
                        }, error: function () {
                            alertMessage("网络错误！",null);
                            return false;
                        }
                    });
                }


//             }
            }

        })
     })
     
     function submitSuccess(){
         window.location.href = '${basePath}/admin/company/toCompanyList.html';
     }
 //   }
</script>
<body>
<div class="col-lg-12">
  <div class="tools_bar ">
    <div class="bar_tit clearfix">
      <h2 class="pull-left">
      	 <c:if test="${str=='edit'}">分公司编辑</c:if>
         <c:if test="${str=='add'}">分公司添加</c:if>
      </h2>
      <a href="/admin/company/toCompanyList.html" class="pull-right btn btn-link"><i class="fa fa-mail-forward"></i> 返回列表</a> </div>
  </div>
  <div class="col-lg-12">
	 
    <form class="form-horizontal" id="companyform" action="javascript:;" method="post">
	    <input type="text" hidden="hidden" value="${companyWithBLOBs.id}" id="id" name="id">
        <input type="text" hidden="hidden" value="${companyWithBLOBs.parentId}" id="parentId" name="parentId">
	     <input type="text" hidden="hidden"
	             value="<fmt:formatDate value="${companyWithBLOBs.createdAt}" pattern="yyyy-MM-dd"/>"
	             id="createdAt" name="createdAt">
    	<div class="form-group">
        	<label class="col-sm-2 control-label"><i class="text-danger">*</i> 分公司名称</label>
            <div class="col-sm-3">
            	<input type="text" class="form-control" id="name" name="name"  maxlength="15"
            	value="${companyWithBLOBs.name}">
            </div>
            <label class="col-sm-2  control-label"><i class="text-danger">*</i>&nbsp;公司别名</label>
            <div class="col-sm-3">
            	<input type="text" class="form-control" id="dialect" name="dialect"  maxlength="8"
            	 value="${companyWithBLOBs.dialect}">
            </div>
        </div>
        <div class="form-group">
        	<label class="col-sm-2 control-label"><i class="text-danger">*</i> 公司负责人</label>
            <div class="col-sm-3">
            	<input type="text" class="form-control" id="principal" name="principal" maxlength="6"
                               value="${companyWithBLOBs.principal}">
            </div>
            <label class="col-sm-2  control-label">联系电话</label>
            <div class="col-sm-3">
            	<input type="text" class="form-control" id="telephone" name="telephone" maxlength="20" onkeyup='this.value=this.value.replace(/\D/gi,"")'
                               value="${companyWithBLOBs.telephone}">
            </div>
        </div>
        <div class="form-group">
        <label class="col-sm-2 control-label">公司地址</label>
            <div class="col-sm-6">
            	 <input type="text" class="form-control" size="40" id="manageLocation" maxlength="25"
                               name="manageLocation" value="${companyWithBLOBs.manageLocation}">
            </div>
       
        </div>
        <div class="form-group">
        	<label class="col-sm-2 control-label">组织机构代码</label>
            <div class="col-sm-3">
            	<input type="text" class="form-control" id="organizationCode" name="organizationCode"  maxlength="100"
                               value="${companyWithBLOBs.organizationCode}">
            </div>
            <label class="col-sm-2  control-label">注册时间</label>
            <div class="col-sm-3">
            	 <div class="input-group date form_date" style="width:200px;" data-date=""
                                 data-date-format="yyyy-mm-dd" data-link-field="registerAt"
                                 data-link-format="yyyy-mm-dd">
                                <input class="form-control" type="text"
                                       value="<fmt:formatDate value="${companyWithBLOBs.registerAt}" pattern="yyyy-MM-dd"/>" readonly>
                                <span class="input-group-addon"><span
                                        class="glyphicon glyphicon-calendar"></span></span>
                            </div>
                            <input type="text" hidden="hidden" id="registerAt"
                                   name="registerAt"
                                   value="<fmt:formatDate value="${companyWithBLOBs.registerAt}" pattern="yyyy-MM-dd"/>"/>
                                   <div id="d3"></div>
            </div>
        </div>
        <div class="form-group">
         <label class="col-sm-2  control-label"> 保证金账号</label>
            <div class="col-sm-3">
            	<input type="text" class="form-control" id="pledgeAccount" onkeyup='this.value=this.value.replace(/\D/gi,"")'  maxlength="20"
                               name="pledgeAccount" value="${companyWithBLOBs.pledgeAccount}">
            </div>
        	<label class="col-sm-2 control-label">保证金</label>
            <div class="col-sm-3">
            <div class="input_group" style="width:300px">
            	<input type="text" class="form-control"  id="pledgeAmount" maxlength="5"
            	               onkeyup="this.value= this.value.match(/\d+(\.\d{0,2})?/) ? this.value.match(/\d+(\.\d{0,2})?/)[0] : ''"
                               name="pledgeAmount" value="${companyWithBLOBs.pledgeAmount}">
                               <span class="danwei">万元</span> </div>
            </div>
        </div>
         <div class="form-group">
         <label class="col-sm-2  control-label"><i class="text-danger">*</i> 逾期比率</label>
            <div class="col-sm-3">
            	<input type="text" class="form-control" id="overdueRate"   maxlength="9"  onkeyup="this.value= this.value.match(/\d+(\.\d{0,2})?/) ? this.value.match(/\d+(\.\d{0,2})?/)[0] : ''"
                               name="overdueRate" value="">
            </div>
        	<label class="col-sm-2 control-label">分公司指标</label>
            <div class="col-sm-3">
            	<input type="text" class="form-control" id="commissionIndex"  maxlength="5"   onkeyup="this.value= this.value.match(/\d+(\.\d{0,2})?/) ? this.value.match(/\d+(\.\d{0,2})?/)[0] : ''"
                               name="commissionIndex" value="${companyWithBLOBs.commissionIndex}">
            </div>

        </div>
        <div class="form-group">
         <label class="col-sm-2  control-label"><i class="text-danger">*</i> 管理费费率</label>
            <div class="col-sm-3">
            	 <input type="text" class="form-control" id="managementCostRate"  maxlength="5"  onkeyup="this.value= this.value.match(/\d+(\.\d{0,2})?/) ? this.value.match(/\d+(\.\d{0,2})?/)[0] : ''"
                               name="managementCostRate" value="">
            </div>
        	<label class="col-sm-2 control-label"><i class="text-danger">*</i> 自动催收提前提醒(默认7天)</label>
            <div class="col-sm-3">
            <div class="input_group" style="width:300px">
            	<input type="text" class="form-control" id="repaymentRemindDays"
                               name="repaymentRemindDays"   maxlength="2" onkeyup="this.value= this.value.match(/\d+(\.\d{0,2})?/) ? this.value.match(/\d+(\.\d{0,2})?/)[0] : ''"
                               value="">
                               <span class="danwei">天</span> </div>
            </div>
			
        </div>
		<c:if test="${creditLimitAndPercentDis eq 'y'}">
			<div class="form-group" id="displayLimit">
				<label class="col-sm-2  control-label"><i class="text-danger">*</i> 授信额度</label>
				<div class="col-sm-3">
					<div class="input_group" style="width:300px">
						<input type="text" class="form-control" id="creditLimit" name="creditLimit"
							maxlength="5" onkeyup="this.value= this.value.match(/\d+(\.\d{0,2})?/) ? this.value.match(/\d+(\.\d{0,2})?/)[0] : ''"
							onpaste="return false" value="${companyWithBLOBs.creditLimit/10000}">
						<span class="danwei">万元</span>
					</div>
				</div>
				<label class="col-sm-2  control-label"><i class="text-danger">*</i> 提醒额度</label>
				<div class="col-sm-3">
					<div class="input_group" style="width:300px">
						<input type="text" class="form-control" id="limitPercentage" name="limitPercentage"
							maxlength="2" onkeyup="this.value= this.value.match(/\d+(\.\d{0,2})?/) ? this.value.match(/\d+(\.\d{0,2})?/)[0] : ''"
							value="${companyWithBLOBs.limitPercentage}">
						<span class="danwei">%</span>
					</div>
				</div>
		</div>
		</c:if>
         <div class="form-group">
         <label class="col-sm-2  control-label">开始服务时间</label>
            <div class="col-sm-3">
            	 <div class="input-group date form_date" style="width:200px;" data-date=""
                                 data-date-format="yyyy-mm-dd"
                                 data-link-field="startServiceDate"
                                 data-link-format="yyyy-mm-dd">
                                <input class="form-control" type="text"
                                       value="<fmt:formatDate value="${companyWithBLOBs.startServiceDate}" pattern="yyyy-MM-dd"/>" readonly>
                                <span class="input-group-addon"><span
                                        class="glyphicon glyphicon-calendar"></span></span>
                            </div>
                            <input type="text" hidden="hidden" id="startServiceDate"
                                   name="startServiceDate" value="<fmt:formatDate value="${companyWithBLOBs.startServiceDate}" pattern="yyyy-MM-dd"/>" />
                       <div id="d1"></div>
            </div>
        	<label class="col-sm-2 control-label">结束服务时间</label>
            <div class="col-sm-3">
            	 <div class="input-group date form_date" style="width:200px;" data-date=""
                                 data-date-format="yyyy-mm-dd"
                                 data-link-field="stopServiceDate"
                                 data-link-format="yyyy-mm-dd">
                                <input class="form-control" type="text"
                                       value="<fmt:formatDate value="${companyWithBLOBs.stopServiceDate}" pattern="yyyy-MM-dd"/>" readonly>
                                <span class="input-group-addon"><span
                                        class="glyphicon glyphicon-calendar"></span></span>
                            </div>
                            <input type="text" hidden="hidden" id="stopServiceDate"
                                   name="stopServiceDate" value="<fmt:formatDate value="${companyWithBLOBs.stopServiceDate}" pattern="yyyy-MM-dd"/>" />
               <div id="d2"></div>
            </div>
           
        </div>
        <div class="form-group">
         <label class="col-sm-2  control-label">描述</label>
            <div class="col-sm-6">
            	<textarea cols="60" rows="3" class="form-control" id="description"   maxlength="50"
                                  name="description">${companyWithBLOBs.description}</textarea>
            </div>
        
        </div>
         <div class="form-group">
        	
        	<label class="col-sm-2 control-label">备注</label>
            <div class="col-sm-6">
            	<textarea cols="60" rows="3" class="form-control" id="remark"  maxlength="50"
                                  name="remark">${companyWithBLOBs.remark}</textarea>
            </div>
           
        </div>
         <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" id="comform" class="btn btn-danger" style="width:100px;">提交</button>
    </div>
  </div>
  </form>

    
  </div>
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
