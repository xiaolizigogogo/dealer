<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=edge; chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Cache-Control" content="no-transform">
    <title>卖钱翁金融网站后台管理-参数设置</title>
    <%@include file="../common/taglibs.jsp" %>
    <script>
        function edit(id) {
            var sysValue = $("#sysValue_"+id).val();
            window.location.href="${basePath}/admin/monitor/system/setParam/edit.htm?id="+id+"&sysValue="+sysValue;
        }
    </script>
</head>
<body>
  <div class="col-lg-12">
    <div class="tools_bar ">
      <div class="bar_tit clearfix">
		  <c:if test="${type == 'fenxiao'}">
			  <h2 class="pull-left">分销参数设置</h2>
		  </c:if>
		  <c:if test="${type == 'sys_p'}">
			  <h2 class="pull-left">系统参数设置</h2>
		  </c:if>
		  <c:if test="${type == 'msg'}">
			  <h2 class="pull-left">消息参数设置</h2>
		  </c:if>
		  <!--         <a href="index.html" class="pull-right btn btn-link"><i class="fa fa-mail-forward"></i> 返回列表</a>  -->
        </div>
    </div>

	  <c:forEach items="${paramList}" var="p">
		  <div class="form-inline set-form">
			  <div class="form-group">
				  <input type="text" hidden="hidden" value="${p.sysName}">
				  <label>${p.sysName}</label>
				  <input type="text" class="form-control"  id="sysValue_${p.id}" name="sysValue" value="${p.sysValue}" />
				  <a href="javascript:edit(${p.id});" class="btn btn-danger w100" >修改</a>
			  </div>
		  </div>
	  </c:forEach>



  </div>
</body>
</html>