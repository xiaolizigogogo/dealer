package com.utonw.dealer.api.enums.erp;


/**
 * 节点名枚举
 * 
 * @author jml TaskNameEnum.java 2016年10月12日
 */
public enum TaskNameEnum implements EnumBase {
	vehicleAssess("待车辆评估"),
	apply("申请"),
	repayment("还款中"),
	check("复核"),
	direct("出账"),
	callBack("电核"),
	signContract("签订合同"),
	REPAYMENT("还款处理"),
	mortgage("抵押办理"),
	dataReview("资料复核"),
	trialPhase("待总部面审"),
	lended("待出账"),
	detainedCarDispose(""),
	repaymenting("还款"),//还款凭证
	repaymented("还款评审"),//评审截图
	continueRepayment("续借处理"),//续借合同
	visiteCheck("家访"),
	instock("押品入库"),
	;
	String message;

	TaskNameEnum(String message) {
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
