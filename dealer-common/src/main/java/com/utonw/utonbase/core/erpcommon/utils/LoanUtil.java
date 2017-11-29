package com.utonw.utonbase.core.erpcommon.utils;

import com.utonw.utonbase.core.erpcommon.config.ParamterControl;

import java.math.BigDecimal;
import java.text.DecimalFormat;

/**
 * 标的相关工具类
 */
public class LoanUtil {

	/**
	 * 获取借款附件名称
	 *
	 * @param attachmentType
	 *            附件类型
	 * @return String
	 */
	public static String getLoanAttachmentRename(String attachmentType, String fileSuffix) {
		String retVal;
		retVal = getAttachmentType(attachmentType);
		retVal = retVal + "-" + DateUtil.getCurrentDateTime8Str() + fileSuffix;
		return retVal;
	}

	/**
	 * 获取附件类型
	 *
	 * @param attachmentType
	 *            类型
	 * @return String
	 */
	public static String getAttachmentType(String attachmentType) {
		String retVal;
		if (ParamterControl.FID.equals("0003") || ParamterControl.FID.equals("0000")) {
			switch (attachmentType) {
			case "idCardType":
				retVal = "身份证";
				break;
			case "verification":
				retVal = "居住证";
				break;
			case "vehicleLicense":
				retVal = "车辆行驶证";
				break;
			case "registrationCertificateOne":
				retVal = "机动车登记证书一";
				break;
			case "registrationCertificateTwo":
				retVal = "机动车登记证书二";
				break;
			case "insurancePolicy":
				retVal = "交通强制保险单";
				break;
			case "businessInsurancePolicy":
				retVal = "商业保险单";
				break;
			case "falseKey":
				retVal = "车辆备用钥匙";
				break;
			case "fahrzeugbeschaffung":
				retVal = "车辆购置税完税证明";
				break;
			case "trialPhaseReview":
				retVal = "面审视频截图";
				break;
			case "visiteCheckReview":
				retVal = "家访相片";
				break;
			case "signContractReview":
				retVal = "相关合同附件";
				break;
			case "lendedReview":
				retVal = "出账凭证";
				break;
			case "oneCarPhoto":
				retVal = "人车合照";
				break;
			case "personPhoto":
				retVal = "身份证照";
				break;
			case "telephoneRecordings":
				retVal = "电话录音";
				break;
			case "other":
				retVal = "其它";
				break;
			case "repaymentUploadProof":
				retVal = "还款凭证";
				break;
			case "continueUpload":
				retVal = "续借合同";
				break;
			case "ownerVehicleRepayment":
				retVal = "已拖车还款";
				break;
			case "litigation":
				retVal = "诉讼截图";
				break;
			case "Illegal":
				retVal = "违法信息截图";
				break;
			case "idCardBack":
				retVal = "身份证背面";
				break;
			case "heWarrants":
				retVal = "他项权证";
				break;
			case "businessInformation":
				retVal = "工商信息截图";
				break;
			case "loanContractOne":
				retVal = "借款合同一";
				break;
			case "loanContractTwo":
				retVal = "借款合同二";
				break;
			case "mortgageContractOne":
				retVal = "抵押合同一";
				break;
			case "mortgageContractTwo":
				retVal = "抵押合同二";
				break;
			case "pledgeContract":
				retVal = "质押合同";
				break;
			case "pledgeContractTwo":
				retVal = "质押合同二";
				break;
			case "loanReceipt":
				retVal = "借款收据";
				break;
			case "vehiclStatusOne":
				retVal = "人车合照";
				break;
			case "vehiclStatusTwo":
				retVal = "车辆状态一";
				break;
			case "vehiclStatusThree":
				retVal = "车辆状态二";
				break;
			case "vehiclStatusFour":
				retVal = "车辆状态三";
				break;
			case "vehiclStatusFive":
				retVal = "车辆状态四";
				break;
			case "signTheContract":
				retVal = "面签截图";
				break;
			case "gpsInstall":
				retVal = "GPS安装截图";
				break;
			case "locationSuccess":
				retVal = "定位成功截图";
				break;
			case "vehicleDriveCard":
				retVal = "车辆驾驶证";
				break;
			case "lockPosition":
				retVal = "暗锁位置";
				break;
			case "pledgeVehicleConsultArchives":
				retVal = "质押车查档";
				break;
			case "mortgageReview":
				retVal = "车辆抵押凭证";
				break;
			case "loanContractEle":
				retVal = "再贷电子合同";
				break;
			case "reloan_lended":
				retVal = "再贷公司出账凭证";
				break;
			case "loanContractEle_Help":
				retVal = "助贷电子合同";
				break;
			case "helploan_lended":
				retVal = "助贷公司出账凭证";
				break;
			case "reviewUpload":
				retVal = "评审凭证";
				break;
			case "company_repaymentUploadProof":
				retVal = "公司还款凭证";
				break;
			case "entrustVideo":
				retVal = "委托视频";
				break;
			case "repaymentUploadProof_revmoney":
				retVal = "还款凭证";
				break;
			case "instockPic":
				retVal = "入库照片";
				break;
			case "parkingPic":
				retVal = "停车位照片";
				break;
			case "storekeeperWithVehicle":
				retVal = "库管员与车合照";
				break;
			case "gjr_id_card_face":
				retVal = "共借人身份证正面";
				break;
			case "gjr_id_card_back":
				retVal = "共借人身份证背面";
				break;
			case "xsz_annual_page":
				retVal = "行驶证年审页";
				break;
			case "marriage_family":
				retVal = "结婚证或户口本";
				break;
			case "applications":
				retVal = "申请表";
				break;
			case "service_password":
				retVal = "服务密码";
				break;
			case "credit_authorization":
				retVal = "征信授权书";
				break;
			case "gjr_credit_authorization":
				retVal = "共借人征信授权书";
				break;
			case "mian_qian1":
				retVal = "面签照1";
				break;
			case "mian_qian2":
				retVal = "面签照2";
				break;
			case "three_choose_one":
				retVal = "三选一条件";
				break;
			case "bank_continual":
				retVal = "银行流水";
				break;
			case "bank_card_face":
				retVal = "银行卡正面";
				break;
			case "bank_card_back":
				retVal = "银行卡背面";
				break;
			case "credit_report_optional":
				retVal = "征信报告(备选)";
				break;
			case "man_work_door_optional":
				retVal = "人行门口照(备选)";
				break;
			case "dbr_id_card_face":
				retVal = "担保人身份证正面";
				break;
			case "dbr_id_card_back":
				retVal = "担保人身份证背面";
				break;
			case "dbr_marriage_family":
				retVal = "担保人结婚证或户口本";
				break;
			case "dbr_credit_authorization":
				retVal = "担保人征信授权书";
				break;
			case "dbr_mian_qian1":
				retVal = "担保人面签照1";
				break;
			case "dbr_mian_qian2":
				retVal = "担保人面签照2";
				break;
			case "dbr_three_choose_one":
				retVal = "担保人三选一条件";
				break;
			case "dbr_bank_continual":
				retVal = "担保人银行流水";
				break;
			case "dbr_credit_report_optional":
				retVal = "担保人征信报告（备选）";
				break;
			case "dbr_man_work_door_optional":
				retVal = "担保人人行门口照(备选)";
				break;
			case "carregisterinfoACB":
				retVal = "车辆情况登记表";
				break;
			case "loanPledgeGuaranteeContractOneACB":
				retVal = "车辆质押借款合同一";
				break;
			case "loanPledgeGuaranteeContractTwoACB":
				retVal = "车辆质押借款合同二";
				break;
			case "loanPledgeGuaranteeContractThreeACB":
				retVal = "车辆质押借款合同三";
				break;
			case "loanPledgeGuaranteeContractFourACB":
				retVal = "车辆质押借款合同四";
				break;
			case "loanPledgeGuaranteeContractFiveACB":
				retVal = "车辆质押借款合同五";
				break;
			case "loanPledgeGuaranteeContractSixACB":
				retVal = "车辆质押借款合同六";
				break;
			case "responsibilityexcuseACB":
				retVal = "免责承诺";
				break;
			case "VehicleSalesContractsOneACB":
				retVal = "车辆买卖合同一";
				break;
			case "VehicleSalesContractsTwoACB":
				retVal = "车辆买卖合同二";
				break;
			case "receiptforloan_revACB":
				retVal = "借条";
				break;
			case "receiptforloanACB":
				retVal = "收条";
				break;
			case "authorizationOneACB":
				retVal = "授权委托书一";
				break;
			case "authorizationTwoACB":
				retVal = "授权委托书二";
				break;
			case "signContractOtherACB":
				retVal = "其它";
				break;
			case "vehiclStatusOneACB":
				retVal = "左前45度";
				break;
			case "vehiclStatusTwoACB":
				retVal = "右后45度";
				break;
			case "vehiclStatusThreeACB":
				retVal = "中控";
				break;
			case "vehiclStatusFourACB":
				retVal = "公里数";
				break;
			case "vehiclStatusFiveACB":
				retVal = "前排";
				break;
			case "vehiclStatusSixACB":
				retVal = "后排";
				break;
			case "vehiclStatusOther":
				retVal = "其它";
				break;
			case "gpsInstallACB":
				retVal = "GPS安装截图";
				break;
			default:
				retVal = "";
			}
			return retVal;
		} else {
			switch (attachmentType) {
			case "idCardType":
				retVal = "身份证";
				break;
			case "verification":
				retVal = "居住证";
				break;
			case "vehicleLicense":
				retVal = "车辆行驶证";
				break;
			case "registrationCertificateOne":
				retVal = "机动车登记证书一";
				break;
			case "registrationCertificateTwo":
				retVal = "机动车登记证书二";
				break;
			case "insurancePolicy":
				retVal = "交通强制保险单";
				break;
			case "businessInsurancePolicy":
				retVal = "商业保险单";
				break;
			case "falseKey":
				retVal = "车辆备用钥匙";
				break;
			case "fahrzeugbeschaffung":
				retVal = "车辆购置税完税证明";
				break;
			case "trialPhaseReview":
				retVal = "面审视频截图";
				break;
			case "visiteCheckReview":
				retVal = "家访相片";
				break;
			case "signContractReview":
				retVal = "相关合同附件";
				break;
			case "lendedReview":
				retVal = "出账凭证";
				break;
			case "oneCarPhoto":
				retVal = "人车合照";
				break;
			case "personPhoto":
				retVal = "身份证照";
				break;
			case "telephoneRecordings":
				retVal = "电话录音";
				break;
			case "other":
				retVal = "其它";
				break;
			case "repaymentUploadProof":
				retVal = "还款凭证";
				break;
			case "continueUpload":
				retVal = "续借合同";
				break;
			case "ownerVehicleRepayment":
				retVal = "已拖车还款";
				break;
			case "litigation":
				retVal = "诉讼截图";
				break;
			case "Illegal":
				retVal = "违法信息截图";
				break;
			case "idCardBack":
				retVal = "身份证背面";
				break;
			case "heWarrants":
				retVal = "他项权证";
				break;
			case "businessInformation":
				retVal = "工商信息截图";
				break;
			case "loanContractOne":
				retVal = "借款合同一";
				break;
			case "loanContractTwo":
				retVal = "借款合同二";
				break;
			case "mortgageContractOne":
				retVal = "抵押合同一";
				break;
			case "mortgageContractTwo":
				retVal = "抵押合同二";
				break;
			case "pledgeContract":
				retVal = "质押合同";
				break;
			case "pledgeContractTwo":
				retVal = "质押合同二";
				break;
			case "loanReceipt":
				retVal = "借款收据";
				break;
			case "vehiclStatusOne":
				retVal = "人车合照";
				break;
			case "vehiclStatusTwo":
				retVal = "车辆状态一";
				break;
			case "vehiclStatusThree":
				retVal = "车辆状态二";
				break;
			case "vehiclStatusFour":
				retVal = "车辆状态三";
				break;
			case "vehiclStatusFive":
				retVal = "车辆状态四";
				break;
			case "signTheContract":
				retVal = "面签截图";
				break;
			case "gpsInstall":
				retVal = "GPS安装截图";
				break;
			case "locationSuccess":
				retVal = "定位成功截图";
				break;
			case "vehicleDriveCard":
				retVal = "车辆驾驶证";
				break;
			case "lockPosition":
				retVal = "暗锁位置";
				break;
			case "pledgeVehicleConsultArchives":
				retVal = "质押车查档";
				break;
			case "mortgageReview":
				retVal = "车辆抵押凭证";
				break;
			case "loanContractEle":
				retVal = "再贷电子合同";
				break;
			case "reloan_lended":
				retVal = "再贷公司出账凭证";
				break;
			case "loanContractEle_Help":
				retVal = "助贷电子合同";
				break;
			case "helploan_lended":
				retVal = "助贷公司出账凭证";
				break;
			case "reviewUpload":
				retVal = "评审凭证";
				break;
			case "company_repaymentUploadProof":
				retVal = "公司还款凭证";
				break;
			case "entrustVideo":
				retVal = "委托视频";
				break;
			case "repaymentUploadProof_revmoney":
				retVal = "还款凭证";
				break;
			case "instockPic":
				retVal = "入库照片";
				break;
			case "parkingPic":
				retVal = "停车位照片";
				break;
			case "storekeeperWithVehicle":
				retVal = "库管员与车合照";
				break;
			case "gjr_id_card_face":
				retVal = "共借人身份证正面";
				break;
			case "gjr_id_card_back":
				retVal = "共借人身份证背面";
				break;
			case "xsz_annual_page":
				retVal = "行驶证年审页";
				break;
			case "marriage_family":
				retVal = "结婚证或户口本";
				break;
			case "applications":
				retVal = "申请表";
				break;
			case "service_password":
				retVal = "服务密码";
				break;
			case "credit_authorization":
				retVal = "征信授权书";
				break;
			case "gjr_credit_authorization":
				retVal = "共借人征信授权书";
				break;
			case "mian_qian1":
				retVal = "面签照1";
				break;
			case "mian_qian2":
				retVal = "面签照2";
				break;
			case "three_choose_one":
				retVal = "三选一条件";
				break;
			case "bank_continual":
				retVal = "银行流水";
				break;
			case "bank_card_face":
				retVal = "银行卡正面";
				break;
			case "bank_card_back":
				retVal = "银行卡背面";
				break;
			case "credit_report_optional":
				retVal = "征信报告(备选)";
				break;
			case "man_work_door_optional":
				retVal = "人行门口照(备选)";
				break;
			case "dbr_id_card_face":
				retVal = "担保人身份证正面";
				break;
			case "dbr_id_card_back":
				retVal = "担保人身份证背面";
				break;
			case "dbr_marriage_family":
				retVal = "担保人结婚证或户口本";
				break;
			case "dbr_credit_authorization":
				retVal = "担保人征信授权书";
				break;
			case "dbr_mian_qian1":
				retVal = "担保人面签照1";
				break;
			case "dbr_mian_qian2":
				retVal = "担保人面签照2";
				break;
			case "dbr_three_choose_one":
				retVal = "担保人三选一条件";
				break;
			case "dbr_bank_continual":
				retVal = "担保人银行流水";
				break;
			case "dbr_credit_report_optional":
				retVal = "担保人征信报告（备选）";
				break;
			case "dbr_man_work_door_optional":
				retVal = "担保人人行门口照(备选)";
				break;
			case "carregisterinfoACB":
				retVal = "车辆情况登记表";
				break;
			case "loanPledgeGuaranteeContractOneACB":
				retVal = "车辆质押借款合同一";
				break;
			case "loanPledgeGuaranteeContractTwoACB":
				retVal = "车辆质押借款合同二";
				break;
			case "loanPledgeGuaranteeContractThreeACB":
				retVal = "车辆质押借款合同三";
				break;
			case "loanPledgeGuaranteeContractFourACB":
				retVal = "车辆质押借款合同四";
				break;
			case "loanPledgeGuaranteeContractFiveACB":
				retVal = "车辆质押借款合同五";
				break;
			case "loanPledgeGuaranteeContractSixACB":
				retVal = "车辆质押借款合同六";
				break;
			case "responsibilityexcuseACB":
				retVal = "免责承诺";
				break;
			case "VehicleSalesContractsOneACB":
				retVal = "车辆买卖合同一";
				break;
			case "VehicleSalesContractsTwoACB":
				retVal = "车辆买卖合同二";
				break;
			case "receiptforloan_revACB":
				retVal = "借条";
				break;
			case "receiptforloanACB":
				retVal = "收条";
				break;
			case "authorizationOneACB":
				retVal = "授权委托书一";
				break;
			case "authorizationTwoACB":
				retVal = "授权委托书二";
				break;
			case "signContractOtherACB":
				retVal = "其它";
				break;
			case "vehiclStatusOneACB":
				retVal = "左前45度";
				break;
			case "vehiclStatusTwoACB":
				retVal = "右后45度";
				break;
			case "vehiclStatusThreeACB":
				retVal = "中控";
				break;
			case "vehiclStatusFourACB":
				retVal = "公里数";
				break;
			case "vehiclStatusFiveACB":
				retVal = "前排";
				break;
			case "vehiclStatusSixACB":
				retVal = "后排";
				break;
			case "vehiclStatusOther":
				retVal = "其它";
				break;
			case "gpsInstallACB":
				retVal = "GPS安装截图";
				break;
			default:
				retVal = "";
			}
			return retVal;
		}
	}

	/**
	 * 获取文件类型
	 *
	 * @param contentType
	 *            contentType
	 * @return 文件类型
	 * @throws IllegalArgumentException
	 */
	public static String getContentType(String contentType) throws IllegalArgumentException {
		String fileSuffix;
		switch (contentType) {
		case "image/jpeg":
			fileSuffix = ".jpg";
			break;
		case "image/png":
			fileSuffix = ".png";
			break;
		// case "application/pdf":
		// fileSuffix = ".pdf";
		// break;
		default:
			throw new IllegalArgumentException("不支持此类型的文件！");
		}

		return fileSuffix;
	}

	/**
	 * 获取音频文件类型
	 *
	 * @param contentType
	 *            contentType
	 * @return 文件类型
	 * @throws IllegalArgumentException
	 */
	public static String getAudioContentType(String contentType) throws IllegalArgumentException {
		String fileSuffix;
		switch (contentType) {

		case "audio/mp3":
			fileSuffix = ".mp3";
			break;
		case "audio/vnd.dlna.adts":
			fileSuffix = ".aac";
			break;
		case "application/octet-stream":
			fileSuffix = ".ape";
			break;
		case "audio/x-ms-wma":
			fileSuffix = ".wma";
			break;
		case "audio/flac":
			fileSuffix = ".flac";
			break;
		case "audio/mpeg":
			fileSuffix = ".mp2";
			break;
		case "audio/wav":
			fileSuffix = ".wav";
			break;
		case "audio/ogg":
			fileSuffix = ".ogg";
			break;
		default:
			throw new IllegalArgumentException("不支持此类型的文件！");
		}
		return fileSuffix;
	}

	/**
	 * 获取视频文件类型
	 *
	 * @param contentType
	 *            contentType
	 * @return 文件类型
	 * @throws IllegalArgumentException
	 */
	public static String getVideoContentType(String contentType) throws IllegalArgumentException {
		String fileSuffix;
		switch (contentType) {
		case "video/avi":
			fileSuffix = ".avi";
			break;
		case "video/mpeg":
			fileSuffix = ".mpeg";
			break;
		case "video/mpg":
			fileSuffix = ".mpg";
			break;
		case "video/rmvb":
			fileSuffix = ".rmvb";
			break;
		case "video/mov":
			fileSuffix = ".mov";
			break;
		case "video/asf":
			fileSuffix = ".asf";
			break;
		case "video/wmv":
			fileSuffix = ".wmv";
			break;
		case "video/mkv":
			fileSuffix = ".mkv";
			break;
		case "video/mp4":
			fileSuffix = ".mp4";
			break;
		case "video/m4v":
			fileSuffix = ".m4v";
			break;
		case "video/3gp":
			fileSuffix = ".3gp";
			break;
		case "video/flv":
			fileSuffix = ".flv";
			break;
		case "video/f4v":
			fileSuffix = ".f4v";
			break;
		default:
			throw new IllegalArgumentException("不支持此类型的文件！");
		}
		return fileSuffix;
	}

	public static String getStrDateType(String dateType) {
		String str = "";
		switch (dateType) {
		case "month":
			str = "个月";
			break;
		case "year":
			str = "年";
			break;
		case "week":
			str = "周";
			break;
		case "day":
			str = "天";
			break;
		}
		return str;
	}

	/**
	 * 用于将借款总额转换成以万为单位的字符串的方法
	 *
	 * @param productAmount
	 * @return
	 */
	public static String parseProductAmount2Str(BigDecimal productAmount) {
		// 转换成万为单位
		int amountInt = productAmount.intValue();
		float amountWan = (float) amountInt / 10000;
		/* return amountWan+"万元"; */
		return amountWan + "";
	}

	/**
	 * 用于将商品利率转换成以%为单位的字符串的方法
	 *
	 * @param productRate
	 * @return
	 */
	public static String parseProductRate2Str(BigDecimal productRate) {
		// 转换成万为单位
		float rateFloat = productRate.floatValue();
		DecimalFormat fnum = new DecimalFormat("##0.00%");
		return fnum.format(rateFloat);
	}

	/**
	 * 获取借款合同编号
	 *
	 * @param prefixStr
	 *            合同前缀
	 * @return
	 */
	public static String getContractNo(String type, String prefixStr) {
		StringBuilder stringBuilder = new StringBuilder();
		String prefix = ChineseInitialsUtil.getPYIndexStr(prefixStr, true);
		if (prefix != null) {
			stringBuilder.append(prefix.substring(0, 2));
		}
		stringBuilder.append(type.toUpperCase());
		stringBuilder.append(DateUtil.getCurrentDateTime8());
		return stringBuilder.toString();

	}

	public static void main(String[] args) {
		System.out.println(getContractNo("JK", "东城业务部"));
	}
}
