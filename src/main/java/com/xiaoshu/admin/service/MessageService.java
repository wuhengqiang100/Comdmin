package com.xiaoshu.admin.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.xiaoshu.admin.entity.Message;
import com.xiaoshu.admin.entity.Role;
import com.xiaoshu.admin.entity.User;

import java.util.Set;

public interface MessageService extends IService<Message> {

    void saveMesage(Message message);

/*    User findUserByLoginName(String name);

    User findUserById(String id);

    int userCount(String loginName);

    void saveUserRoles(String id, Set<Role> roleLists);*/
/*
    void saveUser(User user);

    void updateUser(User user);

    void deleteUser(User user);

    void lockUser(User user);*/
}
