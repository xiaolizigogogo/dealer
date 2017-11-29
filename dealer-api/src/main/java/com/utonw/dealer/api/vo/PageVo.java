package com.utonw.dealer.api.vo;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

/**
 * Created by DONG on 2015/9/21.
 */
public class PageVo<T> implements Cloneable,Serializable {


    private static final long serialVersionUID = 4608646697035788381L;
    private int totalcount;
    private int totalpage;
    private int currentpage;
    private boolean hasnext;
    private boolean haslast;
    private List<T> context;
    private List<Map<String,Object>> contextMap;
    private int noloanorder;//未处理贷前订单

    public int getNoloanorder() {
		return noloanorder;
	}

	public void setNoloanorder(int noloanorder) {
		this.noloanorder = noloanorder;
	}

	public int getTotalcount() {
        return totalcount;
    }

    public void setTotalcount(int totalcount) {
        this.totalcount = totalcount;
    }

    public int getTotalpage() {
        return totalpage;
    }

    public void setTotalpage(int totalpage) {
        this.totalpage = totalpage;
    }

    public int getCurrentpage() {
        return currentpage;
    }

    public void setCurrentpage(int currentpage) {
        this.currentpage = currentpage;
    }

    public boolean isHasnext() {
        return hasnext;
    }

    public void setHasnext(boolean hasnext) {
        this.hasnext = hasnext;
    }

    public boolean isHaslast() {
        return haslast;
    }

    public void setHaslast(boolean haslast) {
        this.haslast = haslast;
    }

    public List<T> getContext() {
        return context;
    }

    public void setContext(List<T> context) {
        this.context = context;
    }

    @Override
    public  Object clone() throws CloneNotSupportedException {
        Object o=null;
        try {
            o=super.clone();
        } catch (CloneNotSupportedException e) {
            e.printStackTrace();
        }
        return o;
    }

	public List<Map<String, Object>> getContextMap() {
		return contextMap;
	}

	public void setContextMap(List<Map<String, Object>> contextMap) {
		this.contextMap = contextMap;
	}

	
    
    
}
