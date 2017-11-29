
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
		<h3>还款计划</h3>
	</div>
	<div id="repayment_plan">
		<table class="table table-bordered" >
			<thead>
			<tr style="background-color: #eee;">
				<th class="text-center">车行名称</th>
				<th class="text-center">放款时间</th>
				<th class="text-center">应还时间</th>
				<th class="text-center">放款金额(元)</th>
				<th class="text-center">周期(天)</th>
				<th class="text-center">利率(%)</th>
				<th class="text-center">逾期时间(天)</th>
				<th class="text-center">罚金(元)</th>
				<th class="text-center">合计应还金额(元)</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td class="text-value" data-key="merchantName" style="vertical-align:middle; text-align:center;">123</td>
				<td class="text-value" data-key="outAccountTime" style="vertical-align:middle; text-align:center;"></td>
				<td class="text-value" data-key="repaymentTime" style="vertical-align:middle; text-align:center;"></td>
				<td class="text-value" data-key="loanMoney" style="vertical-align:middle; text-align:center;"></td>
				<td class="text-value" data-key="loanTime" style="vertical-align:middle; text-align:center;"></td>
				<td class="text-value" data-key="interestRate" style="vertical-align:middle; text-align:center;"></td>
				<td class="text-value" data-key="overdueDay" style="vertical-align:middle; text-align:center;"></td>
				<td class="text-value" data-key="overdueMoney" style="vertical-align:middle; text-align:center;"></td>
				<td class="text-value" data-key="totalMoeny" style="vertical-align:middle; text-align:center;"></td>
			</tr>
			</tbody>
		</table>

	</div>
</div>