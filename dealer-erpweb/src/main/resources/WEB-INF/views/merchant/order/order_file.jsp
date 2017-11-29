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
	  <link rel="stylesheet" href="${basePath}/css/viewer/viewer.min.css"><script src="${basePath}/js/viewer/viewer.js"></script>
	  <script src="${basePath}/js/viewer/viewer.min.js"></script>
</head>
<body>
<div class="img_list dowebok" id="attachment">
	<ul class="list-inline" ></ul>
</div>
</body>
<script>
	$(function () {
		debugger;
		var html = "";
		for(obj in parent.window.tradingUrlList){
			html+="<li>"
					+ "<div class='file_img'>"
					+ "<p class='tools'><a href="+ parent.window.tradingUrlList[obj]+" data-lightbox='example-set'></a></p>"
					+ "<img class='viewer-toggle' src=" + parent.window.tradingUrlList[obj] + " data-original="+parent.window.tradingUrlList[obj] +"> </div>"
					+ "</li>"
			$("#attachment").children("ul").html(html);
		}
		$('.dowebok').each(function(){
			$(this).viewer({
				url: 'data-original',
			});
		})
	});
</script>
</html>
