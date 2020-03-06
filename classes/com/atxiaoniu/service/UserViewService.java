package com.atxiaoniu.service;

import com.atxiaoniu.bean.Book;
import com.atxiaoniu.bean.Order;
import com.atxiaoniu.bean.User;
import com.atxiaoniu.dao.ManagerDao;
import com.atxiaoniu.dao.UserDao;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.*;
import java.sql.Date;

@Service
public class UserViewService {

    @Autowired
    UserDao userDao;
    @Autowired
    ManagerDao managerDao;

    public PageInfo<Book> getAllBook(String pageNum){
        char[] chars = pageNum.toCharArray();
        for (int i=0; i<chars.length;i++){
            if(!Character.isDigit(chars[i])){
                pageNum="1";
                break;
            }
        }
        PageHelper.startPage(Integer.parseInt(pageNum),4);
        List<Book> books = userDao.getAllBook();
        return new PageInfo<>(books,4);
    }

    public void getBook(String id, HttpSession session, HttpServletResponse response){
        int id1 = Integer.parseInt(id);
        Book book = managerDao.getOneById(id1);
        Map<Book,Integer> bill = (Map<Book,Integer>)session.getAttribute("bill");
        if(bill==null){//如果从没有买过
            bill = new HashMap<Book,Integer>();
            bill.put(book,1);
            session.setAttribute("totalCount",BigDecimal.valueOf(0.0));
        }
        else{//如果已经添加过这本书，那么将这本书的数目加一
            boolean flag = false;
            for(Book book1:bill.keySet()){
                if(book1.getId()==book.getId()){
                    bill.put(book1,bill.get(book1)+1);
                    flag = true;
                }
            }
            if(!flag){
                bill.put(book,1);
            }
        }
        session.setAttribute("bill",bill);
        BigDecimal totalCount = (BigDecimal)session.getAttribute("totalCount");
        session.setAttribute("totalCount",totalCount.add(BigDecimal.valueOf(book.getPrice())));
        session.setAttribute("book",book.getName());
        /*计算买多少本书*/
        int sum = 0;
        for(Book book2:bill.keySet()){
            sum+=bill.get(book2);
        }
        session.setAttribute("sum",sum);
    }

    public void add(HttpSession session){
        UUID uuid = UUID.randomUUID();
        String code = String.valueOf(uuid).replace("-","").toUpperCase();
        User user = (User)session.getAttribute("user");
        System.out.println(user+""+code);
//       /*将decimal类型转换为double类型*/
        Double totalCount = Double.parseDouble( String.valueOf(session.getAttribute("totalCount")));
//       /*增加书的销量，减少书的库存*/
        Map<Book,Integer> bill = (Map<Book,Integer>)session.getAttribute("bill");
        for(Book book: bill.keySet()){
            userDao.changeBook(book.getId(),bill.get(book));
        }
        Order order = new Order(null,user.getUsername(),code,0,new Date(System.currentTimeMillis()),totalCount);
        userDao.addOrder(order);
        session.setAttribute("checkCode",code);
        /*清空购物车*/
        session.removeAttribute("bill");
        session.removeAttribute("totalCount");
        session.removeAttribute("book");
        session.removeAttribute("sum");
    }
    public void deleteBook(String id, HttpSession session) {
        int id1 = Integer.parseInt(id);
        Book book = managerDao.getOneById(id1);
        Map<Book,Integer> newBill =(Map<Book,Integer>)session.getAttribute("bill");
        BigDecimal totalCount = (BigDecimal)(session.getAttribute("totalCount"));
        for(Book book1:newBill.keySet()){
            if(book1.getId()==book.getId()){
                session.setAttribute("totalCount",totalCount.subtract(BigDecimal.valueOf(book.getPrice()).multiply(BigDecimal.valueOf(newBill.get(book1)))));
                newBill.remove(book1);
                break;
            }
        }
        session.setAttribute("bill",newBill);
        int sum = 0;
        for(Book book2:newBill.keySet()){
            sum+=newBill.get(book2);
        }
        session.setAttribute("sum",sum);
        return ;
    }

    /**
     * 按照价格只能查询
     * @param minMoney
     * @param maxMoney
     * @param pageNum
     * @return
     */
    public PageInfo<Book> getAllBookByMoney(String minMoney, String maxMoney, String pageNum) {
        char[] chars = pageNum.toCharArray();
        for (int i=0; i<chars.length;i++){
            if(!Character.isDigit(chars[i])){
                pageNum="1";
                break;
            }
        }
        boolean flag = true;
        char[] chars1 = minMoney.toCharArray();
        for (int i=0; i<chars1.length;i++){
            if(!Character.isDigit(chars1[i])){
                flag = false;
                break;
            }
        }
        char[] chars2 = maxMoney.toCharArray();
        for (int i=0; i<chars2.length;i++){
            if(!Character.isDigit(chars2[i])){
                flag = false;
                break;
            }
        }
        if(!flag)userDao.getAllBook();
        int max = Integer.parseInt(maxMoney);
        int min = Integer.parseInt(minMoney);
        int page = Integer.parseInt(pageNum);
        PageHelper.startPage(page,4);
        List<Book> books = userDao.getAllBooks(min, max);
        return new PageInfo<Book>(books) ;
    }
}
