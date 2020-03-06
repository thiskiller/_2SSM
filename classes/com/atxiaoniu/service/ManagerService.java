package com.atxiaoniu.service;

import com.atxiaoniu.bean.Book;
import com.atxiaoniu.bean.Order;
import com.atxiaoniu.dao.ManagerDao;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class ManagerService {

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
        PageHelper.startPage(Integer.parseInt(pageNum),5);
        List<Book> all = managerDao.getAll();
        return new PageInfo<>(all,3);
    }

    public Book getOneBook(String id){
        int id1 = Integer.parseInt(id);
        return managerDao.getOneById(id1);
    }

    public boolean saveBook(Book book,String id){
        if(id!=null){
            return managerDao.saveBook(book);
        }
        else{
            return managerDao.insertBook(book);
        }
    }

    public boolean deleteOneBook(String id){
        int id1 = Integer.parseInt(id);
        return  managerDao.deleteBook(id1);
    }

    public List<Order> getAllOrder() {
        return managerDao.getAllOrders();
    }

    public boolean sendGoods(String id) {
        return  managerDao.changeCode(Integer.parseInt(id));
    }

    public List<Order> selectOrders(String username) {
        return managerDao.selectOrders(username);
    }
}
