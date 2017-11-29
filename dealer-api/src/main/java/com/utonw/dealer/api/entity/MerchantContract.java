package com.utonw.dealer.api.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.utonw.dealer.api.enums.AuditContracEnum;

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
@TableName("merchant_contract")
public class MerchantContract extends Model<MerchantContract> {

    private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId(type = IdType.UUID)
	private String id;

	/**
	 * 合同url
	 */
	private String contractpath;

	/**
	 * 合同编号
	 */
	private String contractnum;

	/**
	 * 经销商 ID
	 */
	private Long acountid;

	/**
	 * 1:车商融资贷款合同 2:联保合同 3:展厅转租与APP合同 4：金融专员授权证书
	 */
	private AuditContracEnum contracttype;

	/**
	 * 上传时间
	 */
	private Date uploaddate;
	@TableField(exist = false)
	private String pictureTypeName;

	public String getPictureTypeName() {
		return contracttype.message();
	}


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

	public Long getAcountid() {
		return acountid;
	}

	public void setAcountid(Long acountid) {
		this.acountid = acountid;
	}

	public AuditContracEnum getContracttype() {
		return contracttype;
	}

	public void setContracttype(AuditContracEnum contracttype) {
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
