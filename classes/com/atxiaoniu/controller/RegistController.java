package com.atxiaoniu.controller;

import com.atxiaoniu.bean.User;
import com.atxiaoniu.dao.RegistDao;
import com.atxiaoniu.service.RegistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;
import java.util.Map;
/*用户注册信息*/
@Controller
public class RegistController {
    @Autowired
    RegistService registService;

    @RequestMapping("/isRepeat")
    public  void isRepeat(String username,ModelMap modelMap){
        boolean b = registService.selectByName(username);
        if(b) modelMap.addAttribute("errorMsg","用户名重复");
    }

    /**
     * 验证码
     * @param session
     * @param user
     * @param code
     * @param map
     * @return
     */
    @RequestMapping("/regist")
    public String regist(HttpSession session, @Valid User user, BindingResult bindingResult, String code, Map map){
        System.out.println(bindingResult.hasErrors());
        /*防止JS检测被禁用*/
        if(bindingResult.hasErrors()){
            List<FieldError> fieldErrors = bindingResult.getFieldErrors();
            for (FieldError fieldError : fieldErrors){
                /*加1的目的是为了避免提示和原属性相同*/
                map.put(fieldError.getField()+"1",fieldError.getDefaultMessage());
            }
            return "user/regist";
        }
        String code1 = (String)session.getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
        if(code.equals(code1)){
            boolean a =registService.selectByName(user.getUsername());
            if(a){
                map.put("errorMsg","用户名重复");
                return "user/regist";
            }
            boolean b = registService.RegistByUser(user);
            if(b) return "redirect:/pages/user/login.jsp";
        }
        map.put("errorMsg","验证码错误");
        return "user/regist";
    }
}
