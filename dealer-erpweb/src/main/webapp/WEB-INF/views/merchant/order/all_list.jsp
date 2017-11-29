<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>贷后订单</title>
<link href="../css/bootstrap/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="../css/bootstrap/bootstrap-table.css">
<link rel="stylesheet" type="text/css" href="../css/libs/font-awesome.css"/>
<link rel="stylesheet" type="text/css" href="../css/dateRange.css"/>
<link rel="stylesheet" type="text/css" href="../css/common.css"/>
<link rel="stylesheet" href="../css/lightbox.min.css">
<script src="../js/jquery.js" ></script>
</head>

<body>
<div class="tools_bar col-lg-12">
  <div class="tj_box clearfix">
    <div class="col-sm-12 row">
      <div class="col-sm-3 " >
        <ul>
          <li><a href="#">我的订单</a> <span class="badge red">5</span></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <ul>
          <li><a href="#">我的团队订单</a> <span class="badge red">15</span></li>
        </ul>
      </div>
    </div>
    <div class="col-sm-12 row">
      <div class="col-sm-3">
        <ul>
          <li><a href="#">贷前订单</a> <span class="badge">20</span></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <ul>
          <li><a href="#">贷后还款中订单</a> <span class="badge">20</span></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <ul>
          <li><a href="#">已完成订单</a> <span class="badge">20</span></li>
        </ul>
      </div>
    </div>
  </div>
  <div class="clearfix">
    <form class="form-inline pull-left" role="form">
      <div class="form-group">
        <label class="sr-only" for="txt_name">订单号</label>
        <input type="text" class="form-control" id="txt_orderid" placeholder="请输入订单号">
      </div>
      <div class="form-group">
        <label class="sr-only" for="txt_name">订单号</label>
        <input type="text" class="form-control" id="txt_customname" placeholder="请输入客户姓名">
      </div>
      <div class="form-group">
        <label class="sr-only" for="txt_name">车牌号</label>
        <input type="text" class="form-control" id="txt_carid" placeholder="请输入车牌号">
      </div>
      <div class="form-group">
        <select class="form-control">
          <option>待还款</option>
          <option>逾期</option>
          <option>已完结</option>
          <option>全部</option>
        </select>
      </div>
      <div class="form-group">
        <div class="ta_date" id="div_date1"> <span class="date_title" id="date1"></span> <a class="opt_sel" id="input_trigger1" href="#"> <i class="i_orderd"></i> </a> </div>
        <div id="datePicker1"></div>
      </div>
      <button type="submit" class="btn btn-primary btn-search"><i class="fa fa-search"></i> 搜索</button>
    </form>
  </div>
</div>
<div class="list_box col-sm-12">
  <table  class="table table-bordered table-striped">
    <thead>
      <tr>
        <th>订单号</th>
        <th>客户姓名</th>
        <th>流程状态</th>
        <th>车牌号</th>
        <th>客户经理</th>
        <th>团队经理</th>
        <th>生成时间</th>
        <th>操作</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td ><i class="fa fa-bookmark text-success"></i><a href = "javascript:void(0)"  onclick="opendiv('order_modal')" title="加急">1245212512</a></td>
        <td><i class="fa fa-star text-danger" ></i><a  href = "javascript:void(0)"  onclick="opendiv('custom_modal')"  title="重点">穆天阳</a></td>
        <td>还款中</td>
        <td>辽B123456</td>
        <td>某某</td>
        <td>某某</td>
        <td>2015-04-16</td>
        <td style="text-align:center;"><a href="javascript:void(0)" onclick="opendiv('user_modal')" >归属人</a> <a href="javascript:void(0)">删除</a></td>
      </tr>
      <tr>
        <td ><i class="fa fa-bookmark text-success"></i><a href = "javascript:void(0)"  onclick="opendiv('order_modal')" title="加急">1245212512</a></td>
        <td><i class="fa fa-star text-danger" ></i><a  href = "javascript:void(0)"  onclick="opendiv('custom_modal')"  title="重点">穆天阳</a></td>
        <td>逾期</td>
        <td>辽B123456</td>
        <td>某某</td>
        <td>某某</td>
        <td>2015-04-16</td>
      </tr>
      <tr>
        <td ><i class="fa fa-bookmark text-success"></i><a href = "javascript:void(0)"  onclick="opendiv('order_modal')" title="加急">1245212512</a></td>
        <td><i class="fa fa-star text-danger" ></i><a  href = "javascript:void(0)"  onclick="opendiv('custom_modal')"  title="重点">穆天阳</a></td>
        <td>已完结</td>
        <td>辽B123456</td>
        <td>某某</td>
        <td>某某</td>
        <td>2015-04-16</td>
      </tr>
    </tbody>
  </table>
</div>
<div id="custom_modal" class="modal fade in "> </div>
<div id="order_modal" class="modal fade in"> </div>
<div id="user_modal" class="modal  fade in " style="width:800px; height:480px; background:#eee;  ">
  <div class="modal-header" id="header"  style="position:static; background:#fff;"> <a  type="button" href = "javascript:void(0)" onclick = "colsediv(0)"  class="close" ><span aria-hidden="true">&times;</span></a>
    <h4 class="modal-title" id="myModalLabel" style="font-size:16px;">修改归属人<small style="padding-left:20px; font-size:14px;" class="text-muted">订单号：5645454545456456</small></h4>
  </div>
  <div class="modal-body clearfix" style="margin-top:0px;" >
    <div class="from_box">
      <div class="from_tit clearfix">
        <h3 class="pull-left">客户经理修改</h3>
      </div>
      <div class="row"  style=" margin-bottom:5px;">
        <div class="col-sm-8">
          <dl class="dl-horizontal">
            <dt>原客户经理</dt>
            <dd>滕秋影</dd>
          </dl>
        </div>
      </div>
      <div class="row">
        <div class="col-sm-12">
          <dl class="dl-horizontal">
            <dt style="padding-top:5px;">更换客户经理</dt>
            <dd>
              <select class="form-control error" id="companyId" name="companyId" style="display:inline;">
                <option value="0">请选择所属分公司</option>
              </select>
              <select class="form-control error" id="deptId" name="deptId" style="display:inline;">
                <option value="0">请选择所属部门</option>
              </select>
              <select class="form-control error" id="companyId" name="companyId" style="display:inline;">
                <option value="0">所属客户经理</option>
              </select>
            </dd>
          </dl>
        </div>
        <div class="col-sm-12">
          <dl class="dl-horizontal">
            <dt></dt>
            <dd>
              <button type="button" class="btn btn-danger" style="display:inline;">修改</button>
            </dd>
          </dl>
        </div>
      </div>
    </div>
    <div class="from_box">
      <div class="from_tit clearfix">
        <h3 class="pull-left">任务归属人修改</h3>
      </div>
      <div class="row" style=" margin-bottom:5px;">
        <div class="col-sm-5">
          <dl class="dl-horizontal">
            <dt>任务节点</dt>
            <dd>初审</dd>
          </dl>
        </div>
        <div class="col-sm-5">
          <dl class="dl-horizontal">
            <dt>出身人员</dt>
            <dd>某某</dd>
          </dl>
        </div>
      </div>
      <div class="row">
        <div class="col-sm-12">
          <dl class="dl-horizontal">
            <dt style="padding-top:5px;">更换任务归属人</dt>
            <dd>
              <select class="form-control error" id="companyId" name="companyId" style="display:inline;">
                <option value="0">e车贷吉林分公司</option>
              </select>
              <select class="form-control error" id="deptId" name="deptId" style="display:inline;">
                <option value="0">风控部</option>
              </select>
              <select class="form-control error" id="companyId" name="companyId" style="display:inline;">
                <option value="0">某某</option>
              </select>
            </dd>
          </dl>
        </div>
        <div class="col-sm-12">
          <dl class="dl-horizontal">
            <dt></dt>
            <dd>
              <button type="button" class="btn btn-danger" style="display:inline;">修改</button>
            </dd>
          </dl>
        </div>
      </div>
    </div>
  </div>
</div>
<div id="qs_box" class="modal modal_sml fade in">
  <div class="modal-header"> <a  type="button" href = "javascript:void(0)" onclick = "colsediv(0)"  class="close" ><span aria-hidden="true">&times;</span></a>
    <h4 class="modal-title" id="myModalLabel" style="font-size:16px;">提示</h4>
  </div>
  <div class="modal-body" >
    <p class="p_tip"><i class="fa fa-check-circle"></i> 此订单已被签收！</p>
    <div class="btn_list clearfix"><a class="btn btn-danger btn-sm" href="javascript:void(0)" onclick = "colsediv(0); opendiv('order_modal');" >现在去处理</a><a class="btn btn-default btn-sm" href = "javascript:void(0)" onclick = "colsediv(0)" >暂不处理</a></div>
  </div>
</div>
<div id="hmd_box" class="modal modal_sml fade in">
  <div class="modal-header"> <a  type="button" href = "javascript:void(0)" onclick = "colsediv(0)"  class="close" ><span aria-hidden="true">&times;</span></a>
    <h4 class="modal-title" id="myModalLabel" style="font-size:16px;">提示</h4>
  </div>
  <div class="modal-body" >
    <p class="p_tip"><i class="fa fa-question-circle"></i> 确认将此押品拉入黑名单么！</p>
    <div class="btn_list clearfix"><a class="btn btn-danger btn-sm" href="../product/index.html" onclick = "colsediv(0)" >确认</a><a class="btn btn-default btn-sm" href = "javascript:void(0)" onclick = "colsediv(0)" >取消</a></div>
  </div>
</div>
<div id="fade2" class="black_overlayx"> </div>
<!--用于传递订单的UUID-->
<input type="hidden" id="indent_uuid" />
<!--用于传递公司名称-->
<input type="hidden" id="merchantName" />
<!--用于传递车商的ID-->
<INPUT TYPE="hidden" id="merchant_id" />
<!--用于传递任务的ID-->
<input type="hidden" id="task_id" />
<!--用于传递用户选择状态-->
<input type="hidden" id="status_select" />
<!--用于传递订单流程状态 -->
<input type="hidden" id="flowStatus_select" />
</body>
<script type="text/javascript" src="../js/dateRange.js"></script>
<script src="../js/bootstrap.js"></script>
<script src="../js/bootstrap-table.js"></script>
<script src="../js/lightbox-plus-jquery.min.js"></script>
<script src="../js/common.js"></script>
<script src="../js/uploadPreview.js" type="text/javascript"></script>
<script>
	$(document).ready(function(e) {
						    $("#custom_modal").load("../custom/custom_modal.html"); 
						  $("#order_modal").load("../order/order_all_modal.html"); 
						  

	
  });
</script>
<script type="text/javascript">
				//var STATS_START_TIME = '1329148800';
				var dateRange1 = new pickerDateRange('date1', {
					isTodayValid : false,
					startDate : '请选择日期',
					endDate : '',
					autoSubmit : true,
					inputTrigger : 'input_trigger1',
					theme : 'ta',
					success : function(obj) {
						$("#dCon2").html('开始时间 : ' + obj.startDate + '<br/>结束时间 : ' + obj.endDate);
					}
				});

			</script>
</html>
