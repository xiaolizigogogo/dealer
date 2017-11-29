<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>放款中订单</title>
<link href="../css/bootstrap/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="../css/bootstrap/bootstrap-table.css">
<link rel="stylesheet" type="text/css" href="../css/libs/font-awesome.css"/>
<link rel="stylesheet" type="text/css" href="../css/common.css"/>
<link rel="stylesheet" href="../css/lightbox.min.css">
<script src="../js/jquery.js" ></script>
</head>

<body>
<div class="modal-body" >
  <ol class="ui-step ui-step-red ui-step-3">
    <li class="step-start step-done">
      <div class="ui-step-line"></div>
      <div class="ui-step-cont"> <span class="ui-step-cont-number">√</span> <span class="ui-step-cont-text">出账</span> </div>
    </li>
    <li class="step-active">
      <div class="ui-step-line"></div>
      <div class="ui-step-cont"> <span class="ui-step-cont-number"></span> <span class="ui-step-cont-text">待还款</span> </div>
    </li>
    <li class="step-end">
      <div class="ui-step-line"></div>
      <div class="ui-step-cont"> <span class="ui-step-cont-number"></span> <span class="ui-step-cont-text">已完结</span> </div>
    </li>
  </ol>
  <div class="tab_box clearfix"> 
    
    <!-- Nav tabs -->
    <ul class="nav nav-tabs" role="tablist" id="nav-tabs">
      <li role="presentation"  class="active"><a href="#tab1" aria-controls="tab1" role="tab" data-toggle="tab">还款情况</a></li>
      <li role="presentation"><a href="#tab4" aria-controls="tab4" role="tab" data-toggle="tab">催收历史</a></li>
      <li role="presentation"><a href="#tab6" aria-controls="tab6" role="tab" data-toggle="tab">经销商资料</a></li>
      <li role="presentation" id="car_tab"><a href="#tab7" aria-controls="tab7" role="tab" data-toggle="tab" >车辆信息</a></li>
      <li role="presentation"><a href="#tab2" aria-controls="tab2" role="tab2" data-toggle="tab">附件资料</a></li>
    </ul>
    
    <!-- Tab panes -->
    <div class="tab-content clearfix">
      <div role="tabpanel" class="tab-pane active" id="tab1">
      <div class="from_box">
          <div class="from_tit clearfix">
            <h3 class="pull-left">基本信息</h3>
          </div>
          <div class="row" >
            <div class="col-sm-4">
              <dl class="dl-horizontal">
                <dt>审批金额</dt>
                <dd><b class="text-danger">20</b> 万元</dd>
              </dl>
            </div>
            <div class="col-sm-4">
              <dl class="dl-horizontal">
                <dt>申请金额</dt>
                <dd><b class="text-danger">25</b> 万元</dd>
              </dl>
            </div>
            <div class="col-sm-4">
              <dl class="dl-horizontal">
                <dt>借款状态</dt>
                <dd><b class="text-success">待还款</b> <b class="text-danger">逾期未还</b></dd>
              </dl>
            </div>
          </div>
          <div class="row">
            <div class="col-sm-4">
              <dl class="dl-horizontal">
                <dt>订单号 </dt>
                <dd>BFFE763AEC</dd>
              </dl>
            </div>
            <div class="col-sm-4">
              <dl class="dl-horizontal">
                <dt>经销商</dt>
                <dd>辉程汽车销售有限公司</dd>
              </dl>
            </div>
            <div class="col-sm-4">
              <dl class="dl-horizontal">
                <dt>审批时间</dt>
                <dd>2016-04-15 13:42:57 </dd>
              </dl>
            </div>
          </div>

         
        </div>
        <div class="from_box">
          <div class="from_tit clearfix">
            <h3 class="pull-left">利率、期限</h3>
          </div>
          <div class="row">
          <div class="col-sm-4">
              <dl class="dl-horizontal">
                <dt>额度比例</dt>
                <dd>60%</dd>
              </dl>
            </div>
           <div class="col-sm-4">
              <dl class="dl-horizontal">
                <dt>月利率</dt>
                <dd>0.5%</dd>
              </dl>
            </div>
            <div class="col-sm-4">
              <dl class="dl-horizontal">
                <dt>月利率</dt>
                <dd>0.5%</dd>
              </dl>
            </div>
            <div class="col-sm-4">
              <dl class="dl-horizontal">
                <dt>计息日</dt>
                <dd>2017-04-21</dd>
              </dl>
            </div>
            <div class="col-sm-4">
              <dl class="dl-horizontal">
                <dt>最大借款期限</dt>
                <dd>90天</dd>
              </dl>
            </div>
          </div>
        </div>
        <div class="from_box">
          <div class="from_tit clearfix">
            <h3 class="pull-left">其他费用</h3>
          </div>
          <div class="row">
            <div class="col-sm-4">
              <dl class="dl-horizontal">
                <dt>管理费</dt>
                <dd>1%</dd>
              </dl>
            </div>
            <div class="col-sm-4">
              <dl class="dl-horizontal">
                <dt>摄像头</dt>
                <dd>按月支付租金</dd>
              </dl>
            </div>
          </div>
        </div>
        <div class="from_box table_from_box">
          <div class="from_tit clearfix">
            <h3 class="pull-left">还款计算</h3>
          </div>
             <div class="from_con clearfix">
            <div class="col-sm-3">
              <dl class="dl-horizontal">
                <dt>计息日</dt>
                <dd> <input id="" maxlength="8"  class="form-control valid" value="2017-04-20" type="text" readonly></dd>
              </dl>
            </div>
            <div class="col-sm-3">
              <dl class="dl-horizontal">
                <dt>截止日</dt>
               <dd>
                        <div class="input-group date form_date" data-date="" data-date-format="yyyy-mm-dd" data-link-field="companyRegisterAt" data-link-format="yyyy-mm-dd" style="width: 200px;">
                            <input class="form-control" value="" readonly type="text">
                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                        </div>
                       
                    </dd>
              </dl>
             
            </div>
          </div>
          <div class="from_con clearfix">
            <div class="col-sm-6">
              <dl class="dl-horizontal">
                <dt>&nbsp;</dt>
                <dd> <button class="btn btn-danger"  style="width:100px;">计算</button></dd>
              </dl>
            </div>
             <div class="col-sm-6 text-right">
             <h5 class="text-danger">计算结果</h5>
             <h5><span class="text-muted">本金： </span>200,000 元&nbsp;&nbsp;&nbsp;<span class="text-muted">利息： </span>28,000 元</h5>
             <h4><b>合计：220,000 元</b></h4>
             </div>
          </div>
        </div>
      </div>
      
      <div role="tabpanel" class="tab-pane" id="tab4">
        <div class="row">
          <div class="col-sm-12 list_box">
            <table class="table table-bordered table-striped">
              <thead>
                <tr>
                
                  <th>还款状态</th>
                  <th>催收方式</th>
                  <th>催收人</th>
                  <th>催收时间</th>
                  <th>备注</th>
                </tr>
              </thead>
              <tbody >
             
                <td>还款处理</td>
                <td>短信</td>
                <td>某某</td>
                <td>201521021520</td>
                <td>短信备注</td>
              </tbody>
            </table>
          </div>
        </div>
      </div>
      <div role="tabpanel" class="tab-pane" id="tab2">
        <div class="row">
          <div class="col-sm-12">
            <div class="from_box">
              <div class="from_tit clearfix">
                <h3 class="pull-left">经销商信息</h3>
              </div>
              <div class="img_list" >
                <ul class="list-inline" >
        <li>
          <div class="file_img">
            <p class="tools"><a href="javascript:void(0);" onclick="pictureDownload(7701)" title="保存"><i class="fa  fa-save"></i></a><a href="/loanAttachments_e/0CC3974FB58F4D0B8939749A5FF3E7C4/身份证正面-17031427.jpg" data-lightbox="example-set" data-title="身份证正面" title="放大"><i class="fa  fa-search-plus"></i></a></p>
            <a href="/loanAttachments_e/0CC3974FB58F4D0B8939749A5FF3E7C4/身份证正面-17031427.jpg" data-lightbox="set_img" data-title="身份证正面" title="放大"><img class="example-image" src="/loanAttachments_e/small/0CC3974FB58F4D0B8939749A5FF3E7C4/身份证正面-17031427.jpg" id="idCardType"></a> </div>
          <h4>夫妻双方身份证</h4>
        </li>
        <li>
          <div class="file_img">
            <p class="tools"><a href="javascript:void(0);" onclick="pictureDownload(7702)" title="保存"><i class="fa  fa-save"></i></a><a href="/loanAttachments_e/0CC3974FB58F4D0B8939749A5FF3E7C4/车辆行驶证-1703146.jpg" data-lightbox="example-set" data-title="车辆行驶证" title="放大"><i class="fa  fa-search-plus"></i></a></p>
            <a href="/loanAttachments_e/0CC3974FB58F4D0B8939749A5FF3E7C4/车辆行驶证-1703146.jpg" data-lightbox="set_img" data-title="车辆行驶证" title="放大"><img class="example-image" src="/loanAttachments_e/small/0CC3974FB58F4D0B8939749A5FF3E7C4/车辆行驶证-1703146.jpg" id="vehicleLicense"></a> </div>
          <h4>结婚证（离婚证）</h4>
        </li>
        <li>
          <div class="file_img">
            <p class="tools"><a href="javascript:void(0);" onclick="pictureDownload(7702)" title="保存"><i class="fa  fa-save"></i></a><a href="/loanAttachments_e/0CC3974FB58F4D0B8939749A5FF3E7C4/车辆行驶证-1703146.jpg" data-lightbox="example-set" data-title="车辆行驶证" title="放大"><i class="fa  fa-search-plus"></i></a></p>
            <a href="/loanAttachments_e/0CC3974FB58F4D0B8939749A5FF3E7C4/车辆行驶证-1703146.jpg" data-lightbox="set_img" data-title="车辆行驶证" title="放大"><img class="example-image" src="/loanAttachments_e/small/0CC3974FB58F4D0B8939749A5FF3E7C4/车辆行驶证-1703146.jpg" id="vehicleLicense"></a> </div>
          <h4>户口本</h4>
        </li>
        <li>
          <div class="file_img">
            <p class="tools"><a href="javascript:void(0);" onclick="pictureDownload(7702)" title="保存"><i class="fa  fa-save"></i></a><a href="/loanAttachments_e/0CC3974FB58F4D0B8939749A5FF3E7C4/车辆行驶证-1703146.jpg" data-lightbox="example-set" data-title="车辆行驶证" title="放大"><i class="fa  fa-search-plus"></i></a></p>
            <a href="/loanAttachments_e/0CC3974FB58F4D0B8939749A5FF3E7C4/车辆行驶证-1703146.jpg" data-lightbox="set_img" data-title="车辆行驶证" title="放大"><img class="example-image" src="/loanAttachments_e/small/0CC3974FB58F4D0B8939749A5FF3E7C4/车辆行驶证-1703146.jpg" id="vehicleLicense"></a> </div>
          <h4>房产证或购房合同</h4>
        </li>
        <li>
          <div class="file_img">
            <p class="tools"><a href="javascript:void(0);" onclick="pictureDownload(7702)" title="保存"><i class="fa  fa-save"></i></a><a href="/loanAttachments_e/0CC3974FB58F4D0B8939749A5FF3E7C4/车辆行驶证-1703146.jpg" data-lightbox="example-set" data-title="车辆行驶证" title="放大"><i class="fa  fa-search-plus"></i></a></p>
            <a href="/loanAttachments_e/0CC3974FB58F4D0B8939749A5FF3E7C4/车辆行驶证-1703146.jpg" data-lightbox="set_img" data-title="车辆行驶证" title="放大"><img class="example-image" src="/loanAttachments_e/small/0CC3974FB58F4D0B8939749A5FF3E7C4/车辆行驶证-1703146.jpg" id="vehicleLicense"></a> </div>
          <h4>夫妻双方征信</h4>
        </li>
        <li>
          <div class="file_img">
            <p class="tools"><a href="javascript:void(0);" onclick="pictureDownload(7702)" title="保存"><i class="fa  fa-save"></i></a><a href="/loanAttachments_e/0CC3974FB58F4D0B8939749A5FF3E7C4/车辆行驶证-1703146.jpg" data-lightbox="example-set" data-title="车辆行驶证" title="放大"><i class="fa  fa-search-plus"></i></a></p>
            <a href="/loanAttachments_e/0CC3974FB58F4D0B8939749A5FF3E7C4/车辆行驶证-1703146.jpg" data-lightbox="set_img" data-title="车辆行驶证" title="放大"><img class="example-image" src="/loanAttachments_e/small/0CC3974FB58F4D0B8939749A5FF3E7C4/车辆行驶证-1703146.jpg" id="vehicleLicense"></a> </div>
          <h4>营业执照</h4>
        </li>
        <li>
          <div class="file_img">
            <p class="tools"><a href="javascript:void(0);" onclick="pictureDownload(7702)" title="保存"><i class="fa  fa-save"></i></a><a href="/loanAttachments_e/0CC3974FB58F4D0B8939749A5FF3E7C4/车辆行驶证-1703146.jpg" data-lightbox="example-set" data-title="车辆行驶证" title="放大"><i class="fa  fa-search-plus"></i></a></p>
            <a href="/loanAttachments_e/0CC3974FB58F4D0B8939749A5FF3E7C4/车辆行驶证-1703146.jpg" data-lightbox="set_img" data-title="车辆行驶证" title="放大"><img class="example-image" src="/loanAttachments_e/small/0CC3974FB58F4D0B8939749A5FF3E7C4/车辆行驶证-1703146.jpg" id="vehicleLicense"></a> </div>
          <h4>法人身份证</h4>
        </li>
        <li>
          <div class="file_img">
            <p class="tools"><a href="javascript:void(0);" onclick="pictureDownload(7702)" title="保存"><i class="fa  fa-save"></i></a><a href="/loanAttachments_e/0CC3974FB58F4D0B8939749A5FF3E7C4/车辆行驶证-1703146.jpg" data-lightbox="example-set" data-title="车辆行驶证" title="放大"><i class="fa  fa-search-plus"></i></a></p>
            <a href="/loanAttachments_e/0CC3974FB58F4D0B8939749A5FF3E7C4/车辆行驶证-1703146.jpg" data-lightbox="set_img" data-title="车辆行驶证" title="放大"><img class="example-image" src="/loanAttachments_e/small/0CC3974FB58F4D0B8939749A5FF3E7C4/车辆行驶证-1703146.jpg" id="vehicleLicense"></a> </div>
          <h4>场地租赁/购房合同</h4>
        </li>
        <li>
          <div class="file_img">
            <p class="tools"><a href="javascript:void(0);" onclick="pictureDownload(7702)" title="保存"><i class="fa  fa-save"></i></a><a href="/loanAttachments_e/0CC3974FB58F4D0B8939749A5FF3E7C4/车辆行驶证-1703146.jpg" data-lightbox="example-set" data-title="车辆行驶证" title="放大"><i class="fa  fa-search-plus"></i></a></p>
            <a href="/loanAttachments_e/0CC3974FB58F4D0B8939749A5FF3E7C4/车辆行驶证-1703146.jpg" data-lightbox="set_img" data-title="车辆行驶证" title="放大"><img class="example-image" src="/loanAttachments_e/small/0CC3974FB58F4D0B8939749A5FF3E7C4/车辆行驶证-1703146.jpg" id="vehicleLicense"></a> </div>
          <h4>场地照片1</h4>
        </li>
        <li>
          <div class="file_img">
            <p class="tools"><a href="javascript:void(0);" onclick="pictureDownload(7702)" title="保存"><i class="fa  fa-save"></i></a><a href="/loanAttachments_e/0CC3974FB58F4D0B8939749A5FF3E7C4/车辆行驶证-1703146.jpg" data-lightbox="example-set" data-title="车辆行驶证" title="放大"><i class="fa  fa-search-plus"></i></a></p>
            <a href="/loanAttachments_e/0CC3974FB58F4D0B8939749A5FF3E7C4/车辆行驶证-1703146.jpg" data-lightbox="set_img" data-title="车辆行驶证" title="放大"><img class="example-image" src="/loanAttachments_e/small/0CC3974FB58F4D0B8939749A5FF3E7C4/车辆行驶证-1703146.jpg" id="vehicleLicense"></a> </div>
          <h4>场地照片1</h4>
        </li>
        <li>
          <div class="file_img">
            <p class="tools"><a href="javascript:void(0);" onclick="pictureDownload(7702)" title="保存"><i class="fa  fa-save"></i></a><a href="/loanAttachments_e/0CC3974FB58F4D0B8939749A5FF3E7C4/车辆行驶证-1703146.jpg" data-lightbox="example-set" data-title="车辆行驶证" title="放大"><i class="fa  fa-search-plus"></i></a></p>
            <a href="/loanAttachments_e/0CC3974FB58F4D0B8939749A5FF3E7C4/车辆行驶证-1703146.jpg" data-lightbox="set_img" data-title="车辆行驶证" title="放大"><img class="example-image" src="/loanAttachments_e/small/0CC3974FB58F4D0B8939749A5FF3E7C4/车辆行驶证-1703146.jpg" id="vehicleLicense"></a> </div>
          <h4>场地照片2</h4>
        </li>
        <li>
          <div class="file_img">
            <p class="tools"><a href="javascript:void(0);" onclick="pictureDownload(7702)" title="保存"><i class="fa  fa-save"></i></a><a href="/loanAttachments_e/0CC3974FB58F4D0B8939749A5FF3E7C4/车辆行驶证-1703146.jpg" data-lightbox="example-set" data-title="车辆行驶证" title="放大"><i class="fa  fa-search-plus"></i></a></p>
            <a href="/loanAttachments_e/0CC3974FB58F4D0B8939749A5FF3E7C4/车辆行驶证-1703146.jpg" data-lightbox="set_img" data-title="车辆行驶证" title="放大"><img class="example-image" src="/loanAttachments_e/small/0CC3974FB58F4D0B8939749A5FF3E7C4/车辆行驶证-1703146.jpg" id="vehicleLicense"></a> </div>
          <h4>场地照片3</h4>
        </li>
        <li>
          <div class="file_img">
            <p class="tools"><a href="javascript:void(0);" onclick="pictureDownload(7702)" title="保存"><i class="fa  fa-save"></i></a><a href="/loanAttachments_e/0CC3974FB58F4D0B8939749A5FF3E7C4/车辆行驶证-1703146.jpg" data-lightbox="example-set" data-title="车辆行驶证" title="放大"><i class="fa  fa-search-plus"></i></a></p>
            <a href="/loanAttachments_e/0CC3974FB58F4D0B8939749A5FF3E7C4/车辆行驶证-1703146.jpg" data-lightbox="set_img" data-title="车辆行驶证" title="放大"><img class="example-image" src="/loanAttachments_e/small/0CC3974FB58F4D0B8939749A5FF3E7C4/车辆行驶证-1703146.jpg" id="vehicleLicense"></a> </div>
          <h4>近6个月主要银行流水</h4>
        </li>
        <li>
          <div class="file_img">
            <p class="tools"><a href="javascript:void(0);" onclick="pictureDownload(7702)" title="保存"><i class="fa  fa-save"></i></a><a href="/loanAttachments_e/0CC3974FB58F4D0B8939749A5FF3E7C4/车辆行驶证-1703146.jpg" data-lightbox="example-set" data-title="车辆行驶证" title="放大"><i class="fa  fa-search-plus"></i></a></p>
            <a href="/loanAttachments_e/0CC3974FB58F4D0B8939749A5FF3E7C4/车辆行驶证-1703146.jpg" data-lightbox="set_img" data-title="车辆行驶证" title="放大"><img class="example-image" src="/loanAttachments_e/small/0CC3974FB58F4D0B8939749A5FF3E7C4/车辆行驶证-1703146.jpg" id="vehicleLicense"></a> </div>
          <h4>目前员工身份证和联系方式</h4>
        </li>
        <li>
          <div class="file_img">
            <p class="tools"><a href="javascript:void(0);" onclick="pictureDownload(7702)" title="保存"><i class="fa  fa-save"></i></a><a href="/loanAttachments_e/0CC3974FB58F4D0B8939749A5FF3E7C4/车辆行驶证-1703146.jpg" data-lightbox="example-set" data-title="车辆行驶证" title="放大"><i class="fa  fa-search-plus"></i></a></p>
            <a href="/loanAttachments_e/0CC3974FB58F4D0B8939749A5FF3E7C4/车辆行驶证-1703146.jpg" data-lightbox="set_img" data-title="车辆行驶证" title="放大"><img class="example-image" src="/loanAttachments_e/small/0CC3974FB58F4D0B8939749A5FF3E7C4/车辆行驶证-1703146.jpg" id="vehicleLicense"></a> </div>
          <h4>摄像头安装</h4>
        </li>
        <li>
          <div class="file_img">
            <p class="tools"><a href="javascript:void(0);" onclick="pictureDownload(7702)" title="保存"><i class="fa  fa-save"></i></a><a href="/loanAttachments_e/0CC3974FB58F4D0B8939749A5FF3E7C4/车辆行驶证-1703146.jpg" data-lightbox="example-set" data-title="车辆行驶证" title="放大"><i class="fa  fa-search-plus"></i></a></p>
            <a href="/loanAttachments_e/0CC3974FB58F4D0B8939749A5FF3E7C4/车辆行驶证-1703146.jpg" data-lightbox="set_img" data-title="车辆行驶证" title="放大"><img class="example-image" src="/loanAttachments_e/small/0CC3974FB58F4D0B8939749A5FF3E7C4/车辆行驶证-1703146.jpg" id="vehicleLicense"></a> </div>
          <h4>摄像头安装</h4>
        </li>
      </ul>
              </div>
            </div>
          </div>
          <div class="col-sm-12">
            <div class="from_box">
              <div class="from_tit clearfix">
                <h3 class="pull-left">车辆类信息</h3>
              </div>
              <div class="img_list" >
                <ul class="list-inline">
                  <li>
                    <div class="file_img">
                      <p class="tools"><a  href="#" title="保存"><i class="fa  fa-save"></i></a> <a  href="img/ls/身份证-16041517.jpg" data-lightbox="example-set" data-title="身份证 " title="放大"><i class="fa  fa-search-plus"></i></a> </p>
                      <img class="example-image" src="img/ls/身份证-16041517.jpg" alt="身份证"/></div>
                    <h4>车辆照片</h4>
                  </li>
                  <li>
                    <div class="file_img">
                      <p class="tools"><a  href="#" title="保存"><i class="fa  fa-save"></i></a> <a href="img/ls/车辆行驶证-16041514.jpg" data-lightbox="example-set" data-title="车辆行驶证"><i class="fa  fa-search-plus"></i></a></p>
                      <img  src="img/ls/车辆行驶证-16041514.jpg"></div>
                    <h4>人车合照</h4>
                  </li>
                  <li>
                    <div class="file_img">
                      <p class="tools"><a  href="#" title="保存"><i class="fa  fa-save"></i></a> <a href="img/ls/车辆行驶证-16041514.jpg" data-lightbox="example-set" data-title="车辆行驶证"><i class="fa  fa-search-plus"></i></a></p>
                      <img  src="img/ls/车辆行驶证-16041514.jpg"></div>
                    <h4>车辆保险</h4>
                  </li>
                </ul>
              </div>
            </div>
          </div>
          <div class="col-sm-12">
            <div class="from_box">
              <div class="from_tit clearfix">
                <h3 class="pull-left">合同类信息</h3>
              </div>
              <div class="img_list" >
                <div class="img_list">
      <ul class="list-inline" >
        <li>
          <div class="file_img">
            <p class="tools"><a href="javascript:void(0);" onclick="pictureDownload(7701)" title="保存"><i class="fa  fa-save"></i></a><a href="/loanAttachments_e/0CC3974FB58F4D0B8939749A5FF3E7C4/身份证正面-17031427.jpg" data-lightbox="example-set" data-title="身份证正面" title="放大"><i class="fa  fa-search-plus"></i></a></p>
            <a href="/loanAttachments_e/0CC3974FB58F4D0B8939749A5FF3E7C4/身份证正面-17031427.jpg" data-lightbox="set_img" data-title="身份证正面" title="放大"><img class="example-image" src="/loanAttachments_e/small/0CC3974FB58F4D0B8939749A5FF3E7C4/身份证正面-17031427.jpg" id="idCardType"></a> </div>
          <h4>车商融资贷款合同</h4>
        </li>
        <li>
          <div class="file_img">
            <p class="tools"><a href="javascript:void(0);" onclick="pictureDownload(7702)" title="保存"><i class="fa  fa-save"></i></a><a href="/loanAttachments_e/0CC3974FB58F4D0B8939749A5FF3E7C4/车辆行驶证-1703146.jpg" data-lightbox="example-set" data-title="车辆行驶证" title="放大"><i class="fa  fa-search-plus"></i></a></p>
            <a href="/loanAttachments_e/0CC3974FB58F4D0B8939749A5FF3E7C4/车辆行驶证-1703146.jpg" data-lightbox="set_img" data-title="车辆行驶证" title="放大"><img class="example-image" src="/loanAttachments_e/small/0CC3974FB58F4D0B8939749A5FF3E7C4/车辆行驶证-1703146.jpg" id="vehicleLicense"></a> </div>
          <h4>车商融资贷款合同</h4>
        </li>
        <li>
          <div class="file_img">
            <p class="tools"><a href="javascript:void(0);" onclick="pictureDownload(7702)" title="保存"><i class="fa  fa-save"></i></a><a href="/loanAttachments_e/0CC3974FB58F4D0B8939749A5FF3E7C4/车辆行驶证-1703146.jpg" data-lightbox="example-set" data-title="车辆行驶证" title="放大"><i class="fa  fa-search-plus"></i></a></p>
            <a href="/loanAttachments_e/0CC3974FB58F4D0B8939749A5FF3E7C4/车辆行驶证-1703146.jpg" data-lightbox="set_img" data-title="车辆行驶证" title="放大"><img class="example-image" src="/loanAttachments_e/small/0CC3974FB58F4D0B8939749A5FF3E7C4/车辆行驶证-1703146.jpg" id="vehicleLicense"></a> </div>
          <h4>联保合同</h4>
        </li>
        <li>
          <div class="file_img">
            <p class="tools"><a href="javascript:void(0);" onclick="pictureDownload(7702)" title="保存"><i class="fa  fa-save"></i></a><a href="/loanAttachments_e/0CC3974FB58F4D0B8939749A5FF3E7C4/车辆行驶证-1703146.jpg" data-lightbox="example-set" data-title="车辆行驶证" title="放大"><i class="fa  fa-search-plus"></i></a></p>
            <a href="/loanAttachments_e/0CC3974FB58F4D0B8939749A5FF3E7C4/车辆行驶证-1703146.jpg" data-lightbox="set_img" data-title="车辆行驶证" title="放大"><img class="example-image" src="/loanAttachments_e/small/0CC3974FB58F4D0B8939749A5FF3E7C4/车辆行驶证-1703146.jpg" id="vehicleLicense"></a> </div>
          <h4>展厅转租与车商APP合同</h4>
        </li>
        <li>
          <div class="file_img">
            <p class="tools"><a href="javascript:void(0);" onclick="pictureDownload(7702)" title="保存"><i class="fa  fa-save"></i></a><a href="/loanAttachments_e/0CC3974FB58F4D0B8939749A5FF3E7C4/车辆行驶证-1703146.jpg" data-lightbox="example-set" data-title="车辆行驶证" title="放大"><i class="fa  fa-search-plus"></i></a></p>
            <a href="/loanAttachments_e/0CC3974FB58F4D0B8939749A5FF3E7C4/车辆行驶证-1703146.jpg" data-lightbox="set_img" data-title="车辆行驶证" title="放大"><img class="example-image" src="/loanAttachments_e/small/0CC3974FB58F4D0B8939749A5FF3E7C4/车辆行驶证-1703146.jpg" id="vehicleLicense"></a> </div>
          <h4>金融专员授权书</h4>
        </li>
      </ul>
    </div>
              </div>
            </div>
          </div>
          
        </div>
        
      </div>
      <div role="tabpanel" class="tab-pane" id="tab6">
        <div class="clearfix">
      <div class="from_box col-sm-3">
          <div class="from_tit clearfix">
            <h3 class="pull-left">申请总订单数</h3>
          </div>
          <h1 class="text-danger text-center" style="margin-top:10px;">30单</h1>
        </div>
        <div class="col-sm-3">
        <div class="from_box ">
          <div class="from_tit clearfix">
            <h3 class="pull-left">已放款订单/金额</h3>
          </div>
          <h1 class="text-danger text-center" style="margin-top:10px;">10单 / 25.8万元</h1>
        </div></div>
         <div class="col-sm-3">
        <div class="from_box">
          <div class="from_tit clearfix">
            <h3 class="pull-left">未放款订单数</h3>
          </div>
          <h1 class="text-danger text-center" style="margin-top:10px;">20单</h1>
        </div>
        </div>
        <div class="col-sm-3">
        <div class="from_box">
          <div class="from_tit clearfix">
            <h3 class="pull-left">逾期订单/金额</h3>
          </div>
          <h1 class="text-danger text-center" style="margin-top:10px;">1单 / 10.0万元</h1>
        </div>
        </div>
      </div>
        <div class="from_box">
          <div class="from_tit clearfix">
            <h3 class="pull-left">基本信息</h3>
          </div>
          <div class="row">
            <div class="col-sm-4">
              <dl class="dl-horizontal">
                <dt>经销商名称</dt>
                <dd>辉程汽车销售有限公司</dd>
              </dl>
            </div>
            <div class="col-sm-4">
              <dl class="dl-horizontal">
                <dt>营业执照号</dt>
                <dd>220211196503072726 </dd>
              </dl>
            </div>
            <div class="col-sm-4">
              <dl class="dl-horizontal">
                <dt>组织机构代码</dt>
                <dd>220211196503072726</dd>
              </dl>
            </div>
          </div>
          <div class="row">
            <div class="col-sm-4">
              <dl class="dl-horizontal">
                <dt>法定代表人</dt>
                <dd>某某 <i class="fa fa-phone-square text-danger" style="padding-left:10px;" ></i> 15567517095</dd>
              </dl>
            </div>
            <div class="col-sm-4">
              <dl class="dl-horizontal">
                <dt>实际控股人</dt>
                <dd>某某 <i class="fa fa-phone-square text-danger" style="padding-left:10px;" ></i> 15567517095</dd>
              </dl>
            </div>
            <div class="col-sm-4">
              <dl class="dl-horizontal">
                <dt>业务联系人</dt>
                <dd>某某 <i class="fa fa-phone-square text-danger" style="padding-left:10px;" ></i> 15567517095</dd>
              </dl>
            </div>
          </div>
          <div class="row">
            <div class="col-sm-4">
              <dl class="dl-horizontal">
                <dt>金融保险经理</dt>
                <dd>某某 <i class="fa fa-phone-square text-danger" style="padding-left:10px;" ></i> 15567517095</dd>
              </dl>
            </div>
            <div class="col-sm-4">
              <dl class="dl-horizontal">
                <dt>财务经理</dt>
                <dd>某某 <i class="fa fa-phone-square text-danger" style="padding-left:10px;" ></i> 15567517095</dd>
              </dl>
            </div>
            <div class="col-sm-4">
              <dl class="dl-horizontal">
                <dt>公司地址</dt>
                <dd>吉林省吉林市船营区红光胡同4-1-3号</dd>
              </dl>
            </div>
          </div>
          <div class="row">
          <div class="col-sm-4">
        <dl class="dl-horizontal">
          <dt>车位个数</dt>
          <dd>-</dd>
        </dl>
      </div>
      <div class="col-sm-4">
        <dl class="dl-horizontal">
          <dt>库存量</dt>
          <dd>-</dd>
        </dl>
      </div>
      <div class="col-sm-4">
        <dl class="dl-horizontal">
          <dt>车商规模</dt>
          <dd>-</dd>
        </dl>
      </div>
          </div>
          <div class="row">
            <div class="col-sm-8">
              <dl class="dl-horizontal">
                <dt>车行介绍</dt>
                <dd></dd>
              </dl>
            </div>
          </div>
        </div>
        <div class="from_box">
          <div class="from_tit clearfix">
            <h3>银行卡信息</h3>
          </div>
          <div class="row">
            <div class="col-sm-4">
              <dl class="dl-horizontal">
                <dt>收款银行卡</dt>
                <dd>2131321231321231321321</dd>
              </dl>
            </div>
            <div class="col-sm-4">
              <dl class="dl-horizontal">
                <dt>开户行</dt>
                <dd>广发银行</dd>
              </dl>
            </div>
            <div class="col-sm-4">
              <dl class="dl-horizontal">
                <dt>开户名</dt>
                <dd>某某</dd>
              </dl>
            </div>
          </div>
          <div class="row">
            <div class="col-sm-4">
              <dl class="dl-horizontal">
                <dt>还款银行卡</dt>
                <dd>2131321231321231321321</dd>
              </dl>
            </div>
            <div class="col-sm-4">
              <dl class="dl-horizontal">
                <dt>开户行</dt>
                <dd>广发银行</dd>
              </dl>
            </div>
            <div class="col-sm-4">
              <dl class="dl-horizontal">
                <dt>开户名</dt>
                <dd>某某</dd>
              </dl>
            </div>
          </div>
        </div>
      </div>
      <div role="tabpanel" class="tab-pane" id="tab7">
        <div class="from_box">
          <div class="from_tit clearfix">
            <h3 class="pull-left">车辆信息</h3>
          </div>
          <div class="row">
            <div class="col-sm-3">
              <dl class="dl-horizontal">
                <dt>车辆品牌</dt>
                <dd>宝马</dd>
              </dl>
            </div>
            <div class="col-sm-3">
              <dl class="dl-horizontal">
                <dt>车辆型号</dt>
                <dd>BMW7200DL</dd>
              </dl>
            </div>
            <div class="col-sm-3">
              <dl class="dl-horizontal">
                <dt>车牌号码</dt>
                <dd>吉AE320F</dd>
              </dl>
            </div>
            <div class="col-sm-3">
              <dl class="dl-horizontal">
                <dt>已行驶里程</dt>
                <dd>56521公里</dd>
              </dl>
            </div>
          </div>
          <div class="row">
            <div class="col-sm-3">
              <dl class="dl-horizontal">
                <dt>购置日期</dt>
                <dd>2013-11-05</dd>
              </dl>
            </div>
            <div class="col-sm-3">
              <dl class="dl-horizontal">
                <dt>车架号</dt>
                <dd>LBV3M2109EMC25464</dd>
              </dl>
            </div>
            <div class="col-sm-3">
              <dl class="dl-horizontal">
                <dt>发动机号</dt>
                <dd>0374D227</dd>
              </dl>
            </div>
            <div class="col-sm-3">
              <dl class="dl-horizontal">
                <dt>室       内</dt>
                <dd>两厢</dd>
              </dl>
            </div>
          </div>
          <div class="row">
            <div class="col-sm-3">
              <dl class="dl-horizontal">
                <dt>配       置</dt>
                <dd>两驱</dd>
              </dl>
            </div>
            <div class="col-sm-3">
              <dl class="dl-horizontal">
                <dt>颜色</dt>
                <dd>白</dd>
              </dl>
            </div>
            <div class="col-sm-3">
              <dl class="dl-horizontal">
                <dt>胎铃</dt>
                <dd>正常</dd>
              </dl>
            </div>
            <div class="col-sm-3">
              <dl class="dl-horizontal">
                <dt>排量</dt>
                <dd>2.0L</dd>
              </dl>
            </div>
          </div>
          <div class="row">
            <div class="col-sm-3">
              <dl class="dl-horizontal">
                <dt>暗       锁</dt>
                <dd>无</dd>
              </dl>
            </div>
            <div class="col-sm-9">
              <dl class="dl-horizontal">
                <dt>随车工具</dt>
                <dd>工具,千斤,备胎罩,备胎</dd>
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
                <dt>波箱</dt>
                <dd>正常</dd>
              </dl>
            </div>
            <div class="col-sm-3">
              <dl class="dl-horizontal">
                <dt>发动机</dt>
                <dd>正常</dd>
              </dl>
            </div>
            <div class="col-sm-3">
              <dl class="dl-horizontal">
                <dt>发票价</dt>
                <dd>32.58万元</dd>
              </dl>
            </div>
            <div class="col-sm-3">
              <dl class="dl-horizontal">
                <dt>全款/按揭</dt>
                <dd>全款</dd>
              </dl>
            </div>
          </div>
          <div class="row">
            <div class="col-sm-3">
              <dl class="dl-horizontal">
                <dt>评估价格</dt>
                <dd><b class="text-danger">14.00</b> 万元</dd>
              </dl>
            </div>
            <div class="col-sm-3">
              <dl class="dl-horizontal">
                <dt>评估师 </dt>
                <dd>苗杰</dd>
              </dl>
            </div>
            <div class="col-sm-6">
              <dl class="dl-horizontal">
                <dt>评估结论</dt>
                <dd><span class="text-danger">同意放款14万</span></dd>
              </dl>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="op_box">
    <h4>催收</h4>
    <div class="op_box_con clearfix">
      <form class="form-horizontal">
        <div class=" col-sm-12">
          <div class="form-group">
            <label class="col-sm-2 control-label"> 短信催收</label>
            <div class="col-sm-8">
              <textarea cols="168" rows="2" class="form-control">温馨提示：木耳您好，您金额为100000.00元借款的本月应付利息0.00元，应付本金8333.33元，GPS费用0.00元，管理费0.00元一共是8333.33元还款日期为2016年05月07日，请您按期还款，以免电脑自动产生（0.5％日）的违约金及罚息，如已付款请忽略  [东莞市银港投资]</textarea>
            </div>
          </div>
          <div class="form-group">
            <div class="col-sm-2 col-sm-offset-2"> <a  href = "javascript:void(0)" onclick = "" class="btn btn-danger  btn-search">发送短信</a> </div>
          </div>
          <div class="form-group">
            <label  class="col-sm-2 control-label"><i class="text-danger">*</i> 电话催收备注</label>
            <div class="col-sm-8">
              <textarea cols="168" rows="2" class="form-control" id="hostOpinion"
                                  name="hostOpinion"></textarea>
            </div>
          </div>
        </div>
      </form>
    </div>
  </div>
  <div class="op_box">
    <h4>还款</h4>
    <div class="op_box_con clearfix">
      <form class="form-horizontal">
        <div class="form-group">
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 还款方式</label>
          <div class="col-sm-8">
            <label class="radio-inline">
              <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1" checked="checked">
              正常还款 </label>
            <label class="radio-inline">
              <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option3">
              逾期处理 </label>
            <label class="radio-inline">
              <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option4">
              申请续借 </label>
            <label class="radio-inline">
              <input type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option5">
              放弃还款 </label>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 还款日期</label>
          <div class="col-sm-8"> <div class="input-group date form_date" data-date="" data-date-format="yyyy-mm-dd" data-link-field="companyRegisterAt" data-link-format="yyyy-mm-dd" style="width: 200px;">
                            <input class="form-control" value="" readonly type="text">
                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                        </div> </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 上传还款凭证截图</label>
          <div class="col-sm-8"> </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 还款信息备注</label>
          <div class="col-sm-8">
            <textarea cols="168" rows="2" class="form-control" 
                                  ></textarea>
          </div>
        </div>
      </form>
    </div>
  </div>
  <div class="op_box">
    <h4>还款评审</h4>
    <div class="op_box_con clearfix">
      <form class="form-horizontal">
        <div class="form-group">
          <label class="col-sm-2 control-label"> 还款方式</label>
          <div class="col-sm-1">
            <p class="form-control-static  text-muted"> 正常还款 </p>
          </div>
          <label class="col-sm-2 control-label"> 还款操作员</label>
          <div class="col-sm-1">
            <p class="form-control-static text-muted"> 某某 </p>
          </div>
          <label class="col-sm-2 control-label"> 操作时间</label>
          <div class="col-sm-2">
            <p class="form-control-static text-muted"> 2016-05-03 16:29:37 </p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label"> 还款凭证</label>
          <div class="col-sm-10">
            <div class="img_list" >
              <ul class="list-inline">
                <li>
                  <div class="file_img">
                    <p class="tools"><a  href="#" title="保存"><i class="fa  fa-save"></i></a> <a  href="../img/ls/身份证-16041517.jpg" data-lightbox="example-set" data-title="凭证一 " title="放大"><i class="fa  fa-search-plus"></i></a> </p>
                    <img class="example-image" src="../img/ls/身份证-16041517.jpg" alt="身份证"/></div>
                </li>
                <li>
                  <div class="file_img">
                    <p class="tools"><a  href="#" title="保存"><i class="fa  fa-save"></i></a> <a href="../img/ls/车辆行驶证-16041514.jpg" data-lightbox="example-set" data-title="凭证二"><i class="fa  fa-search-plus"></i></a></p>
                    <img  src="../img/ls/车辆行驶证-16041514.jpg"></div>
                </li>
              </ul>
            </div>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label"> 还款信息备注</label>
          <div class="col-sm-10">
            <p class="form-control-static text-muted"> 还款信息备注正常还款 </p>
          </div>
        </div>
        <hr />
        <div class="form-group" style="margin-bottom:10px;">
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 评审结论</label>
          <div class="col-sm-10">
            <label class="radio-inline">
              <input type="radio" name="rad_ok" value="option1" checked="checked">
              确认无误进行还款 </label>
            <label class="radio-inline">
              <input type="radio" name="rad_ok" value="option2">
              凭证有误，驳回 </label>
          </div>
        </div>
        <div class="form-group">
          <label  class="col-sm-2 control-label"><i class="text-danger">*</i> 还款实际金额</label>
          <div class="col-sm-8">
            <div class="input-group input-append pull-left" style="width:160px">
              <input type="text" class="form-control" autofocus id="repaymentAmount"
                               onkeyup="displayUpper()"
                               onpaste="return false" style="width:100%;">
              <span class="add-on input-group-addon">元</span> </div>
            <p class="help-block pull-left" style="padding-left:10px;">应还金额 <span class="text-danger">5000.00</span> 元</p>
          </div>
        </div>
        <div class="form-group">
          <label  class="col-sm-2 control-label"><i class="text-danger">*</i> 评审备注</label>
          <div class="col-sm-8">
            <textarea cols="168" rows="2" class="form-control" id="hostOpinion"
                                  name="hostOpinion"></textarea>
          </div>
        </div>
      </form>
    </div>
  </div>
  <div class="op_box">
    <h4>逾期处理</h4>
    <div class="op_box_con clearfix">
      <form class="form-horizontal">
        <div class="form-group">
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 处理方式</label>
          <div class="col-sm-8">
            <label class="radio-inline">
              <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1" checked="checked">
              申请罚息调整 </label>
            <label class="radio-inline">
              <input type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3">
              风控二次处理 </label>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 逾期处理备注</label>
          <div class="col-sm-8">
            <textarea cols="168" rows="2" class="form-control" 
                                  ></textarea>
          </div>
        </div>
      </form>
    </div>
  </div>
  <div class="op_box">
    <h4>续借处理</h4>
    <div class="op_box_con clearfix">
      <form class="form-horizontal">
        <div class="form-group">
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 处理方式</label>
          <div class="col-sm-8">
            <label class="radio-inline">
              <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1" checked="checked">
              同意续借 </label>
            <label class="radio-inline">
              <input type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3">
              拒绝续借 </label>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 续借处理备注</label>
          <div class="col-sm-8">
            <textarea cols="168" rows="2" class="form-control" 
                                  ></textarea>
          </div>
        </div>
      </form>
    </div>
  </div>
  <div class="op_box">
    <h4>续借还款处理</h4>
    <div class="op_box_con clearfix">
      <form class="form-horizontal">
        <div class="form-group">
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 处理方式</label>
          <div class="col-sm-8">
            <label class="radio-inline">
              <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1" checked="checked">
              同意还款 </label>
            <label class="radio-inline">
              <input type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3">
              放弃还款 </label>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 上传还款凭证截图</label>
          <div class="col-sm-8"> </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 续借处理备注</label>
          <div class="col-sm-8">
            <textarea cols="168" rows="2" class="form-control" 
                                  ></textarea>
          </div>
        </div>
      </form>
    </div>
  </div>

  <div class="op_box">
    <h4>借款展期续借</h4>
    <div class="op_box_con clearfix">
      <form class="form-horizontal" id="warp">
        <div class="form-group">
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 续借金额</label>
          <div class="col-sm-2">
            <div class="input-group input-append bootstrap-timepicker" style="width:160px">
              <input type="text" class="form-control" id="timepicker" style="width:100%;">
              <span class="add-on input-group-addon">万元</span> </div>
          </div>
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 续借天数</label>
          <div class="col-sm-2">
            <select class="form-control" >
              <option>1</option>
              <option>2</option>
              <option>3</option>
            </select>
          </div></div>
          <div class="form-group">
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 续借开始日期</label>
          <div class="col-sm-2">
            <div class="input-group date form_date" data-date=""
                                 data-date-format="yyyy-mm-dd"
                                 data-link-field="dateJoined"
                                 data-link-format="yyyy-mm-dd" >
              <input class="form-control" type="text" value="" readonly >
              <span class="input-group-addon"><span
                                        class="glyphicon glyphicon-calendar"></span></span> </div>
            <input type="text" hidden="hidden" id="date_tc" name="date_xj" />
          </div>
          <label class="col-sm-2 control-label"> 月利率</label>
           <div  class="col-sm-2">
           	<p class="form-control-static text-muted">0.88%</p>
           </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 上传续借合同</label>
          <div class="col-sm-8"> <a href="javascript:;" class="file">选择文件
            <input type="file" name="" id="up_img_WU_FILE_1">
            </a>
            <p class="file_img"><img id="imgShow_WU_FILE_1" ></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 评审结论</label>
          <div class="col-sm-8">
            <label class="radio-inline">
              <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1" checked="checked">
              完成续借 </label>
            <label class="radio-inline">
              <input type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3">
              续借有误，需调整续借手续 </label>
          </div>
        </div>
      </form>
    </div>
  </div>
  <div class="op_box">
    <h4>罚息处理</h4>
    <div class="op_box_con clearfix">
      <form class="form-horizontal">
        <div class="form-group">
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 本期罚息调整</label>
          <div class="col-sm-8">
            <div class="input-group input-append" style="width:160px">
              <input type="text" class="form-control" autofocus id="repaymentAmount"
                               onkeyup="displayUpper()"
                               onpaste="return false" style="width:100%;">
              <span class="add-on input-group-addon">元</span> </div>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 罚息处理备注</label>
          <div class="col-sm-8">
            <textarea cols="168" rows="2" class="form-control" 
                                  ></textarea>
          </div>
        </div>
      </form>
    </div>
  </div>
  <div class="op_box">
    <h4>风控二次处理</h4>
    <div class="op_box_con clearfix">
      <form class="form-horizontal">
        <div class="form-group">
          <label class="col-sm-2 control-label"></label>
          <div class="col-sm-8"> <a href="#tab7" aria-controls="tab7" role="tab" data-toggle="tab"  id="car_more">查看车辆信息</a> </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 处理结果</label>
          <!-- 根据是否是押车订单显示处理结果，如果押车就直接显示赝品出售即可-->
          <div class="col-sm-4">
            <label class="radio-inline">
              <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1" checked="checked">
              拖车处理 </label>
            <label class="radio-inline">
              <input type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3">
              坏账处理 </label>
          </div>
          <div class="col-sm-4">
            <label class="checkbox">
              <input type="checkbox" checked="checked" disabled="disabled" >
              押品处置</label>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 拖车处理备注</label>
          <div class="col-sm-8">
            <textarea cols="168" rows="2" class="form-control" 
                                  ></textarea>
          </div>
        </div>
      </form>
    </div>
  </div>
  <div class="op_box">
    <h4>拖车入库</h4>
    <div class="op_box_con clearfix">
      <form class="form-horizontal">
        <div class="form-group">
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 拖车时间</label>
          <div class="col-sm-2">
            <div class="input-group date form_date" data-date=""
                                 data-date-format="yyyy-mm-dd"
                                 data-link-field="dateJoined"
                                 data-link-format="yyyy-mm-dd" >
              <input class="form-control" type="text" value="" readonly >
              <span class="input-group-addon"><span
                                        class="glyphicon glyphicon-calendar"></span></span> </div>
            <input type="text" hidden="hidden" id="date_tc" name="date_tc" />
          </div>
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 营业厅</label>
          <div class="col-sm-2">
            <select  class="form-control">
              <option>请选择</option>
            </select>
          </div>
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 拖车费用</label>
          <div class="col-sm-2">
            <div class="input-group input-append" >
              <input type="text" class="form-control" autofocus id="repaymentAmount"
                               onkeyup="displayUpper()"
                               onpaste="return false">
              <span class="add-on input-group-addon">元</span> </div>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 车牌号</label>
          <div class="col-sm-2">
            <input type="text" class="form-control" readonly >
          </div>
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 拖车执行人员</label>
          <div class="col-sm-2">
            <input type="text" class="form-control" >
          </div>
        </div>
        <hr />
        <div class="form-group">
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 方向盘锁号</label>
          <div class="col-sm-2">
            <input type="text" class="form-control" >
          </div>
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 车轮锁号</label>
          <div class="col-sm-2">
            <input type="text" class="form-control" >
          </div>
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 停车位号</label>
          <div class="col-sm-2">
            <input type="text" class="form-control" >
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 入库时间</label>
          <div class="col-sm-2">
            <div class="input-group date form_date" data-date=""
                                 data-date-format="yyyy-mm-dd"
                                 data-link-field="dateJoined"
                                 data-link-format="yyyy-mm-dd">
              <input class="form-control" type="text" value="" readonly >
              <span class="input-group-addon"><span
                                        class="glyphicon glyphicon-calendar"></span></span> </div>
            <input type="text" hidden="hidden" id="date_tc" name="date_rk" />
          </div>
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 入库人</label>
          <div class="col-sm-2">
            <input type="text" class="form-control" >
          </div>
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 停车厂接收人</label>
          <div class="col-sm-2">
            <input type="text" class="form-control" >
          </div>
        </div>
      </form>
    </div>
  </div>
  <div class="op_box">
    <h4>押品处置</h4>
    <div class="op_box_con clearfix">
      <form class="form-horizontal">
        <div class="form-group">
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 处理结果</label>
          <div class="col-sm-4">
            <label class="radio-inline">
              <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1" checked="checked">
              还款提车 </label>
            <label class="radio-inline">
              <input type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option2">
              还款不提车 </label>
            <label class="radio-inline">
              <input type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3">
              卖车 </label>
          </div>
        </div>
        <div id="tc_box">
          <div class="form-group">
            <label class="col-sm-2 control-label"><i class="text-danger">*</i> 提车人员</label>
            <div class="col-sm-2">
              <input type="text" class="form-control" readonly value="张三" >
            </div>
            <label class="col-sm-2 control-label"><i class="text-danger">*</i> 提车日期</label>
            <div class="col-sm-2">
              <div class="input-group date form_date" data-date=""
                                 data-date-format="yyyy-mm-dd"
                                 data-link-field="dateJoined"
                                 data-link-format="yyyy-mm-dd">
                <input class="form-control" type="text" value="" readonly >
                <span class="input-group-addon"><span
                                        class="glyphicon glyphicon-calendar"></span></span> </div>
              <input type="text" hidden="hidden" id="date_tc" name="date_tc" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label"><i class="text-danger">*</i> 出库人员</label>
            <div class="col-sm-2">
              <input type="text" class="form-control" >
            </div>
            <label class="col-sm-2 control-label"><i class="text-danger">*</i> 出库日期</label>
            <div class="col-sm-2">
              <div class="input-group date form_date" data-date=""
                                 data-date-format="yyyy-mm-dd"
                                 data-link-field="dateJoined"
                                 data-link-format="yyyy-mm-dd">
                <input class="form-control" type="text" value="" readonly >
                <span class="input-group-addon"><span
                                        class="glyphicon glyphicon-calendar"></span></span> </div>
              <input type="text" hidden="hidden" id="date_tc" name="date_ck" />
            </div>
          </div>
          <div class="form-group"  id="warp">
            <label class="col-sm-2 control-label"><i class="text-danger">*</i> 提车凭证</label>
            <div class="col-sm-2"> <a href="javascript:;" class="file">选择文件
              <input type="file" name="" id="up_img_WU_FILE_0">
              </a>
              <p class="file_img"><img id="imgShow_WU_FILE_0" ></p>
            </div>
            <label class="col-sm-2 control-label"><i class="text-danger">*</i> 还款凭证</label>
            <div class="col-sm-2"> <a href="javascript:;" class="file">选择文件
              <input type="file" name="" id="up_img_WU_FILE_1">
              </a>
              <p class="file_img"><img id="imgShow_WU_FILE_1" ></p>
            </div>
          </div>
        </div>
        <!--选择售出车辆表单-->
        <div id="mc_box">
          <div class="form-group">
            <label class="col-sm-2 control-label"><i class="text-danger">*</i> 车辆接收员</label>
            <div class="col-sm-2">
              <input type="text" class="form-control" readonly value="接收员" >
            </div>
            <label class="col-sm-2 control-label"><i class="text-danger">*</i> 出售价格</label>
            <div class="col-sm-2">
              <div class="input-group input-append" >
                <input type="text" class="form-control" autofocus 
                               onkeyup="displayUpper()"
                               onpaste="return false">
                <span class="add-on input-group-addon">元</span> </div>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label"><i class="text-danger">*</i> 售出日期</label>
            <div class="col-sm-2">
              <div class="input-group date form_date" data-date=""
                                 data-date-format="yyyy-mm-dd"
                                 data-link-field="dateJoined"
                                 data-link-format="yyyy-mm-dd">
                <input class="form-control" type="text" value="" readonly >
                <span class="input-group-addon"><span
                                        class="glyphicon glyphicon-calendar"></span></span> </div>
              <input type="text" hidden="hidden" id="date_tc" name="date_sc" />
            </div>
            <label class="col-sm-2 control-label"><i class="text-danger">*</i> 出库日期</label>
            <div class="col-sm-2">
              <div class="input-group date form_date" data-date=""
                                 data-date-format="yyyy-mm-dd"
                                 data-link-field="dateJoined"
                                 data-link-format="yyyy-mm-dd">
                <input class="form-control" type="text" value="" readonly >
                <span class="input-group-addon"><span
                                        class="glyphicon glyphicon-calendar"></span></span> </div>
              <input type="text" hidden="hidden" id="date_tc" name="date_ck2" />
            </div>
          </div>
        </div>
      </form>
    </div>
  </div>
  <div class="op_box">
    <h4>坏账处理</h4>
    <div class="op_box_con clearfix">
      <table class="no-boreder-table">
        <tr>
          <th>车辆品牌</th>
          <th>车辆型号</th>
          <th>车牌号</th>
          <th>发动机号</th>
          <th>拖车状态</th>
          <th>罚息总额</th>
          <th>其他费用</th>
          <th>摄像头总额</th>
          <th>本息总额</th>
          <th>欠账总额</th>
        </tr>
        <tr>
          <td>大众</td>
          <td>Passat 2008款 R36 旅行版</td>
          <td>辽B 8888</td>
          <td>Passat 123456</td>
          <td>不能拖车</td>
          <td>2000.00</td>
          <td>300.00</td>
          <td>500.00</td>
          <td>12000.00</td>
          <td>6800.00</td>
        </tr>
      </table>
      <form class="form-horizontal" style="margin-top:20px;">
        <div class="form-group">
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 坏账处理备注</label>
          <div class="col-sm-8">
            <textarea cols="168" rows="2" class="form-control" 
                                  ></textarea>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
<div class="modal-footer">
  <p class="col-sm-2"> <a  href = "javascript:void(0)" onclick = "colsediv(0)" class="btn btn-default btn-block">关闭</a> </p>
  <p class="col-sm-2"> <a  href = "javascript:void(0)" onclick = "colsediv(0)" class="btn btn-danger btn-block">提交处理</a> </p>
</div>

<script src="../js/jquery.min.js" ></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/lightbox-plus-jquery.min.js"></script>
<script src="../js/common.js"></script>
<script src="../js/uploadPreview.js" type="text/javascript"></script>
<script>
  $("#car_more").click(function () {
				$(".nav-tabs").find("li").removeClass('active');
				$("#car_tab").addClass('active');
				location.hash = 'header';
            });
			
			
	/*$(document).ready(function(e) {
		
    (".bs-docs-popover").popover();
});*/



</script> 
</html>


