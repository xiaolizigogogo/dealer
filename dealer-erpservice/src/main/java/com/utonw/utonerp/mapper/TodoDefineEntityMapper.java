package com.utonw.utonerp.mapper;


import com.utonw.dealer.api.entity.erp.TodoDefineEntity;
import org.springframework.stereotype.Component;

@Component
public interface TodoDefineEntityMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_tododefine
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(String id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_tododefine
     *
     * @mbggenerated
     */
    int insert(TodoDefineEntity record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_tododefine
     *
     * @mbggenerated
     */
    int insertSelective(TodoDefineEntity record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_tododefine
     *
     * @mbggenerated
     */
    TodoDefineEntity selectByPrimaryKey(String id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_tododefine
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(TodoDefineEntity record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_tododefine
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(TodoDefineEntity record);

    /**
     *
     * @param business
     * @return
     */
    TodoDefineEntity selectByBussinessId(String business);


}