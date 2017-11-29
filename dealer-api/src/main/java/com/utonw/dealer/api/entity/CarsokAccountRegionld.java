package com.utonw.dealer.api.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 
 * </p>
 *
 * @author wangyj
 * @since 2017-07-11
 */
@TableName("carsok_account_regionld")
public class CarsokAccountRegionld extends Model<CarsokAccountRegionld> {

    private static final long serialVersionUID = 1L;

	/**
	 * ID
	 */
	@TableId(type = IdType.UUID)
	private Integer id;

	/**
	 * 省
	 */
	private String province;

	/**
	 * 市
	 */
	private String city;

	/**
	 * 区
	 */
	private String district;

	/**
	 * 主账号ID
	 */
	private String acountid;

	/**
	 * 创建时间
	 */
	private Date contracttime;

	/**
	 * 更新时间
	 */
	private Date updatetime;



	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
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

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public String getAcountid() {
		return acountid;
	}

	public void setAcountid(String acountid) {
		this.acountid = acountid;
	}

	public Date getContracttime() {
		return contracttime;
	}

	public void setContracttime(Date contracttime) {
		this.contracttime = contracttime;
	}

	public Date getUpdatetime() {
		return updatetime;
	}

	public void setUpdatetime(Date updatetime) {
		this.updatetime = updatetime;
	}
	@Override
	protected Serializable pkVal() {
		// TODO Auto-generated method stub
		return id;
	}

}
