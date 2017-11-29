package com.utonw.dealer.api.service.erp;

import com.utonw.dealer.api.entity.erp.HisTodoPageProcessIn;
import com.utonw.dealer.api.entity.erp.LoanInfoForRepayment;
import com.utonw.dealer.api.entity.erp.TodoInsEntity;
import com.utonw.dealer.api.entity.erp.VehicleLoanInfo;
import com.utonw.dealer.api.enums.erp.WorkFlowType;
import com.utonw.dealer.api.util.erp.PageModel;
import com.utonw.dealer.api.util.erp.PageModelUtil;
import com.utonw.dealer.api.vo.HisTodoPage;
import com.utonw.dealer.api.vo.TodoPage;
import com.utonw.dealer.api.vo.TodoVO;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.impl.persistence.entity.ExecutionEntity;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;

import java.io.InputStream;
import java.util.List;
import java.util.Map;


public interface WorkFlowService {

	/**
	 * 启动流程
	 *
	 * @param userId 用户ID
	 * @param businessKey 流程定义key
	 * @param map 流程变量
	 * @return 流程实例 ProcessInstance
	 */
	public ProcessInstance startProcess(String userId,
										WorkFlowType workFlowType, String businessKey,
										Map<String, Object> map);

	/**
	 * 根据工作流类型和用户编码查询被签收的任务
	 *
	 * @param workFlowType
	 * @param userId
	 * @param page
	 * @param limit
	 * @return
	 */
	public PageModelUtil<Task> findSignTaskListByUserIdAndWorkFlowType(
			WorkFlowType workFlowType, String userId, int page, int limit);

	/**
	 * 根据工作流类型和用户编码查询被签收的任务
	 *
	 * @param workFlowType
	 * @param userId
	 * @param page
	 * @param limit
	 * @return
	 */
	public PageModelUtil<Task> findNoSignTaskListByUserIdAndWorkFlowType(
			WorkFlowType workFlowType, String userId, int page, int limit);

	/**
	 * 签收任务
	 *
	 * @param taskId
	 * @param userId
	 */
	public void claim(String taskId, String userId);

	/**
	 * 完成任务
	 *
	 * @param taskId
	 * @param map
	 */
	public void complete(String taskId, Map<String, Object> map);

	/**
	 * 查询历史任务
	 *
	 * @param workFlowType
	 * @param page
	 * @param limit
	 */
	public PageModelUtil<HistoricProcessInstance> findFinshedTasks(
			WorkFlowType workFlowType, int page, int limit);

	/**
	 * 根据taskId 获取businessKey
	 *
	 * @param taskId
	 * @return
	 */
	public String queryBusinessKeyByTaskId(String taskId);

	/**
	 * 获得流程实例
	 *
	 * @param processInstanceId
	 * @return
	 */
	public ProcessInstance getProcessInstance(String processInstanceId);

	/**
	 * 获得流程的定义信息
	 *
	 * @param processDefinitionId
	 * @return
	 */
	public ProcessDefinition getProcessDefinition(String processDefinitionId);

	/**
	 * 获取作业信息根据taskId
	 *
	 * @param taskId
	 * @return
	 */
	public Task queryTaskByTaskId(String taskId);

	/**
	 * 获取流程资源信息 resourceType 取值 xml,image
	 *
	 * @param processDefinitionId
	 * @param resourceType
	 * @return
	 */
	public InputStream loadImageByDeployment(String processDefinitionId,
											 String resourceType);

	/**
	 * 自动完成任务
	 *
	 * @param processinsId
	 *            流程Id
	 * @param userId
	 *            用户id
	 * @param map
	 *            参数map
	 */
	public void autoComplete(String processinsId, String userId, Map map);

	/**
	 * 查询任务列表
	 *
	 * @param userId
	 * @param currentPage
	 * @param pagecount
	 * @param keys
	 * @return
	 */
	public TodoPage querytodoList(String userId, Integer currentPage,
								  Integer pagecount, WorkFlowType[] keys);


	/**
	 *  得到任务总数
	 * @param userId
	 * @return
	 */
	public Integer querytodoListAll(String userId);

	/**
	 * 得到任务处理节点
	 *
	 * @param task
	 * @return
	 */
	public ExecutionEntity getExecution(Task task);

	/**
	 * 取得todoIns
	 */
	public TodoInsEntity getTodoIns(Task task);

	/**
	 * 查询历史任务列表
	 * @param userId
	 * @param currentPage
	 * @param pagecount
	 * @return
	 */
	public HisTodoPage queryHistodoList(String userId, Integer currentPage,
										Integer pagecount);


	/**
	 * 根据流程实例id查询当前流程信息
	 * @param processInsIds
	 * @param currentPage
	 * @param pagecount
	 * @return
	 */
	public HisTodoPageProcessIn queryHisTodoPageProcessInList(List<String> processInsIds, Integer currentPage,
															  Integer pagecount);




	/**
	 * 查询任务列表app端
	 *
	 * @param userId
	 * @param currentPage
	 * @param pagecount
	 * @param keys
	 * @return
	 */
	public PageModel<TodoVO> querytodoListApi(String userId, Integer currentPage,
											  Integer pagecount, WorkFlowType[] keys);

	int getqueryLoanInfoCount1(String userId, WorkFlowType[] keys);

	int getqueryLoanInfoCount2(String userId);

	/**
	 * 贷前任务列表
	 * @return
	 */
	public TodoPage queryVehiclesLoansList(String userId, Integer currentPage,
										   Integer pagecount, WorkFlowType[] keys,Map<String,Object> param);


	Map<String,Object>  queryLoanInfoCount(WorkFlowType[] keys, String userId, Map<String,Object> param);

	Map<String,Object>  queryLoanInfoCountAfter(WorkFlowType[] keys, String userId, Map<String,Object> param);

	/**
	 * 贷后任务列表
	 * @param userId
	 * @param currentPage
	 * @param pagecount
	 * @param keys
	 * @param param
	 * @return
	 */
	public TodoPage queryPaymentCollectionLoansList(String userId, Integer currentPage,
													Integer pagecount, WorkFlowType[] keys,Map<String,Object> param);


	/**
	 * 全部贷款订单列表
	 * @return
	 */
	public TodoPage queryVehiclesLoansWholeList(String userId, Integer currentPage, Integer pagecount, WorkFlowType[] keys,
												Map<String, Object> param);
	/**
	 * 状态订单列表
	 * @return
	 */
	public TodoPage queryStateList(String userId, Integer currentPage, Integer pagecount, WorkFlowType[] keys,
								   Map<String, Object> param);

	/**
	 * 按状态统计订单
	 * @return
	 */
	public Map<String, Object> queryLoanInfosStatecount(WorkFlowType[] keys, String userId);
	/**
	 * 历史订单
	 * @return
	 */
	public TodoPage queryAllHistory(String uuid,int page,int count, Map<String, Object> param);
	/**
	 * 发送修改密码邮件
	 * @param url
	 * @return
	 */
	public boolean simpleSend(String url,String domainName);
	/**
	 * 修改密码
	 * @return
	 */
	public String updatepassword(String uuid, String password);
	/**
	 * 合同未签订列表
	 * @return
	 */
	TodoPage getcontractlist(String userId, Integer currentPage, Integer pagecount, WorkFlowType[] keys,
							 Map<String, Object> param);

	/**
	 * 合同已签订列表
	 * @return
	 */

	TodoPage getsigncontract(String userId, Integer currentPage, Integer pagecount, WorkFlowType[] keys,
							 Map<String, Object> param);
	/**
	 * 合同未签订列表
	 * @return
	 */

	TodoPage getnosigncontract(String userId, Integer currentPage, Integer pagecount, WorkFlowType[] keys,
							   Map<String, Object> param);

	/**
	 * 今日新增任务列表
	 * @param data
	 * @return
	 */
	TodoPage queryNewTaskList(String userId,Integer currentPage, Integer pagecount,WorkFlowType[] keys, String time,Map param);

	/**
	 * 今日新增任务列表优化
	 * @return
	 */
	Integer queryNewTaskListNew(String userId, Map param);

	/**
	 * 代办任务列表
	 * @param data
	 * @return
	 */

	TodoPage queryagencyList(String userId, Integer currentPage, Integer pagecount,WorkFlowType[] keys,Map param);

	/**
	 * 代办任务列表优化
	 */
	Integer queryAgencyListNew(String userId,WorkFlowType[] keys,Map param);

	/**
	 * 放款列表
	 * @return
	 */
	public TodoPage queryLendedLoansList(String userId, Integer currentPage,
										 Integer pagecount, WorkFlowType[] keys,Map<String,Object> param);

	/**
	 * 车贷收入管理列表
	 * @param userId
	 * @param currentPage
	 * @param pagecount
	 * @param keys
	 * @param param
	 * @return
	 */
	public TodoPage queryIncomeList(String userId, Integer currentPage,
									Integer pagecount, WorkFlowType[] keys,Map<String,Object> param);

	/**
	 * 客户所属行业统计
	 *
	 * @return
	 */
	public List<Object> querycountList(Map<String, Object> param);
	/**
	 * 客户年龄统计
	 *
	 * @return
	 */

	public List<Object> queryagecountList(Map<String, Object> param);
	/**
	 * 贷款方式统计
	 *
	 * @return
	 */
	public List<Object> queryloanModecountList(Map<String, Object> param);

	/**
	 * 新增用户统计
	 *
	 * @return
	 */
	public List<Object> querycustomercountList(Map<String, Object> param);
	/**
	 * 逾期统计
	 *
	 * @return
	 */
	public  List<Object> queryoverdueCountlist();
	/**
	 * 放款金额统计
	 *
	 * @return
	 */
	public List<Object> queryoutofAccountCountlist();

	TodoPage selectLoanList( Integer currentPage, Integer pagecount , Map<String, Object> param);

	TodoPage selectoverdueList(Integer currentPage, Integer pagecount, Map<String, Object> param);

	/**
	 * 获取登录昵称
	 * @return
	 */
	public String selectName(String uuid);

	/**
	 * 获取登录昵称
	 * @return
	 */

	public String selectImagePath(String id);
	/**
	 * 获取职务
	 * @return
	 */

	public Map<String, Object> selectposition(String uuid);
	/**
	 * 订单状态统计
	 * @return
	 */
	Map<String, Object> selectStateCount(Map<String, Object> param);
	/**
	 * 删除指定订单
	 * @return
	 */
	String deleteLoanById(String uuid);


	/**
	 * 获取贷款余额统计
	 * @return
	 */
	public TodoPage queryLoanBalanceCount(Integer currentPage, Integer pagecount , Map<String,Object> param);


	/**
	 * 获取累收累放统计
	 * @return
	 */
	public TodoPage queryLoanReceiptCount(Integer currentPage, Integer pagecount , Map<String,Object> param);

	/**
	 * 获取累收统计
	 * @return
	 */
	public TodoPage queryLoanIncomeCount(Integer currentPage, Integer pagecount , Map<String,Object> param);


	/**
	 * 获取累收累放统计
	 * @return
	 */
	public TodoPage queryIncomeCount(Integer currentPage, Integer pagecount , Map<String,Object> param);

	/**
	 * 查询指定
	 * @return
	 */
	public TodoPage queryTaskByActivitiName(String userId, Integer currentPage,
											Integer pagecount, WorkFlowType[] keys, String activityName, Map<String,Object> param);
	/**
	 * 货前待办excel
	 */
	public List<Map<String, Object>> queryloanInfoListCYB (String userId, WorkFlowType[] keys, Map<String,Object> param);

	/**
	 * 货后待办excel
	 */
	public List<Map<String, Object>> queryloanAfterList (String userId, WorkFlowType[] keys, Map<String,Object> param);

	/**
	 * 订单统计excel
	 */
	public List<Map<String, Object>> queryorderCountList (Map<String,Object> param);
	/**
	 * 贷后订单列表
	 */
	PageModel<LoanInfoForRepayment> queryLoanInfoListForRepayment(Map<String, Object> param,Integer currentPage);
	/**
	 * 贷前订单列表
	 */
	PageModel<VehicleLoanInfo> queryLoanInfoListForVehicleLoan(Map<String, Object> param, Integer currentPage);
	/**
	 * 工作平台任务列表
	 */
	PageModel<VehicleLoanInfo> queryWorkSpaceTaskList(Map<String,Object>param, Integer currentPage);
	List<String> getExecutionByPronidAndKey(WorkFlowType workFlowType);
}
