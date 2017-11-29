package com.utonw.utonerp.service;

import java.io.InputStream;
import java.math.BigDecimal;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.utonw.dealer.api.entity.erp.*;
import com.utonw.dealer.api.enums.erp.WorkFlowType;
import com.utonw.dealer.api.util.erp.Constants;
import com.utonw.dealer.api.util.erp.PageModel;
import com.utonw.dealer.api.vo.*;
import com.utonw.utonbase.core.erpcommon.config.ParamterControl;
import com.utonw.utonbase.core.erpcommon.utils.ComparatorMap;
import com.utonw.dealer.api.service.erp.TodoDefineService;
import com.utonw.dealer.api.service.erp.TodoInsService;
import com.utonw.dealer.api.service.erp.WorkFlowService;
import com.utonw.dealer.api.util.erp.PageModelUtil;
import com.utonw.utonerp.core.dao.BaseDao;
import com.utonw.utonerp.core.dao.DBControl;
import com.utonw.utonerp.mapper.LoanInfoMapper;
import com.utonw.utonerp.mapper.RepaymentMapper;
import org.activiti.engine.HistoryService;
import org.activiti.engine.IdentityService;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.history.HistoricProcessInstanceQuery;
import org.activiti.engine.history.HistoricTaskInstance;
import org.activiti.engine.impl.persistence.entity.ExecutionEntity;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.runtime.ProcessInstanceQuery;
import org.activiti.engine.task.Task;
import org.activiti.engine.task.TaskQuery;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



/**
 * 启动流程
 *
 * @author DONG
 */
@Service("workFlowService")
@com.alibaba.dubbo.config.annotation.Service(version = "1.0.0")
@Transactional
public class WorkFlowServiceImpl implements WorkFlowService {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private RuntimeService runtimeService;

	@Autowired
	private IdentityService identityService;

	@Autowired
	private TaskService taskService;

	@Autowired
	private RepositoryService repositoryService;

	@Autowired
	private HistoryService historyService;

	@Autowired
	private TodoDefineService todoDefineService;

	@Autowired
	@Qualifier("todoInsService")
	private TodoInsService todoInService;

	@Autowired
	private DBControl dbControl;

	@Autowired
	private RepaymentMapper repaymentMapper;

	@Autowired
	private LoanInfoMapper loanInfoMapper;
	//贷后订单
	@Autowired
	private BaseDao<LoanInfoForRepayment> baseDao;
	//贷前订单
	@Autowired
	private BaseDao<VehicleLoanInfo> vehicleLoanDao;

	public ProcessInstance startProcess(String userId, WorkFlowType workFlowType, String businessKey,
										Map<String, Object> map) {
		try {
			identityService.setAuthenticatedUserId(userId);
			return runtimeService.startProcessInstanceByKey(workFlowType.toString(), businessKey, map);
		} finally {
			identityService.setAuthenticatedUserId(null);
		}
	}


	public PageModelUtil<Task> findSignTaskListByUserIdAndWorkFlowType(WorkFlowType workFlowType, String userId,
																	   int page, int limit) {
		PageModelUtil<Task> pageModel = new PageModelUtil<Task>();
		TaskQuery taskQuery = taskService.createTaskQuery().processDefinitionKey(workFlowType.toString())
				.taskAssignee(userId);
		pageModel.setList(taskQuery.listPage(page, limit));
		pageModel.setTotal(Integer.parseInt(taskQuery.count() + ""));
		return pageModel;
	}


	public PageModelUtil<Task> findNoSignTaskListByUserIdAndWorkFlowType(WorkFlowType workFlowType, String userId,
			int page, int limit) {
		PageModelUtil<Task> pageModel = new PageModelUtil<Task>();
		TaskQuery taskQuery = taskService.createTaskQuery().processDefinitionKey(workFlowType.toString())
				.taskCandidateUser(userId);
		pageModel.setList(taskQuery.listPage(page, limit));
		pageModel.setTotal(Integer.parseInt(taskQuery.count() + ""));
		return pageModel;
	}

	@Override
	public void claim(String taskId, String userId) {
		taskService.claim(taskId, userId);
	}

	@Override
	public void complete(String taskId, Map<String, Object> map) {
		try {
			taskService.complete(taskId, map);
		} catch (Exception e) {
			throw new RuntimeException("完成工作项异常。。任务id:" + taskId);
		}
	}


	public PageModelUtil<HistoricProcessInstance> findFinshedTasks(WorkFlowType workFlowType, int page, int limit) {
		PageModelUtil<HistoricProcessInstance> pageModel = new PageModelUtil<HistoricProcessInstance>();
		HistoricProcessInstanceQuery historicProcessInstanceQuery = historyService.createHistoricProcessInstanceQuery()
				.processDefinitionKey(workFlowType.toString()).finished().orderByProcessInstanceEndTime().desc();
		pageModel.setList(historicProcessInstanceQuery.listPage(page, limit));
		pageModel.setTotal(Integer.parseInt(historicProcessInstanceQuery.count() + ""));
		return pageModel;
	}

	@Override
	public String queryBusinessKeyByTaskId(String taskId) {
		Task task = taskService.createTaskQuery().taskId(taskId).singleResult();
		return runtimeService.createProcessInstanceQuery().processInstanceId(task.getProcessInstanceId()).active()
				.singleResult().getBusinessKey();
	}

	@Override
	public ProcessInstance getProcessInstance(String processInstanceId) {
		return runtimeService.createProcessInstanceQuery().processInstanceId(processInstanceId).active().singleResult();
	}

	@Override
	public ProcessDefinition getProcessDefinition(String processDefinitionId) {
		return repositoryService.createProcessDefinitionQuery().processDefinitionId(processDefinitionId).singleResult();
	}

	@Override
	public Task queryTaskByTaskId(String taskId) {
		return taskService.createTaskQuery().taskId(taskId).singleResult();
	}

	@Override
	public InputStream loadImageByDeployment(String processDefinitionId, String resourceType) {
		ProcessDefinition processDefinition = repositoryService.createProcessDefinitionQuery()
				.processDefinitionId(processDefinitionId).singleResult();
		String resourceName = "";
		if ("image".equals(resourceType)) {
			resourceName = processDefinition.getDiagramResourceName();
		} else if ("xml".equals(resourceType)) {
			resourceName = processDefinition.getResourceName();
		} else {
			return null;
		}

		return repositoryService.getResourceAsStream(processDefinition.getDeploymentId(), resourceName);
	}

	@SuppressWarnings("unchecked")
	@Override
	public void autoComplete(String processinsId, String userId, @SuppressWarnings("rawtypes") Map map) {
		List<Task> taskCandidates = taskService.createTaskQuery().processDefinitionKey(processinsId)
				.taskCandidateUser(userId).orderByTaskPriority().desc().list();
		for (Task t : taskCandidates) {
			String pid = t.getProcessDefinitionId();
			if (pid.equals(processinsId)) {
				claim(t.getId(), userId);
				complete(t.getId(), map);
				break;
			}
		}
	}

	@Override
	public Integer querytodoListAll(String userId) {
		Integer taskCount = 0;

		WorkFlowType[] keys = WorkFlowType.values();

		for (int i = 0; i < keys.length; i++) {
			taskCount += taskService.createTaskQuery().processDefinitionKey(keys[i].toString())
					.taskCandidateUser(userId).orderByTaskPriority().desc().list().size();
			taskCount += taskService.createTaskQuery().processDefinitionKey(keys[i].toString()).taskAssignee(userId)
					.orderByTaskPriority().desc().list().size();

		}

		return taskCount;

	}

	public TodoPage querytodoList(String userId, Integer currentpage, Integer pagecount, WorkFlowType[] keys) {
		TodoPage todopage = new TodoPage();

		List<Task> tasklist = new ArrayList<>();
		for (int i = 0; i < keys.length; i++) {
			List<Task> taskCandidates = taskService.createTaskQuery().processDefinitionKey(keys[i].toString())
					.taskCandidateUser(userId) // 对指定用户的可接取的公共任务执行查询
					.orderByTaskPriority().desc().list();
			List<Task> taskAssigness = taskService.createTaskQuery().processDefinitionKey(keys[i].toString())
					.taskAssignee(userId) // 对指定用户的未完成的个人任务执行查询
					.orderByTaskPriority().desc().list();
			tasklist.addAll(taskCandidates);
			tasklist.addAll(taskAssigness);
		}

		int totalcount = tasklist.size();
		todopage.setTotalcount(totalcount);
		int totalpage = 0;
		boolean hasnext = false;
		boolean haslast = false;
		if (totalcount % pagecount == 0) {
			totalpage = totalcount / pagecount;
		} else {
			totalpage = totalcount / pagecount + 1;
		}
		if (totalpage > (currentpage + 1)) {
			hasnext = true;
		}
		if (currentpage > 0) {
			haslast = true;
		}
		todopage.setHaslast(haslast);
		todopage.setHasnext(hasnext);
		todopage.setCurrentpage(currentpage);
		todopage.setTotalpage(totalpage);
		List<TodoVO> list = new ArrayList<TodoVO>();
		int start = currentpage * pagecount;
		int end = 0;
		if ((currentpage + 1) < totalpage) {
			end = (currentpage + 1) * pagecount;
		} else {
			end = start + (totalcount % pagecount);
		}
		if (totalpage == 1) {
			end = tasklist.size();
		}
		for (int i = start; i < end; i++) {
			if (i < tasklist.size()) {
				Task task = tasklist.get(i);
				String processinsId = task.getProcessInstanceId();
				String processdifineId = task.getProcessDefinitionId();
				ProcessInstance pi = runtimeService.createProcessInstanceQuery().processInstanceId(processinsId)
						.singleResult();
				ProcessDefinition pd = repositoryService.createProcessDefinitionQuery()
						.processDefinitionId(processdifineId).singleResult();

				String key = pd.getKey();
				String businesskey = pi.getBusinessKey();
				TodoInsEntity todoInsEntity = todoInService.findBybusinesskey(businesskey);
				String business = todoInsEntity.getBusiness();
				TodoDefineEntity todoDefineEntity = todoDefineService.findByBusiness(business);
				String sql = "";

				if (key.equals(WorkFlowType.vehiclesLoans.toString())) {
					sql = "select ci.customer_name,li.id_card from loan_info li left JOIN customer_register_info ci ON "
							+ "li.customer_id = ci.uuid where li.uuid='" + businesskey + "'";

				} else {
					sql = "select " + todoDefineEntity.getProperty() + "," + todoDefineEntity.getProperty2() + " from "
							+ todoDefineEntity.getTablename() + " where " + todoDefineEntity.getBusinesskeyname() + "='"
							+ businesskey + "'";
				}

				TodoVO vo = new TodoVO();

				Connection conn = null;
				ResultSet rs = null;

				try {
					conn = dbControl.getConnection();
					rs = dbControl.getData(conn,sql);
					while (rs.next()) {
						String column1 = rs.getString(1);
						String column2 = rs.getString(2);
						String businessvalues = todoDefineEntity.getBusinessvalue();
						vo.setColumn1(column1);
						vo.setColumn2(column2);
						vo.setBusinessvalue(businessvalues);
					}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					dbControl.close(conn,rs);
				}
				vo.setProcessdefine(pd);
				vo.setProcessins(pi);
				vo.setTask(task);
				vo.setProcessinsId(processinsId);
				vo.setTaskName(task.getName());
				vo.setSuspendedStatus(pi.isSuspended());
				vo.setTaskId(task.getId());
				vo.setProcessDefineId(processdifineId);
				vo.setBusinesskey(businesskey);
				boolean assigneeStatus = false;
				if (null == task.getAssignee()) {
					assigneeStatus = true;
				}
				vo.setAssigneeStatus(assigneeStatus);
				vo.setTaskCreateTime(task.getCreateTime());
				list.add(vo);
			}

		}
		todopage.setContext(list);
		return todopage;
	}

	@Override
	public ExecutionEntity getExecution(Task task) {
		return (ExecutionEntity) runtimeService.createExecutionQuery().executionId(task.getExecutionId())
				.processInstanceId(task.getProcessInstanceId()).singleResult();
	}

	public List<String> getExecutionByPronidAndKey(WorkFlowType workFlowType) {

		// 创建查询对象
		ProcessInstanceQuery processInstanceQuery = runtimeService.createProcessInstanceQuery();

		// 流程定义 key
		String processDefinitionKey = WorkFlowType.paymentCollection.toString();

		processInstanceQuery.processDefinitionKey(processDefinitionKey);

		List<String> businessList = new ArrayList<String>();

		// 获取查询列表
		List<ProcessInstance> list = processInstanceQuery.list();

		for (ProcessInstance processInstance : list) {

			businessList.add(processInstance.getBusinessKey());
		}

		//
		// String flowType = workFlowType.toString();
		//
		// List<Task> listTask =
		// taskService.createTaskQuery().processDefinitionKey(flowType).list();
		// for (Task task : listTask) {
		// String processinsId = task.getProcessInstanceId();
		// ProcessInstance pi =
		// runtimeService.createProcessInstanceQuery().processInstanceId(processinsId).singleResult();
		// businessList.add(pi.getBusinessKey());
		// }
		return businessList;
	}

	@Override
	public TodoInsEntity getTodoIns(Task task) {
		String processinsId = task.getProcessInstanceId();
		ProcessInstance pi = runtimeService.createProcessInstanceQuery().processInstanceId(processinsId).singleResult();
		String businesskey = pi.getBusinessKey();
		TodoInsEntity todoins = todoInService.findBybusinesskey(businesskey);
		return todoins;
	}

	@Override
	public HisTodoPage queryHistodoList(String userId, Integer currentPage, Integer pagecount) {
		HisTodoPage todopage = new HisTodoPage();

		List<HistoricTaskInstance> taskHistoricList = historyService.createHistoricTaskInstanceQuery()
				.taskInvolvedUser(userId).orderByHistoricTaskInstanceStartTime().asc().list();

		List<HistoricTaskInstance> tasklist = new ArrayList<HistoricTaskInstance>();
		tasklist.addAll(taskHistoricList);
		int totalcount = tasklist.size();
		todopage.setTotalcount(totalcount);
		int totalpage = 0;
		boolean hasnext = false;
		boolean haslast = false;
		if (totalcount % pagecount == 0) {
			totalpage = totalcount / pagecount;
		} else {
			totalpage = totalcount / pagecount + 1;
		}
		if (totalpage > (currentPage + 1)) {
			hasnext = true;
		}
		if (currentPage > 0) {
			haslast = true;
		}
		todopage.setHaslast(haslast);
		todopage.setHasnext(hasnext);
		todopage.setCurrentpage(currentPage);
		todopage.setTotalpage(totalpage);
		List<HisTodoVO> list = new ArrayList<HisTodoVO>();
		int start = currentPage * pagecount;
		int end = 0;
		if ((currentPage + 1) < totalpage) {
			end = (currentPage + 1) * pagecount;
		}else if((currentPage + 1) == totalpage&&(totalcount % pagecount)==0){
			end = (currentPage + 1) * pagecount;
		} else {
			end = start + (totalcount % pagecount);
		}
		if (totalpage == 1) {
			end = tasklist.size();
		}
		for (int i = start; i < end; i++) {
			HistoricTaskInstance task = tasklist.get(i);
			String processinsId = task.getProcessInstanceId();
			String processdifineId = task.getProcessDefinitionId();
			String id = task.getId();
			HistoricProcessInstance pi = historyService.createHistoricProcessInstanceQuery()
					.processInstanceId(processinsId).singleResult();
			// runtimeService.createProcessInstanceQuery()
			// .processInstanceId(processinsId).singleResult();
			ProcessDefinition pd = repositoryService.createProcessDefinitionQuery().processDefinitionId(processdifineId)
					.singleResult();
			String businesskey = pi.getBusinessKey();
			TodoInsEntity todoInsEntity = todoInService.findBybusinesskey(businesskey);
			String business = todoInsEntity.getBusiness();
			TodoDefineEntity todoDefineEntity = todoDefineService.findByBusiness(business);
			String sql = "select " + todoDefineEntity.getProperty() + "," + todoDefineEntity.getProperty2() + " from "
					+ todoDefineEntity.getTablename() + " where " + todoDefineEntity.getBusinesskeyname() + "='"
					+ businesskey + "'";

			HisTodoVO vo = new HisTodoVO();
			Connection conn = null;
			ResultSet rs = null;
			try {
				conn = dbControl.getConnection();
				rs = dbControl.getData(conn,sql);
				while (rs.next()) {
					String column1 = rs.getString(1);
					String column2 = rs.getString(2);
					String businessvalues = todoDefineEntity.getBusinessvalue();
					vo.setColumn1(column1);
					vo.setColumn2(column2);
					vo.setBusinessvalue(businessvalues);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				dbControl.close(conn,rs);
			}
			vo.setProcessdefine(pd);
			vo.setProcessins(pi);
			vo.setTask(task);
			vo.setProcessinsId(processinsId);
			vo.setTaskName(task.getName());
			// vo.setSuspendedStatus(pi.isSuspended());
			vo.setTaskId(task.getId());
			vo.setProcessDefineId(processdifineId);
			vo.setBusinesskey(businesskey);
			boolean assigneeStatus = false;
			if (null == task.getAssignee()) {
				assigneeStatus = true;
			}
			vo.setAssigneeStatus(assigneeStatus);
			vo.setTaskCreateTime(task.getStartTime());
			if (null != task.getClaimTime()) {
				vo.setTaskClaimTime(task.getClaimTime());
			}
			if (null != task.getEndTime()) {
				vo.setTaskEndTime(task.getEndTime());
			}
			if (null != task.getDeleteReason() && "completed".equals(task.getDeleteReason())) {
				vo.setDeleteReason("已处理完成");
			} else if (assigneeStatus) {
				vo.setDeleteReason("待签收");
			} else if (!assigneeStatus && null == task.getDeleteReason()) {
				vo.setDeleteReason("已签收处理中");
			}
			list.add(vo);
		}
		todopage.setContext(list);
		return todopage;
	}

	@Override
	public HisTodoPageProcessIn queryHisTodoPageProcessInList(List<String> processInsIds, Integer currentPage,
															  Integer pagecount) {
		HisTodoPageProcessIn todopage = new HisTodoPageProcessIn();
		List<HistoricTaskInstance> tasklist = new ArrayList<HistoricTaskInstance>();
		for (String processIndsIn : processInsIds) {

			Integer countSum = historyService.createHistoricTaskInstanceQuery().processInstanceId(processIndsIn).list()
					.size();
			HistoricTaskInstance taskHistoric = null;
			if (countSum > 0) {
				taskHistoric = historyService.createHistoricTaskInstanceQuery().processInstanceId(processIndsIn)
						.orderByHistoricTaskInstanceStartTime().desc().list().get(0);
				tasklist.add(taskHistoric);
			}

		}
		int totalcount = tasklist.size();
		todopage.setTotalcount(totalcount);
		int totalpage = 0;
		boolean hasnext = false;
		boolean haslast = false;
		if (totalcount % pagecount == 0) {
			totalpage = totalcount / pagecount;
		} else {
			totalpage = totalcount / pagecount + 1;
		}
		if (totalpage > (currentPage + 1)) {
			hasnext = true;
		}
		if (currentPage > 0) {
			haslast = true;
		}
		todopage.setHaslast(haslast);
		todopage.setHasnext(hasnext);
		todopage.setCurrentpage(currentPage);
		todopage.setTotalpage(totalpage);
		List<HisTodoProcessInVO> list = new ArrayList<HisTodoProcessInVO>();
		int start = currentPage * pagecount;
		int end = 0;
		if ((currentPage + 1) < totalpage) {
			end = (currentPage + 1) * pagecount;
		}else if((currentPage + 1) == totalpage&&(totalcount % pagecount)==0){
			end = (currentPage + 1) * pagecount;
		} else {
			end = start + (totalcount % pagecount);
		}
		if (totalpage == 1) {
			end = tasklist.size();
		}
		for (int i = start; i < end; i++) {
			HistoricTaskInstance task = tasklist.get(i);
			String processinsId = task.getProcessInstanceId();
			String processdifineId = task.getProcessDefinitionId();
			HistoricProcessInstance pi = historyService.createHistoricProcessInstanceQuery()
					.processInstanceId(processinsId).singleResult();
			ProcessDefinition pd = repositoryService.createProcessDefinitionQuery().processDefinitionId(processdifineId)
					.singleResult();
			String businesskey = pi.getBusinessKey();
			TodoInsEntity todoInsEntity = todoInService.findBybusinesskey(businesskey);
			String business = todoInsEntity.getBusiness();
			TodoDefineEntity todoDefineEntity = todoDefineService.findByBusiness(business);
			String sql = "select " + todoDefineEntity.getProperty() + "," + todoDefineEntity.getProperty2() + " from "
					+ todoDefineEntity.getTablename() + " where " + todoDefineEntity.getBusinesskeyname() + "='"
					+ businesskey + "'";

			HisTodoProcessInVO vo = new HisTodoProcessInVO();
			Connection conn = null;
			ResultSet rs = null;
			try {
				conn = dbControl.getConnection();
				rs = dbControl.getData(conn,sql);
				while (rs.next()) {
					String column1 = rs.getString(1);
					String column2 = rs.getString(2);
					String businessvalues = todoDefineEntity.getBusinessvalue();
					vo.setColumn1(column1);
					vo.setColumn2(column2);
					vo.setBusinessvalue(businessvalues);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				dbControl.close(conn,rs);
			}
			vo.setProcessdefine(pd);
			vo.setProcessins(pi);
			vo.setTask(task);
			vo.setProcessinsId(processinsId);
			vo.setTaskName(task.getName());
			vo.setTaskId(task.getId());
			vo.setProcessDefineId(processdifineId);
			vo.setBusinesskey(businesskey);
			boolean assigneeStatus = false;
			if (null == task.getAssignee()) {
				assigneeStatus = true;
			}
			vo.setAssigneeStatus(assigneeStatus);
			vo.setTaskCreateTime(task.getStartTime());
			if (null != task.getClaimTime()) {
				vo.setTaskClaimTime(task.getClaimTime());
			}
			if (null != task.getEndTime()) {
				vo.setTaskEndTime(task.getEndTime());
			}
			if (null != task.getDeleteReason() && "completed".equals(task.getDeleteReason())) {
				vo.setDeleteReason("已处理完成");
			} else if (assigneeStatus) {
				vo.setDeleteReason("待签收");
			} else if (!assigneeStatus && null == task.getDeleteReason()) {
				vo.setDeleteReason("已签收处理中");
			}
			list.add(vo);
		}
		todopage.setContext(list);
		return todopage;
	}

	public PageModel<TodoVO> querytodoListApi(String userId, Integer currentpage, Integer pagecount,
											  WorkFlowType[] keys) {
		TodoPage todopage = new TodoPage();

		List<Task> tasklist = new ArrayList<>();
		for (int i = 0; i < keys.length; i++) {
			List<Task> taskCandidates = taskService.createTaskQuery().processDefinitionKey(keys[i].toString())
					.taskCandidateUser(userId).orderByTaskPriority().desc().list();
			List<Task> taskAssigness = taskService.createTaskQuery().processDefinitionKey(keys[i].toString())
					.taskAssignee(userId).orderByTaskPriority().desc().list();
			tasklist.addAll(taskCandidates);
			tasklist.addAll(taskAssigness);
		}

		int totalcount = tasklist.size();
		todopage.setTotalcount(totalcount);
		int totalpage = 0;
		boolean hasnext = false;
		boolean haslast = false;
		if (totalcount % pagecount == 0) {
			totalpage = totalcount / pagecount;
		} else {
			totalpage = totalcount / pagecount + 1;
		}
		if (totalpage > (currentpage + 1)) {
			hasnext = true;
		}
		if (currentpage > 0) {
			haslast = true;
		}
		todopage.setHaslast(haslast);
		todopage.setHasnext(hasnext);
		todopage.setCurrentpage(currentpage);
		todopage.setTotalpage(totalpage);
		List<TodoVO> list = new ArrayList<TodoVO>();
		int start = currentpage * pagecount;
		int end = 0;
		if ((currentpage + 1) < totalpage) {
			end = (currentpage + 1) * pagecount;
		} else {
			end = start + (totalcount % pagecount);
		}
		if (totalpage == 1) {
			end = tasklist.size();
		}
		for (int i = start; i < end; i++) {
			Task task = tasklist.get(i);
			String processinsId = task.getProcessInstanceId();
			String processdifineId = task.getProcessDefinitionId();
			ProcessInstance pi = runtimeService.createProcessInstanceQuery().processInstanceId(processinsId)
					.singleResult();
			ProcessDefinition pd = repositoryService.createProcessDefinitionQuery().processDefinitionId(processdifineId)
					.singleResult();

			String key = pd.getKey();
			String businesskey = pi.getBusinessKey();
			TodoInsEntity todoInsEntity = todoInService.findBybusinesskey(businesskey);
			String business = todoInsEntity.getBusiness();
			TodoDefineEntity todoDefineEntity = todoDefineService.findByBusiness(business);
			String sql = "";

			if (key.equals(WorkFlowType.vehiclesLoans.toString())) {
				sql = "select ci.customer_name,li.id_card from loan_info li left JOIN customer_register_info ci ON "
						+ "li.customer_id = ci.uuid where li.uuid='" + businesskey + "'";

			} else {
				sql = "select " + todoDefineEntity.getProperty() + "," + todoDefineEntity.getProperty2() + " from "
						+ todoDefineEntity.getTablename() + " where " + todoDefineEntity.getBusinesskeyname() + "='"
						+ businesskey + "'";

			}

			TodoVO vo = new TodoVO();
			Connection conn = null;
			ResultSet rs = null;
			try {
				conn = dbControl.getConnection();
				rs = dbControl.getData(conn,sql);
				while (rs.next()) {
					String column1 = rs.getString(1);
					String column2 = rs.getString(2);
					String businessvalues = todoDefineEntity.getBusinessvalue();
					vo.setColumn1(column1);
					vo.setColumn2(column2);
					vo.setBusinessvalue(businessvalues);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				dbControl.close(conn, rs);
			}
			vo.setProcessdefine(pd);
			vo.setProcessins(pi);
			vo.setTask(task);
			vo.setProcessinsId(processinsId);
			vo.setTaskName(task.getName());
			vo.setSuspendedStatus(pi.isSuspended());
			vo.setTaskId(task.getId());
			vo.setProcessDefineId(processdifineId);
			vo.setBusinesskey(businesskey);
			boolean assigneeStatus = false;
			if (null == task.getAssignee()) {
				assigneeStatus = true;
			}
			vo.setAssigneeStatus(assigneeStatus);
			vo.setTaskCreateTime(task.getCreateTime());
			list.add(vo);
		}
		// todopage.setContext(list);
		PageModel<TodoVO> pm = new PageModel<>();
		pm.setDataList(list);
		return pm;
	}

	public int getqueryLoanInfoCount1(String userId, WorkFlowType[] keys) {
		List<Task> tasklist = new ArrayList<>();
		// List<HistoricTaskInstance> tasklist1 = new ArrayList<>();
		for (int i = 0; i < keys.length; i++) {
			List<Task> taskCandidates = taskService.createTaskQuery().processDefinitionKey(keys[i].toString())
					.taskCandidateUser(userId).orderByTaskPriority().desc().list();
			List<Task> taskAssigness = taskService.createTaskQuery().processDefinitionKey(keys[i].toString())
					.taskAssignee(userId).orderByTaskPriority().desc().list();
			tasklist.addAll(taskCandidates);
			tasklist.addAll(taskAssigness);
		}
		int totalcount = tasklist.size();

		return totalcount;
	}

	@Override
	public int getqueryLoanInfoCount2(String userId) {
		HistoricProcessInstanceQuery historicProcessInstanceQuery = historyService.createHistoricProcessInstanceQuery();

		String processDefinitionKey = WorkFlowType.vehiclesLoans.toString();
		historicProcessInstanceQuery.processDefinitionKey(processDefinitionKey);

		if (null != userId && !"".equals(userId)) {
			historicProcessInstanceQuery.involvedUser(userId);
		}

		historicProcessInstanceQuery.finished();

		historicProcessInstanceQuery.orderByProcessInstanceEndTime().desc();

		int a = historicProcessInstanceQuery.list().size();

		return a;
	}

	public TodoPage queryVehiclesLoansList(String userId, Integer currentPage, Integer pagecount, WorkFlowType[] keys,
			Map<String, Object> param) {
		TodoPage todopage = new TodoPage();
		List<Task> tasklist = new ArrayList<>();
		for (int i = 0; i < keys.length; i++) {
			List<Task> taskCandidates = taskService.createTaskQuery().processDefinitionKey(keys[i].toString())
					.taskCandidateUser(userId) // 对指定用户的可接取的公共任务执行查询
					.orderByTaskPriority().desc().list();
			List<Task> taskAssigness = taskService.createTaskQuery().processDefinitionKey(keys[i].toString())
					.taskAssignee(userId) // 对指定用户的未完成的个人任务执行查询
					.orderByTaskPriority().desc().list();
			todopage.setNoloanorder(taskCandidates.size());
			tasklist.addAll(taskCandidates);
			tasklist.addAll(taskAssigness);
		}
		Date dt= new Date();
		Long starttime= dt.getTime();//这就是距离1970年1月1日0点0分0秒的毫秒数

		List<TodoVO> list = new ArrayList<TodoVO>();
		List<Map<String, Object>> mapList = new ArrayList<>();
		Map<String,Object> taskMap = new HashMap<String,Object>();
		Map<String,Object> piMap = new HashMap<String,Object>();
		String sqlin = " in (";
		int listsize = 0;
		//如果没有贷前订单的情况下，则不进行查询。
		boolean hasdata = false;

		for (int i = 0; i < tasklist.size(); i++) {
			if (i < tasklist.size()) {
				Task task = tasklist.get(i);
				String processinsId = task.getProcessInstanceId();
				String processdifineId = task.getProcessDefinitionId();
				if(!processdifineId.contains(WorkFlowType.vehiclesLoans.toString())){
					continue;
				}
				hasdata = true;
				ProcessInstance pi = runtimeService.createProcessInstanceQuery().processInstanceId(processinsId)
						.singleResult();
				String businesskey = pi.getBusinessKey();

				taskMap.put(businesskey, task);
					piMap.put(businesskey, pi);

				if(!sqlin.contains(businesskey)){
					if(0 != listsize){
						sqlin +=",";
					}
					sqlin += "'";
					sqlin += businesskey;
					sqlin += "'";
					listsize++;
				}
			}
		}
		sqlin += ")";

		int totalcount = 0;
		int start = currentPage * pagecount;
		Date dt2= new Date();
		Long endtime1= dt2.getTime();//这就是距离1970年1月1日0点0分0秒的毫秒数
//		logger.debug("queryVehiclesLoansList query time1:"+(endtime1-starttime));
		if (hasdata == true){
			String	sqlcontent = "select ci.customer_name,li.id_card,li.orderid,li.uuid,li.pledge_type,"
					+ " li.loan_status, li.created_at,u1.realname as create_by,u3.realname as principal_name,li.customer_id,"
					+ " ci.is_important,li.state";
			String sqlcount = " select count(1) ";
			String sqlcondition = " from loan_info li LEFT JOIN customer_register_info ci ON "
					+ " li.customer_id = ci.uuid "
					+ " LEFT JOIN user u1 ON li.responsible_cm_id = u1.uuid"
					+ " LEFT JOIN dept de ON li.dept_id = de.id"
					+ " LEFT JOIN user u3 ON u3.uuid = de.principal_id"
					+ " where li.uuid " + sqlin;
			if (param.get("orderNo") != null) {
				sqlcondition += " and li.orderid like concat('%','" + param.get("orderNo") + "','%')";
			}
			if (param.get("customerName") != null) {
				sqlcondition += " and ci.customer_name like concat('%','" + param.get("customerName") + "','%')";
			}
			if (param.get("customerManage") != null) {
				sqlcondition += " and u3.realname like concat('%','" + param.get("customerManage") + "','%')";
			}
			if (param.get("pledgeType") != null) {
				sqlcondition += " and li.pledge_type = " + '"' + param.get("pledgeType") + '"';
			}
			if (param.get("loanStatus") != null) {
				if(param.get("loanStatus").equals("dataReview")){
					sqlcondition += " and li.loan_status = "+"'dataReview'"+"or li.loan_status ="+"'reuploadInformatin'";
				}else{
					sqlcondition += " and li.loan_status = " + '"' + param.get("loanStatus") + '"';
				}
			}
			if(param.get("data_access_level") != null){
				if(Integer.valueOf(param.get("data_access_level").toString()) == 0)
					sqlcondition += "and 1=0";
				else if (Integer.valueOf(param.get("data_access_level").toString()) == 1)
					sqlcondition += "and li.responsible_cm_id="+ '"' + param.get("uuid") + '"';
				else if(Integer.valueOf(param.get("data_access_level").toString()) == 2)
					sqlcondition += "and li.dept_id="+ '"' + param.get("myDeptId") + '"';
				else if(Integer.valueOf(param.get("data_access_level").toString()) == 3)
					sqlcondition+= " and li.company_id ="+ '"' + param.get("mycompanyId") + '"';
			}
			sqlcondition += " order by li.orderid desc";

			String sql = sqlcontent+sqlcondition+" limit "+String.valueOf(start) + ","+ String.valueOf(pagecount);
			String sqltotal = sqlcount + sqlcondition;

			TodoVO vo = new TodoVO();
			Map<String, Object> loanInfoMap = new HashMap<>();
			Connection conn = null;
			ResultSet rs = null;
			//取得总list数目
			try {
				if(StringUtils.isNotEmpty(sqltotal)){
					conn = dbControl.getConnection();
					rs = dbControl.getData(conn,sqltotal);
				}
				while (rs.next()) {
					totalcount = rs.getInt(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				dbControl.close(conn, rs);
			}

			Date dt3= new Date();
			Long endtime2= dt3.getTime();//这就是距离1970年1月1日0点0分0秒的毫秒数

			try {
				if(StringUtils.isNotEmpty(sql)){
					conn = dbControl.getConnection();
					rs = dbControl.getData(conn,sql);
				}
				while (rs.next()) {
					loanInfoMap = new HashMap<>();
					loanInfoMap.put("customerName", rs.getString(1));
					loanInfoMap.put("idCard", rs.getString(2));
					loanInfoMap.put("orderid", rs.getString(3));
					loanInfoMap.put("uuid", rs.getString(4));
					loanInfoMap.put("pledgeType", rs.getString(5));
					loanInfoMap.put("loanStatus", rs.getString(6));
					loanInfoMap.put("createdAt", rs.getString(7));
					loanInfoMap.put("createBy", rs.getString(8));
					loanInfoMap.put("principalName", rs.getString(9));
					loanInfoMap.put("customerId", rs.getString(10));
					loanInfoMap.put("isImportant", rs.getString(11));
					loanInfoMap.put("state", rs.getString(12));
					vo.setLoanInfoMap(loanInfoMap);
					String uuid = rs.getString(4);

					Task task = (Task)taskMap.get(uuid);
					String businesskey = uuid;
					String processinsId = task.getProcessInstanceId();
					String processdifineId = task.getProcessDefinitionId();
					ProcessInstance pi =(ProcessInstance)piMap.get(uuid);
					ProcessDefinition pd = repositoryService.createProcessDefinitionQuery()
							.processDefinitionId(processdifineId).singleResult();
					vo.setProcessdefine(pd);
					vo.setProcessins(pi);
					vo.setTask(task);
					loanInfoMap.put("assignee", task.getAssignee());
					loanInfoMap.put("taskId", task.getId());
					vo.setProcessinsId(processinsId);
					loanInfoMap.put("processinsId", processinsId);
					vo.setTaskName(task.getName());
					loanInfoMap.put("taskName", task.getName());
					vo.setSuspendedStatus(pi.isSuspended());
					loanInfoMap.put("suspendedStatus", pi.isSuspended());
					vo.setTaskId(task.getId());
					loanInfoMap.put("taskId", task.getId());
					vo.setProcessDefineId(processdifineId);
					loanInfoMap.put("processDefineId", processdifineId);
					vo.setBusinesskey(businesskey);
					loanInfoMap.put("businesskey", businesskey);
					loanInfoMap.put("activityId", pi.getActivityId());
					boolean assigneeStatus = false;
					if (null == task.getAssignee()) {
						assigneeStatus = true;
					}
					vo.setAssigneeStatus(assigneeStatus);
					loanInfoMap.put("assigneeStatus", assigneeStatus);
					vo.setTaskCreateTime(task.getCreateTime());
					loanInfoMap.put("taskCreateTime", task.getCreateTime());
					TodoInsEntity todoInsEntity = todoInService.findBybusinesskey(businesskey);
					String business = todoInsEntity.getBusiness();
					TodoDefineEntity todoDefineEntity = todoDefineService.findByBusiness(business);

					loanInfoMap.put("noloanorder", todopage.getNoloanorder());
					String column1 = rs.getString(1);
					String column2 = rs.getString(2);
					String businessvalues = todoDefineEntity.getBusinessvalue();
					vo.setColumn1(column1);
					vo.setColumn2(column2);
					vo.setBusinessvalue(businessvalues);
					loanInfoMap.put("businessvalue", businessvalues);
					mapList.add(loanInfoMap);
					list.add(vo);

				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				dbControl.close(conn, rs);
			}
		}
		Date dt1= new Date();
		Long endtime= dt1.getTime();//这就是距离1970年1月1日0点0分0秒的毫秒数
		todopage.setTotalcount(totalcount);
		int totalpage = 0;
		boolean hasnext = false;
		boolean haslast = false;


		int end = 0;		
		if (totalcount % pagecount == 0) {
			totalpage = totalcount / pagecount;
		} else {
			totalpage = totalcount / pagecount + 1;
		}
		if (totalpage > (currentPage + 1)) {
			hasnext = true;
		}
		if (currentPage > 0) {
			haslast = true;
		}
		todopage.setHaslast(haslast);
		todopage.setHasnext(hasnext);
		todopage.setCurrentpage(currentPage);
		todopage.setTotalpage(totalpage);

		if ((currentPage + 1) < totalpage) {
			end = (currentPage + 1) * pagecount;
		}else if((currentPage + 1) == totalpage&&(totalcount % pagecount)==0){
			end = (currentPage + 1) * pagecount;
		} else {
			end = start + (totalcount % pagecount);
		}
		if (totalpage == 1) {
			end =mapList.size();
		}

		todopage.setContext(list);
		todopage.setContextMap(mapList);
		return todopage;
	}


	public Map<String, Object> queryLoanInfoCount(WorkFlowType[] keys, String userId, Map<String,Object> param) {
		int loanordercount = 0;

		List<LoanStatusCount> count = loanInfoMapper.queryLoanStatusCountByActivityId(param);
		Map<String, Object> resultmap = new HashMap<>();
		for(LoanStatusCount loanStatusCount:count){
			resultmap.put(loanStatusCount.getActivityId(), loanStatusCount.getCount());
			loanordercount=loanordercount+loanStatusCount.getCount();
		}
		resultmap.put("loanordercount",loanordercount);

 		return resultmap;
	}


	public Map<String, Object> queryLoanInfoCountAfter(WorkFlowType[] keys, String userId, Map<String,Object> param) {

		Map<String, Object> resultmap = new HashMap<>();
		AfterStatusCount allCount = loanInfoMapper.queryAfterStatusCount(param);
		resultmap.put("allOrdercount",allCount.getAllCount());
		resultmap.put("overDueToday",allCount.getTodayCount());
		resultmap.put("overDueSevenDay",allCount.getWeekCount());
		resultmap.put("overDueUnhandled",allCount.getOverdueCount());
		return resultmap;
	}


	public TodoPage queryPaymentCollectionLoansList(String userId, Integer currentPage, Integer pagecount,
			WorkFlowType[] keys, Map<String, Object> param) {
		TodoPage todopage = new TodoPage();

		List<Task> tasklist = new ArrayList<>();
		for (int i = 0; i < keys.length; i++) {
			if(keys[i].toString().equals("vehiclesLoans"))continue;
			List<Task> taskCandidates = taskService.createTaskQuery().processDefinitionKey(keys[i].toString())
					.taskCandidateUser(userId) // 对指定用户的可接取的公共任务执行查询
					.orderByTaskPriority().desc().list();
			List<Task> taskAssigness = taskService.createTaskQuery().processDefinitionKey(keys[i].toString())
					.taskAssignee(userId) // 对指定用户的未完成的个人任务执行查询
					.orderByTaskPriority().desc().list();
			tasklist.addAll(taskCandidates);
			tasklist.addAll(taskAssigness);
		}
		List<Map<String, Object>> subpageList = new ArrayList<>();
		List<TodoVO> list = new ArrayList<TodoVO>();
		List<Map<String, Object>> mapList = new ArrayList<>();

		for (int i = 0; i < tasklist.size(); i++) {
			if (i < tasklist.size()) {
				Task task = tasklist.get(i);
				String processinsId = task.getProcessInstanceId();
				String processdifineId = task.getProcessDefinitionId();
				ProcessInstance pi = runtimeService.createProcessInstanceQuery().processInstanceId(processinsId)
						.singleResult();
				ProcessDefinition pd = repositoryService.createProcessDefinitionQuery()
						.processDefinitionId(processdifineId).singleResult();

				String key = pd.getKey();
				String businesskey = pi.getBusinessKey();
				TodoInsEntity todoInsEntity = todoInService.findBybusinesskey(businesskey);
				String business = todoInsEntity.getBusiness();
				TodoDefineEntity todoDefineEntity = todoDefineService.findByBusiness(business);
				String sql = "";

				if (key.equals(WorkFlowType.paymentCollection.toString())||key.equals(WorkFlowType.paymentCollection_cyb.toString())) {
					if (!task.getName().equals("等待催收")) {

						sql = "select " + " rep." + todoDefineEntity.getProperty() + "," + " rep."
								+ todoDefineEntity.getProperty2() + ","
								+ " li.orderid,u1.realname as create_by,u3.realname as principal_name,ci.customer_name, "
								+ " rpd.repayPeriod,rpd.repayDate,rpd.repayTotal,rpd.gpsCost,rpd.manageFee,li.loan_status,li.uuid, "
								+ " li.state,ci.is_important,rep.uuid as repId,li.customer_id,IFNULL(rep.is_overdue,0) " + " from "
								+ todoDefineEntity.getTablename() + " rep "
								+ " left join loan_info li on li.uuid = rep.loanId "
								+ " left join customer_register_info ci on li.customer_id = ci.uuid "
								+ " left join user u1 ON li.responsible_cm_id = u1.uuid "
								+ " left join dept de ON li.dept_id = de.id "
								+ " left join user u3 ON u3.uuid = de.principal_id "
								+ " left join repayplandetail rpd on rpd.id = rep.replanDetaiId " + " where " + " rep."
								+ todoDefineEntity.getBusinesskeyname() + "='" + businesskey + "'";
						if (param.get("orderNo") != null) {
							sql += " and li.orderid like concat('%','" + param.get("orderNo") + "','%')";
						}
						//if (param.get("pledgeType") != null && param.get("pledgeType").equals("repayment")) {
						//	sql += " and li.loan_status = " + '"' + param.get("pledgeType") + '"';
						//}
						if (param.get("status") != null) {
							if (param.get("status").equals("overDueTodayOrder")) { // 今日逾期订单
								sql += " and TO_DAYS(date_format(rpd.repayDate,'%Y-%m-%d')) - TO_DAYS(date_format(now(),'%Y-%m-%d')) = 0";
							}
							if (param.get("status").equals("overDueSevenDayOrder")) { // 7日内逾期订单
								sql += " and TO_DAYS(date_format(rpd.repayDate,'%Y-%m-%d')) - TO_DAYS(date_format(now(),'%Y-%m-%d')) > 0 "
										+ " and TO_DAYS(date_format(rpd.repayDate,'%Y-%m-%d')) - TO_DAYS(date_format(now(),'%Y-%m-%d')) <= 7";
							}
						}
						if(param.get("data_access_level") != null){
							if(Integer.valueOf(param.get("data_access_level").toString()) == 0)
								sql += "and 1=0";
							else if (Integer.valueOf(param.get("data_access_level").toString()) == 1)
								sql += "and li.responsible_cm_id="+ '"' + param.get("uuid") + '"';
							else if(Integer.valueOf(param.get("data_access_level").toString()) == 2)
								sql += "and li.dept_id="+ '"' + param.get("myDeptId") + '"';
							else if(Integer.valueOf(param.get("data_access_level").toString()) == 3)
								sql+= "and li.company_id ="+ '"' + param.get("companyId") + '"';
						}
						if(param.get("customerName")!=null){
							sql+="AND ci.customer_name LIKE CONCAT('%',"+'"' + param.get("customerName").toString() + '"'+",'%')";
						}

				Map<String, Object> loanInfoMap = new HashMap<>();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
						Connection conn = null;
						ResultSet rs = null;
						conn = dbControl.getConnection();
						rs = dbControl.getData(conn, sql);
				try {
					while (rs.next()) {
						loanInfoMap = new HashMap<>();
						loanInfoMap.put("orderid", rs.getString(3));
						loanInfoMap.put("createBy", rs.getString(4)); // 客户经理
						loanInfoMap.put("principalName", rs.getString(5)); // 团队经理
						loanInfoMap.put("customerName", rs.getString(6)); // 客户姓名
						loanInfoMap.put("repayPeriod", rs.getString(7)); // 期数
						loanInfoMap.put("repayDate", sdf.format(rs.getDate(8))); // 应还时间
						BigDecimal repaymentSum = rs.getBigDecimal(9);
						loanInfoMap.put("repaymentSum", repaymentSum); // 应还金额
						loanInfoMap.put("loanStatus", rs.getString(12)); // 订单状态
						loanInfoMap.put("uuid", rs.getString(13)); // 订单状态
						loanInfoMap.put("state", rs.getString(14)); // 是否加急
						loanInfoMap.put("isImportant", rs.getString(15)); // 重点客户
						loanInfoMap.put("repId", rs.getString(16));
						loanInfoMap.put("customerId", rs.getString(17));
						// 判断是否逾期
						Date now = sdf.parse(sdf.format(new Date()));
						Date repayDate = sdf.parse(sdf.format(rs.getDate(8)));
						if (now.getTime() > repayDate.getTime()||rs.getString(18).toString().equals("1")) {
							loanInfoMap.put("loanStatus", "yuqi"); // 逾期
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
							dbControl.close(conn,rs);
				}
				loanInfoMap.put("assignee", task.getAssignee());
				loanInfoMap.put("taskId", task.getId());
				loanInfoMap.put("processinsId", processinsId);
				loanInfoMap.put("taskName", task.getName());
				loanInfoMap.put("suspendedStatus", pi.isSuspended());
				loanInfoMap.put("taskId", task.getId());
				loanInfoMap.put("processDefineId", processdifineId);
				loanInfoMap.put("businesskey", businesskey);
				loanInfoMap.put("activityId", pi.getActivityId());
				boolean assigneeStatus = false;
				if (null == task.getAssignee()) {
					assigneeStatus = true;
				}
				loanInfoMap.put("assigneeStatus", assigneeStatus);
				loanInfoMap.put("taskCreateTime", task.getCreateTime());
				if (null != loanInfoMap.get("uuid")) {
					if (param.get("status") != null) {
						if (param.get("status").equals("collectionOrder")) { // 已催收订单
							if (!task.getName().equals("等待催收") && !task.getName().equals("还款催收")) {

									mapList.add(loanInfoMap);

							}
						} else if (param.get("status").equals("overDueUnhandledOrder")) { // 逾期未处理订单
							if (task.getName().equals("逾期处理")) {
									mapList.add(loanInfoMap);

							}
						} else {
								mapList.add(loanInfoMap);

						}
					} else {
							mapList.add(loanInfoMap);
					}
				}
			}
		}
			}
		}
		// 数据列表
		ComparatorMap comparator=new ComparatorMap();
		Collections.sort(mapList,comparator);
		int totalcount = mapList.size();
		todopage.setTotalcount(totalcount);
		int totalpage = 0;
		boolean hasnext = false;
		boolean haslast = false;
		if (totalcount % pagecount == 0) {
			totalpage = totalcount / pagecount;
		} else {
			totalpage = totalcount / pagecount + 1;
		}
		if (totalpage > (currentPage + 1)) {
			hasnext = true;
		}
		if (currentPage > 0) {
			haslast = true;
		}
		todopage.setHaslast(haslast);
		todopage.setHasnext(hasnext);
		todopage.setCurrentpage(currentPage);
		todopage.setTotalpage(totalpage);

		int start = currentPage * pagecount;
		int end = 0;
		if ((currentPage + 1) <= totalpage) {
			end = (currentPage + 1) * pagecount;
		} else {
			end = start + (totalcount % pagecount);
		}
		if (totalpage == 1||end>mapList.size()) {
			end =mapList.size();
		}

		subpageList = mapList.subList(start,end);

		todopage.setContextMap(subpageList);
		return todopage;
	}
	/**
	 * 贷后列表显示
	 *
	 * @return
	 */
	@Override
	public PageModel<LoanInfoForRepayment> queryLoanInfoListForRepayment( Map<String, Object> param,Integer currentPage) {
		PageModel<LoanInfoForRepayment> pm = new PageModel<>();
		try {
			pm = baseDao.getPage("com.utonw.utonerp.mapper.LoanInfoMapper.queryLoanAfterList",
					param, currentPage);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return pm;
	}
	private boolean checkTaskName(String[] taskNames,String taskName){
		boolean r = false;
		for(int i=0;i<taskNames.length;i++){
			if(taskName.equals(taskNames[i])){
				r = true;
				break;
			}
		}
		return r;
	}

	public TodoPage queryVehiclesLoansWholeList(String userId, Integer currentPage, Integer pagecount,
			WorkFlowType[] keys, Map<String, Object> param) {
		TodoPage todopage = new TodoPage();
		List<Task> tasklist = new ArrayList<>();
		for (int i = 0; i < keys.length; i++) {
			List<Task> taskCandidates = taskService.createTaskQuery().processDefinitionKey(keys[i].toString())
					.taskCandidateUser(userId) // 对指定用户的可接取的公共任务执行查询
					.orderByTaskPriority().desc().list();
			List<Task> taskAssigness = taskService.createTaskQuery().processDefinitionKey(keys[i].toString())
					.taskAssignee(userId) // 对指定用户的未完成的个人任务执行查询
					.orderByTaskPriority().desc().list();
			todopage.setNoloanorder(taskCandidates.size());
			tasklist.addAll(taskCandidates);
			tasklist.addAll(taskAssigness);
		}

		int totalcount = tasklist.size();

		todopage.setTotalcount(totalcount);
		int totalpage = 0;
		boolean hasnext = false;
		boolean haslast = false;
		if (totalcount % pagecount == 0) {
			totalpage = totalcount / pagecount;
		} else {
			totalpage = totalcount / pagecount + 1;
		}
		if (totalpage > (currentPage + 1)) {
			hasnext = true;
		}
		if (currentPage > 0) {
			haslast = true;
		}
		todopage.setHaslast(haslast);
		todopage.setHasnext(hasnext);
		todopage.setCurrentpage(currentPage);
		todopage.setTotalpage(totalpage);
		List<TodoVO> list = new ArrayList<TodoVO>();
		List<Map<String, Object>> mapList = new ArrayList<>();
		int start = currentPage * pagecount;
		int end = 0;
		if ((currentPage + 1) < totalpage) {
			end = (currentPage + 1) * pagecount;
		}else if((currentPage + 1) == totalpage&&(totalcount % pagecount)==0){
			end = (currentPage + 1) * pagecount;
		} else {
			end = start + (totalcount % pagecount);
		}
		if (totalpage == 1) {
			end = tasklist.size();
		}
		for (int i = start; i < end; i++) {
			if (i < tasklist.size()) {
				Task task = tasklist.get(i);
				String processinsId = task.getProcessInstanceId();
				String processdifineId = task.getProcessDefinitionId();
				ProcessInstance pi = runtimeService.createProcessInstanceQuery().processInstanceId(processinsId)
						.singleResult();
				ProcessDefinition pd = repositoryService.createProcessDefinitionQuery()
						.processDefinitionId(processdifineId).singleResult();

				String key = pd.getKey();
				String businesskey = pi.getBusinessKey();
				TodoInsEntity todoInsEntity = todoInService.findBybusinesskey(businesskey);
				String business = todoInsEntity.getBusiness();
				TodoDefineEntity todoDefineEntity = todoDefineService.findByBusiness(business);
				String sql = "";
				if (key.equals(WorkFlowType.vehiclesLoans.toString())) {
					sql = "select ci.customer_name,li.id_card,li.orderid,li.uuid,li.pledge_type,"
							+ " li.loan_status, li.created_at,u1.realname as create_by,u3.realname as principal_name"
							+ " from loan_info li LEFT JOIN customer_register_info ci ON "
							+ " li.customer_id = ci.uuid " + " LEFT JOIN user u1 ON li.create_cm_id = u1.uuid"
							+ " LEFT JOIN dept de ON li.dept_id = de.id"
							+ " LEFT JOIN user u3 ON u3.uuid = de.principal_id" + " where li.uuid='" + businesskey
							+ "'";
					if (param.get("orderNo") != null) {
						sql += " and li.orderid like concat('%','" + param.get("orderNo") + "','%')";
					}
					if (param.get("customerName") != null) {
						sql += " and ci.customer_name like concat('%','" + param.get("customerName") + "','%')";
					}
//					if (param.get("customerManage") != null) {
//						sql += " and u3.realname like concat('%','" + param.get("customerManage") + "','%')";
//					}
					if (param.get("pledgeType") != null) {
						sql += " and li.pledge_type = " + '"' + param.get("pledgeType") + '"';
					}
					if (param.get("loanStatus") != null) {
						sql += " and li.loan_status = " + '"' + param.get("loanStatus") + '"';
					}
					if (param.get("searchDate") != null) {
						sql += " and li.created_at like concat('%','" + param.get("searchDate") + "','%')";
					}
				} else {
					sql = "select ci.customer_name,li.id_card,li.orderid,li.uuid,li.pledge_type,"
							+ " li.loan_status, li.created_at,u1.realname as create_by,u3.realname as principal_name"
							+ " from " + todoDefineEntity.getTablename() + " rep "
							+ " left join loan_info li on li.uuid = rep.loanId "
							+ " left join customer_register_info ci on li.customer_id = ci.uuid "
							+ " left join user u1 ON li.create_cm_id = u1.uuid "
							+ " left join dept de ON li.dept_id = de.id "
							+ " left join user u3 ON u3.uuid = de.principal_id "
							+ " left join repayplandetail rpd on rpd.id = rep.replanDetaiId " + " where " + " rep."
							+ todoDefineEntity.getBusinesskeyname() + "='" + businesskey + "'";
					if (param.get("orderNo") != null) {
						sql += " and li.orderid like concat('%','" + param.get("orderNo") + "','%')";
					}
					if (param.get("pledgeType") != null) {
						sql += " and li.loan_status = " + '"' + param.get("pledgeType") + '"';
					}
					if (param.get("customerName") != null) {
						sql += " and ci.customer_name like concat('%','" + param.get("customerName") + "','%')";
					}
//					if (param.get("customerManage") != null) {
//						sql += " and u3.realname like concat('%','" + param.get("customerManage") + "','%')";
//					}
					if (param.get("searchDate") != null) {
						sql += " and li.created_at like concat('%','" + param.get("searchDate") + "','%')";
					}
				}

				TodoVO vo = new TodoVO();
				Map<String, Object> loanInfoMap = new HashMap<>();
				Connection conn = null;
				ResultSet rs = null;
				try {
					conn = dbControl.getConnection();
					rs = dbControl.getData(conn,sql);
					while (rs.next()) {
						loanInfoMap = new HashMap<>();
						loanInfoMap.put("customerName", rs.getString(1));
						loanInfoMap.put("idCard", rs.getString(2));
						loanInfoMap.put("orderid", rs.getString(3));
						loanInfoMap.put("uuid", rs.getString(4));
						loanInfoMap.put("pledgeType", rs.getString(5));
						loanInfoMap.put("loanStatus", rs.getString(6));
						loanInfoMap.put("createdAt", rs.getString(7));
						loanInfoMap.put("createBy", rs.getString(8));
						loanInfoMap.put("principalName", rs.getString(9));
						vo.setLoanInfoMap(loanInfoMap);
						String column1 = rs.getString(1);
						String column2 = rs.getString(2);
						String businessvalues = todoDefineEntity.getBusinessvalue();
						vo.setColumn1(column1);
						vo.setColumn2(column2);
						vo.setBusinessvalue(businessvalues);
						loanInfoMap.put("businessvalue", businessvalues);
					}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					dbControl.close(conn,rs);
				}
				vo.setProcessdefine(pd);
				vo.setProcessins(pi);
				vo.setTask(task);
				loanInfoMap.put("assignee", task.getAssignee());
				loanInfoMap.put("taskId", task.getId());
				vo.setProcessinsId(processinsId);
				loanInfoMap.put("processinsId", processinsId);
				vo.setTaskName(task.getName());
				loanInfoMap.put("taskName", task.getName());
				vo.setSuspendedStatus(pi.isSuspended());
				loanInfoMap.put("suspendedStatus", pi.isSuspended());
				vo.setTaskId(task.getId());
				loanInfoMap.put("taskId", task.getId());
				vo.setProcessDefineId(processdifineId);
				loanInfoMap.put("processDefineId", processdifineId);
				vo.setBusinesskey(businesskey);
				loanInfoMap.put("businesskey", businesskey);
				loanInfoMap.put("activityId", pi.getActivityId());
				boolean assigneeStatus = false;
				if (null == task.getAssignee()) {
					assigneeStatus = true;
				}
				vo.setAssigneeStatus(assigneeStatus);
				loanInfoMap.put("assigneeStatus", assigneeStatus);
				vo.setTaskCreateTime(task.getCreateTime());
				loanInfoMap.put("taskCreateTime", task.getCreateTime());
				list.add(vo);
				if (null != loanInfoMap.get("uuid")) {
					if (param.get("status") != null) {
						if (param.get("status").equals("collectionOrder")) { // 已催收订单
							if (!task.getName().equals("等待催收") && !task.getName().equals("还款催收")) {
								mapList.add(loanInfoMap);
							}
						} else if (param.get("status").equals("overDueUnhandledOrder")) { // 逾期未处理订单
							if (task.getName().equals("逾期处理")) {
								mapList.add(loanInfoMap);
							}
						} else {
							mapList.add(loanInfoMap);
						}
					} else {
						mapList.add(loanInfoMap);
					}
				}
				loanInfoMap.put("noloanorder", todopage.getNoloanorder());
			}

		}

		todopage.setContext(list);
		todopage.setContextMap(mapList);
		return todopage;
	}

	public List<ProcessInstance> getProcessInstanceList(WorkFlowType workFlowType) {

		// 创建查询对象
		ProcessInstanceQuery processInstanceQuery = runtimeService.createProcessInstanceQuery();

		// 流程定义 key
		String processDefinitionKey = WorkFlowType.paymentCollection.toString();

		processInstanceQuery.processDefinitionKey(processDefinitionKey);

		// 获取查询列表
		List<ProcessInstance> list = processInstanceQuery.list();

		return list;
	}

	public TodoPage queryStateList(String userId, Integer currentPage, Integer pagecount, WorkFlowType[] keys,
			Map<String, Object> param) {
		TodoPage todopage = new TodoPage();

		List<Task> tasklist = new ArrayList<>();
		for (int i = 0; i < keys.length; i++) {
			List<Task> taskCandidates = taskService.createTaskQuery().processDefinitionKey(keys[i].toString())
					.taskCandidateUser(userId) // 对指定用户的可接取的公共任务执行查询
					.orderByTaskPriority().desc().list();
			List<Task> taskAssigness = taskService.createTaskQuery().processDefinitionKey(keys[i].toString())
					.taskAssignee(userId) // 对指定用户的未完成的个人任务执行查询
					.orderByTaskPriority().desc().list();
			todopage.setNoloanorder(taskCandidates.size());
			tasklist.addAll(taskCandidates);
			tasklist.addAll(taskAssigness);
		}

		int totalcount = tasklist.size();

		todopage.setTotalcount(totalcount);
		int totalpage = 0;
		boolean hasnext = false;
		boolean haslast = false;
		if (totalcount % pagecount == 0) {
			totalpage = totalcount / pagecount;
		} else {
			totalpage = totalcount / pagecount + 1;
		}
		if (totalpage > (currentPage + 1)) {
			hasnext = true;
		}
		if (currentPage > 0) {
			haslast = true;
		}
		todopage.setHaslast(haslast);
		todopage.setHasnext(hasnext);
		todopage.setCurrentpage(currentPage);
		todopage.setTotalpage(totalpage);
		List<TodoVO> list = new ArrayList<TodoVO>();
		List<Map<String, Object>> mapList = new ArrayList<>();
		int start = currentPage * pagecount;
		int end = 0;
		if ((currentPage + 1) < totalpage) {
			end = (currentPage + 1) * pagecount;
		}else if((currentPage + 1) == totalpage&&(totalcount % pagecount)==0){
			end = (currentPage + 1) * pagecount;
		} else {
			end = start + (totalcount % pagecount);
		}
		if (totalpage == 1) {
			end = tasklist.size();
		}
		for (int i = start; i < end; i++) {
			if (i < tasklist.size()) {
				Task task = tasklist.get(i);
				String processinsId = task.getProcessInstanceId();
				String processdifineId = task.getProcessDefinitionId();
				ProcessInstance pi = runtimeService.createProcessInstanceQuery().processInstanceId(processinsId)
						.singleResult();
				ProcessDefinition pd = repositoryService.createProcessDefinitionQuery()
						.processDefinitionId(processdifineId).singleResult();

				String key = pd.getKey();
				String businesskey = pi.getBusinessKey();
				TodoInsEntity todoInsEntity = todoInService.findBybusinesskey(businesskey);
				String business = todoInsEntity.getBusiness();
				TodoDefineEntity todoDefineEntity = todoDefineService.findByBusiness(business);
				String sql = "";

				if (key.equals(WorkFlowType.vehiclesLoans.toString()) && param.get("state").equals("front")) {
					sql = "select ci.customer_name,li.id_card,li.orderid,li.uuid,li.pledge_type,"
							+ " li.loan_status, li.created_at,u1.realname as create_by,u3.realname as principal_name"
							+ " from loan_info li LEFT JOIN customer_register_info ci ON "
							+ " li.customer_id = ci.uuid " + " LEFT JOIN user u1 ON li.create_cm_id = u1.uuid"
							+ " LEFT JOIN dept de ON li.dept_id = de.id"
							+ " LEFT JOIN user u3 ON u3.uuid = de.principal_id" + " where li.uuid='" + businesskey
							+ "'";
					if (param.get("orderNo") != null) {
						sql += " and li.orderid like concat('%','" + param.get("orderNo") + "','%')";
					}
					if (param.get("customerName") != null) {
						sql += " and ci.customer_name like concat('%','" + param.get("customerName") + "','%')";
					}
					if (param.get("customerManage") != null) {
						sql += " and u3.realname like concat('%','" + param.get("customerManage") + "','%')";
					}
					if (param.get("pledgeType") != null) {
						sql += " and li.pledge_type = " + '"' + param.get("pledgeType") + '"';
					}
					if (param.get("loanStatus") != null) {
						sql += " and li.loan_status = " + '"' + param.get("loanStatus") + '"';
					}
				} else if (key.equals(WorkFlowType.paymentCollection.toString()) && param.get("state").equals("back")) {
					sql = "select ci.customer_name,li.id_card,li.orderid,li.uuid,li.pledge_type,"
							+ " li.loan_status, li.created_at,u1.realname as create_by,u3.realname as principal_name"
							+ " from " + todoDefineEntity.getTablename() + " rep "
							+ " left join loan_info li on li.uuid = rep.loanId "
							+ " left join customer_register_info ci on li.customer_id = ci.uuid "
							+ " left join user u1 ON li.create_cm_id = u1.uuid "
							+ " left join dept de ON li.dept_id = de.id "
							+ " left join user u3 ON u3.uuid = de.principal_id "
							+ " left join repayplandetail rpd on rpd.id = rep.replanDetaiId " + " where " + " rep."
							+ todoDefineEntity.getBusinesskeyname() + "='" + businesskey + "'";
					if (param.get("orderNo") != null) {
						sql += " and li.orderid like concat('%','" + param.get("orderNo") + "','%')";
					}
					if (param.get("pledgeType") != null) {
						sql += " and li.loan_status = " + '"' + param.get("pledgeType") + '"';
					}
				}

				TodoVO vo = new TodoVO();
				Map<String, Object> loanInfoMap = new HashMap<>();
				Connection conn = null;
				ResultSet rs = null;
				try {
					conn = dbControl.getConnection();
					rs = dbControl.getData(conn, sql);
					while (rs.next()) {
						loanInfoMap = new HashMap<>();
						loanInfoMap.put("customerName", rs.getString(1));
						loanInfoMap.put("idCard", rs.getString(2));
						loanInfoMap.put("orderid", rs.getString(3));
						loanInfoMap.put("uuid", rs.getString(4));
						loanInfoMap.put("pledgeType", rs.getString(5));
						loanInfoMap.put("loanStatus", rs.getString(6));
						loanInfoMap.put("createdAt", rs.getString(7));
						loanInfoMap.put("createBy", rs.getString(8));
						loanInfoMap.put("principalName", rs.getString(9));
						vo.setLoanInfoMap(loanInfoMap);
						String column1 = rs.getString(1);
						String column2 = rs.getString(2);
						String businessvalues = todoDefineEntity.getBusinessvalue();
						vo.setColumn1(column1);
						vo.setColumn2(column2);
						vo.setBusinessvalue(businessvalues);
						loanInfoMap.put("businessvalue", businessvalues);
					}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					dbControl.close(conn,rs);
				}
				vo.setProcessdefine(pd);
				vo.setProcessins(pi);
				vo.setTask(task);
				loanInfoMap.put("assignee", task.getAssignee());
				loanInfoMap.put("taskId", task.getId());
				vo.setProcessinsId(processinsId);
				loanInfoMap.put("processinsId", processinsId);
				vo.setTaskName(task.getName());
				loanInfoMap.put("taskName", task.getName());
				vo.setSuspendedStatus(pi.isSuspended());
				loanInfoMap.put("suspendedStatus", pi.isSuspended());
				vo.setTaskId(task.getId());
				loanInfoMap.put("taskId", task.getId());
				vo.setProcessDefineId(processdifineId);
				loanInfoMap.put("processDefineId", processdifineId);
				vo.setBusinesskey(businesskey);
				loanInfoMap.put("businesskey", businesskey);
				loanInfoMap.put("activityId", pi.getActivityId());
				boolean assigneeStatus = false;
				if (null == task.getAssignee()) {
					assigneeStatus = true;
				}
				vo.setAssigneeStatus(assigneeStatus);
				loanInfoMap.put("assigneeStatus", assigneeStatus);
				vo.setTaskCreateTime(task.getCreateTime());
				loanInfoMap.put("taskCreateTime", task.getCreateTime());
				list.add(vo);
				if (null != loanInfoMap.get("uuid")) {
					mapList.add(loanInfoMap);
				}
				loanInfoMap.put("noloanorder", todopage.getNoloanorder());
			}

		}
		todopage.setContext(list);
		todopage.setContextMap(mapList);
		return todopage;
	}


	public Map<String, Object> queryLoanInfosStatecount(WorkFlowType[] keys, String userId) {
		int vehicleAssess = 0;
		int departLeadAduit = 0;
		int trialPhase = 0;
		int callBack = 0;
		int visiteCheck = 0;
		int judgment = 0;
		int signContract = 0;
		int dataReview = 0;
		int lended = 0;
		int loanordercount = 0;
		int end = 0;
		int repayment = 0;

		List<Task> tasklist = new ArrayList<>();
		for (int i = 0; i < keys.length; i++) {
			List<Task> taskCandidates = taskService.createTaskQuery().processDefinitionKey(keys[i].toString())
					.taskCandidateUser(userId) // 对指定用户的可接取的公共任务执行查询
					.orderByTaskPriority().desc().list();
			List<Task> taskAssigness = taskService.createTaskQuery().processDefinitionKey(keys[i].toString())
					.taskAssignee(userId) // 对指定用户的未完成的个人任务执行查询
					.orderByTaskPriority().desc().list();
			tasklist.addAll(taskCandidates);
			tasklist.addAll(taskAssigness);
		}

		for (Task task : tasklist) {
			String processinsId = task.getProcessInstanceId();
			String processdifineId = task.getProcessDefinitionId();
			ProcessInstance pi = runtimeService.createProcessInstanceQuery().processInstanceId(processinsId)
					.singleResult();
			ProcessDefinition pd = repositoryService.createProcessDefinitionQuery().processDefinitionId(processdifineId)
					.singleResult();

			String key = pd.getKey();
			String businesskey = pi.getBusinessKey();
			TodoInsEntity todoInsEntity = todoInService.findBybusinesskey(businesskey);
			String business = todoInsEntity.getBusiness();
			TodoDefineEntity todoDefineEntity = todoDefineService.findByBusiness(business);
			String sql = "";
			if (key.equals(WorkFlowType.vehiclesLoans.toString())) {
				sql = "select " + " li.loan_status" + " from loan_info li LEFT JOIN customer_register_info ci ON "
						+ " li.customer_id = ci.uuid " + " LEFT JOIN user u1 ON li.create_cm_id = u1.uuid"
						+ " LEFT JOIN dept de ON li.dept_id = de.id" + " LEFT JOIN user u3 ON u3.uuid = de.principal_id"
						+ " where li.uuid='" + businesskey + "'";
			} else {
				repayment++;
			}

			Connection conn = null;
			ResultSet rs = null;

			try {
				conn = dbControl.getConnection();
				rs = dbControl.getData(conn,sql);
				while (rs.next()) {
					if (rs.getString(1).equals("vehicleAssess")) {
						vehicleAssess++;
					} else if (rs.getString(1).equals("departLeadAduit")) {
						departLeadAduit++;
					} else if (rs.getString(1).equals("trialPhase")) {
						trialPhase++;
					} else if (rs.getString(1).equals("callBack")) {
						callBack++;
					} else if (rs.getString(1).equals("visiteCheck")) {
						visiteCheck++;
					} else if (rs.getString(1).equals("judgment")) {
						judgment++;
					} else if (rs.getString(1).equals("signContract")) {
						signContract++;
					} else if (rs.getString(1).equals("dataReview")) {
						dataReview++;
					} else if (rs.getString(1).equals("lended")) {
						lended++;
					} else if (rs.getString(1).equals("lended")) {
						end++;
					} else if (rs.getString(1).equals("lended")) {
						repayment++;
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				dbControl.close(conn, rs);
			}
		}
		Map<String, Object> param = new HashMap<>();
		loanordercount = vehicleAssess + departLeadAduit + trialPhase + callBack + visiteCheck + judgment + signContract
				+ dataReview + lended;
		param.put("loanordercount", loanordercount);
		param.put("repayment", repayment);
		param.put("count", loanordercount + repayment);
		param.put("end", end);
		return param;

	}

	@Override
	public TodoPage queryAllHistory(String uuid, int page, int count, Map<String, Object> param) {
		TodoPage todopage = new TodoPage();
		Integer formIndex = page * count;

		Integer toIndex = page * count + count;

		HistoricProcessInstanceQuery historicProcessInstanceQuery = historyService.createHistoricProcessInstanceQuery();

		// String processDefinitionKey =
		// WorkFlowType.paymentCollection.toString();
		// historicProcessInstanceQuery.processDefinitionKey(processDefinitionKey);

		if (null != uuid && !"".equals(uuid)) {
			historicProcessInstanceQuery.involvedUser(uuid);
		}

		historicProcessInstanceQuery.finished();

		historicProcessInstanceQuery.orderByProcessInstanceEndTime().desc();

		Map <String, Object> resultmap = new HashMap<>();
		List<HistoricProcessInstance> list = historicProcessInstanceQuery.list();
		List<Map<String, Object>> mapList = new ArrayList<>();
		List<Map<String, Object>> subpageList = new ArrayList<>();
		for (HistoricProcessInstance historicProcessInstance : list) {
			String processdifineId = historicProcessInstance.getProcessDefinitionId();
			ProcessDefinition pd = repositoryService.createProcessDefinitionQuery().processDefinitionId(processdifineId)
					.singleResult();

			String key = pd.getKey();

			String sql = "";
			if (key.equals("paymentCollection")) { // 贷后
				sql = "select ci.customer_name,li.id_card,li.orderid,li.uuid,li.pledge_type,"
						+ " li.loan_status, li.created_at,u1.realname as create_by,u3.realname as principal_name,"
						+ " li.state,ci.is_important,li.customer_id "
						+ " from repayment rep" + " left join loan_info li on li.uuid = rep.loanId "
						+ " left join customer_register_info ci on li.customer_id = ci.uuid "
						+ " left join user u1 ON li.responsible_cm_id = u1.uuid "
						+ " left join dept de ON li.dept_id = de.id "
						+ " left join user u3 ON u3.uuid = de.principal_id "
						+ " left join repayplandetail rpd on rpd.id = rep.replanDetaiId " + " where " + " rep.uuid = '"
						+ historicProcessInstance.getBusinessKey() + "'";
				if (param.get("orderNo") != null) {
					sql += " and li.orderid like concat('%','" + param.get("orderNo") + "','%')";
				}
				if (param.get("customerName") != null) {
					sql += " and ci.customer_name like concat('%','" + param.get("customerName") + "','%')";
				}
//				if (param.get("customerManage") != null) {
//					sql += " and u3.realname like concat('%','" + param.get("customerManage") + "','%')";
//				}
//				if (param.get("pledgeType") != null) {
//					sql += " and li.pledge_type = " + '"' + param.get("pledgeType") + '"';
//				}
				if (param.get("loanStatus") != null) {
					sql += " and li.loan_status = '" +  param.get("loanStatus") + "'";
				}
				if (param.get("searchDate") != null) {
					sql += " and li.created_at like concat('%','" + param.get("searchDate") + "','%')";
				}
				System.out.println("贷后--------------");

			} else {

				sql = "select ci.customer_name,li.id_card,li.orderid,li.uuid,li.pledge_type,"
						+ " li.loan_status, li.created_at,u1.realname as create_by,u3.realname as principal_name,"
						+ " li.state,ci.is_important,li.customer_id "
						+ " from loan_info li LEFT JOIN customer_register_info ci ON " + " li.customer_id = ci.uuid "
						+ " LEFT JOIN user u1 ON li.responsible_cm_id = u1.uuid" + " LEFT JOIN dept de ON li.dept_id = de.id"
						+ " LEFT JOIN user u3 ON u3.uuid = de.principal_id" + " where li.uuid='"
						+ historicProcessInstance.getBusinessKey() + "'";
				if (param.get("orderNo") != null) {
					sql += " and li.orderid like concat('%','" + param.get("orderNo") + "','%')";
				}
				if (param.get("customerName") != null) {
					sql += " and ci.customer_name like concat('%','" + param.get("customerName") + "','%')";
				}
//				if (param.get("customerManage") != null) {
//					sql += " and u3.realname like concat('%','" + param.get("customerManage") + "','%')";
//				}
				if (param.get("pledgeType") != null) {
					sql += " and li.pledge_type = " + '"' + param.get("pledgeType") + '"';
				}
				if (param.get("loanStatus") != null) {
					sql += " and li.loan_status = " + '"' + param.get("loanStatus") + '"';
				}
				if (param.get("searchDate") != null) {
					sql += " and li.created_at like concat('%','" + param.get("searchDate") + "','%')";
				}

				System.out.println("贷前--------------");
			}
			TodoVO vo = new TodoVO();
			Map<String, Object> loanInfoMap = new HashMap<>();
			Connection conn = null;
			ResultSet rs = null;
			try {
				conn = dbControl.getConnection();
				rs = dbControl.getData(conn,sql);
				while (rs.next()) {
					loanInfoMap = new HashMap<>();
					loanInfoMap.put("customerName", rs.getString(1));
					loanInfoMap.put("idCard", rs.getString(2));
					loanInfoMap.put("orderid", rs.getString(3));
					loanInfoMap.put("uuid", rs.getString(4));
					loanInfoMap.put("pledgeType", rs.getString(5));
					loanInfoMap.put("loanStatus", rs.getString(6));
					loanInfoMap.put("createdAt", rs.getString(7));
					loanInfoMap.put("createBy", rs.getString(8));
					loanInfoMap.put("principalName", rs.getString(9));
					loanInfoMap.put("state", rs.getString(10));
					loanInfoMap.put("isImportant", rs.getString(11));
					loanInfoMap.put("customerId", rs.getString(12));
					vo.setLoanInfoMap(loanInfoMap);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				dbControl.close(conn, rs);
			}
			if (null != loanInfoMap.get("uuid")) {
				boolean repeatflag = false;
				for (int i = 0; i < mapList.size(); i++){
					Map<String, Object> tmp = mapList.get(i);
					String tmpuuid = (String)tmp.get("uuid");
					if (tmpuuid.equals( loanInfoMap.get("uuid"))){
						repeatflag = true;
						break;
					}
				}
				if(repeatflag == false){
					mapList.add(loanInfoMap);
				}

			}
		}

		// 数据列表
		Integer countToal =mapList.size();

		if (toIndex >= countToal) {
			toIndex = countToal;
		}
		subpageList = mapList.subList(formIndex,toIndex);
		resultmap.put("subpageList",subpageList);
		resultmap.put("totallist",countToal);

		todopage.setTotalcount(countToal);
		int totalpage = 0;
		boolean hasnext = false;
		boolean haslast = false;
		if (countToal % count == 0) {
			totalpage = countToal / count;
		} else {
			totalpage = countToal / count + 1;
		}
		if (totalpage > (page + 1)) {
			hasnext = true;
		}
		if (page > 0) {
			haslast = true;
		}
		todopage.setHaslast(haslast);
		todopage.setHasnext(hasnext);
		todopage.setCurrentpage(page);
		todopage.setTotalpage(totalpage);


		todopage.setContextMap(subpageList);
		return todopage;

	}

	@Override
	public boolean simpleSend( String url,String domainName) {
		String sql = "SELECT  u.uuid FROM  `user` u" + " WHERE u.email='" + url + "'";

		Calendar cal = Calendar.getInstance();
		long time = cal.getTimeInMillis();

		boolean sign = false;
		Connection conn = null;
		ResultSet rs = null;
		String uuid = null;
		try {
			conn = dbControl.getConnection();
			rs = dbControl.getData(conn, sql);
			if (rs.next()) {
				uuid = rs.getString(1);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			dbControl.close(conn, rs);
		}
		try{
				if(uuid!=null){
				String text="点击此处，修改密码";
				JavaMailSenderImpl senderImpl =new JavaMailSenderImpl();
				senderImpl.setHost("smtp.163.com");
				senderImpl.setPort(25);
				senderImpl.setUsername("mtypublic@163.com");
				senderImpl.setPassword("password1");
				senderImpl.setDefaultEncoding("UTF-8");

				MimeMessage mailMessage =senderImpl.createMimeMessage();
				MimeMessageHelper messageHelper =new MimeMessageHelper(mailMessage);
				messageHelper.setTo(url);
				messageHelper.setSubject("北京迅驰中颐有限公司");
				String content = "<a href='http://"+domainName+"/loan/modifypassword.html?uuid=" + uuid + "&date="+ time+"'>"+ URLDecoder.decode(text,"UTF-8")+"</a>";
				messageHelper.setText(content,true);
				messageHelper.setFrom(new InternetAddress("mtypublic@163.com"));
				senderImpl.send(mailMessage);
				sign = true;		
			}
		}
		catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 


		return sign;
	}

	@Override
	public String updatepassword(String uuid, String password) {
		String a = "no";
		String sql = "UPDATE  `user` SET `password`='" + password + "' WHERE uuid='" + uuid + "'";
		Connection conn = null;
		conn = dbControl.getConnection();
		if (dbControl.update(conn,sql) > 0) {
			a = "yes";
		}
		dbControl.close(conn, null);
		return a;
	}

	public TodoPage getcontractlist(String userId, Integer currentPage, Integer pagecount, WorkFlowType[] keys,
			Map<String, Object> param) {
		TodoPage todopage = new TodoPage();
		List<Task> tasklist = new ArrayList<>();
		for (int i = 0; i < keys.length; i++) {
			List<Task> taskCandidates = taskService.createTaskQuery().processDefinitionKey(keys[i].toString())
					.taskCandidateUser(userId) // 对指定用户的可接取的公共任务执行查询
					.orderByTaskPriority().desc().list();
			List<Task> taskAssigness = taskService.createTaskQuery().processDefinitionKey(keys[i].toString())
					.taskAssignee(userId) // 对指定用户的未完成的个人任务执行查询
					.orderByTaskPriority().desc().list();
			todopage.setNoloanorder(taskCandidates.size());
			tasklist.addAll(taskCandidates);
			tasklist.addAll(taskAssigness);
		}


		int start = 0;
		int end = tasklist.size();
		List<TodoVO> list = new ArrayList<TodoVO>();
		List<TodoVO> sublist = new ArrayList<TodoVO>();
		List<Map<String, Object>> mapList = new ArrayList<>();
		List<Map<String, Object>> submapList = new ArrayList<>();

		for (int i = start; i < end; i++) {
			if (i < tasklist.size()) {
				Task task = tasklist.get(i);
				String processinsId = task.getProcessInstanceId();
				String processdifineId = task.getProcessDefinitionId();
				ProcessInstance pi = runtimeService.createProcessInstanceQuery().processInstanceId(processinsId)
						.singleResult();
				ProcessDefinition pd = repositoryService.createProcessDefinitionQuery()
						.processDefinitionId(processdifineId).singleResult();

				String key = pd.getKey();
				String businesskey = pi.getBusinessKey();
				TodoInsEntity todoInsEntity = todoInService.findBybusinesskey(businesskey);
				String business = todoInsEntity.getBusiness();
				TodoDefineEntity todoDefineEntity = todoDefineService.findByBusiness(business);
				String sql = "";
				if (key.equals(WorkFlowType.vehiclesLoans.toString())) {
					sql = "select ci.customer_name,li.id_card,li.orderid,li.uuid,li.pledge_type,"
							+ " li.loan_status, li.created_at,u1.realname as create_by,u3.realname as principal_name,"
							+ " (select count(lia.id) from loan_info_attachment lia where lia.loan_id = li.uuid) as lia_count,"
							+ " li.state,ci.is_important,li.customer_id"
							+ " from loan_info li LEFT JOIN customer_register_info ci ON "
							+ " li.customer_id = ci.uuid " + " LEFT JOIN user u1 ON li.create_cm_id = u1.uuid"
							+ " LEFT JOIN dept de ON li.dept_id = de.id"
							+ " LEFT JOIN user u3 ON u3.uuid = de.principal_id" + " where li.uuid='" + businesskey + "'"
							+ " AND li.loan_status NOT in ('liacount','departLeadAduit','trialPhase','vehicleAssess','callBack') ";
					if (param.get("orderNo") != null) {
						sql += " and li.orderid like concat('%','" + param.get("orderNo") + "','%')";
					}
					if (param.get("customerName") != null) {
						sql += " and ci.customer_name like concat('%','" + param.get("customerName") + "','%')";
					}
					if (param.get("loanStatus") != null) {
						sql += " and li.loan_status = " + '"' + param.get("loanStatus") + '"';
					}
				} else {
					sql = "select ci.customer_name,li.id_card,li.orderid,li.uuid,li.pledge_type,"
							+ " li.loan_status, li.created_at,u1.realname as create_by,u3.realname as principal_name,"
							+ " (select count(lia.id) from loan_info_attachment lia where lia.loan_id = li.uuid) as lia_count,"
							+ " li.state,ci.is_important,li.customer_id"
							+ " from " + todoDefineEntity.getTablename() + " rep "
							+ " left join loan_info li on li.uuid = rep.loanId "
							+ " left join customer_register_info ci on li.customer_id = ci.uuid "
							+ " left join user u1 ON li.create_cm_id = u1.uuid "
							+ " left join dept de ON li.dept_id = de.id "
							+ " left join user u3 ON u3.uuid = de.principal_id "
							+ " left join repayplandetail rpd on rpd.id = rep.replanDetaiId " + " where " + " rep."
							+ todoDefineEntity.getBusinesskeyname() + "='" + businesskey + "'"
							+ " AND li.loan_status NOT in('liacount','departLeadAduit','trialPhase','trialPhase','visiteCheck') ";
					if (param.get("orderNo") != null) {
						sql += " and li.orderid like concat('%','" + param.get("orderNo") + "','%')";
					}
					if (param.get("customerName") != null) {
						sql += " and ci.customer_name like concat('%','" + param.get("customerName") + "','%')";
					}
					if (param.get("pledgeType") != null) {
						sql += " and li.pledgeType = " + '"' + param.get("pledgeType") + '"';
					}
				}
				if(param.get("data_access_level") != null){
					if(Integer.valueOf(param.get("data_access_level").toString()) == 0)
						sql += "and 1=0";
					else if (Integer.valueOf(param.get("data_access_level").toString()) == 1)
						sql += "and li.responsible_cm_id="+ '"' + param.get("userId") + '"';
					else if(Integer.valueOf(param.get("data_access_level").toString()) == 2)
						sql += "and li.dept_id="+ '"' + param.get("myDeptId") + '"';
					else if(Integer.valueOf(param.get("data_access_level").toString()) == 3)
						sql+= "and li.company_id ="+ '"' + param.get("companyId") + '"';
				}

				TodoVO vo = new TodoVO();
				Map<String, Object> loanInfoMap = new HashMap<>();
				Connection conn = null;
				ResultSet rs = null;
				try {
					conn = dbControl.getConnection();
					rs = dbControl.getData(conn,sql);
					while (rs.next()) {
						loanInfoMap = new HashMap<>();
						loanInfoMap.put("customerName", rs.getString(1));
						loanInfoMap.put("idCard", rs.getString(2));
						loanInfoMap.put("orderid", rs.getString(3));
						loanInfoMap.put("uuid", rs.getString(4));
						loanInfoMap.put("pledgeType", rs.getString(5));
						loanInfoMap.put("loanStatus", rs.getString(6));
						loanInfoMap.put("createdAt", rs.getString(7));
						loanInfoMap.put("createBy", rs.getString(8));
						loanInfoMap.put("principalName", rs.getString(9));
						loanInfoMap.put("liacount", rs.getString(10));
						loanInfoMap.put("state", rs.getString(11));
						loanInfoMap.put("isImportant", rs.getString(12));
						loanInfoMap.put("customerId", rs.getString(13));
						vo.setLoanInfoMap(loanInfoMap);
						String column1 = rs.getString(1);
						String column2 = rs.getString(2);
						String businessvalues = todoDefineEntity.getBusinessvalue();
						vo.setColumn1(column1);
						vo.setColumn2(column2);
						vo.setBusinessvalue(businessvalues);
						loanInfoMap.put("businessvalue", businessvalues);
				vo.setProcessdefine(pd);
				vo.setProcessins(pi);
				vo.setTask(task);
				loanInfoMap.put("assignee", task.getAssignee());
				loanInfoMap.put("taskId", task.getId());
				vo.setProcessinsId(processinsId);
				loanInfoMap.put("processinsId", processinsId);
				vo.setTaskName(task.getName());
				loanInfoMap.put("taskName", task.getName());
				vo.setSuspendedStatus(pi.isSuspended());
				loanInfoMap.put("suspendedStatus", pi.isSuspended());
				vo.setTaskId(task.getId());
				loanInfoMap.put("taskId", task.getId());
				vo.setProcessDefineId(processdifineId);
				loanInfoMap.put("processDefineId", processdifineId);
				vo.setBusinesskey(businesskey);
				loanInfoMap.put("businesskey", businesskey);
				loanInfoMap.put("activityId", pi.getActivityId());
				boolean assigneeStatus = false;
				if (null == task.getAssignee()) {
					assigneeStatus = true;
				}
				vo.setAssigneeStatus(assigneeStatus);
				loanInfoMap.put("assigneeStatus", assigneeStatus);
				vo.setTaskCreateTime(task.getCreateTime());
				loanInfoMap.put("taskCreateTime", task.getCreateTime());
				list.add(vo);
				if (null != loanInfoMap.get("uuid")) {
					if (param.get("status") != null) {
						if (param.get("status").equals("collectionOrder")) { // 已催收订单
							if (!task.getName().equals("等待催收") && !task.getName().equals("还款催收")) {
								mapList.add(loanInfoMap);
							}
						} else if (param.get("status").equals("overDueUnhandledOrder")) { // 逾期未处理订单
							if (task.getName().equals("逾期处理")) {
								mapList.add(loanInfoMap);
							}
						} else {
							mapList.add(loanInfoMap);
						}
					} else {
						mapList.add(loanInfoMap);
					}
				}
				loanInfoMap.put("noloanorder", todopage.getNoloanorder());
			}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					dbControl.close(conn,rs);
		}

	}

		}

		int totalcount = mapList.size();

		todopage.setTotalcount(totalcount);
		int totalpage = 0;
		boolean hasnext = false;
		boolean haslast = false;
		if (totalcount % pagecount == 0) {
			totalpage = totalcount / pagecount;
		} else {
			totalpage = totalcount / pagecount + 1;
		}
		if (totalpage > (currentPage + 1)) {
			hasnext = true;
		}
		if (currentPage > 0) {
			haslast = true;
		}
		todopage.setHaslast(haslast);
		todopage.setHasnext(hasnext);
		todopage.setCurrentpage(currentPage);
		todopage.setTotalpage(totalpage);

		start = currentPage * pagecount;
		end = 0;
		if ((currentPage + 1) < totalpage) {
			end = (currentPage + 1) * pagecount;
		}else if((currentPage + 1) == totalpage&&(totalcount % pagecount)==0){
			end = (currentPage + 1) * pagecount;
		} else {
			end = start + (totalcount % pagecount);
		}
		sublist = list.subList(start,end);
		todopage.setContext(sublist);
		submapList = mapList.subList(start,end);
		todopage.setContextMap(submapList);
		return todopage;
	}

	public TodoPage getsigncontract(String userId, Integer currentPage, Integer pagecount, WorkFlowType[] keys,
			Map<String, Object> param) {
		TodoPage todopage = new TodoPage();
		List<Task> tasklist = new ArrayList<>();
		for (int i = 0; i < keys.length; i++) {
			List<Task> taskCandidates = taskService.createTaskQuery().processDefinitionKey(keys[i].toString())
					.taskCandidateUser(userId) // 对指定用户的可接取的公共任务执行查询
					.orderByTaskPriority().desc().list();
			List<Task> taskAssigness = taskService.createTaskQuery().processDefinitionKey(keys[i].toString())
					.taskAssignee(userId) // 对指定用户的未完成的个人任务执行查询
					.orderByTaskPriority().desc().list();
			todopage.setNoloanorder(taskCandidates.size());
			tasklist.addAll(taskCandidates);
			tasklist.addAll(taskAssigness);
		}
		int start = 0;
		int end = tasklist.size();
		List<TodoVO> list = new ArrayList<TodoVO>();
		List<TodoVO> sublist = new ArrayList<TodoVO>();
		List<Map<String, Object>> mapList = new ArrayList<>();
		List<Map<String, Object>> submapList = new ArrayList<>();
		for (int i = start; i < end; i++) {
			if (i < tasklist.size()) {
				Task task = tasklist.get(i);
				String processinsId = task.getProcessInstanceId();
				String processdifineId = task.getProcessDefinitionId();
				ProcessInstance pi = runtimeService.createProcessInstanceQuery().processInstanceId(processinsId)
						.singleResult();
				ProcessDefinition pd = repositoryService.createProcessDefinitionQuery()
						.processDefinitionId(processdifineId).singleResult();

				String key = pd.getKey();
				String businesskey = pi.getBusinessKey();
				TodoInsEntity todoInsEntity = todoInService.findBybusinesskey(businesskey);
				String business = todoInsEntity.getBusiness();
				TodoDefineEntity todoDefineEntity = todoDefineService.findByBusiness(business);
				String sql = "";
				if (key.equals(WorkFlowType.vehiclesLoans.toString())) {
					sql = "select ci.customer_name,li.id_card,li.orderid,li.uuid,li.pledge_type,"
							+ " li.loan_status, li.created_at,u1.realname as create_by,u3.realname as principal_name,"
							+ " (select count(lia.id) from loan_info_attachment lia where lia.loan_id = li.uuid) as lia_count,"
							+ " li.state,ci.is_important,li.customer_id"
							+ " from loan_info li LEFT JOIN customer_register_info ci ON "
							+ " li.customer_id = ci.uuid " + " LEFT JOIN user u1 ON li.create_cm_id = u1.uuid"
							+ " LEFT JOIN dept de ON li.dept_id = de.id"
							+ " LEFT JOIN user u3 ON u3.uuid = de.principal_id" + " where li.uuid='" + businesskey + "'"
							+ " AND li.loan_status NOT in('liacount','departLeadAduit','trialPhase','vehicleAssess','callBack','signContract') ";
					if (param.get("orderNo") != null) {
						sql += " and li.orderid like concat('%','" + param.get("orderNo") + "','%')";
					}
					if (param.get("customerName") != null) {
						sql += " and ci.customer_name like concat('%','" + param.get("customerName") + "','%')";
					}
				} else {
					sql = "select ci.customer_name,li.id_card,li.orderid,li.uuid,li.pledge_type,"
							+ " li.loan_status, li.created_at,u1.realname as create_by,u3.realname as principal_name,"
							+ " (select count(lia.id) from loan_info_attachment lia where lia.loan_id = li.uuid) as lia_count,"
							+ " li.state,ci.is_important,li.customer_id"
							+ " from " + todoDefineEntity.getTablename() + " rep "
							+ " left join loan_info li on li.uuid = rep.loanId "
							+ " left join customer_register_info ci on li.customer_id = ci.uuid "
							+ " left join user u1 ON li.create_cm_id = u1.uuid "
							+ " left join dept de ON li.dept_id = de.id "
							+ " left join user u3 ON u3.uuid = de.principal_id "
							+ " left join repayplandetail rpd on rpd.id = rep.replanDetaiId " + " where " + " rep."
							+ todoDefineEntity.getBusinesskeyname() + "='" + businesskey + "'"
							+ " AND li.loan_status NOT in('liacount','departLeadAduit','trialPhase','trialPhase','visiteCheck') ";
					if (param.get("orderNo") != null) {
						sql += " and li.orderid like concat('%','" + param.get("orderNo") + "','%')";
					}
					if (param.get("customerName") != null) {
						sql += " and ci.customer_name like concat('%','" + param.get("customerName") + "','%')";
					}
				}
				if(param.get("data_access_level") != null){
					if(Integer.valueOf(param.get("data_access_level").toString()) == 0)
						sql += "and 1=0";
					else if (Integer.valueOf(param.get("data_access_level").toString()) == 1)
						sql += "and li.responsible_cm_id="+ '"' + param.get("userId") + '"';
					else if(Integer.valueOf(param.get("data_access_level").toString()) == 2)
						sql += "and li.dept_id="+ '"' + param.get("myDeptId") + '"';
					else if(Integer.valueOf(param.get("data_access_level").toString()) == 3)
						sql+= "and li.company_id ="+ '"' + param.get("companyId") + '"';
				}

				TodoVO vo = new TodoVO();
				Map<String, Object> loanInfoMap = new HashMap<>();
				Connection conn = null;
				ResultSet rs = null;
				try {
					conn = dbControl.getConnection();
					rs = dbControl.getData(conn,sql);
					while (rs.next()) {
						loanInfoMap = new HashMap<>();
						loanInfoMap.put("customerName", rs.getString(1));
						loanInfoMap.put("idCard", rs.getString(2));
						loanInfoMap.put("orderid", rs.getString(3));
						loanInfoMap.put("uuid", rs.getString(4));
						loanInfoMap.put("pledgeType", rs.getString(5));
						loanInfoMap.put("loanStatus", rs.getString(6));
						loanInfoMap.put("createdAt", rs.getString(7));
						loanInfoMap.put("createBy", rs.getString(8));
						loanInfoMap.put("principalName", rs.getString(9));
						loanInfoMap.put("liacount", rs.getString(10));
						loanInfoMap.put("state", rs.getString(11));
						loanInfoMap.put("isImportant", rs.getString(12));
						loanInfoMap.put("customerId", rs.getString(13));
						vo.setLoanInfoMap(loanInfoMap);
						String column1 = rs.getString(1);
						String column2 = rs.getString(2);
						String businessvalues = todoDefineEntity.getBusinessvalue();
						vo.setColumn1(column1);
						vo.setColumn2(column2);
						vo.setBusinessvalue(businessvalues);
						loanInfoMap.put("businessvalue", businessvalues);
				vo.setProcessdefine(pd);
				vo.setProcessins(pi);
				vo.setTask(task);
				loanInfoMap.put("assignee", task.getAssignee());
				loanInfoMap.put("taskId", task.getId());
				vo.setProcessinsId(processinsId);
				loanInfoMap.put("processinsId", processinsId);
				vo.setTaskName(task.getName());
				loanInfoMap.put("taskName", task.getName());
				vo.setSuspendedStatus(pi.isSuspended());
				loanInfoMap.put("suspendedStatus", pi.isSuspended());
				vo.setTaskId(task.getId());
				loanInfoMap.put("taskId", task.getId());
				vo.setProcessDefineId(processdifineId);
				loanInfoMap.put("processDefineId", processdifineId);
				vo.setBusinesskey(businesskey);
				loanInfoMap.put("businesskey", businesskey);
				loanInfoMap.put("activityId", pi.getActivityId());
				boolean assigneeStatus = false;
				if (null == task.getAssignee()) {
					assigneeStatus = true;
				}
				vo.setAssigneeStatus(assigneeStatus);
				loanInfoMap.put("assigneeStatus", assigneeStatus);
				vo.setTaskCreateTime(task.getCreateTime());
				loanInfoMap.put("taskCreateTime", task.getCreateTime());
				list.add(vo);
				if (null != loanInfoMap.get("uuid")) {
					if (param.get("status") != null) {
						if (param.get("status").equals("collectionOrder")) { // 已催收订单
							if (!task.getName().equals("等待催收") && !task.getName().equals("还款催收")) {
								mapList.add(loanInfoMap);
							}
						} else if (param.get("status").equals("overDueUnhandledOrder")) { // 逾期未处理订单
							if (task.getName().equals("逾期处理")) {
								mapList.add(loanInfoMap);
							}
						} else {
							mapList.add(loanInfoMap);
						}
					} else {
						mapList.add(loanInfoMap);
					}
				}
				loanInfoMap.put("noloanorder", todopage.getNoloanorder());
			}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					dbControl.close(conn,rs);
		}

	}

		}

		int totalcount = mapList.size();

		todopage.setTotalcount(totalcount);
		int totalpage = 0;
		boolean hasnext = false;
		boolean haslast = false;
		if (totalcount % pagecount == 0) {
			totalpage = totalcount / pagecount;
		} else {
			totalpage = totalcount / pagecount + 1;
		}
		if (totalpage > (currentPage + 1)) {
			hasnext = true;
		}
		if (currentPage > 0) {
			haslast = true;
		}
		todopage.setHaslast(haslast);
		todopage.setHasnext(hasnext);
		todopage.setCurrentpage(currentPage);
		todopage.setTotalpage(totalpage);

		start = currentPage * pagecount;
		end = 0;
		if ((currentPage + 1) < totalpage) {
			end = (currentPage + 1) * pagecount;
		}else if((currentPage + 1) == totalpage&&(totalcount % pagecount)==0){
			end = (currentPage + 1) * pagecount;
		} else {
			end = start + (totalcount % pagecount);
		}
		sublist = list.subList(start,end);
		todopage.setContext(sublist);
		submapList = mapList.subList(start,end);
		todopage.setContextMap(submapList);
		return todopage;
	}

	public TodoPage getnosigncontract(String userId, Integer currentPage, Integer pagecount, WorkFlowType[] keys,
			Map<String, Object> param) {
		TodoPage todopage = new TodoPage();
		List<Task> tasklist = new ArrayList<>();
		for (int i = 0; i < keys.length; i++) {
			List<Task> taskCandidates = taskService.createTaskQuery().processDefinitionKey(keys[i].toString())
					.taskCandidateUser(userId) // 对指定用户的可接取的公共任务执行查询
					.orderByTaskPriority().desc().list();
			List<Task> taskAssigness = taskService.createTaskQuery().processDefinitionKey(keys[i].toString())
					.taskAssignee(userId) // 对指定用户的未完成的个人任务执行查询
					.orderByTaskPriority().desc().list();
			todopage.setNoloanorder(taskCandidates.size());
			tasklist.addAll(taskCandidates);
			tasklist.addAll(taskAssigness);
		}
		int start = 0;
		int end = tasklist.size();
		List<TodoVO> list = new ArrayList<TodoVO>();
		List<TodoVO> sublist = new ArrayList<TodoVO>();
		List<Map<String, Object>> mapList = new ArrayList<>();
		List<Map<String, Object>> submapList = new ArrayList<>();
		for (int i = start; i < end; i++) {
			if (i < tasklist.size()) {
				Task task = tasklist.get(i);
				String processinsId = task.getProcessInstanceId();
				String processdifineId = task.getProcessDefinitionId();
				ProcessInstance pi = runtimeService.createProcessInstanceQuery().processInstanceId(processinsId)
						.singleResult();
				ProcessDefinition pd = repositoryService.createProcessDefinitionQuery()
						.processDefinitionId(processdifineId).singleResult();

				String key = pd.getKey();
				String businesskey = pi.getBusinessKey();
				TodoInsEntity todoInsEntity = todoInService.findBybusinesskey(businesskey);
				String business = todoInsEntity.getBusiness();
				TodoDefineEntity todoDefineEntity = todoDefineService.findByBusiness(business);
				String sql = "";
				if (key.equals(WorkFlowType.vehiclesLoans.toString())) {
					sql = "select ci.customer_name,li.id_card,li.orderid,li.uuid,li.pledge_type,"
							+ " li.loan_status, li.created_at,u1.realname as create_by,u3.realname as principal_name,"
							+ "(select count(lia.id) from loan_info_attachment lia where lia.loan_id = li.uuid) as lia_count,"
							+ " li.state,ci.is_important,li.customer_id"
							+ " from loan_info li LEFT JOIN customer_register_info ci ON "
							+ " li.customer_id = ci.uuid " + " LEFT JOIN user u1 ON li.create_cm_id = u1.uuid"
							+ " LEFT JOIN dept de ON li.dept_id = de.id"
							+ " LEFT JOIN user u3 ON u3.uuid = de.principal_id" + " where li.uuid='" + businesskey + "'"
							+ " AND li.loan_status ='signContract' ";
					if (param.get("orderNo") != null) {
						sql += " and li.orderid like concat('%','" + param.get("orderNo") + "','%')";
					}
					if (param.get("customerName") != null) {
						sql += " and ci.customer_name like concat('%','" + param.get("customerName") + "','%')";
					}
				} else {
					sql = "select ci.customer_name,li.id_card,li.orderid,li.uuid,li.pledge_type,"
							+ " li.loan_status, li.created_at,u1.realname as create_by,u3.realname as principal_name,"
							+ "(select count(lia.id) from loan_info_attachment lia where lia.loan_id = li.uuid) as lia_count,"
							+ " li.state,ci.is_important,li.customer_id"
							+ " from " + todoDefineEntity.getTablename() + " rep "
							+ " left join loan_info li on li.uuid = rep.loanId "
							+ " left join customer_register_info ci on li.customer_id = ci.uuid "
							+ " left join user u1 ON li.create_cm_id = u1.uuid "
							+ " left join dept de ON li.dept_id = de.id "
							+ " left join user u3 ON u3.uuid = de.principal_id "
							+ " left join repayplandetail rpd on rpd.id = rep.replanDetaiId " + " where " + " rep."
							+ todoDefineEntity.getBusinesskeyname() + "='" + businesskey + "'"
							+ " AND li.loan_status ='signContract' ";
					if (param.get("orderNo") != null) {
						sql += " and li.orderid like concat('%','" + param.get("orderNo") + "','%')";
					}
					if (param.get("customerName") != null) {
						sql += " and ci.customer_name like concat('%','" + param.get("customerName") + "','%')";
					}
				}
				if(param.get("data_access_level") != null){
					if(Integer.valueOf(param.get("data_access_level").toString()) == 0)
						sql += "and 1=0";
					else if (Integer.valueOf(param.get("data_access_level").toString()) == 1)
						sql += "and li.responsible_cm_id="+ '"' + param.get("userId") + '"';
					else if(Integer.valueOf(param.get("data_access_level").toString()) == 2)
						sql += "and li.dept_id="+ '"' + param.get("myDeptId") + '"';
					else if(Integer.valueOf(param.get("data_access_level").toString()) == 3)
						sql+= "and li.company_id ="+ '"' + param.get("companyId") + '"';
				}

				TodoVO vo = new TodoVO();
				Map<String, Object> loanInfoMap = new HashMap<>();
				Connection conn = null;
				ResultSet rs = null;
				try {
					conn = dbControl.getConnection();
					rs = dbControl.getData(conn,sql);
					while (rs.next()) {
						loanInfoMap = new HashMap<>();
						loanInfoMap.put("customerName", rs.getString(1));
						loanInfoMap.put("idCard", rs.getString(2));
						loanInfoMap.put("orderid", rs.getString(3));
						loanInfoMap.put("uuid", rs.getString(4));
						loanInfoMap.put("pledgeType", rs.getString(5));
						loanInfoMap.put("loanStatus", rs.getString(6));
						loanInfoMap.put("createdAt", rs.getString(7));
						loanInfoMap.put("createBy", rs.getString(8));
						loanInfoMap.put("principalName", rs.getString(9));
						loanInfoMap.put("liacount", rs.getString(10));
						loanInfoMap.put("state", rs.getString(11));
						loanInfoMap.put("isImportant", rs.getString(12));
						loanInfoMap.put("customerId", rs.getString(13));
						vo.setLoanInfoMap(loanInfoMap);
						String column1 = rs.getString(1);
						String column2 = rs.getString(2);
						String businessvalues = todoDefineEntity.getBusinessvalue();
						vo.setColumn1(column1);
						vo.setColumn2(column2);
						vo.setBusinessvalue(businessvalues);
						loanInfoMap.put("businessvalue", businessvalues);
				vo.setProcessdefine(pd);
				vo.setProcessins(pi);
				vo.setTask(task);
				loanInfoMap.put("assignee", task.getAssignee());
				loanInfoMap.put("taskId", task.getId());
				vo.setProcessinsId(processinsId);
				loanInfoMap.put("processinsId", processinsId);
				vo.setTaskName(task.getName());
				loanInfoMap.put("taskName", task.getName());
				vo.setSuspendedStatus(pi.isSuspended());
				loanInfoMap.put("suspendedStatus", pi.isSuspended());
				vo.setTaskId(task.getId());
				loanInfoMap.put("taskId", task.getId());
				vo.setProcessDefineId(processdifineId);
				loanInfoMap.put("processDefineId", processdifineId);
				vo.setBusinesskey(businesskey);
				loanInfoMap.put("businesskey", businesskey);
				loanInfoMap.put("activityId", pi.getActivityId());
				boolean assigneeStatus = false;
				if (null == task.getAssignee()) {
					assigneeStatus = true;
				}
				vo.setAssigneeStatus(assigneeStatus);
				loanInfoMap.put("assigneeStatus", assigneeStatus);
				vo.setTaskCreateTime(task.getCreateTime());
				loanInfoMap.put("taskCreateTime", task.getCreateTime());
				list.add(vo);
				if (null != loanInfoMap.get("uuid")) {
					if (param.get("status") != null) {
						if (param.get("status").equals("collectionOrder")) { // 已催收订单
							if (!task.getName().equals("等待催收") && !task.getName().equals("还款催收")) {
								mapList.add(loanInfoMap);
							}
						} else if (param.get("status").equals("overDueUnhandledOrder")) { // 逾期未处理订单
							if (task.getName().equals("逾期处理")) {
								mapList.add(loanInfoMap);
							}
						} else {
							mapList.add(loanInfoMap);
						}
					} else {
						mapList.add(loanInfoMap);
					}
				}
				loanInfoMap.put("noloanorder", todopage.getNoloanorder());
			}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					dbControl.close(conn,rs);
				}

			}
		}

		int totalcount = mapList.size();
		todopage.setTotalcount(totalcount);
		int totalpage = 0;
		boolean hasnext = false;
		boolean haslast = false;
		if (totalcount % pagecount == 0) {
			totalpage = totalcount / pagecount;
		} else {
			totalpage = totalcount / pagecount + 1;
		}
		if (totalpage > (currentPage + 1)) {
			hasnext = true;
		}
		if (currentPage > 0) {
			haslast = true;
		}
		todopage.setHaslast(haslast);
		todopage.setHasnext(hasnext);
		todopage.setCurrentpage(currentPage);
		todopage.setTotalpage(totalpage);
		start = currentPage * pagecount;
		end = 0;
		if ((currentPage + 1) < totalpage) {
			end = (currentPage + 1) * pagecount;
		}else if((currentPage + 1) == totalpage&&(totalcount % pagecount)==0){
			end = (currentPage + 1) * pagecount;
		} else {
			end = start + (totalcount % pagecount);
		}
		sublist = list.subList(start,end);
		todopage.setContext(sublist);
		submapList = mapList.subList(start,end);
		todopage.setContextMap(submapList);
		return todopage;
	}

	public TodoPage queryLendedLoansList(String userId, Integer currentPage, Integer pagecount, WorkFlowType[] keys,
			Map<String, Object> param) {
		TodoPage todopage = new TodoPage();

        List<Task> tasklist = new ArrayList<>();
        for (int i = 0; i < keys.length; i++) {
            List<Task> taskCandidates = taskService.createTaskQuery()
                    .processDefinitionKey(keys[i].toString()).taskCandidateUser(userId)  //对指定用户的可接取的公共任务执行查询
                    .orderByTaskPriority().desc().list();
            List<Task> taskAssigness = taskService.createTaskQuery()
                    .processDefinitionKey(keys[i].toString()).taskAssignee(userId)  //对指定用户的未完成的个人任务执行查询
                    .orderByTaskPriority().desc().list();
            todopage.setNoloanorder(taskCandidates.size());
            tasklist.addAll(taskCandidates);
            tasklist.addAll(taskAssigness);
        }
		List<Map<String, Object>> subpageList = new ArrayList<>();
		List<Map<String, Object>> mapList = new ArrayList<>();

        for (int i = 0; i < tasklist.size(); i++) {
        	if(i < tasklist.size()){
        		Task task = tasklist.get(i);
                String processinsId = task.getProcessInstanceId();
                String processdifineId = task.getProcessDefinitionId();
                ProcessInstance pi = runtimeService.createProcessInstanceQuery()
                        .processInstanceId(processinsId).singleResult();
                ProcessDefinition pd = repositoryService
                        .createProcessDefinitionQuery()
                        .processDefinitionId(processdifineId).singleResult();

                String key = pd.getKey();
                String businesskey = pi.getBusinessKey();
                TodoInsEntity todoInsEntity = todoInService
                        .findBybusinesskey(businesskey);
                String business = todoInsEntity.getBusiness();
                TodoDefineEntity todoDefineEntity = todoDefineService
                        .findByBusiness(business);
                String sql ="";

                if (key.equals(WorkFlowType.vehiclesLoans.toString())) {
                    sql = "select ci.customer_name,li.id_card,li.orderid,li.uuid,li.loan_money,"
                    		+ " li.loan_status, li.chargedoff_at,"
                    		+ " cai.id as caiId,cai.account_num,cai.created_at,cai.bank_name,li.state,ci.is_important,li.contract_num, li.customer_id"
                    		+ " from loan_info li LEFT JOIN customer_register_info ci ON "
                            + " li.customer_id = ci.uuid "
                    		+ " LEFT JOIN user u1 ON li.create_cm_id = u1.uuid"
                            + " LEFT JOIN dept de ON li.dept_id = de.id"
                            + " LEFT JOIN user u3 ON u3.uuid = de.principal_id"
                            + " LEFT JOIN customer_account_info cai on cai.id = li.customer_account_num_id"
                            + " where li.uuid='" + businesskey + "'"
                            + " AND (li.loan_status IN ('lended','repayment','end','helploanAduit','reloanAduit','helploanApprove','helploanReview','reloanReview','helploanE_Contract','reloanE_Contract','helploan_lended','reloan_lended'))";
                    		if(param.get("orderNo") != null){
                    			sql += " and li.orderid like concat('%','"+param.get("orderNo")+"','%')";
                    		}
                    		if(param.get("customerName") != null){
                    			sql += " and ci.customer_name like concat('%','"+param.get("customerName")+"','%')";
                    		}
                    		if(param.get("status")!=null){
                    			if(param.get("status").equals("0")){
                    				sql += " and li.loan_status = 'lended'";
                    			}else{
                    				sql += " and li.loan_status <> 'lended'";
                    			}
                    		}
                }else{
                	sql = "select ci.customer_name,li.id_card,li.orderid,li.uuid,li.loan_money,"
                            + " li.loan_status, li.chargedoff_at, "
                            + " cai.id as caiId,cai.account_num,cai.created_at,cai.bank_name,li.state,ci.is_important,li.contract_num,li.customer_id "
                            + " from "
                            + todoDefineEntity.getTablename() + " rep " 
                            + " left join loan_info li on li.uuid = rep.loanId " 
                            + " left join customer_register_info ci on li.customer_id = ci.uuid "
                            + " left join user u1 ON li.create_cm_id = u1.uuid "
                            + " left join dept de ON li.dept_id = de.id "
                            + " left join user u3 ON u3.uuid = de.principal_id "
                            + " left join repayplandetail rpd on rpd.id = rep.replanDetaiId "
                            + " left join customer_account_info cai on cai.id = li.customer_account_num_id"
                            + " where "
                            + " rep." + todoDefineEntity.getBusinesskeyname() + "='"
                            + businesskey + "'"
                			+ " and (li.loan_status = 'lended' or  li.loan_status = 'repayment' or li.loan_status = 'end')";
		                	if(param.get("orderNo") != null){
		            			sql += " and li.orderid like concat('%','"+param.get("orderNo")+"','%')";
		            		}
		            		if(param.get("customerName") != null){
		            			sql += " and ci.customer_name like concat('%','"+param.get("customerName")+"','%')";
		            		}
		            		if(param.get("status")!=null){
		            			if(param.get("status").equals("0")){
		            				sql += " and li.loan_status = 'lended'";
		            			}else{
		            				sql += " and li.loan_status <> 'lended'";
		            			}
		            		}
                }
				if(param.get("data_access_level") != null){
					if(Integer.valueOf(param.get("data_access_level").toString()) == 0)
						sql += "and 1=0";
					else if (Integer.valueOf(param.get("data_access_level").toString()) == 1)
						sql += "and li.responsible_cm_id="+ '"' + param.get("userId") + '"';
					else if(Integer.valueOf(param.get("data_access_level").toString()) == 2)
						sql += "and li.dept_id="+ '"' + param.get("myDeptId") + '"';
					else if(Integer.valueOf(param.get("data_access_level").toString()) == 3)
						sql+= "and li.company_id ="+ '"' + param.get("companyId") + '"';
				}

                TodoVO vo = new TodoVO();
                Map<String,Object> loanInfoMap = new HashMap<>();
				Connection conn = null;
				ResultSet rs = null;
                try {
					conn = dbControl.getConnection();
					rs = dbControl.getData(conn,sql);
                    while (rs.next()) {
                    	loanInfoMap = new HashMap<>();
                    	loanInfoMap.put("customerName", rs.getString(1));
                    	loanInfoMap.put("idCard", rs.getString(2));
                    	loanInfoMap.put("orderid", rs.getString(3));
                    	loanInfoMap.put("uuid", rs.getString(4));
                    	loanInfoMap.put("loan_money", rs.getString(5));
                    	loanInfoMap.put("loanStatus", rs.getString(6));
                    	loanInfoMap.put("chargedoffAt", StringUtils.isBlank(rs.getString(7)) ? "" : rs.getString(7));
                        String businessvalues = todoDefineEntity.getBusinessvalue();
                        loanInfoMap.put("businessvalue", businessvalues);
                        loanInfoMap.put("caiId", rs.getString(8));
                        loanInfoMap.put("accountNum", rs.getString(9));
                        loanInfoMap.put("createdAt", rs.getString(10));
                        loanInfoMap.put("bankName", rs.getString(11));
                        loanInfoMap.put("loanState", rs.getString(12));
                        loanInfoMap.put("isImportant", rs.getString(13));
                        loanInfoMap.put("contract_num", rs.getString(14));
	                    loanInfoMap.put("customerId", rs.getString(15));
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    dbControl.close(conn,rs);
                }
                loanInfoMap.put("assignee", task.getAssignee());
                loanInfoMap.put("taskId", task.getId());
                loanInfoMap.put("processinsId", processinsId);
                loanInfoMap.put("taskName", task.getName());
                loanInfoMap.put("suspendedStatus", pi.isSuspended());
                loanInfoMap.put("taskId", task.getId());
                loanInfoMap.put("processDefineId", processdifineId);
                loanInfoMap.put("businesskey", businesskey);
                loanInfoMap.put("activityId",pi.getActivityId());
                boolean assigneeStatus = false;
                if (null == task.getAssignee()) {
                    assigneeStatus = true;
                }
                loanInfoMap.put("assigneeStatus", assigneeStatus);
                vo.setTaskCreateTime(task.getCreateTime());
                loanInfoMap.put("taskCreateTime", task.getCreateTime());
                if(null != loanInfoMap.get("uuid")){
					boolean repeatflag = false;
					for (int j = 0; j < mapList.size(); j++){
						Map<String, Object> tmp = mapList.get(j);
						String tmpuuid = (String)tmp.get("uuid");
						if (tmpuuid.equals( loanInfoMap.get("uuid"))){
							repeatflag = true;
							break;
						}
					}
					if(repeatflag == false){
						mapList.add(loanInfoMap);
					}
				}
        	}

        }

		// 数据列表

		int totalcount = mapList.size();
		todopage.setTotalcount(totalcount);
		int totalpage = 0;
		boolean hasnext = false;
		boolean haslast = false;
		if (totalcount % pagecount == 0) {
			totalpage = totalcount / pagecount;
		} else {
			totalpage = totalcount / pagecount + 1;
		}
		if (totalpage > (currentPage + 1)) {
			hasnext = true;
		}
		if (currentPage > 0) {
			haslast = true;
		}
		todopage.setHaslast(haslast);
		todopage.setHasnext(hasnext);
		todopage.setCurrentpage(currentPage);
		todopage.setTotalpage(totalpage);

		int start = currentPage * pagecount;
		int end = 0;
		if ((currentPage + 1) < totalpage) {
			end = (currentPage + 1) * pagecount;
		}else if((currentPage + 1) == totalpage&&(totalcount % pagecount)==0){
			end = (currentPage + 1) * pagecount;
		} else {
			end = start + (totalcount % pagecount);
		}
		if (totalpage == 1) {
			end =mapList.size();
		}

		subpageList = mapList.subList(start,end);

		todopage.setContextMap(subpageList);
		return todopage;

	}

	public TodoPage queryIncomeList(String userId, Integer currentPage, Integer pagecount, WorkFlowType[] keys,
			Map<String, Object> param) {
		
		TodoPage todopage = new TodoPage();
		List<Map<String,Object>> mapList = new ArrayList<>();
		List<Map<String, Object>> subpageList = new ArrayList<>();

		if(param.get("uuid") != null){
			String sql = returnSql(param.get("uuid").toString());
            ResultSet rs = null;
			Connection conn = null;
            Map<String,Object> loanInfoMap = new HashMap<>();
            try {
				conn = dbControl.getConnection();
				if(StringUtils.isNotBlank(sql)){
					rs = dbControl.getData(conn,sql);
				}
            	if(rs != null){
            		while (rs.next()) {
            			loanInfoMap = feeSum(rs.getString(4), loanInfoMap,rs);
                    }
            	}
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                dbControl.close(conn,rs);
            }
            if(null != loanInfoMap.get("uuid")){
				boolean repeatflag = false;
				for (int j = 0; j < mapList.size(); j++){
					Map<String, Object> tmp = mapList.get(j);
					String tmpuuid = (String)tmp.get("uuid");
					if (tmpuuid.equals( loanInfoMap.get("uuid"))){
						repeatflag = true;
						break;
					}
				}
				if(repeatflag == false){
					mapList.add(loanInfoMap);
				}
			}
		}else{
	        List<Task> tasklist = new ArrayList<>();
	        for (int i = 0; i < keys.length; i++) {
	            List<Task> taskCandidates = taskService.createTaskQuery()
	                    .processDefinitionKey(keys[i].toString()).taskCandidateUser(userId)  //对指定用户的可接取的公共任务执行查询
	                    .orderByTaskPriority().desc().list();
	            List<Task> taskAssigness = taskService.createTaskQuery()
	                    .processDefinitionKey(keys[i].toString()).taskAssignee(userId)  //对指定用户的未完成的个人任务执行查询
	                    .orderByTaskPriority().desc().list();
	            todopage.setNoloanorder(taskCandidates.size());
	            tasklist.addAll(taskCandidates);
	            tasklist.addAll(taskAssigness);
	        }


	        for (int i = 0; i < tasklist.size(); i++) {
	        	if(i < tasklist.size()){
	        		Task task = tasklist.get(i);
	                String processinsId = task.getProcessInstanceId();
	                String processdifineId = task.getProcessDefinitionId();
	                ProcessInstance pi = runtimeService.createProcessInstanceQuery()
	                        .processInstanceId(processinsId).singleResult();
	                ProcessDefinition pd = repositoryService
	                        .createProcessDefinitionQuery()
	                        .processDefinitionId(processdifineId).singleResult();

	                String key = pd.getKey();
	                
	                String businesskey = pi.getBusinessKey();
	                String sql = returnSql(businesskey);
	                if (key.equals(WorkFlowType.paymentCollection.toString())) {
			                if(param.get("orderNo") != null){
			            		sql += " and li.orderid like concat('%','"+param.get("orderNo")+"','%')";
			            	}
			            	if(param.get("customerName") != null){
			            		sql += " and ci.customer_name like concat('%','"+param.get

("customerName")+"','%')";
			            	}
			            	if(param.get("startDate") != null && param.get("endDate") != null){
			            		sql += " and date_format(li.ended_at,'%Y-%m-%d') >= '"+param.get

("startDate")+"' and date_format(li.ended_at,'%Y-%m-%d') <= '"+param.get("endDate")+"'";
			            	}
	                }
					Connection conn = null;
	                ResultSet rs = null;

	                Map<String,Object> loanInfoMap = new HashMap<>();
	                try {
						conn = dbControl.getConnection();
						if(StringUtils.isNotBlank(sql)){
							rs = dbControl.getData(conn,sql);
						}
	                	if(rs != null){
	                		while (rs.next()) {
	                            loanInfoMap = feeSum(rs.getString(4), loanInfoMap,rs);
	                        }
	                	}
	                } catch (Exception e) {
	                    e.printStackTrace();
	                } finally {
	                    dbControl.close(conn,rs);
	                }
	                if(null != loanInfoMap.get("uuid")){
						boolean repeatflag = false;
						for (int j = 0; j < mapList.size(); j++){
							Map<String, Object> tmp = mapList.get(j);
							String tmpuuid = (String)tmp.get("uuid");
							if (tmpuuid.equals( loanInfoMap.get("uuid"))){
								repeatflag = true;
								break;
							}
						}
						if(repeatflag == false){
							mapList.add(loanInfoMap);
						}
					}
	        	}

	        }
		}

		// 数据列表

		int totalcount = mapList.size();
		todopage.setTotalcount(totalcount);
		int totalpage = 0;
		boolean hasnext = false;
		boolean haslast = false;
		if (totalcount % pagecount == 0) {
			totalpage = totalcount / pagecount;
		} else {
			totalpage = totalcount / pagecount + 1;
		}
		if (totalpage > (currentPage + 1)) {
			hasnext = true;
		}
		if (currentPage > 0) {
			haslast = true;
		}
		todopage.setHaslast(haslast);
		todopage.setHasnext(hasnext);
		todopage.setCurrentpage(currentPage);
		todopage.setTotalpage(totalpage);

		int start = currentPage * pagecount;
		int end = 0;
		if ((currentPage + 1) < totalpage) {
			end = (currentPage + 1) * pagecount;
		}else if((currentPage + 1) == totalpage&&(totalcount % pagecount)==0){
			end = (currentPage + 1) * pagecount;
		} else {
			end = start + (totalcount % pagecount);
		}
		if (totalpage == 1) {
			end =mapList.size();
		}

		subpageList = mapList.subList(start,end);

		todopage.setContextMap(subpageList);
		return todopage;

	}

	private Map<String, Object> feeSum(String uuid, Map<String, Object> loanInfoMap, ResultSet rs) {
		try {
			// 总收入
			BigDecimal moneySum = BigDecimal.ZERO;
			// 管理费
			BigDecimal manageFeeSum = BigDecimal.ZERO;
			// GPS费
			BigDecimal gpsCostSum = BigDecimal.ZERO;
			// 拖车费
			BigDecimal towCostSum = BigDecimal.ZERO;
			// 停车费
			BigDecimal parkCostSum = BigDecimal.ZERO;
			// 利息
			BigDecimal repayInterestSum = BigDecimal.ZERO;
			// 查档费
			BigDecimal checkCostSum = BigDecimal.ZERO;

			loanInfoMap = new HashMap<>();
			loanInfoMap.put("customerName", rs.getString(1)); // 客户名
			loanInfoMap.put("idCard", rs.getString(2)); // 身份证
			loanInfoMap.put("orderid", rs.getString(3)); // 订单号
			loanInfoMap.put("uuid", rs.getString(4)); // 订单uuid
			loanInfoMap.put("loan_money", rs.getString(5)); // 借款金额BUG号234
			loanInfoMap.put("loanStatus", rs.getString(6)); // 订单状态
			loanInfoMap.put("chargedoffAt", StringUtils.isBlank(rs.getString(7)) ? "" : rs.getString(7)); // 出帐时间
			loanInfoMap.put("caiId", rs.getString(8)); // 银行信息id
			loanInfoMap.put("accountNum", rs.getString(9)); // 银行账号
			loanInfoMap.put("createdAt", rs.getString(10)); // 银行账号创建时间
			loanInfoMap.put("bankName", rs.getString(11)); // 银行名字
			loanInfoMap.put("loanState", rs.getString(12)); // 是否加急订单
			loanInfoMap.put("isImportant", rs.getString(13)); // 是否重点客户
			loanInfoMap.put("duration", rs.getInt(14)); // 总期数
			loanInfoMap.put("repayPeriod", rs.getInt(15)); // 当前还款期数
			loanInfoMap.put("endedAt", StringUtils.isBlank(rs.getString(16)) ? "" : rs.getString(16)); // 结清日期
			loanInfoMap.put("id", rs.getString(17)); // 还款信息ID
			loanInfoMap.put("createTime", rs.getString(18)); // 订单创建时间
			// 已还款信息
			List<Repayment> repayments = repaymentMapper.selectActualRepaymentDetail(uuid);
			for (Repayment repayment : repayments) {
				if (repayment.getRepaymentTransactions() != null && repayment.getRepaymentTransactions().size() > 0) {
					String actalRepaymentFee = repayment.getRepaymentTransactions().get

					(0).getActalRepaymentFee().replace("{", "").replace("}", "");
					String[] actalRepaymentFee_arr = actalRepaymentFee.split(",");

					for (int j = 0; j < actalRepaymentFee_arr.length; j++) {
						if (j == 0) {// 管理费
							manageFeeSum = manageFeeSum
									.add(new BigDecimal(actalRepaymentFee_arr[0].split(":")[1].replaceAll("\"", "")));
						} else if (j == 1) { // GPS费用
							gpsCostSum = gpsCostSum
									.add(new BigDecimal(actalRepaymentFee_arr[1].split(":")[1].replaceAll("\"", "")));
						} else if (j == 2) { // 停车费
							parkCostSum = parkCostSum
									.add(new BigDecimal(actalRepaymentFee_arr[2].split(":")[1].replaceAll("\"", "")));
						} else if (j == 3) { // 拖车费
							towCostSum = towCostSum
									.add(new BigDecimal(actalRepaymentFee_arr[3].split(":")[1].replaceAll("\"", "")));
						} else if (j == 4) { // 查档费
							checkCostSum = checkCostSum
									.add(new BigDecimal(actalRepaymentFee_arr[4].split(":")[1].replaceAll("\"", "")));
						}
					}
					repayInterestSum = repayInterestSum
							.add(repayment.getRepaymentTransactions().get(0).getActualRepaymentInterestSum());
				}
			}
			loanInfoMap.put("manageFeeSum", manageFeeSum); // 管理费
			loanInfoMap.put("gpsCostSum", gpsCostSum); // GPS费
			loanInfoMap.put("parkCostSum", parkCostSum); // 停车费
			loanInfoMap.put("towCostSum", towCostSum); // 拖车费
			loanInfoMap.put("checkCostSum", checkCostSum); // 查档费
			loanInfoMap.put("repayInterestSum", repayInterestSum); // 利息
			moneySum = manageFeeSum.add(gpsCostSum).add(parkCostSum).add(towCostSum).add(checkCostSum)
					.add(repayInterestSum);
			loanInfoMap.put("moneySum", moneySum);// 总收入
		} catch (Exception e) {
			e.printStackTrace();
		}
		return loanInfoMap;
	}

	private String returnSql(String uuid) {
		return "select ci.customer_name,li.id_card,li.orderid,li.uuid,li.loan_money,"
				+ " li.loan_status, li.chargedoff_at, "
				+ " cai.id as caiId,cai.account_num,cai.created_at,cai.bank_name,li.state,ci.is_important,"
				+ "(select count(id) from repayplandetail where repayPlanId = rpl.id) as duration,"
				+ " rpd.repayPeriod,li.ended_at,rep.uuid as id,date_format(li.created_at,'%Y-%m-%d %H:%i:%s') as create_time"
				+ " from repayment rep" + " left join loan_info li on li.uuid = rep.loanId "
				+ " left join customer_register_info ci on li.customer_id = ci.uuid "
				+ " left join repayplandetail rpd on rpd.id = rep.replanDetaiId "
				+ " left join customer_account_info cai on cai.id = li.customer_account_num_id"
				+ " left join repayplan rpl on rpl.loanId = li.uuid" + " where " + " rep.uuid='" + uuid + "'";
	}

	public TodoPage queryNewTaskList(String userId,Integer currentPage, Integer pagecount, WorkFlowType[] keys,String time,Map param) {
		TodoPage todopage = new TodoPage();
		List<Task> tasklist = new ArrayList<>();
        List<Object> a= new ArrayList<Object>();
        for (int i = 0; i < keys.length; i++) {
            List<Task> taskCandidates = taskService.createTaskQuery()
                    .processDefinitionKey(keys[i].toString()).taskCandidateUser(userId)  //对指定用户的可接取的公共任务执行查询
                    .orderByTaskPriority().desc().list();
            List<Task> taskAssigness = taskService.createTaskQuery()
                    .processDefinitionKey(keys[i].toString()).taskAssignee(userId)  //对指定用户的未完成的个人任务执行查询
                    .orderByTaskPriority().desc().list();
            tasklist.addAll(taskCandidates);
            tasklist.addAll(taskAssigness);
       }

        DateFormat format=new SimpleDateFormat("yyyy-MM-dd");
        List<TodoVO> subvolist = new ArrayList<TodoVO>();
		List<Map<String, Object>> subpageList = new ArrayList<>();
		List<TodoVO> list = new ArrayList<TodoVO>();
		List<Map<String, Object>> mapList = new ArrayList<>();
		
        
       for (int i = 0; i < tasklist.size(); i++) {
        	if(i < tasklist.size()){
        		Task task = tasklist.get(i);
                String processinsId = task.getProcessInstanceId();
                String processdifineId = task.getProcessDefinitionId();
                ProcessInstance pi = runtimeService.createProcessInstanceQuery()
                        .processInstanceId(processinsId).singleResult();
                ProcessDefinition pd = repositoryService
                        .createProcessDefinitionQuery()
                        .processDefinitionId(processdifineId).singleResult();

                String key = pd.getKey();
                String businesskey = pi.getBusinessKey();
                TodoInsEntity todoInsEntity = todoInService
                        .findBybusinesskey(businesskey);
                String business = todoInsEntity.getBusiness();
                TodoDefineEntity todoDefineEntity = todoDefineService
                        .findByBusiness(business);
                String sql ="";
                 
               String shijian=format.format(task.getCreateTime()).toString();
               if(shijian.equals(time)){
                if (key.equals(WorkFlowType.vehiclesLoans.toString())) {
                    sql = "select ci.customer_name,li.id_card,li.orderid,li.uuid,li.pledge_type,"
                    		+" li.loan_status, li.created_at,u1.realname as create_by,u3.realname as principal_name,"
                    		+" li.apply_money,ci.is_important,li.state,ci.uuid "
                    		+ " from loan_info li LEFT JOIN customer_register_info ci ON "
                            + " li.customer_id = ci.uuid "
                    		+ " LEFT JOIN user u1 ON li.responsible_cm_id = u1.uuid"
                            + " LEFT JOIN dept de ON li.dept_id = de.id"
                            + " LEFT JOIN user u3 ON u3.uuid = de.principal_id"
                            + " where li.uuid='" + businesskey + "'";
                }else{
               	 sql = "select ci.customer_name,li.id_card,li.orderid,li.uuid,li.pledge_type,"
                 		+ " li.loan_status, li.created_at,u1.realname as create_by,u3.realname as principal_name,"
                 		 +" li.apply_money,ci.is_important,li.state,rep.uuid as repId "
                         + " from "
                         + todoDefineEntity.getTablename() + " rep " 
                         + " left join loan_info li on li.uuid = rep.loanId " 
                         + " left join customer_register_info ci on li.customer_id = ci.uuid "
                         + " left join user u1 ON li.responsible_cm_id = u1.uuid"
                         + " left join dept de ON li.dept_id = de.id "
                         + " left join user u3 ON u3.uuid = de.principal_id "
                         + " left join repayplandetail rpd on rpd.id = rep.replanDetaiId "
                         + " where "
                         + " rep." + todoDefineEntity.getBusinesskeyname() + "='"
                         + businesskey + "'";
               }
				   if(param.get("data_access_level") != null){
					   if(Integer.valueOf(param.get("data_access_level").toString()) == 0)
						   sql += "and 1=0";
					   else if (Integer.valueOf(param.get("data_access_level").toString()) == 1)
						   sql += "and li.responsible_cm_id="+ '"' + param.get("userId") + '"';
					   else if(Integer.valueOf(param.get("data_access_level").toString()) == 2)
						   sql += "and li.dept_id="+ '"' + param.get("myDeptId") + '"';
					   else if(Integer.valueOf(param.get("data_access_level").toString()) == 3)
						   sql+= "and li.company_id ="+ '"' + param.get("mycompanyId") + '"';
				   }
                TodoVO vo = new TodoVO();
                Map<String,Object> loanInfoMap = new HashMap<>();
				Connection conn = null;
				ResultSet rs = null;
                try {
					conn = dbControl.getConnection();
					rs = dbControl.getData(conn,sql);
                    while (rs.next()) {
                    	loanInfoMap = new HashMap<>();
                    	loanInfoMap.put("customerName", rs.getString(1));
                    	loanInfoMap.put("idCard", rs.getString(2));
                    	loanInfoMap.put("orderid", rs.getString(3));
                    	loanInfoMap.put("uuid", rs.getString(4));
                    	loanInfoMap.put("pledgeType", rs.getString(5));
                    	//loanInfoMap.put("loanStatus", rs.getString(6));
	                    loanInfoMap.put("loanStatus", pi.getActivityId());
                    	loanInfoMap.put("createdAt", rs.getString(7));
                    	loanInfoMap.put("createBy", rs.getString(8));
                    	loanInfoMap.put("principalName", rs.getString(9));
                    	loanInfoMap.put("applyMoney", Double.parseDouble(rs.getString(10))/(double)10000);
                    	loanInfoMap.put("isImportant", rs.getString(11));
                    	loanInfoMap.put("state", rs.getString(12));
                    	loanInfoMap.put("repId", rs.getString(13));
                    	//rs.getString(13)贷后处理需要但是贷前没有需要查询一个占位
                    	vo.setLoanInfoMap(loanInfoMap);
						String column1 = rs.getString(1);
						String column2 = rs.getString(2);
						String businessvalues = todoDefineEntity.getBusinessvalue();
						vo.setColumn1(column1);
						vo.setColumn2(column2);
						vo.setBusinessvalue(businessvalues);
						loanInfoMap.put("businessvalue", businessvalues);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    dbControl.close(conn,rs);
                }
                loanInfoMap.put("activityId", pi.getActivityId());
                loanInfoMap.put("assignee", task.getAssignee());
                loanInfoMap.put("taskId", task.getId());
                loanInfoMap.put("businesskey",businesskey);
                vo.setProcessdefine(pd);
				vo.setProcessins(pi);
				vo.setTask(task);
				vo.setProcessinsId(processinsId);
				vo.setTaskName(task.getName());
				vo.setSuspendedStatus(pi.isSuspended());
				vo.setTaskId(task.getId());
				vo.setProcessDefineId(processdifineId);
				vo.setBusinesskey(businesskey);
				boolean assigneeStatus = false;
				if (null == task.getAssignee()) {
					assigneeStatus = true;
				}
				vo.setAssigneeStatus(assigneeStatus);
				loanInfoMap.put("assigneeStatus", assigneeStatus);
				vo.setTaskCreateTime(task.getCreateTime());
				loanInfoMap.put("taskCreateTime", task.getCreateTime());
                if(null != loanInfoMap.get("uuid")){
                	mapList.add(loanInfoMap);
                	list.add(vo);
				}
        	}
        }
			}
       int totalcount = mapList.size();
		todopage.setTotalcount(totalcount);
		int totalpage = 0;
		boolean hasnext = false;
		boolean haslast = false;
		if (totalcount % pagecount == 0) {
			totalpage = totalcount / pagecount;
		} else {
			totalpage = totalcount / pagecount + 1;
		}
		if (totalpage > (currentPage + 1)) {
			hasnext = true;
		}
		if (currentPage > 0) {
			haslast = true;
		}
		todopage.setHaslast(haslast);
		todopage.setHasnext(hasnext);
		todopage.setCurrentpage(currentPage);
		todopage.setTotalpage(totalpage);

		int start = currentPage * pagecount;
		int end = 0;
		if ((currentPage + 1) < totalpage) {
			end = (currentPage + 1) * pagecount;
		}else if((currentPage + 1) == totalpage&&totalcount % pagecount==0 ){
			end = (currentPage + 1) * pagecount;
		} else {
			end = start + (totalcount % pagecount);
		}
		if (totalpage == 1) {
			end =mapList.size();
		}
		subvolist = list.subList(start,end);
		subpageList = mapList.subList(start,end);
		todopage.setContext(subvolist);
		todopage.setContextMap(subpageList);
		return todopage;
	}

	@Override
	public Integer queryNewTaskListNew(String userId,Map param) {
		Integer newTaskCount = Integer.valueOf(0);
		newTaskCount = loanInfoMapper.queryWorkSpaceLoanCount(param);
		return newTaskCount;
	}


	public TodoPage queryagencyList(String userId,Integer currentPage, Integer pagecount, WorkFlowType[] keys,Map param) {
		TodoPage todopage = new TodoPage();
		List<Task> tasklist = new ArrayList<>();
        for (int i = 0; i < keys.length; i++) {
            List<Task> taskCandidates = taskService.createTaskQuery()
                    .processDefinitionKey(keys[i].toString()).taskCandidateUser(userId)  //对指定用户的可接取的公共任务执行查询
                    .orderByTaskPriority().desc().list();
            List<Task> taskAssigness = taskService.createTaskQuery()
                    .processDefinitionKey(keys[i].toString()).taskAssignee(userId)  //对指定用户的未完成的个人任务执行查询
                    .orderByTaskPriority().desc().list();
            tasklist.addAll(taskCandidates);
            tasklist.addAll(taskAssigness);
       }

        List<TodoVO> subvolist = new ArrayList<TodoVO>();
		List<Map<String, Object>> subpageList = new ArrayList<>();
		List<TodoVO> list = new ArrayList<TodoVO>();
		List<Map<String, Object>> mapList = new ArrayList<>();
		
        
       for (int i = 0; i < tasklist.size(); i++) {
        	if(i < tasklist.size()){
        		Task task = tasklist.get(i);
                String processinsId = task.getProcessInstanceId();
                String processdifineId = task.getProcessDefinitionId();
                ProcessInstance pi = runtimeService.createProcessInstanceQuery()
                        .processInstanceId(processinsId).singleResult();
                ProcessDefinition pd = repositoryService
                        .createProcessDefinitionQuery()
                        .processDefinitionId(processdifineId).singleResult();

                String key = pd.getKey();
                String businesskey = pi.getBusinessKey();
                TodoInsEntity todoInsEntity = todoInService
                        .findBybusinesskey(businesskey);
                String business = todoInsEntity.getBusiness();
                TodoDefineEntity todoDefineEntity = todoDefineService
                        .findByBusiness(business);
                String sql ="";
                if (key.equals(WorkFlowType.vehiclesLoans.toString())) {
                    sql = "select ci.customer_name,li.id_card,li.orderid,li.uuid,li.pledge_type,"
                    		+" li.loan_status, li.created_at,u1.realname as create_by,u3.realname as principal_name,"
                    		+" li.apply_money,ci.is_important,li.state,ci.uuid "
                    		+ " from loan_info li LEFT JOIN customer_register_info ci ON "
                            + " li.customer_id = ci.uuid "
                    		+ " LEFT JOIN user u1 ON li.responsible_cm_id = u1.uuid"
                            + " LEFT JOIN dept de ON li.dept_id = de.id"
                            + " LEFT JOIN user u3 ON u3.uuid = de.principal_id"
                            + " where li.uuid='" + businesskey + "'";
                }else{
               	 sql = "select ci.customer_name,li.id_card,li.orderid,li.uuid,li.pledge_type,"
                 		+ " li.loan_status, li.created_at,u1.realname as create_by,u3.realname as principal_name,"
                 		 +" li.apply_money,ci.is_important,li.state,rep.uuid as repId "
                         + " from "
                         + todoDefineEntity.getTablename() + " rep " 
                         + " left join loan_info li on li.uuid = rep.loanId " 
                         + " left join customer_register_info ci on li.customer_id = ci.uuid "
                         + " left join user u1 ON li.responsible_cm_id = u1.uuid"
                         + " left join dept de ON li.dept_id = de.id "
                         + " left join user u3 ON u3.uuid = de.principal_id "
                         + " left join repayplandetail rpd on rpd.id = rep.replanDetaiId "
                         + " where "
                         + " rep." + todoDefineEntity.getBusinesskeyname() + "='"
                         + businesskey + "'";
                }
				if(param.get("data_access_level") != null){
					if(Integer.valueOf(param.get("data_access_level").toString()) == 0)
						sql += "and 1=0";
					else if (Integer.valueOf(param.get("data_access_level").toString()) == 1)
						sql += "and li.responsible_cm_id="+ '"' + param.get("userId") + '"';
					else if(Integer.valueOf(param.get("data_access_level").toString()) == 2)
						sql += "and li.dept_id="+ '"' + param.get("myDeptId") + '"';
					else if(Integer.valueOf(param.get("data_access_level").toString()) == 3)
						sql+= "and li.company_id ="+ '"' + param.get("mycompanyId") + '"';
				}
                TodoVO vo = new TodoVO();
                Map<String,Object> loanInfoMap = new HashMap<>();
				Connection conn = null;
				ResultSet rs = null;
                try {
					conn = dbControl.getConnection();
					rs = dbControl.getData(conn,sql);
                    while (rs.next()) {
                    	loanInfoMap = new HashMap<>();
                    	loanInfoMap.put("customerName", rs.getString(1));
                    	loanInfoMap.put("idCard", rs.getString(2));
                    	loanInfoMap.put("orderid", rs.getString(3));
                    	loanInfoMap.put("uuid", rs.getString(4));
                    	loanInfoMap.put("pledgeType", rs.getString(5));
                    	//loanInfoMap.put("loanStatus", rs.getString(6));
	                    loanInfoMap.put("loanStatus",pi.getActivityId());
                    	loanInfoMap.put("createdAt", rs.getString(7));
                    	loanInfoMap.put("createBy", rs.getString(8));
                    	loanInfoMap.put("principalName", rs.getString(9));
                    	loanInfoMap.put("applyMoney", Double.parseDouble(rs.getString(10))/(double)10000);
                    	loanInfoMap.put("isImportant", rs.getString(11));
                    	loanInfoMap.put("state", rs.getString(12));
                    	loanInfoMap.put("repId", rs.getString(13));
                    	//rs.getString(13)贷后处理需要但是贷前没有需要查询一个占位
                    	vo.setLoanInfoMap(loanInfoMap);
						String column1 = rs.getString(1);
						String column2 = rs.getString(2);
						String businessvalues = todoDefineEntity.getBusinessvalue();
						vo.setColumn1(column1);
						vo.setColumn2(column2);
						vo.setBusinessvalue(businessvalues);
						loanInfoMap.put("businessvalue", businessvalues);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    dbControl.close(conn,rs);
                }
                loanInfoMap.put("activityId", pi.getActivityId());
                loanInfoMap.put("assignee", task.getAssignee());
                loanInfoMap.put("taskId", task.getId());
                loanInfoMap.put("businesskey",businesskey);
                vo.setProcessdefine(pd);
				vo.setProcessins(pi);
				vo.setTask(task);
				vo.setProcessinsId(processinsId);
				vo.setTaskName(task.getName());
				vo.setSuspendedStatus(pi.isSuspended());
				vo.setTaskId(task.getId());
				vo.setProcessDefineId(processdifineId);
				vo.setBusinesskey(businesskey);
				boolean assigneeStatus = false;
				if (null == task.getAssignee()) {
					assigneeStatus = true;
				}
				vo.setAssigneeStatus(assigneeStatus);
				loanInfoMap.put("assigneeStatus", assigneeStatus);
				vo.setTaskCreateTime(task.getCreateTime());
				loanInfoMap.put("taskCreateTime", task.getCreateTime());
                if(null != loanInfoMap.get("uuid")){
                	mapList.add(loanInfoMap);
                	list.add(vo);
				}
        }
       }
       int totalcount = mapList.size();
		todopage.setTotalcount(totalcount);
		int totalpage = 0;
		boolean hasnext = false;
		boolean haslast = false;
		if (totalcount % pagecount == 0) {
			totalpage = totalcount / pagecount;
		} else {
			totalpage = totalcount / pagecount + 1;
		}
		if (totalpage > (currentPage + 1)) {
			hasnext = true;
		}
		if (currentPage > 0) {
			haslast = true;
		}
		todopage.setHaslast(haslast);
		todopage.setHasnext(hasnext);
		todopage.setCurrentpage(currentPage);
		todopage.setTotalpage(totalpage);

		int start = currentPage * pagecount;
		int end = 0;
		if ((currentPage + 1) < totalpage) {
			end = (currentPage + 1) * pagecount;
		}else if((currentPage + 1) == totalpage&&totalcount % pagecount==0 ){
			end = (currentPage + 1) * pagecount;
		} else {
			end = start + (totalcount % pagecount);
		}
		if (totalpage == 1) {
			end =mapList.size();
		}
		subvolist = list.subList(start,end);
		subpageList = mapList.subList(start,end);
		todopage.setContext(subvolist);
		todopage.setContextMap(subpageList);
		return todopage;
	}

	public Integer queryAgencyListNew(String userId,WorkFlowType[] keys,Map param) {
		Integer count = Integer.valueOf(0);
		count = loanInfoMapper.queryWorkSpaceLoanCount(param);
		return count;
	}

	/**
	 * 工作平台，任务查询：包含贷前与贷后的数据
	 *
	 * @return
	 */
	public PageModel<VehicleLoanInfo> queryWorkSpaceTaskList(Map<String,Object>param, Integer currentPage){
		PageModel<VehicleLoanInfo> pm = new PageModel<>();
		try {
			pm = vehicleLoanDao.getPageAndSetItemCount("com.utonw.utonerp.mapper.LoanInfoMapper.queryWorkSpaceLoanList",
					param, currentPage, Constants.MAX_LINES_PERPAGE_WORKSPACE);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pm;
	}
	@Override
	public List<Object> querycountList(Map<String, Object> param) {
		
		/*String sql=" select COUNT(*)  FROM customer_additional_info  cai  "
				    +" WHERE cai.enterprise_industry = '1' "
					+" union all "
					+" select COUNT(*) FROM customer_additional_info  cai  "
					+" WHERE cai.enterprise_industry ='2' "
					+" union all "
					+" select COUNT(*) FROM customer_additional_info  cai "
					+" WHERE cai.enterprise_industry ='3' "
					+" union all "
					+" select COUNT(*) FROM customer_additional_info  cai "
					+" WHERE cai.enterprise_industry ='4' "
					+" union all "
					+" select COUNT(*) FROM customer_additional_info  cai "
					+" WHERE cai.enterprise_industry ='5' "
					+" union all "
					+" select COUNT(*) FROM customer_additional_info  cai "
					+" WHERE cai.enterprise_industry ='6' "
					+" union all "
					+" select COUNT(*) FROM customer_additional_info  cai "
					+" WHERE cai.enterprise_industry ='7' "
					+" union all "
					+" select COUNT(*) FROM customer_additional_info  cai "
					+" WHERE cai.enterprise_industry ='8' "
					+" union all "
					+" select COUNT(*) FROM customer_additional_info  cai "
					+" WHERE cai.enterprise_industry ='9' "
					+" union all "
					+" select COUNT(*) FROM customer_additional_info  cai "
					+" WHERE cai.enterprise_industry ='a' "
					+" union all "
					+" select COUNT(*) FROM customer_additional_info  cai "
					+" WHERE cai.enterprise_industry ='b' "
					+" union all "
		            +" select COUNT(*) FROM customer_additional_info  cai "
			        +" WHERE cai.enterprise_industry ='c' ";*/

		  String sql = " SELECT enterprise_industry,COUNT(*)"
				  + " FROM customer_additional_info cai"
				  + " INNER JOIN loan_info li ON li.customer_id = cai.customer_id"
				  + " where 1=1";
			if(param.get("data_access_level") != null) {
				if (Integer.valueOf(param.get("data_access_level").toString()) == 0)
					sql += " and 1=0";
				else if (Integer.valueOf(param.get("data_access_level").toString()) == 1)
					sql += " and li.responsible_cm_id=" + '"' + param.get("uuid") + '"';
				else if (Integer.valueOf(param.get("data_access_level").toString()) == 2)
					sql += " and li.dept_id=" + '"' + param.get("myDeptId") + '"';
				else if (Integer.valueOf(param.get("data_access_level").toString()) == 3)
					sql += " and li.company_id =" + '"' + param.get("mycompanyId") + '"';
			}
				sql += " GROUP BY 1 ";
		  List<Object> a=new ArrayList<Object>();
		Connection conn = null;
		ResultSet rs = null;

		  try {
			  conn = dbControl.getConnection();
			  rs = dbControl.getData(conn,sql);
              while (rs.next()) {
	              Map<String,Object> hs = new HashMap<>();
	            hs.put("industry",rs.getString(1));
	            hs.put("count",rs.getString(2));
            	a.add(hs);
              }
          } catch (Exception e) {
              e.printStackTrace();
          } finally {
              dbControl.close(conn,rs);
          }
		return a;
	}
	@Override
	public List<Object> queryagecountList(Map<String, Object> param) {

		String dataAccessLevel = param.get("data_access_level").toString();
		  String sql= " SELECT COUNT(*)  FROM customer_register_info  cri ";
				sql += " INNER JOIN loan_info li ON li.customer_id = cri.uuid ";
				sql += " WHERE cri.age>20  and cri.age<29 ";
				sql += getDateAccessLevel(dataAccessLevel,param);
				sql += " union all ";
				sql += " SELECT COUNT(*)  FROM customer_register_info  cri ";
				sql += " INNER JOIN loan_info li ON li.customer_id = cri.uuid ";
				sql += " WHERE cri.age>30  and cri.age<39 ";
				sql += getDateAccessLevel(dataAccessLevel,param);
				sql += " union all ";
				sql += " SELECT COUNT(*)  FROM customer_register_info  cri ";
				sql += " INNER JOIN loan_info li ON li.customer_id = cri.uuid ";
				sql += " WHERE cri.age>40  and cri.age<49 ";
				sql += getDateAccessLevel(dataAccessLevel,param);
				sql += " union all ";
				sql += " SELECT COUNT(*)  FROM customer_register_info  cri ";
				sql += " INNER JOIN loan_info li ON li.customer_id = cri.uuid ";
				sql += " WHERE cri.age>50  and cri.age<59 ";
				sql += getDateAccessLevel(dataAccessLevel,param);
				sql += " union all ";
				sql += " SELECT COUNT(*)  FROM customer_register_info  cri ";
				sql += " INNER JOIN loan_info li ON li.customer_id = cri.uuid ";
				sql += " WHERE cri.age>60 ";
				sql += getDateAccessLevel(dataAccessLevel,param);

		  List<Object> a=new ArrayList<Object>();
		Connection conn = null;
		ResultSet rs = null;
		  try {
			  conn = dbControl.getConnection();
			  rs = dbControl.getData(conn,sql);
              while (rs.next()) {
            	a.add(rs.getString(1));
              }
          } catch (Exception e) {
              e.printStackTrace();
          } finally {
              dbControl.close(conn,rs);
          }
		return a;
	}
	public List<Object> queryloanModecountList(Map<String, Object> param) {
		
		String dataAccessLevel = param.get("data_access_level").toString();
		String sql =  " SELECT COUNT(*)  FROM  loan_info li ";
		sql += " WHERE li.repay_way='AverageCapitalPlusInterest' ";
		sql += getDateAccessLevel(dataAccessLevel, param);
		sql += " union all ";
		sql += " SELECT COUNT(*)  FROM  loan_info li ";
		sql += " WHERE li.repay_way='InterestRatesBefore' ";
		sql += getDateAccessLevel(dataAccessLevel, param);
		sql += " union all ";
		sql += " SELECT COUNT(*)  FROM  loan_info li  ";
		sql += " WHERE li.repay_way='flexiblerepaymentv2' ";
		sql += getDateAccessLevel(dataAccessLevel, param);
		sql += " union all  ";
		sql += " SELECT COUNT(*)  FROM  loan_info li   ";
		sql += " WHERE li.repay_way='averagePrincipalreduceinterest' ";
		sql += getDateAccessLevel(dataAccessLevel, param);
		sql += " union all ";
		sql += " SELECT COUNT(*)  FROM  loan_info li ";
		sql += " WHERE li.repay_way='averagePrincipalzerointerestrent' ";
		sql += getDateAccessLevel(dataAccessLevel, param);
		sql += " union all  ";
		sql += " SELECT COUNT(*)  FROM  loan_info li  ";
		sql += " WHERE li.repay_way='intrestbeforePrincipalrent' ";
		sql += getDateAccessLevel(dataAccessLevel, param);
		sql += " union all  ";
		sql += " SELECT COUNT(*)  FROM  loan_info li   ";
		sql += " WHERE li.repay_way='intrestbeforePrincipaltransfer' ";
		sql += getDateAccessLevel(dataAccessLevel, param);

		  List<Object> a=new ArrayList<Object>();
		Connection conn = null;
		ResultSet rs = null;
		  try {
			  conn = dbControl.getConnection();
			  rs = dbControl.getData(conn,sql);
              while (rs.next()) {
            	a.add(rs.getString(1));
              }
          } catch (Exception e) {
              e.printStackTrace();
          } finally {
              dbControl.close(conn,rs);
          }
		return a;
	}
	@Override
	public List<Object> querycustomercountList(Map<String, Object> param) {
		Date date=new Date();
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		String time=format.format(date).substring(0, 5);

		  /*String sql= " SELECT COUNT(*) "
				  +" FROM customer_register_info cri "
				  +" LEFT JOIN dept   d  ON  cri.dept_id=d.id  "
				  +" WHERE cri.created_at LIKE '" + time + "01%' "
				  +" union all  "
				  +" SELECT COUNT(*) "
				  +" FROM customer_register_info cri "
				  +" LEFT JOIN dept   d  ON  cri.dept_id=d.id  "
				  +" WHERE cri.created_at LIKE '" + time + "02%' "
				  +" union all  "
				  +" SELECT COUNT(*) "
				  +" FROM customer_register_info cri "
				  +" LEFT JOIN dept   d  ON  cri.dept_id=d.id "
				  +" WHERE cri.created_at LIKE '" + time + "03%' "
				  +" union all "
				  +" SELECT COUNT(*) "
				  +" FROM customer_register_info cri "
				  +" LEFT JOIN dept   d  ON  cri.dept_id=d.id  "
				  +" WHERE cri.created_at LIKE '" + time + "04%'  "
				  +" union all "
				  +" SELECT COUNT(*) "
				  +" FROM customer_register_info cri "
				  +" LEFT JOIN dept   d  ON  cri.dept_id=d.id "
				  +" WHERE cri.created_at LIKE '" + time + "05%' "
				  +" union all "
				  +" SELECT COUNT(*) "
				  +" FROM customer_register_info cri  "
				  +" LEFT JOIN dept   d  ON  cri.dept_id=d.id "
				  +" WHERE cri.created_at LIKE '" + time + "06%' "
				  +" union all "
				  +" SELECT COUNT(*) "
				  +" FROM customer_register_info cri "
				  +" LEFT JOIN dept   d  ON  cri.dept_id=d.id "
				  +" WHERE cri.created_at LIKE '" + time + "07%' "
				  +" union all "
				  +" SELECT COUNT(*) "
				  +" FROM customer_register_info cri "
				  +" LEFT JOIN dept   d  ON  cri.dept_id=d.id "
				  +" WHERE cri.created_at LIKE '" + time + "08%' "
				  +" union all  "
				  +" SELECT COUNT(*) "
				  +" FROM customer_register_info cri "
				  +" LEFT JOIN dept   d  ON  cri.dept_id=d.id "
				  +" WHERE cri.created_at LIKE '" + time + "09%' "
				  +" union all "
				  +" SELECT COUNT(*) "
				  +" FROM customer_register_info cri "
				  +" LEFT JOIN dept   d  ON  cri.dept_id=d.id "
				  +" WHERE cri.created_at LIKE '" + time + "10%' "
				  +" union all "
				  +" SELECT COUNT(*) "
				  +" FROM customer_register_info cri  "
				  +" LEFT JOIN dept   d  ON  cri.dept_id=d.id "
				  +" WHERE cri.created_at LIKE '" + time + "11%' "
				  +" union all "
				  +" SELECT COUNT(*) "
				  +" FROM customer_register_info cri  "
				  +" LEFT JOIN dept   d  ON  cri.dept_id=d.id "
				  +" WHERE cri.created_at LIKE '" + time + "12%' ";*/

		String sql_ = "SELECT count(*) "
				+ " ,LEFT (cri.created_at, 7) "
				+ " FROM customer_register_info cri "
				+ " WHERE cri.created_at LIKE '" + time + "%' ";
		if(param.get("data_access_level") != null){
			if(Integer.valueOf(param.get("data_access_level").toString()) == 0)
				sql_ += " and 1=0 ";
			else if (Integer.valueOf(param.get("data_access_level").toString()) == 1)
				sql_ += " and li.responsible_cm_id="+ '"' + param.get("uuid") + '"';
			else if(Integer.valueOf(param.get("data_access_level").toString()) == 2)
				sql_ += " and li.dept_id="+ '"' + param.get("myDeptId") + '"';
			else if(Integer.valueOf(param.get("data_access_level").toString()) == 3)
				sql_ += " and li.company_id ="+ '"' + param.get("mycompanyId") + '"';
		}
		sql_ += " GROUP BY LEFT (cri.created_at,7)";
		List<Object> a=new ArrayList<Object>();
		Connection conn = null;
		ResultSet rs = null;
		  try {
			  conn = dbControl.getConnection();
			  rs = dbControl.getData(conn,sql_);
              while (rs.next()) {
	              Map<String,Object> hs = new HashMap<>();
	              hs.put("count",rs.getString(1));
	              hs.put("month",rs.getString(2));
            	    a.add(hs);
              }
          } catch (Exception e) {
              e.printStackTrace();
          } finally {
              dbControl.close(conn,rs);
          }
		return a;
	}
	@Override
	   public List<Object> queryoverdueCountlist(){
		Date date=new Date();
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		String time=format.format(date).substring(0, 5);
		
		 String sql=  " SELECT COUNT(*) FROM repayment r  LEFT JOIN  repayplandetail rpt  ON  r.replanDetaiId=rpt.id    WHERE  r.is_overdue=1 "
				 +" AND  DATE_FORMAT(rpt.repayDate,'%Y-%m')='" + time + "01' "
				 +" union all  "
				 +" SELECT COUNT(*) FROM repayment r LEFT JOIN  repayplandetail rpt  ON  r.replanDetaiId=rpt.id WHERE  r.is_overdue=1 "
				 +" AND  DATE_FORMAT(rpt.repayDate,'%Y-%m')='" + time + "02'   "
				 +" union all  "
				 +" SELECT COUNT(*) FROM repayment r LEFT JOIN  repayplandetail rpt  ON  r.replanDetaiId=rpt.id WHERE  r.is_overdue=1 "
				 +" AND  DATE_FORMAT(rpt.repayDate,'%Y-%m')='" + time + "03'  "
				 +" union all   "
				 +" SELECT COUNT(*) FROM repayment r LEFT JOIN  repayplandetail rpt  ON  r.replanDetaiId=rpt.id WHERE  r.is_overdue=1 "
				 +" AND  DATE_FORMAT(rpt.repayDate,'%Y-%m')='" + time + "04' "
				 +" union all "
				 +" SELECT COUNT(*) FROM repayment r LEFT JOIN  repayplandetail rpt  ON  r.replanDetaiId=rpt.id WHERE  r.is_overdue=1 "
				 +" AND  DATE_FORMAT(rpt.repayDate,'%Y-%m')='" + time + "05'  "
				 +" union all    "
				 +" SELECT COUNT(*) FROM repayment r LEFT JOIN  repayplandetail rpt  ON  r.replanDetaiId=rpt.id WHERE  r.is_overdue=1 "
				 +" AND  DATE_FORMAT(rpt.repayDate,'%Y-%m')='" + time + "06'  "
				 +" union all "
				 +" SELECT COUNT(*) FROM repayment r LEFT JOIN  repayplandetail rpt  ON  r.replanDetaiId=rpt.id WHERE  r.is_overdue=1 "
				 +" AND  DATE_FORMAT(rpt.repayDate,'%Y-%m')='" + time + "07'  "
				 +" union all  "
				 +" SELECT COUNT(*) FROM repayment r LEFT JOIN  repayplandetail rpt  ON  r.replanDetaiId=rpt.id WHERE  r.is_overdue=1 "
				 +" AND  DATE_FORMAT(rpt.repayDate,'%Y-%m')='" + time + "08'  "
				 +" union all  "
				 +" SELECT COUNT(*) FROM repayment r LEFT JOIN  repayplandetail rpt  ON  r.replanDetaiId=rpt.id WHERE  r.is_overdue=1 "
				 +" AND  DATE_FORMAT(rpt.repayDate,'%Y-%m')='" + time + "09'  "
				 +" union all   "
				 +" SELECT COUNT(*) FROM repayment r LEFT JOIN  repayplandetail rpt  ON  r.replanDetaiId=rpt.id WHERE  r.is_overdue=1 "
				 +" AND  DATE_FORMAT(rpt.repayDate,'%Y-%m')='" + time + "10' "
				 +" union all "
				 +" SELECT COUNT(*) FROM repayment r LEFT JOIN  repayplandetail rpt  ON  r.replanDetaiId=rpt.id WHERE  r.is_overdue=1 "
				 +" AND  DATE_FORMAT(rpt.repayDate,'%Y-%m')='" + time + "11' "
				 +" union all "
				 +" SELECT COUNT(*) FROM repayment r LEFT JOIN  repayplandetail rpt  ON  r.replanDetaiId=rpt.id WHERE  r.is_overdue=1 "
				 +" AND  DATE_FORMAT(rpt.repayDate,'%Y-%m')='" + time + "12' ";
		  
			  List<Object> a=new ArrayList<Object>(); 
		Connection conn = null;
		ResultSet rs = null;
			  try {
				 conn = dbControl.getConnection();
				rs = dbControl.getData(conn,sql);
	           while (rs.next()) {
	        		   a.add(rs.getString(1));
	        	   }
	           
	       } catch (Exception e) {
	           e.printStackTrace();
	       } finally {
	           dbControl.close(conn,rs);
	       }
			return a;
	}
	
	
	
	
	
   @Override
   public List<Object> queryoutofAccountCountlist(){
	    Date date=new Date();
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		String time=format.format(date).substring(0, 5);
	   
	   
	   String sql= "SELECT SUM(t1.loan_money) "
			   +" FROM ( "
			   +" SELECT DISTINCT(li.orderid),li.loan_money"
			   +" FROM loan_info li "
			   +" LEFT JOIN loan_review_info  lri ON li.uuid=lri.loan_id "
			   +" WHERE li.chargedoff_at LIKE '" + time + "01%') t1"
			   +" UNION ALL "
			   +"SELECT SUM(t2.loan_money) "
			   +" FROM ( "
			   +" SELECT DISTINCT(li.orderid),li.loan_money"
			   +" FROM loan_info li "
			   +" LEFT JOIN loan_review_info  lri ON li.uuid=lri.loan_id "
			   +" WHERE li.chargedoff_at LIKE '" + time + "02%') t2"
			   +" UNION ALL "
			   +"SELECT SUM(t3.loan_money) "
			   +" FROM ( "
			   +" SELECT DISTINCT(li.orderid),li.loan_money"
			   +" FROM loan_info li  "
			   +" LEFT JOIN loan_review_info  lri ON li.uuid=lri.loan_id "
			   +" WHERE li.chargedoff_at LIKE '" + time + "03%') t3"
			   +" UNION ALL "
			   +"SELECT SUM(t4.loan_money) "
			   +" FROM ( "
			   +" SELECT DISTINCT(li.orderid),li.loan_money"
			   +" FROM loan_info li "
			   +" LEFT JOIN loan_review_info  lri ON li.uuid=lri.loan_id "
			   +" WHERE li.chargedoff_at LIKE '" + time + "04%') t4"
			   +" UNION ALL "
			   +"SELECT SUM(t5.loan_money) "
			   +" FROM ( "
			   +" SELECT DISTINCT(li.orderid),li.loan_money"
			   +" FROM loan_info li "
			   +" LEFT JOIN loan_review_info  lri ON li.uuid=lri.loan_id "
			   +" WHERE li.chargedoff_at LIKE '" + time + "05%') t5"
			   +" UNION ALL "
			   +"SELECT SUM(t6.loan_money) "
			   +" FROM ( "
			   +" SELECT DISTINCT(li.orderid),li.loan_money"
			   +" FROM loan_info li "
			   +" LEFT JOIN loan_review_info  lri ON li.uuid=lri.loan_id "
			   +" WHERE li.chargedoff_at LIKE '" + time + "06%') t6"
			   +" UNION ALL "
			   +"SELECT SUM(t7.loan_money) "
			   +" FROM ( "
			   +" SELECT DISTINCT(li.orderid),li.loan_money"
			   +" FROM loan_info li "
			   +" LEFT JOIN loan_review_info  lri ON li.uuid=lri.loan_id "
			   +" WHERE li.chargedoff_at LIKE '" + time + "07%') t7"
			   +" UNION ALL "
			   +"SELECT SUM(t8.loan_money) "
			   +" FROM ( "
			   +" SELECT DISTINCT(li.orderid),li.loan_money"
			   +" FROM loan_info li "
			   +" LEFT JOIN loan_review_info  lri ON li.uuid=lri.loan_id "
			   +" WHERE li.chargedoff_at LIKE '" + time + "08%') t8"
			   +" UNION ALL "
			   +"SELECT SUM(t9.loan_money) "
			   +" FROM ( "
			   +" SELECT DISTINCT(li.orderid),li.loan_money"
			   +" FROM loan_info li "
			   +" LEFT JOIN loan_review_info  lri ON li.uuid=lri.loan_id "
			   +" WHERE li.chargedoff_at LIKE '" + time + "09%') t9"
			   +" UNION ALL "
			   +"SELECT SUM(t10.loan_money) "
			   +" FROM ( "
			   +" SELECT DISTINCT(li.orderid),li.loan_money"
			   +" FROM loan_info li "
			   +" LEFT JOIN loan_review_info  lri ON li.uuid=lri.loan_id "
			   +" WHERE li.chargedoff_at LIKE '" + time + "10%') t10"
			   +" UNION ALL "
			   +"SELECT SUM(t11.loan_money) "
			   +" FROM ( "
			   +" SELECT DISTINCT(li.orderid),li.loan_money"
			   +" FROM loan_info li "
			   +" LEFT JOIN loan_review_info  lri ON li.uuid=lri.loan_id "
			   +" WHERE li.chargedoff_at LIKE '" + time + "11%') t11"
			   +" UNION ALL "
			   +"SELECT SUM(t12.loan_money) "
			   +" FROM ( "
			   +" SELECT DISTINCT(li.orderid),li.loan_money"
			   +" FROM loan_info li "
			   +" LEFT JOIN loan_review_info  lri ON li.uuid=lri.loan_id "
			   +" WHERE li.chargedoff_at LIKE '" + time + "12%') t12";
	   
	   
	   

	   List<Object> a=new ArrayList<Object>(); 
	   Connection conn = null;
	   ResultSet rs = null;
		  try {
			  conn = dbControl.getConnection();
			 rs = dbControl.getData(conn,sql);
           while (rs.next()) {
        	   if(rs.getString(1)!=null){
        		   a.add(rs.getString(1)) ;
        		   }
        	   else{
        		   a.add(0);	   
        	   }
           }
       } catch (Exception e) {
           e.printStackTrace();
       } finally {
           dbControl.close(conn,rs);
       }
		return a;
	   
   }

	@Override
	public TodoPage selectLoanList(Integer currentPage, Integer pagecount , Map<String, Object> param) {
		TodoPage todopage = new TodoPage();

//		String countSQL=" SELECT DISTINCT(li.uuid) "
//						+" FROM loan_info li "
//						+" LEFT JOIN loan_review_info  lri ON li.uuid=lri.loan_id "
//						+" WHERE li.chargedoff_at IS NOT NULL";
//		if (param.get("searchDate") != null) {
//			countSQL += " and DATE_FORMAT(li.chargedoff_at,'%Y-%m') = '" + param.get("searchDate") + "'" ;
//		}

		String count="";
		Connection conn = null;
		ResultSet rs = null;
//		try {
//			conn = dbControl.getConnection();
//			rs = dbControl.getData(conn,countSQL);
//			while (rs.next()) {
//				count ++;
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			dbControl.close(conn,rs);
//		}

		
		List<Map<String, Object>> mapList = new ArrayList<>();
		String   sql="";
		sql=  "SELECT DISTINCT(li.orderid), ci.customer_name, li.loan_money, li.pledge_type,li.repay_way,"
					+ " gei.buy_the_way, li.loan_status, u1.realname, de.name dename, co.name coname,"
					+ " li.chargedoff_at, li.id_card, li.uuid, li.buy_car_method, li.loan_product,"
					+ "li.contract_num,li.customer_id "
					+ " FROM loan_info li"
					+ " LEFT JOIN customer_register_info ci ON li.customer_id = ci.uuid"
					+ " LEFT JOIN dept de ON li.dept_id = de.id"
					+ " LEFT JOIN loan_review_info  lri ON li.uuid=lri.loan_id"
					+ " LEFT JOIN guarantee_evaluate_info gei ON gei.id = ci.id"
					+ " LEFT JOIN company co ON co.id = de.company_id"
					+ " LEFT JOIN USER u1 ON li.responsible_cm_id = u1.uuid "
					+ " WHERE li.chargedoff_at IS NOT NULL ";
		if (param.get("searchDate") != null) {
			sql += " AND DATE_FORMAT(li.chargedoff_at,'%Y-%m') = '" + param.get("searchDate") + "'" ;
		}
		// 抵押方式
		if(param.get("pledgetype") != null && !"9999".equals(param.get("pledgetype"))){
			sql += " AND li.pledge_type = '" + param.get("pledgetype") + "'";
		}
		// 还款方式
		if(param.get("repayWay") != null && !"9999".equals(param.get("repayWay"))){
			sql += " AND li.repay_way = '" + param.get("repayWay") + "'";
		}
		// 贷款额度
		if("" != param.get("txtStart") &&  param.get("txtStart") != null && 
				"" != param.get("txtEnd") &&  param.get("txtEnd") != null && 
					!"0".equals(param.get("txtEnd"))){
			sql += " AND li.loan_money BETWEEN " + param.get("txtStart") + " AND " + param.get("txtEnd") +" ";
		}else if("" != param.get("txtStart") && param.get("txtStart") != null){
				sql += " AND li.loan_money >= " + param.get("txtStart");
		}
		// 分公司名
		if("" != param.get("coName") && param.get("coName") != null){
			sql += " AND co.id = '" + param.get("coName") + "'";
		}
		// 部门名
		if("" != param.get("deName") && param.get("deName") != null){
			sql += " AND de.company_id = '" + param.get("deName") + "'";
		}
		// 客户经理
		if("" != param.get("realName") && param.get("realName") != null){
			sql += " AND li.responsible_cm_id = '" + param.get("realName") + "'";
		}
		if(param.get("data_access_level") != null){
			if(Integer.valueOf(param.get("data_access_level").toString()) == 0){
				sql += "and 1=0";
			}else if (Integer.valueOf(param.get("data_access_level").toString()) == 1){
				sql += "and li.responsible_cm_id="+ '"' + param.get("uuid") + '"';
			}else if(Integer.valueOf(param.get("data_access_level").toString()) == 2){
				sql += "and li.dept_id="+ '"' + param.get("myDeptId") + '"';
			}if(Integer.valueOf(param.get("data_access_level").toString()) == 3){
				sql+= " and li.company_id ="+ '"' + param.get("mycompanyId") + '"';
			}
		}

		sql += " ORDER BY li.orderid DESC";

		// 统计
		String countSql = "SELECT COUNT(t.orderid),IFNULL(SUM(t.loan_money),0)FROM (" + sql + ") as t";

		// 合计订单数
		String orderIdCount="";
		// 合计订单金额
		String sumLoanMoney = "";

		try {
			conn = dbControl.getConnection();
			rs = dbControl.getData(conn,countSql);
			while (rs.next()) {
				orderIdCount=rs.getString(1);
				sumLoanMoney=rs.getString(2);
			}
			count = orderIdCount;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbControl.close(conn,rs);
		}

		int totalcount = Integer.parseInt(count);
		todopage.setTotalcount(totalcount);
		int totalpage = 0;
		boolean hasnext = false;
		boolean haslast = false;
		if (totalcount % pagecount == 0) {
			totalpage = totalcount / pagecount;
		} else {
			totalpage = totalcount / pagecount + 1;
		}
		if (totalpage > (currentPage + 1)) {
			hasnext = true;
		}
		if (currentPage > 0) {
			haslast = true;
		}
		todopage.setHaslast(haslast);
		todopage.setHasnext(hasnext);
		todopage.setCurrentpage(currentPage);
		todopage.setTotalpage(totalpage);

		Map<String, Object> loanInfoMap = new HashMap<>();

		if(!"1".equals(param.get("is_export"))){
			sql+=" limit " + (currentPage*pagecount) + ","+ pagecount   ;
		}

		try {
			conn = dbControl.getConnection();
			rs = dbControl.getData(conn,sql);
			while (rs.next()) {
				loanInfoMap = new HashMap<>();
				// 订单号
				loanInfoMap.put("orderid", rs.getString(1));
				// 客户姓名
				loanInfoMap.put("customerName", rs.getString(2));
				// 贷款金额
				loanInfoMap.put("loanMoney", rs.getString(3));
				// 抵押方式
				loanInfoMap.put("pledgeType", rs.getString(4));
				// 还款方式
				loanInfoMap.put("repayWay", rs.getString(5));
				// 车辆类型
				loanInfoMap.put("buyTheWay", rs.getString(6));
				// 流程状态
				loanInfoMap.put("loanStatus", rs.getString(7));
				// 客户经理
				loanInfoMap.put("realName", rs.getString(8));
				// 部门
				loanInfoMap.put("deName", rs.getString(9));
				// 分公司
				loanInfoMap.put("coName", rs.getString(10));
				// 放款(出账)时间
				loanInfoMap.put("chargedOff", rs.getString(11));
				// 身份证号码
				loanInfoMap.put("idCard", rs.getString(12));
				// uuid
				loanInfoMap.put("uuid", rs.getString(13));
				// 合计订单数
				loanInfoMap.put("count", orderIdCount);
				// 合计订单金额
				loanInfoMap.put("sum", sumLoanMoney);
				// 购车类型
				loanInfoMap.put("buyCarMethod", rs.getString(14));
				// 贷款产品
				loanInfoMap.put("loanProduct", StringUtils.isNotBlank(rs.getString(15)) ? rs.getString(15) : "");
				// 合同号
				loanInfoMap.put("contractNum", rs.getString(16));
				// 用户ID
				loanInfoMap.put("customerId", rs.getString(17));
				if (null != loanInfoMap.get("uuid")) {
					mapList.add(loanInfoMap);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbControl.close(conn,rs);
		}
	
//				loanInfoMap.put("noloanorder", todopage.getNoloanorder());
		todopage.setContextMap(mapList);
		return todopage;
	}

   @Override
  	public TodoPage selectoverdueList(Integer currentPage, Integer pagecount , Map<String, Object> param) {
	   String sql="SELECT "
			   +"    IFNULL(li.contract_num, '-') AS contract_num, "
			   +"    ci.customer_name, "
			   +"    li.buy_car_method, "
			   +"    li.loan_product, "
			   +"    li.pledge_type, "
			   +"    li.repay_way, "
			   +"    IFNULL(li.loan_money, 0), "
			   +"    rpd.repayPeriod, "
			   +"    rpd.repayCapital, "
			   +"    rpd.repayDate, ";
			   if (param.get("searchDate") != null) {
				   sql += " TIMESTAMPDIFF(DAY,rpd.repayDate,STR_TO_DATE('"+param.get("searchDate")+"','%Y-%m-%d')) as overdueDay, " ;
			   }
			   else
			   {
				   sql+="  TIMESTAMPDIFF(DAY,rpd.repayDate, NOW()) as overdueDay,  ";
			   }
			   sql+="    com.name AS companyName, "
			   +"    de.name AS deptName, "
			   +"    u3.realname, "
			   +"    li.uuid, "
			   +"    li.orderid as oid,li.customer_id  "
			   +"FROM "
			   +"    repayplandetail rpd "
			   +"        LEFT JOIN "
			   +"    (SELECT  "
			   +"        a.* "
			   +"    FROM "
			   +"        repayment a "
			   +"    INNER JOIN repaymenttransaction b ON a.uuid = b.repaymentId) rep ON rpd.id = rep.replanDetaiId "
			   +"        LEFT JOIN "
			   +"    repayplan rp ON rpd.repayPlanId = rp.id "
			   +"        LEFT JOIN "
			   +"    loan_info li ON rp.loanId = li.uuid "
			   +"        LEFT JOIN "
			   +"    customer_register_info ci ON li.customer_id = ci.uuid "
			   +"        LEFT JOIN "
			   +"    user u1 ON li.create_cm_id = u1.uuid "
			   +"        LEFT JOIN "
			   +"    dept de ON li.dept_id = de.id "
			   +"        LEFT JOIN "
			   +"    user u3 ON u3.uuid = li.responsible_cm_id "
			   +"        LEFT JOIN "
			   +"    company com ON com.Id = li.company_id "
			   +"WHERE "
			   +"    rep.id IS NULL "
			   +"        AND rpd.repayPeriod != 0 "
			   +"        AND li.chargedoff_at IS NOT NULL "
			   +"        AND is_ended != 1 ";
				if (param.get("searchDate") != null) {
					sql += " and TIMESTAMPDIFF(DAY,rpd.repayDate,STR_TO_DATE('"+param.get("searchDate")+"','%Y-%m-%d'))>0 " ;
				}
				else
				{
					sql+=" and TIMESTAMPDIFF(DAY,rpd.repayDate, NOW()) > 0 ";
				}
				if (param.get("period") != null) {
					sql += " and rpt.repayPeriod<="+param.get("period") ;
				}
				if (param.get("responsible_cm_id") != null) {
					sql += " and li.responsible_cm_id='"+param.get("responsible_cm_id")+"'" ;
				}
			   if (param.get("companyId") != null) {
				   sql += "and li.company_id='" + param.get("companyId") + "' ";
			   }
			   if (param.get("deptId") != null) {
				   sql += "and li.dept_id='" + param.get("deptId") + "' ";
			   }
			   if (param.get("orderId") != null) {
				   sql += "and li.contract_num like '%" + param.get("orderId") + "%' ";
			   }
			   if (param.get("customerName") != null) {
				   sql += "and ci.customer_name like '%" + param.get("customerName") + "%' ";
			   }

				if(param.get("data_access_level") != null){
					if(Integer.valueOf(param.get("data_access_level").toString()) == 0)
						sql += "and 1=0";
					else if (Integer.valueOf(param.get("data_access_level").toString()) == 1)
						sql += "and li.responsible_cm_id="+ '"' + param.get("uuid") + '"';
					else if(Integer.valueOf(param.get("data_access_level").toString()) == 2)
						sql += "and li.dept_id="+ '"' + param.get("myDeptId") + '"';
					else if(Integer.valueOf(param.get("data_access_level").toString()) == 3)
						sql+= " and li.company_id ="+ '"' + param.get("mycompanyId") + '"';
				}
		
				sql += " ORDER BY li.contract_num DESC";
	   
	   
  		TodoPage todopage = new TodoPage();

  		String countSQL=" SELECT  COUNT(contract_num),IFNULL(SUM(repayCapital),0) FROM ("+sql+") t ";
	    Connection conn = dbControl.getConnection();
  		ResultSet rs1 = dbControl.getData(conn,countSQL);
  		int count=0;
  		String OrderCount="";
  		String RepayTotalSUM="";
  		try {
  			while (rs1.next()) {
  				OrderCount=rs1.getString(1);
  				RepayTotalSUM=rs1.getString(2);
  				count=Integer.parseInt(OrderCount);
  			}
  		} catch (Exception e) {
  			e.printStackTrace();
  		} finally {
  			dbControl.close(conn,rs1);
  		}
  		

		int totalcount = count;

		todopage.setTotalcount(totalcount);
		int totalpage = 0;
		boolean hasnext = false;
		boolean haslast = false;
		if (totalcount % pagecount == 0) {
			totalpage = totalcount / pagecount;
		} else {
			totalpage = totalcount / pagecount + 1;
		}
		if (totalpage > (currentPage + 1)) {
			hasnext = true;
		}
		if (currentPage > 0) {
			haslast = true;
		}
		todopage.setHaslast(haslast);
		todopage.setHasnext(hasnext);
		todopage.setCurrentpage(currentPage);
		todopage.setTotalpage(totalpage);
		List<Map<String, Object>> mapList = new ArrayList<>();
		
		if(param.get("noPage")==null){
			sql+=" limit " + (currentPage*pagecount) + ","+ pagecount   ;	
		}
  		
		conn = dbControl.getConnection();
		ResultSet rs = dbControl.getData(conn, sql);
		Map<String, Object> loanInfoMap = new HashMap<>();
		try {
			while (rs.next()) {
				loanInfoMap = new HashMap<>();
				loanInfoMap.put("contractNo", rs.getString(1));
				loanInfoMap.put("customerName", rs.getString(2));
				loanInfoMap.put("buyCarMethod", rs.getString(3));
				loanInfoMap.put("loanProduct", rs.getString(4));
				loanInfoMap.put("pledgeType", rs.getString(5));
				loanInfoMap.put("repayWay", rs.getString(6));
				loanInfoMap.put("loanMoney", rs.getString(7));
				loanInfoMap.put("period", rs.getString(8));
				loanInfoMap.put("repayCapital", rs.getString(9));
				loanInfoMap.put("repayDate", rs.getString(10));
				loanInfoMap.put("overDueDay", rs.getString(11));
				loanInfoMap.put("companyName", rs.getString(12));
				loanInfoMap.put("deptName", rs.getString(13));
				loanInfoMap.put("responsibleName", rs.getString(14));
				loanInfoMap.put("uuid", rs.getString(15));
				loanInfoMap.put("oid", rs.getString(16));
				loanInfoMap.put("customerId", rs.getString(17));
				loanInfoMap.put("OrderCount",OrderCount);
				loanInfoMap.put("RepayTotalSUM",RepayTotalSUM);
				if (null != loanInfoMap.get("contractNo")) {
					mapList.add(loanInfoMap);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbControl.close(conn, rs);
		}
  				
  		todopage.setContextMap(mapList);
  		return todopage;
  	}
   
   
   
   @Override
   public String selectName(String uuid){
	   String sql=" SELECT  u.realname from  `user` u  where  u.uuid='"+uuid+"'";
	   String username="";
	    Connection conn = dbControl.getConnection();
 		ResultSet rs1 = dbControl.getData(conn,sql);
 		try {
 			while (rs1.next()) {
 				username=rs1.getString(1);
 			}
 		} catch (Exception e) {
 			e.printStackTrace();
 		} finally {
 			dbControl.close(conn,rs1);
 		}
	   
	   return username;
   }
   @Override
   public String selectImagePath(String id){
	   String sql=" SELECT  attachment_path  FROM  loan_info_attachment WHERE id='"+id+"'";
	   String path="";
	    Connection conn = dbControl.getConnection();
 		ResultSet rs1 = dbControl.getData(conn,sql);
 		try {
 			while (rs1.next()) {
 				path=rs1.getString(1);
 			}
 		} catch (Exception e) {
 			e.printStackTrace();
 		} finally {
 			dbControl.close(conn,rs1);
 		}
	   
	   return path;
   }
   @Override
   public  Map<String, Object> selectposition(String uuid){
	   String sql=" SELECT  u.position,u.dept_id  from  `user` u  where  u.uuid='"+uuid+"'";
	   String position="";
	   String deptid="";
	    Connection conn = dbControl.getConnection();
 		ResultSet rs1 = dbControl.getData(conn,sql);
 		Map<String, Object> param=new HashMap<String, Object>();
 		try {
 			while (rs1.next()) {
 				position=rs1.getString(1);
 				deptid=rs1.getString(2);
 			}
 		} catch (Exception e) {
 			e.printStackTrace();
 		} finally {
 			dbControl.close(conn,rs1);
 		}
 		param.put("position", position);
 		param.put("deptid", deptid);
	   
	   return param;
   }
   @Override
   public Map<String, Object> selectStateCount(Map<String, Object> param){
	   //全部
	   String sql= " select count(li.orderid) from loan_info  li"
			       +" where 1=1 ";
	   if(param.get("data_access_level") != null){
		   if(Integer.valueOf(param.get("data_access_level").toString()) == 0)
			   sql += "and 1=0";
		   else if (Integer.valueOf(param.get("data_access_level").toString()) == 1)
			   sql += "and li.responsible_cm_id="+ '"' + param.get("userId") + '"';
		   else if(Integer.valueOf(param.get("data_access_level").toString()) == 2)
			   sql += "and li.dept_id="+ '"' + param.get("myDeptId") + '"';
		   else if(Integer.valueOf(param.get("data_access_level").toString()) == 3)
			   sql+= "and li.company_id ="+ '"' + param.get("mycompanyId") + '"';
	   }

	   String count="0";
	    Connection conn = dbControl.getConnection();
 		ResultSet rs1 = dbControl.getData(conn,sql);
 		try {
 			while (rs1.next()) {
 				count=rs1.getString(1);
 			}
 		} catch (Exception e) {
 			e.printStackTrace();
 		} finally {
 			dbControl.close(conn,rs1);
 		}
 		//贷款前
 		sql+=" AND li.loan_status in ("
 				+ "'mortgage','instock','reloanReview','reloanApprove','reloanE_Contract','reloan_lended','helploanReview',"
 				+ "'helploanApprove','helploanE_Contract','reloanAduit','helploan_lended','reuploadInformatin','helploanAduit',"
 				+ "'lended','reuploadInformatin','dataReview','signContract_rejected','signContract',"
 				+ "'judgment_rejected','judgment','visiteCheck','callBack','trialPhase_rejected',"
				+ "'trialPhase','departLeadAduit_rejected','departLeadAduit','vehicleAssess')";
 		String countFront="0";
 		Connection conn1 = dbControl.getConnection();
 		ResultSet rs2 = dbControl.getData(conn1,sql);
 		try {
 			while (rs2.next()) {
 				countFront=rs2.getString(1);
 			}
 		} catch (Exception e) {
 			e.printStackTrace();
 		} finally {
 			dbControl.close(conn1,rs2);
 		}
 		String sql1="";
 		//贷款后
 		sql1= " select count(li.orderid) from loan_info li "
			       +" where li.loan_status ='repayment' ";
	   if(param.get("data_access_level") != null){
		   if(Integer.valueOf(param.get("data_access_level").toString()) == 0)
			   sql1 += "and 1=0";
		   else if (Integer.valueOf(param.get("data_access_level").toString()) == 1)
			   sql1 += "and li.responsible_cm_id="+ '"' + param.get("userId") + '"';
		   else if(Integer.valueOf(param.get("data_access_level").toString()) == 2)
			   sql1 += "and li.dept_id="+ '"' + param.get("myDeptId") + '"';
		   else if(Integer.valueOf(param.get("data_access_level").toString()) == 3)
			   sql1 += "and li.company_id ="+ '"' + param.get("mycompanyId") + '"';
	   }
 		String countBack="0";
 		Connection conn2 = dbControl.getConnection();
 		ResultSet rs3 = dbControl.getData(conn2,sql1);
 		try {
 			while (rs3.next()) {
 				countBack=rs3.getString(1);
 			}
 		} catch (Exception e) {
 			e.printStackTrace();
 		} finally {
 			dbControl.close(conn2,rs2);
 		}
 		Map<String,Object> resultMap=new HashMap<String,Object>();
	   resultMap.put("count", count);
	   resultMap.put("countFront", countFront);
	   resultMap.put("countBack", countBack);
	   resultMap.put("countEnd", (Integer.valueOf(count)-Integer.valueOf(countFront)-Integer.valueOf(countBack)));


	   return resultMap;
   }
	@Override
	public String deleteLoanById(String uuid){
		String result = Constants.FAILURE;
		String sql= " SELECT PROC_INST_ID_ FROM act_ru_execution WHERE BUSINESS_KEY_= '"
				+ uuid+"'";
		//查找proc instance id
		List<String> procinstid_list = new Vector<>();
		Connection conn = dbControl.getConnection();
		ResultSet rs = dbControl.getData(conn,sql);
		try {
			while (rs.next()) {
				procinstid_list.add(rs.getString(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbControl.close(conn,rs);
		}
		if (procinstid_list.size()>0){
			for (String proc_inst:procinstid_list){
				sql = "DELETE from act_ru_identitylink WHERE PROC_INST_ID_ ='".concat(proc_inst).concat("'");
				conn = dbControl.getConnection();
				dbControl.update(conn,sql);
				dbControl.close(conn,null);

				sql = "SELECT ID_ FROM act_ru_task where  PROC_INST_ID_ ='".concat(proc_inst).concat("'");
				List<String> task_list = new Vector<>();
				conn = dbControl.getConnection();
				rs = dbControl.getData(conn,sql);
				try {
					while (rs.next()) {
						task_list.add(rs.getString(1));
					}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					dbControl.close(conn,rs);
				}
				for(String taskid:task_list){
					sql = "DELETE from act_ru_identitylink WHERE TASK_ID_ ='".concat(taskid).concat("'");
					conn = dbControl.getConnection();
					dbControl.update(conn,sql);
					dbControl.close(conn,null);
				}

				sql = "DELETE from act_ru_task WHERE PROC_INST_ID_ ='".concat(proc_inst).concat("'");
				conn = dbControl.getConnection();
				dbControl.update(conn,sql);
				dbControl.close(conn,null);


				sql = "DELETE from act_ru_variable WHERE PROC_INST_ID_ ='".concat(proc_inst).concat("'");
				conn = dbControl.getConnection();
				dbControl.update(conn,sql);
				dbControl.close(conn,null);

				sql = "DELETE from act_ru_execution WHERE PROC_INST_ID_ ='".concat(proc_inst).concat("'");
				conn = dbControl.getConnection();
				dbControl.update(conn,sql);
				dbControl.close(conn,null);
				result = Constants.SUCCESS;
			}
			if(result.equals(Constants.SUCCESS)){
				sql = "DELETE from loan_info WHERE uuid ='".concat(uuid).concat("'");
				conn = dbControl.getConnection();
				dbControl.update(conn,sql);
				dbControl.close(conn,null);
			}

		}else{
			sql= " SELECT PROC_INST_ID_ FROM act_hi_procinst WHERE BUSINESS_KEY_= '"
					+ uuid+"'";
			List<String> procinstid_hi_list = new Vector<>();
			conn = dbControl.getConnection();
			rs = dbControl.getData(conn,sql);
			try {
				while (rs.next()) {
					procinstid_hi_list.add(rs.getString(1));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				dbControl.close(conn,rs);
			}
			if (procinstid_hi_list.size()>0){
				for (String proc_inst:procinstid_hi_list){
					sql = "DELETE from act_hi_actinst WHERE PROC_INST_ID_ ='".concat(proc_inst).concat("'");
					conn = dbControl.getConnection();
					dbControl.update(conn,sql);
					dbControl.close(conn,null);

					sql = "DELETE from act_hi_varinst WHERE PROC_INST_ID_ ='".concat(proc_inst).concat("'");
					conn = dbControl.getConnection();
					dbControl.update(conn,sql);
					dbControl.close(conn,null);

					sql = "DELETE from act_hi_identitylink WHERE PROC_INST_ID_ ='".concat(proc_inst).concat("'");
					conn = dbControl.getConnection();
					dbControl.update(conn,sql);
					dbControl.close(conn,null);
					sql = "SELECT ID_ FROM act_hi_taskinst where  PROC_INST_ID_ ='".concat(proc_inst).concat("'");
					List<String> task_list = new Vector<>();
					conn = dbControl.getConnection();
					rs = dbControl.getData(conn,sql);
					try {
						while (rs.next()) {
							task_list.add(rs.getString(1));
						}
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						dbControl.close(conn,rs);
					}
					for(String taskid:task_list){
						sql = "DELETE from act_hi_identitylink WHERE TASK_ID_ ='".concat(taskid).concat("'");
						conn = dbControl.getConnection();
						dbControl.update(conn,sql);
						dbControl.close(conn,null);
					}

					sql = "DELETE from act_hi_taskinst WHERE PROC_INST_ID_ ='".concat(proc_inst).concat("'");
					conn = dbControl.getConnection();
					dbControl.update(conn,sql);
					dbControl.close(conn,null);

					sql = "DELETE from act_hi_procinst WHERE PROC_INST_ID_ ='".concat(proc_inst).concat("'");
					conn = dbControl.getConnection();
					dbControl.update(conn,sql);
					dbControl.close(conn,null);
					result = Constants.SUCCESS;
				}
				if(result.equals(Constants.SUCCESS)){
					sql = "DELETE from loan_info WHERE uuid ='".concat(uuid).concat("'");
					conn = dbControl.getConnection();
					dbControl.update(conn,sql);
					dbControl.close(conn,null);
				}
				//贷后订单的情况
				sql= " SELECT uuid FROM repayment WHERE loanId= '"
						+ uuid+"'";
				List<String> repayment_list = new Vector<>();
				conn = dbControl.getConnection();
				rs = dbControl.getData(conn,sql);
				try {
					while (rs.next()) {
						repayment_list.add(rs.getString(1));
					}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					dbControl.close(conn,rs);
				}
				for (String repayid:repayment_list){
					sql= " SELECT PROC_INST_ID_ FROM act_ru_execution WHERE BUSINESS_KEY_= '"
							+ repayid+"'";
					//查找proc instance id
					procinstid_list = new Vector<>();
					conn = dbControl.getConnection();
					rs = dbControl.getData(conn,sql);
					try {
						while (rs.next()) {
							procinstid_list.add(rs.getString(1));
						}
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						dbControl.close(conn,rs);
					}
					if (procinstid_list.size()>0){
						for (String proc_inst:procinstid_list){
							sql = "DELETE from act_ru_identitylink WHERE PROC_INST_ID_ ='".concat(proc_inst).concat("'");
							conn = dbControl.getConnection();
							dbControl.update(conn,sql);
							dbControl.close(conn,null);

							sql = "DELETE from act_ru_task WHERE PROC_INST_ID_ ='".concat(proc_inst).concat("'");
							conn = dbControl.getConnection();
							dbControl.update(conn,sql);
							dbControl.close(conn,null);

							sql = "DELETE from act_ru_variable WHERE PROC_INST_ID_ ='".concat(proc_inst).concat("'");
							conn = dbControl.getConnection();
							dbControl.update(conn,sql);
							dbControl.close(conn,null);

							sql = "DELETE from act_ru_execution WHERE PROC_INST_ID_ ='".concat(proc_inst).concat("'");
							conn = dbControl.getConnection();
							dbControl.update(conn,sql);
							dbControl.close(conn,null);

						}
					}
					result = Constants.SUCCESS;
					if(result.equals(Constants.SUCCESS)){
						sql = "DELETE from repayment WHERE uuid ='".concat(repayid).concat("'");
						conn = dbControl.getConnection();
						dbControl.update(conn,sql);
						dbControl.close(conn,null);
					}
				}

				if(result.equals(Constants.SUCCESS)){
					sql = "DELETE from loan_info WHERE uuid ='".concat(uuid).concat("'");
					conn = dbControl.getConnection();
					dbControl.update(conn,sql);
					dbControl.close(conn,null);
				}
			}
		}
		return result;
	}
	
	
	@Override
	public TodoPage queryLoanBalanceCount(Integer currentPage, Integer pagecount , Map<String,Object> param) {

		String sql = "";

		sql = "SELECT "
				+ "li.uuid, "
				+ "u1.realname, "
				+ "ci.customer_name, "
				+ "li.pledge_type, "
				+ "li.repay_way, "
				+ "IFNULL(li.chargedoff_at,'-'), "
				+ "DATE_FORMAT(planDate.end_date,'%Y-%m-%d') as end_date, "
				+ "plan.repayCapital as chargedof_money, "
				+ "IFNULL(plan.repayCapital - IFNULL(rep.actualRepaymentCaptialSum,0),0) AS BJYE, "
				+ "IFNULL(plan.repayInterest - rep.actualRepaymentInterestSum,0) AS LXYE, "
				+ "IFNULL(plan.repayCapital + plan.repayInterest+plan.manageFee+plan.parkCostFee+plan.cashdepositFee+plan.gpsCostFee-IFNULL(rep.actualCashdepositFee,0)-IFNULL(rep.actualGpsCostFee,0) - rep.actualRepaymentCaptialSum-rep.actualRepaymentInterestSum-IFNULL(rep.actualManageFee,0)-IFNULL(rep.actualParkCostFee,0) ,0) AS DKYE, "
				+ "IFNULL(rep.actualRepaymentInterestSum,0) as actualRepaymentInterestSum, "
				+ "IFNULL(li.contract_num,'-') as contract_num, "
				+ "cai.bank_name, "
				+ "cai.account_num, "
				+ "li.buy_car_method, "
				+ "li.loan_product, "
				+ "CONCAT(ROUND(li.loan_rate/12,2),'%') as loan_rate, "
				+ "li.loan_limit_time_unit, "
				+ "IFNULL(rep.actualCashdepositFee, 0) AS planCashdepositFee,"
				+ "IFNULL(rep.actualRepaymentInterestSum, 0) AS planInterest,"
				+ "IFNULL(rep.actualManageFee, 0) AS planManageFee,"
				+ "IFNULL(rep.actualParkCostFee, 0) AS planParkCostFee,"
				+ "IFNULL(rep.actualGpsCostFee, 0) AS planGpsCostFee,"
				+ "IFNULL(rep.actualDrunkDrive, 0) AS planDrunkDirve,"
				+ "IFNULL(rep.actualOverDueFee, 0) AS planOverdueFee,"
				+ "IFNULL(rep.actualPenaltyFee, 0) AS planPenaltyFee,"
				+ "IFNULL(rep.actualTowCost, 0) AS planTowCost,"
				+ "IFNULL(rep.actualDepreciationFee, 0) AS planDepreciationFee,"
				+ "li.orderid AS orderid,li.customer_id "
				+ "FROM "
				+ "loan_info li "
				+ "LEFT JOIN "
				+ "user u1 ON li.responsible_cm_id = u1.uuid "
				+ "LEFT JOIN "
				+ "customer_register_info ci ON li.customer_id = ci.uuid "
				+ "  LEFT JOIN customer_account_info cai ON li.customer_account_num_id = cai.id "
				+ "LEFT JOIN "
				+ " ( SELECT "
				+ "SUM(IFNULL(rpt.actualRepaymentCaptialSum,0)) AS actualRepaymentCaptialSum, "
				+ "SUM(IFNULL(rpt.actalRepaymentFee,0)) AS actalRepaymentFee, "
				+ "SUM(IFNULL(rpt.actualRepaymentInterestSum,0)) AS actualRepaymentInterestSum, "
				+ "SUM(IFNULL(rpt.actualRepaymentSum,0)) AS actualRepaymentSum, "
				+ "SUM(IFNULL(CAST(JSON_EXTRACT(rpt.actalRepaymentFee,'$.manageFee') AS DECIMAL),0))AS actualManageFee,"
                + "SUM(IFNULL(CAST(JSON_EXTRACT (rpt.actalRepaymentFee,'$.gpsCost') AS DECIMAL),0)) AS actualGpsCostFee,"
				+ "SUM(IFNULL(CAST(JSON_EXTRACT (rpt.actalRepaymentFee,'$.parkCost') AS DECIMAL),0)) AS actualParkCostFee,"
				+ "SUM(IFNULL(CAST(JSON_EXTRACT(rpt.actalRepaymentFee,'$.towCost') AS DECIMAL),0))AS actualTowCost,"
				+ "SUM(IFNULL(CAST(JSON_EXTRACT(rpt.actalRepaymentFee,'$.checkCost') AS DECIMAL),0))AS actualCheckCost,"
                + "SUM(IFNULL(CAST(JSON_EXTRACT (rpt.actalRepaymentFee,'$.depreciationFee') AS DECIMAL),0)) AS actualDepreciationFee,"
				+ "SUM(IFNULL(CAST(JSON_EXTRACT(rpt.actalRepaymentFee,'$.drunkDrive') AS DECIMAL),0))AS actualDrunkDrive,"
				+ "SUM(IFNULL(CAST(JSON_EXTRACT (rpt.actalRepaymentFee,'$.overdueFee') AS DECIMAL),0)) AS actualOverDueFee,"
				+ "SUM(IFNULL(CAST(JSON_EXTRACT (rpt.actalRepaymentFee,'$.cashdepositFee') AS DECIMAL),0)) AS actualCashdepositFee,"
				+ "SUM(IFNULL(CAST(JSON_EXTRACT (rpt.actalRepaymentFee,'$.checkCost') AS DECIMAL),0)) AS actualCheckCostFee,"
		        + "SUM(IFNULL(CAST(JSON_EXTRACT(rpt.actalRepaymentFee,'$.certificatefee') AS DECIMAL),0))AS actualCertificatefee,"	  
		        + "SUM(IFNULL(CAST(JSON_EXTRACT(rpt.actalRepaymentFee,'$.visitCost') AS DECIMAL),0))AS actualVisitCost,"
		        + "SUM(IFNULL(CAST(JSON_EXTRACT(rpt.actalRepaymentFee,'$.penaltyFee') AS DECIMAL),0))AS actualPenaltyFee,"	
				+ "rp.loanId AS loanId "
				+ "FROM "
				+ "repayment rp "
				+ "LEFT JOIN repaymenttransaction rpt ON rpt.repaymentId = rp.uuid ";
		if (param.get("endDate") != null) {
			sql += " WHERE rpt.createDay <= STR_TO_DATE('" + param.get("endDate") + "','%Y-%m-%d') ";
		}
		sql += "GROUP BY rp.loanId) rep ON li.uuid = rep.loanId "
				+ "LEFT JOIN "
				+ " ( SELECT "
				+ "SUM(IFNULL(rpd.repayCapital,0)) AS repayCapital, "
				+ "SUM(IFNULL(rpd.repayInterest,0)) AS repayInterest, "
				+ "SUM(IFNULL(rpd.depreciationFee,0)) as manageFee, "
				+ "SUM(IFNULL(rpd.parkCost,0)) as parkCostFee, "
				+ "SUM(IFNULL(rpd.gpsCost,0)) as gpsCostFee, "
				+ "SUM(IFNULL(rpd.overDueFee,0)) as overDueFee, "
				+ "SUM(IFNULL(rpd.cashdepositFee,0)) as cashdepositFee, "
				+ "SUM(IFNULL(rpd.checkCost,0)) as checkCost, "
				+ "SUM(IFNULL(rpd.drunkDrive, 0)) AS drunkDrive, "
				+ "SUM(IFNULL(rpd.penaltyFee,0))AS penaltyFee, "
				+ "SUM(IFNULL(rpd.towCost,0))AS towCost, "
				+ "rp.loanId "
				+ "FROM "
				+ "repayplandetail rpd "
				+ "LEFT JOIN repayplan rp ON rp.id = rpd.repayPlanId "
				+ "GROUP BY rp.loanId ) plan ON plan.loanId = li.uuid "
				+ "LEFT JOIN"
				+ "(SELECT "
				+ "    MAX(rpd.repayDate) AS end_date, rp.loanId "
				+ "FROM "
				+ "    repayplandetail rpd "
				+ "LEFT JOIN repayplan rp ON rp.id = rpd.repayPlanId "
				+ "GROUP BY rp.loanId) planDate ON planDate.loanId = li.uuid "
				+ " where li.chargedoff_at is not null ";//li.loan_status = 'repayment'
		if (param.get("endDate") != null) {
			//开始日小于截止日
			sql += " and STR_TO_DATE(li.chargedoff_at,'%Y-%m-%d') <= STR_TO_DATE('" + param.get("endDate") + "','%Y-%m-%d') ";
		}
		if (param.get("pledge_type") != null) {
			sql += " and li.pledge_type = '" + param.get("pledge_type") + "' ";
		}
		if (param.get("repay_way") != null) {
			sql += "and li.repay_way='" + param.get("repay_way") + "' ";
		}
		if (param.get("responsible_cm_id") != null) {
			sql += "and li.responsible_cm_id='" + param.get("responsible_cm_id") + "' ";
		}
		if (param.get("companyId") != null) {
			sql += "and li.company_id='" + param.get("companyId") + "' ";
		}
		if (param.get("deptId") != null) {
			sql += "and li.dept_id='" + param.get("deptId") + "' ";
		}
		if (param.get("orderId") != null) {
			sql += "and li.contract_num like '%" + param.get("orderId") + "%' ";
		}
		if (param.get("customerName") != null) {
			sql += "and ci.customer_name like '%" + param.get("customerName") + "%' ";
		}

		if (param.get("data_access_level") != null) {
			if (Integer.valueOf(param.get("data_access_level").toString()) == 0)
				sql += "and 1=0";
			else if (Integer.valueOf(param.get("data_access_level").toString()) == 1)
				sql += "and li.responsible_cm_id=" + '"' + param.get("uuid") + '"';
			else if (Integer.valueOf(param.get("data_access_level").toString()) == 2)
				sql += "and li.dept_id=" + '"' + param.get("myDeptId") + '"';
			else if (Integer.valueOf(param.get("data_access_level").toString()) == 3)
				sql += " and li.company_id =" + '"' + param.get("mycompanyId") + '"';
		}
		sql += " order by contract_num desc";
			
		
			TodoPage todopage = new TodoPage();

			String countSQL="select count(uuid),IFNULL(sum(chargedof_money),0),IFNULL(sum(BJYE),0),IFNULL(sum(LXYE),0),IFNULL(sum(DKYE),0),IFNULL(sum(actualRepaymentInterestSum),0) from ( "+ sql+" ) as t";

			int count=0;
			
			String OrderCount="";
			String ContractCount="";
			String CaptialBalCount="";
			String InterestBalCount="";
			String LoanBalCount="";
			String InterestCount="";
			
		   Connection conn = null;
		   ResultSet rs = null;
			try {
				conn = dbControl.getConnection();
				rs = dbControl.getData(conn,countSQL);
				while (rs.next()) {
					OrderCount=rs.getString(1);
					ContractCount=rs.getString(2);
					CaptialBalCount=rs.getString(3);
					InterestBalCount=rs.getString(4);
					LoanBalCount= rs.getString(5);
					InterestCount= rs.getString(6);
					count=Integer.parseInt(OrderCount);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				dbControl.close(conn,rs);
			}
			
			int totalcount = count;

			todopage.setTotalcount(totalcount);
			int totalpage = 0;
			boolean hasnext = false;
			boolean haslast = false;
			if (totalcount % pagecount == 0) {
				totalpage = totalcount / pagecount;
			} else {
				totalpage = totalcount / pagecount + 1;
			}
			if (totalpage > (currentPage + 1)) {
				hasnext = true;
			}
			if (currentPage > 0) {
				haslast = true;
			}
			todopage.setHaslast(haslast);
			todopage.setHasnext(hasnext);
			todopage.setCurrentpage(currentPage);
			todopage.setTotalpage(totalpage);
			List<Map<String, Object>> mapList = new ArrayList<>();
					if(param.get("noPage")==null){
						sql+=" limit " + (currentPage*pagecount) + ","+ pagecount   ;	
					}
					Map<String, Object> loanInfoMap = new HashMap<>();
					try {
						conn = dbControl.getConnection();
						rs = dbControl.getData(conn,sql);
						while (rs.next()) {
							loanInfoMap = new HashMap<>();
							loanInfoMap.put("uuid", rs.getString(1));
							loanInfoMap.put("responsibleName", rs.getString(2));
							loanInfoMap.put("contractNo", rs.getString(13));
							loanInfoMap.put("customerName", rs.getString(3));
							loanInfoMap.put("pledge_type", rs.getString(4));
							loanInfoMap.put("interestType", "");
							loanInfoMap.put("repay_way", rs.getString(5));
							loanInfoMap.put("chargedoff_at", rs.getString(6));
							loanInfoMap.put("end_date", rs.getString(7));
							loanInfoMap.put("chargedof_money", rs.getString(8));
							loanInfoMap.put("CapitalBal", rs.getString(9));
							loanInfoMap.put("InterestBal", rs.getString(10));
							loanInfoMap.put("LoanBal", rs.getString(11));
							loanInfoMap.put("Interest", rs.getString(12));
							loanInfoMap.put("bank_name", rs.getString(14));
							loanInfoMap.put("account_num", rs.getString(15));
							loanInfoMap.put("buy_car_method", rs.getString(16));
							loanInfoMap.put("loan_product", rs.getString(17));
							loanInfoMap.put("loan_rate", rs.getString(18));
							loanInfoMap.put("loan_limit_time_unit", rs.getString(19));
							loanInfoMap.put("planCashdepositFee", rs.getString(20));
							loanInfoMap.put("planInterest", rs.getString(21));
							loanInfoMap.put("planManageFee", rs.getString(22));
							loanInfoMap.put("planParkCostFee", rs.getString(23));
							loanInfoMap.put("planGpsCostFee", rs.getString(24));
							loanInfoMap.put("planDrunkDrive", rs.getString(25));
							loanInfoMap.put("planOverdueFee", rs.getString(26));
							loanInfoMap.put("planPenaltyFee", rs.getString(27));
							loanInfoMap.put("planTowCost", rs.getString(28));
							loanInfoMap.put("planDepreciationFee", rs.getString(29));
							loanInfoMap.put("orderid", rs.getString(30));
							loanInfoMap.put("customerId", rs.getString(31));
							loanInfoMap.put("OrderCount", OrderCount);
							loanInfoMap.put("ContractCount", ContractCount);
							loanInfoMap.put("CaptialBalCount", CaptialBalCount);
							loanInfoMap.put("InterestBalCount", InterestBalCount);
							loanInfoMap.put("LoanBalCount", LoanBalCount);
							loanInfoMap.put("InterestCount",InterestCount);
							
							if (null != loanInfoMap.get("uuid")) {
								mapList.add(loanInfoMap);
							}
						}
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						dbControl.close(conn,rs);
					}
					
			todopage.setContextMap(mapList);
			return todopage;
	}

	@Override
	public TodoPage queryLoanReceiptCount(Integer currentPage, Integer pagecount , Map<String,Object> param) {

			String sql = "";


		sql = " SELECT   "
				+ "  li.uuid,  "
				+ "  IFNULL(li.chargedoff_at, '-'),  "
				+ "  DATE_FORMAT(planDate.end_date,'%Y-%m-%d') as end_date,  "
				+ "  li.customer_id, "
				+ "  ci.customer_name,  "
				+ "  u1.realname,  "
				+ "  cai.account_idnum,  "
				+ "  CONCAT(ROUND(li.loan_rate / 12, 2),'%') AS loan_rate,  "
				+ "  (0 - plan.repayCapital) AS out_money,  "
				+ "  IFNULL(rep.actualRepaymentCaptialSum,0) AS in_money,  "
				+ "  IFNULL(IFNULL(rep.actualRepaymentCaptialSum,0) - plan.repayCapital,0) AS bal_money,  "
				+ "  IFNULL(li.orderid, '-') as contract_num,  "
				+ "  co.name AS company_name,  "
				+ "  de.name AS dept_name,  "
				+ "  li.buy_car_method,  "
				+ "  li.loan_product,  "
				+ "  li.pledge_type,  "
				+ "  li.repay_way,  "
				+ "  li.contract_num as cnum,"
				+ "	 ci.live_address,"
				+ "  ci.mobile "
				+ "  FROM   "
				+ "  loan_info li  "
				+ "   LEFT JOIN "
				+ "  user u1 ON li.responsible_cm_id = u1.uuid  "
				+ "   LEFT JOIN "
				+ "  customer_register_info ci ON li.customer_id = ci.uuid  "
				+ "  LEFT JOIN customer_account_info cai ON li.customer_account_num_id = cai.id "
				+ "   LEFT JOIN "
				+ "  (SELECT   "
				+ "SUM(IFNULL(rpt.actualRepaymentCaptialSum,0)) AS actualRepaymentCaptialSum, "
				+ "SUM(IFNULL(rpt.actalRepaymentFee,0)) AS actalRepaymentFee, "
				+ "SUM(IFNULL(rpt.actualRepaymentInterestSum,0)) AS actualRepaymentInterestSum, "
				+ "SUM(IFNULL(rpt.actualRepaymentSum,0)) AS actualRepaymentSum, "
				+ "SUM(IFNULL(CAST(JSON_EXTRACT(rpt.actalRepaymentFee, '$.manageFee')AS DECIMAL),0) + IFNULL(CAST(JSON_EXTRACT(rpt.actalRepaymentFee, '$.gpsCost') AS DECIMAL), 0)"
				+ "+IFNULL(CAST(JSON_EXTRACT(rpt.actalRepaymentFee, '$.parkCost')AS DECIMAL),0)+IFNULL(CAST(JSON_EXTRACT(rpt.actalRepaymentFee, '$.towCost')AS DECIMAL),0)"
				+ "+IFNULL(CAST(JSON_EXTRACT(rpt.actalRepaymentFee, '$.checkCost')AS DECIMAL),0)+IFNULL(CAST(JSON_EXTRACT(rpt.actalRepaymentFee, '$.depreciationFee')AS DECIMAL),0)"
				+ "+IFNULL(CAST(JSON_EXTRACT(rpt.actalRepaymentFee, '$.drunkDrive')AS DECIMAL),0)+IFNULL(CAST(JSON_EXTRACT(rpt.actalRepaymentFee, '$.cashdepositFee')AS DECIMAL),0)"
				+ "+IFNULL(CAST(JSON_EXTRACT(rpt.actalRepaymentFee, '$.certificatefee')AS DECIMAL),0)+IFNULL(CAST(JSON_EXTRACT(rpt.actalRepaymentFee, '$.overdueFee')AS DECIMAL),0)"
				+ "+IFNULL(CAST(JSON_EXTRACT(rpt.actalRepaymentFee, '$.visitCost')AS DECIMAL),0)+IFNULL(CAST(JSON_EXTRACT(rpt.actalRepaymentFee, '$.penaltyFee')AS DECIMAL),0)) AS actualManageFee,"
				+ "SUM(IFNULL(CAST(JSON_EXTRACT(rpt.actalRepaymentFee, '$.parkCost')AS DECIMAL),0)) AS actualParkCostFee, "
				+ " rp.loanId AS loanId   "
				+ "  FROM  "
				+ "   repayment rp "
				+ "  LEFT JOIN repaymenttransaction rpt ON rpt.repaymentId = rp.uuid  ";
		if (param.get("endDate") != null && param.get("startDate") != null) {
			//贷款日小于截止日,大于开始日
			sql += "  WHERE rpt.createDay BETWEEN STR_TO_DATE('" + param.get("startDate") + "', '%Y-%m-%d') AND STR_TO_DATE('" + param.get("endDate") + "', '%Y-%m-%d') ";
		}
		sql += "  GROUP BY rp.loanId) rep ON li.uuid = rep.loanId  "
				+ "   LEFT JOIN "
				+ "  (SELECT   "
				+ "SUM(IFNULL(rpd.repayCapital,0)) AS repayCapital, "
				+ "SUM(IFNULL(rpd.repayInterest,0)) AS repayInterest, "
				+ "SUM(IFNULL(rpd.depreciationFee+rpd.drunkDrive,0)) as manageFee, "
				+ "SUM(IFNULL(rpd.parkCost,0)) as parkCostFee, "
				+ " rp.loanId   "
				+ "  FROM  "
				+ "   repayplandetail rpd "
				+ "  LEFT JOIN repayplan rp ON rp.id = rpd.repayPlanId  "
				+ "  GROUP BY rp.loanId) plan ON plan.loanId = li.uuid  "
				+ "   LEFT JOIN "
				+ "  (SELECT   "
				+ "   MAX(rpd.repayDate) AS end_date, rp.loanId "
				+ "  FROM  "
				+ "   repayplandetail rpd "
				+ "  LEFT JOIN repayplan rp ON rp.id = rpd.repayPlanId  "
				+ "  GROUP BY rp.loanId) planDate ON planDate.loanId = li.uuid  "
				+ "   LEFT JOIN "
				+ "  company co ON li.company_id = co.id  "
				+ "   LEFT JOIN "
				+ "  dept de ON li.dept_id = de.id  "
				+ " WHERE   "
				+ "  li.chargedoff_at is not null  ";

		if (param.get("endDate") != null && param.get("startDate") != null) {
			//开始日小于截止日
			sql += " and STR_TO_DATE(li.chargedoff_at,'%Y-%m-%d') BETWEEN STR_TO_DATE('" + param.get("startDate") + "','%Y-%m-%d') AND STR_TO_DATE('" + param.get("endDate") + "','%Y-%m-%d')";
		}
		if (param.get("responsible_cm_id") != null) {
			sql += "and li.responsible_cm_id='" + param.get("responsible_cm_id") + "' ";
		}
		if (param.get("companyId") != null) {
			sql += "and li.company_id='" + param.get("companyId") + "' ";
		}
		if (param.get("deptId") != null) {
			sql += "and li.dept_id='" + param.get("deptId") + "' ";
		}
		if (param.get("orderId") != null) {
			sql += "and li.contract_num like '%" + param.get("orderId") + "%' ";
		}
		if (param.get("customerName") != null) {
			sql += "and ci.customer_name like '%" + param.get("customerName") + "%' ";
		}


		if (param.get("data_access_level") != null) {
			if (Integer.valueOf(param.get("data_access_level").toString()) == 0)
				sql += "and 1=0";
			else if (Integer.valueOf(param.get("data_access_level").toString()) == 1)
				sql += "and li.responsible_cm_id=" + '"' + param.get("uuid") + '"';
			else if (Integer.valueOf(param.get("data_access_level").toString()) == 2)
				sql += "and li.dept_id=" + '"' + param.get("myDeptId") + '"';
			else if (Integer.valueOf(param.get("data_access_level").toString()) == 3)
				sql += " and li.company_id =" + '"' + param.get("mycompanyId") + '"';
		}
		sql += " order by contract_num desc";
			
		
			TodoPage todopage = new TodoPage();

			String countSQL="SELECT count(uuid),count(distinct(customer_id)),sum(bal_money),sum(in_money),sum(out_money) from ( "+ sql+" ) as t";

			int count=0;
			
			String OrderCount="";
			String CustomerCount="";
			String BalCount="";
			String InCount="";
			String OutCount="";
			
		   Connection conn = null;
		   ResultSet rs = null;
			try {
				conn = dbControl.getConnection();
				rs = dbControl.getData(conn,countSQL);
				while (rs.next()) {
					OrderCount=rs.getString(1);
					CustomerCount=rs.getString(2);
					BalCount=rs.getString(3);
					InCount=rs.getString(4);
					OutCount=rs.getString(5);
					count=Integer.parseInt(OrderCount);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				dbControl.close(conn,rs);
			}
			
			int totalcount = count;

			todopage.setTotalcount(totalcount);
			int totalpage = 0;
			boolean hasnext = false;
			boolean haslast = false;
			if (totalcount % pagecount == 0) {
				totalpage = totalcount / pagecount;
			} else {
				totalpage = totalcount / pagecount + 1;
			}
			if (totalpage > (currentPage + 1)) {
				hasnext = true;
			}
			if (currentPage > 0) {
				haslast = true;
			}
			todopage.setHaslast(haslast);
			todopage.setHasnext(hasnext);
			todopage.setCurrentpage(currentPage);
			todopage.setTotalpage(totalpage);
			List<Map<String, Object>> mapList = new ArrayList<>();
					if(param.get("noPage")==null){
						sql+=" limit " + (currentPage*pagecount) + ","+ pagecount   ;	
					}
					Map<String, Object> loanInfoMap = new HashMap<>();
					try {
						conn = dbControl.getConnection();
						rs = dbControl.getData(conn,sql);
						while (rs.next()) {
							loanInfoMap = new HashMap<>();
							loanInfoMap.put("uuid", rs.getString(1));
							loanInfoMap.put("startDate", rs.getString(2));
							loanInfoMap.put("endDate", rs.getString(3));
							loanInfoMap.put("customerId", rs.getString(4));
							loanInfoMap.put("customerName", rs.getString(5));
							loanInfoMap.put("responsibleName", rs.getString(6));
							loanInfoMap.put("accountIdNum", rs.getString(7));
							loanInfoMap.put("loanRate", rs.getString(8));
							loanInfoMap.put("outMoney", rs.getString(9));
							loanInfoMap.put("inMoney", rs.getString(10));
							loanInfoMap.put("balMoney", rs.getString(11));
							loanInfoMap.put("contractNo", rs.getString(12));
							loanInfoMap.put("companyName", rs.getString(13));
							loanInfoMap.put("deptName", rs.getString(14));
							loanInfoMap.put("buy_car_method", rs.getString(15));
							loanInfoMap.put("loan_product", rs.getString(16));
							loanInfoMap.put("pledgeType", rs.getString(17));
							loanInfoMap.put("repayWay", rs.getString(18));
							loanInfoMap.put("cnum", rs.getString(19));
							loanInfoMap.put("live_address", rs.getString(20));
							loanInfoMap.put("mobile", rs.getString(21));
							loanInfoMap.put("OrderCount", OrderCount);
							loanInfoMap.put("CustomerCount", CustomerCount);
							loanInfoMap.put("BalCount", BalCount);
							loanInfoMap.put("InCount", InCount);
							loanInfoMap.put("OutCount", OutCount);
							
							if (null != loanInfoMap.get("uuid")) {
								mapList.add(loanInfoMap);
							}
						}
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						dbControl.close(conn,rs);
					}
					
			todopage.setContextMap(mapList);
			return todopage;
	}


    @Override
    public TodoPage queryLoanIncomeCount(Integer currentPage, Integer pagecount , Map<String,Object> param) {

        String sql = "";


        sql = "SELECT "
                +"    li.uuid,"
                +"    date_add(li.begin_date, INTERVAL rpd.repayPeriod MONTH) as begin_date,"
                +"    planDate.end_date,"
                +"    li.customer_name,"
                +"    li.realname,"
                +"    li.id_card,"
                +"    li.loanRate,"
                +"    b.actualRepaymentCaptialSum,"
                +"    li.contractNum "
                +"FROM "
                +"    repayment a "
                +"        LEFT JOIN "
                +"    repaymenttransaction b ON a.uuid = b.repaymentId "
                +"        LEFT JOIN "
                +"    (SELECT  "
                +"        li.uuid AS uuid, "
                +"            CONCAT(ROUND(li.loan_rate / 12, 2), '%') AS loanRate, "
                +"            IFNULL(li.chargedoff_at, '-') AS begin_date, "
                +"            li.contract_num AS contract_num, "
                +"            li.responsible_cm_id AS responsible_cm_id, "
                +"            li.company_id AS company_id, "
                +"            li.contract_num AS contractNum, "
                +"            li.dept_id AS dept_id, "
                +"            ci.customer_name AS customer_name, "
                +"            ci.id_card AS id_card, "
                +"            u1.realname AS realname "
                +"    FROM "
                +"        loan_info li "
                +"    LEFT JOIN customer_register_info ci ON li.customer_id = ci.uuid "
                +"    LEFT JOIN user u1 ON li.responsible_cm_id = u1.uuid) li ON a.loanId = li.uuid "
                +"        LEFT JOIN "
                +"    (SELECT  "
                +"        MAX(rpd.repayDate) AS end_date, rp.loanId "
                +"    FROM "
                +"        repayplandetail rpd "
                +"    LEFT JOIN repayplan rp ON rp.id = rpd.repayPlanId "
                +"    GROUP BY rp.loanId) planDate ON planDate.loanId = a.loanId "
                +"        LEFT JOIN "
                +"        repayplandetail rpd on rpd.id = a.replanDetaiId "
                +"WHERE "
                +"    b.actualRepaymentCaptialSum IS NOT NULL "
                +"        AND b.actualRepaymentCaptialSum != 0 ";

        if (param.get("endDate") != null && param.get("startDate") != null) {
            //开始日小于截止日
            sql += " and date_add(li.begin_date, INTERVAL rpd.repayPeriod MONTH) BETWEEN STR_TO_DATE('" + param.get("startDate") + "','%Y-%m-%d') AND STR_TO_DATE('" + param.get("endDate") + "','%Y-%m-%d')";
        }
        if (param.get("responsible_cm_id") != null) {
            sql += "and li.responsible_cm_id='" + param.get("responsible_cm_id") + "' ";
        }
        if (param.get("companyId") != null) {
            sql += "and li.company_id='" + param.get("companyId") + "' ";
        }
        if (param.get("deptId") != null) {
            sql += "and li.dept_id='" + param.get("deptId") + "' ";
        }
        if (param.get("orderId") != null) {
            sql += "and li.contract_num like '%" + param.get("orderId") + "%' ";
        }
        if (param.get("customerName") != null) {
            sql += "and li.customer_name like '%" + param.get("customerName") + "%' ";
        }


        if (param.get("data_access_level") != null) {
            if (Integer.valueOf(param.get("data_access_level").toString()) == 0)
                sql += "and 1=0";
            else if (Integer.valueOf(param.get("data_access_level").toString()) == 1)
                sql += "and li.responsible_cm_id=" + '"' + param.get("uuid") + '"';
            else if (Integer.valueOf(param.get("data_access_level").toString()) == 2)
                sql += "and li.dept_id=" + '"' + param.get("myDeptId") + '"';
            else if (Integer.valueOf(param.get("data_access_level").toString()) == 3)
                sql += " and li.company_id =" + '"' + param.get("mycompanyId") + '"';
        }
        sql += " order by li.contract_num desc";


        TodoPage todopage = new TodoPage();

        String countSQL="SELECT count(distinct(contractNum)) from ( "+ sql+" ) as t";

        int count=0;

        String OrderCount="";
        String CustomerCount="";
        String BalCount="";
        String InCount="";
        String OutCount="";

        Connection conn = null;
        ResultSet rs = null;
        try {
            conn = dbControl.getConnection();
            rs = dbControl.getData(conn,countSQL);
            while (rs.next()) {
                OrderCount=rs.getString(1);
                count=Integer.parseInt(OrderCount);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbControl.close(conn,rs);
        }

        int totalcount = count;

        todopage.setTotalcount(totalcount);
        int totalpage = 0;
        boolean hasnext = false;
        boolean haslast = false;
        if (totalcount % pagecount == 0) {
            totalpage = totalcount / pagecount;
        } else {
            totalpage = totalcount / pagecount + 1;
        }
        if (totalpage > (currentPage + 1)) {
            hasnext = true;
        }
        if (currentPage > 0) {
            haslast = true;
        }
        todopage.setHaslast(haslast);
        todopage.setHasnext(hasnext);
        todopage.setCurrentpage(currentPage);
        todopage.setTotalpage(totalpage);
        List<Map<String, Object>> mapList = new ArrayList<>();
        if(param.get("noPage")==null){
            sql+=" limit " + (currentPage*pagecount) + ","+ pagecount   ;
        }
        Map<String, Object> loanInfoMap = new HashMap<>();
        try {
            conn = dbControl.getConnection();
            rs = dbControl.getData(conn,sql);
            while (rs.next()) {
                loanInfoMap = new HashMap<>();
                loanInfoMap.put("uuid", rs.getString(1));
                loanInfoMap.put("begin_date", rs.getString(2));
                loanInfoMap.put("end_date", rs.getString(3));
                loanInfoMap.put("customer_name", rs.getString(4));
                loanInfoMap.put("realname", rs.getString(5));
                loanInfoMap.put("id_card", rs.getString(6));
                loanInfoMap.put("loanRate", rs.getString(7));
                loanInfoMap.put("actualRepaymentCaptialSum", rs.getString(8));
                loanInfoMap.put("contract_num", rs.getString(9));

                if (null != loanInfoMap.get("uuid")) {
                    mapList.add(loanInfoMap);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbControl.close(conn,rs);
        }

        todopage.setContextMap(mapList);
        return todopage;
    }


	
	@Override
	public TodoPage queryIncomeCount(Integer currentPage, Integer pagecount , Map<String,Object> param) {

			String sql = "";
			

			sql="SELECT "
					+"    li.orderid AS contract_num, "
					+"    ci.customer_name, "
					+"    plan.repayCapital, "
					+"    IFNULL(li.chargedoff_at, '-') AS start_date, "
					+"    plan.repayPeriod, "
					+"    plan.end_date, "
					+"    IFNULL(rpt.actualRepaymentCaptialSum, 0) AS actualRepaymentCaptialSum, "
					+"    IFNULL(rpt.actualRepaymentInterestSum, 0) AS actualRepaymentInterestSum, "
					+"    IFNULL(rpt.serviceFee + rpd_zero.serviceFee, 0) AS serviceFee, "
					+"    IFNULL(rpt.cashdepositFee + rpd_zero.cashdepositFee, 0) AS cashdepositFee, "
					+"    IFNULL(rpt.overdueFee + rpd_zero.overdueFee, 0) AS overdueFee, "
					+"    IFNULL(rpt.parkCost + rpd_zero.parkCost, 0) AS parkCost, "
					+"    IFNULL(rpt.gpsCost + rpd_zero.gpsCost, 0) AS gpsCost, "
					+"    IFNULL(rpt.checkCost + rpd_zero.checkCost, 0) AS checkCost, "
					+"    IFNULL(rpt.actualRepaymentInterestSum + rpt.actualManageFee + rpd_zero.repayTotal,0) AS totalIncome, "
					+"    li.uuid, "
					+"    IFNULL(rpt.penaltyFee + rpd_zero.penaltyFee, 0) AS penaltyFee, "
					+"    IFNULL(rpt.drunkDrive + rpd_zero.drunkDrive, 0) AS drunkDrive, "
					+"    IFNULL(rpt.towCost + rpd_zero.towCost, 0) AS towCost, "
					+"    li.contract_num as cnum,li.customer_id "
					+"FROM "
					+"    loan_info li "
					+"        LEFT JOIN "
					+"    (SELECT  "
					+"        SUM(IFNULL(rpt.actualRepaymentCaptialSum, 0)) AS actualRepaymentCaptialSum, "
					+"            SUM(IFNULL(rpt.actalRepaymentFee, 0)) AS actalRepaymentFee, "
					+"            SUM(IFNULL(rpt.actualRepaymentInterestSum, 0)) AS actualRepaymentInterestSum, "
					+"            SUM(IFNULL(rpt.actualRepaymentSum, 0)) AS actualRepaymentSum, "
					+"            SUM(IFNULL(CAST(JSON_EXTRACT(rpt.actalRepaymentFee, '$.depreciationFee') AS DECIMAL), 0)) AS serviceFee, "
					+"            SUM(IFNULL(CAST(JSON_EXTRACT(rpt.actalRepaymentFee, '$.cashdepositFee') AS DECIMAL), 0)) AS cashdepositFee, "
					+"            SUM(IFNULL(CAST(JSON_EXTRACT(rpt.actalRepaymentFee, '$.overdueFee') AS DECIMAL), 0)) AS overdueFee, "
					+"            SUM(IFNULL(CAST(JSON_EXTRACT(rpt.actalRepaymentFee, '$.gpsCost') AS DECIMAL), 0)) AS gpsCost, "
					+"            SUM(IFNULL(CAST(JSON_EXTRACT(rpt.actalRepaymentFee, '$.checkCost') AS DECIMAL), 0)) AS checkCost, "
					+"            SUM(IFNULL(CAST(JSON_EXTRACT(rpt.actalRepaymentFee, '$.parkCost') AS DECIMAL), 0)) AS parkCost, "
					+"            SUM(IFNULL(CAST(JSON_EXTRACT(rpt.actalRepaymentFee, '$.penaltyFee') AS DECIMAL), 0)) AS penaltyFee, "
					+"            SUM(IFNULL(CAST(JSON_EXTRACT(rpt.actalRepaymentFee, '$.drunkDrive') AS DECIMAL), 0)) AS drunkDrive, "
					+"            SUM(IFNULL(CAST(JSON_EXTRACT(rpt.actalRepaymentFee, '$.towCost') AS DECIMAL), 0)) AS towCost, "
					+"            SUM(IFNULL(CAST(JSON_EXTRACT(rpt.actalRepaymentFee, '$.manageFee') AS DECIMAL), 0) + IFNULL(CAST(JSON_EXTRACT(rpt.actalRepaymentFee, '$.gpsCost') AS DECIMAL), 0)  "
					+"						+ IFNULL(CAST(JSON_EXTRACT(rpt.actalRepaymentFee, '$.parkCost') AS DECIMAL), 0) + IFNULL(CAST(JSON_EXTRACT(rpt.actalRepaymentFee, '$.towCost') AS DECIMAL), 0)  "
					+"                        + IFNULL(CAST(JSON_EXTRACT(rpt.actalRepaymentFee, '$.checkCost') AS DECIMAL), 0) + IFNULL(CAST(JSON_EXTRACT(rpt.actalRepaymentFee, '$.depreciationFee') AS DECIMAL), 0) "
					+"                        + IFNULL(CAST(JSON_EXTRACT(rpt.actalRepaymentFee, '$.drunkDrive') AS DECIMAL), 0) + IFNULL(CAST(JSON_EXTRACT(rpt.actalRepaymentFee, '$.cashdepositFee') AS DECIMAL), 0) "
					+"                        + IFNULL(CAST(JSON_EXTRACT(rpt.actalRepaymentFee, '$.certificatefee') AS DECIMAL), 0) + IFNULL(CAST(JSON_EXTRACT(rpt.actalRepaymentFee, '$.overdueFee') AS DECIMAL), 0)  "
					+"                        + IFNULL(CAST(JSON_EXTRACT(rpt.actalRepaymentFee, '$.visitCost') AS DECIMAL), 0) + IFNULL(CAST(JSON_EXTRACT(rpt.actalRepaymentFee, '$.penaltyFee') AS DECIMAL), 0)) AS actualManageFee, "
					+"            rp.loanId AS loanId "
					+"    FROM "
					+"        repayment rp "
					+"    LEFT JOIN repaymenttransaction rpt ON rpt.repaymentId = rp.uuid "
					+"    LEFT JOIN repayplandetail rpd ON rpd.id = rp.replanDetaiId "
					+"    WHERE 1 = 1 ";
					if(param.get("endDate")!=null&&param.get("startDate")!=null)
					{
					    //贷款日小于截止日,大于开始日
						sql+="  AND rpt.createDay BETWEEN STR_TO_DATE('"+param.get("startDate")+"', '%Y-%m-%d') AND STR_TO_DATE('"+param.get("endDate")+"', '%Y-%m-%d') ";
					}				
					sql+="   AND rpd.repayPeriod != '0' GROUP BY rp.loanId ) rpt ON rpt.loanId = li.uuid "
					+"		LEFT JOIN customer_register_info ci ON li.customer_id = ci.uuid "
					+" LEFT JOIN ( SELECT "
					+ "IFNULL(CAST(JSON_EXTRACT (rpt.actalRepaymentFee,'$.depreciationFee') AS DECIMAL),0) AS serviceFee,"
					+" IFNULL(CAST(JSON_EXTRACT (rpt.actalRepaymentFee,'$.cashdepositFee') AS DECIMAL),0) AS cashdepositFee,"
					+" IFNULL(CAST(JSON_EXTRACT (rpt.actalRepaymentFee,'$.overdueFee') AS DECIMAL),0) AS overdueFee,"
					+" IFNULL(CAST(JSON_EXTRACT (rpt.actalRepaymentFee,'$.gpsCost') AS DECIMAL),0) AS gpsCost,"
					+" IFNULL(CAST(JSON_EXTRACT (rpt.actalRepaymentFee,'$.checkCost') AS DECIMAL),0) AS checkCost,"
					+" IFNULL(CAST(JSON_EXTRACT (rpt.actalRepaymentFee,'$.parkCost') AS DECIMAL),0) AS parkCost,"
					+" IFNULL(CAST(JSON_EXTRACT (rpt.actalRepaymentFee,'$.penaltyFee') AS DECIMAL),0) AS penaltyFee,"
					+" IFNULL(CAST(JSON_EXTRACT (rpt.actalRepaymentFee,'$.drunkDrive') AS DECIMAL),0) AS drunkDrive,"
					+" IFNULL(CAST(JSON_EXTRACT (rpt.actalRepaymentFee,'$.towCost') AS DECIMAL),0) AS towCost,"
					+" rpt.actualRepaymentSum AS repayTotal,rp.loanId "
					+" FROM repayplandetail rpd_zero "
					+" INNER JOIN repayment rp ON rpd_zero.id = rp.replanDetaiId "
					+" INNER JOIN repaymenttransaction rpt ON rpt.repaymentId = rp.uuid "
					+" WHERE rpd_zero.repayPeriod = '0' )rpd_zero ON rpd_zero.loanId = li.uuid "
					+"        LEFT JOIN (SELECT MAX(rpd.repayDate) AS end_date,rp.loanId,MAX(rpd.repayPeriod) as repayPeriod,SUM(IFNULL(rpd.repayCapital, 0)) AS repayCapital "
					+"					FROM repayplandetail rpd "
					+"						LEFT JOIN repayplan rp ON rp.id = rpd.repayPlanId "
					+"						GROUP BY rp.loanId) plan ON plan.loanId = li.uuid "
					+"WHERE "
					+"    li.chargedoff_at IS NOT NULL ";

					if(param.get("endDate")!=null&&param.get("startDate")!=null)
				   {
					   //开始日小于截止日
					   sql+=" and STR_TO_DATE(li.chargedoff_at,'%Y-%m-%d') BETWEEN STR_TO_DATE('"+param.get("startDate")+"','%Y-%m-%d') AND STR_TO_DATE('"+param.get("endDate")+"','%Y-%m-%d')";
				   }
				   if(param.get("orderNo")!=null)
				   {
					   sql+="and li.contract_num like '%"+param.get("orderNo")+"%' ";
				   }
				   if(param.get("customerName")!=null)
				   {
					   sql+="and ci.customer_name like '%"+param.get("customerName")+"%' ";
				   }
				   if(param.get("uuid")!=null)
				   {
					   sql+="and li.uuid = '"+param.get("uuid")+"' ";
				   }
					if(param.get("data_access_level") != null){
						if(Integer.valueOf(param.get("data_access_level").toString()) == 0)
							sql += "and 1=0";
						else if (Integer.valueOf(param.get("data_access_level").toString()) == 1)
							sql += "and li.responsible_cm_id="+ '"' + param.get("uuid") + '"';
						else if(Integer.valueOf(param.get("data_access_level").toString()) == 2)
							sql += "and li.dept_id="+ '"' + param.get("myDeptId") + '"';
						else if(Integer.valueOf(param.get("data_access_level").toString()) == 3)
							sql+= " and li.company_id ="+ '"' + param.get("mycompanyId") + '"';
					}	
					sql+=" order by contract_num desc";
			
		
			TodoPage todopage = new TodoPage();

			String countSQL="SELECT count(*) from ( "+ sql+" ) as t";

			int count=0;
			
			
		   Connection conn = null;
		   ResultSet rs = null;
			try {
				conn = dbControl.getConnection();
				rs = dbControl.getData(conn,countSQL);
				while (rs.next()) {
					count=Integer.parseInt(rs.getString(1));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				dbControl.close(conn,rs);
			}
			
			int totalcount = count;

			todopage.setTotalcount(totalcount);
			int totalpage = 0;
			boolean hasnext = false;
			boolean haslast = false;
			if (totalcount % pagecount == 0) {
				totalpage = totalcount / pagecount;
			} else {
				totalpage = totalcount / pagecount + 1;
			}
			if (totalpage > (currentPage + 1)) {
				hasnext = true;
			}
			if (currentPage > 0) {
				haslast = true;
			}
			todopage.setHaslast(haslast);
			todopage.setHasnext(hasnext);
			todopage.setCurrentpage(currentPage);
			todopage.setTotalpage(totalpage);
			List<Map<String, Object>> mapList = new ArrayList<>();
					if(param.get("noPage")==null){
						sql+=" limit " + (currentPage*pagecount) + ","+ pagecount   ;	
					}
					Map<String, Object> loanInfoMap = new HashMap<>();
					try {
						conn = dbControl.getConnection();
						rs = dbControl.getData(conn,sql);
						while (rs.next()) {
							loanInfoMap = new HashMap<>();
							loanInfoMap.put("contract_num", rs.getString(1));
							loanInfoMap.put("customer_name", rs.getString(2));
							loanInfoMap.put("repayCapital", rs.getString(3));
							loanInfoMap.put("start_date", rs.getString(4));
							loanInfoMap.put("repayPeriod", rs.getString(5));
							loanInfoMap.put("end_date", rs.getString(6));
							loanInfoMap.put("actualRepaymentCaptialSum", rs.getString(7));
							loanInfoMap.put("actualRepaymentInterestSum", rs.getString(8));
							loanInfoMap.put("serviceFee", rs.getString(9));
							loanInfoMap.put("cashdepositFee", rs.getString(10));
							loanInfoMap.put("overdueFee", rs.getString(11));
							loanInfoMap.put("parkCost", rs.getString(12));
							loanInfoMap.put("gpsCost", rs.getString(13));
							loanInfoMap.put("checkCost", rs.getString(14));
							loanInfoMap.put("totalIncome", rs.getString(15));
							loanInfoMap.put("uuid", rs.getString(16));
							loanInfoMap.put("penaltyFee", rs.getString(17));
							loanInfoMap.put("drunkDrive", rs.getString(18));
							loanInfoMap.put("towCost", rs.getString(19));
							loanInfoMap.put("cnum", rs.getString(20));
							loanInfoMap.put("customerId", rs.getString(21));
							if (null != loanInfoMap.get("contract_num")) {
								mapList.add(loanInfoMap);
							}
						}
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						dbControl.close(conn,rs);
					}
					
			todopage.setContextMap(mapList);
			return todopage;
	}

	private String getDateAccessLevel(String dataAccessLevel,Map<String, Object> param){
		String sql = "";
		if(dataAccessLevel != null && dataAccessLevel != ""){
			switch(dataAccessLevel.toString()){
				case "0":
					sql += "and 1=0";
					break;
				case "1":
					sql += "and li.responsible_cm_id="+ '"' + param.get("uuid") + '"';
					break;
				case "2":
					sql += "and li.dept_id="+ '"' + param.get("myDeptId") + '"';
					break;
				case "3":
					sql+= " and li.company_id ="+ '"' + param.get("mycompanyId") + '"';
					break;
			}
		}
		return sql;
	}
	public TodoPage queryTaskByActivitiName(String userId, Integer currentPage,
											Integer pagecount, WorkFlowType[] keys, String activityName, Map<String,Object> param){
		TodoPage todopage = new TodoPage();
		List<Task> tasklist = new ArrayList<>();
		//参数检验
		if (activityName == null){
			return todopage;
		}
		if (keys != null){
			for (int i = 0; i < keys.length; i++) {
				List<Task> taskCandidates = taskService.createTaskQuery().processDefinitionKey(keys[i].toString())
						.taskDefinitionKey(activityName)
						.taskCandidateUser(userId).orderByTaskPriority().desc().list();
				List<Task> taskAssigness = taskService.createTaskQuery().processDefinitionKey(keys[i].toString())
						.taskDefinitionKey(activityName)
						.taskAssignee(userId).orderByTaskPriority().desc().list();
				todopage.setNoloanorder(taskCandidates.size());
				tasklist.addAll(taskCandidates);
				tasklist.addAll(taskAssigness);
			}
		}else{
			List<Task> taskCandidates = taskService.createTaskQuery().taskDefinitionKey(activityName).taskCandidateUser(userId).orderByTaskPriority().desc().list();
			List<Task> taskAssigness = taskService.createTaskQuery().taskDefinitionKey(activityName).taskAssignee(userId).orderByTaskPriority().desc().list();
			todopage.setNoloanorder(taskCandidates.size());
			tasklist.addAll(taskCandidates);
			tasklist.addAll(taskAssigness);
		}

		List<TodoVO> list = new ArrayList<TodoVO>();
		List<Map<String, Object>> mapList = new ArrayList<>();
		Map<String,Object> taskMap = new HashMap<String,Object>();
		Map<String,Object> piMap = new HashMap<String,Object>();
		String sqlin = " in (";
		int listsize = 0;
		//如果没有贷前订单的情况下，则不进行查询。
		boolean hasdata = false;

		for (int i = 0; i < tasklist.size(); i++) {
			if (i < tasklist.size()) {
				Task task = tasklist.get(i);
				String processinsId = task.getProcessInstanceId();
				String processdifineId = task.getProcessDefinitionId();
				hasdata = true;
				ProcessInstance pi = runtimeService.createProcessInstanceQuery().processInstanceId(processinsId)
						.singleResult();
				String businesskey = pi.getBusinessKey();

				taskMap.put(businesskey, task);
				piMap.put(businesskey, pi);
				if(!sqlin.contains(businesskey)){
					if(0 != listsize){
						sqlin +=",";
					}
					sqlin += "'";
					sqlin += businesskey;
					sqlin += "'";
					listsize++;
				}
			}
		}
		sqlin += ")";
		int totalcount = 0;
		int start = currentPage * pagecount;

		if (hasdata == true){
			String	sqlcontent = "select ci.customer_name,li.id_card,li.orderid,li.uuid,li.pledge_type,"
					+ " li.loan_status, li.created_at,u1.realname as create_by,u3.realname as principal_name,li.customer_id,"
					+ " ci.is_important,li.state";
			String sqlcount = " select count(1) ";
			String sqlcondition = " from loan_info li LEFT JOIN customer_register_info ci ON "
					+ " li.customer_id = ci.uuid "
					+ " LEFT JOIN user u1 ON li.responsible_cm_id = u1.uuid"
					+ " LEFT JOIN dept de ON li.dept_id = de.id"
					+ " LEFT JOIN user u3 ON u3.uuid = de.principal_id"
					+ " where li.uuid " + sqlin;
			if (param.get("orderNo") != null) {
				sqlcondition += " and li.orderid like concat('%','" + param.get("orderNo") + "','%')";
			}
			if (param.get("customerName") != null) {
				sqlcondition += " and ci.customer_name like concat('%','" + param.get("customerName") + "','%')";
			}
			if (param.get("customerManage") != null) {
				sqlcondition += " and u3.realname like concat('%','" + param.get("customerManage") + "','%')";
			}
			if (param.get("pledgeType") != null) {
				sqlcondition += " and li.pledge_type = " + '"' + param.get("pledgeType") + '"';
			}
			if (param.get("loanStatus") != null) {
				if(param.get("loanStatus").equals("dataReview")){
					sqlcondition += " and li.loan_status = "+"'dataReview'"+"or li.loan_status ="+"'reuploadInformatin'";
				}else{
					sqlcondition += " and li.loan_status = " + '"' + param.get("loanStatus") + '"';
				}
			}
			if(param.get("data_access_level") != null){
				if(Integer.valueOf(param.get("data_access_level").toString()) == 0)
					sqlcondition += "and 1=0";
				else if (Integer.valueOf(param.get("data_access_level").toString()) == 1)
					sqlcondition += "and li.responsible_cm_id="+ '"' + param.get("uuid") + '"';
				else if(Integer.valueOf(param.get("data_access_level").toString()) == 2)
					sqlcondition += "and li.dept_id="+ '"' + param.get("myDeptId") + '"';
				else if(Integer.valueOf(param.get("data_access_level").toString()) == 3)
					sqlcondition+= " and li.company_id ="+ '"' + param.get("mycompanyId") + '"';
			}
			sqlcondition += " order by li.orderid desc";

			String sql = sqlcontent+sqlcondition+" limit "+String.valueOf(start) + ","+ String.valueOf(pagecount);
			String sqltotal = sqlcount + sqlcondition;

			TodoVO vo = new TodoVO();
			Map<String, Object> loanInfoMap = new HashMap<>();
			Connection conn = null;
			ResultSet rs = null;
			//取得总list数目
			try {
				if(StringUtils.isNotEmpty(sqltotal)){
					conn = dbControl.getConnection();
					rs = dbControl.getData(conn,sqltotal);
				}
				while (rs.next()) {
					totalcount = rs.getInt(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				dbControl.close(conn, rs);
			}

			Date dt3= new Date();
			Long endtime2= dt3.getTime();//这就是距离1970年1月1日0点0分0秒的毫秒数

			// 追加判断是否显示再助贷信息
			String isReloanAndHelploanDis = "";
			if("y".equals(ParamterControl.RELOANANDHELPLOAN_DISPLAY)){
				isReloanAndHelploanDis = "y";
			}
			try {
				if(StringUtils.isNotEmpty(sql)){
					conn = dbControl.getConnection();
					rs = dbControl.getData(conn,sql);
				}
				while (rs.next()) {
					loanInfoMap = new HashMap<>();
					loanInfoMap.put("customerName", rs.getString(1));
					loanInfoMap.put("idCard", rs.getString(2));
					loanInfoMap.put("orderid", rs.getString(3));
					loanInfoMap.put("uuid", rs.getString(4));
					loanInfoMap.put("pledgeType", rs.getString(5));
					loanInfoMap.put("loanStatus", rs.getString(6));
					loanInfoMap.put("createdAt", rs.getString(7));
					loanInfoMap.put("createBy", rs.getString(8));
					loanInfoMap.put("principalName", rs.getString(9));
					loanInfoMap.put("customerId", rs.getString(10));
					loanInfoMap.put("isImportant", rs.getString(11));
					loanInfoMap.put("state", rs.getString(12));
					vo.setLoanInfoMap(loanInfoMap);
					String uuid = rs.getString(4);

					Task task = (Task)taskMap.get(uuid);
					String businesskey = uuid;
					String processinsId = task.getProcessInstanceId();
					String processdifineId = task.getProcessDefinitionId();
					ProcessInstance pi =(ProcessInstance)piMap.get(uuid);
					ProcessDefinition pd = repositoryService.createProcessDefinitionQuery()
							.processDefinitionId(processdifineId).singleResult();
					vo.setProcessdefine(pd);
					vo.setProcessins(pi);
					vo.setTask(task);
					loanInfoMap.put("assignee", task.getAssignee());
					loanInfoMap.put("taskId", task.getId());
					vo.setProcessinsId(processinsId);
					loanInfoMap.put("processinsId", processinsId);
					vo.setTaskName(task.getName());
					loanInfoMap.put("taskName", task.getName());
					vo.setSuspendedStatus(pi.isSuspended());
					loanInfoMap.put("suspendedStatus", pi.isSuspended());
					vo.setTaskId(task.getId());
					loanInfoMap.put("taskId", task.getId());
					vo.setProcessDefineId(processdifineId);
					loanInfoMap.put("processDefineId", processdifineId);
					vo.setBusinesskey(businesskey);
					loanInfoMap.put("businesskey", businesskey);
					loanInfoMap.put("activityId", pi.getActivityId());
					boolean assigneeStatus = false;
					if (null == task.getAssignee()) {
						assigneeStatus = true;
					}
					vo.setAssigneeStatus(assigneeStatus);
					loanInfoMap.put("assigneeStatus", assigneeStatus);
					vo.setTaskCreateTime(task.getCreateTime());
					loanInfoMap.put("taskCreateTime", task.getCreateTime());
					TodoInsEntity todoInsEntity = todoInService.findBybusinesskey(businesskey);
					String business = todoInsEntity.getBusiness();
					TodoDefineEntity todoDefineEntity = todoDefineService.findByBusiness(business);

					loanInfoMap.put("noloanorder", todopage.getNoloanorder());
					String column1 = rs.getString(1);
					String column2 = rs.getString(2);
					String businessvalues = todoDefineEntity.getBusinessvalue();
					vo.setColumn1(column1);
					vo.setColumn2(column2);
					vo.setBusinessvalue(businessvalues);
					loanInfoMap.put("businessvalue", businessvalues);
					loanInfoMap.put("ReloanAndHelploanDis", isReloanAndHelploanDis);
					mapList.add(loanInfoMap);
					list.add(vo);

				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				dbControl.close(conn, rs);
			}
		}
		todopage.setTotalcount(totalcount);
		int totalpage = 0;
		boolean hasnext = false;
		boolean haslast = false;


		int end = 0;
		if (totalcount % pagecount == 0) {
			totalpage = totalcount / pagecount;
		} else {
			totalpage = totalcount / pagecount + 1;
		}
		if (totalpage > (currentPage + 1)) {
			hasnext = true;
		}
		if (currentPage > 0) {
			haslast = true;
		}
		todopage.setHaslast(haslast);
		todopage.setHasnext(hasnext);
		todopage.setCurrentpage(currentPage);
		todopage.setTotalpage(totalpage);

		if ((currentPage + 1) < totalpage) {
			end = (currentPage + 1) * pagecount;
		}else if((currentPage + 1) == totalpage&&(totalcount % pagecount)==0){
			end = (currentPage + 1) * pagecount;
		} else {
			end = start + (totalcount % pagecount);
		}
		if (totalpage == 1) {
			end =mapList.size();
		}

		todopage.setContext(list);
		todopage.setContextMap(mapList);
		return todopage;
	}
	
	/**
	 * 货前待办excel
	 */
	public List<Map<String, Object>> queryloanInfoListCYB (String userId, WorkFlowType[] keys, Map<String,Object> param){

		List<Task> tasklist = new ArrayList<>();
		for (int i = 0; i < keys.length; i++) {
			List<Task> taskCandidates = taskService.createTaskQuery().processDefinitionKey(keys[i].toString())
					.taskCandidateUser(userId) // 对指定用户的可接取的公共任务执行查询
					.orderByTaskPriority().desc().list();
			List<Task> taskAssigness = taskService.createTaskQuery().processDefinitionKey(keys[i].toString())
					.taskAssignee(userId) // 对指定用户的未完成的个人任务执行查询
					.orderByTaskPriority().desc().list();
			tasklist.addAll(taskCandidates);
			tasklist.addAll(taskAssigness);
		}
		List<Map<String, Object>> mapList = new ArrayList<>();
		String sqlin = " in (";
		int listsize = 0;
		//如果没有贷前订单的情况下，则不进行查询。
		boolean hasdata = false;
		for (int i = 0; i < tasklist.size(); i++) {
			if (i < tasklist.size()) {
				Task task = tasklist.get(i);
				String processinsId = task.getProcessInstanceId();
				String processdifineId = task.getProcessDefinitionId();
				if(!processdifineId.contains(WorkFlowType.vehiclesLoans.toString())){
					continue;
				}
				hasdata = true;
				ProcessInstance pi = runtimeService.createProcessInstanceQuery().processInstanceId(processinsId)
						.singleResult();
				String businesskey = pi.getBusinessKey();
				if(!sqlin.contains(businesskey)){
					if(0 != listsize){
						sqlin +=",";
					}
					sqlin += "'";
					sqlin += businesskey;
					sqlin += "'";
					listsize++;
				}
			}
		}
		sqlin += ")";
		if (hasdata == true){
			String	sqlcontent = "select ci.customer_name,li.id_card,li.orderid,li.uuid,li.pledge_type,"
					+ " li.loan_status, li.created_at,u1.realname as create_by,u3.realname as principal_name,li.customer_id,"
					+ " ci.is_important,li.state";
			String sqlcondition = " from loan_info li LEFT JOIN customer_register_info ci ON "
					+ " li.customer_id = ci.uuid "
					+ " LEFT JOIN user u1 ON li.responsible_cm_id = u1.uuid"
					+ " LEFT JOIN dept de ON li.dept_id = de.id"
					+ " LEFT JOIN user u3 ON u3.uuid = de.principal_id"
					+ " where li.uuid " + sqlin;
			if (param.get("orderNo") != null) {
				sqlcondition += " and li.orderid like concat('%','" + param.get("orderNo") + "','%')";
			}
			if (param.get("customerName") != null) {
				sqlcondition += " and ci.customer_name like concat('%','" + param.get("customerName") + "','%')";
			}
			if (param.get("customerManage") != null) {
				sqlcondition += " and u3.realname like concat('%','" + param.get("customerManage") + "','%')";
			}
			if (param.get("pledgeType") != null) {
				sqlcondition += " and li.pledge_type = " + '"' + param.get("pledgeType") + '"';
			}
			if (param.get("loanStatus") != null) {
				if(param.get("loanStatus").equals("dataReview")){
					sqlcondition += " and li.loan_status = "+"'dataReview'"+"or li.loan_status ="+"'reuploadInformatin'";
				}else{
				sqlcondition += " and li.loan_status = " + '"' + param.get("loanStatus") + '"';
				}
			}
			sqlcondition += " order by li.orderid desc";
			String sql = sqlcontent + sqlcondition;
			Map<String, Object> loanInfoMap = null;
			Connection conn = null;
			ResultSet rs = null;
			try{
			if(!StringUtils.isEmpty(sql)){
				conn =dbControl.getConnection();
				rs = dbControl.getData(conn, sql);	
			}
			while(rs.next()){
				loanInfoMap = new HashMap<>();
				loanInfoMap.put("customerName", rs.getString(1));
				loanInfoMap.put("idCard", rs.getString(2));
				loanInfoMap.put("orderid", rs.getString(3));
				loanInfoMap.put("uuid", rs.getString(4));
				loanInfoMap.put("pledgeType", rs.getString(5));
				loanInfoMap.put("loanStatus", rs.getString(6));
				loanInfoMap.put("createdAt", rs.getString(7));
				loanInfoMap.put("createBy", rs.getString(8));
				loanInfoMap.put("principalName", rs.getString(9));
				loanInfoMap.put("customerId", rs.getString(10));
				loanInfoMap.put("isImportant", rs.getString(11));
				loanInfoMap.put("state", rs.getString(12));
				mapList.add(loanInfoMap);
			}
			}catch(Exception e){
				e.printStackTrace();
			}finally {
				dbControl.close(conn, rs);
			}			
		}
		return mapList;
	}
	/**
	 * 货后待办excel
	 */
	public List<Map<String, Object>> queryloanAfterList (String userId, WorkFlowType[] keys, Map<String,Object> param){
		List<Task> tasklist = new ArrayList<>();
		for (int i = 0; i < keys.length; i++) {
			List<Task> taskCandidates = taskService.createTaskQuery().processDefinitionKey(keys[i].toString())
					.taskCandidateUser(userId) // 对指定用户的可接取的公共任务执行查询
					.orderByTaskPriority().desc().list();
			List<Task> taskAssigness = taskService.createTaskQuery().processDefinitionKey(keys[i].toString())
					.taskAssignee(userId) // 对指定用户的未完成的个人任务执行查询
					.orderByTaskPriority().desc().list();
			tasklist.addAll(taskCandidates);
			tasklist.addAll(taskAssigness);
		}
			List<Map<String, Object>> mapList = new ArrayList<>();
			for (int i = 0; i < tasklist.size(); i++) {
				if (i < tasklist.size()) {
					Task task = tasklist.get(i);
					String processinsId = task.getProcessInstanceId();
					String processdifineId = task.getProcessDefinitionId();
					ProcessInstance pi = runtimeService.createProcessInstanceQuery().processInstanceId(processinsId)
							.singleResult();
					ProcessDefinition pd = repositoryService.createProcessDefinitionQuery()
							.processDefinitionId(processdifineId).singleResult();

					String key = pd.getKey();
					String businesskey = pi.getBusinessKey();
					TodoInsEntity todoInsEntity = todoInService.findBybusinesskey(businesskey);
					String business = todoInsEntity.getBusiness();
					TodoDefineEntity todoDefineEntity = todoDefineService.findByBusiness(business);
					String sql = "";

					if (key.equals(WorkFlowType.paymentCollection.toString())||key.equals(WorkFlowType.paymentCollection_cyb.toString())) {
						if (!task.getName().equals("等待催收")) {
							//逾期
							if(param.get("pledgeType") != null && param.get("pledgeType").equals("yuqi")){ //逾期
								String[] taskNames = {"逾期处理","风控逾期处理","风控二次处理","申请调整罚息","罚息处理","已拖车","坏账归档处理","坏账申请"};
								if(checkTaskName(taskNames,task.getName())){
									
								}else{
									continue;
								}
							}else if(param.get("pledgeType") != null && param.get("pledgeType").equals("repayment")){ //待还款
								String[] taskNames = {"还款","正常还款审核","续借还款审核","提前还款审核","续借手续处理","借款展期续借","续借处理","还款催收"};
								if(checkTaskName(taskNames,task.getName())){
									
								}else{
									continue;
								}
							}
							sql = "select " + " rep." + todoDefineEntity.getProperty() + "," + " rep."
									+ todoDefineEntity.getProperty2() + ","
									+ " li.orderid,u1.realname as create_by,u3.realname as principal_name,ci.customer_name, "
									+ " rpd.repayPeriod,rpd.repayDate,rpd.repayTotal,rpd.gpsCost,rpd.manageFee,li.loan_status,li.uuid, "
									+ " li.state,ci.is_important,rep.uuid as repId,li.customer_id,IFNULL(rep.is_overdue,0) " + " from "
									+ todoDefineEntity.getTablename() + " rep "
									+ " left join loan_info li on li.uuid = rep.loanId "
									+ " left join customer_register_info ci on li.customer_id = ci.uuid "
									+ " left join user u1 ON li.responsible_cm_id = u1.uuid "
									+ " left join dept de ON li.dept_id = de.id "
									+ " left join user u3 ON u3.uuid = de.principal_id "
									+ " left join repayplandetail rpd on rpd.id = rep.replanDetaiId " + " where " + " rep."
									+ todoDefineEntity.getBusinesskeyname() + "='" + businesskey + "'";
							if (param.get("orderNo") != null) {
								sql += " and li.orderid like concat('%','" + param.get("orderNo") + "','%')";
							}
							//if (param.get("pledgeType") != null && param.get("pledgeType").equals("repayment")) {
							//	sql += " and li.loan_status = " + '"' + param.get("pledgeType") + '"';
							//}
							if (param.get("status") != null) {
								if (param.get("status").equals("overDueTodayOrder")) { // 今日逾期订单
									sql += " and TO_DAYS(date_format(rpd.repayDate,'%Y-%m-%d')) - TO_DAYS(date_format(now(),'%Y-%m-%d')) = 0";
								}
								if (param.get("status").equals("overDueSevenDayOrder")) { // 7日内逾期订单
									sql += " and TO_DAYS(date_format(rpd.repayDate,'%Y-%m-%d')) - TO_DAYS(date_format(now(),'%Y-%m-%d')) > 0 "
											+ " and TO_DAYS(date_format(rpd.repayDate,'%Y-%m-%d')) - TO_DAYS(date_format(now(),'%Y-%m-%d')) <= 7";
								}
							}

							if(param.get("customerName")!=null){
								sql+="AND ci.customer_name LIKE CONCAT('%',"+'"' + param.get("customerName").toString() + '"'+",'%')";
							}

					Map<String, Object> loanInfoMap = null;
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					Connection conn = null;
					ResultSet rs = null;
					conn = dbControl.getConnection();
					rs = dbControl.getData(conn, sql);
					try {
						while (rs.next()) {
							loanInfoMap = new HashMap<>();
							loanInfoMap.put("orderid", rs.getString(3));
							loanInfoMap.put("createBy", rs.getString(4)); // 客户经理
							loanInfoMap.put("principalName", rs.getString(5)); // 团队经理
							loanInfoMap.put("customerName", rs.getString(6)); // 客户姓名
							loanInfoMap.put("repayPeriod", rs.getString(7)); // 期数
							loanInfoMap.put("repayDate", sdf.format(rs.getDate(8))); // 应还时间
							BigDecimal repaymentSum = rs.getBigDecimal(9);
							loanInfoMap.put("repaymentSum", repaymentSum); // 应还金额
							loanInfoMap.put("loanStatus", rs.getString(12)); // 订单状态
							loanInfoMap.put("taskName", task.getName());
							loanInfoMap.put("state", rs.getString(14)); // 是否加急
							loanInfoMap.put("isImportant", rs.getString(15)); // 重点客户
							// 判断是否逾期
							Date now = sdf.parse(sdf.format(new Date()));
							Date repayDate = sdf.parse(sdf.format(rs.getDate(8)));
							if (now.getTime() > repayDate.getTime()||rs.getString(18).toString().equals("1")) {
								loanInfoMap.put("loanStatus", "yuqi"); // 逾期
							}
							mapList.add(loanInfoMap);
						}
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
								dbControl.close(conn,rs);
					}
					}
					}
				}
			}	
		return mapList;
	}
	/**
	 * 订单统计excel
	 */
	public List<Map<String, Object>> queryorderCountList (Map<String,Object> param){
		List<Map<String, Object>> mapList = new ArrayList<>();
		String sqlcontent = "SELECT li.loan_money,u1.realname AS managerName,cri.customer_name AS customerName,li.pledge_type,li.loan_status,"
				 +"li.repay_way,li.state,li.uuid,li.orderid,li.created_at,u2.realname AS teamLeader,flowassign.realname AS assigner,"
				 +"flowassign.NAME_ AS workflowName,cri.is_important FROM(((loan_info li INNER JOIN USER u1 ON li.responsible_cm_id = u1.uuid)"
				 +" INNER JOIN customer_register_info cri ON cri.uuid = li.customer_id) INNER JOIN USER u2 ON li.teamleader_id = u2.uuid)"
				 +" LEFT JOIN (SELECT are.BUSINESS_KEY_,u3.realname,are.ACT_ID_,art.NAME_ FROM((act_ru_execution are INNER JOIN act_ru_task art ON art.EXECUTION_ID_ = are.ID_)"
				 +" INNER JOIN loan_info li2 ON li2.uuid = are.BUSINESS_KEY_) LEFT JOIN USER u3 ON u3.uuid = art.ASSIGNEE_ GROUP BY are.BUSINESS_KEY_"
				 +" UNION SELECT rpm.loanId,u4.realname,are2.ACT_ID_,art2.NAME_ FROM((repayment rpm INNER JOIN act_ru_execution are2 ON are2.BUSINESS_KEY_ = rpm.uuid)"
				 +" INNER JOIN act_ru_task art2 ON art2.EXECUTION_ID_ = are2.ID_) LEFT JOIN USER u4 ON u4.uuid = art2.ASSIGNEE_) AS flowassign ON flowassign.BUSINESS_KEY_ = li.uuid";
		String sqlcondition = " WHERE 1 = 1";
				if(param.get("orderNo") != null){
					sqlcondition += " and li.orderid = " + '"' + param.get("orderNo") + '"';
				} 
				if(param.get("customerName") != null){
					sqlcondition += " and cri.customer_name like concat('%','" + param.get("customerName") + "','%')";
				} 
				if(param.get("searchDate") != null){
					sqlcondition += " and li.created_at = " + '"' + param.get("searchDate") + '"';
				} 
				if(param.get("CountStatus") != null ){	
					if(param.get("CountStatus").equals("count")){
						sqlcondition += "";
					}else if(param.get("CountStatus").equals("front")){
						sqlcondition += " and li.loan_status not in ('repayment','end','adLoanApplication',"
								+"'signContract_rejected','saleRepayment','vehicleNoSaleRepayment',"
								+"'departLeadAduit_rejected','trialPhase_rejected','badLoanApplication',"
								+"'judgment_rejected','mortgage_rejected')";
					}else if(param.get("CountStatus").equals("back")){
						sqlcondition += " and li.loan_status = 'repayment'";
					}else if(param.get("CountStatus").equals("end"))
						sqlcondition += " and li.loan_status in ('end','adLoanApplication',"
							+"'signContract_rejected','saleRepayment','vehicleNoSaleRepayment',"
							+"'departLeadAduit_rejected','trialPhase_rejected','badLoanApplication',"
							+"'judgment_rejected','mortgage_rejected')";
				}	
				Map<String, Object> loanInfoMap = null;
				String sql = sqlcontent + sqlcondition + " GROUP BY li.uuid ORDER BY li.applyed_at DESC";
				Connection conn = null;
				ResultSet rs = null;
				try {
					if(!StringUtils.isEmpty(sql)){
						conn =dbControl.getConnection();
						rs = dbControl.getData(conn, sql);	
					}
					while (rs.next()) {
						loanInfoMap = new HashMap<>();
						BigDecimal loan_Money = rs.getBigDecimal(1);
						loanInfoMap.put("loanMoney", loan_Money); // 贷款金额
						loanInfoMap.put("managerName", rs.getString(2)); // 客户经理
						loanInfoMap.put("customerName", rs.getString(3)); // 客户姓名
						loanInfoMap.put("pledgeType", rs.getString(4)); // 抵押方式
						//loanInfoMap.put("loanStatus", rs.getString(5)); // 订单状态
						loanInfoMap.put("repayway", rs.getString(6)); //还款方式
						loanInfoMap.put("orderid", rs.getString(9)); //订单号
						loanInfoMap.put("createdAt", rs.getDate(10)); // 生成时间
						loanInfoMap.put("teamLeader", rs.getString(11)); // 团队经理
						loanInfoMap.put("assigner", rs.getString(12)); // 任务签收人
						loanInfoMap.put("workflowName", rs.getString(13));//任务节点	
						mapList.add(loanInfoMap);
					}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
							dbControl.close(conn,rs);
				}		
		return mapList;
	}
	/**
	 * 贷后列表显示
	 *
	 * @return
	 */
	@Override
	public PageModel<VehicleLoanInfo> queryLoanInfoListForVehicleLoan(Map<String, Object> param, Integer currentPage) {
		PageModel<VehicleLoanInfo> pm = new PageModel<>();
		try {
			pm = vehicleLoanDao.getPage("com.utonw.utonerp.mapper.LoanInfoMapper.queryVehicleLoanList",
					param, currentPage);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pm;
	}
}
