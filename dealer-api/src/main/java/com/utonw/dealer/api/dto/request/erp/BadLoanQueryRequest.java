package com.utonw.dealer.api.dto.request.erp;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 坏账查询请求
 * 
 * @author Administrator
 *
 */
public class BadLoanQueryRequest implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 6331307022802280669L;
	private String dateRange;// 日期范围
	private Integer issue;// 期数
	private String loanProduct;// 贷款产品
	private String repayWay;// 还款方式
	private String pledgeType;// 抵押方式
	private BigDecimal minLoanMoney;// 最小借款金额
	private BigDecimal maxLoanMoney;// 最大借款金额
	private Integer company;// 分公司名
	private String dept;// 部门
	private String manager;// 客户经理
	private int page;// 当前页
	private int pageCount;
	private Date dateStart;// 开始时间
	private Date dateEnd;// 结束时间
	private Integer dataAccessLevel;//权限等级
	private String uuid;//用户uuid
	private Integer deptId;//部门Id
	private Integer companyId;//公司Id

	public String getDateRange() {
		return dateRange;
	}

	public void setDateRange(String dateRange) {
		this.dateRange = dateRange;
	}

	public Integer getIssue() {
		return issue;
	}

	public void setIssue(Integer issue) {
		this.issue = issue;
	}

	public String getLoanProduct() {
		return loanProduct;
	}

	public void setLoanProduct(String loanProduct) {
		this.loanProduct = loanProduct;
	}

	public String getRepayWay() {
		return repayWay;
	}

	public void setRepayWay(String repayWay) {
		this.repayWay = repayWay;
	}

	public String getPledgeType() {
		return pledgeType;
	}

	public void setPledgeType(String pledgeType) {
		this.pledgeType = pledgeType;
	}

	public BigDecimal getMinLoanMoney() {
		return minLoanMoney;
	}

	public void setMinLoanMoney(BigDecimal minLoanMoney) {
		this.minLoanMoney = minLoanMoney;
	}

	public BigDecimal getMaxLoanMoney() {
		return maxLoanMoney;
	}

	public void setMaxLoanMoney(BigDecimal maxLoanMoney) {
		this.maxLoanMoney = maxLoanMoney;
	}

	public Integer getCompany() {
		return company;
	}

	public void setCompany(Integer company) {
		this.company = company;
	}

	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	public String getManager() {
		return manager;
	}

	public void setManager(String manager) {
		this.manager = manager;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public Date getDateStart() {
		return dateStart;
	}

	public void setDateStart(Date dateStart) {
		this.dateStart = dateStart;
	}

	public Date getDateEnd() {
		return dateEnd;
	}

	public void setDateEnd(Date dateEnd) {
		this.dateEnd = dateEnd;
	}

	public Integer getDataAccessLevel() { return dataAccessLevel; }

	public void setDataAccessLevel(Integer dataAccessLevel) { this.dataAccessLevel = dataAccessLevel; }

	public String getUuid() { return uuid; }

	public void setUuid(String uuid) { this.uuid = uuid; }

	public Integer getDeptId() { return deptId; }

	public void setDeptId(Integer deptId) { this.deptId = deptId; }

	public Integer getCompanyId() { return companyId; }

	public void setCompanyId(Integer companyId) { this.companyId = companyId; }
}
