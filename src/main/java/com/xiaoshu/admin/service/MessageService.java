package com.xiaoshu.admin.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.xiaoshu.admin.entity.Message;
import com.xiaoshu.admin.entity.Message;
import com.xiaoshu.admin.entity.Role;
import com.xiaoshu.admin.entity.User;

import java.util.List;
import java.util.Set;

public interface MessageService extends IService<Message> {

//    void saveMesage(Message message);

    long getMessageNameCount(String name);

    Message saveMessage(Message message);

    Message getMessageById(String id);

    void updateMessage(Message message);

    void deleteMessage(Message message);

    List<Message> selectAll();

    List<Message> selectMessageList(String toUser);

    List<Message> selectAllByToUser(String toUser);

    int selectMessageListCount(String toUser);
}
