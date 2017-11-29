package com.utonw.dealer.api.enums.erp;

import com.utonw.dealer.api.enums.LoanStatusEnum;
import com.utonw.dealer.api.enums.erp.EnumBase;
import com.utonw.dealer.api.util.erp.AttachmentTaskEnum;
import com.utonw.dealer.api.util.erp.EnumUtils;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class ConstantsEnum {
	/**
	 *车贷类型
	 */
	public static Map<String, String> loanProduct;
	/**
	 * 订单状态
	 */
	public static Map<String,String> loanStatusMap= EnumUtils.getNameMessageMap(LoanStatusEnum.class);
	/**
	 * 附件-任务
	 */
	public static List<AttachmentTaskEnum> attachmentTaskEnums = Arrays.asList(AttachmentTaskEnum.values());
	/**
	 * 唯一附件
	 */
	public static List<String> uniqueAttachments;
	// 一个图片子类型，大类型的Map
	public static Map<String, String> attachmentTypeMap = new HashMap<String, String>();
	/**
	 * 可以上传多个附件的种类
	 */
	public static List<String> multipeAttachment = new ArrayList<String>();
	/**
	 * 音频类型
	 */
	public static List<String> videoAttachment=new ArrayList<String>();
	/**
	 * 下载合同类型
	 */
//	public static  Map<String,String> contractDownloadEnum;

	/**
	 * 还款状态
	 */
	public static Map<Integer,String> repaymentStatusMap=new HashMap<Integer,String>();
	/**
	 * 催收方式
	 */
	public static Map<String,String> urgeTypeNameMessageMap=EnumUtils.getNameMessageMap(UrgeTypeEnum.class);
	/**
	 * 评审status
	 */
	public static Map<String,String> reviewStatusNameEnums=EnumUtils.getNameMessageMap(ReviewStatusEnum.class);
	static {
		List<EnumBase> attachmentEnums = EnumUtils.toEnumBaseList(AttachmentEnum.class);
		//通过配置文件取得下载合同的枚举类
//		String contractClassEnumName = ParamterControl.CONTRACT_DOWNLOAD_ENMU_CLASS;
//		try {
//			contractDownloadEnum=EnumUtils.getNameMessageMap(Class.forName(contractClassEnumName));
//		}catch (Exception e){
//			e.printStackTrace();
//		}

		for (EnumBase attachmentEnum : attachmentEnums) {
			AttachmentEnum attachment = (AttachmentEnum) attachmentEnum;
			attachmentTypeMap.put(attachment.name(), attachment.type().name());
			if (!attachment.isUnique()) {
				multipeAttachment.add(attachment.name());
			}
			if(attachment.type().equals(AttachmentTypeEnum.VIEDO_INFO)||attachment.type().equals(AttachmentTypeEnum.AUDIO_INFO) ){
				videoAttachment.add(attachment.name());
			}
		}
		List<RepaymentStatusEnum> repaymentStatusEnums=Arrays.asList(RepaymentStatusEnum.values());
		for(RepaymentStatusEnum  repaymentStatusEnum :repaymentStatusEnums){
			repaymentStatusMap.put(repaymentStatusEnum.code(), repaymentStatusEnum.name().toLowerCase());
		}

	}
	static {
		loanProduct = EnumUtils.getMessageNameMap(LoanProductEnum.class);
	}
	static {
		uniqueAttachments=new ArrayList<String>();
			List<EnumBase> enumList = EnumUtils.toEnumBaseList(AttachmentEnum.class);
			AttachmentEnum attachmentEnum;
			for (EnumBase enumBase : enumList) {
				attachmentEnum = (AttachmentEnum) enumBase;
				if (!attachmentEnum.isUnique()) {
					uniqueAttachments.add(attachmentEnum.name());
				}
			}
		}
}
