package com.utonw.dealer.api.service;

        import java.util.List;
        import java.util.Map;

        import com.github.pagehelper.PageInfo;
        import com.utonw.dealer.api.dto.request.MerchantRequest;
        import com.utonw.dealer.api.entity.CompleteRequest;
        import com.utonw.dealer.api.entity.workflowtask;

/**
 * Created by WANGYJ on 2017/5/11.
 */
public interface IWorkFlowServiceCSD {
    int startTaskBy(int processKind,String uuid);
    List<workflowtask> queryTaskByUserId(String userId, String procKey);
    int signTaskById(String userId,String taskId);
    boolean complete(CompleteRequest request);
    workflowtask queryLastTask(String applyId);

    //特殊的结束工作流接口
    boolean completeEnd(CompleteRequest request);
    List<workflowtask> queryWorkflowtask(List<String> ids);
    List<workflowtask> queryByApplyIds(List<String> ids);
    PageInfo<workflowtask> queryTaskByTaskKey(MerchantRequest merchantRequest);

    Map<String,Integer> queryApplyCount(String name);
    List<workflowtask> queryApplyByApplyIds(List<String> ids);
    Map<String, Integer> queryRepaymentCount(String uuid, String name);
    List<workflowtask> queryByIdsAndKey(List<String> ids, String name);

    List<workflowtask> queryByTaskKeyAndProcKey(String taskdefkey, String prockey);
    Map<String,Integer> queryAllCount(List<String> nodeList);

    //今日新增任务
    Integer queryTaskByUuIdcount(String userId);
    //代办
    Integer queryTaskByUuIddaicount(String userId);

}
