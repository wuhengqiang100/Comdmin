package com.xiaoshu.admin.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.xiaoshu.common.base.DataEntity;

import java.util.Date;

@TableName("t_message")
public class Message extends DataEntity<Message> {

    private static final long serialVersionUID = 1L;
    @TableField("title")
    private String title;
    @TableField("content")
    private String content;
    @TableField("message_type")
    private String messageType;
    @TableField("to_user")
    private String toUser;
    @TableField("remarks")
    private String remarks;
    @TableField("create_date")
    private Date createDate;

    @TableField("create_by")
    private String createId;

    @TableField("create_name")
    private String createName;

    @TableField("update_date")
    private Date updateDate;

    @TableField("update_by")
    private String updateId;
    @TableField("del_flag")
    private Boolean delFlag;
    @TableField("is_look")
    private Boolean isLook;

    public Boolean getLook() {
        return isLook;
    }

    public void setLook(Boolean look) {
        isLook = look;
    }

    @TableField(exist=false)
    private User fromUser;

    public String getToUser() {
        return toUser;
    }



    public void setToUser(String toUser) {
        this.toUser = toUser;
    }

    public String getCreateName() {
        return createName;
    }

    public void setCreateName(String createName) {
        this.createName = createName;
    }

    @Override
    public String getRemarks() {
        return remarks;
    }

    @Override
    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public User getFromUser() {
        return fromUser;
    }

    public void setFromUser(User fromUser) {
        this.fromUser = fromUser;
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

    @Override
    public Date getCreateDate() {
        return createDate;
    }

    @Override
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    @Override
    public String getCreateId() {
        return createId;
    }

    @Override
    public void setCreateId(String createId) {
        this.createId = createId;
    }

    @Override
    public Date getUpdateDate() {
        return updateDate;
    }

    @Override
    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    @Override
    public String getUpdateId() {
        return updateId;
    }

    @Override
    public void setUpdateId(String updateId) {
        this.updateId = updateId;
    }

    @Override
    public Boolean getDelFlag() {
        return delFlag;
    }

    @Override
    public void setDelFlag(Boolean delFlag) {
        this.delFlag = delFlag;
    }
}
