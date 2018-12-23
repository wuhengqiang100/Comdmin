package com.xiaoshu.admin.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xiaoshu.admin.entity.Farm;
import com.xiaoshu.admin.entity.Message;
import com.xiaoshu.admin.entity.Role;
import com.xiaoshu.admin.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;
import java.util.Set;


public interface MessageMapper extends BaseMapper<Message> {

   /* User selectUserByUser(User user);

    User selectUserByMap(Map<String, Object> map);

    void saveUserRoles(@Param("userId") String id, @Param("roleIds") Set<Role> roles);

    void dropUserRolesByUserId(@Param("userId") String id);*/

     List<Message> selectMessageList(String toUser);

    int selectMessageListCount(String toUser);

    Message selectMessageById(@Param("id") String id);

    void saveMessageByUpdatePro(Message message);
}