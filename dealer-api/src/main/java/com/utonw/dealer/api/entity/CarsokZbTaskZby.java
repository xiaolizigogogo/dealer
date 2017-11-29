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
 * 
 * </p>
 *
 * @author wangyj
 * @since 2017-07-07
 */
@TableName("carsok_zb_task_zby")
public class CarsokZbTaskZby extends Model<CarsokZbTaskZby> {

    private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId(type = IdType.UUID)
	private Integer id;

	/**
	 * 主任务ID
	 */
	private Integer tid;

	/**
	 * 整备金额
	 */
	private BigDecimal zbmoney;

	/**
	 * 备注
	 */
	private String remark;

	/**
	 * 
	 */
	@TableField(value="create_time")
	private Date createTime;



	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getTid() {
		return tid;
	}

	public void setTid(Integer tid) {
		this.tid = tid;
	}

	public BigDecimal getZbmoney() {
		return zbmoney;
	}

	public void setZbmoney(BigDecimal zbmoney) {
		this.zbmoney = zbmoney;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	@Override
	protected Serializable pkVal() {
		// TODO Auto-generated method stub
		return id;
	}

}
