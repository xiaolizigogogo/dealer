<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
  <div class="modal-header" id="header"> 
	<a  type="button" href = "javascript:void(0)" onclick = "colsediv(0)"  class="close" ><span aria-hidden="true">&times;</span></a>
    <h4 class="modal-title" id="myModalLabel" style="font-size:16px;">分销详情</h4>
  </div>
  <div class="modal-body" >
    <div class="fk_modal_con row clearfix"s>
      <div class="col-sm-6">
        <dl class="dl-horizontal">
          <dt>订单编号</dt>
          <dd id="order_id"></dd>
        </dl>
      </div>
      <div class="col-sm-6">
        <dl class="dl-horizontal">
          <dt>订单状态</dt>
          <dd id="loan_status"></dd>
        </dl>
      </div>
      <div class="col-sm-6">
        <dl class="dl-horizontal">
          <dt>抵押类型</dt>
          <dd id="pledge_type"></dd>
        </dl>
      </div>
      <div class="col-sm-6">
        <dl class="dl-horizontal">
          <dt>客户名称</dt>
          <dd id="customer_name"></dd>
        </dl>
      </div>
      <div class="col-sm-6">
        <dl class="dl-horizontal">
          <dt>联系电话</dt>
          <dd id="telephone"></dd>
        </dl>
      </div>
      <div class="col-sm-6">
        <dl class="dl-horizontal">
          <dt>身份证</dt>
          <dd id="idcard"></dd>
        </dl>
      </div>
      <div class="col-sm-6">
        <dl class="dl-horizontal">
          <dt>客户经理</dt>
          <dd id="responsibleBy"></dd>
        </dl>
      </div>
      <div class="col-sm-6">
        <dl class="dl-horizontal">
          <dt>申请金额</dt>
          <dd><b class="text-danger" id="applyMoney"></b></dd>
        </dl>
      </div>
      <div class="col-sm-6">
        <dl class="dl-horizontal">
          <dt>申请时间</dt>
          <dd id="applyedAt"></dd>
        </dl>
      </div>
       <div class="col-sm-6">
        <dl class="dl-horizontal">
          <dt>审批金额</dt>
          <dd><b class="text-danger" id="loanMoney"></b></dd>
        </dl>
      </div>
      <div class="col-sm-6">
        <dl class="dl-horizontal">
          <dt>实际出款时间</dt>
          <dd id="chargedoffAt"></dd>
        </dl>
      </div>
      <div class="col-sm-6">
        <dl class="dl-horizontal">
          <dt>提成金额</dt>
          <dd><b class="text-success" id="userCommission"></b></dd>
        </dl>
      </div>
    </div>
  </div>