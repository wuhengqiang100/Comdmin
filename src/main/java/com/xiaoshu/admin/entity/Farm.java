package com.xiaoshu.admin.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.xiaoshu.common.base.DataEntity;

import java.util.Date;

/**
 * 农田实体
 */
@TableName("t_farm")
public class Farm extends DataEntity<Farm>{
    private static final long serialVersionUID = 1L;
    /*@TableField("id")
    private Integer id;*/

    @TableField("name")
    private String name;

    @TableField("location")
    private String location;

    @TableField("size")
    private String size;

    @TableField("create_date")
    private Date createDate;

    @TableField("create_by")
    private String createId;

    @TableField("update_date")
    private Date updateDate;

    @TableField("update_by")
    private String updateId;

    @TableField("remarks")
    private String remarks;

    @TableField("del_flag")
    private Boolean delFlag;

    @TableField("userId")
    private String userId;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @TableField(exist=false)
    private User user;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
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
    public String getRemarks() {
        return remarks;
    }

    @Override
    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    @Override
    public Boolean getDelFlag() {
        return delFlag;
    }

    @Override
    public void setDelFlag(Boolean delFlag) {
        this.delFlag = delFlag;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
