// JavaScript Document
    function opendiv(m){
		var modal=$("#"+m+"");
		modal.css("display","block");
        $("#fade2").css("display","block");
        //parent.document.getElementById('fade1').style.display='block';
	    $("#fade1").hide();
		window.document.documentElement.style.overflow = "hidden";
		
    }
    //关闭模态框
    function colsediv(oid){
	    debugger;
    	 if("0" != oid){
    		 $("#"+oid).css("display","none");
    	 }else{
    		 $(".modal").css("display","none");
             $("#fade2").css("display","none");
             //parent.document.getElementById('fade1').style.display='none';
		     $("#fade1").hide();
		     //$("#layui-layer1").css("display","none");
		     //$("#layui-layer-shade1").css("display","none");
		     $("#layui-layer1").remove();
		     $("#layui-layer-shade1").remove();
		     window.location.reload();
    	 }
			 
	     window.document.documentElement.style.overflow = "scroll";
		  }
	//控制ifream滚动条
	function changeHeight(){
var main = $(window.parent.document).find("iframe");
	//alert();
main.height($("html").height());

	}
    
    //点击TR变底色
    function setEditCustomer(obj){
    	$("#record").find("tr").find("td").removeClass("tr_back");
    	$(obj).find("td").addClass("tr_back");
    	$("#edit_customer_id").val($(obj).attr("id"));
    }
    
    /**
     * 弹出提示框 共通JS
     * @param _message 提示文字
     * @param _function 点击确定方法,传null则为关闭提示框方法
	 * @param _cancel 点击取消，传方法
     */
    function alertMessage(_message,_function,show_box,_cancel){
		debugger;
		var cancel = arguments[3] ? arguments[3] : null;//设置参数a的默认值为1
		/*$("#alert_message").html(_message);
		if(null != _function){
			$("#ok_button").attr("onclick",_function);
		}else{
			$("#ok_button").attr("onclick","colsediv(0)");
		}
		if(null != show_box && "" != show_box){
			opendiv(show_box);
		}else{
			opendiv('qs_box');
		}*/
		//var index = layer.getFrameIndex(window.name);
		layer.confirm(_message, {
			btn: ['确认','取消'] //按钮
		}, function(){
			eval(_function);
			//layer.close(index);
		}, function(){
			if(cancel){
				eval(cancel);
			}
		});
	}
    
    /**
     * 修改标签文字JSparent.
     * @param _url 跳转目标链接  //如果页面不跳转则url 传null
     * @param _title 标题名字
     */
    function editTitle(_url,_title){
    	var hoverli = $("#biaoqian_div", parent.document).find("li.hover");
    	$(hoverli).eq(0).html(_title + "<a href='javascript:;'>关闭</a>");
    	if(null != _url){
    		window.location = _url;
    	}
    }
