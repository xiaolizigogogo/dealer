package com.utonw.dealer.api.enums.erp;

/**
 * 附件种类
 * 
 * @author jml AttachmentEnum.java 2016年9月26日
 */
public enum AttachmentEnum implements EnumBase {

	idCardType("身份证", AttachmentTypeEnum.USER_INFO, true,true,new String[]{"0003","0004"}),

	verification("居住证", AttachmentTypeEnum.USER_INFO, false,true,new String[]{"0003","0004"}),

	vehicleLicense("车辆行驶证", AttachmentTypeEnum.CAR_INFO, true,true,new String[]{"0003","0004"}),

	registrationCertificateOne("机动车证书一", AttachmentTypeEnum.CAR_INFO, false,true,new String[]{"0003","0004"}),

	registrationCertificateTwo("机动车登记证书二", AttachmentTypeEnum.CAR_INFO, false,true,new String[]{"0003","0004"}),

	insurancePolicy("交通强制保险单", AttachmentTypeEnum.CAR_INFO, false,true,new String[]{"0003","0004"}),

	businessInsurancePolicy("商业保险单", AttachmentTypeEnum.CAR_INFO, false,true,new String[]{"0003","0004"}),

	falseKey("车辆备用钥匙", AttachmentTypeEnum.CAR_INFO, false,true,new String[]{"0003","0004"}),

	fahrzeugbeschaffung("车辆购置税完税证明", AttachmentTypeEnum.CAR_INFO, false,true,new String[]{"0003","0004"}),

	trialPhaseReview("面审视频截图", AttachmentTypeEnum.USER_INFO, false,true,new String[]{"0003","0004"}),

	visiteCheckReview("家访相片", AttachmentTypeEnum.USER_INFO, true,true,new String[]{"0003","0004"}),

	signContractReview("相关合同附件", AttachmentTypeEnum.CONTRACT_INFO, false,true,new String[]{"0003","0004"}),

	lendedReview("出账凭证", AttachmentTypeEnum.CONTRACT_INFO, true,true,new String[]{"0003","0004"}),

	oneCarPhoto("人车合照", AttachmentTypeEnum.CONTRACT_INFO, true,true,new String[]{"0003","0004"}),

	personPhoto("身份证照", AttachmentTypeEnum.USER_INFO, true,true,new String[]{"0003","0004"}),

	telephoneRecordings("电话录音", AttachmentTypeEnum.VIEDO_INFO, false,true,new String[]{"0003","0004"}),

	//spareKey("备用钥匙", AttachmentTypeEnum.CAR_INFO, false,true,new String[]{"0003","0004"}),

	repaymentUploadProof("还款凭证", AttachmentTypeEnum.AFTER_LOAN, false,false,new String[]{"0003","0004"}),

	continueUpload("续借合同", AttachmentTypeEnum.AFTER_LOAN, true,false,new String[]{"0003","0004"}),

	ownerVehicleRepayment("已拖车还款", AttachmentTypeEnum.AFTER_LOAN, false,true,new String[]{"0003","0004"}),

	litigation("诉讼截图", AttachmentTypeEnum.USER_INFO, false,true,new String[]{"0003","0004"}),

	Illegal("违法信息截图", AttachmentTypeEnum.USER_INFO, false,true,new String[]{"0003","0004"}),

	idCardBack("身份证背面", AttachmentTypeEnum.USER_INFO, true,true,new String[]{"0003","0004"}),

	heWarrants("他项权证", AttachmentTypeEnum.USER_INFO, false,true,new String[]{"0003"}),

	businessInformation("工商信息截图", AttachmentTypeEnum.USER_INFO, false,true,new String[]{"0003","0004"}),

	loanContractOne("借款合同一", AttachmentTypeEnum.CONTRACT_INFO, false,true,new String[]{"0003"}),

	loanContractTwo("借款合同二", AttachmentTypeEnum.CONTRACT_INFO, false,true,new String[]{"0003"}),

	mortgageContractOne("抵押合同一", AttachmentTypeEnum.CONTRACT_INFO, false,true,new String[]{"0003"}),

	mortgageContractTwo("抵押合同二", AttachmentTypeEnum.CONTRACT_INFO, false,true,new String[]{"0003"}),

	pledgeContract("质押合同一", AttachmentTypeEnum.CONTRACT_INFO, false,true,new String[]{"0003"}),

	pledgeContractTwo("质押合同二", AttachmentTypeEnum.CONTRACT_INFO, false,true,new String[]{"0003"}),

	loanReceipt("借款收据", AttachmentTypeEnum.CONTRACT_INFO, true,true,new String[]{"0003"}),

	vehiclStatusOne("车辆状态一", AttachmentTypeEnum.CAR_INFO, false,true,new String[]{"0003"}),

	vehiclStatusTwo("车辆状态二", AttachmentTypeEnum.CAR_INFO, false,true,new String[]{"0003"}),

	vehiclStatusThree("车辆状态三", AttachmentTypeEnum.CAR_INFO, false,true,new String[]{"0003"}),

	vehiclStatusFour("车辆状态四", AttachmentTypeEnum.CAR_INFO, false,true,new String[]{"0003"}),

	signTheContract("面签截图", AttachmentTypeEnum.CONTRACT_INFO, false,true,new String[]{"0003"}),

	gpsInstall("GPS安装截图", AttachmentTypeEnum.CONTRACT_INFO, false,true,new String[]{"0003"}),

	locationSuccess("定位成功截图", AttachmentTypeEnum.CONTRACT_INFO, false,true,new String[]{"0003"}),

	vehicleDriveCard("车辆驾驶证", AttachmentTypeEnum.CAR_INFO, false,true,new String[]{"0003","0004"}),

	lockPosition("暗锁位置", AttachmentTypeEnum.CAR_INFO, false,true,new String[]{"0003"}),

	pledgeVehicleConsultArchives("质押车查档", AttachmentTypeEnum.CAR_INFO, false,true,new String[]{"0003","0004"}),

	mortgageReview("车辆抵押凭证", AttachmentTypeEnum.CAR_INFO, false,true,new String[]{"0003","0004"}),

	loanContractEle("再贷电子合同", AttachmentTypeEnum.CONTRACT_INFO, false,true,new String[]{"0003"}),

	reloan_lended("再贷公司出账凭证", AttachmentTypeEnum.CONTRACT_INFO, false,true,new String[]{"0003"}),

	loanContractEle_Help("助贷电子合同", AttachmentTypeEnum.CONTRACT_INFO, false,true,new String[]{"0003"}),

	helploan_lended("助贷公司出账凭证", AttachmentTypeEnum.CONTRACT_INFO, false,true,new String[]{"0003"}),
	
	company_repaymentUploadProof("公司还款凭证",AttachmentTypeEnum.CONTRACT_INFO,false,false,new String[]{"0003"}),
	
	reviewUpload("还款评审截图" ,AttachmentTypeEnum.AFTER_LOAN, false,false,new String[]{"0003","0004"}),
	
	entrustVideo("委托视频",AttachmentTypeEnum.AUDIO_INFO,false,true,new String[]{"0003","0004"}),
	
	repaymentUploadProof_revmoney("还款凭证",AttachmentTypeEnum.AFTER_LOAN,false,false,new String[]{"0003","0004"}),
	
	other("其它", AttachmentTypeEnum.CAR_INFO, false, true, new String[]{"0003","0004"}),
	
	instockPic("入库照片", AttachmentTypeEnum.INSTOCK_INFO,false,true,new String[]{"0003","0004"}),

	parkingPic("停车位照片", AttachmentTypeEnum.INSTOCK_INFO,false,true,new String[]{"0003","0004"}),
	
	vehiclStatusOther("其它",AttachmentTypeEnum.CAR_INFO,false,true, new String[]{"0003","0004"}),

	storekeeperWithVehicle("库管员与车合照", AttachmentTypeEnum.INSTOCK_INFO,false,true,new String[]{"0003","0004"}),
	
	/**--------------------------特殊公司附件*/
	gjr_id_card_face("共借人身份证正面",AttachmentTypeEnum.USER_INFO, false,true,new String[]{"0003","0004"}),
	gjr_id_card_back("共借人身份证背面",AttachmentTypeEnum.USER_INFO, false,true,new String[]{"0003","0004"}),
	xsz_annual_page("行驶证年审页",AttachmentTypeEnum.USER_INFO, false,true,new String[]{"0003","0004"}),
	marriage_family("结婚证或户口本",AttachmentTypeEnum.USER_INFO, false,true,new String[]{"0003","0004"}),
	applications("申请表",AttachmentTypeEnum.USER_INFO, false,true,new String[]{"0003","0004"}),
	service_password("服务密码",AttachmentTypeEnum.USER_INFO, false,true,new String[]{"0003","0004"}),
	credit_authorization("征信授权书",AttachmentTypeEnum.USER_INFO, false,true,new String[]{"0003","0004"}),
	gjr_credit_authorization("共借人征信授权书",AttachmentTypeEnum.USER_INFO, false,true,new String[]{"0003","0004"}),
	mian_qian1("反欺诈风险表",AttachmentTypeEnum.USER_INFO, false,true,new String[]{"0003","0004"}),
	mian_qian2("反欺诈风险表面签照",AttachmentTypeEnum.USER_INFO, false,true,new String[]{"0003","0004"}),
	three_choose_one("四选一条件",AttachmentTypeEnum.USER_INFO, false,false,new String[]{"0003","0004"}),
	bank_continual("银行流水",AttachmentTypeEnum.USER_INFO, false,false,new String[]{"0003","0004"}),
	bank_card_face("银行卡正面",AttachmentTypeEnum.USER_INFO, false,true,new String[]{"0003","0004"}),
	bank_card_back("银行卡背面",AttachmentTypeEnum.USER_INFO, false,true,new String[]{"0003","0004"}),
	credit_report_optional("征信报告(备选)",AttachmentTypeEnum.USER_INFO, false,false,new String[]{"0003","0004"}),
	man_work_door_optional("人行门口照(备选)",AttachmentTypeEnum.USER_INFO, false,true,new String[]{"0003","0004"}),
	dbr_id_card_face("担保人身份证正面",AttachmentTypeEnum.USER_INFO, false,true,new String[]{"0003","0004"}),
	dbr_id_card_back("担保人身份证背面",AttachmentTypeEnum.USER_INFO, false,true,new String[]{"0003","0004"}),
	dbr_marriage_family("担保人结婚证或户口本",AttachmentTypeEnum.USER_INFO, false,true,new String[]{"0003","0004"}),
	dbr_credit_authorization("担保人征信授权书",AttachmentTypeEnum.USER_INFO, false,true,new String[]{"0003","0004"}),
	dbr_mian_qian1("担保人面签照1",AttachmentTypeEnum.USER_INFO, false,true,new String[]{"0003","0004"}),
	dbr_mian_qian2("担保人面签照2",AttachmentTypeEnum.USER_INFO, false,true,new String[]{"0003","0004"}),
	dbr_three_choose_one("担保人三选一条件",AttachmentTypeEnum.USER_INFO, false,true,new String[]{"0003","0004"}),
	dbr_bank_continual("担保人银行流水",AttachmentTypeEnum.USER_INFO, false,true,new String[]{"0003","0004"}),
	dbr_credit_report_optional("担保人征信报告（备选）",AttachmentTypeEnum.USER_INFO, false,true,new String[]{"0003","0004"}),
	dbr_man_work_door_optional("担保人人行门口照(备选)",AttachmentTypeEnum.USER_INFO, false,true,new String[]{"0003","0004"}),
	
	carregisterinfoACB("车辆情况登记表",AttachmentTypeEnum.CONTRACT_INFO, false, true, new String[]{"0004"}),
	
	loanPledgeGuaranteeContractOneACB("车辆质押借款合同一",AttachmentTypeEnum.CONTRACT_INFO, false, true, new String[]{"0004"}),
	loanPledgeGuaranteeContractTwoACB("车辆质押借款合同二",AttachmentTypeEnum.CONTRACT_INFO, false, true, new String[]{"0004"}),
	loanPledgeGuaranteeContractThreeACB("车辆质押借款合同三",AttachmentTypeEnum.CONTRACT_INFO, false, true, new String[]{"0004"}),
	loanPledgeGuaranteeContractFourACB("车辆质押借款合同四",AttachmentTypeEnum.CONTRACT_INFO, false, true, new String[]{"0004"}),
	loanPledgeGuaranteeContractFiveACB("车辆质押借款合同五",AttachmentTypeEnum.CONTRACT_INFO, false, true, new String[]{"0004"}),
	loanPledgeGuaranteeContractSixACB("车辆质押借款合同六",AttachmentTypeEnum.CONTRACT_INFO, false, true, new String[]{"0004"}),
	
	responsibilityexcuseACB("免责承诺",AttachmentTypeEnum.CONTRACT_INFO, false, true, new String[]{"0004"}),
	
	VehicleSalesContractsOneACB("车辆买卖合同一",AttachmentTypeEnum.CONTRACT_INFO, false, true, new String[]{"0004"}),
	VehicleSalesContractsTwoACB("车辆买卖合同二",AttachmentTypeEnum.CONTRACT_INFO, false, true, new String[]{"0004"}),
	
	receiptforloan_revACB("借条",AttachmentTypeEnum.CONTRACT_INFO, false, true, new String[]{"0004"}),
	
	receiptforloanACB("收条",AttachmentTypeEnum.CONTRACT_INFO, false, true, new String[]{"0004"}),
	
	authorizationOneACB("授权委托书一",AttachmentTypeEnum.CONTRACT_INFO, false, true, new String[]{"0004"}),
	authorizationTwoACB("授权委托书二",AttachmentTypeEnum.CONTRACT_INFO, false, true, new String[]{"0004"}),
		
	signContractOtherACB("其它", AttachmentTypeEnum.CONTRACT_INFO, false, true, new String[]{"0004"}),
	
	vehiclStatusOneACB("左前45度", AttachmentTypeEnum.CAR_INFO, true, true, new String[]{"0004"}),
		
	vehiclStatusTwoACB("右后45度", AttachmentTypeEnum.CAR_INFO, true, true, new String[]{"0004"}),
		
	vehiclStatusThreeACB("中控", AttachmentTypeEnum.CAR_INFO, true, true, new String[]{"0004"}),
		
	vehiclStatusFourACB("公里数", AttachmentTypeEnum.CAR_INFO, true, true, new String[]{"0004"}),
		
	vehiclStatusFiveACB("前排", AttachmentTypeEnum.CAR_INFO, true, true, new String[]{"0004"}),
		
	vehiclStatusSixACB("后排", AttachmentTypeEnum.CAR_INFO, true, true, new String[]{"0004"}),
	
	gpsInstallACB("GPS安装截图", AttachmentTypeEnum.CAR_INFO, false, true, new String[]{"0004"}),
	
	;

	String message;
	AttachmentTypeEnum type;
	boolean required;
	boolean unique;
	String[] category;
	
	private AttachmentEnum(String message, AttachmentTypeEnum type, boolean required, boolean unique,
			String[] category) {
		this.message = message;
		this.type = type;
		this.required = required;
		this.unique = unique;
		this.category = category;
	}
	public boolean isUnique(){
		return unique;
	}
	public boolean isRequired() {
		return required;
	}

	public AttachmentTypeEnum type() {
		return type;
	}
	
	public String[] getCategory() {
		return category;
	}

	@Override
	public String message() {
		// TODO Auto-generated method stub
		return message;
	}

	@Override
	public Number value() {
		// TODO Auto-generated method stub
		return null;
	}
}
