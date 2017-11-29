
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<div class="from_box">
	<div class="from_tit clearfix">
		<h3 class="pull-left">利率、期限</h3>
	</div>
	<div class="row" id="rateInfo"></div>
</div>
<div class="from_box">
	<div class="from_tit clearfix">
		<h3 class="pull-left">基本信息</h3>
	</div>
	<div id="basic"></div>
</div>

<div class="from_box ">
	<div class="from_tit clearfix">
		<h3 class="pull-left">车辆信息</h3>
	</div>
	<div id="carInfo" class="clearfix"></div>
	<div class="img_list col-sm-12" id="carPic">
		<ul class="list-inline"></ul>
	</div>
</div>
<div class="from_box">
	<div class="from_tit clearfix">
		<h3>银行卡信息</h3>
	</div>
	<div id="bankcard"></div>
</div>
				<div class="from_box">
					<div class="from_tit clearfix">
						<h3 id="isLegalPerson">该车登记是否为法人</h3>
					</div>
					<div id="corporation_div">
						<div>
							<dl class="dl-horizontal  dl-width160 col-sm-6">
								<dt>产权所属声明(电子版)&nbsp;&nbsp;&nbsp;&nbsp;</dt>
								<dd><a href="#" class="btn btn-danger btn-xs" onclick="chkFile('contract')" id="contract_url" style="width:80px;">查看</a></dd>
							</dl>
						</div>
						<div>
							<dl class="dl-horizontal  dl-width160 col-sm-6">
								<dt>产权所属声明(视频版)&nbsp;&nbsp;&nbsp;&nbsp;</dt>
								<dd><a href="#" class="btn btn-danger btn-xs" onclick="chkFile('video')" id="video_url" style="width:80px;">查看</a></dd>
							</dl>
						</div>
						<p class="text-danger">注：视频版中请产权登记人复述【产权从属声明】中的内容</p>
					</div>
				</div>
<div class="from_box">
	<div class="from_tit clearfix">
		<h3 class="pull-left">车辆评估</h3>
		<p class="text-muted pull-left"
		   style="padding: 0; margin: 0 padding-left: 20px;">评估师填写</p>
	</div>
	<div id="carAssessInfo">
		<div class="clearfix">
			<div class="col-sm-3">
				<dl class="dl-horizontal">
					<dt>上牌时间</dt>
					<dd>
						<p class="text-value" data-key="first_up_time">无</p>
					</dd>
				</dl>
			</div>
			<div class="col-sm-3">
				<dl class="dl-horizontal">
					<dt>变速箱</dt>
					<dd>
						<p class="text-value" data-key="ariable_box">无</p>
					</dd>
				</dl>
			</div>
			<div class="col-sm-3">
				<dl class="dl-horizontal">
					<dt>发动机号</dt>
					<dd>
						<p class="text-value" data-key="engine">无</p>
					</dd>
				</dl>
			</div>
			<div class="col-sm-3">
				<dl class="dl-horizontal">
					<dt>室内装置</dt>
					<dd>
						<p class="text-value" data-key="indoor_type">无</p>
					</dd>
				</dl>
			</div>
			<div class="col-sm-3">
				<dl class="dl-horizontal">
					<dt>车身结构</dt>
					<dd>
						<p class="text-value" data-key="body_structure">无</p>
					</dd>
				</dl>
			</div>
			<div class="col-sm-3">
				<dl class="dl-horizontal">
					<dt>颜色</dt>
					<dd>
						<p class="text-value" data-key="car_colour">无</p>
					</dd>
				</dl>
			</div>
			<div class="col-sm-3">
				<dl class="dl-horizontal">
					<dt>驱动轮</dt>
					<dd>
						<p class="text-value" data-key="driving_wheel">无</p>
					</dd>
				</dl>
			</div>
			<div class="col-sm-3">
				<dl class="dl-horizontal">
					<dt>排量(L)</dt>
					<dd>
						<p class="text-value" data-key="displacement">无</p>
					</dd>
				</dl>
			</div>
			<div class="col-sm-3">
				<dl class="dl-horizontal">
					<dt>市场指导价</dt>
					<dd>
						<p class="text-value" data-key="invoice">无</p>
					</dd>
				</dl>
			</div>
			<div class="col-sm-3">
				<dl class="dl-horizontal">
					<dt>SN码</dt>
					<dd>
						<p class="text-value" data-key="sn">无</p>
					</dd>
				</dl>
			</div>


			<div class="col-sm-3">
				<dl class="dl-horizontal">
					<dt>评估师</dt>
					<dd>
						<p class="text-value" data-key="realname">无</p>
					</dd>
				</dl>
			</div>
			<div class="col-sm-3">
				<dl class="dl-horizontal">
					<dt>评估师电话</dt>
					<dd>
						<p class="text-value" data-key="mobile">丰田</p>
					</dd>
				</dl>
			</div>
			<div class="col-sm-3">
				<dl class="dl-horizontal">
					<dt>车况评估</dt>
					<dd>
						<p class="text-value" data-key="condition">无</p>
					</dd>
				</dl>
			</div>
			<div class="col-sm-3">
				<dl class="dl-horizontal">
					<dt>评估师点评</dt>
					<dd>
						<p class="text-value" data-key="remark">无</p>
					</dd>
				</dl>
			</div>
			<div class="col-sm-3">
				<dl class="dl-horizontal">
					<dt>是否商业全险</dt>
					<dd>
						<p class="boolean-value" data-key="commercial">是</p>
					</dd>
				</dl>
			</div>
			<div class="col-sm-3">
				<dl class="dl-horizontal">
					<dt>行驶证是否有效</dt>
					<dd>
						<p class="boolean-value" data-key="travelLicense">是</p>
					</dd>
				</dl>
			</div>

		</div>
		<div class="clearfix"
			 style="border-top: solid 2px #ddd; padding-top: 10px;">
			<div class="col-sm-3">
				<dl class="dl-horizontal">
					<dt>收车合同</dt>
					<dd>
						<p>
							<a class="btn btn-danger btn-xs" data-key=""
							   style="width: 80px;" href="#"  id="carEvContract">查看</a>
						</p>
					</dd>
				</dl>
			</div>
			<div class="col-sm-3">
				<dl class="dl-horizontal">
					<dt>博朗鉴定报告</dt>
					<dd>
						<p>
							<a class="btn btn-danger  btn-xs href-value" data-key="evaluationUrl" href=""
							   target="_blank" style="width: 80px;">查看</a>
						</p>
					</dd>
				</dl>
			</div>
			<div class="col-sm-3">
				<dl class="dl-horizontal">
					<dt>4s维保记录</dt>
					<dd>
						<p>
							<a class="btn btn-danger  btn-xs href-value" data-key="maintainUrl" href=""
							   target="_blank" style="width: 80px;">查看</a>
						</p>
					</dd>
				</dl>
			</div>
		</div>
		<div class="clearfix"
			 style="border-top: solid 2px #ddd; padding-top: 10px;">
			<div class="col-sm-3">
				<dl class="dl-horizontal">
					<dt>标价</dt>
					<dd>
						<p class="text-value" data-key="price">0</p>
					</dd>
				</dl>
			</div>
			<div class="col-sm-3">
				<dl class="dl-horizontal">
					<dt>底价</dt>
					<dd>
						<p class="text-value" data-key="miniprice">0</p>
					</dd>
				</dl>
			</div>
			<div class="col-sm-6">
				<dl class="dl-horizontal">
					<dt>精准估价</dt>
					<dd>
						<p class="text-value" data-key="braunAssessmentPrice">0</p>
					</dd>
				</dl>
			</div>

			<div class="col-sm-3">
				<dl class="dl-horizontal">
					<dt>收车价</dt>
					<dd>
						<p class="text-value" data-key="buyprice">0</p>
					</dd>
				</dl>
			</div>
			<div class="col-sm-9">
				<dl class="dl-horizontal">
					<dt>整备价</dt>
					<dd>
						<p class="text-value" data-key="hostlingCost">0</p>
					</dd>
				</dl>
			</div>
		</div>
		<div class="clearfix"
			 style="border-top: solid 2px #ddd; padding-top: 10px;">
			<div class="col-sm-3">
				<dl class="dl-horizontal">
					<dt>评估师估价</dt>
					<dd>
						<p class="text-value" data-key="appraisersPrice">0</p>
					</dd>
				</dl>
			</div>
			<div class="col-sm-9">
				<dl class="dl-horizontal">
					<dt><i class="fa fa-question-circle text-muted"  data-toggle="tooltip" data-placement="right" data-html="true"  title="系统评估价格=（收车价+底价+标价+精准估价） / 4"></i> 系统评估价格</dt>
					<dd>
						<p class="text-value" data-key="systemAssess">0</p>
					</dd>
				</dl>
			</div>
		</div>
		<div class="clearfix"
			 style="border-top: solid 2px #ddd; padding-top: 10px;">

			<div class="col-sm-3">
				<dl class="dl-horizontal">
					<dt><i class="fa fa-question-circle text-muted"  data-toggle="tooltip" data-placement="right" data-html="true"  title="系统建议逻辑：对比评估师估价和系统评估价格，选择价格较小的对应下面的区间，<br/>如果评估师估价和系统评估价格之差大于对应的【加权】，则系统建议不通过，小于则系统建议通过。<br />车辆价格区间 加权平均（元）（左边不包含，例如：10万，对应的是1-10万区间）<br />1-10万 3000<br />10-20万 5000<br />20-40万 10000<br />40-50万 15000<br />50-60万 18000<br />60-70万 22000<br />70-80万 25000<br />80-90万 30000<br />90万以上 40000<br/>"></i> 系统建议</dt>
					<dd>
						<p class="text-value" data-key="systemSuggest">无</p>
					</dd>
				</dl>
			</div>
			<div class="col-sm-9">
				<dl class="dl-horizontal">
					<dt><i class="fa fa-question-circle text-muted"  data-toggle="tooltip" data-placement="right" data-html="true"  title="系统建议审批金额=(评估师估价+系统评估价)/2.<br/> 如果系统建议通过则有系统<br/>建议审批金额，如果系统建议不通过，则没有系统建议审批金额。"></i>系统建议审批价格</dt>
					<dd>
						<p class="text-value" data-key="systemSuggestPrice">0</p>
					</dd>
				</dl>
			</div>
		</div>
	</div>
</div>
<input type="hidden" name="">
<div class="from_box" id="div_obd">
	<div class="from_tit clearfix">
		<h3>押品监督信息</h3>
	</div>
	<div id="collateral">
		<div class="col-sm-6">
			<dl class="dl-horizontal">
				<dt>OBD</dt>
				<dd>
					<p>
						<a class="btn btn-danger btn-xs" data-key="obd" style="width: 80px;" href="http://fengkong.chexiao.co/" target="_blank">查看</a>
					</p>
				</dd>
			</dl>
		</div>
		<div class="col-sm-6">
			<dl class="dl-horizontal">
				<dt>RFID</dt>
				<dd>
					<p>
						<a class="btn btn-danger btn-xs href-value" data-key="rfid" style="width: 80px;" href="" target="_blank">查看</a>
					</p>
				</dd>
			</dl>
		</div>
	</div>
</div>
<div class="from_box div_lended" style="display: none">
	<div class="from_tit clearfix">
		<h3>单车质押合同 <span id="sgin_name"></span> 过户后车牌号:<span class="text-value" data-key="afterPlateNumber">-</span></h3>
	</div>
	<div id="collateral">
		<div class="col-sm-6">
			<dl class="dl-horizontal">
				<div class="img_list col-sm-12" id="one_contract">
					<ul class="list-inline" ></ul>
				</div>
			</dl>
		</div>

	</div>
</div>
<div class="from_box div_lended" style="display: none">
	<div class="from_tit clearfix">
		<h3>最终放款额度(万元) &nbsp;&nbsp; 金额：<span class="text-value" data-key="judgeMoney">无</span></h3>
	</div>
	<ul class="list-inline" hidden id="outAccountVoucher_ul">
		<li style="display: inline-block;margin-left: 15px;">
			<div>
				<p class="file_img"><img class='text-value' data-key="outAccountVoucher" id="outAccountVoucher"/></p>
				</br>
				平台财务出账凭证
			</div>
		</li>
	</ul>
</div>