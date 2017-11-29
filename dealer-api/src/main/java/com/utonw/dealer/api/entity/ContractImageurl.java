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
 * @since 2017-05-09
 */
@TableName("contract_imageurl")
public class ContractImageurl extends Model<ContractImageurl> {

    private static final long serialVersionUID = 1L;

	/**
	 * ID(uuid)
	 */
	@TableId(type = IdType.UUID)
	private String id;

	/**
	 * 合同类型
	 */
	private Integer contracttype;

	/**
	 * 缩略图位置
	 */
	private String imageurl;

	/**
	 * 
	 */
	private Date updatedate;

	/**
	 * 更新者
	 */
	private String updateby;



	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Integer getContracttype() {
		return contracttype;
	}

	public void setContracttype(Integer contracttype) {
		this.contracttype = contracttype;
	}

	public String getImageurl() {
		return imageurl;
	}

	public void setImageurl(String imageurl) {
		this.imageurl = imageurl;
	}

	public Date getUpdatedate() {
		return updatedate;
	}

	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}

	public String getUpdateby() {
		return updateby;
	}

	public void setUpdateby(String updateby) {
		this.updateby = updateby;
	}
	@Override
	protected Serializable pkVal() {
		// TODO Auto-generated method stub
		return id;
	}

}
