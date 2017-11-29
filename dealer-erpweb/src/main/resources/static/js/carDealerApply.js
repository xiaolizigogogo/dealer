var headquarters_audit=(function(){
	var _headquarters_audit={};
	_headquarters_audit.init=function(){
		var html='<div class="from_tit clearfix"><h3 class="pull-left">风控评估</h3></div><div class="from_con clearfix"><dl class="dl-horizontal col-sm-4"><dt><i class="text-danger">*</i> 商家规模</dt><dd><select class="form-control" name="scale"><option>大型</option><option>中型</option><option>小型</option></select></dd></dl><dl class="dl-horizontal col-sm-4"><dt><i class="text-danger">*</i>&nbsp;是否通过</dt><dd><select class="form-control pull-left" name="reviewstatus"><option value="1">是</option><option value="0">否</option></select></dd></dl></div><div class="from_con clearfix"><dl class="dl-horizontal col-sm-4"><dt><i class="text-danger">*</i>'
			+'额度比例</dt><dd><div class="input_group" style="max-width:120px"><input maxlength="8" style="width:100%" name="limitpercentage" class="form-control valid" value="60" type="text"> <span class="danwei">%</span></div></dd></dl><dl class="dl-horizontal col-sm-4"><dt><i class="text-danger">*</i>&nbsp;月利率</dt><dd><div class="input_group" style="max-width:120px"><input maxlength="8" style="width:100%" name="monthlyinterest" class="form-control valid" value="0.68" type="text"> <span class="danwei">%</span></div></dd></dl><dl class="dl-horizontal col-sm-4"><dt><i class="text-danger">*</i>&nbsp;备注</dt><dd><input type="text" name="remark" class="form-control"></dd></dl></div>';
		$("#div_headquarters_audit").show();
		$("#div_headquarters_audit").html(html);
	}
	return _headquarters_audit;
})(jQuery,headquarters_audit);






var CarDealerLoan=(function(){

	var carDealerLoanInfo={};

	var processBar=[{"key":"first_trial","name":"初审"},
		{"key":"evaluate_install_collateral","name":"评估"},
		{"key":"review_evaluate","name":"审核评估"},
		{"key":"review_install_collateral","name":"审核押品"},
		{"key":"judgment","name":"终审"},
		{"key":"sign_contract","name":"签订借款合同"}];

	var _carDealerLoan={};

	_carDealerLoan.carEvaluateInfo= function (id,obj){
		$.ajax({
			url:"/admin/order/carEvaluateInfo?indent_uuid="+id,
			type:"get",
			success:function(data){
				debugger;
				var list=$(".text-value");
				$(list).each(function(key,value){
					var key= $(value).attr("data-key");
					if(key == 'miles'){
						$(value).html(data[key]+"公里");
					}else {
						$(value).html(data[key]);
					}
				})
				var hrefs=$(".href-value");

				//初始化obd和rfid按钮
				$(hrefs).each(function(key,value){
					var key= $(value).attr("data-key");
					if(data[key]!=null&&data[key].length>0){
						$(value).attr("href",data[key]);
					}
					else{
						$(value).attr("onclick","alert('暂无数据');return false");
					}
				});
				
				var booleans=$(".boolean-value");
				
				
				$(booleans).each(function(key,value){
					var key= $(value).attr("data-key");
					if(data[key]!=null&&data[key].length>0){
						if(data[key]==1){
							$(value).html("是");
						}
						else{
							$(value).html("否");
						}
						
					}
				});
				
				
				_carDealerLoan.plateNumber=data.plateNumber;
				_carDealerLoan.convertImg();
				var imgs=$("img");
				$(imgs).each(function(key,value){
					var url= $(value).attr("src");
					if(url!=null&&url.indexOf(".pdf")>-1){
						$(value).click(function(){
							window.open(url);
						});
						$(value).attr("src","/img/uton.png");
					}					else if($(value).attr("src")=="/img/audio.jpg"){
						
					}else{
						if($(value).parents().closest("li").length>0){
							$(value).parents().closest("li").addClass("dowebok");
							$(value).viewer({
								url: 'data-original',
							});
						}
						
					}

				})


			}
		});
	}
    _carDealerLoan.finalPosition=function () {
		var param={};
		param["plateNumber"]=_carDealerLoan.plateNumber;
        param["indentId"]=$("#indent_uuid").val();
        $.ajax({
            type: 'post',
            url: "/admin/supervise/getFinalPosition",
            timeout: 150000,
            data: JSON.stringify(param),
            contentType: "application/json",
            dataType: "json",
            beforeSend: function () {
                load = layer.load();
            },
            success: function (data) {
            	debugger;
            	if(data.lastLocation==null){
            		 alert("暂无数据");
            		 layer.close(load);
            		 return;
            	}
                layer.close(load);
                _carDealerLoan.baiduMap(data.lastLocation.longitude,data.lastLocation.latitude);
            }
        });
    }
    _carDealerLoan.baiduMap=function (longitude,latitude) {
        layer.open({
            type: 2,
            area: ['700px', '338px'],
            fix: true,
            title: '百度地图',
            maxmin: true,
            content: '/admin/page/merchant/supervise/baiduMap?longitude=' + longitude +'&latitude='+latitude
        });
    }

    var data = {
    		"data":[
    			{"order":0,"name":"申请贷款","code":"start"},
    			{"order":1,"name":"初审","code":"first_trial"},
    			{"order":2,"name":"线下评估及安装押品","code":"evaluate_install_collateral"},
    			{"order":3,"name":"风控审核车辆评估","code":"review_evaluate"},
    			{"order":4,"name":"风控审核押品押品监管","code":"review_install_collateral"},
    			{"order":5,"name":"终审","code":"judgment"},
    			{"order":6,"name":"分配线下人员签订合同","code":"distribution_user_sign_contract"},
    			{"order":7,"name":"签订合同","code":"sign_contract"},
    			{"order":8,"name":"放款","code":"lended"}
    			]
    };
    
	_carDealerLoan._initProcessBar=function(code,obj){
		
			var node="";
	
	        for(var i=0;i<data.data.length;i++){
	            if(data.data[i].code == code){
	                node = data.data[i].order;
	                break;
	            }
	        };
		
	        var html="";
	        $.each(data.data, function(i, item){
	            if(i == 0){
	                if(i < node){
	                    html += '<li class="step-start step-done">'
	                }else {
	                    html += '<li class="step-start">'
	                }
	                html += '<div class="ui-step-line"></div><div class="ui-step-cont"><span class="ui-step-cont-number" id="'+item.code+'">√</span> <span class="ui-step-cont-text">'+item.name+'</span></div></li>';
	            }else if (i+1 == data.data.length){
	                if(i < node){
	                    html += '<li class="step-end step-done">'
	                }else {
	                    html += '<li class="step-end">'
	                }
	                html += '<div class="ui-step-line"></div><div class="ui-step-cont"><span class="ui-step-cont-number" id="'+item.code+'">'+item.order+'</span> <span class="ui-step-cont-text">'+item.name+'</span></div></li>';
	            }else {
	                if(i < node){
	                    html += '<li class="step-done">'
	                }else {
	                    html += '<li>'
	                }
	                html += '<div class="ui-step-line"></div><div class="ui-step-cont"><span class="ui-step-cont-number" id="'+item.code+'">'+item.order+'</span><span class="ui-step-cont-text">'+item.name+'</span></div></li>';
	            }

	        });
		$(obj).html(html);
	}

	_carDealerLoan.carContracatFile = function () {
		debugger;
		if(window.tradingUrlList.length <= 0){
			layer.msg("未签订收车合同");
			return;
		}
		var url = "";
		if(window.tradingUrlList.length == 1){
			url = window.tradingUrlList;
		}else{
			url = "/admin/page/merchant/order/order_file.jsp"
		}
		layer.open({
			type: 2,
			title: "Order File Pics",
			shadeClose: true,
			shade: false,
			maxmin: true, //开启最大化最小化按钮
			area: ['893px', '600px'],
			content: url
		});
	}
	//绑定
	_carDealerLoan.bindCarContracatFile=function (id,contractAndPic,vehicleTradingContractPic) {
		debugger;
		$('[data-toggle="tooltip"]').tooltip();
			var list=new Array();
		for(var co in contractAndPic){
		
			if(contractAndPic[co].fileName=="收车合同"){
				var item=contractAndPic[co].fileUrl;
				list.push(item);
			}
			
		}
		window.tradingUrlList =list;
		window.contractAndPic= vehicleTradingContractPic;
		$(id).click(_carDealerLoan.carContracatFile);
	}
	//将合同修改为默认图片
	_carDealerLoan.convertPdfUrl=function(){
		_carDealerLoan.convertImg();
		var imgs=$("img");
		$(imgs).each(function(key,value){
			var url= $(value).attr("src");
			if(url!=null&&url.indexOf(".pdf")>-1){
				$(value).unbind("click");
				$(value).click(function(){
					window.open(url);
				});
				$(value).attr("src","/img/uton.png");
			}					else if($(value).attr("src")=="/img/audio.jpg"){
						
					}
			else{
				if($(value).parents().closest("li").length>0){
				$(value).parents().closest("li").addClass("dowebok");
				$(value).viewer({
					url: 'data-original',
				});
			}
			
		}

		})

	}
	_carDealerLoan.convertImg=function(){
		$('.dowebok').each(function(){
			$(this).viewer({
				url: 'data-original',
			});
		})
	}

	_carDealerLoan.renderRepaymentInfo =function(id){
		$.ajax({
			url: "/admin/order/getRepayPlanInfo?orderId=" + id,
			type: "get",
			success: function (data) {
				debugger;
				var list = $(".text-value");
				$(list).each(function (key, value) {
					var key = $(value).attr("data-key");
					$(value).html(data[key]);
				})
				if(data.outAccountVoucher != null && data.outAccountVoucher != "" ){
					$("#outAccountVoucher_ul").show();
					$("#outAccountVoucher").attr("src",data.outAccountVoucher);
				}
			}
		});
	}
	return _carDealerLoan;
})(jQuery,CarDealerLoan);

function chkFile(data){
	debugger;
	var url = "";
	if(data=="video"){
		//url = window.videoUrl;
		url = "/admin/page/merchant/order/order_video.jsp";
	}else if(data=="contract"){
		url = window.contractUrl;
	}else{
		url = "/admin/page/merchant/order/order_file.jsp"
	}

	layer.open({
		type: 2,
		title: data,
		shadeClose: true,
		shade: false,
		maxmin: true, //开启最大化最小化按钮
		area: ['893px', '600px'],
		content: url
	});
}