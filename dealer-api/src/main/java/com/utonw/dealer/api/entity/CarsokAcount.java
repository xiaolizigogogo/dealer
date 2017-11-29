package com.utonw.dealer.api.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * <p>
 * 账户
 * </p>
 *
 * @author wangyj
 * @since 2017-05-09
 */
@TableName("carsok_acount")
public class CarsokAcount extends Model<CarsokAcount> implements Serializable {

    private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId(type = IdType.UUID)
	private Integer id;

	/**
	 * 商家编号
	 */
	@TableField(value="account_code")
	private Long accountCode;

	/**
	 * 登录账号
	 */
	private String account;

	/**
	 * 登录密码
	 */
	@TableField(value="account_password")
	private String accountPassword;

	/**
	 * 账户昵称
	 */
	private String nick;

	/**
	 * 手机号
	 */
	private String mobile;

	/**
	 * 账户类型（1:二手车商）
	 */
	@TableField(value="account_type")
	private Integer accountType;

	/**
	 * 支付密码
	 */
	@TableField(value="pay_password")
	private String payPassword;

	/**
	 * 是否绑卡（1:否、2:是）
	 */
	@TableField(value="is_bk")
	private Integer isBk;

	/**
	 * 是否实名认证（1:否、2:是）
	 */
	@TableField(value="is_real_name_audit")
	private Integer isRealNameAudit;

	/**
	 * 是否设置支付密码（1:否、2:是）
	 */
	@TableField(value="is_paypwd")
	private Integer isPaypwd;

	/**
	 * 是否商家认证（1:否、2:是）
	 */
	@TableField(value="is_merchant_audit")
	private Integer isMerchantAudit;

	/**
	 * 真实姓名
	 */
	@TableField(value="real_name")
	private String realName;

	/**
	 * 身份证号
	 */
	private String idcard;

	/**
	 * 头像访问地址
	 */
	@TableField(value="head_portrait_path")
	private String headPortraitPath;

	/**
	 * 营业执照访问地址
	 */
	@TableField(value="business_licence_path")
	private String businessLicencePath;

	/**
	 * 秘钥
	 */
	@TableField(value="account_key")
	private String accountKey;

	/**
	 * 商户名称
	 */
	@TableField(value="merchant_name")
	private String merchantName;

	/**
	 * 商户所在省份
	 */
	private String province;

	/**
	 * 商户所在市
	 */
	private String city;

	/**
	 * 商户详细地址
	 */
	@TableField(value="merchant_address")
	private String merchantAddress;

	/**
	 * 商户介绍
	 */
	@TableField(value="merchant_descr")
	private String merchantDescr;

	/**
	 * 店招图访问地址
	 */
	@TableField(value="merchant_image_path")
	private String merchantImagePath;

	/**
	 * 创建时间
	 */
	@TableField(value="create_time")
	private Date createTime;

	/**
	 * 修改时间
	 */
	@TableField(value="update_time")
	private Date updateTime;

	/**
	 * 车商分
	 */
	@TableField(value="quotient_score")
	private Long quotientScore;

	/**
	 * token
	 */
	private String token;

	/**
	 * 邀请人电话
	 */
	private String inviter;

	/**
	 * 
	 */
	@TableField(value="open_id")
	private String openId;

	/**
	 * 微信认证专用
	 */
	@TableField(value="refresh_token")
	private String refreshToken;

	/**
	 * 
	 */
	@TableField(value="wx_nick_name")
	private String wxNickName;

	/**
	 * 
	 */
	@TableField(value="wx_headUrlString")
	private String wxHeadurlstring;

	/**
	 * 
	 */
	@TableField(value="review_time")
	private Date reviewTime;




	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Long getAccountCode() {
		return accountCode;
	}

	public void setAccountCode(Long accountCode) {
		this.accountCode = accountCode;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getAccountPassword() {
		return accountPassword;
	}

	public void setAccountPassword(String accountPassword) {
		this.accountPassword = accountPassword;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public Integer getAccountType() {
		return accountType;
	}

	public void setAccountType(Integer accountType) {
		this.accountType = accountType;
	}

	public String getPayPassword() {
		return payPassword;
	}

	public void setPayPassword(String payPassword) {
		this.payPassword = payPassword;
	}

	public Integer getIsBk() {
		return isBk;
	}

	public void setIsBk(Integer isBk) {
		this.isBk = isBk;
	}

	public Integer getIsRealNameAudit() {
		return isRealNameAudit;
	}

	public void setIsRealNameAudit(Integer isRealNameAudit) {
		this.isRealNameAudit = isRealNameAudit;
	}

	public Integer getIsPaypwd() {
		return isPaypwd;
	}

	public void setIsPaypwd(Integer isPaypwd) {
		this.isPaypwd = isPaypwd;
	}

	public Integer getIsMerchantAudit() {
		return isMerchantAudit;
	}

	public void setIsMerchantAudit(Integer isMerchantAudit) {
		this.isMerchantAudit = isMerchantAudit;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getIdcard() {
		return idcard;
	}

	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}

	public String getHeadPortraitPath() {
		return headPortraitPath;
	}

	public void setHeadPortraitPath(String headPortraitPath) {
		this.headPortraitPath = headPortraitPath;
	}

	public String getBusinessLicencePath() {
		return businessLicencePath;
	}

	public void setBusinessLicencePath(String businessLicencePath) {
		this.businessLicencePath = businessLicencePath;
	}

	public String getAccountKey() {
		return accountKey;
	}

	public void setAccountKey(String accountKey) {
		this.accountKey = accountKey;
	}

	public String getMerchantName() {
		return merchantName;
	}

	public void setMerchantName(String merchantName) {
		this.merchantName = merchantName;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getMerchantAddress() {
		return merchantAddress;
	}

	public void setMerchantAddress(String merchantAddress) {
		this.merchantAddress = merchantAddress;
	}

	public String getMerchantDescr() {
		return merchantDescr;
	}

	public void setMerchantDescr(String merchantDescr) {
		this.merchantDescr = merchantDescr;
	}

	public String getMerchantImagePath() {
		return merchantImagePath;
	}

	public void setMerchantImagePath(String merchantImagePath) {
		this.merchantImagePath = merchantImagePath;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public Long getQuotientScore() {
		return quotientScore;
	}

	public void setQuotientScore(Long quotientScore) {
		this.quotientScore = quotientScore;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public String getInviter() {
		return inviter;
	}

	public void setInviter(String inviter) {
		this.inviter = inviter;
	}

	public String getOpenId() {
		return openId;
	}

	public void setOpenId(String openId) {
		this.openId = openId;
	}

	public String getRefreshToken() {
		return refreshToken;
	}

	public void setRefreshToken(String refreshToken) {
		this.refreshToken = refreshToken;
	}

	public String getWxNickName() {
		return wxNickName;
	}

	public void setWxNickName(String wxNickName) {
		this.wxNickName = wxNickName;
	}

	public String getWxHeadurlstring() {
		return wxHeadurlstring;
	}

	public void setWxHeadurlstring(String wxHeadurlstring) {
		this.wxHeadurlstring = wxHeadurlstring;
	}

	public Date getReviewTime() {
		return reviewTime;
	}

	public void setReviewTime(Date reviewTime) {
		this.reviewTime = reviewTime;
	}


	@Override
	protected Serializable pkVal() {
		// TODO Auto-generated method stub
		return id;
	}

}
