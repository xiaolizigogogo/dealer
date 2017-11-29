<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

	<head>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<title>Sewise Player</title>
		<%@include file="../common/taglibs.jsp" %>
		<script type="text/javascript" src="${basePath}/js/plugins/player/sewise.player.min.js"></script>
		<script src="${basePath}/js/jquery.min.js"></script>
		<script src="${basePath}/js/plugins/layer/layer.min.js"></script>
		<script src="${basePath}/js/jquery.cookie.js" ></script>
	</head>

	<body style="min-height:auto;">
		<div id="player" style="width: 100%; height: 480px;  margin: 0 auto;">
			<!--宽度和高度要按照一定的比例进行设置-->
			<script type="text/javascript">
				//获取设备页面放入cookie的值
		    	var playData = $.cookie('playData');
		    	playData = JSON.parse(playData);
				SewisePlayer.setup({
					server: "vod", //服务器给播放器提供的数据请求接口方法   
					type: "m3u8", //支持视频格式为m3u8
					autostart: "true", //是否自动播放（true为自动播放，false为不自动播放，默认为true）
					poster: playData.posterUrl, //视频停止时，播放器上面显示的背景图片(若没有设置图片或者图片路径不对，则显示黑色背景)
					videourl: playData.videoUrl, //视频源的地址
					skin: "vodOrange", //播放器主题风格（样式）
					title: "摄像头监管", //视频标题，位于视频的左上角（可以进行修改操作）
					claritybutton: "disable", //清晰度按钮的显示（默认为显示，disable为不显示，enable为显示）
					lang: "zh_CN" //视频播放器下面的一系列操作元素的提示信息的语言格式（zh_cN为中文）
				}, "player");
			</script>

		</div>
	</body>

</html>