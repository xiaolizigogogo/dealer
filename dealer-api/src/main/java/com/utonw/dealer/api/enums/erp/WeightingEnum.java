package com.utonw.dealer.api.enums.erp;

import java.math.BigDecimal;

public enum WeightingEnum{
	a(1,10,3000),
	b(10,20,5000),
	c(20,40,10000),
	d(40,50,15000),
	e(50,60,18000),
	f(60,70,22000),
	g(70,80,25000),
	h(80,90,30000),
	j(90,-1,40000),

    ;
    int start;
    int end;
    int weighting;
   
    WeightingEnum(int start, int end,int weighting) {
        this.start = start;
        this.end = end;
        this.weighting=weighting;
    }

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getWeighting() {
		return weighting;
	}

	public void setWeighting(int weighting) {
		this.weighting = weighting;
	}


}