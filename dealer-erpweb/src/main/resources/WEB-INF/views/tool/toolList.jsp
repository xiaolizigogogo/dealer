<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=edge; chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Cache-Control" content="no-transform">
	<title>Insert title here</title>
	<link href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="${ basePath }/css/libs/font-awesome.css"/>
</head>
<body>
<div class="input-group">
  			<select class = "form-control"  id="filePath" >
      			<option selected="selected">请选择.bpmn文件路径</option>
     		</select>
  <span class="input-group-addon"><button class="btn btn-default" type="button" id="queryBpmn">Go!</button></span>
  </div>
  <div id="sheet">
  </div>
  <br>
  <div>
  	<span class="input-group-addon"><button class="btn btn-default" type="button" id="insertBpmn">插入数据表!</button></span>
  </div>

			
</body>
<!-- 引入javascript文件 -->
<script type="text/javascript" src="${ basePath }/js/jquery/jquery.min.js"></script>
<script type="text/javascript" src="${basePath}/js/jquery/jquery.ui.widget.js"></script>
<script type="text/javascript" src="${basePath}/js/jquery/jquery.iframe-transport.js"></script>
<script type="text/javascript" src="${basePath}/js/jquery/jquery.fileupload.js"></script>
<link rel="stylesheet" href="${basePath}/css/lightbox.min.css"/>
<!-- 2.0 JS -->
<script type="text/javascript" src="${ basePath }/js/bootstrap.js"></script>
<script type="text/javascript" src="${ basePath }/js/other.js"></script>
<script type="text/javascript" src="${basePath}/js/layer/layer.js"></script>
<script type="text/javascript">
$(function () {
    init();
});

var dateTable = new Array();
var taskType = null;
//获取bpmn文件路径
function init(){
		$.ajax({
			type:"GET",
			url:"/admin/tool/queryBpmFile",
			success:function(data){
				for(var i=0;i<data.length;i++){
					$("#filePath").append("<option value="+(i+1)+">"+data[i]+"</option>"); 
				}
			},error : function(){
				 layer.msg("未知错误!");
                    return false;
			} 
	});
}
//bpmn解析内容
$("#queryBpmn").click(function(){
	var path= $("#filePath").find("option:selected").text();
	$.ajax({
		type:"POST",
		url:"/admin/tool/queryBpmnDataList",
		dataType:"json",
		data:{"path":path},
		success:function(data){
			dateTable = [];
			$("#sheet").html("");
			$("#sheet").append("<h3 align='center'>bpmn文件解析内容</h3>"
					  +"<table border='1' width='50%' align='center' id='content'>"
					  +"<tr>"
				 	  +"<th style='text-align:center'>task_name</th>"
					  +"<th style='text-align:center'>task_code</th>"
					  +"<th style='text-align:center'>task_type</th>"
					  +"</tr>"
					  +"</table>");
			$.each(data.userTask,function(key,value){
					$("#content").append(
							 "  <tr align='center'>"
							+"	<td>"+value.name+"</td>"
							+"	<td>"+value.id+"</td>"
							+"	<td>"+data.taskType+"</td>"
							+"  </tr>");
						taskType = data.taskType;
						dateTable.push("\"id\":"+"\""+value.id+"\""+", "+"\"name\":"+"\""+value.name+"\"");
			});					
		},error : function(){
			 layer.msg("未知错误!");
                return false;
		} 
	});
});
//bpmn文件解析的内容插入到数据库task_name表中
$("#insertBpmn").click(function(){
	$.ajax({
		type:"POST",
		url:"/admin/tool/insertBpmnDataList",
/*         beforeSend: function () {
            load = layer.load();
        }, */
		dataType:"text",
		data:{
			  "dateTable":dateTable,
			  "taskType":taskType
			  },
		success:function(data){
			//layer.close(load);
			debugger;
			if(data == "success"){
				layer.msg("操作成功", {icon: 1});
			}else {
				layer.msg("操作失败", {icon: 2});
				return false;
			}
		},error : function(){
			 layer.msg("未知错误!");
             return false;
		} 	
	});
});

</script>
</html>