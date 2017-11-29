package com.utonw.dealer.api.entity.erp;

import java.io.Serializable;

public class TodoInsEntity implements Serializable {
    private static final long serialVersionUID = 4279938554510320637L;
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_todoins.ID
     *
     * @mbggenerated
     */
    private String id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_todoins.business
     *
     * @mbggenerated
     */
    private String business;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_todoins.businesskey
     *
     * @mbggenerated
     */
    private String businesskey;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_todoins.ID
     *
     * @return the value of t_todoins.ID
     *
     * @mbggenerated
     */
    public String getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_todoins.ID
     *
     * @param id the value for t_todoins.ID
     *
     * @mbggenerated
     */
    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_todoins.business
     *
     * @return the value of t_todoins.business
     *
     * @mbggenerated
     */
    public String getBusiness() {
        return business;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_todoins.business
     *
     * @param business the value for t_todoins.business
     *
     * @mbggenerated
     */
    public void setBusiness(String business) {
        this.business = business == null ? null : business.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_todoins.businesskey
     *
     * @return the value of t_todoins.businesskey
     *
     * @mbggenerated
     */
    public String getBusinesskey() {
        return businesskey;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_todoins.businesskey
     *
     * @param businesskey the value for t_todoins.businesskey
     *
     * @mbggenerated
     */
    public void setBusinesskey(String businesskey) {
        this.businesskey = businesskey == null ? null : businesskey.trim();
    }
}