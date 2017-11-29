<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
		<title>分配线下人员</title>
<%-- 		<%@include file="../common/taglibs.jsp" %> --%>
		<link href="${basePath}/css/bootstrap/bootstrap.min.css" rel="stylesheet" >
		<link rel="stylesheet" type="text/css" href="${basePath}/css/font-awesome.min93e3.css"/>
		<link rel="stylesheet" type="text/css" href="${basePath}/css/common.css"/>
		<script src="${basePath}/js/jquery.min.js"></script>
		<script src="${basePath}/js/jquery.cookie.js" ></script>
		<script type="text/javascript" src="${basePath}/js/layer/layer.js"></script>
		<style>
			.alert{ display: none; border: dashed 1px #ddd; border-radius: 0; padding: 5px 10px; background: #f2f2f2;}
		</style>
		
</head>
<body>
		<form class="container" style="margin-top: 10px;">
			<div class="form-group">
				
				<select class="form-control pull-left" style="width: 400px; margin-right:10px;" id="sel_user">
		
			
				</select>
				
				<button type="button" id="butchoose" class="btn btn-danger" style="display: inline;">确定</button> 
				
				
			</div>
         <p class="alert text-danger">您选择的线下人员服务区域为：<br/>
                       辽宁省大连市西岗区、辽宁省大连市沙河口区</p>
			

		</form>

	
		<script>
		 $(function(){
			    var editValue = $.cookie('editValue');
				editArr = JSON.parse(editValue);
			    var location=$.cookie('location');
			    location=JSON.parse(location);
			    var locationRequest={};
			    locationRequest['location']=location;
		        $.ajax({
		            type: 'post',
		            url: "${basePath}/admin/distributionUser/getUserInfo",
		            data: JSON.stringify(locationRequest),
		            contentType:"application/json",
		            dataType: "json",
		            success: function(data){
		                var list = '<option value="0">请选择线下人员</option>';
		                var edits;
		                if(data!= null && data.length >= 0){
		                    for(var i = 0; i < data.length; i++){
		                        list +=
		                        	'<option location='+data[i].province+data[i].city+data[i].district+' value="'+data[i].userName+'">'+data[i].userName+'</option>';
		                    }
		                }
		                $("#sel_user").append(list);
		            },error:function(){
		                layer.msg("系统错误");
		            }
		        });
		    });
		    
			 $("#butchoose").click(	
					    function (){
					    	var index = parent.layer.getFrameIndex(window.name);
							var requsetDate={};
							requsetDate['editArr']=editArr;
							requsetDate['userName']=$("#sel_user option:selected").attr('value');
							if(requsetDate['userName']!=0)
							{
						      $.ajax({
						            type: 'post',
						            url: "${basePath}/admin/distributionUser/setUserInfo",
						            data: JSON.stringify(requsetDate),
						            contentType:"application/json",
						            dataType: "text",
						            success: function(data){
						            	  if (data == 'success') {
				                              layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
				                              parent.location.reload();
				                              parent.layer.close(index);
				                              });
				                    } else {
				                              layer.msg("操作失败!");
				                    }

						            },error:function(){
						                
						            }
						        })
						        }
							else{
								layer.msg("请选择线下人员");
							};
					    }		
					    );
			 
			$("#sel_user").change(
			function(){
			var location=$("#sel_user option:selected").attr("location");
			if(location==undefined){
				$(".alert").hide();
			}else{
			$(".alert").html('您选择的线下人员服务区域为：<br/>'+location);
			$(".alert").show();
			}
			});
			
		</script>
</body>
</html>