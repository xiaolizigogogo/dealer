package com.utonw.dealer.api.vo;

import java.io.Serializable;
import java.util.List;

public class HisTodoPage implements Serializable {


	private static final long serialVersionUID = -7409396822574173359L;
	private int totalcount;
	private int totalpage;
	private int currentpage;
	private boolean hasnext;
	private boolean haslast;
	private List<HisTodoVO> context;

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

	public List<HisTodoVO> getContext() {
		return context;
	}

	public void setContext(List<HisTodoVO> context) {
		this.context = context;
	}

	
}
