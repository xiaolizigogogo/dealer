//页面初始化
	$(function() {

		/*var customer_id_hiddenstr = $("#customer_id_hidden").val();
		var strarray = customer_id_hiddenstr.split(":");
		var customer_id_hidden = strarray[0];
		var orderid = strarray[1];
		var taskId = strarray[2];
		var businesskey = strarray[3];
		var activityId = strarray[4];
		var repaymentUuid = strarray[5];
		var customerId = strarray[6];
		var assignee = strarray[7]*/
		var customer_id_hidden = $("#customer_id_hidden").val().split(':')[0];
		var loanDetailsAll = map.get(customer_id_hidden);
			$.ajax({
					url : "/admin/customer/loanerDetailInfo?uuid=" + loanDetailsAll.customerId,
					type : "get",
					dataType : "json",
					success : function(data) {
						var education = data.customerRegisterInfo.education;
						var education1;
						var house = data.customerRegisterInfo.house;
						var house1;
						var maritalStatus = data.customerRegisterInfo.maritalStatus;
						var maritalStatus1;
						var enterpriseType = data.customerAdditionalInfo.enterpriseType;
						var enterpriseType1;
						var position = data.customerAdditionalInfo.position;
						var position1;
						var hasHouse = data.customerAdditionalInfo.hasHouse;
						var hasHouse1;
						var dateJoined1 = data.customerAdditionalInfo.dateJoined;
						var enterpriseIndustry=data.customerAdditionalInfo.enterpriseIndustry;
						var enterpriseIndustry1;

						uuid=data.customerRegisterInfo.uuid;

						if (education == "undergraduate") {
							education1 = "本科"
						} else if (education == "college") {
							education1 = "大专"
						} else if (education == "doctor") {
							education1 = "博士及以上"
						} else if (education == "master") {
							education1 = "硕士"
						} else if (education == "senior") {
							education1 = "高中及中专"
						} else {
							education1 = "初中及以下"
						}
						if (house == "commodity") {
							house1 = "商品房无按揭"
						} else if (house == "commodity_mortgage") {
							house1 = "商品房无按揭"
						} else if (house == "commodity_mortgage") {
							house1 = "商品房有按揭"
						} else if (house == "bought_public") {
							house1 = "已购公房"
						} else if (house == "self_build") {
							house1 = "自建房"
						} else if (house == "rent") {
							house1 = "租用"
						} else {
							house1 = "亲属住房"
						}
						if (maritalStatus == "WH") {
							maritalStatus1 = "未婚"
						} else if (maritalStatus == "YH") {
							maritalStatus1 = "已婚"
						} else if (maritalStatus == "LY") {
							maritalStatus1 = "离异"
						} else if (maritalStatus == "SR") {
							maritalStatus1 = "丧偶"
						} else {
							maritalStatus1 = "再婚"
						}
						if (enterpriseType == "institutions") {
							enterpriseType1 = "机关事业单位"
						} else if (enterpriseType == "government") {
							enterpriseType1 = "国有企业"
						} else if (enterpriseType == "three_funded") {
							enterpriseType1 = "三资企业"
						} else if (enterpriseType == "private") {
							enterpriseType1 = "私营"
						} else if (enterpriseType == "professional") {
							enterpriseType1 = "自由职业者"
						} else if (enterpriseType == "social_organization") {
							enterpriseType1 = "社会团体"
						} else {
							enterpriseType1 = "其他"
						}
						if (position == "chairman") {
							position1 = "董事长"
						} else if (position == "director") {
							position1 = "董事"
						} else if (position == "manager") {
							position1 = "总经理"
						} else if (position == "executives") {
							position1 = "单位高管"
						} else if (position == "department_manage") {
							position1 = "部门主管"
						} else {
							position1 = "普通职员"
						}
						if (hasHouse) {
							hasHouse1 = "有"
						} else {
							hasHouse1 = "无"
						}
						if(enterpriseIndustry=="1"){
							enterpriseIndustry1="计算机/互联网/通信/电子";
							}else if(enterpriseIndustry=="2"){
							enterpriseIndustry1="会计/金融/银行/保险";
							}else if(enterpriseIndustry=="3"){
							enterpriseIndustry1="贸易/消费/制造/营运";
							}else if(enterpriseIndustry=="4"){
							enterpriseIndustry1="制药/医疗";
							}else if(enterpriseIndustry=="5"){
							enterpriseIndustry1="广告/媒体";
							}else if(enterpriseIndustry=="6"){
							enterpriseIndustry1="房地产/建筑";
							}else if(enterpriseIndustry=="7"){
							enterpriseIndustry1="专业服务/教育/培训";
							}else if(enterpriseIndustry=="8"){
							enterpriseIndustry1="服务业";
							}else if(enterpriseIndustry=="9"){
							enterpriseIndustry1="物流/运输";
							}else if(enterpriseIndustry=="a"){
							enterpriseIndustry1="能源/原材料";
							}else if(enterpriseIndustry=="b"){
							enterpriseIndustry1="私营企业主";
							}else if(enterpriseIndustry=="c"){
							enterpriseIndustry1="政府/非赢利机构/其他";
							}

                        $("#uuid").html(uuid);
						$("#customerName1").html(
								data.customerRegisterInfo.customerName);
						$("#idCard").html(data.customerRegisterInfo.idCard);
						
						$("#Identityinformation").html(data.customerRegisterInfo.customerName+data.customerRegisterInfo.idCard);
						$("#mobile").html(data.customerRegisterInfo.mobile);
						$("#education").html(education1);
						$("#house").html(house1);
						$("#maritalStatus").html(maritalStatus1);
						$("#liveNumber1").html(
								data.customerRegisterInfo.liveNumber);

						$("#liveAddress").html(
								data.customerRegisterInfo.liveAddress);
						$("#enterpriseName").html(
								data.customerAdditionalInfo.enterpriseName);
						$("#enterpriseIndustry").html(
								enterpriseIndustry1);
						$("#enterpriseTel").html(
								data.customerAdditionalInfo.enterpriseTel);
						$("#enterpriseType").html(enterpriseType1);
						$("#position").html(position1);

						$("#enterpriseAddress").html(
								data.customerAdditionalInfo.enterpriseAddress);

						$("#hasHouse1").html(hasHouse1);
						$("#income").html(data.customerAdditionalInfo.income);
						$("#company-name").html(
								data.customerRegisterInfo.company.name);
						$("#dept-name").html(
								data.customerRegisterInfo.dept.name);
						$("#user-realname").html(
								data.customerRegisterInfo.user.realname);
						$("#creditCardNum").html(
								data.customerRegisterInfo.creditCardNum);
						$("#creditCardQuota").html(
								data.customerRegisterInfo.creditCardQuota);
						$("#creditCardBankName").html(
								data.customerRegisterInfo.creditCardBankName);
						$("#creditCard").html(
								data.customerRegisterInfo.creditCard);
						$("#remark").html(data.customerRegisterInfo.remark);

						$("#sex").html(data.customerRegisterInfo.sex=='M'?'男':'女');
						$("#age").html(data.customerRegisterInfo.age);
						var customer_from;
						switch(data.customerAdditionalInfo.customer_from)
						{
						case 0:
							customer_from="中  介";
							break;
						case 1:
							customer_from="客户推荐";
							break;
						case 2:
							customer_from="宣传单/卡";
							break;
						case 3:
							customer_from="小区推广";
							break;
						case 4:
							customer_from="短  信";
							break;
						case 5:
							customer_from="网络营销";
							break;
						case 6:
							customer_from="电  销";
							break;
						case 7:
							customer_from="其  他";
							break;
						}
						$("#customerFrom").html(customer_from);
						$("#homeTel").html(data.customerRegisterInfo.home_tel);
						$("#kosekiAddress").html(data.customerRegisterInfo.kosekiAddress);
						
						$("#residence_period").html(data.customerRegisterInfo.residence_period+"年");
						
						$("#number_of_children").html(data.customerRegisterInfo.number_of_children);
						
						var cohabitant="";
						switch(data.customerRegisterInfo.cohabitant)
						{
						case 0:
							cohabitant="父母";
							break;
						case 1:
							cohabitant="子女";
							break;
						case 2:
							cohabitant="配偶";
							break;
						case 3:
							cohabitant="其他";
							break;
						}
						$("#cohabitant").html("与"+cohabitant+"共住");
						
						var house = "";
						switch(data.customerRegisterInfo.house)
						{
						case "commodity":
							house="自建";
							break;
						case "commodity_mortgage":
							house="自购";
							break;
						case "kinsfolk":
							house="亲属住房";
							break;
						case "dormitory":
							house="单位住房";
							break;
						case "rent":
							house="租用"+"（月租金"+data.customerRegisterInfo.room_charge +"元）";
							break;							
						}
						
						$("#house").html(house);
						
						$("#status_of_children").html(data.customerRegisterInfo.status_of_children);
						
						$("#residence_period_current").html(data.customerRegisterInfo.residence_period_current+"年");
						
						
						var enterpriseIndustry="";
						switch(data.customerAdditionalInfo.enterpriseIndustry)
						{
						case "1":
							enterpriseIndustry="个体";
							break;
						case "2":
							enterpriseIndustry="个人独资/合伙企业";
							break;
						case "3":
							enterpriseIndustry="有限责任公司";
							break;
						case "4":
							enterpriseIndustry="国企、事业单位";
							break;
						case "5":
							enterpriseIndustry="法人";
							break;
						}
						if(data.customerAdditionalInfo.shareholding_ratio!="")
						{
							enterpriseIndustry+="(持股"+data.customerAdditionalInfo.shareholding_ratio+"%)";
						}
												
						$("#enterpriseIndustry").html(enterpriseIndustry);
										
						$("#deptName").html(data.customerAdditionalInfo.deptName);
						
						$("#has_social_security_cards").html(data.customerAdditionalInfo.has_social_security_cards==1?"有":"无");
						
						$("#dateJoined").html(data.customerAdditionalInfo.dateJoined.substring(0,10));
						
						$("#ismanufacturing").html(data.customerAdditionalInfo.ismanufacturing==1?"是":"否");
						
						var companyType="";
						switch(data.customerAdditionalInfo.companyType)
						{
						case "no":
							companyType="无";
							break;
						case "individual_businesses":
							companyType="个体商户";
							break;
						case "ltd":
							companyType="有限公司";
							break;
						}
						
						$("#companyType").html(companyType);
						
						$("#companyRegisterAt").html(data.customerAdditionalInfo.companyRegisterAt.substring(0,10));
						
						$("#has_businesslicence").html(data.customerAdditionalInfo.has_businesslicence==1?"有":"无");
						
						$("#employees_number").html(data.customerAdditionalInfo.employees_number);
						
						$("#business_hours").html(data.customerAdditionalInfo.business_hours.substring(0,10));
						
						$("#business").html(data.customerAdditionalInfo.business);
						
						$("#incomeStatement").html(data.customerAdditionalInfo.incomeStatement);
						
						$("#house_number").html(data.customerAdditionalInfo.house_number);
						
						$("#house_buy_date").html(data.customerAdditionalInfo.house_buy_date.substring(0,10));
						
						$("#house_addr").html(data.customerAdditionalInfo.house_addr);
						
						$("#car_license_plate").html(data.customerAdditionalInfo.car_license_plate);
						
						$("#car_brand").html(data.customerAdditionalInfo.car_brand);
						
						$("#house_buy_price").html(data.customerAdditionalInfo.house_buy_price+"万元");
						
						$("#car_buy_date").html(data.customerAdditionalInfo.car_buy_date.substring(0,10));
						
						$("#bare_car_price").html(data.customerAdditionalInfo.bare_car_price+"万元");
						
						$("#family_car_number").html(data.customerAdditionalInfo.family_car_number);
						
						var house_ownership="";
						switch(data.customerAdditionalInfo.house_ownership)
						{
						case 0:
							house_ownership="本人名下";
							break;
						case 1:
							house_ownership="配偶或父母名下";
							break;
						case 2:
							house_ownership="自建房";
							break;
						case 3:
							house_ownership="其他";
							break;
						}
						$("#house_ownership").html(house_ownership);
						
						$("#house_buy_way").html(data.customerAdditionalInfo.house_buy_way=="0"?"一次性":"按揭(月供"+data.customerAdditionalInfo.house_monthly_mortgage_payment+"元)");
						
						$("#car_buy_way").html(data.customerAdditionalInfo.car_buy_way=="0"?"一次性":"按揭(月供"+data.customerAdditionalInfo.car_monthly_mortgage_payment+"元)");
						
						$("#insurance_type").html(data.customerAdditionalInfo.insurance_type);

						$.get(
								"/admin/customer/queryContactsCusId.html?uuid="+uuid,
								function(result) {
									$(result).each(
											function(i) {
												if (result[i].relation == "配偶") {
													$("#spouse_id").val(result[i].id);
													$("#spouse_name").html(
															result[i].contactsName);
													$("#spouse_tel").html(
															result[i].contactsTel);
													$("#spouse_mobile").html(
															result[i].contactsMobile)
													$("#spouse_ck").attr("checked",result[i].know);
												}
												if (result[i].contactsTel == "直系亲属1") {
													$("#immediate_id1").val(
															result[i].id);
													$("#immediate_name1").html(
															result[i].contactsName);
													$("#immediate_relation1").html(
															result[i].relation);
													$("#immediate_Mobile1").html(
															result[i].contactsMobile);
													$("#immediate_ck1").attr("checked",result[i].know);
												}
												if (result[i].contactsTel == "直系亲属2") {
													$("#immediate_id2").val(
															result[i].id);
													$("#immediate_name2").html(
															result[i].contactsName);
													$("#immediate_relation2").html(
															result[i].relation);
													$("#immediate_Mobile2").html(
															result[i].contactsMobile);
													$("#immediate_ck2").attr("checked",result[i].know);
												}
												if (result[i].contactsTel == "其他联系人1") {
													$("#other_id1").val(result[i].id);
													$("#other_name1").html(
															result[i].contactsName);
													$("#other_relation1").html(
															result[i].relation);
													$("#other_mobile1").html(
															result[i].contactsMobile);
													$("#other_ck1").attr("checked",result[i].know);
												}
												if (result[i].contactsTel == "其他联系人2") {
													$("#other_id2").val(result[i].id);
													$("#other_name2").html(
															result[i].contactsName);
													$("#other_relation2").html(
															result[i].relation);
													$("#other_mobile2").html(
															result[i].contactsMobile);
													$("#other_ck2").attr("checked",result[i].know);
												}
											});
								})
					}
				});
	})