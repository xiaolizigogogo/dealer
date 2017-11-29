package com.utonw.dealer.api.enums.erp;


/**
 * 评审状态枚举
 * 
 * @author jml ReviewStatusEnum.java 2016年10月18日
 */
public enum ReviewStatusEnum implements EnumBase {
	passed("通过"),

	nopass("不通过"),

	repayment("进行还款"),

	renew("申请续借"),

	continueRepaymenting("完成本次催收"),

	overdueHandle("申请逾期处理"),

	commonRepayment("正常还款"),

	continueRepayment("续借还款"),

	advancedRepayment("提前还款"),

	abandonRepayment("放弃还款"),

	trackCarHandle("拖车处理"),

	towTruck("拖车"),

	noTowTruck("未拖车"),

	loanApplyEnd("申请坏账"),

	badLoanApplication("坏账归档处理"),

	interestHandle("申请罚息调整"),

	fineSet("罚息处理"),

	tracked("已拖车处理"),
	
	saleRepayment("卖车还款"),
	
	advancedRepaymented("提前还款"),
	
	vehicleNoSaleRepayment("还款未提车"),
	
	detainedCarRepayment("提车还款"),
	
	rejected("驳回审批记录"),
	
	alreadyTowTruck("已拖车"),
	
	telurge("电话催收"),
	
	smsurge("短信催收"),
	;
	String message;

	ReviewStatusEnum(String message) {
		this.message = message;
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
