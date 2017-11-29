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
 * @since 2017-07-07
 */
@TableName("carsok_zb_task")
public class CarsokZbTask extends Model<CarsokZbTask> {

    private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId(type = IdType.UUID)
	private Integer id;

	/**
	 * 车辆名称
	 */
	private String carname;

	/**
	 * 车牌号
	 */
	private String carnum;

	/**
	 * 过户后车牌号
	 */
	private String lastcarnum;

	/**
	 * 任务状态(1:评估师代办 2:整备员代办 3:经理代办 4:运营专员代办 5:任务完成)
	 */
	private Integer taskstatus;

	/**
	 * 任务单号
	 */
	private String tasknum;

	/**
	 * 任务所属账户
	 */
	private String taskaccount;

	/**
	 * 任务时间
	 */
	private Date tasktime;

	/**
	 * 
	 */
	private Boolean enable;

	/**
	 * 
	 */
	private String vin;

	/**
	 * 
	 */
	@TableField(value="maintain_info")
	private String maintainInfo;

	/**
	 * 
	 */
	@TableField(value="product_id")
	private String productId;



	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCarname() {
		return carname;
	}

	public void setCarname(String carname) {
		this.carname = carname;
	}

	public String getCarnum() {
		return carnum;
	}

	public void setCarnum(String carnum) {
		this.carnum = carnum;
	}

	public String getLastcarnum() {
		return lastcarnum;
	}

	public void setLastcarnum(String lastcarnum) {
		this.lastcarnum = lastcarnum;
	}

	public Integer getTaskstatus() {
		return taskstatus;
	}

	public void setTaskstatus(Integer taskstatus) {
		this.taskstatus = taskstatus;
	}

	public String getTasknum() {
		return tasknum;
	}

	public void setTasknum(String tasknum) {
		this.tasknum = tasknum;
	}

	public String getTaskaccount() {
		return taskaccount;
	}

	public void setTaskaccount(String taskaccount) {
		this.taskaccount = taskaccount;
	}

	public Date getTasktime() {
		return tasktime;
	}

	public void setTasktime(Date tasktime) {
		this.tasktime = tasktime;
	}

	public Boolean getEnable() {
		return enable;
	}

	public void setEnable(Boolean enable) {
		this.enable = enable;
	}

	public String getVin() {
		return vin;
	}

	public void setVin(String vin) {
		this.vin = vin;
	}

	public String getMaintainInfo() {
		return maintainInfo;
	}

	public void setMaintainInfo(String maintainInfo) {
		this.maintainInfo = maintainInfo;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}
	@Override
	protected Serializable pkVal() {
		// TODO Auto-generated method stub
		return id;
	}

}
