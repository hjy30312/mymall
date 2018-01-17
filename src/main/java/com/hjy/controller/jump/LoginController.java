package com.hjy.controller.jump;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author hjy
 * @create 2018/01/14
 **/
@Controller
public class LoginController {

    //返回登录界面
    @RequestMapping(value = "/to_login.do",method = RequestMethod.GET)
    public String toLogin() {
        return "login";
    }

    //返回注册界面
    @RequestMapping(value = "/to_register.do",method = RequestMethod.GET)
    public String toRegister() {
        return "register";
    }

    //返回找回密码界面
    @RequestMapping(value = "/to_forget_answer.do",method = RequestMethod.GET)
    public String toForgetAnswer() {
        return "forget_answer";
    }

    //返回前台界面
    @RequestMapping(value = "/to_portal_index.do",method = RequestMethod.GET)
    public String toPortalIndex() {
        return "portal_index";
    }


    //返回后台界面
    @RequestMapping(value = "/to_back_index.do",method = RequestMethod.GET)
    public String toBackEndIndex() {
        return "back_index";
    }


}
