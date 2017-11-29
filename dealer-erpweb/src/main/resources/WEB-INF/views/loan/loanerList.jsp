<%@page import="com.itextpdf.text.log.SysoLogger"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
	String latent = request.getParameter("latent");
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=edge; chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Cache-Control" content="no-transform">
    <title>e车贷管理系统—借款人列表</title>
    <%@include file="../common/taglibs.jsp" %>
    <link rel="stylesheet" href="${basePath}/css/bootstrap-datetimepicker.min.css">
    <script src="${basePath}/js/bootstrap-datetimepicker.min.js"></script>
    <script src="${basePath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="${basePath}/js/datetimepicker.js"></script>
    <script src="${basePath}/js/tableutils.js"></script>
    <script src="${basePath}/js/Map.js"></script>
    <style>
    .table > tbody > tr > td.tr_back,.table-striped > tbody > tr:nth-child(odd) > td.tr_back, .table-striped > tbody > tr:nth-child(odd) > th.tr_back{background-color:#FCF8E3; !important;}
	</style>
</head>
<body>
<input type="hidden" id="customer_id_hidden" />
<input type="hidden" value="" id="edit_customer_id"/>
<input type="hidden" value="<%=latent %>" id="latent" />
<div class="tools_bar col-lg-12">
  <form class="form-inline" role="form">
    <div class="form-group">
      <label class="sr-only" for="txt_name">客户姓名</label>
      <input type="text" class="form-control" id="name" name="name" placeholder="请输入客户姓名">
    </div>
    <div class="form-group">
      <label class="sr-only" for="txt_number">证件号码</label>
      <input type="text" class="form-control" id="idCardNum" name="idCard" placeholder="请输入证件号码">
    </div>
    <div class="form-group">
      <label class="sr-only" for="txt_tel">联系电话</label>
      <input type="text" class="form-control" id="mobileNum" name="mobile" placeholder="请输入联系电话">
    </div>
    <div class="form-group">
      <select class="form-control" id="customer_source" name="customer_source">
        <option value="">客户来源</option>
        <option value="0">线下</option>
        <option value="1">分销</option>
      </select>
    </div>
    <button type="button"  onclick="select()" id="selectBtn" class="btn btn-danger "><i class="fa fa-search"></i> 搜索</button>
  </form>
  <div class="list_btn clearfix">
    <ul class="list-inline">
      <li id="addNewButton"><a class="btn btn-danger" href="${basePath}/admin/customer/goAddLoanerInfo.html"> <i class="fa fa-plus"></i>新增客户</a></li>
      <li><a class="btn btn-danger" onclick="editCustomer(this);" href="javascript:void(0);"><i class="fa fa-pencil-square-o"></i>编辑</a></li>
      <li id="importantButton"><a class="btn btn-danger"  onclick="addToBlackList('toImportant');"><i class="fa fa-star"></i>设为重点</a></li>
      <li id="blackButton"><a class="btn btn-danger" onclick="addToBlackList('toBlack');"><i class="fa fa-trash-o"></i>加入黑名单</a></li>
      <li id="recoverButton" style="display:none;"><a class="btn btn-danger" onclick="addToBlackList('recoverBlack');"><i class="fa fa-trash-o"></i>恢复黑名单</a></li>
    </ul>
  </div>
</div>
<div class="list_box col-sm-12">
  <table class="table table-bordered table-striped">
    <thead>
      <tr>
        <th>客户姓名</th>
        <th>身份证</th>
        <th>联系电话</th>
        <th>客户来源</th>
          <th>客户录入日期</th>
      </tr>
    </thead>
    <tbody id="record"></tbody>
  </table>
</div>
<div id="r-page"></div>
<div id="custom_modal" class="modal fade in">
</div>
<div id="order_modal" class="modal fade in"></div>
<div id="fade2" class="black_overlayx"> </div>
<div id="hmd_box" class="modal modal_sml fade in">
		<div class="modal-header">
			<a type="button" href="javascript:void(0)" onclick="colsediv(0)"
				class="close"><span aria-hidden="true">&times;</span></a>
			<h4 class="modal-title" id="myModalLabel" style="font-size: 16px;">提示</h4>
		</div>
		<div class="modal-body" id="qs_box">
			<p class="p_tip">
				<i class="fa fa-question-circle"></i> <span id="alert_span"></span>
			</p>
			<div class="btn_list clearfix" id="selector">
				<a class="btn btn-danger btn-sm" href="javascript:void(0);" id="confirm_a"
					onclick="colsediv(0)">确认</a><a class="btn btn-default btn-sm"
					href="javascript:void(0)" onclick="colsediv(0)">取消</a>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	var map = new Map();
    $(function () {
        init();
        <!-- BUG 020 begin -->
        if($("#latent").val() == 2){
        	$("#blackButton").hide();
        }
        if($("#latent").val() == 2){
        	$("#importantButton").hide();
        }
        if($("#latent").val() == 2||$("#latent").val() == 1){
        	$("#addNewButton").hide();
        }
        if($("#latent").val() == 2){
        	$("#recoverButton").show();
        }
        <!-- BUG 020 end -->
    });

    function init() {
        var mobile = $("#mobileNum").val();
        var name = $("#name").val();
        var idCard = $("#idCardNum").val();
        var customer_source = $("#customer_source").val();
        var latent = $("#latent").val();
        if (("" != mobile && null != mobile) || ("" != name && null != name)
        		|| ("" != idCard && null != idCard) || ("" != customer_source && null != customer_source)
        		|| ("" != latent && null != latent)) {
            var param = {
                mobile: mobile,
                name: name,
                idCard : idCard,
                customer_source : customer_source,
                latent : latent
            };
            onLoadDate(param);
        } else {
            onLoadDate(null);
        }
    }

    function onLoadDate(param) {
        var writetablefn = function (data) {
            var context;
            $("#checkAll").prop("checked", false);
            var sexStr = "-----";    //性别
            if (data.sex == "M") {
                sexStr = "男";
            } else {
                sexStr = "女";
            }

            var applyUrl;
            var status = "----";
            if (data.registerStatus == "new") {
                status = "待完善";
                applyUrl = "javascript:error();"
            } else {
                status = "完成";
                applyUrl = "${basePath}/admin/loan/goLoanApplyPage.html?customerId=" + data.uuid;
            }

            var editUrl = "${basePath}/admin/customer/queryCustomer.html?uuid=" + data.uuid;

            var detailUrl = "${basePath}/admin/customer/queryCustomerDetail.html?uuid=" + data.uuid;
            
            var customer_source;
            if(data.openId == null || "" == data.openId){
            	customer_source = "线下"
            }else{
            	customer_source = "分销"
            }

	        var loanDetails = {};
	        loanDetails.customerId = data.uuid;

	        var isImportant = "";
            var state="no";
            if(data.isImportant == "1"){
            	isImportant = "<i class='fa fa-star text-danger'></i>&nbsp;&nbsp;";
            	state="yes";
            }
             context = "<tr onclick='setEditCustomer(this)' id="+data.uuid+":"+state+">" +
                    "<td align='center'>"
                    + isImportant
                    + "<a id="+data.uuid
					+ " onclick='getlenderdetails(this)' href='javascript:void(0);'>"
					+ data.customerName + "</a>"+"</td>"
                     + "<td align='center'>" + data.idCard + "</td>"
                     + "<td align='center'>" + data.mobile + "</td>"
                     + "<td align='center'>" + customer_source + "</td>"
                     +"<td align='center'>" + data.createdAt + "</td>"
                     +"</tr>";
	        map.put(data.uuid.toString(),loanDetails);
            return context;
        };

        pageComm("${basePath}/admin/customer/myCustomerPageList", param == null ? {} : param, writetablefn, "record", 14);
    }

    function error() {
        layer.msg('请先完善信息再进行借款申请!')
    }

    var param = function () {
        return {
            "mobile": $("#mobileNum").val(),
            "name": $("#name").val(),
            "idCard" : $("#idCardNum").val(),
            "customer_source" : $("#customer_source").val(),
            "latent" : $("#latent").val()
        };
    };

    function select() {
        onLoadDate(param());
    }
    
    function select1() {
        onLoadDate(param());
        colsediv(0);
    }

    function reset() {
        $("#mobileNum").val("");
        $("#name").val("");
    }

    function editUserInfo() {
        var checkbox = $('input[name="checkbox1"]:checked');
        var checkValue = checkbox.val();
        var checkLength = checkbox.length;
        if (checkValue == null || checkLength != 1) {
            layer.msg("请选择一行数据进行编辑！");
            return;
        }
        window.location.href = "${basePath}/admin/customer/queryCustomer.html?uuid=" + checkValue;
    }

    function deleteUserInfo() {
        var checkbox = $('input[name="checkbox1"]:checked');
        var checkLength = checkbox.length;
        if (checkLength == 0) {
            layer.msg("请选择一行数据进行删除！");
            return;
        }
        var checkValues = [];
        var i = 0;
        checkbox.each(function () {
            checkValues[i] = this.value;
            i++;
        });
        layer.confirm("你确定删除此用户吗？", {icon: 3, title: '提示'}, function () {
            $.ajax({
                type: 'POST',
                url: '${basePath}/admin/user/delete.html?uuid=' + checkValues,
                dataType: "text",
                success: function (data) {
                    if (data == '0000') {
                        layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
                            onLoadDate(null);
                            return true;
                        });
                    } else {
                        layer.msg("操作失败!");
                        return false;
                    }
                }, error: function () {
                    layer.msg("网络错误!");
                    return false;
                }
            });
        });
    }

    /**
     * 全部选中或取消全选
     */
    function selectAll() {
        var isChecked = $("#checkAll").prop("checked");
        if (isChecked) {
            $("[name='checkbox1']").prop("checked", true);//全选
        } else {
            $("[name='checkbox1']").prop("checked", false);//取消全选
        }
    }

    /**
     * 判断子选则框是否有全部选中。如果没有则去将全选的checkbox置为false
     */
    function paramClick() {
        var boxLength = $("[name='checkbox1']").length;
        var checkLength = $("input[name='checkbox1']:checked").length;
        if (boxLength == checkLength && boxLength != 0) {
            $("#checkAll").prop("checked", true);
        } else {
            $("#checkAll").prop("checked", false);
        }
    }
    
    //编辑客户
    function editCustomer(obj){
    	if(commonToOpenDiv("edit_customer_id","yes")){
    		window.location = "/admin/customer/queryCustomer.html?uuid=" + $("#edit_customer_id").val().split(":")[0];
    	}
    }
    
    //加入黑名单
    function addToBlackList(type){
        $("#selector").show();
    	if(commonToOpenDiv("edit_customer_id","yes")){
    		if(type == "toBlack"){
    			commonSetHtml("alert_span","确认将此客户拉入黑名单么！");
    			$("#confirm_a").attr("onclick","confirmToBlackList('toBlack')");
    		}else if(type == "recoverBlack"){
    			commonSetHtml("alert_span","确认将此客户移除黑名单么！");
    			$("#confirm_a").attr("onclick","confirmToBlackList('recoverBlack')");
    		}else{
    			commonSetHtml("alert_span","确认将此客户设为重点客户么！");
    			$("#confirm_a").attr("onclick","confirmToBlackList('toImportant')");
    		}
    		opendiv('hmd_box');
    	}
    }
    
     function prompt(){
        opendiv('qs_box');
        $("#selector").hide();
        setTimeout(function() {
            colsediv(0);
            saveOrUpdateUserInfoSuccess();
        },
        1500);
    }
    
    function confirmToBlackList(type){
    	$.ajax({
    		url:"/admin/customer/addToBlackList",
    		data:"uuid=" +$("#edit_customer_id").val().split(":")[0] + "&type=" + type,
    		type:"post",
    		dataType:"text",
    		success:function(data){
    			if(data == 'success'){
    				if(type == "toBlack"){
    					$("#edit_customer_id").val(null);
    					prompt();
    					commonSetHtml("alert_span","拉黑成功！");
    				}else if(type == "recoverBlack"){
    					$("#edit_customer_id").val(null);
    					prompt();
    					commonSetHtml("alert_span","移除黑名单成功！");
    				}else{
    				    $("#edit_customer_id").val(null);
    				    prompt();
    					commonSetHtml("alert_span","设置重点成功！");
    				}
    				
    				opendiv('hmd_box');
    				$("#confirm_a").attr("onclick","select1()");
    			}
    		}
    	})
    }
    
    //弹出框公共function
    function commonToOpenDiv(oid,Blacklist){
    	var edit_customer_id =  $("#"+oid).val();
    	var repeat=$("#"+oid).val().split(":")[1];
    	if(repeat=="yes"&&"yes"!=Blacklist){
    	    commonSetHtml("alert_span","该客户已为重点请重新选择！");
    		opendiv('hmd_box');
    		return false;
    	}else if(null == edit_customer_id || "" == edit_customer_id){
    		commonSetHtml("alert_span","请先选中一个客户！");
    		opendiv('hmd_box');
    		return false;
    	}else{
    		return true;
    	}
    }
    
    
	function commonSetHtml(oid,html){
    	$("#" + oid).html(html);
    }
	
    
   	function getlenderdetails(obj){
		$("#customer_id_hidden").val($(obj).attr("id"));
		$("#order_modal").load("/admin/loan/lenderdetails.html");
		opendiv("order_modal");
	}
   function loanApplication(Obj){
		var customer_id=$(Obj).attr("id").split(":")[0];
		var latent=$(Obj).attr("id").split(":")[1];
		colsediv(0);
		window.location = "/admin/loan/goLoanApplyPage.html?customerId="+customer_id+"&latent="+latent;
		
	}
	function saveOrUpdateUserInfoSuccess(){
    	window.location.reload();
    }
</script>
</html>
