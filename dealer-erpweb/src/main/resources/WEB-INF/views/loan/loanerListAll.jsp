<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible"
	content="IE=9; IE=8; IE=7; IE=edge; chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Cache-Control" content="no-transform">
<title>e车贷管理系统—借款人列表</title>
<%@include file="../common/taglibs.jsp"%>
<link rel="stylesheet"
	href="${basePath}/css/bootstrap-datetimepicker.min.css">
<script src="${basePath}/js/bootstrap-datetimepicker.min.js"></script>
<script src="${basePath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="${basePath}/js/datetimepicker.js"></script>
	<script src="${basePath}/js/tableutils.js"></script>
<style>
		.tr_back{background:#FCF8E3; !important;}
</style>
</head>
<body class="main-bg">
	<input type="hidden" value="" id="edit_customer_id" />
	<div class="tools_bar col-lg-12">
		<form class="form-inline" role="form">
			<div class="form-group">
				<label class="sr-only" for="txt_name">客户姓名</label> <input
					type="text" class="form-control" id="name" name="name"
					placeholder="请输入客户姓名">
			</div>
			<div class="form-group">
				<label class="sr-only" for="txt_number">证件号码</label> <input
					type="text" class="form-control" id="idCard" name="idCard"
					placeholder="请输入证件号码">
			</div>
			<div class="form-group">
				<label class="sr-only" for="txt_tel">联系电话</label> <input type="text"
					class="form-control" id="mobile" name="mobile"
					placeholder="请输入联系电话">
			</div>
			<div class="form-group">
				<select class="form-control" id="customer_source"
					name="customer_source">
					<option value="">客户来源</option>
					<option value="0">线下</option>
					<option value="1">分销</option>
				</select>
			</div>
			<button type="button" onclick="select()" id="selectBtn"
				class="btn btn-danger ">
				<i class="fa fa-search"></i> 搜索
			</button>
		</form>
		<div class="list_btn clearfix">
			<ul class="list-inline">
				<!-- <li><a class="btn btn-danger"   href = "javascript:void(0)"  onclick="opendiv(0)"> <i class="fa fa-plus"></i>新增</a></li>-->
				<li><a class="btn btn-danger"
					href="/admin/loan/goLoanApplyPage.html"> <i class="fa fa-plus"></i>新增客户
				</a></li>
				<li><a class="btn btn-danger" onclick="editCustomer(this);"
					href="javascript:void(0);"><i class="fa fa-pencil-square-o"></i>编辑</a></li>
				<li><a class="btn btn-danger " disabled><i
						class="fa fa-star"></i>设为重点</a></li>
				<li><a class="btn btn-danger " disabled><i
						class="fa fa-trash-o"></i>加入黑名单</a></li>
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
				</tr>
			</thead>
			<tbody id="record"></tbody>
		</table>
	</div>
	<div id="r-page"></div>
	<div id="custom_modal" class="modal fade in"></div>
	<div id="fade2" class="black_overlayx"></div>
</body>
<script type="text/javascript">
    $(function () {
        init();
    });

    function init() {
        var mobile = $("#mobile").val();
        var name = $("#name").val();
        var idCard = $("#idCard").val();
        var customer_source = $("#customer_source").val();
        if (("" != mobile && null != mobile) || ("" != name && null != name)
        		|| ("" != idCard && null != idCard) || ("" != customer_source && null != customer_source)) {
            var param = {
                mobile: mobile,
                name: name,
                idCard : idCard,
                customer_source : customer_source
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
            
            context = "<tr onclick='setEditCustomer(this)' id="+data.uuid+">" +
			            "<td align='center'><a href='" + detailUrl+ "' class = 'link-01'>"+
			            data.customerName +"</a></td>" +
			            "<td align='center'>" + data.idCard + "</td>" +
			            "<td align='center'>" + data.mobile + "</td>" +
			            "<td align='center'>" + customer_source + "</td>" +
			            "</tr>";
            return context;
        };

        pageComm("${basePath}/admin/customer/customerPageList", param == null ? {} : param, writetablefn, "record", 14);
    }

    function error() {
        layer.msg('请先完善信息再进行借款申请!')
    }

    var param = function () {
        return {
            "mobile": $("#mobile").val(),
            "name": $("#name").val(),
            "idCard" : $("#idCard").val(),
            "customer_source" : $("#customer_source").val()
        };
    };

    function select() {
        onLoadDate(param());
    }

    function reset() {
        $("#mobile").val("");
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
    
    
    function setEditCustomer(obj){
    	$("#record").find("tr").removeClass("tr_back");
    	$(obj).addClass("tr_back");
    	$("#edit_customer_id").val($(obj).attr("id"));
    }
    
    //编辑客户
    function editCustomer(obj){
    	window.location = "/admin/customer/queryCustomer.html?uuid=" + $("#edit_customer_id").val();
    }


</script>
</html>
