package com.xiaoshu.admin.entity;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.xiaoshu.common.base.DataEntity;

import java.util.Set;

@TableName("sys_role")
public class Role extends DataEntity<Role> {

    private static final long serialVersionUID = 1L;

    /**
     * 角色名称
     */
    @TableField("name")
    private String name;

    @TableField("identity")
    private String identity;

    @TableField("request_place")
    private String requestPlace;

    @TableField("age")
    private String age;

    @TableField("tel")
    private String tel;

    @TableField("email")
    private String email;

    @TableField(exist = false)
    private Set<Menu> menuSet;

    @TableField(exist = false)
    private Set<User> userSet;




    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Set<Menu> getMenuSet() {
        return menuSet;
    }

    public void setMenuSet(Set<Menu> menuSet) {
        this.menuSet = menuSet;
    }

    public Set<User> getUserSet() {
        return userSet;
    }

    public void setUserSet(Set<User> userSet) {
        this.userSet = userSet;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
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
}
