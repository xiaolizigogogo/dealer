<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>工作平台</title>
<link href="${basePath}/css/bootstrap/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${basePath}/css/font-awesome.min93e3.css"/>
<link rel="stylesheet" type="text/css" href="${basePath}/css/common.css"/>
<link rel="stylesheet" href="${basePath}/js/layer/skin/layer.css" />
<link rel="stylesheet" href="${basePath}/css/viewer/viewer.css">
<script src="${basePath}/js/jquery.min.js" ></script>
<style>
dd p{ padding-top:7px;}

.file_new {
  border: dotted 1px #ccc;
  width: 120px;
  height: 190px;
  text-align: center;
  display: table-cell;
  background: #fff url(../img/img_bg.png) no-repeat center center;

  vertical-align: middle;
  position: relative;
}

.file_new .tools {
  position: absolute;
  color: #fff;
  top: 135px;
  height: 54px;
  width: 120px;
  margin-left: -1px;
  background: #999;
  z-index: 100;
}

.file_new img {
  max-width: 118px;
  max-height: 158px;
}

.file_new .tools a {
  color: #fff;
  padding: 0px 5px;
  font-size: 9pt;
  text-decoration: none;
  display: table-cell;
  height: 54px;
  width: 120px;
  vertical-align: middle;
  text-align: center;
}

</style>
</head>
<body>
<div class="layui-layer-title" style="cursor: move;" move="ok" id="title"><h4></h4></div>
<div style="background:#eee;" >
  <div class="from_box">
    <div class=" clearfix">
      <h3 class="pull-left">基本信息</h3>
    </div>
    <div id="basic"  class="from_con clearfix">
    
  	</div>
  	</div>
  <div class="from_box" >
    <div class="from_tit clearfix">
      <h3> 附件信息 </h3>
    </div>
    <div class="img_list" id="attachment">
      <div class="clearfix" >
      <h3 class="pull-left" style="font-size: 14px;margin: 0;font-weight: bold;padding-bottom: 12px;"> 车商基础资料 </h3>
      </div>
        <ul class="list-inline" >
        
        </ul>
      <div class=" clearfix">
      <h3 class="pull-left" style="font-size: 14px;margin: 0;font-weight: bold;padding-bottom: 12px;"> 车商财务和银行资料 </h3>
      </div>
        <ul class="list-inline" >

        </ul>
      <div class=" clearfix">
      <h3 class="pull-left" style="font-size: 14px;margin: 0;font-weight: bold;padding-bottom: 12px;"> 车商业务材料 </h3>
      </div>
        <ul class="list-inline" >

        </ul>
    </div>
  </div>
    <div class="from_box" >
    <div class="from_tit clearfix">
      <h3 class="pull-left"> 合同信息 </h3>
    </div>
    <div class="img_list" id="contract">
      <ul class="list-inline" >
      
      </ul>
    </div>
  </div>
  <form class="form-horizontal" id="evaluateForm" >
  <div class="from_box">
    <div class="from_tit clearfix">
      <h3>线下人员分配</h3>
    </div>
    <div id="assign" class="from_con clearfix"></div>
    <div id="distpicker" class="from_con clearfix">
      <dl class="dl-horizontal col-sm-8">
        <dt><i class="text-danger">*</i> 服务区域</dt>
        <dd><select  class="form-control col-sm-4" name="province" style="width:240px; margin-right:10px;"></select>
          <select  class="form-control col-sm-4" name="city" style="width:240px; margin-right:10px;"></select>
          <select  class="form-control col-sm-4" name="district" style="width:240px; margin-right:10px;"></select>
        </dd>
      </dl>

      <dl class="dl-horizontal col-sm-3">
        <dt><i class="text-danger">*</i>  线下分配人员</dt>
        <dd>      <select  class="form-control" name="userid" ><option value="" selected>---- 请选择人员 ---- </option></select>
        </dd>
      </dl>

    </div>
  </div>
  <%--
  <div class="from_box table_from_box" >
    <div class="from_tit clearfix">
      <h3 class="pull-left"> 银行卡信息 </h3>
       <!-- <span class="text-danger" style="margin-left:10px;"><i class="fa fa-check-circle"></i> 已绑定</span> -->
       </div>
    <div class="from_con clearfix" id="bankcard">
    </div>
  </div>--%>
  <%--<div class="from_box table_from_box">
    <div class="from_tit clearfix">
      <h3 class="pull-left"> 风控评估 </h3>
    </div>
    <div class="from_con clearfix">
      <dl class="dl-horizontal col-sm-4">
        <dt><i class="text-danger">*</i> 商家规模</dt>
        <dd>
          <select class="form-control" name="scale" >
            <option>大型</option>
            <option>中型</option>
            <option>小型</option>
          </select>
        </dd>
      </dl>
      <dl class="dl-horizontal col-sm-4">
        <dt><i class="text-danger">*</i>&nbsp;是否通过</dt>
        <dd>
          <select class="form-control pull-left"  name="reviewstatus">
            <option value="1">是 </option>
            <option value="0">否</option>
          </select>
        </dd>
      </dl>
    </div>
    <div class="from_con clearfix">
      <dl class="dl-horizontal col-sm-4">
        <dt><i class="text-danger">*</i> 额度比例</dt>
        <dd>
          <div class="input_group" style="max-width:120px">
            <input maxlength="8" style="width:100%;" name="limitpercentage"  class="form-control valid" value="60" type="text" >
            <span class="danwei">%</span> </div>
        </dd>
      </dl>
      <dl class="dl-horizontal col-sm-4">
        <dt><i class="text-danger">*</i>&nbsp;月利率</dt>
        <dd>
          <div class="input_group" style="max-width:120px">
            <input  maxlength="8" style="width:100%;" name="monthlyinterest" class="form-control valid" value="0.68" type="text">
            <span class="danwei">%</span> </div>
        </dd>
      </dl>
      <dl class="dl-horizontal col-sm-4">
        <dt><i class="text-danger">*</i>&nbsp;备注</dt>
        <dd>
          <input type="text" name="remark"  class="form-control" />
        </dd>
      </dl>
    </div>
  </div>--%>
  <input type="hidden" value="" name="id"/>
  <input type="hidden" value="" name="taskid"/>
  <input type="hidden" value="" name="taskname"/>
 	<div class="op_box" id="div_headquarters_audit">
		<div class="op_box_con clearfix">
			<form class="form-horizontal" id="form_first_trial">
				<div class="form-group">
					<label class="col-sm-2 control-label"><i class="text-danger">*</i> 审评结论</label>
					<div class="col-sm-8">
						<label class="radio-inline">
							<input type="radio" name="status" id="inlineRadio1" value="pass" checked="checked">
							<span>通过</span> </label>
						<label class="radio-inline">
							<input type="radio" name="status" id="inlineRadio2" value="nopass">
							<span>不通过</span> </label>
					</div>
				</div>
				<div class="form-group">
					<label  class="col-sm-2 control-label"><i class="text-danger">*</i> 意见</label>
					<div class="col-sm-8">
            <textarea cols="168" rows="2" class="form-control" id="approval_first_trial"
                      name="approvalConclusion"></textarea>
					</div>
				</div>
				    <p class="col-sm-2"><button type="button" onclick="colsediv(0);" class="btn btn-default btn-block">取消</button></p>
    <p class="col-sm-2"><button type="submit" class="btn btn-danger btn-block" >分配完毕</button></p>
			</form>
		</div>
	</div>
  </form>
</div>
<!-- <div class="modal-footer">
  <p class="col-sm-2"> <a  href = "javascript:void(0)" onclick = "colsediv(0)" class="btn btn-default btn-block">关闭</a> </p>
  <p class="col-sm-2 "> <a  href="../order/add.html" onclick = "colsediv(0)" class="btn btn-danger btn-block">审核提交</a> </p>
  </div> -->
</body>
<script src="${basePath}/js/common.js"></script>
<script src="${basePath}/js/jquery.js"></script>
<script src="${basePath}/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${basePath}/js/layer/layer.js"></script>
<script src="${basePath}/js/tableutils.js"></script>
<script src="${basePath}/js/jquery.validate.js"></script>
<script src="${basePath}/js/distpicker/distpicker.data.js"></script>
<script src="${basePath}/js/distpicker/distpicker.js"></script>
<script src="${basePath}/js/carDealerApply.js"></script>
<script src="${basePath}/js/viewer/viewer.js"></script>
<script>
$(function(){
	init();
})
//页面初始化
function init(){

    $("#distpicker").distpicker({
      province: "---- 请选择省 ----",
      city: "---- 请选择市 ----",
      district: "---- 请选择区 ----",
      autoSelect: false
    });
	//隐藏域赋值
	 $("[name='id']").val($("#applyId").val());
     $("[name='taskid']").val($("#taskId").val());
     $("[name='taskname']").val($("#taskName").val());
	//获取经销商的所有信息
	$.ajax({
		  type: 'post',
		  url: "${basePath}/admin/merchant/merchantInfo",
		  data: {"accountId":$("#accountId").val()},
		  dataType: "json",
      async:false,
		  success: function(data){
			 merchantinfo(data);
		  },error:function(){
			  layer.msg(" 系统错误！");
			  }
		  });
}
//审核提交处理
$("#evaluateForm").validate({
		errorLaberContainer:"evaluateError",
		errorElement:"span",
		rules:{
			
        },
		messages:{
		 
		},
		submitHandler:function(form){
			layer.confirm("是否确认提交?", {icon: 3, title: '提示'}, function () {
			debugger;
			if($("input[name='status']:checked").val()=="pass"){
				if($("select[name='userid']").val()==null||$("select[name='userid']").val()==''){
					layer.msg("请分配线下人员");
					return false;
				}
			}
			$.ajax({
				type:'post',
				url:"${basePath}/admin/merchant/distributionUser",
				data: $("#evaluateForm").serializeArray(),
				dataType:"json",
				beforeSend: function () {
					load = layer.load();
					
	            },
	            success:function(data){
                  debugger;
	            	if(data.msg){
	            		layer.close(load);
                        init();
	            		//closediv()
                        $("#merchant_modal").css("display","none");
			            window.history.go(0);
	            	}
	            },error:function(){
                    layer.close(load);
	            	layer.msg("系统错误！");
	            }     
		});
			})
	}
});

function  merchantinfo(data){
  debugger;
	//绑定最上边的标题
	$("#title").children("h4").html(data.customerInfo[0].merchantName);
   //绑定车商位置信息
   $("#assign").html("<dl class='dl-horizontal col-sm-12'><dt><p>车商位置信息</p></dt> <dd><p>"+data.customerInfo[0].merchantAddress+" </p></dd> </dl>");
	//经销商基本信息
	var merchantHtml="";
	//联系人信息
	var contactHtml="";
    //附件信息-车商基础资料
    var attachmentHtml_car="";
    //附件信息-车商财务和银行资料
    var attachmentHtml_car_bank="";
    //附件信息-车商业务材料
    var attachmentHtml_car_business="";
	//合同信息
	var contractHtml="";
	//银行卡信息
	var bankcardHtml="";

	for(var obj in merchantList){
		merchantHtml += merchant(obj,data.customerInfo[0][obj]);
	}
 	for(var obj in contactList){
 		contactHtml+=contact(obj,data.customerInfo[0].roleInfo);
	}
    for(var obj in data.customerMerPic){
        attachmentHtml_car+=attchmentAndcontract_new(data.customerMerPic[obj],'1');
    }
    for(var obj in data.customerMerPic){
        attachmentHtml_car_bank+=attchmentAndcontract_new(data.customerMerPic[obj],'2');
    }
    for(var obj in data.customerMerPic){
        attachmentHtml_car_business+=attchmentAndcontract_new(data.customerMerPic[obj],'3');
    }

 	for(var obj in data.customerContract){
 		contractHtml+=attchmentAndcontract(data.customerContract[obj]);
 	}
 	for(var obj in bankcardList){
 		bankcardHtml+=bankcard(obj,data.customerBankInfo);
 	}
	//基本信息
	$("#basic").html(merchantHtml+contactHtml);
    //附件信息-车商基础资料
    $("#attachment").children("ul:eq(0)").html(attachmentHtml_car);
    //附件信息-车商财务和银行资料
    $("#attachment").children("ul:eq(1)").html(attachmentHtml_car_bank);
    //附件信息-车商业务材料
    $("#attachment").children("ul:eq(2)").html(attachmentHtml_car_business);
	//合同信息
	$("#contract").children("ul").html(contractHtml);
	//银行卡信息
	$("#bankcard").html(bankcardHtml);
	CarDealerLoan.convertPdfUrl();

}
//经销商信息
var merchantList={"merchantName":" 经销商名称","licenseNumber":"营业执照号","organizationCode":"组织机构代码",
							 "address":"公司地址","introduce":"车行介绍","carport":"车位个数","repertory":"库存量","scale":"车商规模"};						 
 //联系人信息(1.法人代表 2：实际控股人 3：业务联络人 4：金融保险经理 5：财务经理)
var contactList={"1":"法人代表","2":"实际控股人","3":"业务联络人","4":"金融保险经理","5":"财务经理"}; 
 //银行卡信息(1:放款银行卡 2:还款银行卡)
var bankcardList={"1":"放款银行卡卡号-开户行-开户名","2":"还款银行卡卡号-开户行-开户名"};
						  
function merchant(param1,param2){
    var html = "<div class='col-sm-4'>"
    	+"<dl class='dl-horizontal'>"
    	+ "<dt>"+merchantList[param1]+"</dt>"
    	+" <dd><p>"+param2+"</p></dd>"
    	+"</dl></div>";
    return html; 
}
 function contact(param1,param2){
	 var html="";
	 for(var i=0;i<param2.length;i++){
		 if(param1==param2[i].roleName){
			    html += "<div class='col-sm-4'>"
			        +"<dl class='dl-horizontal'>"
			        + "<dt>"+contactList[param1]+"</dt>"
			        +" <dd><p>"+param2[i].personName+"<i class='fa fa-phone-square text-danger' style='padding-left:10px;' >&nbsp;&nbsp;"+param2[i].phoneNumber+"</i>"
			        +"</p></dd>"
			        +"</dl></div>";
			        break;
		 }
	 }
        return html; 
} 
 //附件信息和合同信息和到场证明页面属性一致，统一定义到一个function里边
function attchmentAndcontract(param){
    var html="";
    if(param.fileName!="12" && param.fileName!="13" && param.fileName!="14"){
      html+="<li>"
              + "<div class='file_img'>"
              + "<p class='tools'><a href='javascript:void(0);' onclick='pictureDownload(7701)' title='保存'><i class='fa  fa-save'></i></a></p>"
              + "<img data-original="+param.fileUrl+" src="+param.fileUrl+" alt="+param.fileName+" ></div>"
              + "<h4>"+param.fileName+"</h4>"
              + "</li>"
    }
    return html;
}

var attachmentHtml_car_array=["公司简介",
    "营业执照复印件",
    "组织机构代码证复印件",
    "税负登记证复印件",
    "验资报告复印件",
    "法人及配偶身份证",
    "股东身份证",
    "实际控制人信用报告",
    "公司章程及修正案复印件",
    "企业信用报告",
    "企业盈利模式",
    "各高层管理人员简介",
    "法定代表人结婚证（离婚证）",
    "法定代表人户口本",
    "法人及股东相关资产证明",
    "现有员工身份证和联系方式","税务登记证复印件"];

var attachmentHtml_car_bank_array=["近三年财务年报表",
    "近三个月财务月报和本月财报科目明细",
    "月业绩情况总汇表",
    "业务台账",
    "放款银行卡流水",
    "收款银行卡流水",
    "资产处置台账数据及该款项的回款账户及流水",
    "企业主要对公流水"];

var attachmentHtml_car_business_array=["客户案例",
    "主营业务操作流程",
    "风控管理及流程",
    "车辆评估标准",
    "业务合作方准入要求",
    "产品大纲",
    "场地租赁合同",
    "场地照片",
    "车库管理制度"];

var checkFileName = function (fileName,type) {
    var state = false;
    if(type == '1'){

        for(i = 0,len=attachmentHtml_car_array.length; i < len; i++) {
            if(fileName == attachmentHtml_car_array[i]){
                state = true;
                break;
            }
        }

    }else if (type == '2'){

        for(i = 0,len=attachmentHtml_car_bank_array.length; i < len; i++) {
            if(fileName == attachmentHtml_car_bank_array[i]){
                state = true;
                break;
            }
        }


    }else if (type == '3'){

        for(i = 0,len=attachmentHtml_car_business_array.length; i < len; i++) {
            if(fileName == attachmentHtml_car_business_array[i]){
                state = true;
                break;
            }
        }


    }

    return state;

}


//附件信息
function attchmentAndcontract_new(param,type){
    var html="";
    if(param.fileName!="12" && param.fileName!="13" && param.fileName!="14"){

        var state = checkFileName(param.fileName,type);

        if(state){

            html+="<li>"
                + "<div class='file_new'>"
                + "<p class='tools'><a href='javascript:void(0);' onclick='pictureDownload(7701)' title='保存'>"+ param.fileName+"</a></p>"
                + "<img data-original="+param.fileUrl+" src="+param.fileUrl+" alt="+param.fileName+" ></div>"
                + "</li>"

        }
    }
    return html;
}

 function bankcard(param1,param2){
	 var html="";
	 var array =bankcardList[param1].split("-");
	 for(var i=0;i<param2.length;i++){
		 if(param1==param2[i].cardstate){
	 		html+="<div class='col-sm-4'>"
    			 +"<dl class='dl-horizontal'>"
     			 +"<dt>"+array[0]+"</dt>"
     			 + "<dd><p>"+param2[i].banknumber+"</p></dd>"
     			 +"</dl></div>"
     	    	+"<div class='col-sm-4'>"
     	        +"<dl class='dl-horizontal'>"
     	        +"<dt>"+array[1]+"</dt>"
     	        +"<dd><p>"+param2[i].bankname+"</p></dd>"
     	        +"</dl></div>"
     	        +"<div class='col-sm-4'>"
     	        +"<dl class='dl-horizontal'>"
     	        +"<dt>"+array[2]+"</dt>"
     	        +"<dd><p>"+param2[i].cardholder+"</p></dd>"
     	        +"</dl></div>";
		 }
 	}
	 return html;
 }
 //选择线下分配人员选择框的处理
  $("select[name='district']").change(function () {
    //获取省
    var province = $("select[name='province']").val();
    //获取市
    var city =  $("select[name='city']").val();
    //获取区
    var district =  $("select[name='district']").val();
    $.ajax({
      type:"POST",
      url:"${basePath}/admin/merchant/offlineStaff",
      data:{"accountId":$("#accountId").val(),"province":province,"city":city,"district":district,"role":"offline"},
      dataType:"json",
      success:function (data) {
        var staffHtml="<option value='' selected>---- 请选择 ---- </option>";
        for(var i=0;i<data.staffList.length;i++){
          staffHtml += "<option value="+data.staffList[i].uuid+">"+data.staffList[i].realname+"</option>";
        }
        $("select[name='userid']").html(staffHtml);
      },error:function () {
        layer.msg("未知错误！");
      }
    })
  })
</script>
</html>