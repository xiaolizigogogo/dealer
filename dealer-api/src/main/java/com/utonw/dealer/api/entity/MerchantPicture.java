package com.utonw.dealer.api.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.utonw.dealer.api.enums.CarImageTypeEnum;
import com.utonw.dealer.api.enums.ImageTypeEnum;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 车商联络人相关
 * </p>
 *
 * @author wangyj
 * @since 2017-05-04
 */
@TableName("merchant_picture")
public class MerchantPicture extends Model<MerchantPicture> {

    private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId(type = IdType.UUID)
	private String id;

	/**
	 * 商家ID
	 */
	private Long acountid;

	/**
	 * (1:夫妻双方身份证 2：结婚证（离婚证）3：户口本 4：房产证或购房合同 5：夫妻双方正信 6：营业执照 7：法人身份证8：场地租赁/购房合同 9：场地照片 10：近6个月主要账号流水 11：目前员工身份证和联系方式 12:摄像头)
	 */
	private ImageTypeEnum filetitle;

	/**
	 * 
	 */
	private Date createdate;

	/**
	 * 图片路径
	 */
	private String fileurl;
	
	/**
	 * 图片来源(pc,app)
	 */
	@TableField(value="fileSource")
	private String fileSource;

	/**
	 * (是否通过，1：通过，2：未通过)
	 */
	private Integer reviewstatus;
	@TableField(exist = false)
	private String pictureTypeName;

	public String getPictureTypeName() {
		return filetitle.message();
	}


	public String getFileSource() {
		return fileSource;
	}


	public void setFileSource(String fileSource) {
		this.fileSource = fileSource;
	}


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Long getAcountid() {
		return acountid;
	}

	public void setAcountid(Long acountid) {
		this.acountid = acountid;
	}

	public ImageTypeEnum getFiletitle() {
		return filetitle;
	}

	public void setFiletitle(ImageTypeEnum filetitle) {
		this.filetitle = filetitle;
	}

	public Date getCreatedate() {
		return createdate;
	}

	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}

	public String getFileurl() {
		return fileurl;
	}

	public void setFileurl(String fileurl) {
		this.fileurl = fileurl;
	}

	public Integer getReviewstatus() {
		return reviewstatus;
	}

	public void setReviewstatus(Integer reviewstatus) {
		this.reviewstatus = reviewstatus;
	}

	@Override
	protected Serializable pkVal() {
		// TODO Auto-generated method stub
		return id;
	}

}
