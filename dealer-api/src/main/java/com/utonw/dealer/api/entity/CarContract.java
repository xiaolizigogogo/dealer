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
 * @since 2017-07-25
 */
@TableName("car_contract")
public class CarContract extends Model<CarContract> {

    private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId(type = IdType.UUID)
	private String id;

	/**
	 * 
	 */
	private String contractpath;

	/**
	 * 
	 */
	private String contractnum;

	/**
	 * 
	 */
	private Integer carid;

	/**
	 * 
	 */
	private String contracttype;

	/**
	 * 
	 */
	private Date uploaddate;



	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContractpath() {
		return contractpath;
	}

	public void setContractpath(String contractpath) {
		this.contractpath = contractpath;
	}

	public String getContractnum() {
		return contractnum;
	}

	public void setContractnum(String contractnum) {
		this.contractnum = contractnum;
	}

	public Integer getCarid() {
		return carid;
	}

	public void setCarid(Integer carid) {
		this.carid = carid;
	}

	public String getContracttype() {
		return contracttype;
	}

	public void setContracttype(String contracttype) {
		this.contracttype = contracttype;
	}

	public Date getUploaddate() {
		return uploaddate;
	}

	public void setUploaddate(Date uploaddate) {
		this.uploaddate = uploaddate;
	}
	@Override
	protected Serializable pkVal() {
		// TODO Auto-generated method stub
		return id;
	}

}
