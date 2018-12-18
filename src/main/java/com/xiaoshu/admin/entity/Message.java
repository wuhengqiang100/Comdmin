package com.xiaoshu.admin.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.xiaoshu.common.base.DataEntity;

import java.util.Date;

@TableName("t_message")
public class Message extends DataEntity<Message> {
    /**
     * 消息id
     */
    @TableField("fromU")
    private String fromU;
    @TableField("title")
    private String title;
    @TableField("content")
    private String content;
    @TableField("messageType")
    private String messageType;
    @TableField("toUser")
    private String toUser;
    @TableField("isLook")
    private String isLook;
    @TableField("sendTime")
    private Date sendTime;

    public String getIsLook() {
        return isLook;
    }

    public void setIsLook(String isLook) {
        this.isLook = isLook;
    }

    public Date getSendTime() {
        return sendTime;
    }

    public void setSendTime(Date sendTime) {
        this.sendTime = sendTime;
    }

    public String getFromU() {
        return fromU;
    }

    public void setFromU(String fromU) {
        this.fromU = fromU;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getMessageType() {
        return messageType;
    }

    public void setMessageType(String messageType) {
        this.messageType = messageType;
    }

    public String getToUser() {
        return toUser;
    }

    public void setToUser(String toUser) {
        this.toUser = toUser;
    }
}
