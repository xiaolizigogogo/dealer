package com.utonw.utonbase.support.mq.msgtype;

/**
 * Created by WANGYJ on 2017/9/6.
 */
public enum MessageType {
    app("移动端推送消息"),
    sms("短信消息"),
    email("邮件信息"),
    pc("PC端消息"),
    ;
    String messagetype;

    MessageType(String message) {
        this.messagetype = messagetype;
    }

    public String messagetype() {
        // TODO Auto-generated method stub
        return messagetype;
    }
}
