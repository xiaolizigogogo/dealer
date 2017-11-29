<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="modal-header"> <a  type="button" href = "javascript:void(0)" onclick = "colsediv(0)"  class="close" ><span aria-hidden="true">&times;</span></a>
  <h4 class="modal-title" id="myModalLabel" style="font-size:16px;">客户信息<small style="padding-left:20px; font-size:14px;" class="text-muted"  id="Identityinformation"></small></h4>
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
								<dt>学历:</dt>
								<dd id="education"></dd>
							</dl>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>住房性质：</dt>
								<dd id="house"></dd>
							</dl>
						</div>
						<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>婚姻状况：</dt>
								<dd id="maritalStatus"></dd>
							</dl>
						</div>
						<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>居住人数：</dt>
								<dd id="liveNumber1"></dd>
							</dl>
						</div>
						<div class="col-sm-12">
							<dl class="dl-horizontal">
								<dt>现居地址：</dt>
								<dd id="liveAddress"></dd>
							</dl>
						</div>

					</div>
				</div>
				<div class="from_box">
					<div class="from_tit clearfix">
						<h3 class="pull-left">工作信息</h3>
					</div>
					<div class="row">
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>单位全称：</dt>
								<dd id="enterpriseName"></dd>
							</dl>
						</div>
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>所属行业：</dt>
								<dd id="enterpriseIndustry"></dd>
							</dl>
						</div>
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>单位电话：</dt>
								<dd id="enterpriseTel"></dd>
							</dl>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>单位性质：</dt>
								<dd id="enterpriseType"></dd>
							</dl>
						</div>
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>职务：</dt>
								<dd id="position"></dd>
							</dl>
						</div>
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>入职时间：</dt>
								<dd id="dateJoined1">
								</dd>
							</dl>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>单位地址：</dt>
								<dd id="enterpriseAddress"></dd>
							</dl>
						</div>
					</div>
				</div>
				<div class="from_box">
					<div class="from_tit clearfix">
						<h3 class="pull-left">资产信息</h3>
					</div>
					<div class="row">
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>房产：</dt>
								<dd id="hasHouse1"></dd>
							</dl>
						</div>
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>月收入水平：</dt>
								<dd id="income"></dd>
							</dl>
						</div>

					</div>
					<div class="row">
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>其他收入：</dt>
								<dd id="otherIncome"></dd>
							</dl>
						</div>
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>收入说明：</dt>
								<dd id="incomeStatement"></dd>
							</dl>
						</div>
					</div>
				</div>
				<div class="from_box">
					<div class="from_tit clearfix">
						<h3 class="pull-left">其他信息</h3>
					</div>
					<div class="row">
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>所属分公司：</dt>
								<dd id="company-name"></dd>
							</dl>
						</div>
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>所属部门：</dt>
								<dd id="dept-name"></dd>
							</dl>
						</div>
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>所属客户经理：</dt>
								<dd id="user-realname"></dd>
							</dl>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>信用卡张数：</dt>
								<dd id="creditCardNum"></dd>
							</dl>
						</div>
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>信用卡额度：</dt>
								<dd id="creditCardQuota"></dd>
							</dl>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>信用卡银行名称：</dt>
								<dd id="creditCardBankName"></dd>
							</dl>
						</div>
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>银行信用卡号：</dt>
								<dd id="creditCard"></dd>
							</dl>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<dl class="dl-horizontal">
								<dt>备注：</dt>
								<dd>
									<textarea cols="168" rows="3" class="form-control" id="remark" 
										name="remark" readonly="readonly">
							</textarea>
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
								<dd>
									<input type="text" class="form-control" readonly="readonly"
										id="spouse_name">
								</dd>
							</dl>
						</div>
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>单位电话：</dt>
								<dd>
									<input type="text" class="form-control" id="spouse_tel"
										readonly="readonly">
								</dd>
							</dl>
						</div>
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>手机号码：</dt>
								<dd>
									<input type="text" class="form-control" id="spouse_mobile"
										readonly="readonly">
								</dd>
							</dl>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>直系亲属姓名：</dt>
								<dd>
									<input type="text" class="form-control" id="immediate_name1"
										readonly="readonly">
								</dd>
							</dl>
						</div>
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>关系：</dt>
								<dd>
									<input type="text" class="form-control"
										id="immediate_relation1" readonly="readonly">
								</dd>
							</dl>
						</div>
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>手机号码：</dt>
								<dd>
									<input type="text" class="form-control" id="immediate_Mobile1"
										readonly="readonly">
								</dd>
							</dl>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>其他联系人姓名：</dt>
								<dd>
									<input type="text" class="form-control" id="other_name1"
										readonly="readonly">
								</dd>
							</dl>
						</div>
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>关系：</dt>
								<dd>
									<input type="text" class="form-control" id="other_relation1"
										readonly="readonly">
								</dd>
							</dl>
						</div>
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>手机号码：</dt>
								<dd>
									<input type="text" class="form-control" id="other_mobile1"
										readonly="readonly">
								</dd>
							</dl>
						</div>
					</div>
				</div>
			
    </div>


<div class="modal-footer">
  <p class="col-sm-2"> <a  href = "javascript:void(0)" onclick = "colsediv(0)" class="btn btn-default btn-block">关闭</a> </p>
  <p class="col-sm-2 "> <a  href="../order/add.html" onclick = "colsediv(0)" class="btn btn-danger btn-block">申请贷款</a> </p>
</div>
<script type="text/javascript">

$.ajax({
	url : "/admin/customer/loanerDetailInfo?uuid=" + customer_id_hidden,
	type : "get",
	dataType : "json",	
	success : function(data) {
		var education = data.customerRegisterInfo.education;
		var education1;
		var house = data.customerRegisterInfo.house;
		var house1;
		var maritalStatus = data.customerRegisterInfo.maritalStatus;
		var maritalStatus1;
		var enterpriseType = data.customerAdditionalInfo.enterpriseType;
		var enterpriseType1;
		var position = data.customerAdditionalInfo.position;
		var position1;
		var hasHouse = data.customerAdditionalInfo.hasHouse;
		var hasHouse1;
		var dateJoined1 = data.customerAdditionalInfo.dateJoined;
		
		uuid=data.customerRegisterInfo.uuid;
		
		if (education == "undergraduate") {
			education1 = "本科"
		} else if (education == "college") {
			education1 = "大专"
		} else if (education == "doctor") {
			education1 = "博士及以上"
		} else if (education == "master") {
			education1 = "硕士"
		} else if (education == "senior") {
			education1 = "高中及中专"
		} else {
			education1 = "初中及以下"
		}
		if (house == "commodity") {
			house1 = "商品房无按揭"
		} else if (house == "commodity_mortgage") {
			house1 = "商品房无按揭"
		} else if (house == "commodity_mortgage") {
			house1 = "商品房有按揭"
		} else if (house == "bought_public") {
			house1 = "已购公房"
		} else if (house == "self_build") {
			house1 = "自建房"
		} else if (house == "rent") {
			house1 = "租用"
		} else {
			house1 = "亲属住房"
		}
		if (maritalStatus == "WH") {
			maritalStatus1 = "未婚"
		} else if (maritalStatus == "YH") {
			maritalStatus1 = "已婚"
		} else if (maritalStatus == "LY") {
			maritalStatus1 = "离异"
		} else if (maritalStatus == "SR") {
			maritalStatus1 = "丧偶"
		} else {
			maritalStatus1 = "再婚"
		}
		if (enterpriseType == "institutions") {
			enterpriseType1 = "机关事业单位"
		} else if (enterpriseType == "government") {
			enterpriseType1 = "国有企业"
		} else if (enterpriseType == "three_funded") {
			enterpriseType1 = "三资企业"
		} else if (enterpriseType == "private") {
			enterpriseType1 = "私营"
		} else if (enterpriseType == "professional") {
			enterpriseType1 = "自由职业者"
		} else if (enterpriseType == "social_organization") {
			enterpriseType1 = "社会团体"
		} else {
			enterpriseType1 = "其他"
		}
		if (position == "chairman") {
			position1 = "董事长"
		} else if (position == "director") {
			position1 = "董事"
		} else if (position == "manager") {
			position1 = "总经理"
		} else if (position == "executives") {
			position1 = "单位高管"
		} else if (position == "department_manage") {
			position1 = "部门主管"
		} else {
			position1 = "普通职员"
		}
		if (hasHouse) {
			hasHouse1 = "有"
		} else {
			hasHouse1 = "无"
		}
		
        $("#uuid").html(uuid);
		$("#customerName1").html(
				data.customerRegisterInfo.customerName);
		$("#Identityinformation").html(data.customerRegisterInfo.customerName+data.customerRegisterInfo.idCard);
		$("#idCard").html(data.customerRegisterInfo.idCard);
		$("#mobile").html(data.customerRegisterInfo.mobile);
		$("#education").html(education1);
		$("#house").html(house1);
		$("#maritalStatus").html(maritalStatus1);
		$("#liveNumber1").html(
				data.customerRegisterInfo.liveNumber);
		
		$("#liveAddress").html(
				data.customerRegisterInfo.liveAddress);
		$("#enterpriseName").html(
				data.customerAdditionalInfo.enterpriseName);
		$("#enterpriseIndustry").html(
				data.customerAdditionalInfo.enterpriseIndustry);
		$("#enterpriseTel").html(
				data.customerAdditionalInfo.enterpriseTel);
		$("#enterpriseType").html(enterpriseType1);
		$("#position").html(position1);
		
		$("#enterpriseAddress").html(
				data.customerAdditionalInfo.enterpriseAddress);
		
		$("#hasHouse1").html(hasHouse1);
		$("#income").html(data.customerAdditionalInfo.income);
		$("#otherIncome").html(
				data.customerAdditionalInfo.otherIncome);
		
		$("#incomeStatement").html(
				data.customerAdditionalInfo.incomeStatement);
		
		$("#company-name").html(
				data.customerRegisterInfo.company.name);
		$("#dept-name").html(
				data.customerRegisterInfo.dept.name);
		$("#user-realname").html(
				data.customerRegisterInfo.user.realname);
		$("#creditCardNum").html(
				data.customerRegisterInfo.creditCardNum);
		$("#creditCardQuota").html(
				data.customerRegisterInfo.creditCardQuota);
		$("#creditCardBankName").html(
				data.customerRegisterInfo.creditCardBankName);
		$("#creditCard").html(
				data.customerRegisterInfo.creditCard);
		$("#remark").attr("value",data.customerRegisterInfo.remark);

//			alert(data.customerRegisterInfo.remark)
		
		$.get(
				"${basePath}/admin/customer/queryContactsCusId.html?uuid="+uuid,
				function(result) {
					$(result).each(
							function(i) {
								if (result[i].relation == "配偶") {
									$("#spouse_id").val(result[i].id);
									$("#spouse_name").val(
											result[i].contactsName);
									$("#spouse_tel").val(
											result[i].contactsTel);
									$("#spouse_mobile").val(
											result[i].contactsMobile)
								}
								if (result[i].contactsTel == "直系亲属1") {
									$("#immediate_id1").val(
											result[i].id);
									$("#immediate_name1").val(
											result[i].contactsName);
									$("#immediate_relation1").val(
											result[i].relation);
									$("#immediate_Mobile1").val(
											result[i].contactsMobile);
								}
								if (result[i].contactsTel == "直系亲属2") {
									$("#immediate_id2").val(
											result[i].id);
									$("#immediate_name2").val(
											result[i].contactsName);
									$("#immediate_relation2").val(
											result[i].relation);
									$("#immediate_Mobile2").val(
											result[i].contactsMobile);
								}
								if (result[i].contactsTel == "其他联系人1") {
									$("#other_id1").val(result[i].id);
									$("#other_name1").val(
											result[i].contactsName);
									$("#other_relation1").val(
											result[i].relation);
									$("#other_mobile1").val(
											result[i].contactsMobile);
								}
								if (result[i].contactsTel == "其他联系人2") {
									$("#other_id2").val(result[i].id);
									$("#other_name2").val(
											result[i].contactsName);
									$("#other_relation2").val(
											result[i].relation);
									$("#other_mobile2").val(
											result[i].contactsMobile);
								}
							});
				})
		
	}

})
;



</script>
