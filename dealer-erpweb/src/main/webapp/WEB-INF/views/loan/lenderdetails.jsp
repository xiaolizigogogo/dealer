<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

   <script type="text/javascript" src="${basePath}/js/other.js"></script>    <script type="text/javascript" src="${basePath}/js/my.js"></script>
    <script type="text/javascript" src="${basePath}/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${basePath}/js/layer/layer.js"></script>
    <script type="text/javascript" src="${basePath}/js/completer/completer.min.js"></script>
    <script src="${basePath}/js/uploadPreview.js" type="text/javascript"></script>

    <script src="${basePath}/js/bootstrap-datetimepicker.min.js"></script>
    <script src="${basePath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="${basePath}/js/datetimepicker.js"></script>

    <script src="${basePath}/js/jquery.validate.js"></script>
<div class="modal-header"> <a  type="button" href = "javascript:void(0)" onclick = "colsediv(0)"  class="close" ><span aria-hidden="true">&times;</span></a>
  <h4 class="modal-title" id="myModalLabel" style="font-size:16px;">客户信息<small style="padding-left:20px; font-size:14px;" class="text-muted" id="Identityinformation"></small></h4>
</div>
<div class="modal-body clearfix" style="background:#eee;" >
  
    <div class="from_box">
      <div class="from_tit clearfix">
        <h3 class="pull-left">基本信息</h3>
					</div>					
					<div id="loan_review_div"></div>
					<div class="row">
						<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>借款人：</dt>
								<dd id="customerName1"></dd>
							</dl>
						</div>
						<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>身份证号码：</dt>
								<dd id="idCard"></dd>
							</dl>
						</div>
						<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>手机号码：</dt>
								<dd id="mobile"></dd>
							</dl>
						</div>
						<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>客户来源：</dt>
								<dd id="customerFrom"></dd>
							</dl>
						</div>
					</div>
					<div class="row">
                    <div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>性别：</dt>
								<dd id="sex"></dd>
							</dl>
						</div>
                        <div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>年龄：</dt>
								<dd id="age"></dd>
							</dl>
						</div>
                    <div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>学历：</dt>
								<dd id="education"></dd>
							</dl>
						</div>
                        <div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>住宅电话：</dt>
								<dd id="homeTel"></dd>
							</dl>
						</div>
                         <div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>户口所在地：</dt>
								<dd id="kosekiAddress"></dd>
							</dl>
						</div>
                        <!--
						<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>住房性质：</dt>
								<dd id="house"></dd>
							</dl>
						</div>-->
						<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>婚姻状况：</dt>
								<dd id="maritalStatus"></dd>
							</dl>
						</div>
						<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>本地居住年限：</dt>
								<dd id="residence_period"></dd>
							</dl>
						</div> 
                         <div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>子女个数：</dt>
								<dd id="number_of_children"></dd>
							</dl>
						</div>
                        <div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>子女情况：</dt>
								<dd id="status_of_children"></dd>
							</dl>
						</div>
                         
						<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>居住情况：</dt>
								<dd id="cohabitant"> </dd>
							</dl>
						</div>
						<div class="col-sm-6">
							<dl class="dl-horizontal">
								<dt>现居地址：</dt>
								<dd id="liveAddress"></dd>
							</dl>
						</div>
						<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>现住宅类型：</dt>
								<dd id="house"></dd>
							</dl>
						</div>
                        <div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>现住址居住年限：</dt>
								<dd id="residence_period_current"></dd>
							</dl>
						</div>
					</div>
				</div>
				<div class="from_box">
					<div class="from_tit clearfix">
						<h3 class="pull-left">工作信息</h3>
					</div>
					<div class="row">
						<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>单位全称：</dt>
								<dd id="enterpriseName"></dd>
							</dl>
						</div>
                        <div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>单位电话：</dt>
								<dd id="enterpriseTel"></dd>
							</dl>
						</div>
						<div class="col-sm-6">
							<dl class="dl-horizontal">
								<dt>工作类型：</dt>
								<dd id="enterpriseIndustry">个人独资/合伙企业（持股50%）</dd>
							</dl>
						</div>
						
					</div>
					<div class="row">
						<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>单位性质：</dt>
								<dd id="enterpriseType"></dd>
							</dl>
						</div>
                        <div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>部门：</dt>
								<dd id="deptName"></dd>
							</dl>
						</div>
						<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>职位：</dt>
								<dd id="position"></dd>
							</dl>
						</div>
					
                    <div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>月收入水平：</dt>
								<dd id="income"></dd>
							</dl>
						</div>
<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>有无社保：</dt>
								<dd id=has_social_security_cards></dd>
							</dl>
						</div>
						<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>单位地址：</dt>
								<dd id="enterpriseAddress"></dd>
							</dl>
						</div>
                        <div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>入职时间：</dt>
								<dd id="dateJoined"></dd>
							</dl>
						</div>
					</div>
                    <hr style="margin:10px 0px;" />
                   <div class="row">
						<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>生产制造型企业：</dt>
								<dd id="ismanufacturing"></dd>
							</dl>
						</div>
                        <div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>组织形式：</dt>
								<dd id="companyType"></dd>
							</dl>
						</div>
						<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>注册时间：</dt>
								<dd id="companyRegisterAt"></dd>
							</dl>
						</div>
					
                    <div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>营业执照：</dt>
								<dd id="has_businesslicence"></dd>
							</dl>
						</div>
<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>生产规模：</dt>
								<dd id="employees_number"></dd>
							</dl>
						</div>
						<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>营业时间：</dt>
								<dd id="business_hours"></dd>
							</dl>
						</div>
                        <div class="col-sm-6">
							<dl class="dl-horizontal">
								<dt>主营业务：</dt>
								<dd id="business"></dd>
							</dl>
						</div>
                         <div class="col-sm-6">
							<dl class="dl-horizontal">
								<dt>收入说明：</dt>
								<dd id="incomeStatement"></dd>
							</dl>
						</div>
					</div>
				</div>
				<div class="from_box">
					<div class="from_tit clearfix">
						<h3 class="pull-left">资产信息</h3>
					</div>
					<div class="row">
						<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>房产：</dt>
								<dd id="hasHouse1"></dd>
							</dl>
						</div>
						<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>房产数量：</dt>
								<dd id="house_number"></dd>
							</dl>
						</div>
                        <div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>购买时间：</dt>
								<dd id="house_buy_date"></dd>
							</dl>
						</div>
                        <div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>购买方式：</dt>
								<dd id="house_buy_way"></dd>
							</dl>
						</div>
                        <div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>购买价格：</dt>
								<dd id="house_buy_price"></dd>
							</dl>
						</div>
                        <div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>房产归属人：</dt>
								<dd id="house_ownership"></dd>
							</dl>
						</div>
<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>房产地址：</dt>
								<dd id="house_addr"></dd>
							</dl>
						</div>
					</div>
				</div>
                <div class="from_box">
					<div class="from_tit clearfix">
						<h3 class="pull-left">车辆信息</h3>
					</div>
					<div class="row">
						<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>车牌号码：</dt>
								<dd id="car_license_plate"></dd>
							</dl>
						</div>
						<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>品牌类型：</dt>
								<dd id="car_brand"></dd>
							</dl>
						</div>
                        <div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>购买时间：</dt>
								<dd id="car_buy_date"></dd>
							</dl>
						</div>
                        <div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>裸车价：</dt>
								<dd id="bare_car_price"></dd>
							</dl>
						</div>
                        <div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>家庭共有车数：</dt>
								<dd id="family_car_number"></dd>
							</dl>
						</div>
                        <div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>购买方式：</dt>
								<dd id="car_buy_way">本人</dd>
							</dl>
						</div>
<div class="col-sm-6">
							<dl class="dl-horizontal">
								<dt>保险单：</dt>
								<dd id="insurance_type">交强险、车损险</dd>
							</dl>
						</div>
					</div>
				</div>
				<div class="from_box">
					<div class="from_tit clearfix">
						<h3 class="pull-left">其他信息</h3>
					</div>
					<div class="row">
						<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>所属分公司：</dt>
								<dd id="company-name"></dd>
							</dl>
						</div>
						<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>所属部门：</dt>
								<dd id="dept-name"></dd>
							</dl>
						</div>
						<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>所属客户经理：</dt>
								<dd id="user-realname"></dd>
							</dl>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>信用卡张数：</dt>
								<dd id="creditCardNum"></dd>
							</dl>
						</div>
						<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>信用卡额度：</dt>
								<dd id="creditCardQuota"></dd>
							</dl>
						</div>
                        <div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>信用卡银行名称：</dt>
								<dd id="creditCardBankName"></dd>
							</dl>
						</div>
                        <div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>银行信用卡号：</dt>
								<dd id="creditCard"></dd>
							</dl>
						</div>
                        <div class="col-sm-12">
							<dl class="dl-horizontal">
								<dt>备注：</dt>
								<dd id="remark" >
									
								</dd>
							</dl>
						</div>
					</div>
					
				</div>
				<div class="from_box">
					<div class="from_tit clearfix">
						<h3 class="pull-left">联系人信息</h3>
					</div>
					<div class="row">
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>配偶姓名：</dt>
								<dd id="spouse_name">
									
								</dd>
							</dl>
						</div>
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>单位电话：</dt>
								<dd id="spouse_tel">
								
								</dd>
							</dl>
						</div>
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>手机号码：</dt>
								<dd id="spouse_mobile">
								
								</dd>
							</dl>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>直系亲属姓名：</dt>
								<dd id="immediate_name1">
									
								</dd>
							</dl>
						</div>
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>关系：</dt>
								<dd id="immediate_relation1">
								
								</dd>
							</dl>
						</div>
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>手机号码：</dt>
								<dd id="immediate_Mobile1">
									
								</dd>
							</dl>
						</div>
					</div>
                    <div class="row">
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>直系亲属姓名：</dt>
								<dd id="immediate_name2">
									
								</dd>
							</dl>
						</div>
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>关系：</dt>
								<dd id="immediate_relation2">
								
								</dd>
							</dl>
						</div>
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>手机号码：</dt>
								<dd id="immediate_Mobile2">
									
								</dd>
							</dl>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>其他联系人姓名：</dt>
								<dd id="other_name1">
							
								</dd>
							</dl>
						</div>
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>关系：</dt>
								<dd id="other_relation1">
							
								</dd>
							</dl>
						</div>
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>手机号码：</dt>
								<dd id="other_mobile1">
								</dd>
							</dl>
						</div>
					</div>
                    <div class="row">
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>其他联系人姓名：</dt>
								<dd id="other_name2">
							
								</dd>
							</dl>
						</div>
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>关系：</dt>
								<dd id="other_relation2">
							
								</dd>
							</dl>
						</div>
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>手机号码：</dt>
								<dd id="other_mobile2">
								</dd>
							</dl>
						</div>
					</div>
				</div>
			
    </div>


<div class="modal-footer">
  <p class="col-sm-2"> <a  href = "javascript:void(0)" onclick = "colsediv(0)" class="btn btn-default btn-block" id="BtnClose">关闭</a> </p>
 <!--BUG25-->
<!--   <p class="col-sm-2 "> <a  href="javascript:void(0)" onclick = "toAddLoan()" class="btn btn-danger btn-block">申请贷款</a> </p> -->
</div>




<script type="text/javascript" src="${basePath}/js/loanerDetailOfCYB.js"></script>

<script type="text/javascript">
$(function(){
	if($("#latent").val())
	{	
		var uuid=$("#customer_id_hidden").val().split(':')[0];
		var addLoanHtml = " <p class='col-sm-2 ' > <a  href='#' onclick ='loanApplication(this)' id="+uuid+":"+$("#latent").val()
	    				+" class='btn btn-danger btn-block'>"
	    				+"  申请贷款</a> </p>";	
	    $("#BtnClose").parent().parent().append(addLoanHtml);
	    
	}

});
function loanApplication(Obj){
	var customer_id=$(Obj).attr("id").split(":")[0];
	var latent=$(Obj).attr("id").split(":")[1];
	colsediv(0);
	window.location = "/admin/loan/goLoanApplyPage.html?customerId="+customer_id+"&latent="+latent;
	
}
</script>

