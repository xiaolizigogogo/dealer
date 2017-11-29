<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="com.utonw.utonbase.core.erpcommon.config.ParamterControl" %>
<c:set var="basePath" value="<%= request.getContextPath() %>" />
<!DOCTYPE html>
<html>


<!-- Mirrored from www.zi-han.net/theme/hplus/ by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:16:41 GMT -->
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title></title>

    

    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

    <link rel="shortcut icon" href="favicon.ico">
    <link href="${basePath}/css/bootstrap.min14ed.css" rel="stylesheet">
    <link href="${basePath}/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="${basePath}/css/animate.min.css" rel="stylesheet">
    <link href="${basePath}/css/style.min.css?v=4.1.0" rel="stylesheet">
    
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
                    <div class="navbar-header">
                     <a class="navbar-minimalize minimalize-styl-2 btn btn-danger " href="#"><i class="fa fa-bars"></i> </a>
                     <img src="<%=ParamterControl.LOGO_DISPLAY%>"  style="margin: 15px; height: 70px;" >                    </div>
                  <ul class="nav navbar-top-links navbar-right">
                        <li><a><i class="fa fa-user"></i><span id="txt"></span></a></li>
                        <li class="dropdown" id="dropdown">
                                <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#" >
                                    <i class="fa fa-bell"></i> <span class="label label-danger text-value"  data-key="waitDoJobNumber">8</span>
                                    <span style="padding-left: 5px;">任务</span>
                                </a>
                                <ul class="dropdown-menu dropdown-alerts">
                                    <!--<li class="divider"></li>-->
                                    <li>
                                        <a href="#">
                                            <div>
                                                <i class="fa fa-envelope fa-fw"></i> 您有<span class="text-value" data-key="waitDoJobNumber">1</span>条待办任务
                                            </div>
                                        </a>
                                    </li>

                                </ul>
                        </li>
      <!--<li><i class="fa fa-bullhorn"></i><a href=" #"  onclick="openMessage(this);" id="link_notice">消息公告 <span id="sumMessage" class="badge">1</span></a></li>  -->
      <li><a href="/admin/user/loginOut.html" target="_parent" id="logout"><i class="fa fa-power-off"></i>退出登录</a></li>
    </ul>
              
                </nav>
            </div>
            <div class="row content-tabs">
                <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i>
                </button>
                <nav class="page-tabs J_menuTabs">
                    <div class="page-tabs-content">
                    <a href="javascript:;" class="active J_menuTab" data-id="main.jsp">工作平台</a>
                     
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
                <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="main.html" frameborder="0" data-id="main.html" seamless></iframe>
            </div>
            <div class="footer">
                <div class="pull-right">&copy; 2014-2015 
                </div>
            </div>
        </div>
        <!--右侧部分结束-->
       
      
    </div>
     <script src="${basePath}/js/jquery.js"></script>
    <script src="${basePath}/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="${basePath}/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="${basePath}/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="${basePath}/js/layer/layer.js"></script>
    <script src="${basePath}/js/hplus.min.js?v=4.1.0"></script>
    <script type="text/javascript" src="${basePath}/js/contabs.min.js"></script>
    
</body>

<script type="text/javascript">

$(document).ready(function(){
    debugger;
    $.ajax({
        type: "GET",
         url: "${basePath}/admin/user/nameHtml",
         dataType:"json",
         success: function (data) {
             //alert("欢迎进入success");
             debugger;
            $("#txt").html(data.name);   
            $.ajax(getting);
             } 
    });
})


var getting = {
    url:"${basePath}/admin/count/new",
    type:"post",
    datatype:"json",
    success:function(res) {
        $(".text-value").each(function(key,value){
            if($(value).attr("data-key")=="waitDoJobNumber"){
                $(value).html(res.daicount);
            }
        })
        if(res.daicount>0) {
            if($("#dropdown").attr("class")=="dropdown open"){
            	return ;
            }
            else{
            	$("#dropdown").attr("class","dropdown open")
            }
        }
    }

};


window.setInterval(function(){
    debugger;
    $.ajax(getting)},60000);


/**
 * 
 
 $.ajax({
    url:"/admin/loan/queryname",
    type:"get",
    datatype:"json",
    success:function(data){
    var a="欢迎"+data.name;
    $("#txt").html(a);
    debugger;
    }})
    */

</script>

<!-- Mirrored from www.zi-han.net/theme/hplus/ by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:17:11 GMT -->
</html>
