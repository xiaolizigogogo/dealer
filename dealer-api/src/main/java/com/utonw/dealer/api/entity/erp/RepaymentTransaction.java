package com.utonw.dealer.api.entity.erp;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class RepaymentTransaction implements Serializable {
    private static final long serialVersionUID = 7357174160994390675L;
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column repaymenttransaction.uuid
     *
     * @mbggenerated
     */
    private String uuid;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column repaymenttransaction.id
     *
     * @mbggenerated
     */
    private Long id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column repaymenttransaction.actualRepaymentCaptialSum
     *
     * @mbggenerated
     */
    private BigDecimal actualRepaymentCaptialSum;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column repaymenttransaction.actualRepaymentInterestSum
     *
     * @mbggenerated
     */
    private BigDecimal actualRepaymentInterestSum;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column repaymenttransaction.actualRepaymentSum
     *
     * @mbggenerated
     */
    private BigDecimal actualRepaymentSum;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column repaymenttransaction.actalRepaymentFee
     *
     * @mbggenerated
     */
    private String actalRepaymentFee;
    
    
    private BigDecimal manageFee;
    private BigDecimal gpsCost;
    private BigDecimal parkCost;
    private BigDecimal towCost;
    private BigDecimal checkCost;
    private BigDecimal depreciationFee;
    private BigDecimal drunkDrive;
    private BigDecimal cashdepositFee;
    private BigDecimal certificatefee;
    private BigDecimal overdueFee;
    private BigDecimal visitCost;
    private BigDecimal penaltyFee;
    
    public BigDecimal getPenaltyFee() {
		return penaltyFee;
	}

	public void setPenaltyFee(BigDecimal penaltyFee) {
		this.penaltyFee = penaltyFee;
	}

	public BigDecimal getManageFee() {
		return manageFee;
	}

	public void setManageFee(BigDecimal manageFee) {
		this.manageFee = manageFee;
	}

	public BigDecimal getGpsCost() {
		return gpsCost;
	}

	public void setGpsCost(BigDecimal gpsCost) {
		this.gpsCost = gpsCost;
	}

	public BigDecimal getParkCost() {
		return parkCost;
	}

	public void setParkCost(BigDecimal parkCost) {
		this.parkCost = parkCost;
	}

	public BigDecimal getTowCost() {
		return towCost;
	}

	public void setTowCost(BigDecimal towCost) {
		this.towCost = towCost;
	}

	public BigDecimal getCheckCost() {
		return checkCost;
	}

	public void setCheckCost(BigDecimal checkCost) {
		this.checkCost = checkCost;
	}

	public BigDecimal getDepreciationFee() {
		return depreciationFee;
	}

	public void setDepreciationFee(BigDecimal depreciationFee) {
		this.depreciationFee = depreciationFee;
	}

	public BigDecimal getDrunkDrive() {
		return drunkDrive;
	}

	public void setDrunkDrive(BigDecimal drunkDrive) {
		this.drunkDrive = drunkDrive;
	}

	public BigDecimal getCashdepositFee() {
		return cashdepositFee;
	}

	public void setCashdepositFee(BigDecimal cashdepositFee) {
		this.cashdepositFee = cashdepositFee;
	}

	public BigDecimal getCertificatefee() {
		return certificatefee;
	}

	public void setCertificatefee(BigDecimal certificatefee) {
		this.certificatefee = certificatefee;
	}

	public BigDecimal getOverdueFee() {
		return overdueFee;
	}

	public void setOverdueFee(BigDecimal overdueFee) {
		this.overdueFee = overdueFee;
	}

	public BigDecimal getVisitCost() {
		return visitCost;
	}

	public void setVisitCost(BigDecimal visitCost) {
		this.visitCost = visitCost;
	}

	


    private String repaymentId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column repaymenttransaction.createDay
     *
     * @mbggenerated
     */
    private Date createDay;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column repaymenttransaction.updateDay
     *
     * @mbggenerated
     */
    private Date updateDay;

   


	public RepaymentTransaction() {
		// TODO Auto-generated constructor stub
	}

	public RepaymentTransaction(String result){
		
	}

	/**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column repaymenttransaction.uuid
     *
     * @return the value of repaymenttransaction.uuid
     *
     * @mbggenerated
     */
    public String getUuid() {
        return uuid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column repaymenttransaction.uuid
     *
     * @param uuid the value for repaymenttransaction.uuid
     *
     * @mbggenerated
     */
    public void setUuid(String uuid) {
        this.uuid = uuid == null ? null : uuid.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column repaymenttransaction.id
     *
     * @return the value of repaymenttransaction.id
     *
     * @mbggenerated
     */
    public Long getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column repaymenttransaction.id
     *
     * @param id the value for repaymenttransaction.id
     *
     * @mbggenerated
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column repaymenttransaction.actualRepaymentCaptialSum
     *
     * @return the value of repaymenttransaction.actualRepaymentCaptialSum
     *
     * @mbggenerated
     */
    public BigDecimal getActualRepaymentCaptialSum() {
        return actualRepaymentCaptialSum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column repaymenttransaction.actualRepaymentCaptialSum
     *
     * @param actualRepaymentCaptialSum the value for repaymenttransaction.actualRepaymentCaptialSum
     *
     * @mbggenerated
     */
    public void setActualRepaymentCaptialSum(BigDecimal actualRepaymentCaptialSum) {
        this.actualRepaymentCaptialSum = actualRepaymentCaptialSum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column repaymenttransaction.actualRepaymentInterestSum
     *
     * @return the value of repaymenttransaction.actualRepaymentInterestSum
     *
     * @mbggenerated
     */
    public BigDecimal getActualRepaymentInterestSum() {
        return actualRepaymentInterestSum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column repaymenttransaction.actualRepaymentInterestSum
     *
     * @param actualRepaymentInterestSum the value for repaymenttransaction.actualRepaymentInterestSum
     *
     * @mbggenerated
     */
    public void setActualRepaymentInterestSum(BigDecimal actualRepaymentInterestSum) {
        this.actualRepaymentInterestSum = actualRepaymentInterestSum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column repaymenttransaction.actualRepaymentSum
     *
     * @return the value of repaymenttransaction.actualRepaymentSum
     *
     * @mbggenerated
     */
    public BigDecimal getActualRepaymentSum() {
        return actualRepaymentSum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column repaymenttransaction.actualRepaymentSum
     *
     * @param actualRepaymentSum the value for repaymenttransaction.actualRepaymentSum
     *
     * @mbggenerated
     */
    public void setActualRepaymentSum(BigDecimal actualRepaymentSum) {
        this.actualRepaymentSum = actualRepaymentSum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column repaymenttransaction.actalRepaymentFee
     *
     * @return the value of repaymenttransaction.actalRepaymentFee
     *
     * @mbggenerated
     */
    public String getActalRepaymentFee() {
        return actalRepaymentFee;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column repaymenttransaction.actalRepaymentFee
     *
     * @param actalRepaymentFee the value for repaymenttransaction.actalRepaymentFee
     *
     * @mbggenerated
     */
    public void setActalRepaymentFee(String actalRepaymentFee) {
        this.actalRepaymentFee = actalRepaymentFee == null ? null : actalRepaymentFee.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column repaymenttransaction.createDay
     *
     * @return the value of repaymenttransaction.createDay
     *
     * @mbggenerated
     */
    public Date getCreateDay() {
        return createDay;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column repaymenttransaction.createDay
     *
     * @param createDay the value for repaymenttransaction.createDay
     *
     * @mbggenerated
     */
    public void setCreateDay(Date createDay) {
        this.createDay = createDay;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column repaymenttransaction.updateDay
     *
     * @return the value of repaymenttransaction.updateDay
     *
     * @mbggenerated
     */
    public Date getUpdateDay() {
        return updateDay;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column repaymenttransaction.updateDay
     *
     * @param updateDay the value for repaymenttransaction.updateDay
     *
     * @mbggenerated
     */
    public void setUpdateDay(Date updateDay) {
        this.updateDay = updateDay;
    }


    public String getRepaymentId() {
        return repaymentId;
    }

    public void setRepaymentId(String repaymentId) {
        this.repaymentId = repaymentId;
    }
}