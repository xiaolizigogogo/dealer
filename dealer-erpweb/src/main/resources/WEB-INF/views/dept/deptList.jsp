<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=edge; chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Cache-Control" content="no-transform">
    <title>e车贷管理系统—分公司部门列表</title>
    <%@include file="../common/taglibs.jsp" %>
    <script src="${basePath}/js/bootstrap-datetimepicker.min.js"></script>
    <script src="${basePath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="${basePath}/js/datetimepicker.js"></script>
    <script src="${basePath}/js/tableutils.js"></script>
</head>
<script>
    $(document).ready(function () {
        $.get("${basePath}/admin/company/queryCompanyList.html", function (result) {
            var html = '';
            $(result).each(function (i) {
                html += '<option value="' + result[i].id + '">' + result[i].name + '</option>';
            });
            $("#companyId").append(html);
        });
    })
</script>
<body>
<input type="hidden" id="sign">
<div class="tools_bar col-lg-12">
  <form class="form-inline" role="form">
  	<input type="text" id="userId" name="userId" value="${map.userId}"
                           hidden="hidden">
    <div class="form-group">
      <label class="sr-only" for="txt_name">选择所属分公司</label>
      <select class="form-control" id="companyId" name="companyId">
        <option value="0"> 选择所属分公司 </option>
        <c:forEach items="${companyList}" var="company" varStatus="VStatus">
            <option value="${company.id}">${company.name}</option>
        </c:forEach>
      </select>
    </div>
    <div class="form-group">
      <label class="sr-only" for="txt_name">部门负责人</label>
      <input type="text" class="form-control" id="nickname" name="nickname" placeholder="负责人">
    </div>
    <div class="form-group">
      <label class="sr-only" for="txt_name">联系电话</label>
      <input type="text" class="form-control" id="telephone" id="telephone" placeholder="联系电话">
    </div>
    <button type="button" onclick="select();" class="btn btn-primary btn-search"><i class="fa fa-search"></i> 搜索</button>
  </form>
  <div class="list_btn clearfix">
    <ul class="list-inline">
      <li><a class="btn btn-danger" href="/admin/dept/toAddDeptPage.html"> <i class="fa fa-plus"></i>新增部门</a></li>
    </ul>
  </div>
</div>
<div class="list_box col-sm-12">
  <table class="table table-bordered table-striped">
    <thead>
      <tr>
        <th>公司名称</th>
        <th>部门名称</th>
        <th>部门负责人</th>
        <th>部门电话</th>
        <th>创建时间</th>
        <th>创建人</th>
        <th>操作</th>
      </tr>
    </thead>
    <tbody id="record">
    </tbody>
  </table>
</div>
<div id="r-page"></div>
<div id="qs_box" class="modal modal_sml fade in">
		<div class="modal-header">
			<a type="button" href="javascript:void(0)" onclick="colsediv(0)"
				class="close"><span aria-hidden="true">&times;</span></a>
			<h4 class="modal-title" id="myModalLabel" style="font-size: 16px;">提示</h4>
		</div>
		<div class="modal-body">
			<p class="p_tip">
				<i class="fa fa-check-circle"></i> 
				<span id="alert_message">
				
				</span>
			</p>
			<div class="btn_list clearfix">
				<a class="btn btn-danger btn-sm" href="javascript:void(0)"
					onclick="colsediv(0)">取消</a>
				<a class="btn btn-default btn-sm"
					href="javascript:void(0)" onclick="colsediv(0)" id="ok_button">确定</a>
			</div>
		</div>
	</div>
<div id="fade2" class="black_overlayx"></div>
</body>
<script type="text/javascript">
    $(function () {
        var companyObj = $("#companyId");
        var nickname = $("#nickname").val();
        var telephone = $("#telephone").val();
        var companyId = companyObj .val();
        if (("" != nickname && null != nickname) || ("" != telephone && null != telephone)) {
            var param = {
                nickname : nickname,
                telephone : telephone
            };
            onloadDate(param);
        } else {
            onloadDate(null);
        }

        companyObj.live('change', function () {
            $("#sign").val("no");
            select();
        });
    });


    function onloadDate(param) {
        var writetablefn = function (data) {
            var context;
            $("#checkAll").prop("checked", false);

            context = "<tr>" +
                    "<td align='center'>" + data.company.name + "</td>" +
                    "<td align='center'>" + data.name + "</td>" +
                    "<td align='center'>" + data.user.nickname + "</td>" +
                    "<td align='center'>" + data.telephone + "</td>" +
                    "<td align='center'>" + data.createdAt + "</td>" +
                    "<td align='center'>" + data.user.realname + "</td>" +
                    "<td align='center'><a href='${basePath}/admin/dept/toAddDeptPage.html?id="+data.id+"' >编辑</a> | <a id='"+data.id+"' href='javascript:void(0)' onclick='deleteDept(this)' >删除</a></td>" +
                    "</tr>";
            return context;
        };

        pageComm("${basePath}/admin/dept/queryDeptList", param == null ? {} : param, writetablefn,
                "record", 14);
                if($("#sign").val()=="yes"){
                $("#companyId").val(null);
                $("#nickname").val(null);
                $("#telephone").val(null);
                }else{
                $("#sign").val("yes");
                }
    }

    var param = function () {
        return {
            "companyId": $("#companyId").val(),
            "nickname" : $("#nickname").val(),
            "telephone": $("#telephone").val()

        };
    };

    function select() {
        onloadDate(param());
    }

	
	function doDeleteDept(oid){
		$.ajax({
                type: 'POST',
                url: '${basePath}/admin/dept/deleteDept.html?ids=' + oid,
                dataType: "text",
                success: function (data) {
                    if (data == '0000') {
                        colsediv(0);
                    	layer.msg("操作成功！");
                        document.location.reload();
                    } else {
                        colsediv(0);
                        layer.msg("操作失败！");
                        document.location.reload();
                        return false;
                    }
                },
            error: function () {
                colsediv(0);
                    alayer.msg("网络错误！");
                    document.location.reload();
                    return false;
                }
            });
	}
	
    function deleteDept(obj) {
    	var oid = $(obj).attr("id");
		alertMessage("你确定删除此数据吗？","doDeleteDept("+oid+")");
    }
    
    function deleteDeptSuccess(){
    	colsediv(0);
    	onloadDate(param());
    }
</script>
</html>
