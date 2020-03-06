package com.atxiaoniu.controller;

import com.atxiaoniu.bean.Book;
import com.atxiaoniu.bean.Order;
import com.atxiaoniu.bean.User;
import com.atxiaoniu.dao.UserDao;
import com.atxiaoniu.service.UserViewService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;
/*普通用户权限*/
@Controller
public class UserViewManagerController {
    @Autowired
    UserViewService userViewService;

    /**
     * 获取所有图书
     * @param pageNum
     * @param modelMap
     * @return
     */
    @RequestMapping("/getAllBook")
    public String getAllBook(@RequestParam(value = "pageNum",defaultValue = "1") String pageNum, ModelMap modelMap){
         PageInfo<Book> bookInfo = userViewService.getAllBook(pageNum);
         modelMap.addAttribute("bookInfo",bookInfo);
         return "forward:/pages/menu/menu.jsp";
    }

    /**
     * 将物品添加到购物车中
     * @param id
     * @param session
     * @param response
     */
    @RequestMapping("/addToCar")
    public void addToCar(String id, HttpSession session, HttpServletResponse response){
        userViewService.getBook(id,session,response);
    }

    /**
     * 清空购物车
     * @param session
     * @return
     */
    @RequestMapping("/clearCart")
    public String clearCart(HttpSession session){
       session.removeAttribute("bill");
       session.removeAttribute("totalCount");
       session.removeAttribute("book");
       session.removeAttribute("sum");
       return "cart/cart";
    }

    /**
     * 删除购物车中的货物
     * @param id
     * @param session
     * @return
     */
    @RequestMapping("/deleteCartItem")
    public String deleteItem(String id,HttpSession session){
        userViewService.deleteBook(id,session);
        return "cart/cart";
    }

    /**
     * 处理结账生成账单号
     * @param session
     * @return
     */
    @Transactional
    @RequestMapping("/checkout")
    public String checkout(HttpSession session,Map map){

        try {
            userViewService.add(session);
        } catch (Exception e) {
            map.put("errorMsg","出现意外状况，可能是商品库存不足、网络出现错误等原因");
           return "menu/exception";
        }
        return "cart/checkout";
    }
    @RequestMapping("/getAllBookByMoney")
    public String getAllBookByMoney(String min,String max, HttpSession session,
        @RequestParam(value = "pageNum",defaultValue = "1") String pageNum,ModelMap map){
        //如果运用了money区间搜索
        //那么在接下来的所有操作都是建立在Money区间的数据基础上的。
        //直至用户将区间搜索的钱数清空，才会显示所有数据
        if (min==null&&max==null){
            min=(String)session.getAttribute("min");
            max=(String)session.getAttribute("max");
        }
        session.setAttribute("min",min);
        session.setAttribute("max",max);
        if(min==null || max ==null ||min.equals("")||max.equals("")) return "redirect:/getAllBook?pageNum="+pageNum;
        PageInfo<Book> bookInfo = userViewService.getAllBookByMoney(min, max, pageNum);
        map.put("bookInfo",bookInfo);
        return "menu/menu";
    }
}
