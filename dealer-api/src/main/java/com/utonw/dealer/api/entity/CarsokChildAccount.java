package com.utonw.dealer.api.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 子账户
 * </p>
 *
 * @author wangyj
 * @since 2017-05-06
 */
@TableName("carsok_child_account")
public class CarsokChildAccount extends Model<CarsokChildAccount> {

    private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId(type = IdType.UUID)
	private Integer id;

	/**
	 * 子账号手机号
	 */
	@TableField(value="child_account_mobile")
	private String childAccountMobile;

	/**
	 * 子账号姓名
	 */
	@TableField(value="child_account_name")
	private String childAccountName;

	/**
	 * 主账户登录手机号码
	 */
	@TableField(value="account_phone")
	private String accountPhone;

	/**
	 * 消息推送token
	 */
	private String alias;

	/**
	 * 
	 */
	@TableField(value="create_time")
	private Date createTime;

	/**
	 * 
	 */
	@TableField(value="update_time")
	private Date updateTime;

    private Integer regionid;

	public Integer getRegionid() {
		return regionid;
	}

	public void setRegionid(Integer regionid) {
		this.regionid = regionid;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getChildAccountMobile() {
		return childAccountMobile;
	}

	public void setChildAccountMobile(String childAccountMobile) {
		this.childAccountMobile = childAccountMobile;
	}

	public String getChildAccountName() {
		return childAccountName;
	}

	public void setChildAccountName(String childAccountName) {
		this.childAccountName = childAccountName;
	}

	public String getAccountPhone() {
		return accountPhone;
	}

	public void setAccountPhone(String accountPhone) {
		this.accountPhone = accountPhone;
	}

	public String getAlias() {
		return alias;
	}

	public void setAlias(String alias) {
		this.alias = alias;
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
	@Override
	protected Serializable pkVal() {
		// TODO Auto-generated method stub
		return id;
	}

}
