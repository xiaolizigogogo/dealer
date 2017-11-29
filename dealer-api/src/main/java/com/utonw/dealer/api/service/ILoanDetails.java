package com.utonw.dealer.api.service;


import java.util.Map;

public interface ILoanDetails {

	Map<String, Object> selectIndentInfo(String id);

	Boolean insertIndentStatus(String orderId,String approvalLevel,String approvalStatus);

	String selectorderForm(String  date);
	
	Map queryCreditInfo(String customerId);

	Map queryPengYuanCredit(Map param);

}
