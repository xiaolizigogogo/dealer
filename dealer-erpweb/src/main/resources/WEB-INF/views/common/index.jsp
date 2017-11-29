<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="basePath" value="<%= request.getContextPath() %>" />

<!-- 引入css文件 -->
<link type="text/css"  rel="stylesheet" href="${basePath}/css/bootstrap.min.css" />
<%-- <link type="text/css" rel="stylesheet" href="${basePath}/css/css.css" /> --%>

<!-- 引入layer样式 -->
<link type="text/css" rel="stylesheet" href="${basePath}/js/layer/skin/layer.css" />

<!-- 引入javascript文件 -->
<script type="text/javascript" src="${ basePath }/js/jquery/jquery.min.js"></script>
<%--<script type="text/javascript" src="${ basePath }/js/jquery/jquery.imgbox.pack.js"></script><!--借款文件预览-->--%>

<!-- 引入layer js -->
<script type="text/javascript" src="${basePath}/js/layer/layer.js"></script>

<link rel="shortcut icon" href="${ basePath }/favicon.ico" />

<link rel="stylesheet" type="text/css" href="${ basePath }/css/libs/font-awesome.css"/>

<!-- 2.0 JS -->
<script type="text/javascript" src="${ basePath }/js/bootstrap.js"></script>
<%-- <script type="text/javascript" src="${ basePath }/js/bootstrap-table.js"></script> --%>