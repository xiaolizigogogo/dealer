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
 * @since 2017-05-06
 */
@TableName("task_manage")
public class TaskManage extends Model<TaskManage> {

	private static final long serialVersionUID = 1L;

	/**
	 * 任务ID(UUID)
	 */
	@TableId(type = IdType.UUID)
	private String id;

	/**
	 * 任务名称
	 */
	private String taskname;

	/**
	 * 车商账号
	 */
	private Long merchantid;

	/**
	 * 角色id
	 */
	private String roleid;

	/**
	 *
	 */
	private Long taskassigee;

	/**
	 *
	 */
	private Integer status;

	/**
	 * 任务创建时间
	 */
	private Date createtime;

	/**
	 * 任务完成时间
	 */
	private Date finishtime;
	/**
	 * 订单ID
	 */
   private String indentid;

	/**
	 * 地区ID
	 */
	private Integer regionid;


	public Integer getRegionid() {
		return regionid;
	}

	public void setRegionid(Integer regionid) {
		this.regionid = regionid;
	}

	public String getIndentid() {
		return indentid;
	}

	public void setIndentid(String indentid) {
		this.indentid = indentid;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTaskname() {
		return taskname;
	}

	public void setTaskname(String taskname) {
		this.taskname = taskname;
	}

	public Long getMerchantid() {
		return merchantid;
	}

	public void setMerchantid(Long merchantid) {
		this.merchantid = merchantid;
	}

	public String getRoleid() {
		return roleid;
	}

	public void setRoleid(String roleid) {
		this.roleid = roleid;
	}

	public Long getTaskassigee() {
		return taskassigee;
	}

	public void setTaskassigee(Long taskassigee) {
		this.taskassigee = taskassigee;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public Date getFinishtime() {
		return finishtime;
	}

	public void setFinishtime(Date finishtime) {
		this.finishtime = finishtime;
	}
	@Override
	protected Serializable pkVal() {
		// TODO Auto-generated method stub
		return id;
	}

}
