package com.utonw.dealer.api.entity;

import java.io.Serializable;

import com.baomidou.mybatisplus.enums.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 线下人员分配车行表
 * </p>
 *
 * @author 
 * @since 2017-09-26
 */
@TableName("t_distribution_rfid")
public class TDistributionRfidEntity extends Model<TDistributionRfidEntity> {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
	@TableId(value="id", type= IdType.AUTO)
	private Integer id;
    /**
     * 线下人员uuid
     */
	@TableField("user_id")
	private String userId;
    /**
     * 车行id
     */
	@TableField("dealer_id")
	private Integer dealerId;
    /**
     * 分配时间
     */
	@TableField("allocation_time")
	private Date allocationTime;
    /**
     * 数据状态  1、有效  2、无效
     */
	private Integer status;
    /**
     * 创建时间
     */
	@TableField("create_time")
	private Date createTime;
    /**
     * 修改时间
     */
	@TableField("update_time")
	private Date updateTime;
    /**
     * 创建人
     */
	@TableField("creat_id")
	private String creatId;
    /**
     * 修改人
     */
	@TableField("update_id")
	private String updateId;


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Integer getDealerId() {
		return dealerId;
	}

	public void setDealerId(Integer dealerId) {
		this.dealerId = dealerId;
	}

	public Date getAllocationTime() {
		return allocationTime;
	}

	public void setAllocationTime(Date allocationTime) {
		this.allocationTime = allocationTime;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
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

	public String getCreatId() {
		return creatId;
	}

	public void setCreatId(String creatId) {
		this.creatId = creatId;
	}

	public String getUpdateId() {
		return updateId;
	}

	public void setUpdateId(String updateId) {
		this.updateId = updateId;
	}

	@Override
	protected Serializable pkVal() {
		return this.id;
	}

	@Override
	public String toString() {
		return "TDistributionRfid{" +
			", id=" + id +
			", userId=" + userId +
			", dealerId=" + dealerId +
			", allocationTime=" + allocationTime +
			", status=" + status +
			", createTime=" + createTime +
			", updateTime=" + updateTime +
			", creatId=" + creatId +
			", updateId=" + updateId +
			"}";
	}
}
