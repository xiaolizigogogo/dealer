package com.utonw.dealer.api.service.erp;

import com.utonw.dealer.api.dto.request.erp.AttachmentInfoRequest;
import com.utonw.dealer.api.dto.request.erp.LoanOperateResult;
import com.utonw.dealer.api.dto.request.erp.TaskAttachmentLinkRequest;
import com.utonw.dealer.api.entity.AttachmentInfo;
import com.utonw.dealer.api.entity.AttachmentParentInfo;
import com.utonw.dealer.api.entity.TaskName;
import com.utonw.dealer.api.entity.erp.LoanInfoAttachment;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


/**
 * 
 * @author jml
 *
 *
 */
public interface AttachmentService {
	/**
	 * 根据taskname查询附件名
	 * @param taskName
	 * @return
	 */
	public List<AttachmentInfo> queryByTaskName(String taskName);
	/**
	 * 查询所有附件
	 * @return
	 */
	public List<AttachmentInfo> queryAll();
	/**
	 * 获取附件存储名称
	 * @param attachmentType
	 * @param fileSuffix
	 * @param type
	 * @return
	 */
	public String getAttachmentFileName(String attachmentType, String fileSuffix, String type);
	/**
	 * 根据code查找附件详情
	 * @param attachmentCode
	 * @return
	 */
	public AttachmentInfo queryByAttachmentCode(String attachmentCode);
	/**
	 * 查询当前节点需要上传的附件
	 * @param loanId
	 * @return
	 */
	public List<AttachmentInfo> queryNeedAttachmentByLoanId(String loanId);
	/**
	 * 根据loanId查询节点状态
	 * @param loanId
	 * @return
	 */
	public String queryTaskName(String loanId);
	/**
	 * 
	 * @param request
	 * @param attachmentInfos
	 */
	public void commonImageHandle(HttpServletRequest request, List<AttachmentInfo> attachmentInfos);
	/**
	 * 
	 * @param path
	 * @return
	 */
	public LoanInfoAttachment getCacheElement(String path);
	/**
	 * 
	 * @return
	 */
	public Map<String, AttachmentInfo> queryCachedMap();
	/**
	 * 根据条件查询附件
	 * @param request
	 * @return
	 */
	public List<AttachmentInfo> queryAttachmentInfoByCondition(AttachmentInfoRequest request);
	
	/**
	 * 修改附件属性
	 */
	public LoanOperateResult modifyAttachmentInfoById(AttachmentInfoRequest request);
	
	/**
	 * 查询所有任务
	 */
	public List<TaskName> queryAllTaskName();
	
	/**
	 * 修改任务节点下的附件种类
	 */
	public LoanOperateResult modifyTaskAttachmentLink(TaskAttachmentLinkRequest request);
	/**
	 * 查询所有父类型
	 * @return
	 */
	public List<AttachmentParentInfo> queryAllParents();
	/**
	 * 根据附件Id查询
	 */
	public AttachmentInfo queryAttachmentInfoById(Integer id);
	/**
	 * 附件信息修改
	 */
	public List<AttachmentInfo> queryOtherType();
	
	public Map<String,AttachmentInfo> queryOtherTypeMap();
	/**
	 * 取得附件
	 * @param loanId
	 * @return
	 */
	List<LoanInfoAttachment> getLoanInfoAttachmentByLoanId(String loanId);
	/**
	 * 根据定loanId及条件取得附件信息
	 * @param loanId
	 * @param attachmentType
	 * @return
	 */
	List<LoanInfoAttachment> getLoanInfoAttachmentByLoanIdAndCondition(String loanId, String attachmentType);
}
