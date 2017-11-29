<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Title</title>
	<script src="${basePath}/js/jquery.min.js" ></script>
	<script src="${basePath}/js/layer/layer.js"></script>
	<script src="${basePath}/js/lightbox-plus-jquery.min.js"></script>
	<link href="${basePath}/css/bootstrap/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="${basePath}/css/bootstrap/bootstrap-table.css">
	<link rel="stylesheet" type="text/css" href="${basePath}/css/font-awesome.min93e3.css"/>
	<link rel="stylesheet" type="text/css" href="${basePath}/css/common.css"/>
	 <script src="${basePath}/js/layer/layer.js"></script>
</head>
<body>
<div class="credit_list" id="creditList">
	<ul class="list-inline" >
		<li>
			<div>
				<p>个人反欺诈分析信息查询</p>
				<a id="fraud"><img class="example-image" src="${basePath}/img/pdf.jpg"/></a>
			</div>
		</li>
		<li>
			<div>
				<p>个人信用报告</p>
				<a id="personal"><img class="example-image" src="${basePath}/img/pdf.jpg"/></a>
			</div>
		</li>
		<li>
			<div>
				<p>全国企业信用报告</p>
				<a id="enterprise"><img class="example-image" src="${basePath}/img/pdf.jpg"/></a>
			</div>
		</li>
	</ul>
</div>
</body>
<script>
$(function(){
	debugger;
	var customerId = parent.window.customerId;
	var fraud = "/admin/merchant/downloadPdf?type=fraud&customerId="+customerId;
	$("#fraud").attr("href",fraud);
	var personal = "/admin/merchant/downloadPdf?type=personal&customerId="+customerId;
	$("#personal").attr("href",personal);
	var enterprise = "/admin/merchant/downloadPdf?type=enterprise&customerId="+customerId;
	$("#enterprise").attr("href",enterprise);
})
</script>
</html>
