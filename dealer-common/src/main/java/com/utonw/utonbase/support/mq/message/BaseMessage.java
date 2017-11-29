package com.utonw.utonbase.support.mq.message;

import com.utonw.utonbase.support.mq.msgtype.MessageType;
import lombok.Data;

import java.io.Serializable;


/**
 * Created by WANGYJ on 2017/9/6.
 * 消息结构体定义
 */
@Data
public class BaseMessage implements Serializable {
    //用户定义应用ID，用于后续扩展
    private String appId;
    //消息类型
    private MessageType messageType;
    //消息Id用消息管理UUID，后续可以用户对消息的Ack应答
    private String messageId;
    //详细消息结构体
    private Object data;
}
