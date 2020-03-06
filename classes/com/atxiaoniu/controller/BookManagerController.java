package com.atxiaoniu.controller;

import com.atxiaoniu.bean.Book;
import com.atxiaoniu.bean.Order;
import com.atxiaoniu.bean.User;
import com.atxiaoniu.dao.ManagerDao;
import com.atxiaoniu.service.ManagerService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
/*
* 在session中sum表示买了多少本书
* totalCount是一共买了多少钱的
* bill是书单，是map行的<Book,Integer>书名加书本数
* min,max是条件查询参数 min是最低钱数，max是最大钱数
* */
/*管理员权限*/
@RequestMapping("/managers")
@Controller
public class BookManagerController {
    @Autowired
    ManagerService managerService;
    /**
     * 获取所有的书籍,用kaptcha框架
     */
    @RequestMapping("/getAll")
    public String getAll(@RequestParam(value = "pageNum",defaultValue = "1")String pageNum, Map map){
        PageInfo<Book> bookInfo = managerService.getAllBook(pageNum);
        map.put("bookInfo",bookInfo);
        return "manager/book_manager";
    }

    @RequestMapping("/getOne")
    public String getOne(String id,ModelMap modelMap,
        @RequestParam(value = "pageNum",defaultValue = "1")String pageNum){
        Book book = managerService.getOneBook(id);
        modelMap.addAttribute("book",book);
        modelMap.addAttribute("pageNum",pageNum);
        return "forward:/pages/manager/book_edit.jsp";
    }

    /**
     * 前端两个页面
     * @param book
     * @param id
     * @return
     */
    @RequestMapping("/saveBook")
    public String saveBook(@Valid Book book, BindingResult bindingResult, String id,Map map,
          @RequestParam(value = "pageNum",defaultValue = "1")String pageNum){
        System.out.println("pageNUm"+pageNum);
        if(bindingResult.hasErrors()){
            map.put("errorMsg","您输入的形式有误：请不要将数据设置为空");
            return "menu/exception";
        }
        managerService.saveBook(book,id);
        return "redirect:/managers/getAll?pageNum="+pageNum;
    }


    @RequestMapping("/deleteOne")
    public String deleteOne(String id,@RequestParam(value = "pageNum",defaultValue = "1")String pageNum){
        managerService.deleteOneBook(id);
        return "redirect:/managers/getAll?pageNum="+pageNum;
    }

    @RequestMapping("/orderManager")
    public String orderManager(HttpServletRequest request){
        List<Order> allOrder = managerService.getAllOrder();
        request.setAttribute("orderlist",allOrder);
        return "manager/order_manager";
    }

    @RequestMapping("/send")
    public String send(String id){
        managerService.sendGoods(id);
        return "redirect:/managers/orderManager";
    }
/*手残，当时应该在UserViewManagerController中的*/
    @RequestMapping("/myOrder")
    public String myOrder(HttpServletRequest request,HttpSession session){
        User user = (User)session.getAttribute("user");
        List<Order> orders = managerService.selectOrders(user.getUsername());
        request.setAttribute("orderlist",orders);
        return "order/order";
    }
}
