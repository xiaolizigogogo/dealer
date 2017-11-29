<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

	<head>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<title></title>
		<%@include file="../common/taglibs.jsp" %>
		<link href="${basePath}/css/bootstrap/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="${basePath}/css/font-awesome.min93e3.css" />
		<link rel="stylesheet" type="text/css" href="${basePath}/css/common.css" />
		<script src="${basePath}/js/jquery.min.js"></script>
		<script src="${basePath}/js/plugins/layer/layer.min.js"></script>
		<script type="text/javascript" src="${basePath}/js/plugins/player/sewise.player.min.js"></script>
		<script src="${basePath}/js/jquery.cookie.js" ></script>
	</head>

	<body>
		<div class="col-sm-12">
			<div class="tools_bar ">
				<div class="bar_tit clearfix">
					<h2 class="pull-left" id = "acountName"></h2>
					<a href="javascript:history.go(-1);" class="pull-right btn btn-link"><i class="fa fa-mail-forward"></i> 返回</a>
				</div>
			</div>
			<div class="from_box">
				<div class="from_tit clearfix">
					<h3 class="pull-left"></h3>
				</div>
				<div class="from_con camera-list" id = "cameraData">
					<input type = "hidden" class = "add-btn" />
				</div>
			</div>
		</div>

		<script src="${basePath}/js/common.js"></script>
		<script>
		
	    function openPlay(cameraName , posterUrl , videoUrl){
	    	var playData = {
	    			posterUrl: posterUrl,
	    			videoUrl: videoUrl
	     	}
	     	$.cookie('playData' , JSON.stringify(playData));
	    	layer.open({
				type: 2,
				title: "<h4>" + cameraName + "</h4>",
				content: 'camera_play.jsp',
				area: ['770px', '540px']
			});
	    }
	    
	    function editCamera(Id , Code , Name , PosterUrl , VideoUrl){
	    	var editValue = {
	    			Id: Id,
	    			Code: Code,
	    			Name: Name,
	    			PosterUrl: PosterUrl,
	    			VideoUrl: VideoUrl
	     	}
	    	$.cookie('editValue' , JSON.stringify(editValue));
	    	layer.open({
				type: 2,
				title: "<h4>" + Name + "</h4>",
				content: 'camera_modal.jsp?id=' + Id,
				area: ['770px', '400px'],
				end: function(){
					location.reload();
				}
			});
	    }

	    function addCamera(){
			var index = layer.open({
				type: 2,
				title: '<h4>添加设备</h4>',
				content: 'camera_modal.jsp',
				area: ['770px', '400px'],
				end: function(){
					location.reload();
				}
			});
	    }

		function delCamera(deleteId){
			var dialogMsg = "你确定删除此摄像头吗？";
			alertMessage(dialogMsg,'cameraDelete("'+deleteId+'")','qs_box1');
		}
		
	    function cameraDelete(deleteId) {
	    	debugger;
	        $.ajax({
               type: 'GET',
               url: "${basePath}/admin/emi/deleteEmi/" + deleteId,
               datatype:'json',
               success: function (data) {
                    if (data == '0000') {
                        layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
                        colsediv(0);
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
		}
	    
	    $(function(){
	    	//车商列表存cookie的数据
	    	var jumpData = $.cookie('jumpData');
	    	jumpData = JSON.parse(jumpData);
	    	$("#acountName").text(jumpData.merchantName);
	    	
	        $.ajax({
	            type: 'GET',
	            url: "${basePath}/admin/emi/showEmi/" + jumpData.id,
	            success: function(data){
		            var list = "";
		            if(data != null && data.length >= 0){
	                    for(var i = 0; i < data.length; i++){
	                    	var paramId = '"' + data[i].id + '"';
	                    	var paramCode = '"' + data[i].monitoringNum + '"';
			            	var paramName = '"' + data[i].monitoringName + '"';
			            	var paramVideoUrl = '"' + data[i].videoUrl + '"';
			            	var paramPosterUrl = '"' + data[i].posterUrl + '"';
	                        list += "<div class='col-sm-3'>"
	                             + "<h5 class='text-center'>" + data[i].monitoringName + "</h5>"
	                             + "<a href='javascript:void(0)' onclick = 'openPlay(" + paramName + "," + paramPosterUrl + "," + paramVideoUrl +")' class='btn-detail'><img src='" + data[i].posterUrl + "' class='img-responsive' /></a>"
	                             + "<p class='col-sm-12'>"
	                             + "<a onclick = 'delCamera(" + data[i].id + ")' class='btn btn-default btn-sm  col-sm-4 col-sm-offset-1 btn-del' >删除</a>&nbsp;&nbsp;&nbsp;"
	                             + "<a onclick = 'editCamera(" + paramId + "," + paramCode + "," + paramName + "," + paramPosterUrl + "," + paramVideoUrl + ")' class='btn btn-sm btn-danger col-sm-4 col-sm-offset-2  btn-edit' >编辑</a>"
	                             + "</p>"
	                             + "</div>";
	                    }
	                }
		            list += "<div class='col-sm-3 add-box'><a class='add-btn' onclick = 'addCamera()'  ><i class='fa fa-plus fa-4x'></i></a></div>";
                    $("#cameraData").html(list);
	            },error:function(){
	                layer.msg("系统错误");
	            }
	        });
	    })

		</script>

	</body>

</html>