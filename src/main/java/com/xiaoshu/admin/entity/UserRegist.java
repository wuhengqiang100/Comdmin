package com.xiaoshu.admin.entity;

import com.alibaba.fastjson.annotation.JSONField;
import com.baomidou.mybatisplus.annotation.FieldStrategy;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.xiaoshu.common.base.DataEntity;

import java.util.HashSet;
import java.util.Set;

@TableName("sys_user")
public class UserRegist extends DataEntity<UserRegist> {
    private static final long serialVersionUID = 1L;
    /**
     * 登录名
     */
    @TableField("id")
    private String id;

    @TableField("login_name")
    private String loginName;

    /**
     * 昵称
     */
    @TableField(value = "nick_name",strategy= FieldStrategy.IGNORED)
    private String nickName;

    /**
     * 密码
     */
    private String password;

    /**
     * shiro加密盐
     */
    private String salt;

    /**
     * 手机号码
     */
    @TableField(strategy= FieldStrategy.IGNORED)
    private String tel;

    /**
     * 邮箱地址
     */
    @TableField("email")
    private String email;

    @TableField("identity")
    private String identity;

    @TableField("request_place")
    private String requestPlace;

    @TableField("age")
    private String age;

  /*  @TableField("reputation")
    private String reputation;*/
    /**
     * 账户是否锁定
     */
    private Boolean locked;

    /**
     * 账户是否后台用户
     */
    @TableField(value = "is_admin")
    private Boolean adminUser;

    @TableField(strategy= FieldStrategy.IGNORED)
    private String icon;

    @Override
    public String getId() {
        return id;
    }

    @Override
    public void setId(String id) {
        this.id = id;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    @JSONField(serialize=false)
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @JSONField(serialize=false)
    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Boolean getLocked() {
        return locked;
    }

    public void setLocked(Boolean locked) {
        this.locked = locked;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }


    public Boolean getAdminUser() {
        return adminUser;
    }

    public void setAdminUser(Boolean adminUser) {
        this.adminUser = adminUser;
    }

    public String getIdentity() {
        return identity;
    }

    public void setIdentity(String identity) {
        this.identity = identity;
    }

    public String getRequestPlace() {
        return requestPlace;
    }

    public void setRequestPlace(String requestPlace) {
        this.requestPlace = requestPlace;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }
}
