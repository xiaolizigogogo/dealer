//贷前单条处理方法，传入loanId,要修改的dom标签，重写方法
var loanBeforeSingleModifiy=function(){
	$.ajax({
		url:"/admin/loan/operateHelpBefore?loanId="+loanId,
		type:"get",
		dataType:"json",
		success:function(data){
			var obj="#"+loanId+"\\:no";
			var objUrgent ="#"+loanId+"\\:yes";
			if(data.result.success==false){
				//删除
				$(obj).remove();
			}
			else{
				if (null != $(obj).find("td").eq(2).html()){
					$(obj).find("td").eq(2).html(data.result.message);
				} else if(null != $(objUrgent).find("td").eq(2).html()){
					$(objUrgent).find("td").eq(2).html(data.result.message);
				}

	            var caozuo;
	            
	            if(data.assignee != null && data.assignee != ""){
	            	if((loanStatus == "vehicleAssess")||
							(loanStatus == "instock")){
	            		caozuo =  "<a href='/admin/todo?method=detail&taskId="+data.taskId+"'>处理</a>";
	            	}else if(loanStatus=="reuploadInformatin"){
	            		//caozuo="<a href='#' onclick='setCustomerIdHidden2(this)' id="+data.loanInfo.uuid+":"+data.loanInfo.orderid+":"+data.taskId+":"+data.activityId+":"+data.assignee+":"+data.loanInfo.loanStatus+":no  >处理</a>"
			            caozuo="<td><a href='#' onclick='setCustomerIdHidden2(this,\"yes\")' id="+data.uuid+">处理</a></td>"
	            	}
	            	else{
	            		//caozuo="<a href='#' onclick='setCustomerIdHidden(this)' id="+data.loanInfo.uuid+":"+data.loanInfo.orderid+":"+data.taskId+":"+data.activityId+":"+data.assignee+":"+data.loanInfo.loanStatus+":no  >处理</a>"
			            caozuo="<td><a href='#' onclick='setCustomerIdHidden(this,\"yes\")' id="+data.uuid+">处理</a></td>"
	            	}
				}else{
					caozuo =  "<a id="+data.taskId+" href='javascript:void(0);' onclick='claim(this)'> 签收</a>"; 
				}
				if (null != $(obj).find("td").eq(7).html()){
					$(obj).find("td").eq(7).html(caozuo);
				} else if (null != $(objUrgent).find("td").eq(7).html()){
					$(objUrgent).find("td").eq(7).html(caozuo);
				}

			}
		}
	});
}

//贷后
var loanAfterSingleModifiy=function(){
	var loanId=$("#customer_id_hidden").val();
	$.ajax({
		url:"/admin/loan/operateHelpAfter?loanId="+loanId,
		type:"get",
		dataType:"json",
		success:function(data){
			var obj="#"+loanId
			if(data.result.success==false){
				$(obj).remove();
				//删除
			}
			else{
				var overdue='';
				if(data.overdue!=null||data.overdue==1){
					overdue="<span class='label label-danger'>逾&nbsp;&nbsp;&nbsp;&nbsp;期</span>"
				}
				else{
					overdue="<span class='label label-info'>还款中</span>"
				}
				var caozuo='';
				if(data.assignee != null && data.assignee != ""){
	             		caozuo="<a href='#' onclick='setCustomerIdHidden(this,\"yes\")' id="+data.loanInfo.uuid+":"+data.loanInfo.orderid+":"+data.taskId+":"+data.businesskey+":"+data.activityId+":"+data.businesskey +"::"+data.assignee+">处理</a>"
				}else{
					caozuo =  "<a id="+data.taskId+" href='javascript:void(0);' onclick='claim(this)'>签收</a>"; 
				}
				$(obj).find("td").eq(2).html(overdue);
				$(obj).find("td").eq(3).html(data.loanStatus);
				$(obj).find("td").eq(4).html("第"+data.repayPlanDetail.repayPeriod+"期");
				$(obj).find("td").eq(5).html(data.repayPlanDetail.repayTotal);
				$(obj).find("td").eq(6).html(data.repayDate);
				$(obj).find("td").eq(9).html(caozuo);
			}
		}
	});
}

//还款
var loanRepaymentSingleModifiy=function(){
	var loanId=$("#customer_id_hidden").val();
	//var repaymentId=$("#customer_id_hidden").val().split(":")[3];

	$.ajax({
		url:"/admin/loan/operateHelpRepayment?repaymentId="+repaymentId,
		type:"get",
		dataType:"json",
		success:function(data){
			debugger;
			var obj="#"+loanId;
			var caozuo='';
			 if (data.repaymentInfo.repaymentStatus == 5||data.repaymentInfo.repaymentStatus==6||data.repaymentInfo.repaymentStatus==7||data.repaymentInfo.repaymentStatus==41) {
			        if (data.repaymentInfo.assignee == null || data.repaymentInfo.assignee == '') {
			          caozuo = "<a id="
			              + data.repaymentInfo.taskId
			              + " href='javascript:void(0);' onclick='claim(this)'>签收</a>";
			        } else {
			          caozuo = "<a href='#' onclick='setCustomerIdHidden(this,\"yes\")' id="
			              + data.repaymentInfo.uuid
			              + ":"
			              + data.repaymentInfo.contractNum
			              + ":"
			              + data.repaymentInfo.taskId
			              + ":"
			              + data.repaymentInfo.repaymentId
			              + ":"
			              + data.repaymentInfo.activityId
			              + ":"
			              + data.repaymentInfo.repaymentId
			              + "::"
			              + data.repaymentInfo.assignee + ">还款</a>"
			        }
			      } 
			      else if(data.repaymentInfo.repayStatus != null || data.repaymentInfo.repayStatus != ''){

			          caozuo=data.repaymentInfo.repayStatus;
			        
			      }
			      else
			      {
			        caozuo = "不能进行还款";
			      }
			//还款管理没有删除
			$(obj).find("td").eq(6).html(data.repaymentInfo.gmtActualRepay);
			$(obj).find("td").eq(12).html(data.repaymentInfo.actualRepaymentSum);
			$(obj).find("td").eq(13).html(caozuo);
		}
	});
}

//待办和新增
var loanWaitSingleModify=function(){
	var loanId=$("#customer_id_hidden").val();
	$.ajax({
		url:"/admin/loan/operateHelpWait?loanId="+loanId,
		type:"get",
		dataType:"json",
		success:function(data){
			var obj="#"+loanId;
			var status="#status_"+loanId;
			if(data.result.success==false){
				//删除
				$(obj).remove();
				window.location.reload();
			}
			else{
				$(status).html(data.loanStatus);
				var caozuo='';
				var loanStatus=data.loanInfo.loanStatus;
				if(data.assignee != null && data.assignee != ""){
	            	if((loanStatus == "vehicleAssess")||
					  (loanStatus == "instock")){
	            		caozuo ="<div class='tag_bom clearfix'>借款金额:<b class=\"text-danger\"> "+data.applyMoney+"</b>万"
		                        + "<a class='pull-right' href='${basePath}/admin/todo?method=detail&taskId="+data.taskId+"'>处理</a></div>";
	            	}else if(loanStatus == "departLeadAduit"){
	            		caozuo ="<div class='tag_bom clearfix'>借款金额:<b class=\"text-danger\"> "+data.applyMoney+"</b>万"
	            		        +"<a class='pull-right' href='#' onclick='loanAdministration(this)' id="+data.uuid+":"+data.orderid+":"+data.taskId+":"+data.activityId+":"+data.businesskey+"::no:"+data.activityId+":"+data.loanInfo.loanStatus+" >处理</a></div>"
	            	}else if(loanStatus == "trialPhase"){
	            		caozuo ="<div class='tag_bom clearfix'>借款金额:<b class=\"text-danger\"> "+data.applyMoney+"</b>万"
		                        +"<a class='pull-right' href='#' onclick='loanAdministration(this)' id="+data.uuid+":"+data.orderid+":"+data.taskId+":"+data.activityId+":"+data.businesskey+"::no:"+data.activityId+":"+data.loanInfo.loanStatus+" >处理</a></div>"
	            	}else if(loanStatus == "callBack"){
	            		caozuo ="<div class='tag_bom clearfix'>借款金额:<b class=\"text-danger\"> "+data.applyMoney+"</b>万"
	            		        +"<a class='pull-right' href='#' onclick='loanAdministration(this)' id="+data.uuid+":"+data.orderid+":"+data.taskId+":"+data.activityId+":"+data.businesskey+"::no:"+data.activityId+":"+data.loanInfo.loanStatus+" >处理</a></div>" 
	            	}else if(loanStatus == "visiteCheck"){
	            		caozuo ="<div class='tag_bom clearfix'>借款金额:<b class=\"text-danger\"> "+data.applyMoney+"</b>万"
		                        +"<a class='pull-right' href='#' onclick='loanAdministration(this)' id="+data.uuid+":"+data.orderid+":"+data.taskId+":"+data.activityId+":"+data.businesskey+"::no:"+data.activityId+":"+data.loanInfo.loanStatus+" >处理</a></div>"
	            	}else if(loanStatus == "judgment"){
	            		caozuo ="<div class='tag_bom clearfix'>借款金额:<b class=\"text-danger\"> "+data.applyMoney+"</b>万"
		                        +"<a class='pull-right' href='#' onclick='loanAdministration(this)' id="+data.uuid+":"+data.orderid+":"+data.taskId+":"+data.activityId+":"+data.businesskey+"::no:"+data.activityId+":"+data.loanInfo.loanStatus+" >处理</a></div>"
	            	}else if(loanStatus == "signContract"){
	            		caozuo ="<div class='tag_bom clearfix'>借款金额:<b class=\"text-danger\"> "+data.applyMoney+"</b>万"
		                        +"<a class='pull-right' href='#' onclick='loanAdministration(this)' id="+data.uuid+":"+data.orderid+":"+data.taskId+":"+data.activityId+":"+data.businesskey+"::no:"+data.activityId+":"+data.loanInfo.loanStatus+" >处理</a></div>"
	            	}else if(loanStatus == "dataReview"){
	            		caozuo ="<div class='tag_bom clearfix'>借款金额:<b class=\"text-danger\"> "+data.applyMoney+"</b>万"
		                        +"<a class='pull-right' href='#' onclick='loanAdministration(this)' id="+data.uuid+":"+data.orderid+":"+data.taskId+":"+data.activityId+":"+data.businesskey+"::no:"+data.activityId+":"+data.loanInfo.loanStatus+" >处理</a></div>"
	            	}else if(loanStatus == "reuploadInformatin"){
	            		caozuo ="<div class='tag_bom clearfix'>借款金额:<b class=\"text-danger\"> "+data.applyMoney+"</b>万"
		                        +"<a class='pull-right' href='#' onclick='loanAdministrationEdit(this)' id="+data.uuid+":"+data.orderid+":"+data.taskId+":"+data.activityId+":"+data.businesskey+"::no:"+data.activityId+":"+data.loanInfo.loanStatus+" >处理</a></div>"
	            	}else if(loanStatus == "lended"){
	            		caozuo ="<div class='tag_bom clearfix'>借款金额:<b class=\"text-danger\"> "+data.applyMoney+"</b>万"
		                        +"<a class='pull-right' href='#' onclick='loanAdministration(this)' id="+data.uuid+":"+data.orderid+":"+data.taskId+":"+data.activityId+":"+data.businesskey+"::no:"+data.activityId+":"+data.loanInfo.loanStatus+" >处理</a></div>"
	            	}else if((loanStatus == "mortgage")||
							(loanStatus == "reloanReview")||
							(loanStatus == "reloanApprove")||
							(loanStatus == "reloanE_Contract")||
							(loanStatus == "reloan_lended")||
							(loanStatus == "helploanReview")||
							(loanStatus == "helploanApprove")||
							(loanStatus == "helploanE_Contract")||
							(loanStatus == "helploan_lended"))
					{
						caozuo ="<div class='tag_bom clearfix'>借款金额:<b class=\"text-danger\"> "+data.applyMoney+"</b>万"
								+"<a class='pull-right' href='#' onclick='loanAdministration(this)' id="+data.uuid+":"+data.orderid+":"+data.taskId+":"+data.activityId+":"+data.businesskey+"::no:"+data.activityId+":"+data.loanInfo.loanStatus+" >处理</a></div>"
					}
					else{
	            		caozuo ="<div class='tag_bom clearfix'>借款金额:<b class=\"text-danger\"> "+data.applyMoney+"</b>万"
	                        + "<a class='pull-right' href='#' onclick='setCustomerIdHidden(this,\"yes\")' id="+data.uuid+":"+data.orderid+":"+data.taskId+":"+data.businesskey+":"+data.activityId+":"+data.businesskey +"::"+data.assignee+" >处理</a></div>";
	            	}
				}else{
					caozuo ="<div class='tag_bom clearfix'>借款金额:<b class=\"text-danger\">"+data.applyMoney+"</b>万"
                        + "<a class='pull-right' id="+data.taskId+" href='javascript:void(0);' onclick='claim(this)'>签收</a> </div>";
// 					caozuo =  "<a id="+data.taskId+" href='javascript:void(0);' onclick='claim(this)'>签收</a>"; 
				}
				$(obj).find("div").eq(1).remove();
				$(obj).find("li:last").append(caozuo);
			}
		}
	});
}

//贷前处理弹窗即loanerDetail2
var loanBeforeSingleHelper=function(){
	closePage(0);
    if(window.location.href.indexOf("category")>0){
        loanWaitSingleModify();
       }else if(window.location.href.indexOf("lendedLoanInfoList")>0){
        document.location.href = '/admin/loan/lendedLoanInfoList.html';
       }else{
    	  loanBeforeSingleModifiy();
       }
}

//贷后处理弹窗loanerDetail30
var loanAfterSingleHelper=function(){
	closePage(0);
    if(window.location.href.indexOf("category")>0){
    	loanWaitSingleModify();
	 }else if(window.location.href.indexOf("repaymentList") > 0) {
		 loanRepaymentSingleModifiy();
	}else{
		loanAfterSingleModifiy();
	}
}