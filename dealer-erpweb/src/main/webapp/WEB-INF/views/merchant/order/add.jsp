<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>工作平台</title>
<link href="../css/bootstrap/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="../css/bootstrap/bootstrap-table.css">
<link rel="stylesheet" type="text/css" href="../css/libs/font-awesome.css"/>
<link rel="stylesheet" type="text/css" href="../css/common.css"/>

</head>

<body onResize="changeHeight()">
<div class="col-lg-12">
  <div class="tools_bar ">
  	<div class="bar_tit clearfix">
    <h2 class="pull-left">贷款申请</h2><a href="javascript:history.go(-1)" class="pull-right btn btn-link"><i class="fa fa-mail-forward"></i>   返回列表</a></div>
  </div>
  <div class="alert alert-danger alert-dismissible" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  <strong><i class="fa fa-exclamation-triangle" style="font-size:18px;"></i></strong>  您所要录入的订单客户信息还没有在客户列表中，<a href="../custom/add.html" class="btn btn-sm btn-danger">现在去添加</a>
</div>
  <div class="from_box">
    <div class="from_tit clearfix">
      <h3 class="pull-left">基本信息</h3>
    </div>
    <table class="table table-striped">
      <tr>
      <th><i class="text-danger">*</i> 身份证号</th>
        <td><input type="text" value="" class="form-control for"  placeholder="根据身份证号自动搜索"  /></td>
        <th><i class="text-danger">*</i> 借款人</th>
        <td><input type="text" value="" class="form-control"disabled/></td>
        
        <th>借款金额</th>
        <td><div class="input-group input-append bootstrap-timepicker" style="width:120px">
            <input type="text" class="form-control" id="timepicker" style="width:100%;">
            <span class="add-on input-group-addon">万元</span> </div></td>
      </tr>
      <tr>
        <th><i class="text-danger">*</i> 借款用途</th>
        <td><select class="form-control" name="loanPurpose" id="loanPurpose">
            <option value="生意周转">生意周转</option>
            <option value="采购原材料">采购原材料</option>
            <option value="房屋装修">房屋装修</option>
            <option value="发工资">发工资</option>
            <option value="支付货款">支付货款</option>
            <option value="other">其他</option>
          </select></td>
        <th><i class="text-danger">*</i> 还款来源</th>
        <td colspan="3">
         <input type="text" class="form-control" id="repaySource"></td>
      </tr>
    </table>
  </div>
  <div class="from_box">
    <div class="from_tit clearfix">
      <h3 class="pull-left">利率、期限</h3>
    </div>
    <table class="table table-striped">
      <tr>
        <th><i class="text-danger">*</i> 年利率</th>
        <td><input type="text" value="" class="form-control"/></td>
        <th><i class="text-danger">*</i> 月利率</th>
        <td><input type="text" value="" class="form-control" disabled/></td>
        <th>借款期限</th>
        <td><input type="text" value="" class="form-control"/></td>
      </tr>
    </table>
  </div>
  <div class="from_box">
    <div class="from_tit clearfix">
      <h3 class="pull-left">其他费用</h3>
    </div>
    <table class="table table-striped">
      <tr>
        <th> 管理费</th>
        <td><div class="input-group input-append bootstrap-timepicker" style="width:120px">
            <input type="text" class="form-control" style="width:100%;" value="1" disabled>
            <span class="add-on input-group-addon">%</span> </div></td>
        <th> 酒毒驾</th>
        <td><select class="form-control valid" id="drunkDrive" name="drunkDrive">
            <option value="1000">1000</option>
            <option value="2000">2000</option>
          </select></td>
        <th>保证金</th>
        <td><div class="input-group input-append bootstrap-timepicker" style="width:120px;">
            <input type="text" class="form-control" style="width:100%;" value="5" disabled>
            <span class="add-on input-group-addon">%</span> </div></td>
        <th>抵押方式</th>
        <td><select class="form-control" id="pledgeType" name="pledgeType">
            <option value="drivePledge">押证</option>
            <option value="vehiclePledge">押车</option>
          </select></td>
        <th>GPS</th>
        <td><select class="form-control" id="gpsWay" name="gpsWay">
            <option value="">请选择</option>
            <option value="gps_month_cost">按月支付租金</option>
            <option value="gps_once_cost">一次买断</option>
          </select></td>
      </tr>
    </table>
  </div>
  <div class="from_box">
    <div class="from_tit clearfix">
      <h3>还款信息</h3>
    </div>
    <table class="table table-striped">
      <tr>
        <th> 还款方式</th>
        <td><select class="form-control pull-left" id="repayWay" name="repayWay">
            <option value="AverageCapitalPlusInterest"
                                    > 等本等息 </option>
            <option value="InterestRatesBefore"
                                    > 先息后本 </option>
            <option value="flexiblerepaymentv2"
                                    > 灵活还款 </option>
            <option value="averagePrincipalreduceinterest"
                                    > 等本减息 </option>
            <option value="averagePrincipalzerointerestrent"
                                    > 等本零息 </option>
            <option value="intrestbeforePrincipalrent"
                                    > 先息后本(押证) </option>
            <option value="intrestbeforePrincipaltransfer"
                                    > 先息后本(押车) </option>
          </select>
          <a href="#" class="btn btn-success btn-search" style="margin-left:10px;" id="hkjh_btn">生成还款计划</a></td>
      </tr>
      <tr>
        <td colspan="2"><table class="table table-bordered" style="display:none;" id="hkjh_tab">
            <thead>
              <tr>
                <th>期数</th>
                <th>还款本金</th>
                <th>还款利息</th>
                <th>本息和</th>
                <th>剩余本金</th>
                <th>管理费</th>
                <th>GPS费用</th>
                <th>查档费</th>
                <th>停车费</th>
                <th>折旧费</th>
                <th>毒酒驾</th>
                <th>保证金</th>
                <th>认证费</th>
                <th>提前还款</th>
                <th>还款日期</th>
              </tr>
            </thead>
            <tbody id="repayPlayDetail">
            <td>1</td>
              <td>120</td>
              <td>5</td>
              <td>125</td>
              <td>100</td>
              <td>0.2</td>
              <td>0.1</td>
              <td>0.1</td>
              <td>0.1</td>
              <td>0.1</td>
              <td>0.2</td>
              <td>0.5</td>
              <td>500</td>
              <td>100</td>
              <td>2016-12-25</td>
                </tbody>
          </table></td>
      </tr>
    </table>
  </div>
  <div class="from_box">
    <div class="from_tit clearfix">
      <h3>账号信息</h3>
    </div>
    <table class="table table-striped">
      <tr>
        <th><i class="text-danger">*</i> 开户名</th>
        <td><input type="text" class="form-control" size="10" name="accountName"
                               id="accountName" value=""></td>
        <th><i class="text-danger">*</i> 开户行</th>
        <td><input type="text" class="form-control" id="bankName"
                               name="bankName" value=""></td>
        <th><i class="text-danger">*</i> 银行账号</th>
        <td><input type="text" class="form-control" name="accountNum"
                               onkeyup="this.value=this.value.replace(/[^\d]/g,'')"
                               onpaste="return false"
                               value=""></td>
      </tr>
    </table>
  </div>
  <div class="from_box">
    <div class="from_tit clearfix">
      <h3  class="pull-left">附件上传</h3>
      <div class="pull-right"><a class="btn btn-danger btn-xs" id="add_img"><i class="glyphicon glyphicon-plus"></i></a></div>
    </div>
    <div class="from_con clearfix" id="img_list">
    <div class="col-sm-2">
    	<p><i class="text-danger">*</i> 身份证</p>
        <a href="javascript:;" class="file">选择文件
            <input type="file" name="" id="up_img_WU_FILE_0">
            </a>
            <p class="file_img"><img id="imgShow_WU_FILE_0" ></p>
    </div>
    <div class="col-sm-2">
    	<p><i class="text-danger">*</i> 车辆行驶证</p>
        <a href="javascript:;" class="file">选择文件
            <input id="up_img_WU_FILE_1" type="file">
            </a>
            <p class="file_img"><img id="imgShow_WU_FILE_1"/></p>
    </div>
     <div class="col-sm-2">
    	<p><i class="text-danger">*</i> 机动车登记证书</p>
        <a href="javascript:;" class="file">选择文件
            <input id="up_img_WU_FILE_2" type="file">
            </a>
            <p class="file_img"><img id="imgShow_WU_FILE_2"/></p>
    </div>
      <div class="col-sm-2">
    	<p><i class="text-danger">*</i> 机动车商业保险单</p>
        <a href="javascript:;" class="file">选择文件
            <input id="up_img_WU_FILE_3" type="file">
            </a>
            <p class="file_img"><img id="imgShow_WU_FILE_3"/></p>
    </div>
     <div class="col-sm-2">
    	<p><i class="text-danger">*</i> 其他</p>
       <a href="javascript:;" class="file">选择文件
            <input id="up_img_WU_FILE_4" type="file">
            </a>
            <p class="file_img"><img id="imgShow_WU_FILE_4"  /></p></p>
    </div>
    
    
  </div>
  </div>
  <div class="from_box">
    <div class="from_tit clearfix">
      <h3>主办方</h3>
    </div>
    <table class="table table-striped">
      <tr>
        <th><i class="text-danger">*</i> 所属分公司</th>
        <td><select class="form-control" id="companyId" name="companyId">
            <option value="0">请选择</option>
          </select></td>
        <th><i class="text-danger">*</i> 所属部门</th>
        <td><select class="form-control" id="deptId" name="deptId">
            <option value="0">请选择</option>
          </select></td>
        <th><i class="text-danger">*</i> 所属客户经理</th>
        <td><select class="form-control" name="responsibleCmId" id="responsibleCmId">
            <option value="0">请选择</option>
          </select></td>
      </tr>
      <tr>
        <th><i class="text-danger">*</i> 主办意见</th>
        <td colspan="5"><textarea cols="168" rows="2" class="form-control" id="hostOpinion"
                                  name="hostOpinion"></textarea></td>
      </tr>
      <tr>
        <th>备注</th>
        <td colspan="5"><textarea cols="168" rows="2" class="form-control" id="remark"
                                  name="remark"></textarea></td>
      </tr>
    </table>
  </div>
  <div class="from_box">
    <div class="from_tit clearfix">
      <h3>联系人</h3>
    </div>
    <table class="table">
      <tr>
        <th> 配偶姓名</th>
        <td><input type="text" class="form-control" readonly
                               id="spouse_name" size="5"></td>
        <th>单位电话</th>
        <td><input type="text" class="form-control" id="spouse_tel"
                               readonly="readonly" size="10"></td>
        <th>手机号码</th>
        <td><input type="text" class="form-control" id="spouse_mobile"
                               readonly="readonly" size="14"></td>
        <th>知晓本次借款</th>
        <td><input type="checkbox" id="spouse_ck"
                            onclick="isKnowLoan('#spouse_id', '#spouse_ck')"></td>
      </tr>
      <tr>
        <th>直系亲属姓名</th>
        <td><input type="text" class="form-control" id="immediate_name1"
                               readonly="readonly" size="5"></td>
        <th>关系</th>
        <td><input type="text" class="form-control" id="immediate_relation1"
                               readonly="readonly" size="8"></td>
        <th>手机号码</th>
        <td><input type="text" class="form-control" id="immediate_Mobile1"
                               readonly="readonly" size="15"></td>
        <th>知晓本次借款</th>
        <td><input type="checkbox" id="immediate_ck1"
                              onclick="isKnowLoan('#immediate_id1', '#immediate_ck1')"></td>
      </tr>
      <tr>
        <th>直系亲属姓名</th>
        <td><input type="text" class="form-control" id="immediate_name2"
                               readonly="readonly" size="5"></td>
        <th>关系</th>
        <td><input type="text" class="form-control" id="immediate_relation2"
                               readonly="readonly" size="8"></td>
        <th>手机号码</th>
        <td><input type="text" class="form-control" id="immediate_Mobile2"
                               readonly="readonly" size="15"></td>
        <th>知晓本次借款</th>
        <td><input type="checkbox" id="immediate_ck2"
                               onclick="isKnowLoan('#immediate_id2', '#immediate_ck2')"></td>
      </tr>
      <tr>
        <th>其他联系人姓名</th>
        <td><input type="text" class="form-control" id="other_name1"
                               readonly="readonly" size="5"></td>
        <th>关系</th>
        <td><input type="text" class="form-control" id="other_relation1"
                               readonly="readonly" size="8"></td>
        <th>手机号码</th>
        <td><input type="text" class="form-control" id="other_mobile1"
                               readonly="readonly" size="15"></td>
        <th>知晓本次借款</th>
        <td><input type="checkbox" id="other_ck2" onclick="isKnowLoan('#other_id1',
                        '#other_ck2')"></td>
      </tr>
      <tr>
        <th>其他联系人姓名 </th>
        <td><input type="text" class="form-control" id="other_name2"
                               readonly="readonly" size="5"></td>
        <th>关系</th>
        <td><input type="text" class="form-control" id="other_relation2"
                               readonly="readonly" size="8"></td>
        <th>手机号码</th>
        <td><input type="text" class="form-control" id="other_mobile2"
                               readonly="readonly" size="15"></td>
        <th>知晓本次借款</th>
        <td><input type="checkbox" id="other_ck" onclick="isKnowLoan('#other_id2',
                        '#other_ck')"></td>
      </tr>
    </table>
  </div>
  <div class="row" style="padding-bottom:20px;">
  
   <div class="col-sm-2 col-sm-offset-4">
      <a class="btn btn-default btn-block" href="index.html">取消申请</a>
    </div>
    <div class="col-sm-2">
      <button type="submit" class="btn btn-danger btn-block" id="ok">提交申请</button>
    </div>
  </div>
</div>
<script src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>
<script src="../js/uploadPreview.js" type="text/javascript"></script>
<script src="../js/common.js"></script>
<script src="../js/layer/layer.js"></script>
<script>

$(document).ready(function(e) {

  changeHeight();
	  n = $("#img_list>div").length;
	
    $("#add_img").click(function(){

    $("#img_list").append('<div class="col-sm-2"><p><i class="text-danger">*</i> 其他</p><a href="javascript:;" class="file">选择文件<input id="up_img_WU_FILE_'+n+'" type="file"></a><p class="file_img"><img id="imgShow_WU_FILE_'+n+'"  /></p></p></div></div>');
	new uploadPreview({ UpBtn: "up_img_WU_FILE_"+n, ImgShow: "imgShow_WU_FILE_"+n});	
            n = n+1;
		changeHeight();	
     });

$("#hkjh_btn").click(function(){
	$("#hkjh_tab").show();
	/*var main = $(window.parent.document).find("#main_ifream贷前订单");
	
	main.height($(window.document).height());*/
changeHeight();
	});
	});
	$(window).resize(function() {
		//alert("ok");
  //changeHeight();
  //debugger;
 // var main = $(window.parent.document).find("iframe");
	//alert();
//main.height($("html").height());

});
$('#ok').click( function(){
	//alert("ok");
comfirm();
	});

function comfirm(){
		 parent.layer.confirm("您确定要执行操作吗？", {
icon: 3,
  btn: ['确定','取消'] //按钮
}, function(index){
	
 parent.layer.close(index);

});

	}
</script>

</body>
</html>
