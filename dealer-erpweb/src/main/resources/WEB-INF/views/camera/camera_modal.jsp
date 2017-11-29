<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="utf-8">
		<title>工作平台</title>
		<%@include file="../common/taglibs.jsp" %>
		<link href="${basePath}/css/bootstrap/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="${basePath}/css/font-awesome.min93e3.css" />
		<link rel="stylesheet" type="text/css" href="${basePath}/css/common.css" />
		<script src="${basePath}/js/jquery.min.js"></script>
		<script src="${basePath}/js/jquery.cookie.js" ></script>
		<style>
			body {
				min-height: auto;
				padding-top: 30px;
			}
			
			.set-form label {
				width: 100px;
			}
		</style>
	</head>

	<body>

		<div class="form-horizontal container">
			<div class="form-group">
				<label class="col-sm-2 control-label">序号</label>
				<div class="col-sm-10">
					<input id = "code" type="text" class="form-control" style="width: 100px;">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">摄像头名称</label>
				<div class="col-sm-10">
					<input id = "name" type="text" class="form-control" >
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">图片地址url</label>
				<div class="col-sm-10">
					<input id = "posterUrl" type="text" class="form-control" >
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">直播地址url</label>
				<div class="col-sm-10">
					<input id = "videoUrl" type="text" class="form-control" >
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="button" class="btn btn-danger" id="btn-sub">确定</button> <button type="button" id="btn-re" class="btn btn-default">取消</button>
				</div>
			</div>
		</div>
		
		
		<script >
			 $(function(){
    			 //编辑,从上一个页面的设置的cookie中获取参数
	    		 if(GetQueryString("id") != null){
			    	 var editValue = $.cookie('editValue');
			    	 editValue = JSON.parse(editValue);
		    		 $("#code").val(editValue.Code);
		    		 $("#name").val(editValue.Name);
		    		 $("#posterUrl").val(editValue.PosterUrl);
		    		 $("#videoUrl").val(editValue.VideoUrl);
		    		 return;
	    		 }
		     })
		    
		     function GetQueryString(name){
			      var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
			      var value = window.location.search.substr(1).match(reg);
			      return value != null ? unescape(value[2]) : null;
		     }
			 
			 $("#btn-re").click(function(){
				$("#code").val("");
	    		$("#name").val("");
	    		$("#posterUrl").val("");
	    		$("#videoUrl").val("");
			 }		 
			 )

			 $("#btn-sub").click(function(){
		        var id = GetQueryString("id");
		        if($("#code").val()==""||$("#name").val()==""||$("#posterUrl").val()==""||$("#videoUrl").val()=="")
		        {
		        	layer.msg("请补全数据");
		        }
		        else{
		        	var index = parent.layer.getFrameIndex(window.name);
		        	if(id != null){
		        		//如果传来的ID不为空，则为更新操作
		        		var monitoringInfo={
		            			"monitoringNum":$("#code").val(),
		            			"monitoringName":$("#name").val(),
		            			"posterUrl":$("#posterUrl").val(),
		            			"videoUrl":$("#videoUrl").val(),
		            			"id":id
		            			};
		        		 $.ajax({
		                     type: 'POST',
		                     contentType: "application/json",
		                     url: '${basePath}/admin/emi/updateEmi',
		                     async: false,
		                     datatype:'text',
		                     data:JSON.stringify(monitoringInfo),
		                     success: function (data) {
		                          if (data == '0000') {
		                              layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
		                              parent.layer.close(index);
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
		        		
		        	}else{
		        		//如果传来的ID为空,则为添加操作.
		         		var jumpData = $.cookie('jumpData');
		         		jumpData = JSON.parse(jumpData);
		         		var merchantId = jumpData.id;
		        		   var monitoringInfo={
		            			"monitoringNum":$("#code").val(),
		            			"monitoringName":$("#name").val(),
		            			"posterUrl":$("#posterUrl").val(),
		            			"videoUrl":$("#videoUrl").val(),
		            			"merchantId":merchantId
		            			};
		        		 $.ajax({
		                     type: 'POST',
		                     contentType: "application/json",
		                     url: '${basePath}/admin/emi/insertEmi',
		                     async: false,
		                     datatype:'text',
		                     data:JSON.stringify(monitoringInfo),
		                     success: function (data) {
		                    	 parent.layer.close(index);
		                          if (data == '0000') {
		                              layer.msg("操作成功!", {icon:3, time: 1000}, function () {
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
		        	}}
		        })
		</script>
	</body>

</html>