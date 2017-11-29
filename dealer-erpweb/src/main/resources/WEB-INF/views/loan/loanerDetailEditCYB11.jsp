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
</head>
<body>

	<div class="modal-header">
		<a type="button" href="javascript:void(0)" onClick="closePage();"
			class="close"><span aria-hidden="true">&times;</span></a>
		<h4 class="modal-title" id="myModalLabel" style="font-size: 16px;">
			查看订单<small style="padding-left: 20px; font-size: 14px;"
				class="text-danger" id="orderid">订单号：</small>
		</h4>
	</div>
	<input type="text" hidden="hidden" name="uuid" id="uuid">
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
		<ol class="ui-step ui-step-red ui-step-15" id="ol_vehiclesLoans_group"
			style="display: none;">
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
			<input type="hidden" id="processid">
			<!-- Tab panes -->
			<div class="tab-content clearfix">
				<div role="tabpanel" class="tab-pane active" id="tab2">
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
										<span id="isExamined"></span> <input type="checkbox"
											value="checkbox" class="control-sml" /> <a
											class="fa fa-edit " style="margin-left: 10px;"></a>
									</dd>
								</dl>
							</div>
							<div class="col-sm-3">
								<dl class="dl-horizontal">
									<dt>
										<i class="text-danger">*</i> 车辆商业全险是否购买
									</dt>
									<dd>
										<span id="isInsure"></span> <input type="checkbox"
											value="checkbox" class="control-sml" /> <a
											class="fa fa-edit " style="margin-left: 10px;"></a>
									</dd>
								</dl>
							</div>
							<div class="col-sm-3">
								<dl class="dl-horizontal">
									<dt>
										<i class="text-danger">*</i> 节假日是否驾驶车辆离省
									</dt>
									<dd>
										<span id="isProvince"></span> <input type="checkbox"
											value="checkbox" class="control-sml" /> <a
											class="fa fa-edit " style="margin-left: 10px;"></a>
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
										<span id="vehicleBrand"></span> <input type="text" value="宝马"
											class="control-sml" /> <a class="fa fa-edit "
											style="margin-left: 10px;"></a>
									</dd>
								</dl>
							</div>
							<div class="col-sm-3">
								<dl class="dl-horizontal">
									<dt>
										<i class="text-danger">*</i> 车辆型号
									</dt>
									<dd>
										<span id="vehicleModels"></span> <select class="control-sml">
											<option value="轿车">轿车</option>
											<option value="跑车">跑车</option>
											<option value="SUV">SUV</option>
											<option value="MPV">MPV</option>
											<option value="商用车">商用车</option>
											<option value="其他">其他</option>
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
										<span id="vehicleNo"></span> <input type="text"
											value="粤A766XC" class="control-sml" /> <a
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
											<input type="text" value="20" class="control-sml"
												style="display: inline-block;" /> <b class="unit">KM</b>
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
											name="indoor">
											<option value="4门5座三厢">4门5座三厢</option>
											<option value="5门5座两厢">5门5座两厢</option>
											<option value="其他">其他</option>
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
											data-date="" data-date-format="yyyy-mm"
											data-link-field="purchaseDate" data-link-format="yyyy-mm-dd"
											style="width: 160px; display: none;">
											<input class="control-sml" type="text"
												value="<fmt:formatDate value="${loanInfo.guaranteeEvaluateInfo.purchaseDate}"  pattern="yyyy-MM-dd" />"
												readonly style="width: 100%;"> <i
												class="input-group-addon"><i
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
											value="FDSFDGEGEWFEFFSFE" class="control-sml" /> <a
											class="fa fa-edit " style="margin-left: 10px;"></a>
									</dd>
								</dl>
							</div>
							<div class="col-sm-3">
								<dl class="dl-horizontal">
									<dt>
										<i class="text-danger">*</i> 发动机号
									</dt>
									<dd>
										<span id="engineNo"></span> <input type="text" value="97HD22"
											class="control-sml" /> <a class="fa fa-edit "
											style="margin-left: 10px;"></a>
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
										<span id="transmissionCase"></span> <input value="自动"
											class="control-sml" type="text"> <a
											class="fa fa-edit " style="margin-left: 10px;"></a>
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
											<input type="text" value="2.0" class="control-sml"
												style="display: inline-block;" /> <b class="unit">L</b>
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
											<label class="checkbox-inline"> <input
												id="inlineCheckbox1" name="indoor" value="智能钥匙"
												type="checkbox" /> 智能钥匙
											</label> <label class="checkbox-inline"> <input
												id="inlineCheckbox2" name="indoor" value="真皮座椅 "
												type="checkbox" /> 真皮座椅
											</label> <label class="checkbox-inline"> <input
												id="inlineCheckbox3" name="indoor" value="腰部支撑 "
												type="checkbox" /> 腰部支撑
											</label> <label class="checkbox-inline"> <input
												id="inlineCheckbox4" name="indoor" value="电动座椅"
												type="checkbox" /> 电动座椅
											</label> <label class="checkbox-inline"> <input
												id="inlineCheckbox5" name="darkLocks" value="暗锁"
												checked="checked" type="checkbox" /> 暗锁
											</label>
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
											<option value="两驱">两驱</option>
											<option value="四驱">四驱</option>
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
											<option value="黑色">黑色</option>
											<option value="白色">白色</option>
											<option value="灰色">灰色</option>
											<option value="红色">红色</option>
											<option value="银色">银色</option>
											<option value="蓝色">蓝色</option>
											<option value="金色">金色</option>
											<option value="棕色">棕色</option>
											<option value="橙色">橙色</option>
											<option value="黄色">黄色</option>
											<option value="紫色">紫色</option>
											<option value="绿色">绿色</option>
											<option value="褐色">褐色</option>
											<option value="栗色">栗色</option>
											<option value="米色">米色</option>
											<option value="银灰色">银灰色</option>
											<option value="青色">青色</option>
											<option value="香槟色">香槟色</option>
											<option value="咖啡色">咖啡色</option>
											<option value="天山白">天山白</option>
											<option value="其他色">其他色</option>
										</select> <a class="fa fa-edit " style="margin-left: 10px;"></a>
									</dd>
								</dl>
							</div>
							<!--
            <div class="col-sm-3">
              <dl class="dl-horizontal">
                <dt>配 置</dt>
                <dd id="configuration"></dd>
              </dl>
            </div>-->

							<div class="col-sm-3">
								<dl class="dl-horizontal">
									<dt>
										<i class="text-danger">*</i> 暗 锁
									</dt>
									<dd>
										<span id="darkLocks"></span> <select class="control-sml"
											name="islock">
											<option>有暗锁</option>
											<option>无暗锁</option>
										</select> <a class="fa fa-edit " style="margin-left: 10px;"></a>
									</dd>
								</dl>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-8">
								<dl class="dl-horizontal">
									<dt>
										<i class="text-danger">*</i> 随车工具
									</dt>
									<dd>
										<span id="carTool"></span>
										<div class="pull-left unit_box">
											<label class="checkbox-inline"> <input value="工具"
												name="tool" type="checkbox"> 工具
											</label> <label class="checkbox-inline"> <input value="千斤"
												name="tool" type="checkbox"> 千斤
											</label> <label class="checkbox-inline"> <input value="备胎"
												name="tool" type="checkbox"> 备胎
											</label> <label class="checkbox-inline"> <input value="备胎罩"
												name="tool" type="checkbox" checked> 备胎罩
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
											id="engine" name="engine" value="">
											<option value="正常">正常</option>
											<option value="异常">异常</option>
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
											<input type="text" value="20" class="control-sml"
												style="display: inline-block;" /> <b class="unit">万元</b>
										</div>
										<a class="fa fa-edit " style="margin-left: 10px;"></a>
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
											id="buyTheWay" name="buyTheWay" value="">
											<option value="全款">全款</option>
											<option value="按揭">按揭</option>
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
										<h3 class="pull-left">${type.message()}</h3>
									</div>
									<div class="img_list">
										<ul class="list-inline" id="${type.name()}">
											<!--循环插入图片-->
											<c:forEach items="${attachments}" var="attachment">
												<c:if test="${attachment.type().message()==type.message()}">
													<li>
														<div class="file_img" style="display: table-cell;">
															<p class="tools">
																<a href="javascript:void(0);"
																	onclick="pictureDownload(995)" title="保存"><i
																	class="fa  fa-save"></i></a><a href="javascript:void(0);"
																	onclick="Edit(this)" class="btn-edit" title="修改"><i
																	class="fa fa-edit"></i></a>
															</p>
															<a href="#" data-lightbox="set_img" data-title=""
																title="放大" id="${attachment.name()}"><img
																class="example-image" src="" id="" /></a>
														</div>
														<section style="display: none;">
															<div class="clearfix">
																<a href="javascript:;" class="file pull-left">选择文件<input
																	id="up_${attachment.name()}" class="form-control"
																	type="file" data-url="${attachment.name()}"></a><a
																	class="btn btn-default reply_btn pull-right"><i
																	class="fa fa-reply"></i></a>
															</div>
															<p class="file_img">
																<img id="img_${attachment.name()}">
															</p>
														</section>
														<h4>${attachment.message()}</h4>
													</li>
												</c:if>
											</c:forEach>
										</ul>
									</div>
								</section>
							</div>
						</c:forEach>
					</div>
					<div class="row" id="contact_div" style="display: none;">
						<div class="col-sm-12">
							<div class="from_box">
								<div class="from_tit clearfix">
									<h3 class="pull-left">合同下载</h3>
								</div>
								<div class="ht_list">
									<ul class="list-inline">
										<li>
											<div class="file_img ">
												<img src="${basePath}/img/ht01.png" />
											</div>
											<h4 class="text-center">
												<i class="text-muted glyphicon glyphicon-cloud-download"></i>
												<a href="#" id="loan_contact"><i class=""></i>借款合同</a>
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
												<img src="${basePath}/img/ht03.png" />
											</div>
											<h4 class="text-center">
												<i class="text-muted glyphicon glyphicon-cloud-download"></i>
												<a href="#" id="mortgage_contract">抵押合同</a>
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
												<img src="${basePath}/img/ht06.png" />
											</div>
											<h4 class="text-center">
												<i class="text-muted glyphicon glyphicon-cloud-download"></i>
												<a href="#" id="loan_apply">借款申请表</a>
											</h4>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<iframe src="" id="downloadIframe" style="display: none;"> </iframe>

		<!-- 线下签订相关合同 -->
		<div class="op_box" id="op_box_reuploadInformatin">
			<h4>附件和资料重新上传</h4>
			<form class="form-horizontal">
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
			</form>
		</div>
	</div>
	<div class="modal-footer ">
		<p class="col-sm-2 ">
			<a href="javascript:void(0)" onClick="closePage();"
				class="btn btn-default btn-block">关闭</a>
		</p>
		<p class="col-sm-2">
			<a id="submitA" href="javascript:void(0)" onClick="submitReview();"
				class="btn btn-danger btn-block">提交处理</a>
		</p>
	</div>
	<input type="hidden" id="processDefinitionId" />
	<div id="loan_attachment_div"></div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$(".fa-edit").click(function() {
			$(this).parent("dd").find("span").hide();
			$(this).parent("dd").find("input").show();
			$(this).parent("dd").find("select").show();
			$(this).parent("dd").find($(".unit_box")).show();
			$(this).parent("dd").find($(".form_date")).show();
		});
	});

	$("#recordings").hide();
	$("#recordingsIcon").hide();

	function loanController(taskId, processDefinitionId) {
		$("#op_box_" + processDefinitionId).css("display", "block");
	}

	function doReview(conclusion, loanId, reviewStatus, processDefinitionId,
			taskId, reviewMoney, lendDate) {
		$
				.ajax({
					type : 'POST',
					url : '${basePath}/admin/loan/review.html',
					data : {
						"conclusion" : conclusion,
						"loanId" : loanId,
						"reviewStatus" : reviewStatus,
						"processDefinitionId" : processDefinitionId,
						"taskId" : taskId,
						"reviewMoney" : reviewMoney,
						"lendDate" : lendDate
					},
					dataType : "text",
					success : function(data) {
						if (data == '0000') {
							if (((processDefinitionId == "lended") && (reviewStatus == 'loandirect'))
									|| (processDefinitionId == "reloan_lended")
									|| (processDefinitionId == "helploan_lended")
									|| ((processDefinitionId == "helploanReview") && (reviewStatus == "rejected"))
									|| ((processDefinitionId == "helploanApprove") && (reviewStatus == "rejected"))) {
								$
										.ajax({
											type : "POST",
											url : "/admin/loan/runRepaymentBpm",
											dataType : "text",
											data : {
												loanId : loanId
											},
											success : function(data) {
												layer
														.msg(
																"操作成功!",
																{
																	icon : 1,
																	time : 1000
																},
																function() {
																	$("#fade2")
																			.css(
																					"display",
																					"none");
																	parent.document
																			.getElementById('fade1').style.display = 'none';
																	if (window.location.href
																			.indexOf("category=0") > 0) {
																		document.location.href = '/admin/loan/agency.html?category=0';
																	} else if (window.location.href
																			.indexOf("category=1") > 0) {
																		document.location.href = '/admin/loan/agency.html?category=1';
																	} else if (window.location.href
																			.indexOf("lendedLoanInfoList") > 0) {
																		document.location.href = '/admin/loan/lendedLoanInfoList.html';
																	} else {
																		document.location.href = '/admin/loan/loanInfoList.html';
																	}
																	return true;
																});
											}
										});
							} else {
								//如果是再贷审批或者是助贷审批的情况下，在review的数据post成功后，需要需要进行贷款
								// 信息的保存。
								if (processDefinitionId == 'reloanApprove') {
									$
											.ajax({
												type : 'POST',
												url : '${basePath}/admin/loan/savereloaninfo.html',
												data : {
													"reloan_rate" : $(
															"#reloan_rate")
															.val(),
													"startDate_reloan" : $(
															"#startDate_reloan")
															.val(),
													"endDate_reloan" : $(
															"#endDate_reloan")
															.val(),
													"loanId" : loanId,
													"loankind" : "reloan"
												},
												dataType : "text",
												success : function(data) {
													if (data == '0000') {
														layer
																.msg(
																		"操作成功!",
																		{
																			icon : 1,
																			time : 1000
																		},
																		function() {
																			$(
																					"#fade2")
																					.css(
																							"display",
																							"none");
																			parent.document
																					.getElementById('fade1').style.display = 'none';
																			if (window.location.href
																					.indexOf("category=0") > 0) {
																				document.location.href = '/admin/loan/agency.html?category=0';
																			} else if (window.location.href
																					.indexOf("category=1") > 0) {
																				document.location.href = '/admin/loan/agency.html?category=1';
																			} else {
																				document.location.href = '/admin/loan/loanInfoList.html';
																			}
																			return true;
																		});
													} else {
														layer
																.msg(
																		"操作失败，请跟系统管理员联系!",
																		{
																			icon : 1,
																			time : 1000
																		},
																		function() {
																			$(
																					"#fade2")
																					.css(
																							"display",
																							"none");
																			parent.document
																					.getElementById('fade1').style.display = 'none';
																			if (window.location.href
																					.indexOf("category=0") > 0) {
																				document.location.href = '/admin/loan/agency.html?category=0';
																			} else if (window.location.href
																					.indexOf("category=1") > 0) {
																				document.location.href = '/admin/loan/agency.html?category=1';
																			} else {
																				document.location.href = '/admin/loan/loanInfoList.html';
																			}
																			return true;
																		});
													}
												},
												error : function() {
													layer.msg("系统错误!");
													return false;
												}
											});
								} else if (processDefinitionId == 'helploanApprove') {
									$
											.ajax({
												type : 'POST',
												url : '${basePath}/admin/loan/savereloaninfo.html',
												data : {
													"reloan_rate" : $(
															"#helploan_rate")
															.val(),
													"startDate_reloan" : $(
															"#startDate_helploan")
															.val(),
													"endDate_reloan" : $(
															"#endDate_helploan")
															.val(),
													"loanId" : loanId,
													"loankind" : "helploan"
												},
												dataType : "text",
												success : function(data) {
													if (data == '0000') {
														layer
																.msg(
																		"操作成功!",
																		{
																			icon : 1,
																			time : 1000
																		},
																		function() {
																			$(
																					"#fade2")
																					.css(
																							"display",
																							"none");
																			parent.document
																					.getElementById('fade1').style.display = 'none';
																			if (window.location.href
																					.indexOf("category=0") > 0) {
																				document.location.href = '/admin/loan/agency.html?category=0';
																			} else if (window.location.href
																					.indexOf("category=1") > 0) {
																				document.location.href = '/admin/loan/agency.html?category=1';
																			} else {
																				document.location.href = '/admin/loan/loanInfoList.html';
																			}
																			return true;
																		});
													} else {
														layer
																.msg(
																		"操作失败，请跟系统管理员联系!",
																		{
																			icon : 1,
																			time : 1000
																		},
																		function() {
																			$(
																					"#fade2")
																					.css(
																							"display",
																							"none");
																			parent.document
																					.getElementById('fade1').style.display = 'none';
																			if (window.location.href
																					.indexOf("category=0") > 0) {
																				document.location.href = '/admin/loan/agency.html?category=0';
																			} else if (window.location.href
																					.indexOf("category=1") > 0) {
																				document.location.href = '/admin/loan/agency.html?category=1';
																			} else {
																				document.location.href = '/admin/loan/loanInfoList.html';
																			}
																			return true;
																		});
													}
												},
												error : function() {
													layer.msg("系统错误!");
													return false;
												}
											});
								}
								{
									layer
											.msg(
													"操作成功!",
													{
														icon : 1,
														time : 1000
													},
													function() {
														$("#fade2").css(
																"display",
																"none");
														parent.document
																.getElementById('fade1').style.display = 'none';
														if (window.location.href
																.indexOf("category=0") > 0) {
															document.location.href = '/admin/loan/agency.html?category=0';
														} else if (window.location.href
																.indexOf("category=1") > 0) {
															document.location.href = '/admin/loan/agency.html?category=1';
														} else {
															document.location.href = '/admin/loan/loanInfoList.html';
														}
														return true;
													});
								}

							}

						} else {
							layer.msg("操作失败!可能原因：" + data);
							return false;
						}
					},
					error : function() {
						layer.msg("系统错误!");
						return false;
					}
				});
	}
	//下载合同共通函数
	function getLoanContractWord(loanId, type) {
		$.ajax({
			type : 'POST',
			url : '${basePath}/admin/loan/' + type + '.html',
			data : {
				"loanId" : loanId
			},
			dataType : "text",
			success : function(data) {
				var url = "${basePath}/loanAttachments/" + data;
				//				window.open(url, '_blank');
				location.href = url;
			},
			error : function() {
				layer.msg("系统错误!");
				return false;
			}
		})
	}

	/** 提交评审 */
	function submitReview() {
		var processDefinitionId = $("#processDefinitionId").val();
		var reviewStatus = $(
				'input[name="reviewStatus_' + processDefinitionId
						+ '"]:checked').val();
		var loanId = $("#customer_id_hidden").val().split(":")[0];
		var processDefinitionId = $("#customer_id_hidden").val().split(":")[3];
		var taskId = $("#customer_id_hidden").val().split(":")[2];
		var conclusionObj = $("#conclusion_" + processDefinitionId);
		var conclusion = conclusionObj.val();
		//由于再贷的还款日期控件与直贷(助贷)不同，因而需要进行分别判断
		var lendDate;
		if (processDefinitionId == 'reloan_lended') {
			lendDate = $("#lendDate_reloan").val();
		} else if (processDefinitionId == 'helploan_lended') {
			lendDate = $("#lendDate_helploan").val();
		} else {
			lendDate = $("#lendDate").val();
		}

		var reviewStatusStr = "通过";
		if (reviewStatus == "rejected") {
			reviewStatusStr = "拒绝";
		} else if (reviewStatus == "concludeAgain") {
			reviewStatusStr = "合同调整";
		} else {
			reviewStatus = "passed";
		}
		if (processDefinitionId === 'signContract') {
			/** 判断附件是否上传完毕 */
			var signContractReview = $("input[id='signContractReview']").val();//相关合同附件
			var oneCarPhoto = $("input[id='oneCarPhoto']").val();//人车合照
			var insurancePolicy = $("input[id='insurancePolicy']").val();//机动车交通强制保险单
			var falseKey = $("input[id='falseKey']").val();//车辆备用钥匙

			/** if (signContractReview == null || signContractReview == "") {
			      layer.msg("相关合同附件必须上传！");
			      return false;
			 }
			 if (oneCarPhoto == null || oneCarPhoto == "") {
			      layer.msg("人车合照必须上传！");
			      return false;
			 }
			 if (insurancePolicy == null || insurancePolicy == "") {
			      layer.msg("机动车交通强制保险单必须上传！");
			      return false;
			 }
			 if (falseKey == null || falseKey == "") {
			      layer.msg("车辆备用钥匙必须上传！");
			      return false;
			 }*/
			reviewStatusStr = '上传合同附件';

		} else if (processDefinitionId == 'reloanE_Contract') {
			reviewStatus = 'passed';
			reviewStatusStr = '已签订';
		} else if (processDefinitionId === 'lended') {
			//取得出款的方式
			var lendedMethod = $("input[name='loanMethodSelect'][checked]")
					.val();
			//助贷和直贷的情况下，必须进行出账和上传出账凭证
			if ((lendedMethod == 'loandirect') || (lendedMethod == 'helploan')) {
				if (lendDate == null || lendDate == "") {
					layer.msg("出账时间不能为空！");
					return false;
				}
				var lendedReview = $("#lendedReview").val();
				if (lendedReview == "" || lendedReview == null) {
					layer.msg("请上传出账凭证！");
					return false;
				}
			} else {
				//再贷的情况下，只需要进行评论的填写即可，其他不用做。
			}
			//设置review的状态
			reviewStatus = lendedMethod;
			//设置ONS表示的内容
			if (reviewStatus == 'loandirect') {
				reviewStatusStr = '直贷';
			} else if (reviewStatus == 'helploan') {
				reviewStatusStr = '助贷';
			} else if (reviewStatus == 'reloan') {
				reviewStatusStr = '再贷';
			}

		} else if (processDefinitionId === 'visiteCheck') {
			var visiteCheckReview = $("#visiteCheckReview").val();
			if (visiteCheckReview == "" || visiteCheckReview == null) {
				layer.msg("请上传家访凭证！");
				return false;
			}
		} else if (processDefinitionId === 'callBack') {
			if (reviewStatus == "rejected") {
				reviewStatusStr = "需家访";
			} else {
				reviewStatusStr = "无需家访";
			}
		} else if (processDefinitionId === 'mortgage') {
			if (reviewStatus == "rejected") {
				reviewStatusStr = "抵押失败";
			} else {
				reviewStatusStr = "抵押成功";
			}
		} else if (processDefinitionId === 'instock') {

			reviewStatusStr = "押品入库";
		} else if (processDefinitionId === 'dataReview') {
			if (reviewStatus == "rejected") {
				reviewStatusStr = "资料驳回";
			} else {
				reviewStatusStr = "资料上传无误";
			}
		} else if (processDefinitionId === 'lended') {
			if (reviewStatus == "loandirect") {
				reviewStatusStr = "直贷";
			} else if (reviewStatus == "reloan") {
				reviewStatusStr = "再贷";
			} else {
				reviewStatusStr = "助贷";
			}
		} else if ((processDefinitionId === 'reloanReview')
				|| (processDefinitionId === 'helploanReview')) {
			if (reviewStatus == "rejected") {
				reviewStatusStr = "放弃";
			} else {
				reviewStatusStr = "通过";
			}
		} else if ((processDefinitionId === 'reloanApprove')
				|| (processDefinitionId === 'helploanApprove')) {
			//设置提示语
			if (reviewStatus == "rejected") {
				reviewStatusStr = "放弃";
			} else {
				reviewStatusStr = "通过";
			}
			//对比填项目进行check
			if (reviewStatus != "rejected") {
				if (processDefinitionId === 'reloanApprove') {
					if ($("#reloan_rate").val() == '') {
						layer.msg("再贷利率不能为空，请确认!");
						return false;
					}
					if ($("#startDate_reloan").val() == '') {
						layer.msg("再贷开始日期不能为空，请确认！");
						return false;
					}
					if ($("#endDate_reloan").val() == '') {
						layer.msg("再贷预定结束日期不能为空，请确认！");
						return false;
					}
				} else {
					if ($("#helploan_rate").val() == '') {
						layer.msg("助贷利率不能为空，请确认!");
						return false;
					}
					if ($("#startDate_helploan").val() == '') {
						layer.msg("助贷开始日期不能为空，请确认！");
						return false;
					}
					if ($("#endDate_helploan").val() == '') {
						layer.msg("助贷预定结束日期不能为空，请确认！");
						return false;
					}
				}
			}
		} else if (processDefinitionId === 'reloanE_Contract') {

			reviewStatusStr = "上传再贷合同";
		} else if (processDefinitionId === 'reloan_lended') {

			reviewStatusStr = "再贷放款";
		} else if (processDefinitionId === 'helploanE_Contract') {

			reviewStatusStr = "上传助贷合同";
		} else if (processDefinitionId === 'helploan_lended') {

			reviewStatusStr = "助贷放款";
		}
		if (conclusion == null || conclusion == "") {
			layer.msg("评审意见不能为空！");
			conclusionObj.focus();
			return false;
		}
		//      var taskId = $("#taskId").val();
		var reviewMoney = $("#reviewMoney").val() * 10000;
		if (processDefinitionId == "judgment") {
			reviewMoney = $("#judgmentMoney").val() * 10000;
		}
		if (isNaN(reviewMoney) || reviewMoney <= 0) {
			layer.msg("审批金额不能为空！");
			return false;
		}
		var dialogMsg = "你确定<font color='red'>" + reviewStatusStr + "</font>吗？";

		alertMessage(dialogMsg, 'doReview("' + conclusion + '","' + loanId
				+ '","' + reviewStatus + '","' + processDefinitionId + '","'
				+ taskId + '","' + reviewMoney + '","' + lendDate + '")',
				'qs_box1');
	}
	$(function() {
		$('input[type="radio"]').click(function() {
			$("input[type='radio']").removeAttr("checked");
			$(this).attr("checked", "checked");
		});
		var aaa = $("#customer_id_hidden").val();
		var loanId = $("#customer_id_hidden").val().split(":")[0];
		var taskid = $("#customer_id_hidden").val().split(":")[2];
		var state = $("#customer_id_hidden").val().split(":")[5];
		var div = ""

		//alert(aaa);
		//alert(taskid);
		//alert(state);
		//在页面详情中，删除现在去评估按钮，原因是保留的话，还需要进行是否
		//签收的判断，因而考虑可以进行删除。
		//		if(state == "vehicleAssess"){
		//		  //alert(0);
		//		  $("#processid").val(taskid);
		//		   div= " <div class='alert alert-danger' role='alert'> "
		//					+" <i class='fa fa-exclamation-triangle' "
//					+" style='margin-right: 10px;'></i> 此订单还未进行车辆评估，<a href='#' onclick='caozuo();' "
		//					+" class='btn btn-sm btn-danger'>现在去评估</a> "
		//					+" </div> ";
		//		}
		$("#d1").html(div);
		//初始化上传图片地址
		var inputs = $("input[type='file']");
		$.each(inputs, function(value) {
			$(this).attr(
					"data-url",
					"/admin/file/upload/" + loanId + "/"
							+ $(this).attr('data-url') + ".html");
		});

		var doneProcess = function(data, obj) {
			$.each(data.result, function(index, file) {
				if (file.code == "0000") {
					layer.msg("上传成功！");
					if (file.fileName.indexOf(".mp3") > 0
							|| file.fileName.indexOf(".aac") > 0
							|| file.fileName.indexOf(".ape") > 0
							|| file.fileName.indexOf(".wma") > 0
							|| file.fileName.indexOf(".ac3") > 0
							|| file.fileName.indexOf(".amr") > 0
							|| file.fileName.indexOf(".flac") > 0
							|| file.fileName.indexOf(".m4r") > 0
							|| file.fileName.indexOf(".mmf") > 0
							|| file.fileName.indexOf(".mp2") > 0
							|| file.fileName.indexOf(".wav") > 0
							|| file.fileName.indexOf(".wv") > 0
							|| file.fileName.indexOf(".ogg") > 0) {
						$("#recordings").show();
						$("#recordingsIcon").show();
						$("#recordings").html(file.fileName);

					}
					$(obj).attr("src", file.showFilePath);
					$("#loan_attachment_div").load(
							"${basePath}/admin/loan/getUploadLoanAttachment.html?loanId="
									+ loanId);
				} else {
					if (file.code == "9999") {
						layer.msg("不支持此类型的文件！");
					}
				}
			});
		};
		var n = $(".fj_list>li").length + 20;
		$("#add_img")
				.click(
						function() {
							var loan_uuid = $("#customer_id_hidden").val()
									.split(":")[0];
							$("#li_add")
									.before(
											' <li><p>其他</p><div> <a href="javascript:;" class="file">选择文件<input type="file" name="files[]" id="up_img_WU_FILE_'+n+'" data-url="${basePath}/admin/file/upload/'+loan_uuid+'/other.html" ></a><p class="file_img"><img id="imgShow_WU_FILE_'+n+'" ></p></div></li>');
							$("#up_img_WU_FILE_" + n)
									.fileupload(
											{
												dataType : 'json',
												done : function(e, data) {
													doneProcess(
															data,
															$("#imgShow_WU_FILE_"
																	+ n));
												}
											});
							new uploadPreview({
								UpBtn : "up_img_WU_FILE_" + n,
								ImgShow : "imgShow_WU_FILE_" + n
							});
							n = n + 1;

						});

		var uuid;
		var customer_id_hiddenstr = $("#customer_id_hidden").val();
		var strarray = new Array();
		strarray = customer_id_hiddenstr.split(":");
		var customer_id_hidden = strarray[0];
		var orderid = strarray[1];
		var taskId = strarray[2];
		var processDefinitionId = strarray[3];
		var assignee = strarray[4];
		var channel = strarray[6];
		$("#processDefinitionId").val(processDefinitionId);

		//如果是车辆评估节点，则不显示提交处理按钮
		if (processDefinitionId == "vehicleAssess") {
			$("#submitA").hide();
		} else {
			//流程画面控制
			if ("null" != assignee && "" != assignee) {
				if ("yes" == channel) {
					$("#submitA").hide();
				} else {
					loanController(taskId, processDefinitionId);
					$("#submitA").show();
				}
			} else {
				$("#submitA").hide();
			}
		}

		/*BUG277*/

		//设置订单号
		$("#orderid").html("订单号:" + orderid);
		//取得贷款历史数据
		$
				.ajax({
					url : "/admin/loan/historyloanlist?uuid="
							+ customer_id_hidden,
					type : "get",
					dataType : "json",
					success : function(data) {
						var length = data.historyLoanlist.length;
						var dspstr = "";
						for (var i = 0; i < length; i++) {
							var record = data.historyLoanlist[i];
							var loanstatus = "";
							//对贷款状态进行转换
							if (record.loanStatus == "vehicleAssess") {
								loanstatus = "待车辆评估";
							} else if (record.loanStatus == "departLeadAduit") {
								loanstatus = "待初审";
							} else if (record.loanStatus == "departLeadAduit_rejected") {
								loanstatus = "初审不通过";
							} else if (record.loanStatus == "trialPhase") {
								loanstatus = "待总部面审";
							} else if (record.loanStatus == "trialPhase_rejected") {
								loanstatus = "总部面审不通过";
							} else if (record.loanStatus == "callBack") {
								loanstatus = "待电话核实";
							} else if (record.loanStatus == "visiteCheck") {
								loanstatus = "待线下上门核实";
							} else if (record.loanStatus == "judgment") {
								loanstatus = "待总部终审";
							} else if (record.loanStatus == "judgment_rejected") {
								loanstatus = "总部终审不通过";
							} else if (record.loanStatus == "signContract") {
								loanstatus = "待线下签订相关合同";
							} else if (record.loanStatus == "signContract_rejected") {
								loanstatus = "签订合同终止";
							} else if (record.loanStatus == "dataReview") {
								loanstatus = "资料复核";
							} else if (record.loanStatus == "reuploadInformatin") {
								loanstatus = "资料或相关合同重新上传";
							} else if (record.loanStatus == "lended") {
								loanstatus = "待出账";
							} else if (record.loanStatus == "repayment") {
								loanstatus = "还款中";
							} else if (record.loanStatus == "end") {
								loanstatus = "已完结";
							} else if (record.loanStatus == "mortgage") {
								loanstatus = "待办理抵押";
							} else if (record.loanStatus == "instock") {
								loanstatus = "待办理入库";
							} else if (record.loanStatus == "reloanReview") {
								loanstatus = "待再贷资料复核";
							} else if (record.loanStatus == "reloanApprove") {
								loanstatus = "待再贷审批";
							} else if (record.loanStatus == "reloanE_Contract") {
								loanstatus = "待再贷电子合同签订";
							} else if (record.loanStatus == "reloan_lended") {
								loanstatus = "待再贷放款";
							} else if (record.loanStatus == "helploanReview") {
								loanstatus = "待助贷资料复核";
							} else if (record.loanStatus == "helploanApprove") {
								loanstatus = "待助贷审批";
							} else if (record.loanStatus == "helploanE_Contract") {
								loanstatus = "待助贷电子合同签订";
							} else if (record.loanStatus == "helploan_lended") {
								loanstatus = "待助贷放款";
							}
							var str = "<tr>" + "<td>"
									+ record.customerRegisterInfo.customerName
									+ "</td>" + "<td>" + record.idCard
									+ "</td>" + "<td>" + record.applyMoney
									+ "</td>" + "<td>" + record.loanMoney
									+ "</td>" + "<td>" + record.applyedAt
									+ "</td>" + "<td>" + loanstatus + "</td>"
									+ "<td>" + record.company.name + "</td>"
									+ "<td>" + record.dept.name + "</td>"
									+ "<td>" + record.responsibleBy.realname
									+ "</td>" + "</tr>";
							dspstr = dspstr + str;
						}
						$("#historytable tr:last").after(dspstr);
					}
				});
		//取得借款数据
		$
				.ajax({
					url : "/admin/loan/loanreqinfo?uuid=" + customer_id_hidden,
					type : "get",
					dataType : "json",
					success : function(data) {
						//申请金额处理
						var applymoney = data.loanInfo.applyMoney / 10000;
						if (data.loanInfo.loanMoney == '0.00') {
							$("#reviewMoney").val(applymoney);
							$("#judgmentMoney").val(applymoney);
						} else if (data.loanInfo.loanMoney != '0.00') {
							$("#reviewMoney").val(
									data.loanInfo.loanMoney / 10000);
							$("#judgmentMoney").val(
									data.loanInfo.loanMoney / 10000);
						}
						var applaymoneyround = getRoundDigital(applymoney, 2);
						var dispstr = "<b class=\"text-danger\">";
						dispstr = dispstr + applaymoneyround;
						dispstr = dispstr + "</b> 万元";
						$("#applyMoney").html(dispstr);
						//审批金额
						var approvemoney = data.loanInfo.loanMoney / 10000;
						var approvemoneyround = getRoundDigital(approvemoney, 2);
						dispstr = "<b class=\"text-danger\">";
						dispstr = dispstr + approvemoneyround;
						dispstr = dispstr + "</b> 万元";
						$("#approveMoney").html(dispstr);
						//借款状态
						var record = data.loanInfo;
						if (record.loanStatus == "vehicleAssess") {
							loanstatus = "待车辆评估";
						} else if (record.loanStatus == "departLeadAduit") {
							loanstatus = "待初审";
						} else if (record.loanStatus == "departLeadAduit_rejected") {
							loanstatus = "初审不通过";
						} else if (record.loanStatus == "trialPhase") {
							loanstatus = "待总部面审";
						} else if (record.loanStatus == "trialPhase_rejected") {
							loanstatus = "总部面审不通过";
						} else if (record.loanStatus == "callBack") {
							loanstatus = "待电话核实";
						} else if (record.loanStatus == "visiteCheck") {
							loanstatus = "待线下上门核实";
						} else if (record.loanStatus == "judgment") {
							loanstatus = "待总部终审";
						} else if (record.loanStatus == "judgment_rejected") {
							loanstatus = "总部终审不通过";
						} else if (record.loanStatus == "signContract") {
							loanstatus = "待线下签订相关合同";
						} else if (record.loanStatus == "signContract_rejected") {
							loanstatus = "签订合同终止";
						} else if (record.loanStatus == "dataReview") {
							loanstatus = "资料复核";
						} else if (record.loanStatus == "reuploadInformatin") {
							loanstatus = "资料或相关合同重新上传";
						} else if (record.loanStatus == "lended") {
							loanstatus = "待出账";
						} else if (record.loanStatus == "repayment") {
							loanstatus = "还款中";
						} else if (record.loanStatus == "end") {
							loanstatus = "已完结";
						} else if (record.loanStatus == "mortgage") {
							loanstatus = "待办理抵押";
						} else if (record.loanStatus == "instock") {
							loanstatus = "待办理入库";
						} else if (record.loanStatus == "reloanReview") {
							loanstatus = "待再贷资料复核";
						} else if (record.loanStatus == "reloanApprove") {
							loanstatus = "待再贷审批";
						} else if (record.loanStatus == "reloanE_Contract") {
							loanstatus = "待再贷电子合同签订";
						} else if (record.loanStatus == "reloan_lended") {
							loanstatus = "待再贷放款";
						} else if (record.loanStatus == "helploanReview") {
							loanstatus = "待助贷资料复核";
						} else if (record.loanStatus == "helploanApprove") {
							loanstatus = "待助贷审批";
						} else if (record.loanStatus == "helploanE_Contract") {
							loanstatus = "待助贷电子合同签订";
						} else if (record.loanStatus == "helploan_lended") {
							loanstatus = "待助贷放款";
						}
						$("#loanstatus").html(loanstatus);
						//订单号
						$("#loanorderid").html(orderid);
						//借款人
						$("#loanername")
								.html(
										data.loanInfo.customerRegisterInfo.customerName);

						var pledgeType = data.loanInfo.pledgeType;
						var pledgeTypeStr = "";
						if (pledgeType == "drivePledge") {
							pledgeTypeStr = "押证";
						} else if (pledgeType == "vehiclePledge") {
							pledgeTypeStr = "押车";
						}
						$("#mortgageType").html(pledgeTypeStr);
						//申请时间
						$("#applytime").html(data.loanInfo.applyedAt);
						//还款来源
						$("#repaymentsrc").html(data.loanInfo.repaySource);
						//所属分公司
						$("#loancompany").html(data.loanInfo.company.name);
						//所属部门
						$("#loandept").html(data.loanInfo.dept.name);
						//客户经理
						$("#customermanager").html(
								data.loanInfo.responsibleBy.realname);
						//录入人
						$("#loanrecorder")
								.html(data.loanInfo.createBy.realname);
						//录入时间
						$("#createtime").html(data.loanInfo.createdAt);
						//年利率
						var yearrate = data.loanInfo.loanRate;
						var yearratestr = getRoundDigital(yearrate, 2);
						yearratestr += "%";
						$("#yearrate").html(yearratestr);
						//月利率
						var monthrate = yearrate / 12;
						var monthratestr = getRoundDigital(monthrate, 2);
						monthratestr += "%";
						$("#monthrate").html(monthratestr);
						//贷款期限
						var periodstr = data.loanInfo.loanLimitTime;
						periodstr += "个月";
						$("#period").html(periodstr);
						//开户名
						var accountname = data.accountInfo.accountName;
						$("#accountname").html(accountname);
						//开户行
						var accountbank = data.accountInfo.bankName;
						$("#accountbank").html(accountbank);
						//银行账号
						var accountnumber = data.accountInfo.accountNum;
						$("#accountnumber").html(accountnumber);
						//还款方式追加
						var repayway = record.repayWay;
						//记录还款方式用于进行贷款续借的时候进行使用。
						var repaywaystr = "";
						if (repayway == "AverageCapitalPlusInterest") {
							repaywaystr = "等本等息";
						} else if (repayway == "InterestRatesBefore") {
							repaywaystr = "先息后本";
						} else if (repayway == "flexiblerepaymentv2") {
							repaywaystr = "灵活还款";
						} else if (repayway == "averagePrincipalreduceinterest") {
							repaywaystr = "等本减息";
						} else if (repayway == "averagePrincipalzerointerestrent") {
							repaywaystr = "等本零息(押证)";
						} else if (repayway == "intrestbeforePrincipalrent") {
							repaywaystr = "先息后本(押证)";
						} else if (repayway == "intrestbeforePrincipaltransfer") {
							repaywaystr = "先息后本(押车)";
						}
						$("#repayWay").html(repaywaystr);

						//数据显示更新 by why 20160918
						$("#loanPurpose").html(data.loanInfo.loanPurpose);
						$("#hostOpinion").html(data.loanInfo.hostOpinion);
						$("#loan_remark").html(data.loanInfo.remark);
						var loan_product = "";
						switch (data.loanInfo.loan_product) {
						case "0":
							loan_product = "车抵贷";
							break;
						case "1":
							loan_product = "押车贷";
							break;
						case "2":
							loan_product = "车主贷";
							break;
						case "3":
							loan_product = "车商贷";
							break;
						case "4":
							loan_product = "首付贷";
							break;
						case "5":
							loan_product = "二手车分期";
							break;
						case "6":
							loan_product = "以租代购";
							break;
						}
						$("#loan_product").html(loan_product);

						$("#buy_car_method").html(
								data.loanInfo.buy_car_method == "0" ? "全款"
										: "按揭");

						$("#plantype").html(
								data.loanInfo.plantype == "0" ? "综合服务费按月收取"
										: "综合服务费一次性收取");

						$("#drunkDrive").html(data.loanInfo.drunkDrive + "%");

						$("#depreciationFee").html(
								data.loanInfo.depreciationFee + "%");

						$("#parkCost").html(
								(data.loanInfo.parkCost == "" ? "0"
										: data.loanInfo.parkCost)
										+ "元");
						//数据显示更新 by why 20160918

						//合同相关下载的相关信息取得
						var loaninfo = data.loanInfo;
						if ((loaninfo.loanStatus == 'signContract')
								|| (loaninfo.loanStatus == 'callBack')
								|| (loaninfo.loanStatus == 'signContract_rejected')
								|| (loaninfo.loanStatus == 'dataReview')
								|| (loaninfo.loanStatus == 'reuploadInformatin')
								|| (loaninfo.loanStatus == 'lended')) {
							$("#contact_div").css("display", "block");
							//设置合同下载为可见状态
							var loanId = loaninfo.uuid;
							//贷款合同
							$("#loan_contact").attr(
									"href",
									"javascript:getLoanContractWord(\'"
											+ loanId
											+ "\', \'getLoanContractWord\')");
							//融资服务协议
							$("#financing_services_agreement").attr(
									"href",
									"javascript:getLoanContractWord(\'"
											+ loanId
											+ "\', \'getLoanServiceWord\')");
							//抵押合同
							$("#mortgage_contract")
									.attr(
											"href",
											"javascript:getLoanContractWord(\'"
													+ loanId
													+ "\', \'getLoanPledgeContractWord\')");
							//机动车质押合同
							$("#pledge_contract")
									.attr(
											"href",
											"javascript:getLoanContractWord(\'"
													+ loanId
													+ "\', \'getLoanPledgeGuaranteeContractWord\')");
							//借款收据
							$("#loan_receipt").attr(
									"href",
									"javascript:getLoanContractWord(\'"
											+ loanId
											+ "\', \'getloan_receiptWord\')");
							//借款申请表loan_apply
							$("#loan_apply").attr(
									"href",
									"javascript:getLoanContractWord(\'"
											+ loanId
											+ "\', \'loan_applyFormExcel\')");
						} else {
							//设置合同下载为不可见状态
							$("#contact_div").css("display", "none");
						}
						//设置状态进度条
						var processDefinitionId = $("#processDefinitionId")
								.val();
						//如果当前节点是重新长传附件节点，表示为复核节点
						if (processDefinitionId == 'reuploadInformatin') {
							processDefinitionId = 'dataReview';
						}
						setStatusBar(processDefinitionId, pledgeType);
					}
				});
		function getRoundDigital(digit, length) {
			length = length ? parseInt(length) : 0;
			if (length <= 0)
				return Math.round(digit);
			digit = Math.round(digit * Math.pow(10, length))
					/ Math.pow(10, length);
			return digit;
		}
		$
				.ajax({
					url : "/admin/customer/loanerDetailInfo?uuid="
							+ customer_id_hidden,
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
						var enterpriseIndustry = data.customerAdditionalInfo.enterpriseIndustry;
						var enterpriseIndustry1;

						uuid = data.customerRegisterInfo.uuid;

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
						if (enterpriseIndustry == "1") {
							enterpriseIndustry1 = "计算机/互联网/通信/电子";
						} else if (enterpriseIndustry == "2") {
							enterpriseIndustry1 = "会计/金融/银行/保险";
						} else if (enterpriseIndustry == "3") {
							enterpriseIndustry1 = "贸易/消费/制造/营运";
						} else if (enterpriseIndustry == "4") {
							enterpriseIndustry1 = "制药/医疗";
						} else if (enterpriseIndustry == "5") {
							enterpriseIndustry1 = "广告/媒体";
						} else if (enterpriseIndustry == "6") {
							enterpriseIndustry1 = "房地产/建筑";
						} else if (enterpriseIndustry == "7") {
							enterpriseIndustry1 = "专业服务/教育/培训";
						} else if (enterpriseIndustry == "8") {
							enterpriseIndustry1 = "服务业";
						} else if (enterpriseIndustry == "9") {
							enterpriseIndustry1 = "物流/运输";
						} else if (enterpriseIndustry == "a") {
							enterpriseIndustry1 = "能源/原材料";
						} else if (enterpriseIndustry == "b") {
							enterpriseIndustry1 = "私营企业主";
						} else if (enterpriseIndustry == "c") {
							enterpriseIndustry1 = "政府/非赢利机构/其他";
						}

						$("#uuid").html(uuid);
						$("#customerName1").html(
								data.customerRegisterInfo.customerName);
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

						// 						alert(data.customerRegisterInfo.remark)
						//数据显示更新 by why 20160918
						$("#sex").html(
								data.customerRegisterInfo.sex == 'M' ? '男'
										: '女');
						$("#age").html(data.customerRegisterInfo.age);
						var customer_from;
						switch (data.customerAdditionalInfo.customer_from) {
						case 0:
							customer_from = "中  介";
							break;
						case 1:
							customer_from = "客户推荐";
							break;
						case 2:
							customer_from = "宣传单/卡";
							break;
						case 3:
							customer_from = "小区推广";
							break;
						case 4:
							customer_from = "短  信";
							break;
						case 5:
							customer_from = "网络营销";
							break;
						case 6:
							customer_from = "电  销";
							break;
						case 7:
							customer_from = "其  他";
							break;
						}
						$("#customerFrom").html(customer_from);
						$("#homeTel").html(data.customerRegisterInfo.home_tel);
						$("#kosekiAddress").html(
								data.customerRegisterInfo.kosekiAddress);

						$("#residence_period").html(
								data.customerRegisterInfo.residence_period
										+ "年");

						$("#number_of_children").html(
								data.customerRegisterInfo.number_of_children);

						var cohabitant = "";
						switch (data.customerRegisterInfo.cohabitant) {
						case 0:
							cohabitant = "父母";
							break;
						case 1:
							cohabitant = "子女";
							break;
						case 2:
							cohabitant = "配偶";
							break;
						case 3:
							cohabitant = "其他";
							break;
						}
						$("#cohabitant").html("与" + cohabitant + "共住");

						var house = "";
						switch (data.customerRegisterInfo.house) {
						case "commodity":
							house = "自建";
							break;
						case "commodity_mortgage":
							house = "自购";
							break;
						case "kinsfolk":
							house = "亲属住房";
							break;
						case "dormitory":
							house = "单位住房";
							break;
						case "rent":
							house = "租用" + "（月租金"
									+ data.customerRegisterInfo.room_charge
									+ "元）";
							break;
						}

						$("#house").html(house);

						$("#status_of_children").html(
								data.customerRegisterInfo.status_of_children);

						$("#residence_period_current")
								.html(
										data.customerRegisterInfo.residence_period_current
												+ "年");

						var enterpriseIndustry = "";
						switch (data.customerAdditionalInfo.enterpriseIndustry) {
						case "1":
							enterpriseIndustry = "个体";
							break;
						case "2":
							enterpriseIndustry = "个人独资/合伙企业";
							break;
						case "3":
							enterpriseIndustry = "有限责任公司";
							break;
						case "4":
							enterpriseIndustry = "国企、事业单位";
							break;
						case "5":
							enterpriseIndustry = "法人";
							break;
						}
						if (data.customerAdditionalInfo.shareholding_ratio != "") {
							enterpriseIndustry += "(持股"
									+ data.customerAdditionalInfo.shareholding_ratio
									+ "%)";
						}

						$("#enterpriseIndustry").html(enterpriseIndustry);

						$("#deptName").html(
								data.customerAdditionalInfo.deptName);

						$("#has_social_security_cards")
								.html(
										data.customerAdditionalInfo.has_social_security_cards == 1 ? "有"
												: "无");

						$("#dateJoined").html(
								data.customerAdditionalInfo.dateJoined
										.substring(0, 10));

						$("#ismanufacturing")
								.html(
										data.customerAdditionalInfo.ismanufacturing == 1 ? "是"
												: "否");

						var companyType = "";
						switch (data.customerAdditionalInfo.companyType) {
						case "no":
							companyType = "无";
							break;
						case "individual_businesses":
							companyType = "个体商户";
							break;
						case "ltd":
							companyType = "有限公司";
							break;
						}

						$("#companyType").html(companyType);

						$("#companyRegisterAt").html(
								data.customerAdditionalInfo.companyRegisterAt
										.substring(0, 10));

						$("#has_businesslicence")
								.html(
										data.customerAdditionalInfo.has_businesslicence == 1 ? "有"
												: "无");

						$("#employees_number").html(
								data.customerAdditionalInfo.employees_number);

						$("#business_hours").html(
								data.customerAdditionalInfo.business_hours
										.substring(0, 10));

						$("#business").html(
								data.customerAdditionalInfo.business);

						$("#incomeStatement").html(
								data.customerAdditionalInfo.incomeStatement);

						$("#house_number").html(
								data.customerAdditionalInfo.house_number);

						$("#house_buy_date").html(
								data.customerAdditionalInfo.house_buy_date
										.substring(0, 10));

						$("#house_addr").html(
								data.customerAdditionalInfo.house_addr);

						$("#car_license_plate").html(
								data.customerAdditionalInfo.car_license_plate);

						$("#car_brand").html(
								data.customerAdditionalInfo.car_brand);

						$("#house_buy_price").html(
								data.customerAdditionalInfo.house_buy_price
										+ "万元");

						$("#car_buy_date").html(
								data.customerAdditionalInfo.car_buy_date
										.substring(0, 10));

						$("#bare_car_price").html(
								data.customerAdditionalInfo.bare_car_price);

						$("#family_car_number").html(
								data.customerAdditionalInfo.family_car_number);

						var house_ownership = "";
						switch (data.customerAdditionalInfo.house_ownership) {
						case 0:
							house_ownership = "本人名下";
							break;
						case 1:
							house_ownership = "配偶或父母名下";
							break;
						case 2:
							house_ownership = "自建房";
							break;
						case 3:
							house_ownership = "其他";
							break;
						}
						$("#house_ownership").html(house_ownership);

						$("#house_buy_way")
								.html(
										data.customerAdditionalInfo.house_buy_way == "0" ? "一次性"
												: "按揭(月供"
														+ data.customerAdditionalInfo.house_monthly_mortgage_payment
														+ "元)");

						$("#car_buy_way")
								.html(
										data.customerAdditionalInfo.car_buy_way == "0" ? "一次性"
												: "按揭(月供"
														+ data.customerAdditionalInfo.car_monthly_mortgage_payment
														+ "元)");

						$("#insurance_type").html(
								data.customerAdditionalInfo.insurance_type);
						//数据显示更新 by why 20160918

						$
								.get(
										"${basePath}/admin/customer/queryContactsCusId.html?uuid="
												+ uuid,
										function(result) {
											$(result)
													.each(
															function(i) {
																if (result[i].relation == "配偶") {
																	$(
																			"#spouse_id")
																			.val(
																					result[i].id);
																	$(
																			"#spouse_name")
																			.html(
																					result[i].contactsName);
																	$(
																			"#spouse_tel")
																			.html(
																					result[i].contactsTel);
																	$(
																			"#spouse_mobile")
																			.html(
																					result[i].contactsMobile)
																	$(
																			"#spouse_ck")
																			.attr(
																					"checked",
																					result[i].know);
																}
																if (result[i].contactsTel == "直系亲属1") {
																	$(
																			"#immediate_id1")
																			.val(
																					result[i].id);
																	$(
																			"#immediate_name1")
																			.html(
																					result[i].contactsName);
																	$(
																			"#immediate_relation1")
																			.html(
																					result[i].relation);
																	$(
																			"#immediate_Mobile1")
																			.html(
																					result[i].contactsMobile);
																	$(
																			"#immediate_ck1")
																			.attr(
																					"checked",
																					result[i].know);
																}
																if (result[i].contactsTel == "直系亲属2") {
																	$(
																			"#immediate_id2")
																			.val(
																					result[i].id);
																	$(
																			"#immediate_name2")
																			.html(
																					result[i].contactsName);
																	$(
																			"#immediate_relation2")
																			.html(
																					result[i].relation);
																	$(
																			"#immediate_Mobile2")
																			.html(
																					result[i].contactsMobile);
																	$(
																			"#immediate_ck2")
																			.attr(
																					"checked",
																					result[i].know);
																}
																if (result[i].contactsTel == "其他联系人1") {
																	$(
																			"#other_id1")
																			.val(
																					result[i].id);
																	$(
																			"#other_name1")
																			.html(
																					result[i].contactsName);
																	$(
																			"#other_relation1")
																			.html(
																					result[i].relation);
																	$(
																			"#other_mobile1")
																			.html(
																					result[i].contactsMobile);
																	$(
																			"#other_ck1")
																			.attr(
																					"checked",
																					result[i].know);
																}
																if (result[i].contactsTel == "其他联系人2") {
																	$(
																			"#other_id2")
																			.val(
																					result[i].id);
																	$(
																			"#other_name2")
																			.html(
																					result[i].contactsName);
																	$(
																			"#other_relation2")
																			.html(
																					result[i].relation);
																	$(
																			"#other_mobile2")
																			.html(
																					result[i].contactsMobile);
																	$(
																			"#other_ck2")
																			.attr(
																					"checked",
																					result[i].know);
																}
															});
										})

					}

				});
		$
				.ajax({
					url : "/admin/customer/getCarInfo?uuid="
							+ customer_id_hidden,
					type : "get",
					dataType : "json",
					success : function(data) {
						var details = data.guaranteeEvaluateInfo.indoor
								.split(",");
						var indoor = "";
						var transmissionCase = data.guaranteeEvaluateInfo.indoor
								.split(",")[0];
						var structure = data.guaranteeEvaluateInfo.indoor
								.split(",")[1];
						$("#isExamined").html(
								data.guaranteeEvaluateInfo.isExamined);
						$("#isInsure")
								.html(data.guaranteeEvaluateInfo.isInsure);
						$("#isProvince").html(
								data.guaranteeEvaluateInfo.isProvince);
						$("#vehicleBrand").html(
								data.guaranteeEvaluateInfo.vehicleBrand);
						$("#vehicleModels").html(
								data.guaranteeEvaluateInfo.vehicleModels);
						$("#vehicleNo").html(
								data.guaranteeEvaluateInfo.vehicleNo);
						$("#mileaged").html(
								data.guaranteeEvaluateInfo.mileaged + "km");
						$("#purchaseDate").html(
								data.guaranteeEvaluateInfo.purchaseDate
										.substring(0, 10));
						$("#vehicleIdentification")
								.html(
										data.guaranteeEvaluateInfo.vehicleIdentification);
						$("#engineNo")
								.html(data.guaranteeEvaluateInfo.engineNo);
						for (var i = 2; i < details.length; i++) {
							indoor = indoor + " " + details[i];
						}
						if ("" == indoor || null == indoor) {
							indoor = "无装置";
						}
						$("#indoor").html(indoor);
						$("#transmissionCase").html(transmissionCase);
						$("#configuration").html(
								data.guaranteeEvaluateInfo.configuration);
						$("#structure").html(structure);
						$("#color").html(data.guaranteeEvaluateInfo.color);
						$("#tire").html(data.guaranteeEvaluateInfo.tire);
						$("#displacement").html(
								data.guaranteeEvaluateInfo.displacement + "L");
						var darkLocks1 = data.guaranteeEvaluateInfo.darkLocks;
						if ("" == darkLocks1 || null == darkLocks1) {
							$("#darkLocks").html("无暗锁");
						} else {
							$("#darkLocks").html("有暗锁");
						}
						var carTool = data.guaranteeEvaluateInfo.tool;
						if ("" == carTool || null == carTool) {
							carTool = "无随车工具";
						}
						$("#carTool").html(carTool);
						$("#engine").html(data.guaranteeEvaluateInfo.engine);
						$("#price").html(
								data.guaranteeEvaluateInfo.price + "万元");
						$("#buyTheWay").html(
								data.guaranteeEvaluateInfo.buyTheWay);
						$("#evaluatePrice").html(
								data.guaranteeEvaluateInfo.evaluatePrice);
						$("#evaluateby").html(
								data.guaranteeEvaluateInfo.evaluateby);
						var evaluatePrice1 = data.guaranteeEvaluateInfo.evaluatePrice
								+ "万元";
						$("#evaluatePrice").html(evaluatePrice1);
						$("#evaluateConclusion").html(
								data.guaranteeEvaluateInfo.evaluateConclusion);

					}
				})

		// 加载所有附件
		$
				.ajax({
					url : "${basePath}/admin/loan/review/recordnew/"
							+ customer_id_hidden + ".html",
					type : "get",
					dataType : "json",
					success : function(data) {
						//附件显示
						var attachment = "";
						var type = "";
						var title = "";
						//循环查找到的所有附件
						for (var q = 0; q < data.loanInfoAttachmentssize; q++) {
							attachment = data.loanInfoAttachments[q];
							type = attachment.attachmentType;
							if (type != 'other') {
								//这里对查询到的数据进行插入
								$("#" + type)
										.empty()
										.html(
												"<img class=example-image src="+attachment.attachmentPath+">");
								//设置修改放大，修改按钮，每次上传成功之后修改对应的img src属性 
							}
						}

						var attachments = data.attachmentEnums;

						for (var x = 0; x < attachments.length; x++) {
							var type=attachments[x];

							(function(i){    
								$('#up_' + i).fileupload(
										{
											dataType : 'json',
											done : function(e, data) {
												alert(i);
												doneProcess(data, $('#img_'
														+ i));
											}
										});
							  })(type);  

						}
					}

				});
		//设置直贷，再贷，助贷选择之后出账时间，还款凭证的表示与隐藏
		$("#loandirect").change(function() {
			$("#lenddate_div").css("display", "block");
			$("#lendedpic_div").css("display", "block");
		});
		$("#helploan").change(function() {
			$("#lenddate_div").css("display", "block");
			$("#lendedpic_div").css("display", "block");
		});
		$("#reloan").change(function() {
			$("#lenddate_div").css("display", "none");
			$("#lendedpic_div").css("display", "none");
		});
		//设置再贷审批中的通过与放弃radio button压下后的处理
		$("#reloanApproveinlineRadio1").change(function() {
			//选择通过的情况下，利率相关的设置为可见状态
			$("#reloan_rate_div").css("display", "block");
			$("#reloan_starttime_div").css("display", "block");
			$("#relaon_endtime_div").css("display", "block");
		});
		//放弃的情况下，都设定为不可见状态
		$("#reloanApproveinlineRadio2").change(function() {
			//选择放弃的情况下，利率相关的设置为可见状态
			$("#reloan_rate_div").css("display", "none");
			$("#reloan_starttime_div").css("display", "none");
			$("#relaon_endtime_div").css("display", "none");
		});
		//设置再贷审批中的通过与放弃radio button压下后的处理
		$("#helploanApproveinlineRadio1").change(function() {
			//选择通过的情况下，利率相关的设置为可见状态
			$("#helploan_rate_div").css("display", "block");
			$("#helploan_starttime_div").css("display", "block");
			$("#helplaon_endtime_div").css("display", "block");
		});
		//放弃的情况下，都设定为不可见状态
		$("#helploanApproveinlineRadio2").change(function() {
			//选择放弃的情况下，利率相关的设置为可见状态
			$("#helploan_rate_div").css("display", "none");
			$("#helploan_starttime_div").css("display", "none");
			$("#helplaon_endtime_div").css("display", "none");
		});
	});

	function closePage() {
		$("#lightboxOverlay").remove();
		$("#lightbox").remove();
		$("#order_modal").empty();
		colsediv(0);
	}

	function setStatusBar(processDefinitionId, pledge_type) {

		//分别把两个控制条，设置为非可见的状态
		$("#ol_vehiclesLoans").attr("style", "display:none;");
		$("#ol_vehiclesLoans_group").attr("style", "display:none;");
		//进行条件判断,首先使用最长的进行统计
		var li_arr_group = $("#ol_vehiclesLoans_group").find("span");
		var shortbar = 1; //默认情况下是短的滚动条
		//当前节点的index
		var currentindex = 0;

		$.each(li_arr_group, function(index, value) {
			if (($(this).attr("id") == ("ligroup_" + processDefinitionId))
					|| ($(this).attr("id") == ("ligroup_" + processDefinitionId
							.replace(/help/, "re")))
					|| ($(this).attr("id") == ("ligroup_" + processDefinitionId
							.replace(/instock/, "mortgage")))) {
				currentindex = index;
			}

		});
		currentindex = currentindex / 2;
		if (currentindex <= 10) {
			$("#ol_vehiclesLoans").attr("style", "display:block;");
			if (pledge_type == 'vehiclePledge') {
				$("#mortgage_stock").html("押品入库");
				if (processDefinitionId.indexOf("instock") >= 0) {
					processDefinitionId = "mortgage";
				}
			}
		}
		if (currentindex > 10) {
			$("#ol_vehiclesLoans_group").attr("style", "display:block;");
			if (pledge_type == 'vehiclePledge') {
				$("#mortgage_stock").html("押品入库");
				if (processDefinitionId.indexOf("instock") >= 0) {
					processDefinitionId = "mortgage";
				}
			}
			//使用长状态条
			shortbar = 0;
			//通过关键字re，help进行判断
			if (processDefinitionId.indexOf("help") >= 0) {
				processDefinitionId = processDefinitionId.replace(/help/, "re");
				//更换助贷文字
				$("#loanReview_span").html("助贷资料复核");
				$("#laonApprove_span").html("助贷审批");
				$("#contract_span").html("助贷电子合同签订");
				$("#loan_lended_span").html("助贷放款");
			}
		}

		if (shortbar == 1) {
			//进度条控制
			var li_arr = $("#ol_vehiclesLoans").find("li");
			$
					.each(
							li_arr,
							function(index, value) {
								if ($(this).find("span").eq(0).attr("id") == ("li_" + processDefinitionId)) {
									//如果找到之后发现index>= 10,则说明已经到分公司放款之后的节点了，因此需要
									// 控制第二个使用第二个状态条进行表示
									if (index + 1 == li_arr.length) {
										$(this).attr("class", "step-end");
										$(this).find("span").eq(0).css(
												"background-color", "#d43f3a");
										$(this).find("span").eq(1).css("color",
												"#d43f3a");
									} else {
										$(this).attr("class", "step-active");
									}
									return false;
								} else {
									$(this).attr("class", "step-done");
									$(this).find("span").eq(0).html("√");
								}
							});
		} else {
			var li_arr = $("#ol_vehiclesLoans_group").find("li");
			$
					.each(
							li_arr,
							function(index, value) {
								if ($(this).find("span").eq(0).attr("id") == ("ligroup_" + processDefinitionId)) {
									//如果找到之后发现index>= 10,则说明已经到分公司放款之后的节点了，因此需要
									// 控制第二个使用第二个状态条进行表示
									if (index + 1 == li_arr.length) {
										$(this).attr("class", "step-end");
										$(this).find("span").eq(0).css(
												"background-color", "#d43f3a");
										$(this).find("span").eq(1).css("color",
												"#d43f3a");
									} else {
										$(this).attr("class", "step-active");
									}
									return false;
								} else {
									$(this).attr("class", "step-done");
									$(this).find("span").eq(0).html("√");
								}
							});
		}

	}
	function pictureDownload(oid) {
		$("#downloadIframe").attr("src", "/admin/loan/getroute?id=" + oid);
	}
	$("#file_more").click(function() {

		$(".nav-tabs").find("li").removeClass('active');
		$("#file_tab").addClass('active');
		$("#file_tab a").attr("aria-expanded", "true");
		location.hash = 'header';
	});
	function Edit(oid) {
		$(oid).parents(".file_img").hide();
		$(oid).parents("li").find("section").show();
		$(oid).parents("li").find("section").find($(".reply_btn")).click(
				function() {
					$(oid).parents(".file_img").show();
					$(oid).parents("li").find("section").hide();
				});
	}
	$("#add_file")
			.click(
					function() {
						var n = $("#contractInformation > li").length;
						$("#contractInformation")
								.append(
										'<li> <section style=""><div class="clearfix"><a href="javascript:;" class="file pull-left">选择文件<input id="up_img_WU_FILE_'+n+'" class="form-control" type="file"></a></div><p class="file_img"><img id="imgShow_WU_FILE_'+n+'"></p></section><input type="text" class="" placeholder="附件名称" /></li>');
						$("#up_img_WU_FILE_" + n).fileupload({
							dataType : 'json',
							done : function(e, data) {
								doneProcess(data, $("#imgShow_WU_FILE_" + n));
							}
						});
						n = n + 1;

					});
	$("#add_img")
			.click(
					function() {
						var n = $("#otherInformation > li").length;
						$("#otherInformation")
								.append(
										'<li> <section style=""><div class="clearfix"><a href="javascript:;" class="file pull-left">选择文件<input id="up_img_WU_FILE_'+n+'" class="form-control" type="file"></a></div><p class="file_img"><img id="imgShow_WU_FILE_'+n+'"></p></section><input type="text" class="" placeholder="附件名称" /></li>');

						$("#up_img_WU_FILE_" + n).fileupload({
							dataType : 'json',
							done : function(e, data) {
								doneProcess(data, $("#imgShow_WU_FILE_" + n));
							}
						});
						n = n + 1;

					});
</script>
</html>
