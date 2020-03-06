package com.atxiaoniu.controller;

import com.atxiaoniu.bean.User;
import com.atxiaoniu.dao.LoginDao;
import com.atxiaoniu.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.Map;
/*用户登录控制*/
@Controller
public class LoginController {
    @Autowired
    LoginService loginService;
    @RequestMapping("/login")
    public String login(User user, Map map, HttpSession session){
        boolean exist = loginService.isExistUserName(user);
        if(!exist){
            map.put("errorMsg","用户名不存在");
            return "user/login";
        }
        boolean b = loginService.selectUser(user);
        if(!b){
            map.put("errorMsg","密码错误");
            return "user/login";
        }
        session.setAttribute("user",user);
        return "redirect:/pages/user/login_success.jsp";
    }

    /**
     * 退出登录
     * @param session
     * @return
     */
    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/pages/user/login.jsp";
    }
}
