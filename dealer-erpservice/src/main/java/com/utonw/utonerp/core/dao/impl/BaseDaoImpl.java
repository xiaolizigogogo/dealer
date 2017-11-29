package com.utonw.utonerp.core.dao.impl;


import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.utonw.dealer.api.util.erp.Constants;
import com.utonw.dealer.api.util.erp.PageModel;
import com.utonw.utonerp.core.dao.BaseDao;
import org.apache.ibatis.executor.ErrorContext;
import org.apache.ibatis.executor.ExecutorException;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.mapping.ParameterMapping;
import org.apache.ibatis.mapping.ParameterMode;
import org.apache.ibatis.reflection.MetaObject;
import org.apache.ibatis.reflection.property.PropertyTokenizer;
import org.apache.ibatis.scripting.xmltags.ForEachSqlNode;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.type.TypeHandler;
import org.apache.ibatis.type.TypeHandlerRegistry;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class BaseDaoImpl<T> extends SqlSessionDaoSupport implements BaseDao {
    private static Logger logger = LoggerFactory.getLogger(BaseDaoImpl.class);

    @Resource
    public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
        super.setSqlSessionFactory(sqlSessionFactory);
    }

    @Transactional
    public PageModel getPage(String classMethod, Object params,
                             Integer currPage) {
        try {
            Integer totalItem = getTotalCount(classMethod, params);
            PageModel pageModel = PageModel.newPageModel(Constants.MAX_LINES_PERPAGE,
                    currPage + "", totalItem);

            pageModel.setTotalRecord(totalItem);

            PageBounds pageBounds = new PageBounds(pageModel.getCurrentPage(), pageModel
                    .getPageSize());
            List<T> dataList = this.getSqlSession().selectList(classMethod, params, pageBounds);

            pageModel.setDataList(dataList);
            return pageModel;
        } catch (Exception e) {
            logger.error("分页出错===================", e);
            e.printStackTrace();
        }
        return null;
    }
    @Transactional
    public PageModel getPageAndSetItemCount(String classMethod, Object params,
                             Integer currPage,Integer itemCountPerPage) {
        try {
            Integer totalItem = getTotalCount(classMethod, params);
            PageModel pageModel = PageModel.newPageModel(itemCountPerPage,
                    currPage + "", totalItem);

            pageModel.setTotalRecord(totalItem);

            PageBounds pageBounds = new PageBounds(pageModel.getCurrentPage(), pageModel
                    .getPageSize());
            List<T> dataList = this.getSqlSession().selectList(classMethod, params, pageBounds);

            pageModel.setDataList(dataList);
            return pageModel;
        } catch (Exception e) {
            logger.error("分页出错===================", e);
            e.printStackTrace();
        }
        return null;
    }
    private int getTotalCount(String classMethod, Object parameterObject)
            throws Exception {
        int totalNum = 0;
        MappedStatement mappedStatement = this.getSqlSession().getConfiguration()
                .getMappedStatement(classMethod);
        BoundSql boundSql = mappedStatement.getBoundSql(parameterObject);
        String originalSql = boundSql.getSql().trim();
        logger.info("page Sql:" + originalSql.replaceAll("\n", "").replaceAll("  ", " ")
                .replaceAll("  ", " "));
        StringBuffer countSql = new StringBuffer(originalSql.length() + 100);
        countSql.append("select count(1) from (").append(originalSql).append(
                ") smtable");
        Connection connection =
                this.getSqlSession().getConnection();
        PreparedStatement countStmt = connection
                .prepareStatement(countSql.toString());
        BoundSql countBS = new BoundSql(mappedStatement.getConfiguration(),
                countSql.toString(), boundSql.getParameterMappings(),
                parameterObject);
        setParameters(countStmt, mappedStatement, countBS, parameterObject);
        ResultSet rs = countStmt.executeQuery();
        if (rs.next()) {
            totalNum = rs.getInt(1);
        }
        rs.close();
        countStmt.close();
        //connection.close();//此连接不能关闭

        return totalNum;
    }

    /**
     * &#x5bf9;SQL&#x53c2;&#x6570;(?)&#x8bbe;&#x503c;,&#x53c2;&#x8003;org.apache.ibatis.executor
     * .parameter.
     * DefaultParameterHandler
     *
     * @param ps
     * @param mappedStatement
     * @param boundSql
     * @param parameterObject
     * @throws SQLException
     */
    private void setParameters(PreparedStatement ps,
                               MappedStatement mappedStatement, BoundSql boundSql,
                               final Object parameterObject) throws SQLException {
        ErrorContext.instance().activity("setting parameters").object(
                mappedStatement.getParameterMap().getId());
        List<ParameterMapping> parameterMappings = boundSql
                .getParameterMappings();
        if (parameterMappings != null) {
            Configuration configuration = mappedStatement.getConfiguration();
            TypeHandlerRegistry typeHandlerRegistry = configuration
                    .getTypeHandlerRegistry();
            MetaObject metaObject = parameterObject == null ? null
                    : configuration.newMetaObject(parameterObject);
            for (int i = 0; i < parameterMappings.size(); i++) {
                ParameterMapping parameterMapping = parameterMappings.get(i);
                if (parameterMapping.getMode() != ParameterMode.OUT) {
                    Object value;
                    String propertyName = parameterMapping.getProperty();
                    PropertyTokenizer prop = new PropertyTokenizer(propertyName);
                    if (parameterObject == null) {
                        value = null;
                    } else if (typeHandlerRegistry
                            .hasTypeHandler(parameterObject.getClass())) {
                        value = parameterObject;
                    } else if (boundSql.hasAdditionalParameter(propertyName)) {
                        value = boundSql.getAdditionalParameter(propertyName);
                    } else if (propertyName
                            .startsWith(ForEachSqlNode.ITEM_PREFIX)
                            && boundSql.hasAdditionalParameter(prop.getName())) {
                        value = boundSql.getAdditionalParameter(prop.getName());
                        if (value != null) {
                            value = configuration.newMetaObject(value)
                                    .getValue(
                                            propertyName.substring(prop
                                                    .getName().length()));
                        }
                    } else {
                        value = metaObject == null ? null : metaObject
                                .getValue(propertyName);
                    }
                    TypeHandler typeHandler = parameterMapping.getTypeHandler();
                    if (typeHandler == null) {
                        throw new ExecutorException(
                                "There was no TypeHandler found for parameter "
                                        + propertyName + " of statement "
                                        + mappedStatement.getId());
                    }
                    logger.info("page Sql paramer:" + i + " " + value + " " + parameterMapping
                            .getJdbcType());
                    typeHandler.setParameter(ps, i + 1, value, parameterMapping
                            .getJdbcType());
                }
            }
        }
    }

}
