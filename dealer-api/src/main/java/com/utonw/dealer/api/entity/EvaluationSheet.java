package com.utonw.dealer.api.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableId;
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
 * @since 2017-05-10
 */
@TableName("evaluation_sheet")
public class EvaluationSheet extends Model<EvaluationSheet> {

    private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId(type = IdType.UUID)
	private String id;

	/**
	 * 订单id
	 */
	private String indentid;

	/**
	 * 车id
	 */
	private Integer pruductid;

	/**
	 * 评估师id
	 */
	private Long acountid;

	/**
	 * 系统评估
	 */
	private BigDecimal systemassess;

	/**
	 * 收车价格
	 */
	private BigDecimal buyprice;

	/**
	 * 评估师评估价
	 */
	private BigDecimal appraisersprice;

	/**
	 * 整备价格 
	 */
	private BigDecimal hostlingcost;
	
	/**
	 * 博朗评估价格 
	 */
	private BigDecimal braunassessmentprice;

	/**
	 * 贷款额度
	 */
	private String loanlimit;

	/**
	 * 车况评估
	 */
	private String condition;

	/**
	 * 评估师点评
	 */
	private String remark;

	/**
	 * 评估时间
	 */
	private Date evaluationtime;

	/**
	 * 行驶证(1:否 2：是)
	 */
	private Integer travellicense;

	/**
	 * 商业全险(1:否 2：是) 
	 */
	private Integer commercial;

	/**
	 * 离省(1:否 2：是)
	 */
	private Integer leaveprovince;

	/**
	 * 
	 */
	private Date updatetime;

	/**
	 * 更新者(记录评估者)
	 */
	private Long updateby;

	/**
	 * 市场指导价
	 */
	private BigDecimal guideprice;
	/**
	 * 精准估价url
	 */
	private String evaluationurl;
	/**
	 * 4s维保url
	 */
	private String maintainurl;
	/**
	 * sn码
	 */
	private String sn;


	public String getSn() {
		return sn;
	}

	public void setSn(String sn) {
		this.sn = sn;
	}

	public String getEvaluationurl() {
		return evaluationurl;
	}

	public void setEvaluationurl(String evaluationurl) {
		this.evaluationurl = evaluationurl;
	}

	public String getMaintainurl() {
		return maintainurl;
	}

	public void setMaintainurl(String maintainurl) {
		this.maintainurl = maintainurl;
	}

	public BigDecimal getGuideprice() {
		return guideprice;
	}

	public void setGuideprice(BigDecimal guideprice) {
		this.guideprice = guideprice;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getIndentid() {
		return indentid;
	}

	public void setIndentid(String indentid) {
		this.indentid = indentid;
	}

	public Integer getPruductid() {
		return pruductid;
	}

	public void setPruductid(Integer pruductid) {
		this.pruductid = pruductid;
	}

	public Long getAcountid() {
		return acountid;
	}

	public void setAcountid(Long acountid) {
		this.acountid = acountid;
	}

	public BigDecimal getSystemassess() {
		return systemassess;
	}

	public void setSystemassess(BigDecimal systemassess) {
		this.systemassess = systemassess;
	}

	public BigDecimal getBuyprice() {
		return buyprice;
	}

	public void setBuyprice(BigDecimal buyprice) {
		this.buyprice = buyprice;
	}

	public BigDecimal getAppraisersprice() {
		return appraisersprice;
	}

	public void setAppraisersprice(BigDecimal appraisersprice) {
		this.appraisersprice = appraisersprice;
	}

	public BigDecimal getHostlingcost() {
		return hostlingcost;
	}

	public void setHostlingcost(BigDecimal hostlingcost) {
		this.hostlingcost = hostlingcost;
	}

	public BigDecimal getBraunassessmentprice() {
		return braunassessmentprice;
	}

	public void setBraunassessmentprice(BigDecimal braunassessmentprice) {
		this.braunassessmentprice = braunassessmentprice;
	}

	public String getLoanlimit() {
		return loanlimit;
	}

	public void setLoanlimit(String loanlimit) {
		this.loanlimit = loanlimit;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Date getEvaluationtime() {
		return evaluationtime;
	}

	public void setEvaluationtime(Date evaluationtime) {
		this.evaluationtime = evaluationtime;
	}

	public Integer getTravellicense() {
		return travellicense;
	}

	public void setTravellicense(Integer travellicense) {
		this.travellicense = travellicense;
	}

	public Integer getCommercial() {
		return commercial;
	}

	public void setCommercial(Integer commercial) {
		this.commercial = commercial;
	}

	public Integer getLeaveprovince() {
		return leaveprovince;
	}

	public void setLeaveprovince(Integer leaveprovince) {
		this.leaveprovince = leaveprovince;
	}

	public Date getUpdatetime() {
		return updatetime;
	}

	public void setUpdatetime(Date updatetime) {
		this.updatetime = updatetime;
	}

	public Long getUpdateby() {
		return updateby;
	}

	public void setUpdateby(Long updateby) {
		this.updateby = updateby;
	}
	@Override
	protected Serializable pkVal() {
		// TODO Auto-generated method stub
		return id;
	}

}
