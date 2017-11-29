package com.utonw.dealer.api.enums.erp;

public enum RepaymentStatusEnum implements EnumBase {
	/**
	 * 开始催收还款
	 */
	STARTCOLLECTION(0, "开始催收还款"),

	/**
	 * 逾期处理
	 */
	OVERDUEHANDLE(1, "逾期处理"),

	/**
	 * 已催收还款(短信电话通知)
	 */
	CONTINUEREPAYMENTING(2, "已催收还款(短信电话通知)"),

	/**
	 * 还款处理
	 */
	repaymenting(3, "还款处理"),

	/**
	 * 申请续借
	 */
	RENEW(4, "申请续借"),

	/**
	 * 正常还款
	 */
	COMMONREPAYMENT(5, "正常还款"),

	/**
	 * 续借还款
	 */
	CONTINUEREPAYMENT(6, "续借还款"),

	/**
	 * 提前还款
	 */
	
	ADVANCEDREPAYMENT(7, "提前还款"),

	/**
	 * 还款成功标识
	 */
	PAYMENTEDSUCCESS(8, "还款成功标识"),

	/**
	 * 同意续借
	 */
	REPAYMENTEDHANDLE(11, "同意续借"),

	/**
	 * 放弃还款
	 */
	ABANDONREPAYMENT(12, "放弃还款"),

	/**
	 * 拒绝续借
	 */
	NOPASS(13, "拒绝续借"),

	/**
	 * 暂不处理
	 */
	NODISPOSE(14, "暂不处理"),

	/**
	 * 申请罚息调整
	 */
	INTERESTHANDLE(15, "申请罚息调整"),

	/**
	 * 拖车处理
	 */
	TRACKCARHANDLE(16, "拖车处理"),

	/**
	 * 风控处理
	 */
	LATEPROCESSED(17, "风控处理"),

	/**
	 * 继续拖车
	 */
	COUNTINUEADJUST(18, "继续拖车"),

	/**
	 * 已拖车处理
	 */
	TRACKED(20, "已拖车处理"),

	/**
	 * 坏账申请
	 */
	LOANAPPLYEND(21, "坏账申请"),

	/**
	 * 继续催收
	 */
	COUNTINUEURGEREPAYMENT(22, "继续催收"),

	/**
	 * 完成罚息修改
	 */
	COMPLETEUPDATEFINFEE(23, "完成罚息修改"),

	/**
	 * 卖车还款
	 */
	SALEREPAYMENT(24, "卖车还款"),

	/**
	 * 提车还款
	 */
	DETAINEDCARREPAYMENT(25, "提车还款"),

	/**
	 * 坏账归档
	 */
	BADLOANAPPLICATION(26, "坏账归档"),

	/**
	 * 还款不提车
	 */
	VEHICLENOSALEREPAYMENT(27, "还款不提车"),

	//40以后的状态作为简易流程的新增状态
	/**
	 * 收款确认
	 */
	RECEIVEMONEY(41, "本期还款完成"),

	/**
	 * 拖车
	 */
	trailer(42,"拖车"),

	/**
	 *拖车处理
	 */
	trailerdeal(43,"拖车处理"),

	/**
	 * 坏账处理
	 */
	baddebtdeal(44,"坏账处理"),

	/**
	 * 财务账务确认
	 */
	receivemoneyconfirm(45,"财务账务确认"),

	/**
	 * 已拖车
	 */
	tracked(46,"已拖车"),

	/**
	 * 未拖车
	 */
	noTracked(47,"未拖车"),

	repaymented(888,"正常还款完成"),
	
	advancedRepaymented(666,"提前还款完成"),
	
	
	;

	String message;
	Integer code;

	RepaymentStatusEnum(Integer code, String message) {
		this.message = message;
		this.code = code;
	}

	@Override
	public String message() {
		// TODO Auto-generated method stub
		return message;
	}

	public Integer code() {
		return code;
	}

	@Override
	public Number value() {
		// TODO Auto-generated method stub
		return null;
	}
}
