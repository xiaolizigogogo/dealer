package com.utonw.utonerp.core.dao;


import com.utonw.dealer.api.util.erp.PageModel;

public interface BaseDao<T> {
    PageModel<T> getPage(String classMethod, Object params, Integer curPage);
    //追加参数设置没有显示的list的条数，为了不影响base的既存代码，因而追加一个接口
    PageModel<T> getPageAndSetItemCount(String classMethod, Object params, Integer curPage, Integer itemCountPerPage);
}
