package com.utonw.dealer.common.mapper.generated;

import org.apache.ibatis.annotations.Mapper;

import com.utonw.dealer.api.model.MerchantPicture;
@Mapper
public interface MerchantPictureMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table merchant_picture
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table merchant_picture
     *
     * @mbggenerated
     */
    int insert(MerchantPicture record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table merchant_picture
     *
     * @mbggenerated
     */
    int insertSelective(MerchantPicture record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table merchant_picture
     *
     * @mbggenerated
     */
    MerchantPicture selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table merchant_picture
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(MerchantPicture record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table merchant_picture
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(MerchantPicture record);
}