package com.utonw.dealer.base;
//package com.utonw.buyer.base;
//
//import java.util.Date;
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//import org.springframework.util.StringUtils;
//
//import ReturnCodeEnum;
//import OperateResult;
//import com.utonw.buyer.common.mapper.generated.EventHistoryMapper;
//import com.utonw.buyer.common.mapper.generated.EventMapper;
//import com.utonw.event.EventService;
//import com.utonw.event.constant.EventConstants;
//import com.utonw.event.enums.EventStatusEnum;
//import com.utonw.event.model.BaseEvent;
//
//@Service
//public class EventServiceImpl implements EventService {
//	@Autowired
//	private EventMapper eventMapper;
//	@Autowired
//	private EventHistoryMapper eventHistoryMapper;
//	@Override
//	public OperateResult saveEvent(BaseEvent event) {
//		event.setRetryTime(0);
//		event.setGmtCreate(new Date());
//		event.setEventStatus(EventStatusEnum.WAIT_HANDLE.name());
//		event.setGmtModify(new Date());
//		eventMapper.insertSelective(event);
//		return new OperateResult(true,ReturnCodeEnum.SUCCESS
//				);
//	}
//
//	@Override
//	public List<BaseEvent> searchHandleEvent(String status) {
//		// TODO Auto-generated method stub
//		return eventMapper.selectEventByStatus(status);
//	}
//
//	@Override
//	public BaseEvent findOneForUpdate(Integer eventProcessId) {
//		// TODO Auto-generated method stub
//		return eventMapper.selectByPrimaryKey(eventProcessId);
//	}
//
//	@Override
//	public void handleCallBack(BaseEvent event, OperateResult result) {
//		if (event == null) {
//			return;
//		}
//		event.setGmtModify(new Date());
//		// 调用正确回调
//		if (result.isSuccess() && StringUtils.isEmpty(result.getMessage())) {
//			event.setEventStatus(EventStatusEnum.HANDLE_SUCCESS.name());
//			eventMapper.updateByPrimaryKeySelective(event);
//		}
//		// 调用错误回调
//		else if (result.isSuccess() && !StringUtils.isEmpty(result.getMessage())) {
//			event.setException(result.getMessage());
//			event.setEventStatus(EventStatusEnum.HANDLE_FAILED.name());
//			eventMapper.updateByPrimaryKeySelective(event);
//		} else if (!result.isSuccess() && event.getRetryTime() < EventConstants.MAX_RETRY_TIME) {
//			event.setRetryTime(event.getRetryTime()+1);
//			event.setException(result.getMessage());
//			event.setEventStatus(EventStatusEnum.WAIT_RETRY.name());
//			eventMapper.updateByPrimaryKeySelective(event);
//		} else {
//			event.setException(result.getMessage());
//			event.setEventStatus(EventStatusEnum.HANDLE_FAILED.name());
//			eventMapper.updateByPrimaryKeySelective(event);
//		}
//	}
//
//	@Override
//	public List<BaseEvent> searchWaitDeleteEvent() {
//		return eventMapper.selectWaitDeleteEvent();
//	}
//
//	@Override
//	public void removeEventToHistory(BaseEvent event) {
//		eventMapper.deleteByPrimaryKey(event.getId());
//		eventHistoryMapper.insertByBaseEvent(event);
//	}
//
//}
