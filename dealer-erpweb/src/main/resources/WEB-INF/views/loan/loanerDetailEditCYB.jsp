<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<link type="text/css" rel="stylesheet"
	href="${basePath}/css/dropZone.css" />
<link type="text/css" rel="stylesheet"
	href="${basePath}/css/jquery.fileupload-ui.css" />
<link type="text/css" rel="stylesheet"
	href="${basePath}/css/jquery.fileupload.css" />
<link type="text/css" rel="stylesheet"
	href="${basePath}/js/completer/completer.min.css" />
<link rel="stylesheet"
	href="${basePath}/css/bootstrap/bootstrap-table.css">
<link rel="stylesheet" href="${basePath}/css/lightbox.min.css" />
<script src="${basePath}/js/lightbox.js"></script>
<script type="text/javascript" src="${basePath}/js/jquery/jquery.min.js"></script>
<script type="text/javascript"
	src="${basePath}/js/jquery/jquery.ui.widget.js"></script>
<script type="text/javascript"
	src="${basePath}/js/jquery/jquery.iframe-transport.js"></script>
<script type="text/javascript"
	src="${basePath}/js/jquery/jquery.fileupload.js"></script>
<script type="text/javascript" src="${basePath}/js/other.js"></script>
<script type="text/javascript" src="${basePath}/js/my.js"></script>
<script src="${basePath}/js/uploadPreview.js" type="text/javascript"></script>
<script type="text/javascript" src="${basePath}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${basePath}/js/layer/layer.js"></script>
<script type="text/javascript"
	src="${basePath}/js/completer/completer.min.js"></script>
<link rel="stylesheet"
	href="${basePath}/css/bootstrap-datetimepicker.min.css">
<script src="${basePath}/js/bootstrap-datetimepicker.min.js"></script>
<script src="${basePath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="${basePath}/js/datetimepicker.js"></script>
<script src="${basePath}/js/jquery.validate.js"></script>
<script src="${basePath}/js/loan/loanerDetailEditCYB.js"></script>
<script src="${basePath}/js/Map.js"></script>
</head>
<body>
	<form class="form-horizontal" action="/admin/loan/reloadLoanInfo"
		id="loanForm" method="POST">
		<div class="modal-header">
			<a type="button" href="javascript:void(0)" onClick="closePage(0);"
				class="close"><span aria-hidden="true">&times;</span></a>
			<h4 class="modal-title" id="myModalLabel" style="font-size: 16px;">
				查看订单<small style="padding-left: 20px; font-size: 14px;"
					class="text-danger" id="orderid">订单号：</small>
			</h4>
		</div>
		<input type="text" hidden="hidden" name="uuid" id="uuid"> <input
			type="text" hidden="hidden" name="taskId" id="taskId"> <input
			type="hidden" id="processid">
		<div class="modal-body">
			<ol class="ui-step ui-step-red ui-step-11" id="ol_vehiclesLoans"
				style="display: none;">
				<li class="step-start step-done">
					<div class="ui-step-line"></div>
					<div class="ui-step-cont">
						<span class="ui-step-cont-number" id="applyloan">1</span> <span
							class="ui-step-cont-text">申请贷款</span>
					</div>
				</li>
				<li class="">
					<div class="ui-step-line"></div>
					<div class="ui-step-cont">
						<span class="ui-step-cont-number" id="li_vehicleAssess">2</span> <span
							class="ui-step-cont-text">评估</span>
					</div>
				</li>
				<li class="">
					<div class="ui-step-line"></div>
					<div class="ui-step-cont">
						<span class="ui-step-cont-number" id="li_departLeadAduit">3</span>
						<span class="ui-step-cont-text">初审</span>
					</div>
				</li>
				<li class="">
					<div class="ui-step-line"></div>
					<div class="ui-step-cont">
						<span class="ui-step-cont-number" id="li_trialPhase">4</span> <span
							class="ui-step-cont-text">面审</span>
					</div>
				</li>
				<li class="">
					<div class="ui-step-line"></div>
					<div class="ui-step-cont">
						<span class="ui-step-cont-number" id="li_callBack">5</span> <span
							class="ui-step-cont-text">电话核实</span>
					</div>
				</li>
				<li class="">
					<div class="ui-step-line"></div>
					<div class="ui-step-cont">
						<span class="ui-step-cont-number" id="li_visiteCheck">6</span> <span
							class="ui-step-cont-text">家访</span>
					</div>
				</li>
				<li class="">
					<div class="ui-step-line"></div>
					<div class="ui-step-cont">
						<span class="ui-step-cont-number" id="li_judgment">7</span> <span
							class="ui-step-cont-text">终审</span>
					</div>
				</li>
				<li class="">
					<div class="ui-step-line"></div>
					<div class="ui-step-cont">
						<span class="ui-step-cont-number" id="li_signContract">8</span> <span
							class="ui-step-cont-text">签订合同</span>
					</div>
				</li>
				<li class="">
					<div class="ui-step-line"></div>
					<div class="ui-step-cont">
						<span class="ui-step-cont-number" id="li_mortgage">9</span> <span
							class="ui-step-cont-text" id="mortgage_stock">抵押办理</span>
					</div>
				</li>
				<li class="">
					<div class="ui-step-line"></div>
					<div class="ui-step-cont">
						<span class="ui-step-cont-number" id="li_dataReview">10</span> <span
							class="ui-step-cont-text">复核</span>
					</div>
				</li>
				<li class="step-end">
					<div class="ui-step-line"></div>
					<div class="ui-step-cont">
						<span class="ui-step-cont-number" id="li_lended">11</span> <span
							class="ui-step-cont-text">出账</span>
					</div>
				</li>
			</ol>
			<ol class="ui-step ui-step-red ui-step-15"
				id="ol_vehiclesLoans_group" style="display: none;">
				<li class="step-start step-done">
					<div class="ui-step-line"></div>
					<div class="ui-step-cont">
						<span class="ui-step-cont-number" id="applyloan_group">1</span> <span
							class="ui-step-cont-text">申请贷款</span>
					</div>
				</li>
				<li class="">
					<div class="ui-step-line"></div>
					<div class="ui-step-cont">
						<span class="ui-step-cont-number" id="ligroup_vehicleAssess">2</span>
						<span class="ui-step-cont-text">评估</span>
					</div>
				</li>
				<li class="">
					<div class="ui-step-line"></div>
					<div class="ui-step-cont">
						<span class="ui-step-cont-number" id="ligroup_departLeadAduit">3</span>
						<span class="ui-step-cont-text">初审</span>
					</div>
				</li>
				<li class="">
					<div class="ui-step-line"></div>
					<div class="ui-step-cont">
						<span class="ui-step-cont-number" id="ligroup_trialPhase">4</span>
						<span class="ui-step-cont-text">面审</span>
					</div>
				</li>
				<li class="">
					<div class="ui-step-line"></div>
					<div class="ui-step-cont">
						<span class="ui-step-cont-number" id="ligroup_callBack">5</span> <span
							class="ui-step-cont-text">电话核实</span>
					</div>
				</li>
				<li class="">
					<div class="ui-step-line"></div>
					<div class="ui-step-cont">
						<span class="ui-step-cont-number" id="ligroup_visiteCheck">6</span>
						<span class="ui-step-cont-text">家访</span>
					</div>
				</li>
				<li class="">
					<div class="ui-step-line"></div>
					<div class="ui-step-cont">
						<span class="ui-step-cont-number" id="ligroup_judgment">7</span> <span
							class="ui-step-cont-text">终审</span>
					</div>
				</li>
				<li class="">
					<div class="ui-step-line"></div>
					<div class="ui-step-cont">
						<span class="ui-step-cont-number" id="ligroup_signContract">8</span>
						<span class="ui-step-cont-text">签订合同</span>
					</div>
				</li>
				<li class="">
					<div class="ui-step-line"></div>
					<div class="ui-step-cont">
						<span class="ui-step-cont-number" id="ligroup_mortgage">9</span> <span
							class="ui-step-cont-text" id="group_mortgage_stock">抵押办理</span>
					</div>
				</li>
				<li class="">
					<div class="ui-step-line"></div>
					<div class="ui-step-cont">
						<span class="ui-step-cont-number" id="ligroup_dataReview">10</span>
						<span class="ui-step-cont-text">复核</span>
					</div>
				</li>
				<li class="">
					<div class="ui-step-line"></div>
					<div class="ui-step-cont">
						<span class="ui-step-cont-number" id="ligroup_lended">11</span> <span
							class="ui-step-cont-text">分公司放款</span>
					</div>
				</li>
				<li class="">
					<div class="ui-step-line"></div>
					<div class="ui-step-cont">
						<span class="ui-step-cont-number" id="ligroup_reloanReview">12</span>
						<span class="ui-step-cont-text" id="loanReview_span">再贷资料复核</span>
					</div>
				</li>
				<li class="">
					<div class="ui-step-line"></div>
					<div class="ui-step-cont">
						<span class="ui-step-cont-number" id="ligroup_reloanApprove">13</span>
						<span class="ui-step-cont-text" id="laonApprove_span">再贷审批</span>
					</div>
				</li>
				<li class="">
					<div class="ui-step-line"></div>
					<div class="ui-step-cont">
						<span class="ui-step-cont-number" id="ligroup_reloanE_Contract">14</span>
						<span class="ui-step-cont-text" id="contract_span">再贷电子合同签订</span>
					</div>
				</li>
				<li class="step-end">
					<div class="ui-step-line"></div>
					<div class="ui-step-cont">
						<span class="ui-step-cont-number" id="ligroup_reloan_lended">15</span>
						<span class="ui-step-cont-text" id="loan_lended_span">再贷放款</span>
					</div>
				</li>
			</ol>
			<div class="tab_box">
				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation" class="active"><a href="#tab2"
						aria-controls="tab2" role="tab" data-toggle="tab">车辆信息</a></li>
					<li role="presentation" id="file_tab"><a href="#tab7"
						aria-controls="tab7" role="tab" data-toggle="tab">附件资料</a></li>
				</ul>
				<!-- Tab panes -->
				<div class="tab-content clearfix">
					<div role="tabpanel" class="tab-pane active" id="tab2">
						<div class="from_box">
							<div class="from_tit clearfix">
								<h3 class="pull-left">合同编号信息</h3>
							</div>
							<div class="row">
								<div class="col-sm-3">
									<dl class="dl-horizontal">
										<dt>
											<i class="text-danger">*</i> 合同编号
										</dt>
										<dd>
											<span id="contractNum"></span>
											<div class="pull-left unit_box">
												<input type="text" class="control-sml" name="contractNum"
													maxlength="25" />
											</div>
											<a class="fa fa-edit " style="margin-left: 10px;"></a>
										</dd>
									</dl>
								</div>
							</div>

						</div>
						<div class="from_box carinfo_from">
							<div class="from_tit clearfix">
								<h3 class="pull-left">基本信息</h3>
							</div>
							<div class="row">
								<div class="col-sm-3">
									<dl class="dl-horizontal">
										<dt>
											<i class="text-danger">*</i> 车身是否在有效期内
										</dt>
										<dd>
											<span id="isExamined"></span>
											<div class="pull-left unit_box">
												<label class="radio-inline" style="padding-top: 0;">
													<input type="radio" name="isExamined" id="isExamined1"
													value="是"> 是
												</label> <label class="radio-inline" style="padding-top: 0;">
													<input type="radio" name="isExamined" id="isExamined2"
													value="否"> 否
												</label>
											</div>
											<a class="fa fa-edit " style="margin-left: 10px;"></a>
										</dd>
									</dl>
								</div>
								<div class="col-sm-3">
									<dl class="dl-horizontal">
										<dt>
											<i class="text-danger">*</i> 车辆商业全险是否购买
										</dt>
										<dd>
											<span id="isInsure"></span>
											<div class="pull-left unit_box">
												<label class="radio-inline" style="padding-top: 0;">
													<input type="radio" name="isInsure" id="isInsure1"
													value="是"> 是
												</label> <label class="radio-inline" style="padding-top: 0;">
													<input type="radio" name="isInsure" id="isInsure2"
													value="否"> 否
												</label>
											</div>
											<a class="fa fa-edit " style="margin-left: 10px;"></a>
										</dd>
									</dl>
								</div>
								<div class="col-sm-3">
									<dl class="dl-horizontal">
										<dt>
											<i class="text-danger">*</i> 节假日是否驾驶车辆离省
										</dt>
										<dd>
											<span id="isProvince"></span>
											<div class="pull-left unit_box">
												<label class="radio-inline" style="padding-top: 0;">
													<input type="radio" name="isProvince" id="isProvince1"
													value="是"> 是
												</label> <label class="radio-inline" style="padding-top: 0;">
													<input type="radio" name="isProvince" id="isProvince2"
													value="否"> 否
												</label>
											</div>
											<a class="fa fa-edit " style="margin-left: 10px;"></a>
										</dd>
									</dl>
								</div>
							</div>
						</div>
						<div class="from_box">
							<div class="from_tit clearfix">
								<h3 class="pull-left">车辆信息</h3>
							</div>
							<div class="row">
								<div class="col-sm-12" id="d1"></div>
								<div class="col-sm-3">
									<dl class="dl-horizontal">
										<dt>
											<i class="text-danger">*</i> 车辆品牌
										</dt>
										<dd>
											<span id="vehicleBrand"></span> <input type="text" value=""
												name="vehicleBrand" class="control-sml" /> <a
												class="fa fa-edit " style="margin-left: 10px;"></a>
										</dd>
									</dl>
								</div>
								<div class="col-sm-3">
									<dl class="dl-horizontal">
										<dt>
											<i class="text-danger">*</i> 车辆型号
										</dt>
										<dd>
											<span id="vehicleModels"></span> <select class="control-sml"
												name="vehicleModels">
												<c:forEach items="${vehicleModelEnum}" var="item">
													<option id="${item.message()}" value="${item.name()}">${item.name()}</option>
												</c:forEach>
											</select> <a class="fa fa-edit " style="margin-left: 10px;"></a>
										</dd>
									</dl>
								</div>
								<div class="col-sm-3">
									<dl class="dl-horizontal">
										<dt>
											<i class="text-danger">*</i> 车牌号码
										</dt>
										<dd>
											<span id="vehicleNo"></span> <input type="text" value=""
												class="control-sml required" name="vehicleNo" /> <a
												class="fa fa-edit " style="margin-left: 10px;"></a>
										</dd>
									</dl>
								</div>

								<div class="col-sm-3">
									<dl class="dl-horizontal">
										<dt>
											<i class="text-danger">*</i> 已行驶里程
										</dt>
										<dd>
											<span id="mileaged"></span>
											<div class="pull-left unit_box">
												<input type="text" value="" class="control-sml"
													style="display: inline-block;" name="mileaged" /> <b
													class="unit">KM</b>
											</div>
											<a class="fa fa-edit " style="margin-left: 10px;"></a>
										</dd>
									</dl>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-3">
									<dl class="dl-horizontal">
										<dt>
											<i class="text-danger">*</i> 车身结构
										</dt>
										<dd>
											<span id="structure"></span> <select class="control-sml"
												name="structure">
												<c:forEach items="${carStructureEnum}" var="item">
													<option id="${item.name()}" value="${item.message()}">${item.message()}</option>
												</c:forEach>
											</select> <a class="fa fa-edit " style="margin-left: 10px;"></a>
										</dd>
									</dl>
								</div>
								<div class="col-sm-3">
									<dl class="dl-horizontal">
										<dt>
											<i class="text-danger">*</i> 购置日期
										</dt>
										<dd>
											<span id="purchaseDate"></span>
											<div class="input-group date form_date pull-left red-group"
												data-date="" data-date-format="yyyy-mm-dd"
												data-link-field="purchaseDate" data-link-format="yyyy-mm-dd"
												style="width: 160px; display: none;">
												<input class="control-sml" type="text" id="date" value=""
													style="width: 100%;" readonly="readonly"
													name="purchaseDate"> <i class="input-group-addon"><i
													class="glyphicon glyphicon-calendar"></i></i>
											</div>
											<a class="fa fa-edit " style="margin-left: 10px;"></a>
										</dd>
									</dl>
								</div>
								<div class="col-sm-3">
									<dl class="dl-horizontal">
										<dt>
											<i class="text-danger">*</i> 车架号
										</dt>
										<dd>
											<span id="vehicleIdentification"></span> <input type="text"
												value="" class="control-sml" name="vehicleIdentification" />
											<a class="fa fa-edit " style="margin-left: 10px;"></a>
										</dd>
									</dl>
								</div>
								<div class="col-sm-3">
									<dl class="dl-horizontal">
										<dt>
											<i class="text-danger">*</i> 发动机号
										</dt>
										<dd>
											<span id="engineNo"></span> <input type="text" value=""
												class="control-sml" name="engineNo" /> <a
												class="fa fa-edit " style="margin-left: 10px;"></a>
										</dd>
									</dl>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-3">
									<dl class="dl-horizontal">
										<dt>
											<i class="text-danger">*</i> 变速箱
										</dt>
										<dd>
											<span id="transmissionCase"></span> <select
												class="control-sml" name="transmission">
												<option value="手动" id="手动">手动</option>
												<option value="自动" id="自动">自动</option>
											</select> <a class="fa fa-edit " style="margin-left: 10px;"></a>
										</dd>
									</dl>
								</div>
								<div class="col-sm-3">
									<dl class="dl-horizontal">
										<dt>
											<i class="text-danger">*</i> 排量
										</dt>
										<dd>
											<span id="displacement"></span>
											<div class="pull-left unit_box">
												<input type="text" value="" class="control-sml"
													style="display: inline-block;" name="displacement" /> <b
													class="unit">L</b>
											</div>
											<a class="fa fa-edit " style="margin-left: 10px;"></a>
										</dd>
									</dl>
								</div>
								<div class="col-sm-6">
									<dl class="dl-horizontal">
										<dt>
											<i class="text-danger">*</i> 室内装置
										</dt>
										<dd>
											<span id="indoor"></span>
											<div class="pull-left unit_box">
												<c:forEach items="${carIndoorEnum}" var="item">
													<label class="checkbox-inline"> <input
														id="${item.message()}" name="indoor"
														value="${item.name()}" type="checkbox" /> ${item.name()}
													</label>
												</c:forEach>
											</div>
											<a class="fa fa-edit " style="margin-left: 10px;"></a>
										</dd>
									</dl>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-3">
									<dl class="dl-horizontal">
										<dt>
											<i class="text-danger">*</i> 驱动轮
										</dt>
										<dd>
											<span id="configuration"></span> <select class="control-sml"
												name="configuration">
												<option value="两驱" id="两驱">两驱</option>
												<option value="四驱" id="四驱">四驱</option>
											</select> <a class="fa fa-edit " style="margin-left: 10px;"></a>
										</dd>
									</dl>
								</div>
								<div class="col-sm-3">
									<dl class="dl-horizontal">
										<dt>
											<i class="text-danger">*</i> 颜色
										</dt>
										<dd>
											<span id="color"></span> <select class="control-sml"
												name="color">
												<c:forEach items="${carColorEnum}" var="item">
													<option id="${item.message()}" value="${item.name()}">${item.name()}</option>
												</c:forEach>
											</select> <a class="fa fa-edit " style="margin-left: 10px;"></a>
										</dd>
									</dl>
								</div>

								<div class="col-sm-4">
									<dl class="dl-horizontal">
										<dt>
											<i class="text-danger">*</i> 随车工具
										</dt>
										<dd>
											<span id="carTool"></span>
											<div class="pull-left unit_box">
												<c:forEach items="${carToolEnum}" var="item">
													<label class="checkbox-inline"> <input
														id="${item.message()}" name="tool" value="${item.name()}"
														type="checkbox" /> ${item.name()}
													</label>
												</c:forEach>
											</div>
											<a class="fa fa-edit " style="margin-left: 10px;"></a>
										</dd>
									</dl>
								</div>
							</div>

						</div>
						<div class="from_box">
							<div class="from_tit clearfix">
								<h3 class="pull-left">车辆评估信息</h3>
							</div>
							<div class="row">
								<div class="col-sm-3">
									<dl class="dl-horizontal">
										<dt>
											<i class="text-danger">*</i> 发动机
										</dt>
										<dd>
											<span id="engine"></span> <select class="control-sml"
												id="engine" name="engine">
												<option value="正常" id="正常">正常</option>
												<option value="异常" id="异常">异常</option>
											</select> <a class="fa fa-edit " style="margin-left: 10px;"></a>
										</dd>
									</dl>
								</div>
								<div class="col-sm-3">
									<dl class="dl-horizontal">
										<dt>
											<i class="text-danger">*</i> 发票价
										</dt>
										<dd>
											<span id="price"></span>
											<div class="pull-left unit_box">
												<input type="text" value="" class="control-sml"
													style="display: inline-block;" name="price" /> <b
													class="unit">万元</b>
											</div>
											<a class="fa fa-edit " style="margin-left: 10px;"></a>
										</dd>
									</dl>
								</div>
								<div class="col-sm-3">
									<dl class="dl-horizontal">
										<dt>机动车登记号码</dt>
										<dd>
											<span id="vehicleRegisterCode"></span> <input type="text"
												class="control-sml" id="vehicleRegisterCode"
												name="vehicleRegisterCode" maxlength="30"> <a
												class="fa fa-edit " style="margin-left: 10px;"></a>
										</dd>
									</dl>
								</div>
								<div class="col-sm-3">
									<dl class="dl-horizontal">
										<dt>
											<i class="text-danger">*</i> 购车方式
										</dt>
										<dd>
											<span id="buyTheWay"></span> <select class="control-sml"
												id="buyTheWay" name="buyTheWay">
												<option value="全款" id="全款">全款</option>
												<option value="按揭" id="按揭">按揭</option>
											</select> <a class="fa fa-edit " style="margin-left: 10px;"></a>
										</dd>
									</dl>

								</div>
							</div>
							<div class="row">
								<div class="col-sm-3">
									<dl class="dl-horizontal">
										<dt>评估价格</dt>
										<dd id="evaluatePrice"></dd>
									</dl>
								</div>
								<div class="col-sm-3">
									<dl class="dl-horizontal">
										<dt>评估师</dt>
										<dd id="evaluateby"></dd>
									</dl>
								</div>
								<div class="col-sm-6">
									<dl class="dl-horizontal">
										<dt>评估结论</dt>
										<dd>
											<span class="text-danger" id="evaluateConclusion"></span>
										</dd>
									</dl>
								</div>
							</div>
						</div>
					</div>
					<div role="tabpanel" class="tab-pane" id="tab7">
						<div class="row">
							<c:forEach items="${types}" var="type">
								<div class="col-sm-12">
									<section class="from_box">
										<div class="from_tit clearfix">

											<h3 class="pull-left">${type.name}</h3>
										</div>
										<div class="img_list">
											<ul class="list-inline" id="${type.id}">
												<!--循环插入图片 input框-->
												<c:forEach items="${attachments}" var="attachment">
													<c:if test="${attachment.attachmentParentId==type.id}">
														<c:choose>
															<c:when test="${attachment.attachmentType=='video'}">
																<c:choose>
																	<c:when test="${attachment.attachmentNum >1}">
																		<c:forEach var="num" begin="1" end="${attachment.attachmentNum}">
																			<li>
																				<div class="file_img file_mvo"
																					style="display: table-cell;"
																					id="video_${attachment.attachmentCode}${num}">
																					<p class="tools">
																						<a href="javascript:void(0);"
																							onclick="pictureDownload(995)" title="保存"><i
																							class="fa  fa-save"></i></a><a
																							href="javascript:void(0);" onclick="Edit(this)"
																							class="btn-edit" title="修改"><i
																							class="fa fa-edit"></i></a> <a
																							href="javascript:void(0);"
																							onclick="deleted(this)" class="btn-edit"
																							title="删除"><i class="fa fa-trash-o"></i></a>
																					</p>
																					<a href="#" title="放大"
																						id="${attachment.attachmentCode}${num}"> <input
																						type="hidden"
																						name="${attachment.attachmentCode}${num}" value=""
																						<c:if test="${attachment.attachmentRequired}">required="yes"</c:if> />
																						<span
																						id="recordingsIcon_${attachment.attachmentCode}${num}"
																						style="display: none"> <i
																							class="glyphicon glyphicon-file"
																							style="font-size: 64px;"></i> <label
																							id="recordings_${attachment.attachmentCode}${num}"
																							style="display: none"></label></span>
																					</a>
																				</div>
																				<section style="display: none;"
																					id="video2_${attachment.attachmentCode}${num}">
																					<div class="clearfix">
																						<a href="javascript:;" class="file pull-left">选择文件<input
																							id="up_${attachment.attachmentCode}${num}"
																							class="form-control" type="file"
																							data-url="${attachment.attachmentCode}${num}"></a><a
																							class="btn btn-default reply_btn pull-right"><i
																							class="fa fa-reply"></i></a>
																					</div>
																					<p class="file_img file_mvo">
																						<span
																							id="recordingsIcon_hidden_${attachment.attachmentCode}${num}"
																							style="display: none"> <i
																							class="glyphicon glyphicon-file"
																							style="font-size: 64px;"></i> <label
																							id="recordings_hidden_${attachment.attachmentCode}${num}"
																							style="display: none"></label></span>
																					</p>
																				</section>
																				<h4>
																					<c:if test="${attachment.attachmentRequired}">
																						<i class="text-danger">*</i>
																					</c:if>${attachment.attachmentName}${num}</h4>
																					<div id="${attachment.attachmentCode}${num}_progress"><div class=bar style='width: 0%;'></div></div>
																			</li>

																		</c:forEach>
																	</c:when>
																	<c:otherwise>
																		<li>
																			<div class="file_img file_mvo"
																				style="display: table-cell;"
																				id="video_${attachment.attachmentCode}">
																				<p class="tools">
																					<a href="javascript:void(0);"
																						onclick="pictureDownload(995)" title="保存"><i
																						class="fa  fa-save"></i></a><a
																						href="javascript:void(0);" onclick="Edit(this)"
																						class="btn-edit" title="修改"><i
																						class="fa fa-edit"></i></a> <a
																						href="javascript:void(0);" onclick="deleted(this)"
																						class="btn-edit" title="删除"><i
																						class="fa fa-trash-o"></i></a>
																				</p>
																				<a href="#" title="放大"
																					id="${attachment.attachmentCode}"> <input
																					type="hidden" name="${attachment.attachmentCode}"
																					value=""
																					<c:if test="${attachment.attachmentRequired}">required="yes"</c:if> />
																					<span
																					id="recordingsIcon_${attachment.attachmentCode}"
																					style="display: none"> <i
																						class="glyphicon glyphicon-file"
																						style="font-size: 64px;"></i> <label class="file_name"
																						id="recordings_${attachment.attachmentCode}"
																						style="display: none"></label></span>
																				</a>
																			</div>
																			<section style="display: none;"
																				id="video2_${attachment.attachmentCode}">
																				<div class="clearfix">
																					<a href="javascript:;" class="file pull-left">选择文件<input
																						id="up_${attachment.attachmentCode}"
																						class="form-control" type="file"
																						data-url="${attachment.attachmentCode}"></a><a
																						class="btn btn-default reply_btn pull-right"><i
																						class="fa fa-reply"></i></a>
																				</div>
																				<p class="file_img file_mvo">
																					<span
																						id="recordingsIcon_hidden_${attachment.attachmentCode}"
																						style="display: none"> <i
																						class="glyphicon glyphicon-file"
																						style="font-size: 64px;"></i> <label
																						id="recordings_hidden_${attachment.attachmentCode}"
																						style="display: none"></label></span>
																				</p>
																			</section>
																			<h4>
																				<c:if test="${attachment.attachmentRequired}">
																					<i class="text-danger">*</i>
																				</c:if>${attachment.attachmentName}</h4>
																				<div id="${attachment.attachmentCode}${num}_progress"><div class=bar style='width: 0%;'></div></div>
																		</li>
																	</c:otherwise>
																</c:choose>
															</c:when>
															<c:when test="${attachment.attachmentType=='audio'}">
																<li>
																	<div class="file_img file_vid"
																		style="display: table-cell;"
																		id="video_${attachment.attachmentCode}">
																		<p class="tools">
																			<a href="javascript:void(0);"
																				onclick="pictureDownload(995)" title="保存"><i
																				class="fa  fa-save"></i></a><a
																				href="javascript:void(0);" onclick="Edit(this)"
																				class="btn-edit" title="修改"><i
																				class="fa fa-edit"></i></a> <a
																				href="javascript:void(0);" onclick="deleted(this)"
																				class="btn-edit" title="删除"><i
																				class="fa fa-trash-o"></i></a>
																		</p>
																		<a href="#" title="放大"
																			id="${attachment.attachmentCode}"> <input
																			type="hidden" name="${attachment.attachmentCode}"
																			value=""
																			<c:if test="${attachment.attachmentRequired}">required="yes"</c:if> />
																			<span
																			id="recordingsIcon_${attachment.attachmentCode}"
																			style="display: none"> <i
																				class="glyphicon glyphicon-file"
																				style="font-size: 64px;"></i> <label class="file_name"
																				id="recordings_${attachment.attachmentCode}"
																				style="display: none"></label></span>
																		</a>
																	</div>
																	<section style="display: none;"
																		id="video2_${attachment.attachmentCode}">
																		<div class="clearfix">
																			<a href="javascript:;" class="file pull-left">选择文件<input
																				id="up_${attachment.attachmentCode}"
																				class="form-control" type="file"
																				data-url="${attachment.attachmentCode}"></a><a
																				class="btn btn-default reply_btn pull-right"><i
																				class="fa fa-reply"></i></a>
																		</div>
																		<p class="file_img file_mvo">
																			<span
																				id="recordingsIcon_hidden_${attachment.attachmentCode}"
																				style="display: none"> <i
																				class="glyphicon glyphicon-file"
																				style="font-size: 64px;"></i> <label
																				id="recordings_hidden_${attachment.attachmentCode}"
																				style="display: none"></label></span>
																		</p>
																	</section>
																	<h4>
																		<c:if test="${attachment.attachmentRequired}">
																			<i class="text-danger">*</i>
																		</c:if>${attachment.attachmentName}</h4>
																		<div id="${attachment.attachmentCode}${num}_progress"><div class=bar style='width: 0%;'></div></div>
																</li>
															</c:when>
															<c:otherwise>
																<c:choose>
																	<c:when test="${attachment.attachmentNum >1}">
																		<c:forEach var="num" begin="1" end="${attachment.attachmentNum}">
																			<li>
																				<div class="file_img" style="display: table-cell;">
																					<p class="tools">
																						<a href="javascript:void(0);"
																							onclick="pictureDownload(995)" title="保存"><i
																							class="fa  fa-save"></i></a><a
																							href="javascript:void(0);" onclick="Edit(this)"
																							class="btn-edit" title="修改"><i
																							class="fa fa-edit"></i></a> <a
																							href="javascript:void(0);"
																							onclick="deleted(this)" class="btn-edit"
																							title="删除"><i class="fa fa-trash-o"></i></a>
																					</p>
																					<a href="#" title="放大"
																						id="${attachment.attachmentCode}${num}"> <input
																						type="hidden"
																						name="${attachment.attachmentCode}${num}" value=""
																						<c:if test="${attachment.attachmentRequired}">required="yes"</c:if> />
																						<img class="example-image" src=""
																						id="img_${attachment.attachmentCode}${num}" />
																					</a>
																				</div>
																				<section style="display: none;">
																					<div class="clearfix">
																						<a href="javascript:;" class="file pull-left">选择文件<input
																							id="up_${attachment.attachmentCode}${num}"
																							class="form-control" type="file"
																							data-url="${attachment.attachmentCode}${num}"></a><a
																							class="btn btn-default reply_btn pull-right"><i
																							class="fa fa-reply"></i></a>
																					</div>
																					<p class="file_img">
																						<img>
																					</p>
																				</section>
																				<h4>
																					<c:if test="${attachment.attachmentRequired}">
																						<i class="text-danger">*</i>
																					</c:if>${attachment.attachmentName}${num}</h4>
																			<div id="${attachment.attachmentCode}${num}_progress"><div class=bar style='width: 0%;'></div></div>
																			</li>

																		</c:forEach>
																	</c:when>
																	<c:otherwise>
																		<li>
																			<div class="file_img" style="display: table-cell;">
																				<p class="tools">
																					<a href="javascript:void(0);"
																						onclick="pictureDownload(995)" title="保存"><i
																						class="fa  fa-save"></i></a><a
																						href="javascript:void(0);" onclick="Edit(this)"
																						class="btn-edit" title="修改"><i
																						class="fa fa-edit"></i></a> <a
																						href="javascript:void(0);" onclick="deleted(this)"
																						class="btn-edit" title="删除"><i
																						class="fa fa-trash-o"></i></a>
																				</p>
																				<a href="#" title="放大"
																					id="${attachment.attachmentCode}"> <input
																					type="hidden" name="${attachment.attachmentCode}"
																					 unique="${attachment.attachmentUnique}" parent_type="${type.id}" title="${attachment.attachmentName }""
																					<c:if test="${attachment.attachmentRequired}">required="yes"</c:if> />
																					<img class="example-image" src=""
																					id="img_${attachment.attachmentCode}" />
																				</a>
																			</div>
																			<section style="display: none;">
																				<div class="clearfix">
																					<a href="javascript:;" class="file pull-left">选择文件<input
																						id="up_${attachment.attachmentCode}"
																						class="form-control" type="file"
																						data-url="${attachment.attachmentCode}" "></a><a
																						class="btn btn-default reply_btn pull-right"><i
																						class="fa fa-reply"></i></a>
																				</div>
																				<p class="file_img">
																					<img>
																				</p>
																			</section>
																			<h4>
																				<c:if test="${attachment.attachmentRequired}">
																					<i class="text-danger">*</i>
																				</c:if>${attachment.attachmentName}</h4>
																				<div id="${attachment.attachmentCode}${num}_progress"><div class=bar style='width: 0%;'></div></div>
																		</li>
																	</c:otherwise>
																</c:choose>
															</c:otherwise>
														</c:choose>
			
													</c:if>
												</c:forEach>
											
												<div class="pull-right">
														<a class="btn btn-danger btn-xs" id="add_img_${type.id}" style="display:none"><i
															class="glyphicon glyphicon-plus"></i></a>
												</div>
											</ul>
										</div>
									</section>
								</div>
							</c:forEach>
						</div>
					<%-- 	<div class="row" id="contact_div" style="display: none;">
							<div class="col-sm-12">
								<div class="from_box">
									<div class="from_tit clearfix">
										<h3 class="pull-left">合同下载</h3>
									</div>
									<div class="ht_list">
										<ul class="list-inline">
											<li>
												<div class="file_img ">
													<img src="${basePath}/img/ht06.png" />
												</div>
												<h4 class="text-center">
													<i class="text-muted glyphicon glyphicon-cloud-download"></i>
													<a href="#" id="loan_apply"><i class=""></i>借款申请表</a>
												</h4>
											</li>
											<li>
												<div class="file_img">
													<img src="${basePath}/img/ht03.png" />
												</div>
												<h4 class="text-center">
													<i class="text-muted glyphicon glyphicon-cloud-download"></i>
													<a href="#" id="mortgage_contract">抵押合同</a>
												</h4>
											</li>
											<li>
												<div class="file_img">
													<img src="${basePath}/img/ht02.png" />
												</div>
												<h4 class="text-center">
													<i class="text-muted glyphicon glyphicon-cloud-download"></i>
													<a href="#" id="financing_services_agreement">融资服务协议</a>
												</h4>
											</li>
											<li>
												<div class="file_img">
													<img src="${basePath}/img/ht07.png" />
												</div>
												<h4 class="text-center">
													<i class="text-muted glyphicon glyphicon-cloud-download"></i>
													<a href="#" id="repay_plan">还款计划</a>
												</h4>
											</li>
											<li>
												<div class="file_img">
													<img src="${basePath}/img/ht04.png" />
												</div>
												<h4 class="text-center">
													<i class="text-muted glyphicon glyphicon-cloud-download"></i>
													<a href="#" id="pledge_contract">机动车质押合同</a>
												</h4>
											</li>
											<li>
												<div class="file_img">
													<img src="${basePath}/img/ht05.png" />
												</div>
												<h4 class="text-center">
													<i class="text-muted glyphicon glyphicon-cloud-download"></i>
													<a href="#" id="loan_receipt">借款收据</a>
												</h4>
											</li>
											<li>
												<div class="file_img">
													<img src="${basePath}/img/ht01.png" />
												</div>
												<h4 class="text-center">
													<i class="text-muted glyphicon glyphicon-cloud-download"></i>
													<a href="#" id="loan_contact">借款合同</a>
												</h4>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div> --%>
			<iframe src="" id="downloadIframe" style="display: none;"> </iframe>

			<!-- 线下签订相关合同 -->
			<div class="op_box" id="op_box_reuploadInformatin">
				<h4>附件和资料重新上传</h4>

				<div class="op_box_con clearfix">
					<div class="form-group">
						<label for="conclusion_reuploadInformatin"
							class="col-sm-2 control-label"><i class="text-danger">*</i>
							意见</label>
						<div class="col-sm-8">
							<textarea cols="168" rows="2" class="form-control"
								id="conclusion_reuploadInformatin" maxlength="50"
								name="conclusion"></textarea>
						</div>
					</div>
				</div>
				<div class="modal-footer ">
					<p class="col-sm-2 ">
						<a href="javascript:void(0)" onClick="closePage(0);"
							class="btn btn-default btn-block">关闭</a>
					</p>
					<p class="col-sm-2">
						<input type="submit" name="提交处理" class="btn btn-danger btn-block" />
					</p>
				</div>
			</div>
		</div>
		<input type="hidden" id="processDefinitionId"
			name="processDefinitionId" />
	</form>



	<div id="loan_attachment_div" style="display: none"></div>
</body>
</html>
