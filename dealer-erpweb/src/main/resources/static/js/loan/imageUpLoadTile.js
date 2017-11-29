//一个上传图片后执行的方法
//初始化绑定图片上传事件
//初始化上传界面
$(function() {
	var loan_Id = $("#uuid").val();
	if (loan_Id == null || loan_Id == '') {
		loan_Id = $("#customer_id_hidden").val().split(':')[0];
	}
	// 查询当前节点状态 并获取对应的附件种类
	$
			.ajax({
				url : "/admin/loan/getNeedAttachment?loanId=" + loan_Id,
				type : "get",
				dataType : "json",
				success : function(data) {
					var attachment = data.attachmentInfos;
					// 音频类型附件
					var context = "";
					if (attachment.length > 0) {
						// 获取div 节点---图片 默认div的op_box_节点名
						var div = $("#op_box_" + attachment[0].taskName.taskCode);
						//如果根据节点名获取不到则使用数据库配置.
						if (div.length <= 0) {
							div=$("#"+attachment[0].taskName.taskDiv);
						}
						else{
							//还获取不到说明页面错误,或者是贷前申请
						}
						var lastcontext = "</ul></div></div>";
						var flag = false;
						var otherCode="";
						var otherName="";
						// 循环初始化所有图片或音频
						for (var i = 0; i < attachment.length; i++) {
							//如果不唯一
							if (!attachment[i].attachmentUnique) {
								flag = true;
								otherCode=attachment[i].attachmentCode;
								otherName=attachment[i].attachmentName;
							}
							if (attachment[i].attachmentType!="image") {
								if (attachment[i].attachmentType == 'audio') {
									context = initRadio(attachment[i], loan_Id,
											context);
								} else {
									context = initVideo(attachment[i], loan_Id,
											context);
								}
							} else {
								context = initImage(attachment[i], loan_Id,
										context);
							}
						}
						var addButton = "";
						if (flag == true) {
							// 添加一个增加附件按钮
							var addButton = "<a class='btn btn-danger btn-xs' id=add_img><i class='glyphicon glyphicon-plus'></i></a>";
						}
						var divcontext = "<div class=from_group><div class='from_tit clearfix' style='padding-bottom:0px;text-align:center'><h3 class=pull-left>附件上传</h3><div class=pull-right>"
								+ addButton
								+ "</div></div><ul class=list-inline id=img_list >";
						// 最终生成的context
						debugger;
						// 这里直接生成一个现实图片的div，但是div的位置不好确定, 默认查找当前div下 id 为img_div
						// 的div,将内容输出到当前div下,否则直接在div下直接输出
						var img_div=$(div).find("img_div");
						if(img_div||img_div.length<0){
							img_div=$("#img_div");
						}
						if (img_div.length > 0) {
							divcontext = "<div ><div class='from_tit clearfix' style='padding-bottom:0px;text-align:center'><h3 class=pull-left>附件上传</h3><div class=pull-right>"
									+ addButton
									+ "</div></div><ul class=list-inline id=img_list >";
							context = divcontext
									+ context
									+ lastcontext
									+ '<input name="imageUpLoad" value="yes" type="hidden">';
							img_div.append(context);
						} else {
							divcontext = "<div></div><div class='form-group' id='img_div_"+attachment[0].taskName.taskCode+"'><label class='col-sm-2 control-label'><i class='text-danger'></i> 附件上传 <span>"
									+ addButton
									+ "</span></label><div class='col-sm-8'><ul class='list-inline' id='img_list' >";
							context = divcontext
									+ context
									+ lastcontext
									+ '<input name="imageUpLoad" value="yes" type="hidden">';
							//这里可能会有问题
							div.find("form").find("div").eq(0).before(context);
						}
						// 循环绑定上传事件
						var files=$("[need]input:hidden");
						for (var i = 0; i < files.length; i++) {
							initFileUpLoad($(files[i]).attr("id"));
						}
						if (flag == true) {
							initAddImg(loan_Id,otherCode,otherName);
						}
					}
				}
			});
	// 图片信息,借款id,节点所属的div对象
	var initImage = function(info, loanId, ctx) {
		// 初始化一个图片 并绑定事件
		var name = info.attachmentName;
		var code = info.attachmentCode;
		var required = info.attachmentRequired;
		var unique = info.attachmentUnique;
		var num=info.attachmentNum;
		var require = "";
		// 生成一个input框
		// 生成一个input隐藏域
		// 生成一个img
		var danger = "";
		if (required == true) {
			danger = "<i class=text-danger>*</i>"
			require = "required"
		}
		debugger;
		if(num>1){
			for(var i=1 ;i<=num;i++){
				var newCode=code+i;
				var newName=name+i;
				var context = "<li><p>"
					+ danger
					+ newName
					+ "</p><a href=javascript:; class=file>选择文件<input id=up_"
					+ newCode
					+ " type=file class=form-control name=files[] data-url='/admin/file/upload/"
					+ loanId
					+ "/"
					+ newCode
					+ ".html'></a><p class=file_img><img id=img_"
					+ newCode
					+ "><input id="
					+ newCode
					+ " type=hidden name="
					+ newCode
					+ " need="
					+ required
					+ " title="
					+ newName
					+ "不能为空 "
					+ require
					+ "></p><div id="
					+ newCode
					+ "_progress><div class=bar style='width: 0%;'></div></div></li>";
				ctx=ctx+context;
			}
		}
		else{
			var context = "<li><p>"
				+ danger
				+ name
				+ "</p><a href=javascript:; class=file>选择文件<input id=up_"
				+ code
				+ " type=file class=form-control name=files[] data-url='/admin/file/upload/"
				+ loanId
				+ "/"
				+ code
				+ ".html'></a><p class=file_img><img id=img_"
				+ code
				+ "><input id="
				+ code
				+ " type=hidden name="
				+ code
				+ " need="
				+ required
				+ " title="
				+ name
				+ "不能为空 "
				+ require
				+ "></p><div id="
				+ code
				+ "_progress><div class=bar style='width: 0%;'></div></div></li>"
				ctx=ctx+context;
		}

		return ctx;
	}

	var initVideo = function(info, loanId, ctx) {
		var name = info.attachmentName;
		var code = info.attachmentCode;
		var required = info.attachmentRequired;
		var unique = info.attachmentUnique;
		var num=info.attachmentNum;
		var require = "";
		// 生成一个input框
		// 生成一个input隐藏域
		// 生成一个img
		var danger = "";
		if (required == true) {
			danger = "<i class=text-danger>*</i>"
			require = "required";
		}
		if(num>1){
			for(var i=1 ;i<=num;i++){
				var newCode=code+i;
				var newName=name+i;
				var context = "<li><p>"
					+ danger
					+ newName
					+ "</p><a href=javascript:; class=file>选择文件<input id=up_"
					+ newCode
					+ " type=file class=form-control name=files[] data-url='/admin/file/upload/"
					+ loanId
					+ "/"
					+ newCode
					+ ".html'></a><p class='file_img file_mvo'><span id="
					+ newCode
					+ "_span style='display: none;'> <i class='glyphicon glyphicon-file' style='font-size: 64px;'></i> <label class='file_name' id=img_"
					+ newCode
					+ " style='display: none;'></label><input id="
					+ newCode
					+ " type=hidden name="
					+ newCode
					+ " need="
					+ required
					+ " title="
					+ newName
					+ "不能为空 "
					+ require
					+ "></span></p><div id="
					+ newCode
					+ "_progress><div class=bar style='width: 0%;'></div></div></li>";
				ctx=ctx	+ context;
			}
			}
			else{
				// 绑定一个文件类型
				var context = "<li><p>"
						+ danger
						+ name
						+ "</p><a href=javascript:; class=file>选择文件<input id=up_"
						+ code
						+ " type=file class=form-control name=files[] data-url='/admin/file/upload/"
						+ loanId
						+ "/"
						+ code
						+ ".html'></a><p class='file_img file_mvo'><span id="
						+ code
						+ "_span style='display: none;'> <i class='glyphicon glyphicon-file' style='font-size: 64px;'></i> <label id=img_"
						+ code
						+ " style='display: none;' class='file_name'></label><input id="
						+ code
						+ " type=hidden name="
						+ code
						+ " need="
						+ required
						+ " title="
						+ name
						+ "不能为空 "
						+ require
						+ "></span></p><div id="
						+ code
						+ "_progress><div class=bar style='width: 0%;'></div></div></li>";
					ctx=ctx	+ context;
			}
	
	 	return ctx ;
	}
	var initRadio = function(info, loanId, ctx) {
		var name = info.attachmentName;
		var code = info.attachmentCode;
		var required = info.attachmentRequired;
		var unique = info.attachmentUnique;
		var num=info.attachmentNum;
		var require = "";
		// 生成一个input框
		// 生成一个input隐藏域
		// 生成一个img
		var danger = "";
		if (required == true) {
			danger = "<i class=text-danger>*</i>"
			require = "required";
		}
		if(num>1){
			for(var i=1 ;i<=num;i++){
				var newCode=code+i;
				var newName=name+i;
				// 绑定一个文件类型
				var context = "<li><p>"
						+ danger
						+ newName
						+ "</p><a href=javascript:; class=file>选择文件<input id=up_"
						+ newCode
						+ " type=file class=form-control name=files[] data-url='/admin/file/upload/"
						+ loanId
						+ "/"
						+ newCode
						+ ".html'></a><p class='file_img file_vid'><span id="
						+ newCode
						+ "_span style='display: none;'> <i class='glyphicon glyphicon-file' style='font-size: 64px;'></i> <label class='file_name' id=img_"
						+ newCode
						+ " style='display: none;'></label><input id="
						+ newCode
						+ " type=hidden name="
						+ newCode
						+ " need="
						+ required
						+ " title="
						+ newName
						+ "不能为空 "
						+ require
						+ "></span></p><div id="
						+ newCode
						+ "_progress><div class=bar style='width: 0%;'></div></div></li>";
				ctx= ctx + context;	
			}
			
		}
		else{
			// 绑定一个文件类型
			var context = "<li><p>"
					+ danger
					+ name
					+ "</p><a href=javascript:; class=file>选择文件<input id=up_"
					+ code
					+ " type=file class=form-control name=files[] data-url='/admin/file/upload/"
					+ loanId
					+ "/"
					+ code
					+ ".html'></a><p class='file_img file_vid'><span id="
					+ code
					+ "_span style='display: none;'> <i class='glyphicon glyphicon-file' style='font-size: 64px;'></i> <label id=img_"
					+ code
					+ " style='display: none;'></label><input id="
					+ code
					+ " type=hidden name="
					+ code
					+ " need="
					+ required
					+ " title="
					+ name
					+ "不能为空 "
					+ require
					+ "></span></p><div id="
					+ code
					+ "_progress><div class=bar style='width: 0%;'></div></div></li>";
			ctx= ctx + context;
		}
	
		return ctx;

	}
	// 初始化图片上传事件
	var initFileUpLoad = function(name) {
		(function(i) {
			$('#up_' + i).fileupload(
					{
						dataType : 'json',
						progressall : function(e, data) {
							$("#" + i).attr("enable", "false");
							var progress = parseInt(data.loaded / data.total
									* 100, 10);
							$('#' + i + '_progress .bar').css('width',
									progress + '%');
						},
						done : function(e, data) {
							// 这里将提交的input框进行控制
							imageUploadHandler(data, $('#img_' + i));
							$('#' + i + '_progress .bar').css('width',0);
						}
					});
			// 绑定清除事件
		})(name);
	}
	// 图片上传处理方法
	var imageUploadHandler = function(data, obj) {
		$.each(data.result, function(index, file) {
			if (file.code == "0000") {
				layer.msg("上传成功！");
				if ((file.fileName.indexOf(".mp3") > 0
						|| file.fileName.indexOf(".aac") > 0
						|| file.fileName.indexOf(".ape") > 0
						|| file.fileName.indexOf(".wma") > 0
						|| file.fileName.indexOf(".ac3") > 0
						|| file.fileName.indexOf(".amr") > 0
						|| file.fileName.indexOf(".flac") > 0
						|| file.fileName.indexOf(".m4r") > 0
						|| file.fileName.indexOf(".mmf") > 0
						|| file.fileName.indexOf(".mp2") > 0
						|| file.fileName.indexOf(".wav") > 0
						|| file.fileName.indexOf(".wv") > 0
						|| file.fileName.indexOf(".ogg") > 0
						|| file.fileName.indexOf(".avi") > 0
						|| file.fileName.indexOf(".mpeg") > 0
						|| file.fileName.indexOf(".mpg") > 0
						|| file.fileName.indexOf(".rmvb") > 0
						|| file.fileName.indexOf(".mov") > 0
						|| file.fileName.indexOf(".asf") > 0
						|| file.fileName.indexOf(".wmv") > 0
						|| file.fileName.indexOf(".mkv") > 0
						|| file.fileName.indexOf(".mp4") > 0
						|| file.fileName.indexOf(".m4v") > 0
						|| file.fileName.indexOf(".3gp") > 0
						|| file.fileName.indexOf(".flv") > 0 || file.fileName
						.indexOf(".f4v") > 0)) {
					$("#" + file.attachementType + "_span").show();
					$("#img_" + file.attachementType).show();
					$("#" + file.attachementType).html(file.fileName);
					$(obj).next("input").attr("value", file.showFilePath);
					$(obj).html(file.fileName);
					$("#" + file.attachementType).attr("enable", "true");
				}
				$(obj).attr("src", file.showSmallFilePath).show();
				// 修改input框
				$(obj).next("input").attr("value", file.showFilePath);
				$(obj).next("input").attr("enable", "true");
			} else {
				if (file.code == "9999") {
					layer.msg("不支持此类型的文件！");
					$(obj).next("input").attr("enable", "true");
				}
				$(obj).next("input").attr("enable", "true");
			}
		});
	}

	var initAddImg = function(id,type,name) {
		$("#add_img")
				.click(
						function() {
							debugger;
							var n = $("#img_list>li").length;
							$("#img_list")
									.append(
											'<li><p>'+name+'</p><div class="clearfix"><a href="javascript:;" class="file">选择文件<input id="up_img_WU_FILE_'
													+ n
													+ '" type="file" name="files[]" data-url="/admin/file/upload/'
													+ id
													+ '/'+type+'.html"></a><p class="file_img"><img id="imgShow_WU_FILE_'
													+ n
													+ '"  /><input id='+n+'_'+type+'  type=hidden name='+type+' need=false><a class="del_box"><i class="glyphicon glyphicon-trash"></i> </a></p></div><div id='
													+ n
													+ '_progress><div class=bar style="width: 0%;"></div></div></li>');
					
							$("#up_img_WU_FILE_" + n)
									.fileupload(
											{
												dataType : 'json',
												progressall : function(e, data) {
													$("#" + n+"_other").attr("enable", "false");
													var progress = parseInt(data.loaded / data.total
															* 100, 10);
													$('#' + n + '_progress .bar').css('width',
															progress + '%');
												},
												done : function(e, data) {
													imageUploadHandler(
															data,
															$("#imgShow_WU_FILE_"
																	+ n));
													$('#' + n + '_progress .bar').css('width',
															0);
												}
											});
						});
	}
});
// 附件验证
var attachmentValidate = function() {
	// 获取页面所有需要验证的input
	// 检查属性是否为空
	// 直接返回
	var obj = $("input[need=true]");
	for (var i = 0; i < obj.length; i++) {
		var item = $(obj[i]);
		if (item.val().length <= 0) {
			return item.attr("title");
		}
	}
	var obj2 = $("input[enable=false]");
	for (var i = 0; i < obj2.length; i++) {
		var item = $(obj2[i]);
		return "附件正在上传,请稍后";
	}
	return "";
}
