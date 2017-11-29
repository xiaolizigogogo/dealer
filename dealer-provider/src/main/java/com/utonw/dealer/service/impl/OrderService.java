package com.utonw.dealer.service.impl;

import com.alibaba.dubbo.common.utils.StringUtils;
import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.dubbo.config.annotation.Service;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.utonw.consumerloan.api.service.background.OrdersService;
import com.utonw.dealer.api.dto.request.CustomerListRequest;
import com.utonw.dealer.api.dto.request.DeleteRequest;
import com.utonw.dealer.api.dto.request.OrderPageRequest;
import com.utonw.dealer.api.entity.*;
import com.utonw.dealer.api.enums.DeleteTypeEnum;
import com.utonw.dealer.api.service.IOrderService;
import com.utonw.dealer.api.service.IOrderServiceCSD;
import com.utonw.dealer.mapper.CarsokPruductOldcarMapper;
import com.utonw.dealer.mapper.MerchantIndentMapper;
import com.utonw.obd.api.model.CarAlarm;
import com.utonw.obd.api.model.LastLocation;
import com.utonw.obd.api.server.OBDService;
import com.utonw.obd.util.result.Response;
import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by WANGYJ on 2017/5/10.
 */
@Transactional
@Service(version = "1.0.0", timeout = 1500000)
public class OrderService implements IOrderService {
	private static final Logger logger = LoggerFactory.getLogger("MerchantAplVerifyServiceImpl.class");
	@Autowired
	MerchantIndentMapper merchantIndentMapper;

	@Value("${loanstage.review}")
	private String stageReview;

	@Value("${loanstage.repayment}")
	private String stageRepayment;

	@Value("${loanstage.finish}")
	private String stageFinish;
	@Reference(version="0.1.0",timeout = 150000,check = false)
	OBDService obdService;

	@Autowired
	CarsokPruductOldcarMapper carsokPruductOldcarMapper;
	@Reference(version="1.0.0",check=false)
	OrdersService ordersService;
	@Reference(version="1.0.0")
	private IOrderServiceCSD orderServiceCSD;
	private static final String[] flows = { "first_trial", "review_evaluate", "review_install_collateral", "judgment",
			"lended" };

	@Override
	public Map<String, Object> queryOrderByParams(OrderPageRequest orderPageRequest, List<workflowtask> list) {
		List<String> indentList = new ArrayList<>();
		Map<String, Object> result = new HashMap<>();
		// 所有有权限的订单
		for (workflowtask wft : list) {
			String indentId = wft.getBusinesskey();
				indentList.add(indentId);
		}
		if (indentList.size() == 0) {
			result.put("list", new ArrayList<TaskInfoErpEntity>());
			return result;
		}
		// 进行bean2Map转换
		ObjectMapper objectMapper = new ObjectMapper();
		String json = null;
		Map<String, Object> param = new HashMap<>();
		try {
			json = objectMapper.writeValueAsString(orderPageRequest);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// json转Bean
		try {
			param = objectMapper.readValue(json, Map.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 将订单uuid的list作为查询条件
		param.put("list", indentList);
		// 对请求的列表的种类进行存储
		int pageNum = orderPageRequest.getPageNum();
		int pageSize = orderPageRequest.getPageSize();
		Page<TaskInfoErpEntity> page = PageHelper.startPage(pageNum, pageSize);
		List<TaskInfoErpEntity> erpTaskList = merchantIndentMapper.queryIndentInfoErp(param);

		result.put("list", erpTaskList);
		result.put("total", page.getTotal());

		return result;

	}

	@Override
	public String updateMerchantIndent(MerchantModify merchantModify) {
		MerchantIndent merchantIndent = new MerchantIndent();
		if (StringUtils.isNotEmpty(merchantModify.getIndentState())) {
			merchantIndent.setIndentstate(merchantModify.getIndentState());
		}
		if (merchantModify.getOutAccountTime()!= null) {
			merchantIndent.setOutAccountTime(merchantModify.getOutAccountTime());
		}
		if (merchantModify.getJudgeMoney() != null) {
			merchantIndent.setJudgemoney(merchantModify.getJudgeMoney());
		}
		if (StringUtils.isNotEmpty(merchantModify.getRejectRemarks())) {
			merchantIndent.setRejectremarks(merchantModify.getRejectRemarks());
		}
		if (StringUtils.isNotEmpty(merchantModify.getWhetherPass())) {
			merchantIndent.setWhetherpass(merchantModify.getWhetherPass());
		}
		if (merchantModify.getRepaymentime()!= null) {
			merchantIndent.setRepaymentime(merchantModify.getRepaymentime());
		}
		merchantIndent.update(new EntityWrapper<MerchantIndent>().eq("id", merchantModify.getId()));
		return null;
	}

	@Override
	public PageInfo<MerchantIndentInfo> queryOrderByCondition(OrderPageRequest orderPageRequest) {
		PageHelper.startPage(orderPageRequest.getPageNum(), orderPageRequest.getPageSize(),true);
		Page<MerchantIndentInfo> page = merchantIndentMapper.selectOrderByCondition(orderPageRequest);
		return page.toPageInfo();
	}

	@Override
	public Map queryOrderCount() {
		return merchantIndentMapper.selectOrderCount();
	}

	@Override
	public Map<String,Object> selectSupervision(CustomerListRequest param) {
		Map result = new HashMap();
		Map<String,Object> map =new HashMap<>();
		map.put("merchantName",param.getMerchantName());
		map.put("regulationType",param.getRegulationType());
		Page<Supervision> page = null;
		page = PageHelper.startPage(param.getPageNum(),param.getPageSize());
		List<Supervision>supervision=merchantIndentMapper.selectSupervisionList(map);
		result.put("sum",page.getTotal());
		result.put("supervisions",supervision);
		return result;
	}

	@Override
	public Map<String,Object> selectIndentCar(CustomerListRequest param) {
		Map result = new HashMap();
		Map<String,Object> map =new HashMap<>();
		map.put("acountId",param.getAccountId());
		Page<Supervision> page = null;
		page = PageHelper.startPage(param.getPageNum(),param.getPageSize());
		List<Supervision>supervision = merchantIndentMapper.selectIndentCar(map);
		for (Supervision supervision1 : supervision) {
			if(supervision1.getJudgeMoney()!=null&&supervision1.getDeadlineTime()!=null){
				supervision1.setJudgeMoney(supervision1.getJudgeMoney().multiply(new BigDecimal(10000)));
				supervision1.setRepayment((supervision1.getInterestRate().multiply(new BigDecimal(supervision1.getDeadlineTime()).multiply(supervision1.getJudgeMoney()).divide(new BigDecimal(12),2,BigDecimal.ROUND_HALF_UP).divide(new BigDecimal(30),2,BigDecimal.ROUND_HALF_UP)).divide(new BigDecimal(100),2,BigDecimal.ROUND_HALF_UP)).add(supervision1.getJudgeMoney()));
			}

		}
		result.put("sum",page.getTotal());
		result.put("supervision",supervision);
		return result;
	}

	@Override
	public Map<String,Object>getsuperviseInfo(CustomerListRequest param) {
		int pageNum =param.getPageNum();
		int pageSize = param.getPageSize();
		String orderId=param.getIndentId();
		String plateNumber=param.getPlateNumber();
		int alarmType=param.getAlarmType();
		String startTime=param.getStartTime();
		String endTime=param.getEndTime();
		Map result = new HashMap();
		result.put("caInfo",carsokPruductOldcarMapper.selectCarInfo(orderId));
		Response<List<CarAlarm>> carAlarm=obdService.selectCarAlarmPage(pageNum,pageSize,orderId,plateNumber,alarmType,startTime,endTime);
		result.put("sum",carAlarm.getListCount());
		result.put("carAlarm",carAlarm.getData());
		return result;
	}

	@Override
	public Map<String, Object> getFinalPosition(CustomerListRequest param) {
		Map result = new HashMap();
		String plateNumber=param.getPlateNumber();
		String indentId =param.getIndentId();
		//最后位置
		Response<LastLocation> lastLocationResponse=obdService.getLastLocation(indentId,plateNumber);
		if (lastLocationResponse.getCode().equals("1000")){
			result.put("lastLocation",lastLocationResponse.getData());
		}else {
			result.put("lastLocation",null);
		}
		return result;
	}

	@Override
	public PageInfo<MerchantIndentInfo> queryOrderByids(OrderPageRequest orderPageRequest) {
		PageHelper.startPage(orderPageRequest.getPageNum(), orderPageRequest.getPageSize(),true);
		Page<MerchantIndentInfo> page = merchantIndentMapper.selectOrderByids(orderPageRequest);
		return page.toPageInfo();
	}

	@Override
	public int delete(DeleteRequest deleteRequest) {
		MerchantApply apply=null;
		if(deleteRequest.getDeleteTypeEnum()==DeleteTypeEnum.Customer){
			apply=new MerchantApply().selectById(deleteRequest.getId());
			List<MerchantIndent> merchantIndents=new MerchantIndent().selectList(new EntityWrapper<>().eq("acount_id",apply.getAcountid()));
			List<String> ids=new ArrayList<>();
			List<String> carIds=new ArrayList<>();
			for(MerchantIndent merchantIndent:merchantIndents){
				ids.add(merchantIndent.getId());
			}
			deleteRequest.setIds(ids);
		}
		int i=orderServiceCSD.delete(deleteRequest);
		if(i==-1){
			return i;
		}
		if(deleteRequest.getDeleteTypeEnum()==DeleteTypeEnum.Customer){
			List<MerchantIndent> merchantIndents=new MerchantIndent().selectList(new EntityWrapper<MerchantIndent>().eq("acount_id",apply.getAcountid()));
			i=deleteCustomer(deleteRequest.getId());
			if(merchantIndents.size()==0){
				return i;
			}
			List<String> ids=new ArrayList<>();
			for(MerchantIndent merchantIndent:merchantIndents){
				ids.add(merchantIndent.getId());
			}
			apply.deleteById();
			return deleteOrder(null,ids);
		}
		if(deleteRequest.getDeleteTypeEnum()==DeleteTypeEnum.Order){
			return deleteOrder(deleteRequest.getId(),null);
		}
		if(deleteRequest.getDeleteTypeEnum()==DeleteTypeEnum.BankCard){
			return deleteBankCard(deleteRequest.getId());
		}
		return -1;
	}
	
	private int deleteCustomer(String id){
		MerchantApply merchantApply=new MerchantApply().selectById(id);
		String accountId=merchantApply.getAcountid().toString();
		new MerchantContactinfo().delete(new EntityWrapper<MerchantContactinfo>().eq("acountId", accountId));
		new MerchantContract().delete(new EntityWrapper<>().eq("acountId", accountId));
		new MerchantPicture().delete(new EntityWrapper<MerchantPicture>().eq("acountId", accountId));
		new MerchantRegion().delete(new EntityWrapper<MerchantRegion>().eq("apply_id", id));
		new BankCard().delete(new EntityWrapper<BankCard>().eq("acount_id", accountId));
		merchantApply.deleteById();
		return 0;
	}
	private int deleteOrder(String id,List<String> ids){
		if(ids!=null&&ids.size()>0){
			for(String orderId:ids){
				deleteOrder(orderId);
			}
			return 0;
		}
		deleteOrder(id);
		return 0;
	}
	
	private int deleteOrder(String id){
		MerchantIndent indent=	merchantIndentMapper.selectById(id);
		try{
			List<String> carIdList=new ArrayList();
			carIdList.add(String.valueOf(indent.getProductid()));
			ordersService.deleteOrderByCarIdService(carIdList);
		}
		catch (Exception e) {
			logger.error("调用消费贷删除订单失败,id:{},error:{}",id,e.getMessage());
		}
		merchantIndentMapper.deleteById(id);
		new CarFile().delete(new EntityWrapper<CarFile>().eq("product_id", indent.getProductid()));
		new CarContract().delete(new EntityWrapper<CarContract>().eq("carId", indent.getProductid()));
		return 0;
	}
	
	private int deleteBankCard(String id){
		BankCard bankCard=new BankCard();
		bankCard.setId(id);
		bankCard.deleteById();
		return 0;
	}
}
