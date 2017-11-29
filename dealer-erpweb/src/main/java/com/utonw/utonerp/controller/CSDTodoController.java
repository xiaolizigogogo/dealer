package com.utonw.utonerp.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.utonw.dealer.api.entity.erp.User;
import com.utonw.dealer.api.service.IWorkFlowServiceCSD;
import com.utonw.dealer.api.util.erp.Constants;
import com.utonw.utonbase.core.erpcommon.utils.MsgUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by WANGYJ on 2017/5/16.
 */
@Controller
@RequestMapping("/csdtodo")
public class CSDTodoController {
    @Reference(version = "1.0.0")
    IWorkFlowServiceCSD workFlowServiceCSD;

    @RequestMapping(params = "method=claim", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> doClaim(String taskId, HttpSession session) {
        Map<String, Object> msg = new HashMap<String, Object>();

            User user = (User) session.getAttribute(Constants.AUTH_USER);
            //调用Service的任务签收方法
        int result = 0;
        result = workFlowServiceCSD.signTaskById(user.getUuid(),taskId);
        if (result == 1){
            msg = MsgUtils.getSuccessMsgMap("签收成功。。。");
            msg.put("assignee", user.getUuid());
        }else {
            msg = MsgUtils.getErrorMsgMap("签收失败。。。");
        }

        return msg;
    }
}
