<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="com.utonw.utonbase.core.erpcommon.config.ParamterControl" %>
<c:set var="basePath" value="<%= request.getContextPath() %>" />
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=edge; chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Cache-Control" content="no-transform">
<title><%=ParamterControl.TITLE_DISPLAY%>金融管理系统</title>
<link href="${basePath}/css/bootstrap.min.css" rel="stylesheet">
<link href="${basePath}/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
<link href="${basePath}/css/animate.min.css" rel="stylesheet">
<link href="${basePath}/css/style.min.css?v=4.1.0" rel="stylesheet">

<!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
<style type="text/css">
.black_overlay {
	display: none;
	position: fixed;
	top: 0px;
	left: 0px;
	width: 100%;
	height: 100%;
	background-color: #303030;
	z-index: 2004;
	-moz-opacity: 0.8;
	opacity: .80;
	filter: alpha(opacity=30);
}

</style>
</head>
<body class="fixed-sidebar full-height-layout gray-bg  pace-done fixed-nav" style="overflow:hidden">
    <div id="wrapper">
        <!--左侧导航开始-->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="nav-close"><i class="fa fa-times-circle"></i>
            </div>
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                    <c:forEach var="module" items="${moduleList}">
            <c:if test="${module.moduleParentId eq null and module.moduleUrl eq null }">
                <li> 
                <a href="#">
                            <i class="fa ${module.module_icon_class}"></i>
                            <span class="nav-label">${module.moduleName}</span>
                            <span class="fa arrow"></span>
                        </a>
        <ul class="nav nav-second-level">
                        <c:forEach var="moduleinside" items="${moduleList}">
                            <c:if test="${module.moduleId eq moduleinside.moduleParentId}">
                                
                                 <li>
                                <a class="J_menuItem"   href="${moduleinside.moduleUrl}" id= "${moduleinside.module_menu_id}">${moduleinside.moduleName}</a>
                            </li>
                            </c:if>
                        </c:forEach>
        </ul>
      </li>
            </c:if>
            <c:if test="${module.moduleParentId eq null and module.moduleUrl ne null }">
                <li> 
                <a class="J_menuItem" href="${module.moduleUrl}"  id="${module.module_menu_id}"><i class="fa ${module.module_icon_class}"></i> <span class="nav-label">${module.moduleName}</span></a>
                </li>
            </c:if>
        </c:forEach>
                  
                </ul>
            </div>
        </nav>
        <!--左侧导航结束-->
        <!--右侧部分开始-->
        <div id="page-wrapper" class="gray-bg dashbard-1">
            <div class="row border-bottom">
                <nav class="navbar navbar-fixed-top" role="navigation" style="margin-bottom: 0">
                    <div class="navbar-header"><a class="navbar-minimalize " href="#"><img src="<%=ParamterControl.LOGO_DISPLAY%>" alt="车贷 金融管理系统" height="70" style=" margin:10px;"/> </a> 
                   
                     
                    </div>
                    <ul class="pull-right top">
      <li><i class="fa fa-user"></i><span id="txt"></span></li>
      <li><i class="fa fa-bullhorn"></i><a href="javascript:void(0)" onclick="openMessage(this);" id="link_notice">消息公告<span id="sumMessage" class="badge">1</span></a></li>
      <li><i class="fa fa-power-off"></i><a href="${basePath}/admin/user/loginOut.html" target="_parent">退出登录</a></li>
    </ul>
                </nav>
            </div>
            <div class="row content-tabs">
                <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i>
                </button>
                <nav class="page-tabs J_menuTabs">
                    <div class="page-tabs-content">
                        <a href="javascript:;" class="active J_menuTab" data-id="index_v1.html" id="tab_home">工作平台</a>
                    </div>
                </nav>
                <button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i>
                </button>
                <div class="btn-group roll-nav roll-right">
                    <button class="dropdown J_tabClose" data-toggle="dropdown">关闭操作<span class="caret"></span>

                    </button>
                    <ul role="menu" class="dropdown-menu dropdown-menu-right">
                        <li class="J_tabShowActive"><a>定位当前选项卡</a>
                        </li>
                        <li class="divider"></li>
                        <li class="J_tabCloseAll"><a>关闭全部选项卡</a>
                        </li>
                        <li class="J_tabCloseOther"><a>关闭其他选项卡</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="row J_mainContent" id="content-main">
                <iframe class="J_iframe" id="iframe0" name="iframe0" width="100%" height="100%" src="main.jsp" frameborder="0" data-id="index_v1.html" seamless></iframe>
            </div>
            <div class="footer">
                <div class="pull-right">&copy; 2014-2015 
                </div>
            </div>
        </div>
        <!--右侧部分结束-->
       <div id="user_modal" class="modal  fade in " style="width: 1200px; height: 800px;background: rgb(238, 238, 238);"></div>
      
    </div>
     <script src="${basePath}/js/jquery.js"></script>
    <script src="${basePath}/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="${basePath}/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="${basePath}/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="${basePath}/js/layer/layer.js"></script>
    <script src="${basePath}/js/hplus.min.js?v=4.1.0"></script>
    <script type="text/javascript" src="${basePath}/js/contabs.min.js"></script>


<script>
 $(function () {
	 $("#tab_home").click(function(){
		 $("#iframe0").attr("src","main.html");
		 
		 } );
	 
	 });

    // window.onload = function () {
    //  setIframeHeight(document.getElementById('external-frame'));
    // };
    $.ajax({
    url:"/admin/loan/queryname",
    type:"get",
    datatype:"json",
    success:function(data){
    var a="欢迎"+data.name;
    $("#txt").html(a);
	debugger;
    queryMessage(data.uuid);
    }})
	function queryMessage(userid){
		debugger;
		$.ajax({
			url:"/admin/noti/queryMessageSum",
			type:"post",
			data:{
				"userid":userid
			},
			success:function(data){
				$("#sumMessage").html(data.sumMessage);
			}
		})
	}
		
		
    function refresh(){
      		 $("#main_ifream")[0].contentWindow.refreshData();
			}
    function openMessage(obj){
		$.ajax({
			url:"/admin/loan/queryname",
			type:"get",
			datatype:"json",
			success:function(data){
				$("#user_modal").load("/admin/loan/noticeMessages.html?userid="+data.uuid);
			}})
		opendiv("user_modal");
	}
	//打开div
	function opendiv() {
 		$(".modal").css("display", "block");
 		$("#fade2").css("display", "block");
 		parent.document.getElementById('fade1').style.display='block';

 	}
 	//关闭模态框
 	function colsediv() {
 		$(".modal").css("display", "none");
 		$("#fade2").css("display", "none");
 		parent.document.getElementById('fade1').style.display='none';
 	}
  </script>
  </body>
</html>
