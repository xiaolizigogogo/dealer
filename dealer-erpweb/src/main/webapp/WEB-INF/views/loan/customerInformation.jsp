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

    <script type="text/javascript" src="${basePath}/js/other.js"></script>
    <script type="text/javascript" src="${basePath}/js/my.js"></script>
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
								<dd id="idCard1"></dd>
							</dl>
						</div>
						<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>手机号码：</dt>
								<dd id="mobile1"></dd>
							</dl>
						</div>
						<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>学历：</dt>
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
								<dt>年龄：</dt>
								<dd id="age1"></dd>
							</dl>
						</div>
						<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>性别：</dt>
								<dd id="sex1"></dd>
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
				</div>
			
    </div>


<div class="modal-footer" id="d1">
</div>



<script type="text/javascript" >

	$(function(){
		var customer_id_hiddenstr = $("#customer_id_hidden").val();
		var strarray = customer_id_hiddenstr.split(":");
		var uuid = strarray[0];
		var latent = strarray[1];
		if(latent == "2"){
			$("#applyloan").html("");
		}
	$.ajax({
					url : "/admin/customer/queryCustomerInformation?uuid=" + uuid,
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
						var sex=data.customerRegisterInfo.sex;
						var sex1;
						var div;
						uuid=data.customerRegisterInfo.uuid;
						if(latent!=2){
					    div=" <p class='col-sm-2'> "
						       +" <a  href = 'javascript:void(0)' onclick = 'colsediv(0)' class='btn btn-default btn-block'>关闭</a> </p>"
                               +" <p class='col-sm-2 ' > <a  href='#' onclick ='loanApplication(this)' id="+uuid+":"+latent
                               +" class='btn btn-danger btn-block'>"
                               +"  申请贷款</a> </p>";
                               }else{
                               div=" <p class='col-sm-2'> "
						       +" <a  href = 'javascript:void(0)' onclick = 'colsediv(0)' class='btn btn-default btn-block'>关闭</a> </p>";
                         }
                        $("#d1").html(div);       
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
						$("#idCard1").html(data.customerRegisterInfo.idCard);
						$("#Identityinformation").html(data.customerRegisterInfo.customerName+data.customerRegisterInfo.idCard);
						$("#mobile1").html(data.customerRegisterInfo.mobile);
						$("#education").html(education1);
						$("#house").html(house1);
						$("#maritalStatus").html(maritalStatus1);
						$("#age1").html(
								data.customerRegisterInfo.age);
						if(data.customerRegisterInfo.sex=="M"){
	                         sex1="男";					
						}else{
						
						     sex1="女";
						
						}
						$("#sex1").html(sex1);
						$("#liveAddress").html(
								data.customerRegisterInfo.liveAddress);
						$("#enterpriseName").html(
								data.customerAdditionalInfo.enterpriseName);var enterpriseIndustry=data.customerAdditionalInfo.enterpriseIndustry;
						var enterpriseIndustry1;
						if(enterpriseIndustry=="1"){
						enterpriseIndustry1="计算机/互联网/通信/电子";
						}else if(enterpriseIndustry=="2"){
						enterpriseIndustry1="会计/金融/银行/保险";
						}else if(enterpriseIndustry=="3"){
						enterpriseIndustry1="贸易/消费/制造/营运";
						}else if(enterpriseIndustry=="4"){
						enterpriseIndustry1="制药/医疗";
						}else if(enterpriseIndustry=="5"){
						enterpriseIndustry1="广告/媒体";
						}else if(enterpriseIndustry=="6"){
						enterpriseIndustry1="房地产/建筑";
						}else if(enterpriseIndustry=="7"){
						enterpriseIndustry1="专业服务/教育/培训";
						}else if(enterpriseIndustry=="8"){
						enterpriseIndustry1="服务业";
						}else if(enterpriseIndustry=="9"){
						enterpriseIndustry1="物流/运输";
						}else if(enterpriseIndustry=="a"){
						enterpriseIndustry1="能源/原材料";
						}else if(enterpriseIndustry=="b"){
						enterpriseIndustry1="私营企业主";
						}else if(enterpriseIndustry=="c"){
						enterpriseIndustry1="政府/非赢利机构/其他";
						}else if(enterpriseIndustry = "commodity"){
							enterpriseIndustry1 = "事业单位";
						}else if(enterpriseIndustry = "commodity_mortgage"){
							enterpriseIndustry1 = "金融";
						}else if(enterpriseIndustry = "bought_public"){
							enterpriseIndustry1 = "房地产";
						}else if(enterpriseIndustry = "self_build"){
							enterpriseIndustry1 = "农牧林";
						}
						$("#enterpriseIndustry").html(enterpriseIndustry1);
						$("#enterpriseTel").html(
								data.customerAdditionalInfo.enterpriseTel);
						$("#enterpriseType").html(enterpriseType1);
						$("#position").html(position1);
						
						$("#enterpriseAddress").html(
								data.customerAdditionalInfo.enterpriseAddress);
						
						$("#hasHouse1").html(hasHouse1);
						$("#income").html(data.customerAdditionalInfo.income);
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
						$("#remark").html(data.customerRegisterInfo.remark);

						$.get(
								"/admin/customer/queryContactsCusId.html?uuid="+uuid,
								function(result) {
									$(result).each(
											function(i) {
												if (result[i].relation == "配偶") {
													$("#spouse_id").val(result[i].id);
													$("#spouse_name").html(
															result[i].contactsName);
													$("#spouse_tel").html(
															result[i].contactsTel);
													$("#spouse_mobile").html(
															result[i].contactsMobile)
												}
												if (result[i].contactsTel == "直系亲属1") {
													$("#immediate_id1").val(
															result[i].id);
													$("#immediate_name1").html(
															result[i].contactsName);
													$("#immediate_relation1").html(
															result[i].relation);
													$("#immediate_Mobile1").html(
															result[i].contactsMobile);
												}
												if (result[i].contactsTel == "直系亲属2") {
													$("#immediate_id2").val(
															result[i].id);
													$("#immediate_name2").html(
															result[i].contactsName);
													$("#immediate_relation2").html(
															result[i].relation);
													$("#immediate_Mobile2").html(
															result[i].contactsMobile);
												}
												if (result[i].contactsTel == "其他联系人1") {
													$("#other_id1").val(result[i].id);
													$("#other_name1").html(
															result[i].contactsName);
													$("#other_relation1").html(
															result[i].relation);
													$("#other_mobile1").html(
															result[i].contactsMobile);
												}
												if (result[i].contactsTel == "其他联系人2") {
													$("#other_id2").val(result[i].id);
													$("#other_name2").html(
															result[i].contactsName);
													$("#other_relation2").html(
															result[i].relation);
													$("#other_mobile2").html(
															result[i].contactsMobile);
												}
											});
								})
					}
				});

	});




</script>
