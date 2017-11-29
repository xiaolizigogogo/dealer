<%@ page pageEncoding="UTF-8"%>
<!-- 风控逾期处理 -->
<div class="op_box" style="display: none;"
	id="op_box_lateProcessed_simple">
	<h4>风控逾期处理</h4>
	<div class="op_box_con clearfix">
		<form class="form-horizontal">
			<div class="form-group">
				<label class="col-sm-2 control-label"></label>
				<div class="col-sm-8">
					<a href="#tab7" aria-controls="tab7" role="tab" data-toggle="tab"
						id="car_more">查看车辆信息</a>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label"><i class="text-danger">*</i>
					处理结果</label>
				<div class="col-sm-5">
					<label class="radio-inline"> <input type="radio"
						name="status" value="continueurge"
						checked="checked"> 继续催收
					</label> <label class="radio-inline"> <input type="radio"
						name="status" value="overdue">
						申请调整罚息
					</label> <label class="radio-inline"> <input type="radio"
						name="status" value="trailcar">
						拖车处理
					</label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label"><i class="text-danger">*</i>
					备注</label>
				<div class="col-sm-8">
					<textarea cols="168" rows="2" class="form-control"
						id="lateProcessedRemark" name="remark"></textarea>
				</div>
			</div>
		</form>
	</div>
</div>
<!-- 拖车 -->
<div class="op_box" style="display: none;" id="op_box_trailer">
	<h4 id="review_detaincar">拖车</h4>
	<div class="op_box_con clearfix">
		<form class="form-horizontal">
			<div class="form-group">
				<label class="col-sm-2 control-label"><i class="text-danger">*</i>
					处理方式</label>
				<div class="col-sm-8">
					<label class="radio-inline"> <input type="radio"
						name="status" id="inlineRadio1" value="pass"
						checked="checked"> 已拖车
					</label> <label class="radio-inline"> <input type="radio"
						name="status" id="inlineRadio3" value="nopass">
						未拖车
					</label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label"><i class="text-danger">*</i>
					拖车备注</label>
				<div class="col-sm-8">
					<textarea cols="168" rows="2" class="form-control"
						id="detainCarRemark_simple" name="remark"></textarea>
				</div>
			</div>
		</form>
	</div>
</div>

<!-- 真 拖车处理 -->
<div class="op_box" style="display: none;" id="op_box_trailerdeal">
	<h4 id="review_trailerdeal">拖车处理</h4>
	<div class="op_box_con clearfix">
		<form class="form-horizontal">
			<!--<div class="form-group">
				<label class="col-sm-2 control-label"><i class="text-danger">*</i>
					处理方式</label>
				<div class="col-sm-8">
					<label class="radio-inline"> <input type="radio"
						name="status" id="inlineRadio5" value="fullPay"
						checked="checked"> 全额还款
					</label> <label class="radio-inline"> <input type="radio"
						name="status" id="inlineRadio6" value="partialPay">
						部分还款
				</label>
				</div>
			</div> -->
			<div class="form-group">
				<label  class="col-sm-2 control-label"><i class="text-danger">*</i> 卖车金额</label>
				<div class="col-sm-8">
					<div class="input-group input-append pull-left" style="width:160px">
						<input type="text" class="form-control" id ="repaymentMoney" name="repaymentMoney" value="0"/>
						<span class="add-on input-group-addon">元</span> </div>
				</div>
			</div>
			<div class="form-group">
				<label  class="col-sm-2 control-label"> 罚息金额</label>
				<div class="col-sm-8">
					<div class="input-group input-append pull-left" style="width:160px">
						<input type="text" class="form-control" id ="surplusMoney" name="surplusMoney" value="0"/>
						<span class="add-on input-group-addon">元</span> </div>
				</div>
			</div>
			<div class="form-group">
				<label  class="col-sm-2 control-label"><i class="text-danger">*</i> 拖车费用</label>
				<div class="col-sm-8">
					<div class="input-group input-append pull-left" style="width:160px">
						<input type="text" class="form-control" id ="trailerMoney" name="trailerMoney" value="5000"/>
						<span class="add-on input-group-addon">元</span> </div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label"><i class="text-danger">*</i>
					拖车处理备注</label>
				<div class="col-sm-8">
					<textarea cols="168" rows="2" class="form-control"
					          id="trailerDealRemark" name="remark"></textarea>
				</div>
			</div>
		</form>
	</div>
</div>

<!-- 财务账务确认 -->
<div class="op_box" style="display: none;" id="op_box_receivemoneyconfirm">
	<h4 id="receiveMoneyConfirm">财务账务确认</h4>
	<div class="op_box_con clearfix">
		<form class="form-horizontal">
			<div class="form-group advance_info" style="display: block;">
				<label  class="col-sm-2 control-label"> 剩余本金总计</label>
				<div class="col-sm-2">
					<div class="input-group input-append pull-left" style="width:160px">
						<input type="text" class="form-control" id ="residueMoney" name="residueMoney" value="0"
						       onpaste="return false" readonly/>
						<span class="add-on input-group-addon">元</span> </div>
				</div>
				<label  class="col-sm-2 control-label"> 实际应还金额</label>
				<div class="col-sm-2">
					<div class="input-group input-append pull-left" style="width:160px">
						<input type="text" class="form-control" id ="actualShouldRepay" name="actualShouldRepay" value="0"
								onpaste="return false" readonly />
						<span class="add-on input-group-addon">元</span> </div>
				</div>
			</div>
			<div class="form-group advance_info" style="display: block;">
				<label class="col-sm-2 control-label"> 拖车卖车金额</label>
				<div class="col-sm-2">
					<div class="input-group input-append pull-left" style="width:160px">
						<input type="text" class="form-control" id ="trailerSale" name="trailerSale" value="0"
						       onpaste="return false" readonly/>
						<span class="add-on input-group-addon">元</span> </div>
				</div>
			</div>
			<div class="form-group advance_info" style="display: block;" id="receivableDeprOver_div">
				<label class="col-sm-2 control-label"><i class="text-danger">*</i> 实收综合管理费</label>
				<div class="col-sm-2">
					<div class="input-group input-append pull-left" style="width:160px">
						<input type="text" class="form-control" id ="receivableDepr" name="receivableDepr" value="0"
						       onpaste="return false" onkeyup="refund_Fee_Receive(this)"/>
						<span class="add-on input-group-addon">元</span> </div>
				</div>
				<label  class="col-sm-2 control-label"><i class="text-danger">*</i> 实收罚息</label>
				<div class="col-sm-2">
					<div class="input-group input-append pull-left" style="width:160px">
						<input type="text" class="form-control" id ="receivableOver" name="receivableOver" value="0"
						       onpaste="return false" onkeyup="refund_Fee_Receive(this)"/>
						<span class="add-on input-group-addon">元</span> </div>
				</div>
			</div>
			<div class="form-group advance_info" style="display: block;" id="receivablePenaInter_div">
				<label  class="col-sm-2 control-label"><i class="text-danger">*</i> 实收违约金</label>
				<div class="col-sm-2">
					<div class="input-group input-append pull-left" style="width:160px">
						<input type="text" class="form-control" id ="receivablePena" name="receivablePena" value="0"
						       onpaste="return false" onkeyup="refund_Fee_Receive(this)"/>
						<span class="add-on input-group-addon">元</span> </div>
				</div>
				<label  class="col-sm-2 control-label"><i class="text-danger">*</i> 实收利息总计</label>
				<div class="col-sm-2">
					<div class="input-group input-append pull-left" style="width:160px">
						<input type="text" class="form-control" id ="residueInterest" name="residueInterest" value="0"
						       onpaste="return false" onkeyup="refund_Fee_Receive(this)"/>
						<span class="add-on input-group-addon">元</span> </div>
				</div>
			</div>
			<div class="form-group advance_info" style="display: block;" id="towCostPark_div">
					<label  class="col-sm-2 control-label"><i class="text-danger">*</i> 拖车金额</label>
					<div class="col-sm-2">
						<div class="input-group input-append pull-left" style="width:160px">
							<input type="text" class="form-control" id ="towCost" name="towCost" value="0"
							       onpaste="return false" onkeyup="refund_Fee_Receive(this)"/>
							<span class="add-on input-group-addon">元</span> </div>
					</div>
					<label  class="col-sm-2 control-label"><i class="text-danger">*</i> 停车费</label>
					<div class="col-sm-2">
						<div class="input-group input-append pull-left" style="width:160px">
							<input type="text" class="form-control" id ="residueParkCost" name="residueParkCost" value="0"
							       onpaste="return false" onkeyup="refund_Fee_Receive(this)"/>
							<span class="add-on input-group-addon">元</span> </div>
					</div>
			</div>
			<div class="form-group advance_info" style="display: block;">
				<label class="col-sm-2 control-label" id="drunkDrive_label"><i class="text-danger">*</i> GPS流量费</label>
				<div class="col-sm-2" id="drunkDrive_div">
					<div class="input-group input-append pull-left" style="width:160px">
						<input type="text" class="form-control" id ="receivableDruk" name="receivableDruk" value="0"
						       onpaste="return false" onkeyup="refund_Fee_Receive(this)"/>
						<span class="add-on input-group-addon">元</span> </div>
				</div>
				<label class="col-sm-2 control-label"> 实还还款总额</label>
				<div class="col-sm-2">
					<div class="input-group input-append pull-left" style="width:160px">
						<input type="text" class="form-control" id ="actualRepayMoney" name="actualRepayMoney" value="0"
						       onpaste="return false" readonly />
						<span class="add-on input-group-addon">元</span> </div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label"><i class="text-danger">*</i>
					财务账务备注</label>
				<div class="col-sm-8">
					<textarea cols="168" rows="2" class="form-control"
					          id="receiveRemark" name="remark"></textarea>
				</div>
			</div>
		</form>
	</div>
</div>

<!-- 坏账处理 -->
<div class="op_box" style="display: none" id="op_box_baddebtdeal">
	<h4>坏账处理</h4>
	<div class="op_box_con clearfix">
		<form class="form-horizontal">
			<div class="form-group">
				<label  class="col-sm-2 control-label"><i class="text-danger">*</i> 坏账金额</label>
				<div class="col-sm-8">
					<div class="input-group input-append pull-left" style="width:160px">
						<input type="text" class="form-control" id ="badDebtMoney" name="badDebtMoney" value="0"
						       onpaste="return false" readonly />
						<span class="add-on input-group-addon">元</span> </div>
				</div>
			</div>
			<div class="form-group">
				<label  class="col-sm-2 control-label"><i class="text-danger">*</i> 卖车金额</label>
				<div class="col-sm-8">
					<div class="input-group input-append pull-left" style="width:160px">
						<input type="text" class="form-control" id ="sellMoney" name="sellMoney" value="0"
						       onpaste="return false" readonly />
						<span class="add-on input-group-addon">元</span> </div>
				</div>
			</div>
			<div class="form-group">
				<label  class="col-sm-2 control-label"><i class="text-danger">*</i> 应还本金</label>
				<div class="col-sm-8">
					<div class="input-group input-append pull-left" style="width:160px">
						<input type="text" class="form-control" id ="shouldRepayMoney" name="shouldRepayMoney" value="0"
						       onpaste="return false" readonly />
						<span class="add-on input-group-addon">元</span> </div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label"><i class="text-danger">*</i>
					坏账备注</label>
				<div class="col-sm-8">
					<textarea cols="168" rows="2" class="form-control"
					          id="badDebtRemark" name="remark"></textarea>
				</div>
			</div>
		</form>
	</div>
</div>

<div class="op_box" style="display:none;" id="op_box_urgeRepaymentSimple">
	<h4>业务员催收</h4>
	<div class="op_box_con clearfix">
		<form class="form-horizontal">
			<div class=" col-sm-12">
				<div class="form-group">
					<label class="col-sm-2 control-label"><i class="text-danger">*</i>
						催收方式</label>
					<div class="col-sm-8">
						<label class="radio-inline"> <input type="radio"
															name="status"  value="telurge"
															checked="checked"> 电话催收
						</label> <label class="radio-inline"> <input type="radio"
																	 name="status" value="smsurge">
						短信催收
					</label>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label"> 短信催收</label>
					<div class="col-sm-8">
						<textarea cols="168" rows="2" class="form-control" id="smsContentSimple" name="smsContentSimple"></textarea>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-2"> <a name="submitSmsSimple" id="submitSmsSimple"  href = "javascript:void(0)" onclick = "loanSubmitSmsSimple()" class="btn btn-danger  btn-search">发送短信</a> </div>
				</div>
				<div class="form-group">
					<label  class="col-sm-2 control-label"><i class="text-danger">*</i> 催收备注</label>
					<div class="col-sm-8">
              <textarea cols="168" rows="2" class="form-control" id="callRemarkSimple"  maxlength="30"
						name="remark"></textarea>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>
<!-- 还款续借申请 -->
<div class="op_box" id="op_box_renewapplyment" style="display:none;">
	<h4>还款续借申请</h4>
	<div class="op_box_con clearfix">
		<form class="form-horizontal">
			<div class="form-group">
				<label class="col-sm-2 control-label"><i class="text-danger">*</i>
					续借金额</label>
				<div class="col-sm-3">
					<div class="input_group pull-left " style="max-width: 120px; " >
						<input type="text" name="reviewAmount" maxlength="9"
							style="width: 120px;" id="continueAmountSimple" value="" class="form-control"
							onkeyup="this.value= this.value.match(/\d+(\.\d{0,2})?/) ? this.value.match(/\d+(\.\d{0,2})?/)[0] : ''"> 
							<span class="danwei">元</span>
							
					</div>
					<span id="renewAmountMax_span" class="pull-left" style=" line-height:30px; padding-left:10px;"></span>
				</div>
				<label class="col-sm-2 control-label"><i class="text-danger">*</i>
					续借月利率</label>
				<div class="col-sm-3">
					<div class="input_group" style="max-width: 120px">
						<input type="text" id="continue_rate" maxlength="8"
							style="width: 100%;" name="reloan_rate" class="form-control"
							onkeyup="this.value= this.value.match(/\d+(\.\d{0,2})?/) ? this.value.match(/\d+(\.\d{0,2})?/)[0] : ''" /> 
							<span class="danwei">%</span>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label"><i class="text-danger">*</i>
					借款期限</label>
				<div class="col-sm-3">
					<div class="input_group" style="max-width: 120px">
						<input type="text" name="reloan_limit" maxlength="5"
							style="width: 120px;" id="continueLimitSimple" value="" class="form-control"
						    onkeyup="this.value= this.value.match(/\d+(\.\d{0,2})?/) ? this.value.match(/\d+(\.\d{0,2})?/)[0] : ''" /> 
							<span class="danwei">月</span>
					</div>
				</div>
				<label class="col-sm-2 control-label"><i class="text-danger">*</i>
					还款方式</label>
				<div class="col-sm-3" >
					<select class="form-control pull-left valid" id="continue_way"
						name="reloan_repayWay">
						<option value="AverageCapitalPlusInterest">等本等息</option>
						<option value="InterestRatesBefore">先息后本</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label"><i class="text-danger">*</i>
					请选择方案</label>
				<div class="col-sm-3 ">
					<div class="input_group ">
						<select class="form-control pull-left " id="plantype_simple" name="plantype">
							<option value="0" selected >综合服务费按月收取</option>
							<option value="1">综合服务费一次性收取</option>
						</select>
					</div>
				</div>
					<label class="col-sm-2 control-label"><i class="text-danger">*</i>
					续借服务费月利率</label>
				<div class="col-sm-3">
					<div class="input_group" style="max-width: 120px">
						<input type="text" id="continue_depreciation" maxlength="8"
							style="width: 100%;" name=depreciationRate class="form-control" value=""
							onkeyup="this.value= this.value.match(/\d+(\.\d{0,2})?/) ? this.value.match(/\d+(\.\d{0,2})?/)[0] : ''" /> 
							<span class="danwei">%</span>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label"><i class="text-danger">*</i>
					办理费</label>
				<div class="col-sm-3">
					<div class="input_group pull-left " style="max-width: 120px; " >
						<input type="text" name="loanGpsCost" maxlength="9"
							style="width: 120px;" id="continue_gpsCost" class="form-control" value=""	
							onkeyup="this.value= this.value.match(/\d+(\.\d{0,2})?/) ? this.value.match(/\d+(\.\d{0,2})?/)[0] : ''" /> 
							<span class="danwei">元</span>
							
					</div>
				</div>
				<label class="col-sm-2 control-label"><i class="text-danger">*</i>
					GPS月流量费</label>
				<div class="col-sm-3">
					<div class="input_group" style="max-width: 120px">
						<input type="text" id="continue_drunkDrive" maxlength="8"
							style="width: 100%;" name="loanDrunkDrive" class="form-control" value=""
							onkeyup="this.value= this.value.match(/\d+(\.\d{0,2})?/) ? this.value.match(/\d+(\.\d{0,2})?/)[0] : ''"/>
							<span class="danwei">元</span>
					</div>
				</div>
			</div>
					
			<div class="form-group">
				<label class="col-sm-2 control-label"><i class="text-danger">*</i>
					意见</label>
				<div class="col-sm-8">
					<textarea cols="168" rows="2" class="form-control"
						id="conclusion_helploanApprove" maxlength="50" name="remark"></textarea>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">还款信息</label>
				<div class="col-sm-4">
					<a href="#plan-list" class="btn btn-success btn-search plan-show" id="btnGenRepayPlanSimple" >生成还款计划</a>
				</div>
			</div>
			<div class="list_box col-md-offset-2">
				<table class="table table-bordered table-striped">
					<thead>
						<tr>
							<th>期数</th>
							<th>还款本金</th>
							<th>还款利息</th>
							<th>综合服务费</th>
							<th>办理费</th>
							<th>GPS流量费</th>
							<th>停车费</th>
							<th>风险保证金</th>
							<th>罚息</th>
							<th>违约金</th>
							<th>催收费</th>
							<th>拖车费</th>
							<th>本期还款总额</th>
							<th>还款日期</th>
						</tr>
					</thead>
					<tbody id="repayPlanPreViewSimple"></tbody>
				</table>
			</div>
		</form>
	</div>
</div>

<div class="op_box" style="display:none;" id="op_box_renewReview">
    <h4>续借审批 </h4>
    <div class="op_box_con clearfix">
      <form class="form-horizontal">
        <div class="form-group">
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 处理方式</label>
          <div class="col-sm-8">
            <label class="radio-inline">
              <input type="radio" name="status" id="inlineRadio1" value="pass" checked="checked">
              同意续借 </label>
            <label class="radio-inline">
              <input type="radio" name="status" id="inlineRadio3" value="nopass">
              拒绝续借 </label>
          </div>
        </div>
        <div class="form-group" id="continueRepayAmountDiv">
          <label  class="col-sm-2 control-label"><i class="text-danger">*</i> 续借申请金额</label>
          <div class="col-sm-8">
            <div class="input-group input-append pull-left" style="width:160px">
              <input type="text" class="form-control"  id="repaymentAmountContinue_simple"
                                 maxlength="9"
                                style="width:100%;" name="reviewAmount">
              <span class="add-on input-group-addon" id="renewReview_reviewAmount">元</span> </div>
              <input type="hidden" name="reviewAmount" id="repaymentAmountContinue_hidden">
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 续借处理备注</label>
          <div class="col-sm-8">
            <textarea cols="168" rows="2" class="form-control" id="continueRepaymentRemark"
                                      name="remark"></textarea>
          </div>
        </div>
      </form>
    </div>
  </div>

 <div class="op_box" id="op_box_partrepayment" style="display:none;">
    <h4 id="review_name">还款评审</h4>
    <div class="op_box_con clearfix">
      <form class="form-horizontal">
        <div class="form-group" id="multiRepay">
          <label  class="col-sm-2 control-label"><i class="text-danger">*</i> 本次还款金额</label>
          <div class="col-sm-8">
            <div class="input-group input-append pull-left" style="width:160px">
              <input type="text" class="form-control" autofocus id="repaymentAmount2"
                               onkeyup="displayUpper(this)"  maxlength="9"
                               onpaste="return false" style="width:100%;">
              <span class="add-on input-group-addon">元</span> </div>
            <p class="help-block pull-left" style="padding-left:10px;margin-top:0px;"> <a href="javascript:void(0)" onClick="submitPartrepayment();" class="btn btn-danger btn-block">提交本次还款</a> </p>
          </div>
        </div>
        <div class="form-group">
          <label  class="col-sm-2 control-label"><i class="text-danger">*</i> 还款实际金额</label>
          <div class="col-sm-8">
            <div class="input-group input-append pull-left" style="width:160px">
              <input type="text" class="form-control" autofocus id="partact_money" readonly 
                               onkeyup="displayUpper(this)" maxlength="9"
                               onpaste="return false" style="width:100%;" name="reviewAmount" >
              <span class="add-on input-group-addon">元</span> </div>
            <p class="help-block pull-left" style="padding-left:10px;"> 本期还款计划金额 <span class="text-danger" id="partrpd_money"></span> 元
              &nbsp;&nbsp;&nbsp;本期还款计划剩余金额 <span class="text-danger" id="partrest_money" ></span> 元 </p>
          </div>
        </div>
        <div class="form-group" style="display:none" id="overdue">
          <label  class="col-sm-2 control-label"><i class="text-danger">*</i> 违约金</label>
          <div class="col-sm-8">
            <div class="input-group input-append pull-left" style="width:160px">
              <input type="text" class="form-control" id ="overdueFee" value="0"/>
              <span class="add-on input-group-addon">元</span> </div>
          </div>
        </div>
        <div class="form-group" id="repaymenting_photoDiv">
          <label class="col-sm-2 control-label">上传评审截图</label>
          <div class="col-sm-8"> <a href="javascript:;" class="file">选择文件
            <input type="file"  id="reviewUpload_simple" name="files[]"
            data-url="">
            </a>
            <p class="file_img"><img id="img_reviewUpload_simple" >
            <input type="hidden" name="reviewUpload"/>
            </p>
          </div>
        </div>
         <input type="hidden" name="imageUpLoad" value="yes"/>
        <div class="form-group">
          <label  class="col-sm-2 control-label"><i class="text-danger">*</i> 评审备注</label>
          <div class="col-sm-8">
            <textarea cols="168" rows="2" class="form-control" id="partrepayment_remark"
                                      name="remark"></textarea>
          </div>
        </div>
      </form>
    </div>
  </div>
   <div class="op_box" style="display:none;" id="op_box_renewcontract">
    <h4>续借合同签订</h4>
    <div class="op_box_con clearfix">
      <form class="form-horizontal" id="warp">
         <input type="hidden" name="imageUpLoad" value="yes"/>
        <div class="form-group">
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 上传续借合同</label>
          <div class="col-sm-8"> <a href="javascript:;" class="file">选择文件
            <input type="file" name="files[]" id="renewcontract_simple">
            </a>
            <p class="file_img"><img id="imgShow_renewcontract" >
            <input type="hidden" name="continueUpload">
            </p>
          </div>
        </div>
       
      </form>
    </div>
  </div>
  <script>
	  //存储目前的节点ID,跟主页面的加载顺序解耦，因此单独定义变量来使用
	var activity;
	  var loanId;
  $(function(){
  	//初始化方法
	  debugger;
	  var customer_id_hiddenstr = $("#customer_id_hidden").val();
	  /*var strarray = customer_id_hiddenstr.split(":");
	  activity = strarray[4];
	  loanId = strarray[0];*/
	  var loanDetailsAll = map.get(customer_id_hiddenstr);
	  activity = loanDetailsAll.activityId;
	  loanId =  loanDetailsAll.uuid;
	  taskId = loanDetailsAll.taskId;
	  var channel = loanDetailsAll.channel;
	  
  	//1.查询订单的最新还款计划状态或者是taskid activity
  			var activities=["renewapplyment","lateProcessed_simple","renewReview","trailer","partrepayment",
			                "urgeRepaymentSimple","renewcontract","trailerdeal", "receivemoneyconfirm", "baddebtdeal"];
	  if("yes" == channel){
  			if(contains(activities,activity)){
  				 eval(activity+"Init()");
  	        	$("#op_box_"+activity).find("form").append("<input name=taskId value="+taskId+" id=taskId_Simple type=hidden />");
  	        	$("#submitA").attr("onclick","submitHandler()");
  			};
	  }

  });
	  $("#btnGenRepayPlanSimple").click(function(){
		  debugger;
		  var returntext=validateRenewApply();
		  if(returntext!=''){
			  layer.msg(returntext);
			  return false;
		  /*var custome		  }
		   var customer_id_hiddenstr = $("#customer_id_hidden").val();
		  var loanId = customer_id_hiddenstr.split(":")[0];
		  var taskId = customer_id_hiddenstr.split(":")[2];*/
		}
		  $.ajax({
					  url : "/admin/loan/continueLoanPreReviewSimple",
					  type : "get",
					  dataType : "json",
					  data:{
						  "loanId":loanId,
						  "taskId":taskId,
						  "continueAmount":$("#continueAmountSimple").val(),
						  "continueLimit":$("#continueLimitSimple").val(),
						  "continueRate":$("#continue_rate").val(),
						  "continueWay":$("#continue_way").val(),
						  "plantype":$("#plantype_simple").val(),
						  "continueDepreciation":$("#continue_depreciation").val(),
						  "continueDrunkDrive":$("#continue_drunkDrive").val(),
						  "continueGpsCost":$("#continue_gpsCost").val()
					  },
					  success:function(data){

						  $("#repayPlanPreViewSimple").html("");

						  for(var i=0;i<data.result.length;i++){
							  var	record=data.result[i];
							  var date = new Date(record.repayDate.replace(/-/g, "/")).Format("yyyy-MM-dd");
							  var html = "";
							  html += "<tr>";
							  html += "<td align='center'>" + (record.remark.indexOf('续')==-1? record.repayPeriod:record.repayPeriod+("(续)")) + "</td>";
							  html += "<td align='center'>" + record.repayCapital + "</td>";
							  html += "<td align='center'>" + record.repayInterest + "</td>";
							  html += "<td align='center'>" + record.depreciationFee + "</td>";
							  html += "<td align='center'>" + record.gpsCost + "</td>";
							  html += "<td align='center'>" + record.drunkDrive + "</td>";
							  html += "<td align='center'>" + record.parkCost + "</td>";
							  html += "<td align='center'>" + record.cashdepositFee + "</td>";
							  html += "<td align='center'>" + record.overdueFee + "</td>";
							  html += "<td align='center'>" + record.penaltyFee + "</td>";
							  html += "<td align='center'>" + record.checkCost + "</td>";
							  html += "<td align='center'>" + record.towCost + "</td>";
							  html += "<td align='center'>" + record.repayTotal + "</td>";
							  html += "<td align='center'>" + date + "</td>";
							  html += "</tr>";
							  $("#repayPlanPreViewSimple").append(html);
						  }


					  },
					  error:function(){}
				  }
		  )

	  });
  var renewapplymentInit=function(){
	  $("#op_box_renewapplyment").show();
	  $("#submitA").show();
	  //续借申请，获取可续借最大金额。
	  $.ajax({
		 url:"/admin/loan/simpleRenewApplyment?loanId="+loanId,
		 type:"get",
		 success:function(data){
			 $("#op_box_renewapplyment").find("form").append("<input name=renewAmountMax value="+data.renewAmountMax+" id=renewAmountMax type=hidden />");
			 $("#op_box_renewapplyment").find("form").append("<input name=loanId value="+data.loanId+"  type=hidden />");
			 $("#op_box_renewapplyment").find("form").append("<input name=repaymentUuid value="+data.repaymentUuid+" type=hidden />");
		     $("#renewAmountMax_span").html('<span class="text-danger" style="font-size:12px">最大可续借金额:'+data.renewAmountMax.toFixed(2)+'元</span>');
		 }
	  });
  }
  var lateProcessed_simpleInit=function(){
	  $("#op_box_lateProcessed_simple").show();
	  $("#submitA").show();
  }
  var urgeRepaymentSimpleInit=function(){
		  $("#op_box_urgeRepaymentSimple").show();
		  $("#submitA").show();
		  //$("#op_box_renewapplyment").find("form").append("<input name=loanId value="+$("#customer_id_hidden").val().split(":")[0]+"  type=hidden />");
	  $("#op_box_renewapplyment").find("form").append("<input name=loanId value="+loanId+"  type=hidden />");
	  }
  var renewReviewInit=function(){
  	  $("#op_box_renewReview").show();
	  $("#submitA").show();
	  //获取申请续借金额，进行审批
	  $.ajax({
		 url:"/admin/loan/simpleRenewApplyInfo?loanId="+loanId,
		 type:"get",
		 dataType:"json",
		 success:function(data){
			$("#repaymentAmountContinue_hidden").val(data.reviewMoney);
			 $("#repaymentAmountContinue_simple").val(data.reviewMoney);
			 $("#repaymentAmountContinue_simple").attr("disabled","disabled");
			 $("#op_box_renewReview").find("form").append("<input  name=repaymentUuid value="+data.repaymentUuid+" type=hidden />");
			 $("#op_box_renewReview").find("form").append("<input  name=loanId value="+data.loanId+" type=hidden />");
		 }
	  });
  }
  var partrepaymentInit=function(){
  	 $("#op_box_partrepayment").show();
	 $("#submitA").show();
	  //获取申请续借金额，进行审批
	  $.ajax({
		 url:"/admin/loan/simpleRenewApplyInfo?loanId="+loanId,
		 type:"get",
		 success:function(data){
			 $("#partrpd_money").html(data.repayPlanDetail.repayTotal);
			 $("#partact_money").val(data.repayPlanDetail.repayTotal.add(-data.repayPlanDetail.surplusRepayTotal));
			 $("#partrest_money").html(data.repayPlanDetail.surplusRepayTotal);
			 $("#op_box_partrepayment").find("form").append("<input id=partRpdUuid name=repaymentUuid value="+data.repaymentUuid+" type=hidden />");
			 $("#op_box_partrepayment").find("form").append("<input id=partRpdLoanId name=loanId value="+data.loanId+" type=hidden />");
		 }
	  });
  }
  var trailerInit=function(){
	  $("#op_box_trailer").show();
	  //$("#op_box_trailer").find("form").append("<input name=loanId value="+$("#customer_id_hidden").val().split(":")[0]+"  type=hidden />");
	  $("#op_box_trailer").find("form").append("<input name=loanId value="+loanId+"  type=hidden />");
	  $("#submitA").show();
  }
  var trailerdealInit=function () {
	  $("#op_box_trailerdeal").show();
	  //$("#op_box_trailerdeal").find("form").append("<input name=loanId value="+$("#customer_id_hidden").val().split(":")[0]+"  type=hidden />");
	  $("#op_box_trailerdeal").find("form").append("<input name=loanId value="+loanId+"  type=hidden />");
	  // 获取逾期罚息费用
	  $.ajax({
		  url:"/admin/loan/simpleQueryOverdueInterest?loanId="+loanId,
		  type:"post",
		  success:function(data){
			  $("#surplusMoney").val(data.result.overDueInterestSum);
		  }
	  });
	  $("#submitA").show();
  }
  var receivemoneyconfirmInit=function () {
	  $("#op_box_receivemoneyconfirm").show();
	  //$("#op_box_receivemoneyconfirm").find("form").append("<input name=loanId value="+$("#customer_id_hidden").val().split(":")[0]+"  type=hidden />");
	  //var taskId = $("#customer_id_hidden").val().split(":")[2];
	  $("#op_box_receivemoneyconfirm").find("form").append("<input name=loanId value="+loanId+"  type=hidden />");
	  var taskId = loanDetailsAll.taskId;
//	  $("#submitA").attr("onclick","").bind("click",receiveMoneyConfirmVerify);
	  // 获取实际还款金额以及应还金额
	  $.ajax({
		  url:"/admin/loan/simpleQueryActualRepayMoney?loanId="+loanId + "&taskId=" + taskId,
		  type:"post",
		  success:function(data){
			  $("#residueMoney").val(data.result.residueMoney);
			  $("#actualShouldRepay").val(data.result.actualShouldRepay);
			  $("#trailerSale").val(data.result.actualRepayMoney);
			  $("#receivableDepr").val(data.result.receivableDepr);
			  if(!data.result.badDebt){
				$("#receivableDeprOver_div").hide();
				$("#receivablePena_div").hide();
				$("#towCostPark_div").hide();
				$("#receivablePenaInter_div").hide();
				$("#drunkDrive_label").hide();
				$("#drunkDrive_div").hide();
				$("#receivableDruk").hide();
				$("#actualRepayMoney").val(data.result.actualRepayMoney);
			  }else{
				$("#receivableOver").val(data.result.receivableOver);
				$("#receivablePena").val(data.result.receivablePena);
				$("#residueInterest").val(data.result.residueInterest);
				$("#towCost").val(data.result.towCost);
				$("#residueParkCost").val(data.result.receivablePark);
				$("#receivableDruk").val(data.result.receivableDruk);
				$("#actualRepayMoney").val(parseInt(data.result.residueMoney)+parseInt(data.result.receivableDepr)+
														parseInt(data.result.receivableOver)+parseInt(data.result.receivablePena)+
															parseInt(data.result.residueInterest)+parseInt(data.result.towCost)+
																parseInt(data.result.receivablePark)+parseInt(data.result.receivableDruk));
			  }
		  }
	  });
  }

  var baddebtdealInit=function () {
	  $("#op_box_baddebtdeal").show();
	  $("#submitA").show();
	  //var taskId = $("#customer_id_hidden").val().split(":")[2];
	  //var taskId = loanDetailsAll.taskId;
	  // 获取坏账金额
	  $.ajax({
		  url:"/admin/loan/simpleQuerybadDebtMoney?loanId="+loanId + "&taskId=" + taskId,
		  type:"post",
		  success:function(data){
			  $("#op_box_baddebtdeal").find("form").append("<input  name=loanId value="+loanId+" type=hidden />");
			  $("#badDebtMoney").val(data.result.badDebtMoney);
			  $("#shouldRepayMoney").val(data.result.shouldRepayMoney);
			  $("#sellMoney").val(data.result.sellMoney);
		  }
	  });
  }

  var renewcontractInit=function(){
	  $("#op_box_renewcontract").show();
	  $("#submitA").show();
	  $("#op_box_renewcontract").find("form").append("<input  name=loanId value="+loanId+" type=hidden />");
  }
  
  //这个函数用来验证参数
  var validateRenewApply=function(){
	  debugger;
	  if($("#continueAmountSimple").val()==null||$("#continueAmountSimple").val()==''){
		  return "续借金额不能为空";
	  }
	  if(parseFloat($("#continueAmountSimple").val())> parseFloat($("#renewAmountMax").val())){
		  return "续借金额不能大于最大可续借金额";
	  }
	  if($("#continueLimitSimple").val()==null||$("#continueLimitSimple").val()==''){
			 return "续借期限不能为空";
	  }
	  if( $("#continue_rate").val()==null||$("#continue_rate").val()==''){
			 return "续借利率不能为空";
	  }
	  if( $("#continue_depreciation").val()==null||$("#continue_depreciation").val()==''){
			 return "续借服务费月利率不能为空";
	  }
	  if( $("#continue_drunkDrive ").val()==null||$("#continue_drunkDrive ").val()==''){
			 return "GPS流量费不能为空";
	  }
	  if( $("#continue_gpsCost").val()==null||$("#continue_gpsCost").val()==''){
			 return "办理费不能为空";
	  }
	  return "";
  }

  
  //-------------------下面是处理函数
  //提交处理函数
  var submitHandler=function(){
		  $("#taskId_Simple").val(taskId);
			/* var flag=attachmentValidate();
			if(flag!=''){
				layer.msg(flag);
				return false;
			} */
	  eval(activityId+"Handler()");
  }
  //部分还款提交操作
  var submitPartrepayment=function(){
		var repaymentAmount = $("#repaymentAmount2").val();
		var partrest_money=$("#partrest_money").html();
		if(parseFloat(repaymentAmount) <= 0){
			layer.msg("本次还款金额不能小于等于0！");
			return;
		}
		else if (parseFloat(repaymentAmount) > parseFloat(partrest_money))
		{
			layer.msg("本次还款金额不能大于本期剩余还款金额，请确认本次还款金额后重试！");
			return;
		}
		var dialogMsg = "还款金额为:<font color='red'>" + repaymentAmount + "(" + atoc(repaymentAmount) + ")</font>是否确认？";
		alertMessage(dialogMsg,'doPartrepayment()','qs_box1');
}
  //部分还款审核
var doPartrepayment=function(){
	  debugger;
	  $.ajax({
        type: 'POST',
        url: '/admin/loan/submitNowRepayment',
        beforeSend: function () {
	            load = layer.load();
        },
        data: {
        	"loanId":$("#partRpdLoanId").val(),
            "repaymentAmount": $("#repaymentAmount2").val(),
            "repaymentUuid": $("#partRpdUuid").val()
        },
        dataType: "text",
        success: function (data) {
            if (data=='0000') {
            	layer.close(load);
            	layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
            		 	$("#fade2").css("display","none");
            		 	$("#order_modal").css("display","none");
            		 	$("#qs_box1").hide();
                        //parent.document.getElementById('fade1').style.display='none';
		                $("#fade1").hide();
                        loanAfterSingleHelper();
                        return true;
            	});
            } else {
                layer.close(load);
                layer.alert("操作失败!可能原因：" + data, {icon: 2});
                return false;
            }
        }, error: function () {
	            layer.close(load);
	            layer.msg("系统错误!");
            return false;
        }
    });  
}
  
var partrepaymentHandler=function () {
	var remark=$("#partrepayment_remark").val();
	var repaymentAmount = $("#partact_money").val();
	var reviewStatus = "pass";
	var partrpd_money=$("#partrpd_money").html();
    var dialogMsg = "凭证有误，驳回";
    if ("pass" == reviewStatus) {
			if(parseInt(repaymentAmount) != parseInt(partrpd_money)){
				layer.msg("本期还款金额与本期应还金额必须相等！");
				return;
			}
			 dialogMsg = "还款金额为:<font color='red'>" + repaymentAmount + "(" + atoc(repaymentAmount) + ")</font>是否确认？";
		}
    if (remark === "") {
            layer.msg("审查备注不能为空!");
            return;
    }
        alertMessage(dialogMsg,'doPartrepaymentHandler()','qs_box1');
    }
    
var doPartrepaymentHandler=function(){
	var load;
		$.ajax({
			url:"/admin/loan/partRepaymentHandler",
			type:"post",
			data:$("#op_box_partrepayment").find("form").serializeArray(),
			dataType:"json",
			success:function(data){
			if (data.result.success) {
            	layer.close(load);
            	layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
            		 	$("#fade2").css("display","none");
            		 	$("#order_modal").css("display","none");
            		 	$("#qs_box1").hide();
                        //parent.document.getElementById('fade1').style.display='none';
		                $("#fade1").hide();
                        loanAfterSingleHelper();
                        return true;
            	});
            } else {
                layer.close(load);
                layer.alert("操作失败!可能原因：" + data.result.message, {icon: 2});
                return false;
            }},
			error:function(){
			layer.close(load);
	        layer.msg("系统错误!");
             return false;
			}
		})
}
  //续借申请处理函数,需要接收参数，提交数据
  var renewapplymentHandler=function(){
	  var load;
	  var returntext=validateRenewApply();
	  if(returntext!=''){
		  layer.msg(returntext);
		  return false;
	  }
	  if($("#conclusion_helploanApprove").val()==""||$("#conclusion_helploanApprove").val()==null){
		  layer.msg("评审不能为空");
		  return false;
	  }
	  //验证参数
	  $.ajax({
		 url:"/admin/loan/renewapplymentHandler",
		 data:$("#op_box_renewapplyment").find("form").serializeArray(),
		  beforeSend: function () {
			  load = layer.load();
		  },
		  dataType:"json",
		 success:function(data){
			 if (data.result.success) {
	            	layer.close(load);
	            	layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
	            		 	$("#fade2").css("display","none");
	            		 	$("#order_modal").css("display","none");
	            		 	$("#qs_box1").hide();
	                        //parent.document.getElementById('fade1').style.display='none';
			                $("#fade1").hide();
	                        loanAfterSingleHelper();
	                        return true;
	            	});
	            } else {
	                layer.close(load);
	                layer.alert("操作失败!可能原因：" + data.result.message, {icon: 2});
	                return false;
	            }
		 },
		 error: function () {
	            layer.close(load);
	            layer.msg("系统错误!");
             return false;
         }
	  });
  }

var urgeRepaymentSimpleHandler=function(){
		  var load;

		  //验证参数
		  $.ajax({
			  url:"/admin/loan/urgeRepaymentSimpleHandler",
			  data:$("#op_box_urgeRepaymentSimple").find("form").serializeArray(),
			  beforeSend: function () {
				  load = layer.load();
			  },
			  dataType:"json",
			  success:function(data){
				  if(data.result.success){
						 layer.close(load);
						 layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
							 $("#fade2").css("display","none");
							 $("#order_modal").css("display","none");
							 $("#qs_box1").hide();
							 //parent.document.getElementById('fade1').style.display='none';
							 $("#fade1").hide();
							 loanAfterSingleHelper();
							 return true;
						 });
					 }
			  },
			  error: function () {
				  layer.close(load);
				  layer.msg("系统错误!");
				  return false;
			  }
		  });
	  }
  //逾期处理
  var lateProcessed_simpleHandler=function(){
	  var load;
	 //验证参数
	  $.ajax({
		 url:"/admin/loan/lateProcessedSimpleHandler",
		 data:$("#op_box_lateProcessed_simple").find("form").serializeArray(),
		  beforeSend: function () {
			  load = layer.load();
		  },
		  dataType:"json",
		 success:function(data){
			 if(data.result.success){
				 layer.close(load);
				 layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
					 $("#fade2").css("display","none");
					 $("#order_modal").css("display","none");
					 $("#qs_box1").hide();
					 //parent.document.getElementById('fade1').style.display='none';
					 $("#fade1").hide();
					 loanAfterSingleHelper();
					 return true;
				 });
			 }
		 },
		 error: function () {
	            layer.close(load);
	            layer.msg("系统错误!");
             return false;
         }
	  });
  }
  // 拖车
  var trailerHandler=function(){
	  var load;
	  var detainCarRemark_simple = $("#detainCarRemark_simple").val();
	  if(detainCarRemark_simple.length == 0){
		  layer.msg("拖车备注信息不能为空！");
		  return;
	  }
	  $.ajax({
			 url:"/admin/loan/trailerHandler",
			 data:$("#op_box_trailer").find("form").serializeArray(),
		  beforeSend: function () {
			  load = layer.load();
		  },
			 success:function(data){
				 if(data.result.success){
					 layer.close(load);
					 layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
						 $("#fade2").css("display","none");
						 $("#order_modal").css("display","none");
						 $("#qs_box1").hide();
						 //parent.document.getElementById('fade1').style.display='none';
						 $("#fade1").hide();
						 loanAfterSingleHelper();
						 return true;
					 });
				 }
			 },
			 error: function () {
		            layer.close(load);
		            layer.msg("系统错误!");
                 return false;
             }
		 });
  };

  // 拖车处理
  var trailerdealHandler=function () {
	  var load;
	  var trailerDealRemark = $("#trailerDealRemark").val();
	  if(trailerDealRemark.length == 0){
		  layer.msg("拖车处理备注信息不能为空！");
		  return;
	  }
	  var repaymentMoney = $("#repaymentMoney").val();
	  if(repaymentMoney == "0" || repaymentMoney.length == 0){
		  layer.msg("卖车还款金额不能为空且不能为0！");
		  return;
	  }
	  var surplusMoney = $("#surplusMoney").val();
	  if(surplusMoney.length == 0){
		  layer.msg("罚息金额不能为空且不能为0！");
		  return;
	  }
	  var trailerMoney = $("#trailerMoney").val();
	  if(trailerMoney == "0" || trailerMoney.length == 0){
		  layer.msg("拖车金额不能为空且不能为0！");
		  return;
	  }
	  $.ajax({
			url:"/admin/loan/trailerdealHandler",
			data:$("#op_box_trailerdeal").find("form").serializeArray(),
		  beforeSend: function(){
			  load = layer.load();
		  },
		  type:"post",
		  dataType:"json",
		    success:function (data) {
				if(data.result.success){
					layer.close(load);
					layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
					$("#fade2").css("display","none");
					$("#order_modal").css("display","none");
					$("#qs_box1").hide();
					//parent.document.getElementById('fade1').style.display='none';
					$("#fade1").hide();
					loanAfterSingleHelper();
					return true;
					});
				}
			},
			error: function () {
			layer.close(load);
			layer.msg("系统错误!");
			return false;
			}
	  });
  }

  // 财务帐务确认前审核
  var receiveMoneyConfirmVerify = function() {
	  var actualRepayMoney = $("#actualRepayMoney").val();
	  if(actualRepayMoney.length==0){
		  layer.msg("实际还款金额不能为空");
		  return;
	  }
//	  var actualShouldRepay = $("#actualShouldRepay").val();
//	  if(parseFloat(actualRepayMoney) > parseFloat(actualShouldRepay)){
//		  layer.msg("实际还款金额不能为大于应还金额");
//		  return;
//	  }
	  var receivableDepr = $("#receivableDepr").val();
	  if(receivableDepr.length == 0){
		  layer.msg("应收综合管理费金额不能为空");
		  return;
	  }
	  var receivableOver = $("#receivableOver").val();
	  if(receivableOver.length == 0){
		  layer.msg("应收罚息金额不能为空");
		  return;
	  }
	  var receivablePena = $("#receivablePena").val();
	  if(receivablePena.length == 0){
		  layer.msg("应收违约金金额不能为空");
		  return;
	  }
	  var residueInterest = $("#residueInterest").val();
	  if(residueInterest.length == 0){
		  layer.msg("应收利息总计不能为空");
		  return;
	  }
	  var towCost = $("#towCost").val();
	  if(towCost.length == 0){
		  layer.msg("拖车金额不能为空");
		  return;
	  }
	  var residueParkCost = $("#residueParkCost").val();
	  if(residueParkCost.length == 0){
		  layer.msg("停车费不能为空");
		  return;
	  }
	  var receivableDruk = $("#receivableDruk").val();
	  if(receivableDruk.length == 0){
		  layer.msg("GPS流量费不能为空");
		  return;
	  }
	  var receiveRemark = $("#receiveRemark").val();
	  if(receiveRemark.length==0){
		  layer.msg("财务帐务备注不能为空");
		  return;
	  }
	  var dialogMsg = "";
	  var trailerSale = $("#trailerSale").val();
	  if(parseInt(actualRepayMoney) != parseInt(trailerSale)){
		  dialogMsg = "还款金额为:<font color='red'>" + actualRepayMoney + "(" + atoc(actualRepayMoney) + ") </font> <br/>实还总额与拖车卖车金额不符  是否确认？";
	  }else{
		  dialogMsg = "还款金额为:<font color='red'>" + actualRepayMoney + "(" + atoc(actualRepayMoney) + ")</font>是否确认？";
	  }
	  alertMessage(dialogMsg,"receivemoneyconfirm()",'qs_box1');
  }

  // 财务账务确认
	  var receivemoneyconfirmHandler=function () {
		  receiveMoneyConfirmVerify();
	  }
  var receivemoneyconfirm=function () {
	  var load;
	  $.ajax({
		  url:"/admin/loan/receiveConfirmHandler",
		  data:$("#op_box_receivemoneyconfirm").find("form").serializeArray(),
		  beforeSend: function(){
			  load = layer.load();
		  },
		  type:"post",
		  dataType:"json",
		  success:function (data) {
			  if(data.result.success){
				  layer.close(load);
				  layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
					  $("#fade2").css("display","none");
					  $("#order_modal").css("display","none");
					  $("#qs_box1").hide();
					  //parent.document.getElementById('fade1').style.display='none';
					  $("#fade1").hide();
					  loanAfterSingleHelper();
					  return true;
				  });
			  }
		  },
		  error: function () {
			  layer.close(load);
			  layer.msg("系统错误!");
			  return false;
		  }
	  });
  }

  // 坏账处理提交
  var baddebtdealHandler=function () {
	  var load;
	  $.ajax({
		  url:"/admin/loan/badDebtDealSumbit",
		  data:$("#op_box_baddebtdeal").find("form").serializeArray(),
		  beforeSend: function () {
			  load = layer.load();
		  },
		  type:"post",
		  dataType:"json",
		  success:function(data){
			  if(data.result.success){
				  layer.close(load);
				  layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
					  $("#fade2").css("display","none");
					  $("#order_modal").css("display","none");
					  $("#qs_box1").hide();
					  //parent.document.getElementById('fade1').style.display='none';
					  $("#fade1").hide();
					  loanAfterSingleHelper();
					  return true;
				  });
			  }
		  },
		  error: function () {
			  layer.close(load);
			  layer.msg("系统错误!");
			  return false;
		  }
	  });
  }
  
  var renewcontractHandler=function(){
	  var load;
	  if($("#imgShow_renewcontract").attr("src")==''){
			layer.msg("续借合同不能为空");
		  return false;  
	  }
	  $.ajax({
			 url:"/admin/loan/renewcontractHandler",
			 data:$("#op_box_renewcontract").find("form").serializeArray(),
		  beforeSend: function () {
			  load = layer.load();
		  },
		  type:"post",
		  dataType:"json",
			 success:function(data){
				 if(data.result.success){
					 layer.close(load);
					 layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
						 $("#fade2").css("display","none");
						 $("#order_modal").css("display","none");
						 $("#qs_box1").hide();
						 //parent.document.getElementById('fade1').style.display='none';
						 $("#fade1").hide();
						 loanAfterSingleHelper();
						 return true;
					 });
				 }
			 },
			 error: function () {
		            layer.close(load);
		            layer.msg("系统错误!");
                 return false;
             }
		 });
  }
  var renewReviewHandler=function(){
	  var load;
	  $.ajax({
			 url:"/admin/loan/renewReviewHandler",
			 data:$("#op_box_renewReview").find("form").serializeArray(),
			 type:"post",
		  beforeSend: function () {
			  load = layer.load();
		  },
		  dataType:"json",
			 success:function(data){
				 if(data.result.success){
					 layer.close(load);
					 layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
						 $("#fade2").css("display","none");
						 $("#order_modal").css("display","none");
						 $("#qs_box1").hide();
						 //parent.document.getElementById('fade1').style.display='none';
						 $("#fade1").hide();
						 loanAfterSingleHelper();
						 return true;
					 });
				 }
			 },
			 error: function () {
		            layer.close(load);
		            layer.msg("系统错误!");
                 return false;
             }
		 });
  }

  function contains(a, obj) {
      for (var i = 0; i < a.length; i++) {
          if (a[i] === obj) {
              return true;
          }
      }
      return false;
  }
  function loanSubmitSmsSimple() {
      var smsContent = $("#smsContentSimple").val();
      var customerId = $("#customerId").val();
      if(null == smsContent || "" == smsContent){
      	 layer.msg("短信内容不能为空");
      	 return;
      }
      $.ajax({
          type: 'POST',
          url: '/admin/loan/urgeRepaymentSubmitSms',
          data: {
              "customerId": customerId,
              "smsContent": smsContent
          },

          dataType: "text",
          success: function (data) {
              if (data == '0000') {
                  layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
                      return true;
                  });
              } else if (data == '0001') {
                  layer.msg("今日已发送催收短信，请勿重复发送");
                  return false;
              } else {
                  layer.msg("操作失败!可能原因：" + data);
                  return false;
              }
          }, error: function () {
              layer.msg("未知错误!");
              return false;
          }
      })

  }

	function refund_Fee_Receive(obj) {
		var sum = $("#residueMoney").val();
		sum = accAdd(sum,$("#receivableDepr").val());
		sum = accAdd(sum,$("#receivableOver").val());
		sum = accAdd(sum,$("#receivablePena").val());
		sum = accAdd(sum,$("#residueInterest").val());
		sum = accAdd(sum,$("#towCost").val());
		sum = accAdd(sum,$("#residueParkCost").val());
		sum = accAdd(sum,$("#receivableDruk").val());
		$("#actualRepayMoney").val(Math.round(sum));
	  }
 </script>

  
