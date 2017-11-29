package com.utonw.dealer.api.service;



import java.util.List;
import java.util.Map;

public interface IuserServiceCSD {
	
	String selectAccountName(String uuid);
	Map downloadPdf(Map param);
	List<String> getUserInfo() throws Exception;
}
