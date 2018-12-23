package com.xiaoshu.admin.controller;

import com.google.code.kaptcha.impl.DefaultKaptcha;
import com.xiaoshu.admin.entity.Message;
import com.xiaoshu.admin.entity.Role;
import com.xiaoshu.admin.entity.User;
import com.xiaoshu.admin.entity.UserRegist;
import com.xiaoshu.admin.entity.vo.ShowMenuVo;
import com.xiaoshu.admin.mapper.MessageMapper;
import com.xiaoshu.admin.mapper.UserMapper;
import com.xiaoshu.admin.service.MenuService;
import com.xiaoshu.admin.service.MessageService;
import com.xiaoshu.admin.service.RoleService;
import com.xiaoshu.admin.service.UserService;
import com.xiaoshu.common.annotation.SysLog;
import com.xiaoshu.common.config.MySysUser;
import com.xiaoshu.common.exception.UserTypeAccountException;
import com.xiaoshu.common.realm.AuthRealm;
import com.xiaoshu.common.util.Constants;
import com.xiaoshu.common.util.ResponseEntity;
import com.xiaoshu.common.util.RoleUtil;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import org.apache.shiro.subject.Subject;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.sql.Wrapper;
import java.time.LocalDate;
import java.util.*;

@Controller
public class LonginController {

    private final static Logger LOGGER = LoggerFactory.getLogger(LonginController.class);

    public final static String LOGIN_TYPE = "loginType";

    @Autowired
    @Qualifier("captchaProducer")
    DefaultKaptcha captchaProducer;

    @Autowired
    UserService userService;

    @Autowired
    MenuService menuService;

    @Autowired
    RoleService roleService;

    @Autowired
    UserMapper userMapper;

    @Autowired
    MessageMapper messageMapper;

    @Autowired
    MessageService messageService;

    public enum LoginTypeEnum {
        PAGE, ADMIN
    }

    @GetMapping(value = "")
    public String welcome() {
        return "redirect:admin";
    }

    @GetMapping(value = {"admin", "admin/index"})
    public String adminIndex(RedirectAttributes attributes, ModelMap map) {
        Subject s = SecurityUtils.getSubject();
        attributes.addFlashAttribute(LOGIN_TYPE, LoginTypeEnum.ADMIN);
        if (s.isAuthenticated()) {
            return "redirect:index";
        }
        return "redirect:toLogin";
    }

    @GetMapping(value = "forwordRegist")
    public String adminForwordRegist() {
        return "redirect:toRegist";
    }

    @PostMapping(value = "forwordRegist")
    public String ForwordRegist() {
        return "redirect:toRegist";
    }

    @PostMapping(value = "toRegist")
    public String adminToRegist() {
        return "admin/regist";
    }

    @GetMapping(value = "toRegist")
    public String ToRegist() {
        return "admin/regist";
    }


    @GetMapping(value = "toLogin")
    public String adminToLogin(HttpSession session, @ModelAttribute(LOGIN_TYPE) String loginType) {
        if (StringUtils.isBlank(loginType)) {
            LoginTypeEnum attribute = (LoginTypeEnum) session.getAttribute(LOGIN_TYPE);
            loginType = attribute == null ? loginType : attribute.name();
        }
        List<Role> roleList = roleService.selectAll();
        session.setAttribute("roleList",roleList);
        if (LoginTypeEnum.ADMIN.name().equals(loginType)) {
            session.setAttribute(LOGIN_TYPE, LoginTypeEnum.ADMIN);
            return "admin/login";
        } else {
            session.setAttribute(LOGIN_TYPE, LoginTypeEnum.PAGE);
            return "login";
        }
    }

    @GetMapping(value = "index")
    public String index(HttpSession session, @ModelAttribute(LOGIN_TYPE) String loginType,ModelMap modelMap) {

        if (StringUtils.isBlank(loginType)) {
            LoginTypeEnum attribute = (LoginTypeEnum) session.getAttribute(LOGIN_TYPE);
            loginType = attribute == null ? loginType : attribute.name();
        }
        if (LoginTypeEnum.ADMIN.name().equals(loginType)) {
            AuthRealm.ShiroUser principal = (AuthRealm.ShiroUser) SecurityUtils.getSubject().getPrincipal();
            List<Message> messageListTop= messageService.selectMessageList(MySysUser.id());
            int messageListCount=messageService.selectMessageListCount(MySysUser.id());
            modelMap.put("messageListTop",messageListTop);
            modelMap.put("messageListCount",messageListCount);
            session.setAttribute("icon", StringUtils.isBlank(principal.getIcon()) ? "/static/admin/img/face.jpg" : principal.getIcon());
            return "admin/index";
        } else {
            return "index";
        }

    }

    @GetMapping("/getCaptcha")
    public void getCaptcha(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //设置页面不缓存
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        String verifyCode = captchaProducer.createText();
        //将验证码放到HttpSession里面
        request.getSession().setAttribute(Constants.VALIDATE_CODE, verifyCode);
        LOGGER.info("本次生成的验证码为[" + verifyCode + "],已存放到HttpSession中");
        //设置输出的内容的类型为JPEG图像
        response.setContentType("image/jpeg");
        BufferedImage bufferedImage = captchaProducer.createImage(verifyCode);
        //写给浏览器
        ImageIO.write(bufferedImage, "JPEG", response.getOutputStream());
    }

    @PostMapping("admin/requestAll")
    @SysLog("根据选择获取所有请求,返回请求信息")
    @ResponseBody
    public ResponseEntity adminRequestAll(ModelMap modelMap) {
        ResponseEntity responseEntity = new ResponseEntity();

        List<Role> roleList = roleService.selectAll();
        if (null == roleList) {
            responseEntity.setSuccess(false);
            responseEntity.setMessage("没有任何请求!");
            return responseEntity;
        }
        List<String> idList=new ArrayList<>();
        List<String> nameList=new ArrayList<>();
        for (Role role:roleList){
            idList.add(role.getId());
            nameList.add(role.getName());
        }
        responseEntity.setSuccess(true);
        responseEntity.setMessage("获取所有的请求成功!");
        responseEntity.setAny("idList", idList);
        responseEntity.setAny("nameList", nameList);
        modelMap.put("idList", idList);
        modelMap.put("nameList", nameList);
        return responseEntity;
    }

    @PostMapping("admin/request")
    @SysLog("根据选择获取请求")
    @ResponseBody
    public ResponseEntity adminRequest(@RequestParam(value = "id", required = false) String id, ModelMap modelMap) {
        ResponseEntity responseEntity = new ResponseEntity();
        if (StringUtils.isBlank(id)) {
            return ResponseEntity.failure("角色ID不能为空");
        }
        Role role = roleService.getRoleById(id);
        if (null == role) {
            responseEntity.setSuccess(false);
            responseEntity.setMessage("没有这个请求!");
            return responseEntity;
        }
        responseEntity.setSuccess(true);
        responseEntity.setMessage("请求成功!");
        responseEntity.setAny("role", role);
        modelMap.put("role", role);
        return responseEntity;
    }

    @PostMapping(value = "admin/login")
    @SysLog("用户登录")
    @ResponseBody
    public ResponseEntity adminLogin(@ModelAttribute User loginUser, HttpServletRequest request,@RequestParam(value = "roleId",required = false)String roleId) {
        Role loginRole=roleService.getRoleById(roleId);
        String code = request.getParameter("code");
        String rememberMe = request.getParameter("rememberMe");

        if (null==roleId){
            return ResponseEntity.failure("请选择您的请求!");
        }
        if (!RoleUtil.contrastRoleAndProperties(loginRole,loginUser)){
            return ResponseEntity.failure("您输入的请求或属性不正确!");
        }

        if (StringUtils.isBlank(code)) {
            return ResponseEntity.failure("验证码不能为空");
        }
        HttpSession session = request.getSession();
        if (session == null) {
            return ResponseEntity.failure("session超时");
        }
        String trueCode = (String) session.getAttribute(Constants.VALIDATE_CODE);
        if (StringUtils.isBlank(trueCode)) {
            return ResponseEntity.failure("验证码超时");
        }
        if (StringUtils.isBlank(code) || !trueCode.toLowerCase().equals(code.toLowerCase())) {
            return ResponseEntity.failure("验证码错误");
        } else {
            /*当前用户*/
            String errorMsg = null;
            Subject user = SecurityUtils.getSubject();
            User secutityUser=null;
            try {
                secutityUser = userMapper.selectUserByUser(loginUser);
            } catch (Exception e) {
                return ResponseEntity.failure("没有用户拥有这个请求权限,请联系管理员!");
            }
           /* if (StringUtils.isBlank(secutityUser.getIdentity())){
                return ResponseEntity.failure("您输入的请求或属性不正确!");
            }*/
            if (null==secutityUser){
                return ResponseEntity.failure("属性值不正确!");
            }

            UsernamePasswordToken token = new UsernamePasswordToken(secutityUser.getLoginName(), "123456", Boolean.valueOf(rememberMe));
            try {
                user.login(token);
                session.setAttribute("secutityUser",secutityUser);
                LOGGER.debug(secutityUser.getLoginName() + "用户" + LocalDate.now().toString() + ":======》登陆系统!");
            } catch (IncorrectCredentialsException e) {
                errorMsg = "用户名密码错误!";
            } catch (UnknownAccountException e) {
                errorMsg = "账户不存在!";
            } catch (LockedAccountException e) {
                errorMsg = "账户已被锁定!";
            } catch (UserTypeAccountException e) {
                errorMsg = "账户不是管理用户!";
            }

            if (StringUtils.isBlank(errorMsg)) {
                ResponseEntity responseEntity = new ResponseEntity();
                responseEntity.setSuccess(Boolean.TRUE);
                responseEntity.setAny("url", "index");
                return responseEntity;
            } else {
                return ResponseEntity.failure(errorMsg);
            }
        }

    }



    @GetMapping("admin/login")
    @SysLog("用户登录")
    @ResponseBody
    public ResponseEntity adminSLogin(@RequestBody Map map, HttpServletRequest request) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String rememberMe = request.getParameter("rememberMe");
        String code = request.getParameter("code");
        if (StringUtils.isBlank(username) || StringUtils.isBlank(password)) {
            return ResponseEntity.failure("用户名或者密码不能为空");
        } else if (StringUtils.isBlank(code)) {
            return ResponseEntity.failure("验证码不能为空");
        }
        HttpSession session = request.getSession();
        if (session == null) {
            return ResponseEntity.failure("session超时");
        }
        String trueCode = (String) session.getAttribute(Constants.VALIDATE_CODE);
        if (StringUtils.isBlank(trueCode)) {
            return ResponseEntity.failure("验证码超时");
        }
        if (StringUtils.isBlank(code) || !trueCode.toLowerCase().equals(code.toLowerCase())) {
            return ResponseEntity.failure("验证码错误");
        } else {
            /*当前用户*/
            String errorMsg = null;
            Subject user = SecurityUtils.getSubject();
            UsernamePasswordToken token = new UsernamePasswordToken(username, password, Boolean.valueOf(rememberMe));
            try {
                user.login(token);
                LOGGER.debug(username + "用户" + LocalDate.now().toString() + ":======》登陆系统!");
            } catch (IncorrectCredentialsException e) {
                errorMsg = "用户名密码错误!";
            } catch (UnknownAccountException e) {
                errorMsg = "账户不存在!";
            } catch (LockedAccountException e) {
                errorMsg = "账户已被锁定!";
            } catch (UserTypeAccountException e) {
                errorMsg = "账户不是管理用户!";
            }

            if (StringUtils.isBlank(errorMsg)) {
                ResponseEntity responseEntity = new ResponseEntity();
                responseEntity.setSuccess(Boolean.TRUE);
                responseEntity.setAny("url", "tologin");
                return responseEntity;
            } else {
                return ResponseEntity.failure(errorMsg);
            }
        }
    }


    @PostMapping("admin/regist")
    @SysLog("用户注册,填写属性")
    @ResponseBody
    public ResponseEntity adminRegist(UserRegist user, HttpServletRequest request) {
        String nickName = request.getParameter("nickName");
        String tel = request.getParameter("tel");
        String email = request.getParameter("email");
        String identity = request.getParameter("identity");
        String requestPlace = request.getParameter("requestPlace");
        String age = request.getParameter("age");
        String code = request.getParameter("code");
        List<User> listUser=userMapper.findAllUser();
        for(User aUser:listUser){
            if (aUser.getLoginName().equals(nickName)){
                return ResponseEntity.failure("该用户名已用,请换一个");
            }
        }
        if (StringUtils.isBlank(nickName)) {
            return ResponseEntity.failure("昵称不能为空");
        } else if (StringUtils.isBlank(tel)) {
            return ResponseEntity.failure("手机号码不能为空");
        } else if (StringUtils.isBlank(email)) {
            return ResponseEntity.failure("邮箱不能为空");
        } else if (StringUtils.isBlank(identity)) {
            return ResponseEntity.failure("身份不能为空");
        } else if (StringUtils.isBlank(requestPlace)) {
            return ResponseEntity.failure("常用请求地址不能为空");
        } else if (StringUtils.isBlank(code)) {
            return ResponseEntity.failure("验证码不能为空");
        } else if (StringUtils.isBlank(age)) {
            return ResponseEntity.failure("年龄不能为空");
        }else if (Integer.parseInt(age)-18<0) {
            return ResponseEntity.failure("年龄必须在18--60岁之间");
        }else if (60-Integer.parseInt(age)<0) {
            return ResponseEntity.failure("年龄必须在18--60岁之间");
        }
        HttpSession session = request.getSession();
        if (session == null) {
            return ResponseEntity.failure("session超时");
        }
        String trueCode = (String) session.getAttribute(Constants.VALIDATE_CODE);
        if (StringUtils.isBlank(trueCode)) {
            return ResponseEntity.failure("验证码超时");
        }
        if (StringUtils.isBlank(code) || !trueCode.toLowerCase().equals(code.toLowerCase())) {
            return ResponseEntity.failure("验证码错误");
        } else {
            //保存用户操作
            ResponseEntity responseEntity = new ResponseEntity();
            user.setLoginName(nickName);
            user.setPassword(Constants.PASS_WORLD);
            user.setSalt(Constants.SALT);
            user.setAdminUser(true);
            user.setLocked(false);
            user.setId(session.getId());
            try {
//                userService.save(user);
                userMapper.insertUserRegist(user);
//                userService.save(user);
                if (StringUtils.isBlank(user.getId())) {
                    return ResponseEntity.failure("保存用户信息出错");
                }
                responseEntity.setSuccess(true);
                responseEntity.setMessage("注册成功,待管理员审核信息!");
                responseEntity.setAny("url", "toLogin");
                return responseEntity;
            } catch (Exception e) {
                responseEntity.setSuccess(false);
                responseEntity.setMessage("注册失败,请重试!");
                return responseEntity;
            }

        }

    }


    @GetMapping("admin/main")
    public String main( ModelMap modelMap) {
        String userId = MySysUser.id();
        List<Message>  messageList=messageService.selectAllByToUser(userId);
        User currentUser=userService.findUserById(userId);
//        session.setAttribute("messageList",messageList);
        modelMap.put("messageList",messageList);
        modelMap.put("currentUser",currentUser);
        return "admin/main";
    }

    /***
     * 获得用户所拥有的菜单列表
     * @return
     */
    @GetMapping("/admin/user/getUserMenu")
    @ResponseBody
    public List<ShowMenuVo> getUserMenu() {
        String userId = MySysUser.id();
        List<ShowMenuVo> list = menuService.getShowMenuByUser(userId);
        return list;
    }

    @GetMapping("systemLogout")
    @SysLog("退出系统")
    public String logOut() {
        SecurityUtils.getSubject().logout();
        return "redirect:admin";
    }

}
