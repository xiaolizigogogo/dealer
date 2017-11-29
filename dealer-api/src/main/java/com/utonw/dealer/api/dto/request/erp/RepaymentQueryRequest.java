package com.utonw.dealer.api.dto.request.erp;

import java.util.List;

/**
 * 还款管理查询请求
 * 
 * @author jml 2016年9月19日 RepaymentQueryRequest.java
 */
public class RepaymentQueryRequest {
	private String orderId;// 订单号
	private String dateRange;// 月份
	private String customerName;// 客户姓名
	private String repayStatus;// 是否还款
	private String company;// 选择分公司
	private String dept;// 选择部门
	private String manager;// 选择客户经理
	private String contractNum;
	private int pageStart;// 起始
	private int pageEnd;// 结束
	private List<String> repayPlanIds;
	private Integer dataAccessLevel;//权限等级
	private String uuid;//用户uuid
	private Integer deptId;//部门Id
	private Integer companyId;//公司Id

	
	public List<String> getRepayPlanIds() {
		return repayPlanIds;
	}

	public void setRepayPlanIds(List<String> repayPlanIds) {
		this.repayPlanIds = repayPlanIds;
	}

	public String getContractNum() {
		return contractNum;
	}

	public void setContractNum(String contractNum) {
		this.contractNum = contractNum;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getDateRange() {
		return dateRange;
	}

	public void setDateRange(String dateRange) {
		this.dateRange = dateRange;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getRepayStatus() {
		return repayStatus;
	}

	public void setRepayStatus(String repayStatus) {
		this.repayStatus = repayStatus;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
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

	public int getPageStart() {
		return pageStart;
	}

	public void setPageStart(int pageStart) {
		this.pageStart = pageStart;
	}

	public int getPageEnd() {
		return pageEnd;
	}

	public void setPageEnd(int pageEnd) {
		this.pageEnd = pageEnd;
	}

	public Integer getDataAccessLevel() {
		return dataAccessLevel;
	}

	public void setDataAccessLevel(Integer dataAccessLevel) {
		this.dataAccessLevel = dataAccessLevel;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public Integer getDeptId() {
		return deptId;
	}

	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}

	public Integer getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}

}
