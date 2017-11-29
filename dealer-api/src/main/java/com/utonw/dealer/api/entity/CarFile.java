package com.utonw.dealer.api.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.utonw.dealer.api.enums.CarImageTypeEnum;

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
@TableName("car_file")
public class CarFile extends Model<CarFile> {

    private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId(type = IdType.UUID)
	private String id;

	/**
	 * 车ID
	 */
	private Integer product_id;

	/**
	 * 1：大照 2：行驶证 3：原车主身份证 4：保险单 5：现车照片 6：4s维修记录 7：收车合同 
	 */
	private CarImageTypeEnum headlinetype;

	/**
	 * 
	 */
	private String picpath;

	/**
	 * 上传时间
	 */
	private Date uploadtime;

	/**
	 * 更新时间
	 */
	private Date updatetime;

	/**
	 * 更新人
	 */
	private String updateby;

	@TableField(exist = false)
	private String pictureTypeName;

	public String getPictureTypeName() {
		return headlinetype.message();
	}


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Integer getProduct_id() {
		return product_id;
	}

	public void setProduct_id(Integer product_id) {
		this.product_id = product_id;
	}

	public CarImageTypeEnum getHeadlinetype() {
		return headlinetype;
	}

	public void setHeadlinetype(CarImageTypeEnum headlinetype) {
		this.headlinetype = headlinetype;
	}

	public String getPicpath() {
		return picpath;
	}

	public void setPicpath(String picpath) {
		this.picpath = picpath;
	}

	public Date getUploadtime() {
		return uploadtime;
	}

	public void setUploadtime(Date uploadtime) {
		this.uploadtime = uploadtime;
	}

	public Date getUpdatetime() {
		return updatetime;
	}

	public void setUpdatetime(Date updatetime) {
		this.updatetime = updatetime;
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
