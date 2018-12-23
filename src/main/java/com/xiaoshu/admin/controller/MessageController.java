package com.xiaoshu.admin.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.xiaoshu.admin.entity.Message;
import com.xiaoshu.admin.entity.User;
import com.xiaoshu.admin.service.MessageService;
import com.xiaoshu.admin.service.UserService;
import com.xiaoshu.common.annotation.SysLog;
import com.xiaoshu.common.base.PageData;
import com.xiaoshu.common.config.MySysUser;
import com.xiaoshu.common.util.ResponseEntity;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.WebUtils;

import javax.servlet.ServletRequest;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 消息管理controller层
 */
@Controller
@RequestMapping("admin/user/message")
public class MessageController {

    @Autowired
    MessageService messageService;

    @Autowired
    UserService userService;

    @GetMapping(value = "list")
    public String list(){
        return "admin/message/list";
    }

    @RequiresPermissions("user:message:list")
    @PostMapping("list")
    @SysLog("查看消息列表")
    @ResponseBody
    public PageData<Message> list(@RequestParam(value = "page",defaultValue = "1")Integer page,
                               @RequestParam(value = "limit",defaultValue = "10")Integer limit,
                               ServletRequest request){
        Map map = WebUtils.getParametersStartingWith(request, "s_");
        PageData<Message> messagePageData = new PageData<>();
        QueryWrapper<Message> messageWrapper = new QueryWrapper<>();
        //加条件
        messageWrapper.eq("del_flag",false);
        messageWrapper.eq("to_user",MySysUser.id());
        if(!map.isEmpty()){
            String keys = (String) map.get("key");
            if(StringUtils.isNotBlank(keys)) {
                messageWrapper.like("name", keys);
            }
        }
        IPage<Message> messagePage = messageService.page(new Page<>(page,limit),messageWrapper);
        messagePageData.setCount(messagePage.getTotal());
        messagePageData.setData(messagePage.getRecords());
        /*messagePageData.setData(setUserToMessage(messagePage.getRecords()));*/
        return messagePageData;
    }

    @GetMapping("add")
    public String add(ModelMap modelMap){
        List<User> userList=userService.findAllUser();
       List<Message> messsageList= messageService.selectAll();
        modelMap.put("userList",userList);
        modelMap.put("messsageList",messsageList);
        return "admin/message/add";
    }

    @RequiresPermissions("user:message:add")
    @PostMapping("add")
    @ResponseBody
    @SysLog("保存新增消息数据")
    public ResponseEntity add(@RequestBody Message message){
        User toUserEn=userService.findUserById(message.getToUser());
        if(null==toUserEn){
            return ResponseEntity.failure("该用户不存在,不能发送消息!");
        }
        message.setCreateId(MySysUser.id());
        message.setCreateDate(new Date());
        message.setUpdateDate(new Date());
        message.setUpdateId(MySysUser.id());
        message.setCreateName(toUserEn.getNickName());
        message.setToUser(toUserEn.getId());
        if(StringUtils.isBlank(message.getTitle())){
            return ResponseEntity.failure("消息标题不能为空");
        }
        if(StringUtils.isBlank(message.getMessageType())){
            return ResponseEntity.failure("消息类型不能为空");
        }
        if(StringUtils.isBlank(message.getToUser())){
            return ResponseEntity.failure("接收人不能为空");
        }
        messageService.saveMessage(message);
        return ResponseEntity.success("消息发送成功");
    }

    @RequiresPermissions("user:message:add")
    @GetMapping("read")
    @ResponseBody
    public ResponseEntity read(String id){
        Message message = messageService.getMessageById(id);
        message.setLook(true);
        message.setId(id);
        messageService.updateMessage(message);
        return ResponseEntity.success("消息已读");
    }

    @RequiresPermissions("user:message:add")
    @PostMapping("readSome")
    @ResponseBody
    public ResponseEntity readSome(@RequestBody List<Message> messages){
        for (Message message:messages){
            message.setLook(true);
            messageService.updateMessage(message);
        }

        return ResponseEntity.success("这些消息已读");
    }

    @GetMapping("edit")
    public String edit(String id,ModelMap modelMap){
        Message message = messageService.getMessageById(id);
        modelMap.put("message",message);
        return "admin/message/edit";
    }

    @RequiresPermissions("user:message:edit")
    @PostMapping("edit")
    @ResponseBody
    @SysLog("保存编辑消息数据")
    public ResponseEntity edit(@RequestBody Message message){
        if(StringUtils.isBlank(message.getId())){
            return ResponseEntity.failure("消息ID不能为空");
        }
        if(StringUtils.isBlank(message.getTitle())){
            return ResponseEntity.failure("消息标题不能为空");
        }
        if(StringUtils.isBlank(message.getMessageType())){
            return ResponseEntity.failure("消息类型不能为空");
        }
        if(StringUtils.isBlank(message.getToUser())){
            return ResponseEntity.failure("接收人不能为空");
        }
        Message oldMessage = messageService.getMessageById(message.getId());
     /*   if(!oldMessage.getName().equals(message.getName())){
            if(messageService.getMessageNameCount(message.getName())>0){
                return ResponseEntity.failure("消息名称已存在");
            }
        }*/
        messageService.updateMessage(message);
        return ResponseEntity.success("操作成功");
    }

    @RequiresPermissions("user:message:delete")
    @PostMapping("delete")
    @ResponseBody
    @SysLog("删除一条消息数据")
    public ResponseEntity delete(@RequestParam(value = "id",required = false)String id){
        if(StringUtils.isBlank(id)){
            return ResponseEntity.failure("消息ID不能为空");
        }
        Message message = messageService.getMessageById(id);
        message.setId(id);
        messageService.deleteMessage(message);
        return ResponseEntity.success("操作成功");
    }

    @RequiresPermissions("user:message:delete")
    @PostMapping("deleteSome")
    @ResponseBody
    @SysLog("多选删除多条消息数据")
    public ResponseEntity deleteSome(@RequestBody List<Message> messages){
        if(messages == null || messages.size()==0){
            return ResponseEntity.failure("请选择需要删除的消息");
        }
        for (Message r : messages){
            messageService.deleteMessage(r);
        }
        return ResponseEntity.success("操作成功");
    }
}
