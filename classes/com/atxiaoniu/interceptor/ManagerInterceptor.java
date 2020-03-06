package com.atxiaoniu.interceptor;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@Controller
public class ManagerInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        String referer = httpServletRequest.getHeader("referer");
        String requestURI = httpServletRequest.getRequestURI();
        System.out.println("------------------------------------------------------------------");
        System.out.println("地址"+referer+"发来"+requestURI+"请求");
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
        String referer = httpServletRequest.getHeader("referer");
        String requestURI = httpServletRequest.getRequestURI();
        System.out.println("地址"+referer+"请求"+requestURI+"处理结束，正在返回页面");
    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
        String referer = httpServletRequest.getHeader("referer");
        String requestURI = httpServletRequest.getRequestURI();
        System.out.println("地址"+referer+"请求"+requestURI+"结果已到达页面");
        System.out.println("------------------------------------------------------------------");
    }
}
