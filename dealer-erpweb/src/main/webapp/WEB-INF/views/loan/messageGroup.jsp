<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link href="${basePath}/css/bootstrap/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${basePath}/css/libs/font-awesome.css" />
<link rel="stylesheet" type="text/css" href="${basePath}/css/common.css" />
<link href="${basePath}/css/summernote/summernote.css" rel="stylesheet">
    <link href="${basePath}/css/summernote/summernote-bs3.css" rel="stylesheet">
<script type="text/javascript" src="${ basePath }/js/jquery/jquery.min.js"></script>
<script src="${ basePath }/js/jquery.js"></script>

<link rel="stylesheet" type="text/css" href="${basePath}/css/bootstrap-select.min.css" />
<script src="${basePath}/js/bootstrap-select.min.js"></script>
<script src="${basePath}/js/bootstrap.js"></script>
<script src="${basePath}/js/common.js"></script>
<script src="${basePath}/js/layer/layer.js"></script>
</head>
<script>
	$(window).on('load', function () {  
		$('.selectpicker').selectpicker({
                'selectedText': 'cat'
        });
		// $('.selectpicker').selectpicker('hide');
    });
</script>
<body>
<div class="col-lg-12">
	<div class="tools_bar ">
      <div class="bar_tit clearfix">
        <h2 class="pull-left">公告添加</h2>
        <a href="/admin/loan/noticeMessageList.html" class="pull-right btn btn-link"><i class="fa fa-mail-forward"></i> 返回列表</a> 
	  </div>
    </div>
	<form class="form-horizontal" style="margin-top: 20px;" id="form">
		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label"> <i
				class="text-danger">*</i> 标题
			</label>
			<div class="col-sm-5">
				<input type="text" class="form-control" id="title" value="">
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label"><i
				class="text-danger">*</i> 分公司</label>
			<div class="col-sm-5">
				<select class="form-control" id="companyId" name="companyId">
					<option value="0">请选择</option>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label"><i
				class="text-danger">*</i> 部门</label>
			<div class="col-sm-8">
				<select class="selectpicker bla bla bli" multiple
					data-live-search="true" id="deptId" name="deptId">
				</select>
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label"><i
				class="text-danger">*</i> 部门人员</label>
			<div class="col-sm-8">
				<select class="selectpicker bla bla bli" multiple
					data-live-search="true" name="responsibleCmId" id="responsibleCmId">
					
				</select>
			</div>
		</div>
		
		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label"><i
				class="text-danger">*</i> 公告内容</label>
			<div class="col-sm-8">
			<div class="summernote" id="Messagecontent">
                         

			</div>
				
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<a class="btn btn-danger" href="#" onclick="MessageSendOut()"
					style="width: 100px;"> <i class="fa fa-users"></i>发送
				</a>
			</div>
		</div>


	</form>
</div>
	<!--
	<div>
		<h4>我发送的消息</h4>
		<table class="table table-bordered table-striped"
			style="margin-bottom: 0px;">
			<tr>
				<th>序号</th>
				<th>标题</th>
				<th>发送时间</th>
				<th>操作</th>
			</tr>
			<tbody id="messageForMe">
			</tbody>
		</table>
	</div>
	-->
	<div id="content"></div>
	<div id="qs_box1" class="modal modal_sml fade in">
    <div class="modal-header">
        <a type="button" href="javascript:void(0)"
           onclick="colsediv('qs_box1')" class="close"><span
                aria-hidden="true">&times;</span></a>
        <h4 class="modal-title" id="myModalLabel" style="font-size: 16px;">提示</h4>
    </div>
    <div class="modal-body">
        <p class="p_tip">
            <i class="fa fa-check-circle"></i> <span id="alert_message">

        </span>
        </p>
        <div class="btn_list clearfix">
            <a class="btn btn-danger btn-sm" href="javascript:void(0)"
               onclick="colsediv('qs_box1')">取消</a> <a
                class="btn btn-default btn-sm" href="javascript:void(0)"
                onclick="colsediv('qs_box1')" id="ok_button">确定</a>
        </div>
    </div>
	</div>	
	<script src="${basePath}/js/summernote/summernote.min.js"></script>
    <script src="${basePath}/js/summernote/summernote-zh-CN.js"></script>
  <script>
        $(document).ready(function(){$(".summernote").summernote({lang:"zh-CN"})});
    </script>
	<script>
	 
  //1.初始化页面 init方法,第一次请求不需要设置参数，需要设置页面初始化数据
  $(function() {
    init();
	//$('#editor').wysiwyg();
	var companyIdObj = $("#companyId");
        $.get("${basePath}/admin/company/queryCompanyList.html", function (result) {
            var html = '';
            $(result).each(function (i) {
                html += '<option value="' + result[i].id + '">' + result[i].name + '</option>';
            });
            companyIdObj.append(html);
			

            // 查询更新时选中所属公司
            companyIdObj.find("option[value='" + ${customerRegisterInfo.companyId} +"']").attr("selected", true);
            // 查询更新时查询出该公司下的所有部门，为查询更新时选中所属部门准备数据
            if ("${customerRegisterInfo.companyId}" != "") {
                getDept("${customerRegisterInfo.companyId}");
            }
        });

        /* 下拉列表选中之后调用的事件，加载出该公司下所有的部门 */
        companyIdObj.bind("change", function () {
            getDept(this.value);
        });

        /* 根据公司Id查询部门*/
        var deptIdObj = $("#deptId");
        var getDept = function (companyId) {
            $.get("${basePath}/admin/dept/queryDeptALL?companyId=" + companyId,
                    function (result) {
                        var html = "";
                        $(result).each(function (i) {
                            html += '<option value="' + result[i].id + '">' + result[i].name + '</option>';
                        });
						//alert(html);
                        deptIdObj.html(html);// 此处不能使用append(html),原因：多次选择会出现叠加的情况
						deptIdObj.selectpicker('refresh');
                        // 查询更新时选中所属部门
                        deptIdObj.find("option[value='${customerRegisterInfo.deptId}']").attr("selected", true);
                        // 查询更新时查询出该部门下所有用户，为查询更新时选中所属用户准备数据
                        if ('${customerRegisterInfo.deptId}' != "") {
                            getUsers($("#companyId").val(), '${customerRegisterInfo.deptId}');
                        }
                    });
        };

        /*动态加载公司部门名下所有员工*/
        deptIdObj.bind("change", function () {
            getUsers($("#companyId").val(), this.value);
        });

        var getUsers = function (companyId, deptId) {
			
            var responsibleCmIdObj = $("#responsibleCmId");
			$.ajax({
            url: '${basePath}/admin/user/queryComIdDeptIds.html',
			type: 'get',
            dataType: "json",
			data:$("#form").serialize(),
            success: function (data) {
						var html = "";
                        $(data).each(function (i) {
                            html += "<option value='" + data[i].uuid + "'>" + data[i].realname + "</option>";
                        });
                        responsibleCmIdObj.html(html);
						responsibleCmIdObj.selectpicker('refresh');
						
                        // 查询更新时选中所属用户
                        responsibleCmIdObj.find("option[value='${customerRegisterInfo.responsibleCmId}']").attr("selected", true);
					}
			});
			//alert($("select[name='responsibleCmId']").val());
        };
  });
  //初始化方法,调用getUsersMessage接口，将返回的一系列信息添加到页面
  function init() {
	  
		$.ajax({
			url:"${basePath}/admin/noti/getUsersMessage",
			type:"get",
			success:function(data){
				
				var namesIds = data.nameAndId;
				var record="";
				var groupAry ={};
				//alert(namesIds[0].uuid);
				for(var i=0;i<namesIds.length;i++){
					var item=namesIds[i];
				     //var context = "姓名："+item.realname+"*****"+"ID："+item.uuid;
					 if(groupAry[item.deptName]){
						 groupAry[item.deptName].push(item.realname+":"+item.uuid);
					 }
					 else{
						 groupAry[item.deptName]=[];
						 groupAry[item.deptName].push(item.realname+":"+item.uuid);
					 }
					 //alert(item.uuid);
				}
				for(var obj in groupAry){
					record += (obj+":");
					for(var i =0;i<groupAry[obj].length;i++){
						var context = "<input type='checkbox' name='checkboxes' value='"+groupAry[obj][i].split(":")[1]+"'/>"+groupAry[obj][i].split(":")[0];		
						record+=context;
					}	
					record+="</br>";
				}
				$("#record").html(record);
				
			}
  		});
		
		
		
		
		
		$.ajax({
            type: 'POST',
            url: '${basePath}/admin/noti/mySendedMessage',
            dataType: "json",
            success: function (data) {
				for(i=0;i<data.myMessage.length;i++){
					var uuid = data.myMessage[i].uuid;
					var userid = data.myMessage[i].userid;
					var con = "<tr>"
							+ "<td>"+ (i+1) + "</td>"
							+ "<td><a href='javascript:void(0);' id='"+uuid+userid+"' onclick='openMyMessage(this)'>"+data.myMessage[i].title+"</a></td>"
							+ "<td>"+ data.myMessage[i].createTime + "</td>"
							+ "<td><a href='#' onclick='deleteMsgAll(this)' id='"+uuid+"'>删除</a></td>"
							+ "</tr>";
					$("#messageForMe").append(con);
					//alert(data.myMessage[0].title);
				}
            }
        });
        
  }
	function deleteMsgAll(id){
		//debugger;
		var uuid=$(id).attr("id");
		var dialogMsg = "你确定删除么？此操作将删除所有用户接收的此消息！";
        alertMessage(dialogMsg,'deleteMessageAll("'+uuid+'")','qs_box1');
		
	}
	function deleteMessageAll(uuid){
		$.ajax({
			type: "POST",
			url: "/admin/noti/deleteAllMessage",
			dataType: "text",
			data: {
				"uuid": uuid
			},
			success: function (data) {
					//debugger;
				if (data == "0000") {
					layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
						//colsediv(0);
						$("td").remove();
						init();
						//$("#user_modal").load("/admin/loan/noticeMessages.html");
						//opendiv("user_modal");
						return true;
					});
				} else {
					{
						layer.msg("操作失败!");
						return false;
					}
				}
			},
			error: function () {
				layer.msg("未知错误!");
				return false;
			}

		});
	}
	function openMyMessage(id){
		var uuid=$(id).attr("id");
		$("#content").load("/admin/loan/openContentMessage.html?uuid="+uuid);
	}
	// function allchecked() {
		// debugger;
        // var isChecked = $("#allCheck").prop("checked");
        // if (isChecked) {
            // $("[name='checkboxes'][disabled!='disabled']").prop("checked", true);//全选
        // } else {
            // $("[name='checkboxes']").prop("checked", false);//取消全选
        // }
    // }
	function paramClick() {
        var boxLength = $("[name='checkboxes'][disabled!='disabled']").length;
        var checkLength = $("input[name='checkboxes'][disabled!='disabled']:checked").length;
        if (boxLength == checkLength && boxLength != 0) {
            $("#checkAll").prop("checked", true);
        } else {
            $("#checkAll").prop("checked", false);
        }
    }

	function MessageSendOut() {
		//alert($("[contenteditable=true]").html());
        var optionV = $("select[name='responsibleCmId']").val();
        var optionVl = $("select[name='responsibleCmId']").length;
		//alert(optionVl);
		var messages = $("[contenteditable=true]").html().toString();
		//alert(messages);
		var title = document.getElementById("title").value;
		var titles = $("#title").val();
        if (optionV == null) {
            layer.msg("请选择要发送的人！");
            return;
        }
		if(title==""||title==null){
			layer.msg("标题不能为空！");
			return;
		}
		if(messages == ""){
			layer.msg("内容不能为空！");
			return;
		}
		
        // var checkValues = [];
        // var activitiList = [];
        // var i = 0;
        // checkbox.each(function () {
            // checkValues[i] = this.value;
            // i++;
        // });
		
		
		
		//alert(messages);
		
		
        var dialogMsg = "你确定发送吗？";
		//layer.confirm(dialogMsg, {icon: 3, title: '提示'},function MassMessage(optionV,messages,title) {
			
		//});
		MassMessage(optionV.toString(),messages,title);
		

    }
	function MassMessage(optionV,messages,title){
		debugger;
        $.ajax({
            type: 'POST',
            url: '${basePath}/admin/noti/notiMessage',
            data:{
                "userIdList":optionV,
				"mess":messages,
				"title":title
            },
            dataType: "text",
            success: function (data) {
				
                if (data == '0000') {
                    layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
                        colsediv(0);
                        return true;
                    });
                } else {
                    colsediv(0);
                    layer.msg("操作失败!");
                    return false;
                }
            }, error: function () {
                colsediv(0);
                layer.msg("网络错误!");
                return false;
            }
        });
    }
	
</script>
</body>
</html>