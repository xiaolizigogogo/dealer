package com.utonw.dealer.common.mapper.generated;


import org.apache.ibatis.annotations.Mapper;

import com.utonw.dealer.api.model.MerchantContactPerson;

@Mapper
public interface MerchantContactPersonMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table merchant_contact_person
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table merchant_contact_person
     *
     * @mbggenerated
     */
    int insert(MerchantContactPerson record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table merchant_contact_person
     *
     * @mbggenerated
     */
    int insertSelective(MerchantContactPerson record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table merchant_contact_person
     *
     * @mbggenerated
     */
    MerchantContactPerson selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table merchant_contact_person
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(MerchantContactPerson record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table merchant_contact_person
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(MerchantContactPerson record);
}