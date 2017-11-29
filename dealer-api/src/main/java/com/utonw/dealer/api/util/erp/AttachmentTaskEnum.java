package com.utonw.dealer.api.util.erp;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.utonw.dealer.api.enums.erp.TaskNameEnum;

@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.ANY)
public enum AttachmentTaskEnum {
	//车易宝0003 爱车帮0004 

	idCardType("身份证正面", TaskNameEnum.apply, true, true, new String[]{"0003","0004"}),
	
	idCardBack("身份证背面", TaskNameEnum.apply, true, true, new String[]{"0003","0004"}),

	// verification("居住证", TaskNameEnum.USER_INFO, false,true,),

	vehicleLicense("车辆行驶证", TaskNameEnum.apply, true, true, new String[]{"0003","0004"}),
	
	lendedReview("出账凭证", TaskNameEnum.lended, true, true, new String[]{"0003","0004"}),

	//oneCarPhoto("人车合照", TaskNameEnum.vehicleAssess, true, true),

	//personPhoto("身份证正正面", TaskNameEnum.apply, true, true),
	
	// 5 评审截图continueRepayment
	continueUpload("续借合同", TaskNameEnum.continueRepayment, true, true, new String[]{"0003","0004"}),

	registrationCertificateOne("机动车证书一", TaskNameEnum.apply, false, true, new String[]{"0003","0004"}),

	registrationCertificateTwo("机动车登记证书二", TaskNameEnum.apply, false, true, new String[]{"0003","0004"}),

	insurancePolicy("交通强制保险单", TaskNameEnum.apply, false, true, new String[]{"0003","0004"}),

	businessInsurancePolicy("商业保险单", TaskNameEnum.apply, false, true, new String[]{"0003","0004"}),

	falseKey("车辆备用钥匙", TaskNameEnum.apply, false, true, new String[]{"0003","0004"}),

	// fahrzeugbeschaffung("车辆购置税完税证明", TaskNameEnum.CAR_INFO, false,true),
	//
	 trialPhaseReview("面审视频截图", TaskNameEnum.trialPhase, false,true, new String[]{"0003","0004"}),
	//
	 visiteCheckReview("家访相片", TaskNameEnum.visiteCheck, true,true, new String[]{"0003","0004"}),
	//
	// signContractReview("相关合同附件", TaskNameEnum.CONTRACT_INFO, false,true),

	telephoneRecordings("电话录音", TaskNameEnum.callBack, false, true, new String[]{"0003","0004"}),

	// spareKey("备用钥匙", TaskNameEnum.CAR_INFO, false,true),
	// 3
	repaymentUploadProof("还款凭证", TaskNameEnum.repaymenting, false, false, new String[]{"0003","0004"}),

	// ownerVehicleRepayment("已拖车还款", TaskNameEnum.CONTRACT_INFO, false,true),

	litigation("诉讼截图", TaskNameEnum.callBack, false, true, new String[]{"0003","0004"}),

	Illegal("违法信息截图", TaskNameEnum.callBack, false, true, new String[]{"0003","0004"}),

	businessInformation("工商信息截图", TaskNameEnum.callBack, false, true, new String[]{"0003","0004"}),
	
	heWarrants("他项权证", TaskNameEnum.signContract, false, true, new String[]{"0003"}),

	loanContractOne("借款合同一", TaskNameEnum.signContract, false, true, new String[]{"0003"}),

	loanContractTwo("借款合同二", TaskNameEnum.signContract, false, true, new String[]{"0003"}),

	mortgageContractOne("抵押合同一", TaskNameEnum.signContract, false, true, new String[]{"0003"}),

	mortgageContractTwo("抵押合同二", TaskNameEnum.signContract, false, true, new String[]{"0003"}),

	pledgeContract("质押合同", TaskNameEnum.signContract, false, true, new String[]{"0003"}),

	pledgeContractTwo("质押合同二", TaskNameEnum.signContract, false, true, new String[]{"0003"}),
	
	signTheContract("面签截图", TaskNameEnum.signContract, false, true, new String[]{"0003"}),

	gpsInstall("GPS安装截图", TaskNameEnum.signContract, false, true, new String[]{"0003"}),

	locationSuccess("定位成功截图", TaskNameEnum.signContract, false, true, new String[]{"0003"}),
	
	entrustVideo("委托视频",TaskNameEnum.signContract,false,true, new String[]{"0003"}),
	 
	loanReceipt("借款收据", TaskNameEnum.signContract, false, true, new String[]{"0003"}),
	
	vehiclStatusOne("人车合照", TaskNameEnum.vehicleAssess, true, true, new String[]{"0003"}),
	
	vehiclStatusTwo("车辆状态一", TaskNameEnum.vehicleAssess, false, true, new String[]{"0003"}),
	
	vehiclStatusThree("车辆状态二", TaskNameEnum.vehicleAssess, false, true, new String[]{"0003"}),
	
	vehiclStatusFour("车辆状态三", TaskNameEnum.vehicleAssess, false, true, new String[]{"0003"}),
	
	vehiclStatusFive("车辆状态四", TaskNameEnum.vehicleAssess, false, true, new String[]{"0003"}),
	
	lockPosition("暗锁位置", TaskNameEnum.vehicleAssess, false, true, new String[]{"0003"}),

	vehicleDriveCard("车辆驾驶证", TaskNameEnum.apply, false, true, new String[]{"0003","0004"}),

	pledgeVehicleConsultArchives("质押车查档", TaskNameEnum.callBack, false, true, new String[]{"0003","0004"}),

	mortgageReview("车辆抵押凭证", TaskNameEnum.mortgage, false, true, new String[]{"0003","0004"}),
	
	other("其它", TaskNameEnum.apply, false, true, new String[]{"0003","0004"}),

	instockPic("入库照片", TaskNameEnum.instock, false, true, new String[]{"0003","0004"}),

	parkingPic("停车位照片", TaskNameEnum.instock, false, true, new String[]{"0003","0004"}),

	storekeeperWithVehicle("库管员与车合照", TaskNameEnum.instock, false, true,new String[]{"0003","0004"}),
	//
	// loanContractEle("再贷电子合同", TaskNameEnum.CONTRACT_INFO, false, true, "0003"),
	//
	// reloan_lended("再贷公司出账凭证", TaskNameEnum.CONTRACT_INFO, false, true, "0003"),
	//
	// loanContractEle_Help("助贷电子合同", TaskNameEnum.CONTRACT_INFO, false, true, "0003"),
	//
	// helploan_lended("助贷公司出账凭证", TaskNameEnum.CONTRACT_INFO, false, true, "0003"),
	//
	// company_repaymentUploadProof("公司还款凭证", TaskNameEnum.CONTRACT_INFO, false, false, "0003")
	carregisterinfoACB("车辆情况登记表",TaskNameEnum.signContract, false, true, new String[]{"0004"}),
	
	loanPledgeGuaranteeContractOneACB("车辆质押借款合同一",TaskNameEnum.signContract, false, true, new String[]{"0004"}),
	loanPledgeGuaranteeContractTwoACB("车辆质押借款合同二",TaskNameEnum.signContract, false, true, new String[]{"0004"}),
	loanPledgeGuaranteeContractThreeACB("车辆质押借款合同三",TaskNameEnum.signContract, false, true, new String[]{"0004"}),
	loanPledgeGuaranteeContractFourACB("车辆质押借款合同四",TaskNameEnum.signContract, false, true, new String[]{"0004"}),
	loanPledgeGuaranteeContractFiveACB("车辆质押借款合同五",TaskNameEnum.signContract, false, true, new String[]{"0004"}),
	loanPledgeGuaranteeContractSixACB("车辆质押借款合同六",TaskNameEnum.signContract, false, true, new String[]{"0004"}),
	
	responsibilityexcuseACB("免责承诺",TaskNameEnum.signContract, false, true, new String[]{"0004"}),
	
	VehicleSalesContractsOneACB("车辆买卖合同一",TaskNameEnum.signContract, false, true, new String[]{"0004"}),
	VehicleSalesContractsTwoACB("车辆买卖合同二",TaskNameEnum.signContract, false, true, new String[]{"0004"}),
	
	receiptforloan_revACB("借 条",TaskNameEnum.signContract, false, true, new String[]{"0004"}),
	
	receiptforloanACB("收条",TaskNameEnum.signContract, false, true, new String[]{"0004"}),
	
	authorizationOneACB("授权委托书一",TaskNameEnum.signContract, false, true, new String[]{"0004"}),
	authorizationTwoACB("授权委托书二",TaskNameEnum.signContract, false, true, new String[]{"0004"}),
		
	signContractOtherACB("其它", TaskNameEnum.signContract, false, true, new String[]{"0004"}),
	
	vehiclStatusOneACB("左前45度", TaskNameEnum.vehicleAssess, true, true, new String[]{"0004"}),
		
	vehiclStatusTwoACB("右后45度", TaskNameEnum.vehicleAssess, true, true, new String[]{"0004"}),
		
	vehiclStatusThreeACB("中控", TaskNameEnum.vehicleAssess, true, true, new String[]{"0004"}),
		
	vehiclStatusFourACB("公里数", TaskNameEnum.vehicleAssess, true, true, new String[]{"0004"}),
		
	vehiclStatusFiveACB("前排", TaskNameEnum.vehicleAssess, true, true, new String[]{"0004"}),
		
	vehiclStatusSixACB("后排", TaskNameEnum.vehicleAssess, true, true, new String[]{"0004"}),
	
	vehiclStatusOther("其它", TaskNameEnum.vehicleAssess, false, true, new String[]{"0003","0004"}),
	
	gpsInstallACB("GPS安装截图",TaskNameEnum.mortgage,false,true,new String[]{"0004"}),
	;
	public String message;
	public TaskNameEnum type;
	public boolean required;
	public boolean unique;
	public String[] category;

	private AttachmentTaskEnum(String message, TaskNameEnum type, boolean required, boolean unique, String[] category) {
		this.message = message;
		this.type = type;
		this.required = required;
		this.unique = unique;
		this.category = category;
	}

	public boolean getUnique() {
		return unique;
	}

	public boolean getRequired() {
		return required;
	}

	public TaskNameEnum getType() {
		return type;
	}

	public String message() {
		// TODO Auto-generated method stub
		return message;
	}

	public String[] getCategory() {
		return category;
	}

	public Number value() {
		// TODO Auto-generated method stub
		return null;
	}
}
