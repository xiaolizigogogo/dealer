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
 * 
 * </p>
 *
 * @author wangyj
 * @since 2017-05-05
 */
@TableName("bank_card")
public class BankCard extends Model<BankCard> {

    private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId(type = IdType.UUID)
	private String id;

	/**
	 * 经销商 ID
	 */
	@TableField(value="acount_id")
	private Long acountId;

	/**
	 * 
	 */
	private String cardholder;

	/**
	 * 银行名
	 */
	private String bankname;

	/**
	 *  银行卡类型
	 */
	private String cardtype;

	/**
	 * 银行卡号 
	 */
	private String banknumber;

	/**
	 * 添加时间
	 */
	private Date createddata;

	/**
	 * 更新时间
	 */
	private Date  updatetime;

	/**
	 * 1：绑定放款银行卡，2：绑定还款银行卡
	 */
	private Integer cardstate;
	/**
	 * 更新人
	 */
	private  Long  updateby;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Long getAcountId() {
		return acountId;
	}

	public void setAcountId(Long acountId) {
		this.acountId = acountId;
	}

	public String getCardholder() {
		return cardholder;
	}

	public void setCardholder(String cardholder) {
		this.cardholder = cardholder;
	}

	public String getBankname() {
		return bankname;
	}

	public void setBankname(String bankname) {
		this.bankname = bankname;
	}

	public String getCardtype() {
		return cardtype;
	}

	public void setCardtype(String cardtype) {
		this.cardtype = cardtype;
	}

	public String getBanknumber() {
		return banknumber;
	}

	public void setBanknumber(String banknumber) {
		this.banknumber = banknumber;
	}

	public Date getCreateddata() {
		return createddata;
	}

	public void setCreateddata(Date createddata) {
		this.createddata = createddata;
	}

	public Date getupdatetime() {
		return  updatetime;
	}

	public void setupdatetime(Date  updatetime) {
		this. updatetime =  updatetime;
	}

	public Integer getCardstate() {
		return cardstate;
	}

	public void setCardstate(Integer cardstate) {
		this.cardstate = cardstate;
	}

	public Long getUpdateby() {
		return updateby;
	}

	public void setUpdateby(Long updateby) {
		this.updateby = updateby;
	}

	@Override
	protected Serializable pkVal() {
		// TODO Auto-generated method stub
		return id;
	}

}
