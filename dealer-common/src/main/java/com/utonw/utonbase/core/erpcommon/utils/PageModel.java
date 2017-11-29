package com.utonw.utonbase.core.erpcommon.utils;

import com.fasterxml.jackson.annotation.JsonIgnore;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;


/**
 * 翻页模板工具类
 */
public final class PageModel<T> implements Serializable {
    /**
     * 默认的序列化版本 id.
     */
    private static final long serialVersionUID = 1L;
    private int pageSize = 15;// 每页显示条数
    private int currentPage = 1;// 当前页
    private int totalPage;// 总页数
    private int totalRecord;// 总记录数
    private List<T> dataList;// 分页数据
    private int noloanorder;//未处理贷前订单
    private BigDecimal applyMoneySum; //放款金额 
    private BigDecimal userCommissionSum; //提成金额 
    
    

    public BigDecimal getApplyMoneySum() {
		return applyMoneySum;
	}

	public void setApplyMoneySum(BigDecimal applyMoneySum) {
		this.applyMoneySum = applyMoneySum;
	}

	public BigDecimal getUserCommissionSum() {
		return userCommissionSum;
	}

	public void setUserCommissionSum(BigDecimal userCommissionSum) {
		this.userCommissionSum = userCommissionSum;
	}

	public int getNoloanorder() {
		return noloanorder;
	}

	public void setNoloanorder(int noloanorder) {
		this.noloanorder = noloanorder;
	}

	@JsonIgnore
    private String pageStr;
    private boolean entityOrField = true; //
    // true:需要分页的地方，传入的参数就是Page实体；false:需要分页的地方，传入的参数所代表的实体拥有Page属性

    public PageModel() {
    }

    public PageModel(int _pageSize) {
        if (_pageSize > 0) {
            pageSize = _pageSize;
        }
    }

    public PageModel(Integer currentPage) {
        this.currentPage = currentPage;
    }

    /*
     * 初始化PageModel实例
     */
    private PageModel(final int pageSize, final String currPage,
                      final int totalRecord) {
        // 初始化每页显示条数
        this.pageSize = pageSize;
        // 设置总记录数
        this.totalRecord = totalRecord;
        // 初始化总页数
        setTotalPage();
        // 初始化当前页
        setCurrentPage(currPage);

    }

    /*
     * 外界获得PageModel实例
     */
    public static PageModel newPageModel(final int pageSize, final String page,
                                         final int totalRecord) {

        return new PageModel(pageSize, page, totalRecord);
    }

    // 设置当前请求页
    private void setCurrentPage(String page) {
        try {
            currentPage = Integer.parseInt(page);

        } catch (NumberFormatException e) {
            // 这里异常不做处理，当前页默认为1
            currentPage = 1;
        }
        // 如果当前页小于第一页时，当前页指定到首页
        if (currentPage < 1) {

            currentPage = 1;
        }

        if (currentPage > totalPage) {

            currentPage = totalPage;

        }

    }

    private void setTotalPage() {
        if (totalRecord % pageSize == 0) {

            totalPage = totalRecord / pageSize;
        } else {
            totalPage = totalRecord / pageSize + 1;
        }
    }

    /*
     * 获得当前页
     */
    public int getCurrentPage() {
        return currentPage;
    }

    /*
     * 获得总页数
     */
    public int getTotalPage() {
        return totalPage;

    }

    /*
     * 获得开始行数
     */
    public int getStartRow() {
        return (currentPage - 1) * pageSize;
    }

    /*
     * 获得结束行
     */
    public int getEndRow() {
        return currentPage * pageSize;
    }

    /*
     * 获得翻页数据
     */
    public List<T> getDataList() {
        return dataList;
    }

    /*
     * 设置翻页数据
     */
    public void setDataList(List<T> dataList) {
        this.dataList = dataList;
    }

    // 首页
    public int getFirst() {

        return 1;
    }

    // 上一页

    public int getPrevious() {

        return currentPage - 1;
    }

    // 下一页
    public int getNext() {

        return currentPage + 1;
    }

    // 尾页

    public int getLast() {

        return totalPage;
    }

    public int getTotalRecord() {
        return totalRecord;
    }

    public void setTotalRecord(int totalRecord) {
        this.totalRecord = totalRecord;
        setTotalPage();
    }

    public String getPageStr() {
        StringBuffer sb = new StringBuffer();
        if (totalRecord > 0) {
            sb.append(" <ul>\n");
            if (currentPage == 1) {
                sb.append(" <td align=\"right\">首页&nbsp;&nbsp;&nbsp;&nbsp;");
                sb.append("上页");
            } else {
                sb.append(" <td align=\"right\"><a href=\"#@\" onclick=\"nextPage(1)" +
                        "\">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;");
                sb.append(" <a href=\"#@\" onclick=\"nextPage("
                        + (currentPage - 1) + ")\">上页</a>\n");
            }
            int showTag = 10; // 分页标签显示数量
            int startTag = 1;
            if (currentPage > showTag) {
                startTag = currentPage - 1;
            }
            int endTag = startTag + showTag - 1;
            for (int i = startTag; i <= totalPage && i <= endTag; i++) {
                if (currentPage == i)
                    sb.append("&nbsp;&nbsp;" + i + "&nbsp;&nbsp;");
                else
                    sb.append("&nbsp;&nbsp;<a href=\"#@\" onclick=\"nextPage("
                            + i + ")\">" + i + "</a>&nbsp;&nbsp;");
            }
            if (currentPage == totalPage) {
                sb.append("&nbsp;&nbsp;下页&nbsp;&nbsp;");
                sb.append("&nbsp;&nbsp;末页&nbsp;&nbsp;");
            } else {
                sb.append("&nbsp;&nbsp;<a href=\"#@\" onclick=\"nextPage("
                        + (currentPage + 1) + ")\">下页</a>&nbsp;&nbsp;");
                sb.append("&nbsp;&nbsp;<a href=\"#@\" onclick=\"nextPage("
                        + totalPage + ")\">末页</a>&nbsp;&nbsp;");
            }
            sb.append(" &nbsp;&nbsp;第" + currentPage + "页&nbsp;&nbsp;");
            sb.append(" &nbsp;&nbsp;共" + totalPage + "页&nbsp;&nbsp;</td>");
            sb.append("</ul>\n");
            sb.append("<script type=\"text/javascript\">\n");
            sb.append(" function nextPage(pageUtil){\n");
            sb.append("var tmpHPage = document.URL.split(\"/\");");
            sb.append("var url = tmpHPage[ tmpHPage.length-1 ];");
            sb.append("        if(url.indexOf('?')>-1){\n");

            sb.append("            if(url.indexOf('currentPage')>-1){\n");
            sb.append("                var reg = /currentPage=\\d*/g;\n");
            sb.append("                url = url.replace(reg,'currentPage=');\n");
            sb.append("            }else{\n");
            sb.append("                url += \"&"
                    + (entityOrField ? "currentPage" : "currentPage")
                    + "=\";\n");
            sb.append("            }\n");
            sb.append("        }else{url += \"?"
                    + (entityOrField ? "currentPage" : "currentPage")
                    + "=\";}\n");
            sb.append("        document.location = url + pageUtil;\n");

            sb.append("}\n");
            sb.append("</script>");
        }
        pageStr = sb.toString();
        return pageStr;
    }

    public void setPageStr(String pageStr) {
        this.pageStr = pageStr;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    /**
     * 根据当前页获取到页面分页按钮的开始位置,总页数10页以内从1开始，总页数结束
     * 当前页大于4并且总页数大于10  从当前页减4开始，加5结束
     */
    public int getPageStartIndex() {
        if (this.currentPage > 4 && this.totalPage > 10) {
            if (this.totalPage - this.currentPage < 5) {
                //当前页为总页数减5之内时，开始的位置不能再减四，保证显示10条数据
                return this.totalPage - 9;
            }
            return this.currentPage - 4;

        }
        return 1;
    }

    /**
     * 根据当前页获取到页面分页按钮的结束位置,总页数10页以内从1开始，总页数结束
     * 当前页大于4并且总页数大于10  从当前页减4开始，加5结束
     */
    public int getPageEndIndex() {
        if (this.totalPage > 10) {
            if (this.currentPage > 4) {
                return this.currentPage + 5 > this.totalPage ? this.totalPage
                        : this.currentPage + 5;
            } else {
                return 10;
            }
        }
        return this.totalPage;
    }


}
