package com.utonw.dealer.api.entity.erp;

import java.io.Serializable;

/**
* @author 作者 WT: 
* @version 创建时间：2017年2月15日 下午9:24:08 
* 车辆图片名称、图片路径信息
*/
public class CarImage implements Serializable {

	private static final long serialVersionUID = -3877942170225800443L;
	//图片名字
	private String name;
	
	//图片路径
	private String url;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}	
}
