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
</head>
<body>
<div class="img_list" id="attachment">
</div>
</body>
<script>
	$(function () {
		debugger;
		var html = "";
		html+="<div class='file_img'>"
				+ "<a data-lightbox='set_img'><video autoplay='autoplay' controls='controls' ><source src='"+ parent.window.videoUrl +"'/></a></div>"
		$("#attachment").html(html);
	});
</script>
</html>
